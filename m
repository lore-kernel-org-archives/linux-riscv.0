Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BF0C2D0A3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 18:10:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D4A020757
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 18:10:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="loFOkcWs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="yFI4VuyS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="oH153E9d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D4A020757
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T57uOCjMV+nwmLdWisLwUOl4iI3tcKMyEomp6sHd8nA=; b=loFOkcWsTw6WwWAxPrDQvetim
	aIWYIDUmTOMJRdU4itaVpTAEpp66/NpNgWqnQ1Kjb0+pJuNtXWMAKmup6BYh03rFWNwdPqLdpZ61h
	6rMkVvC2Rvs1TezyVZHhJkf5sybSLZCwYx96YFS0+FwCLCeB4Z4WM2kYR+ffHWIG2Yag7WOtIuF7B
	fdKyx7/YT8CVKlZHJOnPgteOVUuksgbVi/JZKVCmzIFK3RtuEP6ZEIDDRgmbQ6pgjYuAz4dsxT11l
	04mSx2ovVmK9Etei6Vt5Acritn4IqsgTzxw/SHsDSDX319MGrh/lUOsJHs66iBiLnULTPDkf1UerI
	NwznCgriA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ka0lE-0001JX-Ux; Tue, 03 Nov 2020 18:10:24 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ka0lB-0001HP-78
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 18:10:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1604427021; x=1635963021;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HIkv7GTnf0OYaoZaBHpcdwfhiMo43xcZgaiCAnphkGQ=;
 b=yFI4VuySPzw3r4btdsLKXZbUCaCpak9+5HyLcAoDoviRhyakI4Ft7bvF
 lhW9HqFx6IExQ54J5IHZ64jxxTrpvxKLfjCSkndX6GL25ED62Ggrm7t5F
 lH0Uo8S6Wr+i7kdE19PTWIaWtI+2ndAZvbR98ecEE56YanYgi3mVJLWxG
 A8VQwiiLBqr/sHKDpL0we0RftikgJpbb8TXw5YhBbJ8EiZ7BP2Zocp5e+
 JPxLv0H9PU5syW8NvVnMthhSFzVpII5R4yPMJQX4XdpDRc9wcFh15hRrI
 wFNIvnFOfaHfZKscAJ4ZyhWmyJVbS9vIKVmfoO3Wg7RO+HQ32iI8B4C2l Q==;
