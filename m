Return-Path: <SRS0=e5eF=V2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F94AC433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2019 19:51:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6302C2184E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2019 19:51:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IsMDHJL3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Ib6bvmdE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="lHaOAAdJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6302C2184E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WOt0LFa7pj3Jz+p0YE1VT1BaZ2QwHwd17JRxGZoGUkM=; b=IsMDHJL3hCps12
	lUjvVEqkB2F+vpDMnoonVHpK3K7eJ6YtO6IspsNJ9A6/vDm0my9F2OChuuMbP+Fp0OMHTTq3IYott
	R12JxVrvEF78H9z7iveNetlRzM9gRZEEjiRVhqpQ0flDpRyCIWIGENffcq0AaGXBuvej04TL2wFL6
	4gALs4qHWakEpD5WTB8iGcrdJ97WohTbH8C3jsLbnZDuyPRhJ+TaIvcemwZRFk7QvEkbsycUPuwJa
	nfcNmVhyo5hbSLTCwYyweWWYW3aznIErcLyn15SQDslOEJ7RJSGq5GxvIKr3Xzg16x9R84nz2QbXx
	BGTs4SfwksWz7w0+bL1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsBft-0003Yf-1W; Mon, 29 Jul 2019 19:51:13 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsBfq-0003XM-I2
 for linux-riscv@lists.infradead.org; Mon, 29 Jul 2019 19:51:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1564429870; x=1595965870;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NO/0MsVKP71zr1N2x8BGfD/IHsCvghxnvN3rCJWUCV4=;
 b=Ib6bvmdEzNIyoRar3I15F9OzZj0Xa8JXRzm3BbLh6U8NhzncsUKnNgpF
 lqVTGHWD8kYlBuMv+G4XqR3uN4sbHBUcXPBKJUOjC3oaDVAtfseyTjWUH
 CTTD9khGQ9B4jW2OGvYbb8EQTQirddP7TTmnPn5bsnBD0dvhL4G9pV7x6
 JYlBhhhtoSE7SBTGh6+UBN6dpizK0emEaomRRg7388dNu5ABjaTKb+2Oj
 QC1RSBiYq15KciKpe3Ud73jUl4/aAsWVU8MOf+N/BHG/6OePHHsSQkfem
 GFu967OmBaSI9m83CXTsrSbcyuB97tNAmRszgE8rRTfW5FsNrvRQtvbgF Q==;
IronPort-SDR: gJZs9x29wo72RQLI5rHcDPbrbC+rxWTNycBh2lgauP5bp3kZ6zV6r2d2ehN4X45ps814+UglE/
 FapRe4G+Kx97XUkWbYHrLsqlW0ATCarPQRvU+HRsN8XQFmlwgaV3z4vJG/ObDuZX6V1C2A3KWa
 YcAORgXb7hEtPcw6/C9bXEAD2XQE2OmCU0RvDzOu6+XeYPbf8OaVn2nX7Jzl7eXJfNUtIv9vWp
 9A9p2sX72ooIqynOw9da9YHeu/SFymyK+c8OF+IMHBD0U+t55fpIgODW6DZ5+FXpUljBI0sj2H
 nDA=
X-IronPort-AV: E=Sophos;i="5.64,324,1559491200"; d="scan'208";a="115439495"
Received: from mail-sn1nam01lp2057.outbound.protection.outlook.com (HELO
 NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.57])
 by ob1.hgst.iphmx.com with ESMTP; 30 Jul 2019 03:51:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnpB+bVzG1zFbSj/AnvYkVjUPu7zwtioqYeLvw5t4VCJZUKebAo5M9Lpu0kQvW7pmG27XdQXMYC3ArfFVszOGRTaPAbS5D/esh/G26T6Dcy+/dBgN5yRffVRG9BzJxu/UwPmfXkmSmlkxcFwYzCq99SINAW5tdoE3BDwgH5DQTf1kvAdJg5NHhTlEvTqhg/pfyLQF4gLq+Jta3AfX+0YnY4Rr4gjo66uH80NJi5rTjogNwmKp85OKDjgG+2+cC4erceB4XIVsRVKXUboXP80qdhX7k4TfU9Lmves2YFB4GQAnYrNd2Me0nLJdfGfU8bLSz4FWmgOSA0e7E5cujpF2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NO/0MsVKP71zr1N2x8BGfD/IHsCvghxnvN3rCJWUCV4=;
 b=gZ1kLnDO5cdfAhPuhMCgQqyk/qpEclkHBcZ0AynVl/DXQYM9AGR6GYbxE315k/rM7niO4+FsxAGx8J/iH3o2q3ZFJN/kkN9e5oHBTA3gwzCIjfuf8HwgIV/+/I+Z9WrZdkUkEz+TSYDJcZJunVNMhdi9UlExG5AIjoUFH3WJQwYFiZLZQ7YQybHgSWNE8AqE+nCyTc9Nc6PNMA3Q+mvBRifGAtqsxbUOxDpQRc2qvHWcNghxM8/vu4bIuBry3iPg8FNMfBCC8KDEODgbHjdrrkWRmBeT1bBIk04s2eCeulzePbE6xZWdU227YyWPquX0Hv94jUnkAxf5fMXt6yxugQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wdc.com;dmarc=pass action=none header.from=wdc.com;dkim=pass
 header.d=wdc.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NO/0MsVKP71zr1N2x8BGfD/IHsCvghxnvN3rCJWUCV4=;
 b=lHaOAAdJ2eOWrESvG9cywMLVCDVHtLNk04JFk1Ln51tX1g05K1DogVIgfSV/Ub16AfG4aTu6Z+FdCnPqcii7YHAf3ouIWiuIe5xUBtbS0lreZ/gipNlAH3SNrF2RY2LLYlR9QN3tk9Q9+voK/cYMt5gu6UjwQDCE94AyNcwQuXM=
