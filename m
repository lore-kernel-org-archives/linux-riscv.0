Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FDEC0219D
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 02:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4zqeylQw6K1XmeN+KmrsDIr9DHpPuxliJ1VDOvHF6kw=; b=uWLBVN/GYr0QQg
	XlQu75ilEEFs+/Ci6O+CvGaRE5SLV10kMBn2XdxiOoDon3rLFsOYrJKdKvEHO4C6ks0BGDT4SCRDi
	X7iMGyLALjvWEvNU7U5W6sdzntip/vcGsBObUD9PseROZlkS0aCLW6n25+zB5CJsB2jD4RP8rVznN
	uBKjb8smFo/WG5HXx/WELtpcBtMvQtsBft/oU64kI2J2mHC4g6F8X1YTvlIwdpcFc7eik1dVAoSKX
	mNJX3fkpoljXosgm4plKfJFNu2I4ar0nB0Ju7tEmpByRRlMS/T6+4gePn+FKhrLCWOxkFNDZjeFQW
	01/5HAsqA/yfBbDnAb3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfVBz-000000028W8-2jSm;
	Wed, 05 Feb 2025 02:31:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7Z-000000021a8-1kod
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Feb 2025 01:22:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=N78rd5bu5L3Nb7UCylb6NhXzPkib+ej1wIZfC16ALRg=; b=bZ8wP4DuDfgrnXINu1xnZXPlLJ
	7E37EJqmeKAzWletDGuabR2WWG4//EtBYWuflR//7N8ZrqTCtXtzy2n1MRRHXIz6ESULZKQxVuHzl
	ym7YmXQK5r6d9FeyjLuEBuRQgTAyxbVlCoDo78OH/F5rjSI326Z5k2Lge1z2dqrCV79G842q9ZGBg
	fAQLo/8Ig7JUKSFfdtVGlQetHoBeccbuI8KulSJbn1sj2dNUmYjcQYioAhj2zOuJBv1kebmonK+B5
	ZyCaCeaeLy9ZTavfRpzaa2KFKzD9b99EEXmzTdl7Nvtr4sxIgm8lYw3VS+hHWxjNZ9gdALXleMOp5
	sMtDYwbQ==;
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7W-00000003c6a-09Iv
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 01:22:28 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2f9c3124f31so1983545a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 17:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738718542; x=1739323342; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N78rd5bu5L3Nb7UCylb6NhXzPkib+ej1wIZfC16ALRg=;
        b=ojR2YON4xd4nJ1Ff8lRI/vq/VausyD9sMixB14/yMqP1pugDPXxbynT5PJdbXk/8zV
         92TGSI/dscerLtHGAUeYeQ13ijlCqh6kcCuB8Hxlffh2OQqOpiFyjbX6G+BTdqf5lBAN
         QAnU8OoCPfUhb2+Jo+aB1l/jyJ24CJFvw1M5/FMgq0S4fbbJ3hETy68hx4ZYx6Mpw+dp
         5DIE9knh3wdtpfJER6Op6zkh3s5wI0AQIla29uCzn9YQdNa28MqMavqes1xkdGw8Rf1m
         eDPXWsE0a3uM9/5unl7x9P/M1NqfmJ5oeSjJZ8/578BtJi39wK3RQaII+4QphflFjCpl
         iMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738718542; x=1739323342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N78rd5bu5L3Nb7UCylb6NhXzPkib+ej1wIZfC16ALRg=;
        b=pnEDqL8971FP7iMOIMTitMrD+v1/nU80ZcBcuYMpAkJzRC57HX8n9I9YCDasrgaw7B
         peJjBPho6tK6PpiLY5NnM3YiaKftCoAyC00AuIHDG1TjjJZ7aHQlWAeTqMIa0goJYhJk
         NP+rbCtvoOP1pPGvZ+Ys8kmiUo09qnfDn5IpQh3vnyeXQ9wXMs28hRb+NasRHdo1+1Lf
         ARktxkY1314KepAx9rwlYdHCXrHnskPwKnqWZIBbSMYiYXeReAyf2staGkUr0o641ZA5
         ALz701BYqjbIelmf6qjUFxdtQcOh0dkTBPu3KL1qV+nBa5hpdGJozt5q2ere9gYJJw0i
         vkrg==
