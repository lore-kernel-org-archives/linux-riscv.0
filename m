Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DD4C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Mar 2022 00:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HUN2DmoqG3q06CTk95L7IkWJ/wy5uce7bSPaCTQqqRA=; b=EtDHc0CgafuNsT
	Y0EpWoui3/7ietYxaBF1HAlimcKKXNvFhidN9Cr4k1655jfo8fIIr9QuZ2SPIY3uXjUPme41lDDwo
	q4Aon0X2UCCuPXD7neQBKM7Yl8N9EWs+6gbQY5ptBRQ6HlC5NdzcFiqm7Cza2boFKlFiWj4htmk2O
	yLyhiSRsXAZEwaKas+6chgxqQ/qpjBDsfHwA73VqE/HvrCirXcIWgd0JWeMCv3VZ56am7izLGKug7
	sri7jLbUizL1Xcg70XJ4hPwmRVckrgbpq5bclWf1m99V4gKy8SR2fIgT3qWNFUL0uIp8q77ORo+zw
	Sz2xTEs81YAILkrqiWOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOqkF-00EXEH-18; Tue, 01 Mar 2022 00:52:03 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOqkB-00EXDH-I7
 for linux-riscv@lists.infradead.org; Tue, 01 Mar 2022 00:52:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646095918; x=1677631918;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Gl8CmiaD+oLJ84IAQAj/p5IpqHdKAYJdVlaEXxHd6No=;
 b=nf0UoUms1MZfGwe1UgBabZhQwkDkJkSwTjgxyhQqjSiSz9LCH8NccN8W
 DFGdkNer2791qOhpSAye2Tf+9NbZsdA9b47bOmtYgqLjEngm5bpvYCjp/
 /9T9N0V6hqTMPGEea5vlrixmESkhWMPqLID73oO3jMRFGVwqlxcDD5qu6
 uB9FuNYSnN9lTcVg3KT1K9mgUxN78UbD9Ner5KfOSYJXKi90mi2w9wxvc
 zPN32phJV5oaFqoTIbv18n/1Jj5ZafpZ8ekwU6UYbqm2srSe5KqAkiChw
 4Dg4KsnRDeur6S/AAK7FeKHAuH5kuphMWRMUmYZbpvnG6ZANvbsQYoGxM Q==;
X-IronPort-AV: E=Sophos;i="5.90,144,1643644800"; d="scan'208";a="194154181"
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
 by ob1.hgst.iphmx.com with ESMTP; 01 Mar 2022 08:51:56 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kiJALOP8XTd4FESZxNYj1tOdxCOf4uv3nP1DN+/nEdIm4YYJO9k5h3CjxquUmeA6oJGHiYut6sWCmAmZUKQ7iJ49wzFy39iwdy7NnFnrLIXXIymSmb9+P0Mm8AWRnag9vk/KDseHzafpnP3vVo0jhaUk5tSsdCXosfXA4u00Rdaiz1Nq5H9jJioqFRxCN3kDJQwG1xwCn1WOl4r6mfVNWDIvQhmDXgWzuHbQ5twPkN3HEQBAcE0qo+q4OqMJyQA3FjsHeGwaMHl/P0WsmE6M/1MmekpUXgFBrRx+tuCTbM+Sc51AohMHjyjwdMH39XWwrxL46rDyH6KHltAbo6OOPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ca7IKHUtluCbDKVvFNedoQ6fzy0NnEtz7cKWsBKwWM=;
 b=HJFTAAea8hhDDEyFMvDmda5zWzeYXwqWf++cO60a0f2QE7yqo/W8+PQfZHvGFGrS+1YM7C4M6n4AtUNvdtXzRgEP86k8CPq6uh9l9MGa+SYRfSzR9yyOmdN5PtrkOEt78Ym8IpVBSOqeuJunZcunDdAZKPt7zJQm6AlKTMWwa4Dq7gxPD5gdUU4KwXlnGuSyiX3Z5tznI3UEeVYJqs8O7xZwAZpxNm31QtXiWk297DxMaytHh9Ocw6DblnSxDQiI4VjOQLxD+MOIdZlPh314iVaHns1dq1gK0gpFYCaj60XJ6uY5nTGSi685FBQYCurzL0+5QE4syvlR1GHeGrCEyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ca7IKHUtluCbDKVvFNedoQ6fzy0NnEtz7cKWsBKwWM=;
 b=sqdLp7n1IxZB7N3a6kke5yFnMxlULJDtdL/zErCTx4azTiUYWT7+b72FYFgXyZG2Rbchk9+jQ7P6iKVq6KwRp7jxiUgI/b7dLk78letCQonf1xjCAAuELFEoRAiT1wxJWubX+Opz4Yra8Hx6lZa4NI12ZErIwvesnpk8Q8Up5OQ=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by DM6PR04MB4604.namprd04.prod.outlook.com (2603:10b6:5:23::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Tue, 1 Mar
 2022 00:51:55 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::f025:4f23:8e46:b2ed]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::f025:4f23:8e46:b2ed%2]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 00:51:55 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Niklas Cassel <Niklas.Cassel@wdc.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: [PATCH 2/2] irqchip/sifive-plic: Disable S-mode IRQs if running in
 M-mode
