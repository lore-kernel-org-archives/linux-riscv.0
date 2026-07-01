Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1916CC43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 07:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mEFYuVz1v2re+S6YQ8kai7RHWTSJJAODVfo3gkh1vgQ=; b=wEfh3tFs0qaJ8n
	IYHZiSiRyjpaVEZJIOu5z8UMiRAtgK9EBeRNTg76LasqlKqYUEz81P5KjVJuEmyt50FtgM6bF7iow
	1ZVc//PhLINVm1SU2ljrbyCWBO4UDQe5ZjbjqEeQg/O9Pp42SLeZxTUG14FIlAtVFnv0jg7Anuk/J
	PJ83HiknxvUj8q7Z8E4mn/fMbdXsCc3JhMq0GwDHrwHs+CgDc1lOt9Wbae9Vc5VUxxPxs2eIz9RsC
	aZpIH3bvCOvYGzSr8tuxFr72g9a9SmvZ/m+JSNiHJsQBT7vjcERXwynijaee5xSlauMFOHSIl6oEt
	xogxgdpxVopoWF17ycjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepdA-00000000vfV-0PZh;
	Wed, 01 Jul 2026 07:45:12 +0000
Received: from mail-bjschn02on2071c.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::71c] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepd7-00000000vcz-3Wnc
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 07:45:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSut3H1JeZhJUUsGyYWUUPYfqhM0mJJp2rKC4NDpp9hA3V/1elytWm7SMCrnfCcmK1GFbPK8j4317grsAkq5Bp1Aq0Z7dMUqmLOiwj0bzZ+4IAm3WXBsOt8uqCi1bqAPGh9rgqsZhpUYuQ9pNog/N8CsWVrniUrzZupQC9zA+HAB/1dhN8JsjW5KU/gcOmTE/OcHsy9sOOMLJ5OGHBY29OIjxxTM+E3CCXVSUuRCbQiLFTE0B79zhH97B/IzP62TAM4sx2WXOAzzSQk8ASzJOqDlhlRr/qzg4GD80w7DNOc5i5mfILtm6fh+DCe24eYRpr6EM9yWabIRFKSh1MS8Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YBV86v3nflUO674Q+hvLcTmmy+Ukq1Nv/1bEE7q5W8=;
 b=iTtlf2xXkTPccfDqoFBFlCRXgYgJyP3ygnAB7NGXpQcjCfQI8jUu+l4m9AAVJOOz13arq/8Rk3A0j8C+8of3UMn3gPafjQhuPrZTskH/Kf8IhApbTC7GNtdYC+GzF4ddNHMCB30VrgUC6o243tQkXt9BhM5G016B7CkKklZgAe3k4BNRBbqmAea5KltYf5MSKslh1oRc+c0Fo0lh7Ol3m138XlhHwvKWrol7MzkIXQoCbKG+JQjI2GV/bMR2GiXPkUKuB7uopj7PVbXrBtVWCBNyRSgp8KDvPhVc3g21wo5rQQchIjzTJU7aFVHVP2DfExS0bSWz6ZLqTXwDoQfuMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.25; Wed, 1 Jul
 2026 07:44:50 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::4386:5cc4:3bc4:4795]) by
 ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn ([fe80::4386:5cc4:3bc4:4795%3])
 with mapi id 15.21.0139.024; Wed, 1 Jul 2026 07:44:50 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Hal Feng <hal.feng@starfivetech.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v21 1/3] dt-bindings: pwm: opencores: Update compatibles, examples and maintainers
