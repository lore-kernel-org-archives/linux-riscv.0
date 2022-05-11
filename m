Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5700C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 06:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kBabuB/jZxT37C8LATh+AjjwG6tBKTS7VIoJhNWsT6E=; b=AWMJdPBV46soQY
	RWsat0fqETVS4Wx2GEsyVvcqaFRHcORvcX5HpzR6MLKXgvExKkChhCHmjtmSh21tyPgdoKt7e6LxL
	kJ5XhftUR6mGTAaFv92fd5STZ0M4K5k8QA/tZyZcS8C8yMeHPp9mBmE+U9BEbABIdSighpKtOrPCW
	h+H9o+oWlB+orR3bbb27io7Jt7sZLpS/5DK1sIfaCCZOr8Xx8eiqgDYuecAuV9nN3s24Fs5vvFR4b
	QmXGKX+9ABBgFA91YOK2zUN0xALEuAGfCrF0ziPxk835I8+Mz1V84x7eMpLnZQvomhuar8Y096EXj
	cHguaUMst7dVwS4Et6dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nog5J-005W2W-1g; Wed, 11 May 2022 06:44:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nog5F-005W0D-9b
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 06:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1652251469; x=1683787469;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uO30vbp2b+H7Bx1jE3CaAUFanu3s8idYsvDvc2QHHpQ=;
 b=c6eaKZNg3HNOYBSLKaSoKFGfFNYsQehC+ujF4zrisw/7xAO3c4FM9tm1
 52HxpOOcH+3uPmfPihDvAUAKBk38EJ1Q3IC4QMbeJHHcJqJ7CJgFszM+E
 7iy6HCZWTTmsF9+mz91z67hLLkPbuDAu5a7iQWJMesOKfSmcM1JRwnT1C
 a4VkLpbwqjnkEeX5FT985WjU8nby1SEdPXes8miWKnY5L+uGcaZcWQpMn
 s1ri0mgYGB1ykpdJ8Sp3HzEAYrgFkdAHUw5Q04KbKrWDJEApS4Hb/H6za
 xqOW6LF6WWaazSxiOspTlAEEyZiAg7zPaxP/x99IU3Tsf/k+jmCR3fKIX g==;
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="172847395"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 10 May 2022 23:44:25 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 10 May 2022 23:44:25 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 10 May 2022 23:44:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBbWVdNsKJKiXe5Y5828mTLM/GuXEVe+/jBf/GTCh/iKcM5P5MtTaqA8h5O1iZOhUcaNFP81xIUX0fvO0jFADSjIvhKJLyMv57qH39/WScJG94hi6F5Wdip+2yZFLJpMuqTJScRaMNsEGNpkql92u7otJs2H1ViYFPiuj+Oo8SqWw8tnq/97MnuVVhxfLgYlS/nQMOzsUNHroc82jxKYRIfdhs2CK9dlzGInphd+yIiY8jiW4UqikC3njNBVQ607XE/KFSnTXKTVYkS8CLPXwh5UrTo1mNfK00g/JuYbHLG5YGBig1v5gRWSWDcmG8DLIL3vVPNTDhfQpos+nEDW5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uO30vbp2b+H7Bx1jE3CaAUFanu3s8idYsvDvc2QHHpQ=;
 b=H8xghtvWjv9hxh6kQb3zN1TPseBOFBa7sc5XDnOzs25vdxSW6X8nD2RA6tmuaZQPRbjBhoD5Yg6GAjFgMf4m9BeeNZL4F60o++Zw/qUSbO6Ab+Dr25pTtMTRRjbTGOvC27vXXnala7ZbqHrZZNHWnKVtvitMh+wfL+NK40bvIXekO5hEpGO7iQBWLGngtSG0IA5vtJesyu0LT/5Vpf0OumAhkdZjksrmKzKk3JuRhr4J3qJPOC6kX47kKHrUOAX1RefVL3iy+cQv3QowcBndTmiQf+xpZa9xIOMZuxp/jGu1Mb093odnDtkXewlHvOd+GLoyBimUJqJ/LZN8UxaH5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uO30vbp2b+H7Bx1jE3CaAUFanu3s8idYsvDvc2QHHpQ=;
 b=CoNXPu7gI8+zLZuF+KBV/9gUzoybHhvfOtfnjkBQm88WTUJ9qAzGj2B5QNH7EWI0lAFHsgg2vxyG9/jC+2NSbs6K0A3wVQ9g5Z6Ul9ycrSNf/dCslqK+AFOxLnevjYwXYWxQlY2sv8n4lKxhkgn5czdZshVTdwuo0bYK87FvFN4=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by BN8PR11MB3586.namprd11.prod.outlook.com (2603:10b6:408:84::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Wed, 11 May
 2022 06:44:22 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::d10f:cc33:cfd8:365e]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::d10f:cc33:cfd8:365e%7]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 06:44:22 +0000
