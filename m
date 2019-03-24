Return-Path: <SRS0=PVrh=R3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDA4C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 03:04:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67F302175B
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 03:04:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sEVFW5pk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="cO6Ewxh+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="CV5P0m45"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67F302175B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iMK4177nFLayfqY98pgH7VOd+UoH1RuelFpl9ztYxNg=; b=sEVFW5pkTL8VPN
	3/zUp4P42SzJapEqwXTRSrRtcml6k4V2RS4akPlRYnGhEadrYMcEjhVZyyjUYS2ZJtAZHK9FA9pMd
	+toZTE0tKwXlCKdS3/apBMy1e4dJi1wkebeCX+ncD355zL1U4KEijSxjJIIzt+FRsarP714SYIG7X
	dkufh99A5T/+juRAPzAKTAOeI5FnOD32Y5G6cpmIaTZtI8HTN9aq0BSG2gfXqQfM+2qb5MpzkUAZx
	6SAucyQ4InhknF/+ADT6s10H8WrPaUzPq748cVJzUAwu4kzRxzds6b2m4cAEBL91s8tYM/5BQ2Nto
	d09UT33+LvhVe1s1zWPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7tRG-0002sI-7j; Sun, 24 Mar 2019 03:04:46 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7tRC-0002rt-3s
 for linux-riscv@lists.infradead.org; Sun, 24 Mar 2019 03:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553396697; x=1584932697;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vdAe3GYRD/ixyIcKdl88BlozCxJ5ow/QhCMdxCRDOUo=;
 b=cO6Ewxh+Ki+TfzBKgWPqVVwELHYREUcZg9JOj7cxNJ/i8qXmCxFPRzSG
 28CRpIACuiV18OkmqDVM4PNYrgeXxExvA3AqqiEmjEWkrjG/5wjqlrjxM
 6tIzcbPoVH0AYO4wubc+bhEojCR1XavSFqzNxZa4e9UEeCejiJYdtxdAM
 EMEVSyAc8Ac5GGUlPtg3HgS3ivMC/Q83quHJyl0nDlshEkDmFPU6XPBDE
 aXrw3+m21XC9ErNhcklQz8xHEtS4TRsHBpvalVHdjHsygw0SO4jBlIr+g
 jnGGJYGdsBEdOkbi+060JZ0R+oDBQiFowrKTLAlg15AsLKTcfB2cYthju A==;
X-IronPort-AV: E=Sophos;i="5.60,256,1549900800"; d="scan'208";a="202806498"
Received: from mail-dm3nam03lp2058.outbound.protection.outlook.com (HELO
 NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.58])
 by ob1.hgst.iphmx.com with ESMTP; 24 Mar 2019 11:04:43 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdAe3GYRD/ixyIcKdl88BlozCxJ5ow/QhCMdxCRDOUo=;
 b=CV5P0m45xC3pte3sj3sqiKqwtwa37g/lPb4tE6aqII/x+0m9iVw+AxOlVL7wiOULNDw+uA0MyhJQ3u5a1AjeiyNrQpgQ08q76WXFGpmaMwDL3YGFsaN32rUQ9fAXBNnJqfRfMUFuryRTfU8V3LRgf87BV0B8PP3jcUJ+kc19UjE=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5760.namprd04.prod.outlook.com (20.179.21.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.15; Sun, 24 Mar 2019 03:04:30 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::d197:7b59:7e0d:e819]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::d197:7b59:7e0d:e819%4]) with mapi id 15.20.1730.017; Sun, 24 Mar 2019
 03:04:30 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Gary Guo <gary@garyguo.net>, Anup Patel <anup@brainfault.org>
