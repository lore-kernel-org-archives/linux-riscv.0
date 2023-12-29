Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E708C4706F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 14:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HmZ1Hr9ExoLYpRD3aCZ7gF0PITy8IJnVXm49xkG1OYg=; b=KtBwEXkzD3lQ1d
	m8EJXlZPTXObmvUzBvQNbi1TgrqrefJwJ/efshbAT2eUdJ1taZYB1JB8dnruBcjib/3l3cp6NWwZ9
	855ZAC00KwjZimr9gg61thUnXR4qoqHSOSmE6198fapp74Wr/H5a82H4rSwsnIQkeKXG8hw8VUqzo
	hKkcnJelPGxY0ylm5pJv9WPifu6GpC63SlVGrZ18n21Ymuv4CfJCUm2RAGZ1ngGRNlMpfexUFkRV9
	I4bbCa+3WUXgKSq9/0LsY3Zz+9KirRq9n6QtrEnZEO6v9qwyH3TpsMAX/bj7n44fM+F3d9tY+nIwI
	w6/Cyhl4mhlgXdJ1msHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJE04-0013Cm-2v;
	Fri, 29 Dec 2023 14:38:12 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJE02-0013AM-1p
	for linux-riscv@lists.infradead.org;
	Fri, 29 Dec 2023 14:38:12 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6d99980b2e0so4409684b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 29 Dec 2023 06:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703860688; x=1704465488; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nNt6uSdbZ7DbOtq3KjOLhDCh+Jm85/iAkPBdV5go9e0=;
        b=HXp0uTK30R1pJxBt+o/9Z911NkJHis33OQPuMagNNMW3s4xSurrcETqu9Loz5dXYMH
         /6U8OMUmsqEsQjz5GaGrZdox4yUe5S1wYbjDWyK9tyywewPn7gtGQv9foJNhwqrUHO4h
         Fy6Je94Udza3ZPbizh0NEZsane/e4a3D9sXhN5belY63/TJnH9OkOJSNNpzK4hjl3Wu5
         316dr9zJLt1bO9e2W5bsCZJWkiRdOt+TQATVmiWbwz5di60XCNQ7ZIBTOGczi5E6Qw72
         QOdi/HVVJN+fZ1/TnCImDOhiG2iCyZ59pdpWLuUKRHwmzelbO+qTbfN5hpvxW+d8Hc1m
         Drjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703860688; x=1704465488;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nNt6uSdbZ7DbOtq3KjOLhDCh+Jm85/iAkPBdV5go9e0=;
        b=kVDB5hjmdROlzvuUvNbBKEgYnaKrZfwHSibznH5JblplN6OirsbpuwwlGZQU0gIV8X
         PsOrcoF6Vb6d896zmPfK5D2U4eCMgnD1ccbX3ajFnjluYpgj3A6V4OvppBiScCe5WQHz
         /zqfaSR/IE25o34WutVnLdqKoxADhlMvHlKQRWdDzdm6RUvyBopvFFkLt0Nk1OQgxsRx
         Lnhc0JVn2E6dUE/V2Sb+JJFmFkWjvOFnIPHXvVrnL8ywW601JJWNZH5gK34OEx/bEzm+
         OVakuptOFWmaLeibKLFcxN3yGZBnP/dnmn11Ws7ztRsBq8VMAnx4JsL5jPfWc2HKIVY+
         N0Sw==
X-Gm-Message-State: AOJu0YyBLXakNDzVT59lNGB/y3lDHGC/3PdwGCuHSc5+JAQW4Dagl5qL
	4E/ryD0STnVdGAABA29AStpm7NpzZOLoYkxpOfldqGGmXbA3QtupUWYIhsZqzV+E4pVDVTqRJnL
	2yxPhN0FsZg9jG5dH/0bLF2QK8HOIKjd6Tuht28bpNfq0NcdOQKH9c0w4QqEkH7XI+Zd2whihp1
	mknbzMq/5yDO0x46L1QVYp
X-Google-Smtp-Source: AGHT+IFYCcSqLW9MJ3dEVyvl+9csTMjFUzR9Ir23/0M/txBT1i5GGeT5KnaQWuDL6pkvqYocl4sFUw==
X-Received: by 2002:a05:6a20:748b:b0:196:6b10:f3f4 with SMTP id p11-20020a056a20748b00b001966b10f3f4mr2108113pzd.74.1703860688426;
        Fri, 29 Dec 2023 06:38:08 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y16-20020aa793d0000000b006d99c6c0f1fsm11544727pff.100.2023.12.29.06.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 06:38:07 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	charlie@rivosinc.com,
	ardb@kernel.org,
	arnd@arndb.de,
	peterz@infradead.org,
	tglx@linutronix.de,
	ebiggers@kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Xiao Wang <xiao.w.wang@intel.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Joel Granados <j.granados@samsung.com>
