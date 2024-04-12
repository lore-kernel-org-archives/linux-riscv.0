Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A98C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 08:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zByI+V0xO6h0P5yoKW4ainRuj+CRW26fXcLgN5s48yc=; b=wuEFBkSyxMbU28
	Y2T0zhHKdtnXNP+/sXSrjzXv1CIrFsUnBhVaw+EMrVSV1P0JlbDNTmfCnoagcfLvW5glAzq/CTzvr
	yq4zLVtiRZSmBkD4NqctJFg5w5giaOFyqpAeASowJ9hni3F2Y3r9IMsadJPSgUo0+YEVv+M5X2bV+
	JUigBaeQ6NppzCureqAe71/3bG9rPA/MXbA9i9e+RxxBkGjGNQJ7TTaPmkIrxNVt0Wfy4SvcaTYqU
	7oF5OozBJmZklRStJVvZ6OhYGSB+wDD/arADbzV3vVR9APLbjcEHx9K/rQj+ZGbmOj5dpnEXpzcm0
	r8wuShhNcWbcivnLxuEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBsR-0000000Fy2I-0mAQ;
	Fri, 12 Apr 2024 08:03:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBsI-0000000Fxv4-1hrC
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 08:03:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712908985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=imYSfgUV9tShp4d1ydGnn8vza1QDI3KMYtf8eE+SzCg=;
	b=ONhd/wNlRBjphU8pO6/RaMVg2b0xrTz7INDEShrfD7k30g0YIrlUKRKdgzxEVKu8Kyj2M+
	7Tzb8csH8i7l4yYAGJGz8IQo99fv+Fd42idiaHOIj8Ukw1AdFYNfrmu5G6uQ0yby9dTKtV
	M/3pQ2G3SOOgj2/ceZJMcNClceMYHq8=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-JQ97svncOJesOZei7DhvNg-1; Fri, 12 Apr 2024 04:03:04 -0400
X-MC-Unique: JQ97svncOJesOZei7DhvNg-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2a2e6197371so630550a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 01:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712908983; x=1713513783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imYSfgUV9tShp4d1ydGnn8vza1QDI3KMYtf8eE+SzCg=;
        b=UokwkHR4BsYIqPKd7LcIjhA4wfaKt9/p7+oaOXetd9mkU07TH/KcdJ0gYai+r2n0Ak
         10JDyUvBXjfhoO+tSewbLE5elEdMZrwfmfg4fCY+8w72rO1oPcWraC7BBlWWpEZRf7Xh
         IMmWmmtW9Klpe20ojJC+g3iFC9W2t7JTtHN0IxnysNn4gAv9Gx0Yh8A6Cd2FRCHbXkUK
         Yyg6ByL+4KSmaUUuFPga/kzMI031+wdSqNmpARdM6KxtG6o5eRi3IfRb3rhW1enQO0io
         oj+ItlNlRpkNT0qsyn9vhMTXjyF5957ywuWNt76ySRT3wXs23ChKwQ7zQizglk9jnk00
         8mCQ==
X-Gm-Message-State: AOJu0YyTzZBeFrW0EKkuOgJO+wqE9HYdhiUU2nf54X3IFYCb7aRPimG4
	wDOz3aJw+MHP04alQmaRMHXzhQnWytUztljUzU/2wSkkZpq2APHbt+OcJ0gFqgp1WqEO74YOftK
	hoLthtE67eeCie/JebfwgdYRbCxDSd0aBO6IL/aPAeikzK79tzjWRIie3YMvaFWcQig==
X-Received: by 2002:a17:90b:3149:b0:2a5:2ef2:4ce4 with SMTP id ip9-20020a17090b314900b002a52ef24ce4mr1583956pjb.41.1712908983319;
        Fri, 12 Apr 2024 01:03:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgFOZohr24G1rXc3Bo3/PYBVjDbfNE4fUPuj6ECJPGPkq7S6KSCCxgCSovuRZVguBmCNTFpw==
X-Received: by 2002:a17:90b:3149:b0:2a5:2ef2:4ce4 with SMTP id ip9-20020a17090b314900b002a52ef24ce4mr1583940pjb.41.1712908983043;
        Fri, 12 Apr 2024 01:03:03 -0700 (PDT)
Received: from Samantha.redhat.com ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id c9-20020a17090abf0900b002a610ef880bsm2601514pjs.6.2024.04.12.01.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 01:03:02 -0700 (PDT)
From: wefu@redhat.com
To: jszhang@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	guoren@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Wei Fu <wefu@redhat.com>
Subject: [PATCH 4/5] Kconfig: Enable APM X-Gene RTC for XuanTie TH1520
Date: Fri, 12 Apr 2024 16:01:46 +0800
Message-ID: <20240412080238.134191-5-wefu@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412080238.134191-1-wefu@redhat.com>
References: <20240412080238.134191-1-wefu@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_010306_586377_61299177 
X-CRM114-Status: GOOD (  10.50  )
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

From: Wei Fu <wefu@redhat.com>

This patch enables APM X-Gene RTC for XuanTie TH1520.

Signed-off-by: Wei Fu <wefu@redhat.com>
---
 drivers/rtc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 3a89f1e6095d..b219aeef4ce9 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1880,7 +1880,7 @@ config RTC_DRV_MT7622
 config RTC_DRV_XGENE
 	tristate "APM X-Gene RTC"
 	depends on HAS_IOMEM
-	depends on ARCH_XGENE || COMPILE_TEST
+	depends on ARCH_XGENE || ARCH_THEAD || COMPILE_TEST
 	help
 	  If you say yes here you get support for the APM X-Gene SoC real time
 	  clock.
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
