Return-Path: <SRS0=N5Fz=EW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B344BC55ABD
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 07:48:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1774320867
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 07:48:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wYuVAY/S";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="oEZ5528p";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="s+z18o31"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1774320867
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=4e1rvZYfH5DH+GRqyS0ufjScSKx+oemFSjOOyhP6f2A=; b=wYuVAY/SApbVkjps9Iy1V+IJQ
	nGPqPNJDONzckYxviL4+nvi8m5un52shsj3/wv8ZKogxIrDf2qmTSRKB2lX6gofuXiaoN7VyYIx60
	hGvrSljH6KGZ+vFsj/wv1+F73nBsIUjFjTiRWNO5/knUI0ennAELpNlu+EFx3n6pFhj6ntb49aYZP
	u4f7VmjwStB+pCtCfaCEqXJ2l2Shax0bnadtp6mlji4F/DAyOX7XxMCIUarY1moJI5cBxTLlULXHk
	vbmTT4tz8y1kyqCAfjl+rNvFAuq+AF3WqpN0V1Z+qLqRnW1Q6TXlgzr3YVZ6p/01+0brE8hauwSgj
	G3NMQIh1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keZEw-0005O9-W3; Mon, 16 Nov 2020 07:47:55 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keZEt-0005Nm-Lw
 for linux-riscv@lists.infradead.org; Mon, 16 Nov 2020 07:47:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605512871; x=1637048871;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=Rnx3Ctdv97CaX5dKF/wQ21rt8eGmRYXNgLO2/yu9UQ4=;
 b=oEZ5528pvY3tUBRsdh941YcohqNX9Z/IhhzspfqFCHUPsfBb/FA56oko
 OzvALpMJ3HAmunh4wyvhqPUZK/NbnmjdiFfau5+S9hQ/32v386PsSDlAz
 OSCtS1FtAQYTkCWpNCeMXlrvg/Osh+C8PRmoy8LYK/t3uDgKKbjPUb9Rr
 8r0a/yb5QdXKDj3bgoS1ZGowDFF7JL763wdrvPJk+X1SPWFfJLNeqxe8T
 fXqUoStkAPXhqEK2H4VxX++oNYUGn0sP75WkaDB3bmfA7hW2OUrghJ8FH
 7yZeFf1aKOyVvselxkoS5b5ziru0oYkrgvjhapew93DlvV7KBvKsNM8It Q==;
IronPort-SDR: v6bZFk3MC1lkqwBPQ7ylOptlOO/Gyk0Z/vWAKdZnbr/SLCgqD3ZUB0FEp984rbbPU+FlHn758Q
 VyNF1fB8e2JoT6CJ6HYb5957HI5MCvhfVYT9BVwgceMHshja3R4V3V62aOjEwtjdIYvEGrb5Xd
 vtJ5umOwNHNOhJHZdDtY06LQUZMGaHKV2fogwnoewidFh4il14RYjIyH3cGpkN6yOGiaXuRD3m
 7g2okQWM4Utm2a1nD8udeDg5f//zQJSzG0ZOGT1PsdkD/LCZAlZQz0/LQ4cN0odQaHvC4cqB0d
 PiU=
X-IronPort-AV: E=Sophos;i="5.77,481,1596470400"; d="scan'208";a="152780038"
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2020 15:47:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hG7/q0wyLUtQPcBinwTP82MyRB0IHAEA5ZZJmgd85yGkzt5RTtPFJOckHEJXZtDMVW+xtkGzjRMan3In/zhyVhgTW/+8ImkSNiResQH4+WfPzHCk3x7EijSNyA/3Mr4mng3UOjC5MUFDp9EXHEFbhIS3DcmOMjCDK2YZbiI/MwKTDyQCSCYU5fS3y3IHDcT8oc+IAR9AIap5/rFEBa5FETT9YWpw4vus34TFUz9A0g0HiVEyghjWCdqoc6PoWTAokq1w+nKJrbOSlNjaiyMG5aVbrph4Sr6zu1u5A0Nmipx0DTPfJeJNH1SyPAtiHXyOHJNP+VAEBrTIRdWLCh45/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rnx3Ctdv97CaX5dKF/wQ21rt8eGmRYXNgLO2/yu9UQ4=;
 b=gYLlLlV+C05i7p1KAbKs2uIOT/jXpjNFRUxDaeFYKVdX34lw5UW4NILz0rGQWaPRJ95hzTNRxLovqCgcuZlC892uDul0R0NusT1r7ZnyHN8pUEj850JpdV43Zlgkd5SKmQquYW6iQv6t88vQJkQILQoy1LOrQykpbjp/yH9ubbMkWwvuZr8Qe70BB313tVgjW54Xp9FF+aHKHfPaAyNjusY5loQOGFK6VkpfEyjGHDbLszGbvUyt1lcMeM6o/GDrIhD/ZgDr/iWr6KYZ/r2Kie2PUuwUPLk1MV4yUd5XmI4dZsAd86XZRKoHYFBHVI3fV5BXwIkBVV7KAGqtlEPsPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rnx3Ctdv97CaX5dKF/wQ21rt8eGmRYXNgLO2/yu9UQ4=;
 b=s+z18o31ijq0TyLhD8J6TZreMjC9d1rSf/zf9+kfV2GLJ7R2J4rZRYUov4Wjtl4USwn+VjY/vGoyglmdYxZkO14kgnYrGSZBJJXlAT3Bq3kf8I6YSbmfxKphmPwB1ZIf5RyGAdT1Y0MlLJcoNQHuEnFuu4tgb1+7yH8CU5BKS1w=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6863.namprd04.prod.outlook.com (2603:10b6:208:1e3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 16 Nov
 2020 07:47:47 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.034; Mon, 16 Nov 2020
 07:47:47 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH 04/32] spi: dw: Introduce polling device tree property
