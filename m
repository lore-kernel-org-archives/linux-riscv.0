Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1795C46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 07:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VGE++BQPrtLfOOO7mSl6CMPloiTnRQRW8dwKpxUw4cs=; b=nK39dOL+EO2FRL
	0NAYawuk0OEjuuovw6eNFBWD+fpuojTFjU6e+Ashxbi7WD0l4gRGt9ECY204mgzwkAFs6Zww74CNC
	uwyZen4KoO/ON3OkFm+Z+V/julC1wrlUVABmSoMaXSZxMCaD3+z4bpsRS0oPDVulbfPufrwdap+U5
	Q+KvXV+VIZeFzijxL5NiY6JG6zDJ/EBfLp5rakyXgcQM6HmO7w3J59gsTKmOcAkzufe/Az2TJqsXw
	k2rPzGGfba6ruAQ03O5ZhvhG80dg/bPCJ6hDBnq694hm9jXE/nybzS0FSrohT/NItqZmfhJLTBFqY
	HQZjxQSXCRJuGc3sjnUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSXZZ-001poE-1C;
	Wed, 24 Jan 2024 07:21:21 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSXZW-001pmW-1G
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 07:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706080879; x=1737616879;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LxBnni7lYX1Eio4BFql/1I0LnJpBF8eYpwPuGbj5aCw=;
  b=CaxJjQAgyHV6iPUm6lmAqTZXNM9EaSRoHEjdfhzlFoH8RyTRWzWJ+HVO
   CEWGmM8jhbhuqODWLHrUzSTsrU2mIC6bpbooAtz6Ecxuv+/OTSRcwGdwp
   WdDsOlGHnlMtZhtrIctMimVOrEk03i06R+/BpcB6fCKsx7qKUVjWx1Tmn
   wM+ujuUPPul1DH11A5Iln6FHvJgYuy39edUNAFjkIlKR7zTY3UVZokj41
   JejQ6kCkguyo3rozAxS7MMesRFOZ8yNG2A0ZYxHEhbffUGHdXy08a04Hv
   xNKzv79tE7sXKHVMm6hX9RIXB1l0ACHHv78k4aIczwL2if9jnCpjgd31u
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1653845"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1653845"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 23:21:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="820366673"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="820366673"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Jan 2024 23:21:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 23:21:16 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 23:21:16 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 23:21:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFSvpNzD+5r+Pnmpn3zT3+WIqE1ng/ptVIhUj4R/6IUxEI6I3xw1nG48P0WNg5RvpvOWzhP15E1fqPuoI/sxD+DPnm/s/+qnJhixmwgAzcswkYp+czjkxN3e6e4LycyerThWsVwrQt0oIaQCdeRiI5PYFt5nvkuEDvRZm/whEdwnnRanBNW4+364EGDdXLPsZVmRQ0dheKMv8VZPM+hjyyHblYZKlD54IXDoN1GIVJq4nvGri3bXE8Pgkn1qcSZZrUzCQJw44s/WaSKqrbPe/vGN+jLAxsABOiWP/DgKZDL99o0HVqWciMXdntna4CaM3hvpSyn6i73Z74uAsZJO7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxBnni7lYX1Eio4BFql/1I0LnJpBF8eYpwPuGbj5aCw=;
 b=bd1o4xR/AWACIf8Z2A30jM+Qyf7epeMQiTTjz78zOP28+oxwpQPnbhBWQTXL1vnVlBcWnjsPdPX+3jK1sAD8qv6S2seuhvI3w2A076vYfdfi2gmIsRLW/K4PpcWG9hi7qAIvkgEM/ojhVP9fQckE6IrJAhV+pi2LQ6Ie5H6Yg3lkWmEWO3EDZfyzjuajLu4sTPvrSlSFDFPErhSKg1ZX8iD1C36RoQZ3pvwn36vAaKJgBZjfTJ3Xuh8umkfkXn1ZFIe83KdsPQfi/5+Ri1M9DWHQ/tW92tIVkrzTxZyerpAml3D4GaeqI3lfeU9HDOkA9EiEtksGSqMLNnzlkUVF0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 IA0PR11MB8303.namprd11.prod.outlook.com (2603:10b6:208:487::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.22; Wed, 24 Jan 2024 07:21:14 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::89b0:d67c:ea7f:465f]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::89b0:d67c:ea7f:465f%3]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 07:21:14 +0000
From: "Wang, Xiao W" <xiao.w.wang@intel.com>
To: David Laight <David.Laight@ACULAB.COM>, 'Andrew Jones'
	<ajones@ventanamicro.com>
