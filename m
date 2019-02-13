Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE713C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 03:43:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AEF8218D3
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 03:43:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SNQE2zA4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="oK0qFpUs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="Ix4h6eQK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AEF8218D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PBkm9QjFN9EVV0WQpvcxF86t31K+m3cEAzx1Uq4BSuY=; b=SNQE2zA4S4HyQq
	rk7A35aAIDjYDCY7J+k/zG07I7ki3FRIS6HkgidkLDzpbOneswGRelDcc6i44V0qZJJxvH0eBR6eg
	MGYHeZO+ED0YDBlP6zXnH6r9zYSIOgVYdFb1qnHU4ucArP65mfRO1kh73GyyMOqdw9QB0Gh2ov1JY
	oXYdgzIzDvLAFpYZ2c20Z5lpz6h8yww7nvqpQssuMChLWWVHnJner3jJD/6cwrwwH+tvbVB+86xNZ
	m01mcoyHb8dObodub2cUrwwJzOA31iJjz4EKjOPD7072nBvZb1afufH0X+285LB4J1lJkKrsT1LuY
	pvzarSda6TUY26lvcgIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtlSP-000139-Ju; Wed, 13 Feb 2019 03:43:33 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtlSM-00012i-NR
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 03:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1550029411; x=1581565411;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Dsk08b4BjhTECz94FDeT7jmFU/7hAUhfKh7TQ1CbB0c=;
 b=oK0qFpUsSA5y4gh4LX8gXcl6Xlx5/On6JmN7dmgYGCIrxgG0w4thzCS2
 dKuB1lOPygCxMpg9MuCmJ5Lu68YerYymGfy3a5yaSOQAT/l1yilHyqi39
 duCFL10/bICSuKlaqLJJCCltiqoHn/Q0pdr7I/Yp3ewWW3QxcQ5Zs6RDJ
 qn7Cu0xXmhOEl0lHpfdMZyPhy8wNK3wUO28g6TjXBNKakloVOxOkXrp5i
 tKqlmwNgtRx0tFkZWfYX/Ke7FHe7sEkhkwtdLJiddCD1MTLJHoIY26PtA
 G4FzO2KyvTLW5Wz28WudYi+dVs5QIY9O6fTOY55FwkzQWFMPGRmPqnAkU A==;
X-IronPort-AV: E=Sophos;i="5.58,364,1544457600"; d="scan'208";a="101061603"
Received: from mail-bl2nam02lp2057.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.57])
 by ob1.hgst.iphmx.com with ESMTP; 13 Feb 2019 11:43:28 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5mLVIlyq3+7gsH0enD0DJ35+/Yw9cRuWnTt6HiD/zg=;
 b=Ix4h6eQKv5yynKYuQ4aJ8bgtgB525QaOlr0rfU+FifFr/bi10EjCKa6z6Lj93khSGlbIOh1b9I7s959EbuqhZGotPl9TXTX7921voA334HUxSzV4iOHQA0DQdvOJ1HAi4iSKT38TWjq2oTOZpFrsFX0kgthimS4J3YP6w3wFtro=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.247.148) by
 MN2PR04MB5822.namprd04.prod.outlook.com (20.179.22.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.16; Wed, 13 Feb 2019 03:43:06 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::2cdb:c465:af57:8be1]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::2cdb:c465:af57:8be1%7]) with mapi id 15.20.1601.023; Wed, 13 Feb 2019
 03:43:06 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Christoph Hellwig <hch@infradead.org>, Anup Patel <anup@brainfault.org>
Subject: RE: [PATCH v2 6/6] RISC-V: Implement keepinitrd kernel parameter
Thread-Topic: [PATCH v2 6/6] RISC-V: Implement keepinitrd kernel parameter
Thread-Index: AQHUr/rvNlD18fFOHEuGvgVx64rC4aXb43KAgAA2jICAAIwvgIAAlc7g
Date: Wed, 13 Feb 2019 03:43:06 +0000
Message-ID: <MN2PR04MB60615E8737B56B1B213B5FA58D660@MN2PR04MB6061.namprd04.prod.outlook.com>
References: <20190119132650.9978-1-anup.patel@wdc.com>
 <20190119132650.9978-7-anup.patel@wdc.com>
 <20190212070807.GD26747@infradead.org>
 <CAAhSdy1NED22YyYrAJDqPkDqT1c2ms2QC9OjHP0qLwHT+o2zvg@mail.gmail.com>
 <20190212184505.GA10984@infradead.org>
