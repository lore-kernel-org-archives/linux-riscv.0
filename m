Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC3AC27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 22:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/LMdafBFFD3F5nyXKBCCiOt8VeiQJfLTtc/01shA1ws=; b=F8ra2COAo5/tnG
	LP5nF8S8JCgcGyEWy/IgENeTGS14yT0G7KY0QXxFD1JggcWO3BONKTAutyxlkTCc8PfJFmJa1fy0q
	ZOSY2jvF+BtPAafOZgIRcXKcGYuXJjaarA56VfRLdBSGj35SlViy5LQAUP/j4NCzuOVEgGBpY3Hbz
	qU/zIuLK7UgyxNUY/oLBRIk2HAdm37+YIKPrIwVPOaaaqFkTGnZ5PJjFBI6Q8iG7KxYzWmIhSIjhs
	nrFdlkQW/OwC6hUkJuuNXECBhG8Vv+3qaC+gJJ0BVX/DuJSXIB7TOg7O+J1fEWzIgBoFCY2Dn/fiw
	1qw4yCeVYPgm6DP6a7ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJhP9-0000000Gn8i-43U7;
	Tue, 18 Jun 2024 22:34:19 +0000
Received: from mail-bn8nam12olkn20828.outbound.protection.outlook.com ([2a01:111:f403:2c18::828] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJhP6-0000000Gn7Q-1YpU
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 22:34:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNzTk5htxZyF1cVdSxwGObPEHaz0kJsm1NeiyccHABcuSyrO8OdkITK0IpCfpmT/YBwMYVnaAgE1txpTRJ0CUsGCD60xIc3w2UeaMrpeo5gAPa2/gSFgzCChYI8nksMvDO37NA1DfVWtMZLnuseU6tMcEv468XhtwdsaZGdLhSRQyf6P3rILa5cZ2q+ibrXxXDMbdpaDz/9s1dC/9+D7+UPBs/XUUJwSGyjMEXgVEuradmsYz6xQ/1+RE6cHh6pKHjS4Vta74sfFCSx1XHEhn9zr/jzXr0Q1o1klDETTOVBKuq9zaW9WM2kmniS+KlJI6aMEXbVCg12uVBbCDtNJcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bCvbQac4zUF0boVxXFZY6A4wsuE06t5V22NGuixqwI=;
 b=Vh99zr0pCOP2ZO4DG26PYksSywXEKB8MYBslwcfDwekSJkU5REil4mx6Te0PUQuGTBuIIUEZ8/xk/sbJ0I3dkiaHJ12YL2yj4CQZiUe/p1UCXwLs2CKxDNNBRca815Py5jAIWZFpzY8yRtWI4OLW7JdzHo31mQ2s37XQTMMk20+Hl0AOui+M1sLTgrPhxGLuVrrAPDV10u0ZwK/kKEKz1hXUVsBNbqH+0FNxlPjJiVcaWBKfZoc4kbxyWo2p3tMI3zqvFdpnIwYN4T7LcN+F1XDn8bG4/NhSya74OEdlCpTtGyrXkBjcPardJLFbJMAXIdvQ0r4W4mRJvKy2zxlvcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bCvbQac4zUF0boVxXFZY6A4wsuE06t5V22NGuixqwI=;
 b=lKXAPa9udinmcXa7moG67OgyVwyq50q1kKlhIbOK1hfO/7l4kz78FxLmDlVl3+dBEzr69zcl9opo3P4OVEHsaYFle3moWuQ0iPUN5XBb7BFTHN0jr8I2odqG7uAaGZyQzIGYNIr/qF6Io5DAHXKuQA00fqN5IB1XyIPfhOTQwQXy9ySB9Zz1ENs7inzgLrjWmAFjU4XOyzUH5s31f0bEtCkNgRJFOc6LWWXsINhrHMNzOgYUgeYf+vRUEWVSoFvCLLNA51TRoSx7spm2AuMidI6OH8dgXGl7ymu1GuBT5ORrE58KyK1hQXUMbvPmkAhUAInFemh1ILtfJzCkdWlwtg==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SJ0PR20MB4535.namprd20.prod.outlook.com (2603:10b6:a03:3ee::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 22:33:51 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%6]) with mapi id 15.20.7698.017; Tue, 18 Jun 2024
 22:33:51 +0000
Date: Wed, 19 Jun 2024 06:33:35 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Yuntao Dai <d1581209858@live.com>, jassisinghbrar@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	unicorn_wang@outlook.com, inochiama@outlook.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: mailbox: add Sophgo cv18x SoCs mailbox
Message-ID: <IA1PR20MB49531E9C016A91E52F5D59C4BBCE2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <SYBP282MB2238DE0DA19C6EF411B2356CC4CE2@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
 <SYBP282MB22389FD1E07BBDC6FE1D90A0C4CE2@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
