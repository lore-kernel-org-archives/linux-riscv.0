Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70991C76196
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 15:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yih9YS3CawQpDTK8R6f4yC9tg6V/3TBA83gD4gH3Wog=; b=B6UM/BGWthMyNe
	HNfsAh+91cSC/MC/PZ5q6u/XFOR5nwIAiRi5sqg3vHgvJYiZ8xCr2+D9/UW5TeW/EM9yIiRMZ0unX
	MttRfbCx1KxciEyX88baF3zEy0J8Jy/7OS3AJa6UTCvrlkFevyuaKmGs8uUuSix21/4TXOa+TkCZF
	iIt8OlYI0wlyQSMtK5K6W5KTRzM76oL5sNkwzD+vwVA+DruduTasCzmstC/qZ6RggjToe4jSU269Q
	5Pgm7fe7Hdf4fYw/ShChppzScSO5FtuJqCM4vYbWAebHCV72TOM9t2Q9Z1CtvOUs++XBWzCFA1Pv5
	yGWuZ+CoYxNMqmolUnRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMQv-002HLz-2j;
	Thu, 23 Mar 2023 15:00:53 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMQs-002HIY-0n
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 15:00:52 +0000
Received: by mail-pl1-x62c.google.com with SMTP id z19so12142573plo.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679583649;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EnMly8Z4ZP6m5MefJgirtZn1/V9pgmnzrBMhkpUZtfA=;
        b=NVwTzlEK2Gds43FwU0cLpEZhn54YcxwlTCLUsSTxDTqUEUYYt5DIgDXlc9//y81m7s
         fQjoljnJpSYqIs3Z6oFR2D9HfihLmaaILuk0P+p1T+5QWedR8keaszunQbuE6HPpqRnp
         B4ZvAY9d76vZrs2fC27teiTCScazZ9RWCV0r/117ROvCL+3vXy4ntWPqkH33ivz9+GXa
         XjC8x7PzvADpGxpwOEvnuHjq9vHIXh1b231QpLJmhScReGM+rC6+YM2h2SN4rZLlUXpI
         QkWBB77kTUEK3znFg/NCe4+zgtmhgWzjnGkGHNrAVdZeJvF521DwNqr/C+veMAUixG4b
         NxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679583649;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EnMly8Z4ZP6m5MefJgirtZn1/V9pgmnzrBMhkpUZtfA=;
        b=U2OOfiYOr32lFPEbWy0SIp0MtW9B+m6xkmIcDpW+3nSXht7uwajOC+EnEq3auvWIOh
         a8pKjY69KsSt6jY8Jz33aK/Szka1/iT+kx6NincTSLhvVYPo4nxl8hxx190AhosyRHVw
         YZmbeusV2HgANh45ALQaJM4YtqnOV5304h07krJA59EEABuNS4fGn4F8gwGf2g2ZMY0P
         gwOba/7kU7n770q4Edo/xjNeYMwzU+8wOOeVxqM69m9cTHuvtSAhVsYWhr4z0y4740ha
         pqJWcFd/Fkn+RDu0RnblksxYIdwhzhypdPe6V3SIBoJxUzUQ1Gca6ckOJHcYdztF+hb+
         HgSQ==
X-Gm-Message-State: AO0yUKUAk2cclptpXttYDTQ6yFnR31uGMgTFDZK7iIneDbefYmn3jGID
	Mm3/ykIJfjOTrh5A1IlC0HT7VWEMbbG6AhznE4hi8Xl2B85K/qrmMvEqiwSnznfNRWsopNxiD6E
	lVjMaK0cTv0/19G0wDfblk2OPO8s4mvlwEd5pS5iZb+fdSyz4pjJLRCL2nVP+SRBPjKb4Wpg3lk
	UtFYhdZwisPUKO
X-Google-Smtp-Source: AK7set+DABhERXjaISFRv1JqomxsZIjenBSeZXajHTFO9RP7x7K96i1XQUT6LqKW+/vqMeX80/LJMg==
X-Received: by 2002:a17:903:1389:b0:1a0:485c:a6c with SMTP id jx9-20020a170903138900b001a0485c0a6cmr5821899plb.8.1679583649117;
        Thu, 23 Mar 2023 08:00:49 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902854900b0019f53e0f136sm12503965plo.232.2023.03.23.08.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 08:00:48 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH -next v16 12/20] riscv: signal: check fp-reserved words unconditionally
Date: Thu, 23 Mar 2023 14:59:16 +0000
Message-Id: <20230323145924.4194-13-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230323145924.4194-1-andy.chiu@sifive.com>
References: <20230323145924.4194-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_080050_290279_0D4630B8 
X-CRM114-Status: GOOD (  17.51  )
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
