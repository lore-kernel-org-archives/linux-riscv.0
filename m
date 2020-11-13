Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E6CC56202
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 09:23:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83CA522244
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 09:23:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f+Z3Em+B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="k79jc4iW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="GgpkyfWc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83CA522244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NWr8BCixR6JsYSznF3f51spAbuAWVkQn9WpAiA73ZBA=; b=f+Z3Em+BZs9XvqkJHuw3uady3
	qmM62DU8AC9QMnVR843a2NlMotpvAS6ghu7B9Tj0UhGiYBcj+e/r1Vb5NyxoK1LXZxocwffExA554
	e2HICZVRUh7fZjtNC3tp72deX4/9khDbh32kWBeq4lycRL1915IxufWLo7DkDo9agB9kS0jPnFedY
	eKRENmEzPQuOpid77mppqroWaFDGgQUuYrPSIL+nOQbjY7TLM9qWsKnz1GWkFA9wmrQpZga7drwxz
	cy7bpfUgnEV4OoEsq/AVwY8r9fCtRUZpGuNwHgxDMVvM2j1ZZTIc0oMSEuNS6UDY+AGT8QDNUFmCn
	bCP+vYdAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdVIL-0000nx-I9; Fri, 13 Nov 2020 09:23:01 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdVIJ-0000nE-3f
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 09:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605259379; x=1636795379;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=vhGPTPVvs/GLZ1bKVr+gHsQslM5YUkDznIdkuBcpxtc=;
 b=k79jc4iWWXNid8GCqrZQJbQc7K+u3kxFDgrgKXWmgI1B1lBV1DKnRfr1
 7lYiYNsbBh9MUfOh5W71tEI96wlqoXMmVR/ud+Lpv4o6Povyp9KGIESnu
 JH7WEsLX6mK++kOImua9kFMwMqZFVhIQQBeW6QZwO6G6QFMjuNyvWXh2e
 dssKkUK3pk5Cz+IfyYOF6yLKbYefeCDO+a7Fgaz/vOZkPZqGBGuoX//gG
 omx0Pof6ra7QKF4cZy3fAkNOE0BKWv+RGa4yzu5wvr3+3XsKVba2CMzuj
 Mm0jWYMBHgynC2EOvzeXn0Llr8QTV2KoOleIYtpJ3AcfeY2ENzgxQC7GI w==;
IronPort-SDR: ElwMMwfYKt4favxwrpLC/WejHDJrF8Np7EtjX4RZAmg5AtoHtgvCH4NtfeN1o7WUHlzp6DvPdS
 0+/8SfNn9nSRkuTcUK0tq91QOrvqa/PrIp3r/PZNNMaUh4uCfnZyaKNEVId3k+DmyEhKD45enX
 /2afucd5N3jZajveC0OPrmwPpe3RqVLzZTtHaMTJr5fmenxcI0FBvrjCKzbOY/Z1IyNX7mw9qb
 EmP96LznoH/bJTjZRSg2FyA2vlwOYmD2bMscqBN+3QrnNts7iPpyabm9ZgtyEZ6BFTuol0FWm6
 PMw=