Thread-Topic: [PATCH 2/2] irqchip/sifive-plic: Disable S-mode IRQs if running
 in M-mode
Thread-Index: AQHYLQaLJPTWpQA5XEukD59TAjASOA==
Date: Tue, 1 Mar 2022 00:51:54 +0000
Message-ID: <20220301005142.3038702-3-Niklas.Cassel@wdc.com>
References: <20220301005142.3038702-1-Niklas.Cassel@wdc.com>
In-Reply-To: <20220301005142.3038702-1-Niklas.Cassel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.35.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d98ade1-2f76-48cf-8388-08d9fb1daee0
x-ms-traffictypediagnostic: DM6PR04MB4604:EE_
x-microsoft-antispam-prvs: <DM6PR04MB460413659BACF8E2FB3D7741F2029@DM6PR04MB4604.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ReEbnqxwx+MtDYg/ANdX1B3UM1DiQv6wGjyBhq7psKxso9XgU4/zjhKVDKosqUp62lfSLpW0C54XGZCBOeJzZIM+FVFHe/zdp+OcRcCZ7EWDa3ncUwub5YqYEqBThyoQKXo4nWzurM0Knv6/wsMNANMLBTm5gpHHgdqFcwXOCe3banHa4YmiY6+1UtQ30UL5is3DE1KvqpV+QMCj9A5aAJOHyzJ1VlAd93VZQjbHBZ5t13kZBHPrnUfHB44n9CLCBOs0VNz77tcllU3O7Ij0SohAKM3k7fRNFWNvsbUfyaCKVmd3FGTTlFfsWbUJSuWc2YnKFDJ21jFgEYjwRLU9LclAkP1MsL0qDGyBd10wS+2qz3MnDvyxUksrOhSq3LXr2bAYp/4U1Qgb5Gq1rmwN+NoQPcmVRYYAmMmIP1FpL3PekceQlNcRfc/h+jYd4TPqhemxGesvvwwXTHjuMR0UHA/DhkGCg3kbztD7Nfh0zwA1CyO+QcD5FxamuGikX+IS9lwguZeesCgDotGwwep8ShWsBWHITJ+5POUYeWT3VS1qbPLJGHPFymKlOKCKx3cHjkM2IE+80uKE72pqMbE0dhL4ayHLbcyalek6uksZ+vYGCmF1W4LaGXK1znx9iyxDNfWTIq/t7Azsg1WjFWqc18Zb5zHhCO2Nl3KAyePLofKMdar4sTQzE5cEwn/r3re3xKXsFZFXzvhV3YDaITLd5w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(26005)(2616005)(66446008)(64756008)(71200400001)(66476007)(66946007)(66556008)(54906003)(86362001)(6486002)(1076003)(508600001)(91956017)(83380400001)(76116006)(36756003)(8676002)(122000001)(4326008)(6506007)(82960400001)(8936002)(6512007)(38070700005)(5660300002)(110136005)(38100700002)(316002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?VV8YpqDRsiZ8KTzvcD2uBSgWkke4mwiHSqMbezMLEnDR1atXSocVK0e207?=
 =?iso-8859-1?Q?I+SpDcBOnVDj3jmOxoppbmgPVVRes0CUwoGSNquveDBwSonBduCryEEpNn?=
 =?iso-8859-1?Q?rZbPziUtVpwbLWK35qCxE109jCOVrNb4hPRNB+MevjMajm1unz65qXJ7rf?=
 =?iso-8859-1?Q?GviDygpRpzx4U6lhFrM3FYFHyqOEqcnL4NqiAli3FB2QF93jwNec5nghxD?=
 =?iso-8859-1?Q?Txlxnbfh6WQ3TuanLqBO+QKKUGROBJdwh8MdGb1QolxTzhHBp9sMJeyPpE?=
 =?iso-8859-1?Q?wdRzcd66CYPl3W1hJ5m5ffQc0yHVsSIzv6ShSBhwUBozdOoxH30QPhFCE5?=
 =?iso-8859-1?Q?hm7Qh/sz7/DdbLcNF6sgE0SPsreqnjYajm5cHuwgdTSbkgBuGSseroNy5g?=
 =?iso-8859-1?Q?NuNVkEd5C6owLdYtKyVaB+d4bWo6Cx1STPTTqbyEDQ4D5SDeS2mhAEMtkc?=
 =?iso-8859-1?Q?BdWgS7UknyeCmCH8YhCaYyqXQQitfQ8rjYI5aUvv9Vm0oW3oxZ14b105Ww?=
 =?iso-8859-1?Q?5fo6R8FxDEk01IAhmxYzA3qWAUCUmbsAzpz0UnBLvUtCSnaMsvedHrPEES?=
 =?iso-8859-1?Q?lFIm/3pOr11qyx5v3IgvX6I4TH34FJifTKKur7bfjxeZA6P46fAY3tm+OI?=
 =?iso-8859-1?Q?9VeOnghqH+QQxElDuBOaojzxHiV5Ngh5wEQfDH1oV4exB3E24IH5gREGt1?=
 =?iso-8859-1?Q?KrxFzsLdeoiMHw3Zr3p5Dq8AKsLQ17sjEK5ZN9oSvin08mnygQBvOFjxSX?=
 =?iso-8859-1?Q?in9D+C4PpsW4os8EBADs7j8ZBBhztTl0oqT0Q95DwgQj8gFZUBqo1MFZlO?=
 =?iso-8859-1?Q?sAcUkWNz1zXfibYKcSPhudIhLpO/BUSbjzZOn5VdBHHXc8Q4Rzb2qtoRgv?=
 =?iso-8859-1?Q?cJWYOefgtqZ5qCk3JujFs5yJLsBEMkAN9hM7w1LWJBNOLuX6hLGHvY/3d8?=
 =?iso-8859-1?Q?hgefpXRRCAHNTNoMMAGPDhsuC5XGRj5m2fl2KkDE5QnJNFMOcPYYIfC9kp?=
 =?iso-8859-1?Q?q6xgdi9X9fU9tewCk96CezqJezvLhQrP/y+s4BEDVmjAjPYRrZ6ZzI/Fj+?=
 =?iso-8859-1?Q?6jI0pMrv2oj6qV3/DdSGpLIuZvye3mi4QRzUMHE608TQMvTFq5nDuaSWYc?=
 =?iso-8859-1?Q?SykZMmfNErOtoRxA2hyc/oRwvLhC115XBIfmTWSDWIeVV464UX3JSrKGU4?=
 =?iso-8859-1?Q?RUAh/ReI9gYDbVJKjR00LFh39eg4ObJubPjjbOo5/CmxX+gQ+2j3SMT8YL?=
 =?iso-8859-1?Q?3+8SW838zQlzK4DXtLP902wNd3wafWS98Fyyo697UlAuumgIfS9jsPQzjR?=
 =?iso-8859-1?Q?8kxyismfMPn4lM47d3eGTR4cQ1NgiYUy4B5595B7FFr7R6tIIvPA48d1/g?=
 =?iso-8859-1?Q?m/2NGSCK7Nv7Sl55OlQrsg1dsT9uRfKRfaAw5YZkTJhe2zcaxfNVZGTA+r?=
 =?iso-8859-1?Q?Gk6dFcJtGPXHy4SguGzpJGIYFU9Iv79YDpz6obtvn60jG8okZZaQSDG2Gt?=
 =?iso-8859-1?Q?Mey+FOQyu8g04ztZj8wOi/r9dy28eR9vR9BQv7A6PkLhkOIg69farSLdnP?=
 =?iso-8859-1?Q?KbWX0BIoxFrqbO0CHMbZV10j8IXIPyD4dOXFlX6QgL9SSfbhFF1yfUpTrf?=
 =?iso-8859-1?Q?mAQGqnFAOCI3hIlrHtqUpbMqU57+QpYHH3gnHMdLAjeFYi40ub+giKEerA?=
 =?iso-8859-1?Q?HALd2Xu88Se1MtdgPB8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d98ade1-2f76-48cf-8388-08d9fb1daee0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 00:51:55.4958 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fFypKtmW32UaxCUVgO9WnKT3BgvuWX1WbPY00bVZTbodfo/lCHpxyrtTgsvpRlga+DV2Xnwku2/lb8kr1H9NVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4604
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_165159_633658_D1677958 
X-CRM114-Status: GOOD (  18.36  )
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

From: Niklas Cassel <niklas.cassel@wdc.com>

When detecting a hart context for a privilege mode different from the
current running privilege mode, we simply skip to the next hart context
register.

This means that we never clear the S-mode enable bits when running in
M-mode.

On canaan k210, a bunch of S-mode interrupts are enabled by the bootrom.
These S-mode specific interrupts should never trigger, since we never set
the mie.SEIE bit in the parent interrupt controller (riscv-intc).

However, we will be able to see the mip.SEIE bit set as pending.

This doesn't seem like a good default when CONFIG_RISCV_M_MODE is set,
since in that case we will never enter lower privilege mode (e.g. S-mode).

Let's clear the S-mode enable bits when running the kernel in M-mode, such
that we won't have a interrupt pending bit set, which we will never clear.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 drivers/irqchip/irq-sifive-plic.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 211bcb10aa93..46caeb11a114 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -326,8 +326,19 @@ static int __init plic_init(struct device_node *node,
 		 * Skip contexts other than external interrupts for our
 		 * privilege level.
 		 */
-		if (parent.args[0] != RV_IRQ_EXT)
+		if (parent.args[0] != RV_IRQ_EXT) {
+			/* Disable S-mode enable bits if running in M-mode. */
+			if (IS_ENABLED(CONFIG_RISCV_M_MODE)) {
+				struct plic_handler tmp_handler = {};
+
+				raw_spin_lock_init(&tmp_handler.enable_lock);
+				tmp_handler.enable_base = priv->regs +
+					ENABLE_BASE + i * ENABLE_PER_HART_CTX;
+				for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
+					plic_toggle(&tmp_handler, hwirq, 0);
+			}
 			continue;
+		}
 
 		hartid = riscv_of_parent_hartid(parent.np);
 		if (hartid < 0) {
-- 
2.35.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
