Return-Path: <SRS0=aw4H=SL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 700D4C10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2019 03:36:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40E7E213F2
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2019 03:36:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CmBwSQfY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="LAFYjjFq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="NgQZjamW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40E7E213F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bol+9BzkXKAOqoq98126pUPyR0P9/G7egap/OesoBE0=; b=CmBwSQfYHyKtwE
	fpy1Ek6gBX6gdx9euoUNFV7mtIAKA+3Lb00e/G4IG++NmRE0oHg1p6e2Yxqjvu6eOn6mFvvoD8Vgi
	oX+4Ek+5IoHIeAQL2SAnIQNug0e+tjmhBxezGM25nKPEZ1AdPFFdfA9IcVvmV42wCO8CmCTGagsvj
	ub15U5hv0pcWS1nFudtuaGajb+/q3Lc6Sf9LhapO7fVguc6D0o4nEOJPflbliDmmBhXp5+5469a98
	JN1REDiSTxTRKvvsRFkDzywMOI8CwL8+Lw6J0sfzjW7QlhZs9mDIhELHzLfIbCNLJ1TWXYzrGW9LH
	Smp/0t56eVA6QpBl/6eQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDhYY-00046z-6J; Tue, 09 Apr 2019 03:36:18 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDhYQ-0003uP-54
 for linux-riscv@lists.infradead.org; Tue, 09 Apr 2019 03:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1554780970; x=1586316970;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m1SU6SG4bJpDHYBoK0GmD4Zz5O7Ld8oYO6X2tb7fbLY=;
 b=LAFYjjFqvmymXi/NbcCGQRPoKW4270hkIjBDgVzwPYGwet/TdXYMu2S2
 quML9aHaL1IyRRorpbheHu0atPPyzOeQi7uTXmFFieioLsM9PZ3enEV6O
 zzEU7hupzKwdJ3EOgnD6E9TuP6r4qSvSCapL3C/FedJYk5MweGlG49aMN
 Nw8/GO+Lk/4A7aWiMNsZrcEzXlbkQ8M7xk0du8nRGZ5aUoO21SXteiiDx
 i8R7HWVd9Lfbj3NQXM3PkHHzSmI2tvw4g+F2pEGldSQS/vvLubIsqtmUq
 dSbFb7jqdd/qGFSpTYE5NmRneLN+KbDDPRtwYFKQ3iqFLHm65nc7/ZNtO A==;
