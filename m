Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798B5C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 07:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HZcMxkXve3xy2D3JsQjbSjYhacFh9tJPW7cHBRjhYEM=; b=46NPGtgQGpgXLt
	BZUd8auzbx5rYes64Tnpaou9wyXTSYO1c4JmjuEmYiHYJnYSyK5StocEmy9DZWfdcRLJsMqi3Nxlv
	Q55BP0SOu6mjK0kRKfQtRYsE0NBObw6jeFW4l4IbadTKo+Osr0smrcXVA8rOJctnRCloHG0jHHrSq
	v3MhDGiE1u1oRmIP76n99n/wrnzjVaEXZARk4iYhobCC+qxQH9PRjH2nvV0Rk8Oc7RBDzV+ZGuosS
	uXCavG7KNuwJLioE17hMz+MgCiyEg3J+hS0475nfx6I1Smb89wW6Y8TOBjEvw7RMjnUjxQvCKOmEf
	LfIMCfyZfgxj6hTSyoTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Gbj-000imi-02;
	Tue, 07 Nov 2023 07:34:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Gbh-000ilr-2h
	for linux-riscv@bombadil.infradead.org;
	Tue, 07 Nov 2023 07:34:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=q1Ncs1UDtaNyenIgqpRfxqYAp5Eq7r/gyxU9SBegFlg=; b=Z21dVQpcXJRXcXI59yPFX3XDrw
	plhFn+2TFqX1k+xeYIJm6zNmo5moTy6f8TxNFZlP8huCSgdlSHEVvQ1V/p+gJvReg/ivMqtONv+/G
	kz8dNP6iu+EdwSA2C/AWBiRjpcemLl1m5Zm+ThVaxZmQFj+U4DYl0j2zBpa0wFslIJIxKULL1pJSC
	Egkn+RDtcWbH+fw5NplyUpF5uNjMyBQk3fgVdD7KIKN9xeX64VNJv59J7Ele6Bz53PG8Zl+kpEQS4
	lj7qTfl+XH6ERbWOO89DZNwmaiPL4QVkrwJH1kO8fMictYU4eYQpS5k1gupBJGHTNMbKF6aD+Ru5c
	9I1d1gLw==;
