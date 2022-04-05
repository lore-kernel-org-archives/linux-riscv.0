Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF2BC433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 14:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r8SkB2Fl9Sq6nrskWIh1wfhdRYnowgXpj0w8mPgDSf0=; b=LVkZSbW+gdSH2n
	3DClUNWZrDIFJo3PU5DGYSDo6ceYM3vLhJSy23bVSJsaz21MuJGCY+gMmyaq8/xfmw2PgsM+1UIWo
	ijaZlVx0Y99y0og6+xH1/sJg7iH3y8gl6XH3ihvKiNK77XfdxSDwN7/IlgF30d/9+uEW/QjXxSwP7
	wVCp1iOz47AhezEnsr6ZjoNtnEtVD0Owdb5JLclDufv9ig0skWEUnUIMq96t8KYxKtO+747gDaa1r
	TBDfhwccJW3M2H4FdPjs8jW/JnYuVEaen/XnfW2O6IPZrCMr9LI26LIK08Y0noSPOrh5ucyfQDiKS
	1euttAAS3jPB31vpXSfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbk0r-001PPz-Bf; Tue, 05 Apr 2022 14:18:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbk0n-001PNJ-S7
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 14:18:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649168305; x=1680704305;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=hbBDr6jboE4tvIVgiCU7Zlc3ZGQ6odBqHMNfrgwflnk=;
 b=bX+0kPtxjJKrHhxZQb9vgI3d8Mu7fIfEWhcd/Nws2BElcrMUp/fwk54S
 0mNkAJTR9+shb8sfGX+4olhfL9ZO4T5ddjFTagGFCSpd5o3NTrZ9qzEJl
 6Dq+N1QztHp93n2HWWMFOuBwLCJzlHbgnP9MFvx4G6ezLHYTCfHb/pPPF
 vBVfzMaCZZFF7VdaF0MnSjWSnfp8cdcG+FUnVnS9tb0/hYPSmLwrhnKAF
 gumvwq9T0UQ7McXHaXfDVCc/EGyy0hVzykCjHbXc0xRDXfrjTgwpDcot4
 +Yams4eHMlfIXxNzcBFdKUzM3IANtQZuzp13SeafiOM267asq9VmcXS/P A==;
X-IronPort-AV: E=Sophos;i="5.90,236,1643698800"; d="scan'208";a="159370678"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Apr 2022 07:18:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 5 Apr 2022 07:18:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 5 Apr 2022 07:18:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwlVp1TisvSj+Mcp04vlcQARhyzz8spP0yy7qEZXUquIB1pSto7fuyDPLMyA0JeJp1tR92QZYF8/7IxyCSGAW74hkZrMKlK2LaV8E2t6niFYOWVhZ/g4QaAjdqOX8Z8lHwbcnQkOCR7RVwhbnds/OcxpGk33LkeNGWNi02/lnttgcqD2yw423iIigKHHbctYvVsKJuaIfXlW7+XBAL0eAtvnOrGS/18t2Czgq9FwLcKixPQARFTX4HhF4xeU9V+x2FFYKJUlqLkD6YTlSNd3+ngd616JzSUov67I1s04FNwPCyVg0MQ072gPUdOZ66jbCB8OIkgcmTFSeYTEZP22EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbBDr6jboE4tvIVgiCU7Zlc3ZGQ6odBqHMNfrgwflnk=;
 b=SCjJwqy+LeHNgivvt1Kqqr6td0iWXN/LZgyQx4aonLPGW1KuPgwzgDnz3AAPZHE5DaDGiOKhlBD7T/83mN/wuHaEQe+I6auPYagykwjLPMn/41coxX8lb55B6TSY64ft8s9aHwsbFuR18kGIW4A6k8VjIkBEHDEzTD9raDsGHScrxXHE+8FihAhv2IFWVfWAOOzt2k3Shb+n1fWwoBMxfIb9ALDsMqVyjSk5u5ZlDXBu0bsHoChavqew2YDinIfEj6G18FQEHLHMaOQ881YHp/JT/y2eVgB28eojSMQ54RI2ZRRUTRRRketD/VKU4IfsMwGoIyZ5m+JSQv3KZEoqWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbBDr6jboE4tvIVgiCU7Zlc3ZGQ6odBqHMNfrgwflnk=;
 b=XRUTl7vhx4GNM5bwaPPqY/qlxCdjWoypiXUPdkYFJ/VPx3GE85kNf9HtjiDXAVoY+6NHS6Hz+zVokAV4OBH1Rj4T6x6jFSB6GhIxB8+v4M1QDNHkXDIA+koa82G7EI1YXvR9AOQJDTKlqZSaE2gZJLNrtz/14JK6xOlKs45V/HY=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by BL1PR11MB5448.namprd11.prod.outlook.com (2603:10b6:208:319::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 14:18:17 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::dc95:437b:6564:f220]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::dc95:437b:6564:f220%8]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 14:18:17 +0000
