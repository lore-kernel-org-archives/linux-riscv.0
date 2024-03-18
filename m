Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06CAC54E5D
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 08:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lQr9PzaPwJUt6ZLqhje4pY6OpPmUh20+EMjyTFnSxRQ=; b=s06PX84LBwoHyp
	gh/PKjlnBiyChbDLYEpA6dAjf6WUN3YUhy2k1eSt4GHVsOtns7pKUqYt/jP2ze2FtMtvTIgZIizD9
	ev2/Iex0Ts1keaWpVswRSRxmGrkoeUZJRYUnfDJI/WgSX7H10+31wz7NbMCgsXc1iihXjtnlA75e+
	a19vszfUqeo7dwH7Z6BfosiNK66y3Bm5STFP2vsE/k+F8Z71+/nc0sw4CCkWs1TRG/uNCKefPCWcS
	pfpUy1i24egMwX5PR4sERDlgd0Sz5jNOKqYfZNE5UB4WlSJju91u8bL5V1DZsfgPtFol5JKGWuxLm
	0Jvjyplfqrrl2iTw8RNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm8TW-00000007le0-3ndV;
	Mon, 18 Mar 2024 08:36:06 +0000
Received: from mail-co1nam11olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2c16::800] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm8TU-00000007ldc-08Xf
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 08:36:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DP9AP9hV4VpwiAn2aT6WBmsNbqc0+7vuOcGjyvI4NhyCruTaVhp5TD1vg0WdAIJM5psPBBTYN/sVZL550O6EXfVr9gTsM3dBWQxCaJbrE55a3gWoWlk5DQy/DEcqdonqUNn34Sm3L+++k6VNr5PVkQBGo69enbBndJsR2ITSIqJndZhGAeML/XUSuZ3fGiTjKOKCtj/0i3gDc9tJ3Ze5Zxk98gWY9329SvhV0GphGQUS2rbWnoqHzv0X+bd8Xe/VYjVbhPDQxHMs9rETLLhM5sqjzW6z9DowkmfxfkJCt7EbEIn3cvUCfcmdbfG8uzO6/Yo/y8NbQm4TlRDKhg2u4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0RW1x9j+lvwxkovv1mLMjCDikrEBPtsBEgYCMOTfeI=;
 b=UmQssdojv6Z8aNy7E/gSjx34YaTt0n5/As0uQdugr+aDGDuDlIeZ8UgeMXF+SIjZjIctq8VaK83AQxNTn3Mt/GpFvHAkT1/ljd97g/CM6Yw54F7jJQ0Xh/xukDTiJ52aQaUXAr6uNmXPUpkOCQRdRv1GHXkrA93Cb0+2MOP6E+BFn/nCVG2LXiFNkcSFoL/0qfmF/YIVHI7Prp1f5M7/Z/9scFxnV4AZQKVymM6DnHQTRpeHbYd83TmA2vpZ76Rte1JipCMXQc/m+21THakPVODaG1Gr6uGJz6LJIHColnDDnc89FoxvqkovRTQtXD5VHeys7Ejh+eheT9M61i3SPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0RW1x9j+lvwxkovv1mLMjCDikrEBPtsBEgYCMOTfeI=;
 b=WWADhtyyWOZBV+dg+knFaDzpdwvid2GRrfA0tzInC/GQ7JeTyciIHxyiMrwuyB7+Hep88gTI9rmhxOrMkgTf6owvRHrLqvnNOVsUgkP4Y3r2Kskb4fTcjP81VA7HQG7tiG51BwGy0+3dqY+hiPKkmTA+NDnDYRyHagnoND77LPY/oLg5Wsqy8JeyoGpV/qQng1TpaRxUkRm7B+71UkT+D+B2mc3IxuRks9dyD2DRC0aMmPOiWB6lFw1927AswfMEJkamgdRKS6iPj/4h1NoorGO/iAUpIqy9YHNp5+VxoiILNCm7zY/lRghTv0pf7fW6yipE+7JulLOWGi9FTv6J7A==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH7PR20MB4414.namprd20.prod.outlook.com (2603:10b6:510:13e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Mon, 18 Mar
 2024 08:35:58 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::8615:efe2:7c8e:2041]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::8615:efe2:7c8e:2041%3]) with mapi id 15.20.7386.025; Mon, 18 Mar 2024
 08:35:58 +0000
Date: Mon, 18 Mar 2024 16:35:52 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>, Liu Gui <kenneth.liu@sophgo.com>, 
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, dlan@gentoo.org, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 2/4] dt-bindings: soc: sophgo: Add top misc controller
 of CV18XX/SG200X series SoC
