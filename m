Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BD2C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Nov 2022 09:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQzp56rAgzIMtl/EOWmQeX4JkH1Ivdu7EHLKRZQ06Co=; b=D0e7NcHQ2JfuPt
	CqM9x07vHoo64j/5LygQyQynCcukLtNnqg6CRKFaAJcatX8oIQBTNveB+TSN7uJYC388Cq06SZUev
	46BpQofht3176mKTR2vOWDzw331EZq773lwOxKc6G4+4D4WPIhjl1TV9Mrj2bgRXcfTVcXCG4Gsqi
	nQ2/pa6oGs51fvF1ZQaB5kXdABkklgy7Bm6QXuYmHxz4hJAL7kbneTE+RLEC9/31N7j6uIBpCpy35
	I3TrbVu73YrItV/jls6MYFcsM8SjHiRJg7RYlosB5wWpA1cAHN1o6Ja8C3oCgDPGgLc7yaH1nl5N1
	8euIqTpkkj1iYbxySQTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot41j-004jAP-Sm; Thu, 10 Nov 2022 09:39:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot41f-004j5D-7c
	for linux-riscv@lists.infradead.org; Thu, 10 Nov 2022 09:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668073151; x=1699609151;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=lOcCbMRWAREah/KLbX+du82hMqVpjrIGFLm3gi2ztY0=;
  b=rBbsNyXTxpGo83Ag943XvosImceUj95svxQKdBmSoupEt/IhJC9vvnA1
   /ZE8z8Ppm7u9hECzqvPCFwRV/nGrS/RvvZiosUs8Vpg+cWjhkrxOJk8Ey
   VudN7KHZ0n4TYQzFkfIG0ljj4vBVLj09X9LMspPtgqxH7WBJLX2/fwswi
   9Tt3jUztpa69f/1MsyeZcLgA8aWM+31zgcYA8rTCA8qzCCHncAfKADHSM
   l2RiLnJJmrztoMTERPe2R0FYhULDdxl97n43E5uvPUTlv6kJY0k4ms5VN
   ppUx4i+GevKj+x2MxNuIH0UMOIvT5rl8vydUntH93O2E1sxeFxDErhQNu
   w==;
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; 
   d="scan'208";a="186294333"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Nov 2022 02:39:04 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 10 Nov 2022 02:39:02 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Thu, 10 Nov 2022 02:39:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TfyIIlMomH9lQ4CBvmR1xJb8SFQ0hBjxyI51TyW7zfU9orHVuqmYS8LRalRbEG4Lfq12NXFBD/+yGw09UK9I33YWNsyZ86ON0bBnY7mbBKYbEMfQwyM3OAU1sGFmMju3iJ+Y6LEVqCQhZAsmaVKW6l1aY9DoksaCWQfpZ50hUW9Rjq6u8W09CQw+EpOQJKa+Gx6aMP9+ien3WMKWuANIxK6ohv75xih/FGIFZrz8asXuT46GpbY6k7B1OjYjSN+HSguvMzVG2gQdP23qSqLEM6qrSR7qT2YvbAk6g7eRtg4raer1wvcQmY5ANhkTu+LuMI7iOwhbvvhvkzoHJi5bww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOcCbMRWAREah/KLbX+du82hMqVpjrIGFLm3gi2ztY0=;
 b=AtDvl9LNfqQHK5+l9TcQsBcKYHQN3vrgEUKLcU46+NPxIs0jiv0douK3NjVrz+IBNqQ9FT9x8wj7qtTcySRVGB/HirCXWZr7BSVaPokdqmyyD8F83Vi7c9ELRuPFlt61RmFVEUtuiMg4822d/eWBxgZ+vPcDixpG6YSlgtCFZz0YR5p/9yk1BjZIj+Ag5HDI8l5JIsy+x27O32nr15h4gKf0OlepH3JzxfqlQTfeZO4/9mCblyndcAoyHxpCrSIMdALjGKzkWb1EuGGbX1aQ2OQnlhEqfAvatyw6AO3EtVoPMrHgcoINQtKQKnNuAQMbby3S3Shbew/8ObMOzcoHcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOcCbMRWAREah/KLbX+du82hMqVpjrIGFLm3gi2ztY0=;
 b=pvIuVvFrKW0NelO/j5fvIddoKtC0Ny3IkWW5x2fhZs1j67okUQN9IVHCSo+i8/pH7lEErIT216dNkidnUIU4gNnvbsYyRDUeqsaBa7LjouVqsLW2grjWZvB09/UTFnHm1QPG8fz4mZqCDEXkZ3Vu+TORV7kjAtD7O22EhGSIZ7A=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by PH7PR11MB7052.namprd11.prod.outlook.com (2603:10b6:510:20f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Thu, 10 Nov
 2022 09:38:57 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::6a0a:e787:bf0d:83cf]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::6a0a:e787:bf0d:83cf%7]) with mapi id 15.20.5813.013; Thu, 10 Nov 2022
 09:38:57 +0000
