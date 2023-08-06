Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE87C0015E
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Aug 2023 10:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VK8MRpXZ0CvPxlVDkOv0yaAcYE4ipithrOpiQHBKwuA=; b=OPBvgbKbY7jdUu
	UNgxFIGaZUTzhjk1DYb3MPq2xIYCSSNQq2M8vFpVCdzkaUuX3ImZWQOwuTCfIT9m2qGT+lR3zzUky
	Zw71uU0ueOMp0aUS8yo8mFKu+BxGXockvx1wzkS3mmey2ZlztnsJBiBS6SlIazjEHEPNL/gNoQ6ro
	Uz77KaDr50Tviy9JMWTer4M1vwP4mxi1ityFacjGgL4nf/dd2O2Qc1vQflSB+NzU9ez5rbkwHMJjq
	JxfOPdCi/AqrokMMMynEUDUmTacrgOo4AwPQ9ya/Qmp7ba4LjmPxiaKooHHQw8DfgUMUo0StBpNPu
	YWlVnMc+1gqQvotwc8bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSawW-00FBot-2b;
	Sun, 06 Aug 2023 10:25:00 +0000
Received: from mgamail.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSawB-00FBfr-06
	for linux-riscv@lists.infradead.org;
	Sun, 06 Aug 2023 10:24:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691317479; x=1722853479;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=me4Ig/agckbaVNDn2gvomakbHvr8PEZG9zh5+tZ02ds=;
  b=AeoVAxLkbIoJB9nPaStag4O9iOZv1KvvDB6JItPM8qQFOJYLYZObNHGr
   ZgdnyRxqfNpwhwr/Sr6IiDP1q1nF08yWlcb4opt5QEj3Ub++t8LpyUYav
   zUa8bfV+zeukul5Xd2jf+0X8+uJQQw12PjKYbyK4T/eKtDreFJX4yVg79
   uxLIN9fPjR6PXNy/L6uPAIr89vi9gAEeDJ0fWd9sXzjTL5PXoal8tsVOM
   1P/+9gVZb0kMM0ZbQMOpRCT6exQTl6e8QdF1GpNFELh1NPySadBy5tOQO
   EST7E6JCiSKPw/OUHhpakoWdb2YhRCXVmu7Dac+UE7DkOMTi68W+R8SvG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="360443051"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="360443051"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2023 03:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="800613609"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="800613609"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga004.fm.intel.com with ESMTP; 06 Aug 2023 03:24:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 6 Aug 2023 03:24:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 6 Aug 2023 03:24:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 6 Aug 2023 03:24:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 6 Aug 2023 03:24:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUztWEJz4w75odd2ZBAebdWNozhMFKqEyf3ZtMagfGDtg8ghV9fHvaKq9ZHCXnR8z8Ks1YLHM2VLD7EM5nlLMBVqAU/wLifXT2pEuidt1FdTxpEuvQYBz31W5bt7+Cby0jxEd6rYghXU/tPBqTz3Y5dB6sUThCUv1WIiLmJ2GO78PSe3Gr5Ngll9lI4S5Dict07NcST2pgZXInkT96+iIPsfvQ56G181TlTQORXigPhhwV3qH0r4XvrOSATbIAq+j4KmraXpSbP3OvmVaEfBNdW+B4/LthqwovyLOV04FECW38fWKNdfdrU9bHSR8z9yLklctL6vwlfDv8kZJ5Uddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=me4Ig/agckbaVNDn2gvomakbHvr8PEZG9zh5+tZ02ds=;
 b=HhVcscAYZj7E4xgdCsoPlb8Yul3t36ymnRO5qmbj1ip98LgHEqGcl43rUzZZaxYGaTbynN9NOKESeKiBqLHSBIhCAmuXDjKkwUAc4TN8rEICBFd82ku4U8Ar7HE/2n74WYHGrQB1QrlYBELtaLh3G2PZp1dGSfusKAg9zbbNHalL5ronxMREjoWFN62vhlrQGe2VP8f4gt3gM54lrnguldde15lSwHBV6pBcuUvXqP7ppIS2onRR+Aon98HhKzRLr8HqSl/saRWZnqkJ4e2gA9kq6wkUSJ8jKTPNhg2+ebRX2crBdsJPmAhcYdaEaTLVQR3FhIwrmqOxXy0RUvUT6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SJ0PR11MB6766.namprd11.prod.outlook.com (2603:10b6:a03:47c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Sun, 6 Aug
 2023 10:24:21 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6652.025; Sun, 6 Aug 2023
 10:24:21 +0000
From: "Wang, Xiao W" <xiao.w.wang@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
CC: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "anup@brainfault.org" <anup@brainfault.org>, "Li,
 Haicheng" <haicheng.li@intel.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-efi@vger.kernel.org"
	<linux-efi@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] RISC-V: Optimize bitops with Zbb extension
