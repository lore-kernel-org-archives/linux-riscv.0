Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324FFC388F7
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:14:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE3C620704
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:14:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SiMhidPZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="DAPApllx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE3C620704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LIx4CuhnMcxK24jNGep3YQS4coSQUC1ov6pbq+w039c=; b=SiMhidPZPoSVSIwpRJ4404pwy
	pxqGzq0Z6uOx1yaZdwvxW0jMna2j3ZYrk9Ej3WkdCxnI4odgempK2yJ5PIC92sE73FI579iyLL0f/
	E6A0FpaAqwjlLXjd3AeyhkwUMgRWd+8sTkkXKUYt2242JotzkvSWezGrL6C2kR5sKAq9mtKWovF9g
	YKqz9IbBJYhMn4WzgRCqy5GvaAjSSXLZ9pqEmR04KwnrPyBGAECaar9T/qo/AfEihHYCypvjXuhdn
	E1bCnJlbSK40YX933yqUeaxv1JSjer09WOG79GHflyAIBOmDtnrlajieu9EQ83Fw0XbtL2g3LwemX
	E6I3Y9qPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJMj-0000PI-VP; Sat, 07 Nov 2020 08:14:30 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJMh-0000OZ-G2
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 08:14:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604736867; x=1636272867;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BqUviBNZqhcYKVjLlBRgbOvJ4y6AYLOsGaaxkI1tHXE=;
 b=DAPApllxjpWspuAyXQEXLOwgI5upUG49kFlAPjHlEhiSx7dtkSh/jBE8
 WXc35zUlQDFz/yzXbtLfHHmapOG2efIKK0KED3FYKiY+sZdXKgaNcQfoj
 LIRAv7cnY/ntbmHKPs5IRpHdkCkil0XbkaGJey+fNote76FarFui1s9WY
 7yPBTco2H6wQYtyKjNNh5q3Dxe4aREHLIWxn99gT46sYCZ9edyeuqRuIH
 7Uzjc1FUIciSipX6XV7S1oTP734YjjB9GxoP03ahvK3b/xp3R93WwI/5X
 /lO0SFZo36dcIhRG4Mx2d50AAKyG0p3f9ic+3nGmlgUYch6S88/aQP21A w==;
IronPort-SDR: XgbUWWJclppkIcptpezk43DTsiiFJtTxrmH6JgoMYCevrFezonq/0F6+S8BuFet6/Xt1MqmfPj
 0xth2aeqDmLyHg+cNoWSSdYXtWF930gMFw95z3JbYxfbWpcjw4b5J7x5stKLzB2Tzv3GC7elzI
 6MiCcBD98uV656Er37AL5vBZyb6ruzfDwzeKl2ME2iOp7YWLWRnxeak8p/K9DCOJ1b0hhWU5oM
 zOUe9BoddW4jRml5P1qF5t/8oxR5FqwePAqy+X8rgpxPFpYaNFnWduwdq4pqci5Xh8l0akAtmu
 1cw=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="262079252"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 16:14:26 +0800
IronPort-SDR: DqwSmkEjnpjOacXfABuRjy8qlAKMV31lOYUCbg7QL1+G1d3jBUaJOb/DgWdrZbV+odGzMOI137
 V23jvoJY6MwIOWT0++oNAL+VtOWywsjPVlu0H+6EW3waDzGoPEFme+1hpDU6NkQ08BZ0B6umcg
 FcfEs+L5bR6aTQ1zpSPPaMRV5m7a4p4PgPJywZkuFecA2kuSbZcboKks571uBJF57woXfKVVKq
 Jl62Az1COYA5e4yujjr3mT7j3em3xsyZ1fxbqzAXFVcTSlTOvcvS93Tc18ea5M616gLThdMXdC
 XMuRHTbXGqlkhDtJjnEDj29L
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2020 00:00:31 -0800
IronPort-SDR: TmBsa7t3u9A7oOAAJ6Q9xlQB6YGNq7OndCgwgljnfYFrMAktTQLVE89+b449fpt9Mw7Xr+O3BY
 U9zIY390So2hnkbpscRoeheh9r+XlcJwEykzBi55qYwq0hTm5aoaNFV3b2Bc2yubJYy5jJJpZp
 jjMxRqB1Bc9lZQysDb6Pcr+5RH/AgWpwmT3QihEA/AcCs4BgEg5egeDogJqj32RBmxwcAmcke+
 le/0xfq+Zm5V7QU1z0BA81wKCy48rumCkg4lGF2bMCmkGnS9pARlhm+ISDPatWjLyhaaTddJm4
 7Y8=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2020 00:14:24 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 01/32] of: Fix property supplier parsing
Date: Sat,  7 Nov 2020 17:13:49 +0900
Message-Id: <20201107081420.60325-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201107081420.60325-1-damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_031427_690347_5BE6D716 
X-CRM114-Status: GOOD (  16.05  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The DesignWare GPIO driver gpio-dwapb ("snps,dw-apb-gpio" or
"apm,xgene-gpio-v2" compatible string) defines the property
"snps,nr-gpios" for the user to specify the number of GPIOs available
on a port. The "-gpios" suffix of this property name ends up being
interpreted as a cell reference when properties are parsed in
of_link_to_suppliers(), leading to error messages such as:

OF: /soc/bus@50200000/gpio-controller@50200000/gpio-port@0: could not
find phandle

Fix this by manually defining a parse_gpios() function which ignores
this property, skipping the search for the supplier and thus avoiding
the device tree parsing error.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/of/property.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 408a7b5f06a9..d16111c0d6da 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1308,7 +1308,6 @@ DEFINE_SIMPLE_PROP(pinctrl7, "pinctrl-7", NULL)
 DEFINE_SIMPLE_PROP(pinctrl8, "pinctrl-8", NULL)
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
-DEFINE_SUFFIX_PROP(gpios, "-gpios", "#gpio-cells")
 
 static struct device_node *parse_iommu_maps(struct device_node *np,
 					    const char *prop_name, int index)
@@ -1319,6 +1318,22 @@ static struct device_node *parse_iommu_maps(struct device_node *np,
 	return of_parse_phandle(np, prop_name, (index * 4) + 1);
 }
 
+static struct device_node *parse_gpios(struct device_node *np,
+				       const char *prop_name, int index)
+{
+	/*
+	 * Quirck for the DesignWare gpio-dwapb GPIO driver which defines
+	 * the "snps,nr-gpios" property to indicate the total number of GPIOs
+	 * available. As this conflict with "xx-gpios" reference properties,
+	 * ignore it.
+	 */
+	if (strcmp(prop_name, "snps,nr-gpios") == 0)
+		return NULL;
+
+	return parse_suffix_prop_cells(np, prop_name, index,
+				       "-gpios", "#gpio-cells");
+}
+
 static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_clocks, },
 	{ .parse_prop = parse_interconnects, },
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
