Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14B9C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 09:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OSVgoxkxCweMqpKBN6MHnSGHWOWjN7WoawH3PlX8TbM=; b=MbaEbyUC0d2PL/
	3hdEBJZlaQp2JsFGc7YbRyItJlyiwPv6+NkLpNk3jyImnCGDfKcUCoTUSMkPkLpSMPnf0RA1+/Yq9
	ipy17VWua4r+Xw4y77+4pot0ruTwpdDovy5X5T/gB+BaiwTGK7og2gaixL83AxJGRIP6asbHwlOan
	HPFbrm/KMOhKH+/N1HTiiIgYynC6vEoCVQDZXBL/1SfhtXz7xiFjPRu8OGlRiB47sgdPZDJsGgf+6
	BvUdvBdWPNqi/8HQlrXxT/fhPcFJ6Nr0J0gwsWIY/XDfYQ6dmASpqNW/enrJd1ep8GoxlIQLk9Q2M
	MVO/VDXNg4KNnme+z1UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzvt9-00G9ko-2x;
	Mon, 06 Nov 2023 09:27:19 +0000
Received: from mgamail.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzvt5-00G9i9-2K;
	Mon, 06 Nov 2023 09:27:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699262835; x=1730798835;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bu3RUiqIcCuuTsoctLTRmwQdyz5EAcdPRP47ZTzlUvc=;
  b=M/wVPwdXI50Xp+55CKxGgyFMLx+2yWqsPd+n0tGHVysDx7/vMoIB5aMT
   pqrx6Dgfv28yVYQy7VK1Fz29I70blqeKXEYuQV3YncEzUBT0d4iP9l1kK
   1+9oEnP8/4E7EDl7thpkXs7BRK3Jy2mfqpdjkF953UD1ncRITh/+svMZg
   Xwkq17NsuIJBTXVC4Lf/EC8Z3GqZTc+15QZPyhES9W1QoJqE9fdn6ICoF
   KhUuTtBQvT+N/ZgKTyxxV5VD9ZxdO4tij9HLm+Mrvq8Z7ROfXYQWsTkws
   QmNybAIua6/iVyxCpcrs/a1gqJ65OBy8imnSl03V1f6k+ObmR+KoK8DTO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="386415291"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="386415291"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 01:27:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="1009468715"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="1009468715"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Nov 2023 01:27:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 6 Nov 2023 01:27:10 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 6 Nov 2023 01:27:10 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 6 Nov 2023 01:27:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KS0FJ/ELNI9+MZeIyomk3jO1BShJAGpZF1cSno+AGArXDTsihhdxWI4h4AtHaTVma/877RcAfDmTqT2T/vtFarvQyNn7631bov3NtBCZp8HpcEXiRj2TVhFde1tl12XMxZdQvdBdIYb1WsyIwVE21dIkjqh+c1KW5qIbDHNm5ZaT+2P3DDAOxUu8r5ddh2QhlhivbXVPV51bH5NGVVSEltgHXYz5IPM58UcOfFD0+Do0Bt5KGVfxNHPZU5hygjPqCYIfiKCga8bz+YQiSgv+1idYffi+5ma0peqjKgpEV9ovP+aXN4xXy5G9ggjYFpP21WxeSsOlZHoPkPXbt3SJLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bu3RUiqIcCuuTsoctLTRmwQdyz5EAcdPRP47ZTzlUvc=;
 b=PyITgPKSjDFDSLh5AsJsgHg/YGqlKJeif57uDhyP5h+H6IInErKDLW/N8EIHthqJFj38cLxtNjfV14CzG+LT29q9+IoOo3bng8EP7eiWrcpq+QfOsOtzIBq62MfWjJVScyhiTKmIvfC0XhgAt8PL1BZfXGklg2S2RnmqzRdKT1StBzmUFGvFbeXUf54tpchWVijjk1Lf7G84J/qzkq6wrBUT+b4TVVoyN/W0wK5RU0bPWva/HrDvNcfs5L75PH/YzBoSocQrXtSQUSE7QlFgod470416MCIKdD26djIKIiI/jFVq2AuWdMPNmvIVuipou5qlilg4EfZdeDtcmk8eSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 09:27:07 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::5d1:aa22:7c98:f3c6]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::5d1:aa22:7c98:f3c6%6]) with mapi id 15.20.6954.021; Mon, 6 Nov 2023
 09:27:06 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "Christopherson,,
 Sean" <seanjc@google.com>, "brauner@kernel.org" <brauner@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "chenhuacai@kernel.org"
	<chenhuacai@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "maz@kernel.org"
	<maz@kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "anup@brainfault.org" <anup@brainfault.org>,
	"willy@infradead.org" <willy@infradead.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>
