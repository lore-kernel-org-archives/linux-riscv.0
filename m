Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF63C27C76
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 14:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=piICLAcUknal2ouSDBw/TjwMut/Paky/akZIbHi6CY4=; b=BAlpP53lK2SNWS
	Ivnsr1nP2+kqHz42AhUB4c1pWannBJMRSuwhd+YbQ339XCkQ5gQU3iTbH6JSUqtYrWJmiEpiCZ1Ha
	Ye4qSeZ8uILDJM82RcvkoTSyDelXg/TM+RJGliuPOqioRZTnyGUx+YS5WTU/W5MXYbWbEs/MvzJN9
	UGuhhocP5bdoHh957L+nu4IRJO9Vnnd1b1ZXYFA9xz0ykZYwjKGoVH/JdPwMExsLhOyBzOdo9y8Z9
	Jq+14Z5ipMdVumEUU3GYRkd53AHXBDzGy4h6e5zQqmNxyqntLVPRH3hAy+8pYmcym+BQqtk9Gqg2I
	lqxcKlE6qjZE3kNtSPqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgfJ-007Vmw-C4; Wed, 25 Jan 2023 14:22:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgfH-007Vl8-Rp
	for linux-riscv@bombadil.infradead.org; Wed, 25 Jan 2023 14:22:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4OIOt+i2FPUUG761vxHsPnTGTmnqKlqPflyjCyvck2Q=; b=lIY8bqK79XBBu9BRKnEOkrw5ee
	zTS3XhCD++Oq0ybnmpy5CgssFygQHD5ghudXR1nx+foCZF7veXBgzrFt/TDIaxjYq2I6N2+cSPrNR
	UHOZgto3oF+Ka4PFg/VCZQHRw6AUVVwNteUOGihSVkBpX7rM5L3n/X5FkMKDrBtdSXzoBlL8+mTkD
	aJDGR5WY803jozFrEvFPv2ISIVrUij0+pc65EBqByzMEZrQc88mvIIR7w/lfV0P9d36K2Y3m3Dl6Q
	Whh4N/8PK5B3kot32xkunBt/7ap7u+pQEg6joGYTomIjP2g7m4lBxka14poYk/9/X/LPNn67irm8P
	4AUqA4Rw==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pKgej-0029rl-2O
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jan 2023 14:21:43 +0000
Received: by mail-pj1-x102d.google.com with SMTP id z1-20020a17090a66c100b00226f05b9595so2171592pjl.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 06:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4OIOt+i2FPUUG761vxHsPnTGTmnqKlqPflyjCyvck2Q=;
        b=ZV8MKZOy4sb0ku1/f/TqJU9KmD93byQb5Ot/0Y6hc61ljcAU/8agY9/Efq/ze+IsxM
         E9NvWCbcahXrXBxsljBEbVoI21st626A5vkZAyaVEH+X/5DTDRX+AtmfI9aYAnXDTu45
         2GsjYYrHzOxRGiFM5u+N/x9aJ8Tgq3I4Jnj7T8Yb6sOZqdzO/wx2KRTWQZQ2ftUfikDJ
         CqGP+x34sXFD+TYKZVr+rhxbVbdRtSE8vJtEaRacFzCaWGeIz1mrmWpIHx0HJifGzR9h
         eXUzqn6NQPzAsC4gEA4e1PD/GKr9aZLYFSwGbGj0u8b24CwIjPvFgFpKAGwtER2knSam
         wCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4OIOt+i2FPUUG761vxHsPnTGTmnqKlqPflyjCyvck2Q=;
        b=pcZKYbYFkoAEP5R9pSXi2kyf3hTHdiJxUifc8MGSSsICaOFlfhteoxjnsCmE1SQsBD
         DQIBHnYnxScG/HQkwx3Zl42gxEJuNO0l0adQDKMTwnygtrFLoSPh4d4ikz9EApb/QkBW
         f8cXtOEAvAwqkux/cGhVdtTwBeXJmr34+wo8feR6UT7hQvm0Ija8tSe2ygLzsQ8L0yGT
         mJDKfpuPXF3eyoIQ2M82C4TkDmb9GlsrnTjDW2FArxidcEyehi8FhrTB0VW2BZvhtr+3
         3fixoEvd1zG8moivJMgU8WIo73D1slTSsshH1SHFheJqEnNGEG1OC9wbTew/TtXcXFV7
         7Lig==
X-Gm-Message-State: AFqh2kr/xlpJat5wvtdolHDSQx/IzmULhBrCr2TD9ZJSbqRXwHax3vBT
	rlPq/9+M2qdfkuYBw64XAWirmbrpU/dpgEV6QxWMFT06Jgd05FnEQU9eVHPOHGTlrVPMpTOIDM7
	gSnb5KlyhGi7YCywurlGmOyU/EWZDwm049QyO/1sgHX3ujVeA52fwUokBcFhRigEj8Bwa8rYGyj
	DwpQbkDnFAZA==
X-Google-Smtp-Source: AMrXdXsqFhOqquIFWQq1CzqOLz9/j6G0/mvseOpOluzhStTcIcNAliiT37t5sluCLqafrxlSRuIVAQ==
X-Received: by 2002:a17:90a:1696:b0:228:cda9:f608 with SMTP id o22-20020a17090a169600b00228cda9f608mr32739423pja.15.1674656531414;
        Wed, 25 Jan 2023 06:22:11 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id bu11-20020a63294b000000b004a3510effa5sm3203520pgb.65.2023.01.25.06.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:22:11 -0800 (PST)
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
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH -next v13 12/19] riscv: signal: check fp-reserved words unconditionally
Date: Wed, 25 Jan 2023 14:20:49 +0000
Message-Id: <20230125142056.18356-13-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125142056.18356-1-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_142141_919752_FFB1AFF1 
X-CRM114-Status: GOOD (  17.83  )
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