In-Reply-To: <20190212184505.GA10984@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-originating-ip: [129.253.179.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b78e866-5a5b-4398-6d7b-08d691655d78
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:MN2PR04MB5822; 
x-ms-traffictypediagnostic: MN2PR04MB5822:
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?us-ascii?Q?1; MN2PR04MB5822;
 23:4FoqXf5wojY+u5Pi+bNE8NmxU7e1M2lUK1/CBfdNH?=
 =?us-ascii?Q?hp3EfQ/lMXGyyKqmz7xlbYOfxufBVZoee6MDG+y9MGLUI+7RtkdzyxFy9P/n?=
 =?us-ascii?Q?+ThDwVYXxECmNswaeoPjbrqTfZBp8KZP+OWORqcYYybR/1JUWBkqgkG8sRue?=
 =?us-ascii?Q?B0K45zDeUN3UIJAe/QWbogF4fGzXKwSYr7b3Lb2veUYo5d+nU+OXncd6JQpZ?=
 =?us-ascii?Q?qFXILlgkOjZFmaujTCiW2CWhoCKlN/989cLHXvtq9jz1wYtX9x/8hULbPvAd?=
 =?us-ascii?Q?kJWNaZl84HT8ASG6daR1o6vUMXC78NfaVTGQ4sepgm4C947hzUBj3R1o1TIg?=
 =?us-ascii?Q?MOGPY+d4y+WRkrIu7JbEahglI0E0QSxl2wHtpjmfCvRkyAohDyXuhI2/W8rA?=
 =?us-ascii?Q?fVieoI+fjF+cSm2zytdHN7vcAwChvZEDDFYe+8UGwswRAtZefQu/3fGaHfbt?=
 =?us-ascii?Q?U2zfzYYU6aCLEpAuwUIlHCiQVuowENldZ1R4dxGYyCePyr0XySSe0t5Iq0mT?=
 =?us-ascii?Q?2LlFZNRc4j2fDCxuXnpjw+/QdhPhYK5jpvqu4LoOK7OKT2AZ8GaMqYWQDnDT?=
 =?us-ascii?Q?6/hO3LAIoIXqOPFbjWX9uIXg41MqGdHZO1DeAAlB5KbgfCt17UA8dj+w7ndZ?=
 =?us-ascii?Q?l1pmkXHersxOAV0z0LECamKw0pOvbSkkq1UgRveDX39ih/PWJEqT7qdsrwYU?=
 =?us-ascii?Q?tS6y/GNL1GIHPYmup4O01Yk2nCzGmrMWn1EDwPBML+AT/E1kyKAXbX7KkTBA?=
 =?us-ascii?Q?NUG8h+ROiuSrs6cJpTVNMRdZnIEtlcj6ru1JqD7m4bw+Q1KpyqufpPtufKY3?=
 =?us-ascii?Q?M+vszakB+vwSmPQxSWSVrjM3nt6pKroeFk/F60HHilHZw/jI+guV7BVl6ajH?=
 =?us-ascii?Q?x3syG5ALSBFd3MzLJ+/0fHDIdfX/4OcuJGI349fwsQRFvzM0iefUG9Y4cEVs?=
 =?us-ascii?Q?q6DRUwkx2yxTfmcfUZ1GNsSb8kv3dthk5EPXvY5ZP5cSSyEgI5bXWxklCDSp?=
 =?us-ascii?Q?fWt14Qn8KhQbeuQnCCSybd+fSHs01l4GoZjKiAFmCY3XsoMDjEE0JTm5kKN8?=
 =?us-ascii?Q?yBFONfyaZCS7BmJfH5UoEacAhbiBKR8PSo7iHor8F1hx+cHD7cj+WMsjSNeL?=
 =?us-ascii?Q?QT3dfRDswLTaGBqk7GuK0OrzIhUZi+7XI0/NuFVLUNcX2Am4ZS3CtovlMdPv?=
 =?us-ascii?Q?/kdXQ3ykTZ4+pRn2t4F6B3mSj3zq9Am5LlWeZYEV+fEHssfQS22JSYI/EOvl?=
 =?us-ascii?Q?6xLBHWu7TyZEUNMZkmPqMraFzFAAHyHl8G9vj+G?=
x-microsoft-antispam-prvs: <MN2PR04MB582223CA0A715EA1AB1158628D660@MN2PR04MB5822.namprd04.prod.outlook.com>
x-forefront-prvs: 094700CA91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(366004)(346002)(376002)(136003)(199004)(13464003)(189003)(81166006)(478600001)(186003)(11346002)(446003)(8936002)(97736004)(81156014)(6506007)(26005)(66066001)(53546011)(4326008)(93886005)(14444005)(102836004)(8676002)(256004)(105586002)(55016002)(6246003)(9686003)(6116002)(3846002)(86362001)(71200400001)(6436002)(99286004)(71190400001)(53936002)(7696005)(229853002)(25786009)(54906003)(110136005)(7736002)(305945005)(68736007)(476003)(486006)(316002)(14454004)(74316002)(33656002)(2906002)(106356001)(76176011)(72206003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5822;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8sHM5KJXChe0kNUjeCvLJ8TlRtbYtaSpOsnXI5bzKmGMuZb5Lv9FCYg1rgO8Ar7mXXorxoSWko6NQiC0UrAFe2BEWd8km1tjXoP7HEn/lBN9vBWYnqBxLj1M+V2pWZWZrghzi3+ffzqBU4eixt0L/Cj6ZbyEqj1XOjHb+CSA5Ytvk+LRPzkqpjwbOxts0qu+PlrQxhInrUwjFlM8eGrqdbvoyXoePLaYpIHtCXHbEwVmStsvPuc18k/X5xIEGHeaCmG6fy8700WkGI7YKPI8pTXc07z2Ohsw4DQwIRqRfZLial8QK9zh9XBioFi7PB5lNbQmvxH6hzUmrn5DW28xiR5NnvCilmFTHZqvZzlSg/uD5KcLB6ubdf7/bbuL6YgtTcTeFR7BIDhLKW95UH5ja8n3+tyF+eRNt5GSC6ngTp8=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b78e866-5a5b-4398-6d7b-08d691655d78
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2019 03:43:06.4120 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5822
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_194330_911745_C9AA40CA 
X-CRM114-Status: GOOD (  19.27  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: linux-kernel-owner@vger.kernel.org [mailto:linux-kernel-
> owner@vger.kernel.org] On Behalf Of Christoph Hellwig
> Sent: Wednesday, February 13, 2019 12:15 AM
> To: Anup Patel <anup@brainfault.org>
> Cc: Christoph Hellwig <hch@infradead.org>; Palmer Dabbelt
> <palmer@sifive.com>; Anup Patel <Anup.Patel@wdc.com>; linux-
> kernel@vger.kernel.org; Atish Patra <Atish.Patra@wdc.com>; Albert Ou
> <aou@eecs.berkeley.edu>; Paul Walmsley <paul.walmsley@sifive.com>;
> linux-riscv@lists.infradead.org
> Subject: Re: [PATCH v2 6/6] RISC-V: Implement keepinitrd kernel parameter
> 
> On Tue, Feb 12, 2019 at 03:53:21PM +0530, Anup Patel wrote:
> > If it is initramfs (i.e. CPIO image) then contents of CPIO archive are
> > extracted to create a ramfs instance.
> >
> > If it is initrd (i.e. some filesystem image) then RAM block device is
> > created in-place at initrd location. (Please correct me if I am wrong
> > about initrd here).
> 
> No.  If it is an initrd image we still copy it into the rootfs first, and then load it
> into a ram disk.  Take a look at
> init/initramfs.c:populate_rootfs() and
> init/do_mounts_initrd.c:initrd_load().
> 
> > So in case of initrd we might not want to free-up the RAM but we can
> > certainly free-up in case of initramfs.
> 
> No, in either case we do not need the original initramfs/initrd memory.  I
> suspect arm has this as a workaround for some weird legacy boot issue, but I
> can't see any reason why we would not want to free the memory on riscv.

Sure, the keepinitrd=0 by default so it will always free-up initrd by default.
Please look at v3 patchset.

Of course, we need separate patch to update documentation of keepinitrd.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