From: <Conor.Dooley@microchip.com>
To: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>
CC: <Daire.McNamara@microchip.com>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v12 0/2] Hey Uwe, all,
Thread-Topic: [PATCH v12 0/2] Hey Uwe, all,
Thread-Index: AQHY9OfkFWUJg6/zjUeAFym2Fz0Qaa435qGA
Date: Thu, 10 Nov 2022 09:38:57 +0000
Message-ID: <054e6972-e6b6-7075-5f20-9d005ef81020@microchip.com>
References: <20221110093512.333881-1-conor.dooley@microchip.com>
In-Reply-To: <20221110093512.333881-1-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|PH7PR11MB7052:EE_
x-ms-office365-filtering-correlation-id: e6aa856c-86aa-4c2a-c76d-08dac2ff63fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aMk57QgcWp5BZAERESv+o226fgR6GzvS/DzgA4DvuSbZa7bQz20sI40gRwB3fqrzH5BWLFKmy+/aac2oeC9U5bpI8AWp7uqjl4fdaBmLY+iecTtXnosiwOzHur3s9zxcxvqykqZ6PmsGH8tOvXt3+Qvr6Q34g7/dBE9/IToT94hZvaLq+cUERYt/eQefISmdoSTl9b7/k3vfvvwokskHQII9ZgET4kaJ9Ux+sfXJZte06PsmFbqIn0G6V5DBDIlQMlUxixtOop0eiVY18thXKO9C5PhfFGFgKllLDtjZUjC6YVHeJqo/NQDJrWIvIJUCwjligHf4h8C3R4DKcpPW18O63ieYk90aYmmWMHURLk6uhPCje6uT4sEfOviYMboUDKW/DlxSiCs/hkYzpiR1uHdFWhF+3vmNAokYyXDNcS0OImgEXuHASMhtLDCfKIWA/wggaLcGAv4/6OwmeJaTg6HOcW8w9WAZ7PxVpMyAka5FJQIYNJi1KKTZluDm9hO2XrkdTHNULv7Xnprrv8D4XV0awyx0iEc2feOs9SDUmQjDdcYCeSKX47RyWqA1J9Gsu4frFwyQszcOWavbVy75FoVDEDzA/UnLBQRANpppWEi+l5uq8V4yrGOJ7cszVKeeKuPJkJlSBnIzTIbZjVReeo12PJBE5NHrE1z+QCI2hSr3XDBmyUIKweonmSivcub1I43h8R6sv3kXNsPbYBmpu3HMnVauqwmsqGt/jlxWFnhlGp7WGc5KStXlpeCJzjbYJsN7qpOwlZ0hktd7jFat+eOv3t4p7ej6E5D6x0i4e559xJn8a3zjBs9IA8JCUgj4+QTbAL1Fa7kwkDWnQ8T2/Zl/keKR0GT72ytzSUaUr6LP1D6wVLigD9gfXksChSJF+cxCMXJsqs98eFR2989dCg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(346002)(39860400002)(376002)(136003)(451199015)(6512007)(41300700001)(26005)(66476007)(76116006)(6506007)(8936002)(64756008)(8676002)(66446008)(91956017)(66946007)(66556008)(36756003)(53546011)(4326008)(2616005)(38070700005)(122000001)(38100700002)(83380400001)(2906002)(5660300002)(86362001)(186003)(31696002)(71200400001)(31686004)(6486002)(966005)(478600001)(54906003)(316002)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzYvcUIydTkwV1FIWUg5c1BWc2s2MGNhaU1pTkR6YlBxTm4wU0N2bzJKWEpQ?=
 =?utf-8?B?WHV5SzZJYXU3cFpsa0Z5SE9yalRCYkFDdG1aRFhhMmkrdHBPdGlFYzhaOXNW?=
 =?utf-8?B?QlFGc0diQnBHaXBwQWVRcmxXRjZoNkpPdHZOa255US9XemtiNUJiWDc1WTkr?=
 =?utf-8?B?OGV1WEpncUtuRzNDVnhrWW9ZVjNLL3JxOENDL0lMMERMSUdIUk9sWThSVEIv?=
 =?utf-8?B?Tk9Kd3BSNFkyZGpWUG9kOGZIWUc0dDBLOUw5eHNBVys1TVpJVEZvN3haZm5E?=
 =?utf-8?B?YVlmSUN0eUFhWkxQcTlOZHZ3VUcyczVSYWZoeFlJVWw3K2ttNkdmOWJENFFL?=
 =?utf-8?B?a1V6Vm1md0JtUzMrVHpINTNjNkhkUVVjbU5OYkthbWZIQ1YxWGVpZjEwdkVS?=
 =?utf-8?B?SVZNZU1YdVk1ZXJzL0kwczBEV2VnR29oZFZPT2oyZjcydHJUQ3o0a3h1K1Er?=
 =?utf-8?B?NkpiWWIwWWQxZ1kvRmt1blNWaGFSOGRvTEM3bHUvMVVpRnZmdStDTjR0bFZn?=
 =?utf-8?B?M0trU1ZvYlhHRGI5YlRoNExlb05lRmRlMzd0VmNrRVI3cDNPMFdGYzZlYkc0?=
 =?utf-8?B?M290ZE9sUGFxWkkzM2ljc01EVWpTd21pb215UzNsRzFRZFdWYzB3RGhrKzBj?=
 =?utf-8?B?dDhNTnR3eHh5NWhBeXArbzB2c1F0Qnl2dWNWVHN0NmpBN1V4NkdNaktxNzNa?=
 =?utf-8?B?aWZpcmd1dkk4VEkrbURYU1p3Z0tka0ptaitFWHNhdnRIMVhEVExUMVdXeGNF?=
 =?utf-8?B?T3J2Y0ZKWllQdlB3OUprdHA4RGVpbGhZeUc0a2NoNS81V3pWWmxkSkNTQ241?=
 =?utf-8?B?OExTejRnelU1TlA0SVJzN3ZuWEc5SVNtdHBsclhaL2U4WFVnNVVqWnBRVHRm?=
 =?utf-8?B?OTM3d0RjQW1UOFhBdHFSempSNjJLK1BscWh4M3oxSWZOcVFMem5hQVM2V001?=
 =?utf-8?B?SEpHaW01TS83a2FqVGljeDhLWHViQmhOUDlSb3BBODdEYmFzYmpsSG1WaHVl?=
 =?utf-8?B?NmUrdVBYMDhzRzVhQ0ZhbmxhNVdMY0EzeDRGblNRSlBpYUxSOWlrYmZQZ3dE?=
 =?utf-8?B?aTI2WHc0VmhCQzUwNzNTUXlTcHpiYlFvSk9PWFlSczB1YXlYeUZ6eGNVaHlU?=
 =?utf-8?B?RERzWksyNHJkWlM0WHRIM0JTKzhMUEUzZG8yRmVSeEMxTXZMWWZ4ekQrQWRS?=
 =?utf-8?B?SXRReHZaS2p0YjZCMnljbE8vWWxLRGVQZldzN2QzbURNbUp0RGppL1hxaHZi?=
 =?utf-8?B?V0pDdVplY0tkTjZlV1paNWtoVEdINTJ0WFZBSEcvdlZERTE0ZnJBZzJ2MVZi?=
 =?utf-8?B?SGZad1MrcWxqZVUxd2M1RGYwRVFXOUo2YWM2cVpKM1NLV1RFK3R4YzlrVmlN?=
 =?utf-8?B?MnhUV0hrMFNCcFZzdkdZL2ZUOGpKaEtLTGY5N0dXL1ExWW5yeTVCcE9PaTdQ?=
 =?utf-8?B?ZzRCblFhcHA0NHA2clhKRzRlSEZ5dEV6Wnl3d3NLWHlQSzNjYmlMQlU0S3lF?=
 =?utf-8?B?WW03UWNwR0V5NnBlaUFXbXNqMkwyZWNKTUNNektOZUJaU1RWSE5nOWZmZHhD?=
 =?utf-8?B?UjdybUY3eTNEZTNZeHhEQk9IYW03NUgxckZDMzhscDIyTlVDSXJTa09FSnkv?=
 =?utf-8?B?WUJDM2liTFNwK2VLQnFySGdodEgzSEpIaElmR21vNjZyd21ENE9QSG9URk11?=
 =?utf-8?B?VFlyUTQ1RGorb3RUL2VWTENHWEtTTk9jaWtGRmVrSXpsd3dwcG1WVFgwakdC?=
 =?utf-8?B?NTJhd2w5WlZtNWl1VXBIdk5uYk9BZC9nZW4vS1EyZkJrcUpBZ1NNZ0N0Vjhz?=
 =?utf-8?B?V2VmSDV0OG5PUkYyZVhVQ2d2YWRuTGh2SnJjT0x3SURIam8zM3dmV2VuSThh?=
 =?utf-8?B?bkpYWHFyeXdXRWpoUWNVaVQ1V3A2RWIzaVRyMzFrbkgwVlhlWmRGWWpoSk1k?=
 =?utf-8?B?bkU3NzU0UVNCK3lrSVFwN3lRcnhGS3l1TTlSTzZwNUtFa3dxTHMraVRqa3M5?=
 =?utf-8?B?bmxCcERBeEF3K2ZZa3ZmeDJRQlVRczB3NDdXOUdTSDZFdVhKYnBWN0hnc1Vo?=
 =?utf-8?B?akQrdzJSNUc5WW5LRFU4UnJhbDBPSlMzS0lTYjJGclUzT1JyamtYMXJlK05M?=
 =?utf-8?Q?JY+5MSoUezVAUvAeXVwV2keF/?=
