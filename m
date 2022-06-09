Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D708C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 18:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oe4FeuOLr2l4hVVKCgkDg6HarmTWwBrZUozV2KTU6Cc=; b=Z8VRN2ugw7LS+E
	aIu4BzMvwqOctoPceQrzH/dLsnr2VjMXtgbd+csOYbYH02MYyfZY9Rod8Pkh7cGROpG5f8ukCaPMf
	izGZltNzQeAF9vS2fyii4gdLFrlpRHHikTh6JCk3lYfua1+eAMQPNdIE6W1dEuaSay/LM11WFKB1y
	OSybn8yaesOLwJS91/JJd1mfYNwaXXPVR14eyw5FI1z4BnTWVwIyvqhQqkj2hZ3SXRDW2x1HH98t/
	9z6I0gRfsuHzcxBjIBWpv9ABMiHuMk7gSKtQZWhGMUxoBRmLULKSDRhDX2gvHweyzVmjvGDK5aKhQ
	x+ES9WYpHG/ZGox3bzhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzN6I-003fwu-SG; Thu, 09 Jun 2022 18:41:46 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzN6E-003ftc-Jd; Thu, 09 Jun 2022 18:41:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654800102; x=1686336102;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GnJzHQEegaxYJXWZ27CRChER80Ptsc2CXjyVogRpGpo=;
  b=mrMD0dOlhCExUNMdxHr4TMDY3lXs8Vlm7jjaQ6iM5IsDKTiCIWdeieCy
   ChwsQgeY9T8QdReuJ/ugSHzA6QL/IXowizLQFr02jERh+4RfGImiDO17+
   S4zRDyFDt5JOlJUoGxT7Sua8uP2SFVDgsvA1DkbI0QjhB+KWL9Bl32VMk
   XFH3kBuFZ1MNE3ZAmHjQNcV1SSMwqbiBg1GlLCvHSJvjI5m7+cwXeI8+s
   nYcrznYEVJ/DgA4pxoCDW4OqEx1ZTxLZ3hUzjVVH5nlkV2uyALGy7gAM/
   oI/9jyC83mB9iSbJR9QJKx9RbHnJQKk4DNhZ7XUU/OreLVIhivEFCp+2G
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="276153436"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="276153436"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 11:41:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="671460758"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Jun 2022 11:41:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 9 Jun 2022 11:41:39 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 9 Jun 2022 11:41:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 9 Jun 2022 11:41:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 9 Jun 2022 11:41:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhowz4NMcYZfDRxk1gWVYe3+wHE9eIcVQpUuSKHx4cQhaXs54Gd2pHVr24NZixvUBkuKWU+BF9c3k1pfGIgiTQlnqzgl9467wacIuPOYgvaYAnZH/1VGy2TQ9Q9SOFkJBIu0ZJmwy5mT4p8UTNZAMxUyKWuM3vIMHQ8CZf7N1nlYsWY60IFMvA4dmwdV5p1HN6U3XJBiMxWOfV/bQuduGqUybiwazKLRAs3ejLcL/SgCkHxvOq7hhpvcqzHY45PdEZPAGkBgRjuRjx8QZLXNXtcfCwEvNFkxdg1O4j1M4wgoZQ1zrMPpuBQZfdLm/Pn91MnS7w5ye4vKPu1hji62ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GnJzHQEegaxYJXWZ27CRChER80Ptsc2CXjyVogRpGpo=;
 b=c677enGyhYsHlr24p2J9xfPoBg4Gs07A2Ms/ekIg09ruz0MVqNNVd3fczvTOVdJIr0Y24YDkoeI9z3bD3UEvzaHjGQkBbP30GgNNrXpIUS8FbBrCZwkzLvNizrT9K+guTfinscNubXMmcVqgfToKT5rQhqo1MKZOMjgCoJQDO/lTYy8rsSiYPzH54WGHdWUICaKRQEGjOB5NFtThjlB4o5z8SKdGVVOSZY2lkTghdc78BGMP6s4Caqp6r7Fwlbim6xeuR7w1gHjv8t1t2Rkvs2gKk3K+CmFc4JeQdJYn2v0EMLTEVo1JMbyk732EYyE684Kby+1W76CVc/j6i998zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB1392.namprd11.prod.outlook.com (2603:10b6:300:24::14)
 by DS0PR11MB6326.namprd11.prod.outlook.com (2603:10b6:8:ce::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 18:41:36 +0000
Received: from MWHPR11MB1392.namprd11.prod.outlook.com
 ([fe80::6463:8e61:8405:30f4]) by MWHPR11MB1392.namprd11.prod.outlook.com
 ([fe80::6463:8e61:8405:30f4%11]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 18:41:36 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "hch@lst.de" <hch@lst.de>, "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>, "mcgrof@kernel.org" <mcgrof@kernel.org>
CC: "svens@linux.ibm.com" <svens@linux.ibm.com>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>,
	"paulus@samba.org" <paulus@samba.org>, "zepan@sipeed.com" <zepan@sipeed.com>,
	"iii@linux.ibm.com" <iii@linux.ibm.com>, "deller@gmx.de" <deller@gmx.de>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "joey.gouly@arm.com"
	<joey.gouly@arm.com>, "anemo@mba.ocn.ne.jp" <anemo@mba.ocn.ne.jp>,
	"egorenar@linux.ibm.com" <egorenar@linux.ibm.com>, "ast@kernel.org"
	<ast@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, "bp@alien8.de"
	<bp@alien8.de>, "davem@davemloft.net" <davem@davemloft.net>, "x86@kernel.org"
	<x86@kernel.org>, "luis.machado@linaro.org" <luis.machado@linaro.org>,
	"ebiederm@xmission.com" <ebiederm@xmission.com>, "mbenes@suse.cz"
	<mbenes@suse.cz>, "mingo@redhat.com" <mingo@redhat.com>, "jniethe5@gmail.com"
	<jniethe5@gmail.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "andreyknvl@gmail.com" <andreyknvl@gmail.com>,
	"dja@axtens.net" <dja@axtens.net>, "liaochang1@huawei.com"
	<liaochang1@huawei.com>, "linux-modules@vger.kernel.org"
	<linux-modules@vger.kernel.org>, "huschle@linux.ibm.com"
	<huschle@linux.ibm.com>, "will@kernel.org" <will@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"James.Bottomley@hansenpartnership.com"
	<James.Bottomley@hansenpartnership.com>, "song@kernel.org" <song@kernel.org>,
	"guoren@kernel.org" <guoren@kernel.org>, "nathan@kernel.org"
	<nathan@kernel.org>, "dave.anglin@bell.net" <dave.anglin@bell.net>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "atomlin@redhat.com"
	<atomlin@redhat.com>, "bristot@redhat.com" <bristot@redhat.com>,
	"naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>,
	"anup@brainfault.org" <anup@brainfault.org>, "javierm@redhat.com"
	<javierm@redhat.com>, "linux@roeck-us.net" <linux@roeck-us.net>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"philipp.tomsich@vrull.eu" <philipp.tomsich@vrull.eu>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "ndesaulniers@google.com"
	<ndesaulniers@google.com>, "samitolvanen@google.com"
	<samitolvanen@google.com>, "yangtiezhu@loongson.cn" <yangtiezhu@loongson.cn>,
	"aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
	"geert@linux-m68k.org" <geert@linux-m68k.org>, "hpa@zytor.com"
	<hpa@zytor.com>, "heiko@sntech.de" <heiko@sntech.de>, "nathaniel@profian.com"
	<nathaniel@profian.com>, "michael.roth@amd.com" <michael.roth@amd.com>,
	"rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>, "Sakkinen, Jarkko"
	<jarkko@profian.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>,
	"tmricht@linux.ibm.com" <tmricht@linux.ibm.com>, "hca@linux.ibm.com"
	<hca@linux.ibm.com>, "jarkko@kernel.org" <jarkko@kernel.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"gor@linux.ibm.com" <gor@linux.ibm.com>, "atishp@atishpatra.org"
	<atishp@atishpatra.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "dmitry.torokhov@gmail.com"
	<dmitry.torokhov@gmail.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>, "tsbogend@alpha.franken.de"
	<tsbogend@alpha.franken.de>, "nico@fluxnic.net" <nico@fluxnic.net>,
	"masahiroy@kernel.org" <masahiroy@kernel.org>, "agordeev@linux.ibm.com"
	<agordeev@linux.ibm.com>, "kernel@esmil.dk" <kernel@esmil.dk>,
	"ashimida@linux.alibaba.com" <ashimida@linux.alibaba.com>, "elver@google.com"
	<elver@google.com>, "keescook@chromium.org" <keescook@chromium.org>,
	"peterz@infradead.org" <peterz@infradead.org>, "mhiramat@kernel.org"
	<mhiramat@kernel.org>, "Keshavamurthy, Anil S"
	<anil.s.keshavamurthy@intel.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "chenzhongjin@huawei.com"
	<chenzhongjin@huawei.com>, "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
	"changbin.du@intel.com" <changbin.du@intel.com>, "benh@kernel.crashing.org"
	<benh@kernel.crashing.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
Thread-Topic: [PATCH] kprobes: Enable tracing for mololithic kernel images
Thread-Index: AQHYfARLeB5VUjkE/kuMrIbBjl/m8K1HaQ6A
Date: Thu, 9 Jun 2022 18:41:36 +0000
Message-ID: <e7dedb9086193ca7682edc10fabc4195894e5146.camel@intel.com>
References: <20220608000014.3054333-1-jarkko@profian.com>
	 <CAJF2gTQgCn2CyZ4+VBqEEBT2b4+1KxoEXxrd+Ritk=58+U8EFA@mail.gmail.com>
	 <YqAy0qjI4Lktk/uJ@iki.fi>
	 <20220608232115.ccd4399f4a1d133e9b65c2a9@kernel.org>
	 <CAPhsuW6iUieQvA6KqzSLgtxmjkVSWCuVwNA338DATb_myHxo7w@mail.gmail.com>
	 <CAPhsuW6BzUtqnjvaGJScXRpghs0_V_phpdyd4_oAKhvmkX-GFw@mail.gmail.com>
	 <YqEF6+YKqCHsWZJW@bombadil.infradead.org> <20220609034852.GA30873@lst.de>
	 <YqH0iEgsi6+bwS3x@bombadil.infradead.org>
In-Reply-To: <YqH0iEgsi6+bwS3x@bombadil.infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27189eb0-b55c-45ab-7fe9-08da4a47aee1
x-ms-traffictypediagnostic: DS0PR11MB6326:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DS0PR11MB63263E7000D819957ABD6255C9A79@DS0PR11MB6326.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n9qRhMXacaHR8ssVuPgZ97nSeEGIzYwgMELj+yTDV7Ybgd4Cg/Bg3QnWDsXM0f+t1AW0ckdu1103VoggfoyNpzpnsopW180u/CYYwMCnS6M/lLDSIEpK4cUDuoCPL472nYwn+koD70mp3jbvDBUo+ergZ2HrJmFKajfEZE5yJ9OCaNcdxO1elWOc2+6SLwaO/zCsmhcl/qTeQqPQvum6UG1LTD9kQBw1fWmmRFMoepQ2UMZwCpO/XetA+q/HnKFe/99tRprVIDT11HMi9tot8Z+92xNWmE25accYpKQDQCaaEvcHiSs18P5qXrEWNgbWiqxg5IAmILLVed8h/sIw49Rv0xF0QPNq/0258JmOzSEqtTOdpxrCfwBDA7qFVsAyW+T9nhr/E4r/5cbKgUzgsuyNBRneujBdSGiLcK6XcDkTrgoaqOBJr3gOZ25O5Ps3PJzy29xrf/Kn31NXqD37xVhTeMYwpIVPhAJS0wtEbWtNB9elUjAZlbbf90GTBWnR34F4AxcnGVwB6Uq6hJA4J2yU2fD78JEjxDGtjTOmCfmPrGeHgfKaKDNE2KDPuCgP98XOM/+J7nE5GpOdJDt81I/kUmI3zMUu/d2K+kG0AJThJvFfrH6xAEyGMVbQpJgptu/ww6RkbazDX3YCrIMMJvhTI0DvJlEZGkbEam8fcMEOx3PRB/BT08qETO1oPZwplkgR8oB6TpFHweYnoVMPpVwhmXjXRUqj2jXXK/Zk9Hg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(82960400001)(508600001)(6512007)(26005)(2906002)(38070700005)(36756003)(316002)(54906003)(122000001)(110136005)(83380400001)(66946007)(5660300002)(71200400001)(64756008)(76116006)(2616005)(66556008)(8676002)(66446008)(66476007)(7416002)(4326008)(7366002)(7336002)(8936002)(186003)(38100700002)(86362001)(7406005)(6506007)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHNqQ0xPdkdVYVBFSUt0K0grbmZrOEZScUpLOUdmdXFRT1hmZ21Zc3pKa2Mr?=
 =?utf-8?B?dGNLMlUwb3VQY2JsTWE1V1FtOWRFWUhVL0h3SFUxTEl0bndvb0hvNjlUdm5m?=
 =?utf-8?B?VVp3NmZjS2MvL2RIY2lSakl0WUJFVi8rZ1BZNGxUbWZBVmNudVR5elBLSUFN?=
 =?utf-8?B?RnMxa01BQWhwckNnZ003b2ppcVQ3eHVTelFHZ3BlSjdSazI4QU10SHV1UEd1?=
 =?utf-8?B?YmJLdTFWY1M2T0l5cXB0TE1ZWWRBUnlFM09qN3FaTUtMdVo4WGtVR1h3WXlT?=
 =?utf-8?B?YW1mWTRUVmVwbG5zRE5MQUVIWjRLVVluWFN5TVVZOWhkYUtjdkc5OFBkUE1S?=
 =?utf-8?B?Sm1sWTRuRVA3ajVCYS9HRE1FQUpTQUI4QVByeC9udGhzeThRZGxPbTdObjgx?=
 =?utf-8?B?N1EvSmhFdTJYRml0RVo5aTZ0dm4zZ2FvamtYSm9SSWlMMHl0NmdGVGVHaklx?=
 =?utf-8?B?UW15dFQySVlEZExpbnRabTNVYU5TNTBGMnlKUVlZdVdOdHduOFFFQTVmaWND?=
 =?utf-8?B?WXhLNFB2SkFoOXZsczZUMkROd0prdHJTNms2ZlE3VytkbWxxVzBndVNSU0Z3?=
 =?utf-8?B?eUFhcTZ2M0R6UmxPRmg0YnZnZ1BLVStkRnVSQUhMNkc3UkErOENLNGdsdFJm?=
 =?utf-8?B?N0FUeW45emorYmhkbDBsa3dlOXBLY21xclNHU3pJVm1YWmE0anVXK0hVekZP?=
 =?utf-8?B?TFdwTVNzM1NGOHY0SUZzb2sxUXgyUU9OT093SVk2Ri9xVVlNYkUxQi9IVk1S?=
 =?utf-8?B?ZndISnF6OGVmUEk0RVcrRUZjK0lLWUJIdHRKcmF5VXJPa3cwdGsvaXZsa01n?=
 =?utf-8?B?bUpieTNVd3d4M3BMN1pNdzJmMHQrN1dHbnBNZFJQWDJpalpEUjhhZm9jVlZF?=
 =?utf-8?B?b09VSVBuZklyVzI1NUZYS3NyUW1IbGRHVUF1TmpzRkNzQllVanFOZkpmQ2VC?=
 =?utf-8?B?MWY4dHVManNRdUNucCtDZjNTMFNjbjIvaDI3UFdyc3F5QTc5aTcrUkRlN2hk?=
 =?utf-8?B?NlB2KzFiVm9NUGVZZjBELzNpYVByZTBXTWpNOHdQZWxkSys1Wk1BTmZmanVN?=
 =?utf-8?B?b0Q5elY1T2lPNjd2NEpBeXp0N2owS3h2Z0RqRUJmcjlBSHZvTVI3K2xHK2py?=
 =?utf-8?B?L0NBaU1QbGZDMk14bHNTcHYrR3VydzI4MU01RG1qRS9ld3o3a1NsUWRRdGRL?=
 =?utf-8?B?N2tYcVhzT3JCTlZweDRPTTFOSXRXeW5mZDFRaEVZMjMySVV6TU1XZGJqbVJV?=
 =?utf-8?B?MCtPOFVvNDlsajlmSzByZmYzTGwvMzdvWVRiZjhPcm1MaG1vbWt0NWJOemQ4?=
 =?utf-8?B?cmZnNk9COU9CSjU2OTcwNXZGRkY3a1ZtajIxL0lOTGl2RG5oTExWeGY2UGRN?=
 =?utf-8?B?VUI5RUZtSHhFNjhoVFozVmZkeGd2R0Y1elNTOFNpUWpQZWdRUHpSdFVNL0Rv?=
 =?utf-8?B?VHZteDZhd1I3eFc4Y0o5UWUra01DMjF5ZUdsR2c5QzBPN3htanBXdEFoaDlB?=
 =?utf-8?B?S0VtNUNsRGhYbm5xTTR5VzZVQW1qSjA4T3ZIeG9CUHVSVUJ4VFBaRzJPZjFL?=
 =?utf-8?B?RDFiaWdFT0ZzYnpNUzJiUU1NSG5sVzNtUHUzeG9EOUxLQWRPSDdwNXBMUXBH?=
 =?utf-8?B?R0FQZCtTNnJEM2NkRWdvbXJKZGl3YXNSU0VqVUZ0anJrOFM1RUlvM284SXRW?=
 =?utf-8?B?bDZWK2VXWTdOYTcwR3RObUJ6WDFzMFBJNXljRXRlT0hLUjFCMlJNLzR4clIx?=
 =?utf-8?B?a1ZNMGFKampMZHg2NkUrWW9lditobGlGci93b1dKUWlhZmlZUVhnTmdpRnc5?=
 =?utf-8?B?SG5meEpXVnpQdmJVUWtTdnhKK0lkTTQ0RCtaNmlZbndWa0JYbThzNFBQMmJs?=
 =?utf-8?B?MjVPTFo1MWxzb2pWbGZCWEpteUdTVFluYWhrMHpUQUhaQWZzMUMvejM0V3h3?=
 =?utf-8?B?ODNTQmgyckcyQ3Z6aUlJSTNtOWc2L0pocGJPRElEdjZyb0gvZnBpQW94ZlVI?=
 =?utf-8?B?ZDNxNi9EVU8xdUlxeDZMTmxWcTVyUXRlVGtYekpMZHFUNzk5bWk2SmdtekxF?=
 =?utf-8?B?elVRbDBCSzZGUEhVTWZZRkE1M3FLazlyMzJPelBxQjRkYmJlN1MrNGFQa1dj?=
 =?utf-8?B?ckM1ZTdDdmljWDdIQUFhUjNZdjBCdW1GZlIydWVXQkU4MktkdGVNd201S0N3?=
 =?utf-8?B?T2pkUWl3QTArak9rVjNKQ2J3TWh5ZHBZU3M0RHFGbjZjQ1dPaHRvL2c1MWpI?=
 =?utf-8?B?T3J1bFhNdW5KN1VMUHZvWU94OGpHMkxIQ2xQSXZYRGxkVGwzV1g0U0lhQk4y?=
 =?utf-8?B?VWNIM0cwWVROcDJibW9QeDBtSEphTGpRTnd4ejQ4cGo1V0FwUmg1NmNPY0JY?=
 =?utf-8?Q?ms2JWep+TdGrPVwUiAzTkwsSDGbPXIS89nXbS?=
Content-ID: <4BAAC4A892B18A45A2D9180E62C156E9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27189eb0-b55c-45ab-7fe9-08da4a47aee1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2022 18:41:36.2868
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dauXqRR3LKWAhInZy9JNdoGuT/+wdObAzJrkJuADQfRoEIbwZ7aYn8k7fUtHkSa98WticLLIdE1wEoby9bRvsd69SVwBmpU9uXbKzr3cUbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6326
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_114142_759497_A6AE163C 
X-CRM114-Status: UNSURE (   7.09  )
X-CRM114-Notice: Please train this message.
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

On Thu, 2022-06-09 at 06:24 -0700, Luis Chamberlain wrote:
> On Thu, Jun 09, 2022 at 05:48:52AM +0200, Christoph Hellwig wrote:
> > On Wed, Jun 08, 2022 at 01:26:19PM -0700, Luis Chamberlain wrote:
> > > No, that was removed because it has only one user.
> > 
> > That is only part of the story.  The other part is that the overall
> > kernel simply does not have any business allocating exutable
> > memory.
> > Executable memory is a very special concept for modules or module-
> > like
> > code like kprobes, and should not be exposed as a general concept.
> 
> It is not just modules and kprobes, it is also ftrace and bpf too
> now.
> So while it should not be used everywhere calling it module_alloc()
> is just confusing at this point. Likewise, module_alloc_huge() is
> being proposed too and I'd rather we deal with this properly in
> aligment
> of taking care of the rename as well.
> 
> If the concern is to restrict access we can use the module namespace
> stuff
> so to ensure only intended users get access to it.

BPF even has multiple uses for text allocation. It has its own
trampoline feature that puts different type of text in the allocation,
with its own allocation routine. I looks like there are even more
little allocators in there.

So yea, there seems to be a lot of the kernel in the business of
dynamically generated text, for better or worse. I agree that it needs
to be done carefully. However, these usages always seem to have the
same problems (W^X, arch eccentricities, etc). So I don't think we
should hide away the pieces. Instead we should have something with
guard rails on it, so they can't get the allocation part wrong.

But I guess the question here is: what should we do in the meantime? It
is kind of similar to the questions that came up around the bpf prog
pack allocator. Should we hold up allocator related work until
underlying problems are resolved and there is some mature core
solution?

Personally I had thought we would need to do some clean switch to a
much different interface. I still think someday it will be required,
but it seems to be evolving naturally for the time being.

Like say for a next step we moved prog pack out of bpf into core code,
gave it it's own copy of module_alloc(), and then made kprobes use it.
Then we would have something with improved W^X guard rails, and kprobes
would not depend on modules anymore. I think maybe it's a step in the
right direction, even if it's not perfect.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