X-IronPort-AV: E=Sophos;i="5.77,475,1596470400"; d="scan'208";a="153755605"
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hgst.iphmx.com with ESMTP; 13 Nov 2020 17:22:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+EMzhyt/NHwJatoy7AGoUNqC5aNoQMFLOtaIeYovuAZ0f/ADB4eiLRWYZBYNvvpnqTVz8nNz7ojyWTii1d7fPrpnmEd7JcNoagHDaTlgAkzOqbMxmLitkjHMX8RTG3glN5UelQ0WycQYPAsdiovc8SUwyD23PYCTSOxEUdwVc/mj8KTqsFfyGYtsoTngWXjtMAsAIRaYMs0cmIV7VmiEO5PH+JvgaVyhFYIoc89LqYzqZ2I1JMNHjbzHU4HgEUvdJntUiyCJIBrxysWPoYKMxzXKqq0ijxzj4ASVhhp8BtXH1eicRbMu7oHdfbgH7OpdhfBzX34t897XmB5GClKyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhGPTPVvs/GLZ1bKVr+gHsQslM5YUkDznIdkuBcpxtc=;
 b=d7MV5Jeep/0xiKrWWaCFZS+WdYEpUuguYUdf/KpOpkTNZ/HoWsDVzhOKdBxIjs/z+1CuaB2k7Vi7rmJf4yTFCNdLrq1Xp/XEmCx2iLKm+iXgNKa5xg5Q5BNIvAhvyqDZZCyuLvUqjKK8ujIxkCFMKytEmbjmWoASeJFUMBXrt36Rmh4qCc5BMMdGQcnLcU8R1EBipdj0EtIUSYC7NeRkOyhvtoa8DnxBjUr6hqiTDsGansJQd/584vJKbG+s8NH31TrZ5mrYlZyXAJCmCPpSYQNDQkWkuyZpR5tcKV7dydcy8N3uNSenbH5zWcEQkiRj2/nJh8eAs0/MVtqsiYCraQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhGPTPVvs/GLZ1bKVr+gHsQslM5YUkDznIdkuBcpxtc=;
 b=GgpkyfWcOErWTXW6hSO2YC+YegpQyidTEUAisw+9MAnNJmI72I7/zO59cWQqwBcVRbVAO9gTcrIkuFf51qXJgeC6k9U4+05eDa4bh6JnqCqsnS/rNNeXfwkxpnvgeGvwsJGSZY97Q2AQFTAfOVHvA2rGllNO+P8fH0JPqq9i0jk=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB6595.namprd04.prod.outlook.com (2603:10b6:208:1c5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 09:22:54 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.032; Fri, 13 Nov 2020
 09:22:54 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "fancer.lancer@gmail.com" <fancer.lancer@gmail.com>
Subject: Re: [PATCH 04/32] spi: dw: Introduce polling device tree property
Thread-Topic: [PATCH 04/32] spi: dw: Introduce polling device tree property
Thread-Index: AQHWtN4Jq5yxP9fdykKNjBOI754ZyqnAO9uAgAWXiAA=
Date: Fri, 13 Nov 2020 09:22:54 +0000
Message-ID: <58943f7988706497040cac6f6108336286e9d15f.camel@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-5-damien.lemoal@wdc.com>
 <20201109195913.itgfj2ga5y7sr6zx@mobilestation>
In-Reply-To: <20201109195913.itgfj2ga5y7sr6zx@mobilestation>
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
x-ms-office365-filtering-correlation-id: 91bc297d-efe6-487b-ca16-08d887b5b3a8
x-ms-traffictypediagnostic: BL0PR04MB6595:
x-microsoft-antispam-prvs: <BL0PR04MB659592F556B743CA086894E9E7E60@BL0PR04MB6595.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0JpO55x7+SlY9NIpI10WB13VmycVDTQEUJHX8fqivHJ0nmvus8pZOMLDtMAOB3rLZkPiQurAAolfA/gDZDFEy5qa9qDUO1HyBy11HlHucVBWJIWK0wetmidtPsgf0t/Ri+0s02hGufs3UIHl9lLy66iLx2i7HZ9RQ00IFRLlyucTkugo+hsa8IwvUAajjr2ZFFWIrxX7J/FlWTEdWf/BDsXvfI/FwQP2ZnUYOszFptaTaPj1O1X28/1560f+1Lj2eIpbKvvK/uZpquWHcwzV6u+CUy79d5pP3MgGF9GTlVGCHz4wyaw/iy1dgVLx9rtHs3LqnghxmcrGLvsGSgm8yA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(36756003)(6512007)(2906002)(478600001)(66946007)(6506007)(4326008)(86362001)(316002)(83380400001)(6486002)(5660300002)(8676002)(66556008)(66476007)(54906003)(64756008)(76116006)(6916009)(8936002)(91956017)(2616005)(71200400001)(66446008)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: BXzjWKrmB1KLdMYqnRTBD8HXCg5WLgAoiU+uvkcBsY4o+NTNB1sGDbXtUwYcVp5SEQKMGu5dMOTfSzB9r8VUxefiHfrA6a2N/zoVzNTwv9zwyfqP2Znpcs/RT4P8B1X3ZIXjJxw8DIabvWtffNmA4jYZZflpInRe6T+mcvM6P2z6W5K8f+HHr5imAgJO1coM9adGbVSyb3mkeSTWCdHsBNptifgU95jTou1dbXjboOuy154IDeF9Rj1GXODkdd8hgVwhoju+ZR/w0Vqidjrf6vBbtbOK1TCrAs32eXxK8KVjJ5YL2f9mXe8yirCQqxfez7wXCxsnBvQnYR0t4urfL97cI1XyIVANlOrQfTY59Vlp8aY9JVxfE6Nz6YKzb2aMNDy3xC7OJr8c4yyCXd55w/wJwJ/2fcN2o+4PQ4hCr5nmV15g2iEeWUg+/jo8/qfYF42gVjR5Eh+KPAxqwnkH5qFU9r3S++ppESO5YugGMXifR/1lMx9pfx8dsfzSrseUUOtns43/JKTOC6R9/93qGpdQKtuLDhYkmS8/ER2rjpueRslSyy3xpStVIyD2tUKWYqU9qXWEzo0gLoIjDxLDJNHd7Q5cEzmmKfBNi1NtRlG5FMmnOPoAF/Viz2deuye3lqKip5olMAs5nUnnI9ITUcWji2hals4RYn7sJYd23ZUl+qLih2uvq42icOkMd1LSoWmWEBnYM/9AcXfftAPgRw==
x-ms-exchange-transport-forked: True
Content-ID: <B23609E5220A70499C517C8ACFF72FE5@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91bc297d-efe6-487b-ca16-08d887b5b3a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 09:22:54.4395 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v9bcGwCY6kIij6wcZ15uLQuhrJ37x1wINqwOJB1fJ5koXxl9ehs39oCMMceEkNtK2UvCiTMf8yuS9ith7ahcHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB6595
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_042259_468297_12C8E346 
X-CRM114-Status: GOOD (  31.40  )
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

On Mon, 2020-11-09 at 22:59 +0300, Serge Semin wrote:
> On Sat, Nov 07, 2020 at 05:13:52PM +0900, Damien Le Moal wrote:
> > With boards that have slow interrupts context switch, and a fast device
> > connected to a spi master, e.g. an SD card through mmc-spi,
> 
> > using
> > dw_spi_poll_transfer() intead of the regular interrupt based
> > dw_spi_transfer_handler() function is more efficient and
> 
> I can believe in that. But the next part seems questionable:
> 
> > can avoid a lot
> > of RX FIFO overflow errors while keeping the device SPI frequency
> > reasonnably high (for speed).
> 
> No matter whether it's an IRQ-based or poll-based transfer, as long as a
> client SPI-device is connected with a GPIO-based chip-select (or the
> DW APB SSI-controller feature of the automatic chip-select toggling is
> fixed), the Rx FIFO should never overrun. It's ensured by the transfer
> algorithm design by calculating the rxtx_gap in the dw_writer()
> method. If the error still happens then there must be some bug in
> the code.
> 
> It's also strange to hear that the polling-based transfer helps
> to avoid the Rx FIFO overflow errors, while the IRQ-based transfer
> causes them. Both of those methods are based on the same dw_writer()
> and dw_reader() methods. So basically they both should either work
> well or cause the errors at same time.
> 
> So to speak could you more through debug your case?

I did. And I have much better results now. Let me explain:
1) The device tree was setting up the SPI controller using the controller
internal chip select, not a GPIO-based chip select. Until now, I could never
get the GPIO-based chip select to work. I finally found out why: I simply
needed to add the "spi-cs-high" property to the mmc-slot node. With that, the
CS gpio is correctly driven active-high instead of the default active-low and
the SD card works.
2) With this change using the GPIO-based CS, the patch "spi: dw: Fix driving
MOSI low while receiving" became completely unnecessary. The SD card works
without it.

