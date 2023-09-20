Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F2DC00454
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 14:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8522YRZeUjQQ5qLZywqt4eekMRLqLi3YxpgGwjodV2w=; b=rWcHYsCsj1hjRp
	Cu8UxRG4eOLYVkP/n6nzA5VkDGqJBo8v3AVp3e9C+FqnNzZHQHDGBxXcmEjyVDO5t/++pE6Kr3sqX
	wewvorJKTihOAFj198WFYdG8TDtR4hEc7aMmBjFHaN31gdX1xkNZfPXbKa3HIt8REycsj8KBr/7Tz
	sYjr528JN5lNlI9r/ZyshIltH5BYXktQmV/erN9pWvVI5Jt4M5jWCQeZirwJgmSuGoaix7+wm5hrT
	f/TSD5UHZNwUbpLYEM8Zec2M53fk2tdKdQ4HSHqkFcEqhl98ulrEAwW6nvw473+x3ZlOPoSduHiGN
	73k+bEYQmvBCIGu1KqXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiyfv-003RIB-1g;
	Wed, 20 Sep 2023 14:59:35 +0000
Received: from mgamail.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiyfr-003RGq-2i;
	Wed, 20 Sep 2023 14:59:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695221971; x=1726757971;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pfhAl0rgWBUNZJ7i8efWTWyOCzfu+ysxaaRlexF7yE0=;
  b=lP5wpu6M2Hr+ZgVpmGnOOd5VzZsSLKqr4dTOF4z4mvyxEnyWv1hu6+jt
   SegibCuSEXAsHqgPDLxmhZyR9Mir6UvpzANGGEdfXBHV5ADx+qIqHb0sp
   sJt23s5f1PySxpyWljx9Js6XLNSgBiq7wPZeoHEDiOyzq8rc4kuSqougP
   ryLdKg8nTjKHGSyx/1vJDS+l9DbFMnCZ96UAe1RDYzXn2rogZKwM+2rqI
   5kn8kswyCcMdvOih3noindP+BHjXcBqxZrCBrIP/aqAZfRrn7M0zbhNN3
   awrLam42lPqNSH2ONCh1SACYEwEhSUCRZsMpe7EoWUYIca6Dv5BahhGYA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="380157106"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="380157106"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 07:59:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="816935254"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="816935254"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Sep 2023 07:59:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 07:59:18 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 07:59:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 07:59:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 07:59:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YpNqHLTtOhIoP1PgblOYcKpzVP6OZYOB/qD5wjGof4TYkG/rF+2pKZilfVlat3ZIlZPsx0aSS03LsKoVBzB1XrlCbeDYeiLiSsOhMqGoD4Sbu/HpkOeFvszeYF9/gncQelZS9yqqzOuT+fOIXQAWPyVQp5o5ch+de+7/6uyL7s0dbDvAkXHRoflHZx3rc/YukNNaKQQjhXnb/MrZdNKNy3xwmsRLEMcRqsvw9pcyD/naiUn4lxEZH8oTQJg21xGJf5O3gbWrqTa0tlCmfISmlfA6C65IDn1Gn7ukPiidaWX6KAgtDh5sxkEaw/35DWQ+5IoX1osWOra/PosSNbIggQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Mp718ZFhjS3luurjbk/tikoZ0KA4jOXXjlhGHmHTis=;
 b=UHYx56Nq/Gpz4HYGN5tfC/icf+fB7JXzW4+kdNqoSBdWi7f+IOoDUxTjRMf8DYAfveHiB0kBajutoPuvMr8454NEz5oJWUbezmCp8v9X7kec0XcXq6eEc8qhlicNeu7raiI30NbBPm+Y6JWvMirdJXbpJZTZ3YoaRjzmFwDvBccnUectWx3hgkV872WJ0dqRKn8/h60uyWbm69DPKwHocBOZrv7Xt7I1x4xXbY6k9f0xJ5lcx9VPuJZQ6B3NQZJRgzPq52Dy/ZoDXcY+UGo23R1K1tyjrDzjevJs418STvxKs/ZAL4brec4fH1PxgM7VX0cQR9otmolbqxZoeWM7Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by IA0PR11MB7403.namprd11.prod.outlook.com (2603:10b6:208:431::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Wed, 20 Sep
 2023 14:59:07 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::713b:b9da:7c2e:ca36]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::713b:b9da:7c2e:ca36%4]) with mapi id 15.20.6813.018; Wed, 20 Sep 2023
 14:59:07 +0000
From: "Xu, Haibo1" <haibo1.xu@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>, "kvm-riscv@lists.infradead.org"
	<kvm-riscv@lists.infradead.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
CC: "anup@brainfault.org" <anup@brainfault.org>, "atishp@atishpatra.org"
	<atishp@atishpatra.org>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
Subject: RE: [PATCH] KVM: riscv: selftests: get-reg-list print_reg should
 never fail
