Return-Path: <SRS0=kUFi=CZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3483C43461
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 11:35:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41B20221E5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 11:35:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iLTmnpHR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="GlRXrY5M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="UYmBW2XK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41B20221E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b092Cx00EhqSgrYiKHHDx+ydYZ85ayaJkyRSeD/9ws4=; b=iLTmnpHRfqEVjHqszCMTNz8aQ
	vTfozYFj3p9a35T4jDnZ6+pg5cEbO5THECWlww0lywHU+zBNIl2kYbPGyijqS/q0wwT9I1rP9qpvx
	uEa2NYdGAiLRNRZhWPRNQn/mHdCDaqyo72oscmKFox7N7v2w6RO6Chuzkwbk0D4QIkp4HdYjotmLs
	Es8TOo589lmEDD3Culy0zzjQ5yGtG999MOxjtV1CPH/AGtKfvQErLRnuV8yuXHLDG9+f/ErsK0T0h
	F7JL/NVXPnoXHfZ0HluZ89+TLplj9K6/b10bzgkOuIqajehUb36wiutirRRRDd5wR791xoOzZw/Nz
	IuDQywyTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIViA-0006cY-R7; Wed, 16 Sep 2020 11:34:54 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIVi7-0006az-Sz
 for linux-riscv@lists.infradead.org; Wed, 16 Sep 2020 11:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600256092; x=1631792092;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wf+mq9vfC31K42mZwiwrKqu+K/atF8P7PW0dYBRUrgo=;
 b=GlRXrY5MJmbLXLW1xPAf/yEa5cjJeBVIK3Jy5LZK2HG22frNSRRWjb0l
 YgLXp2j4YS+RZa0AeuoPdVdpDk7umZdMTy+x39fkAyVkngx6I92DsDI7b
 apf9vkMHuIIgfsKurARdvU6YDFLOcFbCLGDkcKWDiFYacNEJsKb3VGmW3
 TKmZY/VYN4jYjaIraovZ2zFx7EfYKeT9hyqWjAXxuW/fz5P6b3NNbcNN4
 m9dNw/utSwoPzEHPpdQIpLqPvhmWSPRMyU8sAU4cZ1PcpysX1hhhlsnoa
 +76cm0ypNPv7haK1jUt4caHGygqBhJocu0KF3nDkjwV7+rpCSfzbNKyCv w==;
IronPort-SDR: hzaqr1CD3WQaTHTEldz9PS7rrlMJOeoJO/bsmRaF+11nYYTScLwcixKD2mIGTmrNGgP5c8vvch
 NX/PnFPofnF21rdHCoD4+7896h+NvgMTAcliyC5RJ8muBDYOkTiSwcV9Mz9G1mnpbeYXnIbnPT
 ci1zvT8QDG+aQXZixpDdZsMv1aKyb5pvYvxZMo5SsBImus24/zdW4EsmjbcjZz2qGDVMYeDq18
 L4BB29u6eC27aGbtSMji1B6U2v3smrsWVSRe4UkTuwSYnbIrcBqJaFD02sNJb4QAJQu3MThBwB
 DJU=
