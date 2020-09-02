Return-Path: <SRS0=c5hJ=CL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9449C433E6
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2020 04:36:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86F1920732
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2020 04:36:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kw2P6ATT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=osportal.onmicrosoft.com header.i=@osportal.onmicrosoft.com header.b="eN24dHDE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86F1920732
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=openfive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=va3XPPGc4CJWczMOXrJ0IQQmeiXtkOcEAzQo17wO/io=; b=Kw2P6ATTuCyPTZvKeN1OJ2Fkl
	KxRL7mRenZQ8mnPvTbBcx/AAUy/bw5h9Yw19p//nDmE3C7p7JgXY+0gj5VspG8yGPKA/Og6YI1OMy
	6YtzL6bCSHDaZHMKhVby+pApyRfc1Katv6Brc6aqtqvffjAE4nfhiO1m0rIKPImkCQHp4wRSSgFoC
	3jw9+BapP5lycbbHYoFRb8yFQ7Bc7123nQ8JEZVQbO6T1Cs3NzCWvTumNkJ14dg3qKTfB1h+s4KUU
	WhPhe/lnLiIatO9CCQ0WjAdlqhCrId9pyLInESEfagyXq1HyyhAEEdU4h2bbmxcu++waCoKIFBHHo
	Eln9RQC0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDKVV-0003tu-M8; Wed, 02 Sep 2020 04:36:25 +0000
