Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFA3CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 11:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NVilC2I5x/Z07NYUL/7gx0GG/0Z97Vrj1NYlt5Q3ZOw=; b=keCGuBOXWmo7w/
	ngywwv9c5IocbOwybNPvFQ3REo5oEVb0hgsSvKdMCJ3dAz/Xal+fh+auaLQj7hjZu/n6TxcHDlHN7
	xoXWaGupz9bQX94T1X1M8JxQOQEJ9PQ90NPaGvnSsHrXowrbFdzGoqfCrFAACmY1/0U/saX/6NfAN
	v7u4iN0rT7api7D6INo6H1xHktibChT+den5yZAm/erXyyvHrhpuuOKdAkA2xdZf3A4pYqPRiznbS
	1I5dmEaix1xFnUNT81pEx6qRmFm5qGLuQhfyRMMxb+AS6Otvttze9nJYqEsPjPFM7jtAqkhoypJmg
	bFyb7WIuyvNxQuAXVevw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4mG-00EYez-1e;
	Wed, 18 Oct 2023 11:31:52 +0000
Received: from mail-dm6nam11olkn20815.outbound.protection.outlook.com ([2a01:111:f400:7eaa::815] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4mD-00EYeI-3A
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 11:31:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKfPKAwDjJNys5SEAdcqXF4jwujXB4r4Dq9FSkj/0o7MxNCOL2N5cYRPqhqFvq54NGSM+842ag+Yg6+imKRKrVNUIo7wto//Jbr4nJwdAfv/0Bc8uSSRYVDuRLzmvlTVsHFh5dRcQQz1hs2p9EUP1RWznQ/uLDZjToqNzFJwDk/rOTAhrb3e0mAr2tCxC8zg33GLA5JX6SfhVgKsAr/amCjV10iUDPo+G7AZ13H/u5y9Y+fk2s/lvGqbK8BP7DR5R4utzGAZuS4L6UNgc2bihaz2A194VBikE0+k6M4fhvbhg3kFpsC4ZrG5DE0pC/SnQDAyJ+5xGTHsEO07yMAp+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rr0hI5c4xS01/detVeEoI7bR3LBYOiSyRaJQUEvqjM4=;
 b=ock1+yADHu+xNiJt8JJ4rm44eF+k8zRTaYoKyH1NmzIPKjvhQqJH5/u/1BVcPFX4fpyQEoNH2UVjXehXWhTk87wFf1uDfh0Jmf5S71qH/vwO2OC453RaEgvtYE/PKEmXrKspokNBfXhyC8fu8n3JGS248n4aWl/rW5Go3+K70tbsMkejl8B5aRp0vhTMwyqNsbYhmNCj+7PQOiMiyZJvrlx9Erh4Ck9t2X8dzj1cJRKRgpwu5LHdffoYUkuZoTkKvA5AwLL3OUwhIArKNfCLAcX21CRmXaTNc5N7p+CRNHzAnOC6BDQQlCku3mm1D/zGYh23bxY9YlxkUDAZkTv8Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rr0hI5c4xS01/detVeEoI7bR3LBYOiSyRaJQUEvqjM4=;
 b=X6BIBWGhwPclnANg7LRkxUF6fWnmo8El1dw4e7/dM8NquPSQPEDKeraSiDZs+y0j4tRxhSQ+gEZAskk6og3TnNgT9tW0TygHGQMjODIeOTFyOw+kuEsZfZlBGn1adDHx4iS8jPzfc08FmM86J/i57cqA99Ka1utnmd+mz3SzHjHBRqZf6Tl89wIuS+cJ4se0CQXcUOQ0wXiFSZNOkOCeBCY8/Yk+IBU8I/15FlqORqNb3pdYt34cAP5NIvuRKOoMA+WKdBw3Ij+9r1ZVnDzYa5ixx0Lr375fAjAug+9iAmScXMigh9lTyMA5CZpU+JL5+eqdPwdwvMACDRPcfIAE7g==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CH0PR20MB4059.namprd20.prod.outlook.com (2603:10b6:610:c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Wed, 18 Oct
 2023 11:31:45 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263%5]) with mapi id 15.20.6907.021; Wed, 18 Oct 2023
 11:31:45 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH v3 1/8] dt-bindings: interrupt-controller: Add SOPHGO CV1812H plic