Received: from mgamail.intel.com ([192.55.52.151])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Gba-00BpBz-2x
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 07:34:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699342474; x=1730878474;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=q1Ncs1UDtaNyenIgqpRfxqYAp5Eq7r/gyxU9SBegFlg=;
  b=FCr17NTZ+5Zkmgi60Qi7teW27/LMTQAyX+h3ueqSSzrctwPzmOK/2pqG
   yaaSMqSpFTzETHXULcmhskSDTuMPo2joOk2CMeRaOmzzMebloMJNIIm/Z
   Zi9p+hvoLAjlz8rwcciL3CU19VvIQTtRtj3sRc/Cok8OL8ttDL67dJLe3
   CpsMCrrex5bSRSPxFUPyFTtcjaBanCQd1tfAMEDJB0qrmTagjzALDapCT
   1rTLP6495MZ28UWpL05F0dP9GUCd4nKjoql7eZgbHLXV5NIksxo3zeKUd
   1wbVTBuBkYQT9zIaUPrCLGGdScUX6dC43+QrXkZMzIXJhQO7fKszoy3tr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="369649848"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="369649848"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 23:33:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="3896494"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Nov 2023 23:33:24 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 6 Nov 2023 23:33:23 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 6 Nov 2023 23:33:23 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 6 Nov 2023 23:33:23 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 6 Nov 2023 23:33:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aO/vGNAdvx7IXoe1eIEgOHOQ0yDPyXI6h+yS+huHvnQViNOWbnLeWyx/dpNYpJWuXXZD1d4Q4pmO4yN3l8IrLvqysN8TyvrSDThrC6re66Kzfts8M3ngBUUgnQm6HEsjSuJzxXxAvvQMbtqLRSeafc3pSj0MvoNdUKA2PCWEnbF/v7CxcydEK2X6b55IifzHf7OCJEk8GfyFsJu+gbuF5IXWwRn4dyIVDJHL/tMHS3P1AZzX+FRcYc+lAr06KL314KTX7N5PFQRvzSfTQrQ1k/tZgp6EZiygR6BnIdggqs6KTsTy7+3HyFGdPGWRAnti9O7tjnFP1m36MN0vy2MOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1Ncs1UDtaNyenIgqpRfxqYAp5Eq7r/gyxU9SBegFlg=;
 b=ljb6fZ5CzbETIJjXz9qsRUMQiEP+5lyff63sH14GrE3TkLAB1mRdH/I9LR/QaeOJNsB4pqrf4D/uxaF6MgtlGBZ1dHdxS6GjELOjA+MzP1jHZ9bLPlMPl8iNpENzTbanMFvmleeoaSPQrj2LAxP1wOruWDKVzjftqfI+t8DKUWVgT1XJOUJcDMhYiXHfHlYKG4xHFhQj4GX6CfvhhAQHMS+m8UBJXyQtavSpwcVgCEgiUVIM91gJUmOONrgJI0WaDAnyJquLOyuMULAB18mY/obXF+7YPeKE7wLl6tyysmqxTq+8xj8Ggvw2EoEJS3y7UD/nC2M4x57vb89Jo8o9Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CY8PR11MB7035.namprd11.prod.outlook.com (2603:10b6:930:51::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.28; Tue, 7 Nov 2023 07:33:19 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57%4]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 07:33:19 +0000
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
Subject: RE: [PATCH v10 3/5] riscv: Checksum header
Thread-Topic: [PATCH v10 3/5] riscv: Checksum header
Thread-Index: AQHaDRWHZXzQK5VfSE6P3Qq65/nQZLBud4kg
Date: Tue, 7 Nov 2023 07:33:19 +0000
Message-ID: <DM8PR11MB57517DB5180352D536565A4FB8A9A@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20231101-optimize_checksum-v10-0-a498577bb969@rivosinc.com>
 <20231101-optimize_checksum-v10-3-a498577bb969@rivosinc.com>