Thread-Topic: [PATCH] RISC-V: Optimize bitops with Zbb extension
Thread-Index: AQHZyA83tlYFgJbtxEiuzFgm3vAb3a/dA3eAgAAJ0KA=
Date: Sun, 6 Aug 2023 10:24:21 +0000
Message-ID: <DM8PR11MB5751DA69DEEAAC9B06623E0BB80FA@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20230806024715.3061589-1-xiao.w.wang@intel.com>
 <CAMj1kXHicVpT7PDSB=BgYEuhBxgufHqd9X8ZCg19k0_U+rjvEg@mail.gmail.com>
In-Reply-To: <CAMj1kXHicVpT7PDSB=BgYEuhBxgufHqd9X8ZCg19k0_U+rjvEg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SJ0PR11MB6766:EE_
x-ms-office365-filtering-correlation-id: 823b9fa9-c312-455b-3030-08db96674ca8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PX6iSiSLjHfBD88Vf8//kTSoXIa/6jbEp1lvp+F5E0LWcXTHjcaqh8nQsTlYO5qzQL2k86eR271QI1glHEBT2g4AatUFEqEQ50uG/9699kig/ciVcXLJ2C9fbNF+aYf54U9LCmfTh4Q9FUMYIfrsEqN7mrSy9TzsNOnMYlmAzkhWVktF1/ILh5aBRRtmIM6gimwHI3qPeMqPV/4z2g6dtr1Z+Gi8nYP++8QnnqwkJZ1hO8QXMVsAArVEBz59iXvp7eDBjuAcIKHODhiz8zBBGKTlX6k3f28mQEhe2MhD82dgLGhbhl90y5ms5xzWpwHOGFz07ySaPETkcm3hAetKyBJA6YMefylF3J0mE7KM0ziUW2sDxgMwvmaprcqj646kEzispTm46IvsurWMJKL7zxrSIPpI7kCZ7Aht7VLuaWC/+q/2vsL0X3muaU8MlkeIK1+sMV64BkVukz2dY1qi2Z/y5Od9qDlyX16k0u1jABFnhi2jZAo51kuvxaT76RZrr8mivfhn6GOnAX1YIeIVK0dR7HLVcnyLMcUeXVw2YFRihAyfTnq9QXIbi046nQD9M9z8KIu0Gw7nSU7w1uLk18mEqZZFrcbq4otTnQW8c5L3aTt+e/rshP+sgld3p0r2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5751.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(136003)(376002)(346002)(39860400002)(186006)(1800799003)(451199021)(33656002)(86362001)(38070700005)(83380400001)(55016003)(54906003)(478600001)(38100700002)(82960400001)(122000001)(8676002)(53546011)(26005)(6506007)(52536014)(9686003)(41300700001)(8936002)(71200400001)(7696005)(316002)(4326008)(76116006)(6916009)(66446008)(66946007)(66556008)(64756008)(2906002)(66476007)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2lkQ2FFNFhISEJxVDUycUVucHVvVDBESFFPb3Qyci8vK2NpenNLMDA2UVox?=
 =?utf-8?B?ZGN3WEgxM2Z4Qjl0S0NIMm9URXM2Tzd3R2lydC83c1ZEWWNkdXBLWC9ZSmlO?=
 =?utf-8?B?S2l3S1dldml4dE1oamZ1Sm9WVnZSWDZhdm5qUTNnb0hFMXgyVUV6OUFJdDF2?=
 =?utf-8?B?RGRCaFVTVURsSVJOVE1mL0FvZW4vLzFreUx2ZzFZSXNtckhCSjVOeGRWRUhr?=
 =?utf-8?B?Z2VpVE95WE5nc0l3M0lGZUZBSndaOFd2SzVaRm8xWElxdzlFY0MyR2lJMHlS?=
 =?utf-8?B?Nk5qYlhCM1Fjb2FQOUYyMlJKcmd2aDBzREhoMVFqVWZFb3ZSQzZVRzZEUXli?=
 =?utf-8?B?eXhOakNrSllxa21nSkFsWTZaRUQzaXpaREpIMlppNWxXYitUSWpyaW5mcEdI?=
 =?utf-8?B?VklwYlErVXNFMlRsNWgzcGZQQnVob2ZKYmZOR3RpVFpKUVYybHNtdmFhNzlW?=
 =?utf-8?B?ckJDTjhoU0JtMmRsWVl3WGdPVW1yekxML3kycEJZNWJhSlB0dkdvRWNsWGFV?=
 =?utf-8?B?YnduUW4zMzZ5bUZDaG5qUzlnS3IySWNucDRpT1hZMGJxdDRKTFBGc1p2NEto?=
 =?utf-8?B?UEJuTmhpRVN5T2psTVZtY3NFS2xJZDVBNm95MUZIelBuNUdCc21BNW1rL2tX?=
 =?utf-8?B?SHYrVzFJbk1qL3MwbnFSZmFDNlFrRXRheUhkRG9RSHJTb2FqdjBTbWNBOE9V?=
 =?utf-8?B?OVVUS1pLTEhxQ2d2WlNHbSt2dzZxaWdRYzM5NVlPY05BK09NVHJXS1lvbE9m?=
 =?utf-8?B?T0JGT09IWXROMW5yY2JUQ0FuSzB6L3R3UmRnR3VWeG9UUFNHRnQ1S0h0RzBV?=
 =?utf-8?B?MEJDcnZsbDM0UWd0TnZlZWRzaDg0T29VNEVaNm54ZUZSdTI2MnFRQWQrTkJ5?=
 =?utf-8?B?M3U4bFRpTC9Wc3NmRTFjd0swZEhGWWFQY1pvZ0F1MDUrU1g4SUtRa2plQTJD?=
 =?utf-8?B?OUVxaW9idTBqeC9hOGFDODdLU0s0VGROL3JOTFRmWGwwM0VLZzJtenYvT1RB?=
 =?utf-8?B?YUtHZWdiRnZTcUNhNjZQMjZoWWV2R1JFSjU3ZlF4R1hRY1R6ZVVHcWRjL0hu?=
 =?utf-8?B?Ulo2VkJRRTI5VUM2Z0RtMWpwRmYwRFl1c3RyYUVLVGg2M2pQbm8rY2hoeDcw?=
 =?utf-8?B?akVtY3QvSVYxWWk2VkM3MzVvNzlrUnNudkg2NmZ1ZWowR1djTTBFV01OMzhN?=
 =?utf-8?B?cEtKaXo1N0tvQlBVODkvQkNJQTBwaVRoSFNWekJ1RDBjMTZ2UFEyZnZGMUpy?=
 =?utf-8?B?anJHMXgyOEw0UlFXaXdYYzBmNGtyUzl0RWdXQ2xLdGJOK0dEUEg1VnN3RFUx?=
 =?utf-8?B?bXJFeGxqMXlqbysxcTFTdlN6eVJJUlpJSVErWGU3dVJVTUpZQTVBS01qNkh0?=
 =?utf-8?B?OW8ySXAyYlRta0sxR1AzUGVUYkNMR0xUS2hhMkFQQWlqamoyZTE2Q29pK0xB?=
 =?utf-8?B?WlhrWitZT0Q1QzdabGtkOUtvbkVsZk93UUFVanZnSGRxTWZTZEIzTDJCbzAx?=
 =?utf-8?B?czlOVURsVVpnZ0R6ZWdCUjBMbXpYdGVGR0FxY1hXdFpGWUlXMllmUDRzOW9L?=
 =?utf-8?B?VG5tbTRxQktINzlSS1NIemdqVVE4cHdnTkZmVGNNNUtFbVhGazBlNmJMNEor?=
 =?utf-8?B?MTFYMllkRDFicklvK3hOSlJnWEcwbFFqVHkyNk5nZC9jcVBpTHd1REVHcG1o?=
 =?utf-8?B?U2lTREVLbXVIZkNlbGp4eEx1TDRsbi9xYmY0YzlWYlRlNFFPYXF5Ykg4MWJC?=
 =?utf-8?B?RG13ZUdjN3NNcGNvNVY1M1JXS290V2luMTJqdWt3aENFbDlGbHdjYXduMkVU?=
 =?utf-8?B?elFVWWFXQmNjeUNtRTBtVnhrbXd1TU1hK0cyeTd2L1pqbXI2bVFBSS9LVWJu?=
 =?utf-8?B?a1BESHVDc0xzdnEzMHFLY0NZY0g4a0hKbGpia2NyZUYwZkcwVXcwcUF0b1pW?=
 =?utf-8?B?bTJYMERUTUhkL3QwZkpxZUx0YlBPdDlYSmxuV0NsYzNQdHoxUWk1SXJGM2pX?=
 =?utf-8?B?OEhSdllmMDFzaVRkaStkUEJwazcxWmhXdVhsZDN2clBJQVhuYm9rUjRYS0Uy?=
 =?utf-8?B?d3c5SHB6UDdTOGpTU3hNMWdZc0d5Ymt5ZDh5Sjk1NEJCeU40emtkNWZiZ2M5?=
 =?utf-8?Q?Az7OLluskr8LzKZHwGDEgtuXc?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 823b9fa9-c312-455b-3030-08db96674ca8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2023 10:24:21.4653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UfAHCRSlzd+4XidJ4sVj4cYXHjqawfHH8L6Y4B6vFXdQf3kF5Glu0G0I51/UO6G6ECmPk0D3u0G74GIkRctCxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6766
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230806_032439_324703_DEA6053A 
X-CRM114-Status: GOOD (  24.01  )
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
> From: Ard Biesheuvel <ardb@kernel.org>
> Sent: Sunday, August 6, 2023 5:39 PM
> To: Wang, Xiao W <xiao.w.wang@intel.com>
> Cc: paul.walmsley@sifive.com; palmer@dabbelt.com;
> aou@eecs.berkeley.edu; anup@brainfault.org; Li, Haicheng
> <haicheng.li@intel.com>; linux-riscv@lists.infradead.org; linux-
> efi@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] RISC-V: Optimize bitops with Zbb extension
> 
> On Sun, 6 Aug 2023 at 04:39, Xiao Wang <xiao.w.wang@intel.com> wrote:
> >
> > This patch leverages the alternative mechanism to dynamically optimize
> > bitops (including __ffs, __fls, ffs, fls) with Zbb instructions. When
> > Zbb ext is not supported by the runtime CPU, legacy implementation is
> > used. If Zbb is supported, then the optimized variants will be selected
> > via alternative patching.
> >
> > The legacy bitops support is taken from the generic C implementation as
> > fallback.
> >
> > If the parameter is a build-time constant, we leverage compiler builtin to
> > calculate the result directly, this approach is inspired by x86 bitops
> > implementation.
> >
> > EFI stub runs before the kernel, so alternative mechanism should not be
> > used there, this patch introduces a macro EFI_NO_ALTERNATIVE for this
> > purpose.
> >
> 
> Why? The unpatched sequences work fine, no?