From: <Conor.Dooley@microchip.com>
To: <hch@lst.de>
CC: <sfr@canb.auug.org.au>, <linux-next@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: linux-next: Tree for May 3
Thread-Topic: linux-next: Tree for May 3
Thread-Index: AQHYX5FrH/BqiZa6/06OwkWdFdBwha0Wk2YAgAAKyQCAAAevAIABXEcAgAE9tgCAAAeAgA==
Date: Wed, 11 May 2022 06:44:22 +0000
Message-ID: <102578f2-5c10-e9c2-c1ef-e76ba90d011e@microchip.com>
References: <20220503172926.08215c77@canb.auug.org.au>
 <3f94c9a8-c927-5cc0-7d67-4b21c3d9dbaf@microchip.com>
 <9a424be9-380f-f99c-4126-25a00eba0271@microchip.com>
 <20220509141122.GA14555@lst.de>
 <dd946220-eaf6-773a-06b4-307cda466c9c@microchip.com>
 <505d41d1-1bc8-c8bc-5ebb-8a2b7934f3de@microchip.com>
 <20220511062232.GA32524@lst.de>
In-Reply-To: <20220511062232.GA32524@lst.de>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ffb0e57-3906-43c4-2804-08da3319aedd
x-ms-traffictypediagnostic: BN8PR11MB3586:EE_
x-microsoft-antispam-prvs: <BN8PR11MB3586E0449D7CBC4ECB83CC1398C89@BN8PR11MB3586.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K+w4c0HRQ9LSTCIDlphbni5bGi03dZDH9v1AoPUqcr6Blo9Fwzk3kwYu2AI+QSX1XRT9lX3op+8L5xmiOM1LsR/Ce7v6KJz4M6WVOEO8DmAQL3X89GN8CGbNnMQt3xwW5lfEW4C1pKhx+v8ifwd5/mwqJxixsWS/RZh12XXh4q/sNP90vXzZC7i/uEiLOwX/Kx07bzIzyCmp3nKkfFmpDzin/8Vz0L7sIe6RaoGEy7hV0Yare6DtKU9cz9OSrYMZviMWr0H6FKANOsLSWXJXG8SzP40JHsqD/YBT4bYWf5SjzEF2MAVz6S2gzS9YxHBN5Vu8IUdBNyIdKCJdzQN7ZiiknbuiRc+3+W2Yk+p8pCfBptuhWYkommfr+3/Zibx7sXqJfhRd093ojlmyR+R5VuPd2e45d9IfhnH6eX392H4iUbP6sbJS32MWzyz4i6EcapzyhTePmP5CT5qq5geuVtNO7w2t98aYJLG4XzWUfaKJVA69TnNcDm5b0+yEblCEWKvK4+rOMNfvQPY4s39gVfP0EM2HZP0MwjKcrwhGsYRKle35kAsAU57RSqRG1xiBZ+k9c65U0ZYrD2JagDmRQ/fB3QLi99t4M5O+ZA3ljdIuClqjn//agF/44m3g0BXfPMA3zJKb/0XaZnv9PAZUYlXxVAs6IEe4KRLVbn2ktsOaN3oXyjDJe4nX32Q7LsPmxJOmsSBcBAR0QC7uQASAZ3+RQR8XHAZ0G5Ax+SsD718tknhucM4qHf6Y/jbayJaPmX0s2DpEp2yva+K5aJO22Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5160.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(122000001)(38100700002)(91956017)(53546011)(5660300002)(36756003)(31686004)(6506007)(83380400001)(38070700005)(8936002)(26005)(66446008)(316002)(66476007)(6512007)(508600001)(6486002)(64756008)(66556008)(66946007)(76116006)(54906003)(8676002)(4326008)(31696002)(71200400001)(6916009)(2906002)(186003)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUVKTFJ5aTJPd2QvQ0xDclFtMmVxbStPeGJLNHQvbWFORFRmeGdpY2J3aUZK?=
 =?utf-8?B?MHZCYXZUUU9hMnJ1YnFDSU5UbitORnVPUlphaFJpcEp3UHdmV2ZmV013eXhU?=
 =?utf-8?B?aHRDVGp4UWRUdmI4cm5vbFQ0SXpFL29ieFhzVHRMclE3Q2d3RlpiRS9EMmo3?=
 =?utf-8?B?RFVOa2t5LzdjdEJPVHVXbEwzeXVBZWFSME1xLzE4TFFRZ0QySks0UWY5UHZx?=
 =?utf-8?B?TmcxT011ei9iUmJqY0NHc3lEUkVSV2IwbGtJS3N2R2gxeTR3cmVvcUVJM3M1?=
 =?utf-8?B?K215NW95ZmZqVDYvdHdIYXlKWEtpRmMwVURhek1uRERHbzNXNk5KajlyTmRh?=
 =?utf-8?B?TERNbmFRclN0VXBQWWxmODZaNlJvUXk4SU1EVWV3R1FmcEJMSUhlKzBNRERV?=
 =?utf-8?B?SkswZ09zRGN1MnlBcFZxSzdCendpRVNMd1ZNalYwMVFmWmVCZHdmWmczbXpr?=
 =?utf-8?B?US92d25QUDBkTUNzbEpIaWlxd08xMFZ1T0IzT1hYN0R3d0tITFZ3SGtnUVoy?=
 =?utf-8?B?RFFMQVVyOXIxS3hnemRMRDFQbmVIaXZLRTlxeThqQWNPZ2h4SEZOUTdvaFQx?=
 =?utf-8?B?Y2REMGdiVndmMHpYZTMwRUhta1p4L3JuZUo0YUkyd2o2eFdTYkh2bkdyNGNB?=
 =?utf-8?B?NG4yeE1uaVBrUXdIbjJpeG42d1ViRm4rUWRQa1lWMWhrYnVxNGFmWmxacjJJ?=
 =?utf-8?B?VkROM204WUpUSm9rWGlpSTVyRHgvMFBMb0hnaGlieXZ0SUtkTnlaeWRGU1p6?=
 =?utf-8?B?bThzd1hzcEJCcVpqN2ozTmRLM3lwN2tLVkp6TERNekJCNGVka2xtTEQ1NitP?=
 =?utf-8?B?MlJwTmJGcUZzanU4SkIxYWdTemRWeUdOS2Q2Y3k4TEtVZitXQjdtNmRJRXhh?=
 =?utf-8?B?aXpMdmJiWUt5NzRFaDJBbFpUVkwrTzNMVmIreDFNSHN6R2dPcEUrNGFqYTdB?=
 =?utf-8?B?M3lYeTk4MzdJWDJZbmViU3o3QzhORFA5cGI2TGhGL2hwekpxbCtTcXBUdmhT?=
 =?utf-8?B?aGlYMThpTVFFYXhwOGxiWHZVc1VqQVJmbTBPN2FCQTBzNzdlTGp0bVNpc1p2?=
 =?utf-8?B?Q0JtVUtJQm16WlF6R1QxK3F6bjE4NVpZU3BwUDJzR3lGUDgzY2hHWlZwa0xr?=
 =?utf-8?B?aHRyOFBiTXdOVE9HRHRvY21UbVcxbWxMbnhRWmtIY0Q4eDd3MWpGcXZXWXFH?=
 =?utf-8?B?dE1uQmw0cC9wUDI3YzRGdkJuYi9INzlSWU5sVVZCMWxhYmZwa0J1UjhUQXVn?=
 =?utf-8?B?QzU5cElEUUVrVE0rS0lxWUdzNXMvNG1ZV245TjViTzFoemNxTTRkYUVsN04v?=
 =?utf-8?B?dytNbWFvQkFJbUwyalhVTFAxc0NYUWV4N0ZCdWl0Q0ptSVhWVlFyUFhIOGF5?=
 =?utf-8?B?Q1Fvc01YMjJ2VGtiOGx3VFRYVlF4VWs4dngzWW1YK2RyMllMMTM0RG1MUCs4?=
 =?utf-8?B?NVhaMndwR25mbnpGZGEza1ZyZ3hoOUhxSjhRRHRPV0VUaCtGNm01aTRxVUkv?=
 =?utf-8?B?NktwQ2JKalZSeXN5ZXpKM1laQWNnbmU2dnJPdmI4Y1g3WEc3Vi9XbXZnSloz?=
 =?utf-8?B?bFhDU1l6dHVlQzVGR3VWckxjb2hrWURoaTlWcjBqUU9yUkxpTm9ZUzdmYUNT?=
 =?utf-8?B?TENKL1hleTlHTERZUmR6Q1pFUGVkNmpVSS84d3N1WW56SExmblhNRXJUOWoz?=
 =?utf-8?B?NUxzZFAraThZTTIvM2xaVmpxN2RXeVZ5ZSsrQ0NOZ3p2VGpybHVLZm00SGhT?=
 =?utf-8?B?alA1eGlldjU2Ym5LUGZzVFg5L003NExDYWJsVm1NalFoSHFyK0w1Vkp5Z240?=
 =?utf-8?B?MjNUc0JYdnh5UGtqTE53cmhIUlo2ajlVaVBPc253MjNZTEVuMnY0QWh6K1JP?=
 =?utf-8?B?QTJFVEFoSGdsczZzMW5DYi9TYTBHZ3JGalpZaW93dDBhN2JtR1ZRbHhubXJw?=
 =?utf-8?B?QWY2OHZQV2d5RE4vcHdldE9aSS96OW5aRURCN1VrNVpiYnJ4dWk3NUpmb1hw?=
 =?utf-8?B?Tnl5aCtmbUd4VGVoSmFqeEhDQXBSQVRKNU1pbUY4VzRSWWhGQWhlY0lJamNU?=
 =?utf-8?B?bU1tYVdBYmxzTWwzUitIZWlEVDJtL3IvK2NENG9XMUsrR3BRQXVwVWIxeENQ?=
 =?utf-8?B?WGRYTzFQeW5pKzY0ZzZLeWMrYkI4bTlQSFJ4RUUra0VWcHB3YndkTXhtU2Yx?=
 =?utf-8?B?SmltaVNzWlhzVjBkVVBQRXRkdk5RRDZ0OFJ4aE94dHRqNUg3QThYMldrRDZS?=
 =?utf-8?B?eHpPdXloeVA0WGVyRzAwTk5KWWtrZDlQa0ZVbFlJYmUwaldDTEJHT3lLS0t1?=
 =?utf-8?B?K0MxRWZZdTZwWlVqTTRQb1FFTzNMbzFwTmhEZy90Ump1WlE4NlpIUT09?=