Now for testing, I also removed this polling change. Results are these:
1) With the same SPI frequency as before (4MHz), I can run the SD card at about
300 KB/s (read) but I am still seeing some RX FIFO overflow errors. Not a lot,
but enough to be annoying, especially on boot as the partition scan sometimes
fails because of these errors. In most cases, the block layer retry of failed
read/writes cover and no bad errors happen, but the RX FIFO overflow error
messages still pop up.
2) Looking into the code further, I realized that RXFLTR is set to half the
fifo size minus 1. That sound reasonable, but as that delays interrupt
generation until the RX fifo is almost full, I decided to try a value of 0 to
get the interrupt as soon as data is available rather than waiting for a chunk.
With that, all RX FIFO overflow errors go away, and I could even double the SPI
frequency to 8MHz, getting a solid 650KB/s from the SD card without any error
at all.

My take:
* This controller internal CS seems to be totally broken.
* This SoC has really slow interrupts, so generating these earlier rather than
later gives time to the IRQ handler to kick in before the FIFO overflows.

In the V2 series for SPI DW, I added a DW_SPI_CAP_RXFLTR_CLEAR capability flag
to set RXFLTR to 0, always. That works well, but this is may be still similar
to the "polling" hack in the sense that it is tuning for this SoC rather than a
property of the controller. But I do not see any other simple way of removing
these annoying RX FIFO overflow errors.

> On the other hand the errors (but not the Rx FIFO overflow) might be
> caused by the DW APB SSI nasty feature of the native chip-select
> automatic assertion/de-assertion. So if your MMC-spi port is handled
> by the native DW APB SSI CS lane, then it won't work well for sure.
> No matter whether you use the poll- or IRQ-based transfers.

Indeed. The GPIO-based CS does behave much more nicely, and it does not require
that "drive MOSI line high" hack. But for reasons that I still do not clearly
understand, occasional RX FIFO overflow errors still show up.


Thanks for all the useful comments !

-- 
Damien Le Moal
Western Digital
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
