Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D806C4321E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 13:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xt3zdtcIeKxIkYqCI5d9e7SwOAiiH+qlqWy4z41X1pc=; b=sV80lhnVpvgVsl
	rhgP9uLQDhqg3d/L3ITIMszVgVxBvpZyfrl8XFzhH7bWOmP8oU2LZR8kqw7Zy89NZYEl4egBPj/NU
	KGCecfjAWyA1PSRaqe4SSu8Q9TXibyOB+kuZgGlJ4J1XUnrWWvBUdMkEbxQIvVoooln6yijTRp5F0
	1qcKnJEmS56JyRnkLTvxtZaONNvUz3UQCUQMN2ZXSGMNfaPSxGN/8dAIJK5qnunewkduR60VxgTZx
	d9g4UJjMoIYXFXyOvMGkeHM9QRUF7qPwval9hxOk+dQml2xBD4ujobLy2zl5BvqalUr0RuWGqBaVb
	6BaSjQbdTI1qwpF5iRGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p15lC-00GYMD-1D; Fri, 02 Dec 2022 13:07:22 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p15kt-00GYFq-7o; Fri, 02 Dec 2022 13:07:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669986423; x=1701522423;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=TiPLLvETuuTttA7WoVEZbYGUuuzc6nryR0EwKqf/fnI=;
  b=WHetdSiXmX6TdXp2/y6RD7KjAjC88ck1ACx94Mne8oPqMNi8Cmq9nPLj
   DiNdEX5sXuKsIzWt6YFDuiF0tgQ3TB4wMex/bcQZGvuhT4daO4NvQsRJq
   3xhUAhUuNhAMFY4ix7xzpvou6DphguEgc8NES/CloOfrhkp+7zoJd5c2h
   dRz7EtOsORhp2rATyp5kI+XdOor+ztmepdTxg/NKT8FWzfbl+sNggQOiR
   dq2aoVRdYud+5kdtwVPG5AhGZTW0CVEswY37jC2xTdLKispLsmWgfNBjb
   B4mBnkcjhDfCegQqIXyDGsPwHQW//Tn4kxCtaGRKiIwv1atNLdc2mA2dV
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="378102112"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="378102112"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2022 05:07:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="645023243"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="645023243"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga002.jf.intel.com with ESMTP; 02 Dec 2022 05:07:00 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 2 Dec 2022 05:06:59 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 2 Dec 2022 05:06:59 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 2 Dec 2022 05:06:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDEmcqHTUB5Pbm4srcnTJIrwbATOruJHqXSQJTTzfZvCU0oT53GDzGLXp39c227FE8KflfnplyVypIoG7YrcRFeNhKdEJ5VfQ0PPjIgif41cbqGUtY4DruZ01d2zhbnV3SBJyYjGkDLqqVQATORZ5nJ/cYAIJ+Sl+mpRdugM5TBzeQLuxq1uymRNpE60ylxjNjAuaprlpH3A8VersWeR2e6YXzewk51MTJOQCsd2snZeiGPI1Eni1gqteqWmjHTF+u5I51Fgb6c1l8zK3dYewLAAU+XR+spCLtbAGzyYW7lVWL8ardlKDJqdtw8FDPckHETYUEaiuQhSpdEW9pUJaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TiPLLvETuuTttA7WoVEZbYGUuuzc6nryR0EwKqf/fnI=;
 b=btfWnarfOTWetlMS0JRObMQnKFaJws68lDUe1gxZfFcBC3adV6TXzMykyl4slkAzIzdLK8qQeu6Iv+tOFI8jkSyAqJpVt4SPceq0FhzDBrlZGYCD+2xRpwZSrJy7fZrvKrDzsZL7xMze0K4GoJdlfAlNYF2sJXsSD03mcTEac8YZb+JYwzpzNMr9MDLG3G2I9nue44K0U+vKIWmjTpaA4f45NLOnp0EhtVOPOXtpMZdTQ1fggyxSe/p2Fta2KSTKVx0yxjI2IVebgA367qgpM7COZmKVxHNQxGmiVVRWdnRa94N/E9BsoKrDtlD36qTx38DindVenxnPb74CBWsgfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by PH7PR11MB7720.namprd11.prod.outlook.com (2603:10b6:510:2b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 13:06:57 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::2fb7:be18:a20d:9b6e]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::2fb7:be18:a20d:9b6e%9]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 13:06:57 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "maz@kernel.org"
	<maz@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"farman@linux.ibm.com" <farman@linux.ibm.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"Christopherson,, Sean" <seanjc@google.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"aleksandar.qemu.devel@gmail.com" <aleksandar.qemu.devel@gmail.com>,
	"imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "paul@xen.org"
	<paul@xen.org>, "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>, "anup@brainfault.org"
	<anup@brainfault.org>
