Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F6DC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 17:45:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9B9620645
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 17:45:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ExAc/nC9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="EBMdaMnU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="ZDPCseSZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9B9620645
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8vORD8Blk3ex0Q6pB32nz54UzOEVa8cDnyXyUNGzSAc=; b=ExAc/nC90NTlG1
	dLkVAu1zUSFI7F7EqeCrOLps7QrR9tZ2aiVQqEvdkz5y5Bo2NYq7l6Gz2yua+6t7f233VDfCZtxSu
	dcHwhu15a+gSsgJX+F9FvetHe08NQfTQj7wvk/CqVloIWIvRjJahxdrZ3baNNqz2QHM6epSqmhm/O
	Cs5MTFtDeQP/1/L+0QlzNOQtgUMAyINxOU1T4g50eYdMvNaU2+5gmNQFGdDEGSX4e6lsvSe5kcuy7
	gX7t2jZDwnCxk/zXKcjPafyZt9XsXXb39mibmmYh1nA1mYpJpaW23N/KDRAWr7+ljHFDy2AV+Mzis
	gT7MMZpVA2T0hdWsZjeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjSma-0000qk-8t; Tue, 15 Jan 2019 17:45:48 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjSmX-0000pk-2i
 for linux-riscv@lists.infradead.org; Tue, 15 Jan 2019 17:45:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1547574345; x=1579110345;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ZLYMC9VQGQqdKAc5KuQwXAbo2Ws2R0VMMZ+Zknbjaxs=;
 b=EBMdaMnUFZG7ia8KCXmEvOVY0KOOyearPz/rtBAikY5h4XWGzuOa/MWy
 6AGjbfGMODAhBmYG5SAoPedgId0yij7UILQhTDoMFj5VmVsjk72/A/0/x
 oX5Mw+O45XzdOjl5DiKGh2YFy0zoaQn+NIOGjudujdMhOLlayIAEkoLye
 YlTKFYc7n3oZ82OVF4tWffQ8qkzCxbeo01ohQugME5r3mhEfbuGITa104
 gsICcoJeQpxRq5BtJ/m2YAXPQzJvTvlIfRQUAsm5w54xDjVAQDy14qfE7
 2C8gpzkdW2YcX5gwDp20YGgyQaoaMqpD7dLd7mW1AAFe81FWVcosjSCiM g==;
