Return-Path: <SRS0=n1sQ=GK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49767C433E6
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jan 2021 11:40:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA9BB22CF8
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jan 2021 11:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA9BB22CF8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cm5I3M1zRB4kw8f4SDUnCWzpH5cm5mQ7MYadTVMlsEU=; b=V/J0UwwTkKLfzJiD5x+ahaZb/
	7yjIt8Jnt58Fw7KgywyDm8J7EVVeaRKepo+QkydCAIYSJZpPao5y1Z+KU4bL8oGfhYGWJduLtjrjo
	kg4G3NcgOIiVJOEJcpU2ew3d/QGPLRhwkFFT5Jze3N1JoWhucTr0EAEvXmDeS8fwRQR1Tx8dt05Mb
	QhcqcDEac/YJaThcx54WfIcV0gpMrlXbexxHt18cL+ObgJu5CxhSjbxhmJP+cCIVUFg5QXhYN9AZ9
	w9BmGYIfHqekMJd0be0K67Ulije4Tt1qXTBcHZBZeNgYfBBERltmoofKELcaCV4XT8Yj/RcBNWlD/
	gV6Z+v/AA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxTdw-0005ck-IX; Thu, 07 Jan 2021 11:39:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxTdr-0005bM-6Z
 for linux-riscv@lists.infradead.org; Thu, 07 Jan 2021 11:39:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1610019587; x=1641555587;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=hh88MeXfbWANBeEHLTM8SZbwNby/AistNL/iUpVK8l4=;
 b=Bm2l0hGbH3dA2mezBHRwKFLJKDbinTI/Yu/DNZoN2BIAsZnV8MwC4q/2
 Z46vXwvHr65MartEFZjZ1ZfW6YqwhTBcnDHf5M9xwQRt7YBBvMKdy0r0l
 hcdZj28tvhv9sA7hEP+91n+s+ebzJYdQtR7AJEOX06pIIoWZcej6TGQKE
 JNv45RJLfcdJUshu3CD/z8nf9JnHVXE/XQT7U5ZL+j41bo+HJ5XfMPv5c
 dwTC3gkLBRP9XEBY2GKg6/Lt1ndAptoIM0a1tElZotbJW2PjjBUJqPe/9
 EV5HFZ29RtRJkd1aH217jcp+hxlETv+oBMrgnfykvwSwMaVsJScG51iaE w==;
IronPort-SDR: /LFrllATivWoFB/cGnNYDhWO6pqui0YyWyA9svmSoExgmNGi/4o5YRnNaPC+pvpSbBJT69f08D
 /zMHAoGsBsCbnFZbilgaVFY2A9XU3MeC0bBukmoZFiIBKS/DgRD6WhLmk5TQChz/rWqbuHvm1y
 uv865GjYRuR99NVEPQ9L+SHqaM8ngqwC+GzlYy5Ve1fRbRXwDYlGpSQO384kShLfxwi6sOPS/I
 Zp4ERjqECM7ka2ErwdObdmSaDW6hSDdhXjOWt4Iew9x1xP4E7hpd9dy0XuVffK0m8p6jw372BK
 nCU=
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; d="scan'208";a="39640441"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Jan 2021 04:39:44 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 7 Jan 2021 04:39:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Thu, 7 Jan 2021 04:39:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQJhDMNpN2EHpL524e+eDkikeX/oAhZe0tST19vRxEPM6lBB2LBjQxZUVNz64DsdI30s/eyB2EPsuh83Es1HuitaG5KxwXYpaOOFO/Vs0iUzXSJlEa+yh/ysCX2dw77BBo9xrfW8j3ZueNQFkEomeW1WkDIdIMFKBAg0rCxUzlheWOk2jSH6Tjo79aARyDGl3UBtgJHzjLW3KNFl+fdaF8h7smxiM0QiQbC9gQ71Oc9MEC9qb4vaCXgtUMm78D1SLUaUaW7XjaMKnoNJQgxx8rJZmKI9oJgDN5fPkP4vIVeLU/2Z3YYwkb4sjZlr029ZGz+ESVrBILOAnAitkq3ugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hh88MeXfbWANBeEHLTM8SZbwNby/AistNL/iUpVK8l4=;
 b=XiNsH+JOc1iqa9JGcza/bMCF4nX/deK+GrSFEsYo7D9b3mSOpkv1rSE3Z6qP7T1baiE9D1Tv63MAKmjkAz9tvK2pVF2qYO+bWcO3gPH9LayuI52dteoH0tyCdtWna4IFcDqQ7S0eIlKJg9YpYTVf02cogIQVVVueoo20lUb3icHeXqJgELUoay9QYstjtn357RQ+0RkkaV0koFbt5YUAkN8VQVwWsa/LiGnw5XIDQafdahvG+gtFoc/x+EZnFW9KZq8Y3pE75xkKEx1UPAi1YHs5UFVXt8g0/ehfnQqZChw1feqk0wVUB1H4f9R29PJ50ZtARcFcjYGgB+B8GO9ZZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hh88MeXfbWANBeEHLTM8SZbwNby/AistNL/iUpVK8l4=;
 b=NChjel/aM+2DlyGubhyVbx5Hf9kTdm3QYgCNB4HI/3MhT2RYha4FHQEY2Fw5pk6qhuQeVF0lFvnlqtezK803xPZ7Pli732aRwfA6j3nwL7MolTT/MKxUiEzCaTyHjTzki4bGWyAy5SqD+4aqRuzApy/ljVPqCgNRwQQJU63OU/8=
