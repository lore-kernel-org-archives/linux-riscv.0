Return-Path: <SRS0=0ydX=ER=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB0EC388F9
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 07:00:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE6552067D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 07:00:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GQoZhQt3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="FRV3+Jsc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="xRMcld38"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE6552067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=srAXFxnQCbwLmglTgF9lRcGbnmBfMdTeHECEI7eKqPw=; b=GQoZhQt3L7564jPXU4Mkrl5DB
	HlgMpz7BiG04z//+MzQXMmn1m4Sm+tMOzuTwbGiZINrY/g99o6/JHi3KbsKOHQaQemq4mw4m/PbNl
	JuLtufndGkrjFHbVNeeNbmXiK3f5uBy6WPAYXeDL0GvA1Im5HESa1dm2asZa0GrNS3f/tajEgNN0R
	UrunQJQ0HihoqZjwlQtiOtM7E4MzNHn8zfx0BUKe0wPRHe/upAipzDTZ3H+UDGg5ohqsoyXVVIIsg
	hEbkrq+WgC9s90Vimkigcgiw1nR/QEwCiJRO6bhg9mF1/jlE9M4pmcd+yJ51USEccqB4EFwTQ3eNY
	fM21tLvjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kck7M-00050g-HB; Wed, 11 Nov 2020 07:00:32 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kck7J-0004zo-Vg
 for linux-riscv@lists.infradead.org; Wed, 11 Nov 2020 07:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605078029; x=1636614029;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qAWYGX3JwgrehTmjbV2cnhfcu/07+OPgn8ls4LBdfgg=;
 b=FRV3+JscxZ2+cqzEjxtEWxa26/5KXVAV3zFGOp7kQeQ+CvkDBFBGw0JU
 qkeffxQpLgFK4lpfn5Ip9lHmKtva+DLX8bqAf1a1nzEWIeYYboEwgxqfd
 jhHkDukPH6AWxkt9Lx6Dq/dPXsSpBnShyfKHiASHFF+Ycl6jr4jKn0G5K
 KGVexWD5v5Ji9GZ497gTd9WEwqwPS1diHYhiiNro3KfALWfDq6pIvoBwT
 aHWcMCGPiXUG+gsgcwaBbR9OA1eEVO6Y41y6mHlZPxpN8QaOUZzvZ+IJs
 znt+X8iYhS5w4Gnxi+7YuHy5GdoH940q4drBwO8/Itb+7aLnr0tPfe8/t Q==;
IronPort-SDR: cX8huQ16t1oZd+4UHiNM1jUwNgrhhYnhqYGGOfKF417qKdtFpsvX806e2mSJ0P8DnFbAJoWBoB
 EBbQ+4PClBjAyXGo+IwWdK6ETojKSqp0YwizxM8QoJG0U1AwwlY4dKTP4cob5I+qlhF1tedGjX
 Z8T+sukW31i9MMYfGppv2MwimFrDgWWLxZeUsXXL+NxKTmlT3o4wkUOH8+xIT5/q+HV9W9MxLP
 irA/zdzXTK2GSyqbQBuzUzXtRZw6TlI7WAr0F8IJPId7LQmfYqGDeDH6ckeAADUsPxD1iwNOm5
 CQc=
X-IronPort-AV: E=Sophos;i="5.77,468,1596470400"; d="scan'208";a="152460024"
Received: from mail-bl2nam02lp2052.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.52])
 by ob1.hgst.iphmx.com with ESMTP; 11 Nov 2020 15:00:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUojskjIJkMRMNcqmOioFmj1NjpOheD2CUak76N+hX4jPCXeFHfzoDcctM66k/LO6Mh+bJ7PQSdleCvh0S/Akm5fDtXDYZT5WnBc9onXlANiOHG9J5T4649KDtB7+J5tHH20tRvPjZUW3VtOI6T01MQ59dRwpPROQQtW9QwSp79iiOoGd9ebAWlhirdDVqIw+7bPIop0L8XlLtxT/47IL6ZOleYKr/3DrIkkmiybDboUVYxHHHrJ4qy/gKWJMgX2lFUbBMh/pX8FbB8QY1XRoorP0xIJKwbf3DpJk5ssOPed0VV/8pm65/AI1/C2WmAb6Wu2J0wSfv+poUv0PDjVNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAWYGX3JwgrehTmjbV2cnhfcu/07+OPgn8ls4LBdfgg=;
 b=GDjI8jotGPmf6e2kSctlPH4FFfwrpcf2HmX89XYfCl4Sz4g8sD6MR3fKCRHEsDYkInK+b0kLkXr1DMG+z0n7ICuY7m2NowsI1AKA5lW2hBSFNUV5R6N7wMdj+XZFDXerkPJy6FWxcQpA1VkBL0dt933cqEQh/+XHV5vQeK+VQFL76AsFldyE+Xa+m5YfGgu/K5zq2SBl4zk4L5llPM1rVXqGu9EodRdl4CCOUeOY12yXlMRuLh9LczzMKWDFLUjo58o5lvVkWXNUYnXQQLRKVLKOMKsOqeg9OdtUSWyDUSIel0y8A5WkdByXCoXW1VIAdn1yhklsL073ThkD+5CVhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAWYGX3JwgrehTmjbV2cnhfcu/07+OPgn8ls4LBdfgg=;
 b=xRMcld38xh6gs/KnpuY1X0Ox4N8V2zUgkfwV5+6BJ0oWtbBBx0KiLLONVGUdZRkN5g0ENipjoIXDCtjGWqU2ZeO3IYZYANwSoIQm7RW3gdlR8JOAoddPv4dVshUyymNaOmfB54YLJFi/11R3VfCpdZorQbus0uLw+LPtArM2hKM=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6349.namprd04.prod.outlook.com (2603:10b6:208:1ad::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 11 Nov
 2020 07:00:18 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.032; Wed, 11 Nov 2020
 07:00:18 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH 09/32] riscv: Fix SiFive gpio probe