Subject: [v9, 09/10] riscv: vector: use kmem_cache to manage vector context
Date: Fri, 29 Dec 2023 14:36:26 +0000
Message-Id: <20231229143627.22898-10-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231229143627.22898-1-andy.chiu@sifive.com>
References: <20231229143627.22898-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_063810_606995_91BA3A9B 
X-CRM114-Status: GOOD (  11.83  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The allocation size of thread.vstate.datap is always riscv_v_vsize. So
it is possbile to use kmem_cache_* to manage the allocation. This gives
users more information regarding allocation of vector context via
/proc/slabinfo. And it potentially reduces the latency of the first-use
trap because of the allocation caches.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v6:
 - new patch since v6
---
 arch/riscv/include/asm/vector.h |  4 ++++
 arch/riscv/kernel/process.c     |  7 ++++++-
 arch/riscv/kernel/vector.c      | 16 +++++++++++++++-
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index d75079520629..7b316050f24f 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -26,6 +26,8 @@ void kernel_vector_begin(void);
 void kernel_vector_end(void);
 void get_cpu_vector_context(void);
 void put_cpu_vector_context(void);
+void riscv_v_thread_free(struct task_struct *tsk);
+void __init riscv_v_setup_ctx_cache(void);
 
 static inline u32 riscv_v_flags(void)
 {
@@ -227,6 +229,8 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 #define __switch_to_vector(__prev, __next)	do {} while (0)
 #define riscv_v_vstate_off(regs)		do {} while (0)
 #define riscv_v_vstate_on(regs)			do {} while (0)
+#define riscv_v_thread_free(tsk)		do {} while (0)
+#define  riscv_v_setup_ctx_cache()		do {} while (0)
 
 #endif /* CONFIG_RISCV_ISA_V */
 
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 36993f408de4..862d59c3872e 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -179,7 +179,7 @@ void arch_release_task_struct(struct task_struct *tsk)
 {
 	/* Free the vector context of datap. */
 	if (has_vector())
-		kfree(tsk->thread.vstate.datap);
+		riscv_v_thread_free(tsk);
 }
 
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
@@ -228,3 +228,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	p->thread.sp = (unsigned long)childregs; /* kernel sp */
 	return 0;
 }
+
+void __init arch_task_cache_init(void)
+{
+	riscv_v_setup_ctx_cache();
+}
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index c1f28bc89ec6..1fe140e34557 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -21,6 +21,7 @@
 #include <asm/bug.h>
 
 static bool riscv_v_implicit_uacc = IS_ENABLED(CONFIG_RISCV_ISA_V_DEFAULT_ENABLE);
+static struct kmem_cache *riscv_v_user_cachep;
 
 unsigned long riscv_v_vsize __read_mostly;
 EXPORT_SYMBOL_GPL(riscv_v_vsize);
@@ -47,6 +48,13 @@ int riscv_v_setup_vsize(void)
 	return 0;
 }
 
+void __init riscv_v_setup_ctx_cache(void)
+{
+	riscv_v_user_cachep = kmem_cache_create_usercopy("riscv_vector_ctx",
+							 riscv_v_vsize, 16, SLAB_PANIC,
+							 0, riscv_v_vsize, NULL);
+}
+
 static bool insn_is_vector(u32 insn_buf)
 {
 	u32 opcode = insn_buf & __INSN_OPCODE_MASK;
@@ -84,7 +92,7 @@ static int riscv_v_thread_zalloc(void)
 {
 	void *datap;
 
-	datap = kzalloc(riscv_v_vsize, GFP_KERNEL);
+	datap = kmem_cache_zalloc(riscv_v_user_cachep, GFP_KERNEL);
 	if (!datap)
 		return -ENOMEM;
 
@@ -94,6 +102,12 @@ static int riscv_v_thread_zalloc(void)
 	return 0;
 }
 
+void riscv_v_thread_free(struct task_struct *tsk)
+{
+	if (tsk->thread.vstate.datap)
+		kmem_cache_free(riscv_v_user_cachep, tsk->thread.vstate.datap);
+}
+
 #define VSTATE_CTRL_GET_CUR(x) ((x) & PR_RISCV_V_VSTATE_CTRL_CUR_MASK)
 #define VSTATE_CTRL_GET_NEXT(x) (((x) & PR_RISCV_V_VSTATE_CTRL_NEXT_MASK) >> 2)
 #define VSTATE_CTRL_MAKE_NEXT(x) (((x) << 2) & PR_RISCV_V_VSTATE_CTRL_NEXT_MASK)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
