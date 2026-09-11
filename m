Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DE1C88E4C
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 10:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nad7hzu2vGHPNgRSlnkPiOLjUpg5CucCQn51tPC8/XU=; b=IUDVI1e9xQV9b8
	VXTVNBQgG7gtDP6wErNCrpsZ/Dzgn97yUAqIa9oIWGP+pcgBa/LTLtMtHJDzPj3MeiDF1Akfs8Gav
	IWxp69tl8d/8jA2D2jpRbGKwYAX410T2ouvHDCcDBrd0Um9z0hU5W0pM9L+2BD2RfW7wGofCP3JHT
	KCOeSThZ9s3mUMOc4kZ8sIM8qkWriBaugyqer2eKWqVVFKNrVpzYBWMJI/O27JtruzPusMGW6A42e
	PkZHPUUtWsquvlLDcKfFFh2ZFyvYeHj7uRHgeQ1knO9OIaFc5PCfe1kR9+y5tkZUSPANXj4f9iJfn
	uInJoh9li60aXD9pn4NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yJX-0000000GLiK-2TtB;
	Fri, 11 Sep 2026 10:16:59 +0000
Received: from mail-sh0chn02on20730.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::730] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yJU-0000000GLeI-141r
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 10:16:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1+Owny/rdGOR0wERoNNPucbToRSXab3XqAyT9CAD45t5rx/TbZY9/OPmR7Cl7xlAMvnrsngw2NUG8Pj/ZauLWcy7cpoVSr79s5UCeXu+nsdmtDufL295RDwQqIxtnfoDp85lveCFy2xNcCJ0RoAhAnRST/Q4QzUQ49/h9ZjkArnFZEzyBUV7CcO1+9DnZiCKjZWkWeEDyZND/cXKTFWnFNteZ2tjhwgoE3+eEHZ/K/URhjfmZwe+0kaw0EEx0m9moPhyDp9bwgkzESjyP/smVoNkLEt4Ud45SDy4fQ3q7AHJbY2RPbABHPh2RIAgpn48z/P6rcnHv0+gRb721yVXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdpCjoELuJH6Snuka5/GIFNUp5Vgj/T7skGqEKMnGJk=;
 b=mZUlVoNVifvXQFgxTYOnwkZ8RJpXrMjA5jWNaam+y0BVnToXR6JCJ56FoRJaVHoVI9rySOwFrr1ItPiqW1UlbAyAxPAk8bNEXo8XnDC/0KLRf9lNYkSjhseuDcvlzPJhzaunH8eABmRjIj2bAgAt715GeccRF16Crev5+xcmDVEMok0jg70Ra4W8igGjfmYw1bqiEohJNKTLi9GfSROMoYv3UDmTnbb1Ug7wHgo2cgXE99YjFwYEWwAdiAXRbGc09tGXwRxSe56hL1ksrd2TiU7+XGyVhL/fyvebq/E4TUZVIX4XdCpWlfxtq9DWy9sQCjOoYWszKS722emKKZOByg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1283.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.18; Fri, 11 Sep
 2026 10:16:13 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0382.016; Fri, 11 Sep 2026 10:16:13 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: hal.feng@starfivetech.com
Cc: aou@eecs.berkeley.edu,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	emil.renner.berthing@canonical.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	p.zabel@pengutronix.de,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	ukleinek@kernel.org,
	changhuang.liang@starfivetech.com
Subject: [RESEND v22 1/3] dt-bindings: pwm: opencores: Update compatibles, examples and maintainers
Date: Fri, 11 Sep 2026 03:16:05 -0700
Message-Id: <20260911101605.146710-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260810030714.48100-2-hal.feng@starfivetech.com>
References: <20260810030714.48100-2-hal.feng@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0008.CHNPR01.prod.partner.outlook.cn (10.2.10.13)
 To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1283:EE_
