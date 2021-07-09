Return-Path: <SRS0=DbKB=MB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C99BC07E99
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jul 2021 08:42:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CCAA613C8
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jul 2021 08:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CCAA613C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9jAr6cP1oJIuJRSOpDkU18muXz+1ANHuCjrCrrNu3KI=; b=Hg45VLlpcB8NEh
	kzXHxbey62lIGwelsN5RAQqJtQZxd71oYEqjCpKTdDo6nxPbFXxmnNrQwr3zOYkuNm6r0E28Rgyqe
	VtNoo+UhsszmS9lrx20xPG9cU1ksc+djQH1I9loD1f3aF3QxEzNzafQKxu8cV0xV5cvhD9dlh44cv
	VFotzHnLxfGArAA4AkgdZSbpRpJhbP9wkSwPftrX48M87ebr611IjlPolNxriM12doI5ODdJBdLta
	UzeVYFQzwAv1crFLVobXRixhTFrdXMS7g7SLTjjyn75V7Z9leZI4oDsOIsWlf8fHq9FFy+PAgiK6k
	15wdSAL+in4NxnU2dQMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1m5U-001BFM-8n; Fri, 09 Jul 2021 08:42:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1m5P-001BD3-Dn
 for linux-riscv@lists.infradead.org; Fri, 09 Jul 2021 08:42:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1625820135; x=1657356135;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1Pu12NnU9dyrHrUa4BNan8X43T/gIDN62MmwKI86gRc=;
 b=IqAK5pZtFiddCcerSLokPOte6Dt91naO93TG5KjD9E5c5uHOaef4rzho
 7XdX4RSBIgR47nnHAhPGh8yyi8CK5nCjfTtYjLJdhXV/18H3nU728xVXy
 oHAbBTEwxg7d9Se0ZwWxx1kEWfeQHo4xeftPWKOiYT5kQEtSsiuPTA5J7
 dJotyGIQofdd37f+VBwupJ1cKw8aujjcT5OPtY3WMTgdZnx5EPlyQ0JyA
 9xfdkWF4jSiytXEup8PVyxqYGIQc+19PDAq5SSXbLPlB+ABCUSf9IQobb
 ASDr9417PkelGpq1O7n5c0MBQFLVLkJ48gimFNME175Bl63ymC8DcQ004 Q==;