X-IronPort-AV: E=Sophos;i="5.60,327,1549900800"; d="scan'208";a="110351421"
Received: from mail-by2nam03lp2052.outbound.protection.outlook.com (HELO
 NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.52])
 by ob1.hgst.iphmx.com with ESMTP; 09 Apr 2019 11:36:05 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1SU6SG4bJpDHYBoK0GmD4Zz5O7Ld8oYO6X2tb7fbLY=;
 b=NgQZjamWKyoiUCUL9AXcgBQlO4SMff3I0KRmfIK3pb36c45WgHYoxntM7HcMakSYJpcs3DFSEXWXGlQgvsgzu7yrxy2eKFV/qOjLqgNND8wr6mzMUkH7UKyraNiY4oU0YfXTnaRh1Q1bzaZGkPf9pHjeAUhBTOR9ZvlJ4MXw8vw=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB6271.namprd04.prod.outlook.com (20.178.245.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.16; Tue, 9 Apr 2019 03:36:03 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1771.016; Tue, 9 Apr 2019
 03:36:03 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Guo Ren <guoren@kernel.org>
Subject: RE: [PATCH v2] RISC-V: Implement ASID allocator
Thread-Topic: [PATCH v2] RISC-V: Implement ASID allocator
Thread-Index: AQHU5TAIKaRDCttA7UazIjpcDaomMKYzNveAgAAJAEA=
Date: Tue, 9 Apr 2019 03:36:03 +0000
Message-ID: <MN2PR04MB6061824812AF1E83BA2434408D2D0@MN2PR04MB6061.namprd04.prod.outlook.com>
References: <20190328063211.13052-1-anup.patel@wdc.com>
 <20190409030231.GA14861@guoren-Inspiron-7460>
In-Reply-To: <20190409030231.GA14861@guoren-Inspiron-7460>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-originating-ip: [129.253.179.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 62262d5e-14db-4deb-bba6-08d6bc9c7dfc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR04MB6271; 
x-ms-traffictypediagnostic: MN2PR04MB6271:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB6271AA5FEE8525799C04016B8D2D0@MN2PR04MB6271.namprd04.prod.outlook.com>
x-forefront-prvs: 000227DA0C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(136003)(366004)(346002)(376002)(13464003)(199004)(189003)(3846002)(4744005)(76176011)(102836004)(8936002)(53546011)(81156014)(6916009)(99286004)(54906003)(25786009)(81166006)(71200400001)(71190400001)(52536014)(316002)(86362001)(6116002)(6506007)(229853002)(2906002)(5660300002)(6246003)(8676002)(14454004)(105586002)(305945005)(26005)(9686003)(4326008)(53936002)(33656002)(478600001)(476003)(74316002)(446003)(55016002)(66066001)(7696005)(72206003)(7736002)(68736007)(11346002)(6436002)(97736004)(186003)(256004)(106356001)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB6271;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 71VLu+T9pdYUSuQca4dhVQpLvLOizj9f3lew8OIn9bSP/wQYHKexRxx8VqapBV3qYJObQX+mUjVT2Z7uaXy5/rZlT5vDBe6NH/pMmF/FnP//y1N64IG2zYb9ZQaODjohSJeLISjJQxkAYMJKrD6UqbMaK+sTg5ZJchF0siPZ5Z4oKyycwqe54gRQ6CmIAjorlNiwnEcuYym/oQZudOAYZhZVBPpsooJW/Qm5sWWt/tLbTdxTKx7D09eqnOQt6lrr2TyKtCWZ5QsjAa466YnHs645XxBHVPSxsIG87ZBTSENOW3pjRHjygYq2xZ66kuZvqvmf/r3Ckw/ypkP3xWI2E7G7k0wF0x792eNqrtUZYDdOlailSi9PVCYvQmjr+77iBz6a+uMk6BML+axncp1j/PQVQtBV+/J1xpf7NpRKvDg=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62262d5e-14db-4deb-bba6-08d6bc9c7dfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2019 03:36:03.2227 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6271
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_203610_665883_2274CA2F 
X-CRM114-Status: GOOD (  15.13  )
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
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Gary Guo <gary@garyguo.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Guo Ren <guoren@kernel.org>
> Sent: Tuesday, April 9, 2019 8:33 AM
> To: Anup Patel <Anup.Patel@wdc.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>; Albert Ou
> <aou@eecs.berkeley.edu>; linux-kernel@vger.kernel.org; Mike Rapoport
> <rppt@linux.ibm.com>; Christoph Hellwig <hch@infradead.org>; Atish Patra
> <Atish.Patra@wdc.com>; Gary Guo <gary@garyguo.net>; Paul Walmsley
> <paul.walmsley@sifive.com>; linux-riscv@lists.infradead.org
> Subject: Re: [PATCH v2] RISC-V: Implement ASID allocator
> 
> Hi Anup,
> 
> On Thu, Mar 28, 2019 at 06:32:36AM +0000, Anup Patel wrote:
> > This patch is tested on QEMU/virt machine and SiFive Unleashed board.
> > On QEMU/virt machine, we see 10% (approx) performance improvement
> with
> > SW emulated TLBs provided by QEMU. Unfortunately, ASID bits of SATP
> > CSR are not implemented on SiFive Unleashed board so we don't see any
> > change in performance.
> Can you tell me what is the test case ?

I am testing this using hackbench.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
