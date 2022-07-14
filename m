Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B953C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 06:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7IG4M4FmOLNvBK0+VcOjclCb7b2frtRhMmqm74ERC7I=; b=JysvCSJpwm4YWs
	aI5q9iFYm6oSZlqd1TbFlzzXfmFdUUERpgHDbkGxvn5D4MXMA1dGHgtO+4yDm2OD4QyMH6Dsh9N7D
	2r39uCs8ECqzUhC+HMRMQ52T6KeSfCYIPN5PExHl5AsJN3s8KlcUnkTJa/4GussnElZPn5fX/vznh
	QQEmQCunvZugpGRRBjKoLOojhD81cdrNog/FjbmKuujsDLLJ024YdQqU+qko8b9UocpUyFH/FFOOt
	Vv96ziBxd8Vf8qPq4sgaT545SVRS6lo1OvMBUmZ4xs9wnVH/8eAok3yL4VAqsWndjHHJEiIrGePyb
	mgLBfYz/GUVurcC0kMjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBsQs-00BT64-15; Thu, 14 Jul 2022 06:34:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBsQp-00BT4e-CE
	for linux-riscv@lists.infradead.org; Thu, 14 Jul 2022 06:34:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657780479; x=1689316479;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=XbQbTc7Txwff46A5DolQiYuqvS0VVTr7juLVcsex1gM=;
  b=JP74bf1W3D5QFHArOW3O9X2KNkVfCo40WJsmwfQ3au3l8dpPKCqwzSYq
   rK9LujCFYKjAzwQE1nlbzzaY7rngL5muBWfKqJ2jL0bXOEEUMHDm3/3Aq
   hzwJ45Odcfr62ORbZwTPxbi416W2tJFHTdlKbMYJh9SRYauayTw7xFe0+
   cuYozs+2azZGNt6ZKrDP8glUQxclGDXjtoavPFoQod/VLcJjQSX4LeOlD
   cCxojQIxI2tvzpW3gfYVhW8GOw9BllHpssn5XcfZwXOqzQFMqNfkFXDvE
   5cO6toAXHtJqG/d5yofoL3MAmE3mD4Xzmb40cOmrSOb+mGeQg3WwhvaOk
   g==;
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; 
   d="scan'208";a="182099931"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jul 2022 23:34:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 13 Jul 2022 23:34:38 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 13 Jul 2022 23:34:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKjsD3WBl8zN9WccJ5bq1wnAFhpdap4TobDqFpttsK1tic726ajXF4nBHv9s/s1zBzf5uyG4kw8JCUYl3GZih4l69soRpjsDC9JlTkAnhPvpHreACAo+VAIfsI0+NQLkyBZqwtYnpDWI38PcipMernflKee0ENzQoXjGqih0Y1d0AyUnLfHpMlVPlGYDCxOxXoj5rH4Uqt8+0fN67ExYM2NVTbmqgX+3CWtrOhxGF6YgAISG0lq0E/uVbyeFZRpDu07Hw/1ka0Yz1brRXB6jshOWF+BGQ1fxjqq9KmY75rC/ym+u+2lqrVrkRUVQinrLfJWitIqdz0G2skP4xAZdsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbQbTc7Txwff46A5DolQiYuqvS0VVTr7juLVcsex1gM=;
 b=Q4taKwg2NeT+oAvU9/jRfodJ6HI5WwvF6MizlDosyGhlDq1B9MrcBbiWmdi9XRLRE4JXOL4EO4UjyEYL53A6ij0Mq9dmTgD8Cff2OO3gscU+JJKG+UngG8UDES/4DvU3EXyAUnh5Fiiu+Ykz8saVxOUkEHZa87rmsN3VBxJfvK7AY6QOCuhiYTIXsZ+k8fyz3E2x3ojUZlcL5BqNJKRnleht+hvXgaxAqwZVChdLYre47cwfS6sqpv80OlWKiZQrDmU/JRiF19A7l2L6uoCyyDGM8U7G8xDhxXL4ZRRN+4B5y7RO8xhtXGtYAtgquy9O00WomBIxZVMSMfWZxgvtRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbQbTc7Txwff46A5DolQiYuqvS0VVTr7juLVcsex1gM=;
 b=nn5d2bqv9MqfrjxGCiMIbkOVEA3pjTHDX9kIcyyPVnFjFjQ6mBzm83zRqrtPzsNpy8veWcg/e/7Rxzjr0nZlw2Wk0nfyZxzqJbb3JMTRAKnmFZOFHwaKfkQDvtaX2Kt0EVztIw+zm3eFm+WZWs8TEkolpnJ13TVsjJTZe52yAqE=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY4PR11MB1765.namprd11.prod.outlook.com (2603:10b6:903:126::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Thu, 14 Jul
 2022 06:34:36 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 06:34:36 +0000
From: <Conor.Dooley@microchip.com>
To: <ben.dooks@sifive.com>, <linux-riscv@lists.infradead.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<sudip.mukherjee@sifive.com>, <jude.onyenegecha@sifive.com>
Subject: Re: [PATCH] riscv/vdso: fix missing vdso_data declaration
Thread-Topic: [PATCH] riscv/vdso: fix missing vdso_data declaration
Thread-Index: AQHYlwUDWewAM0BLJUeq97TdYernnq19aZYA
Date: Thu, 14 Jul 2022 06:34:36 +0000
Message-ID: <654185dd-db41-cc31-ee94-db56d5dfef81@microchip.com>
References: <20220713220645.105138-1-ben.dooks@sifive.com>
In-Reply-To: <20220713220645.105138-1-ben.dooks@sifive.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c77cf84-6a0c-4c8d-59f2-08da6562ebd4
x-ms-traffictypediagnostic: CY4PR11MB1765:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MthhmkhbSX8HFm42r0kCx4/zAbGdmx5l/oG3d7ZFNqMNGw9u1gn+THbSRH0e3VZtoG+dwAjC0cSfzhuskEoXZPAW0s2+6tcC2f8UqF3Zga9lrQdpvRuvURHoqTFtwi3qslN1CXjeyVPhCCHh/dOzIiGniw3vauaPlJtj9UL/mvtn7YNjpwDmt8I9czwt6etl0VunkEBH3XqUcOgYwSL7XEVbxj+ihdv/1dFekUFI3PDvNnmXaEJ0t/j1hmkqPcus/EbV65bksK8QjJQNLqy3qgBVeehMEmeTaNEHsOFFL9R5m59zWLsxyIeJ8d1pb6CSHVYogvd9eLCtxfYfTeeHDz1qQUYCcGWM4ZYaq3JrRQ0Pyjpbs195vgTGgYRYH37otIuHRG0SVfopKUNd0NCUeN7wy2wBvsMwZ1CMPKl9X6NgCURJjrsYjGMIvXz2ETWtvT9m4kZDHHtFzLSJ3RPiKykxcqR36Q8vZHWELcBRdhkLIBYCTTK/ODdAKH6oSZ4l97hrtLfNIFpsmq6L3oFXBiym/rn+GLiAyxePNLpopha7E6znFAamSuE80oHDYv82nx/1qLoyUJrHvaHWlVvd2IXUKWNEZlEigl8aOUxGEyg2GcNXrxewusS34rGRYKy3FY82Ay/73vtfRkaf1w1mQuB4yqPJZPWyrj2VpCH7LrB35dFYj2FOnkZIpK/x2yeMMcyZwaTvkdPvMEzdU3wURg/pNZeTP2QUqrFeAQbt40cBJb0cpZr4tuj7c62wVL3/3bJwZpCOHphkXvdfNGbBXRyIBfhG00AoaM9ZDCx49+YgOR3qeTdQtlbMr0Q2jXAJwjGZ5z2P53uXzrL7jdr/EAOB437V9XcjeAxLOeDtn/jRzDr/9G1p0g5x+J2kNrzO3V65d6jebdNyeqmd7ykTow==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(376002)(39860400002)(136003)(346002)(8936002)(64756008)(66476007)(316002)(66556008)(5660300002)(110136005)(86362001)(8676002)(2616005)(66446008)(38100700002)(76116006)(31696002)(91956017)(6506007)(6512007)(53546011)(54906003)(66946007)(71200400001)(26005)(4326008)(36756003)(2906002)(83380400001)(41300700001)(38070700005)(966005)(122000001)(186003)(6486002)(478600001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VnEzRWpqR3J3bVk3UDU3ZDFoYUZ3ZGI3NDRjNzhrazZ3NExwQXVGNStmOGp6?=
 =?utf-8?B?SU1oV2wxOHZuanljVkpZTXJVelpmRGtWRUZ0UE1RY3VWWXl2SVhtaVN3SURK?=
 =?utf-8?B?YWVTM2pyd0swV2JaUjBSd1pWQWQ2eXV6cWNlWDVuQWQ1bDJ4Y3VBdTBYVFFF?=
 =?utf-8?B?bTA5ekxMRW9LTmtKQW5mUUlQaUdYME55VmtpSVlHWGwrWjRkbUQ5dmZwL0Js?=
 =?utf-8?B?MVRZUXZLNmxiTHo1bjFudTRybGcwMDlVUkFGdUhVekIyVUhNZ3VES0xlZU1D?=
 =?utf-8?B?WUJZREVJVm02bnF1SFVscWVUcDJJaDNqbk1JVEJacTlVV3pId0dITkd0MVF4?=
 =?utf-8?B?TWhud2lVa1ZLRDE5NmdGbFJ6ZiswbWtFeFZYaTVlN2w4OHU2R2dXVjJNcGt5?=
 =?utf-8?B?LzZ6cnQ3a3BlYUdtZk53NmE4N09pRnNWZkFJcjIyTU51S1hrdWM3dE5aYjFi?=
 =?utf-8?B?VVlHeis4ZExPdWdlZFRWaXBRczdBaWpoR2lrekl5ajlVZ3pJSlppSzNJQ1gr?=
 =?utf-8?B?ZG91MHFJalNYUlNjbElMUkI4TEIvR2tXczBWU0dsbnp5cFgyZkx4SDFlS2Iz?=
 =?utf-8?B?SjV4LzY1TndoT0JnK0pJSjM2d3c3alF0NDlWWEdQTXVJb3FDdzg2L0YxTEcw?=
 =?utf-8?B?eXRoektyNnErYkdNSGhCZTVIN2J0SnZFR2RMYUlWQzdjT2VaRlpJR2hob3ZY?=
 =?utf-8?B?R2tEZytiTTNsUTUzRTVhVWdickkvVXh0TEJRaXZSSWF4UkxISWo1SndFSlNu?=
 =?utf-8?B?SWVzLzJ3bVY2TnFBY0hEdnJRZ1VseGFrYlM3Y095V2xVbzdML0l5Mnk5aHVG?=
 =?utf-8?B?MVdWVjlLbUJ0eWpwaGxHbnFZaHJJdU5HcnFWUXlBTXVVNVE1Z3hKU1ovR2tO?=
 =?utf-8?B?RTB0WksrSXNROEYzSDg3N2hpZzgveDRxSXF4T2xGSFZmL0hwYW9vK25xNkF4?=
 =?utf-8?B?eFUxakhTVWNJb3h1OVZVVEJqVEc3UTgzcFIrTXVaVDh3WlhLZHVJQVdUZ0Fm?=
 =?utf-8?B?R1JLUHNyclVvOThGTWdWb3lSUkljWXMvMkRINjNwYXcwR3drZENOU2h3ZFY4?=
 =?utf-8?B?UGREQjVjRG5FZ3kzTEc1TUNFY3JnT3ZNL1ZTak05dWZBQ2d0NnhOSGtTVmZI?=
 =?utf-8?B?eFZ4WWRPa05wQ2ZPOXhva25JckNoSEhrcU1sMWd3dk9ZdFZKS1h1SDlzN040?=
 =?utf-8?B?NFJJWENrMHdvWFdQd0JDbHJhZllsM2dpTThqMURhbm1mNFVlTG9neGxOb2Ev?=
 =?utf-8?B?dTY3MnBSUHBKeHZwVUFpUnZsN1l5cEJrMGJNVVFFbU0yWEpUM3FYUW5BOXdq?=
 =?utf-8?B?cUdSS1ZKelhPR29Oem1TbXVqeGhpajgyMkovcDRvRk10a3E3Z285MmdwM2J3?=
 =?utf-8?B?OWJlQ0ZpN3YzRTYvWHpxMncxMEwrOUQ2eEhYVWdPSEQ1MkFkTXlBQ24zd2xH?=
 =?utf-8?B?cDUyc0psVmtKVVhHSStGVmpnT3RiSjJHUUpUTS8yUjRuTHdhUlozRVhDdjh1?=
 =?utf-8?B?cU9Md0wwbkc0R2I5VnhtYzBZcHBseTllV2dDZ1d3OWVsMDkxTFFUVlVjQm9Q?=
 =?utf-8?B?TlpjTE5lMjdOOGZJU3B1OVVzcHhRRlZhQ2tpa09UT0ZsNnRvRGJLTVBuZm1s?=
 =?utf-8?B?Ujcwd0YvZFhJQ2FCd1pDOEpvN0lua3ZHTXQ0YjgwS0p4ZkVDS3BoK2FVRFVq?=
 =?utf-8?B?UTZaTUhUYzNDbTJ1K1AvOVJPZGVqeEpWd29IRGw5U1ZzZGpINkFnaldqejhv?=
 =?utf-8?B?eklCdlMyVkhma1Q1UitWaC83OHpna05kdEdvcUMvOTRHeXNaWlA3bi81bWNJ?=
 =?utf-8?B?a3VFb083TkJOclJDWUo0Y2NPQ3FZbXdpS0dxQ3lrUzFXR1RucGNkQml1ajJz?=
 =?utf-8?B?N3BlNDdlMVVqdzVnakZrbFhWa2thMUlBNG9sYm1xYnhkY1ZFQ1ZYMHF0ZXcx?=
 =?utf-8?B?emlNckJQeFlmQksxV2hCcDh5UUsrV1RiZ2xicG8yMVhHU0Z2TmJWa0pKL2lU?=
 =?utf-8?B?Z0J4d2VUdnJUV29IZWkwMEkydTV6ZHVoeHBQRFQ3VmpHb0RaN0dTczBsUms4?=
 =?utf-8?B?NDc1U3JBbDZTOTlyb05JWENlQzkzZFJVTytXSEEzeDlHMjRQWkg1ZzhIOXR4?=
 =?utf-8?Q?E3xwTTQw0y8v3C7QqC12bZ9Mw?=
Content-ID: <DA2D1BEDA1512240A390EC9C91A250A2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c77cf84-6a0c-4c8d-59f2-08da6562ebd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 06:34:36.3795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hkxfnwRpPQe6vlABsk9c4HjDi5zIrME5hRvB3EHL2choCPO5OQrjQ6geZTUdM1vNkRsyUADuGxMN2yz44+/Kvj4gnYbFTczpgTfPcHGwTbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1765
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_233439_457133_8445755B 
X-CRM114-Status: GOOD (  17.70  )
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

On 13/07/2022 23:06, Ben Dooks wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The vdso_data is defined by has no declaration as the
> arch/riscv/kernel/vdso.c does not include asm/vdso/vsyscall.h
> for the definition. Fix the following sparse warning by
> adding in the asm/vdso/vsyscall.h
> 
> arch/riscv/kernel/vdso.c:42:18: warning: symbol 'vdso_data' was not declared. Should it be static?
> 
> Signed-off-by: Ben Dooks <ben.dooks@sifive.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>   arch/riscv/kernel/vdso.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
> index 69b05b6c181b..7564f0208957 100644
> --- a/arch/riscv/kernel/vdso.c
> +++ b/arch/riscv/kernel/vdso.c
> @@ -13,6 +13,7 @@
>   #include <linux/err.h>
>   #include <asm/page.h>
>   #include <asm/vdso.h>
> +#include <asm/vdso/vsyscall.h>
>   #include <linux/time_namespace.h>
> 
>   #ifdef CONFIG_GENERIC_TIME_VSYSCALL
> --
> 2.35.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