Received: from DM6PR11MB3690.namprd11.prod.outlook.com (2603:10b6:5:13d::32)
 by DM6PR11MB3578.namprd11.prod.outlook.com (2603:10b6:5:143::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Thu, 7 Jan
 2021 11:39:41 +0000
Received: from DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::2d16:756c:541c:7aa5]) by DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::2d16:756c:541c:7aa5%6]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 11:39:41 +0000
From: <Cyril.Jean@microchip.com>
To: <atish.patra@wdc.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/5] RISC-V: Add Microchip PolarFire SoC kconfig option
Thread-Topic: [PATCH v3 1/5] RISC-V: Add Microchip PolarFire SoC kconfig option
Thread-Index: AQHWyhu0xs81qxA4TUKGelrkN8HN26ocP1oA
Date: Thu, 7 Jan 2021 11:39:41 +0000
Message-ID: <4655c810-e406-f807-d2dc-1b2e0198d945@microchip.com>
References: <20201204085835.2406541-1-atish.patra@wdc.com>
 <20201204085835.2406541-2-atish.patra@wdc.com>
In-Reply-To: <20201204085835.2406541-2-atish.patra@wdc.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.40.244.225]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f1d9d4e-6ccc-44d7-af57-08d8b300ec32
x-ms-traffictypediagnostic: DM6PR11MB3578:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB3578A6B39B6ECD17750D74379EAF0@DM6PR11MB3578.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jpvj003fNUmuJOwwwyI1eMyXt6RjrYS5Jzmgvnp2kp4LP80Z2UVj4yKoi5rwM4g1xUu1qfP0PyhNJrxHyf/TdJsd1aua2JJdpmzxndGOUvF0tLn4QQzFZ/6lnioFUYSKmc6UMYJGdnVzEHto9z3EiBjR+Ur9ljvVVRNKKDBI84fm/x2mNMcHcjn5bW/e/YK9T27LjZ1LCVt+k/dttwco9c2ESo4EXWVHY3XavISzzvGORI7cEcOICVzuUOC6qkQ5PqFK/yhcV3zc2DBWcuVcGHFEGstO46m3cDaPbyEHDoaUy4qJgZUDQTRRSTHp6mAM6sTDo/uUJrPCQhnfOCOhcArvKyDJpr/4fC1AsrMyTKoH/o1nAg5CXn3U4MBzph7os/DYvqZLiuTJnPP2a599SLgEOQOfDKRcbL3dvKEWvX/lzfh4Uka/iyewSs+8SJNUB8+LRTjr5v2Bv7bypRyoO0c42tYJPXyAdvuwe5Dwsag=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(39860400002)(346002)(376002)(366004)(91956017)(66946007)(7416002)(71200400001)(6506007)(4326008)(66476007)(26005)(186003)(53546011)(66446008)(31686004)(86362001)(66556008)(316002)(5660300002)(83380400001)(8936002)(64756008)(36756003)(54906003)(478600001)(6486002)(76116006)(31696002)(2906002)(8676002)(110136005)(6512007)(107886003)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?eUhMTUx1UlVuVXdXQzNCNG5RWWNqV0hWTk05KzF1cm9KZWc1eG9XcWJkRFM2?=
 =?utf-8?B?bm9LV3ZLbXdVek1PMUZaV1IxNW5rUGFqallwL2lkcnNFaC9OSEJHWXIvcHI1?=
 =?utf-8?B?SWRlUWc3WkZiN1laV3hIaTh4Rno0WVZwU3hFWjU1UEpMcXZIbGVkdzNGcHR2?=
 =?utf-8?B?Z0t2bDkwSFNDMXF5WUhpdlRKUWhvRmVhVjIwZWtSRzd1ZHByUTlad3BOcEo2?=
 =?utf-8?B?RE95MEN0OG9hdmo4YkdVQ0RlbjZjK1puSVVhanA3dEp5UzdCeGttbzEzc1lM?=
 =?utf-8?B?YzBHS1JTak1FaHdKSms2VTUwUm1QellQUDFteWMxdk5mZDFZalNrdTg3RndG?=
 =?utf-8?B?QzlRUStzNEVhT1FPOTBzTmlacEV4d003bjJncXdLcFFZNmZ4ZC83cDY3VFVP?=
 =?utf-8?B?SEZBSlNyR09GanZ4QktISUpMN0NJbit3MG1uc25OVWs4dU1TeG5RUkxNaUl6?=
 =?utf-8?B?YWIwRU5GRDUwRzJLL1c3bGdCU1Q3VTlZb2hiUmhHMmp0aDA5bWUyaDBQMzF3?=
 =?utf-8?B?cXFrTWF5U241MmhvaTJpc2MwZk5wNk1NOGdGRmZRNjdwcHVkV2VQdkVCT3pp?=
 =?utf-8?B?NWdySlI2azNpS2xucHQwVjlXQVMrYWxBTUpTL0NpaXdXMytBblU3ekxJODdP?=
 =?utf-8?B?RTVtYVprZUwvL2tyRHRicE9XRWcvY1JOL3A4UnZUZ05IdC9oRS9OZjhDTTZR?=
 =?utf-8?B?SXA5VTlWRCtjR2U2R0xTbXcwcm9WZzVBU2wwSWtEdi9maEhjQm5GN2txTmZu?=
 =?utf-8?B?SUN4NzFwWWNkQ2x2aEFBaitteEcrd3VFNkJQaDVZTmZMb3dXQW5FRHRjR1p6?=
 =?utf-8?B?bFFmbjFBU0R5RWRWaHhUeHI4N3JqMlVETFBWczV1N0lneURtUGZ0UjZ1R0ll?=
 =?utf-8?B?M1dzcGZYMTVGZFJpOFpXeUNzQklsK0FwbjVoZGc1b01VM2VCQy9OeXgrR3hq?=
 =?utf-8?B?czJUZ1VOUWpXbmN6bHdQU2p5eHFvSHU4N0tpanRrc1VVeitpOXBhRlRFcWhk?=
 =?utf-8?B?S2R2cjB4eHp6a1dabUVZWVNDL2RpR2RkcUUyVVpZQWk5dVVEZzJ0eVBoZFp1?=
 =?utf-8?B?MjZFVFpvcW9iUVI4LzJMbE50SjlJSGV5UWxBSEZFcXJaTzB5ckRNeFV3Ullw?=
 =?utf-8?B?Z0FJTkFDUGNteGlMZWVpU3FNcnhQVDFzWGVVbTBWUTZPalJ5WWljd3JaOFBC?=
 =?utf-8?B?bTBWbTg5T09xa3BPejFJdzlSclJjT0ZPQlJXTUNwbTREdkRNNlpYYnZVQk1y?=
 =?utf-8?B?bjhydHpJVWFJekNMcEJTNnIzdk5hengyY0NwRFUxaTVkb3VZbkI4T2RuWGF3?=
 =?utf-8?Q?9h0Cn2XXNaoqo=3D?=
