Return-Path: <SRS0=V/Dh=EX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 020CEC2D0E4
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 14:44:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52B4F2222E
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 14:44:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zgTWJ94u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="dtaIObG3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="XgOg8Ape"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52B4F2222E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=19M8An2k8QwOUFIHgWjeT/xnbTh5hjhZPD5xcMuNNhs=; b=zgTWJ94uFo2gagvrVhn5D53lb
	UTf/isF9GngAkpjGMMXDoOLb+oBG734OUOSeBU+ym+2IVg8VkcEHR8Mm2SByJL4YtjcyYbfG18z0h
	w08Es4PBmVQfxaBJp1VOWZki6sB6S00sd3RYeIo/hj3o/AV/ZWZOV0of5q71K31ZpbDXCwN9xu5wW
	NQzfYJ0AeP/uSarnZrHxXA2zewHnPfaPrtM+LNEx7YuQEPG+TwlTW30GvUzvQho3BL/6GZ1/rq9gv
	kWiLPcuomnQRjLj4RMsHuY+kxS0e9WAW5nunNQuwzgDBrCbrMGTeVcZ/FE/toItyCNvECqXH49Dg2
	oX1a0YgHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf2Da-0006hl-04; Tue, 17 Nov 2020 14:44:26 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf2DV-0006h0-4G
 for linux-riscv@lists.infradead.org; Tue, 17 Nov 2020 14:44:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605624261; x=1637160261;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ZRefrFq7+GgF0WB7oOPzeRB+7peIVR3wiXCTMj4q9Xc=;
 b=dtaIObG359+gxFJXOHiHj+2FUk0YV7A+q7l6m9op5NiqZCSuaxC/r5QO
 2p76FsgSE0cjWSGVZ2oAErakxIZ27PZFt+MzgFAcUTs4uXCKtRuAHNm5H
 6SehSzeaDG9osaqOkdra27v27hW58wtxAjPivYwfaf2RsmwZyrhvojg7a
 3EhPV6Uh7bPIJcCFI5sSAOaWbDe7kyYSr/RGM0CSg/lcLheg8oESF9K54
 VipsRkrYfsvg231ngt664dtED0FWl3S5IYhpJvHWoWcW9ckQemaqn708I
 DV36pP/OpE0Ag0sh4zz4vjQOJyvu/Px24k4iDlDhKKv+WJ1by6bwdsgL+ w==;
IronPort-SDR: OrWn7TV8fkQ8XnAjJ44mWHYgQLdOcY3VUuVZ6hRydyWeVnBMX6tX67AapJvrUQrYLj3yWxQ/jb
 0ml5kMf29iv137glhPKPBVccs4AGCet/yAhh9sVsYZqT31Agk3Rhi8AzKQgR7UINCzPhUit+Hm
 3as1uP+F44S7TmFzEuwMMPL/vY4ZfhZeCBbi2Tp5KKq38odDwvCndhHJmv/snp6j7n7rJ7/9R2
 5gIELc65VOUzV2aesAUoBy26gOoQ59fw4D7/c8v53eo8jjIfYt1W8QXTB/EUtL4cskGRhfSIy0
 0QU=
