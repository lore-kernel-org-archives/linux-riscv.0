Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9826C3DA66
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 01:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yw93ZYr6QrgAUgq94kYwSaz6a0HHAhwlmnbOKokZsAI=; b=sR3CrL37RkT1nd
	5M3nMNMIHvJsHS9Dy3BLqMHiYt+KVs2z/ZCaZzPOZgaPmluY1SqVkH2WOlmBpenYJPLxQFPwqX4IS
	KIodt5JH9MZPGtfzhWkWPoEBiwK45P0tv31xRIGKIsT+oqL2/E19TRJEFGLtBBZyysFXGv+IkaDBR
	qg2dvoZt6YI/xZGCcVDs4+XJMgDEwi6HGWCiD5ZOnV3Mi1m162ulcuH1LA6MY7MJWk3OfRqmr+Sy0
	jLwjUBrh1IswzPfrRQXzCKUUAZXgTC8Bq/4QV9VPmXqHMVpBJ9Y4/kSIEfg/rEjKucFTB7YibxZjf
	wsAhMgyBdolDznmjoKxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWoL7-007U2s-25;
	Fri, 18 Aug 2023 01:31:49 +0000
Received: from mgamail.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWoL4-007U2I-1s;
	Fri, 18 Aug 2023 01:31:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692322306; x=1723858306;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LUSluE1nNtIinlmfupaVY8q0CAAibrC6nhOvD2FsC+4=;
  b=nhE4MhkRH2PHJLQuhVCpNlUjSSCBfHYZmkCYSK9iDUMK9h01GQbjrGoB
   O2pFrSyskhtbqzDNGmX4eZ5c98WAcoCMEWEfWpNNHuc4EMYcNwivUcbr8
   Fo8/0KTbNOlTDoFrFJAPvl3h3YojGtnD1OirYg4xO++PkJtaBFXvj364h
   OmKjPkWkiIZxbsCTiD3/opQS5BiCtf/H+XiyOWISQmT9bDrh/ylkT2kiv
   Ij7Dp0kNTkGdT4sFREIU7Nel0MHjy6p5IIGTdyxOLJIgWSugnFP8ugrxD
   RiEHWcR0JZfEABN7HamXJT4f9dDAEWjoYYx8vACRjUt6JgtsjPpNUn9Od
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="375763312"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="375763312"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 18:31:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="711791685"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="711791685"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga006.jf.intel.com with ESMTP; 17 Aug 2023 18:31:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 18:31:45 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 18:31:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 18:31:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 18:31:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VrcC5s79Udgb0aBfvIwxXTnRTaOl2Kxw9W6ScsyHPmrK1DbG8DvoXWQxWZl+rC8UIgAtF9y1mOkcBA2wthHsZMtn0gghCkyMgMDxXR5KMkiRlLRsn8jcqu7Ugs7Di2uZd1ccTglESqhpvayteYVhXK3+aYKyG3QwOJmZUY46ZdAAHq7wXNxc++vuE3AqQ36KM2Df+ZU2y77i0oVZzuP5+qnalALINgzQItKbrqY+eD3L4/ckkl+Q5czBJ5esrXPIPoVmS7KKitWL5hIWKQn2w236kBcJQzwvrZX4x8HjT05Rdf/ZGTjUQdrct0qhmDFWOCn5N9CXmZ3ucMVPUEw+5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5Vha5w4InI7eRwKF+r2LUlQRM7qfr0ymQClJRSzRJA=;
 b=dcUkqxFYNHhqBGzu+acbZK65i7fy/trWg60RWG9yFL13obeMCAn5nZMNno4xRiSytqJ1GIwbky5nCO8ZfNjaRPfhLQzIkS3oK2ooFQ9R/X2xpCOuYvNkR9vGW39I/aGPCnx3S2IrScu6cJRLvabNwfkLChd37a6cvK8c4S97npSE7AaS+2NiV00MSxQkdYcFsscmyHFIdmc3xO+zEmYdkYy3n7miZfhEwZr8ntsJpc8TgLT15E2wjMKUEG7HOIh1AhqgIIQJBVwQ5KdJSafToLWUyx7hiYz1KXoXLo0SUHoUWmxHkUX0ouWsLbjsVNETKNKH52mnp1lYRqqcdLacOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by DM4PR11MB6382.namprd11.prod.outlook.com (2603:10b6:8:be::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Fri, 18 Aug
 2023 01:31:43 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::713b:b9da:7c2e:ca36]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::713b:b9da:7c2e:ca36%4]) with mapi id 15.20.6678.031; Fri, 18 Aug 2023
 01:31:43 +0000
