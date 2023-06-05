Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD619C7EE23
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 15:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TZKjtlwj+2E27RE9ws1BdnHe2nxEy130Ys/PBRrEPaY=; b=rhSvW5Mv6SuNqk
	lAu7WS+62EkaegVuYg4orVGEZDSkzqlWx9OKtOZsJHozT3FQdxm9Nn1+s19fjq8x1fE3M6rUhbHhr
	XFB3lsYJCMIIfC544Dg5U11IMWB/3E0R4QEPC81t27W9JbDjJDorVr1PBg2jg2KkjTqkk/YcxlUmm
	OnP2SynKvzlIbxllCVvYTVyKKK15aLMB9QBouSLP318Xzb7W6d2v4o3GyAIWn7Wuu4xNcrPurDbLy
	iXO+w5HY6VaaN2aDbRa5ERr5PcH4yigRJLHrpdMUtV+SdRAlpCE7BrIM1AiH0Zc29Lfin7USbCsUG
	ia9sjMUVTxE06UzW5vyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CKW-00FzQt-3D;
	Mon, 05 Jun 2023 15:41:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CKW-00FzPm-0t
	for linux-riscv@bombadil.infradead.org;
	Mon, 05 Jun 2023 15:41:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wN7ZHBcxzp7ZsRkqqH3xjhadPlnuKqjQR/mkhzwbhmg=; b=RUsemRR95JD4AaWCO5fYHU9qHn
	a2Df0IEIIa5kMcx+uqrwbVhdQUUWX4cDMJnUE7Dw0EE7tvqHaugvrvlocyhszpvNK0M7zXEdm034u
	KiOY2W3yuyOjNHvRkRk2JYlQJPVhGLJ9q/UfVrLaVVPUsCS59CohMTluS0EwsmjDPGHTuiXFtKuSn
	55zQVdvgOX0xR7YIpE8Cww9gN8hT4LsLxImVZK+nrxlpss5jeXwG1ZuDzmxekGO0a2XW/SGv24HC7
	6IzeZcV9jeHJCSj9GmBH3Rvw05AFvLvJO3OWT/qVmNkOR6huIZO8JrCY+Ap16xnM+umuZI9Q3ui+L
	z8eOUeWg==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CKR-003OHW-1O
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 15:41:10 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b034ca1195so22473075ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 08:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1685979663; x=1688571663;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wN7ZHBcxzp7ZsRkqqH3xjhadPlnuKqjQR/mkhzwbhmg=;
        b=GJKOvUN4LO1OABHEIz+KLh16tGWqL0jZvco8d7SBse3jPaksrM0vTsIp1I1584Hsin
         WPcOTT6CYhA78qSu9it/RMJ5TyDp921fe+Pwf71WjFB2KX4ON3aFa6mud0MkbjEa3dve
         /YrUVhRILe4o82FsseKsCnT8dRQCqsGI9zWhoye4qQSkJtwT5mqKMiRQ5o8H4mqPrIZF
         7m10AyO/Pz9Yr38DqFTM4C8AjMv0nyMQQ3HMe0psHbkv/9owtVRG23Sqlg2hfO9DuAXb
         L2vXhBiE02iZXjJbl8r5E2AwII1204o1BYoIh0axzwyKNPrPijgQ/mh5+pROId93BvFT
         yGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979663; x=1688571663;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wN7ZHBcxzp7ZsRkqqH3xjhadPlnuKqjQR/mkhzwbhmg=;
        b=fvgep3GF9l9s25ErDNo8Xt2w0sn9wrKoiAPAIf04cpf8aLgQV18KP100yFZd84/ig1
         yMQRDVM0/DRQVz6uDLtomNlEaNsiEQjpzCdru1CkNEPgD4/gKOUJmtDT0jFFwOALGcyf
         X8OyFsbNXmKf3Rd4C/U3/H25eYRygW/5QNDLni6pmevvbWg/UI98i9RJFHIW19QtXwyZ
         H2fWp+HxL8I/SG36ZuF1n/ejLBzzKNj2ZI357lEZ6tDVyrI//DwuDLydVX0HcGzqcFm5
         JT12Ns7vP/Nk1W0pltWcSesCAu00+3PyEzYkyrPpY3xaxVZU3E1XF5+F7HiB3eKGgdzN
         rBUQ==
X-Gm-Message-State: AC+VfDxGpImiujIohwba395rXPd6SA2XnjToGtAhhF5u1TNyPCH3OMtS
	cBBn33SaHEuZVQ0c/ukfWmFWa+X2wYSTeley7nxEfUyIzXTAzSrEIyi1BQ3oy7N2eZzVhSwEf64
	rX4cEk4usUsn7N4H1J50+4z9M32vOWCINmV7OVQ8vAdq+WbS+b7zwvGf8ivO9qpWODwelwr/lC8
	9X0XMQVwRWDEoqe7o=
