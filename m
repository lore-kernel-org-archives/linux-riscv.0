Return-Path: <SRS0=1JZA=NQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E95CC4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 13:06:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F31F361037
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 13:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F31F361037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jhb7RCU7tja/29QRhVBREFdj1F2UbU14O1FaSjZ4hDI=; b=RwkSJEMDO61G32
	cFAz05Lppuw1XDFJVum8nxiJftK972XJ/YJfNPUKRifjffHsu2YURhxIL3bb1GqUSY7W4X7amODwD
	IonbEeovdTbe5Auc7NErLnfnzvgjrJTB7NC6eQN5lQgNZBoPzRZz5d1sNvVT+S6/0JqIKH96rX3eD
	sORWH1VGzS+Wm1DFy7zfDSAdOy1+3gTI/mGBVa1MQa6e0u7lnwP3jQHqYT9L4L6Bv5qHDqPxXxbhe
	OrPd7oKfWLyZiqiVICH+0JZyFF4Os6Na3XTCzt6PXUghu07mGBmDU6HrXKeVNbgBMV0gCeA9BdQG1
	HMIRVpf6KfQN0LvdMgFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIsbO-00713K-2z; Wed, 25 Aug 2021 13:05:58 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIsbB-0070xE-GG
 for linux-riscv@lists.infradead.org; Wed, 25 Aug 2021 13:05:49 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BABD24079F
 for <linux-riscv@lists.infradead.org>; Wed, 25 Aug 2021 13:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629896733;
 bh=j2CmHETEfQosnB82At+fI6P+jueRuH10iqGIAMLDsaM=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=pE2rOQxgnhKQaMM1oYgkR9xpm0Wsknqh3p9i5dsxPD1WMIikCINpjqn/N2BkUW/WE
 6monqQx/dtdIXMBe2/eVoOWIm00u5PEFLWGwTB9fEmdMRhU99WbcwTJ/Fu7rKHczi2
 nDuSC4/EE6g9ATWyXbuEAs9o6DrHeLBt2i6AnxN4PYC/5A0Q1ycTxZDJjvVIa5J1xH
 MC8KsGMi2l6Buc4wBVPrJWir6X9R29F+qrrf8WV5vEWgRrfpVanYnp6zGBiPuVa0KE
 iY8ZNjiIiLjj3uGRatGcSJPGd+JRULyixkCzEAaeNaIV3AtNMM7B6WCCgbOjQpTEtw
 3Th2wKfdC+zyw==
Received: by mail-wr1-f72.google.com with SMTP id
 n18-20020adfe792000000b00156ae576abdso6554583wrm.9
 for <linux-riscv@lists.infradead.org>; Wed, 25 Aug 2021 06:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j2CmHETEfQosnB82At+fI6P+jueRuH10iqGIAMLDsaM=;
 b=M3cx0067u0norcgMovxkV+FFFmuoqr3jIH3/XDvG+fFEUV+RVvs3pSLWU7CAnYkZ2d
 AwALULK6i+TTe7fvpbjN8eHa27WumTFK1J0Knkh90TgiG9vf4cGXYOJDcXIwUxWdxA3i
 SyAQSMKd2PKInufKJ8uoMKstYctvQZYlgBNfig2xXEvO4In4CxbEP9A2ckNhDOqDIlw6
 WA2uEHWwvUXCbO9GPep4ZXY2tyBpJk0avxDyi5mSSsVJ+hWp4R8qpWydTh7V0uScZg8p
 ctjf2pbBqVe7QkhsUD7BULgw/cgJq5+9T4IComaAEGghw0QDPN1ZRBFRmLOTKlA00iS0
 1eLA==
X-Gm-Message-State: AOAM530+5MFB4rrCmNFseKwencGidJVbB0JGu23uZxTOSs4aGR/QspLR
 4z+QowN/bLQlwrVngguCQxVwbbumwo8jxvclTL5BzOEowgCkedaUhKoE/kOHTDOsuriUUzNVsC9
 rCpGSakCIIEd1ev7saJp9ydaLVj41anyoX9vbq4sXl+KFQw==
X-Received: by 2002:adf:ef90:: with SMTP id d16mr24968962wro.75.1629896733411; 
 Wed, 25 Aug 2021 06:05:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSrseSsm6RkTsqZky/uo4GWu/U5U79W/FAF0KF5t1wAuV+iuMi36FtNc38uo3ZgcvIxS0KqA==
X-Received: by 2002:adf:ef90:: with SMTP id d16mr24968941wro.75.1629896733265; 
 Wed, 25 Aug 2021 06:05:33 -0700 (PDT)
Received: from localhost.localdomain ([79.98.113.233])
 by smtp.gmail.com with ESMTPSA id 11sm5338828wmi.15.2021.08.25.06.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:05:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Atish Patra <atish.patra@wdc.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] riscv: dts: sifive: fix Unleashed board compatible
Date: Wed, 25 Aug 2021 15:04:49 +0200
Message-Id: <20210825130452.203407-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825130452.203407-1-krzysztof.kozlowski@canonical.com>
References: <20210825130452.203407-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_060545_745257_35F95895 
X-CRM114-Status: GOOD (  11.66  )
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

Add missing sifive,fu540 compatible to fix dtbs_check warnings:

  arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml: /: compatible: 'oneOf' conditional failed, one must be fixed:
  ['sifive,hifive-unleashed-a00', 'sifive,fu540-c000'] is too short
  'sifive,hifive-unleashed-a00' is not one of ['sifive,hifive-unmatched-a00']
  'sifive,fu740-c000' was expected

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. None
---
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 633b31b6e25c..2b4af7b4cc2f 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -11,7 +11,8 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 	model = "SiFive HiFive Unleashed A00";
-	compatible = "sifive,hifive-unleashed-a00", "sifive,fu540-c000";
+	compatible = "sifive,hifive-unleashed-a00", "sifive,fu540-c000",
+		     "sifive,fu540";
 
 	chosen {
 		stdout-path = "serial0";
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