CC: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "conor.dooley@microchip.com"
	<conor.dooley@microchip.com>, "heiko@sntech.de" <heiko@sntech.de>, "Li,
 Haicheng" <haicheng.li@intel.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] riscv: Optimize crc32 with Zbc extension
Thread-Topic: [PATCH] riscv: Optimize crc32 with Zbc extension
Thread-Index: AQHaP65h4Tgp9DgCwEu/ue2vJWxme7DcmyaAgAAk0gCAC9siMA==
Date: Wed, 24 Jan 2024 07:21:14 +0000
Message-ID: <DM8PR11MB57515558DE051F2246907FE8B87B2@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20240105080830.3738117-1-xiao.w.wang@intel.com>
 <20240116-9f09b002afc2337ab5e41e3f@orel>
 <1153d2dd82cf43adb6062627d8d89b27@AcuMS.aculab.com>
In-Reply-To: <1153d2dd82cf43adb6062627d8d89b27@AcuMS.aculab.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|IA0PR11MB8303:EE_
x-ms-office365-filtering-correlation-id: 500c5e9f-683b-4ac3-8f98-08dc1cad0c73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X+ZE2T9Sam30bueEBUp147IMqEUbHiUd1UNkLY1Yo7GZe5cDkG+o41q82bq+Ivwm47mrH3TxZaxEEsKic4nI1ZzGL5spPE87ZUbP0LNPNnLJ5a2paF1FDyI10Y1r56mFmNRvokYRye8YHchkFY4BfRPhSGeAKS9Id3h89liCM/K6EnXHRGERWVRxRuWA3QE4EaRTKNgihklPdfYC6ynA1Sg+7XyF7n2dUnkom2JtxpvmskhHEdN70W1gutd4bLHG6YkxlVVomPpq2mUgjm6Vg1LRNlj2wXmDFIJPRWZehBo2pSVVUWcWVFdib3mvJ8xciTSJYfUi0Yrqb2NsUyovq69EGhkO1Nn/xyewC+GcGbsE/Oj8ceYvX0ZrCV2Yp5Xr2Re9rcVIUbD06/57vpn4Gze2UmgVFQhtJS9AYJRoE3w1g5dJyKXwibWbWVxiAHuYzhflH+kc7X4nOFHFpbvLlkBoSoQPSdom1qhkQVOjZPM4dbDeMxRgSeCN7O6v+id5xCC+SjzLf7l2//VSZ8OpIpxvM6RHdqQ1qLk6MZTv7TYv4EL9TJeWGRom4fhoopy3ApB8B7PabWT+YFHg7nvd7eYRMDBN+kR3PIhlPIy2ELD1AEF6+eYKg8l5qVigKlJ5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5751.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(83380400001)(55016003)(26005)(4326008)(478600001)(8676002)(8936002)(110136005)(52536014)(5660300002)(66446008)(82960400001)(64756008)(316002)(66476007)(66556008)(54906003)(86362001)(66946007)(38100700002)(2906002)(76116006)(9686003)(53546011)(122000001)(7696005)(6506007)(71200400001)(38070700009)(41300700001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWxlM09kUmROOStvUkV3eW43YWJJUDU5M05WazNjbXlzOEYwZEE5MU1yVmc4?=
 =?utf-8?B?dXBua2FjYzBJNFNrSHU5NnlWMWR1RlpvZDN5MTArRm9iYm5BeEh4ZUtNRjAv?=
 =?utf-8?B?bGl5VGJIOFdROWVOM2dUQWRUMk1LdEtvenc1bHdabEV4VUFuT3EwcGhLWXla?=
 =?utf-8?B?TThyWnliVURKYUhnZVJYQUR4SkhuQnRnVHp0aDVMcnVVYTFyMStlMzVFK0do?=
 =?utf-8?B?RnR1bTZOSkhFNDFsbE1xM1B6Sm1sSmRnQy9zRnNFcVFodmp2Z0hkMlhGTlBW?=
 =?utf-8?B?UnRiaWZqQXVLbE5XZFg0cHU1SXMyU3RmS0I3cmJBM1RucjdUSFFIK1NIYWor?=
 =?utf-8?B?MjBvWDV6ZVkwaHdsQWhjS1Z4cmpPSmxTaWdyVVptRUhrUFNFSjl0dDExNGM3?=
 =?utf-8?B?WGVhM0Y5UzF6VWxyV0p1aFk1LzZxRTNHSEY1dndyRnpIZjQySFhGR3k3TlVx?=
 =?utf-8?B?V0MrMTFlcFh5NWVOTHY2S1MwcmRkdEZDaHZWTGZzSi8wbGlDMVlyL21aSVBV?=
 =?utf-8?B?Qnl4TkhFd09EZStpMEgwWmFLVG9yY0VWVWhvUEVvQVBKRlZzZWFOcEx3MTFP?=
 =?utf-8?B?TDIwbjc2WE5LTmpocGlIYmo0b3R1REcvZndZWWdMOWlSV2IrL2NGNlFRWEND?=
 =?utf-8?B?ekZxNmxZemFCbC9CNnNvSm0xSnUyUkZILzdkOU9TYmR1QVZHUFl2a0xyeWE2?=
 =?utf-8?B?djNIc1RMa2ZuRjFlNEt0czRFUmYxWmhlTDJrTXJWYVlVaXJPY0Zxd0ZGWlUr?=
 =?utf-8?B?eGt0V3pqZnZVcjBFTmU5NVhKUSt0eDA4WHFYREpwNkRodzNzZTZIOXZBNGZJ?=
 =?utf-8?B?NEl5Sm1ONlJPWElkRFpDZVVRRXZzT2RtaFBydm5NcmZVYXFqb0YxNDRCRGtS?=
 =?utf-8?B?b21TMHdCMG8yUlhQV0xHOTZLWUtxS01LNGZ6ekxmNmlZc3p4YmZRYjRNdTlX?=
 =?utf-8?B?QXlhbnVvTXh2Qm5qMEZhVmNqWktWcUs1NCtqWWxaQ04vWmk3RnpVMklQMG9Q?=
 =?utf-8?B?Wko2YWkzaUd2dmhXd3VvMDJaYlNSYUhqTURWWC8xTTRWcEY2QjFLcHNKRnE5?=
 =?utf-8?B?SXA2dDdlbnhIb29ORFNaSzlEOFkvTXQ4M1RFL1pla1l4ZzlzREd2RGZqT0No?=
 =?utf-8?B?Y0E5Zmx0RnIvbVlwdndEMWhETWhUZ2pSRjY1OXlPdWh4MXlEeUVXRDNyV0hu?=
 =?utf-8?B?emRkdE45TWY0bmVvckNqeTF2aGE4Njh5eWllcGprS1c0S3lqaHlLdzhhbVR6?=
 =?utf-8?B?WUxTZ1RNSFAvZmhDaFVVaGFlNU94N0xMM0ZuVGdaenIzaXNRM3lBbGxSNlJv?=
 =?utf-8?B?ekhQTWtCR0NhWUZSRktCR0x3OWJhMk1Db1NUU0JtNHo4eGhKTHFTYllFeDl6?=
 =?utf-8?B?RXNlMVhpNWpWT3dEMTQvbHM2Kzh5ckhuWkJmWWtBaFIxS2tIQ3pWSVY5RWNm?=
 =?utf-8?B?U0hpMXFhYjFJSnZ0ZmtGYkt3ekpOeDl5US9IWHY1VzhtR0NyQVlvc2M2NDBD?=
 =?utf-8?B?dlNWZWxaTUVmei9lcmFnckhhQ1prSmh5QzA2UW9uK0s5R1ZBZU4rdkVLaW5w?=
 =?utf-8?B?dEtvc3QrUlFNYkVScXYybjRWNjJWQmpteUNVS3IycURidVZqNncvSDVXTFRI?=
 =?utf-8?B?bEpjZG9MWEtYTkpxdHphQmRmWk9KZys1S0xnc3B0MjlFR2RXSmtlVWRnUitG?=
 =?utf-8?B?ZEdIYnRsTmsreUFLckY2K3lmamRXTFZDMDBPLy85RlJ6ekRxbjBuY05lZUdH?=
 =?utf-8?B?NzZvd3ZXSGxkcU9QcjZZMkhHd2lYTUpYY1UrOXZ5NlhsRUFVNEpyMlVNWE5k?=
 =?utf-8?B?RTIyUEQxZ25DbENoTURYeTBFSWJjMnluUEtKLzRBWEM0bEVucFNGN1FsZTQ0?=
 =?utf-8?B?NS9ZWG1VSkpCL2lTQVFaS2NpNWNKYkg5ajk5S2I1YXBFZEVmTnJBbHYzNHdS?=
 =?utf-8?B?QWhZdlhOYm5WR3RzSWpPNGM0WkxXc3VnUXh5bDVISEkzSTkvNk04bWREZ0w3?=
 =?utf-8?B?ZU0xNUtVdmp1czRCVGFtR3dxNEJBZkZrUzhrMk04UUlqVFZ1ZXZBM25sZXBP?=
 =?utf-8?B?b3hWRGRxQm03YUZzNlNFQ3FFM284NjNlMGViYS9xZzhMYXhqOE55bEdkcVBQ?=
 =?utf-8?Q?3lzgUCVfu0GI6bD0sgMXsDeaF?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 500c5e9f-683b-4ac3-8f98-08dc1cad0c73
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 07:21:14.3059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UBMVBqpGFER8L19mHnOZQfXEHyzPwhVwLJkcgv2IeW2rehVR4YZXohv9VSq9d+IpuJCQWD4Yhz+aWj30rlQO9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8303
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_232118_507889_A125ED38 
X-CRM114-Status: GOOD (  29.54  )
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

