Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B93CDB483
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 11:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k2c9S8LPATQ6xzMrO+6HLqHJ91eHk6fAsMgIvsCpZPs=; b=XFzhUmqLBZki0j
	l0jAwzbqr4IGZdjM9Rpa9xfBGmzkwqhkmES57pAyzb6gqQEW2XGofWnudCXIKSjAZk7q7Pze+CRcf
	xBohnp7ZjOECAcsolWxaFcuCPh5GQSMiSnjRgThgr8wM4hZinhEcbziXuFGOp1cCnE0HQBKthTnKk
	hc3ql4Bbg7T/IrnbfCqIE9R7yDiHweHs9ek7fmcqp3wZ4M1ucr62isI8yMHn8Jw1qFf3LE73vvKA0
	kdSg70CkyHme16Vhx105xWKevNN4BWTWcGFIzlsXORn+tfGbHEVxnQJ1qpKz/B6wX30/IS9c+Pjg1
	nirTVGB8VpC7zrvXD5Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4mW-00EYhg-1m;
	Wed, 18 Oct 2023 11:32:08 +0000
Received: from mail-dm6nam11olkn2082a.outbound.protection.outlook.com ([2a01:111:f400:7eaa::82a] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4mT-00EYgZ-1c
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 11:32:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COiCSvxZlV6au2LoTZqkzxY+WP9/rua6LEzcRzZ6/+15reDVEs23FA6RRK3CYl8AQ2qbqWb5x5Vq68LVd7OZuhM7he76tpGfZmrcV0lVaBzyQ2lXP45gK6LAKp/qN6RK8fXLs+Sqd7sfYy9QRwL3MfMs9HfGfTcelJhgPDS2Uu1U4DXk9XNyH5/WzNT3XXqKEINM88CTRFSBCR36oAvN3Yv3Ml7gON5zfyPYKkma5mu5BqNe97Y1XN6J/7hIe0/7VrCT66y6Cp5SQ/0hEwHUIIr6YRM25/7zASr/kP+PHWK7wxwudOIoRmQrJ/JtM30KSbuPywo74oxoDTSHrkFmsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRHRodl38TgXozx4mNNUVZhGvvZTDSwVmIIt8xnJlBc=;
 b=mWTnJdyqKt7L9v1bbblAsI1G1/vv3p5+kWGmG6lO7K+mcyPSPb1uBA8Br2F55ygLXUjZFA/l6fGbdtDoyWr9UCzk01CnLkQ7mTcPHWOHlohS+RumFheL/KhwycwsCffwOgoKeYXXafUKmeia7tdSEvWAlYu1nu5x8elRa5Ga/dfH4KTXJoZy7+1JH55dCV/+NOlnuz+e9fGtlTSQfOyK27Gi/YWXQ0d1dNOC958HJJNSq9R+84+xax86dPUu7ei1jh/0HPzJoU1luD6vPiP5Ds3sJAeb8D235mgzUgnHN3g7hkmGbLvwKLdncQ+OBpT7rQWCG1BxyAmquN2X+GyP6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRHRodl38TgXozx4mNNUVZhGvvZTDSwVmIIt8xnJlBc=;
 b=Fznut0ODefxGUKOjimoAkE70+oA2AIdyf2f9xYzj1778nIqd0AqEsHE9vXRn1QqlD31L5gjqqdpbL6FgsSE1p9Wm67mYX/RFD6xEbc0VizS1/T0YBgm1R9Og+wuCQl1rOv24Z8FW20ZWTakQKQywa+6y/1zCkbHlhJQacWhvZsnzyzrTgv4sZ5pW0ffjFxf/otvRNjitKG5i7sJlvmWhl6T78dskVoHGDgCHYEgUx9Cn4mBN2pX1EwDTEIrZHmYIg37ELuk3t+JBrbeIC9Xh6JiO5g+Js8N6Q3QQ2eHySBbyFCfWPaVihJ0ViESuneaSuH2TxbsiBe0frziBvcAPBg==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CH0PR20MB4059.namprd20.prod.outlook.com (2603:10b6:610:c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Wed, 18 Oct
 2023 11:31:59 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263%5]) with mapi id 15.20.6907.021; Wed, 18 Oct 2023
 11:31:59 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <anup@brainfault.org>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH v3 2/8] dt-bindings: timer: Add SOPHGO CV1812H clint
Date: Wed, 18 Oct 2023 19:31:47 +0800
Message-ID: <IA1PR20MB495319B9063BCA1044D4B6F8BBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <IA1PR20MB49538F60A390CA74EF1D16A2BBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49538F60A390CA74EF1D16A2BBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [upgV07RXmhgVKPbyZYLfOst2g95H8TWPjJdFa9Wj/UA=]
X-ClientProxiedBy: SG2P153CA0027.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::14)
 To IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231018113155.1605537-2-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CH0PR20MB4059:EE_