Thread-Topic: [PATCH 09/32] riscv: Fix SiFive gpio probe
Thread-Index: AQHWtN4SvWrZLi+A80GAPGjcz+Y8EKnBdPyAgAER54A=
Date: Wed, 11 Nov 2020 07:00:18 +0000
Message-ID: <0fdee1f9986af095a3f7d329f8907cfbe49dd7c0.camel@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-10-damien.lemoal@wdc.com>
 <CACRpkda1Pd3hTiEHWDOAz3zCMA6WK4VmvjkNv0O_ckFaWQ-zSw@mail.gmail.com>
In-Reply-To: <CACRpkda1Pd3hTiEHWDOAz3zCMA6WK4VmvjkNv0O_ckFaWQ-zSw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.1 (3.38.1-1.fc33) 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3f922fbc-c74f-4005-1fdd-08d8860f733f
x-ms-traffictypediagnostic: MN2PR04MB6349:
x-microsoft-antispam-prvs: <MN2PR04MB63498D57052A1000F411496DE7E80@MN2PR04MB6349.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zA8Or/Qr11KbkiqjdsbOk6Uk1pk1IOX8d51VgZVikp1Ykb6ohdhKzO1pxnOVIwBAa40Tz4oGntOoiQoieJRa6pi9Nwbc86bVrLE7lCN39XnNwaEebAcuVGWH1MgcsibwrYZ1dFv2YzFAtkJQSydJix5+xEErjIge12gyaapHpDRyKnTsn0U5grQ3NOLe/lUqfo+OJr5K4cWGfvpWCkK2DApbOuGYQJLraEoHVO4khI5ZR4srCD8AmPDx8RAL8KOi4ZU/gQt52h6Z4LUMTOz4ibNLuXEd+BHqQyI7hU8bmhXA/j+uFaKa3Qqw5gLbMIGvbYp3ZZPTjphAzA51aZChUw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(66446008)(4001150100001)(478600001)(76116006)(316002)(186003)(6916009)(66946007)(71200400001)(2906002)(91956017)(36756003)(8936002)(6512007)(53546011)(2616005)(8676002)(6486002)(4326008)(86362001)(6506007)(64756008)(4744005)(66556008)(54906003)(5660300002)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Fhol5WWON0yVN7vaRZGqPEMGaaKuBtRaRert5JWyAsRw1N9ZzUQQH0XUm+5CMaVnw6HeT+aKqJav+tLA6LVtwOkCkqO0CinldZOtSkIQD+ZZILgPsYQN8NPaT2CAEJAjyfbTb3C3hJJtYIE9Hffa0wlcv5ua+LAw+nE6Y3gEmeoTLgPlyeqP0bQ2m/6uRFo6tX3b4gjx1rAdz3ND5DW4J2CIAtARRiCfO8objY6upZziLaNurkrvh/FUZYRnWN+DdFcbwHDUETrbcnY8ywcfxm8K1T0fwFe7Ru/7YnVqBUhLqKdKSPkvQCzXa86NpAnQCjqXpmn42DmuA3DiP00m1v0n0b3MH6Bv5fDB++oCDBaCEvflBTOvcGGbuR2yk8OoIrAaKoPwUUegPIRQxYKRLC72LmqQENdQbbNkH0AZWWCJTlaO1NeK6x+mdZ6PvCAJV75wkIwS7Cul50FhZxHblEIw3LkpYNLILMe3+7rs3hsYf61tlIbTdDyzMSkzVH/0XLaHCBFbqIGdEdIr1X/GfAf839bcxgaUL+D0KUXsnEb4eq6TOflo36J+U/RDds+69hdHiyDmAzj87/ioUxzJh5KEEY2G+Za8g3Jz3I0J5Mm6xQsn1DUkD8LcCztp02CGoQdh1/kMhU5YUoCtNnAJhfHCwLacwZev7DaRYSUFTqNc6JYd+OEIhfsq6ytIoSgcnIm0krIcU+SwqHTHo9PmYA==
x-ms-exchange-transport-forked: True
Content-ID: <1DC6AADD477D844998E36956957BA0C3@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f922fbc-c74f-4005-1fdd-08d8860f733f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 07:00:18.7664 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LPpVw6vyeNMw5X7mVX8HYAt4X8YwAXHfbP7togtlcW9pyNnNsNC8wBrU0D8bXkcW6BcInsY47MymS1+46C+Bmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6349
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_020030_263444_F21D1A34 
X-CRM114-Status: GOOD (  17.69  )
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
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 2020-11-10 at 15:39 +0100, Linus Walleij wrote:
> On Sat, Nov 7, 2020 at 9:14 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
> 
> > Fix the check on the number of IRQs to allow up to the maximum (32)
> > instead of only the maximum minus one.
> > 
> > Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> 
> I just ripped this patch out of your patch set and applied it to
> the GPIO tree with some minor change to the subject.

Thanks for that. I will remove this patch from V2 of the series.

I just realized that I forgot to add a Fixes and CC stable tags. The patch
should have:

Fixes: 96868dce644d ("gpio/sifive: Add GPIO driver for SiFive SoCs")
Cc: stable@vger.kernel.org

Do you want me to resend the patch with the added tags ?

> 
> Yours,
> Linus Walleij

-- 
Damien Le Moal
Western Digital
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
