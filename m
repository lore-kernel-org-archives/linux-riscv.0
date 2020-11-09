Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C74C2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 12:55:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D17820789
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 12:55:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HeL2ATAR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="bFtfJvNu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="v3v9oX/V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D17820789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=TyAyxHog4OsdNZLIm0uL8oX49EU+BGoB0mShFXPEw8g=; b=HeL2ATARteXNzT3a/y5olWioU
	pz6ecOMNaUPcx2usRTW8EGx15x87WRzF7gatOA5kd2j8ZEbXKTUpfQv+oBkIflDMo2WGQOEyM+EZ9
	JtFqEqv63TFyF4Gfbna3R6qOORroaf2PLWgiytubckwgmR6U/5Qq8nTtbOqrUpEPjER2SbdPGWo2B
	f0dAP+ePscz3QSDdvzR105ptYJOQFv9SGhdyvIST2HdkAsQYRVuYUNW1WIGjOg96T5fM+ilfEESdg
	w8iCjYCMNVcAMVFdzm620m0dkuBb51nvcXapOYXgpePE792cDa6HJM3hLL6HhoXXZXXUfjg+BkPdi
	gVKONUFqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc6hz-0006Jy-L5; Mon, 09 Nov 2020 12:55:43 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc6hw-0006J4-Jt
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 12:55:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604926540; x=1636462540;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=fqbg9ZUr31H0wRIG7wXyPOJFH7mFPuHyPSYhEU0qZ1A=;
 b=bFtfJvNuyKDzcOtkQ+vcSmLhrujHraSwe/1GB84dt9Nj5JJigym/uotF
 exwLnrFdRbHc/2+vY58oF0YsCuhGPkFyPO5yEtgHO7CFoeJM79pQJUprH
 bjxOMbpHw3YvXt2x/3NxS/dnh7dlrpsgjO1wZoWstadJfe115tlidt2Bj
 FGMNilPXSNStlz6ZJNHj6KBrIRxA59T3LYo4fm0cEqtOC2UDExpAakwBD
 WyWsyGIEl26OQUaWph59SIRjnmYwJJv4DNj2G9MeqFzxj2KVCVD+7kOM2
 Vpx6ouqvo9YC8yY//Njq87eWhLn1dCTEh/kgfRXg+ywY47z3j+FwykNJY Q==;
IronPort-SDR: Fxptj7hVh/g1YsBL63WgMjaGaga9MnDecsa6w48dg19c77fj6YqnzorhQnnQ7V7RN6AE8fm73M
 Fv9HrsYZBUKl9Djb2K3/26g5Ki5PUPP+jdnl1+625aLdCiS/MuQaXHNfKM8cDX5vGgpJbt7TYr
 gBAiZeI4Eq3bmR+DAVkQAoULTPhsZKHgRsxQpFbjX7sZ9YTrigvwov3BunCP7YPZJDxMdSX9rB
 2k1GA+P+94ObSReGOC2A6AYneSFPmi5tlslqJnWG4gjfAHGYxMZ95DEq+sUdEdhH3ha0lZPMBw
 oOY=
X-IronPort-AV: E=Sophos;i="5.77,463,1596470400"; d="scan'208";a="156668566"
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hgst.iphmx.com with ESMTP; 09 Nov 2020 20:55:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GXDAdwxbwXU/S4FoK638BvFXu9GnREPUx8xvYLZxstJh4xVJSKT69x0g/VPUCcFfSEGaymqaFzuvx2uYgicTUWEGQKcVJjCnHsQR5ts59VIQjfSYbOsinW8qo/dk5G1I8ETADzs0k7d20+BdVSXE1aJ+jWLEq0Rw8Su/60FJRuPjhHd1QdGCM/BPmF8Prn3Fji1BqDKb5a5mBgT6m7lDjmLI+taJ/4DGXUWjLOXkYGn/Nh/XqhVZUzqT+2ScGdpqcomNygrmSNjmhUyQjWupqIEewShmOP680oGUnAYbpnTsyk+yYwXJaJ6LvB4NNSTt+5V631I81+qYsFD7s2mlMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xr0S5PNmBmgFLIpn++a5eTL0tlM4SkCto4YvnMkbEWk=;
 b=KTPGkHtLngYVwty3/R/PW8EBgWVNzUSu6hrBNxUQ5pU8SZicUY0k/cwrnCh619vmvv4ZoJK54tn34Jd6keXt8QgJyl4xXqEmEXqBTlwo+SdN1EI1yqLgVyypRrwOim2FvXPgOKNborBxQSUQAFG5RlEp/BzXq1bXyvi3HFId17p23iLJDTJkAuLbeBdtCtLqmK24OnyHZ6KgBLrQCLHPPIWQH57KM5L7SZql1Rg7swVQdD1m7f2U0RmqTl0vTGsZET9CGQ8kSIxr6L1EDPkjv3yGSxfzvrsgfDzw+n14sY41s6HWCgCqgA2/kRk6M6x7GNeZOfgh5EFwylde0mntLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xr0S5PNmBmgFLIpn++a5eTL0tlM4SkCto4YvnMkbEWk=;
 b=v3v9oX/VkwvoPmo1fCOLwf6JwpUr5o9h8P3euNjzHs7SbSeUD33odkV/CyXDKckK8T1Vhl4r9Ag0Zm4t0Ob8WeBvGGNrivAK1xUQMGoszp2+4oFYPcjc3++Z50q+2L8qNxdDOpYuU4Or5ynUZB2UsWRyy2X4VXmWiHtjHqsc9Cs=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6927.namprd04.prod.outlook.com (2603:10b6:208:1e0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Mon, 9 Nov
 2020 12:55:33 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.032; Mon, 9 Nov 2020
 12:55:33 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 00/32] RISC-V Kendryte K210 support improvments
