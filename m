Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E1AC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 14:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mb9D9vuLpnQ5OKGYUR4K5qzn6FuTcQaKnt8DE5MuztQ=; b=DgJ1Y1O+e069z6
	h/2v8wInu23dldtwcu1rX8YGs64dHM7OiEy8fD7ECGZM8azwJCAA6Njm3StSd4T8I/ah+mlJ7Y0j9
	LvBIQjwAVWWPdk0Q0R+88dC2AHFpkLjJzsZclugHL6nRzLF2erRREvuIcTAhho5RfQuOyIOVm4e2l
	UVGiRxIGSXLfPw6S0RERvl/qNemDEP9m126YgmGdQOujQH7xeBa0fsIMH2dzE/fWsuVhC9VzyBNZV
	v4FWg/f3QibzzyTVwCe9PhKz2+kphzHI4gGiCfxPR7ZD+NtMO28pixQ81wBCSlIFuHoczD/icU4ge
	NF03p1Mlt8YAwCkcMB1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no4Xt-00Etdz-H6; Mon, 09 May 2022 14:39:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no4Xp-00EtcQ-LH
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 14:39:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1652107169; x=1683643169;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4whDr0HviR+JbcUG0MJrCbuDUtiVSl5deJxlepssbiY=;
 b=WzfKr1FJc+PEiugRo5yCwnbT2svGxaMv8/WV59EH7FQUAO/D9axdC2ne
 SDMmi49i00vPrNd8iM2wOaqNVPivOOKBbsjBsaozF+zt2pOhTZO0Ob9j+
 si/E5EOle3o0mpg7tfFPMr2HHY7pCtLa/RZUdRXj0nhx3r8dcR3MMYAuZ
 XmCeqFmY+wXnDzxgkGSudWbR5hy6xpcuDACSLUHcGAObAZQ0hsl9HPcmL
 zu1c/fBR5p4KIj2u/TX/awWSPdNvL5yzNZPIK+6P6KwlPwelMsRoZ8HQC
 7VtpNKETP0KpZQ6GhFH3HbdUwNkOXIYoybuyk6etE7caSfO9OR8dq3Xkz Q==;
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="158301372"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 May 2022 07:39:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 9 May 2022 07:39:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 9 May 2022 07:39:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZlFp5v4qyvEAp5bCFbNM6E26EkzFyVz3yBW1U3omarGtDqx4SW5LkCL7lT8RguoUe5C3Kcsb0PEUDwp557ENceKrd+nbFmJPiekJEEMiwmP1bNMi2kvwIbDdQXJM6pBXieqcbfrgH/n/D85VIq9QY9bYTBDR2rHEFgHJ/Bg32TKaD4zKy2DThvOaHB7L2xq60pOibquepsCbfIv1eEH8HpONbYg14Hf4FE60HX6ChPPuIEraoTxXB8WFg81pQhTmUnSYZ3FkHyLssrywLj5oJ1u5D01c5yil9qK41tzlaIR139wJc2BGboMWwSnZuzFLGITxIIvLjEmd6PayfOY4aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4whDr0HviR+JbcUG0MJrCbuDUtiVSl5deJxlepssbiY=;
 b=JVMRBKxilF810eYlusUg1g3eKcIcsmxujUWd3zKbqkAR/MHFqgywsqLikihc3/cgRSQ5QQGKM91Wn5pdSyEjD8Z0rCzokTWuA7xkuNncKJfEx1pqc7s5CPTHisdgzWvF7e+4rNr0/WXk7HwdqrYkgrKTg1JN/YH8xQ81jVWjicz/U326JJeiHnKn0GaSaIC9o+/oRv/GNFyKGMTz2uWHTi3bzbk4V9y1MHXwZ/Bpr5YbMYW4UJ9y8Y8gXySiOb2E8qHHw+qRyLNWVgmfAlsRT42gjA64Z6nNuvm/H8/NBh2CZeoGlZoFKAnqUQINmEwGMRxX4njflA+cAhVgAR4yxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4whDr0HviR+JbcUG0MJrCbuDUtiVSl5deJxlepssbiY=;
 b=AxTu/nFfM0TjVhvSBNRKYxWOGt11DyYgDhzLgnXj6RHdfZV68FNw6kk6HRLHMWteF6hLk/cd/48QlFgi3mk7aYzJ/DAFk+Pdhjn/MuP8/VlGPXZTNVTFB3I14OAgAru+dFNEcbdUDdCw7e8h+zjNAkt459YEXVFIlR4eggEZhXM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by BYAPR11MB2583.namprd11.prod.outlook.com (2603:10b6:a02:c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Mon, 9 May
 2022 14:39:13 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::fcd4:8f8a:f0e9:8b18]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::fcd4:8f8a:f0e9:8b18%9]) with mapi id 15.20.5206.025; Mon, 9 May 2022
 14:39:12 +0000
