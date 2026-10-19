Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D9A60892C2
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2026 15:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f+Hfp1UY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a8FBPaXl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uFPjMnsfYy+yKbkTrhZGIjPPgKRtVw05rbvJG45gQB8=; b=f+Hfp1UYe8oTOk
	ES+2RuY9FrAUr2PolfHH1690XsgJ4D7BPj6IaM8amGou2VWfkwXCwtqA0YfM1dc74ob0VVesxYYdA
	Z+Vk84YFuQWxXsEE4ehU0mQhfD8pJDbuY9Qy1Nl80urQiINEpLfS8TCKgnnBOgH6ly0P5EzYZIJl8
	dEYm6djm/h6tRqDjrPlsGW60wABzUW4blu8zSYPRjyyoZlBix7vDDxiuPo97hq2qHJv7suJ6CbIpI
	Ms+czb8I/lp9ybsklqyf2mh8/0tcGy9gIeLfv2VqyXqdaxVcW9ZMekVL7AtWc4LNPK6UQxsQxnSon
	V6iyB5kq7nH1dycZANbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIp0T-00000007ogz-29ui;
	Mon, 19 Oct 2026 15:10:33 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIp0R-00000007ogc-0kCY
	for linux-riscv@lists.infradead.org;
	Mon, 19 Oct 2026 15:10:32 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2e60f9af6e6so17640775ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 19 Oct 2026 08:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792422629; x=1793027429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FXba2O0+JLMWs5otkIxip4NSbpwiNVRyJWBXXY257PI=;
        b=a8FBPaXlCLgP5ZYthYzBji40DHZdSQG4fXa6BrkKG+JHESa/b6TSBpiYhl1ytjXdyf
         KEjmC0MHLLnAQzPjDXZycixj4pwww0/rGiMZhAPCmDjkwt0xlb24aeUv4+6/ko2e+Etg
         zxszmnEl2FUvvdOjGmCcu933SpFBhSqBJ2aYhLhvrqG5NJQr/3peGnWqN/BImPsLILu3
         m14vfowyCM0KwYF9/6qOs6F7Ea/ozjf4CChtHs0CpVDUO5MkelLz95IHQ9Qc6Wq0F/Wz
         vAPEXIZnQZPdzpcWHqouNX3bwa6UGydsatn13xlGvjLxpUV1zU4h3M+h7ffFIVrDUarl
         onHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792422629; x=1793027429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FXba2O0+JLMWs5otkIxip4NSbpwiNVRyJWBXXY257PI=;
        b=k0X2MleBOL9uUlqWH/Ljg1f0qny6Fjmwf/5oB8b9oAbtN5nD1RPlPXJRuMGeI24LHl
         PtMXIO2G5hINWalVUlrVpyHrn7EAh81GWlmRM2s5O3qdmWatO+LiAStdamHQ+0Gltqkh
         rRA+bKZ3H3UuwnaYUjGb1eEF3A+b6WCW4a9oYgzJ8WkGaZaWnwlB8RjwhOoaKaJlMmmv
         WGuzP6Ak43/CJRQsv+v6/UmV0EFGNagPBt0bFwebSQPrIktjVXKtBjdBwIuNRl/kjpui
         j26vHfErL+Rg1b+KDYxaJ86kCALbRaKUClPyJdIIZX6SMzsKkNIUtsTkn1H2f6W8FAUR
         efSg==
X-Forwarded-Encrypted: i=1; AKwUvBxZHrB1mK5RZm41aY7k9/+rPS+qtKnlGm34yULxZvmFHwKRegBeLMWW61XM8ULU+qYMZvlKcv23FwfXyw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJf8Und6X3bC8+25TJJ/3VgC+Fi6Izut+WURSm8cQaUvlKWFCPr
	XKPgx5LSACcyNep2f4WdNCnFqXZnn8ZwenXqg7i1OL28Kg51P8s2vE/X
