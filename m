Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98637C072A2
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Nov 2023 05:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/fbvEdDuqUxXD4zH+A8fMiCBS8ndU4TNlcpHEvD55XQ=; b=Zli6LoRHvqTqVz
	2NSeJ3Y3Lpl2LRXqzq4TiHuS332J1g/3SsLeIpPL40mW2a7fLD9QkLW7SLDwGyX9EbfrfZVHAFvRV
	t47W2yJpQUw5EKU5oIcs0Jn5gxVCrO7AdHsWng0hKtDOPmunkn6H2E7bT6hfN+thwKwJpEvtnM8/t
	RNYr12z2+n7HuzeHncBDzZ9jMged7w12Z1XRccKFBJByd38PlCaZnzK3PQ+FV9qImMdqduKkkKKrD
	yN+9hx3CUry7AKflqljotpJ+V6mSgcZSOPKU8ZQmSP57o1vqtFMocmoVFPtMn3iVr6Y2ta3IIx0pO
	YESp0u1sKtgyn119q0SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3r4W-005eD0-23;
	Fri, 17 Nov 2023 05:07:16 +0000
Received: from mail-co1nam11olkn20812.outbound.protection.outlook.com ([2a01:111:f400:7eab::812] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3r4U-005eCS-1y
	for linux-riscv@lists.infradead.org;
	Fri, 17 Nov 2023 05:07:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6yPF12qnAAecX1IcPh273//ayW0mHU/DrtWZ53JFUgqpqcVsfpgbKRmSC2ed+6fwIxiPklCL+FzJqKI1GbYMJbTMyrfUHioqtnxM/mroYLrEsawRTf+mvaBu+rd5sF+Kqg1ZLvOHtA8jRk/uvBAylqUKaSxbcItX7jH8CvIlzCWJuJJdqpdT/9tB6ySr6X2pv+iWI/CoxgX/Qtl51p0YuM6AL5amNR7XZKkyr3TosVtRmzeY1dUATV4q04qWTthRGex7RvtarY2KrhvxzCAZE7CLAlD/Bak843sIwjliLoDlokQBC3ToTATM82usQ4kqezETYOdksDxCTXokY/z0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVVok41ntW4AZpNWiDwxqA7+HHoXTigliRoPhyWxEJg=;
 b=Y6hdiVUwVnMOr8Py4JNG4Xi52zu6BMCtmESTs858ExVNLi1Cr98kVeuhnyQAULppLtrRgViTg7Lb7sOLu62FbVQlrILedz2D9V/IbW8iokvM06wOcjE3PoEFIA5WMzx/hmFr74cnetdg4d9WVUzRvPORZJ+lg3rygfuMl1VWv2PnbSsplg1T1sHURVY87J4Mny0uo9v4Y2Vy/PhKwoM7MfOMmen7VRfmN1sjvWWd2+HkJMEcpif40d2s0z7WLEVDoRYOdBC6Zw2xAqFLDoEAK7yeh1t+DIbGWG4utgA7qYgeIMXZA3N2b1UtnO1nK7gtff8g+bYNsmurFKYLq3+T3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVVok41ntW4AZpNWiDwxqA7+HHoXTigliRoPhyWxEJg=;
 b=IG/LxlAZzp0okLaq9TlF6ysz2BcRoWfFyAPaA1cKSPOXQhhz4j0YkCPfwvUiWMpnfRUh5GxfR8n63VJNdZGQYUcDII0SUvskjAMUiJmkW/eZWMPEUJKhFqeAh3S9eF5QX5Rk5f0gd73DqanwMUSoIKq3nFqIPxpnndwWIsc1KrkjeX16R38RrptQ7+0k0RPXUwDfnkcAOwqll+iq1hD0Lgi4QUxiLhYZpY/Y+kWY85IB/xB0lG0TgODvTrvRgpMAvmfFuJ+hbIeHMaKIFFYQfhPWIYmlo341Msszca7sBRVnk7Y8wTR9oidfEDYm1gxBiU1tM3o42qHdo+gYATv+Ew==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH8PR20MB6394.namprd20.prod.outlook.com (2603:10b6:510:25e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 05:07:10 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8%6]) with mapi id 15.20.6977.029; Fri, 17 Nov 2023
 05:07:10 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicorn_wang@outlook.com>
