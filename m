Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6574C25B08
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Aug 2022 17:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CfpPecCCcmx2FOyoOGse/Cnz7Kv595bHliPRBoD/qEs=; b=YzGWMeXGSLVIG8
	WS5hY67H8/TTJKN3SkDmywxbXGuDtn38cvT+RqLZZT8MTzMos7ANwkiCFaD4RhnUja4Gks7cXkf+k
	DJ9jAIZ7ddtWSSxTJWCDVC2AM2+vAfb/3oL6lIGsQCsSkakt5Gv23gUuk7lDaDp9R+E7QH3e9L4ev
	PLN0+ZXxEZbqw1Ha5qPNlMftnf06x9eB5ucsnflxSTOTmOgjXc6lvbtVrkCReaW09RxFDTK+xndlT
	QKHKsVcObgvAY61uE0s005P3fMqquG0l71B92rxxZryV5vWQewR76YdBqIEASnYqnj8MxjjyQnASB
	gp16IdcqgmrMvQVx2ZUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPRut-00BBAx-US; Sat, 20 Aug 2022 17:05:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPRup-00BB9l-UZ
	for linux-riscv@lists.infradead.org; Sat, 20 Aug 2022 17:05:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661015145; x=1692551145;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=KqM3iGnw37pmzPIzTaK8et9QNn7wtwu7x7LIZUHgHYM=;
  b=gAAt+TwiZ/jsgTIhTJBuqKq4pQs8YM9SS8leRFZHeKwK59M8CAIBKRQ7
   iQ3kMeJxlODItf4zzd0+a5cfzyFOW9QTwVBOnse1VRfEPOa9/ONJvg2/P
   N42yx4tv+f6P8t7Mt68TJCspdBwN2DXstMOBQ47cL9Nzfw61QIDmZD2hK
   JmPKTQn6WVsvUM1sTIH6GvtLBvre+O9947dKaxs825h6SeySdpVzW2CJT
   atuEdjRGWPMoyRUsOdSuPHkAu7QpGhEXXrQfZOR4TAlMwJGfZ12Czjmpw
   wmAJCO4vHFycm1pT6EP09bHDVs2hZHmXUTiIvFW6w/jJ3AQ9j7U18GokO
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,251,1654585200"; 
   d="scan'208";a="177058581"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Aug 2022 10:05:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sat, 20 Aug 2022 10:05:38 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Sat, 20 Aug 2022 10:05:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ctgk7NWAHa66BV4YxSFbjz4IRD/JkQg3lAs+VuSjvg9OlQqUxonVQwpszJRSqG0YEUqDIbuoLEJfXVv2Lpvj6ZPNqLwTADv1uYUxWSnZIoqAgUXUkfGWSpP6mTXVyqFRKxdxWxOIcKrGpwTqI3Pj3pIKsR1uzPIyeTz00E5bd5+UYOA31B3HfL9UfaWoMqpvkVN0/Q6wlrOSz1MHpIoLDMf6/CqBeHKyZHQuB709BXpWK9aIuODNnwmqjriI2GXU6fZ2Zde3Soig2GL2967/GTfvVesl07hbB7pvXikd/bBSxfmWXIXHowFqLkgRlUBudA0/ZpnIkCbBeKlRO4T+hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqM3iGnw37pmzPIzTaK8et9QNn7wtwu7x7LIZUHgHYM=;
 b=haxZRGxrDQn7VV+EvNKx8R3hewm6/4iwHVWOJslDRaivWnEHQQGIkrigP/DOIEf/6Ry/SMNQq1MgprNMlEnmUKR6jAvBIt1yRM/uSwXBPcXMAZzqnQX61yZWpX5trEkjD7DQUU2KcQiq1NABPyiRu7FNaMRnyUlzgYeLg5dK3h0h0eeTNN4pimkIIVWN+oiIu0imV80rMhsfaOg1zlJ1bPr7nXsu7LjCRSoCDIsQoZoGLF2FqydgJRUdHaxbe/+dlp4JSMhhoR3VMHbNN442XFGTlJHW+hZVkG6PhPuvT5nhrFezfQXlWINZuWN+XQq4wj6S82GTbTnpTVGpLOzbOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqM3iGnw37pmzPIzTaK8et9QNn7wtwu7x7LIZUHgHYM=;
 b=fEz58utbvbbuezeaBaI6I0x1TYwCyuiyOY1hePTx4tZXUsL0MGLnlzD2EmKatNpfJCKJAXtz8eU/pDhwm/6URFzEhc0Ejhq/EMhn161xOKrRZkRczrlUh+hbsnsL3VyxMVovYAvHgNeVjKEsVi6hR04nmkWt9SfPrD8V6GTKBqA=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY4PR11MB1910.namprd11.prod.outlook.com (2603:10b6:903:126::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Sat, 20 Aug
 2022 17:05:35 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5546.018; Sat, 20 Aug 2022
 17:05:35 +0000
From: <Conor.Dooley@microchip.com>
To: <geert+renesas@glider.be>, <Daire.McNamara@microchip.com>,
	<a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC: <linux-riscv@lists.infradead.org>, <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH] rtc: mpfs: Remove printing of stray CR
