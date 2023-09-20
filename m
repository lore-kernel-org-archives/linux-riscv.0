Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AC7C04AA9
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 15:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l8101appE6Bg+OnD44lFoDfAKfbygtTy/GjGw9bRB+4=; b=YY/QEBc0EdCNRW
	HqxLuyjrJq9OBgGcBl9W/pNr6TpfaMPxA+a6FAko+tuTn0wum2dX2buatAhsI9o1EwyoAcjizPobM
	eRIXgi7RrFOAYi+D0Owc/t4SFSY9+U0hvHAQYsgLHrt65GsPGHf9wSfhBEVltIxGX02/okn1IiKBR
	EmwjwCPAjuDcKzaOiCyilriLK/cuN7RJWCxyjNxss/gQyo13hP3HkS8oCX4inYIX9uMbXMysexqKa
	fsC987uNMdyHADhHEuU1ZX7D4HtV10Slff/R9iLgvttMNUYYOXF4qRi9dMfRFRnBM4pgqUqzHTN7e
	YkcGzhihP7JQ3yE/gDFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qizKw-003X4z-0i;
	Wed, 20 Sep 2023 15:41:58 +0000
Received: from mgamail.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qizKq-003X3V-1z;
	Wed, 20 Sep 2023 15:41:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695224512; x=1726760512;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=j3l/PzDF4/EH4Iaz4vb5HgQEC6efe6WmpOydxbUIQu0=;
  b=j0pgzzpsmKWRjxhdV16Q9lR7l347NGubsYbtnlSNGLmCWfzcmtftrBm9
   v5wgwVBUGQJZtfYmjuOVV1w6sg7yo2KpfmbaEd31yaiwojRCc1u10ZxtT
   5itFeDhTZI3iI4ciTYsJaio4TrqAqdQ4AVKFlY3rziTqxttljJcJR9a26
   43thAWpILTeI+bESB8adaVqlSThAWUs1GoCMEZHaItFJrbP4JWPU6qdc8
   e0GXThOj6XmgkrfctX+jKRtLIS1jC0Suju6if6gudRLWBjdpj+S1uJ4Y0
   LclFreXpCoM11jDBxwxoI7OJIfzGfHgfGPt3LQV5lQ2bAec0OSR/NOqrT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="380173918"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="380173918"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 08:41:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="776041186"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="776041186"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Sep 2023 08:41:51 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 08:41:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 08:41:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 08:41:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3XIY6XJw/P+VofreifOcQa432WHjCqV8fyRsKE55QBmtwj49QQGqG49iN04zZkRexAz5+LtZ3boJoXotERjqoXJ1B3sqyZgXYq+3OAxOCbQzriOzS/8DbfQ3Xy/UE/ysP6fMet8W0JckMYmY2HQwLtlaaRKSqqfGX2qHfb1LdHZMf0Yis1w/pUuW1hirITlZvuhNQ1t3dE41gl2oXf6fOCIwAELiDTW3s+ijCCs6NlNkImk7sxtTP+r1GfODMUe5L4glpRXU/FauVkwjmUq0kDRTCEQbg885f4suNBfkHUX2BPhB1ac+mXgULzgGA+GLgcNEAa9BqnU8KmxwhbwzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GnSolmgUxHqIVpgg3wdi5rmK9xlXVzHN08IHfuKluUs=;
 b=VtoI8ZpvPvMnO+tNq1uiBKkIC6LDbBcTf/7vpQ6+4qm+Bs4016GCeX+UnbAK3Uwe1AhVqy0Qfk8fJdE9ZYk67hmaK3kJYVUxFjWoshGkfZezRQ/4MUGhcZi7jdjqqEUwdlxs9KeqlzLZ+qCTOsg011HD/2nTAjJEeovAfNA8ydo1EnRqX5kKoEy5EbKM7lIX91HbQFHh86Wn0Rjwlvc9sJ0rAZp6b/ZouS79AAcX1sIV4A0DeRDQn2IWPQZ2qT/pFSzWOQVBwo1rXg9xJ8qzQcercfpGu2FF7kvIhMuipYR5tN+CpY3bwoF634ri2T0y9DTUmfq4q3Jvo14Gn7lxYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by MW4PR11MB6887.namprd11.prod.outlook.com (2603:10b6:303:225::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 15:41:42 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::713b:b9da:7c2e:ca36]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::713b:b9da:7c2e:ca36%4]) with mapi id 15.20.6813.018; Wed, 20 Sep 2023
 15:41:41 +0000