Date: Wed, 18 Oct 2023 19:31:46 +0800
Message-ID: <IA1PR20MB4953E0C12E7C3FBAC915334EBBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <IA1PR20MB49538F60A390CA74EF1D16A2BBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49538F60A390CA74EF1D16A2BBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [WQrHK8p3jspoGMOW7Hx0T8ABbcxK85Ow0eVC/Xq1sVs=]
X-ClientProxiedBy: TYAPR01CA0002.jpnprd01.prod.outlook.com (2603:1096:404::14)
 To IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231018113155.1605537-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CH0PR20MB4059:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c6de63b-fd6f-405a-dfba-08dbcfcdcf27
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8uwDdRxXB0ZHiLWMujNgVpqZVmDPPg4IEhSfeoRHhoQsPMZXgDLg4lYTuSGDY+FL8FbfHMr0h2OYY8JpY9n+iAySHDDaOiwRB7NEF1tZais3sKg6Q1hJL0l9H5CvEfYKqm0EPaS6XzBKZUQUo8v25fgetRxQF+i26b4pjk8ydgAYGbobjf3BwInfmiWFSIwWa8H/cP40ubmQeI4xTs5rbNXIWuUyUThcB0w6ekSSd+2wNUDizlwjtH7XqgVhGNHu2Vv2Azy99IBva2Bze1Ypjf/OswGzPZ3MpER953r4FzE9qQCBqLOfzc+WURz8sNYSaYXyQ9L7n8wBhZw28dJOESPmPruufqkR55bDguKbdyzLC006HZi9BmYxnz2zdbW2FS2LIPrOvrDwZgCBDneamVSL/q3fVUSN4H6Aikz5+NWMpNz0SNrQ2Nt+dOVB539foxBvJZQzfdedzDSnP5c+JJcMQ47whBIPaUcMN1sqJjHU2HKZ2hDVTHM7lHEzP4l2NEoB+5+WkxyHty7VNSLT8Zap735E7/D1UhcV1d0ctvosRp26Ak3LwjPcquRMiWb5uVKJbZRYp3U2UiPQioxaf0pJqIfa3rqVBddyt170bgj+Mbl6ssmX8XeD/Fn36NmM
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e/AbpBKBXqIxdvAq/XJdEyIMTuzsBo37CJPT0K2LFRxJ0FlK3HGcyGxPVG1M?=
 =?us-ascii?Q?ZEC0LfwkvLr35wj4q55GwSOjeirnD/uxc+gx4ygyoYYEhv7JxXoWYbDS2nun?=
 =?us-ascii?Q?WLB8qC4aiLyWHJuCGNT8z3z7jOVsXn+5v6CiVf8XkoM2nP7XYxU1i+0tRZH7?=
 =?us-ascii?Q?NYsTdBs7QH9eMW19c60WrvGwCEBHEDPjvsIShinhmJDr0JQOUO56QjXGnFAo?=
 =?us-ascii?Q?OMaE0b7JdnkuoWNm7yyDyCiyJSZPbXmD6VXUb2SeJZv2mIZULn6JblCh0m1V?=
 =?us-ascii?Q?mnu9xFSrCN036MbAnqCxqINNQ5Q4bMwFgUvY3pP4fdrUVmVsug8sb/ZCFaun?=
 =?us-ascii?Q?Nz5gGfpnTgSovmM8NBVslqQeQaIGJyqLYgN8XBGcSgGoFUZwsKHZKReg9bpB?=
 =?us-ascii?Q?blVeCSG3oC1gcb+tCwZou6vTfHxzeZ9pInAVMHnlfnZ82lTwLr6RXUSYYklO?=
 =?us-ascii?Q?zdxzym2Byxj69VlrciwvWggWbY1J6OybEOoyfjA/NEn6WibPjpc7S+MFXKAv?=
 =?us-ascii?Q?lKQlyz1O7JstfKHv/kLZuBRQvArvMEApU8fuGp4CAI+QYpi06r/nBA/5ig8Q?=
 =?us-ascii?Q?0FzQ4OouG+4YmCWvmXDuc0/jbgqzI9X/bVvHOzb3OW0v/oRkKY2khqgMH1Td?=
 =?us-ascii?Q?VxEgMs7MQ5pKLMHpgAlB+Dtm5iRB/w3wTxKQj5nG8Fv73CCjJP4Sydp+Qd2f?=
 =?us-ascii?Q?vk0ILs6j6A4ccF/HWUlp+WQHV+7MkU0m4u5qn1G9lI+0pSg+I19Tgxk2BIFR?=
 =?us-ascii?Q?xEfjwtUcVCSUUOpZHcCJLxuu2RqbGn4OaL4adeAi9xokyhJw5dHjppKOqbri?=
 =?us-ascii?Q?RCUD/hvqUwzcsffPPpZMbMowVELku8RfzYgIYB6qof/iostWSxuo+uGAdHIP?=
 =?us-ascii?Q?SNt1oyQh92Qil22zryQWwzBCzhFkwsBGtwF4n6wA5JGI4jXwoLj7IOlPB/rl?=
 =?us-ascii?Q?+t1w8lWh3x9F0YObMgh0e58mRBSnZBD1nq5pCX/RQ1QaVMYzo3ktdDkp2Qd9?=
 =?us-ascii?Q?MlkGUMPSIA52g+bYeQspTpWv8r6DH9EsbGpkFSCQI8IhjBj7/UZfbu+iQuwG?=
 =?us-ascii?Q?EMDn5LGf94KnUpR1ETEU9UyQsDKKHGBFlRYdNyFr6ut4N9QyAwfm1s60E6b/?=
 =?us-ascii?Q?LaLl0auDrQ1Pn2Zlg2qiZwovaC9c8wLBUy3/8gThku2W09BLVn5gF5y0lWdV?=
 =?us-ascii?Q?ROxfgyTLC2S5PmXRCke5+dVpSNYgM+nuayi3QE7tOF6WASFNvKKyoM42aS8?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6de63b-fd6f-405a-dfba-08dbcfcdcf27
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 11:31:45.6379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR20MB4059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_043150_025406_39494924 
X-CRM114-Status: UNSURE (   7.42  )
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

Add compatible string for SOPHGO CV1812H plic.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 0c07e8dda445..709b2211276b 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -66,6 +66,7 @@ properties:
           - enum:
               - allwinner,sun20i-d1-plic
               - sophgo,cv1800b-plic
+              - sophgo,cv1812h-plic
               - sophgo,sg2042-plic
               - thead,th1520-plic
           - const: thead,c900-plic
--
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
