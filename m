Return-Path: <SRS0=E1a4=DE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C65DC4346E
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2020 05:51:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F091023A03
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2020 05:51:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vCNUrsdz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="SHsTfan8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="DBFxnRJ0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F091023A03
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rhfW2x2rrpjFT2O5Nwmnu1+79BiOQkc7DxvQ+0in1+4=; b=vCNUrsdz6rBU1gxxfSDEv2hqM
	moOkGnUr3S+lbCndyy8bNuomOX4LyCM9FiAUKKVY+MWZ6u1zxPGKkdLHTN2XpHaiXphEJrWFKOQQU
	UB+5n1lUir80fIwl/r/2eZTQeCDihur3BBjf1/nKFyDizEUII1DqDf1apluSBNyVFMeWRHbsZMxtk
	kQuhLlZz003y7iMKTv2yOgbLp0KxNZiOo9NccA19itgHzPng3iZUBHIW6uL4jkDXQGMF6lZBy+Eh6
	O5HaJWB5lyeEIvtbOyR7XPjJD/f9ASxMvs9ypCjm6kQABe7yQ2gHAI0uJ3cE+pjbIfHQdJjuPDl+H
	Z/+K+SUuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMPay-0000x9-W6; Sun, 27 Sep 2020 05:51:37 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMPax-0000wa-63
 for linux-riscv@lists.infradead.org; Sun, 27 Sep 2020 05:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1601185895; x=1632721895;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Q9zHDhTOdzBFTb+QNBGZ/EKhYndqeDMWFhuF6S8aTOY=;
 b=SHsTfan8RfoT/leCm4EIUHBIEiHI87kommLoYw0WJzTlXj0La1OzkySI
 LC1eIYauDVESpDry2n9QnLan9NHgOYreI4Q/XZ97UcU5cLorrxCCp80zi
 /P952opa98P36zZyQc47CCZgyx4pt++a6+xd7Rt9F77N1i/W2XXtfN/uq
 4Y94r+w3qLN7uxM2P4H65YMNcUHH4FiBTihfFIqOqXlIFEWVSlWJJaCZs
 hOl2gK1+ZkmnHdujuCiYW2SUG0YNuURlZPfR91nysyPSoMzzMuA/QdRQc
 /Ht+LO+I0GU5TOjR5/LPFEHS8ra6Sekfsb6YUcBv0NGm279sO5ULDtErC Q==;
IronPort-SDR: rAYvnrIDg9uT/gL+zBapAQuc0aoBkh09MAdYsWNqPa1okPxxS11fpv2l7IMT+/3+ChOTwF779j
 s1mDxJqys4fnKZUQ2dTaR+db5G10O55Y0QI9xguCUpoiHb/f2MNb7FSCRM3BnJ1u4PSffgysCR
 ba5pukJFfnbOYALwyTzvW1BxCouyCPl4LsF0VvPO7riOjya3G16DKt5oYZ9jQdCYnUr10mVe7E
 LmGXxA7XsfVqy51VGxWP+mrw8EE0CtO0eUvrQuTjDK9TIj7zvyhvXDTA+hmdaiqJ+PlJ/F3/DE
 GZI=
X-IronPort-AV: E=Sophos;i="5.77,308,1596470400"; d="scan'208";a="258081525"
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2020 13:51:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzKlATrT7dtun9XrSjsrZAVpwbAe3/nUHuDDoInc8cX/GFQ51yZJbrZ+MZZZtCJII3LE5Wbjl5D9I+lzO2TM351/UUf8wvUEeRyb0+z8/6qxBVqneItrRTaBv/ekH6T7ibSAibWsPTopOaPuq7G6L7zACR2wZJ7mpflNwAW0279J1ya/orXAduyp1mUuiBRDKMbYxmqpjkMfqHHcjV94mihC+S7FawP5lug5N98sDgNaLUZ5rqPy/iMSyAM5vo1nV/1WR7rSPQidujdQ0UvZTHIFkXkqOrtm0nyd+t8bFaqkfrWlkWG10HsItKjJfp2BG85JMf9oA/63/QWcc26wpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9zHDhTOdzBFTb+QNBGZ/EKhYndqeDMWFhuF6S8aTOY=;
 b=Ls63vsfE2MNdotXnE/OwMEDWzmp49xfnwpHa6Y8cSVtbFcIkSIYkxymuf271IsmYShE6tOB8JIvOV6EIfVJ7esyiqLPMDLTdVuEmV6227mTbH/aN0cowUn614o52fOsvkm3ZfO3Dz/2yw0yJczm5/H7DwTd1I5wjNnknxWo2BaZ/DzSVG2q4iE0rYflKcIgitsWgzfv8oQbjUvBlnejthEGIynWZwiPmMs6powg0E49BBMhSJI+L6yVHNJfTf/JCCNaLK/pQ+eg0R/ay2ciuV03AzBxs96wX5OsTjR1FD9oYoJq4S/iGYrFMTPFAdC72iDFGqozIynn9k9DHW7hGFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9zHDhTOdzBFTb+QNBGZ/EKhYndqeDMWFhuF6S8aTOY=;
 b=DBFxnRJ02o6PtLLDHug64zvKPgIsVaKsiMgmWf99OHkTVXHzcUOFENvrSLzUdno+xkx/0QiTbz1hakaqiwrlAMHmdlAxhp3VUrWZXWh1f41yygK7/beDxIb3zoPlQu2s6SvDmDDCOedeX9RubRYKPW0o2CzeCoahmFbC3cSc0WA=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR04MB0568.namprd04.prod.outlook.com (2603:10b6:903:b6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Sun, 27 Sep
 2020 05:51:30 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7%12]) with mapi id 15.20.3412.024; Sun, 27 Sep 2020
 05:51:29 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "palmerdabbelt@google.com" <palmerdabbelt@google.com>, Anup Patel
 <Anup.Patel@wdc.com>