Date: Wed,  1 Jul 2026 15:44:40 +0800
Message-ID: <20260701074442.7714-2-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20260701074442.7714-1-hal.feng@starfivetech.com>
References: <20260701074442.7714-1-hal.feng@starfivetech.com>
X-ClientProxiedBy: SHXPR01CA0026.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::35) To ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ2PR01MB1307:EE_
X-MS-Office365-Filtering-Correlation-Id: 592f924f-8be6-4bf6-e0ee-08ded744a1be
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|23010399003|7416014|376014|1800799024|38350700014|22082099003|3023799007|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: FGvCEY6V/I99GKpXo4xStdzXYG8/nK2Vv740UQGSz/gTd+T8Klnavr3WqSKSVYSfJ5sNRR+S9kbnYZgQdc7msb/Dz/1vQuFKsi8AViHDyH96SKVMTNMsT7UoIrE1hKmJ9JkbCGWWD7e21gWnojzE3wWRn98b9ihJSB6gxMpKzIetswXXNuosI2sschMAxAqr5TGNrcE3JcMSVNR38LLWxZL7rk/2KCYlYOqfOD4EM9E7RA3TU7BIEscmqPGWh3x82K9O8OTiw64LGAHYhuMBBOeahKeqJ0yaafCFJapMTrqLjxWE1FGpgwY/gQ1B1m8uWai+QX/rvUlVDll7LWelD6N/ZIjWTc5UJzkZLG0hhneL1RzNQzMRNqgV1Ya/THCV/onEK/RBrOAjXa/YFapjBdAyZQ/j3XYLAz42ysKemxpBIGmolVv7VC56DawGJB0jSqZkXavqZO4/F8SzapHsvtk0MCPxedTnXrpRMpf6EgEOhR4GN44rQbjgJ4WSyYGVK2rehryiFSnITpaqcyRLN6tcEewZVR0zxBCOeMZeJj8c6/1LlbF9jj59sX8FkD7n
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(23010399003)(7416014)(376014)(1800799024)(38350700014)(22082099003)(3023799007)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SjLDGiShlVwjK58byUWj9Qsc4xI+/Y2guQCwx7ausRZQnjdi9i31rcK446nC?=
 =?us-ascii?Q?pM0SoATo+Rp3Lj2ZOfG91CGo7PTi4MUcQs7wk63+tx8FdlOcfuIfardwn7Ss?=
 =?us-ascii?Q?GTu43HY2Y1/jIwskkHhpPxra+aIoFoles3WHjMj5R8lP+3N2iKtHmhv3JB8+?=
 =?us-ascii?Q?DTTmr61Ly4hVtXX97cwobcqcnq3wKk9DECyUcsn89kJvwOZJ+w62r2PrBRt5?=
 =?us-ascii?Q?AwAp1XeXTorcUDx2l7db/qHSvEeh/1M6WUoX1cLe4hvYghqt7ZbBNGzPZAPs?=
 =?us-ascii?Q?q31OfItAB/MiPW747EC6RYWKPVUucWwt9GhBod26pWPjsAa1NJy3YwJ1D9yL?=
 =?us-ascii?Q?Was9CSZfIAr3MsntnX9IHYsv0MdWl2nsMrAKsc9RdzEqAlMsMekXkADS5n3U?=
 =?us-ascii?Q?7L9bVkemt405AjZf65sfgfCuxfsajxSzkILSigdVA3iZnoh1ak1xlx6L47oz?=
 =?us-ascii?Q?D5bFApH3cZ3tjcrxzcFH+SH9ePiuZ3E6Dku8wDX01b7gOuols4pBZnn06ozP?=
 =?us-ascii?Q?8M3ik4GfZ5fcJLuo5C+8FmkubVYOTTyd6+4pTmqKBuMrDc/CRvpGvJuGuBcE?=
 =?us-ascii?Q?0f86KssB5H8VVVtAdXH/hhQtKKvVjRsmv92P8gmMrl/7PfB9ipgHsc2tVVhz?=
 =?us-ascii?Q?U9RZXVPs/e3DkpJTzvPeL2BIo0AZFf/zEeOIxGBo7BZV3g/95h4UpMXuldhu?=
 =?us-ascii?Q?clBcJQcOIZGS4mUkrtVfvZSsszjjLufO7yJpQLFWVfopmqV3pE2HeFykE+aG?=
 =?us-ascii?Q?PFDbbdpOB+mah0wXwygJIqJS2+2vbHSlnn6HC9JkunIunMU20ZJ8xIxyt/5k?=
 =?us-ascii?Q?vHeEVJz7S4BqzDrZrx8cW/EcT0Xjnct12vFYZZSlvMEHXpSZ0KidVaOLKAXq?=
 =?us-ascii?Q?wWnlim5Dd9BzkDWkFvjqkTctdlEnuPcaQl4BYl2A6JUkTt7VkE2+38tfnuO6?=
 =?us-ascii?Q?GF5EUEgJSiPht05385ArZRyLO2rLfpJSfStKEa9s6xDAKNG8/zId1iJ1lQ0g?=
 =?us-ascii?Q?ygD3bowhhHQHh0gNkvoRa9afAJXAmGG+FNyvrRshqLL3FyYqkc3ia468zIDp?=
 =?us-ascii?Q?legy4p3RcmwyQ6SAIKFiQ3o9MTv7e3n6g+Qr1sFS8Z9vXsO8XyH5avBsI+4z?=
 =?us-ascii?Q?vhAMgdUzJ8BZRn72/7rrEnd9OU+2qtp5TcOa9xP6/IhUyAOaXlZtVDqKm6fj?=
 =?us-ascii?Q?5pRsgJDU6yB6H5nk1a331w66gTlMiEPSjxxUs/xwv7iBUL32vV03pbDrHVST?=
 =?us-ascii?Q?Y0QvDFJjjMVFCCHe0MXcIZoq6IxMhIZSBfqo1Uxyxmn4y2juPQNvAbferddk?=
 =?us-ascii?Q?/6sn2zWTRRFpL6QbcRipIloi7T8Y6Of08C3tJuo4s4Y3ckVfClah9pbSvSZp?=
 =?us-ascii?Q?WGZwzuSQUoFeJd1E1RrnroMLRvY+vjhkUicsSO8Q+R/xBxQWC8NdwEnP0fAf?=
 =?us-ascii?Q?uNoAuUhz25wdT5i7VbC69ra29LpNKOxwd4acz23ThInVaYYVt6kLu5dobYB1?=
 =?us-ascii?Q?Ufz/Zdm/yS2lZ34mp+ttJkC+x7M56ZpYp+C+j50TBxKgUwZoigHjORJlqZWn?=
 =?us-ascii?Q?m8i2rfpRUOZ588givfXn1ggUIcnYLYZdaz2dZwYJKs70yzbrVoSJW4YHwn4f?=
 =?us-ascii?Q?EwK+zmUih6dqXPo9YryDUfcwmLCcg4d5z5pIwKbzu5e04/qtqzseE2I44Po+?=
 =?us-ascii?Q?hFyB9yjtDGIg+KUslNYie3IOgZrHofgqLwxXflnNGRqR1tA76Ij8KL6jGhqh?=
 =?us-ascii?Q?WG6BpElm10WBja8OODs5tEKGgX2N4VA=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 592f924f-8be6-4bf6-e0ee-08ded744a1be
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 07:44:50.5563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A62TTCKo3UuTwulE+1ynFaL/2Ye9Mw0KgFZB9JAB42gw8K1kTscdcDf0TibaGAQJfP4z4tU+EOMJuAhwtd3pp54jcRlgcK70WRmuKq4Pgzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1307
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_004510_145361_D1F59BF7 
X-CRM114-Status: GOOD (  10.67  )
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

