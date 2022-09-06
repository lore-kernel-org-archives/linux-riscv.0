Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2746ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 17:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o2O5CGWGgF/t/YG3TaJeK1IfAzr0jx+gB6xZ7bFwTfY=; b=2ohaNz3VSowH54
	qbtdn/9Mprs+8Y9xOTmdi2NTdZuXRj/N4C07shexTA2Anb/wdu4s4Y6BvwIatD0LQA6YlAwmk5/jj
	Ozu4EwE/WpWKGDITGZ2rP1hid7dLyGd5+s+Sz4YOj5VFrPavxrctf5+rDfw4lZ2Az38ErypPu3fRX
	Ayzw2eE7AqhN0kZJikpIn2/HZiU8ewnTHhvnLs7mWqmE02lj58dDqBkF9TUErIm/HJsV0bfyMyGrg
	P/46hhaH1ASIOHbUCjT5wUlFT0a/UyRJJeATtsCLSbm/NugFWJG9YlHSeki8oB9DXbyRJXj1AdXIS
	ViDt4wnfUD84ja6hNCwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVcaw-00G3bA-T5; Tue, 06 Sep 2022 17:42:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVcar-00G3XI-4Z
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 17:42:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662486157; x=1694022157;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6OURVFamo3rNMfwXgPaCcwoeT8eZj3aPrQgUr/ir/2o=;
  b=S3lGgdArGIG5bb8UyNu+kIaJ45PMRc84bOQqvTI7gLikt+sNd7o0jiBY
   6plJ1mTl267b0ozU53G1uzotxzH6bHFcwVKAlSJ2dJdeSIdHuaQMEZF3n
   gpxTI2UsNGmetMvRt5SfWe+8KDQ38R9LoGhHwIf9jsjdyLwWiRdzlYjfP
   iYLxnxdm8PPKJa5IrAYZE+a+Hv9SlDtjM+zl6LVyZBOVZGZiB498xIUH6
   3NL2jzdQ7XlLbp3xDP2xJoDcAf3YsA81AEW1VemncWN2etLRambLXKBQT
   26+D9Dz5io4zNW7DNgoWOds+9DkKg8cBSe/deRQgkILkZzVtyJBv2REQO
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="179386571"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Sep 2022 10:42:35 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 6 Sep 2022 10:42:35 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 6 Sep 2022 10:42:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpPPOAAw0NOwqk3Yxcjks9gfvVXee5YIEsviPCp3AghRgNj4f+xyOqmRbSWf/nnrmT900G/x/sXIB8S+shrqyK2D/IPDktGZqMLy1e9azlg8FsDvWr5kVuMSCRCc/t0GgOPeekqxzLVTr60iAk0hRqTZGuEEJYgDx0Wi4r1dsPinXkRwPVuMy6xDg+eo2M0a9acmqSuDtS6QPrUDY2tCNxzynK6Uuj5KRPvTkZFjjXR0cwUuLWHi895Hl8JKO37U+nmb5VzMf7E9Z0jE6KAWyBt0RVOV+XzR+5smaeWK2OBjK+YYYQxSPViILJ5C+F18qPOEwY3u346p6FzQYEV4Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6OURVFamo3rNMfwXgPaCcwoeT8eZj3aPrQgUr/ir/2o=;
 b=mY9r73rgioIaXOOilxWJU34iuoVxbGfOlv5WiWu3DndDiR+OrTi91MxpQ5y3zA+Qei1ASi80/hGejSebeoX1fXYSCET1K1zTz/JGA+TUEAms/y3QknmppVrfYIs7B3uNIyTpzB7OkwxFt4YlCYu6EtZQZn7cUqxvxEt2XtOoQ0dgm9UATZz6yBPN9mVfbzoVWQ9eqTfK+fflOU08YU0PLuNPjWEBJZdvsdNU3yORT8YRv8p2v2JGyqQouWyU9l4OvBnmKDJxRqcJHFaicTa1rrNRDy5So4ldFMWC9igtfAlvN84bxH5iNIyZCPUIjshXUZzppoqb2sC22qogxUUYJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OURVFamo3rNMfwXgPaCcwoeT8eZj3aPrQgUr/ir/2o=;
 b=Tncy1QoiFrqCLlneAmq4ZMwoe7ffThS4dJ035P8gESl8nOO6h9uIgKoygK/3v1+3hp9CCmkoa+8e4lovVnOTaFZGpYQLOXNkhKc5SyT8b+CXEDeZQfFaKwmC9S6mlKXZqa7RvJ8zwh7qAoB9VFNmvawQ7e669uAt/KMljZLya4g=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SJ0PR11MB5086.namprd11.prod.outlook.com (2603:10b6:a03:2d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 17:42:25 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 17:42:25 +0000
From: <Conor.Dooley@microchip.com>
To: <guoren@kernel.org>, <arnd@arndb.de>, <palmer@rivosinc.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<Conor.Dooley@microchip.com>, <heiko@sntech.de>, <jszhang@kernel.org>,
	<lazyparser@gmail.com>, <falcon@tinylab.org>, <chenhuacai@kernel.org>,
	<apatel@ventanamicro.com>, <atishp@atishpatra.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <bigeasy@linutronix.de>
CC: <linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <guoren@linux.alibaba.com>
Subject: Re: [PATCH V3 0/7] riscv: Add GENERIC_ENTRY, irq stack support
Thread-Topic: [PATCH V3 0/7] riscv: Add GENERIC_ENTRY, irq stack support
Thread-Index: AQHYwaR9Zg4qVJdaxUOmW+ltdyCEZa3SrMIA
Date: Tue, 6 Sep 2022 17:42:24 +0000
Message-ID: <8db7caea-a1a0-25a3-ade0-2f1714d709c8@microchip.com>
References: <20220906035423.634617-1-guoren@kernel.org>
In-Reply-To: <20220906035423.634617-1-guoren@kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76642d8d-2129-4ca1-cff5-08da902f28da
x-ms-traffictypediagnostic: SJ0PR11MB5086:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IWdXClxCDw699jRiUhGiO2D0b449GOTiuqv/fp55aLT9L4rOvziKtvgbQefAyRAgAWjShHcltnNVWgNyRf3+nmVpNPhf5FQ5oD7iirEsxuvGtgR/YZUqS8mYs9q1MaW5f4kkt7wtAppMtCtWR/uLK0TrWMbnEkoZl4qzx4UZYQfWEZn3uFNAYorB4VW3sEN6lxPJPmbmuhEfwChLemeFGEgwLUlgEINkHmWraaDTan8cF6HdcloIVqLVf32FK0Uir+7bVtP10MU44mwOrNccBU+gyC56Gove+ts6hjPtjCRVUPev43wz5seNcbj8sYqzNdxYojiaZqYndfjyZLj4BdvO57jCosqMTH5x59E3NWLPFrZxca1O4Os0i3Uv+Ox4V2O+DRBrF8HWrfL3f6XVC932Ukp16zZFVONV7meUYdJQ+7b5UKKMrlJaXdbwW7pVcbSfdr6UQJNtzHvT3Z7VbcUPKp105n5Ce+P4x2g50s2eyHGdLcupLkCUn/06QGp+uRoa39larJRCs+lknIxVnezWR4qmmivy7WfAgZkkPn85sEVEVrHp6aiW1mK0zMWEFXcXGkcrrHKlRKhjGjqobzZQ7sw5LQyghFcKDgqmLzM+O1iTPf8NtQueO7oGTPnzvFpXYVgZNxU2M9PhTJNIY3yqfq6O2E4KrwoT/64C33p3oSwOqEYQ8wgh2Avg0T5wtXo//GODSNtz08QWAB6HAyXO0lhdbTOOy/ct0gDR3Ls5tnqcoRTsTF27eYR1UkOpem2f5dUNf7ja6ieu2xlZiI3nfIuqenAObXjsWeQZeXG+XgvNLTioYRp3vpub9d7LZMmwhSGCQ7jYgItgMlWxqblKGUK9wuirrD5IWQQUUGtZjaaSE2GI+9O12TBVkF3ayqO4WRCMuy/aQ7PPRC1RUJi9Fq0/HIDf7geV/QcOzSgsAKiuHGuzFpJnw00oTJkK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(376002)(39860400002)(346002)(366004)(5660300002)(36756003)(41300700001)(6486002)(26005)(966005)(2906002)(122000001)(38100700002)(7416002)(66446008)(478600001)(66476007)(66946007)(76116006)(86362001)(64756008)(91956017)(66556008)(8676002)(53546011)(4326008)(8936002)(6506007)(31696002)(110136005)(921005)(38070700005)(31686004)(186003)(6512007)(54906003)(71200400001)(2616005)(316002)(83380400001)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjNFMkt2cDRENTBjWkJ0M1lwcm1IejlsRlNMdUxjWllDcnlOdXN2NzB4T0Ja?=
 =?utf-8?B?cEU3ZVdNUFBoL0lQMCtLTmh6ZEdJVjVvQlJlL2UyK1d1c1pKMmdkODI2cHo1?=
 =?utf-8?B?NXFVMnkvb0lnWWkyblp3NndoZEM4a0lZTnZsZXhkaTl4TTZabWFmcUZvbjlt?=
 =?utf-8?B?bVZ0OWhPblJaRVBLemRzeUZnLzNsZGtvQVQvaGdTYzhOQzVqOEc1T0R4RzFo?=
 =?utf-8?B?aVhXaEVEaTFmcWJ2NVYvL3pJRmRUQXlWMmdXNTBaVm1GNW1XZG9CbkNOaEVN?=
 =?utf-8?B?dllERTFodkZvZCs0dU9MMC9IeVFRWWNKdXBKUS9CUTA1RHJoMmswd1pYWU1z?=
 =?utf-8?B?cnFqR3lndzN2SUlDTmFveWdzeTZyQmlRSGs0NU5JQ2ZsR0R3UXZLZDJFcFVR?=
 =?utf-8?B?dm9FQmZ3aGhZa0JQcFYrLzNOaU1IWHQrTFVISFVmU2ZqNGhNNVNsY25nVkF3?=
 =?utf-8?B?WmdyYktlcWlaK3RVWHZsSytGYllWaXBuNDVGNkxOdVFMblJORTU2K1ZXMFdu?=
 =?utf-8?B?VVlWZGlGeWVQME9KeEdPRURra0JOc2ZESnA2SGNoTGVTWXdYcmsvTVJIcXhX?=
 =?utf-8?B?aTNlck5IbmREV0NHNG8yTmJaUUxoMFpHbmpLZ2xWdVJnS2VhNmtIN1NHa01v?=
 =?utf-8?B?MnkrSmNGN1RXV0VyVXBpTndHTnJydGVHazQ3VzZxSlRNTlQ0eUxxVWhyeno5?=
 =?utf-8?B?WGgyUDVIcG5KdGdXN1I0VWZNdFVSRDdkVWZHYWUyUzh3V2Z2UHFQM08yNnA5?=
 =?utf-8?B?djRzQWE0a2tQRUVybVdqTjlDMFRCcGU5bmZzRnhQSkVFdDF1RWUzTFN2ODdO?=
 =?utf-8?B?R3NWUHAydEllTDQ2Vk5sMWthVWJTUTNPREFWMHNWb3VkcmNqVDdNdlF1L0xC?=
 =?utf-8?B?dDZQUGVJb0Z3elg4ZnJacWMzdFY5OXFBM0prbEluRGdUb0VOb3pFS29jM3J0?=
 =?utf-8?B?TTBxOHE0UlROYVhnb2ZPb0ZBS2tVTDZTQnd2aTB6SkhpY1hjZno2cERmR3Nj?=
 =?utf-8?B?SHRkdUhXQ21vWWFuTXYzRnZqWk1kUS9LWWRRL1hSUXJOWk8yRTVacmpBbERK?=
 =?utf-8?B?bDRaOHZYOXQ3VmdDa21SQ3NUc1gwVzhFNnpBM3pyci90T0tKbWpMYTFuejRK?=
 =?utf-8?B?R0hnQU0zTWtTa3hnTVpZUUhnczduK2E2Tk9ITmg3d1dLNlVoWjlmUkpVeXBD?=
 =?utf-8?B?T0RQWTJIQzhPVW9xMUc3WVd4RE05SVdPd1JSbVJNd3d5THcxTUFwVE83bzd2?=
 =?utf-8?B?c1hBMWplSjdSejQzQUkrVDdnbVpXdG9XZ0p3dXRQendEcHU4dk1ITnMwbi9w?=
 =?utf-8?B?RGJPKzZ6blorU2xncThGeUl6akphZk5rNDltdWVYT1J1enpLUTlvUjE1ZFdn?=
 =?utf-8?B?OE1rTDlyL3VnZ216MXc1cDVocDJlZkMvejEzRHl6RnovQ1p0STVFNUM4dlJI?=
 =?utf-8?B?TEJaOW9PckY0dXUzWk1YUG1nZXUwTFR1RDIrWVVENzc0WnlJLzJTYVNEQ2dD?=
 =?utf-8?B?U0pUTVR3M3VyZWNwWnZsclpoZ1lkRFV1KzRiRGYzTjgydVU2YlNpV0gwYkNk?=
 =?utf-8?B?MDZmaHh5TldmSFZlWUtmdHFIUzhrZDlQOGhveVVrOEhLS1czS29PWldaa3NL?=
 =?utf-8?B?eG1tNXQ0b3d4UmM0bUtMM0dGQVJOTjdKVW5DUjRFN3hhVGwvekZKa05zYlda?=
 =?utf-8?B?VnhaUXpEd2tvUFpwblBRdWRxOHlLenBzTHBqWjk4cWtJRTZCYStNcWFQMW9S?=
 =?utf-8?B?T3pQU1NvUk1MSi9QQlBMdk5ySTF0bjlHenIxS2swSFkzanhNcEZRNnpydkY3?=
 =?utf-8?B?cG1OQzJCREtEcnhtSlkvbXo0V09jL1pnaGtueHA2NmUwcHp0QklwZWd2Yjdo?=
 =?utf-8?B?a0lheFFtdzRHMzcrWFJiRTVrZDZsSU9JeHZURUJFOFZiRHh2U3o0dVJxZEtn?=
 =?utf-8?B?a0RvUEdVSTFPL3dLNFR2Y0pjaDdHYkIwNFh1MW5FUmlPdEN2ZGl4c0VGVjJj?=
 =?utf-8?B?WXVHVWo2cW1PdzJNVVQzbEpNcS9qbFdUcDViRGcxWHI5Yk1RVldmNUdLN0dx?=
 =?utf-8?B?cUpZbDdVQTRhTFJFNHBhc3QvSXhIaWZHTDlYUGlOaVlPemp4WWxLWnN0SmR3?=
 =?utf-8?Q?f4V6iqqQpG2hVAunIiiXBwpdF?=
Content-ID: <342286757AABF6428375FBA3E906684B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76642d8d-2129-4ca1-cff5-08da902f28da
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 17:42:24.9465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FApoG+2vAVEQQK+1DKdETHWXoCO8wlaAuqQNwt8PcFmtodMl/qsCsQpWib4gJxFe43qow/3dNLi7aZGungMT1EmcIAfeVK29w+WADLD4kC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_104237_347192_2351F548 
X-CRM114-Status: GOOD (  14.73  )
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

On 06/09/2022 04:54, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The patches convert riscv to use the generic entry infrastructure from
> kernel/entry/*. Add independent irq stacks (IRQ_STACKS) for percpu to
> prevent kernel stack overflows. Add the HAVE_SOFTIRQ_ON_OWN_STACK
> feature for the IRQ_STACKS config. You can try it directly with [1].

Hey Guo Ren,
I applied this patchset to v6.0-rc4 & ran into a build error:
/stuff/linux/arch/riscv/kernel/entry.S:347:9: error: operand must be a bare symbol name
 la a3, ((1 << (12)) << (2 + 0))
        ^
  CC      arch/riscv/kernel/process.o
make[5]: *** [/stuff/linux/scripts/Makefile.build:322: arch/riscv/kernel/entry.o] Error 1
make[5]: *** Waiting for unfinished jobs....

Thanks,
Conor.
> 
> [1] https://github.com/guoren83/linux/tree/generic_entry_v3
> 
> V3:
>  - Fixup CONFIG_COMPAT=n compile error
>  - Add THREAD_SIZE_ORDER config
>  - Optimize elf_kexec.c warning fixup
>  - Add static to irq_stack_ptr definition
> 
> V2:
>  Link: https://lore.kernel.org/linux-riscv/20220904072637.8619-1-guoren@kernel.org/
>  - Fixup compile error by include "riscv: ptrace: Remove duplicate
>    operation"
>  - Fixup compile warning
>    Reported-by: kernel test robot <lkp@intel.com>
>  - Add test repo link in cover letter
> 
> V1:
>  Link: https://lore.kernel.org/linux-riscv/20220903163808.1954131-1-guoren@kernel.org/ 
> 
> Guo Ren (7):
>   riscv: elf_kexec: Fixup compile warning
>   riscv: compat_syscall_table: Fixup compile warning
>   riscv: ptrace: Remove duplicate operation
>   riscv: convert to generic entry
>   riscv: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
>   riscv: Support HAVE_SOFTIRQ_ON_OWN_STACK
>   riscv: Add config of thread stack size
> 
>  arch/riscv/Kconfig                    |  19 ++
>  arch/riscv/include/asm/csr.h          |   1 -
>  arch/riscv/include/asm/entry-common.h |   8 +
>  arch/riscv/include/asm/irq.h          |   3 +
>  arch/riscv/include/asm/ptrace.h       |  10 +-
>  arch/riscv/include/asm/stacktrace.h   |   5 +
>  arch/riscv/include/asm/syscall.h      |   6 +
>  arch/riscv/include/asm/thread_info.h  |  19 +-
>  arch/riscv/include/asm/vmap_stack.h   |  28 +++
>  arch/riscv/kernel/Makefile            |   1 +
>  arch/riscv/kernel/elf_kexec.c         |   2 +-
>  arch/riscv/kernel/entry.S             | 255 +++++---------------------
>  arch/riscv/kernel/irq.c               |  75 ++++++++
>  arch/riscv/kernel/ptrace.c            |  41 -----
>  arch/riscv/kernel/signal.c            |  21 +--
>  arch/riscv/kernel/sys_riscv.c         |  27 +++
>  arch/riscv/kernel/traps.c             |  11 ++
>  arch/riscv/mm/fault.c                 |  12 +-
>  18 files changed, 259 insertions(+), 285 deletions(-)
>  create mode 100644 arch/riscv/include/asm/entry-common.h
>  create mode 100644 arch/riscv/include/asm/vmap_stack.h
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