Thread-Topic: [PATCH 04/32] spi: dw: Introduce polling device tree property
Thread-Index: AQHWtN4Jq5yxP9fdykKNjBOI754Zyg==
Date: Mon, 16 Nov 2020 07:47:47 +0000
Message-ID: <BL0PR04MB65149D8B62167C11B26E0EA7E7E30@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-5-damien.lemoal@wdc.com>
 <20201109195913.itgfj2ga5y7sr6zx@mobilestation>
 <58943f7988706497040cac6f6108336286e9d15f.camel@wdc.com>
 <20201115160146.efxcdjhm7f2nmivo@mobilestation>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.182.55]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d08a4814-41d0-4ee3-bc84-08d88a03e941
x-ms-traffictypediagnostic: MN2PR04MB6863:
x-microsoft-antispam-prvs: <MN2PR04MB68631C23E6C32BF81ED2D88EE7E30@MN2PR04MB6863.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zo4vN91p8KXcqeFHsb1XarINFafe8dXtu4tdDRiliv9iZZPVPijsh/F9i6qLfUEq0Ao8G2wb5P8g37SLihsHxe7aScYRk6q9NZFQj72FunpsVWEKatdbIHXvDFFFzs5w8JHGxCuk0qY3lroYNoP/5k2T5ITQGC8+1ZCBeSD2bFzbZ0SaC7GfQRkXgZiHVUAqhD3YoHraUfB3WjxUS4DyyWrHU6zplkweM2MtJtGE1G83DTB+dUZK2cZlSBCMuXIOv4WiibjI/NoiAAmZlXMoSg+8phj/cUwUQQmL4lZhxVx2kC/NFS/E4mcslb3YYK7I8xyBYIxq/zl9zndcOZknPQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(6506007)(54906003)(76116006)(64756008)(66446008)(66556008)(66476007)(86362001)(66946007)(186003)(71200400001)(91956017)(33656002)(6916009)(26005)(53546011)(83380400001)(7696005)(8676002)(8936002)(5660300002)(52536014)(2906002)(9686003)(4326008)(478600001)(55016002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: uakPgI5VyXc71t3SqRc0S2RgcGXVXj0EmeZYu1X7KnSrxGn9WomHoA7Yrd+L/9wJhfaZPcwWEgHHCNk4/2Tkkq5nq2Nxra9hkVcRcpcigrJrzDO/n2OBNQWCFoL9qY11aDx3zwfGuGCbzUgTOAa6iYlCJKD7+lQIMqDRpS/YXaerJ8lTEIUo1Vtgf6wFVVsrutF71k9etv5HPrq1T/uQZZmCvZ18Zoc6yJyFGfTIYPVNHmYJ4nlF+OH0Tv/tLk+4NKvz8jePM4hPS31IJHFsPw0unjkZVvB4pFj6AumECjKK2UEbDgh042vx+FlFVCl3R/5v6aTa2E0/tDMY3901pR04t0K1GaBTCBvPP+W/kivtOqYie5xK7oIDngVTEabHWABfXJDRE+drgSU4WM8y7BhCdDdqxDUy0ZfUfTZYXdC6GatQVWUyPn/d/87PxvXMEz1ojUTgW7gTWMi+7X/SzFvYzpi5390/QGpFPFSxtm7MQQgISM10WyomLvIV+txwEFP/2lG2v/UrzUYZytm9JBamWZfD96viScJgudJ4prMFwiCbQBhVOhcfx/ts/hyU+f3nKxWEbcUCjVkiC1VE2hJ80zuw3arMcjv4p+tXrwzVaPXnTg9ZA3g2R/fyJFHduMyLd6chf0yI4QhmncTPhA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d08a4814-41d0-4ee3-bc84-08d88a03e941
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2020 07:47:47.4774 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dKdVYwlcuX7uFDEV/XnEYsE1kjyQCEzGSOptP2IXSGmD109UAgBiFi0ByOqKVJybqCNkA+PbMg7Gol62zxCnMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_024752_006896_1DC849D8 
X-CRM114-Status: GOOD (  37.00  )
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
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "seanga2@gmail.com" <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/11/16 1:02, Serge Semin wrote:
> On Fri, Nov 13, 2020 at 09:22:54AM +0000, Damien Le Moal wrote:
>> On Mon, 2020-11-09 at 22:59 +0300, Serge Semin wrote:
>>> On Sat, Nov 07, 2020 at 05:13:52PM +0900, Damien Le Moal wrote:
>>>> With boards that have slow interrupts context switch, and a fast device
>>>> connected to a spi master, e.g. an SD card through mmc-spi,
>>>
>>>> using
>>>> dw_spi_poll_transfer() intead of the regular interrupt based
>>>> dw_spi_transfer_handler() function is more efficient and
>>>
>>> I can believe in that. But the next part seems questionable:
>>>
>>>> can avoid a lot
>>>> of RX FIFO overflow errors while keeping the device SPI frequency
>>>> reasonnably high (for speed).
>>>
>>> No matter whether it's an IRQ-based or poll-based transfer, as long as a
>>> client SPI-device is connected with a GPIO-based chip-select (or the
>>> DW APB SSI-controller feature of the automatic chip-select toggling is
>>> fixed), the Rx FIFO should never overrun. It's ensured by the transfer
>>> algorithm design by calculating the rxtx_gap in the dw_writer()
>>> method. If the error still happens then there must be some bug in
>>> the code.
>>>
>>> It's also strange to hear that the polling-based transfer helps
>>> to avoid the Rx FIFO overflow errors, while the IRQ-based transfer
>>> causes them. Both of those methods are based on the same dw_writer()
>>> and dw_reader() methods. So basically they both should either work
>>> well or cause the errors at same time.
>>>
>>> So to speak could you more through debug your case?
>>
>> I did. And I have much better results now. Let me explain:
> 
>> 1) The device tree was setting up the SPI controller using the controller
>> internal chip select, not a GPIO-based chip select. Until now, I could never
>> get the GPIO-based chip select to work. I finally found out why: I simply
>> needed to add the "spi-cs-high" property to the mmc-slot node. With that, the
>> CS gpio is correctly driven active-high instead of the default active-low and
>> the SD card works.
> 
> Yeap, that's the main problem of the standard DW APB SSI controller
> released by Synopsys. Currently SPI-flash'es are the only SPI
> peripheral devices which are capable to work with native DW APB SSI
> chip-selects. I've fixed that for flashes recently by atomizing the
> SPI memory operations (executing them with the local IRQs disabled)
> and performing them on the poll-based basis. Alas the normal
> SPI-transfers still can't be properly executed with native
> chip-selects.
> 
>> 2) With this change using the GPIO-based CS, the patch "spi: dw: Fix driving
>> MOSI low while receiving" became completely unnecessary. The SD card works
>> without it.
> 
> Hm, that's weird. MOSI level has nothing todo with the chip-selects.
> Are you sure the original problem has been connected with the Tx lane
> level? On the other hand are you sure the problem has gone away after
> all?

