Return-Path: <SRS0=1JZA=NQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB7DC4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 13:08:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D46206108F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 13:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D46206108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzJoLFuYaS412/8JXLFLSNHPd/udOkn/CidoQqPAoAg=; b=gzqHQh090sLok9
	3Hu7dnORuYOoMIXIirfH5La6FUOGcmP+7LQGikgtWhMmwrZi7qUvOFV8eyC0CXEybJJSMEVqGooSD
	Velq1i5lazHGjeZrFADZjM9s+17zsEwei9yx586P/wYC4foMlRIIyybrlvnalbtnRuuqkJ2E3dgmq
	YS3HDtcF9DtZXHO3aZ/U9fvnPVG6rTbgEwy+Bx90aL+i4ayjPB9RO92mT8bmrZ8uoAvOYJINc5vog
	psu8gOuXTYsfcLhAuC6q+pCQ0FlofcqDjkaluHSHvSmbT+wNRx98Ij9RarUbVVVbgvhQ1keJuuegQ
	5bB+iZHTkUzzuy6EvC7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIsd9-0071UQ-S9; Wed, 25 Aug 2021 13:07:47 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIscu-0071T0-Ol
 for linux-riscv@lists.infradead.org; Wed, 25 Aug 2021 13:07:36 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 84F3C4075F
 for <linux-riscv@lists.infradead.org>; Wed, 25 Aug 2021 13:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629896851;
 bh=o56Vii3vIaufxY0yhYD75jzw1vAZOzm1fMDFt3af7a0=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=fJja3WGYNvIORmNbwyJ/tP3npLKl+tpRx/qg9Pt9f8taQXQbCrlYY4iLWThterY/B
 RehMqkohcV1wuSZ6gh4iYK8tXi7XQ8/dcZADvSyA+IVVlN+oqFPI6nzvBL2EE+4MWB
 xCQX4a19ucQLXgikW3pYbt3ARJrabxUmuYr7OTgq9nQy/fsiM827INxZhGRKwhL4VZ
 0PfbsGKxgRAV0leA239Mj9f8bkLCU5u53CvY/HgackMhWWn+o18BHtLPmrBWa+FNGb
 Qx/leAapat5reB4n4OKKChtp3jo4UNpKghyaM05G7pT70ca2C7iiNB1+MI7H4NdkJg
 OavatMlPhcebw==
Received: by mail-wm1-f69.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so5282817wmj.8
 for <linux-riscv@lists.infradead.org>; Wed, 25 Aug 2021 06:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o56Vii3vIaufxY0yhYD75jzw1vAZOzm1fMDFt3af7a0=;
 b=oXt4Z+gIHwzCXEZaQbJOt0hi+M09/lLpl/A1ocalHnhhH2504fiks86Y+wp4LYqmzQ
 lQlYw4mx9ntsBAL5e9yRXptO5Vij5toHNEQwiX1TMA5CvU1V/wqwfI+zy9TlqHBWBqJQ
 XSPr/gqbcEqAecA1v0Ph8JRh2IcbfZCL1qbWPrz4T3oOJc1YrdJea7J21WpDhn7Llu0j
 lRraryiNwr21F+Nl7phVmXQ9IHsiGr3aA7uY1ToJXLQ1//xtevTgMRMKhiwq+4Zl2pJE
 8S+1aWqtMMq/il+3cPXa/knd4IS58UHWMDi4bxFbhyPkttABs8OtmVC735948sc4qO15
 fv2g==
X-Gm-Message-State: AOAM533EqPABFm7IK1nx58tbWyuNqG1+hkcy80Ghpjr2wwFPQBhn57zK
 aTa8mKhHkn7L/Z5PGkq96O3D0cVzf5fIaXOi/eg4VyBm4B3XBokTTUaXcWaPhZLDnThyWYFGZFH
 1rmQX7jaE5wdz+VODaIIgl/E2bLeMEgQBJDrlKWpyfEWhsg==
X-Received: by 2002:a5d:4844:: with SMTP id n4mr9558353wrs.191.1629896851260; 
 Wed, 25 Aug 2021 06:07:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbzP/WWqwkYlUeY6Mf6Rxm0/Z0NF1FU4ZMQ5NiuU2i6Evp8bK3D0s5JVHwwbaNlLo12KS46A==
X-Received: by 2002:a5d:4844:: with SMTP id n4mr9558330wrs.191.1629896851121; 
 Wed, 25 Aug 2021 06:07:31 -0700 (PDT)
Received: from localhost.localdomain ([79.98.113.172])
 by smtp.gmail.com with ESMTPSA id l15sm5131706wms.38.2021.08.25.06.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:07:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Atish Patra <atish.patra@wdc.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] riscv: dts: microchip: add missing compatibles for
 clint and plic
Date: Wed, 25 Aug 2021 15:06:39 +0200
Message-Id: <20210825130639.203657-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825130452.203407-1-krzysztof.kozlowski@canonical.com>
References: <20210825130452.203407-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_060732_979210_0815BA32 
X-CRM114-Status: GOOD (  13.15  )
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

The Microchip Icicle kit uses SiFive E51 and U54 cores, so it looks that
also Core Local Interruptor and Platform-Level Interrupt Controller are
coming from SiFive.  Add proper compatibles to silence dtbs_check
warnings:

  clint@2000000: compatible:0: 'sifive,clint0' is not one of ['sifive,fu540-c000-clint', 'canaan,k210-clint']
  interrupt-controller@c000000: compatible:0: 'sifive,plic-1.0.0' is not one of ['sifive,fu540-c000-plic', 'canaan,k210-plic']

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. None
---
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index d9f7ee747d0d..6f843afacfad 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -161,7 +161,7 @@ cache-controller@2010000 {
 		};
 
 		clint@2000000 {
-			compatible = "sifive,clint0";
+			compatible = "sifive,fu540-c000-clint", "sifive,clint0";
 			reg = <0x0 0x2000000 0x0 0xC000>;
 			interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
 						&cpu1_intc 3 &cpu1_intc 7
@@ -172,7 +172,7 @@ &cpu3_intc 3 &cpu3_intc 7
 
 		plic: interrupt-controller@c000000 {
 			#interrupt-cells = <1>;
-			compatible = "sifive,plic-1.0.0";
+			compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
 			reg = <0x0 0xc000000 0x0 0x4000000>;
 			riscv,ndev = <186>;
 			interrupt-controller;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