Subject: RE: 32bit kernel is broken for Linux-5.1-rc1 due to GCC cmodel=medlow
Thread-Topic: 32bit kernel is broken for Linux-5.1-rc1 due to GCC cmodel=medlow
Thread-Index: AQHU4HbRRt1xebbFa0GNmFRx8Wse76YXduAAgAAtwQCAAAM6gIAAAOiAgAABXoCAAc7CgIAAi8OAgAAD+wCAABKN4A==
Date: Sun, 24 Mar 2019 03:04:30 +0000
Message-ID: <MN2PR04MB60616EB42DD1C0E45F8908278D5D0@MN2PR04MB6061.namprd04.prod.outlook.com>
References: <CAAhSdy0mUboGJH_GJbsGFBwcukjttVQcTGfzwkaMFQb9ZVY4Mg@mail.gmail.com>
 <20190322104209.GB24367@rapoport-lnx> <20190322132556.GB19263@infradead.org>
 <CAAhSdy1VS8-3npcZUzjicnKGsjHcc6WH3Co6Hx2=GvttoatWcA@mail.gmail.com>
 <20190322134043.GA18818@infradead.org>
 <CAAhSdy2qbU1uhnVQvh0C_FOoKDy-Y0ZTUryAKD97xAXXGQSdCA@mail.gmail.com>
 <20190323172153.GA9085@infradead.org>
 <CAAhSdy07GsHXpG9MJZ4aiB5uG7D+9RA+17Nb1MrWdFg9ee6rUA@mail.gmail.com>
 <LO2P265MB0847CF97521DEF5AB0EA7B21D65D0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
In-Reply-To: <LO2P265MB0847CF97521DEF5AB0EA7B21D65D0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-originating-ip: [106.51.22.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a98f6fc-8428-42ed-d8ed-08d6b0056f64
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:MN2PR04MB5760; 
x-ms-traffictypediagnostic: MN2PR04MB5760:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB57603B705D47A041237A3A0D8D5D0@MN2PR04MB5760.namprd04.prod.outlook.com>
x-forefront-prvs: 09860C2161
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(346002)(39860400002)(376002)(136003)(13464003)(199004)(189003)(25786009)(8936002)(9456002)(256004)(74316002)(305945005)(52536014)(68736007)(71190400001)(2906002)(9686003)(4326008)(478600001)(81166006)(229853002)(66066001)(8676002)(81156014)(55016002)(72206003)(7736002)(14454004)(6436002)(53936002)(71200400001)(6116002)(99286004)(6246003)(105586002)(33656002)(4744005)(78486014)(5660300002)(3846002)(26005)(86362001)(186003)(93886005)(476003)(110136005)(97736004)(54906003)(55236004)(102836004)(11346002)(446003)(76176011)(486006)(7696005)(53546011)(316002)(6506007)(106356001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5760;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sPsI3zORLCeJBAomufDXnMN9e0yTo6NZe0MD65I9dE1OzvLFOQsKgmuFPIGHYdEGWvPQqhLFPUPPgDL1S+DrI8VerPZUiS4Y6TKZnYAQasblp42fNtYQNfHdWGwL69ayJ6tyMXQDs2yDSMmycblOcIvzUuK9raW09J+9ck6YHM+c+8H7cUFHd648PjehfOpArN2GTQL17aN1Sndv6QDbJ/FnXh1OoviIxXKOGmX+Md9KSelonSXxWGnG+bfAWRGIJ6oPUu7qYFN25K+3ZPVgtHNcmsS24gEHdwhOxzGCBh/KAiafGIiUB2vqz7aNRGF6ybOVFpP172lFarLhZA4Pvp00wCXF+D/4Q6bz5XYAj4Rw3WV5d2lj7llVghHNn3SFbGl52V+JIl9ZH9Jm8dVlC5DuTkzgNbZCqG5N9vATjvA=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a98f6fc-8428-42ed-d8ed-08d6b0056f64
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2019 03:04:30.8548 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5760
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190323_200442_257912_67C79621 
X-CRM114-Status: GOOD (  11.26  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Gary Guo <gary@garyguo.net>
> Sent: Sunday, March 24, 2019 7:26 AM
> To: Anup Patel <anup@brainfault.org>
> Cc: Christoph Hellwig <hch@infradead.org>; Damien Le Moal
> <Damien.LeMoal@wdc.com>; Palmer Dabbelt <palmer@sifive.com>; Anup
> Patel <Anup.Patel@wdc.com>; Mike Rapoport <rppt@linux.ibm.com>; Atish
> Patra <Atish.Patra@wdc.com>; linux-riscv@lists.infradead.org
> Subject: RE: 32bit kernel is broken for Linux-5.1-rc1 due to GCC
> cmodel=medlow
> 
> I think what he means is to force the file containing setup_vm to be compiled
> using medany, even if cmodel is configured to be medlow.

That's not possible because code model is not a GCC function attribute.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
