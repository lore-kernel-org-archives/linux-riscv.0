From: alankao@andestech.com (Alan Kao)
Date: Wed, 8 Aug 2018 11:24:42 +0800
Subject: [PATCH v4 2/5] Refactor FPU code in signal setup/return procedures
In-Reply-To: <1533698685-18022-1-git-send-email-alankao@andestech.com>
References: <1533698685-18022-1-git-send-email-alankao@andestech.com>
Message-ID: <1533698685-18022-3-git-send-email-alankao@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

FPU-related logic is separated from normal signal handling path in
this patch.  Kernel can easily be configured to exclude those procedures
for no-FPU systems.

Signed-off-by: Alan Kao <alankao@andestech.com>
Cc: Greentime Hu <greentime@andestech.com>
Cc: Vincent Chen <vincentc@andestech.com>
Cc: Zong Li <zong@andestech.com>
Cc: Nick Hu <nickhu@andestech.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/signal.c | 68 +++++++++++++++++++++++---------------
 1 file changed, 41 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 718d0c984ef0..6a18b9819ead 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -37,45 +37,63 @@ struct rt_sigframe {
 	struct ucontext uc;
 };
 
-static long restore_d_state(struct pt_regs *regs,
-	struct __riscv_d_ext_state __user *state)
+static long restore_fp_state(struct pt_regs *regs,
+			     union __riscv_fp_state *sc_fpregs)
 {
 	long err;
+	struct __riscv_d_ext_state __user *state = &sc_fpregs->d;
+	size_t i;
+
 	err = __copy_from_user(&current->thread.fstate, state, sizeof(*state));
-	if (likely(!err))
-		fstate_restore(current, regs);
+	if (unlikely(err))
+		return err;
+
+	fstate_restore(current, regs);
+
+	/* We support no other extension state at this time. */
+	for (i = 0; i < ARRAY_SIZE(sc_fpregs->q.reserved); i++) {
+		u32 value;
+
+		err = __get_user(value, &sc_fpregs->q.reserved[i]);
+		if (unlikely(err))
+			break;
+		if (value != 0)
+			return -EINVAL;
+	}
+
 	return err;
 }
 
-static long save_d_state(struct pt_regs *regs,
-	struct __riscv_d_ext_state __user *state)
+static long save_fp_state(struct pt_regs *regs,
+			  union __riscv_fp_state *sc_fpregs)
 {
+	long err;
+	struct __riscv_d_ext_state __user *state = &sc_fpregs->d;
+	size_t i;
+
 	fstate_save(current, regs);
-	return __copy_to_user(state, &current->thread.fstate, sizeof(*state));
+	err = __copy_to_user(state, &current->thread.fstate, sizeof(*state));
+	if (unlikely(err))
+		return err;
+
+	/* We support no other extension state at this time. */
+	for (i = 0; i < ARRAY_SIZE(sc_fpregs->q.reserved); i++) {
+		err = __put_user(0, &sc_fpregs->q.reserved[i]);
+		if (unlikely(err))
+			break;
+	}
+
+	return err;
 }
 
 static long restore_sigcontext(struct pt_regs *regs,
 	struct sigcontext __user *sc)
 {
 	long err;
-	size_t i;
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
-	if (unlikely(err))
-		return err;
 	/* Restore the floating-point state. */
-	err = restore_d_state(regs, &sc->sc_fpregs.d);
-	if (unlikely(err))
-		return err;
-	/* We support no other extension state at this time. */
-	for (i = 0; i < ARRAY_SIZE(sc->sc_fpregs.q.reserved); i++) {
-		u32 value;
-		err = __get_user(value, &sc->sc_fpregs.q.reserved[i]);
-		if (unlikely(err))
-			break;
-		if (value != 0)
-			return -EINVAL;
-	}
+	err |= restore_fp_state(regs, &sc->sc_fpregs);
 	return err;
 }
 
@@ -124,14 +142,10 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
 {
 	struct sigcontext __user *sc = &frame->uc.uc_mcontext;
 	long err;
-	size_t i;
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
 	/* Save the floating-point state. */
-	err |= save_d_state(regs, &sc->sc_fpregs.d);
-	/* We support no other extension state at this time. */
-	for (i = 0; i < ARRAY_SIZE(sc->sc_fpregs.q.reserved); i++)
-		err |= __put_user(0, &sc->sc_fpregs.q.reserved[i]);
+	err |= save_fp_state(regs, &sc->sc_fpregs);
 	return err;
 }
 
-- 
2.18.0