Message-ID: <IA1PR20MB49538CDB75367C1FBBF85C79BB2D2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49536DED242092A49A69CEB6BB2D2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB495375AEBA417DB6908CAC98BB2D2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <3f6753ab-ef3c-4bf2-a885-afbf5ad83ccc@linaro.org>
Content-Disposition: inline
In-Reply-To: <3f6753ab-ef3c-4bf2-a885-afbf5ad83ccc@linaro.org>
X-TMN: [8sPxidhUkMW8K5Ft6XT/BHFBknp1uJmiebY5kkH4mrg=]
X-ClientProxiedBy: SG2PR03CA0098.apcprd03.prod.outlook.com
 (2603:1096:4:7c::26) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <zty2w5em5c5l437l3mhfd24w2xmkaqu5kpmsuzc2alm43obwqv@rmb24pmry5sd>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH7PR20MB4414:EE_
X-MS-Office365-Filtering-Correlation-Id: dea48f1c-5672-4ca4-59d0-08dc47266f24
X-MS-Exchange-SLBlob-MailProps: RlF2DIMZ1qUQWS8lN22nULkf5597sA7XohXtyjFUJix2A5x4xn175B5c2kxm4g+N+8FSSbK5EhQCznHrBZltGv/wU0qhdzk23WU88lvYl9924dqT/12B49gDBRyj6ypTAbq5W5cWB2Em0vVoPoXkaP6IB93I/BbR7EuRSbUdSeiMQqoRgZ3FYo6uO9yv5yWQrRtGtgdlObVIco00dojkaS0xdKg9cbH2ZXCBe8mEqAPo8hZiTZZ6j5XT0SNIilokaN2Eu4QIw6OsqaSrJeFvn0u2lUtgBEbGZ0nLC08ebbxnWjyneLJBN3xIB/IR3BqGdebEC4qZyhbO0w1nk1Suedm0KMdONMSSE6iSFfqYuMOUdFAMzIJmN7wxFCR2+qUhAxsPn8e64qH9kFYVVJVYWEUVApDRtv5TXH+cbz8dxt+kdFBWmjZB1AIqTiX9wVr9iip3xQgZNLHcR8ZmqxfH2vv/CKXsFHEqptCUj1bqon23ivCpinEluCgpapAARD9knr/YTGTmnagP+63zzmZ8QitEirPTGJHd6omwtp4OB2YJHHeF69oaXwl29JiKloapDQZORzwMuH0449hfM1idD+FBZPrXEvfvJDTtTz2KFm7PqeBNUhrp8DLMirDNN4JIbXTm13sM7xrQrVQ9oIRo4OGs6YAsbdt0p9peVWlEzErP1BafjtXj3oLJ/j5oBIXDtPMLaejyIHiaX36z3dOLunGnwcjP6GxXod9friX0NM/1JaQ2eZiz2yxuo8dpVv2ZULnk0FZ7liJufNZqGbsQFVLiM1XY0C30QKqjOImzzeqWRF3T0xq3bQKa6v11sJec1FI9hAli0DieCNBAFHx/IBQN5pf1VTF9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4z7gKHJnJdGSLNkZKP0edllZLH0Akx2eBRF4Jc0/lcZCVEr0Ykr+zyZk8l5meoR35h/LLvls+U/Fu8dpMnnCcQIjqTfGakIRrDrDbWhxgRqhpe6wNXivnFl0d+smiEnrwD7NoR3vDikZG9zZ5jiilqKqodvqtFjeamWBjqOqSamEwWUtwLI3FI0i4pc1w7GJEkhclfvjIJoEnXxpAEmQBrhZKlH+Uc2MV42HFaVK15/tnBh6JRr1Lzgc83erpDiHV6keLfsayn1CgvcOrMHQ+lUBpz0uDpnKPw35B7X+CXZ8vxV8ahm6EHBYvAMSg1RDQHaYyasRpYJHvfi/eeDFzIpmx/gs+Ij7RS7h9RY9S/nBQ/2iW0dxaiJuQsAiYXNKH5aJdCXaW0oEpd+2nex/Xe4tWMECpZsK1XDWQvwQ74kgvhx1ousoeZgbtDlqRxYKSXwQEcNLrW3PqLXb+PcPEThQiswtJsCWUUXv5ZdmOpe+G0JbwHcGLNMt6v0f7D8Bn9jOwTseGNDgUo21TLZKSJ55C5lhhpvGByMIjetAGnbwl2TyrxXpR/xvTYHqGNwICiHpsfXYA3vrzuV/T5NWau4WbXr54dQmXbJOQsjuCanVr6pM+apTnsBWXLk3ePtPOQXxRDP/h0YaUAMfLD1LqQYj7WPUmBIaJQlpxMYwHZoVESNqpaDoiRy9krmDu88CEaIvKiv6MY2LAzDZCuwwJg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YCmo0rtUC5mkbPKI1P+IrEbQH4e24dI8zVHogwUoOVk5N1vb1lISyDX71/ru?=
 =?us-ascii?Q?aHV22I7fsxNiS4dGWEvEyZ5is/pKSlPHS7JnIUTCHkxqf7Bb7DpcDSLpJi6L?=
 =?us-ascii?Q?8D2SLIwsYBchBrSZuPocSWq9/jroowIo84AEvmmIfC7w8pt4ahSDRmqKwYSm?=
 =?us-ascii?Q?sl2nstcRqkOIzoUXDlOr+iIYcnQ6RguqjD60CRv8nte/rOdarIEQ99MdlRHg?=
 =?us-ascii?Q?30di+KP6ndNF9T/SKH+5l1gC2dwLPemf61bome3NPA+6jCPV8vwOlAc6wwkr?=
 =?us-ascii?Q?920XX/h9+GV1AiHZ+Bw/JJK1iiIIM4fB5sbRWg49+YVAEEkJRmmm/As4aivB?=
 =?us-ascii?Q?tMEW/Zh5MPcQeWrEbKgY72TsFWq6NxE6O1+kuP8HOu9GlDamC9LgngIoj6wC?=
 =?us-ascii?Q?HfInyLYXlk7jzShHTSrpGfc5ZozxdCQwd3AVr9bI1nEAZEaOLyjvuOj0VPyl?=
 =?us-ascii?Q?45TdF68IrEQyK5EzDy+NI4AzbS++U80kV3ZLExB5qsjZK9GD2ROWXVwmuq0g?=
 =?us-ascii?Q?LaeQkBPVfiFAhOotBvsx2heErBwoZqP0Dxy5tkWHhPn68yfLAR+LIdbex5C7?=
 =?us-ascii?Q?V9vxJnTBxb1tUJmtmgtrFCneLplcPtNsdnDy+F1XpGuf/2CnW4MsY9FHwDgc?=
 =?us-ascii?Q?6k5dhGzXwG08SxH4D3nMfD6mL5P7XESyVkSrBVYqVN26blQpdea9bDoKumyA?=
 =?us-ascii?Q?5rwhW5uqslDmCYjlF4/QHHExMaJob/xJZiq7yMrLbbtbQTmLi1WgcEhXmRRb?=
 =?us-ascii?Q?RNieMw5WLK6l/FFetSUuiiscI/J2Fx/HArOaFs2Pb2VI9XEjYuqG6kmEDTAt?=
 =?us-ascii?Q?+RfC/Fgpk4cQ5SGzi8diMk0F0UDBRr3uH2F7unKYTM7vcAfnkJb6HJk9nFqk?=
 =?us-ascii?Q?t3iyKs7i7KDL/kOpQbmj3IJEdOjiWwrEuM3jy4xjlt6ePAUtN8tkE6wUUjWj?=
 =?us-ascii?Q?IM/Z3qYQ1AhfDEkKFhgJcPfBfV/V+/la/spGobCBu/HUlV3Za5Eok1PE1d0A?=
 =?us-ascii?Q?7YFqcQ17tCMPbYPyOU7K57Pslzhiya2ATG3Hs3NWbXGMuwP3L6KPP66Yunc6?=
 =?us-ascii?Q?FqZYLADpkQAf8DBnZVvgk+XGYQsLsWOlYKZzBivgwNMNuULdkx/Oktd1Uyqo?=
 =?us-ascii?Q?4nO1/fuTu8avl6G50XL59wBqA0XezZ2U1SKPhUqSQEpW+n8kgpNqPJyLHRQ0?=
 =?us-ascii?Q?cpA6UtjYHmszuly4yikkCwuManhcDtMVn+DPQkVxceP/5J0Ew7UGipEvJwFN?=
 =?us-ascii?Q?zF/O6XOcOX94JiJvBPIT?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dea48f1c-5672-4ca4-59d0-08dc47266f24
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 08:35:58.0219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR20MB4414
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_013604_109903_A89A4D8F 
X-CRM114-Status: GOOD (  18.26  )
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

