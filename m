Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848CAC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Mar 2022 08:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YKu52+/OocAVal0Apnnajw8usn2y50kHHhvOxx0V8ZY=; b=Gb4vrvdcwE1Jk5
	nXiDvuhGude7ZzTjAzIwjxrRGWzPZwagEnML5Ls9qT/TeGYlBH7uvbbSdiVwSiLwWTf3tKQ9jnf+i
	mI3+Gha0lkS7laArLgk9inyEUvx47fnSYEKhVhdgVJy2gaFEmqjQvYTmtQCZrp0+RtXx8aKwmPOik
	vwoqjrAozC78l1Nv8yCK4xJlivWdyCfEXHf4hRLNu6CJg8QUYTDb4nc+9wUgjH2KXSx1OSbWSTuOf
	V+5LMMsq7PpE0Pqvvz2vW0XlIzlTTS030xht2+iH+ZFWbe28UTX+kwTn/jYghXUNc1psIUpRhYgyc
	mPL3x1sV/UwmAJLWWnRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOxte-00Fanw-NB; Tue, 01 Mar 2022 08:30:14 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOxtb-00Fanb-IQ
 for linux-riscv@lists.infradead.org; Tue, 01 Mar 2022 08:30:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646123411; x=1677659411;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ZEnnT60A58FLUfry5ybJWPNZCROqTCK+dPcM/iE2l1I=;
 b=iC3pKFSCRY02g/2Q46LHY8mpYTtSdLZJkxxDhBoOARSlGJUJeg2Jrv1D
 fILJhLhapRwb2w2kFggo5S6S2SrYa0bTWwB7ssRoAWa9wNEeST+pOVNAb
 tRLLdrA++XJNB8Wxd2sUP0GIz+WJa1fajQJLYRZYRvn5H56b9WUHvol8s
 /JmGHTyJW0CRLxmF/KG18edpxtWg/c3R8AnmweC7piAPzGvatLQ4UaNN7
 eqUIhRpDB0xefgHJ3TQmiSueQwn2soNctAytFekzCvUO0yGbxBJydlUY3
 VghGpmbAp+dWdRRm4/ZtcJ8xORpXj7XzYiCdth7Ew6KdDFWD1GpgOzW3D g==;
X-IronPort-AV: E=Sophos;i="5.90,145,1643644800"; d="scan'208";a="199019030"
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
 by ob1.hgst.iphmx.com with ESMTP; 01 Mar 2022 16:30:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UkpeyCo3WrXP6htogoYNPycZ7YEdc+W00uBhsgncfMR5FMP+4m3tPfzjWyoTCU8fj0dusbHQ1p4ci7+CLSFldEI5LEbnuAuDetB2mV+s7v0IFupu7N+D8rKgWaT+BHvhA8m1/rnHqQD+FBXLcUiHLi88IE5l2HmMvof+fQ5zGjt8eKTuN5rhEbRyrjGHLFsG6CBiMxweMku2Y1D4ltNfikpda2I7uLfqBxN8Bf2LscAwMgIKoO+2tfSL3cNBhaU7e4OPiEwlCcNp2qyQFTYGxVb9Vk7qtj51zBWJsEY2XYHeg9PHjrVTqRRogoI9K9XbCepkMiianjGd6h9dHKI/ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMqHPY2M7X/s8/dnDfuqTlpAEuNBLmx/jAvayqzCFbE=;
 b=br9rBQePtaUTOZ5N+AuSiS1KX5f7IEPS56XznixfwGLPSt6lb3bVJoHgDgyMt838LQDY7SBdZ3888Vb5CpSgytYVyTcmeyXo0wTxB/avbPPgLDe89A5qSeWSJGQubwsSnrgTVx8f7A8QOMtXIohHdNI6WTtN1+XF/78cf6M9L7Bv3SztvrKrNwFis6L6HMVOFsOVKpj5MkGUb1EjVO6FY04Q+7zdxEp2EtjldoTaWzfyB3PklVnGu7G8Q+rfOAgxdrPYPFTId2HtFtWQ8Ij5ei4hHo2fzyA8ceEHyKdDce+dEOXr9ftpFD8DcJtSS5D/roja9UAa6d4pbH1UukRKVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMqHPY2M7X/s8/dnDfuqTlpAEuNBLmx/jAvayqzCFbE=;
 b=LPBQMWqFLYdRJZROFSWJlSr/44gNOXLctbU2BvFkHlmTYcChhLu3fsH+vh82n2Ic0h0qF1nEd+0d6CCk+oI+Nj9IXIgC1yBNxudRUaVUnxWKqmi3cCPLwMfifwGtRFxv80Jk5ZMBrAV8QFiUDynY5XPFt4g6QUBz/1iDWUOg//I=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by BN8PR04MB5697.namprd04.prod.outlook.com (2603:10b6:408:77::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Tue, 1 Mar
 2022 08:30:07 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::f025:4f23:8e46:b2ed]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::f025:4f23:8e46:b2ed%2]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 08:30:07 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Anup Patel <anup@brainfault.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 2/2] irqchip/sifive-plic: Disable S-mode IRQs if running
 in M-mode
