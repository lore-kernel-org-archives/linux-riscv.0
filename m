Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B978C00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 08:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1L1FkmV1Hu/ui5Zz5y+50R1k4bPv9fzkuVjcWNRS4u8=; b=vGxUXRqZWPJjT5
	//I4aApGPTguH9frozEt04YVHghAanfR3N2g2zhkZuwC9PS3Z7wMUFUHzj3zpdplnxHEy0VNHfxii
	gc8I0xg0tnDLyqIf8LWSRC3DgW6fGbWV9rm60/2SAuvLBDIBMe49vcio7vapUcDFW4ejQNlGJc93h
	8NGZWr60TrYg5Lwjl30l9P6KZ6lHzzBTeBrQzHleg7dYhhKjnrtHQu7Z1y5G4ZspZXL9aoEhK1aTL
	nxwR5LCGP17bT1zY2znph8b7Yd4RWuX+0ZyaAKYyynEe60tZOHoRDm5PtjUFGcnbp3laJBwBERITN
	sKx8oTsg0+fY5VmhfGnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMQVR-003DnZ-8S; Fri, 12 Aug 2022 08:59:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMQVN-003Dik-Ey
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 08:59:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660294737; x=1691830737;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=KNTGa30TM64n99ID322pi+zT4aoWjbGxWMNEeN4FZEI=;
  b=1ypSNfniRqvFSCD45eVq6Hr3ntAcwEX2TS40QPsyK1Req0gtpmj2W754
   dPP0mR3EbTTy57q2M+panXA5SnwnNvkMCggZF7Q6Cb2pOZdvDoJbsCP5q
   pU3U3XfSrIKjHkW+RwezPfeYskLofPAPmPmKEgy/aRrZqN6ZMHLo/clNM
   wOiHev+enOG6QJv8Ru9dF/69UaunjX3S01qLtTWx9nb1rDMN2bD3yTnu8
   kF67EKQZg/9YlaWYybFWd2oQL0Veehw7r360ZHM16f86JYbNQ/ryKCjoD
   a7KRWA23kRUz4oGTc3nc1MI2C2hEXWQlQLDRK7VF4HYjFqgJFBavqiq/C
   g==;
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; 
   d="scan'208";a="172148878"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Aug 2022 01:58:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 12 Aug 2022 01:58:48 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Fri, 12 Aug 2022 01:58:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbAO3s/eoKwiWR1BV9JIBFOTIvrVzEcAWj7qFobj26/9A8aB7BHNxwqIdJuWp/kNeMxjzZ2zSQITCf64vgHI/8RqUF2xQPbbmRa4O1FRePwI6kLZAR4R0BbhSWJePZ9Q3Mpz+Wh9062aS1iLjWDqJDDUnwyP1vW03Plb2QFY38tyIGJRRxnTMj4y1xkAgvmjQcVicNJn4/zxdOR3emN/yCNibLFhBES/GEBX0qxUIv1cJyAFCGcSp80LRQHANjpfv3+8bogLOXVPZ74R36tPf87gSjm9GH5DFiAga2gSeyXWFR4hfEQ4agU6mmVROtY6M/o126j/qcMAnyIp0mjH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNTGa30TM64n99ID322pi+zT4aoWjbGxWMNEeN4FZEI=;
 b=bFvyQ1EwmJ7dwkoWIh/AfYIunPT/Pr1K8+2K/GAMyX/GB2DzKsTqVa+nImtjZPJRak781reLdDPb8BRPWStegL731OUHgmVekmtg1gGC24k1D67pC8I1v+H4XukF2RVAtDGZIOdGMLpboXW7WjVmzFSkwMTkHzq/CUTxucy02KS25aSNIouhaQ3w71yK6KmIRSBLgAmY1mrXQU9t84Kj9Vi+kYT9KgYskYvVLmiOR2P47NSSgoh/MIAu9mRRNZBYmot+WehxoX1CSJC+cVT4KapwVzUgRVQ2SWePyku+BJTYws5m2I4xPi7xfxxYNm2ufaYLdcOobUYpJpC9WGuRQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNTGa30TM64n99ID322pi+zT4aoWjbGxWMNEeN4FZEI=;
 b=sJvCPt+H4JY+UQoygHMVmhVi2/kzjR9qikK0zmFt5FcdvIy5SZahli/p3SG4nM4b5UR/Psft27A61/t/Suup8ujGfIQ2b/efTk++HpadWQz/QeY6a7/z0I6nKuDHckAh1B8wJVQUuoLoS1BgxUUjYlt46NmOfAWKOIKxc62C1TA=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CO1PR11MB4849.namprd11.prod.outlook.com (2603:10b6:303:90::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Fri, 12 Aug
 2022 08:58:42 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 08:58:41 +0000
From: <Conor.Dooley@microchip.com>
To: <tongtiangen@huawei.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <palmer@rivosinc.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<wangkefeng.wang@huawei.com>, <guohanjun@huawei.com>
Subject: Re: [PATCH -next] riscv: extable: add new extable type
 EX_TYPE_KACCESS_ERR_ZERO support
Thread-Topic: [PATCH -next] riscv: extable: add new extable type
 EX_TYPE_KACCESS_ERR_ZERO support
Thread-Index: AQHYrikIxmKeJMYZ5UelG1lAtprGTK2q9wsA
Date: Fri, 12 Aug 2022 08:58:41 +0000
Message-ID: <3f663baf-45a1-0bf0-cad9-a4c269b0b3d4@microchip.com>
References: <20220812085212.1525820-1-tongtiangen@huawei.com>
In-Reply-To: <20220812085212.1525820-1-tongtiangen@huawei.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9878fcb-c084-417e-2c59-08da7c40dade
x-ms-traffictypediagnostic: CO1PR11MB4849:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sYfatO3M8zPARVRxn8Vw+aREkbbRMECsP/q06ViM/5qVrGUftVdv0SWHXhAFQuFtMYo3gK4bu+Z2b1IO1Ueqg1CWIMNbBwA8JR8HNRvkSs5NOd2sX6gfzsz4fH9sNUrrB7Jlk12678oLxky1ioAbuhYvv1bjTV3J6lHVMZ9f6v6Px2YSY8WqSzrHbVaNTnQkOfMxsCCiuYdkTf485KJJXqWQipGbW4Vd/QyC+rpNSHHkE1H2TuJonOL96F0u32H9Tj0U/qzwIYp38Cy546xi2oMiK8fTCxbkmR4LULzKv1QqGxUmqZdkJfBfoKHtS57Y9v4HXZeikq6ZCiGkg1NVUx12//PDlKxzJiCEsorGo4nEu1XyOVhMB1qOiyCtiLHBQ0txncan33eQhIiueVg+1cLbJE5O94lb7IFbzd5MyV0FHFo4ILrktwna40VmsnmfFv0nlJ8lh1f6+FwxF7TFGxgCxdeGPmozE64FlBg3QidKIwiMRdaXMUQ5GGLTOOWuG+JsRwGzbpdsz02O8DyafreARQc70Sf8khjnLVGIwsmbELHlB84hIAeMOSQVqLpGwTGqbcWDpNAdo2B7I9+Xx/OStSi8KiwrzxALuPr+EL1/I1PvdolqZFyF8IYcfWFwEfetP0Sn6s0jkypfhh9pcWSErEfUfUP18ktM7yLw+1KD8HrWggVYcTfSTP5D0orGAYg5KHPiZEr2g5r+lBjRxkw0PHrkgz1rXgxpEvuhEvmQlXYM/j9tQqxNjb/uTlB0ZFoZPok9XUIHt5TrzZcECaJfWrGzb/xkpFCAWa1ubMvrtHKxTxUCgXkzTSOFPAzTkJZD0aMGxiEymXGQ7FGWv37mIKOrKm1rt/kgyvxdADmIGbDM9pgL6Yo/PJuAArQ2VeHHwcNQM5zvpeIiFaHDsg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(346002)(39860400002)(376002)(366004)(91956017)(966005)(6486002)(71200400001)(41300700001)(478600001)(54906003)(316002)(4326008)(2906002)(26005)(66446008)(66556008)(110136005)(64756008)(8676002)(38100700002)(66946007)(76116006)(66476007)(8936002)(5660300002)(38070700005)(122000001)(31686004)(36756003)(86362001)(53546011)(31696002)(6506007)(2616005)(186003)(83380400001)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ellBdFFOMWpTeWVqQzQ5UHhmTFdhaGpmZnJ4eXZqSkJ2UVIrTDZKR2kwWkgy?=
 =?utf-8?B?UHNRWm9xL0VJVlBhKzg4bFpRbkg1MU1WWUFtcjVmbkl2NzUxdWg1MldyVUYr?=
 =?utf-8?B?VitCVTJ4VUs0ZGtNYlpmN0xkMGFjM3BtNS9rY2tEMmdEWWg1N3JudlRtKzIw?=
 =?utf-8?B?TkhrN3hlaHZ6YWlZSEd1TUlRMlUvSVdDTklmcVF5emJSQ3o1bmJKQXh1Nmo3?=
 =?utf-8?B?d29kTzduckkrc3V1dGk5NU5HTUNaNzlqU1ptRnVoSC9IS0VpRE9lcU1hcGlq?=
 =?utf-8?B?SHlhY0pScWdRejkxRGFYVVE4cGUvKzdzN1hQakhPa1lPanpucFpIcGFLMFZK?=
 =?utf-8?B?VDFjTjZFdUN0ajNaUUxaL2M4Y2dsakpkWlIvLzZoZEZJUEY3VEwzNjRIZUNv?=
 =?utf-8?B?Z21Cc2p0Zmh4ZW5aZlRuMmhkTGp6VVAzbXc3WFl4SGxHVzJsTlYwTUlabFBo?=
 =?utf-8?B?ZEllbEo1ZFdxakRWeFhIMkxXSncyakRnMXBsWDMxMEU4K0xyM2t4aFo5OWtX?=
 =?utf-8?B?dnpmaG1vN2xodHR0UDdzS2hpaGxhYjBLU0M0dFAyQ25mTzBLVCswcEVsMi91?=
 =?utf-8?B?elE4NUlBMTQ3YndiYjRTR2dyRGpEQmtnRTB0VVZody8rU2dmTzlBcVo3RVll?=
 =?utf-8?B?VE1EK25XSWdvM0hDd01PUXlFSWozbko3UDcxZ1lvSDZJN1kzOGxOTkh1RkZw?=
 =?utf-8?B?N0d6NTl4M2xFZ3RUVStUT1BqUmFxcU1XVlUzMzFYd29oRnY5UXR1cDZIaVlX?=
 =?utf-8?B?QnhDdzhUbk14dzlnWkdnSnZBL0JGVTBqcmpwUFpEUk92R1EwY1Zha0Y0cnNZ?=
 =?utf-8?B?NU9sTFhLeENBSEFDU3dQS21UVEpJS05abU5aSzRDejY5Vjc5eXpEQXJXcVkz?=
 =?utf-8?B?Z1p4T3hNY0xOMUhHVkdvNmJTc0JiWUJiL05saVl1Mmd6NW40Y0hldTY4VHJT?=
 =?utf-8?B?RENYSTl0ZWk2TkE2eVdUb21mRmRqMWhheFpja1Z0Sy80RVhsVDc4V2Q2ZnRn?=
 =?utf-8?B?eDlvQkxCMVV5QVZBVGNnV1B2cW9HZ09ZTHVjQXFoUE52Q2NpNFJSWVZJQUl5?=
 =?utf-8?B?NnVTVzlWNHd0cXJQYlhpb1Vpc2p1ejlYMHdYMjR0Q05vSW5OODd4Q1Z1T1dN?=
 =?utf-8?B?QWluQkI3dVNSazl5QmZxa0JRL3dPRDhlblVRT2xRMnhZck11UVZZdk85eWVP?=
 =?utf-8?B?QlVNTkhKVTdjZmZ5RWFJZ0EyS3NUMndSYXZHNFRraTZXc3dIZXdvU0pWekZv?=
 =?utf-8?B?Z2lhbVpXNWI0bG5EUWRkVHFpUkI1VWxqSE00OGdQR29FMEQrbU9jVUR1Z0ZE?=
 =?utf-8?B?bG40U2l6bjNVSlBNN01BN0JweVk4cWIzVHh0UWQ0Vis3bloxOUpoK1diVjRS?=
 =?utf-8?B?aGxBZGlhdnY4aFhRQkJhV2VMMWs0dU0rbVc3VzJObWxpZFRWTVN5SDVXRmFK?=
 =?utf-8?B?dm02UWhoV0NuaUF6ZDY5QUloakRyM1c1Y2s1K1Jtazc0WDJwdExRM3lWYzBZ?=
 =?utf-8?B?TXhRU3Jmb0NqbEF3RFFteFBScFNBOTg5RTFpbUJyM0pCdGh5TVRndkhGbmhh?=
 =?utf-8?B?VThQQjdhaWFGQzdrYURvbnVLV0N3aW1Cd24vczRqRlExanRYTW5VSnQzU1gr?=
 =?utf-8?B?UVZFUU1LVzlZbHdmeDJkZVd3S0RpcHNHRDZ1ams1SVoyMFE1NUQ3d0ltMnRZ?=
 =?utf-8?B?ZExHeTU2TzFURzluNnVZa0lMbzAzcDFsMVJPajZUak16Y3hZd0NPbHVLWlc3?=
 =?utf-8?B?UXRlTGIzZTd1c25hS3RSSUZhYVVTL2lTNkNJTzBpTC9sRnI5R21YY3N4MjBw?=
 =?utf-8?B?TU1QYmZzVkdVMzVtRy9aMXdnSWhzT2NibWdLQytiZ09aaFp2VHV4SDNtRjQ5?=
 =?utf-8?B?a25vWXhVTlBySmxWWVNOcXp1NHo2TTFTQWFhb2YrNk5peXNvc3puVWZPL21Z?=
 =?utf-8?B?NWpXRFg3NVhlMlY2YjNlOFVBT2FNYUVpcE1FcDNXSEhkQldKWFFxMTVWUVFK?=
 =?utf-8?B?NnB0TkRLTmxvOGdrQ3BhNk43NkxCQm9MV21sY2M2azRTYWJ5QkZFZmdZdGhk?=
 =?utf-8?B?UkM3T3pFTkYxWWZwZjdYYXJSektjOVRCVkgyMjFXSTlHTlVBSy9KVWpWdWJr?=
 =?utf-8?Q?fROedVonLNBN9pO87RTKCjc8x?=
Content-ID: <459389F7A2579F438D5284DE91283EC4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9878fcb-c084-417e-2c59-08da7c40dade
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2022 08:58:41.7622
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o69wSxLmzzMVS1dxhzhMVI1ZUnVMGf685390MMWhqWuu2Cxp6ga795vy/3H728ObUDrIdVkzzSJRG6jNjNjuwsn4CUYppumNBbLTH2FObKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4849
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_015857_955353_6B120EF7 
X-CRM114-Status: GOOD (  19.13  )
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

On 12/08/2022 09:52, Tong Tiangen wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Currently, The extable type EX_TYPE_UACCESS_ERR_ZERO is used by
> __get/put_kernel_nofault(), but those helpers are not uaccess type, so we
> add a new extable type EX_TYPE_KACCESS_ERR_ZERO which can be used by
> __get/put_kernel_no_fault().
> 
> Also change the name of __get/put_user_nocheck to __get/put_mem_nocheck
> to make it conform to its use situation (not only used in uaccess).

Is there a reason why this should not be a different patch?
Thanks,
Conor.

> 
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> ---
>   arch/riscv/include/asm/asm-extable.h |  12 ++
>   arch/riscv/include/asm/uaccess.h     | 160 +++++++++++++--------------
>   2 files changed, 92 insertions(+), 80 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/asm-extable.h b/arch/riscv/include/asm/asm-extable.h
> index 14be0673f5b5..73c70098a9c8 100644
> --- a/arch/riscv/include/asm/asm-extable.h
> +++ b/arch/riscv/include/asm/asm-extable.h
> @@ -6,6 +6,7 @@
>   #define EX_TYPE_FIXUP                  1
>   #define EX_TYPE_BPF                    2
>   #define EX_TYPE_UACCESS_ERR_ZERO       3
> +#define EX_TYPE_KACCESS_ERR_ZERO       4
> 
>   #ifdef __ASSEMBLY__
> 
> @@ -57,9 +58,20 @@
>                              EX_DATA_REG(ZERO, zero)                     \
>                            ")")
> 
> +#define _ASM_EXTABLE_KACCESS_ERR_ZERO(insn, fixup, err, zero)          \
> +       __DEFINE_ASM_GPR_NUMS                                           \
> +       __ASM_EXTABLE_RAW(#insn, #fixup,                                \
> +                         __stringify(EX_TYPE_KACCESS_ERR_ZERO),        \
> +                         "("                                           \
> +                           EX_DATA_REG(ERR, err) " | "                 \
> +                           EX_DATA_REG(ZERO, zero)                     \
> +                         ")")
> +
>   #define _ASM_EXTABLE_UACCESS_ERR(insn, fixup, err)                     \
>          _ASM_EXTABLE_UACCESS_ERR_ZERO(insn, fixup, err, zero)
> 
> +#define _ASM_EXTABLE_KACCESS_ERR(insn, fixup, err)                     \
> +       _ASM_EXTABLE_KACCESS_ERR_ZERO(insn, fixup, err, zero)
>   #endif /* __ASSEMBLY__ */
> 
>   #endif /* __ASM_ASM_EXTABLE_H */
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index 855450bed9f5..5372f3f1e3f6 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -50,62 +50,62 @@
>    * call.
>    */
> 
> -#define __get_user_asm(insn, x, ptr, err)                      \
> -do {                                                           \
> -       __typeof__(x) __x;                                      \
> -       __asm__ __volatile__ (                                  \
> -               "1:\n"                                          \
> -               "       " insn " %1, %2\n"                      \
> -               "2:\n"                                          \
> -               _ASM_EXTABLE_UACCESS_ERR_ZERO(1b, 2b, %0, %1)   \
> -               : "+r" (err), "=&r" (__x)                       \
> -               : "m" (*(ptr)));                                \
> -       (x) = __x;                                              \
> +#define __get_mem_asm(insn, x, ptr, err, type)                         \
> +do {                                                                   \
> +       __typeof__(x) __x;                                              \
> +       __asm__ __volatile__ (                                          \
> +               "1:\n"                                                  \
> +               "       " insn " %1, %2\n"                              \
> +               "2:\n"                                                  \
> +               _ASM_EXTABLE_##type##ACCESS_ERR_ZERO(1b, 2b, %0, %1)    \
> +               : "+r" (err), "=&r" (__x)                               \
> +               : "m" (*(ptr)));                                        \
> +       (x) = __x;                                                      \
>   } while (0)
> 
>   #ifdef CONFIG_64BIT
> -#define __get_user_8(x, ptr, err) \
> -       __get_user_asm("ld", x, ptr, err)
> +#define __get_mem_8(x, ptr, err, type) \
> +       __get_mem_asm("ld", x, ptr, err, type)
>   #else /* !CONFIG_64BIT */
> -#define __get_user_8(x, ptr, err)                              \
> -do {                                                           \
> -       u32 __user *__ptr = (u32 __user *)(ptr);                \
> -       u32 __lo, __hi;                                         \
> -       __asm__ __volatile__ (                                  \
> -               "1:\n"                                          \
> -               "       lw %1, %3\n"                            \
> -               "2:\n"                                          \
> -               "       lw %2, %4\n"                            \
> -               "3:\n"                                          \
> -               _ASM_EXTABLE_UACCESS_ERR_ZERO(1b, 3b, %0, %1)   \
> -               _ASM_EXTABLE_UACCESS_ERR_ZERO(2b, 3b, %0, %1)   \
> -               : "+r" (err), "=&r" (__lo), "=r" (__hi)         \
> -               : "m" (__ptr[__LSW]), "m" (__ptr[__MSW]));      \
> -       if (err)                                                \
> -               __hi = 0;                                       \
> -       (x) = (__typeof__(x))((__typeof__((x)-(x)))(            \
> -               (((u64)__hi << 32) | __lo)));                   \
> +#define __get_mem_8(x, ptr, err, type)                                 \
> +do {                                                                   \
> +       u32 __user *__ptr = (u32 __user *)(ptr);                        \
> +       u32 __lo, __hi;                                                 \
> +       __asm__ __volatile__ (                                          \
> +               "1:\n"                                                  \
> +               "       lw %1, %3\n"                                    \
> +               "2:\n"                                                  \
> +               "       lw %2, %4\n"                                    \
> +               "3:\n"                                                  \
> +               _ASM_EXTABLE_##type##ACCESS_ERR_ZERO(1b, 3b, %0, %1)    \
> +               _ASM_EXTABLE_##type##ACCESS_ERR_ZERO(2b, 3b, %0, %1)    \
> +               : "+r" (err), "=&r" (__lo), "=r" (__hi)                 \
> +               : "m" (__ptr[__LSW]), "m" (__ptr[__MSW]));              \
> +       if (err)                                                        \
> +               __hi = 0;                                               \
> +       (x) = (__typeof__(x))((__typeof__((x)-(x)))(                    \
> +               (((u64)__hi << 32) | __lo)));                           \
>   } while (0)
>   #endif /* CONFIG_64BIT */
> 
> -#define __get_user_nocheck(x, __gu_ptr, __gu_err)              \
> -do {                                                           \
> -       switch (sizeof(*__gu_ptr)) {                            \
> -       case 1:                                                 \
> -               __get_user_asm("lb", (x), __gu_ptr, __gu_err);  \
> -               break;                                          \
> -       case 2:                                                 \
> -               __get_user_asm("lh", (x), __gu_ptr, __gu_err);  \
> -               break;                                          \
> -       case 4:                                                 \
> -               __get_user_asm("lw", (x), __gu_ptr, __gu_err);  \
> -               break;                                          \
> -       case 8:                                                 \
> -               __get_user_8((x), __gu_ptr, __gu_err);  \
> -               break;                                          \
> -       default:                                                \
> -               BUILD_BUG();                                    \
> -       }                                                       \
> +#define __get_mem_nocheck(x, __gu_ptr, __gu_err, type)                 \
> +do {                                                                   \
> +       switch (sizeof(*__gu_ptr)) {                                    \
> +       case 1:                                                         \
> +               __get_mem_asm("lb", (x), __gu_ptr, __gu_err, type);     \
> +               break;                                                  \
> +       case 2:                                                         \
> +               __get_mem_asm("lh", (x), __gu_ptr, __gu_err, type);     \
> +               break;                                                  \
> +       case 4:                                                         \
> +               __get_mem_asm("lw", (x), __gu_ptr, __gu_err, type);     \
> +               break;                                                  \
> +       case 8:                                                         \
> +               __get_mem_8((x), __gu_ptr, __gu_err, type);             \
> +               break;                                                  \
> +       default:                                                        \
> +               BUILD_BUG();                                            \
> +       }                                                               \
>   } while (0)
> 
>   /**
> @@ -136,7 +136,7 @@ do {                                                                \
>          __chk_user_ptr(__gu_ptr);                               \
>                                                                  \
>          __enable_user_access();                                 \
> -       __get_user_nocheck(x, __gu_ptr, __gu_err);              \
> +       __get_mem_nocheck(x, __gu_ptr, __gu_err, U);            \
>          __disable_user_access();                                \
>                                                                  \
>          __gu_err;                                               \
> @@ -163,28 +163,28 @@ do {                                                              \
>   ({                                                             \
>          const __typeof__(*(ptr)) __user *__p = (ptr);           \
>          might_fault();                                          \
> -       access_ok(__p, sizeof(*__p)) ?          \
> +       access_ok(__p, sizeof(*__p)) ?                          \
>                  __get_user((x), __p) :                          \
>                  ((x) = 0, -EFAULT);                             \
>   })
> 
> -#define __put_user_asm(insn, x, ptr, err)                      \
> +#define __put_mem_asm(insn, x, ptr, err, type)                 \
>   do {                                                           \
>          __typeof__(*(ptr)) __x = x;                             \
>          __asm__ __volatile__ (                                  \
>                  "1:\n"                                          \
>                  "       " insn " %z2, %1\n"                     \
>                  "2:\n"                                          \
> -               _ASM_EXTABLE_UACCESS_ERR(1b, 2b, %0)            \
> +               _ASM_EXTABLE_##type##ACCESS_ERR(1b, 2b, %0)     \
>                  : "+r" (err), "=m" (*(ptr))                     \
>                  : "rJ" (__x));                                  \
>   } while (0)
> 
>   #ifdef CONFIG_64BIT
> -#define __put_user_8(x, ptr, err) \
> -       __put_user_asm("sd", x, ptr, err)
> +#define __put_mem_8(x, ptr, err, type) \
> +       __put_mem_asm("sd", x, ptr, err, type)
>   #else /* !CONFIG_64BIT */
> -#define __put_user_8(x, ptr, err)                              \
> +#define __put_mem_8(x, ptr, err, type)                         \
>   do {                                                           \
>          u32 __user *__ptr = (u32 __user *)(ptr);                \
>          u64 __x = (__typeof__((x)-(x)))(x);                     \
> @@ -194,8 +194,8 @@ do {                                                                \
>                  "2:\n"                                          \
>                  "       sw %z4, %2\n"                           \
>                  "3:\n"                                          \
> -               _ASM_EXTABLE_UACCESS_ERR(1b, 3b, %0)            \
> -               _ASM_EXTABLE_UACCESS_ERR(2b, 3b, %0)            \
> +               _ASM_EXTABLE_##type##ACCESS_ERR(1b, 3b, %0)     \
> +               _ASM_EXTABLE_##type##ACCESS_ERR(2b, 3b, %0)     \
>                  : "+r" (err),                                   \
>                          "=m" (__ptr[__LSW]),                    \
>                          "=m" (__ptr[__MSW])                     \
> @@ -203,24 +203,24 @@ do {                                                              \
>   } while (0)
>   #endif /* CONFIG_64BIT */
> 
> -#define __put_user_nocheck(x, __gu_ptr, __pu_err)                                      \
> -do {                                                           \
> -       switch (sizeof(*__gu_ptr)) {                            \
> -       case 1:                                                 \
> -               __put_user_asm("sb", (x), __gu_ptr, __pu_err);  \
> -               break;                                          \
> -       case 2:                                                 \
> -               __put_user_asm("sh", (x), __gu_ptr, __pu_err);  \
> -               break;                                          \
> -       case 4:                                                 \
> -               __put_user_asm("sw", (x), __gu_ptr, __pu_err);  \
> -               break;                                          \
> -       case 8:                                                 \
> -               __put_user_8((x), __gu_ptr, __pu_err);  \
> -               break;                                          \
> -       default:                                                \
> -               BUILD_BUG();                                    \
> -       }                                                       \
> +#define __put_mem_nocheck(x, __gu_ptr, __pu_err, type)                 \
> +do {                                                                   \
> +       switch (sizeof(*__gu_ptr)) {                                    \
> +       case 1:                                                         \
> +               __put_mem_asm("sb", (x), __gu_ptr, __pu_err, type);     \
> +               break;                                                  \
> +       case 2:                                                         \
> +               __put_mem_asm("sh", (x), __gu_ptr, __pu_err, type);     \
> +               break;                                                  \
> +       case 4:                                                         \
> +               __put_mem_asm("sw", (x), __gu_ptr, __pu_err, type);     \
> +               break;                                                  \
> +       case 8:                                                         \
> +               __put_mem_8((x), __gu_ptr, __pu_err, type);             \
> +               break;                                                  \
> +       default:                                                        \
> +               BUILD_BUG();                                            \
> +       }                                                               \
>   } while (0)
> 
>   /**
> @@ -253,7 +253,7 @@ do {                                                                \
>          __chk_user_ptr(__gu_ptr);                               \
>                                                                  \
>          __enable_user_access();                                 \
> -       __put_user_nocheck(__val, __gu_ptr, __pu_err);          \
> +       __put_mem_nocheck(__val, __gu_ptr, __pu_err, U);        \
>          __disable_user_access();                                \
>                                                                  \
>          __pu_err;                                               \
> @@ -279,7 +279,7 @@ do {                                                                \
>   ({                                                             \
>          __typeof__(*(ptr)) __user *__p = (ptr);                 \
>          might_fault();                                          \
> -       access_ok(__p, sizeof(*__p)) ?          \
> +       access_ok(__p, sizeof(*__p)) ?                          \
>                  __put_user((x), __p) :                          \
>                  -EFAULT;                                        \
>   })
> @@ -321,7 +321,7 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
>   do {                                                                   \
>          long __kr_err;                                                  \
>                                                                          \
> -       __get_user_nocheck(*((type *)(dst)), (type *)(src), __kr_err);  \
> +       __get_mem_nocheck(*((type *)(dst)), (type *)(src), __kr_err, K);\
>          if (unlikely(__kr_err))                                         \
>                  goto err_label;                                         \
>   } while (0)
> @@ -330,7 +330,7 @@ do {                                                                        \
>   do {                                                                   \
>          long __kr_err;                                                  \
>                                                                          \
> -       __put_user_nocheck(*((type *)(src)), (type *)(dst), __kr_err);  \
> +       __put_mem_nocheck(*((type *)(src)), (type *)(dst), __kr_err, K);\
>          if (unlikely(__kr_err))                                         \
>                  goto err_label;                                         \
>   } while (0)
> --
> 2.25.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