X-MS-Office365-Filtering-Correlation-Id: 94badc74-8b1c-433a-0bb8-08df0fedb55d
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|366016|23010399003|1800799024|10067099003|3023799007|22082099003|18002099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: 1DZqilnFcoIYiMcrfAFGQvNMJSfcL3omuBbqVSYVLiMajl4i9f0/vyO7Gxth3fkY1ax5H9NI8YiFVYg8zB+JSaPcYwD/8TW3ML46boJYuWF3Au+xxowv/emw17SgnHkVznk6F4/L1+nyqMHvnwS3Mt+9v6oUK/wCeppsn7q74/9rjbNmRW5n6l99OmTDQh9+L6d6JVxTgGAWxbnJrF4LaoDnOD5g8z98oAtR60lJ1yH0/lFb3CxxtrpzQw2EssIZzoA8sZ480BNjI0KzGgZ0EIk7dv45HSn/DO0Rf2R0a19lhSC6g0ANU7o7LC1c96E9+1QGOmOSPdBk0y8L7qVtSKsY0p9NjuOQSOV+LwEZ0XnhUFIhxtisVfxI61loVljngCA8X/3yZ9mfLjXb19nTQmCefn3Gf9fA4XIeIq0+uBYd9aqCmoofedj9IabBC1RBRArHTBx6gIFpF8psW01LMyggOmwpgbe9sRPrU3FBmHF1zvc8XGm7+tHEI1puC64ltlmHQ6GcglFU1qRdkfSxOfN0Fy8lLPpNEATPR+aonP/wrkxAdO45ahAmJDiWftEv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(23010399003)(1800799024)(10067099003)(3023799007)(22082099003)(18002099003)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5zsXFJmNUMq7SRK1GzdmoLYxilk5u/PiwMH56ZLDN3KXDkxJd3wOotvilD48?=
 =?us-ascii?Q?QWX6hEemmMgKzjw2TXCgqj5KBbebc8skfN/srU1tZ5QI2R7DDGvjsuzbhZAp?=
 =?us-ascii?Q?h1/zqIqTX14LMXEjVXJlQDquc11inGpbxPSkFl7lE667dxmdeeqAnmGaLMUL?=
 =?us-ascii?Q?EkK562CwjfQRPTHTHz47mg7aRzwenVFYpzM6SG65TRhvRJA0CnZGszyvMWXs?=
 =?us-ascii?Q?MyCWaF5531ILvcTMIuniHdoQQItRFQEzYkHd+NbHsm8FagGD0GdnqrKIIHTE?=
 =?us-ascii?Q?iKVXotybw7gnJyou1jjLAlCNVevK5tZpQjoKu6/UNvD7TeynmxAEijJjvJSB?=
 =?us-ascii?Q?dQzhuBfg76ttvZ53FPb9se/Z6EGG65Tn+c25t44Cm/NsHr5WoqXv0cMlBML/?=
 =?us-ascii?Q?kN+fK/KHsGQ+nNQK/pnIkJufTBE4vJHny9lF2jF+3RZbP19yzw8trFlTswDY?=
 =?us-ascii?Q?Xef5vkJHE2O/Sn8OEIaIvW0/7V2elUPN1bzYfMAkrp9tESO3rj791Qws/NmS?=
 =?us-ascii?Q?BZCaI65o8jc2tyzFFLSlG7WBHYCKz2Q6pgDM+xMq/I9hlrFlqEVmtG77JpGj?=
 =?us-ascii?Q?7KlnJeYaNGc/aMxYtNAnnyE3VemxMJI8F0CmlHsC+VzXhuDFDyuqXxVPGqYb?=
 =?us-ascii?Q?kfPGuElK1rKQVuwwZKMZsVBRjoMmu9sMHi/vS7K2EKQbBL6trsW4CX3p4NGP?=
 =?us-ascii?Q?KvngK5t+or8SUuYZycmytVvccVuweiyYxQ/CU5ASHpo57TDcREp5g6PMDhEK?=
 =?us-ascii?Q?Hd89sofuURDUNmZG3hIJceLF6viDgDuKIuaI/qXs9GQujcT0ptT/9a7Ngu9k?=
 =?us-ascii?Q?Uy1o9ilaGg5mQ6bGBmu9XsD523tUWv6NqwOaNdmiRUg/PMsJif/Lfl0cbpx+?=
 =?us-ascii?Q?cqasrEYPn7n1oGOmG4s5aXmWt/aj0zT0WYJDFH6V7HcPm21T5HDtny84oVVI?=
 =?us-ascii?Q?XJitGC7LV+gDzo+27891YvlSm8N66Y43WZYI6oYydnEL365iiOU2EuTYnst8?=
 =?us-ascii?Q?ZtcX0c1trhrZEreFKiCZPlK3RklHMyqPMnOgQz2I+FeJPsctsjMCVuddN8hV?=
 =?us-ascii?Q?XtZKHlfa3axQV2EGQbX0yNOHUKh80Rjw2w3cZoZ1gO5NlUP+dGv8UzSR/YyE?=
 =?us-ascii?Q?r9z1vKIasdUpe+t9C3yZllKPQn2Wt5fDh7q2SofYuMts9ia/X7X8ShOLw6kh?=
 =?us-ascii?Q?js0Idp2eNw0cMzj6AWykC1s9G2rzVM1f2D8kR3aonU29Xf8Bar45kZPJZ3zu?=
 =?us-ascii?Q?fTCw+BFNzYCteoDqEccC/nSX99R1Fx46tZmsH3qV4QXGvnzro2kdn6yPIma1?=
 =?us-ascii?Q?z5oj8yfp9/Z/+NEUAcex7X2l5vhYLAHr1FdDx7g9Qt0nLNiL3Z4VeD4QUH/h?=
 =?us-ascii?Q?EGhb8WLpaA0A4+Lon3weVNyLJ1GZiJmJOLxETXtfhkNLV147KXeFK5g8yFCB?=
 =?us-ascii?Q?+JVFdPJIKvQkDPXOOUXc84H/rwV7TSgv48Db6XLF/kmlvH1TfiiZ96EQT7fp?=
 =?us-ascii?Q?h60QDF/ylZoukyygM62I5I8iZhZdeEe4fVCMHGB/0yniVp1Oo87eAP2mQuNL?=
 =?us-ascii?Q?5F/l7h1fEK0yFNf+EXSMaN6SQZaz822ye99ObZkzkY0SpQVm+Rd/u00nkomQ?=
 =?us-ascii?Q?4IlEbo+crCSdnF5Izw/owkSCEebNTLQMU8h+RAZynQ2rNFoccEQn+q8CnDhO?=
 =?us-ascii?Q?h3pUucycIlb3OExesHhwm6iASzznx5MfCzokud+5SBi/uarY5vGsgSJtpez4?=
 =?us-ascii?Q?b8XAAyEuRJJ4v+rMPKF/AaZ6DM2TC/RKn4uJc4aA1Ow82YXIxJvo?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94badc74-8b1c-433a-0bb8-08df0fedb55d
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 10:16:13.5922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wRcDelnLYH85MKID+jlcWO7X/T8nebifobTA6+lFtMs+PefOvZlXVo4LeEjOTmdRdvDHDF7KyXNsoFJ2m8xPPDvwahZLgcWZjoSorPpmOLiIUdgQS6aXpFEAgAUpNGWP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1283
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_031656_325653_88CB41B0 
X-CRM114-Status: GOOD (  17.88  )
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