IronPort-SDR: l9e0ibLxtY/RnL518pxpo70rOyLQ+I7qp80rIKxMz/SdN0x0H1soW9fYdfFakQhLc039EqRWwr
 B2m6o56vjI6g3U3yyZu0UPyLS/6GD7IEnlZdSxfiRTNjZXfl2za81vNObiXYvuKGLKCqtJRB/y
 6at1G6JUxhtrSG6g5eRr3p9lRmJgvfKPOL5mgmd1c1X45bqgusmc2Pyz5sitrYQ3oyYc/Le4LR
 CyPNi+6Wv1nUIoFrY2TEvmTtCNOf7FCN9mlr8uwBE02NKomVBgIIPNeUeWNRiy5VCC2sEROP1i
 9mo=
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="94928651"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Nov 2020 11:10:18 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 3 Nov 2020 11:10:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Tue, 3 Nov 2020 11:10:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkgJHwEDHiWouMh6TwO4/jP5mmkihuVShBKifqwehzUSHIDjuITmOlPyqT3V/WNU8gfONvOQAylNcVP+jNtTnthTtTrFFlLOMkxxzAlSN2B6OOpuD1LHY1jQ13E11za2cyXX5kcxQg29SscRzu2Uq22ICySIBH+xl6DVqgy6gamrZ1RNJhA77EV57FLKJL66GIbfrhVn/BrPfwN3N/5kzho/6HnbGNNxF0CnRyWWMMUFwoL0kEIfbFwRpm5wcCDEN9AVNGezBrjUZ0lMEn/2BTX9buUm7AyUYaqHUeTXtKKFBzcV+CgVzSSN6rotiMW494f8jb8uVU040wOtpvpOcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIkv7GTnf0OYaoZaBHpcdwfhiMo43xcZgaiCAnphkGQ=;
 b=TjSMnhH8P57tUGBHT/HfnVBLZHxRLHhRVOjO2VnRTzwp8VN2DhMAyoyBes/4bfpQqQDCvr2EIJ9XLJzRsbd7e1yR7BEvK+g7Ypp1jmQrfxYiJNcvg7cvKPiR3QW1AB3kdg1G0LSUG81rpJSCqJ0qwd7OR6ZaYiqWOFwq4mXTK7CUdPQtHJO0ji05s9fDmxNK1Ia2MJOEVFgUJWSDXIj5Ee0H2glv1M8uyqfWxtctJBmuRzh68Ql0PK9X64BO1+8o94bNXBenyRm4HJsyGo8C0+8gbcSDk/Gymi4mGilJOLlmTdYOSXMTfR+AIKV1iC7KFrZTh2P/16rpT+6WjuVcWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIkv7GTnf0OYaoZaBHpcdwfhiMo43xcZgaiCAnphkGQ=;
 b=oH153E9dexNV4kwF5u38SgjCKKUEODsXy77kQyLhChwLlg7g08lepyysIfAMOU23IOrc0iJnUvfkWr+vDEO520SWanx0OicxUHbsDKWlryYQzbe++XxsjsFXQB3ikic6T/kdSBFsP9FuMjWb7lp6Sf3xB5/1SYXdKcQ25TsWEoQ=
Received: from DM6PR11MB3690.namprd11.prod.outlook.com (2603:10b6:5:13d::32)
 by DM6PR11MB4234.namprd11.prod.outlook.com (2603:10b6:5:1dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.28; Tue, 3 Nov
 2020 18:10:16 +0000
Received: from DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::8dfc:4424:3709:9e69]) by DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::8dfc:4424:3709:9e69%6]) with mapi id 15.20.3499.030; Tue, 3 Nov 2020
 18:10:14 +0000
From: <Cyril.Jean@microchip.com>
To: <atishp@atishpatra.org>, <ben.dooks@codethink.co.uk>
Subject: Re: [RFC PATCH 2/3] RISC-V: Initial DTS for Microchip ICICLE board
Thread-Topic: [RFC PATCH 2/3] RISC-V: Initial DTS for Microchip ICICLE board
Thread-Index: AQHWrYIX44xaU0n+lU+FVu/TfSg/namuYDqAgAFcagCAAO0agIAF4V4AgAAzBwA=
Date: Tue, 3 Nov 2020 18:10:14 +0000
Message-ID: <fbe404b5-3bb1-dd00-e558-e4a55960b767@microchip.com>
References: <20201028232759.1928479-1-atish.patra@wdc.com>
 <20201028232759.1928479-3-atish.patra@wdc.com>
 <41f1248b-78c6-bac1-410b-9e222368c5f6@codethink.co.uk>
 <CAOnJCUJhQ=Zv0S4iCK4CDzQr_dfkw3J6ycdM=p6=5B2_sL1Ekg@mail.gmail.com>
 <2d7cc829-5df6-6b94-4c8f-9bae6080444e@codethink.co.uk>
 <CAOnJCULejyF9xyLk5M0TXqW_=nn0KM5aE8nhK+1h0Xayd2pKUg@mail.gmail.com>
In-Reply-To: <CAOnJCULejyF9xyLk5M0TXqW_=nn0KM5aE8nhK+1h0Xayd2pKUg@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: atishpatra.org; dkim=none (message not signed)
 header.d=none;atishpatra.org; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [86.40.244.225]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d33cea0-2bfc-473c-2461-08d88023b679