Thread-Topic: [PATCH 2/2] irqchip/sifive-plic: Disable S-mode IRQs if running
 in M-mode
Thread-Index: AQHYLQaLJPTWpQA5XEukD59TAjASOKyp7LcAgABGVwA=
Date: Tue, 1 Mar 2022 08:30:06 +0000
Message-ID: <Yh3ZjqTbdDK0dQSt@x1-carbon>
References: <20220301005142.3038702-1-Niklas.Cassel@wdc.com>
 <20220301005142.3038702-3-Niklas.Cassel@wdc.com>
 <CAAhSdy0c4Sn=44mwpghpj54jmdHPePXynWQqQDtGM4p0XLj19w@mail.gmail.com>
In-Reply-To: <CAAhSdy0c4Sn=44mwpghpj54jmdHPePXynWQqQDtGM4p0XLj19w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aed0721d-e13c-4cd0-63b5-08d9fb5db107
x-ms-traffictypediagnostic: BN8PR04MB5697:EE_
x-microsoft-antispam-prvs: <BN8PR04MB5697185131BB276832181805F2029@BN8PR04MB5697.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p7bVFZh/vpy5xo1SQcxidTX5YC8VaSxyjvF8CZb36xNjZ6Nbh2ef8TQCwei1ooVDQg0hn+1qD0nJaCxaWjvSQhdvOswgch0L0eLwRCfkeT3niH2AhLBqD6STeWbhoGlGq+wkTajap8a11KfOvxwuv7YoHxfqrC9aKRFyQZRwcGq+x/Lro/WSOFY7nvJCLGI6tYc0eP9N1/F3mPYqWXslJuEDf+lFxQrJOB6fYtKWkl3GFANo/bt2M0KbkK2rb1/hvlsrPy03Tv4xlEd8YU5lqJ6Ai3Wyg1kba0JktBBfIqk8634eIfsvU9Ar03CVze5XGhVFEkwndyy2bB7WMxQhkoZaVdqYeM7O6XLZoCyfzZ9AluquEG2nfjpOh1jEQq7D6yYwFZX2L5UT8AvRCrZ2pl/cQRqGjE/pOkQKrwhVPikjjGA8ZTIpbNKYTkCZ8my9gZLhuEBm0IgEqq3sYCsXnBHJ/l7SYPhFrsvv1ol/RaolmqSD+mR9KUJtsbyTD+SJ4o64tNyf3EK0Z5c7T+5oNyPfCGME2Xo32O5yzy1RCbQgHQbCIGT+NNIwXXafAx5jIbjCVCiL0rt/hFRJwmZ2w/ElGQ6SeapVPLag1bwCKUbjooYSSHGqsmUDzMHAbw3nNd5hx5txOiSC+nQeyQkzBKCSjprJ72J+3hd0eq7Ds1lKSkX55zDZS47CBQiB2KKp/ELBaPrz1vRVsE3oljooTQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(7916004)(366004)(508600001)(38100700002)(82960400001)(6486002)(4326008)(8676002)(66556008)(66476007)(66446008)(64756008)(66946007)(5660300002)(91956017)(8936002)(6916009)(54906003)(33716001)(38070700005)(86362001)(316002)(76116006)(2906002)(122000001)(71200400001)(83380400001)(186003)(9686003)(6512007)(26005)(53546011)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CRPh6m6wXLhX+2zlr7X/g4zb25dmoPl2YJnlFMulmKW+jnywvLN5ZWhN74Uj?=
 =?us-ascii?Q?jj81xYv/Mzc4/ASP5beugJuQO6G1nRPva+9s9AeixMcCuUzf3gnBJQeJUGhY?=
 =?us-ascii?Q?CzERuMc+0/V9IBN3JAx2YIf++lc7mzH/lEOGiH1cA+T2l12TGqd4ZmbrXeEx?=
 =?us-ascii?Q?Ik6pLqS2/jc3Jcho/GLy2VEqcTCmpUZ7SxBSc9YblwLa40IE6/xRBQ03yGKL?=
 =?us-ascii?Q?z4DjX4pQT/VvUwqo5fEq/nIbaheLPo9OeKStfF6ZQPdTyjyq7zTrmRMunFuv?=
 =?us-ascii?Q?ysUX0MIf4FXKjT/qqnNYNTLnYcplakmT6HAs65J2yf8E6KQD+0wxl1jHGFdi?=
 =?us-ascii?Q?hEB1nLtyIDlwwMqq+kd6nwCU28ju9/YF9u0d/48/a/n2N4fodJ+IO3667w7b?=
 =?us-ascii?Q?VuEyds0qaRz7eYr57DN07QxrbQlXo2oKwS6GK4qegJAq/gPVD8+n4KtN5Uzg?=
 =?us-ascii?Q?XiPwDhZ8J1EnLLXDv4c2x8HnlEoWvxmcWGTrC9bntoiulGYhSYdRrzqNCDXB?=
 =?us-ascii?Q?Nj5OUrmdWbCimTtWa3uaQarWSt+Sb9EMsYQssGdyqe0Axnpns474V5OVIS+4?=
 =?us-ascii?Q?MT4MrBegSZXOddYv3VE2S4y1nl1XsHHBlcFPmUGqi2+oVwAVy4TkEQTMVgAO?=
 =?us-ascii?Q?qPZHlvllN92RRRJq2t8rNNrDHWgdM6y6SPVNTUqAkScV77J97v2TpUYeeqHG?=
 =?us-ascii?Q?Lh0/ThCzd0HNkJYWKgfz0ucJyhK7kHX7JHx3F0j1UbXAOvsBwWaHL3DOESI4?=
 =?us-ascii?Q?VtUwVf37Md+5SXrhCQgnryL2+TkkkHIV5iZnWFy3YiZfNmzRZ4+P07/CcU9E?=
 =?us-ascii?Q?8lnSC60XdNUOfKGST2u8BF6yfxLUEeswGSCAAyGswJkassPlDckzDj2sIjOR?=
 =?us-ascii?Q?N5t+ttS8sSM5JgMUB9hnEQDzFxWudBhhg8c8sg40Mdy7H8v+Ttjlk1o4t61h?=
 =?us-ascii?Q?8d8cQObl60VMJyNNQMHVyOzSZ78AF1R70E6mP29Aa+FKUyOiTCTUodwkdD3h?=
 =?us-ascii?Q?Vlc6K4VQYaLBOr4M4s0AgeIErzZRMITyQ75ea0nW9CtYKUrA0p1H36UMP3hB?=
 =?us-ascii?Q?Js8Kt+3u+QvSjZhufsDoFTxGsrfnD2cwbRmfCuESiJWyTGt/akwYllJRA5wI?=
 =?us-ascii?Q?t2fSbmZLzCsCxaUU9DzG6Z8edz9BaOiFuX4MyUJY+f1RCJQfuPwKPJ+t2ZVP?=
 =?us-ascii?Q?Zu+h81Oiu0v+LmOoj5YWud/eQVCkbfF20z89FHXcDVBXBotmB/JwQXoMfc6T?=
 =?us-ascii?Q?KhkVvwqFR8z1BKfMMXV3CBMLsdB7CD5xxQ2rjBV6OcfyJGkMdG+vFPGt2wPp?=
 =?us-ascii?Q?AJLcCM5ap0KX+NxWopccWfrZRawKXGMVPk8gMtfZ0XqAdVkz9OVpQ6FM7oJe?=
 =?us-ascii?Q?ZHuAO7gyRzJqZ4wIWYtjYN+0u3AT1tjeJ5VEnOOqYZZqga8OQH3tTOxHkK84?=
 =?us-ascii?Q?I/VwamZMjNtPWPRVOD3avPOVBfAKwfCOLVrOdT5DTfGbAqNv7DpUe/TruSOT?=
 =?us-ascii?Q?6CDe7KglGHiOQk4sb+/oHa8TAl68Ca/m27ETCjvcrI3WlBkBh/RWRgMW+2bx?=
 =?us-ascii?Q?5c7UBhwOFCLvCjrM+FU4m+23/u9rZGVhn/WgR6boGgz46UIFlc9Lh3DM6ryX?=
 =?us-ascii?Q?7M1k6HG6gNXmQhP1UkKo8yk=3D?=