From: <Conor.Dooley@microchip.com>
To: <andrew@lunn.ch>
CC: <palmer@rivosinc.com>, <apatel@ventanamicro.com>,
 <netdev@vger.kernel.org>, <Nicolas.Ferre@microchip.com>,
 <Claudiu.Beznea@microchip.com>, <linux@armlinux.org.uk>,
 <hkallweit1@gmail.com>, <linux-riscv@lists.infradead.org>
Subject: Re: riscv defconfig CONFIG_PM/macb/generic PHY regression in v5.18-rc1
Thread-Topic: riscv defconfig CONFIG_PM/macb/generic PHY regression in
 v5.18-rc1
Thread-Index: AQHYSO3IJSdXwoud5UqKTAwCCAurg6zhT02AgAAOuAA=
Date: Tue, 5 Apr 2022 14:18:17 +0000
Message-ID: <98b571fb-993e-9fe1-1cf9-dc09651feb0b@microchip.com>
References: <9f4b057d-1985-5fd3-65c0-f944161c7792@microchip.com>
 <YkxDOWfULPFo7xFi@lunn.ch>
In-Reply-To: <YkxDOWfULPFo7xFi@lunn.ch>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ccae532-e946-4b71-09b2-08da170f2145
x-ms-traffictypediagnostic: BL1PR11MB5448:EE_
x-microsoft-antispam-prvs: <BL1PR11MB5448D948D45DEB881241103698E49@BL1PR11MB5448.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mvUcG6Tn8p36b8FQ5oVKmpEQ37/VVUNuFjMx2isgIY/kS0pY9zvzPpe/XOWQPYxVGlyYPJIQm6XAyL40XUZScb2yxJsfu6xAj03WbJ2OX0SppnIsLDQL1bGcbA45bXZc8OHjLmfwa+ooGaZYdjx+w32LcEBnE5o9kZJ7+tQlbfS+jNh7yKrRfkU1pCapHR8cuOzGP8AY6tZFBl5umUijZA6GkKPrVLjaGG3AsxGGg3rRsT/cff4eymlvH1g6GjJ2ntv0pvo04O+QWm5ma9tkVZJNwGVKzV3Ua5jWUyVceG8QKIC1WHXVTLdyExllQkqpuY8tCqfqITH1lbNV4lEs3OBCWeCTecN5C+jCFo+FnBagr6dXBjny2iXizVlYjTZybA7gpK8DcXVTlXcbEW9ec/SpheknAhkBAZ27yl0CyxffyfcPV+0qWW9dK0ixpDZ/acLmfLLDqWU5ivV68wXGGvF0uAzKgI+HgjXGZdZtW72jNkimAjl4fQxwwV/gdE6GZe2v1QZuf2tWE7AgAmiDpH9RDG9MKPLehR99KPy220NTSf1i7XljxEjcopUVbqNjwH7XmG5dOHHNbVrJh1jNuBpTAgnjhLnZZ1FJpu9qAKCJcMSDn2PD/6D5VC+DRVA2i72cprA0KJnoOd85s5YYzzeJ0q/Lln0qmb/6Cs8ensoRvrua7Kjm423YMkNWfyhd10itJtWaLT5kRLo6Zil5cDnR0/Lc2w5rusyEDrZbd1EoaXsTu0K9zaVeeJfe0lyeOGd91P+0pkDDcfZE9A9KajdjBOcvZ3e/w0R2BB3MLqXJTCOzQnc8ALbZ6tJXp+K0zrXJKxl0QkInOoX87mg0ZPLiLIffmvg5Q4dcvkzR55ZXh4m6TFFk7X68Y/voN5EK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(966005)(508600001)(71200400001)(6512007)(2616005)(86362001)(6486002)(53546011)(38070700005)(31696002)(2906002)(38100700002)(91956017)(54906003)(6916009)(66556008)(76116006)(64756008)(8676002)(66446008)(316002)(66946007)(36756003)(26005)(186003)(122000001)(5660300002)(8936002)(31686004)(4326008)(66476007)(41533002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TE01TUpkeHMrK080Rml0eWJ4OFgyd2tCN093Tld4ai9qYVg4ei9XSTBycVlj?=
 =?utf-8?B?SFN0ZEl6MWZ2US9KRjVGR2FBVWpNRjlsdngyV1RsdGFMM2llNXpkQ0NzUFZX?=
 =?utf-8?B?bmcrcXJaZ25KRWc3bmkzVUFCUC9rOEJSclpIaDFrUytBMDd1VXVLVVVNeXJF?=
 =?utf-8?B?VHFSUHYvais2bUZaN0VYdUhoS2IvbTdhNVlsRVRlRFRQS0VYTTNHNE5LQVY1?=
 =?utf-8?B?NElJM01XZjBtTnR4UUo4VEJLbjJCVnJvTVBoamlETU1LQVdHUS82R1dVdXVz?=
 =?utf-8?B?UVdESXk5TFZRYUlBUSt2cDViOWpaaDdwZFNOdXNPRDVNZVArNi9VemZETS9F?=
 =?utf-8?B?M0Y1QWdvZzVnUlRuVzlSOHVVVmJiVlRQd2JSTElvVW5oM01SSDVjY2lySXNY?=
 =?utf-8?B?L2hLMDRQNzMwQjlGdVBtK3RmdVUwSld4YUxWcDlHVWxtMzVQZnRjZXZRcHBN?=
 =?utf-8?B?Q2w3VXhWQnhDZEt3eE84N2FZcGcyMFVFUEtXL1BTQ0JVa1JQOXN0MjBXeHVJ?=
 =?utf-8?B?MGhtSXYwcTJpNEFqOG1iNDZ3Q1FEcEU1TE9LdTg2cUNhZkgrREF1ZGN5UzR2?=
 =?utf-8?B?RUp2aEJuell2Njd3Y0doV1p1YmlIYTN0Y0NuN1dsZElDREJMSXBxaEZmc0FT?=
 =?utf-8?B?WVBxSkRVZVlkRGIwTlczdkF3S1ZWNjFIcmlUajJ5N3lacTZqTitiSS9TTGpY?=
 =?utf-8?B?UDYveEpCaVQ1dkw5ZW9BOFMvTlRLS29DNFU3KzVOTE5xMUltU2dXUmMreFNI?=
 =?utf-8?B?ZE0wSWJIMUQwcE0xN1ZZa1NMQ1lWckQ4anJXcXZ4bjVIOE1RT2FTOEtyWmEw?=
 =?utf-8?B?OXJJNjJTU0V2blNVemhsN2ZjLzY2ZER4bnVPbmhIclpUWktEaXcrRjJOaWoz?=
 =?utf-8?B?bkE3eDZUd2NtZnBONHg2bDM0eHpJWkRXOHEvWk9DTXFLMHBublRmdCs1ZUc4?=
 =?utf-8?B?bHBtRzlva3hOaXdjS1ZYVDA3YjhvaXJVQVRlYVIyQ1N0ZERMNFJXOVhaRE5G?=
 =?utf-8?B?U096TlNaODhpVUJOa0hDQThQeUdscmg2NmdKVlpURThYZXhxVnpVUDdPUGg5?=
 =?utf-8?B?QVVzakpGbWhkMkFCOXJESHNTUkVIbndHdHd3dXMvZkk0OWNnMWJHSDl4OElh?=
 =?utf-8?B?OVRsOFpBRHhacC9EOG1QNXE3S1VkeG5hdG94dmtNVlNOYXVDVytaMnVVbjBj?=
 =?utf-8?B?STFiWWpmSENXajlwQUxCcmZDc2xLWWJQM1FvTFFxWlBMcGhZMkRYZk4rUUV2?=
 =?utf-8?B?aEY0U2dyQ0thbzhQUFJSMWZyTlZidnRwV2xwUG1zVCtBcytlSlArTVRNdnMy?=
 =?utf-8?B?WUFtTkpiT2tXcDNteDl0UE1HS1VLdFVBbE56ckpDUVpvTTNoZU5CWW9ZQ1c5?=
 =?utf-8?B?Y2g4UWZYYWl2MGRxd0piVmhFQ0F1NjJNT0R2MXdhdnpyVTZ2cmxMKzhydG5p?=
 =?utf-8?B?bU9BbEJkaER6Q2dhbU9XUE0wUyswMEdPUUxZWFNmak1Td3U4bHZrbFI4cUJz?=
 =?utf-8?B?RE1zbEREdUUwT1haalJCa29yaDFxMUZVS0JTcEFJOUxZS2lpYUZpU3JNTTRm?=
 =?utf-8?B?eUdyQXhBb01BeXFQcElnODB1d05uSUtvUTJZRG83RkVKaGNYZ2ZLbURKaGVU?=
 =?utf-8?B?bWFPazVuTHN3UVpsSTZINVhTdXpmZzJGam9VeUhwOGJwYTBuK21CY00xUHcy?=
 =?utf-8?B?b1FWS0RTVzYvKzlFM0E0dmtYTnV5a0lZbUV0V0pEYy9OVGRjS09GUHU1SDly?=
 =?utf-8?B?M0FqNjYycUhma2ltaEc2b2k0bWl0Ykd0N3JxeDNtSUVsV1NEc1BFQWVBeXN3?=
 =?utf-8?B?cDBRRHhtdGpodTlSekJWU2Y0Q3J4YUlEd2s3SGVXQUlmMGFwdEZzN21aWGVD?=
 =?utf-8?B?VXVpRk5jOGxhRGlBVlAxcm1JNnVZUTRsUzZUbHhvbk95Sk52bTU5azAzYnZa?=
 =?utf-8?B?LzM5K0tmY3NPb1hNbG9ORFRXR3owZ2xsMlJoZkpQTTN5dnFMT3BJZFFWbk5G?=
 =?utf-8?B?dnd5cVB3MWVUd0ZaWkNoc1BZUUpXLzFNM2hpRGJNckpINnBkRzZSYmJKaE9G?=
 =?utf-8?B?bU9wcmkxeWtqcmQ5ZEgrWklobWZlbU40cEQyU2t6WTBMYkQ4N3o3bnJqYW9h?=
 =?utf-8?B?UCs1anRkbjJ6ZzRRYlJLZ2p4NTUxa2dKVlREeVFLTUJJM0FTck1velBxWGJK?=
 =?utf-8?B?enpoNXM1N0FYU3pmZlZHcHFZMFc3aUV5U1cyVnpicGVMTzBaZ1B1OVgxZVZS?=
 =?utf-8?B?eWs0M1RDSDd2R24yMzBZV0Yrb1VjY3Z5VVhzanI3U21ya3FJdzFTSElzM2hp?=
 =?utf-8?B?MGlHV2QyZmVXejhnYUhlVnI2c2hOUEdmTmlKQ240dzVURFpwU1FXQT09?=
Content-ID: <25E4D65E2B3CDD4DB027578BFA90E09F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ccae532-e946-4b71-09b2-08da170f2145
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2022 14:18:17.5516 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c1qfj+De/UwLX6x6NB/xse/LSZsTMVSvj116q2XO/A5FV/2ZQUDSvetZumJc0g1Wf0KcTdnQQj3wrOZgVJs8+IbCtmM7bDm4wIrCHzNcwxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5448
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_071826_157078_D92434CF 
X-CRM114-Status: GOOD (  14.31  )
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



On 05/04/2022 13:25, Andrew Lunn wrote:
> On Tue, Apr 05, 2022 at 01:05:12PM +0000, Conor.Dooley@microchip.com wrote:
>> [ 2.818894] macb 20112000.ethernet eth0: PHY [20112000.ethernet-ffffffff:09] driver [Generic PHY] (irq=POLL)
> 
> Hi Conor
> 
> In general, it is better to use the specific PHY driver for the PHY
> then rely on the generic PHY driver. I think the Icicle Kit has a
> VSC8662? So i would suggest you enable the Vitesse PHYs.

Hi Andrew, thanks for the quick reply.
It does indeed have a Vitesse VSC8662, but the link never seems to
come up for me [1] so I have been using Generic PHY. I'll try look
at why that is. Either way would like to know what's gone wrong in
the Generic PHY case since that's what's available in the riscv
defconfig.

Thanks,
Conor.

[1]:
[    1.521768] macb 20112000.ethernet eth0: Cadence GEM rev 0x0107010c at 0x20112000 irq 17 (00:04:a3:4d:4c:dc)
[    3.206274] macb 20112000.ethernet eth0: PHY [20112000.ethernet-ffffffff:09] driver [Vitesse VSC8662] (irq=POLL)
[    3.216641] macb 20112000.ethernet eth0: configuring for phy/sgmii link mode
(and then nothing)

> 
>    Andrew
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
