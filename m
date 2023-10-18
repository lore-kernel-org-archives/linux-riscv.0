Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB25CCDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 23:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k2c9S8LPATQ6xzMrO+6HLqHJ91eHk6fAsMgIvsCpZPs=; b=xB5rh9+AoxbmXX
	Kp56Ej8AhoStdD8opoF3SDINvkjUP5qfjhe8ztHTrr4pV14ciJUbCoq771kSLVjLaC6rLDyxgHCh/
	XRsrOk5SLl8YCjHAbenRZqKP3HjsyCUmsKYYHJV8ilJmbUagNMLHU9bwUjRNhHgO63eLE/+Hrk9Mj
	hBTJDMViuYzwdH2WfB50OZaHHFcUBZZek9QTfOxZ4qBwDFD6EYT6ju9j0WMXGtLtGyqzyxFzYocTY
	E1Dkpv5SyZDaNWZ74+9x7yrWT/C+9IirjbVPMuvr+SEa19K86FfcRtTXX3naRDDP5zEJLzkQ+SBvw
	5uqWjMniFZLx+7Jp2p0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtFoR-00FttZ-0L;
	Wed, 18 Oct 2023 23:18:51 +0000
Received: from mail-co1nam11olkn20819.outbound.protection.outlook.com ([2a01:111:f400:7eab::819] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtFoO-00Fts8-1E
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 23:18:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JuU5RQljphUhji5319HWXuwusi5IeLmQ6CyR6FvB5GRcckEx5uwcxhuFO3WXquoWpTqMV/y12ceWDU/9ZWINzNJIjyFqZeHgL9A3xsHRSGUmZJLNlpCGplRn79t5eax5IEeigXjhaIfdDOFBbpftm8eEuabLuhZVijRo0AmmYaSFTx8YataksZFDKeZRONU3hRx+fH15Unk/9fxchxp/VHMr8DjSwt0KZuzMRCmEWrO/OgKccvaX7MfchYAZVKmyJ8R/hLHJ9/x4m5t1baYQPY6eTRKqG21J8spNHI+FtLmXfs8YJqnjE66l7hmUqJTGndBhq6rq4EbwLFJ8cMFItw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRHRodl38TgXozx4mNNUVZhGvvZTDSwVmIIt8xnJlBc=;
 b=nT9NgN8CJqhRb4DJd8SW8sGh1Nyb+OThHFOechR+8iRpsmHeHXOeS3SigQ5q2u1L2ZlNP7qrI9hNOlwPPyI+PYNo5A9I6klBJ3O3tYD7KqaNl1F/6E+tR8fG248lCEnGDqVdi56fvHsGig2eFxsVFVzZ+1Au8AJ2tuvpcYm7J3BqGvm5gOhZILVtD4iTNpa5pWRoMK3Y13TTZAg420wFvqQXTqGP5j9niXCvh9uNAp+3jpqY2ihAQ+Hapnh4Bohutt3WUt0xHJJI1PNTy0bsjJ83rYv0lFT+WSNsM+ncrlR3G6zLV4xUuuE8/gYUh5hjY0X1Vd28jdmG8q7sRwAUFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRHRodl38TgXozx4mNNUVZhGvvZTDSwVmIIt8xnJlBc=;
 b=JQgrNSxOfAV+Hhze04Cowe2r/76gZlD9m15Hwy+vIltNOx7orgntItDMRjz6MQM8QTesFYXCB0UXg3V0TNALsz0Sz6x1Xh0Y+79/jpYnJ0qVbuOrezaZA0q6HAWGo0DnWstJ3ssaVHH78m3NDg+wwWa2D39tYTdciOrLeJkBmChMr0uYeD18MBqMjweBjyS0hzZwaO4VsWl2Xn34YAsSrZHPa2/c7DsBdfYfdQzcE0tr/DeM05GQj2HFcK58WFX2bsSJLblPdz55L0AfYKso2z2l/AuVTRt0E7LwteXstGVNbgDbwTtNrQ9+hw0dlqtETfE87/0nvGGr13EVQ///fQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CO6PR20MB3649.namprd20.prod.outlook.com (2603:10b6:5:345::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Wed, 18 Oct
 2023 23:18:43 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263%5]) with mapi id 15.20.6907.021; Wed, 18 Oct 2023
 23:18:43 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <anup@brainfault.org>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/7] dt-bindings: timer: Add SOPHGO CV1812H clint