Thread-Topic: [PATCH 00/32] RISC-V Kendryte K210 support improvments
Thread-Index: AQHWtN4FNXR+gWbiK06uOGycOksW5g==
Date: Mon, 9 Nov 2020 12:55:33 +0000
Message-ID: <BL0PR04MB65144FB8F110B67669CBDB63E7EA0@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201109125111.GA6380@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:89bb:1cde:d92a:2dcb]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bf23a7ac-bc53-4c03-5558-08d884aebecc
x-ms-traffictypediagnostic: MN2PR04MB6927:
x-microsoft-antispam-prvs: <MN2PR04MB6927A5A8A791FC7EB8800C38E7EA0@MN2PR04MB6927.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TPSFBnORckUKlHap8ve94IWLFZzlV7ce19i7zQzf5opzK8qQ423dd5Rrne+EuNBlePoLHvqzxGtnqZLHjHUW9Ie+a5v9wZBS4sLv1T7b4Z48N+F7KViPk14X2cY+pfm+bp3aEulN6WcaUpWReg5T2WMfALWQtjX91bsA2jIsFF8xKpCEWLPIhZ197g9oXXEtn0pv2Dyz+h/aFeFsBIQdqYQM+PvM2/1Y2d0Rf1fOn9KIN8EVeev12lg4nach+2z0DOIHIsOAEAloYf4MgYq3c/kncQ3ah6Ncj01IHps/jcJJe3vIrvqpn/SklzLQYR1J
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(8676002)(91956017)(6506007)(8936002)(6916009)(76116006)(33656002)(2906002)(7416002)(66946007)(53546011)(478600001)(52536014)(66556008)(66446008)(66476007)(7696005)(64756008)(186003)(86362001)(71200400001)(4326008)(55016002)(9686003)(83380400001)(54906003)(5660300002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: P4k8MyvHf2La8H2UyXo2Ucwra5/8yePEWXe931IKAl97MuBR7Ui7UE8fd01BIEL4jCElkrH5MvGQjd696+e8Upe+wr5jCN/sM3lhGH2AnyQ2IlKmJcXviiTEIA6H8jnybR0yCquby75t3tsf9ZeWoIYuCDHKFWnAl4NLzpN7HC47pN9HNeG7Wfh2ee+rByc6E9csi2b4aZrEDWq5HT4muXez4pX/mLesB57Q10kvNJ0zgKX/WmcQqVH7SihcflQBLJJaNgx1TvM2nt8svEcAHNUeIKfaPBf+mt2vh7aGkcWTT3dD8Me9cKpp3H67fpy0iMtc99DWeZ5a+esfAaXTUk97XmoEMmBx+ZSF4ohkf9QzLe7gUaVeJxBNLoF8NGPg7X2zkEuAG3iY6GoT7R20jLDBdvuC4GHCN0XhmevJTABQ6etzZ1AMcQtBHjMxgBe0kCAV3G5nRICeFsw08ShAWQ5/GYOg3JtNNvYW/gJ0/hr45qNJyoW2DtYHBHm4GJ9H91zOtIhM1rjMrJ8dsphj6EUhdHtTw1Fu3miM5XznviZBpbr6XpsvVdRkgqONLQqM55XR3u08S1/lroYGjiAAcJSFOwxSaEhYOp9knTSeKN01pyjciJicGIzmsuqIvWc8KJgxW8KPgLzjw92YKJRME1rB9lLu+muS9kXhooMj7T1ZJxeVulJazVsT3TUxYSHNKRXY5EH9Xuc3HSsawq8SNw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf23a7ac-bc53-4c03-5558-08d884aebecc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2020 12:55:33.2237 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4qTdFo5OVqbOfDH1rZSZ26Uky1kG66dufmfB3zew68SJQGbSyKkwnqEaVX55WNipXxjzL3lPoIeDkt9Ud8Pv5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6927
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_075540_918575_7C3828AE 
X-CRM114-Status: GOOD (  20.02  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Sean Anderson <seanga2@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/11/09 21:51, Mark Brown wrote:
> On Sat, Nov 07, 2020 at 05:13:48PM +0900, Damien Le Moal wrote:
> 
>> The first patch of this series is a fix of the device tree parsing code.
>> Without this fix, a warning is generated when parsing Designware gpio
>> controller nodes.
> 
>> The following 6 patches are fixes and improvements to the Designware SPI
>> driver to enable support for the MMC-spi slot found on all K210 boards.
> 
>> Pathes 8 to 13 are various fixes for riscv arch code and riscv
>> dependent devices. Of not here is patch 11 which fix system call
>> execution in the no MMU case, and patch 13 which simplifies DTB builtin
>> handling.
> 
>> The following patches 14 to 25 implement and document idevice tree
>> mapping of several drivers for the K210 SoC: clock driver, reset
>> controller and pin function management (pinctrl).
> 
>> Patches 26 to 31 update the existing K210 device tree and device new
>> device tree files for several K210 based boards: the MAIX Bit,
>> MAIXSUINO, MAIX Dock and MAIX Go boards from SiPeed and the KD233
>> development board from Kendryte.
> 
> Please don't mix unrelated changes into a single series like this -
> patch serieses this big are generally something to be avoided at the
> best of times since they're a bit overwhelming in people's inboxes and
> when unrelated changes are put in a single series it makes dependencies
> between patches unclear which can hold things up.  It is better to send
> the changes for each subsystem separately, it makes life easier all
> round.

I wondered about it and in retrospect, it was a bad idea indeed to send
everything to everyone. My apologies about that.
I need to send a V2 but this time I will split it up by subsystem. Some patches
are related however (e.g. DT changes and documentation), so I will keep these
together.

Thanks !

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
