Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75925C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Mar 2022 09:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NmsDQRJqezgBGAMTeAu/CMW963hIy9A1XTyVghECy7k=; b=LNIz2/zGtbPmfm
	traNY2QkXBGMjU832IsILIC0znhauL7LuSbl9rjECCN3PA0RuDzjUpFvIsDcihCxhLotNJVkE01WC
	o3olu4JuIrYHvUT7S3Z7BiHu0vcOL4CZQfxgqma5CR0rDgVNZzJrHs0IrGiMBPlatdaAsI9XO+3Y/
	8hxBQhqVH9jZh593ksVLkWg0zBxuLJvCkYUGxAlQWNyXEQ7hwU2RIbJgRrV3MCuweGMptBxZg0ktY
	O3bUrkZzBy8MHoLru5EIWCrE7g2NuhzFz3V7UOIceBaIyKN6sIxz82v+Dp42q7xq0gruVaApZHGks
	8T+gQ3rdow1OY38nJJHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOyS3-00FlNt-Rv; Tue, 01 Mar 2022 09:05:47 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOyRz-00FlLu-Mg
 for linux-riscv@lists.infradead.org; Tue, 01 Mar 2022 09:05:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646125543; x=1677661543;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Me0NeI9IPERZSohB5rBKWYQx2zBF+R3lLVY8gaPiKBc=;
 b=hSaaXNnupaa6VW6/jMB0zg6m7N0CHU+AJjLfpEPdPxzxkpg4xdMGB+PJ
 1ONasKMQLE1XH+jMzWH05ytWSvmB60yz8igK9wH0kEHusdRrRmI8VDrdE
 jtX48ujB3yPXoUzFH+BDPF1xr75o/QNJkZMWzvlpYl7H4612HOZsEruTD
 /8j06qlK1lfg1aUe9IZ4o/O2lyY3ADNxKsBIzPLJeAIWcEacSBLLaE3MC
 tEanwKaOp000TsdNNp6ehOVDo9FsBEuQxTT8CoIihCZgQ5+BaXodX1WDR
 e6YxGYc4qTg2B705WQbFxYCu7L4jcnf1yLK0NMJx/HTx3biaIB7Y3RaCH w==;
X-IronPort-AV: E=Sophos;i="5.90,145,1643644800"; d="scan'208";a="193111123"
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hgst.iphmx.com with ESMTP; 01 Mar 2022 17:05:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJ7HGuyAETIj148rZpIGq6EoBTmFz1iYU5y8w900CbfoksdVhPOSCW897rtH4ulBTazOPNyHjR+brRHyxF4M8X+GUFTKzXf5mYl/pfBc0TMLYOIqBF2XvdIdIDyhsmslCjhE06KzCmenZE73YMpHb6HbWqKr3ONY54U36eirmSUTG5DUYYdXWsFU0FabCouaJjr8QyZgPziROvigLZ7xjQ6ESwbkd1mcBissHndQMBKLAkX3Bkvw5RiaYK3l4HuyqqqmYtmmGcduySORDlF6UuTWv/5l3G2eVColF3yhBhm/L/Hhl80PuDODDV+4cqDsLUPF+JObI291EWiMOBSWBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2oMmZ1BaO/gCAnE/Rs54Iu/KeTCNIv+d4qcxnxiTQTU=;
 b=ll6oGnOSfdUqGK1CywB+sXMtpKWdYkRN3WZkdSrYIO8XvUP7ayoOojLQdR+0pmh3uCnzCuRpKF1knLx50JgV2+eaLPJpCg+a9Ga0JQIKoCnO8EE/0NWSYdRM+G9leKkhu3mXhlIBunTUB/UpNcacf21nWz2bcZuyqYoUaHhP7HxmDGnB8iXTuwT+sZoXh9kgPBkrhF6FW9FzZZt1GeowBrH9sMSG8dnHGjrBzlsBDDbOcDhOSXrjD2BjC9M9xRWah+oRq6pDOcsEK2UH1JWkOPAMhvjdhNyym9G8VHQeHamOaU8cbTSB8GihqpG2216WS6FR7cGKo1538kZvaoyStw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2oMmZ1BaO/gCAnE/Rs54Iu/KeTCNIv+d4qcxnxiTQTU=;
 b=yAmogg1nNXlgdJEYfzA3tPBg4QK9eTWZUmiLjsb5TfVdX3747qIyH2KCuKgqM6YpOZzu+/f+bR/vXk70uHCh8kHygzRRtgDQqOiwk58WcPWVaQ213jqtQRJ/Fg6nWtkT4QpXKxWzxh9EbRf4ra3gtTh3q4JXPDopwrF7aVSmO1M=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by DM6PR04MB5322.namprd04.prod.outlook.com (2603:10b6:5:106::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23; Tue, 1 Mar
 2022 09:05:40 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::f025:4f23:8e46:b2ed]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::f025:4f23:8e46:b2ed%2]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 09:05:40 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Anup Patel <anup@brainfault.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 1/2] irqchip/sifive-plic: Improve naming scheme for per
 context offsets
