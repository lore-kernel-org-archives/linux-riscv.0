Return-Path: <SRS0=MS/g=DD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11049C2D0A8
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 10:01:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 869392311D
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 10:01:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ektayYen";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Iw/AZZBG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="NRQCD5pb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 869392311D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rl7ZyuuGVQ9nRkFStA0igCK46IEBNzXm23inoYya8VA=; b=ektayYenTxzJHL5PyYTNunt1j
	5FUMuWm+9dTJM29KLMMH+cZ9M/8gz8CpD8ZbEjuB0FHtDhpZvZ/hC/jOSDoG2qC9YBQK7ZO23mOy0
	hh+G2KzIJ3+PDKCwjzECvnmVJUJYlhMO321mqO8WuuWhbBqdFIxP1c+2JVYZbNrtJTqJ7wMjsFDef
	R0uxoOLmHvRNF0HipGbMX8cp6bAuDQYcdbayWlj6OO08qSEF/0oWYJLCuOC7VrS/+b2JGpcSwcGgm
	W46b5XVpOVeNEWwLyO1HcZEvprMa5UgnQQocx8Fvw6HKFPbY5YnqOmcZuyX4ULdDc55hP0ZF+Z/tl
	8Vw1aVQJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kM71H-0006Yx-Gl; Sat, 26 Sep 2020 10:01:31 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kM71E-0006YR-Og
 for linux-riscv@lists.infradead.org; Sat, 26 Sep 2020 10:01:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1601114488; x=1632650488;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=MvZBkz7bSacn8DuwqvbVk+t6b7fMTphW7tw3aVMsiuE=;
 b=Iw/AZZBGbS1XWYTC1nLS9/FpYGWSkKmmpZ3jPv0786i0G+Lix1rW2X4F
 T7m9h1SEoNbEZLQhSlfZ5OPnk4a+Xk1n0rApPWgEdW49AmNXsWLwYFF05
 oKLNLv3okamcxI5SVWZNrljgtm2j4vk7xUK0kXJbXLOuHG0MoYS7ikuNw
 qskauSVwAI0BVvZaPDjIQdufnKvuTfmJR6402EX8z4VsbmgWVMKFdcGGa
 Q9K1ny6UR7B21uswhEszE4gj9F4+lUuSOV2gsc9QpzfAjVN7iSRjidOfd
 6XmPAwoja3lvC7Lz7B4bZKYK2CTvkneq6q8znfUYL+S5vo/ExwEbwc3nU g==;
IronPort-SDR: 8EK1UhgBYmWgCzGL83m9rWHu3DBN01VQ/GbT6/DGnQOZSLrLKl2brMjQxva0tgqcLwY6wA4bGy
 rUmLdPgiVXuEBsoLK7zrKC4+OMsiAt4jmwSAZgpXbJglHLjQiompcfHTVnP/4vT+CF7YSvwPHR
 50Kz9cnSdxkBZLRi83chqdsA8ySMCYsptve8mJi8NJyEv+YJQdqarnoKkFrP2jabgYZEqf7Auj
 qN14IIaOEP1yLPPZJNFHL9Hk3Z/CyZ9I/3wTAhZMTXMJP4KwTkSu49MtBMKRmRoEQvidZrNbf1
 BKk=
