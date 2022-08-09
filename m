Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0157C19F2D
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Aug 2022 17:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SByvrfxxcUtY+ANFZ+P3epdv+wNu410bMKiEiFO6XO8=; b=nAT+VQKgFn5x4S
	Q7d6W2yhjPiwWOalgxOeSUJFYRBsbnJeS1IAJRD7y/7A3cuTmCPNy2Blr82c9QzyISGSAQSbtC1aG
	qQ2EjbzeF0rQyqRTvSnHQiUVZebNEWODUiXYLo2TIHfIwCX8ZBvMQ+sRCPBSrjHjhX+vxmD7GhDtO
	xPKc2RmiCJff1dM5txvmtioiyWdD0Cjl+Fe4q6PjdOaL7FGFOOapGjCV23w8nv8OEvdhUZYOqH78z
	4CTo0GWA0fUC4rJEkAMiwQoUNreib9JZdYJywvBqoGcRV0t3TK80bP4u59U9tn3hD9svpPd86+/0m
	tCxVjC5ePOwVvGkyAHsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLSzM-005GEx-4m; Tue, 09 Aug 2022 17:25:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLSzJ-005GCQ-02
	for linux-riscv@lists.infradead.org; Tue, 09 Aug 2022 17:25:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660065953; x=1691601953;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zF8V6wf5V6U8R+OwwTOnNdxfGqJ0/ZGWv+yHQWPgA9Q=;
  b=bxCfGv4iDDCLr4jalCW4lPXDAseJpA8dzmqVJEuwKiUFk4ODJXiJccN6
   ZSJtiR5JDbNxd13Jqyel/5cDdnyNG/vlpnrXQmUM4QCFGrJ6o3Egj6TIG
   jaPq6BWjH/NYJ3vKs+BbxH5HMRL7V/eB5v3VgG+v9EPNp/PSpZQ4w1BGs
   RR6nIzPr50lMpUgPr0W6ATj9ipR2Lw/L861avCVgf2BBVRM9IbsQ///1e
   DG3MARZdqL5x18VtsP+9Aym+u+lKv005IESjNm4ed4gV1y3pi9x4omJK2
   rXLVtPZfWXR7NnOFaF1M3hTWRHeSP06HzwJpyPv9jv3HtKObxaKpQWpQE
   w==;
