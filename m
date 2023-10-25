Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94A0C0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 07:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h8OQ/sZagwICTIR+Ahpq/zwofjHyVQYysUu+NXSt6eQ=; b=wQkbSIqTJAnnWa
	lu6nzebkxbZ8FGRKDDU3wj+6ttHW+niMCN72quDsBiAj7rcWv13BIgECPvsmapIEQYG3wter+PtrR
	ZdofJN3ObT7+7uRqTPKshc2EGsLTgoES7iIDOp9OfPn+3udaszzOVKowOuvuriTPx0JBKsesJdZsS
	w1qarSfZ62qRvUUtBUoiUwx+LJj3q+KXXACsQgtGSpkjasUpQDusGrUdSTDd+PTyICl5kR3ainT3P
	e+rv3NNLlkKSRv4/mrN0qD2/PVkfxB12pOeoLcMqlXRdqX/fuGtjXcxYRG+zFL6dtSnDbl1+NuJGE
	hPZ0IEfHVPbUWYN1UENg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvYLI-00BZmP-0v;
	Wed, 25 Oct 2023 07:30:16 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvYLE-00BZkf-1H
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 07:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698219012; x=1729755012;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=raUY86/H+QS5MovUpE0JiqC8N3o9dL/5R9jE/+8s2qM=;
  b=gc7Cnd283pIe0YfFkBmbzIRTv5EdVoFxlyJh8ueNZYixplDK5wnBXtTh
   hrdfOXSg7UYB785O+IoL2D8hrlsa0JRYURY94nwFyfjjlZ4ZM3IBFbG5S
   ajceo3X0ICfLDzYAQ02dRnf9a6PghG3qmijSukEXsti3djTHe9bU8zxJJ
   /tbb2C4qezN/CxCV/1/2tMvOF6qp28YRmOpRGaICWzwhJqzZMQmWYorIR
   V4ZhPd/F+szoiHg/CqPWbXCx0LdoVVBwm3Vt3r7Fqbs+g5Vju7Frr6X02
   lylHyd9+tXGJM6y8wAm/fmr51CBhUiChul8/5JXCCbuiQuPea2vxXUnrq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="453727554"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="453727554"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 00:30:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="752242551"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="752242551"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Oct 2023 00:29:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 00:29:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 00:29:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 25 Oct 2023 00:29:26 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 00:29:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AU8mdMlNUuRqqbEmsNT6DuL0cKKjDgt+B9oUWvKZvfFukdulnbf51Jac3ppcxAoH8qSlCwmKeR2TCU6BvMf/iqzCpuY0H5S2jw8iq1lLd1G8wr55L6liSYK3T/9MVY0367gcH25ZN3jxmkmwye8ppVCjooE2PAECEvpfSpavPdS+8l6C/zPUjXga878rRPQTYLX33SChTy8DKN6mi3EkFegtuBdwcVSfKSwepi+IrQKulzzVUNLIQtMq9UpDrd+LAPrGBPiFtTjhlRpB7E+tZ5DGGG2bX6mMYhnKApVWr6nxDmAEDhUIQTlR64vvCN5RPII0V8Ow15QeuDfWcskI/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8ToelYjVUnFte+SIY8ol+zXVVB0BY2CiwgwWjRwkK4=;
 b=GVVTkq+Acg5NwaMC0obeNhvjRi75jTpAMFelQ0Y0FDns59RGuux1vrJlVB0JpxPtaKa5C+cy0VQyQFvnLnjtNTUoAHhJh618tI2fu+MlPVau9yX0OL6xxtr71b1JqGya6zptYcB0jcHblw+CErPy/wjHiDBDfRydQiIm3jjwgauk1ZMr0u+OpZOJ98+c0qhq3Gk8pXJKxbsKfxwShnSKoiIBSJVKGvfnBkiQWx5hzTXXRloz40Ifte3VVe4Vw6Ozwk56N9uuUYJxzvqzghc75b2+dMck+hBVqVNmnNoGKvTNjMJdKqk7y7008iQGOBFEk3QXWJ2NXXIT1/6mrPJAdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 BL3PR11MB6530.namprd11.prod.outlook.com (2603:10b6:208:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Wed, 25 Oct
 2023 07:29:23 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57%4]) with mapi id 15.20.6933.019; Wed, 25 Oct 2023
 07:29:22 +0000