Hello Conor,

Sorry to bother you. I discussed it with Hal, and I will pick up this series
later to add PWM support for JHB100.

> Remove the jh8100 compatible since the JH8100 SoC has been canceled and
> will not be released. Add the jhb100 compatible to replace it.
>
> Change the register size in examples to 0x10, since an OpenCores PTC IP
> has only 4 32-bit registers: CNTR, HRC, LRC and CTRL.
>
> I will maintain this pwm module in place of William.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Fixes: 2529085831b0 ("dt-bindings: pwm: Add bindings for OpenCores PWM Controller")
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  Documentation/devicetree/bindings/pwm/opencores,pwm.yaml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml b/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
> index 52a59d245cdb..42c5d2b6326d 100644
> --- a/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/opencores,pwm.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: OpenCores PWM controller
>
>  maintainers:
> -  - William Qiu <william.qiu@starfivetech.com>
> +  - Hal Feng <hal.feng@starfivetech.com>
>
>  description:
>    The OpenCores PTC ip core contains a PWM controller. When operating in PWM
> @@ -23,7 +23,7 @@ properties:
>        - enum:
>            - starfive,jh7100-pwm
>            - starfive,jh7110-pwm
> -          - starfive,jh8100-pwm
> +          - starfive,jhb100-pwm
>        - const: opencores,pwm-v1
>

Compared with the JH7110 PWM, the JHB100 PWM has been modified. The JH7110 PWM
is inverted polarity by default, which is consistent with the design of
opencores,pwm-v1, but the JHB100 PWM has been modified to normal polarity,
so it no longer conforms to the design of opencores,pwm-v1. Therefore, I plan
to revise the binding here again:

properties:
  compatible:
    oneOf:
      - items:
          - enum:
              - starfive,jh7100-pwm
              - starfive,jh7110-pwm
          - const: opencores,pwm-v1
      - const: starfive,jhb100-pwm

Do you think this makes sense?

>    reg:
> @@ -49,7 +49,7 @@ examples:
>    - |
>      pwm@12490000 {
>          compatible = "starfive,jh7110-pwm", "opencores,pwm-v1";
> -        reg = <0x12490000 0x10000>;
> +        reg = <0x12490000 0x10>;
>          clocks = <&clkgen 181>;
>          resets = <&rstgen 109>;
>          #pwm-cells = <3>;
> --

Best Regards,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
