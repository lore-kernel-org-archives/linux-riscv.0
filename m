Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FB6606A337
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 18:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nGmTwb8A;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=onvMORJt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0606FH/l6uhvj2jPYDA6DGbWUEMJ4VWHSxfTamS3B80=; b=nGmTwb8AYHTUjXuuWDiHHpSspX
	DIRY+gKueeqSvNX1FCqaV65bcrwljyTY01ctkmmZLlABxG4QD/l/C+8tRO6NGQe+RPB/Nnzs6UoOZ
	dnfKo+fBjCamKdChZjdggyyp/j2qeOruzzr/8Z2Pj9TgpoO21sJMOUrLKho8NQRSLHF3/GuxsWHxd
	Bt5+UsXtILXAuxonU2CIYpFHNkAwMlnwEVhT1S7yboOxd/7WAMw0XKhluSnGvN7lxaqTz32ykB+ve
	AtdTLfYIHmQF2Ix7IFS7YE0STUTQ7BDvY607YYM4O9Ekz/lYbOlfZl1B6NvOuiA99L6OMiiBaOoZB
	U4kgBTZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdwV-0000000E8rb-3zO3;
	Thu, 26 Nov 2026 18:11:35 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdwP-0000000E8nj-3sEq
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 18:11:31 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-1b546061d58so16748190c88.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 10:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716689; x=1796321489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6F8UENk1fuxOmw1JD+w3Chipk8eAZUCmgorWcN045W0=;
        b=onvMORJt3zsv0tqeCwO5xoW/1AtxBldIzOqe0Fhkgv/4exl3fD4mCOtV3mWifm78gE
         qPOQPbo889x3anayaK4nHSA6tNvE39nFB/6h+ZqRJMPnxcJESP2hLuK1Q6ysOAM76lcz
         SD4098q5ByWy+r6ZHYJkhA1/mH2hoAB0ObShD0TK3Long2bv2lqI+S7nUvnd545yi4tw
         /jV3Bvc1cULuQSrpMOInMHQ8qXQIr9HixeFC/5FEBnKYGuZlFMPMfByElAeWwZbhSL2m
         dCOwuSpvb6pOPt41IdrHTvDJwSEs/i7/RqloxWotZSQhRL4MwNLqrmI074/cj19yl2t0
         2yGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716689; x=1796321489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6F8UENk1fuxOmw1JD+w3Chipk8eAZUCmgorWcN045W0=;
        b=bvhuf0ymWeXYUS8nJrvEeBuKuphmbqdrJ1DWuAc+raLs3xK18NWoRiX2piYBKglWF8
         +svqFkzgJLF5EvDvzMrm1KpvgugAY8QZs1n+W6qxDn9Cn+ToA0FU3vJ9rnbMJViesQ/K
         n1L5MSjOKF2k+9qCz0MtbY0Tsq+/+yZMDULe+xvRgDK4V1tEh1ngLJlml1pVfFA2s8ER
         fp4GLfMPYeMvZpw4yo8WiTyWBmIr0eDnLvJ1E8nO/5W+nBLrtF/InuZsaAVNikGsldON
         J5ECVLbakEJGkyNt4GPPv7Pu2bLUn8TtBO8Z9QRrjoG6cttqrRm3h4sOJTfxrrLYR0Ju
         HIrw==
X-Forwarded-Encrypted: i=1; AL+hErHr3gu3PjWXPW72ynbcxOfXKrajmfXICx61wsaAmsCjssepR5usiP/ia8lAkUTdByWA3Ya6+xRSXyi9OA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+ixMiIBBfoJP7PjCDp20nBuRblZzpoD1xuJfF16/15kJ5BfSrz
	ZPaeEkPjXoTPudSRbGcWwVtv/5seUyatRv/x1EZXjHzTMUFZqNrPVYHEInGMlQ==
