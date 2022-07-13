Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811AAC43334
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 11:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wnuIvdQEntkaN64O/vcgWFyyzDfG+kpbXfEI2DKvNYM=; b=rNWiONH/R9GyGX
	iC9SHe8qVsExOVTlFA4nItlr6WXc3AxMZgn0lKSY10T9nOUXat6LDg2OyO73a3tHAd0zqNNyUMODK
	8F4K3ZayzRJNwTqJ2CnyH1sEC/mKFuSEqLtdyD20+aSCuQHywEpylFeIvV57LOb8wC1A5luCPc1pZ
	zF5zGe98DZrRom/Fprsz40VcUis7OpGfo39gJIaub3TnV8f2csoF1/RQHivNsdw5hK1Aqa/GuOrQ4
	BQr99iwHXS+toiTbzd6q81OzttQ8mmx4+e57kEB84L/WgxhExf1O49EuBDRZDfU6HA19aJXp6i8XD
	DV1R2AGpMPFMjY55A2/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBaVh-00376s-5c; Wed, 13 Jul 2022 11:26:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBaVb-00371s-Oe
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 11:26:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657711583; x=1689247583;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Lhyrc6vxI/4YSqfNRKGG8TVpVPVUbOOuIbI/FED7MBg=;
  b=eXBElyJCqmU/nYbMlF14S8LNzCswgfSpvtNguFLQHMjETICXXc4JUJER
   Hj5hacrYid8gkXdTKYQpts/RQdkDQ/Cc2++r8UU0hrRH7ZyQj+L3PSkHl
   61CCWDvThDTZCkvk1NB5cLsn7Z0ucXzrwd1xWS1B36qgQZfpYRm4trbl6
   9teeWm57in5EO3C5cTgwEGX0J18fMrvwOvk2FVIztdjEnteSFDetMh31n
   F1WylAKtzh1m3/5sl2btKOtlk15pDB30MmbTRu+7ob6Ku8JAgikKvCwNr
   /lo5DD9hbhl06zEj/Gr+9BoZjdB1MmBcjlLXN08a/UJ4Vx/ptFuU3HNUG
   g==;
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
   d="scan'208";a="167624561"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jul 2022 04:26:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 13 Jul 2022 04:26:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 13 Jul 2022 04:26:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLITlcVp4e5RPNf//b8K3fCn8yY9FKxnW3ob7t4rnCTcyV4855qYkpa04yDHZlhNwBqJsqwtRNuGDpiLWfMMa6YH0ETeZm4YdQc1AAWg35aG/2ow0CrrvHnftRUDJhYqN6JR77HxM1d06AFizVMsox538ByqrjO8QHIkt1gZnW4eIctF8cFQEYCv70CqiHExpHH+416atDVCzXEpigtRr9/KqubWWvHZV9oS1csVQczOuKPNO3gnYoLlbNlW633PGT9MXXsNFh8FiX29Fs6MHmI1hfu7XSlUjhcPzl3mAd9Ri8+jXliBo71Xe5dr6ihONN5khEpBQPk1Z8HrNP7iDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lhyrc6vxI/4YSqfNRKGG8TVpVPVUbOOuIbI/FED7MBg=;
 b=Rd/EGtwYLXOqv+WrleqB/FOCANL8Cil6BTYoVqebtgpX+3Z8JxRxHgsFX+urFl97cfn1MRP4EfWOT7PJ2rgRD8eTHojnpfYfJFHx4Rds1F51G339k+iybdkTjSr1OXAcO1UKiVmj90cRYJIpRefC5epTBAkXGRXkRgCdzNkQGuBmAGypAnWslgXw/hXWAg2VRYUt+7D5ymHol/9pLJ4UhWaIvfvS4rrTMc+PGyvI0W1BxbGjg4mgUn0YM/UJ9PC43JMCS/98LkAG58+0Ug2nm0zhMGumtDbBoHiv1NEzClgy/ZjGcuYclNvwyH8PpuJdcIwRQLCWFtkynCAn/YBwZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lhyrc6vxI/4YSqfNRKGG8TVpVPVUbOOuIbI/FED7MBg=;
 b=UjJSY71FXlmbE02/a2kco+L/lUVDHr1oclVWhst5BCpbnjkfZm86HnyGjg16cKqt+OfiLYIXhE6sX9/wa4WDP96aF2m/BLyJ/KTF6QBUql1l/QeKenw+yBQVpOUsFERz5hSQmyRkBOx+S88hu00jQuGhCC8+Tiq1UTBIJtR92Es=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by IA1PR11MB6124.namprd11.prod.outlook.com (2603:10b6:208:3ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Wed, 13 Jul
 2022 11:26:17 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69%8]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 11:26:17 +0000
