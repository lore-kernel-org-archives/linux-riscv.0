Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E655C3DA62
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 17:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Cc:To
	:Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVxXGoE94/aIRkXbDACRmMs9iA9V6PORbYa084v+l98=; b=fdb9FH2ckq0oSkqELDF2MkljHS
	PVEUEerybY8HcUMJCARmhvcW+f8ebRlxSIsWAEY8278L7iRb6L2EbfoJNa6IShq1LvsMO++1v/Ad+
	tPFpVZN7UUoK/JianCQOqrWlVfBomyAvLG6Bd9cK8+9/kEmejE5GA1sOt4StgUkTgu444Wq/HryYc
	2DSzpMtUWThywJ/GmEoZGx66unsKAXE37NAPcjG6HSbuA0lLXr1YLQ0WI74luFOYamrND/gr/TRF/
	Tec+dc69ZjH7BurNPLV+uUAjECVFIcFaD1obwjdTy1N66oy1gc/hbF886wb8wzlpeGoVaKVDs42wj
	YfEqM9OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU8Av-0000000ES81-3Bbi;
	Wed, 17 Jul 2024 17:10:45 +0000
Received: from mail-me3aus01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2818::800] helo=AUS01-ME3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU8As-0000000ES5t-3Po2
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 17:10:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vn63NowniiKpYtj3nN3S7mvB7qzvsRLbilkZ78C5hSuwkrHAaT1f8DVqobNrAjwJjB3PpTRe6sSwrdm5yKqYyALMb4yr2ZZcWyxifJ3h0dVduFK1KPSvWe50Jpdac3HFllc5vJx2goSEPCqPHbW5zXffv5K+CKZNL6Nh36p372DasRye1b5CDoTPl1woRkjb5nBEOlsiu5LNC2pUutKLLYc8t8bHGnyno/tsyeoaEka98LiWc3sArh2nqXStlhtg/cOAcuRhT3GBi4AjC08OLQfG4sk6eqAemW+xs3OcrNvOps/zCzktRdaXbFk0ShX6f20vCdLpCpZ4sIT2yNTvtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTZais8hsE/d6dt2OUCwODXeq6YeCJyA2+w3hkl/4OA=;
 b=CquYcIAlBQ0Z2e0M77v3ymTlRN6Ui3kb+ZCwKNZ/8ZGZBBwGce7a+MKoU7CuCFItMFjFohOH4vkb1Cgp78ZrnG9+5b6SX5Kp2Ymxh2q/RZ4qp/PosAbIO+rEXtpMYXVBZuHXXvw5BcAZvoLSAnY0sw333nawPsBuGYtCV7AocrKlQDsFDPwV2SDRT+41HCf/jA7HWlBUqvTFuEGL1BTz/covM75x8OEJGp48+zXW3Kj0ShWKhByTK9UNOonrPAWbw+mnV1WxPA3q+jgdwAVqC4PxmjCR6uUjNEKYbZllow4jeLS6r4QJza+ee/bdYDN5M1YtieXxTPuT5sXy7n57pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTZais8hsE/d6dt2OUCwODXeq6YeCJyA2+w3hkl/4OA=;
 b=oiU7ZPEvNELYu9+kORtDYp3n5PvitYQzym8EaDTVEPBTG6WuAw8KZikJWIK1aTu6TwxUAO8H8EHLDnqEBDrZ/4T123rn5zRZSTGN5Tf11Q34bdxajVXDhUroQm9c2ppDInsDUEBN9bApYobuO7NVPmU8w0Fokz68y5ueMN104e+s+DltUunyk75I2Bgps3WLF7lU0cpDmPYBHktWUX7SgscDLEq0GNT1i/Clm+9p3jSa5jFlzT3Ds1HPBZVHW4aPnqy83M9rRkyGRxg4YV/Ov/Z7HZUj13eUbPlrEH9S2gpUh42cs+ep4jipl3D3lkcbwbIkqo8W/sb9B6OyFiahBw==
Received: from SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:9b::8) by
 SY7P282MB3740.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:1e3::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.16; Wed, 17 Jul 2024 17:10:26 +0000