From: <Conor.Dooley@microchip.com>
To: <hch@lst.de>
CC: <sfr@canb.auug.org.au>, <linux-next@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: linux-next: Tree for May 3
Thread-Topic: linux-next: Tree for May 3
Thread-Index: AQHYX5FrH/BqiZa6/06OwkWdFdBwha0Wk2YAgAAKyQCAAAevAA==
Date: Mon, 9 May 2022 14:39:12 +0000
Message-ID: <dd946220-eaf6-773a-06b4-307cda466c9c@microchip.com>
References: <20220503172926.08215c77@canb.auug.org.au>
 <3f94c9a8-c927-5cc0-7d67-4b21c3d9dbaf@microchip.com>
 <9a424be9-380f-f99c-4126-25a00eba0271@microchip.com>
 <20220509141122.GA14555@lst.de>
In-Reply-To: <20220509141122.GA14555@lst.de>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4bf1b162-d1fb-4eff-5ca7-08da31c9af73
x-ms-traffictypediagnostic: BYAPR11MB2583:EE_
x-microsoft-antispam-prvs: <BYAPR11MB25837C25103ACC45F14EC93298C69@BYAPR11MB2583.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B5uJZIg/tjJ458StAGW3xPaJeRKGsR/zs/qxdSP4SNzRidy3gSllBHKM4XzU2Ya32gMUhCz6OQwn4tNPlhLzm6TzgoQX0eT4vQQTTfSI5vwmnDgvlCOh1xobmsTitBxaiCSR58TZRWZcME2d4AyUY3meFYT9fMOICLnFZM0MKGilFbLQt5awcrsBTGf3IrAdFCfCjx/IFWZ0hO1K4teDwN8aDVn9dvwaatr+KGDOyoDdsjGEoI3+bG0b/NxpzTNMFOA7SDuo2FUMBiB8MDO4GN36cofKs1EMud/2ZpeZTEIlx6dVmjac6iMfwFIjXZmCxQlhLKpyuJNrBi0t2OPTFL3ig1/DX6saHcMbGSs6v6b2wjEB9JzvjvDpJl853v9WhF2llpQV1C9IDp57exEjCFAx317oD2INTFsO/7PY8gxm7XboNh9UyQCEsnoHchMNvai5Scc9zrwOcRnkwjdEAsBYj9uSdGRmKKf2Dh2qTGTAIQl/lBGiIfr3EymFPUPrdW4ZDaZAzPXIG0EVTY6VpHOHy61PsJiqB8pnrm+Idq7ggufpxbX7yRTtyUulsiFoVV7RK5CqVwCjiwiRpwtnoGJ0/RLoZQm500QZwSX3pDgpn2ku6ftB87OfN2/+PDh6MxBIkNLF5oW7is1Q8i76W+vcRQjfSuGY0BU/R4BERjmeQf5p4RzH5/AP5jzevHhJc8PuPRzutEQfNbM6o5P/5vygqsdn9SxaLifaZZS1UP5IgzblF3V0DeOMjI+ZVMDWoSjodDWaO++7C9Fb4pfBXw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(186003)(6512007)(31696002)(5660300002)(38100700002)(2616005)(26005)(8936002)(122000001)(83380400001)(64756008)(66946007)(8676002)(38070700005)(66476007)(66446008)(66556008)(2906002)(76116006)(91956017)(4326008)(6486002)(6506007)(71200400001)(31686004)(6916009)(508600001)(54906003)(36756003)(53546011)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NlQ5R3VmYWdFMFBZY0dVZXQ5L1RoL2N0QVQyc2pzZDhVMU1HYkV4MjVJSEJV?=
 =?utf-8?B?MnIweHBWZnZmeS9TQ0ROS0RIZ0dOTHBEZEpjZVJoSVpka2ZTcFlOTU1sYnAx?=
 =?utf-8?B?K0dJSEwyRzZ4YXZzRzQzZm85ckRmSHNNbXZZWEtWa1BHajRGdmRKR2RFZ2VT?=
 =?utf-8?B?cXFEZEdhbUIzU1ZWVDliMVNwVVU2ZHRGVWppYWhPRzYrUFlxTWhiOVZxV2c2?=
 =?utf-8?B?ajdIcXhkL0R1eDRBalIzem1WdGUwNytydDU4MWttK2hVTkFXSUZKZVllZzhJ?=
 =?utf-8?B?RDc4YzUrbmU3eldxTUlTSS9jMVJwSzJpeE1WdW5NMUJkZmlxVFNTUDduV2tC?=
 =?utf-8?B?N1Q4aTdPcFlzME1RcHB2bnMyYlpONFlIdVlmZFhjUElqNFhKdElKRjllcHdE?=
 =?utf-8?B?TjR1R0hKUE9sbEU5cnF4ekhCcEF3dytQRi9wWTZKN2tVRVpBSlNxbU93UVo1?=
 =?utf-8?B?TnVwaG94R0gvYzZ5QnNpQnhWWTNRSFBPbDh0WXUzcTg2b1Vlekw5bEdYd3la?=
 =?utf-8?B?VlJqdXg1QWtVYnlFQlBXSDZEU1RhNksyWVBqdCtyWmdCUytab1J4VmhxTzQx?=
 =?utf-8?B?Y1V2MnB6WXpaTndhUmZBVG5ENGRPVlZVaFNHTUJvaTF1WmFTS1pzNVhxSUts?=
 =?utf-8?B?QnBHOSsrM2o5TFhyYTNVdGh3Q2hjSXFRNmpkN3VWZmhvNHl2OU1XemlqVnVP?=
 =?utf-8?B?U1p2K2RoRitGVG5lRkFYV3NRTWgzbkhzUmVxajZ3WjM0MGJaYkZFU3UxU2Y5?=
 =?utf-8?B?RlFZN1JVN1JEZC9KQWFjWnY1Z1dMamorU2FhTWNGSVNDUXJGNWs4bTVQME4y?=
 =?utf-8?B?M2V6T0hncEI5VDErMmpGMUNFVzhNWk1ENUh4cjlZbVJqUWQ4Vm9UdHJWWW83?=
 =?utf-8?B?WlR0UW56SUpzN0RxS0RWZGk5cWp6eWh4VjJtaVNtdGJNMURxZUhGbDEwSlBt?=
 =?utf-8?B?ZGdhQXFHSkxHdUphWkVwbFJhQ25Ec01uUlVuaFgzUXlmOGlhSzlMdmxDRE1D?=
 =?utf-8?B?RUxNT29LUGtsVHVMMk41TTZtN1RERElMQ2g0bHBMVW5uMGtWMEVwNHF1eFBX?=
 =?utf-8?B?Q2NvRVVCRmlGSkFsczFKeUFhcDF2dXN2OElJbGdKN3BETGpLS1NOMkFaUEE3?=
 =?utf-8?B?YVZJcHFFdGpMaW9aNnkyb2tsQmVCeGFBUTlENDJGbmRCVkh1d3dFMzZBdE9o?=
 =?utf-8?B?UkxreDl1M2h1aDJudXJqS2wwT2JOUHBUeElKRDN2TWpqWG51Q0tlZW1QWjVz?=
 =?utf-8?B?RWt3ZEdTbkVhVHhBa0UyRTh5S1VKUkxYbEo5YmV6M3J1Tit0U2FWMkFmMEps?=
 =?utf-8?B?NFVNSE5STGpsWXlPSnpHcTg4OTdhMlROT3RtemR6aTVBSEhzQkh4VWc5SW5k?=
 =?utf-8?B?UklDaDlQSmZMdDY5MnJteS9VdURReEZSVzZmcml2cXdOdnNIRWdSb2pkV0pQ?=
 =?utf-8?B?UTA5QXpOenlMbFloa2IvZ0JYZWpaK2F1WGNvTTdTRTRmbHU4b0V4b2FQQXVD?=
 =?utf-8?B?V3NIdm9LNUlvK0EyR2hOc3hqN0d4dURtcXpNQURYVTRiT0dXTFJvVFJCVEdK?=
 =?utf-8?B?OVlNNkVYUzl6QXd1MURTWTdMN21TNE9wSU1lVmV5Ym40SnhFek85U0d3bFhF?=
 =?utf-8?B?UlNHTy9nQ0tUUHB2R3Q2eTY5bnk5eCs3NGh4ekFJVW0wVEY3YlJucE1nQW1y?=
 =?utf-8?B?a0J0cmxwaDVFQUNLOXBNOXpPT0lEVThENkViL1BEOG1jMGp5enBQOVNMOEV0?=
 =?utf-8?B?ZllQVS9MbitUbzJsUk9qNWZaOHVrMFZUNUtxK1FrMTE5T0lFMDVqMXNWcmFn?=
 =?utf-8?B?OWhoVk5YQktUUDBRakJCWDcvR3lTWStzRlYzM3JGSkpwSUt5eUVxNVpTWGxT?=
 =?utf-8?B?cVBEVklML0p4SkZvNGQ2dzUvVjlqRUtubkJpaSsrb25OMEc4RTNmMkVUZG5W?=
 =?utf-8?B?QjNYaTZHTXZTZlZTUzB0UExGM0xCd202Mm11ai9hM2hHVDVVWnNVNE9nZWdw?=
 =?utf-8?B?d0ZaU3BxNCtXLy9mN0ZXVlRwdFVxVVRoYmcrT0hjdzlNeXhRMFF2ZWNTd2N5?=
 =?utf-8?B?SHl6cXFQbFA0c2pJa0JKSENJcVFqVGtEVmlDd05aWHhsdUR4MHNDUHdNd3ZU?=
 =?utf-8?B?QnhzMDBWRFBXamxQZTlwL0Q3VXpnV09mSG5rcHZaUFFUeVlPZVZCVmZUNDd5?=
 =?utf-8?B?MlNmWEw4SjVUdkdKQ2ZuZmJXQ29uK011eG5hVEU2UitHWDRCQklXTzl0T0sr?=
 =?utf-8?B?V2pLUmE1bW8yWlFTR0lWbUdRZEhieTBaNVFwM1pvd29zL3VkYWEwZWttVDBZ?=
 =?utf-8?B?d2Z3Z3BuZlhlS25UbkVnYnppOGNHZmZ2c2liTmZvZFV5Y0g2RUtRRXRLaEhx?=
 =?utf-8?Q?EC9CWF4m76ibBdhU=3D?=