Content-ID: <D74F8BCFDF8F684C87F495FD1FF81176@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f1d9d4e-6ccc-44d7-af57-08d8b300ec32
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2021 11:39:41.6092 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y7gI7V72CH41tCFYudKoMxV90Hxx01iq7qrH1T3XmtqeF4UkEKA2tcvuKus3nfhDbXkGhOZoAXECts7/7+MYWfZL/grWTdxINC0K8gJgZz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3578
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_063947_506062_189F5E0F 
X-CRM114-Status: GOOD (  16.20  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, bin.meng@windriver.com,
 Daire.McNamara@microchip.com, anup@brainfault.org, anup.patel@wdc.com,
 Conor.Dooley@microchip.com, robh+dt@kernel.org, Ivan.Griffin@microchip.com,
 aou@eecs.berkeley.edu, alistair.francis@wdc.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Atish,

On 12/4/20 8:58 AM, Atish Patra wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> Add Microchip PolarFire kconfig option which selects SoC specific
> and common drivers that is required for this SoC.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Reviewed-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
>   arch/riscv/Kconfig.socs | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 8a55f6156661..148ab095966b 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -1,5 +1,12 @@
>   menu "SoC selection"
>
> +config SOC_MICROCHIP_POLARFIRE
> +       bool "Microchip PolarFire SoCs"
> +       select MCHP_CLK_PFSOC
Can you change MCHP_CLK_PFSOC to MCHP_CLK_MPFS to align with the v2 
clock driver?
> +       select SIFIVE_PLIC
> +       help
> +         This enables support for Microchip PolarFire SoC platforms.
> +
>   config SOC_SIFIVE
>          bool "SiFive SoCs"
>          select SERIAL_SIFIVE if TTY
> --
> 2.25.1
>
Regards,

Cyril.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
