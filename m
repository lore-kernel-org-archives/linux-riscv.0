Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816C7C3DA7F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 01:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5w3yfZM7nQRq6I42RgXd6MR1/XlPUKnY81ni6mX5WGo=; b=Oru+ZXUYrBsVvz
	ENII+HmOA/z/FRxIUKglydhNSB53TVjvwJYMvME4RwX6NWsC601Z24XOAkykpFUidp2/zU78SPmLf
	6dBzBiKFi9ePdTXSq6BSZG4HsEiZjBTIZCkFCsJ/S0BZQAnyub75FkZwsID07F6AHisQkc0j84wzz
	sox8ANysT7Jz1t4zGl18pRgMEchEt0miNTIlUzK6Iv4+jEN5Rd7SRkK2zL/YW3uNtFUREkf3PI6vv
	/Jo4IeY8SihMTECw6t/RCN+KqPker2pTUjCCUVqjnvaVKboRLNaKzCLhD7bOCvV976Wu1c0o1c/Uo
	A5/9+aspBzeqx3iY2zHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdgh7-000000021lD-40EY;
	Tue, 13 Aug 2024 01:51:29 +0000
Received: from mail-co1nam11olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2c16::801] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdgh5-000000021kl-2VTL
	for linux-riscv@lists.infradead.org;
	Tue, 13 Aug 2024 01:51:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/n4hBT1iVhRtqJkvqDZbE7ScNtKoIoyfrTuP8ShGFzqJnvWgWut9YsP8QQyXwbLvzyMgo50EPjo3EN6svbjMbAl2nwICvHMNSHfwB5a3XfiTR1huU1qdiRCqfAcjAtdde5bOsPV4B0U37vS39Xoe8Ee2K1vWOjD6cOGTU9RKPL5eBwh8E9s6r4/edt06tFVljL+g82fkwcNbbgakWvrIinR1JdQz6F6XOW9AAJ+auWLGr7+4yhc3z9zoNJaS1b8Kd/MOHjnd2EXZw4BSV4TfuW9bUnYGNNlhdl+Z+KE3h53vtQRP1Ib2tn/AP+cBw+e4+QNOsM2M+lzOGH9Mv6uNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mf1pB5F7pVkHM34HlSgzuYk3Jayj295XL3jN16E3KFM=;
 b=GdfEz9IJCrpBHkBSI6lhC6en1nEEmqlEA0bp2El2NnzUYDZ5IgKtmtVy+v5blKChV9zgFC916pIE3KyUyMdu7+cOEyNtmIcXLOuJ9DYZJ2wp7FgoPHARZV5/brIUsX8Xqqyv1eVkHALwxKAQ9YNwfdHH1+YzUBUR6MfhsiIBxsKMao1lIwRVrvGoDSMe8u6EovA6mkA1jFB3Zun8NuNJqS53npoUuWbBdZCdvu2iFfojspygtJnFLaOgb0CqXVBtPBM8P2IOtakLJ2v+YlO6FnXm8sGLrvBd66Rf1H/Ohqil79dTn09SeiRik38BxSh9WqX9iD0XvTdefAuvFj6rCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mf1pB5F7pVkHM34HlSgzuYk3Jayj295XL3jN16E3KFM=;
 b=XDknPbq45C1g1agWA5AzTEkDUdm8tRF9LpW0VH0VSOdQpegCUDlBMaCbHhiOu2GeCOko3i9s4+KhbRfUoe1/g0futVSUVxaL0zcirlkUxELcagWCBF2r2zME5KMA18vpS/g0yiZBTHmDdRzZVHGVUFm7MV2kOqWLL/CEyhOfZ+t1bc+3L65tCVC5CKDVC8mYN5P4lgG5fBPULVtvsqvS8T8MFadzslt0S/6xuVTN+j+puSEMkdpCA7Vvzxg34PPDUJ407XMJlBQD2EMUrAUCvB7Vm3Lmtn9KY8++uS23KzQAGW9SxI5tUiQNmrGLnPCK6v0hZ2V0jmwfu5J08UzIOQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH8PR20MB5217.namprd20.prod.outlook.com (2603:10b6:510:1c5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Tue, 13 Aug
 2024 01:51:19 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 01:51:19 +0000
Date: Tue, 13 Aug 2024 09:50:35 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 3/3] riscv: dts: sophgo: Add SARADC description for
 Sophgo CV18XX
