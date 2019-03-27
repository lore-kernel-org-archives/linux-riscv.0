Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 230D1C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 00:10:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB4B72082F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 00:10:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LOFSLd9q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="SHVzAu1V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="hTyk/I8B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB4B72082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GUcSWwNcw+BO+4JKmr+Laz2PBBOk2uGL25R3bnUQSqM=; b=LOFSLd9qdcQ9SS
	6OrT1wbRW1g7TiFkacz+5xcOT81f0S91Qjm1dz7BIKJbwOd/2vL8lDWJktpAz+vqdgiPfaVW1FHtt
	6a8SudfnPowlIBMrfJc89lof2eT3AgZnY9Qwe8m9wMRFHAoeNN/AwxRqbROEfKhyhShyJH+av6IF2
	RcAMb4eOnwWFAG9AWo352iERoUlx85kr+qT1IDlpEtNHNtNE0YqgdDLLuTPQJz9s84ggEHDW2r+hs
	3PH2KUs2q6miOkzw6HK9+3bjuaLrJ3WK/nIkx+kn/QRAtMljDCzDXEiV/FUqdOSGstaiz7D1CthVT
	5DXt2a2mGj7e64nFLjzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8w9E-0001ER-8C; Wed, 27 Mar 2019 00:10:28 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8w9A-0001Ds-B4
 for linux-riscv@lists.infradead.org; Wed, 27 Mar 2019 00:10:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553645424; x=1585181424;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qetdiKkUYEiIIAQxweMv2u8ydDKbFu0c11ISkIwgzt0=;
 b=SHVzAu1VL8JXiVZozGiSwu1oNGOLALilAI2gjtxmtfBJ5R4hSSB9nve/
 obzn3Zt77L8yTfJ2FgMUaoaJ1LFcSznN0xpBW9iNIoLYdoV/BCC/Dmxd9
 A0MLVtE1HC4HaLVY74Y6Hw25bMJy7JW5CVwbTrJNelPlZ23D+Wiwpv8mW
 PhS5Ln7iyUMJVwXPd8059fSE0UYNHQ3EjiypTBRUs9i/N4wt+zMLhJNoj
 umacwMZRZCz1H1OD6x+RqqIva7zHOT6C+g1gGgigIDwmSWxrQRiW9h1nJ
 QL+LVjkDow7q5DHrnZItxu4ipKnCrBgXNP8rIeQmkLryxTObpkoy48bsd Q==;