Subject: Re: [PATCH v3] RISC-V: Check clint_time_val before use
Thread-Topic: [PATCH v3] RISC-V: Check clint_time_val before use
Thread-Index: AQHWlJCbTT3SAnzKQkepz4y0A+6P2ql7+ggAgAABU4A=
Date: Sun, 27 Sep 2020 05:51:29 +0000
Message-ID: <8aa476f17abde08d22862b2acdad091116aca54d.camel@wdc.com>
References: <mhng-0fd4eb79-05f0-49cd-8527-e5c74c65b7b1@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-0fd4eb79-05f0-49cd-8527-e5c74c65b7b1@palmerdabbelt-glaptop1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5 (3.36.5-1.fc32) 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4b51b280-1a4a-461e-e4ce-08d862a96184
x-ms-traffictypediagnostic: CY4PR04MB0568:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR04MB0568825248668378FBB41420E7340@CY4PR04MB0568.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 57q6pC6YPzBaofPMMiCEYG+CLrKifMAzX2iwWT3KHNNrbbBMs0FtDySlnwtGDzKuDk+sjBzODpogresF4S5N4iH7tCQEIal3QafIGgyIKYNfCG3g2TaFKraX2mcOMGvg4SDSAPE83v1p+1Tkod89wRFYeWPCiHDpf5gsf/nHAhYtaz5h2YReis7KEhv9VZ/RLSvHTQXf7bJ4kpdLtZ8kVpEPBTgk0/8EQ5knAJhuaJLiTl81mWel0izk/BfmJ0L7uLlqqTEbY87OfSLQc/JwMKOFASiJgi9QOyCnc6BRSKJFe5vZKfH36LiA7+Cj2prE2wVx0caei6JA3SSxpCgveRTpJ1BW4uj7nw2jwRiWYS0AWnJC0upioKh2STiquGda
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39850400004)(346002)(376002)(366004)(66946007)(66446008)(5660300002)(64756008)(86362001)(71200400001)(66476007)(66556008)(8936002)(8676002)(91956017)(76116006)(83380400001)(2906002)(6486002)(6506007)(54906003)(2616005)(110136005)(316002)(36756003)(186003)(6636002)(478600001)(6512007)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: JbRG50EMpqe2relkVLKFH0U4/yKuCld7UNf3Y4Xun7D50h9nTZLO+dzHrtFJKRTSCLqu0lrkW7kTPRmtAO0VA4bvHGNrM5J7J76CsmwOhERN8qXbHwPY2E+u7B+9k+86tA7DEKwPd1j8B2KP0XIfsi8YPUDspq6A88xJNRgCYshSqUXYOhpHnR8ZM6nTLvJbp+uOL4feFDTOgFD9mKiHHTsXOmwjTdJvTYxxjagg9mZ/wwg5XaipBF+hhnr8MhrSf2JOGovJHpdhShGAlfyw28BfCpEDQzmfn65S3QMaSYRFQew0jNe3UHZ04IAQeDrFnXVVrgFbPSkiX8yg4FOU6iYgN8RqnHqRlIbQGifTo3uw4S4W8bS8W1ybUsOT9/QjNW75ulrKXeVmPA7lcacWrzy0ZOTR+kigC+wNyk4UGz+LEbt/Zazud7dfZDOZ6qjxX3b5entnGF/f5XcsmN8gT2thMpSnsZh3+FJUvS46kb1+akEx5dK84D+8rJ5osuRAVAr1qUM64F79hOrtUzp44R7FQGNBLjcxqlBv/1tamk3x6YKP4PhVaQTDI0QcruolqXRaZvHJR2akRwxTK/hVhQMCEvqA6YgEf9syGpyGmOzzCz9Zypm2aOXBE5xWRG+q8zUQY9m1SLTlVPOU+xnk7RQ7paxVrnWDegsUukGoYWzZSqGip4VO/nI8FhEKMy6Bvy3KWNWWnkTA4kx+Mtyr9w==
Content-ID: <2798F362D3D0474482CFF322AE4D23D5@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b51b280-1a4a-461e-e4ce-08d862a96184
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2020 05:51:29.6200 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f9Mpjm6bBW2h/zUAmaQSJECxyGNGz4Z9W7PfSrhG7Ldkpq/o1oyp0hed94xojciYisTij7+wWtcA+8+iV6ejdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0568
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200927_015135_400354_9458F614 
X-CRM114-Status: GOOD (  33.05  )
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
Cc: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 2020-09-26 at 22:46 -0700, Palmer Dabbelt wrote:
> On Sat, 26 Sep 2020 22:39:16 PDT (-0700), Anup Patel wrote:
> > The NoMMU kernel is broken for QEMU virt machine from Linux-5.9-rc6
> > because clint_time_val is used even before CLINT driver is probed
> > at following places:
> > 1. rand_initialize() calls get_cycles() which in-turn uses
> >    clint_time_val
> > 2. boot_init_stack_canary() calls get_cycles() which in-turn
> >    uses clint_time_val
> > 
> > The issue#1 (above) is fixed by providing custom random_get_entropy()
> > for RISC-V NoMMU kernel. For issue#2 (above), we remove dependency of
> > boot_init_stack_canary() on get_cycles() and this is aligned with the
> > boot_init_stack_canary() implementations of ARM, ARM64 and MIPS kernel.
> > 
> > Fixes: d5be89a8d118 ("RISC-V: Resurrect the MMIO timer implementation
> > for M-mode systems")
> > Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> > Changes since v2:
> >  - Take different approach and provide custom random_get_entropy() for
> >    RISC-V NoMMU kernel
> >  - Remove dependency of boot_init_stack_canary() on get_cycles()
> >  - Hopefully we don't require to set clint_time_val = NULL in CLINT
> >    driver with a different approach to fix.
> > Changes since v1:
> >  - Explicitly initialize clint_time_val to NULL in CLINT driver to
> >    avoid hang on Kendryte K210
> > ---
> >  arch/riscv/include/asm/stackprotector.h |  4 ----
> >  arch/riscv/include/asm/timex.h          | 13 +++++++++++++
> >  2 files changed, 13 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/stackprotector.h b/arch/riscv/include/asm/stackprotector.h
> > index d95f7b2a7f37..5962f8891f06 100644
> > --- a/arch/riscv/include/asm/stackprotector.h
> > +++ b/arch/riscv/include/asm/stackprotector.h
> > @@ -5,7 +5,6 @@
> > 
> >  #include <linux/random.h>
> >  #include <linux/version.h>
> > -#include <asm/timex.h>
> > 
> >  extern unsigned long __stack_chk_guard;
> > 
> > @@ -18,12 +17,9 @@ extern unsigned long __stack_chk_guard;
> >  static __always_inline void boot_init_stack_canary(void)
> >  {
> >  	unsigned long canary;
> > -	unsigned long tsc;
> > 
> >  	/* Try to get a semi random initial value. */
> >  	get_random_bytes(&canary, sizeof(canary));
> > -	tsc = get_cycles();
> > -	canary += tsc + (tsc << BITS_PER_LONG/2);
> >  	canary ^= LINUX_VERSION_CODE;
> >  	canary &= CANARY_MASK;
> > 
> > diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
> > index 7f659dda0032..ab104905d4db 100644
> > --- a/arch/riscv/include/asm/timex.h
> > +++ b/arch/riscv/include/asm/timex.h
> > @@ -33,6 +33,19 @@ static inline u32 get_cycles_hi(void)
> >  #define get_cycles_hi get_cycles_hi
> >  #endif /* CONFIG_64BIT */
> > 
> > +/*
> > + * Much like MIPS, we may not have a viable counter to use at an early point
> > + * in the boot process. Unfortunately we don't have a fallback, so instead
> > + * we just return 0.
> > + */
> > +static inline unsigned long random_get_entropy(void)
> > +{
> > +	if (unlikely(clint_time_val == NULL))
> > +		return 0;
> > +	return get_cycles();
> > +}
> > +#define random_get_entropy()	random_get_entropy()
> > +
> >  #else /* CONFIG_RISCV_M_MODE */
> > 
> >  static inline cycles_t get_cycles(void)
> 
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> I'm going to wait for Damien to chime in about the NULL initialization boot
> failure, though, as I'm a bit worried something else was going on.
> 
> Thanks!

For Kendryte, no problems. Boots correctly.

Tested-by: Damien Le Moal <damien.lemoal@wdc.com>



-- 
Damien Le Moal
Western Digital
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
