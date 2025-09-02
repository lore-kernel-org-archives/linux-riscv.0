Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1AF2CA0FFE
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 09:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YTAAlRC0dqjpQMx02eS8lbL8Zo+vXKda5QwWFxJlejE=; b=ccN9aJbj32ykCE
	zCKM4/3/3dUgYv1s/+nhsRL0NYMP3D/ky+Npj+Diii+DmkMLc9UECRv/l2SAB3UFZWOJ0T8lplPVc
	rdGoemHoVDZBe5OWS5GXDsgf4/jf/EWAYOqCe6Q4GplQLMSfRznxL3fmsh/SmnTdAqk7IkpEV7sXP
	kE5TN2g6T5sx0GyAxJT1yufYOxaJLeq20sF6q5TK0lpm3OjVclixG6AsB4WLB9PVJ+rYw6dkhKJyk
	NY12hItBEh+qPI0piILm81meo5MHTdufyr1nrrO0QLjKwX4m/Q96mp+1nTKoq7BpYWv+/iLNuaAbw
	Q+kT5IZhxB5CHEB6ynjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMsa-0000000GEBS-3hdU;
	Tue, 02 Sep 2025 09:00:40 +0000
Received: from mail-dm6nam11on2062c.outbound.protection.outlook.com ([2a01:111:f403:2415::62c] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMYa-0000000G73a-2Cza
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 08:40:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmIU34kW/ksyyuiqmeFKnPuHrSq9iJMVFHaQQtIq+9X//g/MC0wdFIywCElbZW6FY0JYjxJz9q3+wPX7A6evh9ICbBQXoWomO41a5sho6c9pWTIJyNaYMhhrj34W0+48uucNEFY0YZUnzSwXDoIaNUsFDMTABoLNcqW0zGEbRvDCtnE5hJjijx56dRczAUddADVLpJnqUt2jVaC3eHrKfnyM6komLygqOf5AHycxmsxStKhNnHt2LCv6avG+W0Pc+5klKG84+PjLsCgjOJmvAcqp9iolkKDsrmHaIrbLfqDAUcNwwqasPnewgOlF1nC24xx2/nvW33sChrnElhCUog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rupkzp+AgPWjQQwEuYYmLqiCA31b5Jz7AGV6azZLDJE=;
 b=KxaE9OV87SmeVM+8pkTPjBBAq6g6SsE5IOnGHn3YW0HF21imcYezKQncZbEaiFEXmgRhuTB7vooFCS8VyMoWkduxZy/TIaGMfQlg0QcByYvlw99KkSsCZPgVko4JdKvk2wHW+N89ftlfGql1+xgxXcC/OWzLft8dVNBWmeQhJnHXsUsIo+Q+HUTXlRNSZEgbEA0+GIcHcs08VPBVsPKuYeB1Diu9TcaSpDFbbLvG/O9MTKfbpJD0sxst3AavGOvJ/FqCRweI8x0a2stbnddhL+EwVbWZMocJmZjfO2fT9fO8OjfbZWNMayXULfa1QeXV5Avt9HZlBf80tPtetMQiXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rupkzp+AgPWjQQwEuYYmLqiCA31b5Jz7AGV6azZLDJE=;
 b=Oee0u+yHGp5L+r3do1vZF7E7qmVNCpQRgB588bWevsBdz4t/XYRybzdluarRXHn/8RIA2VJntGOTrUSODsrYuMwP6Ix7y6n9DSf4A3w/NpWS6HOkH3WPIlAPYWyav133U1SyWHYMb7yDxk/MwP44bY11zLgUr5VKu8G8iK4W+/eGFAnt4UmdOvuKda5aVDcsRapNmoJF7B3k1RQDl+GoB9Wm2NYnc5oOQQEbLRq/LrJnIzJsJnJpvopQGyp9L5V31U03rZLRis642ZHCJsA8wUnccgjusjUENUDOBdk4snmaUUk7W6IF33nJNxRee79puR05/T7GFLn8BGy6xj+lyQ==
Received: from DS0PR11MB8739.namprd11.prod.outlook.com (2603:10b6:8:1bb::19)
 by PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 08:39:53 +0000
Received: from DS0PR11MB8739.namprd11.prod.outlook.com
 ([fe80::f0f:4a3f:e3a3:d3ad]) by DS0PR11MB8739.namprd11.prod.outlook.com
 ([fe80::f0f:4a3f:e3a3:d3ad%5]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 08:39:53 +0000
From: <Valentina.FernandezAlanis@microchip.com>
To: <krzk@kernel.org>, <Conor.Dooley@microchip.com>,
	<Daire.McNamara@microchip.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v1 5/5] riscv: dts: microchip: add a device tree for
 Discovery Kit
Thread-Topic: [PATCH v1 5/5] riscv: dts: microchip: add a device tree for
 Discovery Kit
Thread-Index: AQHcFdxZ+gegSJP6cUq8DodaBl6a1LR4W8SAgAYinQCAAPmwAIAAJoSA
Date: Tue, 2 Sep 2025 08:39:53 +0000
Message-ID: <e8553f7e-0d86-4236-a071-bb3a1a70140d@microchip.com>
References: <20250825161952.3902672-1-valentina.fernandezalanis@microchip.com>
 <20250825161952.3902672-6-valentina.fernandezalanis@microchip.com>
 <2b1eb8fd-2a64-4745-ad93-abc53d240b69@kernel.org>
 <bb5b0d71-41b1-48a0-82fc-bdb362cc3db1@microchip.com>
 <0d90eeb4-e6ac-459c-a6b1-26368f102e0e@kernel.org>
In-Reply-To: <0d90eeb4-e6ac-459c-a6b1-26368f102e0e@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8739:EE_|PH0PR11MB5782:EE_
x-ms-office365-filtering-correlation-id: 754ef38b-7431-4bbb-d80e-08dde9fc49e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VmxZRWdrVXUyc3JiMXJzWW9ieGNRN0VqeEVpZDg1aFdMcm1MZTU4ZnErZTFV?=
 =?utf-8?B?bCtCdUgzL2Q3anRtWHFqNk41Rld2V1NxTlJSMFRRT2duTkJoZjE1M0NyblNo?=
 =?utf-8?B?OFh3YnRwZjlMMWZmM083UVlZNTRkZmJQWlJ3UGtLUkRUVEJpZ0VtUWhFRjhV?=
 =?utf-8?B?aHFmYzJzU3VLV1VMYTBiU3JsbkpORk5pVERLUUcvdXhpNFFGMXMxK2dXaWFN?=
 =?utf-8?B?cW5FSEZTaS9qTkl2a2R6Vnk0emNDQ0NWZlQza0RTVlNGOEl4UStXSUJ2T0Vz?=
 =?utf-8?B?T0UyNnFCa1ZHdlg2VFFudjhyUGU3NmVOYUIyK0JwQVlmVHJ1TUU5RXc0UXJz?=
 =?utf-8?B?Yk5yNFExYk9obTJkWWRVSlBnb3pZY0pkNWlpNDVWUEZWcDdYM0RNOEd2UURu?=
 =?utf-8?B?cjZ3NU1VZFlsc0xsZzlOM1pWQUszeFRGQTJmcFVZWU5RbnNrdUFMVk1PdzVa?=
 =?utf-8?B?aEpiYlZtRm5kc0U4OTlpLzlXSlkydmVMOHNMRjJjQS9VS2w3encxeWdvVEdE?=
 =?utf-8?B?cFVCZDA3Y3U2aXF0N1JEVFV2emtGeUZBV1RZdWlwSWNzZHFFSnZ4bEkwamh5?=
 =?utf-8?B?Q29wa0J4ZGUwSTNEaUJ4YmU1dXhIMlNsdlFCZ0I3V1JHQlQ1ZkFRK2daMHRK?=
 =?utf-8?B?ei9xUVRSd1lJRi9lZW1ORURxejVsMHhzbHh0aS9iN2QxUlVtS095Z3ZwTzRV?=
 =?utf-8?B?Y1pBTk90SUM4ckduR0JvbmVHRVRreU1mSC9oL2w2YlZseXFjZ0pmWDlJYWxa?=
 =?utf-8?B?eXJMZTlqNjFEMEZmRXdBeGpIMDRzb2tPSmx0RWU4TkdUTUYydWFIZW1EZHR6?=
 =?utf-8?B?RGFwV2lVZWt2RzZ0eXVrU0RNdzErelJ4NHVZbmNqcFI1Q2NoREd0LytHL2Jp?=
 =?utf-8?B?TnllT3BhU0hrWnNrSFNlKys3ampXaE9PWnlRR2FGVmsxRWMzaGhUTk9NZlk4?=
 =?utf-8?B?Q3ltOUc3bXc3ZGZQSVYzc2U3cmJLR0RYR2xlMUpsR2x6eWkzcklSWFUrbzdo?=
 =?utf-8?B?SVIwKzJPRUpuWGNOWHdURDErakJabWJINzhWUGE1eENtU1JGMHpsUjdmL1FW?=
 =?utf-8?B?ZTlzdlFGY3FxTEtoOGlnajNrWUtIWGpCQ29GZVk2Z2FOMGJ1TUVDMVZHSGlH?=
 =?utf-8?B?VHlWdHVtTVpDVk9ITDVoUWVuSUNFRUkrTWNDRDl1NkVDbGcrNTkvSHYzUkQy?=
 =?utf-8?B?TElhZkx0cGFrbEM3K1RqeEFaNzlrakxtOUdlOXBrL0I0WkZ1NFdVU2t5L1dD?=
 =?utf-8?B?U2kyWVhucWNSNXlXaGxDSDVKUDduK09mMmtDQ21RSDhRcjlPM2lQZ1ZyOWZx?=
 =?utf-8?B?Z283U3FjNTV6ckNjUGUwVGdORFllTVgwS0pveUpwSU9va1QzRGdpaENNRFh6?=
 =?utf-8?B?YkIxb1E1RlZNVXBvelJ3QTBObFZQWjhyZ3BzYnFiUUtyY0NNdG1reXVKU3N3?=
 =?utf-8?B?SHYvaG44aTVKeUdkUlZnVU1iL3FablgyLy9vY0tKYWFEcXh3RGtwZFBLQlRt?=
 =?utf-8?B?Z08zWHU0TUlVSmdVODF2eXh2TEFuMG9hckdNRitZL1pQcUtHaGxWbitRRzVZ?=
 =?utf-8?B?NjIxRXh4dFMxNzlDNUNqblVzNlRES1lMczJReFFickczTy83aUY3TFdoQXZ0?=
 =?utf-8?B?MHdRODI0UHIzT0ZSNGVLMGNleU1mTDVRSE5Sa2JCemxLcFNTMmNlS2xaTjlp?=
 =?utf-8?B?WHlGSjhDL3ZseTlQMnJXd0RRWGQvN2ZnMU4yRk9JNkprOC9MNXB1dnRuSTc3?=
 =?utf-8?B?V0s4VVI4L0s1MEtSNFd3TEloMVUxNjhqNjlvTjNiTFBRbE5hTGlJVmJEVHlz?=
 =?utf-8?B?U29WRVV6aDFDQWd0bVVTWENNSGsyaXg0M2EzTXlubmtkZHRkYUZXVW9pTkNR?=
 =?utf-8?B?Q1k2TjJzZnd4bmhVUzF3OEEvZGFRT1pxTFdrVXhsV0d3VFl4aVUzQy92d2NZ?=
 =?utf-8?Q?YnkUUbVddfQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8739.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTh1RGZMOW0wWkpTM1JkT2F1WmNVcG5ZQlZWeWxlZUtwZXlUVTFPVlg4MlZR?=
 =?utf-8?B?bUtYYUFENTMvWmVRZS9tZmFzVDJyMno1NTcxZ1hVV3pTOG90OHZjMVNiL1dw?=
 =?utf-8?B?TmlxSlVzdzVvYy84Vlc5WUdtZHFkRWhSZXVPeXZ1bTJ2b2lqbFFncHRwL1dY?=
 =?utf-8?B?bWlGQVN5Ryt2UCt3eXdGUHNiWGxUVVdNMFZ3QlI5SEpxNExWUlNsVWoxaC82?=
 =?utf-8?B?RWpsM2NJa00yakZzczJ1WHQ4Q0lwd0x2N0JkWjRLdktBT2pMUy9yQkpnYzZT?=
 =?utf-8?B?ZDlvWHRSckR0OFVhVSs4RE13Y21taVNkL2VuQVE0aXFxQjBEWDF3Z2hCeFlB?=
 =?utf-8?B?Z0M4V21mZFZBOTRzOHRRcHZYTlhXZVVGQUE2RkZ2SWNNUjg2S0NFajdVeDVs?=
 =?utf-8?B?dFRtRDNjWEMvMXl2dW02WmorWmxuNENXTjVuS29lR2NPOTVTTG9BT1Ivc292?=
 =?utf-8?B?Vm85WFFDZzJNc1BlNFhQKzhGTnZXdFZ3NEVLT3FsWm53d0llczdTMGpYbVBU?=
 =?utf-8?B?MW5RczczK1V1c3c0ZG1mbkhWR29UbnlJY3J0RTIxN2pwcC8xZjJYZDhuMG5K?=
 =?utf-8?B?RmJtUlltNFc0TTYrVVQ1QWxNUFYzelNKeFlPNG5ESEFtNVdjM3JYbktuSFYr?=
 =?utf-8?B?c2JsenYyMWhhdFlzcmdUcWVPd0pTclNhcG9uRVVMNDJUOUhURGZlR3hERE5z?=
 =?utf-8?B?NlFYbytFTXJHaWJEYnhKTkgxKzU0VTNWT0tsWHZUYU5EMmNuSTRISElKOU1M?=
 =?utf-8?B?NjJUeVRYaDRyVkhvMWNKUStUVDNVWm1jRzBjV2ZOaDBMRjZraTlMUHZLOGRY?=
 =?utf-8?B?bWU4S0VSN1o3c2w5ZVJoaGMyZCtVZGFOM1ZXTFljbmNlZENKb2E4L0tHZUha?=
 =?utf-8?B?Qzh1WWFLbW11Y0NNTzk5bWlucDBXSGlscmZRUmhmci9WcSt5bWMzUVIxMVFu?=
 =?utf-8?B?d29WWGJRUUpPaXpNN3dxL1ROcTVmdFVlUVE1MVd1SEFZbXppOFcvQ0ZsaFhF?=
 =?utf-8?B?U2N6Mm4zYWQ3WDJQVEZUNmJsS1ZERWtLcUlmc3orNDJoU3NqaVRmZXV5bWhC?=
 =?utf-8?B?d3NjQndqMGxlSzVRWE1ySStIc2hvcVNGR05KYzlaajFyR1B6YkZKR0swdU4z?=
 =?utf-8?B?Z0RHZFVQWDZ3UDhBT0hrWDNwUzhlc3p2Zk5pTktpd1FLdklJZ1ovMnNHdUM3?=
 =?utf-8?B?bDJtdDFacTR6WUh3dWE3c2NjUytGTVFJTWY1WWJaTkRZMGp4VkJMNHk4cEpv?=
 =?utf-8?B?QnhjU2RlVHp5NzhtOSs0U0FFSU1GRW9aQlVXOFNNU290T2ZNdmFVbXJpVWlz?=
 =?utf-8?B?QkNWSk5WV1luMGR4UzVtNkExQ3kyR1BKWWxORUdSNTA3ZmsrNmdmRnB1dDdL?=
 =?utf-8?B?YnRHQVYrMzAvTnAvdHVOb1dFZEkvWGtBbG9JV1cyeGxKYjRtalZBYmtWWkxB?=
 =?utf-8?B?dERTc0M5Rlo5WGtQcXp3WEowSnVJZWZpb3dDQmpUVTdKaVRYNENBWGFKY3F4?=
 =?utf-8?B?cFc3WUdNMkptNCtFRGw3aTJXcDYvWmx3SkoxRFlPVDRUbjlvaTN4dXVsRzlR?=
 =?utf-8?B?S2xaUlp6aGtWcFJrTmNOUFlyV01UTkNNdG1BRWc5QVlCemdQYmI0NE5nbVE5?=
 =?utf-8?B?cDhwNFFuWjhGZVVqSHJsbTVscTJNYlRRcnpSSFl4cTJ6Z1lNR2t3aWNxcEtM?=
 =?utf-8?B?R2ptSzZvNTU1blZtQ29YTjIyNkJLc21ZV05WeU5tb2pkbnZYZWxPb1BXQ05j?=
 =?utf-8?B?bDhkWE1sNWJoZ3hvSVJWalh5dWk2Vi9Ba0I1ZngrcFMrUkFkZ0MrVmd5SnNP?=
 =?utf-8?B?YjgyUjJyTUIxSXh5THRwNFRCamd3OEY4eWNCWW1nZXBhZkl5S2w4YkhjMzBJ?=
 =?utf-8?B?ai9zZXlNTnVqajdvOHNOazZHbmZXWVRJZ0V2d2lwakJvc3YxZ0hYN1Q1ekts?=
 =?utf-8?B?WXhmRVp2a1REZDVDY3NaSDEzU3RKOG1HU0xDRjFNT0t3SEgwYlZVdVlwaTRU?=
 =?utf-8?B?TjM5cDM1RjBDZm1uMzhoRU94UExNbGJRWEpvRldyQ0t1TjgyamFZYnhPK29J?=
 =?utf-8?B?ZGVvcFptNWpkRzV5TEtBSFR4dS92MWhEV2d3VC9aam5kZmt6TloxTTQ3TVZT?=
 =?utf-8?B?eFkxVUVQTlVyTWR6cHZNN1RqbFJDbk5obDJXVVZjdmZueUN0UTZOcGV5ck5y?=
 =?utf-8?Q?c0BJR6YAfd4FEpgOreOyyWs=3D?=
Content-ID: <5C925F7D152D9C42B5298B16FA5B17B8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8739.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 754ef38b-7431-4bbb-d80e-08dde9fc49e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 08:39:53.7423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ORhr5Iy3puMkJl+hvX3NF1+MwwRRAb7sQFRItE69kx84kNmOi8mtI72Uz0hdIX9GBNTUMFmN9OEZeUNIjlrs2mlLO39qB0yiJ1dsCmx40adWvywVbmuNsLj/xkWMA4us
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5782
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_014000_850043_6D451185 
X-CRM114-Status: GOOD (  15.24  )
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

On 02/09/2025 07:22, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 01/09/2025 17:28, Valentina.FernandezAlanis@microchip.com wrote:
>> On 28/08/2025 18:46, Krzysztof Kozlowski wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 25/08/2025 18:19, Valentina Fernandez wrote:
>>>> +++ b/arch/riscv/boot/dts/microchip/mpfs-disco-kit-fabric.dtsi
>>>> @@ -0,0 +1,58 @@
>>>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>>>> +/* Copyright (c) 2020-2025 Microchip Technology Inc */
>>>> +
>>>> +/ {
>>>> +     core_pwm0: pwm@40000000 {
>>>> +             compatible = "microchip,corepwm-rtl-v4";
>>>> +             reg = <0x0 0x40000000 0x0 0xF0>;
>>>> +             microchip,sync-update-mask = /bits/ 32 <0>;
>>>> +             #pwm-cells = <3>;
>>>> +             clocks = <&ccc_sw CLK_CCC_PLL0_OUT3>;
>>>> +             status = "disabled";
>>>> +     };
>>>> +
>>>> +     i2c2: i2c@40000200 {
>>>> +             compatible = "microchip,corei2c-rtl-v7";
>>>> +             reg = <0x0 0x40000200 0x0 0x100>;
>>>> +             #address-cells = <1>;
>>>> +             #size-cells = <0>;
>>>> +             clocks = <&ccc_sw CLK_CCC_PLL0_OUT3>;
>>>> +             interrupt-parent = <&plic>;
>>>> +             interrupts = <122>;
>>>> +             clock-frequency = <100000>;
>>>> +             status = "disabled";
>>>> +     };
>>>> +
>>>> +     ihc: mailbox {
>>>> +             compatible = "microchip,sbi-ipc";
>>>> +             interrupt-parent = <&plic>;
>>>> +             interrupts = <180>, <179>, <178>, <177>;
>>>> +             interrupt-names = "hart-1", "hart-2", "hart-3", "hart-4";
>>>> +             #mbox-cells = <1>;
>>>> +             status = "disabled";
>>>> +     };
>>>> +
>>>> +     mailbox@50000000 {
>>>> +             compatible = "microchip,miv-ihc-rtl-v2";
>>>> +             microchip,ihc-chan-disabled-mask = /bits/ 16 <0>;
>>>
>>> Does not look like following DTS coding style - order of properties.
>>>
>>>> +             reg = <0x0 0x50000000 0x0 0x1c000>;
>>>> +             interrupt-parent = <&plic>;
>>>> +             interrupts = <180>, <179>, <178>, <177>;
>>>> +             interrupt-names = "hart-1", "hart-2", "hart-3", "hart-4";
>>>> +             #mbox-cells = <1>;
>>>> +             status = "disabled";
>>>> +     };
>>>> +
>>>> +     refclk_ccc: cccrefclk {
>>>
>>> Please use name for all fixed clocks which matches current format
>>> recommendation: 'clock-<freq>' (see also the pattern in the binding for
>>> any other options).
>>>
>>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/fixed-clock.yaml
>> The fabric dtsi describes elements configured by the FPGA bitstream.
>> This node is named as such because the Clock Conditioner Circuit CCC's
>> reference clock source is set by the FPGA bitstream, while its frequency
>> is determined by an on-board oscillator.
>>
>> Hope this clarifies the rationale behind the node name.
> No, because there is no style naming clocks like this. Neither proper
> suffix, nor prefix. Use standard naming.
> 
> And all other comments you ignored?
I sent a v2 with the rest of the comments addressed. I didn't notice you 
were still not happy with the clock node name, please ignore the v2.

> 
> Best regards,
> Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