IronPort-SDR: mGufUcuR+8/YdHqZL5N35NDKnn20SIttYAbRshDVUId9E5Qc3GfmulYC0pbXVbOaE8X0r8kA/o
 liQ3ybn4b8UkTR5AHnHCPqGzY+T91Ey+HEeB8hPdqfoJ1mPvfe9p35hUR8hJ2pelEMv6FHhqjj
 CifQGevuAggYsP63KE7cqAdVb17zuXTiKZa1lH7162XGSQvQX3L4my8OAUVTq1FqJiEZ/hTkVf
 2aleD/uuhnzmq8Ka0dj/HDNeKffeG/EQHDPapLqrmu10CFwJ4tmeqwQ4ZWJvd3fgb3jp4lxrDx
 pis=
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="124013736"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Jul 2021 01:42:14 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 9 Jul 2021 01:42:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Fri, 9 Jul 2021 01:42:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbkZETa9w/wuPxDtAlpQA3tyxjACrzPfpN+kyO1fGrQYLh2d9EZ4kflHUMyUUe51wBhoxnZz2lFCIXyR3nZaeTqJTslNyfjwPcnUIx399Bg4PvjpDGnaX4XTSqpQmwWPiYbvHqmjojTn8XF2M51swKT7/8j/UYQOTypxoGPa6PGliuq6LUasAdq5KU838Up2zo9KoJrwfCHpi+g5kBCursrSHkSYsoSjh3Xi77lNL8Pd0l3BhryMiNAS0Pb0inZNoplQnHp9480nxpnc+0joatbGjPM7G/7JL0xOwT5z2ms4OouhkCsKOrahw37xj9JOjxtG1xbnPIZ1tse3eMQWjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Pu12NnU9dyrHrUa4BNan8X43T/gIDN62MmwKI86gRc=;
 b=WL2hGD1bKmlULfsAqV9HPxPTNeOKmRW81pbNcP+5KTFW2f9r33dyTuj8E3ZzZ6W+KCxiyRg2Z9BQw32pK8QL3AOhHYJ21vGut5sWq2+6JUyq75CZkm3b5mv7A1jgeZij/0EdUCfoqbrZwUq0YR74GhXE+USq7yscN7UbHfP7yRv4dFvDHcKbcys8fRGGnfHJ0tAzkJx3d7bTatpFNhJ91A//f5krsX978qxQyL35bbpre7IBmH+eN5+3JaRV2tmyGSDKRxKfDvLeeTMx4Kt4Wg76DIN+xHrbOtg4IcqfmmkaYOr5PCttD/Y/ZjU1r7loOPrXV7wM5+Ozr6hqILhL1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Pu12NnU9dyrHrUa4BNan8X43T/gIDN62MmwKI86gRc=;
 b=aoeOR/ggpeXKgVIlQlBn5Lw0KJZfb6wrnbg8xYjEihxqTgi1JmjQx2M/UaJ5cPnRnzH+rVkcFripWSB65EnipblDc6RksrOG9qv//23gImfJVQQcpxf/gfLzZV2K6PbywvQLrHt4OB43gKQ8Jz4RKvX+yqXT/RF+X1+YpZD2B/g=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MW3PR11MB4697.namprd11.prod.outlook.com (2603:10b6:303:2c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Fri, 9 Jul
 2021 08:42:10 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::7476:4bab:7cdb:8957]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::7476:4bab:7cdb:8957%5]) with mapi id 15.20.4308.023; Fri, 9 Jul 2021
 08:42:10 +0000
From: <Conor.Dooley@microchip.com>
To: <bmeng.cn@gmail.com>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
 <atish.patra@wdc.com>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <Daire.McNamara@microchip.com>
CC: <bin.meng@windriver.com>
Subject: Re: [PATCH 1/2] riscv: dts: microchip: Drop "clock-frequency"
 property of cpu nodes
Thread-Topic: [PATCH 1/2] riscv: dts: microchip: Drop "clock-frequency"
 property of cpu nodes
Thread-Index: AQHXYnVF06x5/3pZjk+WP/cBJfg+2as5OF8AgAE/UwA=
Date: Fri, 9 Jul 2021 08:42:10 +0000
Message-ID: <48f0a6c0-13af-e2bd-6849-e84448f71b51@microchip.com>
References: <20210616060251.398444-1-bmeng.cn@gmail.com>
 <CAEUhbmXQt0pnqvzCGwGU38_U0qRZRmgGA4qgaFT_HevbSZRDBg@mail.gmail.com>
