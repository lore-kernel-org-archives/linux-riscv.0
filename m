Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADD3C7EE2E
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 17:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=piICLAcUknal2ouSDBw/TjwMut/Paky/akZIbHi6CY4=; b=OAOuLUR65vJOok
	UqI6mkY4XVsQcXPhiR1pPUUG7U5WUUy3N3MZMpZqWKG51d/ZLKurKt8Mtr+PiEYhVVvfDPWHtoxPs
	3eJTboGRva1LnZahCDQLr1JIZpaBcez2Sc1rDyRCYf4tbykrQMXo8tkupibfdAes7iFAxMGQ21hDT
	Zip6tJwzwo2nDfl/Q5NO3mnC1rdhr8n3Gj38UVF9rd08akvNRpnGqklMrLcEfBrElyfLEoD2qc2UO
	RJd1W5vwF95ZC4b6AtQO19aJC1cuB4C5yVA06pExHaEV9osomYA2+BZLzFbmHedsc6lhBkMVVSOxn
	DYD9EOXX9ryYvAY2rCBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbTK-003E5F-Lw; Fri, 24 Feb 2023 17:03:02 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbTH-003Dxh-Dc
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 17:03:00 +0000
Received: by mail-pl1-x62e.google.com with SMTP id q11so141186plx.5
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 09:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4OIOt+i2FPUUG761vxHsPnTGTmnqKlqPflyjCyvck2Q=;
        b=OU8AF9tNo8cvjdesztUh7J2bMGT7DF8pw6VT470S4w3FkgPvmNzP7WoNrTFpalVkqx
         R08fYG2J6ka7bROxWlaNqMoUVxQse5knzCBUBxM4b+O2FyZXY0xDt8pVOr7i0KTygF56
         cvczdiCMZuXqv9lSNqgcb2aktfsAiMaawArq37VH/fYK/NYMuuQXAtWNsXzNkiTTqIoH
         kDaEY7y8skSSSz/x3WvmexLxsHYa0TOaqZ1vnkQWnRIhD4tZuGRJo3oLf1awCzhLT+om
         XeDv3bJZEHmRXG1PE3asgUkA6FyC1sDTlpiDEQ6lPTM7hUL3wNSaPn/GbkuMzYsZTby0
         cgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4OIOt+i2FPUUG761vxHsPnTGTmnqKlqPflyjCyvck2Q=;
        b=PQavO9hl02RydYQPLwT+11Dw0SyN3mAqygvKUq77MvkBax+KKbEIVGSXx8Un96mJNl
         jHDz8dtTSx3mco89914cydcSo73/mRxvxA9523QTlpfLH3hMkeahY3wB3gay4crW096R
         noLho/clkk/JzeSw/6dXbKtoVeBHIBjG+ylJU5Trh5GwFUKig/olqJw8mCpHo3wtpgbi
         KFNm6TRp/HJgb5+A4OOBYB3Zl056QDhhzbeqajAFx8vBzWF/ZR9YwqoAtzIXyl3f72VL
         icGc/L1GZbCg2rvlt4oLNb15rKizhV03ofRZe0MIigpDuA9lQoD5iHLzf/3WsTNNboFn
         45oA==
X-Gm-Message-State: AO0yUKXI3POlRRV/g3XDyhm5KtgsoP7P/BfzYQadrFM4eCB9XrM7zF5a
	ZKPhvuPSR8q5tcU/edZM5gdjZtE5ymfnld5+7h2kmv0DX8wZCxAz64ALqar5MhYS2YF6OxjymA3
	cIOa0HnyuQ/xCKiG7yw3zllNuQosAOmln+N6dp0O408lopB97khHjVYGynI07nGTNObf/+u/QI0
	JrwfNa1/B0gw==
X-Google-Smtp-Source: AK7set/8c1sk0d5VHRUyvH1XHmF4lUGcCLfNDTtBkpMV8VbJNSL04MQoKY19udSmkzrwEBAnlypk/A==
X-Received: by 2002:a17:902:cece:b0:19a:973b:b615 with SMTP id d14-20020a170902cece00b0019a973bb615mr21981971plg.36.1677258172670;
        Fri, 24 Feb 2023 09:02:52 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id b12-20020a170902b60c00b0019472226769sm9234731pls.251.2023.02.24.09.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 09:02:52 -0800 (PST)
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
	Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH -next v14 12/19] riscv: signal: check fp-reserved words unconditionally
Date: Fri, 24 Feb 2023 17:01:11 +0000
Message-Id: <20230224170118.16766-13-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230224170118.16766-1-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_090259_469780_6DB9FFAF 
X-CRM114-Status: GOOD (  17.16  )
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
---
 arch/riscv/kernel/signal.c | 53 +++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index bfb2afa4135f..0c8be5404a73 100644
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
@@ -90,11 +66,29 @@ static long restore_sigcontext(struct pt_regs *regs,
 	struct sigcontext __user *sc)
 {
 	long err;
+	size_t i;
+
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
+	if (unlikely(err))
+		return err;
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
 
@@ -145,11 +139,16 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
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
 	return err;
 }
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