Received: from SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM
 ([fe80::ac24:7d2b:92fe:20c3]) by SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM
 ([fe80::ac24:7d2b:92fe:20c3%4]) with mapi id 15.20.7784.016; Wed, 17 Jul 2024
 17:10:26 +0000
Date: Thu, 18 Jul 2024 01:06:46 +0800
From: Yuntao Dai <d1581209858@live.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mailbox: add Sophgo cv18x SoCs
 mailbox
To: Conor Dooley <conor@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>, jassisinghbrar@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	unicorn_wang@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Message-ID: <SYBP282MB2238C5F2D4B10061FA241CCFC4A32@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
In-Reply-To: <20240715-upriver-grumbly-e8f6172f6a72@spud>
References: <SYBP282MB223825D5903777B937A8A377C4A02@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
	<SYBP282MB22382E1C032FDE2D36E6B58DC4A02@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
	<IA1PR20MB49537F9F04E601413EA1C86FBBA12@IA1PR20MB4953.namprd20.prod.outlook.com>
	<20240715-upriver-grumbly-e8f6172f6a72@spud>
X-Mailer: geary/0.12.4
X-TMN: [sQUMIRbSqCfoZhAMpsSoY9G+L3cBI1tVaCx+g1dXzqw=]
X-ClientProxiedBy: SI2PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::13) To SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:9b::8)
X-Microsoft-Original-Message-ID: <1721236006.4845.1@smtp-mail.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SYBP282MB2238:EE_|SY7P282MB3740:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b218be2-8153-4876-ffdc-08dca6835a4b
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799006|19110799003|461199028|1602099012|3412199025|440099028|4302099013;
X-Microsoft-Antispam-Message-Info: V5zJAMpAgmMPD3OJSphb8xUG6VwIsUg5yy0uUPaVP6vHmdXfcHZ0raJUrMMDcqnnh6i4iPRrCqV//PgenQjy5hHSgRWKUm/kDZulHpdZuAZGlxSMi/iorQyEeHRznPOc/lONDUwGTSsyIiGL5HW+I9J5RX/N7lFwWXkW3tDEkYOLadsr74amHcmzG1NrLGOFHaxRQMcJ9IvxfIrpRH8+pZ83jy/4qpc/fvI2D7ABFiIUtn4XAWriTOCbBmCR0I32psnMjdhOpEvm/b/o83cApPCMyNaqqs5hZjftPyJu4thxI2Arffz+cUYYHV9v6xDyd6/pNV1zuVtPLud68tZEDR5hVPditjYY4MH7jnTHRnIBB84oM4MVCxPl5Lbs3w49VNR0CHTtFnu/WqaHSD1gkOTUEz09fUzFsm+zBse8AHmYQ0sVHBbcrPwucMCdrcsX/nmKVpvp456KLZS7pjR1tzui0xUQVdrbKAVKTJbNQeDE6Rp+JckXvOA/XWOVu2uYdRbD0PBXoFLKXpdmwJn7yTK0UJz2LL48aE9/siN4hVdUqcuCwVynPcLGHRczgGD5nMiBSOyUN9l559N2bDY7scehb6APtmlePqe8hqzLN+vbyDVDBFZkdWBF2IqCqtQDSWvGqDpaqtS2fiwZNFG2J0VGJnloLNkW66V74IdyXxaMEB0y3QKH9nhYmy+91MSJ9KpD+Z77PFuixHFbc61X2ZRo1z7SxX5ZcOsWCvsgyILa+vzwWdE2cxL8150xqCs8ztfZh2FRus5p9wiYLeSu4A==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OYGepTSel9xr5FcENLNEkchmf/agENA7Yv17RnNg3Ze3a401fSWO57vsfND3?=
 =?us-ascii?Q?0cx7LOb8mfxe2wT8ScWTecztcaS4Rex9pSmGm6/WTkd1JRLOg2ITHGoO+wOB?=
 =?us-ascii?Q?hN/JaXFihnLgyz13tG+JmMRQzkUMGZWadCnIBwRQ3o0NMeSN1huPQv6GaHG3?=
 =?us-ascii?Q?T5VFDC8DYlkce/4LoNr3Qs05hHmF4XwenSDVh+5nttvAi4DJ/2MhffEcmJsU?=
 =?us-ascii?Q?pyqjoPOyDoYyC8SW5xciuMzay6AGN0uFYH3zGeS/zh4CSzmiHqIiX/QiVEMZ?=
 =?us-ascii?Q?w4cE0GBpYQMMQWtzW5hzR6mSO54Oa7oFbRj8fFQaZjCWP//Vd39OLWUTBFkc?=
 =?us-ascii?Q?E/ygZuUPuNhJTMz9dCHaMrsSH9zVemptituS/mfEeLbX1jWFoHedWtddQUPv?=
 =?us-ascii?Q?XdA7gTrTOdoUCi1zm/0d9SBC1UkhTeUiqgZXekjZpG8LzCBxTChRP83e5rTH?=
 =?us-ascii?Q?TMepaiS4dnLncnAOHS9oNQepebD+XF1z6X6pmeJVRfkT7xJf/pGH/ZJ+rvoU?=
 =?us-ascii?Q?ve6tc1f8GetfnjtlWjNxEqAJyjI3udrdOO+sqe9cIoHprRzShtxf5oWkRWGS?=
 =?us-ascii?Q?wepWnNpMPaUjjrScK9f4Ez8WnIGXdlhfxAUJkZV/uuBCD4aJYyTz8airKDdP?=
 =?us-ascii?Q?1KFRB07QaeS7GfzS72WfUs7JxzUPb9P2Kb4PRvWuMO/L4wAGxz0me4+vpB4e?=
 =?us-ascii?Q?tePpubnrpmDVOfrg1jbb0rJu8LOi5seJ6uPZy+0y/rEIID7I2Vs5GixJRJcS?=
 =?us-ascii?Q?RJ2Oo3MrtmQiwZ2vYZv6jm8DpBoM3/u0J+MN4EwP8ITFLsIRNV83bw7LK3tJ?=
 =?us-ascii?Q?LIn+EV9C9MRMHAnUuRCT4S3dGUE1lWbi8EBxNUuLpmP5EoLDRi636tfFwmEw?=
 =?us-ascii?Q?geR+Ob7gCHWe/B5T3x774mNT5DTd/Tl6Kt1VMZrWpfnVkjVKJ++FuxR2AOUA?=
 =?us-ascii?Q?74Cof4L9/NH24XCFVjKNzZsyT9nFxAC1B+F15HZ2xQfr/2lBD2GcIwRk0nvt?=
 =?us-ascii?Q?MGBN8rNsmb5z53EjaGiCjr4DRNl9ARPc0eG8d19+GZkXYzgl8jAyxTP4BqFW?=
 =?us-ascii?Q?cuctfI0/dABdf1nIESiJwD90hlL4vMYeFkC6AQe6MBtM/RleXM4jPOQxCeK6?=
 =?us-ascii?Q?r1QTqH7enX0oI5H0r52M9PgzF882sYnWceI/La9zThL4VgfGM0e2jccE8OJ6?=
 =?us-ascii?Q?bJBNs4akv2wfYJGzAosuGnc1Hc92FHjvj6Uk21Xmt8gPZe3IcBAMOntDNVA?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-722bc.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b218be2-8153-4876-ffdc-08dca6835a4b
