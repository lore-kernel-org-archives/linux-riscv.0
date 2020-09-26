Return-Path: <SRS0=MS/g=DD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE0FC2D0A8
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 09:32:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F97C2389E
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 09:32:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TW98gK4L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="kYTlZv2H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="WSZeLz4a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F97C2389E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HKlVQQOS0KpQhddy18/HdRG58NLUWLsIfPPsy3SJtLo=; b=TW98gK4LUV6IT2srxVG1bIJwm
	g6L3s6CSleKFlJGCjca9o3wRnaAM2s+1/TM6ZmQSHbSIJdD+pp1FaBfFBjv5VTunsoJgYfp4Vf6+j
	XVvPOZ14Sgv2am+PxUGpBSJipWXeU3orKZjsM9ua74REJiQ7YjSVlPjPJVBaFObR0Zi7Qwb96YCoa
	wJ0RDjlal1vcRU2hdrh9F69zqoyhB06S+Qyo0tyS3ig/EZsq8/5MHkyKguc2xn6aEOrRkfV4ZhixT
	vqCcooD7jBtlyWCuE4ckbby0Qgv82ydq9AxpbUdm8hpjGbkYXG+KcGjfxWXsgyJ9GCJn0Qr7g8FQu
	TFFE8oGdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kM6Yl-0004kr-7z; Sat, 26 Sep 2020 09:32:03 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kM6Yj-0004kV-Ep
 for linux-riscv@lists.infradead.org; Sat, 26 Sep 2020 09:32:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1601112722; x=1632648722;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Rp+KM8euiO2CDmREVKH+nNH7iTOlNBwC6EqtGEmgHJY=;
 b=kYTlZv2HR97/gxziTJzLJvi5jjLHkW87DAtl4qNlLtA0QdwrLih+RdLh
 cBg0Ydp58HcR/y8ygPQpBZ7VpyO3bHMpE1MJcLz5PaL642vcQirjxrEZt
 4flMr+IsXQ9Grc25WAcYCLC028IdZG9dvzeOncK3kNOhCv/nMqwWCWFox
 3WKNV4LXjgmxRHeXfZEZtUXh6PovcXeIHMmY3oPI9jFk1l598PBn2CwmD
 uK7Xe0tfOldDQhsNBvh0bUTbZMhw9qk7Uux+BF6SxurhiXp3fytX0Oy3o
 HscqJcUOStkBHzOJTEv+3iEDbVyFS8oMGPntgqKHywy5/jEHax+pnGMyN w==;
IronPort-SDR: Tw35iGcOzNW+9h1k8K84Q6n+DGc1SpgXfaxN1whMDqK9ma2Z7scGs6kMQjqieoiWKDDc0suGrs
 lZ2Y0J1HprpdnpUT4rXD0Q/kGHEOExOnSTA/0Ki1UdCN5Iw2Zs018Fc15PjZi2ARbCxi1fRFmT
 svl9sUQsoVwcszk4A4tHvEiiZDnum7wr71mMA2nBhROu/v1QssOTtcYDA9kX1gi8BArk+IbRM4
 ZskR143u+EoowW67lYxCYEDaT1PvxU1clNI6t6DnTWYi5LunAqBLtu26e7NBn/wJpRCTTZ31qs
 Z6E=