From: "Xu, Haibo1" <haibo1.xu@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"anup@brainfault.org" <anup@brainfault.org>, "atishp@atishpatra.org"
	<atishp@atishpatra.org>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
Subject: RE: [PATCH] KVM: riscv: selftests: get-reg-list print_reg should
 never fail
Thread-Topic: [PATCH] KVM: riscv: selftests: get-reg-list print_reg should
 never fail
Thread-Index: AQHZ69AEXjX189HAC0ONW9fNVtTpErAjyy3ggAALRgCAAAEeIA==
Date: Wed, 20 Sep 2023 15:41:41 +0000
Message-ID: <BY5PR11MB39096DF33476CEED1BCAF879B0F9A@BY5PR11MB3909.namprd11.prod.outlook.com>
References: <20230920143713.6896-2-ajones@ventanamicro.com>
 <BY5PR11MB3909D011A5633AF7496CFFDCB0F9A@BY5PR11MB3909.namprd11.prod.outlook.com>
 <20230920-326d0d84a57240dcebca6277@orel>
In-Reply-To: <20230920-326d0d84a57240dcebca6277@orel>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3909:EE_|MW4PR11MB6887:EE_
x-ms-office365-filtering-correlation-id: 1a526f76-c6d3-4d12-c17e-08dbb9f0162f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zQLAAdlGX0RIXQlP16bZYsXDEb49Cm3Y0j1f6zJ+5q86Fj3Q6Pg9dwZZvnPFakOj1LDLlAT6vE0DUlL6BhMG7b7CfYhjwmElJ+agFSxkZ0KVX+ZWSn9zAgCGfuF0tiZGIvtTUERFs/LHxyE+jGD2XIRc/3I6arWkBZjAR8z+Q0U8Bw4UjubRdONFVXoJu21PL3lJc7UyULiV7NUf3oR+3gl4Yx7x4iIF2uFRZXIMFhR7tW+Gn+Md3egw+a+fzLnxHUvx9NqTlY7RmuJAQylCTTsCjsHwAwk3is6iTBsGaHpITk4lwIk+IRiPHOczTzCP0p11R+PDbc11PErp8722kAB8HD0UHjEaOaaJZA7hjZTDNBOGKGYXAf6alg8QE+A2mruLm7vqFffDpkUezZKrTFF+0W9FM+poU+W7pYwS7Ff3TSjoW9EpOmhXEJ0FwLfJhqFPpgCdNSakt7i/Kq7VzwrVmpKtD8vfcCEbAXoELnfidactkPW9FsOlrPdKZbfcF54rcVzmyn+nwCh4n+ODDQisdPD5y2v8+rtdQsNPb82cuYZ6Ym6YgfPURAIiJPjr3X76BWZR3fZxiSUJbNetHQS8jbtGDJZiboezhfaAnKs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(136003)(396003)(39860400002)(1800799009)(451199024)(186009)(7696005)(53546011)(6506007)(26005)(9686003)(82960400001)(122000001)(38100700002)(33656002)(38070700005)(86362001)(52536014)(83380400001)(55016003)(5660300002)(478600001)(41300700001)(6916009)(54906003)(66446008)(64756008)(66476007)(66946007)(66556008)(76116006)(316002)(8676002)(4326008)(8936002)(71200400001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Zn1UmeGCNnxyCMabTVhEK+bPL6uJw+vgCGpIiq+cJIrdQgLzPz7LzFpx3m+S?=
 =?us-ascii?Q?Gz+NG26j3xldmXjDq4rfyQzcuvIc3ijUqBDu/6b2ehf+1ggDqsZqbfPDpVR9?=
 =?us-ascii?Q?ZjHHkaid2ox7abqUMRUwhRemEhxXIwwG5fa8gJx28XFu6vTJ5ajfLgJEU7o3?=
 =?us-ascii?Q?vTHUvMOk5Lx8GRSAeMS7E4LcTOQKBTy+P/R4lMuGkKe/lXKSa3wiZZ3iRVIG?=
 =?us-ascii?Q?KR1Qnmt99U1kk7uoiDbZjeOKjAuyEnF0KBu5ZxMlaFOXiT06ycwQPs6r9DKL?=
 =?us-ascii?Q?7P3BkxRNespWLTzs4w4tX7SFj70zJpl2ITEHaCajIXzc3Qu0td0+nUytTi/n?=
 =?us-ascii?Q?gfHTizqgmf91UhR2g+hBEXarvOCAOovU5vJOKo6xfpDm86ygXSD4LlkZ0yMI?=
 =?us-ascii?Q?Lbyo+XUq1662AGort1a0P+uSFDXEIpUwBRqqvipBSUi6+b+HNGlKp9ufqXQN?=
 =?us-ascii?Q?mtAxwtiy/buq7Tk3sB/jrKbtbTy77NPP1YtTecepe6MC8M0Sei4qgJuEb5Bj?=
 =?us-ascii?Q?j23FNK/42CyOSPhqZvHMew1nc6nfQ+mW4NQHdSLurlpLKB9svZV6/I6Nu3n9?=
 =?us-ascii?Q?PxggzEVSoxxpy6FqVIo0LfgltkkbBDBZhiuLCfgcb5su3D0aL74XrMsmUpvn?=
 =?us-ascii?Q?AtG7EtgxzhI3Q9gLzU7H5v/gTIByi3se1X4QpAycQjnyxxb34/75hDcLg2fs?=
 =?us-ascii?Q?6OD+LvPK3je3/sCY90UyrMwts8ZFGM7bG5v+TeUEujCOq54gMXj/F5pIku5g?=
 =?us-ascii?Q?rZf5jJkgxgKFcHF56qZeqCMNpBFJ2ZmxjmQOFGoJPg2Gcdo9fjw/S90sDDYG?=
 =?us-ascii?Q?z8QKx6rTADpJXOXQjDfbU+zzl0nq1jWqIl/k0ZSlcBbHFmC5OjXrD+aTQ8Kf?=
 =?us-ascii?Q?BkBb4khZJ2U98qw07g0LqStnNgWYnyZzFo9FB/Z42LlacUD9ctkFLRkT1TdG?=
 =?us-ascii?Q?yjxCr5A2JP3N0pgrpusg+UV8WmFlVwXj+SMVGihkr8kwi2/7X+C7XVGkjiXy?=
 =?us-ascii?Q?B1H6UfhdLWlZMTVSw4l7TKfNqLLH/kU+T9hA9kN0tWgVvSzSmHWejseLlu/C?=
 =?us-ascii?Q?+DbhAo4pgpfOJObGVM9jOG9XN0oIU91GQZ5QAH/EhDDLAB79AiVQqLO7sEq4?=
 =?us-ascii?Q?7qNTebfn/LFI9mB1uEjCP4wCUCxUT/KOZqLCasFLm+KlK3GqOJkNDnSuecZx?=
 =?us-ascii?Q?gHuTwnbYsScsah5stoV5TwGFNUi/WtLcFXQLQzbEe+bsUu0yYWAMHVdcM1L2?=
 =?us-ascii?Q?+C7srtLiLx/Xc3OYrHoYWUlkvkoQms0x9yE5d86vgklL4+lYgQGwY2rv9A7d?=
 =?us-ascii?Q?tEzCnTqWTrbBO4onDkplOWXZi45MUXHKM5XxJRpYNhVEUkDGPyL8ed95Mxgp?=
 =?us-ascii?Q?XQUfRIG9H5Cr/hR77ORdd28ecJFkvcSMx3hM/8FaP/S8m95/ApfD5FOOPxGK?=
 =?us-ascii?Q?4aQLwRlbB6DQDBmwO67wuIgOH96ixgfeTQ/aiVyQA4zf/Xi2/4+YyX4y+l4Z?=
 =?us-ascii?Q?IgTWLCTeorj6Rm36c52yijn4ycbDVFK12qYp16b5W15saHxeuwTMB7UcCeMt?=
 =?us-ascii?Q?fcGGv6uGHfl7GrNwQJhmBGdECy+eD1AJdpKxIiUq?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a526f76-c6d3-4d12-c17e-08dbb9f0162f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 15:41:41.8364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wq30twPgTnZ88vSg8JgyNBIGkwgKe9hHrO9cLugmu8Mm0w1JVcCLW66AlumraDZ4bgjG92yTGaCH90mbp7OdYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6887
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_084152_668647_1AB413A6 
X-CRM114-Status: GOOD (  24.95  )
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

> -----Original Message-----
> From: Andrew Jones <ajones@ventanamicro.com>
> Sent: Wednesday, September 20, 2023 11:28 PM
> To: Xu, Haibo1 <haibo1.xu@intel.com>
> Cc: kvm-riscv@lists.infradead.org; linux-riscv@lists.infradead.org;
> anup@brainfault.org; atishp@atishpatra.org; paul.walmsley@sifive.com;
> palmer@dabbelt.com; aou@eecs.berkeley.edu
> Subject: Re: [PATCH] KVM: riscv: selftests: get-reg-list print_reg should never
> fail
> 
> On Wed, Sep 20, 2023 at 02:59:07PM +0000, Xu, Haibo1 wrote:
> > > -----Original Message-----
> > > From: Andrew Jones <ajones@ventanamicro.com>
> > > Sent: Wednesday, September 20, 2023 10:37 PM
> > > To: kvm-riscv@lists.infradead.org; linux-riscv@lists.infradead.org
> > > Cc: anup@brainfault.org; atishp@atishpatra.org; Xu, Haibo1
> > > <haibo1.xu@intel.com>; paul.walmsley@sifive.com; palmer@dabbelt.com;
> > > aou@eecs.berkeley.edu
> > > Subject: [PATCH] KVM: riscv: selftests: get-reg-list print_reg
> > > should never fail
> > >
> > > When outputting the "new" register list we want to print all of the
> > > new registers, decoding as much as possible of each of them. Also,
> > > we don't want to assert while listing registers with '--list'. We
> > > output
> > > "/* UNKNOWN */" after each new register (which we were already doing
> > > for some), which should be enough.
> > >
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > ---
> > >  .../selftests/kvm/riscv/get-reg-list.c        | 93 +++++++++----------
> > >  1 file changed, 42 insertions(+), 51 deletions(-)
> > >
> > > diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > > b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > > index 85907c86b835..054706538b9e 100644
> > > --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > > +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > > @@ -112,11 +112,13 @@ void finalize_vcpu(struct kvm_vcpu *vcpu,
> > > struct vcpu_reg_list *c)
> > >  	}
> > >  }
> > >
> > > -static const char *config_id_to_str(__u64 id)
> > > +static const char *config_id_to_str(const char *prefix, __u64 id)
> > >  {
> > >  	/* reg_off is the offset into struct kvm_riscv_config */
> > >  	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_CONFIG);
> > >
> > > +	assert((id & KVM_REG_RISCV_TYPE_MASK) ==
> > > KVM_REG_RISCV_CONFIG);
> > > +
> >
> > I think we can skip this kind of assert test since the function was reached by:
> >
> > switch (id & KVM_REG_RISCV_TYPE_MASK) {
> >      case KVM_REG_RISCV_CONFIG:
> 
> The assert is to ensure developers don't call it from anywhere else, where they
> may not have already confirmed the register type. And, that's why it's an
> 'assert' instead of a 'TEST_ASSERT'. It's for developers, not test results.
> 

Yes, it's helpful to avoid abusing this kind of APIs.
 
Reviewed-by: Haibo Xu <haibo1.xu@intel.com>

> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