Cc: Guo Ren <guoren@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 1/2] dt-bindings: timer: thead,c900-aclint-mtimer: separate mtime and mtimecmp regs
Date: Fri, 17 Nov 2023 13:07:51 +0800
Message-ID: <IA1PR20MB4953B8AC5CB8F8165A09D118BBB7A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <IA1PR20MB49533488308F7317C28AA6BDBBB7A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49533488308F7317C28AA6BDBBB7A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [CtkaZVH3sgQA6kp0ljxE9g1cmBANVTPY2+exiuNkXRg=]
X-ClientProxiedBy: TYWPR01CA0005.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::10) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231117050753.870596-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH8PR20MB6394:EE_
X-MS-Office365-Filtering-Correlation-Id: 391c29d7-642f-495e-27e7-08dbe72b0d58
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cauMbzfeIX0Gxr19si52vklWp0FTiSsVwCEBpavYZzXf8crCBWtkVYlDsRHzxkraO2uJq2JIMQfz3DpiY+vcPinSryq3E1Cuf8sQ2llfrjsAh4jQ48u3cdsF3tiQplUXEbVVM/JTbC534A9oFbDbrMLEjpqanT/N/jtgFWR7YjPmNvlW6GkbSsVFpYQpZh8pdJDEuRY0vKzHXp49xJ7wzGLvAeyERThgt/ekODwsP3wPr/IBlaloci8lNhCWChz9wTkoR9hXT49TN8hgH94dWGdABEPAa3bi4uUnDVNh4DTxjJI//PLhcIfjnTfB+fqLDsjqBWTqRPHp0sBnEcU6qBcGcnPrGxlptuNcCTy2z17/ZR8J1QJyJRQvqY9T9sRnGde56yUgWPHDfhld7hlyHpS8YEqZJa3OsMN/pALCuM2SNDoDzv93MAMKzw880nggNvDTTe7u0UOQXcZLgo4of+O52Q9TNyagMKU+6C1EBgJ9/u6af+Y2sqdiDeXF0a9hYI2Th1ZPpWlC1VFT2/8Iiw4sWtTMo9lKRNrYB+pwcC69r9c6oBs5IghVxLkA+gtFbR+tUzhNHSTHKtsecrQRiYSwBf7g/Quin8kba1vmoiUuASK/Y6pJE/qdjj/n4IHJiyNaQxZjpRJXO1leieN+MJ3Z93Gtp00obxVRphBn5TE=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/tHDQ8BMl/S0dNoHBy+mW5ht/MFRLhvMPWavItbcJZuYKCKnGE0dlFV90djR?=
 =?us-ascii?Q?VAaaZeMAs9RN+2nceyqrGmNMfJPgXfnlje3wLZkUA4kkb01awwwGqp9HyVQu?=
 =?us-ascii?Q?HBEp0C2vck0mn6RCpBbAxCNE/61iTGDnP+EDEcvdl34GELs53QFMovHtS22T?=
 =?us-ascii?Q?iOyVqWENbmU0zOJrs5dCfkPQQCW7fm0JOXpE8kJCPD5Xurv8SfnXOru7qS7z?=
 =?us-ascii?Q?F5+9YCd9TXnl7w64K3AbRFssOTAc6Y/NZuvCwSSOvS/xWoWdC0oJDeTbAQSI?=
 =?us-ascii?Q?c1den0KKtB/6NlT2CcpYEcle+sWM6Wrt0MrFI8K9Pv7OFgF9qRB2VUHo5EnD?=
 =?us-ascii?Q?oClV6kyR/zs3ny8JCMeg0QtMJy8e3P2U4cXiAs2Pzn3ycDw/Q5pZpcjHQuY9?=
 =?us-ascii?Q?FtFkGsPnniovZIZtWs8JPM/tQq2oV+Ck1cFEb4L/2m+w4pi3qYRHwE7NvAls?=
 =?us-ascii?Q?Z35AC8vyL3ZqXbL4rNdQUnYtrKbOPdKxBVCkAEXXQwrYiZc9yCC/iWTKRfw7?=
 =?us-ascii?Q?AlMb0lkfRpbreBGmiWHl31Nxt4TuGeA4gWJnadtjoFC7T0O1ES7H9P+pCtiI?=
 =?us-ascii?Q?2YNMjBWlO30Op3FFfx5VIO1XTxZI8OS6aGHQ2qJRoYXE4dITFGi3Id7kRC/F?=
 =?us-ascii?Q?SaO3ojVQs9vhC5po3G6R3E12PLK6Sxs9B0l2caBfakjKu+Zaa5EYL+qGhZNT?=
 =?us-ascii?Q?e8bt8BpZBjIFrA0fhKwbnnwKqwvj9Kfr4LBeUIymuMaae33IGBq6X1lPyVRh?=
 =?us-ascii?Q?V2cY+e0ugnMguLeHkvo/mgdDiYpKE1CW/yfyWPJmKosEvTBslVc41bltO5/m?=
 =?us-ascii?Q?aQQX0cOWyDwRjOWGuLxWUbNfIGJ0PaHSrf5tTmfp3KjpIJyh9i7Y3u4FfaOz?=
 =?us-ascii?Q?OSwHIQhkTnX7U6pC1H3JJ8bHS0jb4qauDa2SBzX2GB3IBE7AEG5HQZdVoQY6?=
 =?us-ascii?Q?da6XQ534DiEuDJE/r/KJ+gNkIe9eBuzVRD17Q6Rt31PZpPb73xKZ/Hs5vFR1?=
 =?us-ascii?Q?vPv8wXMJFAW3D3mr6ykhsBrFILWXAE5n1+TSqdKC4Y3bttObeJL6yTxqWg2S?=
 =?us-ascii?Q?jUz4PLhnYwCFgeKJaca+h869ohRsI5D6bkuxcEacUYVQwDZ/3Zy5I7hs5wZo?=
 =?us-ascii?Q?tYpmTh3NRxzfiEpHtyLO42vT2dIPY1pvq4GnSz8gsGlEUtkmKdXevU194NIj?=
 =?us-ascii?Q?mmNBdVKUYPFFLPx1v8DM9+L4MiO5b2JTTQhzNKhMT+ADDn3Plqsqg5kz60U?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 391c29d7-642f-495e-27e7-08dbe72b0d58
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 05:07:09.9184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR20MB6394
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_210714_673932_5359AA7C 
X-CRM114-Status: GOOD (  10.62  )
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