On Mon, Mar 18, 2024 at 09:04:37AM +0100, Krzysztof Kozlowski wrote:
> On 18/03/2024 07:38, Inochi Amaoto wrote:
> > CV18XX/SG200X series SoCs have a special top misc system controller,
> > which provides register access for several devices. In addition to
> > register access, this system controller also contains some subdevices
> > (such as dmamux).
> > 
> > Add bindings for top misc controller of CV18XX/SG200X series SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> > ---
> >  .../soc/sophgo/sophgo,cv1800-top-syscon.yaml  | 57 +++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml
> > new file mode 100644
> > index 000000000000..009e45e520d9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml
> > @@ -0,0 +1,57 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800-top-syscon.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sophgo CV1800/SG2000 SoC top system controller
> > +
> > +maintainers:
> > +  - Inochi Amaoto <inochiama@outlook.com>
> > +
> > +description:
> > +  The Sophgo CV1800/SG2000 SoC top misc system controller provides
> > +  register access to configure related modules.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: sophgo,cv1800-top-syscon
> > +      - const: syscon
> > +      - const: simple-mfd
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties:
> > +  type: object
> 
> You have schema for the child, don't you? So use it: add 'dma-router' to
> the properties with $ref. additionalProperties: false.
> 
> Explain the dependencies and merging bindings via one tree in the cover
> letter or commit changelog.
> 

Thanks for this suggestion. This is what I need.

> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
