Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3708FC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Apr 2022 10:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5LLVwMe/yMkMXzXmzhDJx0pvlhQ+tL6nlMo5Nj0X64=; b=kWJGWAgZN7Rva0
	wyTzaJZ3EDStONWN411mTQd+Qab8lv8js92D7Asa7GG9ZxxphmKuwmYY2DH1px/ICWnfBTtFbAy62
	oHooYDeHjggpwq2VgM35sGkq/cvJVZO4pVKu0kxx+Ou8MMA2jjQ1TbLqzyZB2g5qpPzlvxi/c+9yC
	jqLMA93G+ofQDikgYVcoXwH0DrzMaJOPSBy/KLWCZxX0clN6yuDvqdvwXIWV0q2SizJDgwfZEBtzY
	XUXLxWYhwGNT78D9AcOroy0Nm75riQ/yyPZIFPY/1MWmmkwfSCYB92fE8GhDl2mnjpVENkSA48H6M
	jqugr1tTkVFufKwpIxAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkO6V-00AsZm-9F; Fri, 29 Apr 2022 10:44:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkO6Q-00AsXR-0i
 for linux-riscv@lists.infradead.org; Fri, 29 Apr 2022 10:44:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651229037; x=1682765037;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9r2f8XwLAqgr6J7v5jactrjsIPbFf0owJpCVw26mgw8=;
 b=WEax5V+Bw7qEiN7DtWEkejvj3k9mwLW0pHyxKo1vkYPbkcuUwYUOOD0C
 V7jI51a74Sdq3lBOMZsJ3iTs0F0rZh7awMSUl00Fpiyn4KWwuj7ZhiHtM
 G0qjWuPGt9BKzN60yepmq7Q7OEE5IQYEf9ot7KnKs/ZmB9CdATRYSXArw
 BN8hjjYGfUbp/GFDPWSzQO29bqJOWrEmTRm4watRWTQ07/sq6ZqqnlViU
 8VbbJkNnBZTfpsrNOqHTChzFkCXkIFRYSQ15b+6ei6GYI938wO0hUD/QT
 Sr5oJlzqo7G7TOJFeotUGJP+tISINF6YXTkOJyDGDGRDFj0hPQxnM1VN9 w==;
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; d="scan'208";a="94031995"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Apr 2022 03:43:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 29 Apr 2022 03:43:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 29 Apr 2022 03:43:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqtv4flsOBBMi9bnpNvpoKAMoaTvMR9bdTn0d1PgtvLeXWrsjB8dyOEpV0u1GOkf1VcuJuG1fJdgjAueuJVZ/NnuOMOe4Y3OQbBw0df/0tEbjFL0QeDgQj61E65YGB8jZdLmoUF9wKy0peJg5BH2XrkIcsYy9/lLWZQsoA5dcuB9H9dIiGZ7tLPAVAY3hpZlu07uXYnbJ63qlMDNHg3EnKya2ZL+TarX9ZLUAJ+Y5OJD9tPlBWdPmnP4nmW0ZFVz3bh6fOo3nNc/xLA2g/kIXRQrVQVkkbhEr34JmAYrPfGuf4uF3OJkMotxzWVdleJt+k/VgnWW6SQf6QsYnlMUsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9r2f8XwLAqgr6J7v5jactrjsIPbFf0owJpCVw26mgw8=;
 b=GSZwDUjVruHjdtu8j9i18R0mUBHHIVEdLjzrvzIIAZG/CREp7Z2G2DpNVXD4p8+VvH7ubg4/dhVLE1Gzj90Vp38TPG9McDsa/oKuSuGO8BDB1+bEROnp9C0nNgwFhy73rATGdPdLFC/xNvjtmAn8CRMtd4e4gr4rZPq1UmWJqzSoFp1pl6H9O2/ajARp8ntzgxs9etVE5Ce9MYTv4TDR3nLZFhoHzTfzt0rebDaLCMLUPS5CA2DVZKnINqUWq82zl5hwdsccI3VqbpKa+FS1zqpW7PKfSNvEO/+ZEjxsfuznHeO6FBi23tvaBTU6MwsP430e18a6o/LAg+z0BnXU6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9r2f8XwLAqgr6J7v5jactrjsIPbFf0owJpCVw26mgw8=;
 b=lrJnBgU9/UePSK6KAYvkykeys+QtOgFdP8PjVeiaUajJ8ltPHF7ICrHv4aFTCWYqwMlE9Uh9+NXDxw9Mo2n38QhyudMgadeo7Bkhb/0/zrozdMxiS+AuSfhgiLae0kZ0wc2CDTpJP02QrTd42s12Elj66yxRDbmlrKv2omo5sI0=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by LV2PR11MB5975.namprd11.prod.outlook.com (2603:10b6:408:17d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Fri, 29 Apr
 2022 10:43:51 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::fcd4:8f8a:f0e9:8b18]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::fcd4:8f8a:f0e9:8b18%9]) with mapi id 15.20.5206.013; Fri, 29 Apr 2022
 10:43:51 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@dabbelt.com>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <palmer@rivosinc.com>