Thread-Topic: [PATCH 1/2] irqchip/sifive-plic: Improve naming scheme for per
 context offsets
Thread-Index: AQHYLQaKb26mBW8vWEWejzanD4SivKyp6ygAgABR1YA=
Date: Tue, 1 Mar 2022 09:05:40 +0000
Message-ID: <Yh3h4+eVcPIfPiD7@x1-carbon>
References: <20220301005142.3038702-1-Niklas.Cassel@wdc.com>
 <20220301005142.3038702-2-Niklas.Cassel@wdc.com>
 <CAAhSdy1=EtZS9Pjn6VDaan1_aRQ-TgJ35zgH8v1VwC8uon5NEg@mail.gmail.com>
In-Reply-To: <CAAhSdy1=EtZS9Pjn6VDaan1_aRQ-TgJ35zgH8v1VwC8uon5NEg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4063225e-a7a0-4d92-21e1-08d9fb62a898
x-ms-traffictypediagnostic: DM6PR04MB5322:EE_
x-microsoft-antispam-prvs: <DM6PR04MB5322361F734ADC626C73A0CAF2029@DM6PR04MB5322.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LlVELd+zKYXSYoui00neJsAaTRyFhn4+oSZcsUu3A3EgeA3hCgkx6X6IftNNfGViHIkRe67SqNWiRw24FX6Nz6XLZ1z0oJQjgAV+Vq4CAlXHgFEHElQdorIqMtOeGiIfoWX7NCSbohpZYYsK5XeX46ynKFYMq1qI9x1DzMwKnDsiMyN0D5kYSN3fuiRy7gUUF67Xdzd6STMKc3vNhwKCD9d25g0fK3Uhke7VckPhLYobbbTR3yHspq1lMfHGpbJBLk/gaQFDgQFtlN5ogurMI/y/BBI6sewSWX8Aevw30Lf+ht0GQhyneOPwuPu2o81co8ZBS9zzCbLxPmkmE3YXt9ld2gxFmwet625t3KjoG4tL2IluwEIc6lh5JmL92LdfmFDWPR3COLJWRrS8RmE8h795LqizEDW6GRBWnWjmcBJBUiydGlUdISQtS5kUxpNHkmTnw77JWxlgeWiYQSX9bzpTMDBYBEfIZ+bUAqXFRQRF1N6TYMC2rzHJTbjvQctFOkejsu3S86IBYnr9/BDcgXMZlmN7OoVEcMyGtNQdkwdghCBQ0TSKvCaoTlwewaXk5We7/wBCnTiBa49Jti+n23+Z/+QflNfiqCYwlYEy7b+eRKQFQWziu5oQWM0DO+QDrKTNrg8Frr2qVKkiEdLmEHkfWyuVdaLYpNYfoHvx3ypRkbobQkLsnrRqcsxUrCIa8qy+SOtoostoJRI+w/PeMOuKFU7IYiW8TZS9h6vGqDOSciPC1ELMc5NEpCRjkvHmFoFxmHpUb/iP43MR06NEGwauEZPosMTkuPekyUISvtaiYuAwhRgKKxuDCU2dIFq08lvfJ25jL8mIPoH2bf1YVHSbCjtWeVR6CPY0sv17KzY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(7916004)(366004)(91956017)(66946007)(508600001)(6486002)(54906003)(966005)(6916009)(86362001)(8676002)(4326008)(66556008)(66446008)(64756008)(71200400001)(76116006)(6506007)(66476007)(316002)(38070700005)(53546011)(8936002)(82960400001)(83380400001)(9686003)(6512007)(122000001)(38100700002)(5660300002)(2906002)(26005)(186003)(33716001)(67856001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?++l71FmPv1s31EjxZx6rYxp6A4JCizoMVHGLpWw79MXXFbrC1wynPlx/vebo?=
 =?us-ascii?Q?9rbhHKHeM5ILH/iEEXeM0p7vFHtkAYZ88aWT0iTCauq9UitZZEmHizqneTUQ?=
 =?us-ascii?Q?maVcAI7ZOKuY78oA3HqLFc00p9Wt0o8c8ONK2+X0jxWytTsF+SIhyXIfKBrs?=
 =?us-ascii?Q?hh2UxSdvpHfL5QzvUj0DblQSRF7JDU7A5wAF9B9umW45PKh/E3rr6IlG6J3X?=
 =?us-ascii?Q?ddNFbnPMZ4Hjnidk/Pd3P8gnVHkmBWW0tKSgH9fkd1ahix17TapTIgfoNc+L?=
 =?us-ascii?Q?5ngS5a4AcOOgkCKAZOzvt/Bb66Wvw/Nf+7t5080btuJHmhGNnZmzH38pweRO?=
 =?us-ascii?Q?K5k4Md9SVYCop6FAdGL4jcbkJ5Ak7Z8BKL/4s0pCnfYwJneksalsI/R4irOp?=
 =?us-ascii?Q?D+3x+z5q9aSTit7vHoFsONWDJ4s/wUXaKpK+zf2c9RgTqulgTm9SowAsIjJY?=
 =?us-ascii?Q?gfOig0jAqYvEHrS90kMnEjSA8O+ZPfll8FCb4IebD1lz/KwVpnHAGReyIt+m?=
 =?us-ascii?Q?EHnUcIJSnNhXlu7ayg4H/9IO3rh5431XVn4qzW0Il9ou8avRsHwkpBREsqnR?=
 =?us-ascii?Q?JvrX1N0nBLKbezDwHa5UopTKQbjgpYmEkGyz+6Q71u5ha+KVUMyPlMUXrolH?=
 =?us-ascii?Q?NG7D+73JOTMiPXuNd8q7yjcSb7UxAYFLKauOEQSvS5wwuI3MjPEnywrEVtEB?=
 =?us-ascii?Q?DE8qrIVjz5jnrp4JUpQR7UfhRbUK0PyBJXqj05QD9UWL/ahMjtRgCPO0df8c?=
 =?us-ascii?Q?cMxJT4Hxi7CaPuNW+yhPbRMp8k7j7kghEbHDqsm426FHo+WiRwo61HRnTy0u?=
 =?us-ascii?Q?Y2WE4+vzlneFLMf9zDFefoBEyIot3GsEocnMxBLKKUK9mxk95pBD/dKLrH2t?=
 =?us-ascii?Q?McAQTM8cVm6dGQarP1FHOlFdcRKjGVOQNL4XtVuHdm+smjieQnap41tTJTTZ?=
 =?us-ascii?Q?fSLbafnhDfDvCQpLKdz1+rnsK7cxEMHiUWhL+GBP1NJmZN+wa48cQxwh/Nv5?=
 =?us-ascii?Q?0F9xarW0DI3S8l9TLfavjlc2PcKytkA3EZVkq8e3ZeM/RCG/BxllthUAWcw6?=
 =?us-ascii?Q?nUA21CgibbEws1gYjsjDQA0bn7BzzrDNkOrGaVF/e5Hb2t0IQjQDCFp0MVJE?=
 =?us-ascii?Q?USKrjvw27ZMtqUKl6+aQAxN9nfyAW112eW5xyAkj0DP0juL2itNgvDbZlhu1?=
 =?us-ascii?Q?Pgb0So/hYayq1/dPDYeL/6x9qbS5r86xHfB0lYhZumlrqsGWNcDjBKECFGQw?=
 =?us-ascii?Q?iC2JlfXBSHphV4InSS2t3u6tZEf8HIlVfhJg/z8XXfel11wb7BU4E1W2h/7F?=
 =?us-ascii?Q?0hd/IICFQjQpiYGu60vKBQW1+3jpSDGeOoL81Rr33dWvYK48l7tX6gLN35vP?=
 =?us-ascii?Q?KcjRph4c/4VAA8U8v5cKIJdOo5i2QXygNp5HDU5i0JA6eana33KR5Z8Wwuqw?=
 =?us-ascii?Q?bZeyfRd3fVSAVhb9DrsRZ1O9uK3XIBneo5GtkfZxuliySrKpMSZK4IdICwnc?=
 =?us-ascii?Q?wUKQ+mUoGKnEq9I/3qaSDNdUsrTxAFQTE10tCelDbWhxQUO8F697jDpuIO33?=
 =?us-ascii?Q?+5+IQsABsQk6kha6qMEtu/yV73NynDs/IDE/Hr7FXSTJSB6tt4DSJk9jSnYZ?=
 =?us-ascii?Q?tQaiJ2n+tWU1hqtTtJKrIZ8=3D?=
Content-ID: <75BD5E39D20F5743A23A288BE4CB1E9F@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4063225e-a7a0-4d92-21e1-08d9fb62a898
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 09:05:40.2295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MvBhoN5p0M94X7zJhwTOM9b6+mt6hnvBAX+dHZ3DeGwEshWZ8qRXGekSIaiFBz2SUOCvCoNkSWwTHNo43LaSAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5322
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_010543_923343_1E667F65 
X-CRM114-Status: GOOD (  40.85  )
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

On Tue, Mar 01, 2022 at 09:42:46AM +0530, Anup Patel wrote:
> On Tue, Mar 1, 2022 at 6:22 AM Niklas Cassel <Niklas.Cassel@wdc.com> wrote:
> >
> > From: Niklas Cassel <niklas.cassel@wdc.com>
> >
> > A hart context is a given privilege mode on a given hart.
> > The PLIC supports a fixed number of hart contexts (15872).
> > Each hart context has fixed register offsets in PLIC.
> >
> > The number of hart contexts for each hart depends on the privilege modes
> > supported by each hart. Therefore, this mapping between hart context to
> > hart id is platform specific, and is currently supplied via device tree.
> >
> > For example, canaan,k210 has the following mapping:
> > Context0: hart0 M-mode
> > Context1: hart0 S-mode
> > Context2: hart1 M-mode
> > Context3: hart1 S-mode
> >
> > While sifive,fu540 has the following mapping:
> > Context0: hart0 M-mode
> > Context1: hart1 M-mode
> > Context2: hart1 S-mode
> >
> > Because the number of hart contexts per hart is not fixed, the names
> > ENABLE_PER_HART and CONTEXT_PER_HART for the register offsets are quite
> > confusing and might mislead the reader to think that these are fixed
> > register offsets per hart.
> >
> > Rename the offsets to more clearly highlight that they are per hart
> > _context_ and not per hart.
> >
> > Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> > ---
> >  drivers/irqchip/irq-sifive-plic.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > index 09cc98266d30..211bcb10aa93 100644
> > --- a/drivers/irqchip/irq-sifive-plic.c
> > +++ b/drivers/irqchip/irq-sifive-plic.c
> > @@ -41,19 +41,21 @@
> >  #define     PRIORITY_PER_ID            4
> >
> >  /*
> > + * A hart context is a given privilege mode on a given hart.
> >   * Each hart context has a vector of interrupt enable bits associated with it.
> >   * There's one bit for each interrupt source.
> >   */
> >  #define ENABLE_BASE                    0x2000
> > -#define     ENABLE_PER_HART            0x80
> > +#define     ENABLE_PER_HART_CTX                0x80
> 
> These are enable registers for each plic-context and we have multiple
> plic-context associated with each HART.
> (Refer, https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc)
> 
> Correct name would be ENABLE_PER_CONTEXT instead of
> ENABLE_PER_HART_CTX.

Hello Anup,

If you look at the RISC-V Privileged Spec v1.11-draft:
https://github.com/riscv/riscv-isa-manual/releases/download/draft-20181201-5449851/riscv-privileged.pdf

They do use the wording "hart context" all the time.

See e.g. 7.3 Interrupt Targets and Hart Contexts

"Interrupt targets are usually hart contexts, where a hart context is a given privilege mode on a
given hart (though there are other possible interrupt targets, such as DMA engines). Not all hart
contexts need be interrupt targets, in particular, if a processor core does not support delegating
external interrupts to lower-privilege modes, then the lower-privilege hart contexts will not be
interrupt targets."


Also see the DT binding, which also uses the term hart context:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml?h=v5.17-rc6


And the existing comments in the driver also uses hart context:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/irqchip/irq-sifive-plic.c?h=v5.17-rc6#n44


I'm not sure why:
https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc
Seems to have done search/replace on "hart context" with "context"
in all places except one. Almost looks like some kind of revisionism ;)