X-IronPort-AV: E=Sophos;i="5.93,225,1654585200"; 
   d="scan'208";a="168518621"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Aug 2022 10:25:44 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 9 Aug 2022 10:25:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 9 Aug 2022 10:25:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f87vayD8Hv+zXT5okwlAqKx60rTcJO3yINva0fPuKlQ8bf5pFDrLneMI7XItPB8sLL4xCNd+u0K1vKLNqFe7qkrPFN8dymvqawoiwd6it6FWGzkee4QJtyFX9tOysTYc5MakbQl/mhE39wZ1IOnXFoROzpDPlH2nZocltD82dEw8000V/RS1f9CZjTtHaju1t01gRtAaV+QCx0XnDanMeHVWy9vLFwd6RuvgoudoqND50z+XtSzgU396s0xH/YA/kYpQbeMh/WWVTsPnVR4vEtinYnmEcXP3IgVRGamZnhcPPTCTWYGBUy7XaVtJluzYAA8yzfrNhnlrCGXRCkfR8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zF8V6wf5V6U8R+OwwTOnNdxfGqJ0/ZGWv+yHQWPgA9Q=;
 b=oMT2ULmBmaUmVgNCDy0BmJ1uRD/eEquAW2DllIfK3pJ56+MTP8suS36N3IJT24VFEOvFQ9N+u1Z/BxYPtSCSJFfjDB4Dma6dtnb6pBGu9tSFmi8s4WnNEQKwlAm6ddmzoHhhhsNo/uuKkQGmw50L63XvvEMsH8bbIHzT9/AoI9xUvq5QoP5Gb47CUlygkQvowBjmtoY+Ue/zdVEtpmEtJ759SWL2KbACFp6t7faC1woJrTEYq7fa86pYYAFTLpgjRRSAUP5UEgwoXGOH4oxz6NNKJT+YpwBV4iY/SOEVBHjBHt1MtBAstt5dmqTHHZ00sGYVJC5ZV+Zz4c1MGc0fFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zF8V6wf5V6U8R+OwwTOnNdxfGqJ0/ZGWv+yHQWPgA9Q=;
 b=ktuGtWGpmFUQxp/pMv+5GlMKmtcYqrfzNc4PHnLD1nle0xGV8plZDxuSA9S4/P2yl+6oQoB27+Q+cXvunGzyAqZpv3c3KxrxIjknRqdA9i+Yx+P0+gnAIMqHfShxF7GbZ6PXQnambFIK7J0FSqrwKiYlI6C5dplgP0+3uZsfP5A=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN2PR11MB4288.namprd11.prod.outlook.com (2603:10b6:208:18c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 17:25:29 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 17:25:28 +0000
From: <Conor.Dooley@microchip.com>
To: <robh@kernel.org>
CC: <jrtc27@jrtc27.com>, <tglx@linutronix.de>, <maz@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<daniel.lezcano@linaro.org>, <anup@brainfault.org>, <guoren@kernel.org>,
	<sagar.kadam@sifive.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<qemu-riscv@nongnu.org>
Subject: Re: [PATCH 0/3] Fix dt-validate issues on qemu dtbdumps due to
 dt-bindings
Thread-Topic: [PATCH 0/3] Fix dt-validate issues on qemu dtbdumps due to
 dt-bindings
Thread-Index: AQHYqOiQvE59vmIAhkiZ1sZQKraNy62li3AAgAAHfICAAQ/4AIAANVQA
Date: Tue, 9 Aug 2022 17:25:28 +0000
Message-ID: <6b2cd222-49b3-d004-703d-46111d52d271@microchip.com>
References: <20220805162844.1554247-1-mail@conchuod.ie>
 <YvGBYKZyW0B2/wSr@Jessicas-MacBook-Pro>
 <94fe7e46-6156-1cc5-a4dc-1eee78e99bc4@microchip.com>
 <20220809141436.GA1706120-robh@kernel.org>
In-Reply-To: <20220809141436.GA1706120-robh@kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7dd6b43d-d3c0-434f-751a-08da7a2c27ae
x-ms-traffictypediagnostic: MN2PR11MB4288:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2QnBAVLX9YmzbS5IxlyFsH3U/7CrEDDbu+tjSeAp7DF+JPj35Q7zHtiAweADIsnnTwI0nutS56UfEQHh0FzEeRmri/teNJizP5yV97xztdFTJZvPhce0NCTR7TaE2E5y2T6dCsnUVnr5DfKiK7PMwEqHXpjBV2vPJr9X34jDksF3oHdsPnYbhTOlv2/sY5Mt0oZIA7u+cviZZg8ZapayAl1HgfEioCT0V8LRQCVi7aHKj1ltKq0HkA9D7VIxeE2soOwEL9Tl8GJQchjDRbLLTmFpa8Q7LtCNwWlKRMF3/0cgF5DSG375oJ1ymd93PjBpJ/5T5Pq3jglWIf91kN51d7OyM6Z1RF47islXXpxtc6BOqwMJKnbqOLj/HvlmCu1MV5a00z/TTnS16Bj3CLScFoFWIezB2sVPvUHzuzE0imxBx4LqkxMMZgl00Nd6eolAqBz4TvZxDmy2CoJUlQCpCXnsOt6PHu9I+Y7W8Ekt3xFZRfL9naMXkUfdk5wVMMmXeqpCYIs9x+BcZYDrLPiQlvWzMy4P24Ezkk9WSWoWJxOXcPbGJb2+qgkFsqrWjOmf/a8nQv1wAiKRcloLinuqwHY+CKeDFW8GspTSHQu8fr4WE0XFBO5qiZ1Xb9Kb6EaMGeMxiAJZovzxEgiZywSBy3Qwr5dUAm9pkYBV/eXQgGOxZDFnNyr9q5+wLEX2nxlMW04B8jB/4cBpoukGDBejDyHsAi1qwvaFFzXz9VT5hYFDFhPc8dWQclZ5aSdQX9hrrjpyI/wMhTfXBdGM/wI35kXIOA4+TiOdKK050VKQ0+VWqv3/XUa++UJwI8QxuM9fmyROGQi4VxlF9RR4nFY0EP0D067lz/amFcGEIStlJ8heMxzpWM0l1/18uiAr+I/W
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(376002)(346002)(396003)(366004)(5660300002)(7416002)(15650500001)(2906002)(76116006)(66946007)(36756003)(6916009)(71200400001)(478600001)(316002)(6486002)(54906003)(31686004)(8936002)(41300700001)(38070700005)(2616005)(38100700002)(31696002)(6506007)(53546011)(26005)(86362001)(122000001)(6512007)(4326008)(66446008)(64756008)(66476007)(66556008)(8676002)(91956017)(186003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wi84SFFDcnlVemtMbHFldHpPZ0w4OWlocXRlRmtVaGFoNkpxUmJrYVF3TlNw?=
 =?utf-8?B?aFdJMWFsZ090bG9KWmgyZjlnZEhwa0tTd2svRnhBTDVoMDhTeXg5aFdTUGw5?=
 =?utf-8?B?SEZiWHk0RTEraFpCRzI1RXhkV3hsUWRhaXlZYmoxd3RZa0FtSDN5RE5hQlhh?=
 =?utf-8?B?S1YrNnExbE5WdGxoMWN0U3JmMyt6ZTdZcGJCZlJULzUvdkoxMDhSUENrZnZx?=
 =?utf-8?B?MjI2L2MzMnBzcU9rN0hwQm1YTzE3M3JCSDBvNkNIUUtrcUdaam9GUm5iUDZX?=
 =?utf-8?B?Y1hYNTF2MTJGakhtVm9lL1V6Q1B1OG1ndjV3a1lmbUFLMEtxMWVUZnBlaTM5?=
 =?utf-8?B?TVMxTmZndTJRcU1SU2Z3cjJzaU9PdURGU3BSTlhlaDkxQVYrREtUTG5sQ0hC?=
 =?utf-8?B?a2hQeGZuWk5mRlZiY1FQdHJUdDRmM3A3b08rdFlIY0U1M1VIMkgrN0plajVy?=
 =?utf-8?B?SlhNNkpqZGRsS3pEbVZzQ29nVjQ3bWVlQkhodlU4WHZJWUUxOVorczc4NG8r?=
 =?utf-8?B?ZnZBMEt5OWJTcE5EeWhRME9JcFJYclZRbVBNZXBjdjZLVUFsdWlQTTdtVW1Y?=
 =?utf-8?B?b1BSYXRHTFdsYjdsc3FlbUJmUVBjMWMyeVRzZ0NoSjhWekwwNWJCV2U1Ylly?=
 =?utf-8?B?QmY2Q1ExUG9DdlZqTWYycHRDVTNSVnlRSUtPT3JVMFdlU2kyOFFRVzJibG84?=
 =?utf-8?B?NlVUNkxldTVlaXNPUWVENkNDMmd1NHU1U2lUL3R5QUtVRFU5Z3Vmd09YZjVN?=
 =?utf-8?B?WFRwd0pBYXJKS1pQTlFDeFJTaUlqY2pkZjVSOXFvZVl6a0ZKNENiaDc2cThk?=
 =?utf-8?B?b0R3RWpTUGlWSjlEUTd0TGhsN2tIeWhRVXo5ZE5LVkZuSzBzL3gwZ204TmZO?=
 =?utf-8?B?T2VGVlZWSWFxcTJSWWpZK05TMW1HMUd2K3BKektheFhaNUtiVkN3UDAxdXBJ?=
 =?utf-8?B?VE1vZHA1Y1p0Z3NIdXJtTjVraTRqbWoxU3p2Q1lrVktUcmtRdW1Vd1g5ak5z?=
 =?utf-8?B?S2FDWWpDTktlNTF0ZFlmTTF4TUo5SDJ0cGwrUk5HUlkzQnJYODlOTlgzeWV6?=
 =?utf-8?B?K2lzRmdjaUtMQmNoRUlwMTVmcDVScFozUkZRTDEzR3k5SXFOSXdUMGErV0hY?=
 =?utf-8?B?cW9PemN5R2ZMOUpsOWZqNlUvREtYL0o4T1I4WUl0ZEVvQ1VLem5SeVp3RDE2?=
 =?utf-8?B?UnQ1R2orTTRZWGRvVCt5SElEZEJFSlFwUk9HQUlVd3hhVk4xMTVxN2w0ZDhN?=
 =?utf-8?B?aElZbEtRRkJRbWdjdFhVdW5wcHhJMy9KQ0lyOVpBSWZHUUVQUG9UY1BncmFl?=
 =?utf-8?B?c2tPbWdEQms0TzE5WkRoN2ZZam5BWHFYSEVrUm9VbTZReWFKZFkxTDVqcUI1?=
 =?utf-8?B?bWpZVWJPeWpDU0srSU1NNzJFdElFbzRpM0xlY2tyK1QyZGwxTlE0UnArMTNL?=
 =?utf-8?B?bjd2cUt2bWJ5MmpRa1d2QWtRSDl2R0hWdHdVRUt1a3diUHJqZXU4NWV1MldU?=
 =?utf-8?B?RkZtYlZIV2JVTSttV28rdVNxa09XNldiaTBxeHFHb2tCcHpuTG5mVW0ra1hM?=
 =?utf-8?B?ZkRSejZDTmpPNmN1cU95K3NqMW4vbDFaSXJCVXpDUGRVLzU4ekdBcC84Mm0w?=
 =?utf-8?B?MnlDYUFqVjlrenpncno0VzcxWC9MUjZ6czdvNy95eFpDdWNIK3F0QzNpRktl?=
 =?utf-8?B?STZ5b0pFektaViszV2JzU2xzRG12YTBHVE11Tjd4SlFNdGVaVTBTTnZFVGRp?=
 =?utf-8?B?UVErVkZtUy9uSzNwdVdXUVIyTWZMeXY3ZGx0ZDVuQVBWYUpSNWR3MXJibmYx?=
 =?utf-8?B?TEt2U3JXRDQ1bjY2ak01Ym1UeC9ISXhqTlVvNlhFRWNzU3FaUmJnZ1ZnaUF0?=
 =?utf-8?B?WlRBaHoyMXR2dGI1ZGxCa1BMSkxCeEYwRWhFdHUydFpSeWxuSktvMlFOOXpL?=
 =?utf-8?B?RWExcHdxbGc5eUNRNnRzOGdwRnZxM1hmTGNMSThnZ1ZhbHE0TmZtcDB5NE8r?=
 =?utf-8?B?bWs5dzhFcVhkSENsUCtrSE1kZlZhc2wyZ1U2UWhaMlVHY1lwem5aSVdsL2dT?=
 =?utf-8?B?MmZuOXkrTjdFRnlEWGJsZmZNck5BUVRNTkhPMzhPYzM4UUpMZzcxUzJGVVBD?=
 =?utf-8?Q?uWE15GCheOPgXhQk4JUcThlke?=
Content-ID: <9515E47006944B48BE9FD914319CA6DC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd6b43d-d3c0-434f-751a-08da7a2c27ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 17:25:28.9084
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +n03obmeCaIudNtipmqnaDPVPHsd0Y6cOl/M0bbNiEEu8M+TxzcbeYLF20RG5CUCfObc9Ay74nLqHU+0fOX6ifUOqIXx+pEDpxStHzaXcFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4288
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_102553_128900_82515BE0 
X-CRM114-Status: GOOD (  21.25  )
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

On 09/08/2022 15:14, Rob Herring wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Mon, Aug 08, 2022 at 10:01:11PM +0000, Conor.Dooley@microchip.com wrote:
>> On 08/08/2022 22:34, Jessica Clarke wrote:
>>> On Fri, Aug 05, 2022 at 05:28:42PM +0100, Conor Dooley wrote:
>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>
>>>> The device trees produced automatically for the virt and spike machines
>>>> fail dt-validate on several grounds. Some of these need to be fixed in
>>>> the linux kernel's dt-bindings, but others are caused by bugs in QEMU.
>>>>
>>>> Patches been sent that fix the QEMU issues [0], but a couple of them
>>>> need to be fixed in the kernel's dt-bindings. The first patches add
>>>> compatibles for "riscv,{clint,plic}0" which are present in drivers and
>>>> the auto generated QEMU dtbs.
>>>
>>> IMO the correct thing is to have QEMU use a qemu,plicX rather than to
>>> weaken the requirement that a non-generic compatible be used. Otherwise
>>> you end up with QEMU using something that's marked as deprecated and
>>> either the warning remains and annoys people still or it becomes too
>>> weak and people ignore it when creating real hardware.
>>
>> It's already in a driver so I figure it should be in the bindings too.
>>
>> In arm's virt.c they use the generic gic compatible & I don't see any
>> evidence of other archs using "qemu,foo" bindings. I suppose there's
>> always the option of just removing the "riscv,plic0" from the riscv's
>> virt.c
> 
> I think we're pretty much stuck with what's in use already.
> 
> I'm on the fence whether to mark it deprecated though if there is no
> plan to 'fix' it. Doesn't really matter until the tools can selectively
> remove deprecated properties from validation.
> 

I guess I had considered "deprecated" to mean "don't use it in new
device trees" rather than "don't use it at all". I am not sure how it
could be "fixed" if it is potentially used by who-tf-knows-what.

I do think that adding the deprecated flag adds information in the
absence of tooling that responds to the property.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