CC: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "kvm-riscv@lists.infradead.org"
	<kvm-riscv@lists.infradead.org>, "mic@digikod.net" <mic@digikod.net>,
	"liam.merwick@oracle.com" <liam.merwick@oracle.com>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, "Yamahata, Isaku" <isaku.yamahata@intel.com>,
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
	"david@redhat.com" <david@redhat.com>, "tabba@google.com" <tabba@google.com>,
	"amoorthy@google.com" <amoorthy@google.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "michael.roth@amd.com"
	<michael.roth@amd.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "Annapurve,
 Vishal" <vannapurve@google.com>, "vbabka@suse.cz" <vbabka@suse.cz>,
	"mail@maciej.szmigiero.name" <mail@maciej.szmigiero.name>,
	"yu.c.zhang@linux.intel.com" <yu.c.zhang@linux.intel.com>,
	"qperret@google.com" <qperret@google.com>, "dmatlack@google.com"
	<dmatlack@google.com>, "Xu, Yilun" <yilun.xu@intel.com>,
	"isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>,
	"ackerleytng@google.com" <ackerleytng@google.com>, "jarkko@kernel.org"
	<jarkko@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "Wang, Wei W" <wei.w.wang@intel.com>
Subject: Re: [PATCH 08/34] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
Thread-Topic: [PATCH 08/34] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
Thread-Index: AQHaEAWe1s9vtM/5MkyLlkzyVHClwLBtBsAA
Date: Mon, 6 Nov 2023 09:27:06 +0000
Message-ID: <f42154178a882e3df7696821c85881f10c724a5b.camel@intel.com>
References: <20231105163040.14904-1-pbonzini@redhat.com>
	 <20231105163040.14904-9-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-9-pbonzini@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|BL1PR11MB5525:EE_