X-MS-Exchange-CrossTenant-AuthSource: SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 17:10:26.8611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P282MB3740
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_101042_894694_317859F1 
X-CRM114-Status: GOOD (  21.80  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On Tue, Jul 16, 2024 at 12:15 AM, Conor Dooley <conor@kernel.org> wrote:
> On Mon, Jul 15, 2024 at 10:56:38AM +0800, Inochi Amaoto wrote:
>>  On Mon, Jul 15, 2024 at 12:36:45AM GMT, Yuntao Dai wrote:
>>  > Add devicetree bindings documentation for Sophgo cv18x SoCs 
>> mailbox
>>  >
>>  > Signed-off-by: Yuntao Dai <d1581209858@live.com>
>>  > ---
>>  >  .../mailbox/sophgo,cv1800-mailbox.yaml        | 61 
>> +++++++++++++++++++
>>  >  1 file changed, 61 insertions(+)
>>  >  create mode 100644 
>> Documentation/devicetree/bindings/mailbox/sophgo,cv1800-mailbox.yaml
>>  >
>>  > diff --git 
>> a/Documentation/devicetree/bindings/mailbox/sophgo,cv1800-mailbox.yaml 
>> b/Documentation/devicetree/bindings/mailbox/sophgo,cv1800-mailbox.yaml
>>  > new file mode 100644
>>  > index 000000000..05099d819
>>  > --- /dev/null
>>  > +++ 
>> b/Documentation/devicetree/bindings/mailbox/sophgo,cv1800-mailbox.yaml
>>  > @@ -0,0 +1,61 @@
>>  > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>  > +%YAML 1.2
>>  > +---
>>  > +$id: 
>> http://devicetree.org/schemas/mailbox/sophgo,cv1800-mailbox.yaml#
>>  > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>  > +
>>  > +title: Sophgo cv1800 mailbox controller
>>  > +
>>  > +maintainers:
>>  > +  - Yuntao Dai <d1581209858@live.com>
>>  > +
>>  > +description:
>>  > +  The Sophgo cv18x SoCs mailbox has 8 channels and 8 bytes per 
>> channel for
>>  > +  different processors. Any processer can write data in a 
>> channel, and
>>  > +  set co-responding register to raise interrupt to notice 
>> another processor,
>>  > +  and it is allowed to send data to itself.
>>  > +  Sophgo cv18x SoCs has 3 processors and numbered as
>>  > +  <1> C906L
>>  > +  <2> C906B
>>  > +  <3> 8051
>>  > +
>> 
>>  Unify the "cv18x" (at least it should be cv18xx) and cv1800 in your 
>> binding.
>> 
>>  > +properties:
>>  > +  compatible:
>>  > +    enum:
>>  > +      - sophgo,cv1800-mailbox
>>  > +
>>  > +  reg:
>>  > +    maxItems: 1
>>  > +
>>  > +  interrupts:
>>  > +    maxItems: 1
>>  > +
>>  > +  interrupt-names:
>>  > +    const: mailbox
>> 
>>  I think this is not necessary, there is only one interrupt.
>> 
>>  > +
>>  > +  "#mbox-cells":
>>  > +    const: 2
>>  > +    description:
>>  > +      The first cell indicates which channel is used, the second 
>> cell indicates
>>  > +      sending to which processor
>>  > +
>>  > +required:
>>  > +  - compatible
>>  > +  - reg
>>  > +  - interrupts
>>  > +  - "#mbox-cells"
>>  > +
>>  > +additionalProperties: false
>>  > +
>>  > +examples:
>>  > +  - |
>>  > +    #include <dt-bindings/interrupt-controller/irq.h>
>>  > +
>>  > +    mailbox: mailbox@1900000 {
> 
> And while you're fixing the things Inochi pointed out, drop the
> "mailbox:" label, you've got no references to it.
> 

Yes, in this patch there is no references to it, but mailbox client 
node will need it.
I tested this patch using mailbox-test as the client, like:
"
mailbox-test {
	compatible = "mailbox-test";
	mbox-names = "rx", "tx";
	mboxes = <&mailbox 0 1 &mailbox 1 2>;
};
"

If you think it is better to drop the label in this patch, I will drop 
it.

>>  > +        compatible = "sophgo,cv1800-mailbox";
>>  > +        reg = <0x01900000 0x1000>;
>>  > +        interrupts = <101 IRQ_TYPE_LEVEL_HIGH>;
>>  > +        interrupt-names = "mailbox";
>>  > +        interrupt-parent = <&plic>;
>> 
>>  Remove "interrupt-parent".
>> 
>>  > +        #mbox-cells = <2>;
>>  > +    };
>>  > --
>>  > 2.17.1
>>  >


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
