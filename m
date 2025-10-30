Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310C2CCF9F0
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 22:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N5oBuwbYZzWqHG+NZqtgTm1CZ7vNugmRQHMWSoA8T3A=; b=2JeynpRo7s5yr7
	x1EoU4/cmQvhHZKFCKb6h1bq21BzOtxTLyYvJdRnwOZwABP0ob2ykMqFSiFbA94aCg4JJJjYni16L
	yWPcwLkuvVtNDeqjsNEROfU5oeODF6JovOT31eOCCl2ceQ2f95cwSj6RhdAiBai2WR6VSGsuJmqLs
	VHGWIWvtO12+GJKek94NM/g/SSEkmPBGU/tVZEQv4th3m0NActVL7rnZKrjAFgu6PDrOIagZ8ViuK
	wSvICuAfnDvxZkdYGIePX7EIfocQXxC/jiEXCpmm4y1oW+hqI3apkDHexTDjd4pSuUNmTZESKrGnD
	Xf4F30uxUg5T1mQMvO+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEak4-000000051QF-0BRb;
	Thu, 30 Oct 2025 22:03:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEajq-000000051HB-2QoU
	for linux-riscv@bombadil.infradead.org;
	Thu, 30 Oct 2025 22:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=UIkVe+mugmsixDMdOtfVXmcZx3cul0N4BhQxpoGzDAo=; b=bZnMqQwgMDKIwwIkgCdu10FBgf
	Ku/OlL08QYRSsNGeqCUzpQWB+mqGLubJIZ8kJF85oupoxm1uIt/v3tbGdh6HmveZplmH+dOTxgqst
	thmi71g1EHquEZeMrrkS+SgZ5J1PiweecqO7HipIpA0xMTsoqARQSj2b89/2YYFy/RHvkvxyVokhQ
	ZkzpHoBS8wTKLm+4K6y6z5xh2NWnv6itEJ4vOmNNL8LY1gzcAy9m02r/RWPqcF7WnxxhQLVx+0Uur
	yJa9Wz0WTfaduCRhaH6SpiIyXlrv1LQhHffA8I++UAHHaHJGe3MV8PDLVmJp4u18CKdryCkihnCOI
	SJ6T/8jQ==;
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZs2-0000000A5jJ-2Uez
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 21:07:49 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-945a42fd465so66190439f.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Oct 2025 15:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761861795; x=1762466595; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIkVe+mugmsixDMdOtfVXmcZx3cul0N4BhQxpoGzDAo=;
        b=wS1HMKFqBoapTEnLbW01MdxfbtrkJFzV5E7CPe04UuQJjgQaeEWkRa3IRDdIk2yXaa
         +OmSSc+f24NuRIR3SU+fHJIUYnwPWqZasrN8pqggM6z99LigiHLT2bFLLXVVOiSzEfpK
         E0Hs65eMh4yC6ujre0bOvFKuGUfFi6IhHTlYQc5WB0jDDtne5/5zDCbbpG5diuSlFiX0
         BdxaAMQA7WFYYKdwkSO+r/99yNMH1q2UGOQyMiKMZIIqJ3oXHrHbpb5DgbFRf23Exjeq
         KyfGlpJ/4aM6mU4WSfryTFJkDbdD/OrPdRGdaWGFFRLo7Uvo3Y/HIkZpIew+7ecsscld
         7hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761861795; x=1762466595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIkVe+mugmsixDMdOtfVXmcZx3cul0N4BhQxpoGzDAo=;
        b=ubnGtERM1ii9te3FqsCxETtG6lrv1mfdIf04ZoruFdIbMOKzSrgKSRBRzHc7ZlQf3o
         hO2Qh3M5rm9zvZLCb2c2WSBt+yBWOzOyqtNKg5DYMHc1/mNegE8SEN+xXtQSqBtY7rGM
         6wXdvEA6NvX7n9/3Jcjo6kHQNOEKrH9ioBYfk2CggugMR0ydzNHUe4+ncNsYnatUpgTt
         7QdObD2dRKUt7J1+P5AYJrs6bIXtl+7qeS3TWbR1+nW441Dk6yusbyBQQocM2UCNgKUm
         unuQA74lJDKIJI444rU6Lb07UbFQSxOr7w9KzpIgv8jLAxj0NuhqJ/oISVpbePAF3cOx
         TaJA==
X-Forwarded-Encrypted: i=1; AJvYcCVXIx3j46l54J2VDKrv+uCZOenPSE8ka9WXeiZKTZzOXIJqXwaH87DoqEUfLw5Rze1kqtndMunyU7fg7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxW69kRAxvyZq7PgFc2Q2bmHnlbRljB4Denz3xC2pRiB6T2fXQW
	X+9G1LHtouF6iGsxMK+s6aRowqQIR6zn8pqoBP2+//iSQKo/ddrFhfbjlya4xWad2Jk=
X-Gm-Gg: ASbGncuk6VgyVhTO+mytOnQo52ifC58xYm+OyRWAH+sZJ6baRGl8CA0TaWq/U2RF4FR
	8KSM1W5V3U0JpX18bo1D4oh3xQOQhWJJPwlvuvQcbCvwb7LpNNnF/9BECWbeAQggR6b9TJ3kEN6
	kuH2cDlU6Mr/lm8LVvAkgbmMYJ2NrrSKx+RIH50F75H5W30ScKkUGWIcjJZfv304MW7Ddo3m0uS
	Yhc1RVbNTHEpnPoS1HgNWxHolNjhHXDJaHDkkdWOBjZRyksXHQ1RZpOCDfX24oe3HgNQEmaosNc
	zp7kgWLvRdF1VxIzbuR6yGrqEpCPrniTsGRbzGahV5xK4lCvd5OzW9PsAdUakkmPR9s8DdbfvHr
	isONNAa6SKqlDb8e7yCXVFdRisdBFPDeuLPMWfIHamS8h8hWJ1B9uYHHME4YkLv5RsXBUhMP9Tj
	kzbGratQ1K0iHnD6B/EjKC56MY8q/jb0C7opoDEWPVyt+IAuNWmJ8TdQ==
X-Google-Smtp-Source: AGHT+IEzkYNTEpto3uIRSZZUgywIjzKs10kSZ3Mcmn0s8szOm71bDrPz0GaeszZYMuu8RaE0By5r4Q==
X-Received: by 2002:a05:6602:2c01:b0:940:d7cb:139a with SMTP id ca18e2360f4ac-948228fff16mr274845939f.7.1761861795055;
        Thu, 30 Oct 2025 15:03:15 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-94359efe149sm604118039f.13.2025.10.30.15.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 15:03:14 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/7] riscv: dts: spacemit: add a PCIe regulator
Date: Thu, 30 Oct 2025 17:02:57 -0500
Message-ID: <20251030220259.1063792-7-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251030220259.1063792-1-elder@riscstar.com>
References: <20251030220259.1063792-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_210746_971713_72AA7A59 
X-CRM114-Status: UNSURE (   8.75  )
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

Define a 3.3v fixed voltage regulator to be used by PCIe on the
Banana Pi BPI-F3.  On this platform, this regulator is always on.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 33ca816bfd4b3..a269c2cca3ac9 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -33,6 +33,14 @@ led1 {
 		};
 	};
 
+	pcie_vcc_3v3: pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIE_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	reg_dc_in: dc-in-12v {
 		compatible = "regulator-fixed";
 		regulator-name = "dc_in_12v";
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
