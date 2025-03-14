Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386D8C35FF6
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 22:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4zqeylQw6K1XmeN+KmrsDIr9DHpPuxliJ1VDOvHF6kw=; b=KWR92DI1MLkfsZ
	BIZ/cPHD7X0p5uKRw3/AkBDApje2Ob7kOmDkO9/myEpsL5KipX4FGcuCc9w7kNLmM8WzHz5OO+nL1
	+AUMxYS928MnRi4GjcHXN2ZD2koV2QUHVqP9T4XHHwoZaYMM/uNS41dHsPGqXJL74/26gj2PzMYhb
	lTPr/1S16vpnUAC4wnWlNG8AZ6spkvSOpEACqwirfj8stWSrDre9PFNzrylbVPJOOIsJ2uZUsrXxh
	KnCISy8xN2v6vp7CPo/NTN9YmNJudsNMjEfSKRRhc2YtzPnMEpED+Wpq2FK0KfqlaIpiMTBHMY13G
	2UfeHazzfsAnt5TpMreQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttDry-0000000FStp-3xgz;
	Fri, 14 Mar 2025 22:51:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttClT-0000000FLBl-1HxE
	for linux-riscv@bombadil.infradead.org;
	Fri, 14 Mar 2025 21:40:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=N78rd5bu5L3Nb7UCylb6NhXzPkib+ej1wIZfC16ALRg=; b=PDfN8zloXmviQldlcHZ4xjztT7
	O+jkb4Vmll/x86rGve+usR1SwBdjgXHcops89By+Oad3ZWHvzWp0PmFUsXJp5m++4GdWcGO0CpKmJ
	Pgw1WF2B2NikBWsYXk8HU9JfU9vNxj+VWQyMmknQzYUOYuom5hDIjKCfXfef/kTHCavvVyeYyPZzp
	qt5SD3a1VcORLtNvBFfZBHI6KwkS5JU9cuHURu3UjVC0sUcTfXMcmIw6nyxVErTRI7GYBhY0LL/fL
	J/SP4c2PO5mM6yFey5yB8HqZUJmSa1veSxrwHaqKcY3W3WNTKclEjOkrZJhrBe74ThjqJj9k+ke5M
	2Ku6LDiA==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttClK-00000002x8K-1S44
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 21:40:20 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-224341bbc1dso51367255ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 14:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741988409; x=1742593209; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N78rd5bu5L3Nb7UCylb6NhXzPkib+ej1wIZfC16ALRg=;
        b=NLzrouTXJ/TjD5dob7CH37Qg5UEIxHRFrPoer2OOgAcnMRmY7gtotlQ50RbJVFDrS0
         69GgH5Y9tc+GsMQISsFR5ALNFC3HEDM35cqqCLzZXUeew4UnbWmi8CoHF4A/qOATd/Mh
         TqWW2NgD7OMhOGDyV5izL1mTRjx4DeArXI6CDMAyf7f5X+54KMHCPwKBbtbU5Hpp6Fk5
         MOFXhxQr5hxG5Ius9wpEpX2XLIxNAHgSbB8AQQTe9dNyYhkLxZkDGM6+A82nRqo0ch/W
         UDmH1I7HGbq8E/0Q8rQGyGt00dzRTljt/GghRZwGq7mM01PYXkiwMgoFFcCPz+70HBlU
         ToWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741988409; x=1742593209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N78rd5bu5L3Nb7UCylb6NhXzPkib+ej1wIZfC16ALRg=;
        b=kFSYPyB7KWuqiwFNlyW+qecXJjwOKDYHfO2fsBm3myGqNWAjhLw7HV30hbOigqgRI4
         R2LT4PBlDPRRtLZYO6KeGPpK/2OYUl0R6FUh4jBu06NoDhjthKeGm7Jzrr+H8fmGL/rk
         NDM/tBYV4Nr/2CPXKDgx+S0bvASqo6j6IUr8Fh4GY1N3kqcVYASTrB1jI3qG/a0KoLyh
         RBJZmFQ4TwWsIVTRMtmUWeGsGlz15DUSVzK49JiqLQmIlX4FfTb5ooArc6fd/WsBLBS+
         nNXUCq58CdvnRy576Jg+wwkNnIAVB2+XikNqJvEcDE0vzS/o2I/JaxybRRBomgbsvwgL
         LgiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9DyXZDHEfFuGSnv+ZNvzS+zL5xCipcviC9v7z8+ohk1jBsih7acteW2Aa85O1QYUUEhF0aNtBmBBGPw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzR0C48C7fNldkHddTxpZglt62dsK5s/zc3dIHg73r/OtnznT6
	R0VuRsAS021DBNsKeUFz21CNE8t7Ius+rMq4FukxpSXDNl89uK/npbGSgD2DaA4=
X-Gm-Gg: ASbGncs0er0STbm19+bVCAbHM+r+h6iaoUdKdgXQ0fN9iJqMDU62ZgQprJyRe4EmHkp
	GrYIi+uN/cJpZ0nWauBpMUUbx5utxkel5+95l8JYMz6pJpli3MIDjXu/yp3/JJkCBXtBmHlHEX/
	VO4vU9E/yNzCco5FOjcre/iHVB+OuyJKYUrVush7R7YCLssu4iN2iYeW4iS1GSUD2yTxxyvIqs+
	/aHLoGcCL5ZNiLu7wCCMaxTiZbOfb72M1JRZeEdxAk8GFQW4A4XM5QE3DXm5HIZqgE/Ys2lS7Hc
	Y+zPn2osF6ltWmZ/z4kyx1JCbjTN3v0gJ/v0HYsNHhkyjA1tpIBkLEY=
X-Google-Smtp-Source: AGHT+IFSKd+2xICbPyI9jv8e0eee8m28O0Z2xE2zkf1BJxJdHUC0s7Oxq9dFc7HadAqrreCNrCxPSg==
X-Received: by 2002:a17:902:f712:b0:223:42ca:10ef with SMTP id d9443c01a7336-225e0b09816mr52846915ad.43.1741988408934;
        Fri, 14 Mar 2025 14:40:08 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a6e09sm33368855ad.55.2025.03.14.14.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 14:40:08 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 14 Mar 2025 14:39:35 -0700
Subject: [PATCH v12 16/28] riscv: signal: abstract header saving for
 setup_sigcontext
MIME-Version: 1.0
Message-Id: <20250314-v5_user_cfi_series-v12-16-e51202b53138@rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250314_214015_336988_FE26E81E 
X-CRM114-Status: GOOD (  24.76  )
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
