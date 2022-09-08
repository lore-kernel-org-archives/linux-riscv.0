Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F285C6FA86
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 14:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PuuuITvs+qySY/ufP9jYNvsNcfuVPoQcb66LDgNCNKg=; b=AhT0CnVtIGX3FJ
	7wzzPdAcFUH1oYWangGL2Mg/4ADM2n3KGn+vGkwHCR+ppNPFRcu6k2TAQyavYpE2e1ztlh4t3gJMa
	93EjJIphTvMkJreKcvNx87DE5WqJD1CL//6Od/o+ZfKX52vjiWTi0e4MIj/e6v6w01KZHEEpf8Hdp
	usxVv3lddYXzMiGjrVNOxXXe1UFbiZZiiwgyowsQTGMXZsTB443M48akTpK+LNYDAwqFLVnEgN4lV
	nX+KLfTuG0MN8X+wjM2rM+BB26mbVOrcbDBeey/hIHAG4W1SuYe84hewXscoGXctNlTLiEIbBR1Ud
	/F6F8uIr6jgTDujfnWpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWImB-004qi1-20; Thu, 08 Sep 2022 14:45:07 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIlm-004qJq-AW
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 14:44:44 +0000
Received: by mail-pf1-x42c.google.com with SMTP id y136so13206103pfb.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 07:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=wbDb2kYWAgkEIDQJ0UPQIA/ni5c6F+53yNgIrgtwFqg=;
        b=RPY6YbXBMfH6OjFQCvIy89jlsC0KuKV5tW0FbZ+TIVdlcGl3QeYd+tWC9H+HQSlah5
         MSg6DLrxaEIPFDl4i8nXe/D6YWR8XkalmkKHlO48poWzIyuls1jf+Z/bGkOxFwv7XBeM
         HF+evbgdHPBfYvxGw0fnwmSzw5jPSGU586SQAVLr/ow9mTtsIpxCb2cT8ULwLIdwhyCS
         r9FDWOU5zG5K56WgQnPYTcjpg7hCQwAHhk5GWZcuaaJ0PMLNGClwnH/m4Fpl63FExsKE
         bDfTOdiXd8+vEKpnPwZKn/dnWiuXJQO/jZFOpWbOj0kLZ7lTcUaJEADeeJpchHB/Rp4W
         rOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=wbDb2kYWAgkEIDQJ0UPQIA/ni5c6F+53yNgIrgtwFqg=;
        b=ZQfmgGanmppBIxda1qoJximxo7Ns4FL9A5Z6okW7dABZq085RdsJuXSpHt2Ck0ysYL
         wD7CrLsvtgelk9gJ4fSLSuQ982fWAYRgZ9NGrt1L49HfEMIifX551rKuaRAzPXqw6vOS
         4t7PQgzbYHnUX47xurHzXY0Pzm0gl8Ub5cAd8i31h7+Yr1QYBzOfaq56giRMLp4Wn91i
         giphzODIl8xHVcdUg9biG9YwWc+RRUpbdAXDsT0EpfNU3lCscimS+MYBFqRNOd7JrAuK
         oTAVWU3591K1sAkOTJ00Wx0Z3bOUJcgwR8maU4FdN4dCNVGxe2aU4drOR3uen8L/S77K
         PORA==
X-Gm-Message-State: ACgBeo19ttr3TPO4msbAAsjQhFwbCtR6b53+hBylBWfl2Hhhx2fvv1io
	jB13DdTRmO8fEzCZKFvPKOBCHw==
X-Google-Smtp-Source: AA6agR663AyOqfGUkOT49zEGbKqr9aPBFRFvp4ECi5xXjdQRyEI1Zr+ZkPWMBtnpfODNRLJFqlEmng==
X-Received: by 2002:a63:5b42:0:b0:429:d283:8a51 with SMTP id l2-20020a635b42000000b00429d2838a51mr8342571pgm.610.1662648279862;
        Thu, 08 Sep 2022 07:44:39 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id b4-20020a170902d40400b001750361f430sm4484728ple.155.2022.09.08.07.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 07:44:39 -0700 (PDT)
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
Subject: [PATCH v3 3/6] soc: sifive: ccache: determine the cache level from dts
Date: Thu,  8 Sep 2022 14:44:21 +0000
Message-Id: <20220908144424.4232-4-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220908144424.4232-1-zong.li@sifive.com>
References: <20220908144424.4232-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_074442_378791_B5237C88 
X-CRM114-Status: GOOD (  11.91  )
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
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 drivers/soc/sifive/sifive_ccache.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
index 949b824e89ad..690c19489317 100644
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
+		return -ENODEV;
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