X-Forwarded-Encrypted: i=1; AJvYcCWgHrXfbUEt4vhEaFevIpUBptj/zwePVygi/kAkWK6BV6hk0r9e+/GqixdZu1RlR0UT3XqvjmGTP5bBww==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGhJGfYloCS9Yby1lEe3u1gozL8e4egbKYGXrm3FojeJQU2xiM
	qSu3JVWLGalOB89cYE+ROK8NtQxqDTc8d8gz3+q7gaI9F9qe9Crt1VrHL4D+cZ6I3TbDfHurro4
	s
X-Gm-Gg: ASbGncvicdsNd/9E8nJv41dbq0QdfJtF+kquATagTrDca3nUL96RHVcFK/NODIkMl9u
	CGwhW8JVi4NYBkNTfqjQaeoJutbj3R53beispljg1y2Rj8+CTWpfRvEsM7uyPM2U7jrIVMCNCWO
	Ap/4bv+ufFbKqrkLYvAwBCYcbxGTAmv+5Do8IpGvi0JD0tmsRGCd4VQVqXyH69HYoFZ9WhtD+Us
	ltsye/EmzqK7+I87NMke0TqzRYmrloDJIFNiU1cNHAVmufZxfmFdKrQ1agQfrLLPyUu7gat+LIB
	6Zr84IZf1+ornkbnJBaxxR99Dg==
X-Google-Smtp-Source: AGHT+IFP/nZiHgN8IdOqdmoR6h7NcsY1CSiQrUwXf/VaRJ07hdJ31km67MYlbRhpJdCkwehTOyokKQ==
X-Received: by 2002:a05:6a00:3a1d:b0:725:f1b1:cb9f with SMTP id d2e1a72fcca58-7303520e7f3mr1721528b3a.20.1738718542562;
        Tue, 04 Feb 2025 17:22:22 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cec0fsm11457202b3a.137.2025.02.04.17.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:22:22 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 04 Feb 2025 17:22:02 -0800
Subject: [PATCH v9 15/26] riscv: signal: abstract header saving for
 setup_sigcontext