Subject: Re: [PATCH 1/2] riscv: dts: microchip: remove icicle memory clocks
Thread-Topic: [PATCH 1/2] riscv: dts: microchip: remove icicle memory clocks
Thread-Index: AQHYWJG8GvSm7kgmekeJAuwxkHZm5K0GusuA
Date: Fri, 29 Apr 2022 10:43:50 +0000
Message-ID: <78d063d7-a75f-3a36-5bd9-11f610a44ee2@microchip.com>
References: <20220425104521.132538-1-conor.dooley@microchip.com>
In-Reply-To: <20220425104521.132538-1-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af68c131-25df-46ff-53f1-08da29cd2617
x-ms-traffictypediagnostic: LV2PR11MB5975:EE_
x-microsoft-antispam-prvs: <LV2PR11MB5975E861A026811709770DB198FC9@LV2PR11MB5975.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Kj9c+CbMm/of3E6c/ZIL6fwoi7l9/Sp8EW08ipc8DnQiNdyaSUGafdruxdnsX0imH6fZngb+aKutO/sSDgqrzlVhMNxoD0d0Gt5jZotx7jFozZmE67pcWskutKcIwSRlv77Rr+rYi686db2k3iT5sDTeJa/DNWQMgkZXcX9r7LZodvuV/4wzvoFG38hSsoXDTsWFCu9RcDm9kr2pvMITEOuXwyn7eWp/Ja4IQDr7epZiJjkzU5qZ2SOmVRdgKmGjqAgzNv9vDKt+Wqiy1Qkx9LMErGfVIZBu/+D9URr6m0cHb0fDggY2mWfqQj0g7SQ2cq/ARyJBOcDKdpao5IDYpS02pvWQHdSuAPMhxhyG59EIhFfzqjC35N0iSewAqzauneeDzz6M43L0Zu9MJTM2Ekd887ZNivnByuNlth/D7OyJC7XaODJj9wqOWoHaocx9gCR6XVsZ+8AW3BnNISRU/MF6WiwT/T2rUU5wXM2qF/29wfj/WW/j4vAouytsTePPQJvSLEo4yBN3+pVIgBE/c/gAcvMzgWOqQHqCaI/tGu3ulat6EayMfhzMo21Q77BmmB1m/RNgz8YNdsTsCyopi0XafpfKiw+InWJ4MwtpiJ6jwbUUZdV0Bao9Xq9EQVBNZ8x+OrhU3BRVGGBRVL2QyCYNCIJw66GDs+u8UFrubMtEUram/pIZ4stVaLICj6x32l++18CFo6jJ5bKusF59FOdIJEJp2Iw//p0zEQlTblQ5RGRjL5O7AB6N9aUUcSZKa91dUtsJS5WXuEskmzY8ibt2dPRkUwLeZIbLsKcvStwgL38BgQOwHWFmZiko+GgYMspIMgzh6H8pNy4u2utf0/acsoou4tQ/NC1kklVRxBc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(53546011)(186003)(316002)(2616005)(38100700002)(6512007)(26005)(31696002)(122000001)(86362001)(38070700005)(5660300002)(508600001)(6486002)(966005)(36756003)(71200400001)(8936002)(76116006)(64756008)(54906003)(110136005)(8676002)(66446008)(66556008)(66476007)(2906002)(4326008)(66946007)(31686004)(91956017)(83380400001)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZDd6UDZSMmhtanpqSjV3aXozQVVDVGU4bVM2d0dHNENSdE1SMVlqdXFWZjRF?=
 =?utf-8?B?RzMyOHZNcElsVk9MRS93cm9CVWlZZzdMWklkUGRFQVRqLzNVN2M5a2F4eG9n?=
 =?utf-8?B?ZGV6czFnTnBZVkdiVlVVL3UzWno5blBuazFzaHk0YjNrYUZLTzI5UEtiS1Jr?=
 =?utf-8?B?a0NTZncvT0J3NnZyRTVUMHZ2Qmp3N3BmNlBEd2FIOXAxWkFQNFgxWlIwaS9S?=
 =?utf-8?B?NVFnbldFdUVDYWh6Z2VVa2ZhWUIrRVFiVlU1WHhGTzFPeHVoWlNYbFVNcm92?=
 =?utf-8?B?cVNRNUo2d0FOUmZodVdYa2FlMGg4WDI1Rzl6bVQwWUU0RVZScjhIZkVxajla?=
 =?utf-8?B?TXQvZ1FIdjk4ZHpscjVUT0RxV2xsWnJsZTFtd2FiMkZ3b2ZQYlFRQmtTODZt?=
 =?utf-8?B?dzg2R2EvVk1OSG1KTEp0UjExVWxVdjdxejEzWWNrdC9mclB3ejJJNWgzeklG?=
 =?utf-8?B?TGtZeE0xRGtFWlhTOW43ODd1enpEcHR5Nm1JWGdFTUY4RE12em1IeVhNb0Y0?=
 =?utf-8?B?QWpwZUNkYnZmSWNDOXJNb0Fsa1ZQTkhnZ1d3cEVTT1RsODFoZmtYVzJBSm4r?=
 =?utf-8?B?a1dmbkI1aGRGWGtybGdPSjBEUkVleGNkVUZ4c2p6Qlprb2FvTm1Rb2VFcXdr?=
 =?utf-8?B?c1hRUnU5VW0zaU5TT05BaUJPVTVxZFlub1VXQ0VyZ1J5Nk5NR21aKzRaRXRr?=
 =?utf-8?B?N25yTTVNL3ZKZTVod1lSSk4wN0NJeXpDdXN1QUF6ckNHRmtua3N4VlNyb3NJ?=
 =?utf-8?B?enN6dnlaa3Fpc0Z4YmpXQkIxVk5ja2hXVTZLWTNQTXlGcHdKQm8vZlNYTGlh?=
 =?utf-8?B?NVBFTm5sRG0zT3U0QjJ3U3NiQ1dtVnppZDN0RzBZNzViMjhBZWwyb0ZGQ1lu?=
 =?utf-8?B?cGptcGo5SnNaWlVCeXZlaUpIdkNKWkRxaWhjUXp2cGw3cE1vRDdnM1ZHbW5S?=
 =?utf-8?B?eFZTNzZSQVI3UDV2OS90TnB6NklXdFJtbFo4TnJ2bWhDWFZZbFluVUxlTUk5?=
 =?utf-8?B?Qkd6aGhpVzQ0NnlwRTFkN0d3eGNML3FTbU5DUmhjUFpYendIS3hNVkRGR2l3?=
 =?utf-8?B?VXdyaXR2WllyelYzMTNKRGorZ1h1U28vQVVqVUVuVkRteCtVbCtyR0xUeTlz?=
 =?utf-8?B?aWNLcUQwUnFtWmNDRnprUUxxMFB0L1c2eVVrdWozZSt0b0svbFpqMjZsbHJl?=
 =?utf-8?B?Ty9iRjNGNEVSaFlWRDduUHlhVGZGN2NSM1B3Rmxja25qRzFwcUNERmUvYjRn?=
 =?utf-8?B?V3B2Ukg1QlkzTDgrb0ZDWmVGTEtyUy9mRFlaWkdYcG92b3RCTEFwbDJvNzUx?=
 =?utf-8?B?Q2FZQ09DS25ZekVNWUN3alpSbWUrOTAyMkN0b3hDVEZ1anhUNzVMaUZZYlpk?=
 =?utf-8?B?S1RMdEpncVk5YXp6YnF3N1dtRXZaaFNaNUxLcGNLT3lWVDl1aEZldWtGYlBz?=
 =?utf-8?B?WWRiQWtPOGo2bGdvT2tUb0l4QWZtVVJYRlB1M0FxTTZCWFVlV3FXZXBBVy9t?=
 =?utf-8?B?NHczMmwzd3ZsQlNWa2dndTNRalZUQXdEMnNLZmdGbUNSRmp2L0tWSHM5RHov?=
 =?utf-8?B?dVFaMVdBQTBxTVVEUzdJQ2pJMy9GdFk2VnNVN1pyWVgvbzU2QjdTRkxSUG02?=
 =?utf-8?B?QTM4TXJ2b3ZnajZSSTRXZzB6ZVFjQzIrYU84dVRZcVJDUnhSTURkQ3UySGg2?=
 =?utf-8?B?dUU5YnFnZkRXaXlnVWRhbWdtWDNYSnNWS0pLMTBtQTh4YXdSa1V2NmE1cFE4?=
 =?utf-8?B?Z202dnc5T21pQUdzb2ZDT3AydFd1V05Ib2dsQVhraVBCR3ROTXpHck5GSzU0?=
 =?utf-8?B?QjF1c012bnVLdEdVMWgxU2VncUJYS0tJSXJzWkpxYjBlcHB4MUl0WmhlRmNr?=
 =?utf-8?B?WURtK2dPS2V3MmNRUkJ5azMxcm9qcWh0cHpLREZtWlhQaXJVMkk4ODNZNEVJ?=
 =?utf-8?B?czVIaFFmRHZNSk5UUk9pSEdYWTdBLzJETG51SWgxNWlPOHFmK0N4ZFRPSml5?=
 =?utf-8?B?QUVIdUxrMERZaEhPWWliMjVsdTlKNFBpbUNVWTJDUmE1KzgxWVFkamZTMEpB?=
 =?utf-8?B?eE9jVUxTdWp1ZzJENHMzQlpvMmNRUTgwUm9waTJXbmNKc003bURoT2JJWkFw?=
 =?utf-8?B?aklRUlRTWURxNjNwQll6Z21reEh2b3NYbHdCYk9xZXFTUmZmK21mZ3A2SkNt?=
 =?utf-8?B?ZWx2b2lLSmRrQldsNVBlTGZjRXBtMmhFY25oZ09aeDRzQWE0WkJBRDRYci8v?=
 =?utf-8?B?RXZrdVhJVU9ORmhaUk5rK0J0TzQ0MjR2UWozYUpvejZSL1poRUlMdk83cFZT?=
 =?utf-8?B?VTlJV0hCUXBMVGxmRU5tZXNJYXJMNFgwNzF0Q0I1cFJvNXhFTmw0dz09?=