CC: "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"farosas@linux.ibm.com" <farosas@linux.ibm.com>, "david@redhat.com"
	<david@redhat.com>, "james.morse@arm.com" <james.morse@arm.com>, "Yao, Yuan"
	<yuan.yao@intel.com>, "alexandru.elisei@arm.com" <alexandru.elisei@arm.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "Yamahata, Isaku"
	<isaku.yamahata@intel.com>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "kvmarm@lists.cs.columbia.edu"
	<kvmarm@lists.cs.columbia.edu>, "philmd@linaro.org" <philmd@linaro.org>,
	"atishp@atishpatra.org" <atishp@atishpatra.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "Gao,
 Chao" <chao.gao@intel.com>
Subject: Re: [PATCH v2 41/50] KVM: Rename and move CPUHP_AP_KVM_STARTING to
 ONLINE section
Thread-Topic: [PATCH v2 41/50] KVM: Rename and move CPUHP_AP_KVM_STARTING to
 ONLINE section
Thread-Index: AQHZBREGwqGB0mGv3kiSNzAdaRlWSK5ak8WA
Date: Fri, 2 Dec 2022 13:06:56 +0000
Message-ID: <c74c88ba6a17da2d36e2d340ce22af127bda8383.camel@intel.com>
References: <20221130230934.1014142-1-seanjc@google.com>
	 <20221130230934.1014142-42-seanjc@google.com>