Received: from BYAPR04MB3782.namprd04.prod.outlook.com (52.135.214.142) by
 BYAPR04MB5432.namprd04.prod.outlook.com (20.178.51.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Mon, 29 Jul 2019 19:51:00 +0000
Received: from BYAPR04MB3782.namprd04.prod.outlook.com
 ([fe80::ac9a:967e:70a5:e926]) by BYAPR04MB3782.namprd04.prod.outlook.com
 ([fe80::ac9a:967e:70a5:e926%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 19:51:00 +0000
From: Atish Patra <Atish.Patra@wdc.com>
To: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "rkrcmar@redhat.com" <rkrcmar@redhat.com>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "palmer@sifive.com" <palmer@sifive.com>, Anup Patel
 <Anup.Patel@wdc.com>
Subject: Re: [RFC PATCH 15/16] RISC-V: KVM: Add SBI v0.1 support
Thread-Topic: [RFC PATCH 15/16] RISC-V: KVM: Add SBI v0.1 support
Thread-Index: AQHVRgTdLbP8aD0d50+SPOvQQEaYeqbh/v2AgAAC3IA=
Date: Mon, 29 Jul 2019 19:51:00 +0000
Message-ID: <0e19ff14a51e210af91c4b0f2e649b8f5e140ce1.camel@wdc.com>
References: <20190729115544.17895-1-anup.patel@wdc.com>
 <20190729115544.17895-16-anup.patel@wdc.com>
 <b461c82f-960a-306e-b76b-f2c329cabf21@redhat.com>
In-Reply-To: <b461c82f-960a-306e-b76b-f2c329cabf21@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Atish.Patra@wdc.com; 
x-originating-ip: [199.255.45.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb898cc9-e796-4736-6019-08d7145e14e5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR04MB5432; 
x-ms-traffictypediagnostic: BYAPR04MB5432:
x-microsoft-antispam-prvs: <BYAPR04MB54328E32EF693A367280E483FADD0@BYAPR04MB5432.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(366004)(189003)(199004)(476003)(446003)(11346002)(53546011)(186003)(256004)(2616005)(66066001)(26005)(66556008)(66946007)(36756003)(102836004)(486006)(6506007)(118296001)(305945005)(76116006)(64756008)(86362001)(25786009)(66446008)(76176011)(14454004)(7736002)(99286004)(71190400001)(71200400001)(66476007)(478600001)(5660300002)(4744005)(53936002)(2501003)(7416002)(68736007)(4326008)(2906002)(6116002)(2201001)(6512007)(110136005)(229853002)(6486002)(6436002)(6636002)(8936002)(8676002)(81166006)(54906003)(81156014)(6246003)(3846002)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5432;
 H:BYAPR04MB3782.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dY9cpiUkzq9jMG/mBMslqduUDYmYHXcP0wHC0LpH1v4+72janntXmVUGi0U1qMAa3o9BVTM3zsdYSRmZnv9id5n3bbJRePR2i03qsYY+20XEN8CPP4mTKjslPHdpb/ajzZFvbaC9A1rdKFpKDRxGRytGcavPowGNXNm7jimVCLRHfp9w+Z/SATz4QT59j9TIZNJQdPwlEbNAJ6ZFfoywXDlzylmr3R7TZ4AOekn+ZaB5dk18Gl6rxa1NATC1P7m1R9Inn+Y+KC2OMCrL07HMAN/hZYSKUV64nxBOFe+S3rtmCrHYf7AOjXP+Eg9hk+irfNqdzL7/YT7P1yNYKE5bN2ApYb6wFRTPlqe64lkKIK+JCHMlN7PrWwTDFGL27+2jzIVxp2hoh2F1VSUAEyKN+SbmpPMVrQDrbMKTrQeHB7Y=
Content-ID: <DA894D5BDDBAB64FBD4E2016B8DCCBBF@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb898cc9-e796-4736-6019-08d7145e14e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 19:51:00.4733 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Atish.Patra@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5432
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_125110_907979_816BEB50 
X-CRM114-Status: GOOD (  11.09  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hch@infradead.org" <hch@infradead.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 2019-07-29 at 21:40 +0200, Paolo Bonzini wrote:
> On 29/07/19 13:57, Anup Patel wrote:
> > +	csr_write(CSR_HSTATUS, vcpu->arch.guest_context.hstatus |
> > HSTATUS_SPRV);
> > +	csr_write(CSR_SSTATUS, vcpu->arch.guest_context.sstatus);
> > +	val = *addr;
> 
> What happens if this load faults?
> 

It should redirect the trap back to VS mode. Currently, it is not
implemented. It is on the TO-DO list for future iteration of the
series.

Regards,
Atish
> Paolo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
