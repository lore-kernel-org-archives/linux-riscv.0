Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187AECA1009
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 10:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LF86XnndTTb7N/iN+BmiO7ZsOEi9EtqwZHMigDgrlg4=; b=ljS761e6sCNDSc
	TxmGRDdUl9wWgK9SdXMva5MoCRH1b++o4/rkML1M3koQkltNMqqtxFTupeB8Ofki7VOhoIgpcSuSZ
	enDl798jyClUUsLrIgrxucGK8GSKZKC4wweLmPZ9evE5dXDT0S83j3w9BGagR6TF+YEg6cM/aXI4U
	76CbinA1oVqoW7FZaHT+/sbIGdw/yhR61B9XgyoicrOiCTM3JLErofLeefm01CTeLaGcpFUeiUkta
	q6tK+qGivbFy/wNaC9OucUvhXsslwBwx0NvRn1xhQfMxLNwXHuMxbYWZ2ENEfvBoY5d4Lz9ma0vtm
	RtQi2Vb+O9U/zdqChbdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkqV-0000000674g-487K;
	Wed, 03 Sep 2025 10:36:07 +0000
Received: from mail-mw2nam10on20619.outbound.protection.outlook.com ([2a01:111:f403:2412::619] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utk1y-00000005xua-2QLF
	for linux-riscv@lists.infradead.org;
	Wed, 03 Sep 2025 09:43:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=izUjwmVT7kj5GWHDjKsffN8HNhJxqNfzNtzsvs00W80bBuBjV9Xkfqw350xQzUsQF8xiW+qUzBv5gqWzaGb/+rWFrWmKD/s0e6WdyT03/lcOR5VDGLD4sM7yU9mJ5fLSavHKSPvrNDazBY4ZHcxt3Kkk49Wg+/jg7D+XYIO0RKs9vtRa7+L+2GAR4wSu+Xeooy6odLs0sHqQZu11l9TWDwCGCp40bC5Hi61TiHmScwHB2/ez32FeTmpT3VHeKKErBcVYwfD4pnORJAeCb8m+ovuMo9YPaWTYwjabbmdp9eZN2NTeEp2rTejne0518iPaffvG9bGalVzAjqd2dEsyOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pWLRgcIPRB4zyLEmPoVk0cBBkUTvFNIbOMavApotLs=;
 b=IY5+XnAp6pC2X4EGGWFH0ZUXo5eCxiQLKYmgsMnTxk5zYaJEKdzb04BYXHdwfovNNQR4AzMiDpjs1bm5/80HhdnTfyvTvRcGdA0Qm4qHF9Fqt0Muo8Fvx8MBnhXgLv/6f0y/WhQnrXdVOq8k7DnxWAHyLaaEW39d9fH5ZgFMylLsfzOUzngkT4KI4GzoAqQsezIRcwt0XnZSTEBE4pAx88LIPSCni/IpQET/dr2W7UTzHkyIJJxAXfVLxa+U3d2OvXBWUlXjiC41aRRPLQA8XUxll2Zrqn18M0hzSQyfNw99LMyNJag+9LOGVafkcdfPru8J/07lXGltKHnHOJ6SqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pWLRgcIPRB4zyLEmPoVk0cBBkUTvFNIbOMavApotLs=;
 b=nMMYeN+S5n8qyx6Zi/NvjgiNX1bRcYhf7SuAAwihOKxKc3QEI9hQt62+KLKkPnIojQPEDpOYnL70tAc3mmJSqzwajiOb5+gUcDoaQDWsHCCrhoRrw5fUDcwAgthIGkL0UDBsaupZpKlRMBco0c40iRTgu0RDIoNrRpvvGaodb1Dac151Qtgfi3vThdZ7GSVqKgALh8x13fNSRT9q/Z22wNe1HWgSdmXHPAIDLZK/fsSFOvGDoOqdaYLiCtGTbgTgKguH3hHfwRnxImQxw5p1ONBl3O9JUi2kL0DeQELjfh+7WfZ4bZUgHjUgCwz96DjZL0hgKERwDM1Ewqyz4tqxKA==
Received: from DS0PR11MB8739.namprd11.prod.outlook.com (2603:10b6:8:1bb::19)
 by IA1PR11MB8198.namprd11.prod.outlook.com (2603:10b6:208:453::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 09:43:46 +0000
Received: from DS0PR11MB8739.namprd11.prod.outlook.com
 ([fe80::f0f:4a3f:e3a3:d3ad]) by DS0PR11MB8739.namprd11.prod.outlook.com
 ([fe80::f0f:4a3f:e3a3:d3ad%5]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 09:43:46 +0000
From: <Valentina.FernandezAlanis@microchip.com>
To: <ziyao@disroot.org>, <Conor.Dooley@microchip.com>,
	<Daire.McNamara@microchip.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <Valentina.FernandezAlanis@microchip.com>
Subject: Re: [PATCH v2 5/5] riscv: dts: microchip: add a device tree for
 Discovery Kit
Thread-Topic: [PATCH v2 5/5] riscv: dts: microchip: add a device tree for
 Discovery Kit
Thread-Index: AQHcG98gqG/pvteh90S9xnhdl7vCCLR/kIYAgAGmNwA=
Date: Wed, 3 Sep 2025 09:43:46 +0000
Message-ID: <8b371196-c853-4e47-980f-3f2b3525180e@microchip.com>
References: <20250902075548.1967613-1-valentina.fernandezalanis@microchip.com>
 <20250902075548.1967613-6-valentina.fernandezalanis@microchip.com>
 <aLarlSG9tDA-1YiL@pie>
In-Reply-To: <aLarlSG9tDA-1YiL@pie>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8739:EE_|IA1PR11MB8198:EE_
x-ms-office365-filtering-correlation-id: cc1105f8-2f6c-4c8e-8636-08ddeace60f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MFVqcjgxbDh6NVFvQkxzRU5uMytEbEpuYWNsU3FERkRxdnI1aVRjU1RmYVMz?=
 =?utf-8?B?RWhuWmlRaGdFVDgxTDN2dG85emUzbjZldktsZnZ1aGZnK1gwZVRWRis4M2Uv?=
 =?utf-8?B?SmxKYmVYYmpQQ0xiSkpZL1h1bGxyMTlXMTlxQUlTZlk3N29KUzVuYjhMVGpl?=
 =?utf-8?B?cXAyME1ubzh0cmxXRVRWVnp6Wjhma1VCSnRManlSZEJ1Z0FPdU8wdnJ4eDRS?=
 =?utf-8?B?ZmpIY200aVZ2cmVicVU0RUtGS08vejBCV3lDK1NsWSs5ZHV5UmQyd091R2F4?=
 =?utf-8?B?NEVpelhYZVFWMGc0RnJrNWN0N0s1MkNmYXpEOURuVVdjRFVpWUE3NVdYRTlW?=
 =?utf-8?B?NjNxQVhnZ25PZkVCNDEySjJSUEhLWVFMbGluNFQxcGRCdGxML3Qwbng4Y3NT?=
 =?utf-8?B?RWVOcmhKVSttT2JPeXRTRXBFZTZWeVZjbXV1N05aNW5CREVKVW5MdU1IT3g2?=
 =?utf-8?B?b2tYdG1PcTgxd1RLTHV2OGhtUVRwNWdIUGtFOFpyUFdEZ2k4SlJZbE5rOWly?=
 =?utf-8?B?c2cvM3pVZElGd3RhdEYvdURvc3VtTG9pS0tlM3d0NWUxOHVmQTY0eVE0UklD?=
 =?utf-8?B?eCtSS3AyK2FvUzhyRU0wS3N1cTZPQkJOTnZ2SjVmN3p3ZDVSUWtZZkxLbFZ4?=
 =?utf-8?B?SXIyN3kydE5XaDdBd1hSZ0ZCM0xqaW83MnJNNllEMVM5QVBTZVZrZFFLZlBM?=
 =?utf-8?B?QUd4a1ZncVFyMmhaTmlWTWpJUWQrdE0zMDIranMvQ01rWkxrNWdhQWlpQklH?=
 =?utf-8?B?RmlRZFFZamFQR2plbCs1TC9ZRVpsYk1ncUJtYytwQzNoM1R2RzNsM3ljQkxX?=
 =?utf-8?B?ZmdGK2k2eEhtdkZ6UjMybW1wcHhpTS9qM3AvVUFJYTdxSm1MQUlQb3pjRWx6?=
 =?utf-8?B?TTM3Z2VBYVYySGpGTStQQVRramR0YWJFQThzT09XbHZuUlhPeG1Tc0NQRTBy?=
 =?utf-8?B?dEswU250d1JWYXdpK1o2M2Rwc2lGWkQ0VDVLMk1YOTl4K0xDRmZsd1JCemNQ?=
 =?utf-8?B?eWJCQTNFT3dyZkJzVDZLSEZsY3FHRk9VK001U0VhczVaRGZBbUpOU1RoMWxq?=
 =?utf-8?B?S3RJR25YaTlNU1hhT2FKcm5XTWN0cndGS0N3a2t2TFB5ZlB2VjUvUXpDV0FU?=
 =?utf-8?B?WFg5UGFIbkRRdWpKQVRsRkpqRHlKQTA3Q000cDgrQkE4RHovM05ZUzBjQmJj?=
 =?utf-8?B?UnBpelgwZHd4UWp1WlhLWVUyUGNOTUhhcVZja0lYbWNMQmlXSCtaNHJYV0F3?=
 =?utf-8?B?SGg1azhCRTl6aDdNWnNZNnVhMEY2eFE2M0pTWnUxNDVzUkluVjhsK0k5WDVO?=
 =?utf-8?B?VEN5ZGl5cEt3RDF3VDlrU3lPZWVHakNXN2Qxd01mb1J2MUVKY3oyMEphcXkw?=
 =?utf-8?B?MCtZYmpGZHQrQmt3N0IvS1JwdVh1S2JDSXBETGJFVmw0ZVE5dlUxMUdNL3lB?=
 =?utf-8?B?eGF6Qm1kNWNZWHI1bmVpeUFGbmt1TU1sQm5sWXlWZ0FYUXR4bDRNd1paOXNX?=
 =?utf-8?B?MUlibGFWaTIzZ3BHT1JRTVZSN2U1YzF1ckVvOGtBSzZldnkyMTVpOCtxcGRh?=
 =?utf-8?B?UEFGZ2xyZEtLejVNWFhONjhkR1d0NGFmZWpMZXRRaEh2WHhUbm5xTS9Sd1p1?=
 =?utf-8?B?TGExeUFjZTl2M082V1NyUUJDeVVESDVhNVdaRkhvVm1YTGhldmV2enpHVDBB?=
 =?utf-8?B?WEg4dzUrUmM4cmJCL0VZQkJocXNNdW15MEdEb0pYL2NFU3JGYjFQVmFPRjBl?=
 =?utf-8?B?c3dLUjRzZkNEV29oSXExME16QVRNT3ZKNVNwMGtCeVhhRHVzSTNWMFc4WDBM?=
 =?utf-8?B?TENpUXdpNW1QbUd3OHgxdXpYeWVDeXFWandiUk1Lb25idkEvSXMwQmxzdXIr?=
 =?utf-8?B?Lzh0ODFyckVBVnp5T3dXbGExdmxERmFXaWtIbkl1dDNEOHBTMkY1ODdrUXlr?=
 =?utf-8?B?T3pWNmNlbndzOFZ0Q1gvV21mWm1EQUxKVXpBaFFCc09uYWlFcWU0OUxranlG?=
 =?utf-8?Q?EyB0En2jAYGt0c1f0by7I2Lvdzu0iA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8739.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c01MdWp6UDVIQllqTE1nNkdxcXZDcnVSc2pIdzh6elFFV2IvUVJTYW9tdVhz?=
 =?utf-8?B?eVhvT3pLbDltdzlpOGJjQUxFTXUrNkZLb1R3cVRXSzVkbHROSzc0ZnRYdFVB?=
 =?utf-8?B?a0I4QjIyKzVSNTJrWG5EOEdPMmFwRkY0L3JlSGhpVHEvYnp0NzlTVWJGeUFk?=
 =?utf-8?B?WGNLcEFjc0trM3dPVkdEc0NPNmhMdU41eUdFYnFKWWlpcEJGcXlEcUFiUjEx?=
 =?utf-8?B?K0ZkU2xXUXFJSFY0NzA3WHZ4UUxYa1p0MkIyeHFMZEdoV0Fna1d5c1hUV1dj?=
 =?utf-8?B?NGZuZUpEekVXaWw4RHdNR2J2UVZBeVBsTVVNWldDNXk1RmQ4bTV4V2M3T2Zr?=
 =?utf-8?B?b0NieVJHRkpFc2ZiQmdsL2dtQnlCMU5waFNaZ2ppWDBDQXBTRUJLVlFqNGpO?=
 =?utf-8?B?dFN4MDdtbHBOZjIyMzBEWmZQemFYV0xjZklTeWV1a1Z2YzQ0VUlDVnB1Z3pw?=
 =?utf-8?B?Y1FQamxDM21UUlpJdGlZSm5sRlBXT3lQeVdXeGI4UmZmYUZVc0JXK08vWXdV?=
 =?utf-8?B?aE1MOTR4cHFzUXRvV3gvWHlqRDdrNDIreVlYbkhQZ3B1a3hTRDNHQm00RGlp?=
 =?utf-8?B?WS9xK0t2aW5LZmY2VENESTZTbWNDazRCZE9XZ0g1NHAvL1djSTVFaHU1OTVO?=
 =?utf-8?B?MXl4N1Q1dVN4T0xrRDNLM3dablJ2WVU3VWo3QmdvSFh1bmhZZXZKTlNNMXVH?=
 =?utf-8?B?b2d0WHhEWFQwNitwUm9WTTJzMDV6TmExK0s0d1VpYUVzZmdWa0hjWkJaRFlX?=
 =?utf-8?B?WGlxTE40QWVpRjBZZXZUcm5JdzgzWENNUEh2UU0wRWRQaHpDdDBHSm00a1Ji?=
 =?utf-8?B?blVxWUVnckFqeVp2SFBhcVNCbThWeWFIYU03NktBYUhldGZGcmFrQmpTbDBR?=
 =?utf-8?B?OHl1T21Gd2p2SHlldk9CUm5Wa3JFQ0tBQk9HU29CTGQwOTZMbVlSNzd3UVpB?=
 =?utf-8?B?aU9IbFhCRS9DUVlvMFN6ekVWYTBZemoxdUFNdkxDUi94SS9WOHc3TUVsOUVz?=
 =?utf-8?B?NGF3bklTZklKQ3dsQWFta01yRGdBa2NwbGpibG9UbVlMclc2ZnJ3ZnRmdmQr?=
 =?utf-8?B?WVc4WGJseHA0bjdSRmtVUFNkbk4reE9XN3pxb1VDT2xzS2VIUzY4YnZTclBW?=
 =?utf-8?B?MnN0K3ZZQ0NuZTNiZGlvY201bHptSzV0a0lIR3VsUTZPSFRWVlJiWUQ4U1NV?=
 =?utf-8?B?dEZUSFpzcERjcCthV2xEalpVU1ZYQkpmUDBPbE5sN3dQSVd0WTNzNng0UllD?=
 =?utf-8?B?aTg1eXNlc1I0Uk1ka1BuUThVT2RaOHZrMlpNbzU2bmIvTHUxVDFIVUVQNkdy?=
 =?utf-8?B?L2NKZ0o0MEFQRzhkeHY1NnFIL3A5eVdQcGdhL2lqbUN4bTk4a3F5ZWo5ekFK?=
 =?utf-8?B?bzQrQ08wbEpXLzNUT3FCWmJZdzJlbThib2xxd0U5QVpDN3c5bEdwWVlIclcv?=
 =?utf-8?B?ZThxUzg5ZGQrZUpGK1ViMmZzZUNxbldjTVhxRHByQWZQd2FkWUtSaWJmYkdz?=
 =?utf-8?B?SHh3eHluUDVUT0MrQ3V4b1k2REJqTWtXZU5vMzdxRHNwNTRsTzlGUGJ0MnlL?=
 =?utf-8?B?MktMM2lZWExkS0RZU1BTTUE2bzQ4bDJ2azhTRTcvODlSZkRzd2dKYzdkdkVC?=
 =?utf-8?B?WkJnK2wrWjRPRWtBcDZ2RW9nN0RTajdtTzNqbFFJQ1pEbFI3Rjlqa0NsNWVJ?=
 =?utf-8?B?eVBSWHpEUEhQRmhlTGw3MzI2dzBCV3ZVTGd4dkg1ZCttUWt3MmViYTRCQnpU?=
 =?utf-8?B?NWJyNlZLVEZzU0plQ0gzSWl5S0E2RVVrN1YvUlRPTDBkK0JDblVCcnlNV044?=
 =?utf-8?B?blRSVXFyS0FiVXZObWVITUhqVFFTcXNPNW1zMlc0N1hSMGc1TmkyMnBkMEdt?=
 =?utf-8?B?RVFXWjdiR3ZKc1lkd0E3N3VySkp2ZU9UVU1OcE9seE0xMk00Wnk2MjRaeUpM?=
 =?utf-8?B?elhuOVlVOEFBdE9tdmZoa3BDUW9Ca1NkVll2VHRJRU15T0JXYk5TTVc2eXl5?=
 =?utf-8?B?VkwxWVArSHhLYmd5NzJaQXdqVzNyNGJ5SS91QWh1dnV5bzg3MmN5MXNNZ2Z6?=
 =?utf-8?B?dXd3Y3laRXVabVhXZjFUamVyTDZqNE1lRG92ckI5dnBzWmw0ckFING8xU3VD?=
 =?utf-8?B?TkN1TXpJaCtTQUVXSDZ0MmliY01xbnpaWWpxc0xCV0NYMnd4V1lLZ3ZmOFRq?=
 =?utf-8?Q?J+NPmyDp7l3tiKpZ76Heuz4=3D?=
Content-ID: <107DFB84020CB04CB7591C9D19DAD3FC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8739.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc1105f8-2f6c-4c8e-8636-08ddeace60f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 09:43:46.6815
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FAeKTFTHtQVNKYkT3lV0uCFo0HnlG5AsBWG+MRB4gEuelgthoguAeFnTrJeUyvF5Xwwz4AiEJqZlreHUJuUeIURWD32TBCAThJacq7lJP/36GZY2i9snbOOLWHd1xcTj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_024354_793626_C35A7432 
X-CRM114-Status: GOOD (  19.66  )
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

On 02/09/2025 09:32, Yao Zi wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Tue, Sep 02, 2025 at 08:55:48AM +0100, Valentina Fernandez wrote:
>> Add a minimal device tree for the Microchip PolarFire SoC Discovery Kit.
>> The Discovery Kit is a cost-optimized board based on PolarFire SoC
>> MPFS095T and features:
>>
>> - 1 GB DDR4x16
>> - 1x Gigabit Ethernet
>> - 3x UARTs
>> - Raspberry Pi connector
>> - mikroBus connector
>> - microSD card connector
>>
>> Link: https://www.microchip.com/en-us/development-tool/mpfs-disco-kit
>> Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
>> ---
>>   arch/riscv/boot/dts/microchip/Makefile        |   1 +
>>   .../dts/microchip/mpfs-disco-kit-fabric.dtsi  |  58 ++++++
>>   .../boot/dts/microchip/mpfs-disco-kit.dts     | 190 ++++++++++++++++++
>>   3 files changed, 249 insertions(+)
>>   create mode 100644 arch/riscv/boot/dts/microchip/mpfs-disco-kit-fabric.dtsi
>>   create mode 100644 arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts
> 
> ...
> 
>> diff --git a/arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts
>> new file mode 100644
>> index 000000000000..c068b9bb5bfd
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts
> 
> ...
> 
>> +&mbox {
>> +     status = "okay";
>> +};
>> +
>> +&mmc {
>> +     bus-width = <4>;
>> +     disable-wp;
>> +     cap-sd-highspeed;
>> +     cap-mmc-highspeed;
>> +     sd-uhs-sdr12;
>> +     sd-uhs-sdr25;
>> +     sd-uhs-sdr50;
>> +     sd-uhs-sdr104;
> 
> I think sd-uhs-sdr104 implies sd-uhs-sdr{12,25,50}, thus the latter
> three properties could be dropped.
Even though the kernel treats sd-uhs-sdr104 as implying support for 
sdr12, sdr25, and sdr50, the binding has no such rules about implying 
other modes. For this reason, I thought it could be valid to explicitly 
list all supported modes to ensure accurate hw representation.>
>> +     no-1-8-v;
>> +     status = "okay";
>> +};
> 
> Best regards,
> Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