x-ms-traffictypediagnostic: DM6PR11MB4234:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB4234247082FAA9DAB17631089E110@DM6PR11MB4234.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +Gh6v9KS2jkuPnleFargknhPFmdXrvLkyMoFOOeF2d36s2e7ijyDYXZT4pI1ng17YtATqjfP3/guxATTH+gSyfYqa+nDx+20Qdf+o1qC4L9aVaeqJ1AFeqNy1s8NpWlw0svT1bK6IApM9CAscV33hZi19ZkliPpzdVg+JdYtB9ZeHG3UK5hhybLrNKNouy16MC5k9FiXeE9ItEtl8J3fIVpIYH/i938HMsqKt2nvMOe1VlXm1byoZKXVqGlghyIOceTi9RXDDcw+Wb4DWbtYO1NI+gyuZ6N1yfG9JtHTq1gq80k2sNpD1vfldCEFanB93a0fQBbw2Ja1Vdw7ZJEoXD4w7Y6bxZ5WcuJ76bwX05NUM2Shw7QvH2NKDfSKUuuc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39850400004)(136003)(346002)(376002)(366004)(8676002)(64756008)(86362001)(66556008)(186003)(2616005)(6512007)(26005)(7416002)(66476007)(66446008)(83380400001)(6486002)(110136005)(31696002)(71200400001)(54906003)(31686004)(66946007)(316002)(8936002)(30864003)(91956017)(76116006)(107886003)(478600001)(2906002)(53546011)(6506007)(5660300002)(4326008)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 9YPJjq2hnfvo7AnzwIzrV612ERzMDkW51S8nHIUzJbJpjSCothQ2ygXWFzohgLF3WhUh9HQI8p3/Pj2kXOeEhXfDwe8o9BAePAXkcqbkbQwEeepD6Hq6KEstRkCgbpO5De3WfX/o60MlsKPSoCkmx3teCiKGPZSB/bEx5UH6gGh++vVLHO+c/4QB6rscGJ+yIONVMLZF3IbYN3mM9NIFFN1DoGetKn6s40FRbY/7x2fspS1DP/WR4x4HYI+g1+PuCxnOQ4D6xDASu81AMTw3k8i5PVGJQOQp5FRucQME8sMCVl0gcIsumcU8rgIlcY/LcBzdUzFRhnvXSM6ehFbL+0ClE7OKZjdO0er9C2QDEkajVwqQQKFeJP5NyNzPWJGB/SMG1d7HR+W6HCKwg0cz1dY/u7guMbw8lZKJrlIcBlzOWUKdUZTgCuchLC+sxdw93hbwU2kId3xX2/LY8AxJ984HH6habEAuRO/Zr8+AhK5qAR+N2VZer9l3a56gi0zHS1HhQz5tFaH8/QYO0Heg4jN55pBvnvLUk4w7erxlf1mvNVk2dpQcoIPkp22BbQId+Z9O2kSZY1podO2WQebgUq+awrCGgChT5K3Txg8hHVGSzgPr4tuz4kOeKSR4DP27YVRQELarfDBZ00vTmTvWoQ==
Content-ID: <F780C5126414FD4896DC9B6F28F0FBEE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d33cea0-2bfc-473c-2461-08d88023b679
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2020 18:10:14.5478 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CBg4KW8BaARLhVbkWBJOJFeFTnuYLpbzbsIgHb5/nfkwWZ49/cjCBo/2/tM1WactGQy68eiPc95yErNMInPvYDt6iRZfBEq2QElKAg0Af38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4234
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_131021_704525_5C374007 
X-CRM114-Status: GOOD (  13.96  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 Daire.McNamara@microchip.com, anup.patel@wdc.com, linux-kernel@vger.kernel.org,
 atish.patra@wdc.com, robh+dt@kernel.org, alistair.francis@wdc.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, linux-riscv@lists.infradead.org,
 Padmarao.Begari@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/3/20 3:07 PM, Atish Patra wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> On Fri, Oct 30, 2020 at 2:20 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>> On 30/10/2020 07:11, Atish Patra wrote:
>>> On Thu, Oct 29, 2020 at 3:24 AM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>>>> On 28/10/2020 23:27, Atish Patra wrote:
>>>>> Add initial DTS for Microchip ICICLE board having only
>>>>> essential devcies (clocks, sdhci, ethernet, serial, etc).
>>>>>
>>>>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>>>>> ---
>>>>>     arch/riscv/boot/dts/Makefile                  |   1 +
>>>>>     arch/riscv/boot/dts/microchip/Makefile        |   2 +
>>>>>     .../microchip/microchip-icicle-kit-a000.dts   | 313 ++++++++++++++++++
>>>>>     3 files changed, 316 insertions(+)
>>>>>     create mode 100644 arch/riscv/boot/dts/microchip/Makefile
>>>>>     create mode 100644 arch/riscv/boot/dts/microchip/microchip-icicle-kit-a000.dts
>>>>>
>>>>> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
>>>>> index ca1f8cbd78c0..3ea94ea0a18a 100644
>>>>> --- a/arch/riscv/boot/dts/Makefile
>>>>> +++ b/arch/riscv/boot/dts/Makefile
>>>>> @@ -1,5 +1,6 @@
>>>>>     # SPDX-License-Identifier: GPL-2.0
>>>>>     subdir-y += sifive
>>>>>     subdir-y += kendryte
>>>>> +subdir-y += microchip
>>>>>
>>>>>     obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
>>>>> diff --git a/arch/riscv/boot/dts/microchip/Makefile b/arch/riscv/boot/dts/microchip/Makefile
>>>>> new file mode 100644
>>>>> index 000000000000..55ad77521304
>>>>> --- /dev/null
>>>>> +++ b/arch/riscv/boot/dts/microchip/Makefile
>>>>> @@ -0,0 +1,2 @@
>>>>> +# SPDX-License-Identifier: GPL-2.0
>>>>> +dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += microchip-icicle-kit-a000.dtb
>>>>> diff --git a/arch/riscv/boot/dts/microchip/microchip-icicle-kit-a000.dts b/arch/riscv/boot/dts/microchip/microchip-icicle-kit-a000.dts
>>>>> new file mode 100644
>>>>> index 000000000000..5848920af55c
>>>>> --- /dev/null
>>>>> +++ b/arch/riscv/boot/dts/microchip/microchip-icicle-kit-a000.dts
>>>>> @@ -0,0 +1,313 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0+
>>>>> +/* Copyright (c) 2020 Microchip Technology Inc */
>>>>> +
>>>>> +/dts-v1/;
>>>>> +
>>>>> +/* Clock frequency (in Hz) of the rtcclk */
>>>>> +#define RTCCLK_FREQ          1000000
>>>>> +
>>>>> +/ {
>>>>> +     #address-cells = <2>;
>>>>> +     #size-cells = <2>;
>>>>> +     model = "Microchip PolarFire-SoC";
>>>>> +     compatible = "microchip,polarfire-soc";
>>>>> +
>>>>> +     chosen {
>>>>> +             stdout-path = &serial0;
>>>>> +     };
>>>>> +
>>>>> +     cpus {
>>>>> +             #address-cells = <1>;
>>>>> +             #size-cells = <0>;
>>>>> +             timebase-frequency = <RTCCLK_FREQ>;
>>>>> +
>>>>> +             cpu@0 {
>>>>> +                     clock-frequency = <0>;
>>>>> +                     compatible = "sifive,rocket0", "riscv";
>>>>> +                     device_type = "cpu";
>>>>> +                     i-cache-block-size = <64>;
>>>>> +                     i-cache-sets = <128>;
>>>>> +                     i-cache-size = <16384>;
>>>>> +                     reg = <0>;
>>>>> +                     riscv,isa = "rv64imac";
>>>>> +                     status = "disabled";
>>>>> +
>>>>> +                     cpu0_intc: interrupt-controller {
>>>>> +                             #interrupt-cells = <1>;
>>>>> +                             compatible = "riscv,cpu-intc";
>>>>> +                             interrupt-controller;
>>>>> +                     };
>>>>> +             };
>>>>> +
>>>>> +             cpu@1 {
>>>>> +                     clock-frequency = <0>;
>>>>> +                     compatible = "sifive,rocket0", "riscv";
>>>>> +                     d-cache-block-size = <64>;
>>>>> +                     d-cache-sets = <64>;
>>>>> +                     d-cache-size = <32768>;
>>>>> +                     d-tlb-sets = <1>;
>>>>> +                     d-tlb-size = <32>;
>>>>> +                     device_type = "cpu";
>>>>> +                     i-cache-block-size = <64>;
>>>>> +                     i-cache-sets = <64>;
>>>>> +                     i-cache-size = <32768>;
>>>>> +                     i-tlb-sets = <1>;
>>>>> +                     i-tlb-size = <32>;
>>>>> +                     mmu-type = "riscv,sv39";
>>>>> +                     reg = <1>;
>>>>> +                     riscv,isa = "rv64imafdc";
>>>>> +                     tlb-split;
>>>>> +                     status = "okay";
>>>>> +
>>>>> +                     cpu1_intc: interrupt-controller {
>>>>> +                             #interrupt-cells = <1>;
>>>>> +                             compatible = "riscv,cpu-intc";
>>>>> +                             interrupt-controller;
>>>>> +                     };
>>>>> +             };
>>>>> +
>>>>> +             cpu@2 {
>>>>> +                     clock-frequency = <0>;
>>>>> +                     compatible = "sifive,rocket0", "riscv";
>>>>> +                     d-cache-block-size = <64>;
>>>>> +                     d-cache-sets = <64>;
>>>>> +                     d-cache-size = <32768>;
>>>>> +                     d-tlb-sets = <1>;
>>>>> +                     d-tlb-size = <32>;
>>>>> +                     device_type = "cpu";
>>>>> +                     i-cache-block-size = <64>;
>>>>> +                     i-cache-sets = <64>;
>>>>> +                     i-cache-size = <32768>;
>>>>> +                     i-tlb-sets = <1>;
>>>>> +                     i-tlb-size = <32>;
>>>>> +                     mmu-type = "riscv,sv39";
>>>>> +                     reg = <2>;
>>>>> +                     riscv,isa = "rv64imafdc";
>>>>> +                     tlb-split;
>>>>> +                     status = "okay";
>>>>> +
>>>>> +                     cpu2_intc: interrupt-controller {
>>>>> +                             #interrupt-cells = <1>;
>>>>> +                             compatible = "riscv,cpu-intc";
>>>>> +                             interrupt-controller;
>>>>> +                     };
>>>>> +             };
>>>>> +
>>>>> +             cpu@3 {
>>>>> +                     clock-frequency = <0>;
>>>>> +                     compatible = "sifive,rocket0", "riscv";
>>>>> +                     d-cache-block-size = <64>;
>>>>> +                     d-cache-sets = <64>;
>>>>> +                     d-cache-size = <32768>;
>>>>> +                     d-tlb-sets = <1>;
>>>>> +                     d-tlb-size = <32>;
>>>>> +                     device_type = "cpu";
>>>>> +                     i-cache-block-size = <64>;
>>>>> +                     i-cache-sets = <64>;
>>>>> +                     i-cache-size = <32768>;
>>>>> +                     i-tlb-sets = <1>;
>>>>> +                     i-tlb-size = <32>;
>>>>> +                     mmu-type = "riscv,sv39";
>>>>> +                     reg = <3>;
>>>>> +                     riscv,isa = "rv64imafdc";
>>>>> +                     tlb-split;
>>>>> +                     status = "okay";
>>>>> +
>>>>> +                     cpu3_intc: interrupt-controller {
>>>>> +                             #interrupt-cells = <1>;
>>>>> +                             compatible = "riscv,cpu-intc";
>>>>> +                             interrupt-controller;
>>>>> +                     };
>>>>> +             };
>>>>> +
>>>>> +             cpu@4 {
>>>>> +                     clock-frequency = <0>;
>>>>> +                     compatible = "sifive,rocket0", "riscv";
>>>>> +                     d-cache-block-size = <64>;
>>>>> +                     d-cache-sets = <64>;
>>>>> +                     d-cache-size = <32768>;
>>>>> +                     d-tlb-sets = <1>;
>>>>> +                     d-tlb-size = <32>;
>>>>> +                     device_type = "cpu";
>>>>> +                     i-cache-block-size = <64>;
>>>>> +                     i-cache-sets = <64>;
>>>>> +                     i-cache-size = <32768>;
>>>>> +                     i-tlb-sets = <1>;
>>>>> +                     i-tlb-size = <32>;
>>>>> +                     mmu-type = "riscv,sv39";
>>>>> +                     reg = <4>;
>>>>> +                     riscv,isa = "rv64imafdc";
>>>>> +                     tlb-split;
>>>>> +                     status = "okay";
>>>>> +                     cpu4_intc: interrupt-controller {
>>>>> +                             #interrupt-cells = <1>;
>>>>> +                             compatible = "riscv,cpu-intc";
>>>>> +                             interrupt-controller;
>>>>> +                     };
>>>>> +             };
>>>>> +     };
>>>>> +
>>>>> +     memory@80000000 {
>>>>> +             device_type = "memory";
>>>>> +             reg = <0x0 0x80000000 0x0 0x40000000>;
>>>>> +             clocks = <&clkcfg 26>;
>>>>> +     };
>>>> U-boot doesn't seem to be updating this properly.
>>>>
>>>> The board should have 2GiB, confirmed by looking at the device's
>>>> chip markings. We only see 1GiB memory. The 0x80000000 bus window
>>>> is only capable of dealing with 1GiB memory. The higher 64-bit one
>>>> can have 16GiB mapped.
>>>>
>>>> Do we need a second node for the second GiB of memory?
>>>>
>>> We could just modify the reg size but to allow more memory. I tried
>>> that for Linux but it didn't boot.
>>> Probably, DDR init code in HSS only initialized 1GB of memory.
>> Yes, it is only looking at the low window which is 1GiB max.
>> If it used the upper window it would get the 16GiB.
>>
>> I don't know how no-one noticed this issue before shipping a board
>> out with this. I have updated the firmware on my second board but
>> this only seems to currently fix a reboot issue with the eMMC.
>>
> We can't update the DT for Linux until there is a public release of
> the updated firmware
> with 2GB enabled.
>
>>>>> +
>>>>> +     soc {
>>>>> +             #address-cells = <2>;
>>>>> +             #size-cells = <2>;
>>>>> +             compatible = "simple-bus";
>>>>> +             ranges;
>>>>> +
>>>>> +             cache-controller@2010000 {
>>>>> +                     compatible = "sifive,fu540-c000-ccache", "cache";
>>>>> +                     cache-block-size = <64>;
>>>>> +                     cache-level = <2>;
>>>>> +                     cache-sets = <1024>;
>>>>> +                     cache-size = <2097152>;
>>>>> +                     cache-unified;
>>>>> +                     interrupt-parent = <&plic>;
>>>>> +                     interrupts = <1 2 3>;
>>>>> +                     reg = <0x0 0x2010000 0x0 0x1000>;
>>>>> +             };
>>>>> +
>>>>> +             clint@2000000 {
>>>>> +                     compatible = "riscv,clint0";
>>>>> +                     reg = <0x0 0x2000000 0x0 0xC000>;
>>>>> +                     interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
>>>>> +                                             &cpu1_intc 3 &cpu1_intc 7
>>>>> +                                             &cpu2_intc 3 &cpu2_intc 7
>>>>> +                                             &cpu3_intc 3 &cpu3_intc 7
>>>>> +                                             &cpu4_intc 3 &cpu4_intc 7>;
>>>>> +             };
>>>>> +
>>>>> +             plic: interrupt-controller@c000000 {
>>>>> +                     #interrupt-cells = <1>;
>>>>> +                     compatible = "sifive,plic-1.0.0";
>>>>> +                     reg = <0x0 0xc000000 0x0 0x4000000>;
>>>>> +                     riscv,ndev = <53>;
>>>>> +                     interrupt-controller;
>>>>> +                     interrupts-extended = <&cpu0_intc 11
>>>>> +                                     &cpu1_intc 11 &cpu1_intc 9
>>>>> +                                     &cpu2_intc 11 &cpu2_intc 9
>>>>> +                                     &cpu3_intc 11 &cpu3_intc 9
>>>>> +                                     &cpu4_intc 11 &cpu4_intc 9>;
>>>>> +             };
>>>>> +
>>>>> +             dma@3000000 {
>>>>> +                     compatible = "sifive,fu540-c000-pdma";
>>>>> +                     reg = <0x0 0x3000000 0x0 0x8000>;
>>>>> +                     interrupt-parent = <&plic>;
>>>>> +                     interrupts = <23 24 25 26 27 28 29 30>;
>>>>> +                     #dma-cells = <1>;
>>>>> +             };
>>>>> +
>>>>> +             refclk: refclk {
>>>>> +                     compatible = "fixed-clock";
>>>>> +                     #clock-cells = <0>;
>>>>> +                     clock-frequency = <600000000>;
>>>>> +                     clock-output-names = "msspllclk";
>>>>> +             };
>>>>> +
>>>>> +             clkcfg: clkcfg@20002000 {
>>>>> +                     compatible = "microchip,pfsoc-clkcfg";
>>>>> +                     reg = <0x0 0x20002000 0x0 0x1000>;
>>>>> +                     reg-names = "mss_sysreg";
>>>>> +                     clocks = <&refclk>;
>>>>> +                     #clock-cells = <1>;
>>>>> +                     clock-output-names = "cpuclk", "axiclk", "ahbclk", "ENVMclk", "MAC0clk", "MAC1clk", "MMCclk", "TIMERclk", "MMUART0clk", "MMUART1clk", "MMUART2clk", "MMUART3clk", "MMUART4clk", "SPI0clk", "SPI1clk", "I2C0clk", "I2C1clk", "CAN0clk", "CAN1clk", "USBclk", "RESERVED", "RTCclk", "QSPIclk", "GPIO0clk", "GPIO1clk", "GPIO2clk", "DDRCclk", "FIC0clk", "FIC1clk", "FIC2clk", "FIC3clk", "ATHENAclk", "CFMclk";
>>>> Any chance of making this list multi-line, it is difficult to read as-is.
>>>>
>>> Yes. We can also get rid of a few names that are not used. I will fix it in v2.
>>>
>>>>> +             };
>>>>> +
>>>>> +             serial0: serial@20000000 {
>>>>> +                     compatible = "ns16550a";
>>>>> +                     reg = <0x0 0x20000000 0x0 0x400>;
>>>>> +                     reg-io-width = <4>;
>>>>> +                     reg-shift = <2>;
>>>>> +                     interrupt-parent = <&plic>;
>>>>> +                     interrupts = <90>;
>>>>> +                     current-speed = <115200>;
>>>>> +                     clocks = <&clkcfg 8>;
>>>>> +                     status = "okay";
>>>>> +             };
>>>>> +
>>>>> +             serial1: serial@20100000 {
>>>>> +                     compatible = "ns16550a";
>>>>> +                     reg = <0x0 0x20100000 0x0 0x400>;
>>>>> +                     reg-io-width = <4>;
>>>>> +                     reg-shift = <2>;
>>>>> +                     interrupt-parent = <&plic>;
>>>>> +                     interrupts = <91>;
>>>>> +                     current-speed = <115200>;
>>>>> +                     clocks = <&clkcfg 9>;
>>>>> +                     status = "okay";
>>>>> +             };
>>>>> +
>>>>> +             serial2: serial@20102000 {
>>>>> +                     compatible = "ns16550a";
>>>>> +                     reg = <0x0 0x20102000 0x0 0x400>;
>>>>> +                     reg-io-width = <4>;
>>>>> +                     reg-shift = <2>;
>>>>> +                     interrupt-parent = <&plic>;
>>>>> +                     interrupts = <92>;
>>>>> +                     current-speed = <115200>;
>>>>> +                     clocks = <&clkcfg 10>;
>>>>> +                     status = "okay";
>>>>> +             };
>>>>> +
>>>>> +             serial3: serial@20104000 {
>>>>> +                     compatible = "ns16550a";
>>>>> +                     reg = <0x0 0x20104000 0x0 0x400>;
>>>>> +                     reg-io-width = <4>;
>>>>> +                     reg-shift = <2>;
>>>>> +                     interrupt-parent = <&plic>;
>>>>> +                     interrupts = <93>;
>>>>> +                     current-speed = <115200>;
>>>>> +                     clocks = <&clkcfg 11>;
>>>>> +                     status = "okay";
>>>>> +             };
>>>>> +
>>>>> +             sdcard: sdhc@20008000 {
>>>>> +                     compatible = "cdns,sd4hc";
>>>>> +                     reg = <0x0 0x20008000 0x0 0x1000>;
>>>>> +                     interrupt-parent = <&plic>;
>>>>> +                     interrupts = <88>;
>>>>> +                     pinctrl-names = "default";
>>>>> +                     clocks = <&clkcfg 6>;
>>>>> +                     bus-width = <4>;
>>>>> +                     disable-wp;
>>>>> +                     no-1-8-v;
>>>>> +                     cap-mmc-highspeed;
>>>>> +                     cap-sd-highspeed;
>>>>> +                     card-detect-delay = <200>;
>>>>> +                     sd-uhs-sdr12;
>>>>> +                     sd-uhs-sdr25;
>>>>> +                     sd-uhs-sdr50;
>>>>> +                     sd-uhs-sdr104;
>>>>> +                     max-frequency = <200000000>;
>>>>> +                     status = "okay";
>>>>> +             };
>>>> Given eMMC is the default device, shouldn't that be default for the
>>>> device tree too? Even if not, having the emmc node here would be a
>>>> good thing as it is different to the SD node.
>>>>
>>> I tested this device tree with sdcard. That's why, I just picked the
>>> sdcard node.
>>> I am not sure if both eMMC & sdcard node can co-exist. The polar fire
>>> soc github repo
>>> seems to point that both of them have the same address and only 1 can be enabled
>>> at that time. That may not be true now as the github repo has not been
>>> updated in
>>> couple of months.
>>>
>>> @Cyril : Can we enable both eMMC & sdcard at the same time ?
>> I would put /both/ in but only enable the one in use for the moment.
>> Our boards are booting of eMMC as supplied, so this isn't going to work
>> as well. The eMMC is 8bit wide, and thus is only delivering 11MB/sec
>> instead of 22MB/sec. This performance is still not great, but losing
>> half the data-rate is just not good.
>>
> I am not sure what should be enabled by default. Updating sdcard is much
> easier than eMMC card and we use that approach.
>
> @Cyril: Is there a way that we can enable both ?
>
Yes, we can enable both but this requires a modification to the FPGA 
design. One of the guys prototyped this while I was away. We will move 
this along. This will require reprogramming the FPGA with a new design 
and HSS version.

Regards,

Cyril.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