From: "Xu, Haibo1" <haibo1.xu@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>, "kvm-riscv@lists.infradead.org"
	<kvm-riscv@lists.infradead.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
CC: "anup@brainfault.org" <anup@brainfault.org>, "atishp@atishpatra.org"
	<atishp@atishpatra.org>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
Subject: RE: [PATCH 2/2] KVM: selftests: Add array order helpers to riscv
 get-reg-list
Thread-Topic: [PATCH 2/2] KVM: selftests: Add array order helpers to riscv
 get-reg-list
Thread-Index: AQHZ0Sc9n+Ded5cD4EOmLlM1wmLMfa/vRJCg
Date: Fri, 18 Aug 2023 01:31:43 +0000
Message-ID: <BY5PR11MB3909E61121EF43400632028EB01BA@BY5PR11MB3909.namprd11.prod.outlook.com>
References: <20230817162344.17076-4-ajones@ventanamicro.com>
 <20230817162344.17076-6-ajones@ventanamicro.com>
In-Reply-To: <20230817162344.17076-6-ajones@ventanamicro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3909:EE_|DM4PR11MB6382:EE_
x-ms-office365-filtering-correlation-id: cbb98e43-ac5c-4a7d-f3f9-08db9f8ae112
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f8/ZjIr2rhcK54ufTDK6SwGjeKyKUBFQG9SKeM9UyaF5tq7zOpONTtMIZkwtG5O4OS42AtoWSb4hsnAUNj6AJReqaQ5v6HXfod+xENFLNbiNndVWZqYWff6JMHXuUbIea6LUVCeiljPwmGJPwDdC7F0d+S4covoqJoSOV8ywGnwdmT82zbJudP08b4vI3z0P+Rh/oq+DYJF8c9GksdEav4Pv9mjxLcUH1ng2HQo25U6kwnuwhHA1uh9KXClhlT6LhXWxYiCDD0P70Pn5F8xt2z1DcjNjgIcRRyiKbo73nmqbaWyP5CgUxb83bBddNuv3krQqXRpouqF8RYos+HAJ8udGG7hspN57AK9lJvQL95BbjBCEQGfgQm+TfnrDjqPeuk6jDKJTnCAzBCNE8Xg0CU0q4t2SjYLyHUdhr79s1EVp3N0CfOpPBE6lt5uXMtGm9OGA/vuOFq7FiJSP7UQKe6OtMoewYr+7rLRSbEIbNvWlPPoWRDxpHqsWpBldNI2EdN7tnb93jJcGLbP6HEFrlk/WyxtVIkcv1yR/Mo/hUxZDkGwCGxfAdPmPYuDcA5qy+W5xb94iydHKIcklti2f5fECcuwv21KKh448VgroSdb8sRtRHQonRQ5xkJ2IAbK0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39860400002)(186009)(451199024)(1800799009)(2906002)(83380400001)(26005)(86362001)(478600001)(6506007)(7696005)(71200400001)(33656002)(53546011)(9686003)(55016003)(5660300002)(52536014)(41300700001)(66446008)(122000001)(316002)(54906003)(66476007)(76116006)(64756008)(66946007)(66556008)(110136005)(4326008)(8936002)(8676002)(82960400001)(38070700005)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QoXKFBLhgPiY5ldrEynfLkBMZ/YXAWA61csEHSJIyPBSnzmxF/it2iQsJg0/?=
 =?us-ascii?Q?j1bVH0dX/0gIRRrSJfnBnY7Y0uukKjqzuU0IVyoW7+aB8CoBmx/P4biBlch9?=
 =?us-ascii?Q?G/d4+s3kgL40b6TlmGLd2rMOy57Rz17S4CV618cIUILncaSVa8/V4X/zY1iu?=
 =?us-ascii?Q?PV+AQQ3NBV4uke1VyGDxGXZg458RF4IvTbtlyk3CUSi+VCl/LdtBr2yQm++N?=
 =?us-ascii?Q?Qvqd/L3nVpK0uUhWGkIYHJKYLPSwV/PgwM36Qzye7HjteWI79yow7K1sXuUs?=
 =?us-ascii?Q?P5Xhd+NpCG0DCerBIVjfPCla1stXmVRfv5UPyLIJKAuuXeLfPW5vNIBLhzw3?=
 =?us-ascii?Q?+ozRl62CLfSD7lYHw2mNUBL9l0E/LqVO6WWOQp3CAy6iC/9sBSdxEl0FLA8c?=
 =?us-ascii?Q?aOZq3dloKChAMbbYDX61RNaznTQRj7kKmi6rQQUFwoM7xLP0xro8AA2aMLwG?=
 =?us-ascii?Q?oEfG+CcDkmklMJrTw4j36ug6DtDe76FSflMkcodG64mWfMTatI6b5Kv0Q2VF?=
 =?us-ascii?Q?fGcVpNxBiMvAHaU2BzEb2DFDzBMuMBQRhY3L/PmFZm5o1vB+walX4fJiBXhG?=
 =?us-ascii?Q?h+Trpq0qpTrANvyPKgqWw1fbhbgxHE0M32rIlXC5o2A4gJyWHzTvCoQ3zT1S?=
 =?us-ascii?Q?wkMdzMqgK906TS8AulMdPVRYZ6CU3rLuMF3l7PqZLZI/Y0To/frC+EfeH/0F?=
 =?us-ascii?Q?xyvUWvogTPE2HU6o0OVGKomif6ynC7haX0dysuGtLM72sGboYz8fnmXE5xCm?=
 =?us-ascii?Q?swEThDudfHj3Jqu6TKKn2+QcW50urPSQESqN8+Ch1TWp7zcpcA0lE5/zWAUW?=
 =?us-ascii?Q?zp8bJZBYustIttNwSspYfpt+bJHsdCmmbKbRRC7jQVzvFXcVKEcp+IT9h26g?=
 =?us-ascii?Q?uPrsnVP3Og+WumWN0Gu3f6iFby0GiJqzbcWzLlM6rFxnObm4ib4/EZZkdh1H?=
 =?us-ascii?Q?OyhGfLNrbtJ2T8ye2CJiUwGBQATux51PJvekEDY0d48jb2+acHdq7qoskk7R?=
 =?us-ascii?Q?w/MIn7mBHrpLqYwV/DpKqgGIeoVfgg4o/hK/aPOuN5JVn+XmckB7Zblat0IT?=
 =?us-ascii?Q?6tpMfh6Nf3/Ot50JxRdoD4AHo3Q7vnATkxWu6Ar25BtKe44Chs11NjwUgxDO?=
 =?us-ascii?Q?l0FsQOEH34L8r5HLr0XnkEU7ylUTa6+ROYxmu2L90AcCuJIUm4JDzuVaUsqf?=
 =?us-ascii?Q?4rieb0OCKfDP5R6IhZ2o7A8XxHRCItw2fMrqtC95e6qCK+bs9qmfGz+b9sYl?=
 =?us-ascii?Q?9m8mUVdhhvIOGGeLAmSHq+DaWeKp0Go+RY3c2L4v9yNxFUZ6WC9OD4ITdFfJ?=
 =?us-ascii?Q?ahJy2A6nhrK09cd9zgbjlsi6m9y4CaGKEt5GGZ7fw7A+695jRzCHdoJBA0uE?=
 =?us-ascii?Q?clXK7NluJ5v9vUrPLNgMOrPq2uN6VStTCJHaG5tLNsmLneWydSFrbDWDo0T8?=
 =?us-ascii?Q?Auq6xexhfppz0dAiwglrCSe3bzQ1JdUnsC2ZLsYGGtoG+duM1Ghaoo5Hnluz?=
 =?us-ascii?Q?YMBZSdBTyKmZB31wRYXJZiNqWUZqLTsEpw3fiHytz/oCpyfGtoGreGGxMCyU?=
 =?us-ascii?Q?tyuEXsw0791dljx/CjFWyINakpvC1qdWoBJJR3Kz?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbb98e43-ac5c-4a7d-f3f9-08db9f8ae112
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2023 01:31:43.3278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S6DPy4nlGml2Wo5oqPwkwlgxpIATy+M/PKcARJpXWiRpJQobEIOSbqz1y3Kh8FmDNRJNIL2XMcB8fzNc5wSxew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6382
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_183146_703056_5A38B94B 
X-CRM114-Status: GOOD (  18.83  )
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
> Sent: Friday, August 18, 2023 12:24 AM
> To: kvm-riscv@lists.infradead.org; linux-riscv@lists.infradead.org
> Cc: anup@brainfault.org; atishp@atishpatra.org; Xu, Haibo1
> <haibo1.xu@intel.com>; paul.walmsley@sifive.com; palmer@dabbelt.com;
> aou@eecs.berkeley.edu
> Subject: [PATCH 2/2] KVM: selftests: Add array order helpers to riscv get-reg-
> list
> 
> Add a couple macros to use when filling arrays in order to ensure the elements
> are placed in the right order, regardless of the order we prefer to read them.
> And immediately apply the new macro to resorting the ISA extension lists
> alphabetically.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  .../selftests/kvm/riscv/get-reg-list.c        | 76 ++++++++++---------
>  1 file changed, 41 insertions(+), 35 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index d8ecacd03ecf..0ea17a5ffbed 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -20,16 +20,16 @@ bool filter_reg(__u64 reg)
>  	 * So, to make life easy, just filtering out these kind of registers.
>  	 */
>  	switch (reg & ~REG_MASK) {
> +	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSAIA:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSTC:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVINVAL:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBB:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSAIA:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBA:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBB:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBS:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICNTR:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICSR:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIFENCEI:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHPM:
>  		return true;
>  	default:
> @@ -281,35 +281,38 @@ static const char *fp_d_id_to_str(const char *prefix,
> __u64 id)
>  	return NULL;
>  }
> 
> +#define KVM_ISA_EXT_ARR(ext)		\
> +[KVM_RISCV_ISA_EXT_##ext] = "KVM_RISCV_ISA_EXT_" #ext
> +
>  static const char *isa_ext_id_to_str(__u64 id)  {
>  	/* reg_off is the offset into unsigned long kvm_isa_ext_arr[] */
>  	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_ISA_EXT);
> 
>  	static const char * const kvm_isa_ext_reg_name[] = {
> -		"KVM_RISCV_ISA_EXT_A",
> -		"KVM_RISCV_ISA_EXT_C",
> -		"KVM_RISCV_ISA_EXT_D",
> -		"KVM_RISCV_ISA_EXT_F",
> -		"KVM_RISCV_ISA_EXT_H",
> -		"KVM_RISCV_ISA_EXT_I",
> -		"KVM_RISCV_ISA_EXT_M",
> -		"KVM_RISCV_ISA_EXT_SVPBMT",
> -		"KVM_RISCV_ISA_EXT_SSTC",
> -		"KVM_RISCV_ISA_EXT_SVINVAL",
> -		"KVM_RISCV_ISA_EXT_ZIHINTPAUSE",
> -		"KVM_RISCV_ISA_EXT_ZICBOM",
> -		"KVM_RISCV_ISA_EXT_ZICBOZ",
> -		"KVM_RISCV_ISA_EXT_ZBB",
> -		"KVM_RISCV_ISA_EXT_SSAIA",
> -		"KVM_RISCV_ISA_EXT_V",
> -		"KVM_RISCV_ISA_EXT_SVNAPOT",
> -		"KVM_RISCV_ISA_EXT_ZBA",
> -		"KVM_RISCV_ISA_EXT_ZBS",
> -		"KVM_RISCV_ISA_EXT_ZICNTR",
> -		"KVM_RISCV_ISA_EXT_ZICSR",
> -		"KVM_RISCV_ISA_EXT_ZIFENCEI",
> -		"KVM_RISCV_ISA_EXT_ZIHPM",
> +		KVM_ISA_EXT_ARR(A),
> +		KVM_ISA_EXT_ARR(C),
> +		KVM_ISA_EXT_ARR(D),
> +		KVM_ISA_EXT_ARR(F),
> +		KVM_ISA_EXT_ARR(H),
> +		KVM_ISA_EXT_ARR(I),
> +		KVM_ISA_EXT_ARR(M),
> +		KVM_ISA_EXT_ARR(V),
> +		KVM_ISA_EXT_ARR(SSAIA),
> +		KVM_ISA_EXT_ARR(SSTC),
> +		KVM_ISA_EXT_ARR(SVINVAL),
> +		KVM_ISA_EXT_ARR(SVNAPOT),
> +		KVM_ISA_EXT_ARR(SVPBMT),
> +		KVM_ISA_EXT_ARR(ZBA),
> +		KVM_ISA_EXT_ARR(ZBB),
> +		KVM_ISA_EXT_ARR(ZBS),
> +		KVM_ISA_EXT_ARR(ZICBOM),
> +		KVM_ISA_EXT_ARR(ZICBOZ),
> +		KVM_ISA_EXT_ARR(ZICNTR),
> +		KVM_ISA_EXT_ARR(ZICSR),
> +		KVM_ISA_EXT_ARR(ZIFENCEI),
> +		KVM_ISA_EXT_ARR(ZIHINTPAUSE),
> +		KVM_ISA_EXT_ARR(ZIHPM),
>  	};
> 
>  	if (reg_off >= ARRAY_SIZE(kvm_isa_ext_reg_name)) { @@ -323,19
> +326,22 @@ static const char *isa_ext_id_to_str(__u64 id)
>  	return kvm_isa_ext_reg_name[reg_off];
>  }
> 
> +#define KVM_SBI_EXT_ARR(ext)		\
> +[ext] = "KVM_REG_RISCV_SBI_SINGLE | " #ext
> +
>  static const char *sbi_ext_single_id_to_str(__u64 reg_off)  {
>  	/* reg_off is KVM_RISCV_SBI_EXT_ID */
>  	static const char * const kvm_sbi_ext_reg_name[] = {
> -		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_V01",
> -		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_TIME",
> -		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_IPI",
> -		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_RFENCE",
> -		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_SRST",
> -		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_HSM",
> -		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_PMU",
> -		"KVM_REG_RISCV_SBI_SINGLE |
> KVM_RISCV_SBI_EXT_EXPERIMENTAL",
> -		"KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR",
> +		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_V01),
> +		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_TIME),
> +		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_IPI),
> +		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_RFENCE),
> +		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_SRST),
> +		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_HSM),
> +		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_PMU),
> +		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_EXPERIMENTAL),
> +		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_VENDOR),
>  	};
> 

LGTM!

Thanks,
Haibo

>  	if (reg_off >= ARRAY_SIZE(kvm_sbi_ext_reg_name)) {
> --
> 2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