From: <Conor.Dooley@microchip.com>
To: <Lewis.Hanly@microchip.com>, <linux-gpio@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linus.walleij@linaro.org>,
	<brgl@bgdev.pl>, <linux-kernel@vger.kernel.org>, <palmer@dabbelt.com>,
	<maz@kernel.org>
CC: <Conor.Dooley@microchip.com>, <Daire.McNamara@microchip.com>
Subject: Re: [PATCH v2 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Topic: [PATCH v2 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Index: AQHYlqemVrcQOBoUV020qkXDgR8Pgq18KXoA
Date: Wed, 13 Jul 2022 11:26:17 +0000
Message-ID: <776164f4-21cf-7720-3cf3-3b30b72b8b29@microchip.com>
References: <20220713105910.931983-1-lewis.hanly@microchip.com>
 <20220713105910.931983-2-lewis.hanly@microchip.com>
In-Reply-To: <20220713105910.931983-2-lewis.hanly@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ccef86bf-99e5-48b5-d56f-08da64c280e2
x-ms-traffictypediagnostic: IA1PR11MB6124:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DQWiAQ+x9lRk+6gS2DzU65a+BQmN2djxFsW2a+tBQTZxkl2z4Rx/z1X6x5ljp+20qxk5/LUKR2KKETDjxa+enzeMaYKe8WkEZ/bBy3X/R731fBZvsOCsXSolk0TLbGUYNAdKwTaoOvYn3Jj3nJfFszgRWEU9Ti3mHYZDzlR+mR82j+a1JLDS7xPa3MeChw0JaOWNS5sX1yQ4H6HGQMNtMjhPtg4akXu75wvaP0+5LiXOmzBIfWSAA6+Ke0kGj96Sp76S303l/j2XD718PYVF1BfY0sDOM2nn6BikNbrNZ+mthtovoBAooqkd8ERrT8MgJOCC+mjhkXLby25Cyo94CRGKkXyvL291Tk1g0+xCmNLi/33SVDQhVOnRmKkFZd2cp4+ejQEWdnKho4IPF/tT22+2AwX1/hxcyg/DdWSQtd4+dYXRUOpcXrbL8YpqooEbU9MZKs4eY+/Qaqg1mgnqHNxKnm6ovPsKcycMSWY7Yc5fi/eHBdVFYVN7wzONFbkSRc3Mh5E9Okd1pCFTnJd2tIE+LH+6c/kfXyoyxNi03JvMjjJyH0+TyuBCUykeBy6q3oQsCCMt1tzLq+OoScIOX6x+FcslGD9fIu4f48/KHsey2frXfodNEVFq4y9JeYf2xil3Pn/vU545OKIImKAUiD4u0JoQTlE56FfME84i/gx3VykAJVaxFHcATJhktqcUxBN4FSd4XPcvDRu0JAuHfSG/4mk+A21ewrNPH6t10rvne9TOJFrqXTlrWofPDdk1+7rjHFLK/+5RDjOWXtId2HGtgbQosvJQgud7nr+Js7BtJgSx+hqPTK6XdQYKdODnLIxPhxYjNqLbzhCS5SqJcPuywdiugtgQR9DS6GX1WID804ZOMilhFvV0cT74tKX0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5160.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(396003)(346002)(376002)(366004)(64756008)(8936002)(86362001)(54906003)(53546011)(66556008)(66446008)(91956017)(66946007)(8676002)(76116006)(71200400001)(4326008)(6512007)(66476007)(26005)(31696002)(5660300002)(38070700005)(2616005)(122000001)(107886003)(110136005)(478600001)(316002)(41300700001)(38100700002)(186003)(2906002)(31686004)(83380400001)(36756003)(6506007)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWtsdDM5RXhkQ0FZL2E4WlFBUCt6U3N6aEhZMHA1VTFhVnJMYkVpTjJXVGFh?=
 =?utf-8?B?WERKblNzWEpnMzlwaU5INlV2V0pXVytpbFEwRmZlYVQ3MmgyUkVsKzNvUkRD?=
 =?utf-8?B?Mk5vM2FBOXlrbUpWL1hxRjhmelZ6YVI3S2FTRjFVYThQUUs0NnlmTWlmd1pG?=
 =?utf-8?B?eGhmTVdMdzUyM3NPeFRTUlNGbWwxaG9lWlpWK0FDSEMxa2ttRDVOVnhPQUhM?=
 =?utf-8?B?TzludENDMUR4V3Uxd2JIQk9BQTFuS1FUNTZybDZjK09FSjE5Ylo2b0dnRytE?=
 =?utf-8?B?bGk3QWtndzVVdGlZdTRFZk1UK1RJeG84dFlxc01GZXNsaVJ0aXFTeDBobVk3?=
 =?utf-8?B?dFRJVW5DOFYwQlBQa2VjOFdwU29kcFA5ZUo2TnB1bDBGQkZ1MUJTZnNDUEZy?=
 =?utf-8?B?RTRmeHcyT0ZpZGZtYW44ZSsxNDJzOExUWWtQRHdzcjBwNlk5MWRNdEFaTkFF?=
 =?utf-8?B?ZExCbXh2c2ExV3NTOWNSak1NVHc0c3E5aFpWN1hmaUQveWwvYTNNcDh0WEpP?=
 =?utf-8?B?OUJydUJZV2J3WFZ3bSsxa0drZFQyeHZJT2QwTUVUTkoyOEhBZmlpSGpZbEU5?=
 =?utf-8?B?QVFaNGlia242KzhBbGxDS1FWay91QXFmUGxPY2hEZmFReGh1WVIvN3V5QVFR?=
 =?utf-8?B?eWFQMEYxaWoyc2VvWmxETWlBNTRDTEpsZzNyUi9LOUtWcUUxNE1qa0p5MVhV?=
 =?utf-8?B?OE1GWjlJb0tTVDFNNktuaVpEb1JyV01SNDVpUFFnbFVwQnRmTmxuKzM3eTRx?=
 =?utf-8?B?Y3llMmQ5TlBiMkptZmdKUi9HeGRoUUUxUEhsbi92OG5TbTJsNEo5bmpBaHRS?=
 =?utf-8?B?ZERHTy91a0dBNXgxeUVKU3ZNd21uNmtPTmErSEt0Z1RRUy8rSm54YlF0U3Vk?=
 =?utf-8?B?UnBDb0RoUGhUN05VWTkvcDQwZnJlaHlXR01uQWtkajN3dWVPRngxRG55NEZ2?=
 =?utf-8?B?a0RMUWZobVZTNjMzQytrYXpTeTV3YzdsWEEzbmZYKzZKVGZMNXQ1L29TYXls?=
 =?utf-8?B?bE0xcFp4QmY2THZ6L05aVzIyWTIvU2tQbFZ3Tzg1ZG0rRVF1OTdpaFRSQTJa?=
 =?utf-8?B?OHJzS1JaZmdvVUhkZHdOQ1VyWmlOUnd3eW1iSTNXL3pPNnpGREYrSmk1d00r?=
 =?utf-8?B?ZlI1SVFicmlJSU5VaUFxeW9EY1NpZzN2dTJCL1hhVmlxSHMrYXh2NVArajlL?=
 =?utf-8?B?Z3JpMlM0NUJaVWlLUlEwS1ZTYjB4OEhnMjF1a3h1RnlRMlhhbTJCQ1NJbXMz?=
 =?utf-8?B?azhkeC92M2JFQmwva0RjM1R0MkQzSzBmdmQrY3JyM2ZQa3FCWVYvcHpEQ0kx?=
 =?utf-8?B?OFkrT2FKNitwS2ZBc2JZZG43cU9Fd3BFMGdkZWF4M0NlZitqeXB3dU8zOVBw?=
 =?utf-8?B?N29RU1J1NFJyajRqaExWeWVHWE5zN3NqblY3ZVNjZ0R3NXVkcHZOb0kzVk83?=
 =?utf-8?B?SkxYaEJQd0lHREovWWJjYjBBak45STJ3bVpiUUIxNVlUOUdVMnZlMHUrZTE2?=
 =?utf-8?B?Q09YUzAyamNKSW5VWWJKS1NMbFRaNFV2TEVUNFVzczYvKzVXVmQxQ0NOdG5m?=
 =?utf-8?B?cFJSNGJQcUFkU3pxZ3RLc2NKc3FKaVpYREVTb3N4MktQMlltb2R2VmJZN09N?=
 =?utf-8?B?UGxTQzhVSExFOEg1N3FrYjV5ZEJwY2ZJblNiTy9kdXNtYzdzZzVKZWw5R29G?=
 =?utf-8?B?cVY1Z1grc0JlYTlhdnBzQ2Q3eGtydTM3Tnh2RFZDZlBZREI4djFWbmhqNVk3?=
 =?utf-8?B?dUV3eFE3SHhhdnVLNFhVZFdzZFF0TStiQkduMFlvcjZJK0VmeFFjd0JSSzd0?=
 =?utf-8?B?RWdxTG42aFVDOEhucWllQnZTUHIwcUNLTUdiMjBrNmRId2NoOEZTVm15TGpa?=
 =?utf-8?B?L3lLRmxaQWt1dUE0U3h2RmRaWUhWSEdUQ2lXWVY0UWxMOTJKcHIwWW96eW16?=
 =?utf-8?B?bVBVUnhDRG5rS1BWbjZkaEJGTU9OTnM3cktCbGkwWVhySFBGREUxdUlWM0I4?=
 =?utf-8?B?Visrek5ZcFZJb21WR0NmcXNSTElJK0pzODNuTnFYVFRuS1RvbTQvajN3bU10?=
 =?utf-8?B?N1pXWFc5aVdWWHRuNVdOV1FBSHZ1TlhwNlVRalc0TUpsZ1lhd2VlcFVRTE5O?=
 =?utf-8?Q?jtCzJQBKapfFfjUsPUqBf7N7+?=
Content-ID: <67BBA6803D6EE34981474F13CB546ACE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccef86bf-99e5-48b5-d56f-08da64c280e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2022 11:26:17.4973
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wHwD5vHXRQMFxLxFyuoniU3UfWX+3rCr2A1zbagWiO5yGqu5+QjqMDu+TmOSdVzS8JpvZ5sa2V/SUqmcU+eCvSKLet0UdfbEOwYQYl6wMXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_042624_135935_99EAD99B 
X-CRM114-Status: GOOD (  22.51  )
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

Hey Lewis,
Couple comments.

On 13/07/2022 11:59, lewis.hanly@microchip.com wrote:
> From: Lewis Hanly <lewis.hanly@microchip.com>
> 
> Add a driver to support the Polarfire SoC gpio controller.
> 
> Signed-off-by: Lewis Hanly <lewis.hanly@microchip.com>
> ---
>   drivers/gpio/Kconfig     |   9 +
>   drivers/gpio/Makefile    |   1 +
>   drivers/gpio/gpio-mpfs.c | 379 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 389 insertions(+)
>   create mode 100644 drivers/gpio/gpio-mpfs.c
> 


> +
> +static int mpfs_gpio_probe(struct platform_device *pdev)
> +{
> +	struct clk *clk;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = pdev->dev.of_node;
> +	struct device_node *irq_parent;
> +	struct gpio_irq_chip *girq;
> +	struct irq_domain *parent;
> +	struct mpfs_gpio_chip *mpfs_gpio;
> +	int i, ret, ngpio;
> +
> +	mpfs_gpio = devm_kzalloc(dev, sizeof(*mpfs_gpio), GFP_KERNEL);
> +	if (!mpfs_gpio)
> +		return -ENOMEM;
> +
> +	mpfs_gpio->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(mpfs_gpio->base))
> +		return PTR_ERR(mpfs_gpio->base);
> +
> +	clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(clk)) {
> +		dev_err(&pdev->dev, "devm_clk_get failed\n");
> +		return PTR_ERR(clk);
> +	}
> +
> +	ret = clk_prepare_enable(clk);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to enable clock\n");
> +		return ret;
> +	}
> +
> +	mpfs_gpio->clk = clk;
> +
> +	ngpio = of_irq_count(node);
> +	if (ngpio > NUM_GPIO) {
> +		dev_err(dev, "Too many GPIO interrupts (max=%d)\n",
> +			NUM_GPIO);

This should fit on one line

> +		ret = -ENXIO;
> +		goto cleanup_clock;
> +	}
> +
> +	irq_parent = of_irq_find_parent(node);
> +	if (!irq_parent) {
> +		dev_err(dev, "no IRQ parent node\n");
> +		ret = -ENODEV;
> +		goto cleanup_clock;
> +	}
> +	parent = irq_find_host(irq_parent);
> +	if (!parent) {
> +		dev_err(dev, "no IRQ parent domain\n");
> +		ret = -ENODEV;
> +		goto cleanup_clock;
> +	}
> +
> +	/* Get the interrupt numbers.

netdev style comment

> +	 * Clear/Disable All interrupts before enabling parent interrupts.
> +	 */
> +	for (i = 0; i < ngpio; i++) {
> +		mpfs_gpio->irq_number[i] = platform_get_irq(pdev, i);

You need to handle the case where platform_get_irq returns an error right?

> +		mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, i, 1);
> +		mpfs_gpio_assign_bit(mpfs_gpio->base + (i * BYTE_BOUNDARY),
> +				     MPFS_GPIO_EN_INT, 0);
> +	}
> +
> +	raw_spin_lock_init(&mpfs_gpio->lock);
> +
> +	mpfs_gpio->gc.direction_input = mpfs_gpio_direction_input;
> +	mpfs_gpio->gc.direction_output = mpfs_gpio_direction_output;
> +	mpfs_gpio->gc.get_direction = mpfs_gpio_get_direction;
> +	mpfs_gpio->gc.get = mpfs_gpio_get;
> +	mpfs_gpio->gc.set = mpfs_gpio_set;
> +	mpfs_gpio->gc.base = -1;
> +	mpfs_gpio->gc.ngpio = ngpio;
> +	mpfs_gpio->gc.label = dev_name(dev);
> +	mpfs_gpio->gc.parent = dev;
> +	mpfs_gpio->gc.owner = THIS_MODULE;
> +
> +	/* Get a pointer to the gpio_irq_chip */

