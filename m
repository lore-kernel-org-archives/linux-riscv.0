Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12883C4829A
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 08:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w315zAHTaR0PdXw1Vg72CiSacSEKjP8dC7j+rb5BUNI=; b=aj4hqMFYN4iamM
	Il2Qrbh6NySkFsf2MjPAntFKxXUwMgHtzb8cKOa+LHJyZS0u3VKscWswrIrdCYoTODJ+aGyftR6ks
	dXd0DkX9fk4hSFIT3lEjR93We1iJS1seL+tONP2MyXJ5zeAZ/reGcKajY7h83wPMpGJ3erN8wz7n5
	gzy2naHjkaHkogCRO7qO3uUtL5BAeNKsIMlzlu9iTFDjMyDppAWep8qVwiMFJbzpLIOF7ZYoRuWhW
	qc8DzmcD6IcjZ6ou4yiTyvyfKvGPVmnedNtSc2F8EawVKGSkXpsde/Eo2fbB+OeQ11GRo/e51RY2Y
	DcD0yNSgNas5197n0pWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY05j-0000000D4RO-0jrx;
	Thu, 08 Feb 2024 08:49:07 +0000
Received: from mail-sn1nam02acsn2080a.outbound.protection.outlook.com ([2a01:111:f400:7ea9::80a] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY05g-0000000D4Q5-3xbZ
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 08:49:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mh81Xo/nz6qoNtyHObHIJdlsl8XT7b6AV9j6KnMXkg7o4MU6EFH2vCy4e7I8SYfUwbONa/AMHjMQfeKMMPWIJj0KJupgufSuUqAzuilPubywppVU8zrHviwzHfQvjekhG+X9pl7613QpHRED7SGqlSy116EAmIXCSXBgakOtTZ9tc0+n/7t4u7VxZ8WfER5eptaf3/6ipxPQGk58j99XPrQOz8Ol9WGvsCMbBMU6WBOFr9sJ7VWG0sVAcECob5BGvlU8lvyTJMeN1qSXI+RcN4Yo9APMZXcO78oQCAXHaHujuv8VNudZoUfI9cQ7UEeaCuJoDBFnS+gVPDDzpDIJag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CujyaMxCKRHTG9enEuGNRqENtaMCX/rp5qBmkJAa6X8=;
 b=X+3Sc6TO/TfqdX7QZm1Kk2ZHNI1eivM5sTlkmRAoE4bNom/3Z+GTa0QIrNNzzZTSJcKoLc6yJF2gGEjA0cqYIUS9A3yk54rgQoYqUsh6A218VTDsSI39PD0FbEROnirhKp6G9E/LhLgeHR8bCcMnII+MANxNjvwAZsjD7cIZ9GXQ6622wPxZccRk5HFK5+XATtl57vkI0EIOKMlPZm31C2xtmaMSSf+T0PHj2BkjQohho7jQbcCKsv3AM1Yn4qYSQsZpcXSp0HJB4eQFVH5L3nQ8X2SM/t+Tg4bzJKG4zAi0D+YsER4TB2s/jjfoMqYXhBcDFi4hA2lcmYYIZCfeTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CujyaMxCKRHTG9enEuGNRqENtaMCX/rp5qBmkJAa6X8=;
 b=FIGwKiK5ZU4dGDjcxg6n3Almb7JxZyhUifwd+y0LxJhO/F1nlHEVwl2Y0hbcaRbJwkn+z+KKqPAFcZMfL5WaELlcKzS9o64KPwCOWRDjwn57nlVCEsqUQLjCoANy+C/qpog2AFDwZDuZB0kzQXRMVCY8+WxKCqCD5Rsj6NAAXnUBxdFHQMvO0RvPkpA0ALh7NsO4TmgzPeknyJWWBYhfvMDnVbQlzfx+oJi7udiQKmc86wMA3h5VaxBNZd3R3lWdc1w2WFqIEN9iNKf5YJs7pgHF/myUvUSdofVWeqwz3z8040B1tg3ud5BIgCKBCZ529m2eKFanyfm8r8Ep4GsKkQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CY8PR20MB5985.namprd20.prod.outlook.com (2603:10b6:930:73::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Thu, 8 Feb
 2024 08:48:58 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b%2]) with mapi id 15.20.7249.035; Thu, 8 Feb 2024
 08:48:58 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	dlan@gentoo.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 1/8] dt-bindings: clock: sophgo: Add clock controller of SG2000 series SoC