MIME-Version: 1.0
Message-Id: <20250204-v5_user_cfi_series-v9-15-b37a49c5205c@rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
In-Reply-To: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_012226_419198_468AD3D9 
X-CRM114-Status: GOOD (  22.75  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Andy Chiu <andybnac@gmail.com>

The function save_v_state() served two purposes. First, it saved
extension context into the signal stack. Then, it constructed the
extension header if there was no fault. The second part is independent
of the extension itself. As a result, we can pull that part out, so
future extensions may reuse it. This patch adds arch_ext_list and makes
setup_sigcontext() go through all possible extensions' save() callback.
The callback returns a positive value indicating the size of the
successfully saved extension. Then the kernel proceeds to construct the
header for that extension. The kernel skips an extension if it does
not exist, or if the saving fails for some reasons. The error code is
propagated out on the later case.

This patch does not introduce any functional changes.

Signed-off-by: Andy Chiu <andybnac@gmail.com>
---
 arch/riscv/include/asm/vector.h |  3 ++
 arch/riscv/kernel/signal.c      | 62 +++++++++++++++++++++++++++--------------
 2 files changed, 44 insertions(+), 21 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index e8a83f55be2b..05390538ea8a 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -407,6 +407,9 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 #define riscv_v_thread_free(tsk)		do {} while (0)
 #define  riscv_v_setup_ctx_cache()		do {} while (0)
 #define riscv_v_thread_alloc(tsk)		do {} while (0)
+#define get_cpu_vector_context()		do {} while (0)
+#define put_cpu_vector_context()		do {} while (0)
+#define riscv_v_vstate_set_restore(task, regs)	do {} while (0)
 
 #endif /* CONFIG_RISCV_ISA_V */
 
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 94e905eea1de..80c70dccf09f 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -68,18 +68,19 @@ static long save_fp_state(struct pt_regs *regs,
 #define restore_fp_state(task, regs) (0)
 #endif
 
-#ifdef CONFIG_RISCV_ISA_V
-
-static long save_v_state(struct pt_regs *regs, void __user **sc_vec)
+static long save_v_state(struct pt_regs *regs, void __user *sc_vec)
 {
-	struct __riscv_ctx_hdr __user *hdr;
 	struct __sc_riscv_v_state __user *state;
 	void __user *datap;
 	long err;
 
-	hdr = *sc_vec;
-	/* Place state to the user's signal context space after the hdr */
-	state = (struct __sc_riscv_v_state __user *)(hdr + 1);
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_V) ||
+	    !((has_vector() || has_xtheadvector()) &&
+	    riscv_v_vstate_query(regs)))
+		return 0;
+
+	/* Place state to the user's signal context spac */
+	state = (struct __sc_riscv_v_state __user *)sc_vec;
 	/* Point datap right after the end of __sc_riscv_v_state */
 	datap = state + 1;
 
@@ -97,15 +98,11 @@ static long save_v_state(struct pt_regs *regs, void __user **sc_vec)
 	err |= __put_user((__force void *)datap, &state->v_state.datap);
 	/* Copy the whole vector content to user space datap. */
 	err |= __copy_to_user(datap, current->thread.vstate.datap, riscv_v_vsize);
-	/* Copy magic to the user space after saving  all vector conetext */
-	err |= __put_user(RISCV_V_MAGIC, &hdr->magic);
-	err |= __put_user(riscv_v_sc_size, &hdr->size);
 	if (unlikely(err))
-		return err;
+		return -EFAULT;
 
-	/* Only progress the sv_vec if everything has done successfully  */
-	*sc_vec += riscv_v_sc_size;
-	return 0;
+	/* Only return the size if everything has done successfully  */
+	return riscv_v_sc_size;
 }
 
 /*
@@ -142,10 +139,20 @@ static long __restore_v_state(struct pt_regs *regs, void __user *sc_vec)
 	 */
 	return copy_from_user(current->thread.vstate.datap, datap, riscv_v_vsize);
 }
-#else
-#define save_v_state(task, regs) (0)
-#define __restore_v_state(task, regs) (0)
-#endif
+
+struct arch_ext_priv {
+	__u32 magic;
+	long (*save)(struct pt_regs *regs, void __user *sc_vec);
+};
+
+struct arch_ext_priv arch_ext_list[] = {
+	{
+		.magic = RISCV_V_MAGIC,
+		.save = &save_v_state,
+	},
+};
+
+const size_t nr_arch_exts = ARRAY_SIZE(arch_ext_list);
 
 static long restore_sigcontext(struct pt_regs *regs,
 	struct sigcontext __user *sc)
@@ -276,7 +283,8 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
 {
 	struct sigcontext __user *sc = &frame->uc.uc_mcontext;
 	struct __riscv_ctx_hdr __user *sc_ext_ptr = &sc->sc_extdesc.hdr;
-	long err;
+	struct arch_ext_priv *arch_ext;
+	long err, i, ext_size;
 
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
@@ -284,8 +292,20 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
 	if (has_fpu())
 		err |= save_fp_state(regs, &sc->sc_fpregs);
 	/* Save the vector state. */
-	if ((has_vector() || has_xtheadvector()) && riscv_v_vstate_query(regs))
-		err |= save_v_state(regs, (void __user **)&sc_ext_ptr);
+	for (i = 0; i < nr_arch_exts; i++) {
+		arch_ext = &arch_ext_list[i];
+		if (!arch_ext->save)
+			continue;
+
+		ext_size = arch_ext->save(regs, sc_ext_ptr + 1);
+		if (ext_size <= 0) {
+			err |= ext_size;
+		} else {
+			err |= __put_user(arch_ext->magic, &sc_ext_ptr->magic);
+			err |= __put_user(ext_size, &sc_ext_ptr->size);
+			sc_ext_ptr = (void *)sc_ext_ptr + ext_size;
+		}
+	}
 	/* Write zero to fp-reserved space and check it on restore_sigcontext */
 	err |= __put_user(0, &sc->sc_extdesc.reserved);
 	/* And put END __riscv_ctx_hdr at the end. */

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