Date: Thu, 19 Oct 2023 07:18:49 +0800
Message-ID: <IA1PR20MB4953791C44DC10A9DAE8D544BBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <IA1PR20MB495399CAF2EEECC206ADA7ABBBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495399CAF2EEECC206ADA7ABBBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [TanbPbFbKj1dB5aENiGO3/d2tcWrCtdru3DerviQyQw=]
X-ClientProxiedBy: TYCP286CA0101.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::14) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231018231855.28472-2-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CO6PR20MB3649:EE_
X-MS-Office365-Filtering-Correlation-Id: a9a6805e-ce80-441a-bfaa-08dbd0309222
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5bfmEvrYuCsza1R9Y9YNHaF8afSGeXPi/Y+tjqP4pvo+U2yZmRr7Iy4puLy35CjXs+v7TT1rxdd0mZ1xzcFSmFKR4aXIX/srOZtr+DxQSx0+4/i2Dv4PWKSjVGCnUTHjdLhQTRVC7EM0VYU7DlAWZfgFz5HqqRXm7ohghuw+UmmpVBUkqs0jmICsnUXwTX+zgu1J7wbnSE4pmLYiOdL7c9uWwjLW4zm0eIa4DgssklrKDzWwe+f+NoXmLhHoz9NfBrCoa0WASdK4q3Z+w3VlSIb6hiomOySW5QLjCardCBQayC86gxvQ81Zp3iFslSer7tHFjo+iiZrlogywyPX5oij0OuUFL+NiE+0lCrCRenQlhvk4J50RKOnZUGEw7w/6JMkDJK14PcrO3+9zUMlIH53OpXnaKN4w68K2N6/sBuF1sRMA6PgFpfjCTTaVuG72tERW/lNWaRBs8T7y/jIlhvtCkrVoQX3IwkgWtOmw180Id68TAj5jVU4/BzguKNBAS4H6wURqu+gEsig6KXmpi49+H+10iUNqSq/E1xkTCwVqMYC2AaaKtPAa8MQhA641M9jxXo4leUvo6I/cCWGL1S7bXcHFxzioE3v2iwWvLC27ujEs30/vDHNDqGRwq8+l
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w4oVfYG1G4P4VhqUIUQpL0XTuTMSPviGOurn2D4ccl6RlTsdK4QcXEFizhnr?=
 =?us-ascii?Q?ZSOnig73LwvdkOIQRMxKzgTTiT7Is6f/V+GQdP70WV548RW6YA5OOmYOHVGT?=
 =?us-ascii?Q?WnkFjj6zl+8MEmewpvfyAi6HD38KYz2PXBVJP4kmzvrBCeZpNjyMLqNnbLbO?=
 =?us-ascii?Q?b1QFR0MSdOQV4kBonGQW7Mvg/6ahHPNjC16i8zzZs/qdOhAlE3cuB5mUSN16?=
 =?us-ascii?Q?BTjXNrRVB5i7Pstxti/t/O1UNw0YpxrSVs9kzGjZkYAC2nmQJ1mzomSnn84R?=
 =?us-ascii?Q?3/BPmOZgKAefEHMcZfh1mdJ4MqJc/uXoFe3MTZCxkoN9rghjqLZrPQSrJHo5?=
 =?us-ascii?Q?luxnPNqNoqxXrYW8uQUSi2J3PNdnVD2xi3hkjSbRHEESJKtUXowo3PUbplgZ?=
 =?us-ascii?Q?4LehCbIK8Y6n/u+YNWfEFCEIUY/D78AI8mXBAPF7tz/g9BcmfO9k/329Dzk9?=
 =?us-ascii?Q?9MH/thx13SXWO+qBbPUTeN9aIUfhhJtPvo5usPAlwNkaH9SVNhJ/Nm2vfK0j?=
 =?us-ascii?Q?H9nzgOCn9x6Z6VFOw6H9reOLeB70G3NFfM7k1M4dhyk1ua6Wi8dKn5aW98Y9?=
 =?us-ascii?Q?w+TaUgrpazkxB7mWf+wIVquZ5FwH2kZnkZ6/z+S30nW12ibla7CXCUUL3WpK?=
 =?us-ascii?Q?O2jCSG4iViHq5JMPQJ7O007dzHY8MNYixFNjq4C9Z68sh/+9Cd3zQKvr9D56?=
 =?us-ascii?Q?l+YoFX8FBjjxO5M7kPReYS/mAOHEazr4qcz3oU0eZgmAMvg9DiDMfCEBzEHG?=
 =?us-ascii?Q?LXkJQ3hkXQGSlWeT6FtiLxmtNDCgrbQ3S1rGCOf139CKvpzVoVqbPwzu/a4O?=
 =?us-ascii?Q?yblHBWixVbYd5lczzsseDYyq4cIPHFZLoapHK3ILnwF3CQT9k1MmRBfK/Nz/?=
 =?us-ascii?Q?AQxwtnfg5uDw2a5+3ws5mWz5Wd7Z777umcZ5WnWUfY7BSq4xuo1fk26OUsfm?=
 =?us-ascii?Q?3WEseiWPq+4QtwVUwDzxoa15Mw0CjBgeJz4CMQuj9wmgqOcZlZbGwnRQAmi7?=
 =?us-ascii?Q?XSocSfjBdYL1qtrDoOVkSMGtD3M0DIWD/xstZ1pNLWTGck6ytTrlNw2OC9+a?=
 =?us-ascii?Q?cenLzwk9eT4qviLLECAeSwkVT48BX3lnwuLVyvAv6maC+hTYaiHuukkdUXTw?=
 =?us-ascii?Q?YK15qHQE0u6kq96QbmDZuhqi6+PgmBEuaJMTLJM++yjgo3Q1DsWXtsXECxXh?=
 =?us-ascii?Q?mxG6GGdiD1D4NTgZdnslgVof1NUL7mq8k8w2Yy+bjaJOcHB0LbwIe5z3KGs?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a6805e-ce80-441a-bfaa-08dbd0309222
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 23:18:43.4451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR20MB3649
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_161848_426479_E8930951 
X-CRM114-Status: UNSURE (   7.21  )
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

Add compatible string for the SOPHGO CV1812H clint.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index e8be6c470364..4b6c20fc8194 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -38,6 +38,7 @@ properties:
           - enum:
               - allwinner,sun20i-d1-clint
               - sophgo,cv1800b-clint
+              - sophgo,cv1812h-clint
               - thead,th1520-clint
           - const: thead,c900-clint
       - items:
--
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