Content-ID: <625D63939E74D84D9B160137FAA887A2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf1b162-d1fb-4eff-5ca7-08da31c9af73
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 14:39:12.7482 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ltml/9Q8JiXp0uedwGyvD3STWfzzIgtP0T85m67s/l1ahOoBZvnECKD2V9LeYqhha5MK8wBEuCB/4pPx+4WxWt72YDb+azlosCOWpRlADdo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2583
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_073929_800560_34A12890 
X-CRM114-Status: GOOD (  21.48  )
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

On 09/05/2022 15:11, Christoph Hellwig wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Mon, May 09, 2022 at 01:33:07PM +0000, Conor.Dooley@microchip.com wrote:
>> @Christoph, I know /nothing/ about swiotlb, so if you have any
>> suggestions for debugging that you would like me to try, let me
>> know please.
> 
> Hi Conor,
> 
> sorry for dropping this on the flor.  I was at LSF/MM least week and
> my plan to go through my backlog today didn't go to plan as I unepectedly
> spent half the day at doctors appointments.

Ye, no worries. Such is life.

> The commit looks like a somewhat unusual culprit for a boot failure,
> so any chance you could do another manual verifiation pass where
> you checkout 6424e31b1c05 and then the commit before it (i.e. as
> git checkout 6424e31b1c05^) to make sure it really is this commits?

I reverted that commit & that was sufficient to boot again. I'll give
that a go, but it might be tomorrow morning before I get there.

> Some of the commits around it just seems like more likely culprits to
> me, so I'd like to really be 100% sure here.  In the meantime I'll
> look through the patch.

Sure, I can have a poke around the commits in that area some more.

> Also you don't happen to have earlycon support
> on this plaform to see if there are any interesting messages on the
> serial console?

Aye, I should've done that in the beginning... I'll let you know.

Thanks,
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