X-IronPort-AV: E=Sophos;i="5.77,485,1596470400"; d="scan'208";a="152704578"
Received: from mail-dm6nam08lp2044.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.44])
 by ob1.hgst.iphmx.com with ESMTP; 17 Nov 2020 22:44:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNS8F4r2EK7h4eXXAJP8q0qUYRIb68/z4kIVogG2D8PwnXKdi1NEGZcmckQWEDVHWu0hoBLuohsk/ajs+7BL7xtNDeA+rkyUg0TDUVOiRMqLJZ3uozUVFtGVMM5eXrFrBaCF4TIowAShKg1n8tu65jZI+++KEp9yib1/otOAbuhHIBa9g8MIfo/tzMl2XuxqHxjgSAhfP3g8Oxal2h7X5367BueThBAiX/gGP3EnnFRMfD8G5joFcWqQoOVFStMESUfoeY0US2pnNphUwe/1/UCfN3JlmQbWWpFFI+CSL6sLKciVZur0vPX5UpLL1aiD/lAy6OgSNar2Iavw6sLR/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRefrFq7+GgF0WB7oOPzeRB+7peIVR3wiXCTMj4q9Xc=;
 b=VEuwgOY4/S0uiFUA806ntjhXVcdIidNeOoXgK16HzN8qQ7DS/4uNCr/wLgyoXIHFltFRivoXWDu2f5ASqigf857WgPHzc2WmyhE6/Ivu/uhTlp6O4cGbK5wf07/WJVu44LN/u5MYbN4Iopiy0ZJpu0qjCRzeKcp+xpO8ii8fQdHlz47Omol1eIuDEZtXaCdjfUxCKEJQ7GTpARHicHFe0OWLjG5MObb2bX7d4msbOFJJLkAlZ47uaWYNXWoNICUTnfclGWTRRuMn9YrbBt9XAlsBq5nEA0urFNEcAnZmtdMR+cCZzYgKCPqBOMGTYL/VVc94jeWv16rWzfzAj2IOlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRefrFq7+GgF0WB7oOPzeRB+7peIVR3wiXCTMj4q9Xc=;
 b=XgOg8Ape1Vr7xdOIeK9Q3w+kAkiNrvLX3LkOwxW9RRcNedyFBFRTvhgCt5f8I8JxHj68Mc/O3lWEexjjuE6uqOVPh3zlUvMY3joLQXWg4+yyRkO9VGD07iswYSKToBubnHldhNMEcRppkulLMlHgWXKZQ+kp/lLs8a42ZEP1/eg=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6477.namprd04.prod.outlook.com (2603:10b6:208:1aa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 17 Nov
 2020 14:44:14 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.034; Tue, 17 Nov 2020
 14:44:13 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "fancer.lancer@gmail.com" <fancer.lancer@gmail.com>
Subject: Re: [PATCH 04/32] spi: dw: Introduce polling device tree property
Thread-Topic: [PATCH 04/32] spi: dw: Introduce polling device tree property
Thread-Index: AQHWtN4Jq5yxP9fdykKNjBOI754ZyqnLXIyAgAEZ8gA=
Date: Tue, 17 Nov 2020 14:44:13 +0000
Message-ID: <ea6a82e27a66600e7d4eb1668282d42dbaabf4b0.camel@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-5-damien.lemoal@wdc.com>
 <20201109195913.itgfj2ga5y7sr6zx@mobilestation>
 <58943f7988706497040cac6f6108336286e9d15f.camel@wdc.com>
 <20201115160146.efxcdjhm7f2nmivo@mobilestation>
 <BL0PR04MB65149D8B62167C11B26E0EA7E7E30@BL0PR04MB6514.namprd04.prod.outlook.com>
 <20201116215505.enelrzxaxb2457a6@mobilestation>
In-Reply-To: <20201116215505.enelrzxaxb2457a6@mobilestation>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.1 (3.38.1-1.fc33) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9a0d0ae8-9090-4ff4-6455-08d88b0740b8
x-ms-traffictypediagnostic: MN2PR04MB6477:
x-microsoft-antispam-prvs: <MN2PR04MB64776D3602607C964E235212E7E20@MN2PR04MB6477.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f/HDAB0V3zZ+/mRrWpOhKiMPGig0GZctERceiEP4hA1+XZ0AGSRi8ncIp2oRykljhx2iwu+LFomgTyv6BVgOjGhDKiYGifpNyTTpq+XDefnmihY2wraWbVXf7Mdu01+YRm9lbXY4OeMtSgjS0eYwb0qoMKiH4NE8w+nLn/nWBFwnm/akJX/am2HgbRygFM1go/hwxh0anIAsnw+knT9kcMPkA7Ml9XGZWly3OPvNNnilgkuC4O5XsZ+Wy4IA6ZB0EVJNgOBrYSFSP89+rXPkhwlX5CWbS4D0ga/IFSnMTF21tQtzYsVUzJxjRHKcrd4Lqlo3zJjFG77pf3RFNvXsYg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(71200400001)(6486002)(6506007)(53546011)(6916009)(4326008)(8676002)(8936002)(30864003)(86362001)(2906002)(83380400001)(66946007)(66556008)(6512007)(36756003)(4001150100001)(66446008)(186003)(91956017)(76116006)(2616005)(498600001)(5660300002)(66476007)(54906003)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 1PtOULaLInasHNSVczNf0Zzw2Q3l4f6AKD3z3k1njXRcIk47y9Ow3n0+K2u/7m8lRF//ph3BPmefmuIyCASDZSt0/Ia88Q1MhiwxgK1trV9eMlAe/nuMpLjClOY0otovSxhoklUV+9FXhHZn3BG0F154Hf4rktCbkZfqzVuNW2i9tPlVBaE8Qk2BQZoVZIdhTbp5x6W75D+h8qpKeJIUYdpRqfbmlFabRoChw9sSijpFlaa82sHIVoxpQpxaxbt4RzW8MxI6awrcPOhYf44S5HVbXpBs+hV/k0vNmyQcQYKzTiO9TPOPrKeBWR0ADFcr0Kckv0wh8lVuU2GnDQ6z1lPa11kNSqQmOuHcmodQCisSHoZO7/f5cbKEh5OoBPGp+0Ay5p19FX8VbYgamA5wKG3PW8o+T6+pMAJdjARkPNLYmIjQwoDz+AA5EopDcOBqRCLblvmAQAB2xBaG8GBnqn87MbRugfwzg34eIYgi4GBEj9a8pfhKJKShn0mAdEhTAvuzV8rLw0IjQHUzjyPR6dAnFsVOK65Lbn5NzJePvt0wzV0xTM8w8tMe7Yno3y6h3JdceMdf5lHtrAk1smVWQXINT7uEC7kzYXAWWXVojtVod9TIF6wUz9myqFmD5DzhlC/7ZcQoxaGK9ztQbecFuyDVJtNBeT9NEDnINJpyGcD1R08FexgMaFtDrC/lGqzMOdODMuVoIZFToK4yeGb7Lg==
x-ms-exchange-transport-forked: True
Content-ID: <5F2C234C034D3A4CBF4DE9FA4811FBE4@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0d0ae8-9090-4ff4-6455-08d88b0740b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2020 14:44:13.8150 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WN+MVzI8A9khZ05RsrhnwfVN+ESUZ9fet1tvpOj39bqqPGAMbBKsCZNHllAeF269j0iDPe4RpFJhuLaInC+P0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6477
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_094421_691621_BAD026D8 
X-CRM114-Status: GOOD (  43.63  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "seanga2@gmail.com" <seanga2@gmail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 2020-11-17 at 00:55 +0300, Serge Semin wrote:
> On Mon, Nov 16, 2020 at 07:47:47AM +0000, Damien Le Moal wrote:
> > On 2020/11/16 1:02, Serge Semin wrote:
> > > On Fri, Nov 13, 2020 at 09:22:54AM +0000, Damien Le Moal wrote:
> > > > On Mon, 2020-11-09 at 22:59 +0300, Serge Semin wrote:
> > > > > On Sat, Nov 07, 2020 at 05:13:52PM +0900, Damien Le Moal wrote:
> > > > > > With boards that have slow interrupts context switch, and a fast device
> > > > > > connected to a spi master, e.g. an SD card through mmc-spi,
> > > > > 
> > > > > > using
> > > > > > dw_spi_poll_transfer() intead of the regular interrupt based
> > > > > > dw_spi_transfer_handler() function is more efficient and
> > > > > 
> > > > > I can believe in that. But the next part seems questionable:
> > > > > 
> > > > > > can avoid a lot
> > > > > > of RX FIFO overflow errors while keeping the device SPI frequency
> > > > > > reasonnably high (for speed).
> > > > > 
> > > > > No matter whether it's an IRQ-based or poll-based transfer, as long as a
> > > > > client SPI-device is connected with a GPIO-based chip-select (or the
> > > > > DW APB SSI-controller feature of the automatic chip-select toggling is
> > > > > fixed), the Rx FIFO should never overrun. It's ensured by the transfer
> > > > > algorithm design by calculating the rxtx_gap in the dw_writer()
> > > > > method. If the error still happens then there must be some bug in
> > > > > the code.
> > > > > 
> > > > > It's also strange to hear that the polling-based transfer helps
> > > > > to avoid the Rx FIFO overflow errors, while the IRQ-based transfer
> > > > > causes them. Both of those methods are based on the same dw_writer()
> > > > > and dw_reader() methods. So basically they both should either work
> > > > > well or cause the errors at same time.
> > > > > 
> > > > > So to speak could you more through debug your case?
> > > > 
> > > > I did. And I have much better results now. Let me explain:
> > > 
> > > > 1) The device tree was setting up the SPI controller using the controller
> > > > internal chip select, not a GPIO-based chip select. Until now, I could never
> > > > get the GPIO-based chip select to work. I finally found out why: I simply
> > > > needed to add the "spi-cs-high" property to the mmc-slot node. With that, the
> > > > CS gpio is correctly driven active-high instead of the default active-low and
> > > > the SD card works.
> > > 
> > > Yeap, that's the main problem of the standard DW APB SSI controller
> > > released by Synopsys. Currently SPI-flash'es are the only SPI
> > > peripheral devices which are capable to work with native DW APB SSI
> > > chip-selects. I've fixed that for flashes recently by atomizing the
> > > SPI memory operations (executing them with the local IRQs disabled)
> > > and performing them on the poll-based basis. Alas the normal
> > > SPI-transfers still can't be properly executed with native
> > > chip-selects.
> > > 
> > > > 2) With this change using the GPIO-based CS, the patch "spi: dw: Fix driving
> > > > MOSI low while receiving" became completely unnecessary. The SD card works
> > > > without it.
> > > 
> > > Hm, that's weird. MOSI level has nothing todo with the chip-selects.
> > > Are you sure the original problem has been connected with the Tx lane
> > > level? On the other hand are you sure the problem has gone away after
> > > all?
> > 
> > Not sure of anything here :) But removing the patch changing MOSI level did not
> > prevent the SD card to be scanned & accessed correctly. Before (with native chip
> > select), the first command would not even complete...
> > 
> > > Moreover I've just taken alook at the MMC SPI driver. Turns out it
> > > has already been fixed to send ones to the MMC port when it's
> > > required. So If you still experience the MOSI-level problem
> > > then that fix might have been done incorrect at some extent...
> > 
> 
> > OK. Thanks for the info. I need to rebase on the latest SPI tree then. However,
> > scripts/get_maintainer.pl does not mention any. Where is that hosted ?
> 
> I meant the drivers/mmc/host/mmc_spi.c driver. See the "ones" buffer
> being used as spi_transfer->tx_buf sometimes there? That's what is
> supposed to fix the MOSI level problem. So if at some point the MMC
> SPI driver performs an Rx-only SPI transfer with no ones-buffer
> specified as the tx_buf one, but the MMC SPI protocol requires for an SD
> card to receive ones, then the protocol problem will happen.
> 
> > 
> > 
> > > > Now for testing, I also removed this polling change. Results are these:
> > > > 1) With the same SPI frequency as before (4MHz), I can run the SD card at about
> > > > 300 KB/s (read) but I am still seeing some RX FIFO overflow errors. Not a lot,
> > > > but enough to be annoying, especially on boot as the partition scan sometimes
> > > > fails because of these errors. In most cases, the block layer retry of failed
> > > > read/writes cover and no bad errors happen, but the RX FIFO overflow error
> > > > messages still pop up.
> > > > 2) Looking into the code further, I realized that RXFLTR is set to half the
> > > > fifo size minus 1. That sound reasonable, but as that delays interrupt
> > > > generation until the RX fifo is almost full, I decided to try a value of 0 to
> > > > get the interrupt as soon as data is available rather than waiting for a chunk.
> > > > With that, all RX FIFO overflow errors go away, and I could even double the SPI
> > > > frequency to 8MHz, getting a solid 650KB/s from the SD card without any error
> > > > at all.
> > > > 
> > > 
> > > Please, see my last comment...
> > > 
> > > > My take:
> > > > * This controller internal CS seems to be totally broken.
> > > 
> > > Native CS aren't broken, they just have been designed so it isn't that
> > > easy to use them in the linux kernel. Linux kernel SPI-core expects
> > > the chip-select being driven the way it needs at the certain moments,
> > > while DW APB SSI toggles them automatically at the moment of the data
> > > pushing/popping to/from the SPI bus. Some hardware vendors that bought
> > > the DW APB SSI IP-core have fixed that by providing a way of direct
> > > CS lane control (see spi-dw-mmio.c: Microsemi, Sparx5, Alpine
> > > platforms).
> > 
> > OK. Thanks for the details.
> > 
> > > > * This SoC has really slow interrupts, so generating these earlier rather than
> > > > later gives time to the IRQ handler to kick in before the FIFO overflows.
> > > 
> > > I am pretty sure that's not the reason. See my next comment.
> > > 
> > > > 
> > > > In the V2 series for SPI DW, I added a DW_SPI_CAP_RXFLTR_CLEAR capability flag
> > > > to set RXFLTR to 0, always. That works well, but this is may be still similar
> > > > to the "polling" hack in the sense that it is tuning for this SoC rather than a
> > > > property of the controller. But I do not see any other simple way of removing
> > > > these annoying RX FIFO overflow errors.
> > > 
> > > Alas no, RX-FIFO level value shouldn't affect the SPI-transfers
> > > execution results. I'll try to explain it one more time. DW APB SSI
> > > provides three modes of transfers (TMOD-es, see the chip manual for
> > > details). One of them is TMOD=0x0 - Transmit and Receive. Simply
> > > speaking the mode essence is if you push a byte of data to the Tx
> > > FIFO you'll synchronously get a byte of data back in the Rx FIFO a bit
> > > later from the internal shift register. The IRQ-based transfers have
> > > been developed full based on that mode. So it's absolutely possible to
> > > implement a stable algorithm, which would work without a risk of
> > > getting the Rx FIFO overflow or the Tx FIFO overrun. Such algorithm
> > > should just preserve a balance of sent data so the received data
> > > wouldn't cause the Rx FIFO overrun. As you understand such algorithm
> > > doesn't depend on the IRQes performance. No matter how slow the IRQs
> > > handler is execute, as long as it's executed, the SPI transfers
> > > procedure shall go on with no errors including the Rx FIFO overflows.
> > 
> > OK. I get it now.
> > 
> > > At least that's what the original DW APB SSI driver developer
> > > implied when created the code and what I was trying to preserve in my
> > > patches. If you still get the errors (you sure it's Rx FIFO overflows,
> > > aren't you?), then something went wrong and either me or the original
> > > author or someone else has broken the code.
> > 
> 
> > Yep, 100% sure it is RX FIFO overflow error. The bit in the IRQ status is set.
> > Checked it. And that is the trigger for the error message which exactly says
> > that "RX FIFO overflow". So that would mean that too many bytes are being
> > written to the TX FIFO, right ? Or rather, that when the TX FIFO is written, it
> > writes more bytes than what is available in the RX FIFO ?
> 
> I'd say that in appliance to the implemented in the driver algorithm
> the error has been indeed caused by writing too many bytes to the Tx
> FIFO. But that in its turn implicitly caused the Rx FIFO overflow.
> 
> The error you see in the log specifically means that the Rx FIFO has
> been full and there has been more data to receive, but due to not
> having any free space in the Rx FIFO that data has been discarded. In
> appliance to DW APB SSI driver, as I said, it means that there is a
> mistake in the IRQ-based SPI-transfer execution procedure. We've
> written too much data to the Tx FIFO so the balance between the sent
> and received bytes has been violated. ISR couldn't handle the
> interrupt on time and the Rx FIFO has got overrun. If the balance
> wasn't violated or the ISR was executed on time we wouldn't have got
> the overrun. Supposedly that's why the error hasn't been seen on my or
> other platforms but only on yours and only with normal RXFTL register
> value. The ISR is executed on time so the balance violation doesn't
> affect the transfer that much as in your case. My guess that the
> problem might be connected with the off-by-one bug. But that's just a
> hypothesis.
> 
> > 
> > If that is the case, then it seems to me that tx_max() should be modified a
> > little: rx_len may be large (say a sector), in which case rxtx_gap overflows
> > (becomes super large), with the result that tx_max() returns tx_room. But that
> > may be larger than the free space in the RX FIFO, no ?
> 
> Yeah, I also considered the tx_max() method as a first place to blame.
> But alas I failed to see what might be wrong there.
> 
> Let's analyze what tx_max() does. It may get us to a better
> understanding what is going on during each send operation.
> 
> Here we calculate a free space in the Tx FIFO:
> > tx_room = dws->fifo_len - dw_readl(dws, DW_SPI_TXFLR);
> It can be within [0, fifo_len]. So if Tx FIFO is full there is no room
> for new data to send. If it's empty we can send data up to of FIFO
> length.
> 
> The next is a magic formulae, which makes sure the length of the sent data
> always doesn't exceed the Rx FIFO length. In other words it preserve
> the so called balance: (rx_len - tx_len <= fifo_len).
> > rxtx_gap = dws->fifo_len - (dws->rx_len - dws->tx_len);
> (rx_len - tx_len) gives us a number of data which has already been
> written to the Tx FIFO, but the corresponding incoming data still
> hasn't been read back from the bus. The formulae above works well
> while the next statements are valid:
> 1) rx_len is always greater than or equal to tx_len. Indeed due to the
> SPI nature first we write data to the Tx FIFO and decrement the tx_len
> variable accordingly, then we read data from the Rx FIFO and decrement
> the rx_len variable.
> 2) (rx_len - tx_len) is always less than or equal to fifo_len. I don't
> really see when this could be incorrect, especially seeing we always
> send and received data by no more than the FIFO length chunks and
> make sure the difference between the sent and received data length
> doesn't exceed the FIFO length. The reading is always done before
> writing.
> 
> Finally we get to select an allowed number of data to send. It's
> the minimum of the Tx data length, Rx FIFO free space and the length
> of the data which doesn't let the Rx FIFO to oveflow:
> > return min3((u32)dws->tx_len, tx_room, rxtx_gap);
> 
> Alas currently I don't see at what point the algorithm could be
> incorrectly implemented...
> 
> > 
> > I think I need to do a round of debug again, tracing these values to figure out
> > what is going on. I can reproduce the errors very easily (I just need to crank
> > up the SPI frequency).
> 
> Yeap, that what I would have been doing if I had the problem
> reproducible.