X-IronPort-AV: E=Sophos;i="5.76,432,1592841600"; d="scan'208";a="148745707"
Received: from mail-sn1nam04lp2052.outbound.protection.outlook.com (HELO
 NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.52])
 by ob1.hgst.iphmx.com with ESMTP; 16 Sep 2020 19:34:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMDtLynRdYWylBcSVzM5L9NkTsYtTutT+YQgQT0G8OcJmyVZG1ad1QLiEdI/HB97Q1qyRhSfRpFuj32+7PGyjz4004ngth5ZmorkA1jZmaMZ6/dqS2I6YIAh8Khav5k/NZaIrRjbabg6S6SYP73jdreWDAiDiaeE2ZrNsc22gll9qzjSSSbv8DPftWHmgoRP1uzDtjS/mhmZi6UQfR0goNcLKpJ8TNJLX1LiATLEJvmwbFwvYkWBqGsZf7r0cZn80jAsWNt+L5v+vhfeIJ5tKUFwdTcSXb+mjR4Ue6puIVqluu5FG3ArzdokumpXycMslVlxyk3P5fV8puoTHJO60Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wf+mq9vfC31K42mZwiwrKqu+K/atF8P7PW0dYBRUrgo=;
 b=CQ1B9MvQjODQ0OzP0M6KUfuO2RAhrGiLuYck6BnrFPDnpHSPVei82xgIKhB3yebpdJcXhGyj6NhsZnAFsCin8x2v9pKHN59rSLKiHliiUOFJ1D++mkVdCBlqGw6Sz+q6sSQA64gG1RoUekB7Xb2EIM42lIr0TLTOAee4jNxzAb32xLHQTTVsx7/dTZqUXfuAOZIwyxHaSSeONqEmSvcv/K4ESiAKVYO1bQW23CkJsPHoV3wd00EzeMRxguimQzSdQNR7am1SYS24q6JebWYEzv+RM2YH0IQdg2XCqR/CQwJChh0Spe3cReG/KuG+k/JsN/ySTq2tSF/LTyliWOvCLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wf+mq9vfC31K42mZwiwrKqu+K/atF8P7PW0dYBRUrgo=;
 b=UYmBW2XKRag7fH9mG2HvYOqgQJ+KIng7HqUhH2l4100K/+eRC56+ZKm7wR/ZHk6zyOoFcmwxUrwcjZLmTfA/7kanrU1C9hz3Zr3A6uT93upZDBhTUeoquJd5JdPkyMZNi+YNQ4fRdjI5acG4RbqFdmNep6AO8g7mMy7kSx28vls=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR04MB3752.namprd04.prod.outlook.com (2603:10b6:903:e5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Wed, 16 Sep
 2020 11:34:43 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7%12]) with mapi id 15.20.3370.019; Wed, 16 Sep 2020
 11:34:43 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, "seanga2@gmail.com"
 <seanga2@gmail.com>
Subject: Re: [PATCH] riscv: Fix Kendryte K210 device tree
Thread-Topic: [PATCH] riscv: Fix Kendryte K210 device tree
Thread-Index: AQHWi89QsjtToLdSnE2Y2f7yWfoi0alrIeoAgAABNAA=
Date: Wed, 16 Sep 2020 11:34:43 +0000
Message-ID: <714cdc45b66b0fe89aff211f1b535c1b58bae71b.camel@wdc.com>
References: <20200915125501.110326-1-damien.lemoal@wdc.com>
 <78347150-d43e-9300-8d4c-db8cc74ec11f@gmail.com>
 <CY4PR04MB3751F5C2D0C0403596040E4FE7210@CY4PR04MB3751.namprd04.prod.outlook.com>
 <c90a5962-924e-bc7f-a164-970437098625@gmail.com>
