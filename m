Return-Path: <SRS0=kUFi=CZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9DCBC43461
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 03:16:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67CB921D1B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 03:16:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CGKQ8L1P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="UPCnwG50";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="zF5hmsFH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67CB921D1B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0LKXVF2HaRmAobG8TsPDvI2QwADBMbUh6XxxnSCWjc=; b=CGKQ8L1PyZS0NPvguMTg2jM9Ng
	xqyIp3HJn12AMM34HVFK830OTZpTcq4V30qmYct0OOzBN7dH0KbF5WrvZCeR3f33CBGUvYjr2ZokS
	GayBWGkIFGU9lRooKpte9Ikj7ORvqydxFT5aCIRhykkAhdhOyjy5Vwkuv0djiJNXXI7aboPOyIunm
	7/1AXHp1CndMpOMlHTJTQVoZ14a62ZY77n7LxpwVKf1sokPTVDQqvf2aMfq2Rnal/pptSoTRDOcoI
	qZhlcIRYyXnV0fhW/RTxxK9UYPH7ukfFMu43TBNamAQZdaoOz1HfEqeDqbenAEL2lj3shyt4VGr3E
	5xJ9OQEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kINvz-00071G-9j; Wed, 16 Sep 2020 03:16:39 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kINvx-00070e-1V
 for linux-riscv@lists.infradead.org; Wed, 16 Sep 2020 03:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600226197; x=1631762197;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=yOa+up9PZa++dOQ3stsEQwjmFnliC+kEW+SQWMIFroo=;
 b=UPCnwG50NbI+ZoS+GpOGWxq0gOsMv91fauRt3YjtoHInOOUAzJ2HRUUw
 KWc1DxXNTN3gAct3xV6M/eQVubmGzwHlgnynXoN8T8rUFaTw16ykj0Mif
 B99JQA9bVoLGX77tmcI5Md+RzaGmebrFHrpjzoO9XFvm2tIwdLrOwrrDw
 UFTbhPBGZmsrEWtyTL2YPzXjv6qPHLx5D6q6IV7ZeZlmmpA+5PqTUZJbX
 f+vGzrLtGQv9CjMbXjfGdEmi/pMCYYlfVoNqkLQ8t/VbDfwJU80Lzr4Qn
 WOxVTbYtRzsvavYdbaWmp7soXZAT3oFvybUr5IlHGLP0rCkVKqHZNHNS/ w==;
IronPort-SDR: 3qJnYD+87qvdQRghVjh33olgzWwUsKdZVSa4ftKQ1LZt8BfS+KzBnEMBAGwBd+Qn2nUjPuFXK3
 wWREhhNmSULtnq+3ZTOA5qX7avKBLhYkvcNk8hxKa4pXPnL7wd8eZo56tEESSzlzP5bVZ2nhvI
 Y8gjo4CmSPHux6dW1flji9+MKK3napL5+AgQ5xUjmArB6YgLGD2BaubEo7vuGrzE9I5KsodiIP
 eZuayaxTAQKvI7uohPjGzNkd6H6bgD+E4QnlnN+vQIy2Ai9x4w+MRbKLWimFJgmt44/bdhCbue
 tik=
X-IronPort-AV: E=Sophos;i="5.76,431,1592841600"; d="scan'208";a="151849990"
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hgst.iphmx.com with ESMTP; 16 Sep 2020 11:16:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ze3Yl8FsY3FIU5qEwk3eUCqIL2OabuiA7rPe2Vvzwb4NmAq88+AonXWMGk5Kk0l91L3oMLWgprdCzy15gbLzIonwofStc4zbhBcEJGdlYPVbMYiOyBQtmFwVEHRtRzt0gb1UlJ960DZv3Ny8HSKPQLJpeD7Y9rKYRVvJzXy0qYYH/nLWLlYV/GSRKTC0nwdhmvUG3cSXpK3hcramkc2I3hKengAoIs8y0QBN0QoSmqKTs4v5vxNW6a8sawqNJ3BDUivvIo5BAAZ8KgoZ//UXnQT3x8/mdBmKkkrP2Zdu1gJ9yQmdZQJZ3a/JnaKlZUb5frUzzH46UAZdR2oU7vB8Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOa+up9PZa++dOQ3stsEQwjmFnliC+kEW+SQWMIFroo=;
 b=WL7gq3U1fUS6xaCM+xaHCYfosvKx4o4jLQnTpgVNs6cwXD7wsnUShsQ+//O/qaPNQbJuql4fHYFkqNzswuJVLNc20GNH3qG6e07G/IMc0MXbpMGTJsXnIAMu8OKAgbEJiDZSwdctZmNQU+aAJJWcLlwjSbv+/mIu3ev4i+yR+5Dl+cjWLkrGldHCqYUnfSKQpOc0yKX/mSN7tYeBUjY4oxWImzHkxMBir0X3cVpSoZdNR3LmHUrVZpxLccVZvo9/MujUMrywBSP0BVeJJFQQkzep3eVQe846JH0/lrOT90HxmrzWnxHw0fE0jqujX5D4uemlx1cdKZ6KkuyHGLRZ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOa+up9PZa++dOQ3stsEQwjmFnliC+kEW+SQWMIFroo=;
 b=zF5hmsFHg2TiKJWpWwT8igznUfQuwm+NSIfV4CyyhL6B4PGXjKmF0jzvrm3wHcuB29zCAmc1Q2s9tvSGzLfT8vINjP9KeJn7mPMkKFKXK1pT9DEhvNLjfMbBrXmYkOT8zkVRBG4FYMyHWXlHQz0FSDdN3krUQPLUhUrEvxuQiRA=
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM5PR04MB1147.namprd04.prod.outlook.com (2603:10b6:3:a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 03:16:33 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::607a:44ed:1477:83e]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::607a:44ed:1477:83e%7]) with mapi id 15.20.3370.019; Wed, 16 Sep 2020
 03:16:33 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Sean Anderson <seanga2@gmail.com>, Damien Le Moal <Damien.LeMoal@wdc.com>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Palmer
 Dabbelt <palmer@dabbelt.com>
