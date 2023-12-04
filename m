Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C08C4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 23:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S06oqxPyLInuMfhr7LLlch80YcKwCOqawM14il99Xxs=; b=M1hS/8TF5EpAyMj79JE+XTdU4w
	E8h3ewV6qDH3dWAsXeD0iegUD2pmlfNOODc/f6jvHqNXuKXDHyE/6/TbvJZNg/vHVRkhlkuVV91kC
	3m3hUNdPbS/2espPsPzUyOkLymbahWgW3QGtZk0lWusRe7Q55yPkNl+pfvF1/OliBJ3htNoTy9R43
	tloCV1J1aZuGJK/kCB2uO6XGDifzw0sj9j77wFnldGYHvRNhcEzNHykFCmp9wc72DmtD3QKiwzrxz
	axFDgWkUevw9WiKmfLhjTmZ27YtGigHU1iRv1O7m3DZ1AFbE0vO6sDgqd+aIMv01COMgSWxX4t4m4
	Uvvgf68g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAIq4-005q0L-0W;
	Mon, 04 Dec 2023 23:59:00 +0000
Received: from mail-maxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281b::800] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAIq0-005pzj-2L
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 23:58:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3uAHHofE39+J39rZ5P6GzwRm32pBAeZ1Hx36ODCP54FrxID+XtGedjgvVBQz8WvNJ5qffEeImEUyTG1t4nVGRNoVqAsmBmXcep7u2otEJ0Q6DB+xSV/UrAgLJ8vNFLpp6T5dYekmnbBBxxAfCySjSPMUnXS+VXmSkRaHlZHekRYE4B+/MFanjc3C4/4doKrl2LPYisE3xoQEXLZmQq0ikgqFPVj/vPmqxebVY7g/7KnTf6RGyEJO6eykeF35Gec5Bg4t/NJVVao7o6pW+pfDKqr0q5ecxzXtB7TTkMYmNezJ0GSsO/Mrhs29cjP/HL4oVgkYObYgsDRII+2Y5yphQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fm1Cp+VqLVbeyYlxDuFlFElJPdvB0dC9+ifSGDyEth8=;
 b=XgfaEpKdCIrav3kzBer9pjVADZ82OlsH2YZECjLvrCPXH2JtSzfHyhhBVLTil8ToSUqGs4tVI3NY08exXSEjm0k/YLkEByfZx+H9yGk14mm2HAQzq70UUnEricdQj/+6/XjaFBOB+jC4cK9Di2aE3TBY5I/Fs6Sil31tTcjogUtBmn8dGaN3obdIkr39oRB7gnpkqJcV+VKDoSm86CobV+Hbi6WnRLSwTZIYLeTdYkBYTKvc0KQS9eJaMqZdRFm+CRqeXlmSf3fw8bAz3hFEjOZhVFh+NhtqLGK9Hpy8woMAcBu1nPcGPHiPj8hWnPnI5HQy8gZdzAtTEAtz2HAJ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fm1Cp+VqLVbeyYlxDuFlFElJPdvB0dC9+ifSGDyEth8=;
 b=U9p92FzaIsXehkkHbxutIYFHIDmDNmyhQL5KHRlhKSyAnY0penWY/gubgM923FWfv7Civzuoqzq3+lKsCiemMFMJzZEY4B4TuPHHurhZtmsq3pqjBPQbYIrBab1eTOrM8bKI5qIHOa1TArHxJ4cHO82UTMhTv4lQeEdDc4VTzEB2nL704gsa39Rn5LMy/+ahBcaGAE91zsLnRFUS6K8Tatfa00CF0OdFTdZQPbFThzvsbwHJR+4qyIKkYsltTBeYwekQmbEUwYfTiC6Yyl7/oOuWDsIl5v19lmhCqsbHdhbyoL0dZEWFCmtEPlJZHMHZZUP2DBsynAqCxbosYa4IQw==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 PN3P287MB1287.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a1::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.34; Mon, 4 Dec 2023 23:58:40 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::b1a7:eee7:e903:9ef3]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::b1a7:eee7:e903:9ef3%7]) with mapi id 15.20.7046.034; Mon, 4 Dec 2023
 23:58:40 +0000
Message-ID: <MA0P287MB03329CEC490E59AEE970B571FE86A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 5 Dec 2023 07:58:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] riscv: sophgo: add clock support for sg2042
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
 chao.wei@sophgo.com, conor@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 richardcochran@gmail.com, robh+dt@kernel.org, sboyd@kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, guoren@kernel.org,
 jszhang@kernel.org, inochiama@outlook.com, samuel.holland@sifive.com