Message-ID: <IA1PR20MB4953ACCECC151ABCC7E0E49ABB862@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <20240812-sg2002-adc-v4-0-599bdb67592f@bootlin.com>
 <20240812-sg2002-adc-v4-3-599bdb67592f@bootlin.com>
 <MA0P287MB282209542C6D70839466B733FE862@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Content-Disposition: inline
In-Reply-To: <MA0P287MB282209542C6D70839466B733FE862@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-TMN: [AFE5Szog8iWcdsuN6y/XaqdHXGJcT8OGE02YCJRK2ag=]
X-ClientProxiedBy: TYAPR01CA0209.jpnprd01.prod.outlook.com
 (2603:1096:404:29::29) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <ly2yi2g5nrisquhuhbbebeowfkv6yko6afglcutoghbtv46xqo@kgcdbfxf6gsl>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH8PR20MB5217:EE_
X-MS-Office365-Filtering-Correlation-Id: e55b38d0-93b9-4123-822d-08dcbb3a6cd2
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|15080799003|19110799003|461199028|8060799006|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: h/brfwJD1/qahipJB6td7RhaG9Er/JuE4q3aS9nwcHCNbnirgDuTv5XhAfqLBYOjXQ9VNoIXDtT//mO/F6e/PgVaX3AXQhsByQfK3do/DCQSlFV1zLMG1+xhK92xZsPqDDnscSLNfINM0f6SdryaH5ICWtg1CjeC3dy/pHMi8OnRtEN9YXxSNWyfwx6Cwq29giidErONU+Yvxwy2UTfcrzCqous2TonvD8FzPXffKvTFLsVzNrog6vvHKrdXmUyz2oLM/gATnbLRGGH2WnyUbwbNJO38iQynNhym6ZrsoBBKkPrPShz/vWquEsNuKWGViIFoGJhE0yU6Rmc0dHdyuZaVq/D+8n6ImZJXHMzcyvQ/q5zHNdEwjZSXC4fR1RM+asaB0s7tcG65t6aPQI/OupFWKVg9i86Jsd7Vhu6D5k8zclqswHAgs2jzr5OGc6sTLN9cKaz7zVpu+bgykgqvwVO5Uaw+9jQuXV+fDXekJHaw6LSFnClgdVfXdHSWQrBf5NgGtdMCfffhSHx5bjsrxgLdURBOuh5pXrN7Nfd1TZ+UlD964vLQqOHc/MWEsmI6xv55dWkmTgBVY1tr0a/VJIaI+C/+bFGqyp/MXpiTDbs5ukfqozt/UrJS1+SbXwc7vHEi3dK+lRWFhccav7coc9WAbtO3ghRDN5xKxSituYUfPKc9kbCgl3KZmvMhTkoYARTPIlF0NLvdgHSbFsIP6gYux9f54DXw4Go9faW0V4Y=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kHIVwZUBxBu1RUfU8TkuxvuO3aODTHu7Noo4OWoiGJ7Iu8VGYjrLIwQFnyJs?=
 =?us-ascii?Q?OP4LwtUxCySuD+lxa2P1gd9Wabhrk+CTGrVOq9862qcx4lM/g0PF7uYQj3MJ?=
 =?us-ascii?Q?2OeBq3reSAIaRL7ulLlRmrQCm1uRVOyEP1hDvV9WUEBwC61kOch8+yAItUhl?=
 =?us-ascii?Q?AbNxxXr4LDGNjWnJprg0eon1WmXDnSsmq1Gvm4i0LF7H7vEKtBU3Gkfk4/Ye?=
 =?us-ascii?Q?BsV8oTbjVKvgh8nM/572rk+sDZh6D1iJtbJ49SzcTVaa2rXOCVcjToqmm1kH?=
 =?us-ascii?Q?eJVslFqXw9Ru0KNM7H2EvcF5U6kvk3MpiLCsvheioJNoRE4NcK8MbLDUxnKs?=
 =?us-ascii?Q?wLJS4/mpitg7w03QeLMyrM7HosBHlPJISJEKrpR9JR2lu0t4ZU/DV+aYUmrr?=
 =?us-ascii?Q?uzR+ZaPI3gzq701uPXNe77HprXdV1IJ5ARTm0bN9lIVnZszqw9HgDHv7MrcN?=
 =?us-ascii?Q?zY6pAP19HwJQxLQNYVbuWnKL7IBnZdUvxQR21uNjWp2La+7UJSGa+3yic7uP?=
 =?us-ascii?Q?HcjSMT3ROh7qtsuc4D9dIb4W9bp0x+dv9G3KDdcf7+h7iUtfsdK7QZU24RND?=
 =?us-ascii?Q?/AzHxghfc7if5Qqm3LrdRiN8a1Xml2ty5F+KCKBh06Z32/xAu5Iq5R+pcXbR?=
 =?us-ascii?Q?BNsLiUDhDNB7tITHcYVXzjLQ7nHe2De9QpNA1RjDvsEz+rLxs+fFzlQTBp2j?=
 =?us-ascii?Q?ZTDBUS63VX+vGsu+bh0I5hG+WYwAqKVHc/rQJtzMjcLQnZ5F6DFK6NAt7V8f?=
 =?us-ascii?Q?Q6h+ttgmP9lCR3Fsx3BTl4qXumuxNoDKhQ7MFzQ5X8ZEID2hgpzDPgdZaAFH?=
 =?us-ascii?Q?+5vC3nJdEcRJTLQePUgWSNrrjXb4CS3Q3TCnO7e6rve6tnhLYlchCpNBAe9l?=
 =?us-ascii?Q?KXl54d9+XWTbIoCI19EPtlp3PRLLNeeQWHB/UpjZaaOEU9JVyPDGS3IaWjgP?=
 =?us-ascii?Q?XVNnqmsYz8GjkmMGYV3fwLwwJOOpK5yG1T9QKVvPE9YzdNl4jwtC1tTnFu+d?=
 =?us-ascii?Q?cKcZxZv7VDSt/FN80eq2GoZ+mXPji0zJEPn8Lao9cMixNiDEC77U+pZ0CTMF?=
 =?us-ascii?Q?JSq8StPJfIE8VlTOW2ht75LoVAjtA5Gpcx9vIXCFbNci3TClSyzPEycufUik?=
 =?us-ascii?Q?3qFpeQaea+B+nnDfcdDi3IgAvTjR6HN3+SSA3X/IEgBv2tz/CCzHvMbrAfFN?=
 =?us-ascii?Q?Jh6FUzcaW/nxeooerHK6hsk6+pF/NlFyK4rm8WCjEJYZX7o7FXHZXJc4Oo/o?=
 =?us-ascii?Q?1sI4WvZNrDipK++k1jUZ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e55b38d0-93b9-4123-822d-08dcbb3a6cd2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 01:51:19.1249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR20MB5217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_185127_807437_7DCB1084 