I doubt this comment is needed

> +	girq = &mpfs_gpio->gc.irq;
> +	gpio_irq_chip_set_chip(girq, &mpfs_gpio_irqchip);
> +	girq->fwnode = of_node_to_fwnode(node);
> +	girq->parent_domain = parent;
> +	girq->child_to_parent_hwirq = mpfs_gpio_child_to_parent_hwirq;
> +	girq->handler = handle_bad_irq;
> +	girq->default_type = IRQ_TYPE_NONE;
> +
> +	ret = gpiochip_add_data(&mpfs_gpio->gc, mpfs_gpio);

Can we use a devm_ variant instead here...

> +	if (ret)
> +		goto cleanup_clock;
> +
> +	platform_set_drvdata(pdev, mpfs_gpio);
> +	dev_info(dev, "Microchip MPFS GPIO registered, ngpio=%d\n", ngpio);
> +
> +	return 0;
> +
> +cleanup_clock:
> +	clk_disable_unprepare(mpfs_gpio->clk);
> +	return ret;
> +}
> +
> +static int mpfs_gpio_remove(struct platform_device *pdev)
> +{
> +	struct mpfs_gpio_chip *mpfs_gpio = platform_get_drvdata(pdev);
> +
> +	gpiochip_remove(&mpfs_gpio->gc);

... and drop this?

> +	clk_disable_unprepare(mpfs_gpio->clk);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mpfs_gpio_match[] = {
> +	{ .compatible = "microchip,mpfs-gpio", },
> +	{ /* end of list */ },

Don't need a comma after the sentinel

> +};
> +
> +static struct platform_driver mpfs_gpio_driver = {
> +	.probe = mpfs_gpio_probe,
> +	.driver = {
> +		.name = "microchip,mpfs-gpio",
> +		.of_match_table = of_match_ptr(mpfs_gpio_match),
> +	},
> +	.remove = mpfs_gpio_remove,
> +};
> +builtin_platform_driver(mpfs_gpio_driver)

Mising semicolon?

Thanks,
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
