Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA99CCFA05
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 09:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K+u/geHMh8TcjCSi24Jn/sYmacWcNraHYtFAPnnuRNE=; b=yqRRum8AngKbFr
	CwbzPhdSsNc2/bSZ9k26YpAzG1E2Tqq7YTws9aQhT/xztzjEs/0hJxj/uKkmrZyCfw32BdxSKGs2K
	G2GREKRWvPYKbPRQgJy1FJa0wmrBkAHm6iltsDdRCbuJMAkVp1sdS/NugxOD2zRh4GhLRO5G4Xn3C
	oPTxMhg1i+pQEYFso9hFzwQ3TLxahF4VPj6kn9Axszf4ySe+gOeHzFV616JwLYlCPnEdWFyI3NKMX
	a+JUPqwyom4HQKeXxHcQ+qjh0vd+gNp3w1jdSkQYIlBetWZM/f8RXbA3HpHmFC8CmrpplXH06b4Fk
	09i00+OCiWyKj51aSwig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJCI-0000000H1cm-1IA8;
	Fri, 07 Nov 2025 09:55:58 +0000
Received: from [2406:e500:4440:2::710] (helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJCG-0000000H1bs-01Yk
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 09:55:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=duBQ2ge1405dCHHZPQ93zIn9xuVIP2E+yTqtpWIRh+OgMVufsAKw2RRfqJkq0vMlixu6pQVLlg0LpzHgpvJSNphnt/LtUMI1dTbt4k/Ik9NLrj78pyicPW91kUFGnc7ynSJ+QK48l3qgRz4/TJXKr1dEsF5LIjaUYBsU8glLAsZzLXVRqLG0nUCfZinD2do7wYCwizyChu4Payg2u0e0oXyGlH4fmfwZF3Rnz60uSfxxdqPAR3H7CxRqoVRGg9FJm4YQELMOqh8sCPkMh7GbuLkkGAqnGLA3glDz6WE3eQq3bnpI5NXjmOYIE5Vyp0QVpeIVkGgjHrSobyzivG7QmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RopYT9nzxjAG1AgJJOfzvjsouzhfjUNUpcWgGKqJh5Q=;
 b=EcAtN3MxqSX/J4l1MHCzXg6LCnw5MsdhWEUyKts1NUAN2lHII0dDAhc3SHX5oIrH4mSbiwLvsCafVcGnQjH59i6NmiyoeeQ+IzTYy9zTW19Ddp1HNFMp/jjPWTT34lTZSfP+4Y42S1gkprGHjrLHTSzYkTTyv1IrE25K3VHqvJaVbiVr3m+/RLn688L2oIf68cMVsseB4HSpZwJsjXR7bWugqEZvSjN0SqpqcIlnLxzfP30m1OMfHkJiTOJGzELM917NQy5Jp+K8hUHaN+sN8hfcYQrTORbt0CYItl2DddAZzD06sG0vpcn6v+japaLI7kc3lSM/cGY1LohrbWp1tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1305.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 09:55:39 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 09:55:39 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	E Shattow <e@freeshell.de>
Cc: Hal Feng <hal.feng@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] dt-bindings: PCI: starfive,jh7110-pcie: Add enable-gpios property
Date: Fri,  7 Nov 2025 17:55:23 +0800
Message-ID: <20251107095530.114775-2-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20251107095530.114775-1-hal.feng@starfivetech.com>
References: <20251107095530.114775-1-hal.feng@starfivetech.com>
X-ClientProxiedBy: ZQ0PR01CA0014.CHNPR01.prod.partner.outlook.cn (10.2.0.83)
 To ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn (10.2.1.78)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1305:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aa2df87-424e-47ad-9324-08de1de3ce5e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|52116014|1800799024|41320700013|38350700014|921020;
