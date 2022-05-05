Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E06C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 May 2022 13:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VNHl0JDyhZHDRDYZp/Ii5lQCb7EzHcCR2N14QrJNjtE=; b=GaMr01RhS2H7H7
	Vr4XqmODQdLZdLAvYf0yU5Ox8EmrwSAGJ5DfndyXcnDi2ABriQxjcSoNaz9Avn79HqV5xg6CSeCLb
	S9dDflN4kSiAcFFXjTG67eJGl9VgnWNGI8DNaehcDeGxnBFxLtj/RUfrDiL9ZBTR8rH3EL2V0JtiZ
	ScOv6qiwI2RpfX4IshWoNr+y3Y6Pywdz8zV9SOEneYUGu/Lajr8Kvj/W2wL1J98z048FECdm43yxs
	SEhFmQqH4s0MoTHwcm97lu0fvBXZ+A7mHvY5xuAG689kFsd6mH4NRv04v7JbVhBf6JwIPV/QY1kgH
	L053u9m9Up3VfzCxy6LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmb5i-00FvgZ-00; Thu, 05 May 2022 13:00:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmb5d-00Fvdh-Ls
 for linux-riscv@lists.infradead.org; Thu, 05 May 2022 13:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651755618; x=1683291618;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cTeyf05McYWxzfsiFZIE7L+zG1+RvIX8z7YD2chl9us=;
 b=XN4cCK9JYVCmsnYp6AnVDyqir2JP1Ts/14+yLbJJJZGF2YWjoWAQdHT5
 5IZ8imrtAkfWDMBEYM1LQfE/flIHe/H2R/hKgcsGsSPfSuVXtErfSay47
 MnYrO+t5M68je1MMTS0owX/K8DNVCA9/4Jp5eSUFVQCt/Qnhi3LVPuXb/
 5vfdfiInp+nr7RHkymiB/GAY+f7mtVj0qzYblVsS0t/70xoXM5zBCP0Wp
 LQwaKrCWctjQ/pBk3aUXYk/eFSqa0r+K3fvZf5Qhu5AZy1lUXnTrln9m4
 nbHGok79ixYogPp3T7M2bZzsZ+oJ20548qOTlj7/x19gXFazwW7cu94/8 g==;
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="162437038"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 May 2022 06:00:13 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 5 May 2022 06:00:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 5 May 2022 06:00:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWrzxgArt9PNHC0Ekn9Y9H/cuDUDMwsexwTDHWO4lbSxThNcvIm/qMgtxCWs3ryvmaubeyuMzB7zxeyPYXLS/8/Gbk6gzEAVzlZaqXnhcMhpADhDqLr+VNCA9GVyCLEN4MMfWfPd2OXtJYSr0XO5LBT1TNwQGEZRW6+ZFrEwBsSS7n/+pOwfPqfraE5qHBJRxxmiicOzXv4GjVzHxWjkITz4+ewO+fySMzzyGtlELRb8HC6QWeD3Q+CG84WsrAALir2QO3hJJsOEfbGFACAIohg0hIjyMKG4w4rQkMWkU9AUoYP8i+0/asDVoHunydDJyIycJQCJWcefsp7P5t8Xcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTeyf05McYWxzfsiFZIE7L+zG1+RvIX8z7YD2chl9us=;
 b=izH8U6swh3+XS8SVSVFPoHBwfY131k3rSfEYXhmq8Nb5ZRMbZHHKqYmYf4liYTdvzeXbeT/WzW2ytFmjofdPnihWbu/UmgaQ+IKsEXjwbizMURh77WhCj+yL219y+IUn4/2BvVqZETjkENHt8rKwk3plZq6JmVZk+3O10jNOjxYjguIEZge3qr49Xngr6zX06VuhIZuWAz6PxWMEoDHwuYSnjLqrSFXjk9x2Xp18AY6rJFkhIzMBdsZXq4UNheTXlGr+lJhqE4HmmROgLabfFlQRKkOcEUTfHxbNdbm6Tfj2k16SSFLTHSbioewclbTC2D61ssMxA10B39ofdSSMgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTeyf05McYWxzfsiFZIE7L+zG1+RvIX8z7YD2chl9us=;
 b=j0+ZPODradhj/6o9SHCY2uLY7Yav8bccRK2PxP5QkJbeTQt617610KPOEY9J6YxLrwOl1ZadaYu9/YwBw5e8zOV+fMq1+5zBuZggR+w5+ZifufaLDGOtIGwjzsil0dW+MQcUBILy0EIx9LVlZ/sHRtwIiXIqPggAYlI1YndJaU4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by BN6PR11MB4116.namprd11.prod.outlook.com (2603:10b6:405:83::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Thu, 5 May
 2022 13:00:07 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::fcd4:8f8a:f0e9:8b18]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::fcd4:8f8a:f0e9:8b18%9]) with mapi id 15.20.5206.025; Thu, 5 May 2022
 13:00:07 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@rivosinc.com>, <arnd@arndb.de>
