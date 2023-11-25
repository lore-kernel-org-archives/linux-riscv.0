Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5A4C61DF7
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Nov 2023 06:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4KZnV1nRgUs8Eercrc/j7tvEpo5ZbDLK+IK1MBijMY=; b=zDPtD2135Lr7qg
	PuPjxz0aFG1V6B6WKysqQYqc4iTn+wf7tZv3KfFebdqczdImW+E5PtEOpH+RTc3/NjE5vzE+CAX66
	vwZwSQMLnUdSYjGTPiR3VwVtgEZWB6jgxiUzqiPVW/5cF0ABoPH4DOEJggcqElHDz3Byeu/xFr7gT
	LQkerLlWAH0a5e0NWG0t1ewc71W5iKTGlkQiPqkzaBrT4IFzCMO+o0H9ISc0uX4qSvRvMxqXgI+T1
	mwZjCjadR+OqzSe0bDdW7ogJ1279ohOwLp4DU6ZqPwQ9bavaok41HJ5nGs/Aiy/+RO0dzPDkTOKk3
	RcZPwvuC3NaDkuLdcLwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6mNJ-008hse-39;
	Sat, 25 Nov 2023 06:42:45 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6mNG-008hr6-2g
	for linux-riscv@lists.infradead.org;
	Sat, 25 Nov 2023 06:42:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700894563; x=1732430563;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zDgsg3FGusXIcd9qWrsvatJR5Tz0B0eitk4iutuj/10=;
  b=gV2SsVqo1OUh60iJophxDpgE1uEDV6VjJkjdqaKW+vQVgpJmcVU3adg7
   oE04C8oX73tg2jqx/JBp+gYs/W9XaP97obW/v+KHYeR6bY5jjZj11a7Gq
   tNolFUId32XRXNSFBa3cHsFAEltf/0LcFFASw1Jl7bT4AXbpKqjoGapg1
   hlxZsiCPyNx2py3t5JoCRUanPmwrrNM68F/ifDZ7414S/pfity8ftiAsn
   dgtNXL/CcAmLf/UxRCA6sm0gg+2OCWGDbMP/Lsc6/KlMFB1IiLkQIOKeB
   8iJ5xT4MFN6ip/8nLZCDdBripOnYKWohppy6NqMuEKJYVR/it0u0sLOYW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="14055639"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="14055639"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 22:42:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="767660344"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="767660344"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Nov 2023 22:42:42 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 24 Nov 2023 22:42:41 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 24 Nov 2023 22:42:41 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 24 Nov 2023 22:42:41 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 24 Nov 2023 22:42:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fck29rVWJW/Cn6vzMucR2I3zb13eCBUAa5EILmZki6UJRqBwYJOd3fiux4maH1X3WzKpxZYCsSETWAvWrFQgtWZD85dagXKwMFS6QhP6u8qmckOVEGM0cq54Kow9omcJFZggDdhcpWxlo6N1137D0l5EaQ/DK5ubAYdy5sJSJRid0K/cWWSwqOpbZciATtC/Au5zt1WdWGUD4tfmGG7eoYgobG6bLbjwzAAi2Hn54zwdKGazwDgDLVQnqL1u1YHxJ0zXwM/q5XQdgDZOToEHHlJUTxJafmG99eqX+D0sWJThjvX43cskRkI03ETgChwdsCv0Z5jK8q8pQpTt2R44Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDgsg3FGusXIcd9qWrsvatJR5Tz0B0eitk4iutuj/10=;
 b=NlTvYzFDlHPEIXoF8/ArbwC3qRCLYC1JCFSpECTqZ2O0Tdviok67K8xmdOvRpklneniaUFZPhQJus0P5+ntbiyTEtC93lw12LYhf6DRdkqLfMmZsZsQL4owKz0xibN6Wx/4MbboGBl8l1tYCxrh2RSFn4YSHxTsDhi1ehdS+qGfHDgt7vu1QpVLK5H4dMABbLjaZnuPJaotxGDKMEPtYi3Bowk6SRW28YZ+JifajTnd3leuIx41AZyItWVxPY4UMp7NIBgAWEfgJ4nHw4c+N3V+Yy3AuDFMnDJsdHPRL7+MA6OJbPdqtDxT3kjD77ScqsqA4LiVT4g3AHkGsb+QSVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DM4PR11MB6264.namprd11.prod.outlook.com (2603:10b6:8:a5::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.24; Sat, 25 Nov 2023 06:42:35 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57%4]) with mapi id 15.20.7025.022; Sat, 25 Nov 2023
 06:42:35 +0000
From: "Wang, Xiao W" <xiao.w.wang@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Samuel Holland
	<samuel.holland@sifive.com>, David Laight <David.Laight@aculab.com>, "Evan
 Green" <evan@rivosinc.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: RE: [PATCH v11 4/5] riscv: Add checksum library