Thread-Topic: [PATCH] KVM: riscv: selftests: get-reg-list print_reg should
 never fail
Thread-Index: AQHZ69AEXjX189HAC0ONW9fNVtTpErAjyy3g
Date: Wed, 20 Sep 2023 14:59:07 +0000
Message-ID: <BY5PR11MB3909D011A5633AF7496CFFDCB0F9A@BY5PR11MB3909.namprd11.prod.outlook.com>
References: <20230920143713.6896-2-ajones@ventanamicro.com>
In-Reply-To: <20230920143713.6896-2-ajones@ventanamicro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3909:EE_|IA0PR11MB7403:EE_
x-ms-office365-filtering-correlation-id: bc0e637a-a5bf-4a3d-ad3a-08dbb9ea2371
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3aW34RuigaFv9ZD4v/yqDzA7gGW46zq8tZfh/TqfqkiEnXmordaw+rFK8aWR2KLcCGMsJ3PEwFD6vdQfY0uvqD+JHgxYl9zPnx23Zl4FPOQLbf/7k2qKR/rPaQJiSHN38z9ei0vNC2IUqZ1HW0OL3GbM0fjGC+ZX7JCA+tw6/vlzVYrrP6Q59UVQteaBY/GM+Z+2Kk+8flqujHv9HAC86sbHKjY30ImUD0aGcG6mDOF+YzXK9jS6FQG9Jbi65GdSgQtTNmuSvTr+qcTjty2GmCUwvOSw7Pe0mKHV79XGXkHMjMxUvZs5cVlD+LVy2YiYstedPN1xM9GA+IpD54Gn+uxl+wuXwlMVqxJaD5ZOHvbOii3oQAwG6MrfZjaQt4dUJF78IS9+4HdulgTsHOJBIcmYnubiXtNHE0OQYdaLvBAZ12xv9vK0LDQqg9JUphYzS/ZPuis5iRh3R4e4jLmzi/FM2Frfex6led4Hg7lawmqJxlYkSI7UxZQxwS9XvFVhJw3+qYhzBP1Vb0d/bU+cOjguhmRN63NYbf7a1ei39F7IDNYiik/1fga3MI1I4t0FmdgF5xWQkpOWu9MjRmVAX7utNDQdb1CZH0lhVlntBS8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(346002)(396003)(39860400002)(451199024)(186009)(1800799009)(6506007)(7696005)(53546011)(33656002)(38070700005)(38100700002)(55016003)(122000001)(82960400001)(86362001)(2906002)(26005)(9686003)(71200400001)(478600001)(83380400001)(8676002)(52536014)(5660300002)(110136005)(8936002)(4326008)(41300700001)(76116006)(54906003)(66556008)(66446008)(316002)(66476007)(64756008)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GDDvs6imNUVvs/QQZcVHLu2C3+ERf49HtT7BUy+HTkYDk57dep8ibHdE0n4J?=
 =?us-ascii?Q?rOSO7C9rLMr+JJECAy4ErcnVsGEL4plsk2kRO724Mr+f5jPxL+o3LCsbzCjW?=
 =?us-ascii?Q?48SmikC2dB6XEmWBURWCmf25uyf7Ojtogu3x/1gZW9+1AL1AWbVZPWAB2t2j?=
 =?us-ascii?Q?xtSPS7xN96wJMVh6hN6+yzXlcE/Mun3IEXKTsA/zcLVjDokuxKV++Wg9ifVo?=
 =?us-ascii?Q?mPmEm7uvw2teKV6q5j606p2m+TIR4TAJwBYVAm55qBxNiI9dYtpT8Tk8TKm5?=
 =?us-ascii?Q?T9TH3hPPQtm51UkdmuRUcCR5te9bNTDdShw9c7Zxwev601hIMilCM5Y+jqsV?=
 =?us-ascii?Q?ESDwQvoyk4Aq5jgLO2/0jTlK/i5NqOcsso4ZuLytF+0ahT+OYiA7EQFOJex8?=
 =?us-ascii?Q?sGAEqW2l1jbcZfZIuQra43Lesb9tBmPb2a4J0ecRIQA/UVN4s1fK1q8ichbe?=
 =?us-ascii?Q?dPXgAbNqRH6uXDwjZ1iBz0PWtrnVlgaW1AjEPo6FP/Pm1OuYwTLVnWWJf4C6?=
 =?us-ascii?Q?2PrsYiDvhyvE6eRQ3btIftwpyFq3B0fmgZn+3JFR6vwZqt9FJeCo84EW0jJf?=
 =?us-ascii?Q?00v/9BXSNI9fPxbDqsF1kzcEXZ1YCqh/kn4qHDDQU07sOWNnO/RS2UQVUmRA?=
 =?us-ascii?Q?wtdlVPGCJMs6EN6DnjtKnTDo3Xp5ALPgSNRmGPAiRG780JiDWFUiCEpQH/+/?=
 =?us-ascii?Q?9WeseHX4mLrGOaSJ0a2xMZR3nihJwBQG8gdU11UNTlYQdvcBQ7xH1JATY9tW?=
 =?us-ascii?Q?3gLGcp1zaaKX069/n0QkZIvLvJ37D2wwn1LRCA/g/ujkq7kssGrf5UVKpojT?=
 =?us-ascii?Q?lKDJChqZq3lW/zx2uGsoUgthKlOKRFs0ThU3lnsn4frQOeW+gre6o7k5dU/b?=
 =?us-ascii?Q?91zcJDn6hzxvpjmdqygQow2KIyy97J3X2BZ4MHOfWZPZiWtbB+qE877kXOKg?=
 =?us-ascii?Q?vDcnTFQNcCnHTU+yBieNLErRd1kfWbY+xJAvP5G/r6ooUDR8+LEW/5xDKgPR?=
 =?us-ascii?Q?/pvgjTxQLxx9yK8rIOkLH6LS/HCfEohw7yOHqzdGfPoTrunvtkC0lXCYDX7Q?=
 =?us-ascii?Q?8bCcbBvArq6iARG/J2GSl3so+f2cCNLut3tfaNkBcg/X7qPrvXOwnMZFW1pj?=
 =?us-ascii?Q?OHdHatqr9W8LRIRo2kkcQijJxmbxLmVuwrv9/0ZQX9g2N+kArTcBRF11ZjtO?=
 =?us-ascii?Q?tkVk7pN/gEfXo6Cy/gR1YYo0nzu3NCkdwsRwk0iAIjygu+QmvVQ4UjK6cHnm?=
 =?us-ascii?Q?7+/LpvDTqDqsSuxsRa9OIAefmSpyy4nbjfToerejDQ0clGOC35xczngSQckw?=
 =?us-ascii?Q?0iYvWvuq4GrIL6R8bwxoYyoToF7cvhUWskAh4tQ5wNQ5gHXf/21XG/RaYUdo?=
 =?us-ascii?Q?OAmHN+UFxzpcalFV3ssW0nj2tXoWhVIO/aJKbcpwUl81rJXd3DZlVmglTN3P?=
 =?us-ascii?Q?C3YMYVmA46mMRAHAe9evOtJckTYJ+Su1XOYhyDqnJ49vvgLQEtiMsMJQYDtm?=
 =?us-ascii?Q?I2x1lhI84+VVUwnfTGaaDnGDwZJN8Xw7mEqr7hJzGdOKhr2AZwDATCqAQxqA?=
 =?us-ascii?Q?8kUDhNpWTX1yNVKbL4PkKw4G1MbgYCcU6ZLxD4sW?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0e637a-a5bf-4a3d-ad3a-08dbb9ea2371
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 14:59:07.1116
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: olDz6xDeyz36c1XXFJxoglQVxGI5jObnwnIUf7UaGAgV5yjKwMWAFOtfVwA8WcMlrrt2UHKldelbkgr98rUQPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7403
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_075932_050967_E96FEFEF 
X-CRM114-Status: GOOD (  19.07  )
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
> Sent: Wednesday, September 20, 2023 10:37 PM
> To: kvm-riscv@lists.infradead.org; linux-riscv@lists.infradead.org
> Cc: anup@brainfault.org; atishp@atishpatra.org; Xu, Haibo1
> <haibo1.xu@intel.com>; paul.walmsley@sifive.com; palmer@dabbelt.com;
> aou@eecs.berkeley.edu
> Subject: [PATCH] KVM: riscv: selftests: get-reg-list print_reg should never fail
> 
> When outputting the "new" register list we want to print all of the new
> registers, decoding as much as possible of each of them. Also, we don't want
> to assert while listing registers with '--list'. We output
> "/* UNKNOWN */" after each new register (which we were already doing for
> some), which should be enough.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  .../selftests/kvm/riscv/get-reg-list.c        | 93 +++++++++----------
>  1 file changed, 42 insertions(+), 51 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 85907c86b835..054706538b9e 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -112,11 +112,13 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct
> vcpu_reg_list *c)
>  	}
>  }
> 
> -static const char *config_id_to_str(__u64 id)
> +static const char *config_id_to_str(const char *prefix, __u64 id)
>  {
>  	/* reg_off is the offset into struct kvm_riscv_config */
>  	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_CONFIG);
> 
> +	assert((id & KVM_REG_RISCV_TYPE_MASK) ==
> KVM_REG_RISCV_CONFIG);
> +

I think we can skip this kind of assert test since the function was reached by:

switch (id & KVM_REG_RISCV_TYPE_MASK) {
     case KVM_REG_RISCV_CONFIG:

>  	switch (reg_off) {
>  	case KVM_REG_RISCV_CONFIG_REG(isa):
>  		return "KVM_REG_RISCV_CONFIG_REG(isa)"; @@ -134,11 +136,7
> @@ static const char *config_id_to_str(__u64 id)
	break;
>  	default:


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
