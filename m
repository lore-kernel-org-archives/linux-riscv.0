Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFC8606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 16:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XY9Q+AnE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=E4kfmVZS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vD2E7rutIQ8pAb5CXtTHXMiChMZkCv2MJY8uzJ2tvo8=; b=XY9Q+AnEfxK7JCL5CF2wGVWQ1N
	xL5eF3VZpheqXXNymkizEbeodQUukQx+dC9lqxYhz+pbS43qYuaCuWbXsnFxZjuj0ITbK25AJ2MHz
	XAxpSM7Nec7wBhkBJ0LrqiQEkz89+ILE6/g03YGhoJR0zMP0XKEWvhgo8Rm9ZkyW7qssCOJoMzO3Q
	KBlWe2qqzNVBS9jiHYgY9RQRl0MTnORT9fYomQR8pHCJqjbDJezIfcbd1DCs1wN21ekrrIG90J56I
	U7UvgQMbhWzKyXmTwhBlxr2Cfd+ILW0zEJlB6idQ1vM5bB7LiSS7a9UrkFWSiBYw8wxSiyV3qmBwE
	m89r4m8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcP6-0000000Dux4-0unI;
	Thu, 26 Nov 2026 16:33:00 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcP4-0000000Duw2-0SE3
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 16:32:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fA/rSXyCSDdLNU6RYZ0oXMgNV4ouZjX4r5hK89OPltsC3N/RavKqFNWLgQXhwwm06SwS9cVKAS6zEs26SUgCTnRaBgET94rzM3NdEgPNYR81JriVbPtoPL1fnzVyr0sGXoQBjOTSTM+AFtKEmcc0v0/abAXwOylz+CYd0vg9OIenOMYbajJlfU86yL5pCWX/34css2BsF+NTq9uNWXv7IjMVpdvceTP9F8sA6BAE8Sv08rtU5jyIhhMMNY5iz3OWl8s6Oe/v5J4XkE+MXZzmYgsfe3ridJp82rH4Rje+lmNKZqIeOj6ZO8ccFx40W2e1/uh1WaKZeW41Y3X7X/1xVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEGn39Df24JtmgVHmd5LW1qYkpDnGUDpZfQZeRt7mIA=;
 b=Bj56nCq4K+OPLqK9parLOBpl8ENBIwhtrTkjcIXBYmYksIY/e+SdcuDyytcVRnMsPUWyTh2SeveElSVSd+/1FEPNH54nilpz8aobV7qfuZXr7JUL/r3VXqsVW9LV5PyLQS0Y/L2vTgjIVGJCz2MCcsfWSlZDPxXs9WG4Ldxx5y6dfH1pj8z6opmpMk7L2y7N147gTJEQWvnxvug63UVA2aRvrYKOpJSULhuL9zciLVkWD76/OTQKX9wlMDq9E9q0j1r0JtQLSV9eOz9LLVw70K1XSQ50D+RkZNzQ2Pq8rAdu94ChFcvfus2SuaMi+Ucu46jRfQ2HjjK5AZrWWSIXGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEGn39Df24JtmgVHmd5LW1qYkpDnGUDpZfQZeRt7mIA=;
 b=E4kfmVZSsZ3hGbE7a4YnAQidV0Ze+A68aHrY1GgrpfhBYJUFZkYMVDsybmizFIar48UM3vIKkoNq9AF3o/doZEysnHkDGqi2yVR6yHPPt9ftVcaG5OelimC4875d5Eo05ktHB/zYxx131ioWDW/e1wexLqLkxGmAbeQDnj47p6uuvJ1BNAAOxTpkTy5OcqUrHNxvoRFcJlBTBtkMl2UgGwsLLhdyrs5pnO9amH3/Sk43HWwfQdGk7ohnvHPleaWOyOtZVUJNef9raWeq8dCliWlTWZA1YW3zjLb7nVQRjfkdXwP7oLhi+co3t0q+A4rFx19N/Y4PNOoS5jxasKPh7g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by DBBPR04MB8009.eurprd04.prod.outlook.com
 (2603:10a6:10:1ef::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 16:32:53 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 16:32:53 +0000
From: marouene.boubakri@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radu Rendec <radu@rendec.net>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marouene Boubakri <marouene.boubakri@oss.nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/8] dt-bindings: riscv: cpus: add OpenHW Group CVA6 compatibles
Date: Thu, 26 Nov 2026 17:46:26 +0100
Message-Id: <20261126164632.978624-3-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
References: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
X-ClientProxiedBy: PH0PR07CA0069.namprd07.prod.outlook.com
 (2603:10b6:510:f::14) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|DBBPR04MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c2eb52-ebb6-462b-3f58-08df4bdaeb46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|19092799006|261022075727099003|10067099003|56012099006|11063799006|261026121527099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: TZtMLE9ERPI0JSLGC0Z59Ew6otSHS97xchLWp5Ydzo4R8YNz+3cOvXvdnck8ebW8XQTM9cJCP2QU4MluKe3Q3lUPKK5J7mr1H982YT0/ccyIyOrMSXJDa0zp3+qzfHTu5WU0g6m7azSdxN1blb7W2ZdmY3Z+E8dtP4pttQ9Kl+0+SSs6mLSy1a52maR+USMOSnKfl3YzA7rYhShiR/d4Megq2jmhiHvFYvmt9YhRfatpilxdxOHZux+L577CqZRdKz8pVPoxnLSvIBcXj9rLo9s0L9Vl/Nc76z41GPQtGeOa/n1OqICL6XZsj1OtOcnMOIibwX1Id6nJFZEmmIVthwm7wAch2l989B7mTWIyiMQizGf//ogq9kxpH8GJPWi5Vz6D8V1eSX2c02atWtMS0sqBmHEiEaoXEJEK6sQzoWDzV3xDK1lVhgkjvmeVIM4lStdIfF4nmibQhFpo8NJbFuiisO0wrBES+UTSfKC7z/rA2abhfTJEE1Fi4235QrLgZyqVmyH13IhSgfRsPfzn601aAuBG+fpdzJDOhsXONo8gsCKV5nqZ09llw0vh7Gghf+lhQLSIDB0jDFEEXAVO0Xf+9AlGgb6msFVpngjvvHvW3n4uOfKyeZ8FUGF/4q4uM72BPTZAzAeSLqA9cW3O14N6StWlXU4Et+vfXES63do=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(19092799006)(261022075727099003)(10067099003)(56012099006)(11063799006)(261026121527099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yru5ZF2eVULo+MqUOREKW145HrzIRirUIioJTMQjjeeuw7TBIEy0yKpMaRk8?=
 =?us-ascii?Q?sVDrT5PI5VvMLIajiIRW0Y5i0pUjGYNyspWAGPw9pag29vVfAbdAStgRGxqP?=
 =?us-ascii?Q?+UJu6l0hFaCGu3G3sfDyfgzTy+o7sshnTGNLhHBLCiFuXCALtMCGoQRvRTJm?=
 =?us-ascii?Q?0u8/yDoL7PXd3j+HzsRKgbWmSJUATJP6IDm/FE7f2V059lCfrLVhASLzW054?=
 =?us-ascii?Q?D/7PprdHraRnLoPSMkXdQJVqXIvBVv9kL1ytkBIVk6ClLsr+DS+QMqfcAfxb?=
 =?us-ascii?Q?eJccv4uOzuPLD9TvZw0UkSwZChDl3NNck4ktqb6Bzdp5WhJbjp6KrfmsQw9B?=
 =?us-ascii?Q?AYXp0mm8IDvmOKdlo7ENG/y6DQrjzTor+4bh+JRIvHEicHRHFj2iP2Y6UO+/?=
 =?us-ascii?Q?bIcA1kH81peWx7j3Tm39Ty9pbsxfGS+stDHteiZJNtGRusiCcB8j4Mpo4Kki?=
 =?us-ascii?Q?S1/qxgKLB1Wo2eJss5QajMULpX9TJletk5eHRnp15p1ZoK7L8VVSAqBkMofC?=
 =?us-ascii?Q?NzSNj2WmIfCxXHgZt51wcDmUeOjP2B7JtUVRw+hdQPLq72hMdro0954rp6x9?=
 =?us-ascii?Q?J6/lyjoOy6jlJPpyGF0gSBRsLal5QmfVzxRNCq48+Esfu//y7btQZhVdComZ?=
 =?us-ascii?Q?/5lsjX87VjfHnf/NiMH8zJpK4J6sDKu0/6MEAXjvooQxAF+/AaGiZwhvEDFL?=
 =?us-ascii?Q?mvULd2erOQxm7Nq9lzBIy2SL7k7cgGus5nTo69yNbwcl8KcBHeoCsfSUz/gG?=
 =?us-ascii?Q?NrHD9UhfIVmZWJal/bM9z8Y6zlvh4+bUhoKyzmot3iJFwflNX1Sut8AWsTAV?=
 =?us-ascii?Q?iYAImWyk4FAGAFFYDSO/6yMgbD4wOQmg+Vhz3xnL55df+E1o9Rs0maRkUIIC?=
 =?us-ascii?Q?UMV0IyVcPghKf5oNW88CYpCGFhg3cxi9Nfsvy/5dlx1dlP7EzaC7j6ghJFtj?=
 =?us-ascii?Q?IdBTzhcsju9DrG6fYhk4x+lQsIjdEmvZ4zPpwnUHCZeq+f0hLUrix8A/pj3X?=
 =?us-ascii?Q?z0mfzs9EyZDmxxyyZZ4KiVBm1A2pMPDwQgDEDFO6OPx8SRu14fLLM9XjqKVo?=
 =?us-ascii?Q?ULSHpIfQMJBS0oAPuEXZItUyVjy75e/3aBhfnDBzwMPyKp+dc255qqdMNfRz?=
 =?us-ascii?Q?BjqR9KDng9T/jhkiboaxnqcNVAFYlANJpCt+ToJQvYa28ZcmuMt9Kt1BQYyK?=
 =?us-ascii?Q?/ZlyuPKmoQtpT77XXZH19Txybs2vVAyPnV444ZpQumESqftjY5EcMVUII7HD?=
 =?us-ascii?Q?XSfp+Y1eXvbOI/AMGlW/HlNPwSO/QsW2Q+rfHhf2G6/dCUqD1FwGf7eznuRZ?=
 =?us-ascii?Q?uRafwQOSmQbtB/7CXMuVhOYBzqdH344JWmyDWR00Z8fTGqXlWLV5al0NqB+Q?=
 =?us-ascii?Q?vsfx0WQPcogYY2YJXslVdoelMQuJa9wIgh3k2naeJGXV20B8G0WdcwbWWb8d?=
 =?us-ascii?Q?LRL9p//kc8pxDDt9vpcFjAMufS8euHOJhXzDQ/yQ3xIBm2uT4gge4LGycUrU?=
 =?us-ascii?Q?+RJcR1mzVV6MUGg6t6ZGBHifb6SMJFkFjBo0O9PuaxX1CKsuCJ0y07OUP819?=
 =?us-ascii?Q?26qjYr/3TvffLUIRG1sK6YLr+cl9wS7EXXXJup/Kotp+PZlQY1Txgw3PLKb6?=
 =?us-ascii?Q?G1vYoBfRHqvoh5Nro8pR/l8ZWyO76xM7cmC1jaZi7as8rLuGe1VaM8xnCKa+?=
 =?us-ascii?Q?1E+3GDauMXa7BkQ48Hf48uPLPIki7Jzj0Gx6AvhvsiBFpjZ2+IilHnQD9oPC?=
 =?us-ascii?Q?BAHAVhV8jpA1Cv433ttgZl3fCmsPKFrS81Ot1DVE8wzAqknraHrbFkEpB01S?=
X-MS-Exchange-AntiSpam-MessageData-1: LnO7McEllq0S0A==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c2eb52-ebb6-462b-3f58-08df4bdaeb46
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:32:53.5371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tUf5onDX7ZJmyyz6XdzKv5vrPib/R3cQOKVQRwBOhnHE8CYp06eBQiivor5El/8QwaPbNbv4f0rViBrpSDmPTLXQbYouHT0b/4JfGdUGqVTi56lMUp/fLVD3DM1aE754AYrhCox+NBr8eQ/LrOYj0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_083258_151982_0B3E104C 
X-CRM114-Status: UNSURE (   8.03  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

Add the compatible strings for the two configurations of the OpenHW
Group CVA6 application class core: the 64-bit cv64a6 and the 32-bit
cv32a6.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

Notes:
    Changes in v2:
    - Collected Acked-by from Conor Dooley

 Documentation/devicetree/bindings/riscv/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 0da219ae67..81c3a6cf91 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -49,6 +49,8 @@ properties:
               - andestech,ax45mp
               - canaan,k210
               - nuclei,ux900
+              - openhwgroup,cv32a6
+              - openhwgroup,cv64a6
               - sifive,bullet0
               - sifive,e5
               - sifive,e7
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
