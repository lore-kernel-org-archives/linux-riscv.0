Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACC9C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jun 2022 07:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WCdWW3flik0uj2nS/rPdHublT2cKTHT6jfI/77Ho81E=; b=LwvR66bGB7hQ9f
	hgFdLBksYg5kJuIefuXLWsQf70j/kCiODTXOStKZnB7xbbpmQ2f3tJyYD33KO7+BHC1b0cHjHbKWA
	bKoMWGRrt0DcKR+HFZMqED2x0mag7IbBynPXGP5nFyjXz14XO0C4ef35ztAZOlYd8jLbzTEJxIRHQ
	1jitLnngU8d6ZEhHKyFDPzGBCQ4i4GqisB2VCbUSB/s3MQ73E1EPWK3W+L5UD5qm4bUdlqR1lFGdo
	saz53GP7rPNxnzHEhQYk5MtzAf4IJC7mm0IkvnHejI0PTvx3YO9tD95yzfBZikzc5n95tCFaQNxyJ
	dLuoBiMyFAhHHJUBUWfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o112n-007vwA-V2; Tue, 14 Jun 2022 07:32:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o112h-007vjT-Bs
	for linux-riscv@lists.infradead.org; Tue, 14 Jun 2022 07:32:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655191972; x=1686727972;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=TOtIzRiWPPZjuRv2kWjuiQ5s0/C/zak331RlOyFVykk=;
  b=ZxOI/v/RTj2gjGV/rOhIz9c5DLBvJtHqV6qi+9ov8WF5QvsKox74UbqV
   w66STjzCmYY8640l5UCQAdJAL8+AAS9JpckpMKLgjPpFI0KDDPSnJNmSd
   1Pty7NgWbwHQMndQJmWY6YJhQqXOEUi1Ge6xPL1D4bfG0i6HDbHu/1wkp
   +Nd1uFOUvH0e4rTvJvMkxmZfekUnFJSDTAxHJ4LDnU/iF/Tcwd/Pt+S7u
   pYPfT/SJbskchkb6mC5gZCfGPkWoyKY1dJ3Wi2y4SahVzTdK4ephGww1x
   NkvEPK/ino6SJqKxcaldP/VPr8lRaXzZuH0S1r62Siu5Tp+w/v9q5yQH1
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="168007707"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jun 2022 00:32:48 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 14 Jun 2022 00:32:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 14 Jun 2022 00:32:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tu/wTSOI9qBAL/S6OvlwvywAfCR08QNT2Wm+6HVuE+5pfWsn93+8IjGRz6bnXWMJzEsOHVSBdVig3xRY2Dc1FFKynfeDDGnF+dvCMO5ZsZYHtnPPnP9rd8TNjXVMzkoirAUnynOHfNV8Ap3g4IGe7JEvjgjgxHhI21DGkhcGXfM8EvIVcsvDnf73oYtRKH00bm0Z+me75o8CjFL6J3mX4vdj3MrY/5H5Wwu7lgtI5krBDs+lbyHBK2h9+EBvJPI9sXFCQ2vuGFVh8U/eG855N0jGNUrj6g/fLNEiPUAgZGySwMQ8JF0PwykGint+fL8jdMxwk2xkB1cVf6hBnM3g9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TOtIzRiWPPZjuRv2kWjuiQ5s0/C/zak331RlOyFVykk=;
 b=Hv2GTkZl55nwcui+gfU+jiDkpgR3tuofw050dOFADgaSHNOb2nuUZdTTk7C4h3Dug+3YczLMf+F1y2jPCstQzHcbbPJ0uvDe2odt5kEOhs3tFm+2hBa5kGSyR6ddEg1FYWx7QLSGLJD8dXurGh0QB+aJVxGZyA/3TLKfIEzKWpwPkG9BaPC83DFKJBabmddCi3cKeU7WRYWOEqQKDwU3kph6H/0Q2mGzleHy0yOrwDSleuvBJ1WboE6r8S/YiYu0i9gVwxgGRtusqm5v6kRvqohtE1TejZbbHK6Df/cxDmcXHK2TRRtsGhUwhCzWgeCXuyfrNb5ZavC2V42B8wqQGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOtIzRiWPPZjuRv2kWjuiQ5s0/C/zak331RlOyFVykk=;
 b=kDuMuOX+fguBYPnDh+ABadt9EogzaXiqu5WeLrq+BxIt6f4wml4EPk/TqpxmgemER/B1c2/UjwA5qNCaaReUILPC7WAVoSBWoYhW3mFcCxYQ6MQ0PP8HEfMs+NSqxtoBvYekWlhEFjUy1wYUl3fCya9TKzNddVU0I9sIvllaWC0=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SA1PR11MB5778.namprd11.prod.outlook.com (2603:10b6:806:231::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Tue, 14 Jun
 2022 07:32:41 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 07:32:40 +0000
From: <Conor.Dooley@microchip.com>
To: <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC: <ben.dooks@codethink.co.uk>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <Daire.McNamara@microchip.com>
Subject: Re: [PATCH v5] i2c: add support for microchip fpga i2c controllers
Thread-Topic: [PATCH v5] i2c: add support for microchip fpga i2c controllers
Thread-Index: AQHYdxoPkKkfdywmQkemQDufRsMXu61OkzgA
Date: Tue, 14 Jun 2022 07:32:40 +0000
Message-ID: <a21d4684-ae9b-2e99-3173-e534888ef5eb@microchip.com>
References: <20220603071601.1849562-1-conor.dooley@microchip.com>
In-Reply-To: <20220603071601.1849562-1-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5087be27-8069-4570-b469-08da4dd81011
x-ms-traffictypediagnostic: SA1PR11MB5778:EE_
x-microsoft-antispam-prvs: <SA1PR11MB57782CDBDCE77134902460F298AA9@SA1PR11MB5778.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: efFfralD5vxkQcHjY/GIxbVhPmowm9sSOpmalJ7/mjKFNBYCBHWtbcjiS1QRBw/gFzh1vgo6kYROIek0ApzTRvrvbsKZ6mdZvG0mhYXPwY//HktGqboyjIrNaZrHLUChmlUEtY+W1aDkfSxI9mAoRBJMQwMhCy194ji3zPYxejBdh+wfr828hgv2x1La9N2Uc1SHyGM4whtJLVUbgODqYzONTeYsICN1kmXe3AKsWA2YPT4sCWfqn1J7LlzjJ+YdP3rV5qYYtN6E3ZWgbo4sNUwsQpPJS1/DOpJkcJ2i/d76TJaT1tsP6wG0+pXy2CILbF+HhvapU6nTB2K6L9gODtuqGLVlWWFL8MX1264RRNy1pJB92QIkf3m/X9vK0KYIQElNP6NIuWGOFnBJPODZ9G9URxNStUMx64IuFuFmgRF3lwy6jg+q6O+UR7NQycF+hEnOeaNhok/ELwXhShs7GNTIWgNngfElRCS4aPzPjj7IdFSyfkWHbcw7xDBqcA70XcEN4kl13umqUbu5f2Ve28/pLAZGH6oPHM8TqY6hplfJIYu2sY6B+mWsS2q/97M3zTM/lVYqsQuuReU/+/rWKQQrWWEUHNN4UH29tLp5K979C0CFpszdXTJj1PVXa+USf1Y7PzEUFbeKF69874PDb3qBzLDI7ypZlkXNmtSWE+qowRii7Zx3l8N/4qdJbtrOtynGOUzbH8qTjpXnwKIdzO8y04XOCz8726psKl7CoQ6o0CysBATZMtE7+OMYfPnRoTS+PFQxSUFS8o87T37QIw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(86362001)(31696002)(91956017)(4326008)(8936002)(64756008)(66946007)(5660300002)(83380400001)(53546011)(71200400001)(76116006)(38070700005)(8676002)(508600001)(2906002)(6506007)(30864003)(66556008)(66476007)(66446008)(36756003)(316002)(122000001)(6486002)(186003)(31686004)(26005)(107886003)(54906003)(110136005)(2616005)(6512007)(38100700002)(43740500002)(45980500001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2ovOUVybm1DT1Zpa2dyRmFpV1VCNTFHWUNobVM3Z1U3VU9YaG1vSzVwd0tD?=
 =?utf-8?B?NlZzRW1hcCtVLzUvOVp4UE9tTlkrTVh0YWhZOGZXaXhoek05Y2VBVnRoK3Vm?=
 =?utf-8?B?R0tidGRlNVJPYkF5VTlmQitEWUkzcEVmUC9kTC9CVVVCMnE5YXhMR3N5YjJM?=
 =?utf-8?B?MVhCb2hEaGRYS0wyKzhJdXdKU1pTM2Urd3p1bThZYlA1ZzBSN2FxMjcvV2pQ?=
 =?utf-8?B?bG5pSVlBNDdFaWo3dEFDb3J4Yy9ma05RZGNaUE1CQjIxSWNuOEVuYzE0Qkhh?=
 =?utf-8?B?djJYUXpRRzBmdURvV1c1WEFJd2s3Sk1Fd2VKVGphdUdKRlNTUjJlWWd4djBY?=
 =?utf-8?B?QXFuaUdBczZGSHFVTXY5bUpNU0FCUUZvTzlyYVhZQ3hTeEFnZnRCbWxIMzdZ?=
 =?utf-8?B?WVR5YVVNTm9qUkRjVDY5OXhXWFA4eEZuVit6dThLTmkzbVBlZHdhejYyNnMw?=
 =?utf-8?B?Ui9FUXRRZWNKbHVkMVRSYmpaNThKc3FyYnFmeFhHdm1CVENsQThtR3lMRXVn?=
 =?utf-8?B?ZU9GdlUyK0lFZnNhTFBtZFRHTlcyaVhScktDeVN4bkxwTHluNXNkM3JzNXhC?=
 =?utf-8?B?Zm8zQVRJOTNJMmpqWERWUncxZUhMYlJyTThrcWUrQlRJTGlKSFljcDdjTlpo?=
 =?utf-8?B?WFVTRmt0SEZDT2tKa2pSMVRkVTRZY2IvSFFmTHNHRHZTbVdldWF3aitlMlRl?=
 =?utf-8?B?b0tsZ1lQWXZXRUlLYjArNFpLaHdLS3o3N2RJRG5udEVLK1F6MzNVck0zYXhN?=
 =?utf-8?B?WHdUZ0ZaTVFxY2YzdXRuNTFIOHFRS1VMTTFYTlBSZXd4c0ZiMTZYM3JCUE13?=
 =?utf-8?B?T01aWERleVBWWjNNQ3E5b3hJYTZiZjdTeHBIYXFHTFo4SUlYZm5TWHpla3JL?=
 =?utf-8?B?N2l1MlZ4MlhOaWx0WnVMdVFYUCtYVUR6NHlIUWgvaURUbCtDSXplbnBCSTN4?=
 =?utf-8?B?THVXMXovNDV5ekFIejJnUGxNL0FMdFBNSkluVGowYTRRMm5YNE44cE1YOFhv?=
 =?utf-8?B?dDVESFcvRUpRS1RTWlFnRzh2SGNnSmdUNEVLNXZlTldDZ1lESG12clB5djFP?=
 =?utf-8?B?WTdaSUZtNHpHbUNWcFY5UUNCM0FGdk9Na3poYWptSndvN1ZPenNraDNnTUg4?=
 =?utf-8?B?czNodk9FNS9COXF5TGY2WWtPNUduZk43aG92YVczNFhPbk4rZktEZFRDVDVL?=
 =?utf-8?B?cWNZalpuNDBicllBdmxDYTlGN2h5cXNmbVRKNHBzeUZJemI5QzlhRnhud2Rw?=
 =?utf-8?B?b2ZhWmFGVTA5a2FiWjA4RjU1TkdBeFVYVHgxUi92cnlPSm1JRkZBS0NVK2h2?=
 =?utf-8?B?M3prL1J5RG8rSTB5VHNkaC8yMlBTMFVVeGUrNUU4Y3ArZVpWOVFMRlRXU3I3?=
 =?utf-8?B?SUFUajVsTC9kNFN2UHRkcWhhVDJTNEJEeGlaVmJnY0xVaW10Vi93ZGVzeVlD?=
 =?utf-8?B?a3JoSzArRTRNN2MzeEV2cmU5T3pFemt6OGhMd1UvbGg4TFRJaXVaWHZmaEk5?=
 =?utf-8?B?NzZoZlJuWmtzRy9jNWlLdGxSSFRtK29WYTNaTHRiL3JrN1M5VVQzb05SK0lz?=
 =?utf-8?B?STdOUzhXV3pkOGJHK3lKdjFOOUpDaG1odXRId2lPVjByd1p0WWVldTh4UmEz?=
 =?utf-8?B?dXJrSHdQaGFiOERHWjJTVUlYTk9STDdwRWM4Mkxub2N1akVjSXRQMVNWS0tU?=
 =?utf-8?B?ZGtSS1hGZEVXOEl1OElmVldXWUZvcVp5ZWFzM21aZ3FYQVZzaThhL3lLZU1L?=
 =?utf-8?B?WWViWGxsVE53enE5Rnk2UDhha0U0QXg0QVVIZytvUzFkalRnQkhRc205Ti9r?=
 =?utf-8?B?YjV1eDFxSWM2SFBCKzJQeTFiYytmYmxwT3NIM21XMnYrVVJhVG80ZHZPRnJr?=
 =?utf-8?B?UHhCSnhjcUwvbjJPTzFOU1I1cGdaUEdSU3U0c0drdXNERTJhb1hOYnFMTHgv?=
 =?utf-8?B?QWRoQjdrK05JQ1pMU2N4cXQxMnhRa3hObFJRQll2djM2QU5UOHdicnZzLzNk?=
 =?utf-8?B?QVEyY1lUVnU1dU5oOGpKWDJObFVJTktMY2dUc1NFakExT1djb0VZb3N5ZlJu?=
 =?utf-8?B?aThYMFQ1VTlWK1BoOGlTMTR0ZU9SM2RqZzdRb2R0T1RLUWUxWDJMSDFYUzI1?=
 =?utf-8?B?allhQXBVSEFNcEpyVTBjTVdPUHVkREtwbHk2Lzg2M2NuY3Q5VE9PamRMNTRV?=
 =?utf-8?B?ZEE5dnlPQmtkQTUvUzRhWktocVlBK000U1BUV0paWkQvM1NtNTRmd0djYjZO?=
 =?utf-8?B?aUIwdzh2eDdLOVBQNWJBblBWQ3paTlZQZzJVQ1Z1Zm1zMUdDdFFsU20zU05x?=
 =?utf-8?B?YUhJM1lpV1FMRzl3d1NVUnFUVTlBTUZVNUhBdUZPaEdkNlZjbHY5dz09?=
Content-ID: <5F0600D4DD57604BB369037DA005A568@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5087be27-8069-4570-b469-08da4dd81011
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 07:32:40.3688
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vFpgp+2O4t0F6TcAtX8gNNxdMwzQRgmRxNVWAoFEhJzmzi/JIVCVtUN4AqIAi+r8AcO9VtweYKDn7lhEypsa7EpMls1tJ2RmddE5P3srlUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5778
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_003251_496892_D0FE4E8D 
X-CRM114-Status: GOOD (  27.47  )
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

On 03/06/2022 08:16, Conor Dooley wrote:
> Add Microchip CoreI2C i2c controller support. This driver supports the
> "hard" i2c controller on the Microchip PolarFire SoC & the basic feature
> set for "soft" i2c controller implemtations in the FPGA fabric.
> 
> Co-developed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes from v4:
> - reset the controller on xfer timeout
> - sort the headers alphabetically
> 
> Changes from v3:
> - update members in struct doc comment
> - move mchp_corei2c_transfer in its caller
> - change msg_len to a u16
> - remove unused variable msg_read
> - use adapater.timeout for completion
> - dont use last_byte goto
> - remove block on zero length messages
>    (the hardware can do them, was a carryover from the baremetal driver)
> - probe:
>    - drop unneeded initialisation
>    - use ret not val
>    - explain shared irq
>    - disallow 0 bus_clock_rate
>    - include base in device name
>    - dropped the duplicate "microchip" in the registered print
>      (its in driver.name)
> 
> Changes from v2:
> - Fixed whitespace in defines that I removed accidentally
> 
> Changes from v1:
> - Use byte write and read functions
> - Return IRQ_NONE and don't warn if not this drivers interrupt
> - Add a clk_disable_unprepare to avoid leaking a clock in the probe
> ---
>   drivers/i2c/busses/Kconfig              |  11 +
>   drivers/i2c/busses/Makefile             |   1 +
>   drivers/i2c/busses/i2c-microchip-core.c | 486 ++++++++++++++++++++++++
>   3 files changed, 498 insertions(+)
>   create mode 100644 drivers/i2c/busses/i2c-microchip-core.c
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index a1bae59208e3..3d4d8e0e9de7 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -781,6 +781,17 @@ config I2C_MESON
>   	  If you say yes to this option, support will be included for the
>   	  I2C interface on the Amlogic Meson family of SoCs.
>   
> +config I2C_MICROCHIP_CORE
> +	tristate "Microchip FPGA I2C controller"
> +	depends on SOC_MICROCHIP_POLARFIRE || COMPILE_TEST
> +	depends on OF
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  I2C interface on Microchip FPGAs.
> +
> +	  This driver can also be built as a module. If so, the module will be
> +	  called i2c-microchip-core.
> +
>   config I2C_MPC
>   	tristate "MPC107/824x/85xx/512x/52xx/83xx/86xx"
>   	depends on PPC
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 479f60e4ee3d..75869b189e43 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -78,6 +78,7 @@ obj-$(CONFIG_I2C_JZ4780)	+= i2c-jz4780.o
>   obj-$(CONFIG_I2C_KEMPLD)	+= i2c-kempld.o
>   obj-$(CONFIG_I2C_LPC2K)		+= i2c-lpc2k.o
>   obj-$(CONFIG_I2C_MESON)		+= i2c-meson.o
> +obj-$(CONFIG_I2C_MICROCHIP_CORE)	+= i2c-microchip-core.o
>   obj-$(CONFIG_I2C_MPC)		+= i2c-mpc.o
>   obj-$(CONFIG_I2C_MT65XX)	+= i2c-mt65xx.o
>   obj-$(CONFIG_I2C_MT7621)	+= i2c-mt7621.o
> diff --git a/drivers/i2c/busses/i2c-microchip-core.c b/drivers/i2c/busses/i2c-microchip-core.c
> new file mode 100644
> index 000000000000..6da8e9735c83
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-microchip-core.c
> @@ -0,0 +1,486 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Microchip CoreI2C I2C controller driver
> + *
> + * Copyright (c) 2018 - 2022 Microchip Corporation. All rights reserved.
> + *
> + * Author: Daire McNamara <daire.mcnamara@microchip.com>
> + * Author: Conor Dooley <conor.dooley@microchip.com>
> + */
> +#include <linux/clk.h>
> +#include <linux/clkdev.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/iopoll.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +
> +#define MICROCHIP_I2C_TIMEOUT (msecs_to_jiffies(1000))
> +
> +#define CORE_I2C_CTRL	(0x00)
> +#define  CTRL_CR0	BIT(0)
> +#define  CTRL_CR1	BIT(1)
> +#define  CTRL_AA	BIT(2)
> +#define  CTRL_SI	BIT(3)
> +#define  CTRL_STO	BIT(4)
> +#define  CTRL_STA	BIT(5)
> +#define  CTRL_ENS1	BIT(6)
> +#define  CTRL_CR2	BIT(7)
> +
> +#define STATUS_BUS_ERROR			(0x00)
> +#define STATUS_M_START_SENT			(0x08)
> +#define STATUS_M_REPEATED_START_SENT		(0x10)
> +#define STATUS_M_SLAW_ACK			(0x18)
> +#define STATUS_M_SLAW_NACK			(0x20)
> +#define STATUS_M_TX_DATA_ACK			(0x28)
> +#define STATUS_M_TX_DATA_NACK			(0x30)
> +#define STATUS_M_ARB_LOST			(0x38)
> +#define STATUS_M_SLAR_ACK			(0x40)
> +#define STATUS_M_SLAR_NACK			(0x48)
> +#define STATUS_M_RX_DATA_ACKED			(0x50)
> +#define STATUS_M_RX_DATA_NACKED			(0x58)
> +#define STATUS_S_SLAW_ACKED			(0x60)
> +#define STATUS_S_ARB_LOST_SLAW_ACKED		(0x68)
> +#define STATUS_S_GENERAL_CALL_ACKED		(0x70)
> +#define STATUS_S_ARB_LOST_GENERAL_CALL_ACKED	(0x78)
> +#define STATUS_S_RX_DATA_ACKED			(0x80)
> +#define STATUS_S_RX_DATA_NACKED			(0x88)
> +#define STATUS_S_GENERAL_CALL_RX_DATA_ACKED	(0x90)
> +#define STATUS_S_GENERAL_CALL_RX_DATA_NACKED	(0x98)
> +#define STATUS_S_RX_STOP			(0xA0)
> +#define STATUS_S_SLAR_ACKED			(0xA8)
> +#define STATUS_S_ARB_LOST_SLAR_ACKED		(0xB0)
> +#define STATUS_S_TX_DATA_ACK			(0xB8)
> +#define STATUS_S_TX_DATA_NACK			(0xC0)
> +#define STATUS_LAST_DATA_ACK			(0xC8)
> +#define STATUS_M_SMB_MASTER_RESET		(0xD0)
> +#define STATUS_S_SCL_LOW_TIMEOUT		(0xD8) /* 25 ms */
> +#define STATUS_NO_STATE_INFO			(0xF8)
> +
> +#define CORE_I2C_STATUS		(0x04)
> +#define CORE_I2C_DATA		(0x08)
> +#define WRITE_BIT		(0x0)
> +#define READ_BIT		(0x1)
> +#define SLAVE_ADDR_SHIFT	(1)
> +#define CORE_I2C_SLAVE0_ADDR	(0x0c)
> +#define GENERAL_CALL_BIT	(0x0)
> +#define CORE_I2C_SMBUS		(0x10)
> +#define SMBALERT_INT_ENB	(0x0)
> +#define SMBSUS_INT_ENB		(0x1)
> +#define SMBUS_ENB		(0x2)
> +#define SMBALERT_NI_STATUS	(0x3)
> +#define SMBALERT_NO_CTRL	(0x4)
> +#define SMBSUS_NI_STATUS	(0x5)
> +#define SMBSUS_NO_CTRL		(0x6)
> +#define SMBUS_RESET		(0x7)
> +#define CORE_I2C_FREQ		(0x14)
> +#define CORE_I2C_GLITCHREG	(0x18)
> +#define CORE_I2C_SLAVE1_ADDR	(0x1c)
> +
> +#define PCLK_DIV_960	(CTRL_CR2)
> +#define PCLK_DIV_256	(0)
> +#define PCLK_DIV_224	(CTRL_CR0)
> +#define PCLK_DIV_192	(CTRL_CR1)
> +#define PCLK_DIV_160	(CTRL_CR0 | CTRL_CR1)
> +#define PCLK_DIV_120	(CTRL_CR0 | CTRL_CR2)
> +#define PCLK_DIV_60	(CTRL_CR1 | CTRL_CR2)
> +#define BCLK_DIV_8	(CTRL_CR0 | CTRL_CR1 | CTRL_CR2)
> +#define CLK_MASK	(CTRL_CR0 | CTRL_CR1 | CTRL_CR2)
> +
> +/**
> + * struct mchp_corei2c_dev - Microchip CoreI2C device private data
> + *
> + * @base:		pointer to register struct
> + * @dev:		device reference
> + * @i2c_clk:		clock reference for i2c input clock
> + * @buf:		pointer to msg buffer for easier use
> + * @msg_complete:	xfer completion object
> + * @adapter:		core i2c abstraction
> + * @lock:		spinlock for IRQ synchronization
> + * @msg_err:		error code for completed message
> + * @bus_clk_rate:	current i2c bus clock rate
> + * @isr_status:		cached copy of local ISR status
> + * @msg_len:		number of bytes transferred in msg
> + * @addr:		address of the current slave
> + */
> +struct mchp_corei2c_dev {
> +	void __iomem *base;
> +	struct device *dev;
> +	struct clk *i2c_clk;
> +	u8 *buf;
> +	struct completion msg_complete;
> +	struct i2c_adapter adapter;
> +	spinlock_t lock; /* IRQ synchronization */
> +	int msg_err;
> +	u32 bus_clk_rate;
> +	u32 isr_status;
> +	u16 msg_len;
> +	u8 addr;
> +};
> +
> +static void mchp_corei2c_core_disable(struct mchp_corei2c_dev *idev)
> +{
> +	u8 ctrl = readb(idev->base + CORE_I2C_CTRL);
> +
> +	ctrl &= ~CTRL_ENS1;
> +	writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +}
> +
> +static void mchp_corei2c_core_enable(struct mchp_corei2c_dev *idev)
> +{
> +	u8 ctrl = readb(idev->base + CORE_I2C_CTRL);
> +
> +	ctrl |= CTRL_ENS1;
> +	writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +}
> +
> +static void mchp_corei2c_reset(struct mchp_corei2c_dev *idev)
> +{
> +	mchp_corei2c_core_disable(idev);
> +	mchp_corei2c_core_enable(idev);
> +}
> +
> +static inline void mchp_corei2c_stop(struct mchp_corei2c_dev *idev)
> +{
> +	u8 ctrl = readb(idev->base + CORE_I2C_CTRL);
> +
> +	ctrl |= CTRL_STO;
> +	writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +}
> +
> +static inline int mchp_corei2c_set_divisor(u32 rate,
> +					   struct mchp_corei2c_dev *idev)
> +{
> +	u8 clkval, ctrl;
> +
> +	if (rate >= 960)
> +		clkval = PCLK_DIV_960;
> +	else if (rate >= 256)
> +		clkval = PCLK_DIV_256;
> +	else if (rate >= 224)
> +		clkval = PCLK_DIV_224;
> +	else if (rate >= 192)
> +		clkval = PCLK_DIV_192;
> +	else if (rate >= 160)
> +		clkval = PCLK_DIV_160;
> +	else if (rate >= 120)
> +		clkval = PCLK_DIV_120;
> +	else if (rate >= 60)
> +		clkval = PCLK_DIV_60;
> +	else if (rate >= 8)
> +		clkval = BCLK_DIV_8;
> +	else
> +		return -EINVAL;
> +
> +	ctrl = readb(idev->base + CORE_I2C_CTRL);
> +	ctrl &= ~CLK_MASK;
> +	ctrl |= clkval;
> +	writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +
> +	ctrl = readb(idev->base + CORE_I2C_CTRL);
> +	if ((ctrl & CLK_MASK) != clkval)
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int mchp_corei2c_init(struct mchp_corei2c_dev *idev)
> +{
> +	u32 clk_rate = clk_get_rate(idev->i2c_clk);
> +	u32 divisor = clk_rate / idev->bus_clk_rate;
> +	int ret;
> +
> +	ret = mchp_corei2c_set_divisor(divisor, idev);
> +	if (ret)
> +		return ret;
> +
> +	mchp_corei2c_reset(idev);
> +
> +	return 0;
> +}
> +
> +static void mchp_corei2c_empty_rx(struct mchp_corei2c_dev *idev)
> +{
> +	u8 ctrl;
> +
> +	if (idev->msg_len > 0) {
> +		*idev->buf++ = readb(idev->base + CORE_I2C_DATA);
> +		idev->msg_len--;
> +	}
> +
> +	if (idev->msg_len == 0) {
> +		ctrl = readb(idev->base + CORE_I2C_CTRL);
> +		ctrl &= ~CTRL_AA;
> +		writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +	}
> +}
> +
> +static int mchp_corei2c_fill_tx(struct mchp_corei2c_dev *idev)
> +{
> +	if (idev->msg_len > 0)
> +		writeb(*idev->buf++, idev->base + CORE_I2C_DATA);
> +	idev->msg_len--;
> +
> +	return 0;
> +}
> +
> +static irqreturn_t mchp_corei2c_handle_isr(struct mchp_corei2c_dev *idev)
> +{
> +	u32 status = idev->isr_status;
> +	u8 ctrl;
> +	bool last_byte = false, finished = false;
> +
> +	if (!idev->buf)
> +		return IRQ_NONE;
> +
> +	switch (status) {
> +	case STATUS_M_START_SENT:
> +	case STATUS_M_REPEATED_START_SENT:
> +		ctrl = readb(idev->base + CORE_I2C_CTRL);
> +		ctrl &= ~CTRL_STA;
> +		writeb(idev->addr, idev->base + CORE_I2C_DATA);
> +		writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +		if (idev->msg_len <= 0)
> +			finished = true;
> +		break;
> +	case STATUS_M_ARB_LOST:
> +		idev->msg_err = -EAGAIN;
> +		finished = true;
> +		break;
> +	case STATUS_M_SLAW_ACK:
> +	case STATUS_M_TX_DATA_ACK:
> +		if (idev->msg_len > 0)
> +			mchp_corei2c_fill_tx(idev);
> +		else
> +			last_byte = true;
> +		break;
> +	case STATUS_M_TX_DATA_NACK:
> +	case STATUS_M_SLAR_NACK:
> +	case STATUS_M_SLAW_NACK:
> +		idev->msg_err = -ENXIO;
> +		last_byte = true;
> +		break;
> +	case STATUS_M_SLAR_ACK:
> +		ctrl = readb(idev->base + CORE_I2C_CTRL);
> +		if (idev->msg_len == 1u) {
> +			ctrl &= ~CTRL_AA;
> +			writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +		} else {
> +			ctrl |= CTRL_AA;
> +			writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +		}
> +		if (idev->msg_len < 1u)
> +			last_byte = true;
> +		break;
> +	case STATUS_M_RX_DATA_ACKED:
> +		mchp_corei2c_empty_rx(idev);
> +		break;
> +	case STATUS_M_RX_DATA_NACKED:
> +		mchp_corei2c_empty_rx(idev);
> +		if (idev->msg_len == 0)
> +			last_byte = true;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	/* On the last byte to be transmitted, send STOP */
> +	if (last_byte)
> +		mchp_corei2c_stop(idev);
> +
> +	if (last_byte || finished)
> +		complete(&idev->msg_complete);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t mchp_corei2c_isr(int irq, void *_dev)
> +{
> +	struct mchp_corei2c_dev *idev = _dev;
> +	irqreturn_t ret = IRQ_NONE;
> +	u8 ctrl;
> +
> +	ctrl = readb(idev->base + CORE_I2C_CTRL);
> +	if (ctrl & CTRL_SI) {
> +		idev->isr_status = readb(idev->base + CORE_I2C_STATUS);
> +		ret = mchp_corei2c_handle_isr(idev);
> +	}
> +
> +	ctrl = readb(idev->base + CORE_I2C_CTRL);
> +	ctrl &= ~CTRL_SI;
> +	writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +
> +	return ret;
> +}
> +
> +static int mchp_corei2c_xfer_msg(struct mchp_corei2c_dev *idev,
> +				 struct i2c_msg *msg)
> +{
> +	u8 ctrl;
> +	unsigned long time_left;
> +
> +	idev->addr = i2c_8bit_addr_from_msg(msg);
> +	idev->msg_len = msg->len;
> +	idev->buf = msg->buf;
> +	idev->msg_err = 0;
> +
> +	reinit_completion(&idev->msg_complete);
> +
> +	mchp_corei2c_core_enable(idev);
> +
> +	ctrl = readb(idev->base + CORE_I2C_CTRL);
> +	ctrl |= CTRL_STA;
> +	writeb(ctrl, idev->base + CORE_I2C_CTRL);
> +
> +	time_left = wait_for_completion_timeout(&idev->msg_complete,
> +						idev->adapter.timeout);
> +	if (!time_left)
> +		return -ETIMEDOUT;
> +
> +	return idev->msg_err;
> +}
> +
> +static int mchp_corei2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> +			     int num)
> +{
> +	struct mchp_corei2c_dev *idev = i2c_get_adapdata(adap);
> +	int i, ret;
> +
> +	for (i = 0; i < num; i++) {
> +		ret = mchp_corei2c_xfer_msg(idev, msgs++);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return num;
> +}
> +
> +static u32 mchp_corei2c_func(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +}
> +
> +static const struct i2c_algorithm mchp_corei2c_algo = {
> +	.master_xfer = mchp_corei2c_xfer,
> +	.functionality = mchp_corei2c_func,
> +};
> +
> +static int mchp_corei2c_probe(struct platform_device *pdev)
> +{
> +	struct mchp_corei2c_dev *idev;
> +	struct resource *res;
> +	int irq, ret;
> +
> +	idev = devm_kzalloc(&pdev->dev, sizeof(*idev), GFP_KERNEL);
> +	if (!idev)
> +		return -ENOMEM;
> +
> +	idev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(idev->base))
> +		return PTR_ERR(idev->base);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)

This check should be <= 0, I'll hold off on v6 for a few days pending whatever
other review comes in.
Thanks,
Conor.

> +		return dev_err_probe(&pdev->dev, irq,
> +				     "missing interrupt resource\n");
> +
> +	idev->i2c_clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(idev->i2c_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(idev->i2c_clk),
> +				     "missing clock\n");
> +
> +	idev->dev = &pdev->dev;
> +	init_completion(&idev->msg_complete);
> +	spin_lock_init(&idev->lock);
> +
> +	ret = device_property_read_u32(idev->dev, "clock-frequency",
> +				       &idev->bus_clk_rate);
> +	if (ret || !idev->bus_clk_rate) {
> +		dev_info(&pdev->dev, "default to 100kHz\n");
> +		idev->bus_clk_rate = 100000;
> +	}
> +
> +	if (idev->bus_clk_rate > 400000)
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "clock-frequency too high: %d\n",
> +				     idev->bus_clk_rate);
> +
> +	/*
> +	 * This driver supports both the hard peripherals & soft FPGA cores.
> +	 * The hard peripherals do not have shared IRQs, but we don't have
> +	 * control over what way the interrupts are wired for the soft cores.
> +	 */
> +	ret = devm_request_irq(&pdev->dev, irq, mchp_corei2c_isr, IRQF_SHARED,
> +			       pdev->name, idev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to claim irq %d\n", irq);
> +
> +	ret = clk_prepare_enable(idev->i2c_clk);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to enable clock\n");
> +
> +	ret = mchp_corei2c_init(idev);
> +	if (ret) {
> +		clk_disable_unprepare(idev->i2c_clk);
> +		return dev_err_probe(&pdev->dev, ret, "failed to program clock divider\n");
> +	}
> +
> +	i2c_set_adapdata(&idev->adapter, idev);
> +	snprintf(idev->adapter.name, sizeof(idev->adapter.name),
> +		 "Microchip I2C hw bus at %08lx", (unsigned long)res->start);
> +	idev->adapter.owner = THIS_MODULE;
> +	idev->adapter.algo = &mchp_corei2c_algo;
> +	idev->adapter.dev.parent = &pdev->dev;
> +	idev->adapter.dev.of_node = pdev->dev.of_node;
> +	idev->adapter.timeout = MICROCHIP_I2C_TIMEOUT;
> +
> +	platform_set_drvdata(pdev, idev);
> +
> +	ret = i2c_add_adapter(&idev->adapter);
> +	if (ret) {
> +		clk_disable_unprepare(idev->i2c_clk);
> +		return ret;
> +	}
> +
> +	dev_info(&pdev->dev, "registered CoreI2C bus driver\n");
> +
> +	return 0;
> +}
> +
> +static int mchp_corei2c_remove(struct platform_device *pdev)
> +{
> +	struct mchp_corei2c_dev *idev = platform_get_drvdata(pdev);
> +
> +	clk_disable_unprepare(idev->i2c_clk);
> +	i2c_del_adapter(&idev->adapter);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mchp_corei2c_of_match[] = {
> +	{ .compatible = "microchip,mpfs-i2c" },
> +	{ .compatible = "microchip,corei2c-rtl-v7" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mchp_corei2c_of_match);
> +
> +static struct platform_driver mchp_corei2c_driver = {
> +	.probe = mchp_corei2c_probe,
> +	.remove = mchp_corei2c_remove,
> +	.driver = {
> +		.name = "microchip-corei2c",
> +		.of_match_table = mchp_corei2c_of_match,
> +	},
> +};
> +
> +module_platform_driver(mchp_corei2c_driver);
> +
> +MODULE_DESCRIPTION("Microchip CoreI2C bus driver");
> +MODULE_AUTHOR("Daire McNamara <daire.mcnamara@microchip.com>");
> +MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
> +MODULE_LICENSE("GPL");

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