X-IronPort-AV: E=Sophos;i="5.56,481,1539619200"; d="scan'208";a="103782929"
Received: from mail-co1nam03lp2052.outbound.protection.outlook.com (HELO
 NAM03-CO1-obe.outbound.protection.outlook.com) ([104.47.40.52])
 by ob1.hgst.iphmx.com with ESMTP; 16 Jan 2019 01:45:42 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLYMC9VQGQqdKAc5KuQwXAbo2Ws2R0VMMZ+Zknbjaxs=;
 b=ZDPCseSZz1/y371BfEkk7rv5fMduLL++7YvLsuQXJaK+GSFw7S5gEGN6JaSlIf1TKcIu/4rblWppsSN+R7yf3caGYcnOVI2dm8cjXZZXjDRPyXDVb/zoXcYeIQzvobcXkxX0fGv8DyV2Ddi7WU9D6FMe0TscfKikV0cTdG7WaFY=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
 MWHPR04MB0384.namprd04.prod.outlook.com (10.173.48.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1516.15; Tue, 15 Jan 2019 17:45:35 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
 ([fe80::10e5:e75d:3272:2d33]) by MWHPR04MB0401.namprd04.prod.outlook.com
 ([fe80::10e5:e75d:3272:2d33%7]) with mapi id 15.20.1516.019; Tue, 15 Jan 2019
 17:45:34 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "hch@infradead.org" <hch@infradead.org>
Subject: Re: [PATCH v4] RISC-V: defconfig: Enable Generic PCIE by default
Thread-Topic: [PATCH v4] RISC-V: defconfig: Enable Generic PCIE by default
Thread-Index: AQHUqg+MM4/QLJnNHUmA1qDrkrtO7aWweSWAgAAm9wA=
Date: Tue, 15 Jan 2019 17:45:34 +0000
Message-ID: <03cbc37636be7fce21cd2af39ad8e322ca8e64e8.camel@wdc.com>
References: <20190112004117.28265-1-alistair.francis@wdc.com>
 <20190115152607.GA26443@infradead.org>
In-Reply-To: <20190115152607.GA26443@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Alistair.Francis@wdc.com; 
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0384;
 6:xUVLenfEnuIfzFEWtoWbytcJGYqB5KQUPbxjKjxL8+6nHE2dxaEexCtY/MiuCQu8td+3hpRCuEus7nwowBEFN/FdsXXLUslr1Xc+ak8PICEPkZpbVMGy43fEVFX4yuy07446N5b55pLrs6gjNkqjOSjCW0ofOteISIOPdtr+JjE8dCLBvwVAKovYYYxsgJ6DKDZedVXw2UcyRT1AXr40OALAzio2PJeUkRk7RhBpBcaZSCOdBFGGK6xiouA1fj2WgbvkDI5dTeOnoBpW6Bhq0QnFRY8EsavYiFAJFZvWsH0kkQXykkL/4Q9EIBNiAtaJuZccc7rlqajuXmkX3KxyczZ1IaWAYGTtjCN/r0iX01DhtX17eHp2BF2xya8AMnFH4AY7F0fkhpb7E/dc2NitQDvmxFNDjEjVDHoxmlYFvJJ1FkNunkmwJq+52YoU2nabQFdtUdDnidiPW0d1x/rUGw==;
 5:VJaVMSweXv+kgpCWvz1H/gE/BQ2V81y3nWa0B4nPeLPXPEbC+BqRv02yBbvoDT4JQyGd4bHW97igNsy9kC4/IDOfoh8PhcitLw65QKl8uWTK6vMxAaSgbqU8lbt8TM13NmkMOM20wfZi33c2041NZIHxFxoDvS1YGvckgW0hOgaEUO36MyDzPKo3RUAIzApuaKuIoSEUXZl+BKanccVG+A==;
 7:+FSY8GxsFI72x/sPO0tjdKN2gXRo9PTunpt8/nwxBkK2IbvGJ6XvGfWiE9SvlCoEa4klAUzyfRSyvNRh+6dZ1p3M+zDNP5+cPNoWu0CQRqQqpJn1syrqXsAwXHLIbEH3Cn4R7n8Qip+L4Ffa+ZSfgA==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: e9e271c3-e15d-466e-500d-08d67b1140b8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR04MB0384; 
x-ms-traffictypediagnostic: MWHPR04MB0384:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB03848A8C8DA192995C2C380590810@MWHPR04MB0384.namprd04.prod.outlook.com>
x-forefront-prvs: 0918748D70
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(39860400002)(396003)(366004)(136003)(199004)(189003)(66066001)(68736007)(97736004)(5660300001)(486006)(478600001)(6916009)(54906003)(7736002)(6512007)(305945005)(316002)(6506007)(6246003)(53936002)(99286004)(106356001)(4326008)(25786009)(11346002)(102836004)(72206003)(86362001)(5640700003)(8676002)(2616005)(476003)(6486002)(446003)(6436002)(186003)(4744005)(26005)(256004)(76176011)(3846002)(118296001)(71200400001)(71190400001)(14454004)(2501003)(229853002)(8936002)(81166006)(1730700003)(81156014)(2351001)(105586002)(2906002)(6116002)(36756003)(41533002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0384;
 H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: O6hh6+NrgbRoYXprkQwUwzbmtlePQI5Yaim0XMRZ2QPOmizwhnFVL9KT4G4mfN/BYR/35HGHSXHA/1IFegN4a3I8gym9J+9kWqU5h5LOSD/vqkDsGbbiqj6ahj3sdvDIZrPPyRdce1wD+br+B6oOY0WCNiNUnWhebXQEhkhWDHyQX3nhKV/95zudZTCq9ZAeVOMuTtSmEbui6ppl1UUGA+bUJzDv8rtogLPi7RCgVBnEnqoFRVclhWCIbrFtGja7p66B/iyHLR6dewVd3W363lr9NW+YXcqvrF+rVnw8FNydD0mOU0fMaGNeZfPfaJsvQL3a9SXmIs6LNgddT0aRFePUN1hdmD+10rNnznxQvXcq2txZQAK3r809g0f/o020bbaqyJHbdjTNHrAkyhE6PkPwfjt3m/cHNZf8+dRMr/c=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-ID: <90DC464B148407488B48C64AA50D4084@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9e271c3-e15d-466e-500d-08d67b1140b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2019 17:45:34.8684 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0384
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_094545_326354_5DE13DAA 
X-CRM114-Status: GOOD (  17.63  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 2019-01-15 at 07:26 -0800, Christoph Hellwig wrote:
> On Sat, Jan 12, 2019 at 12:41:26AM +0000, Alistair Francis wrote:
> > Enable generic PCIe by default in the RISC-V defconfig, this allows
> > us
> > to use QEMU's PCIe support out of the box.
> > 
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> 
> Looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Thanks!

> 
> Alistair, is there a ready-made qemu machine with riscv + pcie?
> That would be really useful for testing..

Yep, if you use master QEMU (it isn't in a release yet) the virt
machine has PCIe support.

Alistair

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
