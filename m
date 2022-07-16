Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2647C43334
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jul 2022 12:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IUjqfimlqd3n3Ev3q0aCIAzpf8C+HlMiGRSRJ4Zf9PY=; b=42zJqjbGmvWCkg
	ZP4FdTZCF/pDr8QIsCVjj2nMiqDiYEUlhbbG0KHStTcqYaowHDRfKXsrG6NG01yG45V9BtjZtqMwn
	3WPRfgMaRN81DFoAb8tjfOFs6wbrmzMlmvP4Z+eAh8yaikH18u4dURKrGCrwWaWUKDYiFL0XiCC5r
	OrqAOMCEL8Y+jV6dQyrv2Sz3/at5y+6Hl8dKdj6AEonldHdxO1axNFET+X8cwk7LQZFjJ7mo+pJii
	JYoYO+pzxyEP1C3yC5TkeY8CqJ6pPz8NcZCoaJQkeKNlu74MHUWcmhHNwlXmWZbZ/NHFv0cjgxMlu
	OHvKiBzhtjPlZ+Il2pOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCgk7-00FyCY-8g; Sat, 16 Jul 2022 12:17:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCgk3-00FyAh-G4
	for linux-riscv@lists.infradead.org; Sat, 16 Jul 2022 12:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657973871; x=1689509871;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8YxLicKQLU4Fu9/DsM/F1mmF3g4m3Q8Z6AbygG9ddgQ=;
  b=Z/ZFNAlaEBYcxUtBDn3sMMgX3SSx2QoU9SUFRVLmKsG2PWu7l+fjo0+P
   x+YD0nKZ3UnQ1DAM58jrjnk7FJpWgfagHBnz77S5LCIBEZHLgp2hMbHgs
   4RgUayAbOKLYD1djHSWiu3dErZ3+josJnef8ZGzH6cWAnQ6coUPldScD7
   aMKez9Oh5Cvb22fQpGWdz0/I8Edg7MpzyIle3Xkn56+6nMbziZuo+t+h7
   K0GaGGm8sjiLp7MiIh/Lb2ccEVMqZOsXHZJgmDmLLjZgEMWjro3LEvoxN
   ESEena5NZYzMHwbrBZ5xOHiatXBtj45Ni18p51hcF6XUFRQBI+e9NhcGC
   A==;
X-IronPort-AV: E=Sophos;i="5.92,276,1650956400"; 
   d="scan'208";a="172392818"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Jul 2022 05:17:47 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sat, 16 Jul 2022 05:17:47 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Sat, 16 Jul 2022 05:17:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ez6FKezZ49zc3owwmAAHrFz+iXqRUadUj3JXIoE9sXDOr3slJichXV9PkBhc4lPAEnjponOFbFz6QUlE4o61rHQVTEOOJlQ10nqE8qTY22/4fMjCQG1wit8NM0lIWwFtiJZAHtfoNzi5G6KCd1PQ4SF04ZQBCEIR9dNeeG9p/cH6kzvrvyKOLyvePXRVy1xen9MbPEtWTY1u2EkXCzDWof3SGUrRmL3dW3dgO7xzs7uSQaWFYNZ8yAkiMUanHKhLreUUDTO7t6iqYNNt/L8FYtNtfjP5SdbF3v3GqOsOkRx5VfK2bM1sxkfXNiLhFkUxUs4G3pwWOq/0JUf7jxc3fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YxLicKQLU4Fu9/DsM/F1mmF3g4m3Q8Z6AbygG9ddgQ=;
 b=RI18BUIi7+0DNDK5gC2IYh+K2tWctqBLXV5q2cYHC5hLFss/wy3cCEc8hJ8JUp0JfJ1Y9yrwOyaVdK9upqzyaL1CBIYI0scG8Aiby+b7YtDBBonqyvBRbSOkroCknqsuJX9QPPBeKTcTAg6pHyE7GE8hCOPEBrr0EBAqbnqU9LH2bG0WpGHOC/KyrithiBvzwk+SjBgfRmoi8tise1A24aA4lWdQsedoai3tZSUDt2d4KN8h3wvqiHLJoHOtn7umEsVv6ml82cshcKa/3Rvr4cpSrL75sPi8FGckP+OktJXID/ybxcf5Hnro3Q/0XtjSVV6AVA2MPy6Zrb6WCHe50g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YxLicKQLU4Fu9/DsM/F1mmF3g4m3Q8Z6AbygG9ddgQ=;
 b=oOXGKyUMgjJzHnMnxnUvECWg6rboFnuwzAT09E5T7E1BG5kTzSpk2U8fmHCdf8/MxHmY3pB74d0e99sv8d6iU2v7F/rqhrsaZXGN3bhXBVIx4cIcXAkGd6mUcvFt+1RcvA1MuAa0A2flBAuS6lXxOrNYkLpAxiGk2/NjqDNqtH0=