X-Google-Smtp-Source: ACHHUZ4u5Py1QSWjvfvmdacfiasEhMFCzFnQiePOem15ngafbyO0VGK06vhOFMvetnkEAH4kisK7sg==
X-Received: by 2002:a17:902:e5c5:b0:1b0:75ef:ce3e with SMTP id u5-20020a170902e5c500b001b075efce3emr4177491plf.25.1685979663274;
        Mon, 05 Jun 2023 08:41:03 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id jk19-20020a170903331300b001b0aec3ed59sm6725962plb.256.2023.06.05.08.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:41:02 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Mathis Salmen <mathis.salmen@matsal.de>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH -next v21 13/27] riscv: signal: check fp-reserved words unconditionally
Date: Mon,  5 Jun 2023 11:07:10 +0000
Message-Id: <20230605110724.21391-14-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230605110724.21391-1-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_164107_634588_7908CC29 
X-CRM114-Status: GOOD (  17.29  )
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

In order to let kernel/user locate and identify an extension context on
the existing sigframe, we are going to utilize reserved space of fp and
encode the information there. And since the sigcontext has already
preserved a space for fp context w or w/o CONFIG_FPU, we move those
reserved words checking/setting routine back into generic code.

This commit also undone an additional logical change carried by the
refactor commit 007f5c3589578
("Refactor FPU code in signal setup/return procedures"). Originally we
did not restore fp context if restoring of gpr have failed. And it was
fine on the other side. In such way the kernel could keep the regfiles
intact, and potentially react at the failing point of restore.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/kernel/signal.c | 55 +++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 9aff9d720590..6b4a5c90bd87 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -40,26 +40,13 @@ static long restore_fp_state(struct pt_regs *regs,
 {
 	long err;
 	struct __riscv_d_ext_state __user *state = &sc_fpregs->d;
-	size_t i;
 
 	err = __copy_from_user(&current->thread.fstate, state, sizeof(*state));
 	if (unlikely(err))
 		return err;
 
 	fstate_restore(current, regs);
-
-	/* We support no other extension state at this time. */
-	for (i = 0; i < ARRAY_SIZE(sc_fpregs->q.reserved); i++) {
-		u32 value;
-
-		err = __get_user(value, &sc_fpregs->q.reserved[i]);
-		if (unlikely(err))
-			break;
-		if (value != 0)
-			return -EINVAL;
-	}
-
-	return err;
+	return 0;
 }
 
 static long save_fp_state(struct pt_regs *regs,
@@ -67,20 +54,9 @@ static long save_fp_state(struct pt_regs *regs,
 {
 	long err;
 	struct __riscv_d_ext_state __user *state = &sc_fpregs->d;
-	size_t i;
 
 	fstate_save(current, regs);
 	err = __copy_to_user(state, &current->thread.fstate, sizeof(*state));
-	if (unlikely(err))
-		return err;
-
-	/* We support no other extension state at this time. */
-	for (i = 0; i < ARRAY_SIZE(sc_fpregs->q.reserved); i++) {
-		err = __put_user(0, &sc_fpregs->q.reserved[i]);
-		if (unlikely(err))
-			break;
-	}
-
 	return err;
 }
 #else
@@ -92,11 +68,30 @@ static long restore_sigcontext(struct pt_regs *regs,
 	struct sigcontext __user *sc)
 {
 	long err;
+	size_t i;
+
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
+	if (unlikely(err))
+		return err;
+
 	/* Restore the floating-point state. */
-	if (has_fpu())
-		err |= restore_fp_state(regs, &sc->sc_fpregs);
+	if (has_fpu()) {
+		err = restore_fp_state(regs, &sc->sc_fpregs);
+		if (unlikely(err))
+			return err;
+	}
+
+	/* We support no other extension state at this time. */
+	for (i = 0; i < ARRAY_SIZE(sc->sc_fpregs.q.reserved); i++) {
+		u32 value;
+
+		err = __get_user(value, &sc->sc_fpregs.q.reserved[i]);
+		if (unlikely(err))
+			break;
+		if (value != 0)
+			return -EINVAL;
+	}
 	return err;
 }
 
@@ -147,11 +142,17 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
 {
 	struct sigcontext __user *sc = &frame->uc.uc_mcontext;
 	long err;
+	size_t i;
+
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
 	/* Save the floating-point state. */
 	if (has_fpu())
 		err |= save_fp_state(regs, &sc->sc_fpregs);
+	/* We support no other extension state at this time. */
+	for (i = 0; i < ARRAY_SIZE(sc->sc_fpregs.q.reserved); i++)
+		err |= __put_user(0, &sc->sc_fpregs.q.reserved[i]);
+
 	return err;
 }
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