Not sure of anything here :) But removing the patch changing MOSI level did not
prevent the SD card to be scanned & accessed correctly. Before (with native chip
select), the first command would not even complete...

> Moreover I've just taken alook at the MMC SPI driver. Turns out it
> has already been fixed to send ones to the MMC port when it's
> required. So If you still experience the MOSI-level problem
> then that fix might have been done incorrect at some extent...

OK. Thanks for the info. I need to rebase on the latest SPI tree then. However,
scripts/get_maintainer.pl does not mention any. Where is that hosted ?


>> Now for testing, I also removed this polling change. Results are these:
>> 1) With the same SPI frequency as before (4MHz), I can run the SD card at about
>> 300 KB/s (read) but I am still seeing some RX FIFO overflow errors. Not a lot,
>> but enough to be annoying, especially on boot as the partition scan sometimes
>> fails because of these errors. In most cases, the block layer retry of failed
>> read/writes cover and no bad errors happen, but the RX FIFO overflow error
>> messages still pop up.
>> 2) Looking into the code further, I realized that RXFLTR is set to half the
>> fifo size minus 1. That sound reasonable, but as that delays interrupt
>> generation until the RX fifo is almost full, I decided to try a value of 0 to
>> get the interrupt as soon as data is available rather than waiting for a chunk.
>> With that, all RX FIFO overflow errors go away, and I could even double the SPI
>> frequency to 8MHz, getting a solid 650KB/s from the SD card without any error
>> at all.
>>
> 
> Please, see my last comment...
> 
>> My take:
>> * This controller internal CS seems to be totally broken.
> 
> Native CS aren't broken, they just have been designed so it isn't that
> easy to use them in the linux kernel. Linux kernel SPI-core expects
> the chip-select being driven the way it needs at the certain moments,
> while DW APB SSI toggles them automatically at the moment of the data
> pushing/popping to/from the SPI bus. Some hardware vendors that bought
> the DW APB SSI IP-core have fixed that by providing a way of direct
> CS lane control (see spi-dw-mmio.c: Microsemi, Sparx5, Alpine
> platforms).

