Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C67C25B08
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 19:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dawoKd4QNd2ilNWfDaXPVYLYvSJZQwuB/hUo9aEO42U=; b=K4iwZOjxSxR4FX
	iv3443VEnjCJoswG8QtMUPlstEm1z1gegMoHrpR8H7xPNahDiw3ttD52ddrQ5v/cupf4Y7Yd9IF3K
	uYHIW0HrWD4WijOryyb0x5ITwWRxDXzV4alQTlDqS38kSpAeK7Z/wbNvn9nVymHYl9TJvbaoyt3zj
	2locb2Et34fKfslGO0MLIz7ullwruSzeUQt4ZTiO2OifQgGtu/BvpdqAlmuGTxpq7RP23lIzAXhfT
	Uy6nFFOUDvWfnkH/jAUlLIz6tcRJSN9qy6GfCN/6SXXimT84uQ81oAJy9PmuHIlCgF6/CZWnzkmx9
	a95Vfe5vdGIy26/6BW/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNfbQ-003tRu-FK; Mon, 15 Aug 2022 19:18:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNfbJ-003tL1-7m
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 19:18:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660591093; x=1692127093;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=i0ShkLF21DIcqqDdcVS41PcFQXJg2uYwwwEm1MAu708=;
  b=O2xLOLfoczIAl3QCZikhxKN8Pt9BcPW6unmAknH9KjUAG8oh/el8+EnL
   uz2Ae4SEHydI/7qUmrURCKtHPbvb8nV5ft9tIWiexSGtd//muhNso9cSJ
   gUEvAXyw/gAL0qQTksobUKzyfru7Qs5HIGYpgGgbJW9x93EwcPGmZUjHf
   K6I8eASHafp3bocMbENTN7Dkr8BsPEtIbEKX6MQJ5I/4AjlP5IDr8Alre
   oQnef1w/gA8XO/lvCKEN5YmuoomYDzNzfcjgnPVKigV3VD+PCFOMj+iq8
   fLUcLD0o3WZ16FrdUluYPfEClD1Gho6IuC1xni8c/huCN9Kwg2cmhTTL4
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,239,1654585200"; 
   d="scan'208";a="109127605"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Aug 2022 12:18:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 15 Aug 2022 12:18:08 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 15 Aug 2022 12:18:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5xMfNy7OdjP9OAPf67QYVWfF7oOTenvAVdivnx4RDJKwIr7Edtad0MMWrwm9ElooiNxrtaY8TAFfHTZLwRG+53aFFZurLBhzlEpLP303giursrjRY+MC18e0XGep17VBiuleRRApehUfAw0mFx/8oBMMNJQzFSLL8EETeF8VLORnY+kzRKfdBVW3vvvW8zDlOWdaAEU2vQWBRhEYPV6Z/f6dERJLhwx8g+XRgvBS61fzCNlYjLV6Mp9apkWrJEXGibxOUjoVcGVHN7QuRM+fppzjbApg1QJ2jRBItpqGnWL0su3yVwPWJWOxOzKFNo3WU9AoU2NkJa2+SD7OYbr8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0ShkLF21DIcqqDdcVS41PcFQXJg2uYwwwEm1MAu708=;
 b=EJWgGZihPcT5M+o+pr/4D49Nh19eqDPgLLw3jirh0ffsDEwQKXvtB+m21rUJXkHH1+0dabfCRC+csDoRGMiS0GGH8K1izk1hu6vm4FmFSdse/UlJPiT0zZ6XbT1merLe1JJ/HNCZ4GuwGeZ6aXh1yhvDEkXF8HHJeGNgg7ju4uEiX195aV28RBBleOwApxbO1v4zqhc0ld9aDwBAj3YWkVZZWhQKcf7dBDU7iTJoSXkkwAnmKwdD9DRwdKYonTEWXDyLAWV7WCDHqvRrIQFqJiXviM2Y55wRuDSedzVAbCYKqVUJTxsz5fIr8OI2QIDTEcwUM0FfHiBqdvIga0sYDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0ShkLF21DIcqqDdcVS41PcFQXJg2uYwwwEm1MAu708=;
 b=likrkXFcaG141x7PqEBHd1ntALlXCy5t6Eu06s6v6UO+RH+RWeLyhYFlvFt2SFhxPwQxApRH+gS2BB6r2FBNNzultKKM44HcHotawN5bi3SZz0mR4fO5LLDayKixivo433BbywmtbzYdf8eQf33JzdZ0Rlk7XwJZC3XTPVjYABM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BYAPR11MB2776.namprd11.prod.outlook.com (2603:10b6:a02:c8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Mon, 15 Aug
 2022 19:18:02 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 19:18:02 +0000
From: <Conor.Dooley@microchip.com>
To: <jrtc27@jrtc27.com>, <palmer@dabbelt.com>, <robh@kernel.org>
CC: <tglx@linutronix.de>, <maz@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <daniel.lezcano@linaro.org>, <anup@brainfault.org>,
	<guoren@kernel.org>, <sagar.kadam@sifive.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <qemu-riscv@nongnu.org>
Subject: Re: [PATCH 0/3] Fix dt-validate issues on qemu dtbdumps due to
 dt-bindings
Thread-Topic: [PATCH 0/3] Fix dt-validate issues on qemu dtbdumps due to
 dt-bindings
Thread-Index: AQHYqOiQvE59vmIAhkiZ1sZQKraNy62li3AAgAAHfICAAQ/4AIAAST8AgAl5hIA=
Date: Mon, 15 Aug 2022 19:18:02 +0000
Message-ID: <1d94e18d-7f51-0619-95a9-6ca5fa7d9671@microchip.com>
References: <20220805162844.1554247-1-mail@conchuod.ie>
 <YvGBYKZyW0B2/wSr@Jessicas-MacBook-Pro>
 <94fe7e46-6156-1cc5-a4dc-1eee78e99bc4@microchip.com>
 <20220809141436.GA1706120-robh@kernel.org>
 <61829ccd-20d7-e2f0-0a6b-bcd0e076b9ea@microchip.com>
In-Reply-To: <61829ccd-20d7-e2f0-0a6b-bcd0e076b9ea@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d90a9d9-1621-4f1e-390f-08da7ef2df90
x-ms-traffictypediagnostic: BYAPR11MB2776:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +8IObIxz8P9AssK6juy2tmTa8vn5qfUM4415G4tEWbGpYxN/K6HWnW2m/89y2EGH6T68fFVSaLj+jIhoCifmTrxJi5/ASRvb0LLtsgwhcU3tzML3aCw94Kk6edRufm0u53xPvCUY9YPgkM9/YyZfCQtTuoBur/ftI4eL6miaxbuAxxVU+6WheEjnTK/U2cqMWFYbBzEYGA1HBdjOcbxo1K+JICd8ZOZ8o8n51CUXXp571q/qkd6PEB/LOT73qA8M18xQfBva1amtxvDHaEAzadRPo/YKTiFS6bKTh+0kRSEmG1EbUpgm+OZyp1b83vS5PKwxbPa91817JUyXECytECzOhRhJHAKOM97VBYT3hhNhbLPyQiulMREm2yBVXnvznCewW2B8lnKcp8rbYxHboLeZgUopJmfgkYbD97+mgNwSxXQL7ySBX5J3Flu2wxmND00QSzuqnEeteZ5KyqJbHADeY+tbGlGsA27X0urHdlCgfkkjndZqSMo0e3WNKMPZBXPGoBGAfyuQCPcNYWwqQYSUWOlo4zRIHc27BTUHenqeHbK8lwPkeypFNRC9jXw/DNm6rkdY5CwXZwc+/59VD6Wtbua+pYTncFAtdYJjE72QgBlWdWB1SiCalXC/C3omhTPVU9R304gDYAydoaEtb623AcFKlJ43fkzUPB9Sh0K3PlX7txgCVJ7TLwDEZQl2I2eP0PvD3W/B8UbzhYjKvxwvB89zNhv5YzRwih7e+EfXYIxvQN9rjAcH0amcc/SiQM1cqXOsnlbgVLNaZuGsep31tu7LXNEqIt26DilZNIJday+MycijLuJbCfy68aLADVHrQ4e0cTy139jkQi5t09tVxNc9K6eRcxu/kXBP2OBOZ/u6oPuIiTAcqAvxsRqoj90lptO/M+kzh+bBUgGlyg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(39860400002)(366004)(396003)(346002)(83380400001)(8676002)(6506007)(31686004)(478600001)(26005)(186003)(76116006)(41300700001)(6512007)(53546011)(66446008)(316002)(2616005)(54906003)(110136005)(36756003)(8936002)(4326008)(91956017)(6486002)(66476007)(66556008)(66946007)(64756008)(7416002)(15650500001)(2906002)(38070700005)(5660300002)(71200400001)(122000001)(86362001)(31696002)(38100700002)(43740500002)(45980500001)(569394003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGtxdDZBWHFhTmQxRHpSRmJOTDExU0hsUFE1c2h3R0x5SUVEbTcyaEp3VFRr?=
 =?utf-8?B?Ym4vYy83cHZZMkZuWEJtalFnK0UrZVlERmZ0QlVubFFmTzQrY25XRm9Cb3Ur?=
 =?utf-8?B?TTlRUGFuTzVpVnkraGpYcitHQ1NSTDFlRDB1bHdVZU1wTGhtNFpxaXY0bDNE?=
 =?utf-8?B?ZTJpTHRUbGpheVBsWG5seG9pTXFqYnRULzU2dE9vN2FFemprU2I0QTlKQ0lG?=
 =?utf-8?B?N0dveG5MbkVZRVZXRlFleGpMSjFkbk5LOTh0RFdjNzUzUUp3VnNqcFAvUDYy?=
 =?utf-8?B?OGdJbGhVMzZzajh1bC9aMlBoMEhQVDVhOXpPN0ltL2NCalVuZkF1MWZrVnRW?=
 =?utf-8?B?SDY2R0oySHc0clJQOVZ1ZU1yWHdNOXpqbEFmdlFJWk5QOGpjWkRML05TWGll?=
 =?utf-8?B?L3Z1VWkyUWwxaER0TnlXSVlweE9KTjVJcEJiUFdZVm1yQkVjWmI2NGpKc1RV?=
 =?utf-8?B?MzhhdmlWNVNIZ0J5ZkNGVXUrL1U4OUt6SE95Sml1TGxBNjdRLzl0TDhWUFZh?=
 =?utf-8?B?TEIrVDNEaHYzaXpnTi9IQnNydnJzU0FINmVQd0tLa0tmMGlKZkpwVGFpelZ2?=
 =?utf-8?B?Z09kQk04MGhkY2JPQnhTSFhBQTF3b3hjVWJ5QW96MVpCRHdlWVdGM0VVYy9j?=
 =?utf-8?B?Q3VacHRuenN6eFFLSFgxYmU5UjhEQWN4aHVsMWhmMlRkWWZpMUx1dWROVlNs?=
 =?utf-8?B?K1NmcGxLL2VBcWpDb2M2amhDVGpkVGRRci9odlBDN3hkV0NmZ2ZVRnJRVjJW?=
 =?utf-8?B?aUI1UVcra3VGWHNaVGxXc3FmSHBueEJhSGtidzl3OGZrU0tJamcrbDlkYkdI?=
 =?utf-8?B?emgxaWZZYktwN3dXZ05DdVEyb29mM3FJWUt4QTVTMWNtV0VmRUZSazhhWE5L?=
 =?utf-8?B?Ykx3blRCZUhmWXNsN0JPR0p4NVY1OXpwSVFUaFE2OWVpOWFNR29TT05yTDA3?=
 =?utf-8?B?VDFkZ29SVVUxZ2FxamtIM1ZKdXc4SFVkLzFmSGdVWkZFYmw0Yk94cHR5UFZh?=
 =?utf-8?B?eUdlUDhCRnpUWTJkdTJBUE9CcVlmUXFMU1o3QXErQlR6M2VsV01tdDQrRVhx?=
 =?utf-8?B?YU5BN1JrQVUrRXgzSFdSSmFNZWNXVEwwbnNGenYrU0FkUDh5UnNjUHRxclM0?=
 =?utf-8?B?SUdSR0JKSkFtZFg4U0JTT2cwY1YxM3hod08yeXZaMnpBeUs1RHR1K0pJcG9B?=
 =?utf-8?B?dUN6YncrcTI2MFR4MW0yVmVoclpUVno5a2k5WHpMalhvZnJSQS9VWlpYenpu?=
 =?utf-8?B?c015Z3lOS1Yyc2JnNTk0eWdLaFNORkJCYVRFcWRPQ2l1c1A2c2ZVMHplQUdV?=
 =?utf-8?B?OEZhZFI5cFZBUmR1MkVuRWlieGFvQ2RDM3ZKUTQ2RWJVM0puMWRsNVFDRWdH?=
 =?utf-8?B?YU5OSVE1RmtzbUN5WTB4emkxY3pCcFZ1REpVSldsbnFOaWlTSVNVV1J3bE1w?=
 =?utf-8?B?NkMwUSswL2FlaWZZVWZaN3U0SmRnWmRhdUhpa3YxL3Q0ejN1aFRKeW5wZUtj?=
 =?utf-8?B?bjVMZmlmdWtCVXdWeGNBbHhtOGZJcWsxZmNneFJjSVdLbXBDRWpxY0F5dDN5?=
 =?utf-8?B?L21TWmg5NkZqQUJDUkVkc0I4VkxhYXRJVWR1bDlweFVlUnhUeWtoVnVPbjR6?=
 =?utf-8?B?SzRyYjljVitKS3VheDdvTXl1bklsSkxpQytIa2VYZTRFaGJYREVPVDZyRExV?=
 =?utf-8?B?ZHlTbWhRd2FPUzNUdGNpNG1BcWh0dnNtMXNMZnNQSmphc2JucDRMeXdnMmdQ?=
 =?utf-8?B?K2VzZ1lwVXYrY0dKUDBKazhIaFpjckRXNStJU1Q1R0xqYzlpWGVqVkRVY1h4?=
 =?utf-8?B?aDJCeDMweVRhamFaYlBQWUFlUTZUVDZGWmdaSlJjMmFGNm1DOTNMRjI0cjhV?=
 =?utf-8?B?eE1kd1hwZ1lXdXdkemhoR0ZZdVRWTnNtaHdvYVRVNVgvNkF0ZVNlRFpCZG40?=
 =?utf-8?B?YzhOdDhRTHJUcngyZ09Tc09US1Uvam5GQldOK1pBTVRGSUZONEcxUExOc0JX?=
 =?utf-8?B?c0lqRHovaEY4TDFMOXNuK3FyUEY5a3B2b0ZtZFBBTjFtelo1QU52YlgrQ1NZ?=
 =?utf-8?B?NUkrRlRhRUEwaXJBcnpFOHFMR3ZkQlRyWnpQOTFIZVFMY0NNY0VIWG5pOVBN?=
 =?utf-8?Q?pBn0Ka5l1/HS8j61eY1xsgeVi?=
Content-ID: <6C98D34A3D5B2F4286FF86715EF42976@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d90a9d9-1621-4f1e-390f-08da7ef2df90
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 19:18:02.3990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tuEibU7DO8FBjs6URKrvsr7N+1cUxkhBV691CRM/c9gLoosjg47u8wyqS6zTqamJ7jjgtXMSs5Fk2Tq/0Yb9+Gq0DJhyiDpWvi0TEvdF/ww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2776
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_121815_569019_06A47258 
X-CRM114-Status: GOOD (  29.85  )
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

Any takers on trashing my regex? Otherwise I'll just submit
a v2 with the regex and it can be shat on there instead :)

On 09/08/2022 19:36, Conor Dooley wrote:
> On 09/08/2022 15:14, Rob Herring wrote:
>> On Mon, Aug 08, 2022 at 10:01:11PM +0000, Conor.Dooley@microchip.com wrote:
>>> On 08/08/2022 22:34, Jessica Clarke wrote:
>>>> On Fri, Aug 05, 2022 at 05:28:42PM +0100, Conor Dooley wrote:
>>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>> The final patch adds some new ISA strings
>>>>> which needs scruitiny from someone with more knowledge about what ISA
>>>>> extension strings should be reported in a dt than I have.
>>>>
>>>> Listing every possible ISA string supported by the Linux kernel really
>>>> is not going to scale...
>>
>> How does the kernel scale? (No need to answer)
>>
>>> Yeah, totally correct there. Case for adding a regex I suppose, but I
>>> am not sure how to go about handling the multi-letter extensions or
>>> if parsing them is required from a binding compliance point of view.
>>> Hoping for some input from Palmer really.
>>
>> Yeah, looks like a regex pattern is needed.
> 
> I started pottering away at this but I have arrived at:
> rv64imaf?d?c?h?(_z[imafdqcbvkh]([a-z])*)*$
> 
> I suspect that before "h?" there should be more single letter
> extensions added for completeness sake. So then it'd bloat out to:
> rv64imaf?d?q?c?b?v?k?h?(_z[imafdqcbvkh]([a-z])*)*$
> 
> I checked a couple different "bad" isa strings against it and
> nothing went up in flames but my regex skills are far from great
> so I'm sure there's better ways to represent this.
> 
> Anyways, this pattern is based on my understanding that:
> - the single letter order is fixed & we don't care about things that
>   can't even do "ima"
> - the multi letter extensions are all in a "_z<foo>" format where the
>   first letter of <foo> is a valid single letter extension
> - we don't care about the e extension from an OS PoV (this could be a
>   very flawed take...)
> - after the first two chars, the extension name could be an english
>   word (ifencei anyone?) so it's not worth restricting the charset
> - that attempting to validate the contents of the multiletter extensions
>   with dt-validate beyond the formatting is a futile, massively verbose
>   or unwieldy exercise at best
> 
> Some or all of those assumptions could be very very wrong so if {someone,
> anyone} wants to correct me - feel ***more*** than free.. 
> 
> Thanks,
> Conor.
> 
> patch would then look like:
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index d632ac76532e..1e54e7746190 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -74,9 +74,7 @@ properties:
>        insensitive, letters in the riscv,isa string must be all
>        lowercase to simplify parsing.
>      $ref: "/schemas/types.yaml#/definitions/string"
> -    enum:
> -      - rv64imac
> -      - rv64imafdc
> +    pattern: rv64imaf?d?q?c?b?v?k?h?(_z[imafdqcbvkh]([a-z])*)*$
>  
>    # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
>    timebase-frequency: false

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