Found the bug :)
The fix is:

diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
index e3b76e40ed73..b7538093c7ef 100644
--- a/drivers/spi/spi-dw-core.c
+++ b/drivers/spi/spi-dw-core.c
@@ -828,7 +828,7 @@ static void spi_hw_init(struct device *dev, struct dw_spi
*dws)
                }
                dw_writel(dws, DW_SPI_TXFTLR, 0);
 
-               dws->fifo_len = (fifo == 1) ? 0 : fifo;
+               dws->fifo_len = (fifo == 1) ? 0 : fifo - 1;
                dev_dbg(dev, "Detected FIFO size: %u bytes\n", dws->fifo_len);
        }

Basically, fifo_len is off by one, one too large and that causes the RX FIFO
overflow error. The loop above breaks when the written fifo value does not
match the read one, which means that the last correct one is at step fifo - 1.

I realized that by tracing the transfers RX first, then TX in
dw_spi_transfer_handler().I did not see anything wrong with tx_max() and
rx_max(), all the numbers always added up correctly either up to transfer len
or to fifo_len, as they should. It looked all good. But then I realized that RX
FIFO errors would trigger 100% of the time for:
1) transfers larger than fifo size (32 in my case)
2) FIFO slots used for TX + RX adding up to 32
After some tweaking, found the above. Since that bug should be affecting all
dw-apb spi devices, not sure why it does not manifest itself more often.

With the above fix, the SD card is now running flawlessly at 1.2MB/s with
maximum SPI frequency, zero errors no matter how hard I hit it with traffic.

Dropping all other patches (except 32-bits CR0 support that is still needed).
The MOSI line drive patch does not seem to be necessary after all. My guess is
that it was the fact that sometimes one more byte than necessary was being sent
due to fifo len being of by one. With that fixed, there is never any "0" byte
transmitted, so no need to set the value of txw to "0xffff".

Will send proper patches tomorrow, only 2 :)

-- 
Damien Le Moal
Western Digital
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