The timer registers of aclint don't follow the clint layout and can
be mapped on any different offset. As sg2042 uses separated timer
and mswi for its clint, it should follow the aclint spec and have
separated registers.

The previous patch introduced a new type of T-HEAD aclint timer which
has clint timer layout. Although it has the clint timer layout, it
should follow the aclint spec and uses the separated mtime and mtimecmp
regs. So a ABI change is needed to make the timer fit the aclint spec.

To make T-HEAD aclint timer more closer to the aclint spec, use
regs-names to represent the mtimecmp register, which can avoid hack
for unsupport mtime register of T-HEAD aclint timer.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Fixes: 4734449f7311 ("dt-bindings: timer: Add Sophgo sg2042 CLINT timer")
Link: https://lists.infradead.org/pipermail/opensbi/2023-October/005693.html
Link: https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc
---
 .../bindings/timer/thead,c900-aclint-mtimer.yaml         | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
index fbd235650e52..2e92bcdeb423 100644
--- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
+++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
@@ -17,7 +17,12 @@ properties:
       - const: thead,c900-aclint-mtimer

   reg:
-    maxItems: 1
+    items:
+      - description: MTIMECMP Registers
+
+  reg-names:
+    items:
+      - const: mtimecmp

   interrupts-extended:
     minItems: 1
@@ -28,6 +33,7 @@ additionalProperties: false
 required:
   - compatible
   - reg
+  - reg-names
   - interrupts-extended

 examples:
@@ -39,5 +45,6 @@ examples:
                             <&cpu3intc 7>,
                             <&cpu4intc 7>;
       reg = <0xac000000 0x00010000>;
+      reg-names = "mtimecmp";
     };
 ...
--
2.42.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