In-Reply-To: <20231101-optimize_checksum-v10-3-a498577bb969@rivosinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CY8PR11MB7035:EE_
x-ms-office365-filtering-correlation-id: e08073bc-2a0b-4eb3-d321-08dbdf63d09c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DZ1pLjdVlEQgCNmncVR1v174PJ9I0QEOjqW7XlJqvimu1AF3az+B8Uoiz9VYCUSM5urqySUNCwVlVr5ENiPGZCAtYTcpCAIRtDX0Yqs5wcCznQYQPxvp05VHMD+4CDBY2cMVGLqivjo3RGaXdulXGBjnptadB2dvmGMiYpzIHt4tKGQ+6YteV8wVkg9Z0tmOTY7A4ajPXgDsK4qVcXCKqR/GCMauk7DlqIiH1unKaURbQz4c7LlWz8yW9Kbvs0lvB+30coNGdjPUKBCadA/3aUWk3JKY9PZtvO9oBljeROQssUG5qRYWBLNXodaBvllzCC9DU0TfJee4DtWZ30UujmKDVdyzLquSjbfOrIO0FhoHI89gGsfuR7rvFBWKC4AaGluJR0JGj9zRQO0+2RzuVwXDxJZwvhS95CHWjuROJoj2li0wuQgWwyjRpdtiQZ3na0fywZBsqHrKSFejod7xNj86DrXOvKA3PboHkmmrbD2v6jh3AYDYEL3HcfYod5TSGvLe5SAaQQzuNb5nLF3LUBJZz01GBI19C6B7JiD4UmW2M4apxTVgfsEz6GT2UbH8hRdwifxnz3bYVkkd/Ts6tW6z044WJPf7qCjAdGkDWaLQ0f4wrzaJGGTth6M0wONx1Iiyzb77XIilp1TrgFFc7Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5751.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(136003)(39860400002)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(9686003)(122000001)(52536014)(82960400001)(26005)(478600001)(54906003)(64756008)(76116006)(66556008)(66476007)(66446008)(66946007)(110136005)(316002)(38070700009)(53546011)(7696005)(6506007)(71200400001)(8676002)(5660300002)(8936002)(4326008)(55016003)(2906002)(38100700002)(41300700001)(33656002)(83380400001)(86362001)(7416002)(21314003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2s5TVovVXY3T0F3VnBCR003d3NleGl4ZXBXa1J5cG1YRThLWmVRaDhjZWFC?=
 =?utf-8?B?Y2NSay85eGQyTnp6TjZHR1NKOG1QbGZudStVYnM2ZElOQkVySS85Tit1eXcv?=
 =?utf-8?B?NGN6WjRqdjA3MmRyekU4cm54TlVjVld1S0JOcmVkdlhzM1M1c0VVS2NZbTJr?=
 =?utf-8?B?V1UrTVlvdVRiTlFPQ2Q0YlI1ajFUL2hoOVdnUVRYazJKdjcxaWxVd2R6QVYy?=
 =?utf-8?B?cDJvelA4b0JyRFEyc25JNlVReHRMeDdOck5NNmZNSUw1L2ltK0VnZHVVZzYw?=
 =?utf-8?B?SnNCSG5jdm9XYytJK1hDaUpNWlVZR1g5Snh6Slg3L2lNejljdFg4WVlRUjFN?=
 =?utf-8?B?eVBEK1pEa0dpQ3hGc2dOVUJDalVYNEpCRTNLSXJpOXdGTHN5RmxzbDRVZFM3?=
 =?utf-8?B?YjQvclYwb2p4V0I0c05BY3o0OTY2enBEWFBDaWNDcDNHS3J3alVPZERQWUNp?=
 =?utf-8?B?Y1FXTjhhSmlRekFNWlZZeXRXU3dtRHVuUXN1dHJIckhrMUpoL2J0L1Y5NG9J?=
 =?utf-8?B?b0VFOTNZd1prMWFNK08xbmt4T05Jck92ZFk1VEZRYm5RVkJsYkdlZjFPbHZV?=
 =?utf-8?B?THg1NnBTcmdKRnlYMkJzSkNzR1ZOdy9SUjVIdEp3TjY3MDFSOE9FV3hOTnRZ?=
 =?utf-8?B?anNYZXJhbW9wZ3FUSnlXS0lPa3F3Qitzayt2dWE4UmtrNjJ3MGtKd1kyZC9L?=
 =?utf-8?B?WXlaSGxsUjdrUUJ0SWNOa1licTFkRWtQSFB3YTVqKzhTWTE3SE5iU0VnVlh2?=
 =?utf-8?B?NWFLRWo5eXRjb0ppQXRyWjI2UUdUekpFVkhPaGExRDQ0SmVPQnlGVXZQWUZD?=
 =?utf-8?B?UzV0YlpFd0gvQTFIVllZSzhlNWJmalVPTkdMOU1CZEh0Qm5xUTU4R21ZMWU5?=
 =?utf-8?B?bDN1MGRndzBXZG52V3FsVUJ2TVhTNVJHeVVsMy9VR2pxY29QckR1Q3hocGhn?=
 =?utf-8?B?NHpHTENSNEh5Uzk2ZzNjbkd2ZHN3YUV3anhEaHZyMHdRWEplS0xaNGYyWENl?=
 =?utf-8?B?b1lJZTRCRHBUWS81Qld6U215RENoTXJmbE9pOUl3SmVkMGNsVndiSXA0UFBP?=
 =?utf-8?B?eVh4TjFqM0JoL3ZRMGV3K04wbTV6TU4wZDl2YndKUURVMHRnSjFUVkpoSUpk?=
 =?utf-8?B?dEI0anRpRmUvcjFwL0JBS3NqMzNHblJnZmFhRkxHVFRJcnpvdUN2MUNJanZC?=
 =?utf-8?B?djV4STRRR3o0S0N5N0NpZnU0MTNUZWFEOVNNdUVlUUxjbUlGRWZiNnBFRlRT?=
 =?utf-8?B?V2x1M0FOSDUxVU4rcUYrcGwvMzVFYVlIWi9jVjBDdi9GNURJOXIrdnl2SWc2?=
 =?utf-8?B?a0lGall0SkZuY0JJeTg5VTJ0RjR3MmZEamdEcytGaTZNUGMyMnF5TFY1ZUtq?=
 =?utf-8?B?WmNZZ1VXVUtOdU92eURYbjdXK3ZDaXpSUm12eTUzQXQvdzV1SXFoZEhuK1JG?=
 =?utf-8?B?Y202N0RJa0JDejNPMURlem10RmJWZ3JMSmpSeFRJOU1xTDJvcSs4Mys5SXo4?=
 =?utf-8?B?bXU4bDVGV2pZTXZYK2VOMi9pNGNVQXV0aVFRdFM0bG1oQWxscmJ6M0pVYWti?=
 =?utf-8?B?aTQ0cjhGRmwrVWxhZmNLQXliOUdpSm5lS1FhQzg2WXlsNitTdzNxWXV3VG83?=
 =?utf-8?B?YUczdlhXQW5wb1dtMHJPUWEvRmI0ZTJWZjRqM1M2Q202VkZWZ0IzRXViWTBF?=
 =?utf-8?B?S2dOUHRYcUh1YVd6MEJSWVJxdzVMSjk2SXhKaEtDNUpRbzZMNFk4cEQ0RjRE?=
 =?utf-8?B?eU1DL1dkSC9aTFp6STFrcDQzVnlDYXM4ZDQ1TndqNnJNWUk4cFd2am1kUzlO?=
 =?utf-8?B?eHpqeUUzK2RUSEJ4TGd2cFRteTZVNGI5L1A4bDZnaTV2bEVTNmR1VUhyM1BP?=
 =?utf-8?B?WXVZOHZOUjltNTI1R2RIWCsyaHBUL3VYN0gvWHFOOUNsY2thSmlzcXM4VEIv?=
 =?utf-8?B?cWdUV213R3dEejhNcG5xNWErL0FSbEcrcjNaYTY2U2hNSENhRytuaEg5TEVZ?=
 =?utf-8?B?OEJVNVlMU3lJem44OGpocFpnQjNvWTVxbGVYbVNiKy8vQWxRWkxPK0lORllX?=
 =?utf-8?B?OEcycG03ZDIrTXYwcmNoNllXZW1TUVlPZ0M4djhFeTQyOWoxK2VPcER1RnIx?=
 =?utf-8?Q?Z920V52NEqg14+qUUA9FsVPHr?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e08073bc-2a0b-4eb3-d321-08dbdf63d09c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2023 07:33:19.7403
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fZwoFFDKMxkqTm8N4l8Y80vYOf9JpvG9LIrSAoX+JRi6U6zkUxrhz9HBkNAzZaXGhXpx0sUm1WYhcqHdBHkYKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7035
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_073436_307237_A88D0A69 
X-CRM114-Status: GOOD (  23.81  )
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
> Sent: Thursday, November 2, 2023 6:48 AM
> To: Charlie Jenkins <charlie@rivosinc.com>; Palmer Dabbelt
> <palmer@dabbelt.com>; Conor Dooley <conor@kernel.org>; Samuel Holland
> <samuel.holland@sifive.com>; David Laight <David.Laight@aculab.com>;
> Wang, Xiao W <xiao.w.wang@intel.com>; Evan Green <evan@rivosinc.com>;
> linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> arch@vger.kernel.org
> Cc: Paul Walmsley <paul.walmsley@sifive.com>; Albert Ou
> <aou@eecs.berkeley.edu>; Arnd Bergmann <arnd@arndb.de>; Conor Dooley
> <conor.dooley@microchip.com>
> Subject: [PATCH v10 3/5] riscv: Checksum header

Is it better to make the title more descriptive as "riscv: Add checksum header"?

> 
> Provide checksum algorithms that have been designed to leverage riscv
> instructions such as rotate. In 64-bit, can take advantage of the larger
> register to avoid some overflow checking.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/checksum.h | 81
> +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/checksum.h
> b/arch/riscv/include/asm/checksum.h
> new file mode 100644
> index 000000000000..3d77cac338fe
> --- /dev/null
> +++ b/arch/riscv/include/asm/checksum.h
> @@ -0,0 +1,81 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Checksum routines
> + *
> + * Copyright (C) 2023 Rivos Inc.
> + */
> +#ifndef __ASM_RISCV_CHECKSUM_H
> +#define __ASM_RISCV_CHECKSUM_H
> +
> +#include <linux/in6.h>
> +#include <linux/uaccess.h>
> +
> +#define ip_fast_csum ip_fast_csum
> +
> +/* Define riscv versions of functions before importing asm-
> generic/checksum.h */
> +#include <asm-generic/checksum.h>
> +
> +/*
> + * Quickly compute an IP checksum with the assumption that IPv4 headers
> will
> + * always be in multiples of 32-bits, and have an ihl of at least 5.
> + * @ihl is the number of 32 bit segments and must be greater than or equal
> to 5.
> + * @iph is assumed to be word aligned given that NET_IP_ALIGN is set to 2 on
> + *	riscv, defining IP headers to be aligned.
> + */

For comments on API parameters, it's better to follow the "@para: xxx" standard format
and indention alignment used in other places.

> +static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
> +{
> +	unsigned long csum = 0;
> +	int pos = 0;
> +
> +	do {
> +		csum += ((const unsigned int *)iph)[pos];
> +		if (IS_ENABLED(CONFIG_32BIT))
> +			csum += csum < ((const unsigned int *)iph)[pos];
> +	} while (++pos < ihl);
> +
> +	/*
> +	 * ZBB only saves three instructions on 32-bit and five on 64-bit so not
> +	 * worth checking if supported without Alternatives.
> +	 */
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> +	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +		unsigned long fold_temp;
> +
> +		asm_volatile_goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
> +					      RISCV_ISA_EXT_ZBB, 1)
> +		    :
> +		    :
> +		    :
> +		    : no_zbb);
> +
> +		if (IS_ENABLED(CONFIG_32BIT)) {
> +			asm(".option push				\n\
> +			.option arch,+zbb				\n\
> +				not	%[fold_temp], %[csum]
> 	\n\
> +				rori	%[csum], %[csum], 16		\n\
> +				sub	%[csum], %[fold_temp], %[csum]
> 	\n\
> +			.option pop"
> +			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
> +		} else {
> +			asm(".option push				\n\
> +			.option arch,+zbb				\n\
> +				rori	%[fold_temp], %[csum], 32	\n\
> +				add	%[csum], %[fold_temp], %[csum]
> 	\n\
> +				srli	%[csum], %[csum], 32		\n\
> +				not	%[fold_temp], %[csum]
> 	\n\
> +				roriw	%[csum], %[csum], 16		\n\
> +				subw	%[csum], %[fold_temp], %[csum]
> 	\n\
> +			.option pop"
> +			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
> +		}
> +		return csum >> 16;
> +	}
> +no_zbb:
> +#ifndef CONFIG_32BIT
> +	csum += ror64(csum, 32);
> +	csum >>= 32;
> +#endif
> +	return csum_fold((__force __wsum)csum);
> +}

The algorithm looks good to me.

BRs,
Xiao

> +
> +#endif /* __ASM_RISCV_CHECKSUM_H */
> 
> --
> 2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