X-IronPort-AV: E=Sophos;i="5.77,305,1596470400"; d="scan'208";a="149555903"
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hgst.iphmx.com with ESMTP; 26 Sep 2020 17:32:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fReIwBFjxk5PVjv9TkYT66VngPK/jZbz267pkTMDxWQG+bWWvkewWSmLG/hwuwvneFt3CKZdKtKNr7o6pCMUZx5gQ01i7Rcm3OwYT0e4F50mDLUvRt7uczrdGKq3T1mH771s7bGaMjD6e3o/qux1Iu3jTGMj04W8lP4bOfFTFMoqUe4sbADX1jHWo/x4x+NyxAIMxBGXnM0rZ5stRbnLdD8rj8xDEsulU2eTwqPi1Cu7XC9hkixogZI1XZF82aSCI13t/w1bxq4TEtuNaAArhZDmtvMTNQmnlzepOjDFe6AtyzyMwsXGSjNxWG0eUHrOz/ZPtwY0WkxfRr9OXnd8AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rp+KM8euiO2CDmREVKH+nNH7iTOlNBwC6EqtGEmgHJY=;
 b=FiGPP31n/ZYfm9u/6K0+snfedIYtpLG2hH5PR2Sv+dvCjgLJugchhz5obw7Cw2drOUYkVPz+8qrdBk1tjhkdQcJu4ltlnNRezicZ3m2LZuv2VHSCjecF+vh6SRseWANpstexfJ0iSYw02zoo5smMar58U3GGhkCh34b36I2mUnrgaWshfKtD/EDcG0FYfrDoiLMJiA14IkasCx9K4+T0bwf3FrjikzBEiYrZKXLDkICsTJ8zJQvzwRoQXP2eC+73igPYVmPK53pKXgvP5gVg2WwUWduzM+SlbUPePh0cBWPBocPbbx5/b2TgCTMJfz6pCsHntGGjJFAA+U26Fr6YnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rp+KM8euiO2CDmREVKH+nNH7iTOlNBwC6EqtGEmgHJY=;
 b=WSZeLz4aqWkQzt4QlJSQ8yx4VmsY5cju/rAs+ltHc/If80Sk+SBAkeOqYZLmQhw1ggxzKYwefRXGA21lDFpgXfS8yjh4JZATS76mlcxAWN23eGvTnu4fUQFAyK8Rn50RAV8oRJL8KajdRDd7hwLzmDdegRc6+nu57HerMo86tcM=
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM6PR04MB6494.namprd04.prod.outlook.com (2603:10b6:5:1b5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.23; Sat, 26 Sep
 2020 09:31:57 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::607a:44ed:1477:83e]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::607a:44ed:1477:83e%7]) with mapi id 15.20.3391.020; Sat, 26 Sep 2020
 09:31:57 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>, "paul.walmsley@sifive.com"
 <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "palmerdabbelt@google.com" <palmerdabbelt@google.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
Subject: RE: [PATCH] RISC-V: Check clint_time_val before use
Thread-Topic: [PATCH] RISC-V: Check clint_time_val before use
Thread-Index: AQHWk9aXpjplWP6NWE6N/VtUxnpMtKl6pkWAgAABk0A=
Date: Sat, 26 Sep 2020 09:31:57 +0000
Message-ID: <DM6PR04MB62017875C739101DF83280ED8D370@DM6PR04MB6201.namprd04.prod.outlook.com>
References: <20200926072750.807764-1-anup.patel@wdc.com>
 <1ee25b9bca3956d15a4a0dbf83f43d1ead454220.camel@wdc.com>