Thread-Topic: [PATCH] rtc: mpfs: Remove printing of stray CR
Thread-Index: AQHYsXsoFy3MJzNmoUOb8KqziB5IwK2xyA4AgAZDG4A=
Date: Sat, 20 Aug 2022 17:05:35 +0000
Message-ID: <76dae817-6f78-9070-cd02-c96af605148e@microchip.com>
References: <bce2ca405ef96b1363fd1370887409d9e8468422.1660659437.git.geert+renesas@glider.be>
 <4d414583-1011-4f01-870e-5d3ad812109a@microchip.com>
In-Reply-To: <4d414583-1011-4f01-870e-5d3ad812109a@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67aabe24-99e0-4609-2932-08da82ce32e3
x-ms-traffictypediagnostic: CY4PR11MB1910:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KT09iNbQswPGurfLm/0uhKV2bBKCY2NBKiyJVc/p1FGwnzwyzrcIiqKFcjNxo3Tr1ml353UEtHjw9lsoa13jgBfDG5i8h3BwLqMwxP0ODGtTkQ8rjfhwfsqh8y9ddnvrgk90ZZpl4d+470x1YiZMO5AqOPuE/jaIbrzRqngxdnH1M6vgBvlH9TmpvevdMixvTW2MBDZZc/Q97AI6t4X13XOkPIG+VyIvzhQ+qGaaorSLpe3beazWkdgAjnQs4t80eWuroKDrD7SZ8bUj42oyGSHdH3IUa22/I6D5VzAYHmBlouyzMnABhvo1JHLkezM8AwKhe/MGx17D5xXCsx/p8njTFo1987sZbxCykvR5WuHdmt9TFVOalV3+DSzYf6MlQvFRXEQgJS8mdsxbLtadqs5cXl2oOv4E4gEat0kiRWM3wiHPrD3t2KnSfg1SfAteHzUpHFzyLP0yl9KywaGDxRQdjwEbovnC77E86wjpNp1Po93dIgBVO8dDghYAuPwz3N8w9maxa26l8WFrQCBtKHtoAlOTHKQYIQ4PdLl/BVxbf/5VeExRSw9+zvVOWqdaOnvJg6rX3J8mI7wHw8gmDPuZJOD2adAOUWM6E5dDdknceEYb1IYNQE277Y4eBO3JU0IRqtsX4mGmyxo9XVV3H8kDqjFUlTgse7ynvutSDR5zNoroHiSdiIHdXG9h+vZzCNS4KOMVlvmWX3eD1AL5H2/fyJXH7C8GF0ahp7FsN5VjACpZP8NGXlJQzUckVM8ibYdgB95EYYxoTnzYGsUH1RVE53ycyTjxwEHgW4M+8+RMSvw05SXEVUu8yOpfl1WUmso0/TVV7F0sbm6lRlewhw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39860400002)(136003)(376002)(346002)(38070700005)(122000001)(6486002)(71200400001)(478600001)(41300700001)(2906002)(86362001)(31696002)(31686004)(54906003)(36756003)(91956017)(110136005)(316002)(6506007)(6512007)(186003)(53546011)(2616005)(26005)(66446008)(8936002)(64756008)(66556008)(66946007)(76116006)(4326008)(8676002)(66476007)(38100700002)(83380400001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHZoOUhVNEZaWGpnZ3UvZkNjNWE3aWdBUU16K21Fc3lyNGNVREF5STh6UlNY?=
 =?utf-8?B?RzB0bG9kWEJmWWR6Sld2OEttWk5kVEFySjBMOW5XcFl3NmwvZEE2TnFQRnRP?=
 =?utf-8?B?ZklQN1hXNmZVSGJxT1R5YndXRy9jV0JIVzFFSm5Hb2cxZkZPTy9HRGVML3E4?=
 =?utf-8?B?clFob0kxOTRiUDdHUkxROE1IZFNleVpIZVhFaEhOdFlieS93cjI2aDVuNjhR?=
 =?utf-8?B?dzRNM1VKREFkOVZHT29mdTRmcVRvaThKZ1VmVmpvamV4WmhOcFI2M0hENzlm?=
 =?utf-8?B?VTZkdGtPQ21kNkxyNkIvelEyM29LcGoxZDc3aFo5SURkMWw0ZS9EVEdFNkpQ?=
 =?utf-8?B?a24xR1RYcWdTNjNVUWw1c0RXcExBcStZOTBIOHNKWTZHVjgzVVBYYVlpcDhu?=
 =?utf-8?B?Z2I3d1kwTTBkSFBRSjdZNGF0K3Y3cG1uVlZKeVZDUVZ2ekJjSGVJNGYrRVds?=
 =?utf-8?B?OWFocm5sOVNVZzBTd1ZseDVaYktIU29zQk5yaXFRVXdZR1poejJ3bHYxcjAy?=
 =?utf-8?B?K29sdnJFelF3WkdGaE9mSzYvN3dvU0RhZFlFTU9oR3Fsb0NxZ2dCLzRTNDFT?=
 =?utf-8?B?U1VvMmJuM05pMDBxTGhTUGI0UlB3QzZ4by9HRGRxejBGSHh2cXhjb2YvNUhp?=
 =?utf-8?B?aDVFRkRMZmpEbVRZT0wvVlFFSGhmV0xLb2tjeUR0dEgyRHVRNmh1cTgvcW1O?=
 =?utf-8?B?WCt6RDFZaWExWTJIKzloZTM3WWp0My9oTGZwNDI3Zzd3TWJFR1NWWnRqaC82?=
 =?utf-8?B?bXVyWG9TcHhmUERmT0JEanhPclcwOTJyTGV1VExkK1VRb1hDem1ZQjJqNHFS?=
 =?utf-8?B?Z1JGNmN4cHVQYWpMamNOTEN3L2E3emJPVGNrNmdnR0FPNUhUSGE0MW14MVpm?=
 =?utf-8?B?YUFPeld6NE8xNmt1eUlGU0h1djdjUTdPMlNKNTIyWW43TlVtU1VrWmtpaEpY?=
 =?utf-8?B?OFBYM0k1VU9CcDRTZFM2UkFWRGdIdmtnUkhzaUNEVmU4YVVBek9DbGNBNmtS?=
 =?utf-8?B?ejduSE5BQ1NyNURHQW5RRExwM3MxVWFLQmYxQXN2Z0ZHUHFnTUhvNUhKUFNw?=
 =?utf-8?B?S3FhR2J4MnVYNHV6R3UvRTc4OHBPdllUclVOZ2E4VUJkS0o3clRmWU1XbkRQ?=
 =?utf-8?B?b09ONUYrSkZTR2lpMU85SHVHVzBQR3F2Y05yaHk2cC8xeEhMdlZmandIaU5t?=
 =?utf-8?B?eEc1Y2pZSWlRaUQ3ZlAxaWQxVjRJTU43WThYb3ZXOXNWS2tvSkNscFkrVys2?=
 =?utf-8?B?amF1RXhSYStEZjkzbHU4Z251Umd4bmJLVURKdTgxNEIxR3lkb0NVOHRHSXFh?=
 =?utf-8?B?dEhhS3Y5aUxSRzllaXR1cjY3S2hINjhHZFphQUNlakswdzRLUkIzR2Nhdysy?=
 =?utf-8?B?ZGNMTlk1Tnl6Wlh5MzRObWlBbW9ycWZJakFkMUhhaHRYZE9xYjdhdEloZ284?=
 =?utf-8?B?cE1wVTJuOUxTMDJyRHFMYWtwQUxaSWhza1ZRKzBadXJPYkV3SVdjTTNwSXY5?=
 =?utf-8?B?cW9KWEkvMkU4S3Erc2ZOTU1HSzMwRllkWUtmR3p0dEtaazB2VUFtZVFOYXpJ?=
 =?utf-8?B?aHZ1b2lpRFhzUUFyYW9BVHdWeFp3d1hoL1V0ZzY1VXd5UWluNlZpM1IxNG5N?=
 =?utf-8?B?NnlzME1icWlJN1EvRVFOb1BFWmY0dHYvOU9wZzMyMVMyVUZVNFZ1MUJmTGhz?=
 =?utf-8?B?R0RYcEZDWVVKZkpVSkVsZEFaRFpyUUNTZ0lrWGVWQkNWYmR6VzNUL0tNU3Nw?=
 =?utf-8?B?Y2l4ZlhDeWF3amM2emhveXc4cisxTmtpOXRhbmthTGw1dnFNallndGtEd3Y0?=
 =?utf-8?B?Um9OSkhza05YL1U3dGdrSjc4REJMUmtVZzRCU3JIOXFYQTRqVE85bTV3MUVF?=
 =?utf-8?B?bUcyS0o3aTNUMUYxQldNbmJsTllqcFdySjNQZHdJWitMMFJUNUN0Q0ZMRm55?=
 =?utf-8?B?Wk5KYlFPUW5GUGY3dUZFOWszWHVVcGFrb290ajhGM0pQNDFrTGFkRGZROWpX?=
 =?utf-8?B?UHZMQXFPYVZnZzVXcDdoUGxMc1FXL1NzTGk0N0xTTFJIOXp6RGZzOEhVQXJE?=
 =?utf-8?B?Mlo3SUc4TjFuMmZyalNlNFRtUzNhanowTW5pNEZPS1djSWhIdy9RZi83Q0Na?=
 =?utf-8?Q?zgjY3Tl/vmHGvY/Ku9b9JV6EJ?=
Content-ID: <83E0AA38B4B08A46BB04A4A7AE33C8D8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67aabe24-99e0-4609-2932-08da82ce32e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2022 17:05:35.4499
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OYQocbwUnSRtr6UhHwfYxgTxP9ES6TXlJ3QQCFBEGzmM3rKcNmLlv9xnWNidSOWbzw5Fkw2Ynjn2uXuqqY+sNrUUrpkgU5JQ+hSHQ9aqofY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1910
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_100544_260417_FAFA7A20 
X-CRM114-Status: GOOD (  19.44  )
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

On 16/08/2022 18:27, Conor Dooley wrote:
> On 16/08/2022 15:18, Geert Uytterhoeven wrote:
>> Apparently updating the RTC when Debian userspace starts fails, causing
>> an infinite stream of:
>>
>>     mpfs_rtc 20124000.rtc: timed out uploading time to rtc
>>
>> Increasing UPLOAD_TIMEOUT_US from 50 to 50000 doesn't help.
> 
> I didn't see this once during development, nor when I tested before
> I left work today. Tested when I got home, happened once the first
> time I tried it & never saw it again after that...
> 
> I'll take a look this week and see if I can figure out a cause.
> 
> As I mentioned on IRC, I wondered if there was an interaction between
> the HSS you're running & the reset controller series that you applied.
> 
> I looked back at the the HSS, and there was a point where it did not
> take the RTC out of reset - but that predates the version you have
> (0.99.16) by over 6 months.
> 
> I would still be quite interested in seeing if it repro's without
> the reset series.

I have managed to repro this intermittently on v6.0-rc1, although
quite infrequently. I don't have the reset series applied nor am
I on an old HSS. I don't see the stream that you do w/ my Ubuntu
nfs, just a single timeout, when it occurs. Haven't really had a
chance to debug yet, but I'll LYK.

Thanks,
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