Content-ID: <953194B428B9884EAAAD7635636E903C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af68c131-25df-46ff-53f1-08da29cd2617
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2022 10:43:50.9808 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cW+cIYXzHUkndNkB4eWLv7iKeGZ6mz0pylCGuK7uLHnX6Ibd+Z+/mq8DB0ueDW3mFn9n/aqMbq1nYWpq8i2ZvN/cOtssJeNml96nRYW+Tng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5975
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_034358_494251_EB0C247D 
X-CRM114-Status: GOOD (  14.22  )
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

Please consider this superseded by today's patchset:
https://lore.kernel.org/linux-riscv/20220429104040.197161-1-conor.dooley@microchip.com/T/#t

Thanks,
Conor.

On 25/04/2022 11:45, Conor Dooley wrote:
> The clock properties in the icicle kit's memory entries cause dtbs_check
> errors:
> arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: /: memory@80000000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Get rid of the clocks to avoid the errors.
> 
> Reported-by: Palmer Dabbelt <palmer@rivosinc.com>
> Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board")
> Fixes: 5b28df37d311 ("riscv: dts: microchip: update peripherals in icicle kit device tree")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> index cd2fe80fa81a..ffe683d3f528 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> @@ -32,14 +32,12 @@ cpus {
>   	ddrc_cache_lo: memory@80000000 {
>   		device_type = "memory";
>   		reg = <0x0 0x80000000 0x0 0x2e000000>;
> -		clocks = <&clkcfg CLK_DDRC>;
>   		status = "okay";
>   	};
>   
>   	ddrc_cache_hi: memory@1000000000 {
>   		device_type = "memory";
>   		reg = <0x10 0x0 0x0 0x40000000>;
> -		clocks = <&clkcfg CLK_DDRC>;
>   		status = "okay";
>   	};
>   };

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