X-Gm-Gg: AYBFou0XjOqiqBgyNb7YRSIf2bVdUmnarhLGzicVJ61DPGWz8DBiBfi54DaUafQKHZU
	RQHHfMrpmP12DAfSIZ0RcBv2EDKemqG4H8u/O7E/NdgCbouTBSzUgGDyFWwlrSWyYe1clonSwlC
	EtH2t9VhmuNYHIeKYGCy/T/Xpzv7D+lCBuKg7QIrNgXFphRcKGEgNWDYHz/zk9Shvb5G/ddLQ6u
	4ujBaJUXmBPRW0kvZ8y4rasU2gOB5H5qLaRkODBnbwoyefVOJ/GeXcvpEBbAGk6aP/yRf5QidCt
	IVzNKnJruiXG7wEXcXkGGnGdcszWuGIANv8tBnpmm3Sk+rjgcPeRjDxc0Br+t1uJHB0/q/d6x1X
	/KHryLGjUaskeJVJA4ecZAMp6w6c+CK1zIQGzu9eDy3fAC02donE8sVuSUSGkpIS0eUKvNKpIKo
	/cOnCxdfkTW2v/6fBGSf9PZr3aS6gM6NfbDqFtfjN+eVyotGfDFq+afbtDKtxNl1uzmJbSJAtme
	XQ+HigBFdtZHHEJsoXlm7aTRg==
X-Received: by 2002:a17:902:db03:b0:2e9:502a:ddbb with SMTP id d9443c01a7336-2e9a6c201f3mr70422375ad.45.1792422628968;
        Mon, 19 Oct 2026 08:10:28 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1501e25bsm2625435ad.45.2026.10.19.08.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 08:10:28 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: mpfs: Fix alarm register word order
Date: Tue, 20 Oct 2026 00:10:24 +0900
Message-ID: <20261019151024.2232338-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_081031_221902_3412C230 
X-CRM114-Status: GOOD (  12.80  )
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mpfs_rtc_readalarm() swaps the low and high words of the alarm time.
The RTC core reads this value during device registration to initialize
its alarm timer. This can populate the cached alarm and timer queue
with an incorrect expiry time, or leave an enabled hardware alarm out
of the timer queue if the decoded time appears to be in the past.

Read the low 32 bits from ALARM_LOWER_REG and place the masked high
11 bits from ALARM_UPPER_REG in bits 42:32. This matches the layout
used by mpfs_rtc_setalarm() and the low/high assembly in
mpfs_rtc_readtime(), so the RTC core imports the programmed alarm
time correctly during device registration.

Fixes: 0b31d703598d ("rtc: Add driver for Microchip PolarFire SoC")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Tested with KUnit under ARM64 QEMU using RAM-backed MMIO and the actual
MPFS RTC callbacks and RTC core registration. All ten tests pass with the
fix, including importing a preloaded alarm and checking its timer queue
entry. Four additional tests covering current-date alarms also pass.
No physical MPFS hardware or suspend/wakeup was tested.

 drivers/rtc/rtc-mpfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
index 60596b0ea9d8..6616ca1f02c7 100644
--- a/drivers/rtc/rtc-mpfs.c
+++ b/drivers/rtc/rtc-mpfs.c
@@ -131,8 +131,8 @@ static int mpfs_rtc_readalarm(struct device *dev, struct rtc_wkalrm *alrm)
 
 	alrm->enabled = mode & MODE_WAKE_EN;
 
-	time = (u64)readl(rtcdev->base + ALARM_LOWER_REG) << 32;
-	time |= (readl(rtcdev->base + ALARM_UPPER_REG) & ALARM_UPPER_MASK);
+	time = readl(rtcdev->base + ALARM_LOWER_REG);
+	time |= ((u64)readl(rtcdev->base + ALARM_UPPER_REG) & ALARM_UPPER_MASK) << 32;
 	rtc_time64_to_tm(time, &alrm->time);
 
 	return 0;

base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
