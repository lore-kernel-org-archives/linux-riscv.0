Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC40C43334
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 10:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lHNH0hwEbL9nKLI5hMFK1FSDZYtMzEXryGwNHHD4RaE=; b=Y1O/anp8dSgRq2
	3S6U1gvfxNKRuncOf1ZaViGrEIfhyeVSLARLbXbZKrGL1WUXm3QL58qwrPN+EhsIdV2BKMiW7H5K0
	xXgBjJDup3XFbUY4oj4HegfvrXxqCRLUZ06HgI7R+WlKVP0c7QTMs8s2gFcOY3UGkcNAfoT+8pZiN
	5PoJremC2Hp0dvCNfbY/FMoFBaT9F4jJWzaSfOOQUyZl1rBuRpcSzMtdLtUFbLPMHzsInwAZOx182
	1OrvUyqMrby05q1FzrVyaX6SQDwreQkyl53NoQl//xkLdGAJKN6fSK9Y648ii06guhnuXgGY5K7NR
	wesf4WJ2+lwa5f8mBNUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o92cS-008s2e-K0; Wed, 06 Jul 2022 10:50:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o92cO-008rx5-Tl
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 10:50:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657104652; x=1688640652;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=n4pwEdaFsdFt5IlYS0IIQCwu03O7gbXNN1Oa346+NyA=;
  b=ln3IDakJMyJrcyvw2e8+n4gxe+cZf5S6+YDxP/87yIZg97XAAQlGcQas
   h6df/gMs/PSGGvFFwieS63ku7Cr3ZtBKd8TJWstD7wCBOYXf05qFHmJ5Q
   fj2WR3N6u+SNTsYuBVIqBHboxRc/yXZetucoe3BmZqXfizvn/tmErBSr2
   6PIU7hGtz4+vGFk2kNqmLZMFnXfhPtRFSFBrlsoOhnJ93PHh9zuZuKR9M
   kyRpQKnCeuQ6FLh0ypInwSXtIU1skXGudcef7Ya/tTkbvwrmgfSbXlayU
   +a4xW0zBU6n4tcvlQnxxHur+XDsbTjnat0CHWf0OOPxWykiXwbtyCfYAp
   g==;
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="103260395"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jul 2022 03:50:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 6 Jul 2022 03:50:50 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 6 Jul 2022 03:50:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTWidL2SCEOVEKwF9mHX4bXEJgD4Qog+otgUnTVLd3FBUrb42oVDSjK9KMmm1jUGl0DCEY38Qqe5WlHUYHFp3x6OLLZNqVHJ8Hf6PL/lwR1kEC2NAgtw2BcIHMlMDeclArbqT11mKcjhkjFF9RGfDs94hUOGQ1wBGIx8RbB0iWjzvUzDjJBfJPMZ7X7PX7yfrsHt3H9prROpmIFdeQzLqRm16xG5AqzRaPmUR9kDM8/UdojwhrDSu/Cua4QdeuyNx3EcZmhAXp2u807c2k1TqrJ0POf4zLkabnMzqS7i6br0Wg24Nw+u7kQjfUnHnc6YJxtV+u0hn2YpZVC8ej/4qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4pwEdaFsdFt5IlYS0IIQCwu03O7gbXNN1Oa346+NyA=;
 b=CLzYIsA8qWEcxnL7/3YvKnluTl9KoagS7qajBhrtzEx8eM/AD3yJBRX6MQBS+tiwFmMi1fvEg8WcGF16iuWo7yee+g3DPYs5Ol6e2oaCtCr9yb6Uq6LHwWp62KtHRttMB2EYNNXej8FVad+jdZF5FlOcmZ7jSEhfnJ4jmc5PL0rQqk2cbX0c/4Uw7crGjw3JyPJxhfmzDt40XGM62qmvyuT8RPWrNX8Ma7caBcID1ZGd94Ghs7trBQdFjH4Il1VZZXFo57YjNDQbZEi8X5cmF48+LZ9x+1XmeX3kvqIiMXdrpkpeYbkTIn9GL+/mA4PHd98zjg4ovZcKvh1LsBqgMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4pwEdaFsdFt5IlYS0IIQCwu03O7gbXNN1Oa346+NyA=;
 b=PUP6+DxBwHmiMti1bDX84YSt7xAuoLXFX7RJdpJRapOOWh/T12GKX4mfXSKtaUZKldN5uDe6TNLUDAGpUWuklgrnqIhORyxEDxRE4tpzBYdrVUHxAl1qtI88m8I1yWHGek3VJas8J+egl8CQiCSJia/2nlb3nnn3Q0Q82uwE53I=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 6 Jul
 2022 10:50:44 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69%8]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 10:50:44 +0000