X-IronPort-AV: E=Sophos;i="5.77,305,1596470400"; d="scan'208";a="149556441"
Received: from mail-cys01nam02lp2051.outbound.protection.outlook.com (HELO
 NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.51])
 by ob1.hgst.iphmx.com with ESMTP; 26 Sep 2020 18:01:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJn9f/sbYTBD2bwZjxu5K0Evd3ljO6o57vqIOk8qyLNBjFzqmZKsf0Df29LohWK57sRhv/HJ3aR9q1fqtD70wqBifNJp0BE8i0rgcGc+rdOJdish/MZuqWDEHKChBA0ACJ6DUmlINHv/Dm62fpjP+AdLfFHDP4w8YPOCpikrg32zdtynW6+us6ftLq6dhgPKhH5eEKF7aJUlA2H7uzUDxosmQShi2nLpHu0Jl0SP1H07Hmdh6jcjfGLMD4cy/beM7hH58Sci5FuExC/5MK+aks/UAy3Rvrv+NYwuECgHOmJo3INCO68BSrEt3Rw+q/ua4Z0FDvKkT0XzlcR7vy5uyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvZBkz7bSacn8DuwqvbVk+t6b7fMTphW7tw3aVMsiuE=;
 b=bHP4xQPuo5IotmFZtfutTYtxfAhrRfI4DBgROxaZtPa0qlLuEsUBlB4J9RJyKeUTcTe9ftQB9DQ2wXZwTtwYL4H1tx0ct/HfMmAC96Lrea+p5OCJUf5BIpYBxoRKaOe91q1n4CTqyS7RcgMwf+A0HmwSOuxknKz09ch3PjCQST+huFC2SN4T94IxaEthRPcmhudJYQGY/ZYALZMhYuxF4H0dfdGpZF5h6IUwbFmI1wbZ+ZP6hp1AtXzKGkgAOhRZecVPMi7H7LhyS9Iq4TKmbO0ti9IHsbqfvMqSzty4ioqx3J7bFfAROuT9a0OU61rX3RdGxfESh/TRUW5wwwi5Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvZBkz7bSacn8DuwqvbVk+t6b7fMTphW7tw3aVMsiuE=;
 b=NRQCD5pbCX4o2lboSBI8QYB2GOabgVi//qWJxo3O0AIFQH+bJHguUP75/pORJ6xk0lasHwtBffhpZ3hhy25tkdywUiWfrkQ2vrjpVWQ/3n9Mlt+GaGuD+JrMKlD9ilcnynswUXCwSAdjCesSRb2aPpHnkxb70p2CMt52XZTXIwg=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY1PR04MB2316.namprd04.prod.outlook.com (2a01:111:e400:c618::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Sat, 26 Sep
 2020 10:01:22 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7%12]) with mapi id 15.20.3412.024; Sat, 26 Sep 2020
 10:01:22 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "anup@brainfault.org" <anup@brainfault.org>
Subject: Re: [PATCH] RISC-V: Check clint_time_val before use
Thread-Topic: [PATCH] RISC-V: Check clint_time_val before use
Thread-Index: AQHWk9aYSJLcKwhKG0OB2/Vy4ql06al6pkQAgAAB0ICAAAQAAIAAAxGAgAABJYA=
Date: Sat, 26 Sep 2020 10:01:22 +0000
Message-ID: <6c2d3e6bc1574d2ec3b566ee2138ba354459aeb8.camel@wdc.com>
References: <20200926072750.807764-1-anup.patel@wdc.com>
 <1ee25b9bca3956d15a4a0dbf83f43d1ead454220.camel@wdc.com>
 <DM6PR04MB62017875C739101DF83280ED8D370@DM6PR04MB6201.namprd04.prod.outlook.com>
 <0e1990c99bf2a342cd2e78ec7ecfc2fdecaf67fb.camel@wdc.com>
 <CAAhSdy0-rj3LWf+Ma6PTJkiwnMPq-mRXdvR+esfZefhcZeyayA@mail.gmail.com>
In-Reply-To: <CAAhSdy0-rj3LWf+Ma6PTJkiwnMPq-mRXdvR+esfZefhcZeyayA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5 (3.36.5-1.fc32) 
authentication-results: brainfault.org; dkim=none (message not signed)
 header.d=none;brainfault.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 526a4056-828c-4ed1-1e34-08d862031f35