In-Reply-To: <1ee25b9bca3956d15a4a0dbf83f43d1ead454220.camel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [122.179.126.16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b9b53e17-7f5f-4f1b-ebd5-08d861ff0342
x-ms-traffictypediagnostic: DM6PR04MB6494:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR04MB6494EC64FF1A78CF83CD13298D370@DM6PR04MB6494.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bQpBoT2bwvMsC0TNR9Q3Po9RgrVxRQjndeeHOK85Wmxu406HX0D37fOvuVUFCk/1Uc9a3ASlNGVUtqa8iTlPosIXyOWm0FN4zsDn3w4fGEqfXQve9t1W+jEWqT/k+oSIZpCTwVC1tRYx31iyuCxB1ldzSE7js7I0baoQVvDtMLV51JDcTDW93OXMGSb7VP+Gxl4jntjp7Njfuwi2fT+OnMtdqamSux8Sp31ZhfLpMLFujAokOoHTSRD46Hj6HFTDZxMGv7sTqlt7AtHBRDASYbHJcazSCfXSZZ7s4G8gAuXNbp4UExPM05Dk0qJ/056g+0M+7ESbOm/wF4DUzM81aVJSYt6aJuzKNzuA/u2tIpB0zbm0pBgncpBGM9JsaqGD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(33656002)(316002)(8936002)(8676002)(83380400001)(2906002)(53546011)(66446008)(26005)(186003)(6506007)(66476007)(66556008)(64756008)(86362001)(55016002)(478600001)(7696005)(54906003)(71200400001)(76116006)(4326008)(9686003)(5660300002)(66946007)(52536014)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: uPfkTeP9Pd6iIwgQH1zI8OKvL7CPb515JVYAp7XgW0/DtRPwA82ytIExE6L3JZrXREokJt0d7GPschVpR8UkILON1viL6MiFQS0dqh3fW35Od3TDhu9hcxjmx6wttafVuZs5pZyb2pzJNjvvGvG3lYd/D4iFa3wJGkVMf6ryIQPMXuQTn5E+8eWx5Mz32CnZS3KuJtUUmPlUm4lQyXJ9vLaSqaCrNrle2pP+RxZefZGFFZIyc8J8BHbe+oI+4gYCg/nBjR3IMuQb+U8Ir9vqABK1qgSmLAT0JVbnxLxtT6o1E48EjgAK0euRcKHT6VZma5RI9rtChG1gjvPz/s/pNxLTkfbkX91nIFu1UFNhVMFUsHQ400E5q+Q1FPfw3KrM1hS5w5vSqJU4E87u6jHslfi3VuDjVRZhRKB6iw8qcCkbmx0BXcQk2fHgDqYZyeRi0wI8zfERHXnTTkqjZGhUMA4WV5Hrc7ftMD5Isdq3VkidnvYcJ8uf44tnMJGdRtCSD2NwApu+o2y1ZemfUvHBUPuu4DuTIEnIwebVM4NkBRhtlfJTHpEmO/oxR3oUGlNLb9E00hzgzx4q8v3KaGegVQPHkQgOpOBglzmWnswv/mSoeIwgG+Tkh7JH6TE/4JJ38dH/ICWOrbmWYsQFI5uzzA==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b53e17-7f5f-4f1b-ebd5-08d861ff0342
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2020 09:31:57.0298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W5C3ffUdzsVJ4Ck1UvZiPSdRt+aM711ZlJZTB2QPXddyTDPtiUbdnLyOi0XtGgf+wzc25YL5htprWccd8jyJKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6494
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_053201_621656_B9603C5C 
X-CRM114-Status: GOOD (  24.18  )
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
Cc: "anup@brainfault.org" <anup@brainfault.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Damien Le Moal <Damien.LeMoal@wdc.com>
> Sent: 26 September 2020 14:55
> To: paul.walmsley@sifive.com; palmer@dabbelt.com;
> palmerdabbelt@google.com; Anup Patel <Anup.Patel@wdc.com>;
> aou@eecs.berkeley.edu
> Cc: anup@brainfault.org; linux-riscv@lists.infradead.org; Atish Patra
> <Atish.Patra@wdc.com>; Alistair Francis <Alistair.Francis@wdc.com>; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH] RISC-V: Check clint_time_val before use
> 
> On Sat, 2020-09-26 at 12:57 +0530, Anup Patel wrote:
> > The NoMMU kernel is broken for QEMU virt machine from Linux-5.9-rc6
> > because the get_cycles() and friends are called very early from
> > rand_initialize() before CLINT driver is probed. To fix this, we
> > should check clint_time_val before use in get_cycles() and friends.
> >
> > Fixes: d5be89a8d118 ("RISC-V: Resurrect the MMIO timer implementation
> > for M-mode systems")
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  arch/riscv/include/asm/timex.h | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/timex.h
> > b/arch/riscv/include/asm/timex.h index 7f659dda0032..52b42bb1602c
> > 100644
> > --- a/arch/riscv/include/asm/timex.h
> > +++ b/arch/riscv/include/asm/timex.h
> > @@ -17,18 +17,24 @@ typedef unsigned long cycles_t;  #ifdef
> > CONFIG_64BIT  static inline cycles_t get_cycles(void)  {
> > -	return readq_relaxed(clint_time_val);
> > +	if (clint_time_val)
> > +		return readq_relaxed(clint_time_val);
> > +	return 0;
> >  }
> >  #else /* !CONFIG_64BIT */
> >  static inline u32 get_cycles(void)
> >  {
> > -	return readl_relaxed(((u32 *)clint_time_val));
> > +	if (clint_time_val)
> > +		return readl_relaxed(((u32 *)clint_time_val));
> > +	return 0;
> >  }
> >  #define get_cycles get_cycles
> >
> >  static inline u32 get_cycles_hi(void)  {
> > -	return readl_relaxed(((u32 *)clint_time_val) + 1);
> > +	if (clint_time_val)
> > +		return readl_relaxed(((u32 *)clint_time_val) + 1);
> > +	return 0
> >  }
> >  #define get_cycles_hi get_cycles_hi
> >  #endif /* CONFIG_64BIT */
> 
> Applying this on top of rc6, I now get a hang on Kendryte boot...
> No problems without the patch on the other hand.

Not sure about the issue with Kendryte but I get a crash on
QEMU virt machine without this patch.

Regards,
Anup
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