From: "Wang, Xiao W" <xiao.w.wang@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Samuel Holland
	<samuel.holland@sifive.com>, David Laight <David.Laight@aculab.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>
Subject: RE: [PATCH v7 3/4] riscv: Add checksum library
Thread-Topic: [PATCH v7 3/4] riscv: Add checksum library
Thread-Index: AQHZ6ympMrC0A68ReUC4iEujE37ngLBaS65w
Date: Wed, 25 Oct 2023 07:29:22 +0000
Message-ID: <DM8PR11MB5751C293320A68C74E2C69F9B8DEA@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20230919-optimize_checksum-v7-0-06c7d0ddd5d6@rivosinc.com>
 <20230919-optimize_checksum-v7-3-06c7d0ddd5d6@rivosinc.com>
In-Reply-To: <20230919-optimize_checksum-v7-3-06c7d0ddd5d6@rivosinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|BL3PR11MB6530:EE_
x-ms-office365-filtering-correlation-id: ca51b3da-30c4-40da-4969-08dbd52c1bc6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VdjusnvJGtTGXYjXCw0EKzrEvA79zK0OeENvRZC+nf8iIi2f2J2x3f6wSS0E7/KGGugsCw6HwJD0/j//WeSfRr0PrLzRPoC/8qmMh0EJdP6ep6uaLZUTWIaUCuUHgrsCgbiNqSsDxZ/hIdei2Xn6EtQJ6+sXGaSHMUSyfNocTm0TNTGYXxkWwWDHkZBSpjgTtE4MOe9Z3CYA9WmYmXVZtjfCx/rGyiBYqjt6aLkj+j42pmKQIiXNZleqWNjZNnHeRnnhuvORdEFl4LE+r6hTd2NH3vRU9pAopSpmo4Wp0sMej73jF9xIk9oTU3G13uMPJiZ4h9msoDdlkcSqo6hqxsV1VTuq/XkPZzsJezcJl+tXjp4W5CTS4ByW2IleZsYkxBfNGzL2K7TfTyi40WSKuoxKZmwvrBLsqwX89/s/27gSQB+ZSZ9Gaf7lR7fZ5Y6QElGhUpGDr7YSPhm6uE3QJ3zMR6Jq2OfkfmzfmO7X/OeLU+d+0fHXV7TRjgt3slDv/jO7/rSMrVA98g5OJdHDYGVGimVfhvgGMd+b8edvt0OhpLuzJ8JgSRO6XsfXgpLjXqstlSXGOfNxfkuS/39oTZlJ2p8OPe3Ye71bHqYBeTo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5751.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(346002)(396003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(38070700009)(26005)(38100700002)(2906002)(55016003)(41300700001)(5660300002)(86362001)(52536014)(316002)(8936002)(8676002)(33656002)(4326008)(7416002)(64756008)(478600001)(71200400001)(6506007)(76116006)(7696005)(122000001)(66476007)(110136005)(82960400001)(66946007)(66556008)(54906003)(66446008)(83380400001)(53546011)(966005)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?T0sK+IwIfOSIxgXEYsx+4Jt6pwvyJRWJPiT7i76udATQRZLvW20ZqFQA?=
 =?Windows-1252?Q?TYLfnfmWIAJzlwvuqGKoTW0nOIlbqwjNC/ug4qG7iLlUFsMxj2ewYI4V?=
 =?Windows-1252?Q?Rh/Tbu9Ves7ApsQxSGQN2QglplMA7+/Uj/zubmzhiIVecc5S6DVFjCD0?=
 =?Windows-1252?Q?2MUfKXe28DbLVTu3NMageVtJOyoGE8SLbS7B6TgMWY3P9NXUWNk1zITO?=
 =?Windows-1252?Q?RN+YliDcI6IFAQzvHKStgbLOeH4zIF2iKi9G4aui8HU7nsUv9cstm79r?=
 =?Windows-1252?Q?4OrcrCJIxA+Vg+tcJBX7CjFJzmOZYXaNfPg4/j5RX7ZPe+9IVD66EvZE?=
 =?Windows-1252?Q?xBS36l8n8FzglrWARIZSDqrU4XgYPcyU+uZBRQsAMFIrHnXS3WNBRf3X?=
 =?Windows-1252?Q?qYDki1KId3w2EIATVPNvDYI3ZNFc72EAQIDLdTIiGl38YMkWvD+MdLeh?=
 =?Windows-1252?Q?WAyKk/ot3QtWR1STdKgwsPfiI8dtxZe4ztfK44prHhb82/igOkqVsw62?=
 =?Windows-1252?Q?a2PMozL6a3zCX+crU32dVW4xNimyc40VPU2Ec3LdqX4NFQ852qsUcgL9?=
 =?Windows-1252?Q?qACwLs5lZsynw5sSEZ1q1QhYO+LtLpHCNBvDK04WYnSxH0mcgnVAes9k?=
 =?Windows-1252?Q?oJm8swgfsJ55Vyn/sTeReKov69fvgw/ybO0NsrST2tzgVPQLIvGao2w3?=
 =?Windows-1252?Q?tPmY4plSyuH4LOwp5LxA66IriAovTXhUNUxY4H1SxZf16kt/jAzeAM2C?=
 =?Windows-1252?Q?6TynmX+EikrDho26vOagi06iD98nUejiuf1+D9YAauLsOLMvd2Kin08I?=
 =?Windows-1252?Q?E+s6VHDFmJNoa3F2/LnMWzG2wvOM0hFvbGYt/I5kcuvj3nztERCzUM4+?=
 =?Windows-1252?Q?y3koEGOnXUuXHRyPk0CWa9lQ9kDmymKm+wvH75xaOmsWxF0zCOwhok+t?=
 =?Windows-1252?Q?XQboluPWd6PnNBxns/nOQfh+0oI55/3BUWV30X0jV1qyaPzGAg39wQ4/?=
 =?Windows-1252?Q?YvSdyqTxJbTyaPFhwuE+5YfUn2a5q2+MQOnIaFewqmlym1aR19OjKoTC?=
 =?Windows-1252?Q?dgmRNyH5CQGRZgl9mZamP78W01CltMvynP1peDJAvZnB6FF7cMPLajqe?=
 =?Windows-1252?Q?1JWABNEo4WYFOwqvqcBvBPWPIS4ATuDpdIC0hiSGWNHVC8Ky673a3nPN?=
 =?Windows-1252?Q?TSmvOaG5CzizCkSCAeD7733M7tjyqIZbFFYC1t1RpFuKwOk9do+RhmiY?=
 =?Windows-1252?Q?MadcvErwJs3u11IFAPYDXiGWOsOWiepd7KNXhCRVdO5l5fE2bfNzrkU5?=
 =?Windows-1252?Q?6FF/ZwgQzrst4BTTuCs8itLYoo4gosL8UMkUb0UKHL1RXivDjloh+QNc?=
 =?Windows-1252?Q?zbb80RPyUSYqqgeCRmqIsJ0uOrunds8tNs01E57P5vVV0hsgEym+fdjy?=
 =?Windows-1252?Q?U+9BVhi/JBWML5dPM8BAlU1OeGn6gANKsW+Yh24jbOW4dDZf2xEIrwTK?=
 =?Windows-1252?Q?nUkLCpp3cgbCR9G/w3tVo+xovBrv1x1Pnt9nJyTeEW5Gvg30eisnpnmd?=
 =?Windows-1252?Q?k3c64PcsmPuQFddFW2wpzK/EQq+1XgmhIaHHkvydf2j/wcu73l/jahz2?=
 =?Windows-1252?Q?ncbFw7N3jb+kt1800yA4bk2yd6Yiw8262isyyCGK8u7pA+Y4D44XAndc?=
 =?Windows-1252?Q?GeY63Mb27kNHXOu5VzWvknG6t6Fu1sY1?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca51b3da-30c4-40da-4969-08dbd52c1bc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 07:29:22.4042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Drp6QyVup9QjE9pj6rATj8QjOS4+J4+/8T4h3ePbHTRENpD/9O1OlefrUumIzs4uISa7dvJ4h/C9Xct7HsJm7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6530
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_003012_513490_64709AAC 
X-CRM114-Status: GOOD (  33.52  )
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

