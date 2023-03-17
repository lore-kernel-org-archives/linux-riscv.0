Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE4FC6FD1D
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 11:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yih9YS3CawQpDTK8R6f4yC9tg6V/3TBA83gD4gH3Wog=; b=mPPZ+MNPLMvSuw
	L6lkBgW9z3pPgGHA9kKF+hOVt5tLR8JfQHX5oxwcMfszfQcP3KNlaZnW2FwcDo0w8vaGYSmWHzX2y
	2S4DjV/2NeGbmWdgC9kBqteKRrzHKxmT4bsYJx8epE87wZUsf+XuayqBMURJ1v6zpjsxYd3KIOXRh
	qWTZjltOKAcfSUg4Eyk2fBAKGVbxWPNEMzaP/CSTj/yvxrqlU+H4V/kntgbFRr1o5AXQ42ZdbOc8s
	j/QymkPNk2ZojJtE5I+h3h/HufglhANvkTfaUFvZ8ho7fIcokJbdxj6JxwynptZYRZArCwEX+uPAJ
	SHj/QCOkY6DN/L/AaOGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8Ov-0025Ty-2Y;
	Fri, 17 Mar 2023 11:37:37 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8Os-0025S4-0j
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 11:37:35 +0000
Received: by mail-pl1-x62e.google.com with SMTP id i5so5000326pla.2
        for <linux-riscv@lists.infradead.org>; Fri, 17 Mar 2023 04:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679053053;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EnMly8Z4ZP6m5MefJgirtZn1/V9pgmnzrBMhkpUZtfA=;
        b=UKaeBZT5H1oOYrfPXGVg4gnMtXbhP5hD0qYpDqGJL9Pk6vfris2GKsbbdkPxBQXLfj
         MRufCpNzShz4i8E66QakUjE3+bCEqQBRhuqTgJltmJqbUnI2y0LRkKenmgObBWj8/5uz
         2ACIo9zwyPi5oWCcuKX9xgne1uAIUVIlhowaF+OzAhzeYTuPLC8Tg6vQ/BoyGkYUAcsJ
         TduNztZ76mtDWa6BmhnOZlh3uQYlOSRMLiXtzgTUrlZmYC3+d7SUtUWXuyo/lHneGG5z
         sGiKZKUODEBtlybXK3MpXizLF3Bi468DUhUhIdOyX40EYClG8OYKkmFVAer3F7q/GTL5
         PioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679053053;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EnMly8Z4ZP6m5MefJgirtZn1/V9pgmnzrBMhkpUZtfA=;
        b=2bnc9vALMH0/T/txzJDHbDbu1Yw/PMX682SUdPPtLiii8sl0UZqvlVbp4Nz83CYCzl
         3hCMOVw/P28x3aLyR5IK/mQ1MVWWhpiYt8D2ERS5Li/WJSoj7I3vdUDraSHY+Ok2hTYa
         Bgepsl1r5L8/hU9BSykNWgtXyVbmNjArrRxVPNw1hLFZFQnCy1Gx8YQC6wblfeNjEthF
         yURK+VtV6RyQtHNCke7OLIYbjfi9uhPQQXDQWkWc+6SHm8ltvl64CYuaVGEKgRT7Zi6z
         /ua+jpaZtjXY8jQwJfiY3hSJddPA/QvLccvqLudFwX94qzM3hcuc/oKwOp1SD/H/WFFZ
         ctWg==
X-Gm-Message-State: AO0yUKXVzk9XNj0nvKYbdtBYvwxHVLqmTJqXi+0GuIGMi6NGoysSRU3o
	kMSWqh8ViXCrPGRnGRfv1x14PdzJn+vezqADfUTQ7e+38gWOTksnEm0TueytrD8aopp0kMJCgKA
	j4f0KUlG8M1YCoOFM14/ZVLsgdU80rsaK+YoP9LFwcc2SGSgg+B1vvcDVSSLrEVUQsgE/iSZh3M
	2eE67uO9n7az/1
X-Google-Smtp-Source: AK7set+5KZV/iU0uw0jZkulY3jt1AyyXBm8V31B3TbwssxVbG600DlR/gsFtVrnUrubc+qdfWHVYBQ==
X-Received: by 2002:a17:902:f98b:b0:19a:9880:175f with SMTP id ky11-20020a170902f98b00b0019a9880175fmr6361049plb.51.1679053053136;
        Fri, 17 Mar 2023 04:37:33 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id n63-20020a17090a2cc500b0023d3845b02bsm1188740pjd.45.2023.03.17.04.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 04:37:32 -0700 (PDT)
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
	Vincent Chen <vincent.chen@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH -next v15 12/19] riscv: signal: check fp-reserved words unconditionally
Date: Fri, 17 Mar 2023 11:35:31 +0000
Message-Id: <20230317113538.10878-13-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230317113538.10878-1-andy.chiu@sifive.com>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_043734_264642_E53420C7 
X-CRM114-Status: GOOD (  16.78  )
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
---
 arch/riscv/kernel/signal.c | 55 +++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index bfb2afa4135f..eefc78d74055 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -38,26 +38,13 @@ static long restore_fp_state(struct pt_regs *regs,
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
@@ -65,20 +52,9 @@ static long save_fp_state(struct pt_regs *regs,
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
@@ -90,11 +66,30 @@ static long restore_sigcontext(struct pt_regs *regs,
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
 
@@ -145,11 +140,17 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
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