From: <Conor.Dooley@microchip.com>
To: <wsa@kernel.org>, <Conor.Dooley@microchip.com>,
	<linux-i2c@vger.kernel.org>, <ben.dooks@codethink.co.uk>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<Daire.McNamara@microchip.com>
Subject: Re: [PATCH v6 1/2] i2c: add support for microchip fpga i2c
 controllers
Thread-Topic: [PATCH v6 1/2] i2c: add support for microchip fpga i2c
 controllers
Thread-Index: AQHYhULLtFIyC/B0MkaOYq8wqk68lK1xBuUAgAAMVoCAACm4AIAABQaA
Date: Wed, 6 Jul 2022 10:50:44 +0000
Message-ID: <3b2ac34b-7da4-9714-eb65-d62f900c6679@microchip.com>
References: <20220621074238.957177-1-conor.dooley@microchip.com>
 <YsU3eLA3PrceFS65@shikoro>
 <ac070176-93b9-3bc4-5589-ec57d4d38af4@microchip.com>
 <YsVk0Gg1x7juHcZU@shikoro>
In-Reply-To: <YsVk0Gg1x7juHcZU@shikoro>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eba79f0d-97d1-43ba-b493-08da5f3d6099
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O5huBR0fqoVQ3IGUvU99iZblm4TPXcandTRwvWFqRJY/XCvTcJQkTdEvbIeLyKKMV8t7seCFQnH9I7pOIT1hZl89uSNA0j6s/wA0Qv3WU6cR0U/byvdhV1+Xs8UDBp0IspIbD3Pl7RDD9D2nf9h9k8X8SD8l2GwCkVbAcbfRPjYl1kq2V6rwOItml7OpKfJajqg9fw2MjxKRKZqRDIv3qbxMLvibL25mMX3ky4jJvOMM51y+GeGTsPYxj6w4sbPvs5o5E1lR/S+yLXpN91ejLT9Xrj0Nnv4SoBlcmnGbbQQx+y20fONmUmuUeKmcgQDW3zC4LN4Wamm9Cl5E9Ztm4Eb8lXeLhTD7qvRFjj9KNN3Q6RbAG9taW6yHwy568I4AwLHm4bbtM2FNAs/SVwGeYPTSrn9oryB5NeL+1VAW4JRPhmzcACwuA9Cx8ctXyRvhk91KeU9Z0x7fbOqE137X+MxoQEEaO/4xELjTNSRmUYBvIlk6Rv4ah/kJLrOwcUhyKRdZVaLz8/6aGw1slZefwEXUvuN383WuhWoM26Kq2cnqhnK2FFhOSCuLaKMXLFnma3N8Ncn/YDymD5HVomZzCWXRXEXPMU8u1knVwU5v1TnA7oa34MaA+9dxYq+W8zvqFUVJiaU00noPK0BEO0QUh3SYP1vN4pUm1lHT4tDhkzA0NcCAqR3DP4zJFp7hpUC/lBddCFJCz6cetBCELKFWe5JFEKBvif6TnhVyhddpfi4yn6dDizJVtNH6+wx2WMHVHiSVLoDrk/qAylK5/xgAgbkY/Pg5aTRzE1cc+WuxswM7MUAGR35ANWcoMpUHZWYbXyXnlNtQv3fnI4q2y7wSDZ+OmGfZm7Qb822349ngf4AG9AVErT6lkPAydMzpNIMQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5160.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(346002)(376002)(366004)(136003)(8936002)(41300700001)(71200400001)(478600001)(31696002)(86362001)(6486002)(5660300002)(2906002)(38100700002)(316002)(91956017)(2616005)(36756003)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(186003)(8676002)(83380400001)(122000001)(53546011)(6506007)(38070700005)(31686004)(26005)(110136005)(6512007)(6636002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YTdkc0x5c1pPaStWL2NMa0E4cEZQMGFLd2E1SkFadEYxV1ZBMG9IQ0pQM00w?=
 =?utf-8?B?dDVsZmpQRzVnbEdzR0Q1aXp0OHZ4NFZsSXpSOE0vYnF6N3Q0d3YwVlJJRlp3?=
 =?utf-8?B?WEZ1enF4Y0owRVZreStWNnRsZEJnYlprbGdkQzc4MTRLQklSZ1hrNWhuS0Qz?=
 =?utf-8?B?eG9IcEhtR25NdVFxVXdaeUtTd1o3MmFndzU5cStlVytZVllFU1pZQzl0aTFN?=
 =?utf-8?B?cUJjemhpN1ZLM3Y1N2k5QVI3ekFwNFdjS09ncnVjSWhzZzZKUEV3QlB0QUlD?=
 =?utf-8?B?bUE2K0s3RXQ4d20vWndJVDhxRlFVZG04S2pybDJOUUp6QVIxckVPYTA0UW1l?=
 =?utf-8?B?dkxpeW5LSzNSU0o5Tit4VmFsMGlScDdFanppcittWGNWeVFoN3JFNTRONGVa?=
 =?utf-8?B?YTBONE9PNkpyTW9QVytGZ2JOaWdteGNiQm94TVorT0ZVT3JWSHR6dVNpMGxu?=
 =?utf-8?B?Z2czUzJrT2Jqc0JLc0FqL3dYamZ6bXVqZFA1bkxWZitOU09oWlJIOTJQaFMw?=
 =?utf-8?B?RDE3a1V2SVFoaXpsQ2NvUmY4WklJVGdDT2xaOFZFZUdpUG5pSVlmRHAzUVVC?=
 =?utf-8?B?T1o3aU9pR1hBR1pqaStlOTd5YnkyWDdUY1ZpVmFxMVZzRXBMYWxhMHg2ZUZz?=
 =?utf-8?B?MHlOMnZhWkZNUndzU3RacXl0bW9hQzF3ZEhmK0ZxSmtlKzJoQWUyd2dvNEJj?=
 =?utf-8?B?b2lXakVoT2NPU3piQ0dyTzRmMGtjaStSY2IrdmQ4RHgyLzlUS0FpbDBFekl6?=
 =?utf-8?B?WW5taldrTHp3WFdaUXJDeDFxM0ZDR0doeG1ZSlZMQVVEclNpNWhmaUFiS0sr?=
 =?utf-8?B?bCtSbHRWVkd6VTA1Ui95SU5CbFdINjROMk1EekNjeHp6cHFtN2VFdHBzelRv?=
 =?utf-8?B?N3BCcVYyWHlOSmMvNlVPNWtObEFIKzhmbHdodzlWdi9HMzVaUmR4SCtyVFV0?=
 =?utf-8?B?L0pMVWw4Wm53cmN2MTFNd2diSUdVSzRiTXhUT2RtenlrYzZ6cFFnNE5qaTZq?=
 =?utf-8?B?ajhieGdraUxRN3prMStCOWFVVGZ2UDRUR0NGaUtPcFdzQnpKYTduZllVMHhK?=
 =?utf-8?B?U3YxZXUrOFFnakdhMWFid0taeCsyMkU0eVozczZZVDBjMkRIRG44ZXhMRS9s?=
 =?utf-8?B?WVFDQ1RQZlQzQkJFWlJjbHJQL2RYZEtrblVwNGFyV25nWFJnRzRDTkhHUEFV?=
 =?utf-8?B?R1lpQ1ptNkYwYml2aExyR1J2M2p0NGtra3JhU3FyQ2M1ZU5CL1VyN1hrTEVN?=
 =?utf-8?B?Znd1RjBxVUFBWW9BN1ZhRFFBRC81VXJUS1pQNkZhQkRoc0huWC9CNGlIUEEy?=
 =?utf-8?B?OFdac2ZyTERPYm55SlF6TGY1bzMrbnRGM1pJMjVNdmFtNVpTbFg4bS9URW1M?=
 =?utf-8?B?Tlp3VFR5cW1VMTJwcW81cWo5bGlNbUphT0l1VVdCblpNUXUzVDJNcno0WkVD?=
 =?utf-8?B?TndTck9JaWtmNU5vQzJqMjVLTW9aVlM3S1I1d3B5WjdEOFZidkRTczJMSDZY?=
 =?utf-8?B?WTBLV0dZM0o0VERUTnJQVU9DUG80Y0xhaUErZlQxeUJpRUdCNlRzZ25HM01m?=
 =?utf-8?B?VXdENXh6TERRd1Fzb1NrVlNHYU9QRW5FemUvODZBZFVZODNnT0lOQ0Fxb2FU?=
 =?utf-8?B?enU2RHpKUmFKUmc3WkJoL1Y1b0tHbUF2bmFUQjQrc3JCYkdXMmJaVWdIckVJ?=
 =?utf-8?B?UmlxNk14azZkdUZSUWdVV3UzZ3ZUTEJWYTZoWDFLa0F3U08yV0xTMFordG5W?=
 =?utf-8?B?ZmIvVXNMalFscjZobkVPVzlmUjlLWHFnTUExb2oxRDZESmRJcjFqSFh3R2xF?=
 =?utf-8?B?Qkt1MmIxejZmaDNJSlJqeTg5VWczWVVtTlZCUVFyMHJ5TlZVSlB5NkFMYmtk?=
 =?utf-8?B?RzdMQVpHbFo5a1doMHllVWxxbG02TkVNWnhTYTV3Z0VJWkxlY0s2V2Q2Tkxh?=
 =?utf-8?B?ODRTblBwbWY0L1lRVU03VHhnZ0FiTGJUYStpRTBNOGZ5S1puYitDaiszNm5J?=
 =?utf-8?B?djQ2R1V4K3poUDdPUjJiSjdjQVp0bUdNMnVIYnhKSU16eUZoRThMREpmZkhL?=
 =?utf-8?B?TTdvWDhyTlZBVHhuNVQySDNyTytiOUM0d3RTZExVdWo1UUlyVGNzdTlVOHN0?=
 =?utf-8?Q?OGie1vn1fFFxPGC56sm7MpNRI?=
Content-ID: <E15AE7D3C29EB64094189CC352097908@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eba79f0d-97d1-43ba-b493-08da5f3d6099
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2022 10:50:44.4207
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: twlKsq3WN0y45yVHlyCmyS/uCtdW42VV3HMhaiAutQHRaG9XPyIVXGszu/P6WfRrqXkQLWjdDD8dA1YKWpCWnF2koUEj7eQ2q4aTdyvXWbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5963
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_035053_110310_A4B7BDF1 
X-CRM114-Status: GOOD (  15.81  )
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



On 06/07/2022 11:32, Wolfram Sang wrote:
> Where are the bindings? Are they already on the way upstream?

Already upstream.
Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml

> 
>> I'd prefer the latter. Being called "core" is unfortunate and I
>> did think about that. i2c-microchip-corei2c would have been my
>> first choice but I thought the double usage of i2c would've been
>> disapproved of haha
> 
> :) Well, double "i2c" is not exactly pretty but since it is the name of
> that IP core...

Yeah, and it is the name of /all/ the IP cores we have (:

> 
>>>> +		if (idev->msg_len <= 0)
>>>> +			finished = true;
>>>
>>> How can it happen that len is < 0? Wouldn't that be an error case?
> 
> Is it to be on the safe side?

Ahh sorry, I missed that. msg_len is a u16 so cannot be <0
I'll change it.

> 
>>> Have you testes SMBUS_QUICK as well?
>>
>> Not specifically SMBUS_QUICK, but I did test with hardware
>> that uses "zero-length" messages.
> 
> Good!
> 
>> Thanks for the review :)
> 
> You are welcome.
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
