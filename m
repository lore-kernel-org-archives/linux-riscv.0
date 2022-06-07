Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2E6C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 06:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rMUP/7DtrfMUZLnbRwbDD+auUFXat7KBpBRnINXcEaM=; b=hEoI6MJOGWNvEM
	Woyppy96PO2mYK5qfbapgvrepeTnDFL6V63qATkLJ7lAwfXAlhZFl09X/QQjD1F88ShysmrcAA//3
	3Wm2D3CVIQj+xHjErqrMpR7HuAD/u1i8kYB5FG6cHO1P0ugluGSuxSg4QLAhnSbRs7ipv8Zl5lQl/
	3ezEoyZwTZVMlrO74f6LS7PMNglo8WZDGhfkXKu5sBI3VPpMlTCSpDgsf9MPlmwJ2KDihPMxZO1xj
	akKaZd4TEfegtVk/ssLvtEsP8dLWAi9tT/4OAb/oTf6r27bEk0xFWbWKC9yqePtbDF8/P+mQIisnx
	vdmf0D4qAtLQflWHplmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyShF-0051Wr-So; Tue, 07 Jun 2022 06:28:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyShC-0051Uk-Qg
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 06:28:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654583288; x=1686119288;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4HGvOBvyGq7UQF4mMGyN65rIkDc9xUnyYzQOZfF6PFg=;
  b=pg1X5u1DD4g1bPol1kVk8Qi718lTtcoQHjA2qgoc9iYnfc2/X/wJcp1T
   1bTlUT4vTI2wmnQoZQtokKwLC5uLWBXiwSV7Ritpjg/ETB3Ksyr4JsuB2
   oQOmGNbMnJzWdOXhi5v4KgG40VZ+FoKMosLnlvDojN+jADgm5gJdSfBoP
   oQfC7xQSkvPDGS6QI5SVj97tb6Gh7uXCCkBw/DiA2ahlJV6tpwmExcbja
   h0CpzC6PKmMEG4N8B1pwJ2iQCGGiyGLgzKBuz6NAe/mysPYduM78gCmIv
   dAGCeF8zQMJUukqOAOgr3tg3hFhd71xvLtg/myNneKN2Qei69va1Vi2ze
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="159149173"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jun 2022 23:28:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 6 Jun 2022 23:28:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 6 Jun 2022 23:28:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfQoPZHkxMvj09GeghV/eTeVF/A5AMaI1SFh3CZq3R5+nkAAi99h/LvWmEGcsxEvFbOhVeNgpq9llyigifb7REiVsewvY3y+3D+9u2+ICOBblWXBR4XBUTsl14my7ulQd9MtRo07k6HbQ7xlvXVz8gVXIe4YLODuMLt2//a/B35vMmpauAkH8AeqD1Xnd7y51+w0jjGoVZalidf2tYCC2Eo9aiDrtlvvF/3e8PmOyNmBtJcxuq8iXPzgaZtNZD+bal9lBk5KmIyWxc0XR8G7wxu0aoAslfw2K780FT1h7UQCi+bdouCGjOImAveioEriey565IgyF5cUQiZ1JSa8+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HGvOBvyGq7UQF4mMGyN65rIkDc9xUnyYzQOZfF6PFg=;
 b=SRhMmPVWXou80yacDddnZLQa3oedcEALJHapD6ST8bJD9E/AaU6NOFs3Ssnt8F9jPdS6GntOjDyLtalxb0jjkBB/uVn/WhEnpwivAlVFq30MDyUjN6x3rAU6Wp6ytcIp1dYnIxocgoDDt49g4RM00xeX7cNY7VniKFJzlGFcuyCizFLmPGbzI5/1B/rdqewK0voFkSVyIBZ0XiZS21k+rjc6KV/RIMJwn8BCEIua7UfkbEya2nXyP0Ez6qluDA9YayiIWe1oU7mYXNO/lunzpiXKuIFif/MqTWrlTLQtlrOBNFFrAQoqIS92uujm7IQRHc06+FlHnzTcNCpP2feYqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HGvOBvyGq7UQF4mMGyN65rIkDc9xUnyYzQOZfF6PFg=;
 b=BCkXDR5QykHfBNMTM6nWw+gMIlzakP/3+awdy2imKjIlTxcp7ocIQisIyAPQIH8GJJpkFxIH4ilZmj0csXEAK4GnZ4v/jNMjSBKiPTJCt+qViBFMalBGrAhax2WHg2cqx+0egoy21kWrbmgkmQVX8KXd4RLj4U7RvjhpC5ewJTw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BL0PR11MB3236.namprd11.prod.outlook.com (2603:10b6:208:60::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Tue, 7 Jun
 2022 06:27:57 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 06:27:56 +0000
From: <Conor.Dooley@microchip.com>
To: <sfr@canb.auug.org.au>
CC: <palmer@rivosinc.com>, <linux-riscv@lists.infradead.org>,
	<linux-next@vger.kernel.org>, <Daire.McNamara@microchip.com>
Subject: Re: Please add Microchip RISC-V branches to linux-next
Thread-Topic: Please add Microchip RISC-V branches to linux-next
Thread-Index: AQHYefGmGrpMi2Za+ESP/Wott2kYNq1C/AYAgAB/HYA=
Date: Tue, 7 Jun 2022 06:27:56 +0000
Message-ID: <4de48549-5382-f4ba-20c8-af7699c327b8@microchip.com>
References: <5ecd9c16-ce86-3666-3c2d-a14218659d79@microchip.com>
 <20220607085128.58e003ed@canb.auug.org.au>
In-Reply-To: <20220607085128.58e003ed@canb.auug.org.au>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06c6fca5-e900-4c7c-54ac-08da484edc68
x-ms-traffictypediagnostic: BL0PR11MB3236:EE_
x-microsoft-antispam-prvs: <BL0PR11MB323674695F4700E4004EF73198A59@BL0PR11MB3236.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +w5k52tSEGusp+MUmCFjPI8yYTT8BRI/J2LrZvoTUZJHOjW47SqfECQNsLnPaWk1HR7NL+qkJFsqFLMCe2YFXlOJLuyfkhNnauWzVc2CltyenOTMrhQdRwsLGqtZwSJBn3mLlNHgUMozBZIx7MJ49J10X8JDIFQ4uOvbtiOG2MyVKYPqrnRfldDOtEm2nQpzax0yRtXnozd4D5wUTdXWGA9mbSzaEwpqN+bddWn6qfdvU8GbO/k6v1bUakQHnZwTTsFirbbrK1J10yFjUpdL1OUuJSptCIwTkWid95PNpZekwmo1PyzOWO3c70EanFa2pJt1z3dSpAlvpz1a93gBdMWKq6R6zx+rbZLScBZcrXFCphFBtwB08WHHtAwEFViYDgtIWqDqTap/imPjfhloxE3tGfsCUWwo4TuZRGS6e7aBW41XhFo/Q3ab7FIHra8bwrV3gQFRzVeM36xKEf2Ss+Ea5D8s2hfn6HUGPG4kFM0ZIqIbomAljPsjTkiQmmF8/ctfSCAye28v3fgTbwYd73+SMyrj9F50V8ExOOx4Y0W93rEAvoIgRUtSdO+dtbNx0iwAMQV+eEODddtxv1GERHQohJDXg57rOGnex8GGG1mrJByN31NJQoJ0nkdEsAJ4MnEoVlJNaL4o4QOBUEENEf8Gc4fukNpCUnzkHVabagefOJ4WPOu090crebeJgUicm4DJGWgLa/2rvRi8uMCuOeZfLn+lD/9+g09pHQcBxZHWoNepxXMjAw7dMFV9BKn5QgiX6IQVA6ZMLdQ5jb4+Dm0iNtP7yFkrY+0xCW2h+GYzvlw89r17mJ3MhHSjelSRSIZtb9jL51GVFfUvCxCBZ1D7gA35ZwjdIDkmifWgKQhg5t3p1OKfosY7WywayHWp
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(66446008)(107886003)(5660300002)(122000001)(6506007)(6486002)(31696002)(2616005)(508600001)(6512007)(38100700002)(31686004)(71200400001)(186003)(38070700005)(26005)(53546011)(54906003)(4326008)(86362001)(91956017)(966005)(8676002)(8936002)(83380400001)(76116006)(36756003)(2906002)(6916009)(66946007)(66556008)(66476007)(64756008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mys5dm4yRUVud21tK3hobC9KSHhVNGNEVFMvb0dyY3ZOZTMyOU9uOGt4T0Js?=
 =?utf-8?B?QmxlNlJ3Y3ZQQ0ZVdWFmdEVoOW5qbGFTSG1odm5IYkVRcEN0RW9SNi80aDFH?=
 =?utf-8?B?WE9FZlZpZjRqVENLRWpZU2NCRXhRZitLdU9zd1E3dmtvQy9SWFBidWR4dnJS?=
 =?utf-8?B?ajlIaWV5bzhHc3hmL3dpTEFzeWVwN285ZHNRNmdvQnZUNU14eTNaS0xmQUcw?=
 =?utf-8?B?SnArVWlwSmNOVTFCbWJneEhaRi82SzZxcjh6SUQ5RG1xdW5YbTJObERwMFBI?=
 =?utf-8?B?U1A1Mld0cHZ4Z3V5MU13d1ZoT01zaHZ6WjhJMzJzckNPci8rVTlkcVNUYkNF?=
 =?utf-8?B?Q3RMVTVJQWtLZEp0d1gzekZ1OUZSYmp0T0hYdFpkNXFhb0N3dmN2MFlNWUJq?=
 =?utf-8?B?b3pRbVN1TWlGL01zYUZqSVBVcnpvenE4NkNRb1hZeFd5OVZUMGRTVmdJa0I4?=
 =?utf-8?B?UnRXUk9CQTAxbnVoZHEzZDU4ek8rZ3dvS0hucEFGTnRESmdTb2oySkIxdVhx?=
 =?utf-8?B?VTNSdFd0SEgyZjdCdkdPdkk4MHptaU04SjRsMGNqYkJVcU9qTGJWd3htVFVt?=
 =?utf-8?B?bkx6Rm9UQ01rbEdWU05Pd1JVcXZKajJOVDBER25MRmx5MzJOZ1A5SkRpQzVP?=
 =?utf-8?B?RVdodEwyOXhHdGFmSTBqZUprM3pZZnd3V3lqSWk3WHJFZXgyNVNNNWJ5aXZB?=
 =?utf-8?B?Y2JZVzUwRnIwWXBYZllDYTVKOUhZajlwbk5qQmtLV0tUeU1FdEJDYXpoK0hR?=
 =?utf-8?B?aVhnYXNUYk1oeG5xUmVaQ1puQ0dsdCs2RTMrcnFFUGdOay9ZalVQSlpuMUJP?=
 =?utf-8?B?T0tNL2s4dWhKd2ZhS0tqbi9OejFOYVprRkJubkhVWi9wa2lUQnc2TnZKSjlP?=
 =?utf-8?B?SUtRUER6Qnd1cW5UYVZuY0czcGNrenFsc2QzUXVRS1BjOXZtZXR2T1RldmE0?=
 =?utf-8?B?czZHbnd5TExGQlJvS0tZbVJybE9JaExDbExmMWJRS0FrUkV0V2FjL1RpLzF0?=
 =?utf-8?B?U01wSmpaTCtzWDl0VDQzOTR5OFhUc09iRGxjRDNBaWU3aVpuT01EWTFzY3lP?=
 =?utf-8?B?UVBQYzNSeHJRSjd6ZzZQUEMyOTZFaTV0NDZDc2IxamNHbWRIUUc1TldjK1R0?=
 =?utf-8?B?QVlQdFl4anQ5OTE2V0FESkxFWEdudzFUckw4Qk52ajlOTXgrR21admg1Y0V2?=
 =?utf-8?B?ZWRtWmF0b25kUkovWkU4TnFxUWdENUxRWDJGY0F3aXhOY0J0QUFpV3FEUjJx?=
 =?utf-8?B?c2tUOTBwaVFlMWh6eHdjM1ptM2pwd1ZaWUtxSnM3RjU4a2YxWE5BaXRVWWNJ?=
 =?utf-8?B?eGVjUzNpUHF6cEZwUHdlSzlmSmZvWDlHSk5DWlpwdEpYWDVuVWM4cGdIMHh2?=
 =?utf-8?B?dXh1QkZhK0dFUEwyYWh6cWZYa0JrRnBXNUc5VlhwZmUwWVZDaU9ZVFhRWGtX?=
 =?utf-8?B?SjlyNmpsT3hGNzZYT0VlU1I5RERHTklnRm90a3N1d3oxY2FXcGhmOHdUcDV4?=
 =?utf-8?B?cU4xZUp2a21hNCtYZEJNRjNQQnlXa1JEQktKaDBkb0g0anFnbzdUM291ejZr?=
 =?utf-8?B?MG1nbHhtd3hWQnVhM0VhUFhzZkp3RmdkR2JTUVdLRi9vQnF0bitBNHRwR1Qw?=
 =?utf-8?B?WXNPQ0VvYWErVDRqeXlSVnNmZVU5ZWkzZVVnV2JnUGxocUpGTFlDZHNlQjFn?=
 =?utf-8?B?NGJzRFQxQnlxYU90dDM5RDNEYzVJQldVVG4zbXVsb201RVNnSkZyMnFwNFVs?=
 =?utf-8?B?cWFVd2tEc2tCMENWa2FzbElhd0hYQWh6SENKMmQxc3BtM0F2V0VNM252eDVx?=
 =?utf-8?B?UTY0MSsvRzFyMzNnVzJHZ0FkUU9WMWVoUHVkL05VWWE0UlN3Y2x5ZjM2M1ZG?=
 =?utf-8?B?NUl1b1NYWGVKYkFlU3o4L1hmNDRTQWZYM0N1S0xoZk5xU3RzQ1luY3JxMkxl?=
 =?utf-8?B?cFdBeTd5T3dJQy9XYVZLcVB5RFB3SEpkS2FWWXBQT296dkhHMVdZcnovM0lF?=
 =?utf-8?B?OXN3aEhETnJ6bENURVpLalJEQjRBdUlUOGpKaWROZXc2QVovOTVlSWw0VEln?=
 =?utf-8?B?eGwxMlRlUUJDczdOZE00Y01kaWV2ZCtzcjdmME1ZYUhSaHozNVVpcEVLaE5l?=
 =?utf-8?B?SFNEMkRjTU55VzliQTdaZVZ4NmpiWHhtSG5YWW81RlZuMm5NRXpYZWZrT1FP?=
 =?utf-8?B?NndPMExxTEJWc0FFRkdZOUNUbTJFaWhyNzVDZ1BDQllzRENrVXVGRm5JS1BB?=
 =?utf-8?B?M0dHTmZHbmxyYzMyUDNZSHpjVWxoQ1JIZlBjMXJWL2YwZm9zYWptbFRmTGZk?=
 =?utf-8?B?MXAxVCtQaDhreVMwTzRybnErNmM3alp5S1JobEdDeExSamR1WXJlZz09?=
Content-ID: <94FAE1E8D92EDE4E9CDCC683C39CE1F8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c6fca5-e900-4c7c-54ac-08da484edc68
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2022 06:27:56.8664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NR/4sndIBRFmCRkVNJhWAXpw2gqMRWPG+hyErJF6WO1fZtL+HQ4j1P5Fm2icVjoTmCnswOz4PtkcEFlfdIwMk/aRZJBC+hWEjeNM8Ca9wVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_232807_433177_D763494F 
X-CRM114-Status: GOOD (  13.90  )
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

On 06/06/2022 23:51, Stephen Rothwell wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> Hi Conor,
>
> On Mon, 6 Jun 2022 22:06:19 +0000 <Conor.Dooley@microchip.com> wrote:
>>
>> To take some work off Palmer's shoulders, I am going to send him
>> PRs for "my" (Microchip RISC-V) device trees going forwards.
>>
>> Could you please add the following branches to linux-next?
>> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ dt-for-next
>> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ dt-fixes
>>
>> I had a quick look on lore, but couldn't easily see an example
>> of someone requesting a tree that goes via Arnd etc, so in case
>> it is relevant that the PRs will be to Palmer rather than Linus,
>> my branches are aimed at
>> https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/ for-next
>> &
>> https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/ fixes
>> respectively.
>>
>> Please let me know if you need any more info,
>
> Thats perfect, thanks.
>
> Added from today.  I have called them risc-v-mc and risc-v-mc-fixes in
> linux-next.

That's great, thanks!
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