X-Gm-Gg: AZFdTZdFyD6HX6V+aQWJQvavR0WQg1yE0MNN89b1FiV7OcYJiJMdLvscXw+o26U1iuk
	nK5NGXLTJvpgEtTlZ+OCWM66TXxFnNXzuNdC/fl71kvak2N8yyLRHUXCfqizgOLbTpYIvuy/wBS
	UPxMT4JRRPcmqRh7Vcs/LFcdeIrwIcXQjiwFuJWa2ITfC6kNFxrQNmyYOqLq+US6VtCbIx33hWH
	YmwaQc4aWLBvNrbjKedAjCjnQxFt+2wZ0pNM0wEeuFSwDI4ZY3xcReA4dXA76hbOmzYngzTHUw9
	OZSRGTSyb8qHeTqgHXJgTDRvjFD5uwn1BBCcLwLuAB3liESurWGTuLLhvVrQF71gKigf2yA5QFm
	jzZtpbOnP1inNe3/YH62wqgV13nEoRMvpU4LIkgQCHIl8NuW/HaN5EcWRLS00X5Wc8ozxiUXDFl
	ddB/r6Y0c9379HceQGHRnm98/Av/QKUjXdtGxbqxKUzGS3sg7sABAf9RLkgjMXZ2WH00ov+nlFE
	IycI82gTQeKAZ8NAMHIgF2e5/60YKcSV0BoGl6bIVETifyX0h2yMaLigk/9zG6oBBeId5tTxvgn
	MBkMOYRQzWmSXeh9j8LU38rzFuJznXPdogMGOUKW/0SGmzVhBgOecDpaaBaFoTDo+fSTiVGNNxc
	GgaCbSZyc2lx+cMm+ovgd/4w=
X-Received: by 2002:a05:701a:cc84:10b0:1b5:709f:d510 with SMTP id a92af1059eb24-1b5709fd63fmr14492602c88.22.1795716688687;
        Thu, 26 Nov 2026 10:11:28 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:28 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 2/9] clocksource/drivers/timer-goldfish: Fix oneshot mode spurious interrupt
Date: Thu, 26 Nov 2026 18:10:54 +0000
Message-ID: <20261126181101.3715754-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126181101.3715754-1-visitorckw@gmail.com>
References: <20261126181101.3715754-1-visitorckw@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_101129_972607_EBF58EC7 
X-CRM114-Status: GOOD (  10.51  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

goldfish_timer_set_oneshot() writes 0 to TIMER_ALARM_HIGH and
TIMER_ALARM_LOW. Writing TIMER_ALARM_LOW arms the alarm for timestamp 0,
which immediately triggers a spurious interrupt when TIMER_IRQ_ENABLED
is set. Meanwhile, goldfish_timer_shutdown() disables interrupts without
disarming the alarm.

Use TIMER_CLEAR_ALARM to disarm the alarm in both functions.

Fixes: c92e7ef16400 ("clocksource/drivers: Add a goldfish-timer clocksource")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index cc02b012ff76..b1dc8b388470 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -55,8 +55,7 @@ static int goldfish_timer_set_oneshot(struct clock_event_device *evt)
 	struct goldfish_timer *timerdrv = ced_to_gf(evt);
 	void __iomem *base = timerdrv->base;
 
-	gf_iowrite32(0, base + TIMER_ALARM_HIGH);
-	gf_iowrite32(0, base + TIMER_ALARM_LOW);
+	gf_iowrite32(1, base + TIMER_CLEAR_ALARM);
 	gf_iowrite32(1, base + TIMER_IRQ_ENABLED);
 
 	return 0;
@@ -68,6 +67,7 @@ static int goldfish_timer_shutdown(struct clock_event_device *evt)
 	void __iomem *base = timerdrv->base;
 
 	gf_iowrite32(0, base + TIMER_IRQ_ENABLED);
+	gf_iowrite32(1, base + TIMER_CLEAR_ALARM);
 
 	return 0;
 }
-- 
2.56.1.839.g22a8290db9-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