References: <cover.1701691923.git.unicorn_wang@outlook.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <cover.1701691923.git.unicorn_wang@outlook.com>
X-TMN: [D4XGbn0dJNAfTVE6LE0TT5TIQb8ycxZj]
X-ClientProxiedBy: TYCP301CA0009.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::7) To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <67092374-73ce-457a-80fe-7d53f2173fb3@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|PN3P287MB1287:EE_
X-MS-Office365-Filtering-Correlation-Id: cefdc073-6163-4780-dad6-08dbf524effa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gCf7qxc+I95ZOh2xtFc+kbvSRmIFde0UW+bYDD7G/Ih1HFCMXsXLCiK49ib7Lid9cqaKgSaJfnGdUsB8IJHmTbOElX1DN2uMGQ+yQvfvY2HGnp0v3NjSmEhBd6/tcsrmPct8qT2E7EOxamL13jK1SvxzZ0Kac+URj6gUUZgQwkixUHUyaoJMaKyllK5XONoTVZH7fCNzpNfOe5a67LI/3tJ3V02h0PEXW5hApdJRPjADA/Q3gVlM2Ih7eUBgu74H+5hODkAOF/zd7EQrFFTOHhnPHcSWWvy+JU1i4nTlST+42Up/k3Vf3UiIGQ3Z20T2zNrGU3Oe9VFZZqzeXugrAnJWoSfm+ZsTXdQqv10Qf5FbB5cO9Hi0m1veZZ3nWsCphb2gqaQtYjp7s/CJ4uoi5TX5+7YQ6/hHdlsIN59200JcEKGzVTUsc3XOOM/lYH0fX+S91izwYsmjKm3yeQbwdWdR2Zcb5vYjNGN+pDpfDXnKH93VBaP7DkcthD+2dxIf2MN2BIovNlBPFGy/DtDWYQZRgzTna3/dOZVnhPZ3j5V9lpcr5kLFaa9sLcIprjGlsbESix2Kf2sLCwUg2RUhyX3La/LgmURSacKoyPSDQUdp/8+3+tz7tRgbF+iw0Hssy/GMPKzxAOHHlFa9nbu5/Q==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWc5UWdONmsrT1QyN0VoTE9EYmMrMTRKOGE0RFBUOUpJUVJQSlRaUzNZRmtq?=
 =?utf-8?B?VWpET2lTL2ZZTnJEMnNxSEQrZVlNTnA3RlFTck9zL0Y0dnVYLzBnSEFiT1Fz?=
 =?utf-8?B?V09VcytvUXQyR3haRVUrY0lFc1VWcldGTkJrNEVHYXBCN3h1Q2VkQ0V6SE5P?=
 =?utf-8?B?Mkk0eUt2WFBubk9lTUZaY3Jhc3JWSjg0WSsvQkJjYlRoeFI1Wjh2a2llVXYr?=
 =?utf-8?B?ajF6Mk14ME1jOW5WVlVGRkpOZWo2T3pIUkJxVHczelNvYUhVQmdKR3NQOWVF?=
 =?utf-8?B?OXRGbGpRODlZb0VVZktGaHZ3V0RiUDRBbDA0WksxU3g5NlIwQVEvQnJvOGlr?=
 =?utf-8?B?V3U5M3lOLzZCVWdJcjVUYUdKdUd1Qm5FbUlWSll3cXVlbUNQV0pnQis4ZlVK?=
 =?utf-8?B?Y3YzQUZmNUFnS1NLMlhQd0M1SzZ6QTMxb1J0ZDY5UlBmYm0rYS94bS9LRldr?=
 =?utf-8?B?bE5yQTdsUjRpQVJ1TDQxb0VUZHBGSHc5SGZMcTJVMFQxTFliYmc0Vkw2WEdx?=
 =?utf-8?B?VTh1TWtRUWp5MEp4U29yRGtMM1VTQVBuTklIaE1pTGlUayt6aHRXcmpIUDVx?=
 =?utf-8?B?T1JvNGJSbVlJcFNzQllpWWwzRlVodVZvY2xMKzFOVVR0cEZWMWo0aFdzRzdt?=
 =?utf-8?B?ZzA5bEdxWkJjejlPYXUzcklET2JzY0NTYkpINXF6bzVQWFdJUk5HcHJ3dzJP?=
 =?utf-8?B?QjR3N3VsYUQxRVNkL3Z0aE1FWDNvOE5yU0Z0bVAzNC9GTjFEYXorVk1hRXFy?=
 =?utf-8?B?SVRaVTJIYnMwQTR3cXpjeGtYR1JlTlY2UFIzbHl3SHhXTHFxR0lOMDgwR1Jq?=
 =?utf-8?B?VFdwT1VrTHpVck5pVXo1MTV2S3N5YkhiNTRoRjNJUS9GSFA0c1duaWk3enBa?=
 =?utf-8?B?VmZYSnFnNGFmZTdvZHZ3WHUzTVBkdW8zalZncGFBUjh5TkZmMkQ4eHZvQVZ5?=
 =?utf-8?B?NVRoYXdCcGxiYm12OCt6UDNhMWNzQkEvUnhMVzZUc1NBS3EreVhZNitFMlJX?=
 =?utf-8?B?QWt5SG0xclFydllYeVpzaE8vVi9wcU5SaEl1SlcxbWpoaWpnajA2U3FhcUho?=
 =?utf-8?B?WTY0YjBWUnl1dWVrcDFCOGxiNGx5UENhbVJ3U0RNV2pwV0tuVW05VU5wQzJ0?=
 =?utf-8?B?OEFPSHZxY2VyN0l3dXl6VlVuSThJK1drSVF0L1ZDMGpaWkl3eDBBaGFkUHhB?=
 =?utf-8?B?U05zNyt2alpqTlhBWWQzNkc1V25qQzJUamlFaTVBV2NLVFVWWWJ6Vytad1pu?=
 =?utf-8?B?VW1nSVJBcyt0Y0R3dkQxVjhJOFlxN3A1eStmZFA4YkVMUDhJZXhHbW5sVFkx?=
 =?utf-8?B?UjQreW5rOXRqRkU4UUdWaHRNYnEycy9Od1VTVTZ1aWxVZnJnYWZxNUJibS9w?=
 =?utf-8?B?TzNCK2NHTmVJYWxJZGhTcit4blIyZTVzb0lMTWUvYkVDL0hEemh1dUpKNlhJ?=
 =?utf-8?B?OWtVcHowYkUyNlRFOUVnVEg0cE1GVTVWaTRoZDY0UmdTZnZRNGFkSkhmKzZP?=
 =?utf-8?B?Y3lkeUlkdC9OZG1iYjJORG9Ja3dUb1NzWDRwVXlNVEx5aDdzNUR0VWxoRnIw?=
 =?utf-8?B?cTlaWEVBa2NGMk1HNkt0YUlac2ZtN1ZnaCtEYzJJdXkwZFhTUURBTzM3d2dz?=
 =?utf-8?Q?Svk2cxr4qugyFPo7TrP6j5d6t3y4Hf9pccxNRPMTUZSE=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cefdc073-6163-4780-dad6-08dbf524effa
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 23:58:40.1739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1287
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_155856_771805_44F21C24 
X-CRM114-Status: GOOD (  15.38  )
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

