Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1A5C19F2D
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 07:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DDDDw6ne6GU3eobD/EyZIaka+u5cRlhESdt9CL/vkpg=; b=BusJB0bvhYG0rU
	blCsXMj+ECSMtWrfX76/mjV0MjdNpmqW94qEkKW0mmKZlZgvkAxaq8CE1kBoaQem6LdM7CffGahPF
	ljiiea75rAh1QWA+mjwYQGwoWmjsOqx5R2mXHZEE9eGC971HlW5KAR0+xj7+ZSjfAYuc5XlYKfAvN
	1ALfkf3w2UkisEmvRdcyPgGrV6c7kl9IMLFeboI2dCOOCOg/KZ5JZAA4TevyCx2c+0fvs/JJrshXL
	ilQYWFacjbEkzy4WW+Zv0FXT3/qY8mc832elmluGOCArw2gduPWe+2CsrmtEt88M4Zg/l7lS6eGpS
	54u7JvHvXcIBz3+1nmLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM2zU-009yXm-Sl; Thu, 11 Aug 2022 07:52:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM2k3-009Rpt-K5
	for linux-riscv@bombadil.infradead.org; Thu, 11 Aug 2022 07:36:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
	Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:
	From:Sender:Reply-To:Content-Description;
	bh=rWsza1y2XxUEpNUuQe/z5RJot8RCMc2B8/MDK67ZNAQ=; b=ZEazKbkW3sjjH+0+kDOAUDWyBO
	4BXvybPnm0+5yo8YkW8G0HS498mhpnWqwxL91MXzrt5+QZ7dxtbNyXFWJVRCDR29rI+owL3PZdR5G
	h9XEMUawaHkXxXA0xO4FDKePPJ8MetN1cRIFi3A279P47qUX3pivRlZLfyB0EbQ+R/91bP28V6SL5
	5AnBi4OTp8CsP60GQ0MGSq/Z/ym6kTuET7LaDhiD89TrRSlY313WrCeephpCeO349iQhaAE47ljpz
	4qse2TZlgKv2okyR7RBWg9j6/SOruM8yTqgOhGXpbOYfBqzhLnQYIY1GGlAm0WWS8QzsRTSs7N+2F
	uszG6bQw==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM2P7-000Jxc-1d
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 07:14:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660202092; x=1691738092;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rWsza1y2XxUEpNUuQe/z5RJot8RCMc2B8/MDK67ZNAQ=;
  b=jWcFbZj36hpkFmBpqjS70RqzJkFVNDEgfpZwg8uxGlGsZqHDPk0aasVK
   9Gn13Q7C5cofGV62uZ7spTSeUuMOfWX14SpVShKULt/Tb+/ms4bl9mUbS
   VA/Thf9Xu+zjCm9M0NueQ/vW+NTHE/8C+4PbyOLxRrCTDudcMplqXRNGn
   UFNxlEdlX7UbUdpFvvSyoQp8ij3UCyoCtn0i7VN+2x/6GcZqjaIOu/lzA
   /lZelQ7g2UNs7R3aCIzCT5tTh+zignKWTjuI18rFYebuU1v6oj+YOWsPx
   r7riIwlJ2UbveZsEN8nF6wP40DyfiL9thtkfMm8MY7/dFSFO35mi29V+P
   w==;
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="108555449"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Aug 2022 00:14:24 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 11 Aug 2022 00:14:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 11 Aug 2022 00:14:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyOPN7ZJejbulFkw7uAE0Cbknp2VJPVbSPZBrM1l2irFf4dbDRTLq6IZThvK4Rk7xr10DhGxIwl1mvrLIf8wUmD5EnaOB1+/uULUqNHWjm7K6yLf4l7gkOl+XwW1fb59KPbG9P39YWmT1dNNEPyWXj3o7p2H8moT1Qr2qQd8S3DmWU48RGPBa/Qssd87nU4PlWzynzqqlV3YxdJUkV1bUB6Oj1lXfgyQ3mA2Qt7qX0ZlISyUM9mJYSoBXBvPlcC6BILjtdl6a1rCx52ZysJ3tREBu1AKdwWjSGaLBvnbvuVuclLwf3EDH9l0wx3Z+ZPHkCFzmD9gFzyuaMbOAgFqZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWsza1y2XxUEpNUuQe/z5RJot8RCMc2B8/MDK67ZNAQ=;
 b=cHJ6XkOeo7jkB/KtOp02Hs1bu9RRui5fivOpS+iucOdas7+Sl8gsyfvuPFtkkk5mkYN//cb7bm9Kb0K2DOtkf9VgT4CSXPCcmggjNeIV8ETs6KzVA7Udg3AnACg8mtm4h0M8vGYOkNXrAxLTFgUAAS+88kDye/RFAfJ6ijPwzUif7J8ZgFviSKFhZVxQ+bp4+2jUvEExB8rEhcLM46SuabWDU7F9K/ubuf7Vy9YZf4hxKWJxNx82Mk1atYm6YPLCf09a4tWgv1v/3X8g+LnXpwuKXTCsUui/w1H//pEtxwIyf1kCbqLV4ShgymlSnQ/6zs+2Qm6eI7PdjXmf6mFykQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWsza1y2XxUEpNUuQe/z5RJot8RCMc2B8/MDK67ZNAQ=;
 b=myREo8x6OEtE2nm+noCy3M23bclJnwirKKTcwdsxgY8w56Wp/DujIydb8EYsFMikWIiNSZ2C/+mx5C7+uiYusKFBM/YuwSa71qIAFGXQkgoVWl9Ghm81CK/rixiul+pIK92aGjAMCrrt0zjuZVnjT+i+omKccNKEElrFC0a8tBs=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MWHPR1101MB2223.namprd11.prod.outlook.com (2603:10b6:301:54::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Thu, 11 Aug
 2022 07:14:16 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 07:14:15 +0000
From: <Conor.Dooley@microchip.com>
To: <lukas.bulwahn@gmail.com>, <Daire.McNamara@microchip.com>,
	<linux-riscv@lists.infradead.org>, <wsa@kernel.org>, <arnd@arndb.de>
CC: <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: rectify entry for RISC-V/MICROCHIP POLARFIRE
 SOC SUPPORT
Thread-Topic: [PATCH] MAINTAINERS: rectify entry for RISC-V/MICROCHIP
 POLARFIRE SOC SUPPORT
Thread-Index: AQHYrVDAFjo5LcJuaEKmHCoveAZVwa2pSTkA
Date: Thu, 11 Aug 2022 07:14:15 +0000
Message-ID: <47742925-2d0d-7313-f811-aa17e35ce81a@microchip.com>
References: <20220811070506.12252-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20220811070506.12252-1-lukas.bulwahn@gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c691f28d-c1bc-47a3-390d-08da7b6919b0
x-ms-traffictypediagnostic: MWHPR1101MB2223:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KWa6voCmP9ChdyVxaJc50rOfwmr2tBvVnOxGqmUrO87uM3a0LM5HzTTNihX+SiJ0GJW0Uq1IxkMvluyoYCKEhH50autJdC1Vc2WGrOjt0D8VZYmfpKFYdQ4z1HkKJwc2An8XgzO9wKB/KkBuuzz08CbwQNiZ+DAGr3Oy+cHKBryIRljM6WbQgvi43ufXFR01JRUseGB1T3fckMylH7JFXxtLdFZpZTucqhwfz3/sCuIPPrlGPTtH5GWHvdOuSvJeen50ULYn7KtRWaSNT9DynJ+sWahND/xlY2WUaXysyEL9kgShSz4VHtXL7hZmsCMhcrgMd3aS1CrZelXow0bmPHiVEO5PJpbR6NYXKRTHueFMdg2SLZo4AYfyocArvi0rGCHXb3AZjaPBvdWSXv8E0oViECULj0A/Pgf5WhjLSsE0OLJkNcf6scxdo506gmcdnupx8JcwitflslNv/s6J6QhtzkcYnPh+z1vdlQViCmQNL+SnwX/LtzHBnfBTWlv6R9LSq/64dlo6pRegX52CBjlzF8KPuW02p4XAjfH4BNm5CFK/Pg/ujT/Gy47tNDhBvg2/Bxu6NJLtq2nDhuK/iF2+J9ckOtALOnI8KWo3Utv5oedmiKEB/ql0bkJNkWfeoDaYFYTTxnJzLKNRsXzTISxDVxfpcPo7O1QTUYr77+9VBm+Lfj02DkcLWrIk2iHEFC0dxgy/DZNdgVz7OJnfLI7KypHGvoujAKzTVJQ3m/Y6KWTKVbXLk9Cg9f0Hsy/JoR6mPKHRyEy6oWA+gx2XzgCaOblDszkmSU1v5ZG5KikSD/bJI9HGQOfGTtE04xJjsbxBe1LYsoqGRkQ25S0LNX4oGDDL7X5oJEyPQy/DN4FodSUBMXSeJslc0Gp8XUAj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(376002)(39860400002)(346002)(136003)(38100700002)(91956017)(31696002)(86362001)(316002)(122000001)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(66946007)(5660300002)(8936002)(38070700005)(76116006)(6486002)(478600001)(83380400001)(53546011)(6506007)(6512007)(26005)(186003)(41300700001)(2616005)(54906003)(110136005)(71200400001)(36756003)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OU10M3VBdTJEVGRRZTVrbERCb0NTNWJMa29tVXBkeCttL0liNFJ4OXA1R2FX?=
 =?utf-8?B?bHVWQlhUN3VFV3BON24wZXdMRTlJb2pNcWlLY1Qxc0pQbUJNMnZhclBldWIr?=
 =?utf-8?B?VGNFMTlUa29IeUxva2M2RUJqTDJPbnlISHlaMmNVRFg1c0RoaTlwaUpXT0tF?=
 =?utf-8?B?S2s4aW5DVGJGWDVsU3BQSFQwbVluSUV0dHppeFF3ZUNVaHF1Q1hBS1ZXcE1Q?=
 =?utf-8?B?aCtwZ25JMUY2Rk9WY1pFaGRoWHpKQ2RBWUJoVUVvcm8wbWdwYjBUa3hUOTBj?=
 =?utf-8?B?TGtFRHhmMS9veDV2aGRDOFZ6aVhpRjBFdVhjV2tvWlFSRWJRQjNqL2VrTVNt?=
 =?utf-8?B?SlUvZnNaaEd0bU1kcUJvTUp1ZmlPaGtGdzBsM2MwQmFhaUlnZ0I3OExEOFVK?=
 =?utf-8?B?RnhIVE9CNUVodW5wV3BTMlBrS3JOd0hhYlcrSjJBVGNydFRqek1ndktTSlpK?=
 =?utf-8?B?V1gxWWh3ZWF1MnF4UFRsKzBBNlM3b0NRc1NyQmdxWEpJSTFtajVPYWpQTWNi?=
 =?utf-8?B?MUduQW5FTkR4ZTNNRWNPalJDVXY2RW1GUVhIZ0VPWjhEU2JPWFYzOVpad2x3?=
 =?utf-8?B?N3lDcllWcHlGU2pSTTlBQlZLS3NKOVFnb25qOGZLUkhsbzdpQy9lSkkzSFdN?=
 =?utf-8?B?M0x6R2FtRVV0QThaVmxpMEtVRlBpZDlDZ0JZK1loSTN6eU5UWjh3d3V2ZkV5?=
 =?utf-8?B?QzdmM1hUMW9pc2NPWVJsNHRzbWdiZ3ZnTEdra3A4dEY1YWhORGdXa0JweTZk?=
 =?utf-8?B?T1daUTRodUlhWG55UzBtcDYvU0hQYjBvc3RYN0hpeDFDMmdHK29qdUVZYU9I?=
 =?utf-8?B?VWZySXJpbnBrOHBESHUvcXBWRUpLcEJTK0ZRbTJnc0Vkb0hRUnZkd3lDR1Bs?=
 =?utf-8?B?ZTdNcTh1VjMzV2V4SzhPTjl1dlYwRnpqd1grejRLSUdaUWZGaTZvRzc3U1Az?=
 =?utf-8?B?WnphT0J6WDgrc2VsdmZxL2p0djFHUjhDS0s4TERGWDZxdGxHcUV6cFJyYVow?=
 =?utf-8?B?bnFQbkxkdDBjcXhkYTJSVjNvYVhWTGw2eTcwU1I5RzBtMXllYjZqZGYzM2VJ?=
 =?utf-8?B?Q0NLTm9GK0Y1UDR3MzRmVXo5ZmhWajcvSjIvcWdBU25pMmsvY1BNUkFkVndC?=
 =?utf-8?B?a1hVSUlkYVZaTTk5eC8yb3VqZnc4TUl4eFl3YndVa2NhdVE5MDdlS1lIWGhK?=
 =?utf-8?B?TWx1Wkp3OFN2R2NoUm5iNmswMjZOMDZWVXV4RGhaelFEU0dFZWg1dUN1Qk9X?=
 =?utf-8?B?QlhkbXlHUnpkeXVGM0I4SEx4NXNPS0ViakF2SjAxVGFzdTErSVUyTDA0UDhY?=
 =?utf-8?B?VnRsSGZvS0hwV0lqUmVQZzdGQVBTdCtXU3NNbU8xM3pSOEZyaS9yVlVoNmhS?=
 =?utf-8?B?SVZYT2lWVkNwN1YyY09rTzRrVG5LcWtVby85WVovT1B5OFhMamtEcDlyQTEx?=
 =?utf-8?B?L0hiV2pUVGRrV0xrQ1pMK1BsYzFoZXFpaXIvUmJBVUxmYmpWOXd4SlJmU3lM?=
 =?utf-8?B?ZzI1R0NHSitSU0d0ZGU5bElzZENkZXVXcU1CUEZ2cGo0TkhpbGJTRWdaUVJB?=
 =?utf-8?B?TCt6ZE80a2hOcW1JekE5empkVDlrbS81alNiRTRST1VpNHFud0x4eDRRUmh5?=
 =?utf-8?B?QUQ4YWE4YWxpMWtHTEZVYUZ0b0NMam0zQWgxa0EzampZYlE3a1VUYkt0cHdl?=
 =?utf-8?B?dC9kMUMwVzh1czMyZU1WTmxtSDdpOXVnWHYrQjRDbGk2bk9tTHk1d3ltbmZh?=
 =?utf-8?B?VzNOVXpmYTRabkVWcU5UV3FaQmN5cGpocWlOaDZUOCthalV0cXdyaHVUMjUz?=
 =?utf-8?B?RHZVb2NhUS9JTCtPWWNscWhxeXcySHZZc1hsMEdNdloxZ05yTlFDVCtSS01n?=
 =?utf-8?B?aVZHOU5EKzUyMVFabUt3Wld4QmdCZVRZUTIxNW5KaFlLYU1RQWJBQm8zUnpE?=
 =?utf-8?B?QkVlNjFjOWdLSmZvUE1CeGxFcm1WUnNQV2lqQ1ByeWNKdCtTMTQyMGlRZDFT?=
 =?utf-8?B?TzZyZFA3eWw5Q2dNaEJBU2NFbUozbnpWaXlaZUxhSlB5clVPQytuM05KUTFD?=
 =?utf-8?B?Y2xPMWJya1FTbEducm4yVzB6MnQvSnl0QVU2Z1d4Sm9TZXMwNnUyK0Y2UVNN?=
 =?utf-8?Q?+Q7pg5zm+8kbLZS8KI7SfCLcb?=
Content-ID: <3F32FDCA522A1F479451A0F4FA92BA52@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c691f28d-c1bc-47a3-390d-08da7b6919b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 07:14:15.8639
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g+kXYK9G3VDLi8HkEUIXaSd0BbUlSOwuD2xgsAJH4E1EWR6BKciPGma9B7zQIUeLvFFlDZVoEwI2Khfaw4YFaiEW8m6dzA2H5qgFQIxBtLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2223
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_081453_670307_6394A5C4 
X-CRM114-Status: GOOD (  14.69  )
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

On 11/08/2022 08:05, Lukas Bulwahn wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Commit 3cbd67384677 ("MAINTAINERS: add the Polarfire SoC's i2c driver")
> adds the file entry for drivers/i2c/busses/i2c-microchip-core.c, but the
> file is actually named drivers/i2c/busses/i2c-microchip-corei2c.c.
> 
> Repair this file reference in RISC-V/MICROCHIP POLARFIRE SOC SUPPORT.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Conor, please ack.

FFS... Silly mistake from me there, keep getting caught out by
the maintainers entries when I do an inter-version rename.
Is there something I can add to my build scripts, other than the
get_maintainer selftest to catch these?
Thanks Lukas.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> 
> Arnd, please pick this minor non-urgent clean-up patch.
> 
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9203efedea1e..797fde7e1821 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17544,7 +17544,7 @@ F:      Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
>   F:     arch/riscv/boot/dts/microchip/
>   F:     drivers/char/hw_random/mpfs-rng.c
>   F:     drivers/clk/microchip/clk-mpfs.c
> -F:     drivers/i2c/busses/i2c-microchip-core.c
> +F:     drivers/i2c/busses/i2c-microchip-corei2c.c
>   F:     drivers/mailbox/mailbox-mpfs.c
>   F:     drivers/pci/controller/pcie-microchip-host.c
>   F:     drivers/rtc/rtc-mpfs.c
> --
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