OK. Thanks for the details.

>> * This SoC has really slow interrupts, so generating these earlier rather than
>> later gives time to the IRQ handler to kick in before the FIFO overflows.
> 
> I am pretty sure that's not the reason. See my next comment.
> 
>>
>> In the V2 series for SPI DW, I added a DW_SPI_CAP_RXFLTR_CLEAR capability flag
>> to set RXFLTR to 0, always. That works well, but this is may be still similar
>> to the "polling" hack in the sense that it is tuning for this SoC rather than a
>> property of the controller. But I do not see any other simple way of removing
>> these annoying RX FIFO overflow errors.
> 
> Alas no, RX-FIFO level value shouldn't affect the SPI-transfers
> execution results. I'll try to explain it one more time. DW APB SSI
> provides three modes of transfers (TMOD-es, see the chip manual for
> details). One of them is TMOD=0x0 - Transmit and Receive. Simply
> speaking the mode essence is if you push a byte of data to the Tx
> FIFO you'll synchronously get a byte of data back in the Rx FIFO a bit
> later from the internal shift register. The IRQ-based transfers have
> been developed full based on that mode. So it's absolutely possible to
> implement a stable algorithm, which would work without a risk of
> getting the Rx FIFO overflow or the Tx FIFO overrun. Such algorithm
> should just preserve a balance of sent data so the received data
> wouldn't cause the Rx FIFO overrun. As you understand such algorithm
> doesn't depend on the IRQes performance. No matter how slow the IRQs
> handler is execute, as long as it's executed, the SPI transfers
> procedure shall go on with no errors including the Rx FIFO overflows.

OK. I get it now.

> At least that's what the original DW APB SSI driver developer
> implied when created the code and what I was trying to preserve in my
> patches. If you still get the errors (you sure it's Rx FIFO overflows,
> aren't you?), then something went wrong and either me or the original
> author or someone else has broken the code.

Yep, 100% sure it is RX FIFO overflow error. The bit in the IRQ status is set.
Checked it. And that is the trigger for the error message which exactly says
that "RX FIFO overflow". So that would mean that too many bytes are being
written to the TX FIFO, right ? Or rather, that when the TX FIFO is written, it
writes more bytes than what is available in the RX FIFO ?

If that is the case, then it seems to me that tx_max() should be modified a
little: rx_len may be large (say a sector), in which case rxtx_gap overflows
(becomes super large), with the result that tx_max() returns tx_room. But that
may be larger than the free space in the RX FIFO, no ?

I think I need to do a round of debug again, tracing these values to figure out
what is going on. I can reproduce the errors very easily (I just need to crank
up the SPI frequency).

> What we currently need is to carefully analyze at what moment you get
> the overflows, what really caused them and fix the problem in the
> code. The capabilities flag isn't an option in this case. I've tried
> to reproduce the errors by slowing the system down, executing the
> SPI-transfers of various length, but with no lick. So it's only you
> for now who observes and can try to debug the problem.

OK. Will do.

> Anyway after we get to fix it, you'll be able to run the MMC port with
> speed as fast as it's possible.

That is my current goal :)

> 
> ---
> One more thing about MMC SPI. Please note, that using MMC SPI and
> DMA-based DW APB SSI transfers might not work well. The thing is that
> the DMA-part of the MMC SPI driver relies on the legacy
> spi_message->is_dma_mapped interface. It performs some specific
> DEV-to-MEM and MEM-to-DEV DMA-buffers splitting and synchronizations.
> In its turn the DMA-part of the DW APB SSI driver uses the generic
> SPI-core and the DMA-engine interface to execute the SPI-transfers.
> Since the SPI-core performs the DMA buffers synchronizations
> internally at the moment of the buffers mapping, in case if the DMA
> accesses aren't coherent on your platform, the data buffers might get
> synchronized/flushed with/by caches incorrectly corrupting a part of
> actual data. At least that's what we observed in kernel 4.9... So for
> now I'd suggest to use either the poll- or the IRQ-based DW APB SSI
> transfers.

The K210 has a DW DMA engine, but I do not have it enabled. I tried that too to
be frank, but it fails to initialize the DMA rx/tx channels. I have not dig into
that one since DMA is not at all required for this board given the devices on it.

Thanks for all the help !


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