Thread-Topic: [PATCH v11 4/5] riscv: Add checksum library
Thread-Index: AQHaGZ0Aj4BzX6PH5E2v19ATE2XBZbCKoZBw
Date: Sat, 25 Nov 2023 06:42:35 +0000
Message-ID: <DM8PR11MB5751DDA0B278E4E43B59197EB8BFA@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20231117-optimize_checksum-v11-0-7d9d954fe361@rivosinc.com>
 <20231117-optimize_checksum-v11-4-7d9d954fe361@rivosinc.com>
In-Reply-To: <20231117-optimize_checksum-v11-4-7d9d954fe361@rivosinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DM4PR11MB6264:EE_
x-ms-office365-filtering-correlation-id: f128119e-6fbe-4968-4022-08dbed81b592
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IX8fShq6WWH151VBwcTO/oLdU13HeWSpbXyKmpG2v6HcSoaZcX/Jr8G8ARE6TBqPTvzj3K6ePjn9AqBXt4PLn1l1xvBKDWS5bHPjbFiYlHMS1qLHeCtR7S4PgCUFo1+GujvaToXEve5lLcy+wtT6JTwr4aMJN32IyumBmxqEZt1yoQiEcCrVMbMVhhlpyiy0Nw6a3SGlYyJwwO5ypUH8oMlzTx0TsOY/XRGuHMZ7A0NuIF4d9wRDyabPl9eXScxB/Z82Cb/utQqEDYkZZtgoWWbyTIqTezjPJsF9AdyNx5gmTkLSlwsB5vpElfq+V2dKZdWO2m25QU8H2WDERSJnEwrB4kf4igAaC8jHkGC6kQ0ueNYm27kNJ2+wM1pTEb8bU0NaNHGajhp1l1BhutXjRyJNqt4FJ2dDlVBr9cUqKtzfqAAOXgbtwGtoozg+gPEQUIGCJ1kNI6jg5rTQUUvFrjao0tt9kvSIWZ+ikzvow/JId4D8llm9404w3n7oAxxAvjb1Z1fT4okSr/9ssSziyh5KJvw8pLoacUg2FsJfgK9OLcasP+/iF5gAQJr3Ck8NXtrycpHby9j4eQyihaphtKM/nJzvQ4mjlncILJgmQXU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5751.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(376002)(39860400002)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(76116006)(66476007)(66446008)(64756008)(54906003)(316002)(52536014)(66556008)(66946007)(8936002)(8676002)(4326008)(478600001)(110136005)(7416002)(86362001)(5660300002)(2906002)(41300700001)(71200400001)(33656002)(122000001)(38100700002)(7696005)(6506007)(53546011)(9686003)(83380400001)(26005)(82960400001)(38070700009)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0dMcnpyQnJEbnRWZnQzcDdaVUdCeDh4Mm9tMnNkOVRpMkd1Qy9KN3p2RTRz?=
 =?utf-8?B?OFlVOTMrTUF3VjV6WkZhNUF6dTRibXloVXdzVkRDUjViS2hHNXlXeGcrY0ZU?=
 =?utf-8?B?aHhmYUJHVnY3MkxFbHJwbUJsS29oOGRkOUFRbFBpM3hBeTBNd2Frd3A0Nlhu?=
 =?utf-8?B?TnNCeUd2SmpvTVVDSTRSN3B1Y1UyT1h5b0JOM3lCSmt3cHpScm5KWG9Mejhz?=
 =?utf-8?B?SUxRWENGZTdRNGo2Qm9KWUE2eUNlYzEyQStvWHZGY3UwZDlaOUZ5TFhWUlJr?=
 =?utf-8?B?U05HM1c3K1RtSE1FV1VBdGtFR1lscDZ3QWQrTXJZVEo4MXhWWU1vb2dvQ0Q2?=
 =?utf-8?B?RUlIazNLZEZsRUtwcEQ4WWFUM3FBT1lBcmcvbFpXNlpzdUhuR2NIOXltTnJr?=
 =?utf-8?B?YW5GQVI3REtkTUNkem05cmg1bG0rL0ZNWlozQTdISC9lQmV6VXZiSGxQeWs5?=
 =?utf-8?B?blF5YzBreVdKS2ZwYmdNdnBRellQeG45enU2NGNSdFlDZXhhTmF6UkxNZ2Y0?=
 =?utf-8?B?Ry9SVUQvRldLbmdmS3VzazNHc1YzUVhMZVVtV0xkcDZ1bHpNNWV3QzZpc3NN?=
 =?utf-8?B?UUpoOFdCMi9YSTZudFBkNm9obHBsRFpYZmV6WDkrTTBrTFQydHRYN29TTFpN?=
 =?utf-8?B?UVpSSkpxNFg4QU1kdFhrVWhESCtHKzRIbUE4clBQZ3d1WS9lWjNzSkJlNGRP?=
 =?utf-8?B?amo3Z3hRNy9iL0tDSmNIMGw2TGh5YjIybTVtU3JGcmxsYTJOSW8weDNwVEZy?=
 =?utf-8?B?NURuZzJRZVBVZVdoR25WaXA3aC9yZWNRMmZjSDJaMjRmM1NKc3F3NEFyU2py?=
 =?utf-8?B?TXgrWG8rNWM3OEh4ZXo1U2NCTVBkVk9Sc0U2TzR3MDJQQ0JrTHdmOG1hRG5X?=
 =?utf-8?B?eDVQenFpVFcxUkxVcUkzeG43SmdRcnV5NWhMWVErZndMM2dUdWx1aThTQmxV?=
 =?utf-8?B?SFBTWXprYWxXak1VNDl1QjVJRC90RU9qRGtVR0xzVWozOG9JOXdHemhHZmFQ?=
 =?utf-8?B?YmIzNWEvMzhUc284UGUxMFN6UDJrUVozWEg3N3p3eURMbml1ZzU3VzZtcC9W?=
 =?utf-8?B?U1RjOFFIOGxhNnV5VmlNK1UzVndoZWRpUS9CNE54YU1nVUY5QjljRy9McDli?=
 =?utf-8?B?WTRrTHV1cm5Pc2dFQ0tRMFVWc01KUXc4Y2VBQjFYSE8zTmxPNHhCb3dIQ0Jo?=
 =?utf-8?B?RTBGcGdkVWZYb0Z4dXg2bnl1VGUyUjlPZDJzYXBFWnVrQU53ZUNvUm5VZ2R4?=
 =?utf-8?B?WFliU2pWeVY2MncrNFNFUFhGVk8raVlVazRIMUZBSFhUeDNYRFdZQzE3SU11?=
 =?utf-8?B?OHVVS0tWeW1DQzB0b3haQzlyVlEzeTJ4TWljWm1WMzhMVmFkTk5CU1BOSnRu?=
 =?utf-8?B?NTkvWjRoZDFCQ2h5UWpFT2pQa2Q3dytsY2RJU3UyM1dkbFkvRnh2R3BISDNF?=
 =?utf-8?B?aU5FN2o3aWFndXNQYTduZUVBK0lQc2J5ODB5R2pxZGsvbmlSejlBU3NQblla?=
 =?utf-8?B?QWZ1UTA3S2hqcjhMdGpkTkxzbm0wMU50OXZYaFVCb05pMU1PbDdZd0gvNGdP?=
 =?utf-8?B?cmpuTkUzMWtaRG8zNUREUkhKbTc2UlhXK0tqWnNPNURTWm44OHhUYUtOZUJt?=
 =?utf-8?B?d3NaN3JPVWRWM1FCb1g4QUh2V2F3UXJBYStYU0pCTVppV0NCa1dUa1p4RjMv?=
 =?utf-8?B?YURyNklGMlR1TXBSTHJqK0pKQkJKcHlvMXRvbFlMSldXRHc5OFN1V2YzQ3Z3?=
 =?utf-8?B?QU5wNlhGZ0hFMmVMaE5nU3ZtcXI0SVlLRWwwMzh0amxFM0NPNDF0WjFLWlp2?=
 =?utf-8?B?RldWZmtCTzJTTldRRmhIa1JCcWZiZFZYNXA0NjZJVUMzYmJhR3RrK054L2NR?=
 =?utf-8?B?UXdMS1NVSUtSOGZPMnJvRWFrQkpYOWErZk1vVnhQWExMeHp4OG5Mb2d1ZFMz?=
 =?utf-8?B?UDRTajdZVUU5RmRlUnpJRVdrMnE3S1h3c2hVVmVXSC9vZDZkOThOMnNlcFNV?=
 =?utf-8?B?YnJBUnd4aHlyMWtxVkxtMlJzMmdFZ09DSExGTjNyZjkxRXJHcmFpYksreWo3?=
 =?utf-8?B?YjFqVkpEWDUrOWwwSWVoeVp1S3Nyb0RGdThHVnF6U3R4ZzUwTlNYK1lORHU1?=
 =?utf-8?Q?FT5KFeBK8jbdu7/kf4lJocaUE?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f128119e-6fbe-4968-4022-08dbed81b592
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2023 06:42:35.5768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1JZ4v5eZZ14cU27LRGAhx+ANWeqWXIXNCwSepZ3GXhnAicEK1o6WBpMmKSvwqOfrHNi2UcSfb0E8uTqZRyBE4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6264
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_224242_957289_A5D8BAF5 
X-CRM114-Status: GOOD (  25.07  )
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
> From: Charlie Jenkins <charlie@rivosinc.com>
> Sent: Saturday, November 18, 2023 5:28 AM
> To: Charlie Jenkins <charlie@rivosinc.com>; Palmer Dabbelt
> <palmer@dabbelt.com>; Conor Dooley <conor@kernel.org>; Samuel Holland
> <samuel.holland@sifive.com>; David Laight <David.Laight@aculab.com>;
> Wang, Xiao W <xiao.w.wang@intel.com>; Evan Green <evan@rivosinc.com>;
> linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> arch@vger.kernel.org
> Cc: Paul Walmsley <paul.walmsley@sifive.com>; Albert Ou
> <aou@eecs.berkeley.edu>; Arnd Bergmann <arnd@arndb.de>; Conor Dooley
> <conor.dooley@microchip.com>
> Subject: [PATCH v11 4/5] riscv: Add checksum library
> 
> Provide a 32 and 64 bit version of do_csum. When compiled for 32-bit
> will load from the buffer in groups of 32 bits, and when compiled for
> 64-bit will load in groups of 64 bits.
> 
> Additionally provide riscv optimized implementation of csum_ipv6_magic.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/checksum.h |  13 +-
>  arch/riscv/lib/Makefile           |   1 +
>  arch/riscv/lib/csum.c             | 326
> ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 339 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/checksum.h
> b/arch/riscv/include/asm/checksum.h
> index 2fcf864186e7..3fa04ff1eda8 100644
> --- a/arch/riscv/include/asm/checksum.h
> +++ b/arch/riscv/include/asm/checksum.h
> @@ -12,6 +12,17 @@
> 
[...]