X-MS-Office365-Filtering-Correlation-Id: eeb7de44-5a6e-4fe8-2538-08dbcfcdd79f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4W4aDNMy4xevN/TYmfLgRDArE1z9wDgk3tMSem1EvKdUMTQtUoMj5PbUBxZcwH58HJvKjmwrHZIdqRvdcxABMhV+qPcP/8AHdt5ZMDyqMVnEkynsaZHnMDhYI1lZA5h6dmC6MZir9Yq3JUq9+ZBzP63yNv0dvR+hR/rrjCfVnbDCTAFvfnS6LCRFUWFIHUc6rr0ce9xvmETKbywDNsoFo0hOVJ1JnVhcFoZTWcIN+B3zLLxlbqpsDTvIoKDpUl3xDudzYYpoRJlgW0TAd8QgpyhtjLEQQd0s+UY+YwuPDD1YEe8WJ/0EZSi6qM1GtKLG8YkCTP/CBINg3kMsjGGn95XeFCEbx++hVaQy5i/UZu+baH5Kou99vOiGGzSQlie5Ec2yMNyB0F7VOWfvCbs1hjDIfe0GXRDF/7DwfOeVcz1BTMRkl2Zlv4cp32hGa1upiqoTQiFtwemQKVpM793oQocz/th45POF6HgeSifagFhPL6aG6G5Fghu4Gf72z9iXXEd7LBgXnkS9q5SASkuYw5NhP92jAor1xdFBe9seXmWV4gTBNQH0GNa34F5F8rLQx4UGaifI9R1XcShjnmMA9BiKXmvUf94zL40AbAfmiHDpE4fRIv9EzoiDNgjmjGrs
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7PXqJjN5bqzK+tAGU/0u4JQq7fVDRMEOnAXdZku6BjXyiPoXNAxKnkMtK8Ur?=
 =?us-ascii?Q?cd8bjc4VkpMfmJnPXRuGlL9mv79Vd53fCZyR/7TzB/QMqQDQvTpnO63XN3s6?=
 =?us-ascii?Q?IQHuaNMu92Mq9JCkhNYsnUl+h8V0BNBi9GQOxcya/l1IgcKQ5+fkRowIErdU?=
 =?us-ascii?Q?Jy4DBIGOoegkXxeKNcJkGuVB0tuhI+lTVSpP12vQ/9ADkK5KEiJIQFUVncAE?=
 =?us-ascii?Q?C4Wfvr488GutM18LVTqRFuXeS/DE1FAZCXoq2zD9X7Un/FV0nPoLLMUz+v2C?=
 =?us-ascii?Q?FmFzVrDTAjlE/GHT4btV3kCurz7Jb8ZMDx0IJS1XzAzmBBUTv6Weo9Q1wV8c?=
 =?us-ascii?Q?ayNIVBJ7F2YoYLmeacrDuo/agpDneRyYUw7+fYGhXoOiCEqk8WTsEbgHsMmM?=
 =?us-ascii?Q?L9aICKbGvEhKh0mXcd7ykrvGcQaZec27i7ZBVoFsDFgjSI8Gc4gXE/LTBXiI?=
 =?us-ascii?Q?qk78Zh26RubhqpdFlvGgqaQjXgAVxag43DcGo/aeX7SK165fFJOogeD3EpLt?=
 =?us-ascii?Q?Fcv/WxjUV2NVBjbo1VjgdKuYGUR9rXFRBEdoSzbQPRPCFMdO8k/7IdxLZo49?=
 =?us-ascii?Q?8bSLvCKoozfzHfISPwJ9x3dHZ73FphX+jcHccZ0dUrKhFKh0gyUkxVSEHb2K?=
 =?us-ascii?Q?ZBa5TB70d7yzI8d6gvffBHLwx2/E6q+NA3O4K0CHvwrA58feLQlsoylON81f?=
 =?us-ascii?Q?hwKHtnf3MWwYiLOuFDriKbcyDPpuhE8rC+ibZO0itPuBFd9X8UqVet5ff7sZ?=
 =?us-ascii?Q?Y4ugNMFU8M5zLZxNn9+K0gpLjrSy0Pfv9MfLshiBLaTEUPNfdezTnyjd07cU?=
 =?us-ascii?Q?Whwjbv0qnO7e2wrcM5i8nFvq5+mmO/z+Lc32u13rjrlux/daXkuEKuHEBKyg?=
 =?us-ascii?Q?Ast715ugZ9J7qxFSCkDxS7rZqBOONfD3R2CUcDzekT91uLSJUt1El5ho9jik?=
 =?us-ascii?Q?F+b42ZZ2aGhTofi7wqLvR/+MelkCtUwkKsYamlcxnlbr+O9mCnB3mVh8UH6q?=
 =?us-ascii?Q?NJXT/gnB0ysqq7AQzws8t2CJc/kwlggYImMwbBT7jU6ZynYN5/3UJBldWGzN?=
 =?us-ascii?Q?tGZJ0tZuXc048rmiOjemInnj1aDWNjwG+P/yCdgtjEI+CNehHT/V8pZv325f?=
 =?us-ascii?Q?LhX93Zo3FS7YDWjHR76bEAs2bWJQbD6x2YmVU66xKISl7py8ItL2kc4lj377?=
 =?us-ascii?Q?umeu5GbO5KL5Lc8JioJDg6+1nVNJL9/NgKFVGq8iBYbft0ObWBYR1XiYTwI?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb7de44-5a6e-4fe8-2538-08dbcfcdd79f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 11:31:59.7890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR20MB4059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_043205_538014_E6FB92E7 
X-CRM114-Status: UNSURE (   7.36  )
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