Content-Disposition: inline
In-Reply-To: <SYBP282MB22389FD1E07BBDC6FE1D90A0C4CE2@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
X-TMN: [1zWz3WTqylNaZvBLXmBPtPVXCnEah1RO9bmSegFqH6A=]
X-ClientProxiedBy: TYWP286CA0017.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::10) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <naeg6dzxevwsmkzy5jkzp3e46rk5fzxvb5urf2uxocanshur5i@ash6c2crcyfr>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SJ0PR20MB4535:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b412d67-4024-429f-b394-08dc8fe6ba39
X-MS-Exchange-SLBlob-MailProps: RlF2DIMZ1qWqSQaTqn7+1FJ7I9anhJr8hA5zuZwi1/vDPNkHUJa5POy/oBwsmbpoYJy1MKJcaoJwV0WVY0O30qK/uuC9VstnE/eyBfPpt0151ysE04sWRQ/Kq0+4WRQXCY2v7gI/pOehoD4F9t23FE8Hfw1iLvCpZRxdbdZjV4HTHdpkkz38u5n15BmlkeOvjy5IMn3IZvRhX9CeAdRc87tH6RZtfUYaw5i6GWCLYhvdlXSUA7N1Gw83W09IEeL4d00USb7CaIKtI9/NEOLQ6N655zF7Um+u52x3FupkT3ZzT5wmd4ZEQWd24DFkyMlkCEzbop2VcgZb/3p+UQaRPoHYZlAF568JKFJvlurqARbcFiKS9ai5+mc7Dnaw6wA1lsXYsLwq2uPizMu1dCKUk1OnSU5nyq8SzuVK2wSVBA2hE51ierKuqDyEAx2mXFc5z14P3FubXxKlGFwMp45FDElIDhaueWDNY9RIreHEgdigZ3GXfZx4ULFNH7Kp8LWnNh6xWezjkIdJ8AgY5JLUCy5vEMGwFdsQ+8Li5w/zmU3EpAurC2UKlJ+NMX0T21accfk6/6sfk1kkpcfZtZuuWFuyRlJeBUCSvgUUNHUwN6UJHgRo8TJppfGsjZqSHcfrDsThPzsNGJhSuYVHDghwJs5uQ4/jJWFUyohvm497Oq5ZQkgBrlGY8LJYc7kfi/64cn6N05V4W4Xh24bZppuNcB4aG1YQuTwkA85stM2RfpZMILTBJnm7MXy3yx0t8kYTbg7BB/MRFVa0Z/n8Uk5bbe+AyvyCLx0oSvWN7+dmiLcc3C7nwP1GrLuggW1kxV5RFkBUrPjbR7C4Dwzm+OapZlt3EyFA60fi
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199025|1602099009|440099025|3412199022|4302099010|1710799023;
X-Microsoft-Antispam-Message-Info: sh5cPvXd5uaC4jwykH+Jxb8+4ESkcVq8yyRYq1PZNQiPOgw2dEYJRB9C3e8LYTOdc6m4UqdiHMKjAhktIarVIAg0FEhT7LSzL+BbSV+ZSBoujkR/EGYxf87Sk0mAl7B+91sfYo3ebrjWEP7mgwb2BV71uYUioNRTROalb0G8h2Qc4nDIRbPrmJAu5j4T1uI1wo5E+Rt2ukBHCu7OdVRWrxnm430LHeNkpN+mhPuWKrzAbzuArOmAVKte29urita7yz2iA5l+raaIfYP46h7+fp91spHN3H9oxYTpWyFILgpZSyscLgESkcqgVN7SMRnfgTvn+1zdH9olEjuhlQkkMtTL+RAgX1qrBPYEuiMgx+GaBKlqbeVwEUL0jCHdTwD0763y0Hax+PWy2g2DRGkD/wy9fRWnV+Yb7zNQ/dVIlp8QU6pvQfCvtHmF5Z/EVXhLFiU5rHs8nzP3/7W9KrKM3SOoL+OF9W7DSgyfTtFXdg+aBj3Mxx6Tre/PigxvP4jMh13BQEJTCl3a4mppgonfLMkIfuzkRVblA/ff/2rTh8i2rQ1PEPYiUZgHxrm4ccz6Xufl1IVPPOce+MfjVxZikhUG+YIY0rvBAn7mCoDp9tqZx2y9jyGi3OhfqBzXa0O5lw2EIvHpo5AnQEX7vT3c+h32kpBFg+IUMehhOCK7e95vZuWDg/AUzlBfXWNSWbIBh6f3nXttDOM7w1Gmq/bY/nsLKttSqL0aWj925zX5d6E=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+EzkMybyVR/2Xuy1Ho1+W2G1hG6M19ONhj5N/T+GQ3YOL7r4kPah/Yj6/U/7?=
 =?us-ascii?Q?QaIsPd52fxK1hTTe4B57CNPj2aDXM+B/czmG68Ph9rCUoW0NlfK/39TxWCpn?=
 =?us-ascii?Q?zagC4xqpoTtyGyy0QSNcavvAtYF8IKd6ORaD0S+eYk79ubniuQsJwMuScogo?=
 =?us-ascii?Q?LQtXXh34y13Tdm8hQ5beM4owU+jn09lc4/QFxygnJlo0nLTyKVkD5CsRJXju?=
 =?us-ascii?Q?KFc7RopZKVlX0ahCUtVqbkT1NirY6F45HfPD/t/eJOXaZTbOmm8SiE++Qfdh?=
 =?us-ascii?Q?y+HXY/+MkfHFZ8NLEDrDgiEXfcOn5RLtnVRBkEw2n3bpA2a5tLknVIEjNBGd?=
 =?us-ascii?Q?5/8MfOkMwYwUTIsurlYYx8SoRoVyQaHXN+L6Oio9Gd6YcJdWutOpaMbfoLHI?=
 =?us-ascii?Q?mpwF67PFvThI+rhZJsBEgPQa26ShE4t/tbVhW+Hh97HgZq1s5+BGDZf6Elcj?=
 =?us-ascii?Q?2WJxJvh+IXgHLkkLo8vyKre7xOH4aybESTgUFP5mPIPr4sLVTuEzxv0RqL2N?=
 =?us-ascii?Q?rfrlKFZ3hE7L/RvppUbM47jgGmOOEq53LYbvf6qeikPKaEAjJIJ97S0f55r8?=
 =?us-ascii?Q?neBDkR3UsKxujm5tmjHpbWYrQjMpt0VU/OxMl3xK68Quollc/hmeVIFNHF9G?=
 =?us-ascii?Q?e8im6YcdWP7zK3RFiQxttMYed4ALWiHMJiK5nsXhDIm345ET3/1r27KQ2BYk?=
 =?us-ascii?Q?qlw9rj1CGy0oHXDHOzG1FydI48zHNYq3OerQfx+QKPdcnbwvMWorqhZi34Pg?=
 =?us-ascii?Q?UiID0VDSX7RXag/52mAidfHKIZNTGdYooVWzIgXqcoKe0LBr/9wfeon35bSB?=
 =?us-ascii?Q?GEJtZ8fHyxbOnprwvnNpVz78ktUj2NPj4xe0n7fdiahdbzzRMFkWh2NVuOQs?=
 =?us-ascii?Q?zKonGl05SUSRS++TsbokoRPLoPj6//Zy0VzNnOVKacE7aV3Qk3kxylAxUt9Q?=
 =?us-ascii?Q?aGRwWZBJZQ0kIX33Tj1Tux4mlG15hjAXHX59rgaDZMBCXAM1MLT/USIstWlq?=
 =?us-ascii?Q?HMTdUpnPw27EQU7p5Fdi8Iosagltzkfw7J+ooSsRLfCZZfceJLhkPQXreXMx?=
 =?us-ascii?Q?a93l8PpRvF8Ge7pLRMsBccwduCIwla77pOojAloJs1/6y1qdC4rMhtGboYQG?=
 =?us-ascii?Q?S//xjt3UZVX/rsmAcR/2xZecYGnZKSoLOWk1iztNVW9Yno1FxtMmITdqWYLC?=
 =?us-ascii?Q?ySC+kUYCCdPEzNoXoYCu3mvX/2fit68xVem/hRgCC0l2b/TSVWX8nDT44wSr?=
 =?us-ascii?Q?lS4xOdquUhWb3JqNIUet?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b412d67-4024-429f-b394-08dc8fe6ba39
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 22:33:51.2093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR20MB4535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_153416_440628_5EED334B 
X-CRM114-Status: GOOD (  15.57  )
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