This version has one adt_binding_check error (thanks Rob pointed it 
out), so please ignore this v3, I will fix the bug and send out v4 soon.

On 2023/12/4 20:54, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
>
> This series adds clock controller support for sophgo sg2042.
>
> Thanks,
> Chen
>
> ---
>
> Changes in v3:
>    The patch series is based on v6.7-rc1. You can simply review or test the
>    patches at the link [3].
>    - DTS: don't use syscon but define sg2042 specific system control node. More
>      background info can read [4].
>    - Updating minor issues in dt-bindings as per input from reviews.
>
> Changes in v2:
>    The patch series is based on v6.7-rc1. You can simply review or test the
>    patches at the link [2].
>    - Squashed the patch adding clock definitions with the patch adding the
>      binding for the clock controller.
>    - Updating dt-binding for syscon, remove oneOf for property compatible;
>      define clock controller as child of syscon.
>    - DTS changes: merge sg2042-clock.dtsi into sg2042.dtsi; move clock-frequency
>      property of osc to board devicethree due to the oscillator is outside the
>      SoC.
>    - Fixed some bugs in driver code during testing, including removing warnings
>      for rv32_defconfig.
>    - Updated MAINTAINERS info.
>
> Changes in v1:
>    The patch series is based on v6.7-rc1. You can simply review or test the
>    patches at the link [1].
>
> Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v1 [1]
> Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v2 [2]
> Link: https://github.com/unicornx/linux-riscv/commits/upstream-sg2042-clock-v3 [3]
> Link: https://lore.kernel.org/linux-riscv/MA0P287MB03329AE180378E1A2E034374FE82A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM/ [4]
>
> ---
>
> Chen Wang (4):
>    dt-bindings: soc: sophgo: Add Sophgo system control module
>    dt-bindings: clock: sophgo: Add SG2042 bindings
>    clk: sophgo: Add SG2042 clock generator driver
>    riscv: dts: add clock generator for Sophgo SG2042 SoC
>
>   .../clock/sophgo/sophgo,sg2042-clkgen.yaml    |   50 +
>   .../soc/sophgo/sophgo,sg2042-sysctrl.yaml     |   35 +
>   MAINTAINERS                                   |    7 +
>   .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |    4 +
>   arch/riscv/boot/dts/sophgo/sg2042.dtsi        |   79 +
>   drivers/clk/Kconfig                           |    1 +
>   drivers/clk/Makefile                          |    1 +
>   drivers/clk/sophgo/Kconfig                    |    8 +
>   drivers/clk/sophgo/Makefile                   |    2 +
>   drivers/clk/sophgo/clk-sophgo-sg2042.c        | 1371 +++++++++++++++++
>   drivers/clk/sophgo/clk-sophgo-sg2042.h        |  226 +++
>   .../dt-bindings/clock/sophgo,sg2042-clkgen.h  |  169 ++
>   12 files changed, 1953 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/sophgo/sophgo,sg2042-clkgen.yaml
>   create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml
>   create mode 100644 drivers/clk/sophgo/Kconfig
>   create mode 100644 drivers/clk/sophgo/Makefile
>   create mode 100644 drivers/clk/sophgo/clk-sophgo-sg2042.c
>   create mode 100644 drivers/clk/sophgo/clk-sophgo-sg2042.h
>   create mode 100644 include/dt-bindings/clock/sophgo,sg2042-clkgen.h
>
>
> base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