Received: from mail-co1nam11on2055.outbound.protection.outlook.com
 ([40.107.220.55] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDKVT-0003tE-Ce
 for linux-riscv@lists.infradead.org; Wed, 02 Sep 2020 04:36:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Thp0PU7DSdHbEa1lr4Ei2/nq2wkzEBx+gjkbbV28rN9uL587ZmpqTOJzX/ChI/LpNowbY2/YVvVDWxg3z0Z0DfHCnK5cNInm/uqwxwONZ70zydNodZmwtT3itH6TEzma4YP+sdXRgD3P5RE5wguR+cUbIXLBh+F/kl/4MJ3yiFJ7eqdply6xo5PHrFf8HORNtGCnPHed1uteeUm5BF+M9e3P82iUAAG85vk1a9Zqqd2u1zMdErnvolAQdQZpnNObFpQ4OztQQkykCY+uY3ZtCeX2RLsjwaMUoIvs47PArGuv9RdAklXQSOCLaQ9tCmqXMUAeiMaHFL7uRbnhumQkTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXv7ZY3pu6bvIgpCjSENRLdfMeccFkJPTGtOJwhnx6Y=;
 b=bAli5Lksmq0ZQ412o0e9FSrh3/nj+Mh9npLUXOcXp2YjPNZOQQ0SLlnBajOOqqxjDjVuHRI7MPWRxmiLKDFmeTCbOKv6NZs5IzPQOZbLta5Rkw75ZTYdPeMezfACgvyf1jHnbHrlC2/xR+CIwMj+OaD2pc/2VJ3Dyg7WskyC9NjRMG9m3N63zzl+ngshFDEv9JjYZijfg/Zs1G3SXfWiwqweq7iNpuupi3btf4abSwP47HkqO1nhiuuQSunNtZDBt+h2wap+PRaz+d9dQutPGc0zkaUhOx+HCg4XpFdZCDgx3j9/7htJsh9zEns6py/1MNd68a5UxYTfGPO7UIg8xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=openfive.com;
 dkim=pass header.d=openfive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=osportal.onmicrosoft.com; s=selector2-osportal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXv7ZY3pu6bvIgpCjSENRLdfMeccFkJPTGtOJwhnx6Y=;
 b=eN24dHDEqYB4OEXnQxKWnGkmSs8KEn6/1m/taOqOHU+XBmB1RJ8jCjJnk38HTPwGOnHwe4Jb3SrxKSjlRlckC+MLhMDtKBXG5cPk0m8WVTarUXYUApag/dzE327bikqfRsFXB5fjYxo+DH61NyKE29CiHE56U3436Hio6iI5vuo=
Received: from BN6PR1301MB2020.namprd13.prod.outlook.com
 (2603:10b6:405:34::34) by BN8PR13MB2658.namprd13.prod.outlook.com
 (2603:10b6:408:8d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.6; Wed, 2 Sep
 2020 04:36:16 +0000
Received: from BN6PR1301MB2020.namprd13.prod.outlook.com
 ([fe80::a446:9877:b346:93ad]) by BN6PR1301MB2020.namprd13.prod.outlook.com
 ([fe80::a446:9877:b346:93ad%5]) with mapi id 15.20.3326.025; Wed, 2 Sep 2020
 04:36:16 +0000
From: Yash Shah <yash.shah@openfive.com>
To: Borislav Petkov <bp@alien8.de>
Subject: RE: [PATCH 3/3] edac: sifive: Add EDAC support for Memory Controller
 in SiFive SoCs
Thread-Topic: [PATCH 3/3] edac: sifive: Add EDAC support for Memory Controller
 in SiFive SoCs
Thread-Index: AQHWetg9bWAU/X2EEUCxwoJcYxGZSqlR8k2AgALb+6A=
Date: Wed, 2 Sep 2020 04:36:15 +0000
Message-ID: <BN6PR1301MB2020B40D95C82FB12940FA10822F0@BN6PR1301MB2020.namprd13.prod.outlook.com>
References: <1598357182-4226-1-git-send-email-yash.shah@sifive.com>
 <1598357182-4226-4-git-send-email-yash.shah@sifive.com>
 <20200831085203.GB27517@zn.tnic>
In-Reply-To: <20200831085203.GB27517@zn.tnic>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: alien8.de; dkim=none (message not signed)
 header.d=none;alien8.de; dmarc=none action=none header.from=openfive.com;
x-originating-ip: [103.109.13.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd2651f3-7d3a-427c-08a5-08d84ef9bb11
x-ms-traffictypediagnostic: BN8PR13MB2658:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR13MB26583EFC94A2C46DE4FB97D2822F0@BN8PR13MB2658.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: clz3UYKbMRB/Iye47srXIbqBSG6QgSJ5hHXyok6Su3aKB980nmZJfrmxv3oow+chhJYU+gCsSljbsLbvDuP4xSZxxxo2UEZqZblv/bHR53PMa25UglnNy12xF1nbpS+AmWF7n0vBuLxDb8ToiVIaz5vYyvHnlEYsrKKK8Hj2NCJSVFMWQp+EeI3KyZseKKahAq56R9zerPz/a7fBdS1gCyLsLqQGrpMhBPYVOiNDMYMBoO4RLbaHjsehinyEiREm86A7loi/u1LFiFWyzA3cENl9rpHvSI/m90nH7qklxo/hbW/IdJ7LLzWLnvAnZaBSWGYVqj/5WOf3TfvC9hQwrmLLbB+nhtlHoBQCH/r+QFvI4JcXoYZHQ9QDtcBDsRcgqeJorw1JD6saC50QIL9QNQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1301MB2020.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(366004)(396003)(376002)(346002)(136003)(39840400004)(83380400001)(7696005)(2906002)(6506007)(26005)(52536014)(5660300002)(86362001)(478600001)(44832011)(107886003)(8936002)(8676002)(9686003)(53546011)(54906003)(7416002)(186003)(33656002)(76116006)(316002)(966005)(55016002)(66946007)(66446008)(64756008)(66556008)(71200400001)(4326008)(6916009)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: rcoKVwtOSdhOHl+W7U9JFCMg5dHjIkqK5ZxgTVNbroYjJ4+glLWj81Vtw8ETov3n4c/+ZzcHr3kzFZRceTF01ccjuD8bx3Hfnf48APSQqgp6iSHsWWj+E4eu1BbIDZpR6gyrRytrJY/8wfQqHIjXKKwqWRTtRFr9YhEfbl51/Bh8ep4/Llamd4WIMvlQHRDmnXQ40IfOuR41pQosILRo5h49a9Cxu6zkkyRh+RlCdjRGy+fZ8nzkx8JMC7mE4/kjWIEDqtnc+VN4Z5Dm6hV/R/ZtxBJKQzjtP0sYG27iIr15arOw0gjbTFpkfoTk2t4k/hvf+aBQQ6w+VrScUzVne6eEymZ8ELghGwP3aZvyBTZKAVepQP+kl1LZQpGaPr9C52z0B348NWS9YUIqAEe0BZbMCQzn01O3wS1wOpup5jmtots541J1vmp8vOsVK5M+DSXQVl2Q6Bwncy6Mi0YbBKVfIFyrc1bOC8U0wU3oZY119j7wRzurb/Q/+mQGJlGVyRq2d0JuinQmji75IJ/Eqq1qgIpvfuGn3r0YHQAPPQqmvYLyW82FxMQ8vbyo5cjozmYucrwOUcGixw7WzgZNLqf91wQbyVjze7L0uS5Rw936bSFcudhHwui8Cqwvqo/xbmZcgtzfW4MZe2RLqxkueA==
MIME-Version: 1.0
X-OriginatorOrg: openfive.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1301MB2020.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2651f3-7d3a-427c-08a5-08d84ef9bb11
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2020 04:36:16.4124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p9Q+PkSZxxS+xmLPM0p3nQ6h51KKFhaWJZgR3bd+Du6rpTfILTVQ+TgO9tXIUxLgSrjw3IgJx9GCtGegyAJiBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR13MB2658
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_003623_551303_ACEF131B 
X-CRM114-Status: GOOD (  25.68  )
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
 "tony.luck@intel.com" <tony.luck@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rrichter@marvell.com" <rrichter@marvell.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "Paul Walmsley \( Sifive\)" <paul.walmsley@sifive.com>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 Sachin Ghadi <sachin.ghadi@openfive.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> -----Original Message-----
> From: Borislav Petkov <bp@alien8.de>
> Sent: 31 August 2020 14:22
> To: Yash Shah <yash.shah@openfive.com>
> Cc: robh+dt@kernel.org; palmer@dabbelt.com; Paul Walmsley ( Sifive)
> <paul.walmsley@sifive.com>; mchehab@kernel.org; tony.luck@intel.com;
> aou@eecs.berkeley.edu; james.morse@arm.com; rrichter@marvell.com;
> devicetree@vger.kernel.org; linux-riscv@lists.infradead.org; linux-
> kernel@vger.kernel.org; linux-edac@vger.kernel.org; Sachin Ghadi
> <sachin.ghadi@openfive.com>
> Subject: Re: [PATCH 3/3] edac: sifive: Add EDAC support for Memory
> Controller in SiFive SoCs
> 
> [External Email] Do not click links or attachments unless you recognize the
> sender and know the content is safe
> 
> > Subject: Re: [PATCH 3/3] edac: sifive: Add EDAC support for Memory
> > Controller in SiFive SoCs
> 
> Fix subject prefix: "EDAC/sifive: ..."
> 
> On Tue, Aug 25, 2020 at 05:36:22PM +0530, Yash Shah wrote:
> > Add Memory controller EDAC support in exisiting SiFive platform EDAC
> 
> s/in exisiting/to the/
> 
> > driver. It registers for notifier events from the SiFive DDR
> > controller driver for DDR ECC events.
> 
> Simplify:
> 
> "It registers for ECC notifier events from the memory controller."
> 
> > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > ---
> >  drivers/edac/Kconfig       |   2 +-
> >  drivers/edac/sifive_edac.c | 117
> > +++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 118 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig index
> > 7b6ec30..f8b3b53 100644
> > --- a/drivers/edac/Kconfig
> > +++ b/drivers/edac/Kconfig
> > @@ -462,7 +462,7 @@ config EDAC_ALTERA_SDMMC
> >
> >  config EDAC_SIFIVE
> >       bool "Sifive platform EDAC driver"
> > -     depends on EDAC=y && SIFIVE_L2
> > +     depends on EDAC=y && (SIFIVE_L2 || SIFIVE_DDR)
> >       help
> >         Support for error detection and correction on the SiFive SoCs.
> >
> > diff --git a/drivers/edac/sifive_edac.c b/drivers/edac/sifive_edac.c
> > index 3a3dcb1..cf032685 100644
> > --- a/drivers/edac/sifive_edac.c
> > +++ b/drivers/edac/sifive_edac.c
> > @@ -11,14 +11,120 @@
> >  #include <linux/platform_device.h>
> >  #include "edac_module.h"
> >  #include <soc/sifive/sifive_l2_cache.h>
> > +#include <soc/sifive/sifive_ddr.h>
> >
> >  #define DRVNAME "sifive_edac"
> > +#define SIFIVE_EDAC_MOD_NAME "Sifive ECC Manager"
> 
> s/SIFIVE_EDAC_MOD_NAME/EDAC_MOD_NAME/g
> 
> like the other EDAC drivers.
> 

Sure, will make all the above suggested textual changes in v2.

> ...
> 
> > +static int ecc_mc_register(struct platform_device *pdev) {
> > +     struct sifive_edac_mc_priv *p;
> > +     struct edac_mc_layer layers[1];
> > +     int ret;
> > +
> > +     p = devm_kzalloc(&pdev->dev, sizeof(*p), GFP_KERNEL);
> > +     if (!p)
> > +             return -ENOMEM;
> > +
> > +     p->notifier.notifier_call = ecc_mc_err_event;
> > +     platform_set_drvdata(pdev, p);
> > +
> > +     layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
> > +     layers[0].size = 1;
> > +     layers[0].is_virt_csrow = true;
> > +
> > +     p->mci = edac_mc_alloc(0, ARRAY_SIZE(layers), layers, 0);
> > +     if (!p->mci) {
> > +             dev_err(&pdev->dev, "Failed mem allocation for mc instance\n");
> > +             return -ENOMEM;
> > +     }
> > +
> > +     p->mci->pdev = &pdev->dev;
> > +     /* Initialize controller capabilities */
> > +     p->mci->mtype_cap = MEM_FLAG_DDR4;
> > +     p->mci->edac_ctl_cap = EDAC_FLAG_NONE | EDAC_FLAG_SECDED;
> > +     p->mci->edac_cap = EDAC_FLAG_SECDED;
> > +     p->mci->scrub_cap = SCRUB_UNKNOWN;
> > +     p->mci->scrub_mode = SCRUB_HW_PROG;
> > +     p->mci->ctl_name = dev_name(&pdev->dev);
> > +     p->mci->dev_name = dev_name(&pdev->dev);
> > +     p->mci->mod_name = SIFIVE_EDAC_MOD_NAME;
> > +     p->mci->ctl_page_to_phys = NULL;
> > +
> > +     /* Interrupt feature is supported by cadence mc */
> > +     edac_op_state = EDAC_OPSTATE_INT;
> > +
> > +     ret = edac_mc_add_mc(p->mci);
> > +     if (ret) {
> > +             edac_printk(KERN_ERR, SIFIVE_EDAC_MOD_NAME,
> > +                         "Failed to register with EDAC core\n");
> > +             goto err;
> > +     }
> > +
> > +#ifdef CONFIG_SIFIVE_DDR
> 
> It seems all that ifdeffery can be replaced with
> 
>         if (IS_ENABLED(CONFIG_...))

Yes, will replace all the ifdeffery in v2
Thanks for the review.

- Yash

> 
> Thx.
> 
> --
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