x-ms-office365-filtering-correlation-id: 9631418d-925e-43f4-3523-08dbdeaa8b32
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n+Ya9D/DlXjYUgYT3eYCX/PSbPghDr7aSezsgXK3e506wJq54xjNgZelAZyZAK5pcgc7okvkkBCGHey/qJ2OaTDIeaRx0mXw71KPdrS+dcNJib99PPG20uyDK53rczVRTNiK32oeoh9mWPPuhLtQrSvckniPqs0MD8byHT3KpgqQyzHLf4YtZt32ii6rOzHt55n3pnftBGAHODxQxMAeMH6jntuWPx+7kYJpYiWRpxU2jF1vBXp00z6DnI91fCJYLs97zVjzwhWiNOaZXTU8l6ILb+f6peJvp0Ql80rE1GQ4meszYmtk6glzIf8fDvKMpEfbhfcnKuDbGnKCQ5g9owmNmAvjnISa5qDnCdxTJxPt4SPLi2X54ZIdM5jMMbZaIByOHEJRqcfa3NIuIX25JU931UhtOeTDVMeoHW7HpOL81CIhT1SW9HaP8OBCRSlCSTmi26IYSmeIutlEzY6SbdC/t/N/PmuqJ7HWIVE9/ghD4G9/aKia6Q0dlwdQbIz3nWnT5FYus/DPbHfQbRxJ2yiV8QCcCL6wJ7fO/ui25w+R3qNaNmwOP5l1sZVmh864s76cyfk75y2AbFlj5ujB3LY4EECgj+40vK8x4hpkTvK9y78f1AzRmIc9Y6UnyZXZQ6iQSlEZnVvWLjfhIBxEpQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(136003)(39860400002)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(2616005)(6512007)(6486002)(6506007)(478600001)(71200400001)(2906002)(38100700002)(36756003)(86362001)(122000001)(82960400001)(7416002)(5660300002)(7406005)(41300700001)(66476007)(64756008)(66446008)(54906003)(66556008)(66946007)(26005)(921008)(38070700009)(91956017)(110136005)(316002)(8936002)(76116006)(4326008)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dy9oV0NKdjhmK3RQOE1mMk4xd2x4K1ZuUHdHMVJCUDdyUzhvQWJIVGRuNnVz?=
 =?utf-8?B?dEFsRXVJdEZlRDA3WnJ2V1hGc0E2Tm9iTkJuZXdJSk1JaTRnNzBmZzJ5Uy9l?=
 =?utf-8?B?dzlkUHRka0sxZjQvemxxUmg5ZlFOaHA3WFZ0d1ViektUNFVVRGwwV0g2eDRW?=
 =?utf-8?B?cHVwVnJFRDM2bFlOUmxabEF4RFFNSzVZSDFQZUcvS3Rua2NleUhtOWYzZExw?=
 =?utf-8?B?by9PM1lDUTJzZTQwY1h3YVdxOXZxbE1qOG1hSDhlN2tmakpKekhpZXZkYlpZ?=
 =?utf-8?B?bmhXSWJabjEvdDVnVCtBL2h2MFF5TytEN1pvZ1VvWS8xTjBpQWZJNHZsSjNv?=
 =?utf-8?B?bW54MTh6Qmk3SDBXMDNFUU5Pb3o4cXU4VUIrYnExTjk4bTVrTDRZdDB1NFNr?=
 =?utf-8?B?TXBvRXhHV0VGTTd2dGhnRkRla0d0VngrMHN4MDVpb0xUOStaQWFRSkdaSWpZ?=
 =?utf-8?B?WXZuMXA1Yk8vSkVUUGtsZG1VSWZDbUNQT25hcjFMTzNiWlNLYVVJKy9JbTNN?=
 =?utf-8?B?bjBiQTh0U1FXYWU4Tmd1Mm1lQzJvenU0R3dwTmNycUFwdkQ0T1hoQmpCSFRs?=
 =?utf-8?B?bExSa0xhS2dMOGFyenJ4cVNBWUI0aGhZdWVIclQ4VUdCQnpJZWRiU3M3Qk5p?=
 =?utf-8?B?dms0UllsL0p0NmNJYVVQcTFjenpjNEw2SldJVHoxOU50UHl3dUVyUzFRb2pl?=
 =?utf-8?B?ZFhKcVlodGdoVkM2cXdhQ2dUTXVyaGZXVjNsaWlLaTY5NXlxbkR3bTVycG1I?=
 =?utf-8?B?V1NWUFdIbXZ6WCs5SlhyeW9xaUppdWJ4TWJ4QTdQZ1NjWUVTZWtRN0dJYmdl?=
 =?utf-8?B?dGJQYmlERTNUNEFlZkw3RkVsa3ZjNGR5dk85U3Y3Y21xL0xlNFgxb0F4dzlR?=
 =?utf-8?B?VkV5S3N1VDl6ZnZDd3NTY0t4RGEyaUxGUTRkSlkvQXdOTGMyS1pud0dpdk9V?=
 =?utf-8?B?VEtaY1ZJMnJDdmZQeEJ1K1habTJDcnZwNGFoQmhSZUZYYlg2OEN4Q3dxcmQw?=
 =?utf-8?B?bHk2UE5vZmlqMDRNWHpEYUx3MURsbUhDMm5UbFZ0c1hDLzR1UWNITTh2S2w2?=
 =?utf-8?B?LzRjeEFZZXhER0xvdjl4SlloWGFFenpiaVZUZkovYUFnbC9qQUZwV25mS2Jy?=
 =?utf-8?B?VDB4SW9vT0cvM3NzdlZ0TEFLbzNQKzB3dk13amdZc2xDbHlhZWcxREZuVXpv?=
 =?utf-8?B?Z1ZzeGQvUS9JRVRhQmR4Zi8xU09saHJobjA5RTZDelZkNTVMRmQyMEowa2tt?=
 =?utf-8?B?VFNoYkdneEpLdS9FSzNjT01ZUkZzRXRxakhCbUU3ekNzb1ZMRUNoQk9rRjVa?=
 =?utf-8?B?WTg2QzZ4anhsV0FValIyeGkyV3hOenh4b05rM3gvQmVxQnFXQTdzczRhdHB5?=
 =?utf-8?B?WFdyK2k2OHlzbHArTzNZb2ZmT0dLQkcrQVM1Ylh2SVlwWHBwVndUSWhJSFJC?=
 =?utf-8?B?WjJuYzdSdGdxWG5pVDVmNEJrZy8yak9oZXJORHlHVUZSM3FoNHlFdUIwSVVj?=
 =?utf-8?B?cGFlS0dxWkJnWDZuencycTh0NmcrTFFwRXBWVXFSMFlpZXEzMVpCb05lQUxu?=
 =?utf-8?B?UkdBaVJrb1J3eXhsemFNVXlyK2E3aFNFNmRNaFgvZFZSOE9URE4zMll2SWJR?=
 =?utf-8?B?WW9BRmtoMlBsb1lEUDYwRGEyZGhQNVN2VWdQT25jMnRxU05HK2JYVE9OS0ty?=
 =?utf-8?B?YXlaN29pb0VrSVBucGlnTUtQempxQlRRRDY4R09yeFBhU3RCTzFnSmsvZ3lq?=
 =?utf-8?B?WG5FZmpaaWt6dDVlS1AwUTR3RzY4ZDk4QUU2K2RyaDRBSks3dWdEc25HU0k2?=
 =?utf-8?B?Y2hGQ2srcVExSExLUFNlWHhiZ1hYcnUzcW1jZG5pUDg4d21PZVVnSDBkajQ3?=
 =?utf-8?B?ZG52b3loeTcvRDY1S3ZVR2oyTFV1Q1FCMHFHU2Njem9kUG82UCttT1BVYjBw?=
 =?utf-8?B?T0RnV3ZGRHVQRUlWS00xWGZlKy9TVVh2RVowbHNLUzdOeG5tU3VKYUtqRXZl?=
 =?utf-8?B?Z1FONnEyN2hnV3p2THVNUkJWYWpYMnNVRkN5SU1mRW1Zd3RTNHYrZHFLSXc5?=
 =?utf-8?B?YXBjY0FaTWVkdGUzakZUWVNhRDRncXZQekFxcGFhTTVLUW5GK044azZBZlpq?=
 =?utf-8?B?OGFvNFR2R0M4TmZzTDlLWmIzeUhqVHlpZEhtVW9HTUNZRHhDVVljcHVETzNi?=
 =?utf-8?B?aVE9PQ==?=
