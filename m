Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C46C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Sep 2022 06:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIKBjfuT1+BAvWETaK6qifuzy46E6JUik8BJ4avmYi8=; b=yA6VPNCe6ZNVeK
	3a3g0wshmZhqoWTvJyVgunW/mI6R01sCfBJ1dxVgFT2HdEMYdp5GNwy/UuyRFyJ7HmUY/Tp+qyHdq
	q62UCQBDrZ7USmpXIq2GiC7vM+nbHHglM/qfqjffPeE927lEJFyFVBWFGpdAVautGytdRicpgKPhc
	b1Vtk344JSuJHlIyjHBjE4VAIpx88XCbUJlWsjc43OmqacX1/6y6KAcGjftqMynDgPhaLxaBzdT1F
	kShhEZdIMNwvI+qux6oQC/3evLa1kVOGd1p41j8oUbx5HyCvCiDLBYsbA+ocUxlGFq5wqROhzxiXI
	6o5FPPSr6swZMYSD9kaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXzFm-002sZ3-Qp; Tue, 13 Sep 2022 06:18:38 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXzFj-002sTX-UD
	for linux-riscv@lists.infradead.org; Tue, 13 Sep 2022 06:18:37 +0000
Received: by mail-pj1-x1030.google.com with SMTP id go6so6068730pjb.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 Sep 2022 23:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=viUsGW+Zs7kQMJlix4q594CqGsU1OFW3HynVNHA2iG8=;
        b=bFFEcnl9GlVMuRvNsEeFKpPtnPkLtYPNOLwDpmNghQf1y4tyfewadzjyK2i2z30JdS
         6uRB6cn7wK7cGWkU5WSDP2Zob0KONnKqSbcxE0cQCnXsBFhZdzm7M6Sbw4/BOMSZ5jXE
         dRBi1T0zQHsL4YI5RhEnOxgTGNyZPCmkq9yy+5fBuBurilD0eCeWCsVQnSlj2Eq05Scb
         7s4i2Mvuct3albarrpaRaDtzwJNNaJw8THouke2Z5UUK2XxCn6CNUn6B5m5w5/kNmaSx
         7FhRFVonvhpdTNfL70koPBwS3/VQ3yUQmN+vWEynUEhGr80etfTsYwuYjhKDc1BNI00E
         ZD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=viUsGW+Zs7kQMJlix4q594CqGsU1OFW3HynVNHA2iG8=;
        b=uJMbC9Hl0Nnmk8juszqknfg3bqhfZGqlUzKw1WbquD2uM3ThVynCkSWr6eNXZZICGq
         /ZklEfU6lgyLvWc6x6k6or25A/eSXNx5ghiv7dQKG0umFpFwz08ZTJ/FwDus6hz6411/
         WZQHkrOGuGUNyDSsvkK85H1CAsyRF7JviNJ0DErKydSBFwave0UwVHKU8fOFMy5EwoZJ
         3Ghw23Peg0p8kZpzbaJRkb8hfqyY5q4AZ5DkvACrrcgE7ysjGAiO0WcFnp+qZLpnpHXG
         OufG6lKE30FrRX1tSw5vNTHY8ezD3w6yziMzCNNTTBRNKGuVEKgjJRwFwZhFhISmIVPg
         EAug==
X-Gm-Message-State: ACgBeo0K3HOVkZ6uJR0pubNJlZs7iV1UgstQuJk54myB4sRQ8l0bDVso
	QbWJi+py4IJEu3RKIUlgtFFolA==
X-Google-Smtp-Source: AA6agR7/o9dIDnH1RZM4XVMGUT0tpGsW6QtShNVPvZNx9Gmgd6Z53HFEC1/Ub6/GFAVuka4GUvyfEA==
X-Received: by 2002:a17:90b:33cf:b0:202:5183:c1ab with SMTP id lk15-20020a17090b33cf00b002025183c1abmr2236619pjb.117.1663049913123;
        Mon, 12 Sep 2022 23:18:33 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id z11-20020a170902cccb00b00173cfaed233sm7296332ple.62.2022.09.12.23.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 23:18:32 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	ben.dooks@sifive.com,
	bp@alien8.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v5 3/7] soc: sifive: ccache: determine the cache level from dts
Date: Tue, 13 Sep 2022 06:18:13 +0000
Message-Id: <20220913061817.22564-4-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220913061817.22564-1-zong.li@sifive.com>
References: <20220913061817.22564-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_231836_007511_F60A1702 
X-CRM114-Status: GOOD (  11.78  )
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

Composable cache could be L2 or L3 cache, use 'cache-level' property of
device node to determine the level.

Signed-off-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/sifive/sifive_ccache.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
index 949b824e89ad..b361b661ea09 100644
--- a/drivers/soc/sifive/sifive_ccache.c
+++ b/drivers/soc/sifive/sifive_ccache.c
@@ -38,6 +38,7 @@
 static void __iomem *ccache_base;
 static int g_irq[SIFIVE_CCACHE_MAX_ECCINTR];
 static struct riscv_cacheinfo_ops ccache_cache_ops;
+static int level;
 
 enum {
 	DIR_CORR = 0,
@@ -144,7 +145,7 @@ static const struct attribute_group *ccache_get_priv_group(struct cacheinfo
 							   *this_leaf)
 {
 	/* We want to use private group for composable cache only */
-	if (this_leaf->level == 2)
+	if (this_leaf->level == level)
 		return &priv_attr_group;
 	else
 		return NULL;
@@ -215,6 +216,9 @@ static int __init sifive_ccache_init(void)
 	if (!ccache_base)
 		return -ENOMEM;
 
+	if (of_property_read_u32(np, "cache-level", &level))
+		return -ENOENT;
+
 	intr_num = of_property_count_u32_elems(np, "interrupts");
 	if (!intr_num) {
 		pr_err("CCACHE: no interrupts property\n");
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