Content-ID: <B7ECA896C9233140AD101A64069772C3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ffb0e57-3906-43c4-2804-08da3319aedd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2022 06:44:22.6649 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kt9fj7aIONxclP5ac0a0OrMcZp8zCenlELhPrYEn2UTCrkkGw6T/3c6P6avoGgZthMA+UsTkWSJKhoIV3bAnsq2cz+4ssS/hJwV4JlR2Z/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3586
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_234429_614113_FDAA605F 
X-CRM114-Status: GOOD (  14.02  )
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

On 11/05/2022 07:22, Christoph Hellwig wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Can you try this patch?

Hey Christoph, gave it a try but nfortunately, no joy!
Thanks,
Conor.

> 
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index e2ef0864eb1e5..856179f27f608 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -234,7 +234,7 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
>   {
>          struct io_tlb_mem *mem = &io_tlb_default_mem;
>          unsigned long nslabs = default_nslabs;
> -       size_t alloc_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), nslabs));
> +       size_t alloc_size;
>          size_t bytes;
>          void *tlb;
> 
> @@ -267,12 +267,13 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
>                  goto retry;
>          }
> 
> +       alloc_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), nslabs));
>          mem->slots = memblock_alloc(alloc_size, PAGE_SIZE);
>          if (!mem->slots)
>                  panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
>                        __func__, alloc_size, PAGE_SIZE);
> 
> -       swiotlb_init_io_tlb_mem(mem, __pa(tlb), default_nslabs, false);
> +       swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, false);
>          mem->force_bounce = flags & SWIOTLB_FORCE;
> 
>          if (flags & SWIOTLB_VERBOSE)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
