Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFB0606A32C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 16:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YEg5RlNw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bfTh6wrW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qc9k0ed5XopMMzxBqU1ykhZU49z819W1Yvxy/uqWlM0=; b=YEg5RlNwKhrfHsXrEjUXteNoyd
	CD2bbRIhZW1HO+36FAqeOUa4Yg70/Dvn7QhYb3ZPVx7tel1mqN54koVzeNnJWSpLRr+eIS1RyA2V1
	c+nRyE77zJ8d5QekhNvyO9Lw5PV68x8NrGWUHPcxehXlHZIxRUrInlLPQnY7mZAVJEGEabVcx4maB
	jjytrr8De/iVvFAz7rMhKzjJvaYrTGj4rkJ3zLQAMv9D4DWu3vx12FzWFgjNIcZEkBqwWo86vIIVi
	vj4L7wcYmiR5ySoFZ3SMbx74bFwPttcTAjACdq/7l52D3K9xwPAXyC5YyS+3XwKWRG+5Bs8xlENa7
	qhcqa3gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP09t-00000009ZD9-1rQw;
	Thu, 05 Nov 2026 16:17:49 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP09l-00000009ZAq-0Tfb
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 16:17:42 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cc147d86bebso639059a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 08:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895460; x=1794500260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mPKBLlnM3LFTy4le1GdgYQ+LvOCf+Ky5Ifcj+VZbfQA=;
        b=bfTh6wrW1Sq7Eg1Nr6zX0GbCREQwRRM+amtjTNVt1tHdR6gHa67TD6CHX5dsXSBrwF
         ygqYS7wyvkAYfdi6I5eId6wvYhiuyjEtHWM/96piD+MbdJPGDIIl7Mw6wGyqEgC78SvW
         47FcthVAWmEveacGEXi1G1DXNfPVSXdtLSA+OLL6q6AsXBpNJibszO3C1usNIPpcSPBv
         UuJDAM5PYfdeKvLXDHNJvr3oySGXpHJLOt6FfXjSwNVhuVlRLBf7Y/9+j0meMjVfSmUK
         XIlBZTsbZn0ffCHIfqOZ0qVZANakbo+6Yf3WVwecnlKi5eFQxXNOtW+QU4ercxiUPWHR
         fHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895460; x=1794500260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mPKBLlnM3LFTy4le1GdgYQ+LvOCf+Ky5Ifcj+VZbfQA=;
        b=fjtvU8Qu/5DIPCmAXhWj7TZO0qQSfObCrvRovy91y2JIM6MkOGOWKfVs+PvtKyOsyX
         knrMm7BIW+JrWlMLmpImA5mLrzTO13RmFZrXX+h04E7migP2iAOcm5ySk60ZSAhhAUB6
         q7nE/v3Z6EDpINbj6mk+FGrAInEDJkWzcMewShlTtui4XcKAhxXxd8EZgWMp8OXxCGGF
         8e34ehOTQnOarY+LTGsNSsI/yPBMtZ4A0jNlUT2o81T82AuGJRALQZ2JaxekHNDuaoLf
         QFHq23zGE/dvibs2+zOZYGvQz13fKEctH6j3/2gmth4AZuh86J0+a9CzF2l3A23PE3uU
         0new==
X-Forwarded-Encrypted: i=1; AKwUvBx8HcqdUQ8t7Z3yRazi9+zJsl8BzFNlLVvBxU73o8rD8whdnw3cXf5Xx+fRv1535+gShQWlyWpAAmXZig==@lists.infradead.org
X-Gm-Message-State: APuU4Z+uEDtiB8tXJkcmNhjeoIjtxR3WrHGf3MnS1s+QoAO5/OxIuqA9
	qg1Tol5a0LqQaYIfp4bKW2r8eT6tB3X3fEZOCS/Yxm7bRPdqwMCaSiWm
X-Gm-Gg: AYBFou2RrkqqMYQPxq0E+yWPp9cjVArD6+C5OveGCARrpmpCu4hysi0B+y1JPcqSlkC
	B+ANUijKFMPvcbHZGf8jTQJHHCh4Zzo3Qlq+hmuJdZdY/wX2prFiiE9Hd0cVAsFfZNU2LLoSKWc
	mbTART5VLbteDC5A8rNLxxrYOgVejhUvn1zqp0CVcvOj+nb4y08/dn4x4AwgB7CHubIfggpK0m9
	l0cHFVtmCyiWoqGc9v4EgenxZEeTVsk1rKIlTI7Fhb9W/MHsa6qJdEE7yYYqk2Aeuwz6Orgx5y8
	RLsupqZhxl4bUpyjx8mDAYLyq1rcgbDyvvd390cFbJzvC6IqAYE2XW8r/CyM817kn2zINO06994
	pEAOMD8ohmV4nWQnw3zwlGYP2IIGlLASqM7ngXreZejXGX2miQ+VRMQKLcOYcCMc1D2Z0SYxusI
	MbH1E3SmcQkzt0r1jZmJyGGQwSDKhNcRpQAtqp1j7TTykVnnFFmscr+J43xNZb4Pf4e9iXvlrRR
	FtHNZejjqkU3hDuJn7QGM3aZZ7PVvsBQJov3buibmvvJlyqyXw95D+bQbG/JPXokOd5mgtW2nLP
	hqLSO7qbME31yN0SGHLfkNvYYxIvrmpUYOvs7ZAK11abdE7GJ3Cr1g5nktYNgRgeyhMHKEpld6z
	gkEw9flRyS0NehhGTEyug53Q=
X-Received: by 2002:a17:90b:3e4c:b0:3ac:36c7:c144 with SMTP id 98e67ed59e1d1-3b0afc6476bmr1703983a91.28.1793895460202;
        Thu, 05 Nov 2026 08:17:40 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:17:39 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 2/8] clocksource/drivers/timer-goldfish: Fix oneshot mode spurious interrupt
Date: Thu,  5 Nov 2026 16:16:56 +0000
Message-ID: <20261105161702.3515900-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105161702.3515900-1-visitorckw@gmail.com>
References: <20261105161702.3515900-1-visitorckw@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_081741_246364_622D7767 
X-CRM114-Status: GOOD (  10.25  )
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
2.56.0.398.g882cbad275-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
