Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9124EC36010
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 06:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FQ0Z/g5u99vuOa9/oQeppfTBTWRmfaLs1k6w69d1/Ag=; b=XHwv8ToO4mGldT
	+D/rhza0hBMH8U8cJ51bhPJZPhG5G4hWEYq2xAOX7CCbQe+GdkJZrni+YzW3rQ96hLrRoIL4x8wqE
	P2/BKQoAyFTDtUVtZ6c1cNxpJTSxZlVtDoC2r63bY/pqY+TmSoNO0YDVPNbL4iQFhpdnDCxrz17v4
	p0xQLVrAkSJZ6FwSSEtnlVB8APZbHyM/SS6+b0/PoUYhDGWBVw1qRkSabbWHgPgC2ntG+N0bqjxIF
	E/00vgJvaAexm+4ifl7+qpw+Qv92ZeyMIdeTyoig2lWJwUgUdH/p2Fk0mINV8m8JIOlOfrsBnETgW
	cXgwy4TSy1sfS+w1pQOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0aU0-0000000AsGo-0Ejn;
	Fri, 04 Apr 2025 06:24:52 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0aTx-0000000AsGU-0q9L
	for linux-riscv@lists.infradead.org;
	Fri, 04 Apr 2025 06:24:50 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-22622ddcc35so22441155ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 03 Apr 2025 23:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743747888; x=1744352688; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=NPra/uVu0fwMtbsOjosnlZ9oVdxe4EQdPHbqyirBHx8=;
        b=ml+FN3SvZC54MGH3NpkJcq/qJXLZIw+Hz/E89jf8scQRpjjr+ytYdRCqOfEuyeqmqe
         IJv+j4JQZpJMgSaCv8QTOKSNbGZeCvefuctvz4qfJ9ImE0w1Q9TjkDfTDJMil3QByGQj
         Bmj6EvrsX4HT0J+awXizhlD2x/DOyYTNQYGaARRlduwT2EHNQoSySRwzK4T9TlDOOlJw
         EGUVHKYkcAAfWVSusTBNZj29tp25kTQeny1Rz2qRSRaLcLQnCcwVZAtUQdAQLJB+GV+u
         zn7+VCOmiCK5cpIdRo/aXRdJ+m36/0UKKMUOzEDJAcUg02HTeSrjAwF5Y+5C4jdEjDwO
         XzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743747888; x=1744352688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPra/uVu0fwMtbsOjosnlZ9oVdxe4EQdPHbqyirBHx8=;
        b=D4BzMnPWP6yLvttFjVcUxPvxJN/xbmWdYthlHwGuarRhosGjqlMWihwjmsjFWcxtdC
         xJNyHiD5X8CO/1AHhdqvkZ+ToO5Ig8JSNis14ICWtjReXaDFj3rhL0JzayxxrwI/UHzv
         CdVrqVfS1LphAVtXvEjaG6t0AywGyELJKymfaF43TzItpw+JOAWaIRy/I7Cgmq7q5jv9
         op0q4cHXONWeKHkfIqMQ4KAaDykyDE2TcR1x7u+Yf69Qv73FDVyxx6P1sC/I91bfq56D
         EyJZK3k+5PuPM5vrub18eKkRhcDJSV6Dy7DubcFJkLLYFLHs2fJVVN0uuxy5SRL43OZK
         Rm+A==
X-Forwarded-Encrypted: i=1; AJvYcCWhGh3eVPIXGgoSI10hx6Ewwdc1P15EWzJPaziV9Bjj5iTcJyDqHLnXlgGAWpxgF4+n1YFn9ycwhqSUlA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6JsGIFZchE1zLNNgAK1++U1SI1AsICbfk34UDYohvDX6y70XB
	4nR5CstMkhMOEif+GLWuTEp7iTtj4nfbJaLz7j3RAq3yAadyRCEY
X-Gm-Gg: ASbGncv0roq0Zw7EPqZ/MTmgRfK2lOeTlAZgIy6gZOe/HB2VJrljg58KFQWV1TxbbMB
	9pxV7Vek51KRzQmniDzRnPiAQcsbb/0SukMK1l//IUUtHaSy8ltjBDISDn61EZN2jvSevK4jDEi
	oRs+fcOUD4VAweg9QrgkhX6I96Ve9IdpfqCgQnAIkVisR5MRu92Vnk3mnTJf3goT5QAkvfdpdoh
	sndTk59eeONOCtUuFtxLgGDjeYkjLt6OBm3rkxcgFwxUwN+DRKw72W6c3YRO5vP1mceIKNXRY9I
	lXWvJKdQbINpe4EJgH/JG4Ht2HPW0i31dRU6ByJRSvAH3cQJqMeMMZ3J9S8eJCP4uQ==
X-Google-Smtp-Source: AGHT+IGlEMzFNshDYRcWHZHgPFdWgnLcEMulJT3Fo00NHacGGpbppTsHCnm6IDXPxXPiYmt5FtjULQ==
X-Received: by 2002:a17:903:3d0d:b0:224:7a4:b2a with SMTP id d9443c01a7336-22a8a045ceamr28350255ad.11.1743747887734;
        Thu, 03 Apr 2025 23:24:47 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865dfd7sm24817375ad.136.2025.04.03.23.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 23:24:47 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Hal Feng <hal.feng@starfivetech.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: config: Set MEDIA_SUPPORT_FILTER
Date: Fri,  4 Apr 2025 16:52:34 +1030
Message-ID: <20250404062235.671872-1-joel@jms.id.au>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_232449_239271_08C674B5 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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

When Hal enabled MEIDA_SUPPORT in order to add the VIDEO_CADENCE_CSI2RX
driver in commit d8a7d89abb09 ("riscv: defconfig: Enable StarFive JH7110
drivers"), it turned on a few hundred (254) other MEDIA drivers.

The subsystem has a option for this very case that keeps the other
drivers disabled: MEDIA_SUPPORT_FILTER. Turn that on, and
MEDIA_PLATFORM_SUPPORT, so the CSI2RX driver stays enabled.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
The filter option only appears in a small handful of arm32 defconfigs
(and I maintain a few of them). That's because MEDIA_SUPPORT_FILTER is
normally enabled unless EXPERT is on.

The root of the issue is the riscv defconfig selects EXPERT. Most
arch-wide defconfig don't have that on. Need to get to the bottom of
that, and perhaps disable EXPERT?

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 0f7dcbe3c45b..c34fcf2c6a2f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -182,6 +182,8 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_AXP20X=y
 CONFIG_REGULATOR_GPIO=y
 CONFIG_MEDIA_SUPPORT=m
+CONFIG_MEDIA_SUPPORT_FILTER=y
+CONFIG_MEDIA_PLATFORM_SUPPORT=y
 CONFIG_VIDEO_CADENCE_CSI2RX=m
 CONFIG_DRM=m
 CONFIG_DRM_RADEON=m
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