Remove the jh8100 compatible since the JH8100 SoC has been canceled and
will not be released. Add the jhb100 compatible to replace it.

Change the register size in examples to 0x10, since an OpenCores PTC IP
has only 4 32-bit registers: CNTR, HRC, LRC and CTRL.

I will maintain this pwm module in place of William.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Fixes: 2529085831b0 ("dt-bindings: pwm: Add bindings for OpenCores PWM Controller")
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 Documentation/devicetree/bindings/pwm/opencores,pwm.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml b/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
index 52a59d245cdb..42c5d2b6326d 100644
--- a/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: OpenCores PWM controller
 
 maintainers:
-  - William Qiu <william.qiu@starfivetech.com>
+  - Hal Feng <hal.feng@starfivetech.com>
 
 description:
   The OpenCores PTC ip core contains a PWM controller. When operating in PWM
@@ -23,7 +23,7 @@ properties:
       - enum:
           - starfive,jh7100-pwm
           - starfive,jh7110-pwm
-          - starfive,jh8100-pwm
+          - starfive,jhb100-pwm
       - const: opencores,pwm-v1
 
   reg:
@@ -49,7 +49,7 @@ examples:
   - |
     pwm@12490000 {
         compatible = "starfive,jh7110-pwm", "opencores,pwm-v1";
-        reg = <0x12490000 0x10000>;
+        reg = <0x12490000 0x10>;
         clocks = <&clkgen 181>;
         resets = <&rstgen 109>;
         #pwm-cells = <3>;
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