It works. But there would be build warning: orphan section `.init.alternative' from `./drivers/firmware/efi/libstub/gop.stub.o' being placed in section `.init.alternative'. Besides, w/o this MACRO, the optimized variant would never be used at runtime, so this patch choose to disable alternative.

BRs,
Xiao

> 
> 
> > Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> > ---
> >  arch/riscv/include/asm/bitops.h       | 266 +++++++++++++++++++++++++-
> >  drivers/firmware/efi/libstub/Makefile |   2 +-
> >  2 files changed, 264 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/bitops.h
> b/arch/riscv/include/asm/bitops.h
> > index 3540b690944b..f727f6489cd5 100644
> > --- a/arch/riscv/include/asm/bitops.h
> > +++ b/arch/riscv/include/asm/bitops.h
> > @@ -15,13 +15,273 @@
> >  #include <asm/barrier.h>
> >  #include <asm/bitsperlong.h>
> >
> > +#if !defined(CONFIG_RISCV_ISA_ZBB) || defined(EFI_NO_ALTERNATIVE)
> >  #include <asm-generic/bitops/__ffs.h>
> > -#include <asm-generic/bitops/ffz.h>
> > -#include <asm-generic/bitops/fls.h>
> >  #include <asm-generic/bitops/__fls.h>
> > +#include <asm-generic/bitops/ffs.h>
> > +#include <asm-generic/bitops/fls.h>
> > +
> > +#else
> > +#include <asm/alternative-macros.h>
> > +#include <asm/hwcap.h>
> > +
> > +#if (BITS_PER_LONG == 64)
> > +#define CTZW   "ctzw "
> > +#define CLZW   "clzw "
> > +#elif (BITS_PER_LONG == 32)
> > +#define CTZW   "ctz "
> > +#define CLZW   "clz "
> > +#else
> > +#error "Unexpected BITS_PER_LONG"
> > +#endif
[...]
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
