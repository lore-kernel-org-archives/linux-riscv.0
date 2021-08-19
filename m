Return-Path: <SRS0=mZrj=NK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00311C4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 17:03:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC41D6103A
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 17:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC41D6103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EduQWnBwz5hZ/0MvzHjfQP42mQOSawO0zEJQ81lx4es=; b=eVCUKqNW4d6qIH
	1n+ZUrolkXQ1RPKS8uOKwqvK+pJWYPWh8Ize/lt2wdv6u+9DfkNYolJRW1bc/Jmi9q5EYQp9Drbu7
	BzTGANd7rCnrIPwevxFUMaJsuU1kxu84GZrKYuRTMhweWL1VYAAZfO7QFp1jyYaK65T9AqqgHQ5c8
	30RSzt65BHq/e9JwD/Clobd2T6LiyYU3ZTn/WxnnWo6XvMTZbPQtN1a7ltyqW2L/QiFUV4w9XqM2t
	pwX1zmXupK8gaKTb2C/bf0O2B8R0cfVYPsNkcxVmZoOfwa6FuZdAcE7FhWvU2TFNwMiWq301lb8JZ
	IxsiqqoG78dOA4lcz7Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGlRM-0092Ob-OR; Thu, 19 Aug 2021 17:02:52 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGlO1-0091BW-Ft
 for linux-riscv@lists.infradead.org; Thu, 19 Aug 2021 16:59:34 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 36DC1411D4
 for <linux-riscv@lists.infradead.org>; Thu, 19 Aug 2021 16:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629392364;
 bh=z1RQh6TbDCdHTYWqenSZoV+dbCUcnrr2PV0XynCVMNM=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=dfcRDwGQJOYfgEMdu/YSMlD56hOeXFieYa93cLS/bkazxm0UfEu842grcNQCm35B8
 SNdwvrz1HIEsimIwvNA+dbc5kbUNVXYKy9+IsjvdzL6bYUldmVCuZY7x8qC6LmQlMb
 WT1fJY3MqNgrFNpYPC8qIZ1CXEG6sQRJP0DqvtHXEZQfhYIevRe4H9H69o43Lm0Vch
 CfE3I0bls5BM9ldVjJjLN9jrA6YpTST0kSKSIJJQvLTIbGBk9L6pQIZJdWCHO+aJEh
 7FjlEy1Aitm0f4gjhSY1nycuouNt3+Z4KvjhOsENzv/ar9n7fU3JSZ6s25svXJJY23
 hsHx9Y9/XoFQg==
Received: by mail-ed1-f70.google.com with SMTP id
 j15-20020aa7c40f0000b02903be5fbe68a9so3147012edq.2
 for <linux-riscv@lists.infradead.org>; Thu, 19 Aug 2021 09:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z1RQh6TbDCdHTYWqenSZoV+dbCUcnrr2PV0XynCVMNM=;
 b=bsStRxt4uoSX11qgAbEyZH5pzlLDzhkYgufh54+W3j4s7p1B/1+VVFWVGGGylWkCzo
 NlkdZneMxy6WfQo8e/arWltG3ozJiTVz+c9O8Be4nBSBH4Q0F/FtYLzYWstE/9ihlEhh
 nhyT/ml5xq+ApebWdFLJNhh6/TUwAGtJptxz6kWzFMlzY0oUUZN2ynXcCkmMYmlb4ph3
 VsZIL9kw+wJFWRQ/v5pedyZnE4qB6fqAOyCwhYYVJaEfSB0aNAbR/BVnvPj7WW3CkREX
 461liIA/8g485mdthB5hr1f+JnNKaq1FOIgzgQbv817uEUU0R6IesIGopyl3VIcuIdCg
 +KAQ==
X-Gm-Message-State: AOAM533kW24K3bAiqxiItwMHEIadD/J2uoVpRF8VvCx0HIjDsT6+Wg9T
 uXaoE5PoTN2Fkuc6FB7JcxMErlh6s8uKkIJPS8Khm8+Cgb5DIzeW9HVfHojjQ59MDdXZdTdy6aJ
 PbwaVZ3TGTYtPATfETgQ8y2hlTI8Gz37Ov3ZaBXyrEmkFwQ==
X-Received: by 2002:a17:906:4c89:: with SMTP id
 q9mr16811901eju.118.1629392363973; 
 Thu, 19 Aug 2021 09:59:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwN/cjF/lAeY/btLW56iOgt8LTWAswf2EwA7y38kwFtmqm0X0IiH2XLz30C8VuHrDQfV3G+tA==
X-Received: by 2002:a17:906:4c89:: with SMTP id
 q9mr16811892eju.118.1629392363864; 
 Thu, 19 Aug 2021 09:59:23 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id h8sm2023418edv.30.2021.08.19.09.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:59:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 5/5] riscv: dts: sifive: add missing compatible for plic
Date: Thu, 19 Aug 2021 18:59:08 +0200
Message-Id: <20210819165908.135591-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819165908.135591-1-krzysztof.kozlowski@canonical.com>
References: <20210819165908.135591-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_095925_726143_0E452787 
X-CRM114-Status: GOOD (  13.58  )
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

Add proper compatible for Platform-Level Interrupt Controller to silence
dtbs_check warnings:

  interrupt-controller@c000000: compatible: ['sifive,plic-1.0.0'] is too short

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 7db861053483..0655b5c4201d 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -141,7 +141,7 @@ soc {
 		ranges;
 		plic0: interrupt-controller@c000000 {
 			#interrupt-cells = <1>;
-			compatible = "sifive,plic-1.0.0";
+			compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
 			reg = <0x0 0xc000000 0x0 0x4000000>;
 			riscv,ndev = <53>;
 			interrupt-controller;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