Hi David,

> -----Original Message-----
> From: David Laight <David.Laight@ACULAB.COM>
> Sent: Wednesday, January 17, 2024 1:16 AM
> To: 'Andrew Jones' <ajones@ventanamicro.com>; Wang, Xiao W
> <xiao.w.wang@intel.com>
> Cc: paul.walmsley@sifive.com; palmer@dabbelt.com;
> aou@eecs.berkeley.edu; conor.dooley@microchip.com; heiko@sntech.de; Li,
> Haicheng <haicheng.li@intel.com>; linux-riscv@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: RE: [PATCH] riscv: Optimize crc32 with Zbc extension
> 
> ...
> > > +static inline u32 __pure crc32_le_generic(u32 crc, unsigned char const *p,
> > > +#if (BITS_PER_LONG == 64)
> > > +					  size_t len, u32 poly, u64 poly_qt,
> > > +#else
> > > +					  size_t len, u32 poly, u32 poly_qt,
> > > +#endif
> >
> > How about creating a new type for poly_qt, defined as u64 for xlen=64
> > and u32 for xlen=32 to avoid the #ifdef?
> 
> unsigned long ?

Yes, it's simpler. thanks.

> 
> ...
> > > +	for (int i = 0; i < len; i++) {
> > > +#if (BITS_PER_LONG == 64)
> > > +		s = (unsigned long)crc << 32;
> > > +		s ^= __cpu_to_be64(*p_ul++);
> > > +#else
> > > +		s = crc ^ __cpu_to_be32(*p_ul++);
> > > +#endif
> >
> > Could write the above without #ifdef with
> 
> Haven't I seen a bpf patch that rather implies that byteswap
> is likely to be truly horrid?
> 
> I've not tried to parse the crc code (although I do understand
> how it should work). But I'm surprised you need a byteswap.
> 
> After all, the crc is basically a long division of the buffer
> by the crc constant.

For the *_be mode, the API expects that within each byte from the data
stream,the higher order poly bit sits at more significant bit position, and within
the parameter "u32 crc", the higher order poly bit sits at more significant bit
position, regardless of CPU endianness.

After the unsigned long data loading from memory into a register, the
"higher order poly bit sits at more significant bit position" is true for each byte,
but not for the whole register on a little endian CPU. In order to do the XOR in
s ^= __cpu_to_be64(*p_ul++), and in order to run the CLMUL insn at XLEN
scale, we need to rearrange the whole register bits to get them rightly ordered.

> 
> The CRC I've done recently is the hdlc crc-16.
> My nios version (also mips-like) has:
> 
> static __inline__ uint32_t
> crc_step(uint32_t crc, uint32_t byte_val)
> {
> #if defined(crc_step_ci)
>     return crc_step_ci(byte_val, crc);
> #else
>     uint32_t t = crc ^ (byte_val & 0xff);
>     t = (t ^ t << 4) & 0xff;
>     return crc >> 8 ^ t << 8 ^ t << 3 ^ t >> 4;
> #endif
> }
> 
> I normally use a custom instruction for the logic - one clock.
> But the C code is only a couple of clocks slower that the best
> table lookup version.
> On anything pipelined and multi-issue the C code is likely to
> be faster than a lookup table!

I don't understand your code piece, but it looks only the least significant byte
of "uint32_t byte_val" is involved in this crc16 calculation, I don't understand
how it can work.

BRs,
Xiao

> I don't know if any of the 32bit crc can be reduced the same way.
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1
> 1PT, UK
> Registration No: 1397386 (Wales)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
