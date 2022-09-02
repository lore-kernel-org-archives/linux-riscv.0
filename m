Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA51ECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 16:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PHb21Fi1iBpSWBVGcxIzt2ia02oguhGwScu6CLZMKHU=; b=Gr4LKUmAM6piqN
	J6ysQThHO0rM3uXUypg17oijpwhNG6NWGQ0MhrtIdzYHAkI13ZVQHmtEM4NYKX5RgDNJZIuyN8YXh
	99BviqpiX6uzAoCmN0Q5RovkLanBb73anRAXBC4hSpjWLr+Jj1QLJANenldanjPnACWHTly6AC8ut
	bXf1w3c9Vek9gCNEy51d+5tPcbQREa/zYgl1VLSVvaRYmhCU3wBF4CpIs1PuWZPXg2zRpysBzca/Y
	w4FUEtQN7iPXCS0DgOgNUwqIde+vFvzGNI4fZS8MMUZv9MorwuUyhrs7XnS1asY/ljVC6z0vtTv69
	AnEhWcaonN4NSzBA47kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU9DB-006l3p-6o; Fri, 02 Sep 2022 16:08:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU9D7-006l2B-PP
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 16:08:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662134881; x=1693670881;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=OwW1jOArdTn3Y0JdyAIZDohGf4v59a1b6+jeNJk9I0A=;
  b=vcI7SJEQIAmWodhjXSdlcWiXnMHSiuA67CStea3MnYZzkzdx/dPhJ+x1
   TxoqKpZzMOstOyTFbEDEla9jVRvVTLUfIawRLeNxVkEeyP0lyWVqqi8wo
   KWf5E21GeqXW4/ppjfRfJjjxCU134abF0VgBohjMFxuhYba8FxYrqjmAV
   9n7ZuyoeB0qRFM87lhreg6nzjKahyhtD/6g+jsxFrH/Z0mvqFvBUo0+dF
   FcbkDvaPdk5YyZNje6PB8glodQNCHEow9EntQkQ5nPDNy3KLWUmsKGA1q
   hq8J1ry8OUgTQ/ZEmazFMKlgNodp6FUCN677QuCHIoK0t/O+sg94e9EB3
   g==;
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="189190138"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2022 09:08:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 2 Sep 2022 09:08:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 2 Sep 2022 09:08:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLg8+LIhhLm6j2yqbB9J9BUOY0Wf+8hFAu3MnS1ngaz/iJi+MZL5BiSl6mhWP++VgcHhpuDKNVFm4I9CMWhFdH3JtMgi0VQLNTG4sUaKtJEjvZwVAegB4ik+Zaye5kusPMjhfNNoyn2AuhpyyeLbRXVfCJ5o3sLMoA0KgEYQ9DeILwkUpHQEVwe94d3ipGkU6AtO3hNQvUDiqZhfXp/jlKFUcpMZLR1uMeqUTIP77hA92SOOv12M2nv2nFaRTDk21rRA6TV4uaNAiy57AVnbZmrHXFk+TfwUqyLzcPN5xliaJQI4V2JUb2f6Rn1lq80n/taW946AaPj4rWaAbSbkaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwW1jOArdTn3Y0JdyAIZDohGf4v59a1b6+jeNJk9I0A=;
 b=mkBgNM9Nj8Ks7C2lkoZTF958+vzcJB5ND6+651jIPJlKKYFChX6dOG8qWFmYMejEMmgSB3HnkL4BxrXYQ60Kw4P7asHDUsp8Bd+ti6PvquU6Rru3wDW5sq0yN+lpBFSXZd18AGLBqlvRN+h6mkt4UCA74ZrHUxfnkta23MIge71KX1b6OE5IyUhHAxuGEu7RlHnQkQf8xrQzLSLObblP14lHSVofqOZJ43792KjNrAFaelSBgTieWUb0+xbWQ7fRHHbvcafiFK1eXykSl/DzH46b9VKdAhOhVCyuluhTXmbRTrXsSdlZBZ9LSGnMwfw/bPaenshBPu5DBvnrU6qrsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwW1jOArdTn3Y0JdyAIZDohGf4v59a1b6+jeNJk9I0A=;
 b=CT+gQbBDczlE/VjPbmAIcevtPlGKADy6jXPbYQHVqn41Yy20WFRN74HoAe0ylVix7o22kJZMIaDIYmmJX3mE2LWr7Q76/5Pc9TgWzB5yjIXVh8x3NS5jUL8UnZIi9v5USjIY2wUmIbZpGC7l8GXjVWhEI3qkP1FOLCeMczWPcfg=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SA1PR11MB7013.namprd11.prod.outlook.com (2603:10b6:806:2be::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 2 Sep
 2022 16:07:50 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.016; Fri, 2 Sep 2022
 16:07:49 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@dabbelt.com>
CC: <linux-riscv@lists.infradead.org>
Subject: [GIT PULL] Microchip DT fixes for v6.0-rc4 (or later)
Thread-Topic: [GIT PULL] Microchip DT fixes for v6.0-rc4 (or later)
Thread-Index: AQHYvuYm9WU9wsZ0AkupF4kHDs5Tcw==
Date: Fri, 2 Sep 2022 16:07:49 +0000
Message-ID: <1757d109-c65a-16e5-ab73-29b17e700f8e@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2134a77a-15a5-4e56-7de4-08da8cfd4894
x-ms-traffictypediagnostic: SA1PR11MB7013:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4EAWQqSwtG474Ct9gADxkyXC281Z0dIsVJ3X/sZkIYFSV7wDTTtOdYgw7KgfpRPX7V8xjUVmZpB84S+dqoKiKTEfQxFW1OIRXLmYpQDxFIdzpYRlpot+vG+kP7BREPLl8rkLH/LbRTL0YAcsU3O6UTPnEg6xM+PQKOHmCXyA+LFZf2aAvXvZY6WAJQkE8JeTFdwlPBma25ZK5PkMFXrAOdP8jIHuZBjV0Hz/Fqm527ywDa14vYyzWak8wFHzup/HCqQuhc1rzkCfczcqn9oSeIu9SRAhgyJBkuuT0G78rnL2HQJr/UWxRHYkLL/KipnnwWetcw0litAydUfMVlPZvIW1thRWOws5OcyoyLOBgvj/kdeaA388x9HJPw3oJME9z/3EQZOIsARfJlVmmU5byASlAAqZwkhDZ8mYDf4ICMlDyJY50Pe9XvEsbm6cih6AmkFwHSeVRs2do+bO/auhAvPckAO9XkAAaNAgfEOiAPlf60eXXOKG49uARnc7nBkhj6o93lQRkfNbg1VLPke2OjT79iI0xRHXXyCL60LOaTYPIuhbp9s2HVA3m2r8d+9HREcqF1sqwekt3FNpWRxarVm7k3+QTsLcM5AD1D2MmK1y9rhDMPp2SAreP1/lBjCx5DrvOK+ivS93NQEiZUV2FKn75pdI+54FvVKJqHA2xZY0wdcWOj65T2gKh2LocX/JwvhVHV31++510PAajOTLjypxMmG92+tshQEOrH1S5+r5ofnbK34P54KXN8B/Ne3Vb/ixxRpDQX8PCZVuWlbFGM24tZ8HDXlLiWjGzot/ood8dzM2JHnniPs8hyXh0jN+2YCk0r46vWbGK39NnDNOnaF9v6GTNHwvY9Yyb9nrU5ZUYdW/MP+C3dH+g0wMn4zHEpWHL4VIWPXJLK3RaykLeQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(39860400002)(376002)(366004)(396003)(38100700002)(2906002)(6512007)(26005)(122000001)(2616005)(6506007)(83380400001)(186003)(4326008)(66446008)(66946007)(66556008)(66476007)(91956017)(76116006)(966005)(8676002)(31696002)(64756008)(316002)(6916009)(41300700001)(71200400001)(86362001)(36756003)(5660300002)(8936002)(6486002)(31686004)(38070700005)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N0N3MExIcUJRT3RDMzU2UFhTS1U0OXJ0WkUvNEE0TEY2Q3hvbWk1L0ZKOHlN?=
 =?utf-8?B?RDhUOXlNeXRJc1plSTdnN1hiQWQzampWY1dOcEgwSU4rL1M5NEdhZy9HMU5k?=
 =?utf-8?B?dEh6aVMzck9SYWFZN1I0ZEpCNlpzNVc4aHJ0STFMOTRoOElKZCtJbnNLTExF?=
 =?utf-8?B?a0YvYXpYNjVOVVNEMVhDbDJORGw5RU42QTdYN2Z3aXhINTJwUHdaMXFybHVR?=
 =?utf-8?B?VG1WMTR1M0JjOWhQZXdKYk5tVWZTS0pGUE9SYUwzWWhGQnFDL08zUXV2NVdi?=
 =?utf-8?B?Yi9EOHpHbjkrZ01JVXdoRnRVeFBzWlZ5eVJpeFBlUzYwLy9sVmlucXVkNllE?=
 =?utf-8?B?K3JBVHlyaldCTllMVWl1M3h5ZVlSOTdsS0R0V2FBU05PdlZzYmR1R2tBYUM0?=
 =?utf-8?B?R3dBbC9jbUZmeUowcVp4bXpMK0JtaXRSRU9JNjF6ay9MbndIam5KbTNXSDBH?=
 =?utf-8?B?c0Q3Mlk2OTJ1Nm1QN3k0RG10MzNQaTl4SERJdFYvMlpPRGVYTmNiODN5RDhO?=
 =?utf-8?B?U3k2cFRQMGphOXJBMEVCcTM5VUNrY3RiRkt2ckluZFQvVzhjVUY4T2FJR29p?=
 =?utf-8?B?NGlXTGt6a0dyWUhWdTZ6SytVa2pVR0tOV0hibU1zamQ5VnF4dGE3VnBpMStU?=
 =?utf-8?B?TGlFeU5ad0d3WFdFYVRhMkw3RGZ6bUVEUUluL21ENThDYTB5M1JFTjJiYjlI?=
 =?utf-8?B?TFEwRW9YN2ptWHV2OXUvRmhQY3dybVp2QVcwM3RZOFFXZW1YZVFqVFFNS2dx?=
 =?utf-8?B?N0xzYWp4MmpTVmRjZ1l5L01ydm11QVIvVy9qRC9xU05TMW1BbkJxalY2UHhs?=
 =?utf-8?B?QnRuY3IzS1d4YmhJQk5TRXFDaEkxWXE4dzNLZjJ5M3V1VUJpTXZ0b1Rxb1ZL?=
 =?utf-8?B?c0FFNmpEM05KME9KMlcrYzV5MVdVZzBQK2hkeStrRVRxQ3JadVNFdE1ZOVBm?=
 =?utf-8?B?QWsrV1hvek5YUEZYblRJdnBxa0ZJVnRHK0NpcWFCV0R2YzNqTjM4TW9FRnhO?=
 =?utf-8?B?R3hIay9mYjVLTFBVNVFLWGhFdzdvdVlXTFBQNVB5OG9QQk55YjE0R0xVUDZX?=
 =?utf-8?B?VFh1U2lXS1ZOWDdNbGR3VUlIQWtsalRna25EUFZrVjZLc09zSlVXM09XcCs0?=
 =?utf-8?B?NHZTVi9ZNWc2OC9ZNGkvckxvWTB0WHY1R2REWVUxR1h2amJCdFVJL2lWQm94?=
 =?utf-8?B?N3hkN3pRRFFubndmRXNGMGZWN3JNaktXaWF5MFBINWxTeUJWYVM5ZjQ3M0tW?=
 =?utf-8?B?ZksyMHdhUTg2M3pibjZMaDhNV0NxSDQrajQ2bk1tcFJjWC8xMysxcVhJNktB?=
 =?utf-8?B?VERRU25PWWVCSExEVVpqeUdNU2JDRU9NeFRrWkVVaHNQcHJvRS9yaWlSM3lt?=
 =?utf-8?B?Y2dlV29tMEJLbDFDLzRZTHgrMFFKN1hFNlVFVFFQU0lDR25pVzVpL1hjZERV?=
 =?utf-8?B?MGI0b2JIbzFUQXltWkhaazVRWlNNSXU1L2pUR21HRGVsVmlJeWRyd0p2Mk4x?=
 =?utf-8?B?ZUd2RmlocEJ2MTlIUkhqKzdWODh2UkljUmE2WlYrbDBKQTVreGY0cGtrRDdK?=
 =?utf-8?B?RWMvYzNJQUJSTmY0Nkg2UjV4Um91NEpUU3BLZndnV2ZqY09JRVVTUFZ1aUp0?=
 =?utf-8?B?a3FLT0J1WFg5VkdmVzgzSjJ0c0RKTVIvYitGbXd4QlROT1o3cGNWSkh0Z0pW?=
 =?utf-8?B?ZHY2QVhKcDAxTk5pVTZuWDZ4S0xCKzd2RFRJQkEzWW9jdEQ2cW9UUTA4MVI3?=
 =?utf-8?B?Z29QeUxxR0tPOUVyV2lVeHBDVXNIV3NqQVc1YW5tMGJLZkNIelZvODRNSkh3?=
 =?utf-8?B?Tmd6Z0NYMm1qZ3dBNDAvVmZMSzk3anZla0srdU45ZXl4WnhSMU5JMFV1UVR6?=
 =?utf-8?B?VS9OSE93ektXblZhb0tnWFBOTS9EeHB6a3R4M2VUMktRNXoxV08zQ0UvcC9r?=
 =?utf-8?B?OThJM0FyZlJyRlNFY3pIaVI4SVN2SWdiRGNDVkJOVzZteXE0YkQvZ29RNERa?=
 =?utf-8?B?TFVqMHA5dnVtMGVmOEdMZ2FBZGkwdjlrUXAwNVQwU2VQb1lLUmZXSERVMnBN?=
 =?utf-8?B?RFE2NjVQQmdXaVo3Y0gxNElLZC92dnlJNitNbjZUaGdycDJNdU9vM0g4VTda?=
 =?utf-8?Q?P+lmPVvz9qQNBiEksVJeih629?=
Content-ID: <FB18556F848D4A49A49857E6CDB2C408@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2134a77a-15a5-4e56-7de4-08da8cfd4894
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 16:07:49.8026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IGKhWOzv2WEUnJSsud/rTpd8ebVhxOrPZfcrfSxh5irKv8f+AnQv5y9EIQHgKzzzF1ONaAuSWW1YS3PqxLpqmOebJTzNWU2DBP0YdOaPfPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_090802_075066_9B38745F 
X-CRM114-Status: GOOD (  13.12  )
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

Hey Palmer,

Two patches here that are really not particularly urgent by themselves.
Both fix the interrupts dtbs_check warning that I introduced last week.

As I said on my application mail: "patches for this dt-binding are
usually merged via the riscv tree so I have taken the liberty of
bundling it with the dts change".
I would have sat on this for a little & grouped it with some other
stuff, but Zong Li wants to do a rename of the binding [0] so to make
life easier for them (and avoid this change being clobbered...) I
decided to send this to you this week.

I did not bother marking it CC: stable since it's just a binding
checker warning - to be honest, I'd have sent it via for-next if not
for the fact that the warning fixed by these patches went via fixes
and I didn't want tooling screaming at me for invalid Fixes: tags..

If you wish to apply these patches to for-next instead, they are at:
https://lore.kernel.org/linux-riscv/20220825180417.1259360-1-mail@conchuod.ie/

Thanks,
Conor.

The following changes since commit 1709c70c31e05e6e87b2ffa0a2b4cc0da4b2c513:

  Merge branch 'riscv-variable_fixes_without_kvm' of git://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git into fixes (2022-08-25 16:38:01 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/dt-fixes-for-palmer-6.0-rc4

for you to fetch changes up to 0dec364ffeb6149aae572ded1e34d4b444c23be6:

  riscv: dts: microchip: use an mpfs specific l2 compatible (2022-08-31 16:57:51 +0100)

----------------------------------------------------------------
Microchip RISC-V devicetree fixes for 6.0-rc4 (or later)

A fix for the warnings introduced in rc3 as part of fixing the console
spam from the L2's isr.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (2):
      dt-bindings: riscv: sifive-l2: add a PolarFire SoC compatible
      riscv: dts: microchip: use an mpfs specific l2 compatible

 Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml | 79 +++++++++++++++++++++++++++++++++++++++++++++++++------------------------------
 arch/riscv/boot/dts/microchip/mpfs.dtsi                      |  2 +-
 2 files changed, 50 insertions(+), 31 deletions(-)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