X-Microsoft-Antispam-Message-Info: bmPYnsQGobFnS83YzdcFKYph65yqnS7rsljac/Ik7NqUvJrqjKMnrDUJTbBDF9VzGSyPl/lKoTSTSj8KKyEmfB+CsHr0Kv5CQu8cHqFdbhAS3oU44t38fP+FW7LpCpqdH43PdyQz8oI3h5/0DXCaffT6s0YO05dVYR33LCU3u+22WnlRndRPBwKqfxPClgygAAcuZ7PWjAubWvh2idvJXshX0YMIsplfjxmI0RtlmNXNqIw31D7LgspjfTPzyAt23T+vjYoOCKIpAzPXwQtQYAXD+0KLETn/avl3SunNbQzkcWLafvdtbDaZUux0TndSQqarGNfq25r3HszJK0KwcFPl2qG62RHs6DgtFBTC5HVc5Qjx/AKnLON9kIdyuf21MvDajOSJZWlMwSMoI03yNb2lyM0gbnDx3CxO8omPSonIrjTGB3NDQgGHt2ENwRINHiF8OMCqIuDSM6Vbn9v4WvdBIjggIG0EHq61ZEDIQP1LarZLiV3H4yLtLzFcKbIHMwJVtQCj0inVokMf7NIEu8ayWwUXRWZg96CSiK83okkqorOuohFXL7IhK4wJljPijSZIaMQq3tplOh58G7OsAYHqt5r8mYhBA590QU5Jl2U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(1800799024)(41320700013)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mGLWjjd3DdEM5AQ7kYolD2QuxGvjjmFwmkNfMymG9MHnrE/FhbrdSy6uHWRf?=
 =?us-ascii?Q?m6alxPT3VqJXPi+SYgGCJIEWS2RTN55ukVkx0gyN8jlJGwgTBacsTn4spR1n?=
 =?us-ascii?Q?a9a3NeuecJHZgRke6H+uVxffu9xGg7OdAT2T9ngmIgr+vbcC1bnsgQ3Ah+Iq?=
 =?us-ascii?Q?cn2mFi+UDTfsF+jOSsia4pmAik1f/Md2hL8VtRFEZhiB7r6iLceTQcGg/359?=
 =?us-ascii?Q?UNG3NODERpsnGGpxiBkMnnfTRreG/jW25Z7OlPHyrPab0ZOxpBQAn2oVc3tS?=
 =?us-ascii?Q?uTYm/e5tmeZUYUG0deexeq2ptHwzAreH6Zu+iCWys72/rYkaur72CIz5dlfd?=
 =?us-ascii?Q?c+v6aUsMe9bTFCk9qpt6rCMTGH+6x1CZ4/kB3Bm5wNiHnepQjD/azTT6Lk9x?=
 =?us-ascii?Q?5J43/nCG1jkLfRKe8+pGs1mYoIciH3fvvQX7gmQzVZdUoMJ9/62sXlEZ4y45?=
 =?us-ascii?Q?NyTM1A8wl7qs59w3/cHcYLWTIP8m22vlmZz2CqQgTaBTFeJOCHrclEecjCvT?=
 =?us-ascii?Q?8opWj3U8hprSYKUbxjqfalA+4RHcTcWmsdLsCAelP7hdDidxBGDjops4rxLS?=
 =?us-ascii?Q?n4bkGfKW8YOJcZxjjsoziekfxnTsuNKKCmI6UO+fDmUG/FuDkamBSxJVSNQI?=
 =?us-ascii?Q?Eeh4DTtJAh4iiYzgRzeNMnrBDHq6hAR1D9p3YfzwmBFvtzTPP2+wAogxkuVT?=
 =?us-ascii?Q?rznFrrUzXKEPqmkZyNkriZM9NfuhWfiRi4jPJR2Hea45nTwzOm4LoZj2DeVN?=
 =?us-ascii?Q?Nyjp87coVOUpp/YSIiDiw4WQKs5cuBA2S47atNc8eV1jYWNPm4Lh3ZKjTmo1?=
 =?us-ascii?Q?lSotHmZhQ90l0d3p56Bg8PoeAwhRVN5f0E86V/E/td0Qf6roaWIBXPGIgSTe?=
 =?us-ascii?Q?smwP+tnvtOlO16gTF3Dkp/2NZhBBIksDDiak2F7rrHcnnx4JBbyX38YxcaPI?=
 =?us-ascii?Q?pCJFGO7jDtiWWaDlGYQSD7WK2iwv1d+SmXky7GugUTAAG4GQFrLnVHK7bDyD?=
 =?us-ascii?Q?bNl3NdMAP+JqndWLdjZaDNy0cJHXylMw2FJ0SktL0gueQWr9v7aIIofxmTyU?=
 =?us-ascii?Q?DPLjbzOuvP2ZUX3u19L6zmd572XgdadXoi8hL1d5cRX6kCFcCPlvSPh17+IO?=
 =?us-ascii?Q?7zIb1vN99UUO/Y9jd8BjW+MujnpQfbheX/1mnuOqNotQ7EcxovOcFxtBlmfQ?=
 =?us-ascii?Q?JXhdkYmhpALAwdPA9eX8KEO+0jo+zqkZvXeWavYbvu1qHWhjtYLhbG9hSAPv?=
 =?us-ascii?Q?P8YG1dHR2MzA8GzcX9/GE0tAbTSO9SG1jwdSMHD8zBLelyTYW2AyIiQUN5Ve?=
 =?us-ascii?Q?OGK0FzIPGYGiBaK+dHR0Sdo/skBZtcqZxXSie10cZtL2PJ0zEXpc8/MSEMvY?=
 =?us-ascii?Q?4VI+gh42cYTQ4yc+6qcibxF57fQUoLMN1n0JgJmEp3ixWRelyoSP9C0egCJE?=
 =?us-ascii?Q?BF8OQNlf4G8iFlbyCuqiDDec/IDcK1xY8N1kkA9GslRa+YwMSduIZ7U3ay26?=
 =?us-ascii?Q?59jUxH5JrEVG1A6uR/a5S4Cy/Oq3GAIVpIIjBs+Kn1cbLaPqmSlJF/4aKvET?=
 =?us-ascii?Q?L0e0LJoE/+/inRxVzHn1JwOeQvndqOMo5GVt5fK0g5XHv/fZDIV7Yk1rK+No?=
 =?us-ascii?Q?WA=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa2df87-424e-47ad-9324-08de1de3ce5e
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 09:55:39.1241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I9mGPjD4rU54fTz1U1tzYZOUydLohxXqMOfNv0I0eU4gXxRH6YGyshwpv8pdtRebQ4JcBBqrjGRg2opApP+obzzaA9rqWCkJ53BRdkOUs3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1305
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_015556_042974_1F79AA56 
X-CRM114-Status: UNSURE (   8.30  )
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

Add enable-gpios property for controlling the PCI bus device power.
This property had been supported in the driver but not added in the
dt-bindings.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Fixes: 22fe32239770 ("dt-bindings: PCI: Add StarFive JH7110 PCIe controller")
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../devicetree/bindings/pci/starfive,jh7110-pcie.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml b/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
index 33c80626e8ec..1e36f92ec852 100644
--- a/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
@@ -59,6 +59,10 @@ properties:
     description:
       The phandle to System Register Controller syscon node.
 
+  enable-gpios:
+    description: GPIO used to enable the PCI bus device power
+    maxItems: 1
+
   perst-gpios:
     description: GPIO controlled connection to PERST# signal
     maxItems: 1
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