x-ms-traffictypediagnostic: CY1PR04MB2316:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB2316528B12FB09C3CC5A5AD6E7370@CY1PR04MB2316.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tpaCjdIdfR9EUlRQkGuwuW1ryHqw78cGKTiXK/k+bJTo7UFt4JLC9TxEPLyiXvygplAXxFKxwOkGshaz+tvDTZNt417nQeJ3OZGAbMOJISEVDC/52+BTR1J0Tw6VBQ0u/Ft76zxeJ/3ziQyjwPoKzRsksYNf9qbZsGzsaKGliM0/m5H46ASMzHoMneYKQpZfYZ/ZEFCC50BaHCt/vcqSVXlFnEeyWt/0NxQtYR9aleTPYpXG3Ka69PqWFOpMyypR6JRUYAl/3wS9RoV2Y2fFo2RFWckjRqD9AGyi1DBPZemPYpBCiK4a7Gmj2pGVZ2y+A+3RfPFY0i9RLfBhnMwo+2l5B7kTzRUlKyBlCtjggb9Z2Gy9jdGrW3vCPMK7GMCv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(136003)(346002)(396003)(186003)(54906003)(2906002)(36756003)(86362001)(83380400001)(6506007)(53546011)(316002)(66946007)(6486002)(8676002)(478600001)(8936002)(71200400001)(2616005)(6916009)(66446008)(6512007)(5660300002)(66476007)(76116006)(91956017)(64756008)(66556008)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: fmv9GP776bWT5cogBIK6ow9YxShL/8XOW4lTB/kGXmEhkAgzO3cv/pZQUSe5mQKxnDbMKH+3awwcYqvFH3Ln3EbuadWuI/P1XBqo/cunpzJntmTjJUVxommrHqxjSagkdAePgso5kovZa8Sk3IccQuerYJEPZmR+g9gPzNg2QHSNbuG15892dHhrjYHWLha+BK7JN0gv3wEuPAJiMgBwW1ksXrPmRKoq4wo/q63MN0G9Bx2o0nUxYzgnbGPDpS3X8nXNu6I9/LFnn+35ZI4+2x94nNhTA/9l2eCnaulABqymgOmJ8jLxuaZY7L+QzJ+nk2GFCqa3TpTclc7ig36+4B2jTp1lb+/Hpc0SAN92cvl31nDRYi3fiVhSLFhSRs9IOpqBti8W0W5ATb+J1hh5h64ycRacgk54b//L78oXd+a+tbbATrEhngTZSS7wQIe8wQDr0TdYC9PkNoBQcs2uj3vDYQsVnF2AfsUD/3EjlLGR06IB2y95VtVmnJQdo5W0Iut8K7M+PYxradXAATcaLWUW9EfwJWWss30XiqWPaUNkNwNt6zrT2jw0fgIZTpJR1iEI2I+EcW9kNr1hcGSiR9bRXk6NpFotxaUZUi3V++YdD12DttLS6tcea6hLY2ITkQlTyWEqnZ0vmTyYdf1rV+/X+nBsNqPHkTJFozg8LojldGCdB6d9GjxiegzBji3Sp7J2UPPsKgYrVQiF7RxQDg==
Content-ID: <3EC163FD21CDF047B836AEB211E92BC3@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 526a4056-828c-4ed1-1e34-08d862031f35
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2020 10:01:22.0224 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nLnekPAIjgu2TciJROnroXdXjK/ssyWg40p9pk92fIZ1ddlb4Qt5azxoOCJwJNP+aZrPcxJFLNO566TuO7GmtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_060129_260386_01EE95CF 
X-CRM114-Status: GOOD (  33.42  )
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
 "palmerdabbelt@google.com" <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 2020-09-26 at 15:27 +0530, Anup Patel wrote:
> On Sat, Sep 26, 2020 at 3:16 PM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> > On Sat, 2020-09-26 at 09:31 +0000, Anup Patel wrote:
> > > > -----Original Message-----
> > > > From: Damien Le Moal <Damien.LeMoal@wdc.com>
> > > > Sent: 26 September 2020 14:55
> > > > To: paul.walmsley@sifive.com; palmer@dabbelt.com;
> > > > palmerdabbelt@google.com; Anup Patel <Anup.Patel@wdc.com>;
> > > > aou@eecs.berkeley.edu
> > > > Cc: anup@brainfault.org; linux-riscv@lists.infradead.org; Atish Patra
> > > > <Atish.Patra@wdc.com>; Alistair Francis <Alistair.Francis@wdc.com>; linux-
> > > > kernel@vger.kernel.org
> > > > Subject: Re: [PATCH] RISC-V: Check clint_time_val before use
> > > > 
> > > > On Sat, 2020-09-26 at 12:57 +0530, Anup Patel wrote:
> > > > > The NoMMU kernel is broken for QEMU virt machine from Linux-5.9-rc6
> > > > > because the get_cycles() and friends are called very early from
> > > > > rand_initialize() before CLINT driver is probed. To fix this, we
> > > > > should check clint_time_val before use in get_cycles() and friends.
> > > > > 
> > > > > Fixes: d5be89a8d118 ("RISC-V: Resurrect the MMIO timer implementation
> > > > > for M-mode systems")
> > > > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > > > ---
> > > > >  arch/riscv/include/asm/timex.h | 12 +++++++++---
> > > > >  1 file changed, 9 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/arch/riscv/include/asm/timex.h
> > > > > b/arch/riscv/include/asm/timex.h index 7f659dda0032..52b42bb1602c
> > > > > 100644
> > > > > --- a/arch/riscv/include/asm/timex.h
> > > > > +++ b/arch/riscv/include/asm/timex.h
> > > > > @@ -17,18 +17,24 @@ typedef unsigned long cycles_t;  #ifdef
> > > > > CONFIG_64BIT  static inline cycles_t get_cycles(void)  {
> > > > > - return readq_relaxed(clint_time_val);
> > > > > + if (clint_time_val)
> > > > > +         return readq_relaxed(clint_time_val);
> > > > > + return 0;
> > > > >  }
> > > > >  #else /* !CONFIG_64BIT */
> > > > >  static inline u32 get_cycles(void)
> > > > >  {
> > > > > - return readl_relaxed(((u32 *)clint_time_val));
> > > > > + if (clint_time_val)
> > > > > +         return readl_relaxed(((u32 *)clint_time_val));
> > > > > + return 0;
> > > > >  }
> > > > >  #define get_cycles get_cycles
> > > > > 
> > > > >  static inline u32 get_cycles_hi(void)  {
> > > > > - return readl_relaxed(((u32 *)clint_time_val) + 1);
> > > > > + if (clint_time_val)
> > > > > +         return readl_relaxed(((u32 *)clint_time_val) + 1);
> > > > > + return 0
> > > > >  }
> > > > >  #define get_cycles_hi get_cycles_hi
> > > > >  #endif /* CONFIG_64BIT */
> > > > 
> > > > Applying this on top of rc6, I now get a hang on Kendryte boot...
> > > > No problems without the patch on the other hand.
> > > 
> > > Not sure about the issue with Kendryte but I get a crash on
> > > QEMU virt machine without this patch.
> > 
> > With this applied in addition to your patch, it works.
> > 
> > diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-
> > clint.c
> > index d17367dee02c..8dbec85979fd 100644
> > --- a/drivers/clocksource/timer-clint.c
> > +++ b/drivers/clocksource/timer-clint.c
> > @@ -37,7 +37,7 @@ static unsigned long clint_timer_freq;
> >  static unsigned int clint_timer_irq;
> > 
> >  #ifdef CONFIG_RISCV_M_MODE
> > -u64 __iomem *clint_time_val;
> > +u64 __iomem *clint_time_val = NULL;
> >  #endif
> > 
> >  static void clint_send_ipi(const struct cpumask *target)
> 
> Ahh, clint_time_val is an uninitialized variable.
> 
> I will send a v2 with your SoB.

No need for my sob. Just merge that in your patch.

> 
> Regards,
> Anup
> 
> > --
> > Damien Le Moal
> > Western Digital

-- 
Damien Le Moal
Western Digital
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
