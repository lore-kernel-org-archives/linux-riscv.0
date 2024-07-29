Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50FDC3DA64
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 02:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0S5U+c9w3Glkf9lYVhZWuD0SlGtrRTUdfShr2GiiEvI=; b=X7YHYIldko/w9Y
	jNVrRn7jHT5u1Mi7NFcSzBsJxdeM3KWyRhOd6tJTxsxXxu7pgpwFPozPRGXdM4JVM0G3uFKrQ5rjO
	wmeS4xTebpmKDE4h0Ar2nYxKGs7AUS2HovscQCHo/mIEZWxd0yqd5dvM2uVkRuv2PPVMJgAOM3PNL
	ZYSLi5fFz0ZoCQ6wSs1VGmOSqpM3EzniQutbS592vYAHOAi/bZ5HBg93o/+yAgK8ftPS8fFC5R01k
	eynKGdkxXi/h7YgcCpZaagsQhapzV0mDE9Hr4MHf/KJcDvwoNAfGjFt9RUGmf4dhpGwRgJZg8SXJd
	bibNn12yAEme4J7AUW7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYFj7-00000009fxk-2Tmo;
	Mon, 29 Jul 2024 02:03:05 +0000
Received: from mail-bn7nam10olkn2081e.outbound.protection.outlook.com ([2a01:111:f403:2804::81e] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYFj4-00000009fwg-3NkU
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 02:03:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sNj11UB0pL8UAKAa33JaNmFKM9AgzHv0jbtiUetiLTErzKUSAfYoWLvp5AFrAHTrxwO0NUB0szOJSIQ8SAZL+qruTO2bFvOc9Dd3nyVR0izglSrqV0XS5shlOWUabnzHbwQBZd1hv8Y7xre4u1FOQNrW/DY/ZIvkHxGzG0XEUKuVIIEN39hVEpTEX5o1ClkjIiXWVTfZJru5Av4a2H2k9heq3xdYMPYZrv6lc4TOBKgY2yEQChmiNUDdwJD/rPc2MP+FnyjEGURdddtS/HnbWhFzcAtUcQICnNiPzR/fKyHP42DVOZapBCGDh+p4K/B1CeNxEn2uoNVA9YYhXr1zAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7PjmGANF0eGbZEsfSnNvPoeKz1asu6FCzfZ9zf+t6M=;
 b=w1hpyuoTX7BpZS07nVduwuUBTh8GsrVzILlstrNSV6doGCwrguCWgGpoAbAz51mjrx533Vm41t8Kqs19PrCav9TXm1xfWUHLri4YXXfmuJWOTa7FwDllmyXDoccvO0R2GoD22XdAPgKUYr+Uhlk+IELh5GRLOARrD1gXVvAjgdaFxw0AS43zEKTqdig91VkhY4h4Sen0S1ALZweK+KSzDFEBvegZX1i+V4zU825AtUrOzDBHkRjU48zI/R4pRRNHwd53+rfpd06dLE8ACY/6zKG/9XI7sX+lDulch2P23/8FHTDuc67SumYHWtj19TZTDHnLIRfNDG82YJopc72v0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7PjmGANF0eGbZEsfSnNvPoeKz1asu6FCzfZ9zf+t6M=;
 b=s+Kdsq0coK2gocj3U1HmKLz4dB8ChTaAREUAQCMN9WnuvgLkxjk8mtytOzv7TiUubnvRi78Hh7UVd7QU6YfdmWwy0/kNWCZXtfcY+6N14UGobIHukh91SVsC1GzO+TZFQVpUOmqXiyM1aCV4HerwyKpU30F474xAwZkAIy3AE18iOYE3XtwbO0bpvywCU/tuv/7z4/jZ0O015itLz9cqulwIMB8ZO7/72P3J/ak3b7fLFbuRrzhjTw7MeUT2fbRoWtM6KAsvSGfNBI/b+f3PmMjUee+ouBaI+T4vfbyVUJHlT/zmucAS6l7d2q6q5RZkkes1kEKP/prAoJUlmlfFYw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by MW3PR20MB3337.namprd20.prod.outlook.com (2603:10b6:303:53::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 02:02:48 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 02:02:48 +0000
Date: Mon, 29 Jul 2024 10:02:22 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: Add i2c device support for sg2042
Message-ID: <IA1PR20MB4953991A42D25CED2D4A207EBBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49531864C828FE90C4C25D1BBBB42@IA1PR20MB4953.namprd20.prod.outlook.com>
 <MA0P287MB2822C3005C40EAF50BD6D9C8FEB72@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Content-Disposition: inline
In-Reply-To: <MA0P287MB2822C3005C40EAF50BD6D9C8FEB72@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-TMN: [bSprINxbKEDaZSjWQexuqRCWD8hX4V6cvqBkCjIK+nc=]
X-ClientProxiedBy: PS1PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:300:75::20) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <xnfrguzvldmtv2dkkixxl2vxqud5mhjps6pi5lpsoa5e4kmmmb@2hvwy6c4q6ex>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|MW3PR20MB3337:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d9c2fdd-0fab-4859-e82f-08dcaf728b5d
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599006|19110799003|8060799006|461199028|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: RVE23ZUjh+0KBXQ4NXC57UaI7+LLk+rfbuThW/86IRfs4ZakFAX/mvEeSppzFgviKopramhKMoL8QKOmSOO98WJQfs/EQuIA8U1JZ6pA54u3PrXcnlKIVhx1yJ1dRLeyfUEMze7mPEEqOREsnZ42r24jst2GKUoy8uU2lxJLYkVc16z8ulFIrF+rDlIV9AgGAMSDQXwyblyKgf1uK2SxOAWGXpuoOsni4LTl0xf/8eWA/vTL/Ve4zT23yv+/J4D3G6vsrrGKxk+ZpCBteZlao8K3EKF7RplKZc6xlCuIFsO7D7ETpo9jW8x/MztZS2bwCwz6N6F5syq0cqxl7wwc+XI7KbIYZ/Z2CXvMCgejWoZ34WwoQHT1OH6ox0F4P/51R/s96esWUZm7FU30k+8x+sJrmDe08NCOvLXtLzobZg4RIu2lgDpj5SWEs26tsyl0mND5eIL+ZTs/kFC0BnvGcqdyBPdNlWIwOrLlxxF8xYMjnXLbURMlF9HcUiA+Ip63Yh+YUGb6in6d8ds2fXrX4PPp8AQkQEemsr9m1SWAFcj5kc8XLQ92K42/0hgHfLSzCE08O74YNZahWdUXcbmT93UComZC5AzCz2ejgyvTSKo0fJ0yTN8BBJM6a/aPFzvVIx+NW089v5BNUcoyRROVeMzyQMcFCjvEHBnshsNsurTjBgccvmiyU7gyNskxQoEfgGAK9RVprB5tWxAXsBk5ag==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NR22ubH7O37tk2fOVUmI7CHhYGVGcuOEJ8Gb1H0UG9QgBVCbrTXNH0NTYbJU?=
 =?us-ascii?Q?ULrgXeB/kT8prabsscwBysV/sJ0sU19P0TBk7+GsZqCaBKPtzDOWGKB6TNh4?=
 =?us-ascii?Q?YgIpOThNU9OZ6rU6fgG6qU2L0MCuSNjoEZsAOf1BQMCvI78oYV3mcqXcKrdA?=
 =?us-ascii?Q?laTUfRMI6jnGtXE6JQvz6IunR/LvMwB8rMewoez/V67FSqFePDDx+NZGElBu?=
 =?us-ascii?Q?yIMC4G8A/yqrLDqNi2xLdasW9HXm4myfHea31rPR2yAfyhbIhJhI68ssMheg?=
 =?us-ascii?Q?y9xXqgciSE+JxH7TGDze/zIqBsB/zH5qbQv09/YWD+hCiUQfk09svCrc5AeR?=
 =?us-ascii?Q?Ffu535K39fl9CpU9segp4n2rDYG8WtCiIWFag2RUhJBaB3hP2XPc4unBJBnt?=
 =?us-ascii?Q?n38wtN8gAJ8F2zYhUtT5ME4g7Y0+8ctrN0FO+GRxlR8C7cKun3XV8dzq6zI0?=
 =?us-ascii?Q?iQTxg8EuuhbDBw+PbDNBM2/ImLvpdXeVmY/KMeEJBat+stS2rJMK8LUD+K66?=
 =?us-ascii?Q?khvu6UCtCaXXqsZh/D79PpxhDdFjHRFDdb/ILylunhFWPLZQz9111TDLF1yh?=
 =?us-ascii?Q?8QRbRc+qVle+HmUUHy+e7Y1otWainxNtAJsW6Mvlq3J4NL8z03SRgu9ufDes?=
 =?us-ascii?Q?kSbwR0LmQIs5hmOaFN4gVNF6GZovf5S6sGWvGxdt27fotv3GM1xRdLEYFqad?=
 =?us-ascii?Q?dsehCxdS8Nd5Sfj63zFKkUuAN8Ly1zBp7SeN3+/ycWGJuCwEUU6t89N3ZPYf?=
 =?us-ascii?Q?BU0/JkGAGkZ4kCCH5iMpEEyt2rvN560Ode0JkyDXjr+1TR6/ajai9+Ywpd8a?=
 =?us-ascii?Q?IduPMTF3YTfD3t6wQi2RixF9uQBn7KLug0nm87wmnFORE9ERYZpzUuiRGjtm?=
 =?us-ascii?Q?/B00t6dAIEY2SIgX3GgrU8Iqce3xOz/2UF9pc9FdR5zh61hEfhhAWZ2uNjTX?=
 =?us-ascii?Q?jV9J9/nOAdEMMbb4i4CSxtMSouPp4WsejG6HAUZCWXXhcrXO2ywMPM/dYmnW?=
 =?us-ascii?Q?Z/ZhM1F7WMG8nscUyJ/7PMIMFS8kBG1o+wRW45y9zKEqCp8MRiuEdAA867VI?=
 =?us-ascii?Q?EowWamtYa9vn8FyYqHgtAxW6iyO912DYMgr0k2Aq0NUjxjKm0Egk7Vn8AV72?=
 =?us-ascii?Q?BS/A3UFSmG6HMzRIRK6VGR1RWzpb1KukCkGZ3fFPLShlkJHIELI/X6UpywsE?=
 =?us-ascii?Q?c550l+8g76IJERnshJ8Avrj/BiNNoJRvu5bPfNazsR7/WgryjPElFdRrbnwa?=
 =?us-ascii?Q?/wODOqpcb91EwsylOoes?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d9c2fdd-0fab-4859-e82f-08dcaf728b5d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 02:02:48.1429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR20MB3337
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240728_190302_881242_12308867 
X-CRM114-Status: GOOD (  19.31  )
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

On Mon, Jul 29, 2024 at 09:45:42AM GMT, Chen Wang wrote:
> 
> On 2024/7/26 9:07, Inochi Amaoto wrote:
> > The i2c ip of sg2042 is a standard Synopsys i2c ip, which is already
> > supported by the mainline kernel.
> > 
> > Add i2c device node for sg2042.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> > ---
> >   arch/riscv/boot/dts/sophgo/sg2042.dtsi | 54 +++++++++++++++++++++++++-
> >   1 file changed, 53 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> > index 34c802bd3f9b..eebd6817520e 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> > @@ -44,8 +44,61 @@ soc: soc {
> >   		compatible = "simple-bus";
> >   		#address-cells = <2>;
> >   		#size-cells = <2>;
> > +		interrupt-parent = <&intc>;
> 
> I would suggest this change (use common interrupt-parent for soc) in another
> separated patch and this would looks more clear.
> 
> Then this patch is only for i2c related changes.
> 

Yeah, that is kind of reasonable. I will separate it.

> >   		ranges;
> > 
> > +		i2c0: i2c@7030005000 {
> > +			compatible = "snps,designware-i2c";
> > +			reg = <0x70 0x30005000 0x0 0x1000>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			clocks = <&clkgen GATE_CLK_APB_I2C>;
> > +			clock-names = "ref";
> > +			clock-frequency = <100000>;
> > +			interrupts = <101 IRQ_TYPE_LEVEL_HIGH>;
> > +			resets = <&rstgen RST_I2C0>;
> > +			status = "disabled";
> > +		};
> > +
> > +		i2c1: i2c@7030006000 {
> > +			compatible = "snps,designware-i2c";
> > +			reg = <0x70 0x30006000 0x0 0x1000>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			clocks = <&clkgen GATE_CLK_APB_I2C>;
> > +			clock-names = "ref";
> > +			clock-frequency = <100000>;
> > +			interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
> > +			resets = <&rstgen RST_I2C1>;
> > +			status = "disabled";
> > +		};
> > +
> > +		i2c2: i2c@7030007000 {
> > +			compatible = "snps,designware-i2c";
> > +			reg = <0x70 0x30007000 0x0 0x1000>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			clocks = <&clkgen GATE_CLK_APB_I2C>;
> > +			clock-names = "ref";
> > +			clock-frequency = <100000>;
> > +			interrupts = <103 IRQ_TYPE_LEVEL_HIGH>;
> > +			resets = <&rstgen RST_I2C2>;
> > +			status = "disabled";
> > +		};
> > +
> > +		i2c3: i2c@7030008000 {
> > +			compatible = "snps,designware-i2c";
> > +			reg = <0x70 0x30008000 0x0 0x1000>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			clocks = <&clkgen GATE_CLK_APB_I2C>;
> > +			clock-names = "ref";
> > +			clock-frequency = <100000>;
> > +			interrupts = <104 IRQ_TYPE_LEVEL_HIGH>;
> > +			resets = <&rstgen RST_I2C3>;
> > +			status = "disabled";
> > +		};
> > +
> >   		pllclk: clock-controller@70300100c0 {
> >   			compatible = "sophgo,sg2042-pll";
> >   			reg = <0x70 0x300100c0 0x0 0x40>;
> > @@ -388,7 +441,6 @@ rstgen: reset-controller@7030013000 {
> >   		uart0: serial@7040000000 {
> >   			compatible = "snps,dw-apb-uart";
> >   			reg = <0x00000070 0x40000000 0x00000000 0x00001000>;
> > -			interrupt-parent = <&intc>;
> I would prefer this change in a separated patch which has been mentioned
> upon.
> >   			interrupts = <112 IRQ_TYPE_LEVEL_HIGH>;
> >   			clock-frequency = <500000000>;
> >   			clocks = <&clkgen GATE_CLK_UART_500M>,
> > --
> > 2.45.2
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