Hi,

> -----Original Message-----
> From: linux-riscv <linux-riscv-bounces@lists.infradead.org> On Behalf Of
> Charlie Jenkins
> Sent: Wednesday, September 20, 2023 2:45 AM
> To: Charlie Jenkins <charlie@rivosinc.com>; Palmer Dabbelt
> <palmer@dabbelt.com>; Conor Dooley <conor@kernel.org>; Samuel Holland
> <samuel.holland@sifive.com>; David Laight <David.Laight@aculab.com>;
> linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> arch@vger.kernel.org
> Cc: Paul Walmsley <paul.walmsley@sifive.com>; Albert Ou
> <aou@eecs.berkeley.edu>; Arnd Bergmann <arnd@arndb.de>
> Subject: [PATCH v7 3/4] riscv: Add checksum library
> 
> Provide a 32 and 64 bit version of do_csum. When compiled for 32-bit
> will load from the buffer in groups of 32 bits, and when compiled for
> 64-bit will load in groups of 64 bits.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/asm/checksum.h |  12 +++
>  arch/riscv/lib/Makefile           |   1 +
>  arch/riscv/lib/csum.c             | 217
> ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 230 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/checksum.h
> b/arch/riscv/include/asm/checksum.h
> index dc0dd89f2a13..7fcd07edb8b3 100644
> --- a/arch/riscv/include/asm/checksum.h
> +++ b/arch/riscv/include/asm/checksum.h
> @@ -12,6 +12,18 @@
> 
>  #define ip_fast_csum ip_fast_csum
> 
> +extern unsigned int do_csum(const unsigned char *buff, int len);
> +#define do_csum do_csum
> +
> +/* Default version is sufficient for 32 bit */
> +#ifdef CONFIG_64BIT
> +#define _HAVE_ARCH_IPV6_CSUM
> +__sum16 csum_ipv6_magic(const struct in6_addr *saddr,
> +			const struct in6_addr *daddr,
> +			__u32 len, __u8 proto, __wsum sum);
> +#endif
> +
> +// Define riscv versions of functions before importing asm-
> generic/checksum.h
>  #include <asm-generic/checksum.h>
> 
>  /*
> diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> index 26cb2502ecf8..2aa1a4ad361f 100644
> --- a/arch/riscv/lib/Makefile
> +++ b/arch/riscv/lib/Makefile
> @@ -6,6 +6,7 @@ lib-y			+= memmove.o
>  lib-y			+= strcmp.o
>  lib-y			+= strlen.o
>  lib-y			+= strncmp.o
> +lib-y			+= csum.o
>  lib-$(CONFIG_MMU)	+= uaccess.o
>  lib-$(CONFIG_64BIT)	+= tishift.o
>  lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
> diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
> new file mode 100644
> index 000000000000..d8fc94bff602
> --- /dev/null
> +++ b/arch/riscv/lib/csum.c
> @@ -0,0 +1,217 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * IP checksum library
> + *
> + * Influenced by arch/arm64/lib/csum.c
> + * Copyright (C) 2023 Rivos Inc.
> + */
> +#include <linux/bitops.h>
> +#include <linux/compiler.h>
> +#include <linux/kasan-checks.h>
> +#include <linux/kernel.h>
> +
> +#include <net/checksum.h>
> +
> +/* Default version is sufficient for 32 bit */

