Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDC2C71155
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 14:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AHo8nrI5ovbzVwaWrGHYATzVVVKyHCrOaK5xTlyHPzU=; b=JQ8oaMZYLpJvyj
	KN4/vXtYNc9txy4NM9sinoaFwmu0ODNfHn+8Wj7C1SoPwJehKeS35rrvI8ykLH1I/6ie8JLEglp82
	XKp3/NVpW3T3zJwCffcx633l7maJjCdtHqekAVCThaD95XaiSaqJpdKxW1cBK1NJbCmFuX83nulfc
	EdLR0eLpQSSm3bdhXwlAymqLUQMT5GwL4BdrAFwKJPixLaJqeuKdV/799daVCgkoeaHZziKsrhNOe
	N3QknCYCM/+zV2gCVo1RCtRawCNTUiOEsa7q55mJpEMDbl0tXsxw4otxALevS8hnSbHXy6o7AvscQ
	czaJ2NPR/NGd3p6/Gvww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0Pr-009UzA-1S;
	Fri, 18 Aug 2023 14:25:31 +0000
Received: from mgamail.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0Pl-009Uxl-1y;
	Fri, 18 Aug 2023 14:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692368725; x=1723904725;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uIRJH8iSSTwghpaRsbKtFER12PewfbRuqpwgmLsCIng=;
  b=iKctACaFP9UwQC6pT8KuM/Gs0UycFwNzLoi/xrc32CVajbK2laUJCUp3
   L4V/3dCYEIa5uW4NGYI4+erEmWRmE1OPPJG0wgq6aX/55ITEv7BuvdaiR
   8o7NPdVaxkuhdS9MvxgDZNtPxuGBWETKKGibSsq8Fx3F6MfhN0krSwARH
   GVadx7kNdJ42FyqUjjtvp+C1zAhu8g+DbL0FG626Rb5AcVoEo5oB+4R+h
   PBFjxU7Kjt3cbuPCBaMsfHA78yUAW801XziWVZGQQXZbXjzwita6fkvyL
   htCpoTo2gH7RPLHgP1T9haPSM7CvAlH68y/R6MBG31eEM1mbEos8x19na
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="358078702"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="358078702"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2023 07:25:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="858714237"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="858714237"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga004.jf.intel.com with ESMTP; 18 Aug 2023 07:25:09 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 07:25:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 18 Aug 2023 07:25:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 18 Aug 2023 07:25:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GR5De1Qj326ykQgzBBvKvF2+99vv6WRNuwnXg8xue9JZaupCgzR37HioVV8yDvxc6jH7tSoeV7pE9e5o4lCvHUAXW52qwjD8HYNAcUhU3wqIHIvX2I0WzG3QOdcxIqyG2iaNM5LMnWJHmVuED05m1gdNuUgkD4vc1CLS9nTGjRwMtYT6CeNmyN5phoK4NfGJofkueo8Ga+6w+ap+prINdIVqDDsW/jRIeU17ocHKYInE5ZfFjnP1bYuy+3tSaPPZgYUv6RlFisADPY3ZVBEK0t5HyDjlY+Mj09eZ1pT+VQDG0i4pm8Y6puVNmJ8i1lYmqCXbdPJGBxG60ugiXikT2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3GG7UGHmbh4eMQrjZpjzVtcoEuYZVRFpXgoxuNFQ24=;
 b=g0DZVoT6IGQJSDedZfrn49XzUbReRE3X+0dcvR0efW/SX+CRe41MCb5EcDFH5x1xhd0vfhk/jlj2UX0S94aHPXkqUJTiC/leSO1xis0rz04v6f4DpPYPxgP/umhxheLPD91lQNwmLvorjNjvat8WOV6YHC60/1Y5AxSfysNviGp65Rkc2nrckiRT+QDd1OGwb4ViYN3crRw6oWs6HLG5IY1lUiIHW7NUNVJ7GcLiqYPQzr53m97+lTbUgeeBKwTftk6rQY9yfOpBDF/T3rM0LNGDYFx1dQ4GeCN+XMtroqITmmeHwzf9ocg8O16SJfOTCisxmu0s7HGBhgJect8BDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by DM4PR11MB7351.namprd11.prod.outlook.com (2603:10b6:8:104::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 14:25:05 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::713b:b9da:7c2e:ca36]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::713b:b9da:7c2e:ca36%4]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 14:25:05 +0000
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
Thread-Index: AQHZ0Sc9n+Ded5cD4EOmLlM1wmLMfa/wHPzw
Date: Fri, 18 Aug 2023 14:25:05 +0000
Message-ID: <BY5PR11MB3909BA9765F04FB6FE037430B01BA@BY5PR11MB3909.namprd11.prod.outlook.com>
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
x-ms-traffictypediagnostic: BY5PR11MB3909:EE_|DM4PR11MB7351:EE_
x-ms-office365-filtering-correlation-id: ca8560a6-b271-4f68-36af-08db9ff6ead8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LI38EieMAj9dTRq5VBfW84JBSSeA2I3VtAu9TIoj19M4l7M/Yl0WVJaHmxgElJcEMtNWjbMAwlraFHwQuXZ/F89U3EieQa/k3gM7EeoswncX1tt7+oLzGH39C9HPeUfKkVtQwvRbadni/UophWNJ7mKsQS6NZOi9WKW8gA1xD5xFYm3wk9lsAjDZw+yi8ciX3hmfo44pKkKSi0Eb1YuyEiqSYlrOoWoSC79fphiblNNycKVFVBm2u4yUfx+39LspTFM8Xn5lG8lyPlCFXoPG7dBHrB/x85zBq13VzEN3IeBjvvNnGu5SMr4KgUJTjmJ7SYbSR+RsHc64hkSjMO0QisUef+8O7on9edTB2+9Vg9tkwjs3U1zNrRVgePeEl/UbxwRpzS8dHS4s/x7qCppv6qxh1IRElpLNnS8xrjEGHi/3/H86BTgepll2gEsFbmihJNZFZfecYWJ3562LOkReVD99yJVlPxMQPCcumbKp82HmS+bTkcAKmJv20EqsbXOWP33bbxn9StILrRGVcYulikvjameohDpdrmU3sWRho+HmZgBA7SxH+FIzibjwZ/xWzBM7fOWtDza3GfW/i3ePRsnYh8vN8IYM+oNw9qhwFgK4gTZNxVlOuCT0XrNeq2hq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39860400002)(366004)(376002)(396003)(186009)(1800799009)(451199024)(71200400001)(6506007)(7696005)(38070700005)(38100700002)(9686003)(122000001)(53546011)(82960400001)(86362001)(55016003)(26005)(83380400001)(33656002)(2906002)(54906003)(64756008)(66946007)(66476007)(66446008)(66556008)(316002)(41300700001)(110136005)(76116006)(5660300002)(52536014)(8676002)(4326008)(8936002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?R2nmilcFopuxUu6jXwLCLsSc5J9Lvm6+8ZfXMwLq6ajcPfkzAa7mO81Yh4Bn?=
 =?us-ascii?Q?F4z1a+MYSGr5X3M/HsWWvAV0KaKOdPgndau+hOI6E71bTHOiMzIEYNVj+4MR?=
 =?us-ascii?Q?u6bmckTv5EM5dOvdfapVmXWLgUz93KPJb7avf97n4focGoZvbF6fzk7meNFM?=
 =?us-ascii?Q?T5bBoU9hSITS3EcAq2sPlJUH/OH9n2eoCWQhNwjiGt4fP3YsdQbrj8Q0FYe3?=
 =?us-ascii?Q?kD67qy+fO9lRE+uELR73fp94thrKVoYM//FJiKjjeIGGStoYTNEcpl8GXmio?=
 =?us-ascii?Q?z7289qI9oCXQdgShWGmWyt5yKYt3A5MGCxaguRxwXvr5WjIxfqtpkm+MImD/?=
 =?us-ascii?Q?NLCxihxx6+vTSURwGvJGchfy4YzDTGBfePgew65FtHHXwHnr5KQe+c9hXqQQ?=
 =?us-ascii?Q?JDJeydUsFLxGm4LZ+IK1Mgc7Bw/XiIKUX3Gpuf8K6uHlX7qT1vIzDcc+t5H+?=
 =?us-ascii?Q?HF92O0+RooDZnE2XY6zKVrQIr2XvyQWCZTq0hNOZWyc50rJnGcA4nV2L/8V/?=
 =?us-ascii?Q?yv7Iglvdczcyr7N7BkYj825j+8NKY/aU+Nib6JqVUDZOIKeMkbX4rc3D5E5j?=
 =?us-ascii?Q?YzGPBssmtbEVpbZjY0QXNgpAHzWZi3u2ylp0UhcZcqBTDaKy3y6PAB/xYtAx?=
 =?us-ascii?Q?LPlNsFWj5s5tM7VJYHxa2G5poPfUMNtUoC0oYRNO0NJfnehfn1hoxDLKYqCa?=
 =?us-ascii?Q?y6p8JcWMBsJcLveFv52NwhfiUZVfR1hoOv7vf6g2UafUarDFUypu8u3Wb6sY?=
 =?us-ascii?Q?FYszELd0WJ3Ha2pwBtmrm+xytoZ75/3ufcmrDqUszNTw2SAQTh2njyblMpnN?=
 =?us-ascii?Q?rM/oGSzTSQ5rxgn/9eEX9ICN1U9QKJPnXKi2FShwvtcjkvYhFnEd8SEwI9KY?=
 =?us-ascii?Q?5nSCcoKRiCWAbBHUpIrw3bl59QHzzSdAc+W+4qe66LesnKtbZya3gCwxTTkF?=
 =?us-ascii?Q?vfqDFHe3nLOA7kHgsfiwyiFUNlNuBufIGXrV1WR7CyfRDgPLgqRnhP37Vwl/?=
 =?us-ascii?Q?dw7E4DXKpYWnU2E7yMDX4qpn+wJk0ntb62oWux/30supD7Su6vhy+Wf+sXXj?=
 =?us-ascii?Q?/AY6TlfqzdgRk3/blL/RuZUG0KBS9hCMsHvPycZ9asW1FikYtl1shhfXWpG1?=
 =?us-ascii?Q?9CSUJDkf1NN4V2s7z7xOXQ/3WqCyX5WzxVxgLFOn5+aR+gxPflSr3OED/rru?=
 =?us-ascii?Q?D6MkhBrtGsTdUaj96q1gNaZ1TG67WzT+hbQ5tbbMpWqHit4B3RLM/poQPpBN?=
 =?us-ascii?Q?A0mnV40hKdYpquuZRBZs6Io3CzdAt6czAyMe1e2QvYvyYasGE4b2TWDObF3g?=
 =?us-ascii?Q?avl5PIwbaBDcTpYt0IE1LVato83NQ0f9uDSiXu7zSoVKTblekmQJIoD0V4Ed?=
 =?us-ascii?Q?/NzGr715P4ZyhUHrj5y2lkKxboPe/bapiZaD33K7boEe8aUOYr4I67TeBfHF?=
 =?us-ascii?Q?y8idPi064WFnVrd2wdO1ki/TuIE6jyct7MkiUYlTjoiUBahERwsdE7cnH20Z?=
 =?us-ascii?Q?y7VTgFPTu1TS6W9AChjPwDhxFIIqrqDtzzFG8xNyO9gMlF8EFhfj9CjwYJ5R?=
 =?us-ascii?Q?CJEJ9rUULMzGQ3XKK1E=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca8560a6-b271-4f68-36af-08db9ff6ead8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2023 14:25:05.3459
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /EQV9w5+O39uMm+8BIxbBqu7mMtVAArxD7LhGVyDM8vYdmycssq1DWrSk5GQmLNbd1V4QEDR1SnNsqzVI+eUkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7351
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_072525_764470_59B78F20 
X-CRM114-Status: GOOD (  18.84  )
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

Reviewed-by: Haibo Xu <haibo1.xu@intel.com>

>  	if (reg_off >= ARRAY_SIZE(kvm_sbi_ext_reg_name)) {
> --
> 2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