> + * misaligned accesses, or when buff is known to be aligned.
> + */
> +static inline __no_sanitize_address unsigned int
> +do_csum_no_alignment(const unsigned char *buff, int len)
> +{
> +	unsigned long csum, data;
> +	const unsigned long *ptr, *end;
> +
> +	ptr = (const unsigned long *)(buff);
> +	data = *(ptr++);
> +
> +	kasan_check_read(buff, len);
> +
> +	end = (const unsigned long *)(buff + len);
> +	csum = do_csum_common(ptr, end, data);
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
> +		asm (".option push				\n\
> +		.option arch,+zbb				\n\
> +			rori	%[fold_temp], %[csum], 16	\n\
> +			add	%[csum], %[fold_temp], %[csum]	\n\
> +		.option pop"
> +			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp)
> +			:
> +			: );
> +
> +#else /* !CONFIG_32BIT */
> +		asm (".option push				\n\
> +		.option arch,+zbb				\n\
> +			rori	%[fold_temp], %[csum], 32	\n\
> +			add	%[csum], %[fold_temp], %[csum]	\n\
> +			srli	%[csum], %[csum], 32		\n\
> +			roriw	%[fold_temp], %[csum], 16	\n\
> +			addw	%[csum], %[fold_temp], %[csum]	\n\
> +		.option pop"
> +			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp)
> +			:
> +			: );
> +#endif /* !CONFIG_32BIT */
> +		return csum >> 16;
> +	}
> +no_zbb:
> +#ifndef CONFIG_32BIT
> +	csum += ror64(csum, 32);
> +	csum >>= 32;
> +#endif
> +	csum = (u32)csum + ror32((u32)csum, 16);
> +	return csum >> 16;
> +}
> +
> +/*
> + * Perform a checksum on an arbitrary memory address.
> + * Will do a light-weight address alignment if buff is misaligned, unless
> + * cpu supports fast misaligned accesses.
> + */
> +unsigned int do_csum(const unsigned char *buff, int len)
> +{
> +	if (unlikely(len <= 0))
> +		return 0;
> +
> +	/*
> +	 * Significant performance gains can be seen by not doing alignment
> +	 * on machines with fast misaligned accesses.
> +	 *
> +	 * There is some duplicate code between the "with_alignment" and
> +	 * "no_alignment" implmentations, but the overlap is too awkward to
> be
> +	 * able to fit in one function without introducing multiple static
> +	 * branches. The largest chunk of overlap was delegated into the
> +	 * do_csum_common function.
> +	 */
> +	if (static_branch_likely(&fast_misaligned_access_speed_key))
> +		return do_csum_no_alignment(buff, len);
> +
> +	if (((unsigned long)buff & OFFSET_MASK) == 0)
> +		return do_csum_no_alignment(buff, len);
> +
> +	return do_csum_with_alignment(buff, len);
> +}
> 
> --
> 2.34.1

Reviewed-by: Xiao Wang <xiao.w.wang@intel.com>

BRs,
Xiao
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