Subject: RE: [PATCH] riscv: Fix Kendryte K210 device tree
Thread-Topic: [PATCH] riscv: Fix Kendryte K210 device tree
Thread-Index: AQHWi191IhvCqRmjmkG24UrSCc7dAalqh9mAgAAQmJA=
Date: Wed, 16 Sep 2020 03:16:33 +0000
Message-ID: <DM6PR04MB6201342259AA195D16D20D238D210@DM6PR04MB6201.namprd04.prod.outlook.com>
References: <20200915125501.110326-1-damien.lemoal@wdc.com>
 <78347150-d43e-9300-8d4c-db8cc74ec11f@gmail.com>
In-Reply-To: <78347150-d43e-9300-8d4c-db8cc74ec11f@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [136.185.109.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e08e8651-7226-4881-70f9-08d859eee9f1
x-ms-traffictypediagnostic: DM5PR04MB1147:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR04MB1147F4C9C64F8B8B6A7B9E738D210@DM5PR04MB1147.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P+KimU0Fru0899Iz5xWo9pbA6hXSr41z/mXNk5QotYG4Csmc1M6TNz0ClCLOKxtmfXzw0OhzhG/M3R3NyML8WNJ77iEgt6zLo9rzpfxcLRFklv5G+PtMmP4GJjKUwCsMCqhBqU9249C7BMnA+Ms9j4WsNBFLHPaWb8hYts5pVaQqzxhCsAX+Aqemjdz2FtTsATTsJ3TwNA303Z8dJ9PABlsHq2L28utX2sPxlJS0aUFVUEM6vs6/QgJP85Jcfa0f0TNV8qbteUkY5zRcJHsUfQPm79x46Na039n40qBBBn12B5GeEaXmy3NTYt7JLgc7yMcDb1Ordl5ErhvFMKDZ/lspceRwPkb3VKtIAhAyWCR3WS2gH1r6RCc01qZowp+ZDiR5Y+TSUGfwHP5yLV7v0A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(66476007)(2906002)(66946007)(6506007)(966005)(5660300002)(53546011)(52536014)(26005)(71200400001)(186003)(110136005)(7696005)(33656002)(76116006)(55016002)(86362001)(478600001)(66556008)(66446008)(64756008)(9686003)(8676002)(8936002)(316002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: mpWZRbbLzOAmQvGWWBpIxBxnPdlGlhRbJc0Bs4ibX9Il99le4wmNPG4alfzwvz0QgxytYGomz6g9FZRPVxY7CvJXmzRi7AUxXYPnPGYauOcEffBIcZMeBarKD5xTqqzhOLYX6FWGBpTU38/MbJwkWYceVJMf9+Aksi3bqJcQtj8OrvY0jgXqalMukBYGrSuZDTq9fDhqdNtmDoO7eFHPveHt2nlEop+1FS4OSxI3WQje3W3rPTWf7E43XPnVmrq3Vc8FORxvyjDFqzg+X1jquqwwcD8rEcJ+fRE5K5RNwo+HH2SvhzxLGjRlPJUNAV+aRZfMKj4JH/uoLXMx2ohzhsZxvqHXxhbYBX5Qs78CYgVLZluFi5OUrVSyJqpCrVwaMXkuhwRKyeKijRXavLf9AO6ktxRFWvK1ch8UrI8d0rFgYsUeTi/qnk7juLFi+NFyXaZENnEfST6LUFxLaTKl0+Ep4ux+cxDHfXIRDGNh+vgQUi5QFiNqlJZRfyacXe0rGb3liI+2GFi9ylv69QC7dIkfQqHYt4Bur55+bcsAAEy1LeO4nH7yh269pq70V8ZyUSA2YWw9AdyimpX2VLU99iBSbz1jL+E36c/8j73EnhkIa5lk8sWnUvGxHHoqOKUUtoz2brx1TwzQkh9TY+H5lQ==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e08e8651-7226-4881-70f9-08d859eee9f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2020 03:16:33.3369 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6sDPO3TPEIGriwUjRcn0M+McA6EHtRsVb8m+M6OE/k+nrJ5uIi/Pw965mRI4eQpg9QWbzRE0TTqxYqle7hRs3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB1147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_231637_228957_675606F5 
X-CRM114-Status: GOOD (  27.20  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Sean Anderson <seanga2@gmail.com>
> Sent: 16 September 2020 07:46
> To: Damien Le Moal <Damien.LeMoal@wdc.com>; linux-
> riscv@lists.infradead.org; Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Anup Patel <Anup.Patel@wdc.com>
> Subject: Re: [PATCH] riscv: Fix Kendryte K210 device tree
> 
> On 9/15/20 8:55 AM, Damien Le Moal wrote:
> > The Kendryte K210 SoC CLINT is compatible with Sifive clint v0
> > (sifive,clint0). Fix the Kendryte K210 device tree clint entry to be
> > inline with the sifive timer definition documented in
> > Documentation/devicetree/bindings/timer/sifive,clint.yaml. Rename the
> > clint0 entry to "timer", fix the register mapping and fix the
> > interrupt extended entry.
> >
> > This fixes boot failures with Kendryte K210 SoC boards.
> >
> > Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> > ---
> >  arch/riscv/boot/dts/kendryte/k210.dtsi | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/riscv/boot/dts/kendryte/k210.dtsi
> > b/arch/riscv/boot/dts/kendryte/k210.dtsi
> > index c1df56ccb8d5..48d65fea45e9 100644
> > --- a/arch/riscv/boot/dts/kendryte/k210.dtsi
> > +++ b/arch/riscv/boot/dts/kendryte/k210.dtsi
> > @@ -95,10 +95,11 @@ sysctl: sysctl@50440000 {
> >  			#clock-cells = <1>;
> >  		};
> >
> > -		clint0: interrupt-controller@2000000 {
> > +		timer@2000000 {
> >  			compatible = "riscv,clint0";
> > -			reg = <0x2000000 0xC000>;
> > -			interrupts-extended = <&cpu0_intc 3>,  <&cpu1_intc
> 3>;
> > +			reg = <0x2000000 0x10000>;
> 
> Why the change in size? The docs from the SDK [1] (which I think were
> copied from SiFive documentation around the time of their release) state
> that the CLINT is 0xC000 bytes. In addition, accessing memory past
> 0x0200C000 yields a repeating memory pattern:
> 
> 
> 0200c000: 69823183 02020120 6083c006 00008002    .1.i ......`....
> 0200c010: 69823183 02020120 6083c006 00008002    .1.i ......`....
> 0200c020: 69823183 02020120 6083c006 00008002    .1.i ......`....
> 0200c030: 69823183 02020120 6083c006 00008002    .1.i ......`....
> (continues until 0x02010000)
> 
> To me, it is clear that the CLINT is not 0x10000 in size, even though the legal
> address space extends to that size.
> 
> I am more curious how this fixes booting. What was the issue before?

I agree. Only change in interrupts-extended is required and change in reg
property can be dropped.

Regards,
Anup

> 
> > +			interrupts-extended =  <&cpu0_intc 3 &cpu0_intc 7
> > +						&cpu1_intc 3 &cpu1_intc 7>;
> >  			clocks = <&sysctl K210_CLK_ACLK>;
> 
> This clock is 50 times too fast(!) See [2] and [3] for a fix. I don't know if adding
> a "virtual" clock is the best solution for Linux. I would like to keep the device
> trees relatively in-sync, so please let me know if you think there is a better
> solution.
> 
> >  		};
> >
> >
> 
> [1] https://github.com/kendryte/kendryte-standalone-
> sdk/blob/develop/lib/drivers/include/clint.h
> [2]
> https://patchwork.ozlabs.org/project/uboot/patch/20200915141724.503929-
> 8-seanga2@gmail.com/
> [3]
> https://patchwork.ozlabs.org/project/uboot/patch/20200915141724.503929-
> 9-seanga2@gmail.com/
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