In-Reply-To: <CAEUhbmXQt0pnqvzCGwGU38_U0qRZRmgGA4qgaFT_HevbSZRDBg@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c86cc6d-eb8f-465d-5d0f-08d942b57154
x-ms-traffictypediagnostic: MW3PR11MB4697:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR11MB46971340271458EEA8D60BA698189@MW3PR11MB4697.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4EashJnlxW3ehI8ALZ9fhjvJnU/pLZvjWzRZNFF/j2Ji3rT3iWB5Q2q5j2kcLzp02Uu/a5jlNu/M0F+nzUB0v/K5AElX5i3UPW/pkw4NNzag/WsACpH5Oikl63mCtTQwdP5TEHpXkRlcnHG0aNN0UNXMin1B15l7IsdMEOy2sUxfVYpU2ZAwP2glqYjBe2PxCpNq0xlmOr1GpUhml89YHx0ZqAYDYtheJB0RxewIv3xjmtggoniguPoYA3mAiZaFtWZKEnBdUHeAs0unSql76rDselAPy9/eK0DopRPNw5f0LLe9GHk+PGiEpv755ZdFI4yN8sOf6MXCeQpYhS16mHxpGAY7rvWdRkfIiIIS99qtdJXlZ2ZtNLHYvi8aHGI9nORlfADIYTcmgQiTBhjlcpbalkFEsuR75WjUurZBdIwnbvdwGWvmdnjaHEQUxigQoNRHitn1XSlrTv+wlrluu/AQq4Lz4XmDU8lizdq5H4w57CI8OvLywKdG+Wsf9ooFIcXUeRe9VgwtK97/G5cPaSs4DO6iJqRq9Mz89in6xEkqgQDA6HVnBGm70UWQnTV6mx9cYUBz9tFHiFyKvT4D7mHXw6lFWg3clLtJLevH+eN1H0+uEe7bRH+n+UHLl0J7oMuLLNZ+e3+//k/psEXamCuftTCa+b3iYc0NDhySH5VGy+ts5uzBNRMP8WcMjwP2Qfpw6UqTyZ+NJb9R79sJTJ2cKRsIL8G/Gtfa4dL+3oOJ0xjobS0qVPmXzpHIm9z0hCWIbimAXOPkwyDdE5GZQClR2nJzw/lb/Ccp12XGBSEfQp5YdE0xS6047q+mXWnQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(346002)(396003)(39860400002)(136003)(91956017)(66446008)(31696002)(4326008)(2906002)(6506007)(66946007)(64756008)(5660300002)(110136005)(8676002)(6512007)(8936002)(53546011)(66476007)(76116006)(66556008)(316002)(2616005)(86362001)(4744005)(83380400001)(6636002)(26005)(71200400001)(966005)(478600001)(6486002)(122000001)(38100700002)(186003)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWIzaTliYzNaQitTdzNxbDMwQUJ1V2IrWGIxMnhlQnFMbXZkUS9Vb21LeWpi?=
 =?utf-8?B?SmNqWkNVQ2x0Q29xbFBJanExRFlsWExScW5ZL0FuZHQ0RUR0UW1qcUxDWHVT?=
 =?utf-8?B?MWMrWWo0MHM3bzZWNm1ueTd3M2xKR2h1UTZjakMrMU5NSUdYM2kxZE5zcXRz?=
 =?utf-8?B?YmlpNmUvQm96dkFERDV3VlEwTGVBaGZjTUtRZkxvYzNEaEpKREh1OXphVWJP?=
 =?utf-8?B?WGZ3aVV0T252b1J2Q3VEVEU5b3V0VFFDbXdVZVBXME95VjNPNWozc1d4TkdN?=
 =?utf-8?B?T1pqdlkyOGtIVDhoOFlwZnZIUlJuRjZXYlFKcVRCYXNSTTBPd3RmMENjeTU2?=
 =?utf-8?B?amdGV2hiSlU2WkhoalJLaWMwbXBJUnhqemRNRmI3eENhc2JRMENJZXcwblVa?=
 =?utf-8?B?eEk2YmIzMFNqZVh3Q1pibzdaTkpqSG1KcVdzZWZZdzE0WUIvNFNNMnZGM1du?=
 =?utf-8?B?QzVwN1NnTGkyb1N3OWdzdEdER0puZmdVSHF3bVNpd0RNK3dpTE1mYWFTTTRm?=
 =?utf-8?B?VWVDRDQzU1ZEdW81cVpIZ2s1ajVWOHRlVGx4WVpNOUg2b2ZJeEVpL1RqME52?=
 =?utf-8?B?MkN2VndTNTB1RmtJV2dLR2pZd0luTGRnb1JVNzNWQ3JZUW9vRkhCZDFNWndo?=
 =?utf-8?B?cGQyYXBIRzl2WkdiaThLRzRNWTJmZTBaanlMaitIR0VXdGlhUVQydnlxcGpG?=
 =?utf-8?B?ajc3V1lCdEltVVFiVFNSTzA0ekY2Q3lCOURhSFVEVXpIWXhKYUMrTnZWdzVt?=
 =?utf-8?B?MlF1NEhiOVd4TmRRTm5rYlBINmduZ3lYWG1BaG9jM3VSSnMybHRtb1N5YnJq?=
 =?utf-8?B?MVJRV2JWT3RyWEIrVHZueFVYMEhIYURlZWlaVm96bHpTODBMQmhmblhnK0cz?=
 =?utf-8?B?enNJMm9BWUZnOFM5TUJKbGYrTVJEZllxMGU4WGtNS3A1V0RHaS9TMWlUZXE5?=
 =?utf-8?B?MFZCRXZJWEtoZkZaZUI0YUVBdGR4YWRaRFBkcVV3Q0JqZitkdHNuajdzNG9o?=
 =?utf-8?B?WG8yai9MZ1h3UU85M083b1FzK2VWd0J4ZFlBSGJWUi84VkNSM2ZxZDVpUm9K?=
 =?utf-8?B?cWJRNllFRTZ2UVdGVHNxSEw2Sk84dlVTNWt1WlRDS0FuWXpRQ2dQYVFRYUZr?=
 =?utf-8?B?VDRTOGtxVkdlNnJKYjN0UG5NVVBaeCtYREY5LzhFRVJHSXo2MHY5R1R4TFI2?=
 =?utf-8?B?RWFnczk2bVN3UFRTbE82ZnU2MlhpN0hjSGVqNGd6VGVDTFE2eWVwdFR3bU9p?=
 =?utf-8?B?Vmh5UzdZTnMzU1NuUXJocVgrRVRIVjhqSTdZS2hSazVUU0tBZ200TGRzb2x2?=
 =?utf-8?B?N0lEOG4wUUxMbjhQNC82U2htUDlkdWUxaUZDeFZyQ1d0UzhhM0VJRWFab3hr?=
 =?utf-8?B?NXRqd3pOUmJKKzNLSU53azBLSmlzUDdiNmhVRUN4d0dmK1c3TWZWK2hyOGhq?=
 =?utf-8?B?M2dLZDc1S25tcmFPTTU5MkUwenhUaktMK1FVZk5sa0xDc1VPUWNUamlTcGtR?=
 =?utf-8?B?UDB5dUQ3NkdmNVdpWVRpT05kTzNSY01HZ1VuYkljS2Q2eEVIcGdsTFlJdllF?=
 =?utf-8?B?cWhJQ3Mxay9ORWF5Sm5yVG1Sc2wrdWVyb2djWWNEdDVXMUUrS002bDZISWJM?=
 =?utf-8?B?dFFpSjNVVFFTTGZoV08rYllhTWFicThnSTR3YnJrc1RBRUdZQ2RhSWticDgz?=
 =?utf-8?B?YU5ZUG5JU2hGOXNsVmxCMGUyVm5zbXVSTmpZb3NvNnhNWHoxWHd2MFdDdkF5?=
 =?utf-8?Q?u5u4u4amISSvUlEfzc=3D?=
Content-ID: <18C7ECB61211344085B2911E066A277B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c86cc6d-eb8f-465d-5d0f-08d942b57154
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2021 08:42:10.6956 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7kK5Tk9DlRhCvcaptueoJ6hxX/FcgqsTYbr++o/xBJ/1mexmDMJ8jUEsfDMCJLZjw8R991Q2o8JOOsTkLkVQ7IS3n149FxRmRF0+dWwsxVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4697
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_014215_664342_B363E632 
X-CRM114-Status: GOOD (  13.01  )
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

On 08/07/2021 14:39, Bin Meng wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> On Wed, Jun 16, 2021 at 2:02 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> The "clock-frequency" property of cpu nodes isn't required. Drop it.
>>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> ---
>>
>>   arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 5 -----
>>   1 file changed, 5 deletions(-)
>>
> Ping?
Daire can you have a look at this and the other hart/clock related change?
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