X-CRM114-Status: GOOD (  18.43  )
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

On Tue, Aug 13, 2024 at 09:45:53AM GMT, Chen Wang wrote:
> 
> On 2024/8/12 23:00, Thomas Bonnefille wrote:
> > Adds SARADC nodes for the common Successive Approximation Analog to
> > Digital Converter used in Sophgo CV18xx series SoC.
> > This patch adds two nodes for the two controllers the board, one in
> > the Active domain and the other in the No-Die domain.
> Where is the node for the No-die domain?

I have suggested Thomas not add the node for the RTC domain.
It is not clear that which clock is used for the RTC domain,
it will good to add this node after the RTC is implemented.

> > 
> > Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> > ---
> >   arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 20 ++++++++++++++++++++
> >   1 file changed, 20 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> > index 891932ae470f..71a2618852fa 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> > @@ -133,6 +133,26 @@ portd: gpio-controller@0 {
> >   			};
> >   		};
> > +		saradc: adc@30f0000 {
> > +			compatible = "sophgo,cv1800b-saradc";
> > +			reg = <0x030f0000 0x1000>;
> > +			clocks = <&clk CLK_SARADC>;
> > +			interrupts = <100 IRQ_TYPE_LEVEL_HIGH>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			status = "disabled";
> > +
> > +			channel@0 {
> > +				reg = <0>;
> > +			};
> > +			channel@1 {
> > +				reg = <1>;
> > +			};
> > +			channel@2 {
> > +				reg = <2>;
> > +			};
> > +		};
> > +
> >   		i2c0: i2c@4000000 {
> >   			compatible = "snps,designware-i2c";
> >   			reg = <0x04000000 0x10000>;
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