On Tue, Jun 18, 2024 at 11:12:33PM GMT, Yuntao Dai wrote:
> Add devicetree bindings documentation for Sophgo cv18x SoCs mailbox
> 
> Signed-off-by: Yuntao Dai <d1581209858@live.com>
> ---
>  .../mailbox/sophgo,cv1800b-mailbox.yaml       | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml
> new file mode 100644
> index 000000000..e1868aaf2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/sophgo,cv1800b-mailbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo cv1800b mailbox controller
> +
> +maintainers:
> +  - Yuntao Dai <d1581209858@live.com>
> +
> +description:
> +  The Sophgo cv18x SoCs mailbox has 8 channels and 8 bytes per channel for
> +  different processors. Any processer can write data in a channel, and
> +  set co-responding register to raise interrupt to notice another processor,
> +  and it is allowed to send data to itself.
> +  Sophgo cv18x SoCs has 3 processors and numbered as
> +  <1> C906L
> +  <2> C906B
> +  <3> 8051
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sophgo,cv1800b-mailbox

"sophgo,cv1800-mailbox" please.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    const: mailbox
> +
> +  recvid:
> +    maxItems: 1
> +    description:
> +      This cell indicates the mailbox controller is running on which processor
> +
> +  sendto:
> +    maxItems: 1
> +    description:
> +      This cell indicates the message sends to which processor
> +
> +
> +  "#mbox-cells":
> +    const: 1
> +    description:
> +      This cell indicates which channel is used
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - recvid
> +  - sendto
> +  - "#mbox-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    mailbox: mailbox@1900000 {
> +        compatible = "sophgo,cv1800b-mailbox";
> +        reg = <0x01900000 0x1000>;
> +        interrupts = <101 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "mailbox";
> +        interrupt-parent = <&plic>;
> +        recvid = <1>;
> +        sendto = <2>;
> +        #mbox-cells = <1>;
> +    };
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