Content-ID: <E5EB253482D4B14CAC3320EA1D3C5E51@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6aa856c-86aa-4c2a-c76d-08dac2ff63fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 09:38:57.5968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IlK0eKYsARfYwfYpuwP8PkC9D5YgQa6p5qoicuE9SEYZWJQZzVzdX3s+6bt3f7FfM+MRqSfep20phjG4Z1TCbQ5dP4Ycr85Zy1la0nymFrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_013911_588903_57E344BC 
X-CRM114-Status: GOOD (  28.76  )
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

On 10/11/2022 09:35, Conor Dooley wrote:
>Re: [PATCH v12 0/2] Hey Uwe, all,

--cover-from-description=auto mistake, apologies.

Correct subject should have been: "Microchip soft ip corePWM driver".


> I've dropped the first two patches, as I applied them last night to my
> tree, so just the driver & maintainers change here now.
> 
> The pre 6.0-rc1 cover letter/series is here:
> https://lore.kernel.org/linux-pwm/20220721172109.941900-1-mail@conchuod.ie
> 
> Thanks,
> Conor.
> 
> Changes since v11:
> - swap a "bare" multiply & divide for the corresponding helper to
>    prevent overflow
> - factor out duplicate clk rate acquisition & period calculation
> - make the period calculation return void by checking the validity of
>    the clock rate in the caller
> 
> Changes since v10:
> - reword some comments
> - try to assign the period if a disable is requested
> - drop a cast around a u8 -> u16 conversion
> - fix a check on period_steps that should be on the hw_ variant
> - split up the period calculation in get_state() to fix the result on
>    32 bit
> - add a rate variable in get_state() to only call get_rate() once
> - redo the locking as suggested to make it more straightforward.
> - stop checking for enablement in get_state() that was working around
>   intended behaviour of the sysfs interface
> 
> Changes since v9:
> - fixed the missing unlock that Dan reported
> 
> Changes since v8:
> - fixed a(nother) raw 64 bit division (& built it for riscv32!)
> - added a check to make sure we don't try to sleep for 0 us
> 
> Changes since v7:
> - rebased on 6.0-rc1
> - reworded comments you highlighted in v7
> - fixed the overkill sleeping
> - removed the unused variables in calc_duty
> - added some extra comments to explain behaviours you questioned in v7
> - make the mutexes un-interruptible
> - fixed added the 1s you suggested for the if(period_locked) logic
> - added setup of the channel_enabled shadowing
> - fixed the period reporting for the negedge == posedge case in
>    get_state() I had to add the enabled check, as otherwise it broke
>    setting the period for the first time out of reset.
> - added a test for invalid PERIOD_STEPS values, in which case we abort
>    if we cannot fix the period
> 
> Changes from v6:
> - Dropped an unused variable that I'd missed
> - Actually check the return values of the mutex lock()s
> - Re-rebased on -next for the MAINTAINERS patch (again...)
> 
> Changes from v5:
> - switched to a mutex b/c we must sleep with the lock taken
> - simplified the locking in apply() and added locking to get_state()
> - reworked apply() as requested
> - removed the loop in the period calculation (thanks Uwe!)
> - add a copy of the enable registers in the driver to save on reads.
> - remove the second (useless) write to sync_update
> - added some missing rounding in get_state()
> - couple other minor cleanups as requested in:
> https://lore.kernel.org/linux-riscv/20220709160206.cw5luo7kxdshoiua@pengutronix.de/
> 
> Changes from v4:
> - dropped some accidentally added files
> 
> Conor Dooley (2):
>    pwm: add microchip soft ip corePWM driver
>    MAINTAINERS: add pwm to PolarFire SoC entry
> 
>   MAINTAINERS                      |   1 +
>   drivers/pwm/Kconfig              |  10 +
>   drivers/pwm/Makefile             |   1 +
>   drivers/pwm/pwm-microchip-core.c | 389 +++++++++++++++++++++++++++++++
>   4 files changed, 401 insertions(+)
>   create mode 100644 drivers/pwm/pwm-microchip-core.c
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