[...]
> +
> +#ifdef CONFIG_32BIT
> +#define OFFSET_MASK 3
> +#elif CONFIG_64BIT
> +#define OFFSET_MASK 7
> +#endif
> +
> +/*
> + * Perform a checksum on an arbitrary memory address.
> + * Algorithm accounts for buff being misaligned.
> + * If buff is not aligned, will over-read bytes but not use the bytes that it
> + * shouldn't. The same thing will occur on the tail-end of the read.
> + */
> +unsigned int __no_sanitize_address do_csum(const unsigned char *buff, int
> len)
> +{
> +	unsigned int offset, shift;
> +	unsigned long csum = 0, carry = 0, data;
> +	const unsigned long *ptr, *end;
> +
> +	if (unlikely(len <= 0))
> +		return 0;
> +
> +	end = (const unsigned long *)(buff + len);
> +
> +	/*
> +	 * Align address to closest word (double word on rv64) that comes
> before
> +	 * buff. This should always be in the same page and cache line.
> +	 * Directly call KASAN with the alignment we will be using.
> +	 */
> +	offset = (unsigned long)buff & OFFSET_MASK;
> +	kasan_check_read(buff, len);
> +	ptr = (const unsigned long *)(buff - offset);
> +
> +	/*
> +	 * Clear the most significant bytes that were over-read if buff was not
> +	 * aligned.
> +	 */
> +	shift = offset * 8;
> +	data = *(ptr++);
> +#ifdef __LITTLE_ENDIAN
> +	data = (data >> shift) << shift;
> +#else
> +	data = (data << shift) >> shift;
> +#endif
> +	/*
> +	 * Do 32-bit reads on RV32 and 64-bit reads otherwise. This should be
> +	 * faster than doing 32-bit reads on architectures that support larger
> +	 * reads.
> +	 */
> +	while (ptr < end) {
> +		csum += data;
> +		carry += csum < data;
> +		len -= sizeof(long);
> +		data = *(ptr++);
> +	}
> +
> +	/*
> +	 * Perform alignment (and over-read) bytes on the tail if any bytes
> +	 * leftover.
> +	 */
> +	shift = ((long)ptr - (long)end) * 8;
> +#ifdef __LITTLE_ENDIAN
> +	data = (data << shift) >> shift;
> +#else
> +	data = (data >> shift) << shift;
> +#endif
> +	csum += data;
> +	carry += csum < data;
> +	csum += carry;
> +	csum += csum < carry;
> +
> +	/*
> +	 * Zbb support saves 6 instructions, so not worth checking without
> +	 * alternatives if supported
> +	 */
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> +	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +		unsigned long fold_temp;
> +
> +		/*
> +		 * Zbb is likely available when the kernel is compiled with Zbb
> +		 * support, so nop when Zbb is available and jump when Zbb
> is
> +		 * not available.
> +		 */
> +		asm_volatile_goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
> +					      RISCV_ISA_EXT_ZBB, 1)
> +				  :
> +				  :
> +				  :
> +				  : no_zbb);
> +
> +#ifdef CONFIG_32BIT
> +		asm_volatile_goto(".option push			\n\
> +		.option arch,+zbb				\n\
> +			rori	%[fold_temp], %[csum], 16	\n\
> +			andi	%[offset], %[offset], 1		\n\
> +			add	%[csum], %[fold_temp], %[csum]	\n\
> +			beq	%[offset], zero, %l[end]	\n\
> +			rev8	%[csum], %[csum]		\n\
> +		.option pop"
> +			: [csum] "+r" (csum),
> +				[fold_temp] "=&r" (fold_temp)

Seems no need to add extra indent for this line, and the same comment for the below 64Bit case.

BRs,
Xiao

> +			: [offset] "r" (offset)
> +			:
> +			: end);
> +
> +		return (unsigned short)csum;
> +#else // !CONFIG_32BIT
> +		asm_volatile_goto(".option push			\n\
> +		.option arch,+zbb				\n\
> +			rori	%[fold_temp], %[csum], 32	\n\
> +			add	%[csum], %[fold_temp], %[csum]	\n\
> +			srli	%[csum], %[csum], 32		\n\
> +			roriw	%[fold_temp], %[csum], 16	\n\
> +			addw	%[csum], %[fold_temp], %[csum]	\n\
> +			andi	%[offset], %[offset], 1		\n\
> +			beq	%[offset], zero, %l[end]	\n\
> +			rev8	%[csum], %[csum]		\n\
> +		.option pop"
> +			: [csum] "+r" (csum),
> +				[fold_temp] "=&r" (fold_temp)
> +			: [offset] "r" (offset)
> +			:
> +			: end);
> +
> +		return (csum << 16) >> 48;
> +#endif // !CONFIG_32BIT
> +end:
> +		return csum >> 16;
> +	}
> +no_zbb:
> +#ifndef CONFIG_32BIT
> +	csum += ror64(csum, 32);
> +	csum >>= 32;
> +#endif
> +	csum = (u32)csum + ror32((u32)csum, 16);
> +	if (offset & 1)
> +		return (u16)swab32(csum);
> +	return csum >> 16;
> +}
> 
> --
> 2.42.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
