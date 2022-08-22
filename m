Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D62C28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 22:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yTjdjSYAyl6n7Cdi/3VBt9qK4YDDWx4uyU5q7Y6c0PA=; b=bWL4S9Xn24n2ah
	WC1C7JKCfmpZBEQIsVef8SH0PArcOEZRSaTeb/hbrhIP3V+5V28k7ZtuN860vhqpvNYuh2S2NUwHI
	sm1e+VQDTFygrcIEYgmnpomKxvU6KP2SDZswA7YUasSVNvGtJyJnFYlqhvqI+iOwJsHIG63nyAzjk
	vL/2hFw5twiV2ESzArmgXwqIOBpS68yxqEbMvDnjl8wIpMkCvev9wjHb1ZzoXQkOceHTffnjms8VZ
	VV/4Rah+eP2qvHZEZD1NcHimd94roPh1a8a8RZtEWhPHPDSQJ01SRkdNca7TTakwX3YlIPotyvUzj
	7yMNQt8/aEN+KngjtWng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQFVS-00FHJJ-T3; Mon, 22 Aug 2022 22:02:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQFVO-00FHEj-EX
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 22:02:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661205766; x=1692741766;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=vMMX+8DwZnqIqpLPRdphIb+8aMmJEx2ET12yZPK8UjI=;
  b=Cv2wTdDjWHPv/jfzaX71l+xAXcYx104w1H+ETFEvcJO0a7fc9sa8wZl5
   QnuuTKgOXf+Z9IiELceDV2b+yLZeW/p3j2WpkfN/F0S7L5y+TfX2dky4G
   eHpTVulIC5JzLJr3YZvk8V6tm0hG09Lmds/RyQKYPaQeZwYzhjLbeomtQ
   UY42dLO2o3ddbo0WS3ZBAScZ+avYslNRZcgoLQuLHh9DlAvuwAkN3EBT0
   gR2ZZSleYToaz9FJxtEjaHOMpHNOcuslIhNHTHvWN1PXZrrziwiaWbwBA
   cUmN9yP7JVh7ILxy2NhY5C7vMpqiF26oEGu3dEN4juI83X0ZWyFU/dNKj
   g==;
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="110192573"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Aug 2022 15:02:41 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 22 Aug 2022 15:02:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 22 Aug 2022 15:02:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KH1NkKoSiaOEEqo7QYa6cITFuMqYMKL3WKIO7qINmCpdWWb+dHtgWB/m6IUxFN7pJ+rM2BgqhtXo6MiSGonomFlJ2AzZN/E/diz3AUpQOvBnIpDCHORSSblrWRrJYh0zZ9x7/UDG99lGpw+/HRf+C3Jv44duSTPKn1XDNePs01Yl/0XTFykfUoX/sGC6ItasbicGEqsMO/nGMhV52OossaFmjahtT/JaJ7j776k0SIYeHddlBr3Vks+ZNFveGlTxDWNxq6XNy+7y5WtvDX1cAhM2N1+KFRUw668pnQtTcJOxoG4fVW+sZBcZ1MxlGxoSdzSRYK3rmiYaNFftNVLPKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMMX+8DwZnqIqpLPRdphIb+8aMmJEx2ET12yZPK8UjI=;
 b=bZmwW4hZvwUKnka3nl51VG1KyjrtIpZ+wppBVhJrNkyIWqZf94I8UhuQLzTcE22rBp2F8B2M69cmWKEwh8bRedFQgY1iuEyb/Zj5YJ8MqNpi57/YldP4bGVx0JhDQ/oK5v45zMdvvFpQ50ofQ6x/GGnNv4fSbAFzRZRwQpRPim/qkgk865iumw0hx4o5h3pnkDHgVvqLAqjTRKQzswrWeN1PYR8cZtlC1rLuOkWpBRT3CkZXygDwYRPG0NYXv3RfqK9w8m8vK6NWb6e6QydI+J0zRko9nxyylPQHaFPPDc+wefixix4Cbka86ZgbDPq9aXIzmcb6GC3YS5rZOzItXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMMX+8DwZnqIqpLPRdphIb+8aMmJEx2ET12yZPK8UjI=;
 b=CG/e2686B8UiWIoE32d7B7w7MSYU/kTHdtSejADjq5gIFHoDsxwwGRfypbV4PlE1/D241SXdXbwPgNTdcqBMxfyqf6W9h+SbmLtjFrhzibDIpcsx/uwh6qATll9QMc6bSWf44PL5j4u+c64JcD7FZOxqrqWKSoxRPgGpPhHqdJ8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN0PR11MB5744.namprd11.prod.outlook.com (2603:10b6:408:166::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 22:02:33 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 22:02:33 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@rivosinc.com>, <atishp@atishpatra.org>
CC: <linux-riscv@lists.infradead.org>, <anup@brainfault.org>, <lkp@intel.com>
Subject: Re: [PATCH v2] RISC-V: Clean up the Zicbom block size probing
Thread-Topic: [PATCH v2] RISC-V: Clean up the Zicbom block size probing
Thread-Index: AQHYrmWTaMkFgwggr0icYeiN4P0UD62riSUAgABargCAD6UkgA==
Date: Mon, 22 Aug 2022 22:02:33 +0000
Message-ID: <ebc4bbcd-becf-c5b7-7b7b-82dfb4c81bf8@microchip.com>
References: <mhng-897dd8a7-bc9f-4a5c-a336-3d48633a1e58@palmer-ri-x1c9>
In-Reply-To: <mhng-897dd8a7-bc9f-4a5c-a336-3d48633a1e58@palmer-ri-x1c9>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9abfa1ea-c0ea-49f7-52f0-08da848a0423
x-ms-traffictypediagnostic: BN0PR11MB5744:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yuoAHJpK98iee5k0SpaDKTY674JmQtLE8o/KTFE6kqhDkGxLNNDQ0nvUBlLhx/3dHxymDYQth0xPHrPEVE+NPiHN4jqpYYm45yJwcajbBQ5FxrIf9Pp5nkHw4jUBke5sg5pJO1S12h65Braq8kA1UCvnt1L2eBs70l9K4BWYKzXXEZA240X5HUvZRaYiiUW+m3+f9vOVhp5nJxJFa9CWYTvSt7UdMXqohQPgKoF08dG9QDQKESzD8hFZXLYbiSiLtqTF+o/H5TJ5A7YzZhwx1zCUlRuEFz33+TUuijnCQ0xr3WqMiW1PbnHWGvI9nwdBok19GlWQOTp3KurfAx3sp4u1hBcJYXbAni4E+MjClHQChvw+2O4UGA6BiVvS6BpydKAnztc47k6/50x+em/nyQUBhbqrOwju3kCXsxGseX5IsE9UYTTE0MdhWRc8IOzkgGGcpL4ZCinr/U44y2oS7zosfT2ZYRA6jTgN3E8yQ8pMxel85jhG56K9aIyM7EXAKfn6d4NwlV3tTEy5g80oPiMoz6Vc12L+i7qVTJIG2tgioKx//KDlmni/28eIt6QszstnqGXxKdiybBJaZGekmJygG6epfXetDKglNiZQpNNq/DJsmKhfLF3/8ea5a6CD7+4uFZYn4INvxJ++l68p09xYFaZG6LnCaJR7TxLtCDJb8gK9oR6sYBhZHd8DKrpe+Hau6t+Hm2EE2WeyBAyfXT01FPspiq44ncHK/CCcQCZECN40tl6JNOIea1fl4ctAcIAwmEz15Y2a1sF4s810yHW8/iZO0au8SM15qgR2SOJpzLSAzlbose1egBQ+ZEMidKmCtNfh9OJ3uN+iKcKW+J4r1FFXW0tp0RqAhQUDUts=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(346002)(396003)(136003)(39860400002)(376002)(71200400001)(6486002)(478600001)(83380400001)(316002)(26005)(6512007)(54906003)(110136005)(36756003)(31686004)(2616005)(186003)(38070700005)(38100700002)(8676002)(122000001)(4326008)(66476007)(66446008)(64756008)(66556008)(76116006)(66946007)(2906002)(53546011)(6506007)(41300700001)(31696002)(86362001)(91956017)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NlhBWHp6WVZqZmdtSW1aUFpZYlB0ejVlNnhEaXdyR25CNERvbDM1eHBiSnov?=
 =?utf-8?B?YVNCcUlmelQweUhOY3BVUXIxWDdxblFxRTRrUmFHVjBoTFZPejhPSVlEb0RP?=
 =?utf-8?B?ZWxKdzYwdit4elAyb2hoMGYrTTU1MjBoMHl3cVlTMksxaVVFRFlpek5Fd3Vh?=
 =?utf-8?B?TklzeUt0NDgwckF4bFZ1SStrZ1lZc0JpSTczb3duKy82eFNZZWlteXhBbGQz?=
 =?utf-8?B?QUQ0M2I2L0JHanNTbFRqSXdkM2tmS2M0U3VXTmVzc3ZTZ2k5SFFLbGFiN0hu?=
 =?utf-8?B?MXBrcm9GZHd5NmRuWHZQYTlQbklxM3ZJdjY0U1JGMjZoZ2xSK3JUcWVzZ1J2?=
 =?utf-8?B?WFdtb2l6RmpHazRIcDhTczh5M3ZGRndEeHVHRW53OXZIRFk0SzBUcUFtR1dv?=
 =?utf-8?B?cU5sTWxyb1Jja0FISERzSUg1NXA0OStzZzJYUmNRdXNTcHVUYUdqMTRBMEx1?=
 =?utf-8?B?R1FKZ053MER3eU9CUk9RQ1VTNUV6Z3UwclJJOTVOU20zaGlBdDlCV1FsV2Zv?=
 =?utf-8?B?TmIrVzR2VnJkR251WHdIK0tpd3R4b01meEdEZU1WTzQ0SWJXVHMwTzNLTWVI?=
 =?utf-8?B?dDRZbExLWFZ6OUQ3Um1Nc3RxSzFWS2V3Zi9tYUdyejFVdlNOaFR0Z3h5Rlcz?=
 =?utf-8?B?elRuNjlmblgvazVoMEZZR0M4VWpsdlRFZHlvNTZvSEFrbUptT3B2MGVXK05E?=
 =?utf-8?B?R1NIZmdiTEZ3elE2d29haUUweGs4eWNzTkM5OEc2RG1OQzNiTmdGM2c2bW5k?=
 =?utf-8?B?TEdNcXdwY1FTNERVVk1yeTJFTGVnSHpVZU9Ud2pLOGtQa3JHNncxRmpid1hQ?=
 =?utf-8?B?SlRQakNxSi9EVEdyQU9DRTFJSVdyTFl3NWczMWh3Qlh4ZUFRd3h3UjdsMlk0?=
 =?utf-8?B?eThvSzBRSkVJN2RUSkxoWkpWSUZCYkg2QWZPTHh5ZklsN05TaXJZTDBaSm9Q?=
 =?utf-8?B?elpFMnBBZ3Q0dFYxYlpzZ2ZKRlJTc2ZzNHp3NTBHRUhFWi9oMEdBYjA5L29x?=
 =?utf-8?B?VUgvSHhGK1ZnNzF3dTdwams4azZYYy9NRTcxaUthZGhqRjFtSXZoeXZ3eXBW?=
 =?utf-8?B?amRsU3Bqb0xhTlNueFl5dVl5aG8vb0xwbjZjQVBpRDU5eVc2NGhXTzROTjJu?=
 =?utf-8?B?SmJwK2pSanIrQVRZQi91VTdzQmRVcFBvbkdFLzBmQmdrdXowNTFuc054RlBy?=
 =?utf-8?B?ZjNwSklWa01SQk16T2taTG1DUDRwYUwrSWNzYTlJMWQ5ZjB0YmpJVnNncm9j?=
 =?utf-8?B?RGZyZzJ4dXNUWGZueENvYnNKWTFDTkh5WFNhMGhCZzlBc2V5ZzQ5V2wzNENz?=
 =?utf-8?B?bktKRVNOMCtCY3JZb0NVTWlFRS9pTXM3KzBCRXAzSndIMW9ZQjA2VGJSVi9Z?=
 =?utf-8?B?dWpDOEpSWk1PQnhib1ZhbytodkkrNWRyMTBKUEhiKzY3SVNoZ0ZhZUl3M3F6?=
 =?utf-8?B?Q1J2MGticlUzaXVjUkNWZzBhcjZiVUI1amlHM0QxWkYvMFlZenE2WEZ5RU43?=
 =?utf-8?B?cFMvUFdwQmZDY0Z6dStqbWErNUNoTGpSbjBTN3BTd2JPRjdnVWxOa284VXB0?=
 =?utf-8?B?UGg3d1lURThNc0JKS09pSGp2eGtldEZ2WVBTZGVFTnJLTmNTeEtxU25pKzFn?=
 =?utf-8?B?R3ZoMVBURmFMcHhDZjhCVkRLK3c3aVVzdUZFd0hKeTJzMFFXRjk0bzRQZHpY?=
 =?utf-8?B?TTNHM2Z6V1lubytucHFsSVN2ZXh1SExoczY1aDc2YUtTWm5aL3Zlc3loRi9n?=
 =?utf-8?B?L3lQcExlZ0d1akFjWFhucm1KKzd1Uk4wWnIvVHF5ZmNmeFFlR1p0bHVoeXFp?=
 =?utf-8?B?YzlLcVh1T1FSaldsZTY3MktFOWhwVUtHVi80dW0yZnRqZVhPVWZMSEwxZVlr?=
 =?utf-8?B?VFdxWUxsN2R6Q2NFUFpPaU5OeEdrbDFzM0tYNWJGditQTng0aWFYMjR2THhB?=
 =?utf-8?B?MEw1ZkJMblBuTC9vWjl0OUpwWmdodkIvcU5ycS9iaWR0dE03Z3p1bnMyS0J0?=
 =?utf-8?B?NjB2aUJpMnVJQUxmTnZUa3pGeXlwOFl4ekJlZkViT2VuenpaMnhIL2RyMzBq?=
 =?utf-8?B?ai9pb2ZHOWw2WUd2TlVObDFBQWtFU0VKK0Y5VTU5ZWsrR1EvS2V3c0pUUFZq?=
 =?utf-8?B?YmJOS0JrbkpqZExtdnZrL2ltUUZjMWhpODFSKzVjWW40bkJESkxpS3JhTFM4?=
 =?utf-8?B?OFE9PQ==?=
Content-ID: <AB1A51723C922D40BCAF951876D71803@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9abfa1ea-c0ea-49f7-52f0-08da848a0423
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 22:02:33.5967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mMT9PuRtOhpXbLn6CyMwI1/j28veHSo7GiXH86ClBh0OrUfU32oODt9k5dHXSQtjYzK6VXFJBj4cALBXH8EPtAtFUXM0FXJDEmRQA8+uHIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5744
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_150246_943088_9A617A22 
X-CRM114-Status: GOOD (  25.63  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTMvMDgvMjAyMiAwMDowNywgUGFsbWVyIERhYmJlbHQgd3JvdGU6DQo+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gRnJpLCAxMiBBdWcgMjAyMiAxMDo0Mzow
MiBQRFQgKC0wNzAwKSwgYXRpc2hwQGF0aXNocGF0cmEub3JnIHdyb3RlOg0KPj4gT24gRnJpLCBB
dWcgMTIsIDIwMjIgYXQgOTowNiBBTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNv
bT4gd3JvdGU6DQo+Pj4NCj4+PiBUaGlzIGZpeGVzIHR3byBpc3N1ZXM6IEkgdHJ1bmNhdGVkIHRo
ZSB3YXJuaW5nJ3MgaGFydCBJRCB3aGVuIHBvcnRpbmcgdG8NCj4+PiB0aGUgNjQtYml0IGhhcnQg
SUQgY29kZSwgYW5kIHRoZSBvcmlnaW5hbCBjb2RlJ3Mgd2FybmluZyBoYW5kbGluZyBjb3VsZA0K
Pj4+IGZpcmUgb24gYW4gdW5pbml0aWFsaXplZCBoYXJ0IElELg0KPj4+DQo+Pj4gVGhlIGJpZ2dl
c3QgY2hhbmdlIGhlcmUgaXMgdGhhdCByaXNjdl9jYm9tX2Jsb2NrX3NpemUgaXMgbm8gbG9uZ2Vy
DQo+Pj4gaW5pdGlhbGl6ZWQsIGFzIElNTyB0aGUgZGVmYXVsdCBpc24ndCBzYW5lOiB0aGVyZSdz
IG5vdGhpbmcgaW4gdGhlIElTQQ0KPj4+IHRoYXQgbWFuZGF0ZXMgYW55IHNwZWNpZmljIGNhY2hl
IGJsb2NrIHNpemUsIHNvIGZhbGxpbmcgYmFjayB0byBvbmUgd2lsbA0KPj4+IGp1c3Qgc2lsZW50
bHkgcHJvZHVjZSB0aGUgd3JvbmcgYW5zd2VyIG9uIHNvbWUgc3lzdGVtcy7CoCBUaGlzIGFsc28N
Cj4+PiBjaGFuZ2VzIHRoZSBwcm9iaW5nIG9yZGVyIHNvIHRoZSBjYWNoZSBibG9jayBzaXplIGlz
IGtub3duIGJlZm9yZQ0KPj4+IGVuYWJsaW5nIFppY2JvbSBzdXBwb3J0Lg0KPj4+DQo+Pj4gRml4
ZXM6IDNhZWZiMmVlNWJkZCAoInJpc2N2OiBpbXBsZW1lbnQgWmljYm9tLWJhc2VkIENNTyBpbnN0
cnVjdGlvbnMgKyB0aGUgdC1oZWFkIHZhcmlhbnQiKQ0KPj4+IEZpeGVzOiAxNjMxYmExMjU5ZDYg
KCJyaXNjdjogQWRkIHN1cHBvcnQgZm9yIG5vbi1jb2hlcmVudCBkZXZpY2VzIHVzaW5nIHppY2Jv
bSBleHRlbnNpb24iKQ0KPj4+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGlu
dGVsLmNvbT4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9z
aW5jLmNvbT4NCj4+Pg0KPj4+IC0tLQ0KPj4+DQo+Pj4gQ2hhbmdlcyBzaW5jZSB2MSA8aHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwODEyMTQyNDAwLjcxODYtMS1wYWxtZXJAcml2b3Np
bmMuY29tLz46DQo+Pj4NCj4+PiAqIEV2ZXJ5dGhpbmcgYnV0IHRoZSB1bnNpZ25lZCBsb25nIGNi
b21faGFydGlkLg0KPj4+IC0tLQ0KPj4+IMKgYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuY8KgwqDC
oMKgwqDCoCB8wqAgMiArLQ0KPj4+IMKgYXJjaC9yaXNjdi9tbS9kbWEtbm9uY29oZXJlbnQuYyB8
IDIyICsrKysrKysrKysrKy0tLS0tLS0tLS0NCj4+PiDCoDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5z
ZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvc2V0dXAuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMNCj4+PiBpbmRl
eCA5NWVmNmUyYmY0NWMuLjJkZmM0NjNiODZiYiAxMDA2NDQNCj4+PiAtLS0gYS9hcmNoL3Jpc2N2
L2tlcm5lbC9zZXR1cC5jDQo+Pj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYw0KPj4+
IEBAIC0yOTYsOCArMjk2LDggQEAgdm9pZCBfX2luaXQgc2V0dXBfYXJjaChjaGFyICoqY21kbGlu
ZV9wKQ0KPj4+IMKgwqDCoMKgwqDCoMKgIHNldHVwX3NtcCgpOw0KPj4+IMKgI2VuZGlmDQo+Pj4N
Cj4+PiAtwqDCoMKgwqDCoMKgIHJpc2N2X2ZpbGxfaHdjYXAoKTsNCj4+PiDCoMKgwqDCoMKgwqDC
oCByaXNjdl9pbml0X2Nib21fYmxvY2tzaXplKCk7DQo+Pj4gK8KgwqDCoMKgwqDCoCByaXNjdl9m
aWxsX2h3Y2FwKCk7DQo+Pj4gwqDCoMKgwqDCoMKgwqAgYXBwbHlfYm9vdF9hbHRlcm5hdGl2ZXMo
KTsNCj4+PiDCoH0NCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2RtYS1ub25j
b2hlcmVudC5jIGIvYXJjaC9yaXNjdi9tbS9kbWEtbm9uY29oZXJlbnQuYw0KPj4+IGluZGV4IGNk
MjIyNTMwNGM4Mi4uM2FhMzU3MjcxNWQ2IDEwMDY0NA0KPj4+IC0tLSBhL2FyY2gvcmlzY3YvbW0v
ZG1hLW5vbmNvaGVyZW50LmMNCj4+PiArKysgYi9hcmNoL3Jpc2N2L21tL2RtYS1ub25jb2hlcmVu
dC5jDQo+Pj4gQEAgLTEyLDcgKzEyLDcgQEANCj4+PiDCoCNpbmNsdWRlIDxsaW51eC9vZl9kZXZp
Y2UuaD4NCj4+PiDCoCNpbmNsdWRlIDxhc20vY2FjaGVmbHVzaC5oPg0KPj4+DQo+Pj4gLXN0YXRp
YyB1bnNpZ25lZCBpbnQgcmlzY3ZfY2JvbV9ibG9ja19zaXplID0gTDFfQ0FDSEVfQllURVM7DQo+
Pj4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgcmlzY3ZfY2JvbV9ibG9ja19zaXplOw0KPj4NCj4+IFdo
YXQgaXMgdGhlIGV4cGVjdGVkIGJlaGF2aW9yIGlmIHRoZSBibG9jayBzaXplIGlzIHplcm8gaW4g
Q01PDQo+PiBvcGVyYXRpb25zID8gQXMgcGVyIG15IHVuZGVyc3RhbmRpbmcsIGl0IHdpbGwgYmUg
ZXF1aXZhbGVudCB0byBhIG5vcC4NCj4+IExldCBtZSBrbm93IGlmIEkgYW0gd3JvbmcuDQo+Pg0K
Pj4gSWYgdGhhdCBpcyB0aGUgY2FzZSwgdGhpcyBpcyBtaXNsZWFkaW5nIGFzIHdlbGwuIE1heWJl
IHdlIHNob3VsZCBqdXN0DQo+PiBkaXNhYmxlIENNTyBleHRlbnNpb24gYWx0b2dldGhlciBpZiBp
dCBjYW4ndCBmaW5kIHRoZSBEVCBwcm9wZXJ0eS4NCj4gDQo+IFRoYXQgc2VlbXMgcmVhc29uYWJs
ZSB0byBtZSwgZXZlbiBpZiBoYXZpbmcgYSAwIGJsb2NrIHNpemUgaXMgYWxsb3dlZCBieQ0KPiB0
aGUgc3BlYyBpdCBzZWVtcyB3YXkgbW9yZSBsaWtlbHkgdG8gaGF2ZSBiZWVuIGEgbWlzdGFrZS7C
oCBJJ2xsIHNlbmQgYQ0KPiB2MywgYWZ0ZXIgcHV0dHRpbmcgdG9nZXRoZXIgYSB0b29sY2hhaW4g
dGhhdCBhY3R1YWxseSBidWlsZHMgdGhpcw0KPiAoYXNzdW1pbmcgdGhhdCdzIHdoeSBJJ20gbm90
IGdldHRpbmcgdGhlIGZhaWx1cmVzL3dhcm5pbmdzKS4NCg0KV2hhdCdzIHRoZSBwbGFuIGhlcmUg
d2l0aCB2Mz8NCg0KSSBmb2xkZWQgdGhlIGZvbGxvd2luZyBpbnRvIHRoaXMgdmVyc2lvbiBsb2Nh
bGx5IHRvIGNsZWFyIGJvdGggdGhlIG9yaWdpbmFsDQp3YXJuaW5nICYgdGhlIGJ1aWxkIGVycm9y
IHdpdGggdGhpcyBwYXRjaCBvbiBjbGFuZy0xNToNCg0KZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
bW0vZG1hLW5vbmNvaGVyZW50LmMgYi9hcmNoL3Jpc2N2L21tL2RtYS1ub25jb2hlcmVudC5jDQpp
bmRleCAzYWEzNTcyNzE1ZDYuLjhhNDllYTViYTAxZCAxMDA2NDQNCi0tLSBhL2FyY2gvcmlzY3Yv
bW0vZG1hLW5vbmNvaGVyZW50LmMNCisrKyBiL2FyY2gvcmlzY3YvbW0vZG1hLW5vbmNvaGVyZW50
LmMNCkBAIC03OSwxMiArNzksMTMgQEAgdm9pZCBhcmNoX3NldHVwX2RtYV9vcHMoc3RydWN0IGRl
dmljZSAqZGV2LCB1NjQgZG1hX2Jhc2UsIHU2NCBzaXplLA0KIHZvaWQgcmlzY3ZfaW5pdF9jYm9t
X2Jsb2Nrc2l6ZSh2b2lkKQ0KIHsNCiAJc3RydWN0IGRldmljZV9ub2RlICpub2RlOw0KLQlpbnQg
cmV0Ow0KKwl1bnNpZ25lZCBsb25nIGNib21faGFydGlkOw0KIAl1MzIgdmFsLCBwcm9iZWRfYmxv
Y2tfc2l6ZTsNCisJaW50IHJldDsNCiANCiAJcHJvYmVkX2Jsb2NrX3NpemUgPSAwOw0KIAlmb3Jf
ZWFjaF9vZl9jcHVfbm9kZShub2RlKSB7DQotCQl1bnNpZ25lZCBsb25nIGhhcnRpZCwgY2JvbV9o
YXJ0aWQ7DQorCQl1bnNpZ25lZCBsb25nIGhhcnRpZDsNCiANCiAJCXJldCA9IHJpc2N2X29mX3By
b2Nlc3Nvcl9oYXJ0aWQobm9kZSwgJmhhcnRpZCk7DQogCQlpZiAocmV0KQ0KQEAgLTEwMCw3ICsx
MDEsNyBAQCB2b2lkIHJpc2N2X2luaXRfY2JvbV9ibG9ja3NpemUodm9pZCkNCiAJCQljYm9tX2hh
cnRpZCA9IGhhcnRpZDsNCiAJCX0gZWxzZSB7DQogCQkJaWYgKHByb2JlZF9ibG9ja19zaXplICE9
IHZhbCkNCi0JCQkJcHJfd2FybigiY2JvbS1ibG9jay1zaXplIG1pc21hdGNoZWQgYmV0d2VlbiBo
YXJ0cyAlZCBhbmQgJWx1XG4iLA0KKwkJCQlwcl93YXJuKCJjYm9tLWJsb2NrLXNpemUgbWlzbWF0
Y2hlZCBiZXR3ZWVuIGhhcnRzICVsdSBhbmQgJWx1XG4iLA0KIAkJCQkJY2JvbV9oYXJ0aWQsIGhh
cnRpZCk7DQogCQl9DQogCX0NCkBAIC0xMTIsNyArMTEzLDcgQEAgdm9pZCByaXNjdl9pbml0X2Ni
b21fYmxvY2tzaXplKHZvaWQpDQogDQogdm9pZCByaXNjdl9ub25jb2hlcmVudF9zdXBwb3J0ZWQo
dm9pZCkNCiB7DQotCVdBUk5fT04oIXJpc2N2X2Nib21fYmxvY2tfc2l6ZSwNCi0JICAgICAgICAi
Tm9uLWNvaGVyZW50IERNQSBzdXBwb3J0IGVuYWJsZWQgd2l0aG91dCBhIGJsb2NrIHNpemVcbiIp
Ow0KKwlXQVJOKCFyaXNjdl9jYm9tX2Jsb2NrX3NpemUsDQorCSAgICAgIk5vbi1jb2hlcmVudCBE
TUEgc3VwcG9ydCBlbmFibGVkIHdpdGhvdXQgYSBibG9jayBzaXplXG4iKTsNCiAJbm9uY29oZXJl
bnRfc3VwcG9ydGVkID0gdHJ1ZTsNCiB9DQoNCg0KDQo+IA0KPj4NCj4+PiDCoHN0YXRpYyBib29s
IG5vbmNvaGVyZW50X3N1cHBvcnRlZDsNCj4+Pg0KPj4+IMKgdm9pZCBhcmNoX3N5bmNfZG1hX2Zv
cl9kZXZpY2UocGh5c19hZGRyX3QgcGFkZHIsIHNpemVfdCBzaXplLA0KPj4+IEBAIC04MCwzNyAr
ODAsMzkgQEAgdm9pZCByaXNjdl9pbml0X2Nib21fYmxvY2tzaXplKHZvaWQpDQo+Pj4gwqB7DQo+
Pj4gwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRldmljZV9ub2RlICpub2RlOw0KPj4+IMKgwqDCoMKg
wqDCoMKgIGludCByZXQ7DQo+Pj4gLcKgwqDCoMKgwqDCoCB1MzIgdmFsOw0KPj4+ICvCoMKgwqDC
oMKgwqAgdTMyIHZhbCwgcHJvYmVkX2Jsb2NrX3NpemU7DQo+Pj4NCj4+PiArwqDCoMKgwqDCoMKg
IHByb2JlZF9ibG9ja19zaXplID0gMDsNCj4+PiDCoMKgwqDCoMKgwqDCoCBmb3JfZWFjaF9vZl9j
cHVfbm9kZShub2RlKSB7DQo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWdu
ZWQgbG9uZyBoYXJ0aWQ7DQo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50IGNi
b21faGFydGlkOw0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxv
bmcgaGFydGlkLCBjYm9tX2hhcnRpZDsNCj4+Pg0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXQgPSByaXNjdl9vZl9wcm9jZXNzb3JfaGFydGlkKG5vZGUsICZoYXJ0aWQpOw0K
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQ0KPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7DQo+Pj4NCj4+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoaGFydGlkIDwgMCkNCj4+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7DQo+Pj4g
LQ0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBzZXQgYmxvY2stc2l6ZSBm
b3IgY2JvbSBleHRlbnNpb24gaWYgYXZhaWxhYmxlICovDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJyaXNjdixjYm9t
LWJsb2NrLXNpemUiLCAmdmFsKTsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aWYgKHJldCkNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGNvbnRpbnVlOw0KPj4+DQo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYg
KCFyaXNjdl9jYm9tX2Jsb2NrX3NpemUpIHsNCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmlzY3ZfY2JvbV9ibG9ja19zaXplID0gdmFsOw0KPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghcHJvYmVkX2Jsb2NrX3NpemUpIHsNCj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJvYmVkX2Js
b2NrX3NpemUgPSB2YWw7DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBjYm9tX2hhcnRpZCA9IGhhcnRpZDsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfSBlbHNlIHsNCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKHJpc2N2X2Nib21fYmxvY2tfc2l6ZSAhPSB2YWwpDQo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChwcm9iZWRfYmxv
Y2tfc2l6ZSAhPSB2YWwpDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJfd2FybigiY2JvbS1ibG9jay1zaXplIG1pc21h
dGNoZWQgYmV0d2VlbiBoYXJ0cyAlZCBhbmQgJWx1XG4iLA0KPj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjYm9tX2hhcnRpZCwgaGFydGlkKTsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfQ0KPj4+IMKgwqDCoMKgwqDCoMKgIH0NCj4+PiArDQo+Pj4gK8KgwqDCoMKgwqDCoCBp
ZiAocHJvYmVkX2Jsb2NrX3NpemUpDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmlzY3ZfY2JvbV9ibG9ja19zaXplID0gcHJvYmVkX2Jsb2NrX3NpemU7DQo+Pj4gwqB9DQo+Pj4g
wqAjZW5kaWYNCj4+Pg0KPj4+IMKgdm9pZCByaXNjdl9ub25jb2hlcmVudF9zdXBwb3J0ZWQodm9p
ZCkNCj4+PiDCoHsNCj4+PiArwqDCoMKgwqDCoMKgIFdBUk5fT04oIXJpc2N2X2Nib21fYmxvY2tf
c2l6ZSwNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiTm9uLWNvaGVyZW50IERN
QSBzdXBwb3J0IGVuYWJsZWQgd2l0aG91dCBhIGJsb2NrIHNpemVcbiIpOw0KPj4+IMKgwqDCoMKg
wqDCoMKgIG5vbmNvaGVyZW50X3N1cHBvcnRlZCA9IHRydWU7DQo+Pj4gwqB9DQo+Pj4gLS0gDQo+
Pj4gMi4zNC4xDQo+Pj4NCj4+Pg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