In-Reply-To: <c90a5962-924e-bc7f-a164-970437098625@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5 (3.36.5-1.fc32) 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:62d1:16e6:ecb1:d604]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 23e380ab-7814-44e3-7533-08d85a3481c7
x-ms-traffictypediagnostic: CY4PR04MB3752:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR04MB3752436CCDF9334801D3ADEAE7210@CY4PR04MB3752.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Aq+BsE7vFQMr7Zj4mu3NNjIAp2pzybnMPXSYAnMVbgKRQTnpDTXBOcRK/WVRBN9SecWd3pJnidirfezJslBbwGWy6sq+vp8r1ooYaqn6VtP6TsABULUdKW0qAYSXnjxxBhq+yM4Sr3VNexUwFvAxoRINMJlKpCFiu81yi9wu2vWawVwIWMrkAx+JvEj0GEsm3U55PkgDvV2RUcac56+iiC7G6X6C6LpFOT0YJ0tF9BY9KfeSa230TEz8U1z8hoUQekwQrCvRb5x+wzWre6EpiBF639wu79J/3CzMgkBkKGHcxTFIK9T5rL16sd4EwKpYwco7FrVemlGgwyzh/iUEEtIgZDxJkCFFAvixwle/t3fM61TqjzoHfyJqudOAwSCbiwbR0g9Qgedt92FcV3v9Bw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(71200400001)(83380400001)(478600001)(8936002)(5660300002)(6512007)(8676002)(66446008)(66476007)(110136005)(36756003)(4326008)(2906002)(6506007)(64756008)(966005)(66946007)(66556008)(91956017)(76116006)(186003)(2616005)(53546011)(86362001)(6486002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: +EKcP8G3/kHD0/ho+2RIZfHCkNO3lv3e8bc/fFqVC2MHVEU0EK32GgHpvetVc79qiFrs0oSirrwJI5GQEUZtxN+rcmJ/zRCz8Tm7TIoI5jmCYcoWFE5LuKkEB/Ckchbs2t8yNWhS5A/qTBeJYwelwyuPuInE1QKUGRvMzR0jSK57H16WsoKD6N8L1u/wovwLtUgq2GB+QHpLK7qkYYvYFoYBoQGKUnz2VPNG8n6uoJ90ToW1K69H7DDCTgJ7WFArF3V1WDiMiU7tzJadsSfzjo/E4u0fmFEuPwwQiMo11TQi0JnPjuOKYl7Gr2z9jI2oUz+jEDJGyaGk5SNJeDYKURfNDuX0ycZ48NZ4bSjERVvj81a/4Vy0Kg+5P9K8TTDQ7cjydRizn8LAVIRk1g3RtcVHtRMwvd08bvOwVo5p0ntzvfodyHiXN6YLP1+nWd4eL6xD6jDaCRx9tT+ncfSBimuIF6xx1/XsqHdumTSKdOZq4mJ2QlmEzhBIC2hKuLkczo9CH7OaUchEH+bh05BRj9apXm4Jl4nVkfvsJvukW8n9QmonCumKzNGX0k4YFW6OijN5A83yp59yNcy9ew57RQJMNaVXpV6FEqAewg1sQ8vdw8DFH7K5Dyye8JwyHzWFC45bcEwVbXR4gwDVLcnO9WW41N4eIA5P4QuuGwUbG7audh8uh375JR53XGYq/aSiOJKo3vbUAJgpic6oemfOyA==
Content-ID: <0BA5172CC872734B87362FFD4B441DF7@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e380ab-7814-44e3-7533-08d85a3481c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2020 11:34:43.3417 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MlFgWqMysUUL9M+fZxO17rbYZjDu7UzCfHPLA/oH2r9P1QMga5fL+ZFTkTf0xiSuMr4OnDnT5FkP3jzBHBmdJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB3752
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_073452_210161_183A3283 
X-CRM114-Status: GOOD (  35.58  )
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
Cc: Anup Patel <Anup.Patel@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 2020-09-16 at 07:30 -0400, Sean Anderson wrote:
> On 9/15/20 11:08 PM, Damien Le Moal wrote:
> > On 2020/09/16 11:15, Sean Anderson wrote:
> > > On 9/15/20 8:55 AM, Damien Le Moal wrote:
> > > > The Kendryte K210 SoC CLINT is compatible with Sifive clint v0
> > > > (sifive,clint0). Fix the Kendryte K210 device tree clint entry to be
> > > > inline with the sifive timer definition documented in
> > > > Documentation/devicetree/bindings/timer/sifive,clint.yaml. Rename the
> > > > clint0 entry to "timer", fix the register mapping and fix the interrupt
> > > > extended entry.
> > > > 
> > > > This fixes boot failures with Kendryte K210 SoC boards.
> > > > 
> > > > Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> > > > ---
> > > >  arch/riscv/boot/dts/kendryte/k210.dtsi | 7 ++++---
> > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/arch/riscv/boot/dts/kendryte/k210.dtsi b/arch/riscv/boot/dts/kendryte/k210.dtsi
> > > > index c1df56ccb8d5..48d65fea45e9 100644
> > > > --- a/arch/riscv/boot/dts/kendryte/k210.dtsi
> > > > +++ b/arch/riscv/boot/dts/kendryte/k210.dtsi
> > > > @@ -95,10 +95,11 @@ sysctl: sysctl@50440000 {
> > > >  			#clock-cells = <1>;
> > > >  		};
> > > >  
> > > > -		clint0: interrupt-controller@2000000 {
> > > > +		timer@2000000 {
> > > >  			compatible = "riscv,clint0";
> > > > -			reg = <0x2000000 0xC000>;
> > > > -			interrupts-extended = <&cpu0_intc 3>,  <&cpu1_intc 3>;
> > > > +			reg = <0x2000000 0x10000>;
> > > 
> > > Why the change in size? The docs from the SDK [1] (which I think were copied
> > > from SiFive documentation around the time of their release) state that
> > > the CLINT is 0xC000 bytes. In addition, accessing memory past 0x0200C000
> > > yields a repeating memory pattern:
> > 
> > Oops. Copy-paste error. I will change that back to 0x0000C000.
> > > 
> > > 0200c000: 69823183 02020120 6083c006 00008002    .1.i ......`....
> > > 0200c010: 69823183 02020120 6083c006 00008002    .1.i ......`....
> > > 0200c020: 69823183 02020120 6083c006 00008002    .1.i ......`....
> > > 0200c030: 69823183 02020120 6083c006 00008002    .1.i ......`....
> > > (continues until 0x02010000)
> > > 
> > > To me, it is clear that the CLINT is not 0x10000 in size, even though
> > > the legal address space extends to that size.
> > > 
> > > I am more curious how this fixes booting. What was the issue before?
> > 
> > There were 2 problems:
> > 1) The old declaration of the entry as clint0: interrupt-controller@2000000 led
> > to a failure to find the driver.
> > 2) The interrupt extended entry was wrong
> > 
> > > > +			interrupts-extended =  <&cpu0_intc 3 &cpu0_intc 7
> > > > +						&cpu1_intc 3 &cpu1_intc 7>;
> > > >  			clocks = <&sysctl K210_CLK_ACLK>;
> > > 
> > > This clock is 50 times too fast(!) See [2] and [3] for a fix. I don't
> > > know if adding a "virtual" clock is the best solution for Linux. I would
> > > like to keep the device trees relatively in-sync, so please let me know
> > > if you think there is a better solution.
> > 
> > Huu... Let me check that. Once booted, using commands such as date or time does
> > not give me weird results, well at least, before this patch and clint changes. I
> > forgot to check yesterday when I tested (I only boot tested). Will check.
> > 
> > And yes, I will make effort to keep the DT in sync. Is the Kendryte support
> > upstream in U-Boot now ? I have not checked recently.
> 
> Yes, it was included with release v2020.07.

Looking at it right now. Trying to fix the clock mess.
I think major surgery of the sysctl code is needed so it will take some
time. The device tree fix v2 I sent still point to the "fake" ACLK
clock for clint MTIME, all wrong. But at run-time, time seems to be OK,
so leaving it as is for now.

Will send a series fixing the clocks & PLL setup, which will allow
enabling more peripherals too :)

Thanks !

> 
> --Sean
> 
> > > >  		};
> > > >  
> > > > 
> > > 
> > > [1] https://github.com/kendryte/kendryte-standalone-sdk/blob/develop/lib/drivers/include/clint.h
> > > [2] https://patchwork.ozlabs.org/project/uboot/patch/20200915141724.503929-8-seanga2@gmail.com/
> > > [3] https://patchwork.ozlabs.org/project/uboot/patch/20200915141724.503929-9-seanga2@gmail.com/
> > > 

-- 
Damien Le Moal
Western Digital Research
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