Received: from PH0PR11MB5925.namprd11.prod.outlook.com (2603:10b6:510:143::10)
 by PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.13; Sat, 16 Jul
 2022 12:17:36 +0000
Received: from PH0PR11MB5925.namprd11.prod.outlook.com
 ([fe80::5c03:1f60:ee1d:3928]) by PH0PR11MB5925.namprd11.prod.outlook.com
 ([fe80::5c03:1f60:ee1d:3928%7]) with mapi id 15.20.5417.026; Sat, 16 Jul 2022
 12:17:36 +0000
From: <Lewis.Hanly@microchip.com>
To: <maz@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linus.walleij@linaro.org>, <brgl@bgdev.pl>, <linux-kernel@vger.kernel.org>,
	<palmer@dabbelt.com>, <Conor.Dooley@microchip.com>,
	<Daire.McNamara@microchip.com>
Subject: Re: [PATCH v3 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Topic: [PATCH v3 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Index: AQHYmONEe8u9iky0lEWQnR2PO9enTa2A0EIAgAAaB4A=
Date: Sat, 16 Jul 2022 12:17:36 +0000
Message-ID: <6ac50f6a-684d-d2b3-a32d-97635abdff13@microchip.com>
References: <20220716071113.1646887-1-lewis.hanly@microchip.com>
 <20220716071113.1646887-2-lewis.hanly@microchip.com>
 <87pmi549rp.wl-maz@kernel.org>
In-Reply-To: <87pmi549rp.wl-maz@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b086bb2-4dc0-49b0-2e4e-08da67252b70
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x/yVrFn7TY60zylUvLwDudSovnS/5yrsYgTfM0vbh0SqNs04bLwSxwLjHhi1GS2bsNpua/6fYlNh+hTDEsTb6kd6Ts/iXw4ao668gHZ2MbAI2aZzAgG9AeUwe1b48OsosYy1Vd8WhuLJpyQQMO6kfIn7EfDhKzh4Qq8WINydOE72Re+RYip4TaRJ1jd+/NRBp/BscfVZqu+1KVo3GwGVL4S9YsCwh9abDAu1zvsE85nFVC3B1P/NBS48wiEmdcxxMqo0U0N2u17wiZlMKkLHKY6F6R+6JrPvJ6zPFlt40Q1+Dk5l12ovbaHJPY4aMetMQE5389UDIKCDA/KcQpO0qMnIybMMwVHwD8WBW85/MnoeVuCLryykCtSWW3OXSFHhVwRYdE4TZeKRSoOCc2FdZi1+k4tfRiLyoF59IFwOzmJ4zOluF00Sw/WANpXTwojbviUY1bJ/9vPlRfK4Z4aJPmIs+H8WT4l9NlLUD133GfJx2x8RqnmQazF5vSbFxeU+KhkofFJR51DY6sMMPYxl5oT3Zz+23PWSvjEglhWq5TVVqYCsqLuEUjUf33ZssMb/aCbq9z25oB/erb2xk6+eLoEpJtPnt7cv88x0LWPQmI43UdIbEwMRxkTCfNQMz4N24Pqqzvblf7PaAu38tnh8VDsBcN8QIrhCYRZAS92xmu8VIkVfC5sl3rEcCx8/kDd/rGUGcZLYMkaRn934SSizIXqubQpEhLcpF5sG4iYpN2Zjp+Y4+WzKubf7vHD4MIOTq+hEOI1b20yAqo8BZ6kFBH/z/iTmgMiCRRoQTZxmFGKl8DvJcy+Qo5RndoRVbbsavy9DSgm8RJXUmWuWYX4K20nN7uzbdF5AhNRAeTNrq0xFL1WU/uykHyA0PGsB5w9Z
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(366004)(136003)(39860400002)(396003)(2616005)(107886003)(186003)(2906002)(53546011)(41300700001)(6506007)(6512007)(26005)(83380400001)(38100700002)(38070700005)(122000001)(31686004)(31696002)(86362001)(66946007)(8676002)(4326008)(66476007)(66556008)(66446008)(64756008)(76116006)(71200400001)(5660300002)(91956017)(36756003)(478600001)(6486002)(8936002)(54906003)(316002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjUzSWdpb2dPbFhUdmdUTnQybDh4MC9nblNxcHlQU2xhVFZodkdPNGJuNXBx?=
 =?utf-8?B?Tm5jUmpYRFpFWGlLZXU1ckhQa1U0ZVdrTE9Sdk9xOHlOVkR4MmF6SkFGVnVL?=
 =?utf-8?B?SkYrekR1bDVLWHhtbXJ0WGVZWXBKK3pvSmZIR3l0T3U5MFdSNEJ0NkF4Z0ds?=
 =?utf-8?B?NVh6QVNmSXk2M1IzcytadVJYRkVkeWhuNThWemFnU0pISVlaNTk2V2hVa3Bm?=
 =?utf-8?B?VXM4Y0RNeXNZV3ZYcFpuODcwZEpxUzdmK2Rjd1RpVFhENy95bVJDSzE0WC9P?=
 =?utf-8?B?NVhiem1oVWwvZWFKVmVtemk5Z053V2N0YmNZWHFCL0ptdDQ0VTdnRUZ4ZUtr?=
 =?utf-8?B?N0ovUm1SRExQcmFtRjBQVUdJS1hYM1FicE5udklKbWhCelVacXBJR3RsekZN?=
 =?utf-8?B?Q2Uxa2tOdDRwTjJTaktsTnRGMG40bi9EdnlLV1U5OGdCZHNwZktqSXg5OWZi?=
 =?utf-8?B?TVpZRFFqVnlKc0k0c1RlNEl0cFIxR3dGd0NtRm1BY3BpTFF4ODhUci9WOVRP?=
 =?utf-8?B?SXAwdkxQM3FZdUxYVlhyYXVuNDE5a3I2UjBBaDduV2NDZERTbS8rU21EZ01O?=
 =?utf-8?B?YmdCSnZnN2hZaEhXS3FhSzBLU3VoSEZzWnRNdU5hYUJIVjBWUXpjZDhRRnNQ?=
 =?utf-8?B?RDQvN2tSWTlKQ3I4NXg0SW9DQlU2ZEZVNHliTjFuSEU3YUFiMW9UdVF0Y2NP?=
 =?utf-8?B?Ni9uQXVDcExDNnhuR2RJWVQ2NXpEckM1QjY5d1lSbk9yV0YzZE02QUVsSU9x?=
 =?utf-8?B?UW9NSnd2c0lRdXNHSFN0Z2huUDlLTjN6ZkZLRWhrVnFReklmY0RoRE0wWVRX?=
 =?utf-8?B?UWV6c1F2R29uRis5Y1B3N3NnU1RnaDZGTGsybkNkd1U4UlZwdVYwUTJCODN1?=
 =?utf-8?B?ek1RNVdSdXlBRUtTemVaWGJmWVdqc1ZzU3UwOGQyZHJQTXdRNTF0YTBRa0Zl?=
 =?utf-8?B?WmJyRnBvWnI2RTh2djJBNGhtcUhZamdtTEQza2tXZDc4TEtZVzlOY3VxN1pP?=
 =?utf-8?B?all0SC85TmlzOWRwaGlmMzlnQlR1MytxQ1ZBaVFxRjQ3bDZIVGN3NkZyTjF6?=
 =?utf-8?B?SlZXaWdXNUxYbG5raVBmSzUrQ2w2OFlDc1REamxMWlMrS04yZVpDdkZrK2ZK?=
 =?utf-8?B?V1F5Rm5pa0Vnc2wzTFZ1VDZYd0JVVDRMSVVPYXJwOWVYVmtXZC92a1dwUlUz?=
 =?utf-8?B?dGZsQXBqUm5ZR29Jck91Wm5zOTYxOWRZQkk0ejB3VG9pUjdPL1V1bTFjQ2wv?=
 =?utf-8?B?bS9wejlvODhWRFZOWmpiMW5DQ1UzZGJHTnVlMDBHbGNXaTVBc0N5Z015QUVh?=
 =?utf-8?B?ZGd1RWpaUHlSV3ZQVGlkUDVYN2dUYkdZVWY3S3AwMDhEZDJHU1M4enpJNUZy?=
 =?utf-8?B?SDNxYUNHSkZlZmhjM0ZkaHo5aWhSNGtSUGszalVxS3lLM0dFMmJac0FIdmR1?=
 =?utf-8?B?ekJKVXJuYU5UN3RlZnVqZURmUHJIWmlhWGExVkxwM0k4VE5NN3oxNHdMY3VD?=
 =?utf-8?B?VHJRWWNmcUNYR3o4N3I5bnplQ3d1YUxBcGlrY1llUHJiZjkzcko3VVJkM1ov?=
 =?utf-8?B?V21teVozWkZ2RTRFR2N5eFBSK0ZKRXpVWVRmTUVsSy9YeXhoMEtwRWEwN285?=
 =?utf-8?B?dkZ0Y0c4TFd1d2Q2M2RnSTN2SnpNS0JTc0JXTkJKcHR6K0ROWHZGdkRhZTFv?=
 =?utf-8?B?R3M1Vk9ZZ1pWT0pMUEpjRDA1M1g0dWdPc2Q0QnBnaDJzTkJLN054ZGFNNU5R?=
 =?utf-8?B?M2c1SmljU0N1aHhjelY4cGdrRTNsdXFnRlowRGRqL3VQdEp2d05ZTUVwRkxl?=
 =?utf-8?B?bHNLdlNjU2Z5cWN5TTdSRm9BRXhSQVU2WkZocDhiZXpReFlPOXlHcFFTS1lG?=
 =?utf-8?B?RHNCc0NkUXNwdnRHNUJvNUJ2eTRoZFBEblZNRGlaTk12QkRsUUU4QTRZdGF4?=
 =?utf-8?B?UkJRcDRlaUwrTUdkUWFNN0FIVTEwV250VFhUM2QySnAwR25uckk1aFFRMk9P?=
 =?utf-8?B?MitJOXZNOTB2cElLY3VibENGMUhnUzBweHZjNksveUZNam1xYkRha21pSjRy?=
 =?utf-8?B?Z0IvWmdmb3R3SzBzT2NTU0F5bG5EZFRFVXZvbUl6NTU3RGtlaWI1U3pTNUk5?=
 =?utf-8?Q?RgBkeHMp0A0nKvIxTkwB4Vtva?=
Content-ID: <722235E86769E94CAAA486D26B625304@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b086bb2-4dc0-49b0-2e4e-08da67252b70
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2022 12:17:36.5944
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oNAn7tIWFifRFlfiz+gND4cr7jdCXFgUPyg8wf27M3YEggoAeONUOeZiR7U3VTozFUrWIkduFTgmmmXfmDjSjjK/LIxmF5LiYKxRKoxE4HE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5611
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_051751_858847_37E1A6F0 
X-CRM114-Status: GOOD (  18.70  )
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

On 16/07/2022 11:44, Marc Zyngier wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Sat, 16 Jul 2022 08:11:13 +0100,
> <lewis.hanly@microchip.com> wrote:
>>
>> From: Lewis Hanly <lewis.hanly@microchip.com>
>>
>> Add a driver to support the Polarfire SoC gpio controller.
>>
>> Signed-off-by: Lewis Hanly <lewis.hanly@microchip.com>
>> ---
>>   drivers/gpio/Kconfig     |   9 +
>>   drivers/gpio/Makefile    |   1 +
>>   drivers/gpio/gpio-mpfs.c | 361 +++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 371 insertions(+)
>>   create mode 100644 drivers/gpio/gpio-mpfs.c
> 
> A couple of other nits:
> 
>> +static const struct of_device_id mpfs_of_ids[] = {
>> +     { .compatible = "microchip,mpfs-gpio", },
> 
> Where is the DT binding for this?
Already upstream, 
Documentation/devicetree/bindings/gpio/microchip%2Cmpfs-gpio.yaml
> 
>> +     { /* end of list */ }
>> +};
>> +
>> +static struct platform_driver mpfs_gpio_driver = {
>> +     .probe = mpfs_gpio_probe,
>> +     .driver = {
>> +             .name = "microchip,mpfs-gpio",
>> +             .of_match_table = mpfs_of_ids,
>> +     },
>> +     .remove = mpfs_gpio_remove,
> 
> No, please. You cannot enforce that there are no interrupts being used
> (and nothing checks for this), and you're pretty much guaranteed that
> the system will catch fire on the first interrupt being delivered.
> Moreover, your "remove" callback only turns the clock off, which is
> yet another nail on that coffin.
Will remove.
> 
>          M.
> 
> --
> Without deviation from the norm, progress is not possible.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