In-Reply-To: <20221130230934.1014142-42-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|PH7PR11MB7720:EE_
x-ms-office365-filtering-correlation-id: bd0c33ad-6c31-44f0-f118-08dad4661716
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fJ8LwWsGKiD5dcHTmdZBhpYV2RPCYfOwVmJxFw3N28lHiWjbHEIhqOEqVGMIGzShLxzTgFb8wjk3EgW2z6QNfkhlH80ZhgPFs835CEhUCUHPmq7si3x49uI8HdfT37fsmA1mCBfymlo438G6AwgylxKdzDcugaLevG/KbF+t7rXZebWN8gBrc11EHcdhK+10PViims7AtggtaL7HPpOg9c1/yD7hE74piAMmf/3PvRsTb6AGhtI02XO0mv3iK9LT4W2Y85aes14YAgrgLWnx6W7L9B5/u3f0X7jHdO+BQMkLJRSBtxoDsNPgqPgZG/RlKNv8oREfhqRl+mHjYTjBwn80Wx0hTrO878RsscXwaQ+7qoHtMJw/FtwjtyTu8LrTMVH0Kkzwe4V+FXrUxXWg+3yWbJPJCveGk1FOq54sPEb1gZ58Az/7Eu8OTF6wStU2Br74dWWOcEYKThPXCOp+Ks56aKbrRNCrGgr+KY9tYuZqih2RdtZau2ZyDWlrZyIc3iG+ln7tgMrhcdvpPEs0JHxTbiGRPL1Bfq6Smb3QiUDPjCAL50bp7uQZJvCvcr8vHL4ucCinUJS3xo18tHTtcUOrtjYI3EHnpIiq69LDpkCxqxDDzHASG+PrfxIdJrZp8HPF+Hhfs/L1mYHW101ELd0ZRv77/iEMtgdQLe314PWju93GX28h/fFkYBUaMvlqA1MGe/RxVVYSm7C4NzUzXc+/4qbratj4NGYYm4Sr6xg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199015)(41300700001)(66946007)(64756008)(66446008)(66556008)(66476007)(91956017)(26005)(8676002)(6512007)(6506007)(4326008)(921005)(76116006)(83380400001)(36756003)(86362001)(110136005)(54906003)(71200400001)(122000001)(316002)(6486002)(478600001)(38100700002)(82960400001)(2906002)(186003)(2616005)(7406005)(4744005)(8936002)(7416002)(4001150100001)(107886003)(38070700005)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0h5M0szSHdON1ZhZkJlL0toUEFLMTdRYjNhSTVlVmQwL2U1UGxVVXJVRmRF?=
 =?utf-8?B?aEN1Y2RqTHBMQkgraHJDREo4SzdwNk85QVZBajlaOThuc255L2t5Z0laWDd3?=
 =?utf-8?B?WGwvUVBMNlpDRzRRc0tRUnNDR0hJTkN2NTI1dHQ2RWZWbGxlYTlucURiUm8y?=
 =?utf-8?B?elFhVDdqcEczQmtKN2hoVHdWbWFzVHFiYzRYUFFLTmZ6UFlsSmtQdkVMMUlC?=
 =?utf-8?B?RWd1TkhjcTlwTUNPT0N6UHlpNFE3djJSMFEzWGplSm1mek8wLzBrQ3cyMTlE?=
 =?utf-8?B?aDh2aFF6aGtuQ25URDJxUXBFc0dZdVNGWEJhV0VmUE84Ylg5TTRBdEVvelph?=
 =?utf-8?B?TTFYWGtOVmJ5ZEFtcklieDJEdWxHUDg1U2w5MmxMcjVRcU5oVTdCVDZKY1pp?=
 =?utf-8?B?YWZRczE4cGJSRWpTNjJQNU5Ga2Z3UUZwNXlzUnY5dVRmOVRYQ1Q2NjNIOERB?=
 =?utf-8?B?OFZyVExqRGdpVDFpZnVHNmQzMVI5MExMT0tTMlBVVjdrWTRqdEtrT0hKeTBW?=
 =?utf-8?B?NGJoNVg4OVRteUt5KzhZN2tqdTdHaGZRUDlpUjU5RWtZZHdWWmRiWEFHdkNu?=
 =?utf-8?B?anlLOWxjZVRCL1JPTW5VTWRCVmtUaWpaZ2VoU2FCNi9UL2hLU3c5TGxxRWNo?=
 =?utf-8?B?ZGVkdWJmWXRKYWxIZ0hMRWI0WEdnYkl2OExDWnJZS0Z1YWpFSEdZZ01WQTFV?=
 =?utf-8?B?OXh4aStFaUU5VDA4a29MSHNxR0xaVnlucE9YN1dkMm03SjFxMFpmK3dVWk03?=
 =?utf-8?B?a2hjdlpxYWVlNUk5S3ZVN092Y0VjM2JVUTRhNER4cnRXVEN6M1N3THkzL2ZP?=
 =?utf-8?B?V2dqRDczLytpUXZKY1JQT1pTUW1wMFVtK05yUXZqK29jQitIZEV6dmhiUDBa?=
 =?utf-8?B?SmdQV3JxZkRIbFdQVWdtOHl0LzRUWllUSGQvczc0a2xKUDVYMW9xVGQ5UXNW?=
 =?utf-8?B?Qzl5bmtrYUVpTFVZR0x2OVBZRTF6V3lYbDlKMHZjOXV3eTlFNUV0ZkZmK3RS?=
 =?utf-8?B?eFY5M04rZ3JhOHJBcmdNZklMQ3RKY092WmhLMHhJSWpKRk03MHN0K1hrTkdP?=
 =?utf-8?B?QWNXSXh5dC9tSm93WkVvaHdpT3ZPdEJNWk5ST0xEVUdPNkVEVU4wVXA1cy9o?=
 =?utf-8?B?N2JlMTUrbmozelFFa1YrKzJ4eC9ydUVnTGpydWdpdmlSRDkxT1FiN2VOWU9z?=
 =?utf-8?B?dHJWZUNTWjlHY2RKY3hOQTlodXc4WjM3Y3h4bzlodmpCSCtmOUN4ZWt3NXAv?=
 =?utf-8?B?VThRY25JYURtTmYrQ0NTK2h4K1F6MllKbmo0TG1weFhNQldHSU9BcmtvU203?=
 =?utf-8?B?OFk3R3hEVGpOeUgreWFKVDU5RmZKbDlsYjFEeDI0RnRlQnBJVTlNNmJLcFFB?=
 =?utf-8?B?cVNKaG1HZ2tpKzMzcFFlUkplRlZMZmZtMEcwc2xndkg1T0RhMFlEY3hXNkFs?=
 =?utf-8?B?L0FNTXREZEpFS01ja1YvRXNodjQyZktzSG13U1plL1pIemY0SGhBeEdCQVpG?=
 =?utf-8?B?WE4rWW5pTmk5NFJvNEtBeUcwcUQ2ZktDeDIzTkw1N09WeTRTNE1VM1dGclNR?=
 =?utf-8?B?VUQzR09DaHhuOElIdnJOdFNMTVI1VHMxWkhydFZrOTVSR3dPSkFVTTZXSE41?=
 =?utf-8?B?RnVCbWZTaXBQNWVNRkt2aU5meW54c1JSbG1SaXNGSitKRWRjWEduZ201SmJI?=
 =?utf-8?B?TEcvcmI1YnIvcXBTTXBIYkMra204aHBjRmhDMDRDL1EwNGZnSGdKZjJtaGVS?=
 =?utf-8?B?M05tNkhEZmFWN3NrVWhzeW1rcFJlQTRMWmZVeVhvZ2JpT2ZPM1J3azB6bTYz?=
 =?utf-8?B?WXNiTVVtVXdBdUIzR0VTbG5KR0l6S0dhQ3pXOWEwZndVbDNIbnBQQ25pN1gy?=
 =?utf-8?B?SHluNG1RaE44MnF3bmdNQ05oV1JHa0pFYU80UkdOZjlrRnRwSEQxWHBZcU5N?=
 =?utf-8?B?cW9BUFlvQ3RraDYwYldsbS9UeDZGcjAzaGpaRHJldUVQbFdnaHRya0FCUnlq?=
 =?utf-8?B?N0RtR09Wa1dmS3IraENXUGZjdUluakZEUVZmblJzbEVxeHhqaWJHTHVSN3FK?=
 =?utf-8?B?Qjk2Nlp2ZzV6Vkd5eE1lWXJXaHEvYjVvK3VnOG5wcitKSWQvTXF3Szk5Wk5C?=
 =?utf-8?B?di9mUUhpOUV2RFMxMDFiOXZSWmE0YVcrKzdMViswWEVDTmlqVmYyNnNRNjFB?=
 =?utf-8?B?UGc9PQ==?=
Content-ID: <B6401B0B2AD30149BA31146D3F407D2D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0c33ad-6c31-44f0-f118-08dad4661716
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 13:06:56.4853
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l5EZ58kqD3uAi6zyg6CQow93ZWOhQ211HBiPEsPQTN52iAiFH705cUop7WguhwKQSwwCyBiEObbCEUTTyITbGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7720
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_050703_388909_C37B9F86 
X-CRM114-Status: GOOD (  10.05  )
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

On Wed, 2022-11-30 at 23:09 +0000, Sean Christopherson wrote:
> From: Chao Gao <chao.gao@intel.com>
> 
...

> 
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>

Perhaps I am wrong, but I have memory that if someone has SoB but isn't the
original author should also have a Co-developed-by?

> Reviewed-by: Yuan Yao <yuan.yao@intel.com>
> [sean: drop WARN that IRQs are disabled]
> Signed-off-by: Sean Christopherson <seanjc@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