CC: <guoren@kernel.org>, <peterz@infradead.org>, <mingo@redhat.com>,
 <will@kernel.org>, <longman@redhat.com>, <boqun.feng@gmail.com>,
 <jonas@southpole.se>, <stefan.kristiansson@saunalahti.fi>,
 <shorne@gmail.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <gregkh@linuxfoundation.org>,
 <sudipm.mukherjee@gmail.com>, <macro@orcam.me.uk>, <jszhang@kernel.org>,
 <linux-csky@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <openrisc@lists.librecores.org>, <linux-riscv@lists.infradead.org>,
 <linux-arch@vger.kernel.org>
Subject: Re: [PATCH v4 5/7] RISC-V: Move to generic spinlocks
Thread-Topic: [PATCH v4 5/7] RISC-V: Move to generic spinlocks
Thread-Index: AQHYXKhYtH/vI/1B5Ea5aV8nenoVOa0QRqwA
Date: Thu, 5 May 2022 13:00:06 +0000
Message-ID: <49b08c9a-8898-98ed-9b2c-9cf21d24497a@microchip.com>
References: <20220430153626.30660-1-palmer@rivosinc.com>
 <20220430153626.30660-6-palmer@rivosinc.com>
In-Reply-To: <20220430153626.30660-6-palmer@rivosinc.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: abcceb82-3bbb-4113-5ddf-08da2e972dd9
x-ms-traffictypediagnostic: BN6PR11MB4116:EE_
x-microsoft-antispam-prvs: <BN6PR11MB41167655BD1CA6B1C331DBE398C29@BN6PR11MB4116.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sIzXHpN3YzAOrlCjcd/LqHvxtTvGgLW/4s9gfchG8a7vza/Lbt7IA9ybYdxNuNyHZPKsEt5KgFN2HJcPRdaRvezqBGgBkBEM9frITYaFLk5b8etP9Rtp4VYkaF55Rnv4ZIIoXFvKQZSE1rdmrWNvf0flV/BGg5mVvWmRFPW5mUgNVVudmuRvT9XNHM6EGp4cJTAuOMvBBcT1ujDTeGW6PhZCJJJCeAGgi6s+IdRy7d+kuhu4j9O5+G6wqNQhhYLQMNZhyliLaIxSVZlVUUUd/WpEXMGBWEH92zExzrQhih53GjQUOD433+0shnSGw1z/1xt5qmGSAJ8o9b+INUO2Mp16Gb9tk9rgWrC0dXbsgapPdMLz74G4uIq/2uMSai5nKpYPo+RZflL61J5PloLqYH5RULqZ6Zsbc77yM7Mx/hN5Y4eo2f1LHiiIXQFdT1mPxpfa0G/obKWXU2oQ5jiwRLNbWTAWSttHMnSiil1vap1sRTMnWLUTwFEAjJglO4p0uKgV1yxFmTdgEBUZRt7yMOL1xbUM1PQ9RCeWYlwsRFRiJEF6KK52F10eL8jYn1R6u1tb4t7RF65gokUKGP9qE+eki034FpRWd37HlYOOrNIWKlS0qNU+6pDY/uOvFAFtRGcccdBTPDSmrjrSa9LxiNOaeqvKQnW4LMQyuOTBfYYW5FAAPLloMX7JQAPTrByBE2muotsg7I0oBsDz7Ik1yGKiaGthew9fEb9xxkch52Xd8/8G9j4z9zIYSyX9sjltiZcenYmIXbjOhEVXni0H4KTdVm4NONJae3TBirOmMGE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(31686004)(31696002)(122000001)(508600001)(38100700002)(38070700005)(8936002)(83380400001)(316002)(53546011)(36756003)(54906003)(6506007)(110136005)(64756008)(91956017)(66946007)(7416002)(76116006)(66446008)(66556008)(66476007)(86362001)(5660300002)(2906002)(71200400001)(8676002)(6512007)(4326008)(26005)(6486002)(2616005)(41533002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVhSSkZ6N0ZGajdzejhwSWVJRjBlVnJuZjM2clNYeG85WS91VkRNaS9XNzdj?=
 =?utf-8?B?T3ZlM2NCVlA0RTBOTTEvK2FqS0lVUzk4UVplWDFXV2F6bStwUnpWa0lqdVls?=
 =?utf-8?B?SHBqdTVoc2o1aEdrb3QwVm83NHpNVlZIWFl6QXZHTjZPTUVWVHNPbkhScFlF?=
 =?utf-8?B?MU9xZGdvcXpTaG5Uc0VUVTlpQ1c0eWkxRnRsSUNlQTE4dXVTSnd3YW5GNkZW?=
 =?utf-8?B?bEpvQWY3blpLSk50bmVpNVYzNE9kK3k2T3UyN1pJNEhoV1plNHpHajNWT1BJ?=
 =?utf-8?B?NURDWld1bnZJM0FBMTRhWHdMaXFQSm9Ld3YwYU54OHQ0ZlpuUXJMbDlGT0Zq?=
 =?utf-8?B?NXN2TXdkVTZnUy8rNksvQlVjSlJKWjgyVnJMQjVVaHU3OWwyK1dFUWFTMFJp?=
 =?utf-8?B?TDdGSE41T3cxbWYySW1sd3lUYmpMU1V2K1VrTjNvSmJTK0xsem9LRFhCbzlH?=
 =?utf-8?B?V05WUlNjc1BXV2o4ZHVKUGZ0UUc4NE1QY1luM3c4ZTBOdXpZMEJMRnhjOTF2?=
 =?utf-8?B?dXM3RkRrS0Q5ZFdHajlPcGZQU2x3ZWtFRFF2N2h1WklPWGlqdGhDNE5kclJT?=
 =?utf-8?B?NEZ1L0FYSy82eW5UQm1Ec2txT1p6OGJOT0lnRGJWdGFhM0FQLzJkZDMweVli?=
 =?utf-8?B?a0FXaDE5NHltZmJWVkErSjhEd0czb29XYTQ0b09DK09uT0xxd0hGd3k5cGdS?=
 =?utf-8?B?OVdrTG1XNC9mbXo4ZkR1OGlnZzJSWkd6a1JsU2VsQlZ4WXdTd2FOdUhWR0tS?=
 =?utf-8?B?SCttMkovR2dITzVmcExPMTN2WVhzY0JMd1BXaXZhMFh2cmFRaFRnQi9LS2Nx?=
 =?utf-8?B?U1UraEluNDNDUERjMkRTWnZma2hFM2FmaXpMWXZFUUloK2pLN3FRVzF0VlZh?=
 =?utf-8?B?MG5HbEkvTDJtZDJ2TEVrdEkxbEhzRjNvWXdDTHlVRk41QWEzTzVtaFE4c2x4?=
 =?utf-8?B?elpGejBEVm1XKzEzbkdpRmZRekZzS2wxZlZBUmVoWkVCNytaT2JkOUhXZklG?=
 =?utf-8?B?YWhkNVBQQjd3WnZuT3ZML1V1ekhneWFZcUxHNGpnb3QyM05sMTdqVTk1elIw?=
 =?utf-8?B?eUV3TXI3dVJCSlhWL0dzZ2NUajJ5anl5Zk5sUzdrajNISStna1luODBWL1hJ?=
 =?utf-8?B?eXFpMThzN1JpcEpaTXdWcjVIaVhUa3ZRQ0pPb2krWmlIdHBmK1JiVVdkVXE5?=
 =?utf-8?B?N1pTZmdNTWR3Q1lVcmRscDhaRnR6ekt6ZDh4K0V0eXJrZGdaekt3Z0FJZ3pC?=
 =?utf-8?B?c2oranFpSmM4U3RLYmdQTitUY09QdEJKbTlXWHhjVitTcGRlSzRXem9uZERZ?=
 =?utf-8?B?SFEwL1d0TW9ObHUxZ2V5TzZTR25xMkRtTEZMS08vNDN0WTE5MHJEbFlCbmsz?=
 =?utf-8?B?eEdBYVdFbktTVzJRa1FaSU90SUZKNkVrRmZCTGI4TEJ5NUJlSVB2enNmTFFI?=
 =?utf-8?B?Zk5yd1VhQStyZk4xdi9yUHdJSVpETWVBbzVjaFprajZVbmFKMWpXWXR2eEFj?=
 =?utf-8?B?L3pVMCtOTlRHcUZsYXkxUkdRMkNPbDFpaWpXdXQ0dVdyRXZxdUdQTjQycXBl?=
 =?utf-8?B?Ukcwd1owVVVhWWFNWE44a0paaWlCaXB6TTJid0RsOThKdXBMSk5laHRmL1d3?=
 =?utf-8?B?MFpoWGlIb3hyeHZzcTNpeTBIV1lheWhiY1NVV2hYQlo5bUdvRk9FcWhESUNG?=
 =?utf-8?B?Vmp6cDZIa2QwOEQ2RHJJL0s4bXhWOVNJdDc4c0M5a0ZRSWpNb1JhTStXYk9i?=
 =?utf-8?B?VGJ1NFZmTzV2YVpIUlkvM0VBS1dLOTV3K0JrL2liQjkxMldwcFo4MzVGSlYv?=
 =?utf-8?B?TmUycWo2M3puekpkU3JtdU1vdkN3K0dLdkVWbEd0RThKT0gvWFN1RE1RTE0v?=
 =?utf-8?B?ZlZYUDMzN1M3VW5TTDNhSHU3Q0lHdjdRREFvRFV4L0pmMC9EOWhQVktWNTBq?=
 =?utf-8?B?YjRmL0dtb0pZeXArTU5TZXI5QTdwdG0wQnVCb2xORlRtd0c3UmdXZ1V2NVVX?=
 =?utf-8?B?NWxkZlFRZm1Za1djcGJtRG13a0h5Y0lRb3BzRkZJbjdnT29LcFh6TFIrM21G?=
 =?utf-8?B?MUFSYldLdmxqejllcVlXT2pmSlhyeFM2dnhLSU14cGZRNnJnS3lLbS9idExR?=
 =?utf-8?B?QmowNmxscXkzUkFTcEZmU1JsVTlkK2RaY2tteGx6eU12blo5N0gwMDk5Q0hn?=
 =?utf-8?B?THEwRzVqSGFLdlFFMFpGN0JmTUVQb0ZOOGEwck4za3ZubVhVc1kyOURUZWhC?=
 =?utf-8?B?T0NXTlF4bCtlc1cwaGx3U2JOOVVBc3kzVWUzVWU4NCtvMVZvcUcxdVJvZWIy?=
 =?utf-8?B?LzRNcDNuMGZpOUdsY1BwZmdEam5Kem5PNmZjZ2NobnBMSnJjNmgyM2RvK1pV?=
 =?utf-8?Q?D6hGCf2ylTfXi90Y=3D?=
Content-ID: <F4E2EC605ABFE74D9A189F07357A74D4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abcceb82-3bbb-4113-5ddf-08da2e972dd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2022 13:00:07.0037 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P/ZGdasDFfIUv7/1khWTluuzr1jcv50uCy9I6z6Ox8pypuPRYjlzNgKDMZ0VbvaqBLB4gK6J1sWhSu9BYur+9g+t5RvQXPnxzHROrcUj6Ns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_060017_987862_A40EFDD8 
X-CRM114-Status: GOOD (  24.35  )
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


On 30/04/2022 16:36, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> Our existing spinlocks aren't fair and replacing them has been on the
> TODO list for a long time.  This moves to the recently-introduced ticket
> spinlocks, which are simple enough that they are likely to be correct
> and fast on the vast majority of extant implementations.
> 
> This introduces a horrible hack that allows us to split out the spinlock
> conversion from the rwlock conversion.  We have to do the spinlocks
> first because qrwlock needs fair spinlocks, but we don't want to pollute
> the asm-generic code to support the generic spinlocks without qrwlocks.
> Thus we pollute the RISC-V code, but just until the next commit as it's
> all going away.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

I am loathe to add a TB tag since I have not done much by way of testing
any realistic use cases - but I have put it in our CI and have had a play
around with it locally & nothing obviously broke for me.

If you think that is sufficient:
Tested-by: Conor Dooley <conor.dooley@microchip.com>
Otherwise feel free to ignore the tag.

Thanks,
Conor.

> ---
>   arch/riscv/include/asm/Kbuild           |  2 ++
>   arch/riscv/include/asm/spinlock.h       | 44 +++----------------------
>   arch/riscv/include/asm/spinlock_types.h |  9 +++--
>   3 files changed, 10 insertions(+), 45 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
> index 5edf5b8587e7..c3f229ae8033 100644
> --- a/arch/riscv/include/asm/Kbuild
> +++ b/arch/riscv/include/asm/Kbuild
> @@ -3,5 +3,7 @@ generic-y += early_ioremap.h
>   generic-y += flat.h
>   generic-y += kvm_para.h
>   generic-y += parport.h
> +generic-y += qrwlock.h
> +generic-y += qrwlock_types.h
>   generic-y += user.h
>   generic-y += vmlinux.lds.h
> diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
> index f4f7fa1b7ca8..88a4d5d0d98a 100644
> --- a/arch/riscv/include/asm/spinlock.h
> +++ b/arch/riscv/include/asm/spinlock.h
> @@ -7,49 +7,13 @@
>   #ifndef _ASM_RISCV_SPINLOCK_H
>   #define _ASM_RISCV_SPINLOCK_H
>   
> +/* This is horible, but the whole file is going away in the next commit. */
> +#define __ASM_GENERIC_QRWLOCK_H
> +
>   #include <linux/kernel.h>
>   #include <asm/current.h>
>   #include <asm/fence.h>
> -
> -/*
> - * Simple spin lock operations.  These provide no fairness guarantees.
> - */
> -
> -/* FIXME: Replace this with a ticket lock, like MIPS. */
> -
> -#define arch_spin_is_locked(x)	(READ_ONCE((x)->lock) != 0)
> -
> -static inline void arch_spin_unlock(arch_spinlock_t *lock)
> -{
> -	smp_store_release(&lock->lock, 0);
> -}
> -
> -static inline int arch_spin_trylock(arch_spinlock_t *lock)
> -{
> -	int tmp = 1, busy;
> -
> -	__asm__ __volatile__ (
> -		"	amoswap.w %0, %2, %1\n"
> -		RISCV_ACQUIRE_BARRIER
> -		: "=r" (busy), "+A" (lock->lock)
> -		: "r" (tmp)
> -		: "memory");
> -
> -	return !busy;
> -}
> -
> -static inline void arch_spin_lock(arch_spinlock_t *lock)
> -{
> -	while (1) {
> -		if (arch_spin_is_locked(lock))
> -			continue;
> -
> -		if (arch_spin_trylock(lock))
> -			break;
> -	}
> -}
> -
> -/***********************************************************/
> +#include <asm-generic/spinlock.h>
>   
>   static inline void arch_read_lock(arch_rwlock_t *lock)
>   {
> diff --git a/arch/riscv/include/asm/spinlock_types.h b/arch/riscv/include/asm/spinlock_types.h
> index 5a35a49505da..f2f9b5d7120d 100644
> --- a/arch/riscv/include/asm/spinlock_types.h
> +++ b/arch/riscv/include/asm/spinlock_types.h
> @@ -6,15 +6,14 @@
>   #ifndef _ASM_RISCV_SPINLOCK_TYPES_H
>   #define _ASM_RISCV_SPINLOCK_TYPES_H
>   
> +/* This is horible, but the whole file is going away in the next commit. */
> +#define __ASM_GENERIC_QRWLOCK_TYPES_H
> +
>   #ifndef __LINUX_SPINLOCK_TYPES_RAW_H
>   # error "please don't include this file directly"
>   #endif
>   
> -typedef struct {
> -	volatile unsigned int lock;
> -} arch_spinlock_t;
> -
> -#define __ARCH_SPIN_LOCK_UNLOCKED	{ 0 }
> +#include <asm-generic/spinlock_types.h>
>   
>   typedef struct {
>   	volatile unsigned int lock;
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