Date: Thu,  8 Feb 2024 16:48:49 +0800
Message-ID: <IA1PR20MB4953E197DD4B538395050A5CBB442@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <IA1PR20MB49533B0C8B05FF5679E0C2F4BB442@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49533B0C8B05FF5679E0C2F4BB442@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [DhSYa3VyYb7aRbiFC67bEDb7B3zwjQbatdC9obRXTd/qGiLPV6hR/9i9QU4FL21h]
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240208084858.1113628-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CY8PR20MB5985:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e8dd482-b8bb-4850-37f1-08dc2882c9e0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iJkirgEzjDeV2/j97ax5k9OUZKgGR8ua/VtvWjL27B5yAZFwHxYA1ewtkJd9pOqulCNTpIwQopg7GJ7aX+ICyl2lojUlZggEWONiKBfuSLgjSp/jwx0yOXTg6rPI7rPuYcrqkRbUNCgABV841UMF0hieEog8SzUCFRQ+l9iuZpxAb79nr8oyUgZRPHwY8bHF/0EK1mfqt/LdKlOjWYMjDiOhBvlVbW6hRCIpWpZyPgG3/VMwrq2dExwNi1WD3prezgxL4hXaVTDW4Wbn1aUtXRtnSnsY1BUNmfmU75vvT+XyITvByXpJZqaSyNsWVBMH9FjZRUYyGPhSrb8REaYSo0x/p+8TMNC3zdRNkVnzUb6BfFRxhWb8WFcKPgagWcf8BN1Eq9nIZmvMJKukYsp+x0XF2F1fTcAQy0oVbb1TGBCwtvciGlBLQMiYB8nYv01eoZnkHf2lQskJYOD3hsN54PfbUzhTcKljDHRjJ+HPC9a0RPTpTq8g8fCq4sl+Zj2zwRqbZPMBdp1/C3EOu11p7jy5P8bcCJFN4pM5Ghs7cz0858WXaWEcIdpTrMRp4c6/b2cDpl/4IpjavfDphYdwrYtMxfn++if5MNBmsE8puFcEg/YxP5B9NpGZF05XR+GtVPspeq3h7pTdRdZMI5AOA/EwU2zGG8S4ma/DVhIU92s=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yiEu56YYRj4XWQwD2L9c7Z5dPSfCcIP/GgySp3vcq+Os/IGFfDgDRc5hWEfT?=
 =?us-ascii?Q?0E5X8DQuqNX0PghP0FI/HHKFBwNi28q7qMhhsUffFTg/vfLPP90qGoFQA14V?=
 =?us-ascii?Q?pwKkQKIfF0ATwoOS3lx1rO8LaPAACgSmQJIocjsND0TCpWTD9jxz0uAWDGmp?=
 =?us-ascii?Q?6joEL/I82ygAXuUpaYWXsWQhw3dDT1+wxdPgnBZbRZ7gcsve62IyPKXQVYEO?=
 =?us-ascii?Q?l6YBes7a1eCv7HFWc5ZhOTlc2cO6PWbbnP6ztset0C8Mw3Jvgg3PrzhjDbr0?=
 =?us-ascii?Q?3mLxr29ET43TK/pQjlI0UnYHDbB+w1eVy+LzQKvGoukL+Wo8ehHYE56S02zt?=
 =?us-ascii?Q?vGxZikLL3DFWifgGM34Dlr78ugLOxMHLxnLFOcz7f5Xmop/6s2b61Fpk8+1y?=
 =?us-ascii?Q?VGnEZwC1iIj3flv5GVlLe5aTTHbcSGxr3yV+sptKDHOivwOc9lfy08uViuVC?=
 =?us-ascii?Q?9lNskkLriODGUr6e9ucjTduJw/hiNY6XybeF3nsit257EkuSZIZN48lES6OY?=
 =?us-ascii?Q?JegGp8BwixcdGd33klMi/RfXVouKFQCVFn2exYabIzZbG7rGRXjxeGJlY9KT?=
 =?us-ascii?Q?RCWrhCzSpongk/FsoAWjwbqTF8byrel+kiAWUEjfV/fHYYVe9PWwyjRZqBfC?=
 =?us-ascii?Q?qXyynS+zlrPY/Ggmq/xwyv15Ovdjtzddw1/UOJm21BaFZb8ss6y37iKNMdux?=
 =?us-ascii?Q?MIwl67Mz8aTcvxxvShdPwjrsledYF0uiAmwpn/L0CBoibMqmBkEHfF90QjVd?=
 =?us-ascii?Q?aaqDEAJ9tvkUI/OE3Ws1DAhIs/TQdjYC4E2HSJLfsDKXIzYMKuueAy/gZIhI?=
 =?us-ascii?Q?4ddhnIraF/XK1qEoOd09+eLtlwepLko3FXjkRHFXBwjAjzo/GZiiARl1TRys?=
 =?us-ascii?Q?6R+5KelueqBUfSNqQYxvrfub55k/IDPQDjCVBFKy71L0MXoyAVfi03vOC/xI?=
 =?us-ascii?Q?Cj/kTC35galNw+09MihvFNV/bkbem/Qyc67mS0GrfGhe0gPagJneL/R3sif9?=
 =?us-ascii?Q?p634qnhAznQbG759QtOWKH1/oz8f94nJsUGSy2BW1fryVPYqdJRlxjBEIJOg?=
 =?us-ascii?Q?Mqc5H9zS4Gx3Bc/SXsiSGmXHzio3EkurudFvmIuxwbkhkHHtKN7QRshQoxAp?=
 =?us-ascii?Q?2jfT2fCShvP3N45+A4jO9k5Lx4OjeWm70c7MgHO4gVw/srBRy/IZ6xN0Y3ix?=
 =?us-ascii?Q?UjcaOwYTSF2t+C8DMndXNt4KbHCJ1kBGPFHHlKaLaCeyBv4NIe+nAlHsojt2?=
 =?us-ascii?Q?LxEL95ohfw/Fl+4w4p6DoML6j9YoD2smv0WePlhedQ=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8dd482-b8bb-4850-37f1-08dc2882c9e0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 08:48:57.9382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR20MB5985
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_004905_007190_D6B9A77E 
X-CRM114-Status: UNSURE (   9.45  )
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

SG2000 series SoC has the same clock as CV1810 series, but the clock
related to A53 is functional in SG2000 series. So a new compatible
string is needed for the new SoC.

Add definition for the clock controller of the SG2000 series SoC.

Link: https://github.com/sophgo/sophgo-doc/releases/tag/sg2000-datasheet-v1.0-alpha
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml b/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
index c1dc24673c0d..59ef41adb539 100644
--- a/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/sophgo,cv1800-clk.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#

-title: Sophgo CV1800 Series Clock Controller
+title: Sophgo CV1800/SG2000 Series Clock Controller

 maintainers:
   - Inochi Amaoto <inochiama@outlook.com>
@@ -14,6 +14,7 @@ properties:
     enum:
       - sophgo,cv1800-clk
       - sophgo,cv1810-clk
+      - sophgo,sg2000-clk

   reg:
     maxItems: 1
--
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