Content-ID: <9C7E934878587F42B50AFB0DFB3C9F53@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aed0721d-e13c-4cd0-63b5-08d9fb5db107
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 08:30:06.8812 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bp7epc/dDKVdUfXdANlwxSejIseck8/iDO6x3eYDXy7Cu197L45qDGiWB7Db2iXnmKE5TtmV2NItCvQh5X7kTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR04MB5697
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_003011_691295_C29932D5 
X-CRM114-Status: GOOD (  29.93  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
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

On Tue, Mar 01, 2022 at 09:48:20AM +0530, Anup Patel wrote:
> On Tue, Mar 1, 2022 at 6:22 AM Niklas Cassel <Niklas.Cassel@wdc.com> wrote:
> >
> > From: Niklas Cassel <niklas.cassel@wdc.com>
> >
> > When detecting a hart context for a privilege mode different from the
> > current running privilege mode, we simply skip to the next hart context
> > register.
> >
> > This means that we never clear the S-mode enable bits when running in
> > M-mode.
> >
> > On canaan k210, a bunch of S-mode interrupts are enabled by the bootrom.
> > These S-mode specific interrupts should never trigger, since we never set
> > the mie.SEIE bit in the parent interrupt controller (riscv-intc).
> >
> > However, we will be able to see the mip.SEIE bit set as pending.
> >
> > This doesn't seem like a good default when CONFIG_RISCV_M_MODE is set,
> > since in that case we will never enter lower privilege mode (e.g. S-mode).
> >
> > Let's clear the S-mode enable bits when running the kernel in M-mode, such
> > that we won't have a interrupt pending bit set, which we will never clear.
> >
> > Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> > ---
> >  drivers/irqchip/irq-sifive-plic.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > index 211bcb10aa93..46caeb11a114 100644
> > --- a/drivers/irqchip/irq-sifive-plic.c
> > +++ b/drivers/irqchip/irq-sifive-plic.c
> > @@ -326,8 +326,19 @@ static int __init plic_init(struct device_node *node,
> >                  * Skip contexts other than external interrupts for our
> >                  * privilege level.
> >                  */
> > -               if (parent.args[0] != RV_IRQ_EXT)
> > +               if (parent.args[0] != RV_IRQ_EXT) {
> > +                       /* Disable S-mode enable bits if running in M-mode. */
> > +                       if (IS_ENABLED(CONFIG_RISCV_M_MODE)) {
> > +                               struct plic_handler tmp_handler = {};
> > +
> > +                               raw_spin_lock_init(&tmp_handler.enable_lock);
> 
> Creating a dummy plic_handler over here is a strange work-around.
> 
> Please define and use
> "void __plic_toggle(void __iomem *enable_base, int hwirq, int enable)"
> over here and in the plic_toggle() function.

Hello Anup,

Your suggestion sounds like a cleaner solution, will fix in V2.


Kind regards,
Niklas
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
