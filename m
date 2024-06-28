Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FBFC2BD09
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 11:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q/VRN9mHu8tkezjDxSB6V5YhSDRS901PaSF/C9DeXQU=; b=pYfynfcffQ7w16
	ePhQQCPWOXsNjpptVRAAmgt5yp6MoQ8FsVOhGYpt+PhsUReXJCYUfXrUEMfzj6ZOGVIFTmK5V2iA1
	4F7/8ij/kIjYrdvTymNfUtY8jE0f8XVAhbLMhAgyCQcuPJDBMv0nUNX54PvrE19EAsyo3Yp5FwOUS
	Jq64PhzZrTvTGKQA30L/haVHV2rXWlCQFPwkEZW2FzVgV3YwHNtGpfWLe7jp5sTiBm1TFY02RSNpd
	zf7y3QGMeFN34wIdX1DBzUH7i7+9ioC4AlZvkXY1UbihtkEgGWQ2Jez3EamRrGPH4U/jo9gzTkBq5
	/hPMgxUGvQ1a/Vu61wTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNA7T-0000000Db4C-2ACd;
	Fri, 28 Jun 2024 11:50:23 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNA7Q-0000000Db2b-2e09
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 11:50:22 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1fa07e4f44eso2763545ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2024 04:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719575420; x=1720180220; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jDkERiCQ0W+JOyjAnotwTfkJvLnFYyeR6Qb1524j9kg=;
        b=XPvneu1hz2PY95dkmaroeIC/imda8gxZdx9slWPqhG1041rIVtz5sUoBJs26ALjfTn
         H9cdQb0OkmG/onzXxD1zMnczyxmPx96G+JppK9LTOufrkGXOih2XwsmlJrDGBA+lnQ9x
         ssKb5cJBIfsTI6AxMEcinv/KPXr1/JijrCRzfVHhrKHuedetQQbJ5CzXTv5T0l34IKWR
         YVAkq6+Z9EH6AodT7/BOk2a69oYqkutCUnxJOOoKSZeRJG7iGtz+xBd1M1dMAzG+cQvY
         eNjTv2ujWXQ9Rm8kZ2QWtmtaT2XI+GsqsHad9X4dkzzknm6HoliulX/rDlTZIZEG3tGL
         fmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719575420; x=1720180220;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jDkERiCQ0W+JOyjAnotwTfkJvLnFYyeR6Qb1524j9kg=;
        b=SNQ7h040gmf1wUd/AhgVzQI1dQ0f0qBROZCzdq6pnDjXF6USV5JJx76IsOMEp0w6ew
         hG1fFB/wXjqsSQ0qUy74PId4B+nUtfSdTkE40jGd+YSbdkRKBsJH2obOBG/PL6Fq2/L+
         SW9y4oZnFIinZrrlRPd2Y7MH+OjK5opWaUx0Pn5gvfAOJPVsProxH3WLDQIQsFNHLz5l
         yMPqfX38bHD1LsYOD3lmP6CwhGXNCNe8vcRUnXjxWiHGWNRiMYBhmOMLvN7bKDBATJqI
         rcilMd2sSbcP9UYKHTpCwL9lY93PzCNl8SWD11mGPwtXlf7+irRJ16mYeevd717RFGO9
         nSZw==
X-Gm-Message-State: AOJu0Yw6fKSFO74H7dkpWL1OtxbL8eXNwgNGDMXqSlgC3z4gjt9uQ4nh
	iD/2tNuX77meV9qtS+JpoHgTb17+2eLy/M7R2avORofYoNI9C0qTobvrctuGtO0=
X-Google-Smtp-Source: AGHT+IFmQ94BPvo45dLsSc/fXtrlVJyxIjuxBvy9HErlZWIz0JMBJ76CrcDuItu29//kRb0mvech0A==
X-Received: by 2002:a17:903:2290:b0:1f9:fb39:2fb5 with SMTP id d9443c01a7336-1fa23bd1987mr168448695ad.21.1719575419755;
        Fri, 28 Jun 2024 04:50:19 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac155c382sm13519285ad.189.2024.06.28.04.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 04:50:19 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 28 Jun 2024 19:50:13 +0800
Subject: [PATCH] riscv: signal: abstract header saving for setup_sigcontext
MIME-Version: 1.0
Message-Id: <20240628-dev-signal-refactor-v1-1-0c391b260261@sifive.com>
X-B4-Tracking: v=1; b=H4sIAHSjfmYC/x2MQQqAMAzAvjJ6tqBV1PkV8VBm1YJM2WQI4t8dH
 kNIHogSVCIM5oEgSaMePkNVGHAb+1VQ58xAJTVlSz3OkjDq6nnHIAu76wjoaisVd2SJW8jlmY3
 e/3Wc3vcDKPhkBGUAAAA=
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andy Chiu <andy.chiu@sifive.com>
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_045020_772697_0056FE64 
X-CRM114-Status: GOOD (  20.65  )
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

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/kernel/signal.c | 53 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 5a2edd7f027e..eb16742ed106 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -70,16 +70,17 @@ static long save_fp_state(struct pt_regs *regs,
 
 #ifdef CONFIG_RISCV_ISA_V
 
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
+	if (!(has_vector() && riscv_v_vstate_query(regs)))
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
@@ -147,6 +144,19 @@ static long __restore_v_state(struct pt_regs *regs, void __user *sc_vec)
 #define __restore_v_state(task, regs) (0)
 #endif
 
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
+const size_t nr_arch_exts = ARRAY_SIZE(arch_ext_list);
+
 static long restore_sigcontext(struct pt_regs *regs,
 	struct sigcontext __user *sc)
 {
@@ -276,7 +286,8 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
 {
 	struct sigcontext __user *sc = &frame->uc.uc_mcontext;
 	struct __riscv_ctx_hdr __user *sc_ext_ptr = &sc->sc_extdesc.hdr;
-	long err;
+	struct arch_ext_priv *arch_ext;
+	long err, i, ext_size;
 
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
@@ -284,8 +295,20 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
 	if (has_fpu())
 		err |= save_fp_state(regs, &sc->sc_fpregs);
 	/* Save the vector state. */
-	if (has_vector() && riscv_v_vstate_query(regs))
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

---
base-commit: 60a6707f582ebbdfb6b378f45d7bf929106a1cd5
change-id: 20240628-dev-signal-refactor-c39e1a7292a6

Best regards,
-- 
Andy Chiu <andy.chiu@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