I would say that "hart context" seems to be slightly more correct,
and it is already used in many places, dt binding, comments, etc.


However, if you feel that I should search/replace "hart context" with
"context" inside the PLIC driver, to better match the current github spec,
I can do that. It is only used in two places.
(I don't think we should touch the DT binding though. It defines "hart
context", then uses "context".)


If we use ENABLE_PER_CONTEXT, like you suggest, do you have a better
suggestion for CONTEXT_PER_HART_CTX as well?
I don't think we can keep the CONTEXT_ prefix.
And in that case, we probably shouldn't keep the ENABLE_ prefix either.

How about:
PER_CONTEXT_ENABLE_OFFSET and PER_CONTEXT_CTRL_OFFSET?


Kind regards,
Niklas


> 
> Regards,
> Anup
> 
> >
> >  /*
> > + * A hart context is a given privilege mode on a given hart.
> >   * Each hart context has a set of control registers associated with it.  Right
> >   * now there's only two: a source priority threshold over which the hart will
> >   * take an interrupt, and a register to claim interrupts.
> >   */
> >  #define CONTEXT_BASE                   0x200000
> > -#define     CONTEXT_PER_HART           0x1000
> > +#define     CONTEXT_PER_HART_CTX       0x1000
> >  #define     CONTEXT_THRESHOLD          0x00
> >  #define     CONTEXT_CLAIM              0x04
> >
> > @@ -362,10 +364,10 @@ static int __init plic_init(struct device_node *node,
> >                 cpumask_set_cpu(cpu, &priv->lmask);
> >                 handler->present = true;
> >                 handler->hart_base =
> > -                       priv->regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
> > +                       priv->regs + CONTEXT_BASE + i * CONTEXT_PER_HART_CTX;
> >                 raw_spin_lock_init(&handler->enable_lock);
> >                 handler->enable_base =
> > -                       priv->regs + ENABLE_BASE + i * ENABLE_PER_HART;
> > +                       priv->regs + ENABLE_BASE + i * ENABLE_PER_HART_CTX;
> >                 handler->priv = priv;
> >  done:
> >                 for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
> > --
> > 2.35.1
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