Content-ID: <80BECADCC55CFA48ADB92ABB9518B0EC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9631418d-925e-43f4-3523-08dbdeaa8b32
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 09:27:06.3589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fKuffZuEgqkfff0k4MUvwI4ug/TeqmXr+qxB3Kt3Q6my80bYGoqRafd55oYHbhbYV0/sFpilrYzzYpjFAl7EMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5525
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_012715_770131_A5050B36 
X-CRM114-Status: GOOD (  15.08  )
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

> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 7025b3751027..bdea1423c5f8 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -1340,6 +1340,7 @@ yet and must be cleared on entry.
>  	__u64 guest_phys_addr;
>  	__u64 memory_size; /* bytes */
>  	__u64 userspace_addr; /* start of the userspace allocated memory */
> +	__u64 pad[16];

Looks this "pad[16]" should be moved to ...

>    };
>  
>    /* for kvm_userspace_memory_region::flags */
> @@ -6192,6 +6193,27 @@ to know what fields can be changed for the system register described by
>  ``op0, op1, crn, crm, op2``. KVM rejects ID register values that describe a
>  superset of the features supported by the system.
>  
> +4.140 KVM_SET_USER_MEMORY_REGION2
> +---------------------------------
> +
> +:Capability: KVM_CAP_USER_MEMORY2
> +:Architectures: all
> +:Type: vm ioctl
> +:Parameters: struct kvm_userspace_memory_region2 (in)
> +:Returns: 0 on success, -1 on error
> +
> +::
> +
> +  struct kvm_userspace_memory_region2 {
> +	__u32 slot;
> +	__u32 flags;
> +	__u64 guest_phys_addr;
> +	__u64 memory_size; /* bytes */
> +	__u64 userspace_addr; /* start of the userspace allocated memory */
> +  };
> +

... here.

Acked-by: Kai Huang <kai.huang@intel.com>
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