X-IronPort-AV: E=Sophos;i="5.60,274,1549900800"; d="scan'208";a="209944927"
Received: from mail-bl2nam02lp2054.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.54])
 by ob1.hgst.iphmx.com with ESMTP; 27 Mar 2019 08:10:17 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qetdiKkUYEiIIAQxweMv2u8ydDKbFu0c11ISkIwgzt0=;
 b=hTyk/I8BpvH/f0BC6trIwLZo6HsYjvzA7x262tcOOZIa0LzxOyp7YayNEQ8COA7A1Ab7QqG7Ob2rwSX6oXM1kMTSVS/d0V2ddIShjHB69CMcb0kupDzi9A8rZYgRmM34ToYjk33WNgROmqtvfnilAj+4JgSsTH/Bqds6E2A/Zl0=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
 BYAPR04MB4453.namprd04.prod.outlook.com (52.135.237.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.16; Wed, 27 Mar 2019 00:10:14 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
 ([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
 ([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1750.014; Wed, 27 Mar 2019
 00:10:14 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "anup@brainfault.org" <anup@brainfault.org>, "palmer@sifive.com"
 <palmer@sifive.com>
Subject: Re: [PATCH v2] RISC-V: Always compile mm/init.c with cmodel=medany
Thread-Topic: [PATCH v2] RISC-V: Always compile mm/init.c with cmodel=medany
Thread-Index: AQHU4stf3ADUNp6rhEGQZMtUXoGrnqYb5+cAgAADuYCAAURPAIABbRkA
Date: Wed, 27 Mar 2019 00:10:14 +0000
Message-ID: <a8f36469d3ac9dbb6e0621207fecb9afd70567f0.camel@wdc.com>
References: <mhng-8e00a3e3-5a69-4828-b7bb-2bf000199b48@palmer-si-x1c4>
In-Reply-To: <mhng-8e00a3e3-5a69-4828-b7bb-2bf000199b48@palmer-si-x1c4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Alistair.Francis@wdc.com; 
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9863dbf-32db-4522-ca97-08d6b2489616
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR04MB4453; 
x-ms-traffictypediagnostic: BYAPR04MB4453:
x-ms-exchange-purlcount: 2
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB4453697983CDB52976C5ECF490580@BYAPR04MB4453.namprd04.prod.outlook.com>
x-forefront-prvs: 0989A7979C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(376002)(366004)(39860400002)(396003)(189003)(199004)(72206003)(3846002)(11346002)(76176011)(446003)(6436002)(81156014)(53936002)(2616005)(8676002)(229853002)(86362001)(476003)(81166006)(478600001)(6116002)(105586002)(68736007)(6306002)(6512007)(118296001)(6486002)(7736002)(305945005)(110136005)(54906003)(316002)(2906002)(486006)(2501003)(102836004)(26005)(5660300002)(97736004)(53546011)(71190400001)(966005)(4326008)(14454004)(6506007)(8936002)(25786009)(66066001)(106356001)(36756003)(186003)(71200400001)(256004)(6246003)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4453;
 H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OWyJoRULL+hOLFGaaDlju7w0Mty+l8S74sO5B1fA/VdtiGXbXGlCvDLrLSZ4kTVX6V8W0DMuJkliIJ55LiOFqWVgw56HINHOIklQCHiOfjf3sPV+t/SRH3pNtKE8Rhr0rH+5iVGcBHiwxKgLMJeu2dexwz2K5FhZ8YPKeeJ9I1sYOgohG7KK7mb2z0YJeQCvNGTq9GcDmq37nK7smkgOGl9VLPXqIRt4m1O7f8Mf0g0q3WH95E2kuDDjvU30r6TRRv9u+aJ5JeFuwZcDlofOPrYz1LFKM9FNqZMEQWG6pDi4t79KSYCAWRp9CktnaTC3ysJVBHxqIW3PTz2plHAmtYe+WzkchZW3m8yRK5Tao4igoLaU0H20A9ihk5rUACOrGGU9WdbsR1sa4V/GxSmofSWHYRyKObM7j7NNgy1SmFw=
Content-ID: <7E583B1A38CAFE4EA9B307C08A03570D@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9863dbf-32db-4522-ca97-08d6b2489616
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2019 00:10:14.3938 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4453
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190326_171024_586239_A7A85798 
X-CRM114-Status: GOOD (  29.27  )
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
Cc: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "alankao@andestech.com" <alankao@andestech.com>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 "hch@infradead.org" <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 2019-03-25 at 19:22 -0700, Palmer Dabbelt wrote:
> On Mon, 25 Mar 2019 00:01:45 PDT (-0700), anup@brainfault.org wrote:
> > On Mon, Mar 25, 2019 at 12:18 PM Christoph Hellwig <
> > hch@infradead.org> wrote:
> > > On Mon, Mar 25, 2019 at 01:25:50PM +0800, Alan Kao wrote:
> > > > Hi Anup,
> > > > 
> > > > Sorry for being late to the party.  I think one more thing
> > > > should
> > > > move together with setup_vm():
> > > 
> > > Ah, I wonded about that yesterday but wasn't sure.  Maybe notrace
> > > is a little cleaner?  Either way we should probably document both
> > > the mcmodel and notrace assumptions in source comments for the
> > > next
> > > person touching this code.
> > 
> > The setup_vm() should be allowed to call other functions within
> > mm/init.c
> > so let's go with file-level notrace (just like how it was done) for
> > kernel/setup.c
> > 
> > I certainly add comments for setup_vm() based on all our findings
> > so far.
> 
> Sorry for being slow here, but this is the right approach: setup_vm
> is called
> before relocate, which means the page tables won't be set up
> correctly for
> absolute addressing.  We instead build setup_vm with medany, which
> causes all
> addressing to be PC-relative.  This is all a bit of a hack, but it's
> the only
> way we have to do this right now.
> 
> You should be able to add a preprocessor #error to check the code
> model with 
> something like this
> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index b379a75ac6a6..d6fde6af8d75 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -172,6 +172,9 @@ void __set_fixmap(enum fixed_addresses idx,
> phys_addr_t phys, pgprot_t prot)
>         }
>  }
> 
> +#ifndef __riscv_cmodel_medany
> +#error "setup_vm() is called from head.S before relocate and must
> not make any absolute references."
> +#endif
>  asmlinkage void __init setup_vm(void)
>  {
>         extern char _start;
> 
> Marking this notrace is the right thing to do, as it can't call into
> any 
> functions that aren't medany (there's probably other issues as well,
> since this 
> is so early).
> 
> Sorry I missed this the first time around, I wasn't paying enough
> attention.
> 
> Can someone add instructions for 32-bit boots to the QEMU wiki?  It
> sounds like 
> it's time to add that to the testing list...

Done!

https://wiki.qemu.org/Documentation/Platforms/RISCV

Alistair

> 
> Thanks for digging in to this!
> 
> > Regards,
> > Anup
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
