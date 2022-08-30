Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C369ECAAD8
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 15:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZYrYrmagJfEwyax30SBvl+vYAqbavQ2+iiuug1HffGI=; b=QbMUOlfQCHrZRD
	vDLFZezhQk1Fg8Eo2NbLmfDapAh93BTG1ung3/x6m7zOmWxeR+5+hayr2Vo1E1ZilddsNv8+plu4m
	4LhLedyF+BH5fCm+DnEN19U6R8nBqdDyGTYUt91W/zbX4TIvlTVho5ZPMePWQ+yW7a5m7yJlrefhn
	+kKpWrKbe+tmHstspm/wVeQDzVN/kPfau1t3YIv4yid+s1qr2/nsMjMTWSKakHUju4YfJJpE92hwq
	bIEJnXwGWkiRV5yZJXQ7H4Hc4sPfBjdC0Aq4om9wzI1ekOhcP0loYGf5F60u5+GVa8P3wcycdgPJ+
	k/M6isPBCoQNqzMZVQaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT37z-000HjD-Ro; Tue, 30 Aug 2022 15:26:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT37w-000Hel-2W
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 15:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661873167; x=1693409167;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/Nqmbzl9dZkj7DdcZ7dwfJVdOUAs2mbNxS0EgJFXUbA=;
  b=MmYBI7ugnnZamtxovp3feySdfMAMGlrKE6kBHJA+Mmtc1qbgTtV2+PGf
   P3OxDjNLsrFggNTG64fd6JX27N4IsoG8zkE9e//qMZ0hVb88dmP+iEMTU
   qzAOfqW2MOhFEBA3ywq2WeOb1Q34BxRFX5Llp1WsiZnM00jDNbE/dw7xP
   4SFQP7GMTMRqfRA0Gm4vUCNn97s8p4Sy2FkzBMXjK7cYvD9xbBw0VsKdA
   LJxxe6v5szzqhmOIejp8SOZ3A+h2cu7yc3gMkePolrrqk1nrP2HFujdcb
   7AUyTvsiOGU3TTDUvYPAdKXJMLkGoBD5vDdQ4ebzIoSWu2AKLwx21EgN5
   A==;
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="188674128"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Aug 2022 08:26:03 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 30 Aug 2022 08:26:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 30 Aug 2022 08:26:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bn+X1rQ4OCcaSROuyB3Faw1cstGA4X/WfNp2wxl8aWEB7piNuB45CxJyG6XJvhClfoKU+uA1TimD+fOhpb+58ANZYmuTwk7Ck47VUAbgF5mx9X2r2bG0ibbG2t3AXNheMcj5GOQFQgVF/5PKa331+il2djWtOQLlhyZ4RsDRlrQAux8+N9faSPS+NCcVISgtWMCESkB9hCdonsB/RQDnil6oGKL0FI85Cv38airIm9ASws35UjazQNnmFhinZwbBgvoqflE4cM7DDWuAgrLPO+YfJ1Ip5IM9n+SKciUztRof4uYT4Jq1gAKLBUP5Orr5UhxSJuyfgmRi1vHWKkd0wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Nqmbzl9dZkj7DdcZ7dwfJVdOUAs2mbNxS0EgJFXUbA=;
 b=g1Ug/y0XTl5rUBZPmQuB0c7lDvOhcziUbuKS6ej4BaOdvxioI+86BTdpR68pshOWgpE3NWt66SeBOvL2IVaxPmzfy0UCWkrPZZ6eHQvzTPvozKpldCXbP59/MGuG6ovIJ0gtlG41llr8u3I2cof823z4WzkLtK5nRRsNpV2MwhFGN7lV5+PDc5GWTJrs+hhDQIXLThchjCiJEbuBTBr59oa2EVPdk2Qprvbgf0L+u7Rs5gLKhuH8eTrjgPwUlVWzgGofu9Ud3A4+cIObglNd/Xb+Dc2//rRiFDmO5ZfJzVWjovaS4obyZ0aTBLtXA9T1BMeFvI7n+ne846imSPC/GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Nqmbzl9dZkj7DdcZ7dwfJVdOUAs2mbNxS0EgJFXUbA=;
 b=fKa/whb3VGSkz4C6mDPGM8SMRQwcbWw+bMksqF9WDQM1uNU05UuDnCsx8p1Ku/zI7bZmCLJoba+EXc5sdkBmvw/6xbler7ahAe5uXsmyTFqgXItN8FZlrukIfEcHkrtWswL08wg8A2IYagO+Lo30czVdj64+4vl2OPKiBVs+N+E=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB3465.namprd11.prod.outlook.com (2603:10b6:5:b::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.19; Tue, 30 Aug 2022 15:25:57 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 15:25:57 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <Daire.McNamara@microchip.com>,
	<Shravan.Chippa@microchip.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<Cyril.Jean@microchip.com>, <Lewis.Hanly@microchip.com>,
	<Praveen.Kumar@microchip.com>, <wg@aries-embedded.de>,
	<Hugh.Breslin@microchip.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/9] dt-bindings: riscv: microchip: document the aries
 m100pfsevp
Thread-Topic: [PATCH v2 2/9] dt-bindings: riscv: microchip: document the aries
 m100pfsevp
Thread-Index: AQHYvFnwSpVLiReZPUWC5HM7xMt/UK3Hg2QAgAANgQA=
Date: Tue, 30 Aug 2022 15:25:57 +0000
Message-ID: <27b8aa9e-9173-b40e-8f9c-a53fa5ba36c8@microchip.com>
References: <20220830101803.1456180-1-conor.dooley@microchip.com>
 <20220830101803.1456180-3-conor.dooley@microchip.com>
 <a3a8e2ba-a6bd-6e66-fd04-e3a46661a34d@linaro.org>
In-Reply-To: <a3a8e2ba-a6bd-6e66-fd04-e3a46661a34d@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e5d42f7-e443-43cb-bcb7-08da8a9befa5
x-ms-traffictypediagnostic: DM6PR11MB3465:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KUaYOpDN48Ve0rb7NoE28MjxDUZgKpsjU+xm12ugXdxfRE2NboG8Ikv0cB9MmUHtWdKYF/0GdTj+ZpCJTckY2PRJHErJaMp4u6kAAKbx55hNMld/mUbYeCzRdMa6hsUd8j0XJ0TbFAOSYXhdjYOfN973tzf2fXhhhbLMDBPFevzRvslOElI8D7F6LNZ3vk8KxOBDL4gggdz63pu5V81TIhx4ZvYIYdqsgnjM4c/3vSuDhX7mRxGOd7eWLt2vtnZ9VJe3A4PK/CXycR7vKlW8nVzwsmGmmNYkUwOrND7ic3eMqghujHS9WbPdsDLV0TbTwz9ZVz3lxDH3g/53i5cKa9H5ReNK8JYdrYa5uD/SeAyAHXBSLGkpZbUHXG+RVAypX5l98C3Yqg0WTqFYHEAzRzp+qcx5dDWKJv1ptqy/jJAoBeCHxOCfs7H2/9Fbfv3gBHusGZDH43hcCHHlNd++PqwjxIcGX0pFqDOTREFctikK7uGCwBC0FyKm/HAAmQ/6MtugxO1rfuD1Nz4NzI/S4P42pgwW+pyDqBSLNdVcG6v14980Az0JMeWTYNEjmZtlrKG8jU6yAAd7juaBe3kpJFhJRGk/4tpMPNZRLSL1VCFRrP3EYZZC7GZZJeMfdGzef2BehFWteLLVr3+CJ8m+12h/+eijpJkj5G51uGovxfB23tiS1bn1QUezwByBGV8poxKC7ct1qeaxFt7w3oWyRVwE1iLOynA5F8D7Q7SiEApaTfOtebHNz3eDHZbMF05MNJvfDTucpzkcEwNlJBiov08KdAuk/P/v8WQVyrzZI5E3awWHc+9dqXZrjtPlF/9ZefqzUxV8W3ePKDEzxxsiUcb3yTmKAwDdG8A+UTAp69c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(346002)(376002)(39860400002)(396003)(478600001)(966005)(26005)(53546011)(6506007)(6512007)(41300700001)(71200400001)(186003)(2906002)(6486002)(2616005)(7416002)(54906003)(66476007)(6636002)(4326008)(316002)(5660300002)(66446008)(66946007)(66556008)(64756008)(91956017)(76116006)(38070700005)(110136005)(8676002)(8936002)(36756003)(31686004)(122000001)(38100700002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cklIbFRsaUhCSzN4R0NhRTJHTXVrTkpNcnJCc1E3UXhKYkROQ1RQQXEwdGxR?=
 =?utf-8?B?SUYrY2RuMStjMEZGbVUyMCttUWJrdGhwblpXcHVkNGlKN3dtSnh0VnpkK1pV?=
 =?utf-8?B?VGtHU2c1QXhhcWNhN2NGQ2tnWmxqQkVUK2JPY3VzQjViQkFyUE55VWd3cUlE?=
 =?utf-8?B?Nk40OUFVN2ZYNGxnVm5xNGpFcFlNbzBnNHdaVEpDdC9adGVlZjVhOXdMM2Zx?=
 =?utf-8?B?TVpIc0pPZFVvNnR2MHZXYUhEQ0psRGdJaDJ4WG1uZ1N5c1pIV1pqKzVkanZD?=
 =?utf-8?B?T1JXSzJGS21aQ3FXSWR1ODZIT2NJZHFiVWJlb08xMXBYaDFxdmoyYWJ0M1FD?=
 =?utf-8?B?Y1EvQkRkcCtMNlJYalgvTHN3elc1Ymp4ZDZleGtWdDEyMUl4c1laSTB5WDJt?=
 =?utf-8?B?aFNYRzdKNEl0d1JEaHlYdTN5SlMydDV2REU3VGE5Vks5MktIUHkwOUxJVnBY?=
 =?utf-8?B?a3lLd2hpZFFvcmF1MnFFejY3QlBZQUhUek5iNUo0SjR2QXBwanRleXcwYTZl?=
 =?utf-8?B?TGh0NmU1Znc5Yi9BUGhVNUdYTFRpTlJYTUxpZ1FqT2d4RzR1czdaMjFqWGw4?=
 =?utf-8?B?QUtVMlhpQVlVc042aHE5aGkxYkhXbzFJKzBlK2E2bHpIU2grK3dpWlZHZjg2?=
 =?utf-8?B?QzBlaU1HRFQwVTVlY3Y3bWRYVzh5ck1KUzl3bnQ5aXRrcklTNFplQUhtcTFM?=
 =?utf-8?B?TGRwa0owaEpPa3NSdnk2cFQ0V2xaVUs1dU16OFhrNnB5QzRmRGhUZWo5TjU0?=
 =?utf-8?B?cy9weTNraW5FN3NNN29lUUtmQ0hJbjVKdW9XcUZ3Z0tiYnFmWklNZjFPQ2dS?=
 =?utf-8?B?Z3NsQk42eWM2Z1NPMkdoVXpLNTFNUllrc0Ridjl6VUdoK0p3OXZKdUxOT1Ba?=
 =?utf-8?B?VlJCM25ZWm1VTk02R1R4ZVVaS2pwV0E0K0MzSmNybXJhQXRBSFlkYUY4Y3dQ?=
 =?utf-8?B?YjR0dmdHUW5CNklEY2lNL2NGR2xRa3NCL21WRW1WYnR4TWJ0NkgyZC9oa3hB?=
 =?utf-8?B?ZHNhVjlFd01rczV5VjhNR2g1R056MElsRjB0Zi9pSXNDRGh6RmpDL0FnenFD?=
 =?utf-8?B?Q0tpa2FPdUFHMStnMllVTkZoK3BDZXNzcUY4Ty9zLytCVTBJZVNXclozU0JP?=
 =?utf-8?B?R3NsZS9USitlS3Q4NGtCcnV4MncrVEpLdVVESjBua1FWUk10R1NRYWpIUzJL?=
 =?utf-8?B?T3c1RjZ5KzJ5RDJ5MW9JQzBzWUV5QWNZUTllclo0emtLY0JaaXBYbUlZV0xu?=
 =?utf-8?B?c1oxbHVKc0c2MEZWYjlTNmVpOVp2YTViRGtVVHhVemNUM09mUDhpN0J1U0xK?=
 =?utf-8?B?NHBtT3pBVzdrS1JxOGVPM29JRlRjM1NubU1YV1pvN1REWjZra01RaSs4TGcr?=
 =?utf-8?B?RjRaME91cTE1Njh6YTAxRzZUeWFLY3lhMWR3Z3Rsd1NsL3dUWXV6d2hkRTNY?=
 =?utf-8?B?MkFacXljbmtZaWFhYU4xK2gzaEQ0YzZzam0zZzM0NFo1VFBWTXlEZlFSVWY0?=
 =?utf-8?B?TlUwSUl5ekpIVG5hWVRvbzV5bHh6L211UWdJMnc0T2haMU5lZ3haWEV2ajRD?=
 =?utf-8?B?NzcvNTA1SGREa3hvcTZaeTV0Vm1hWGVJQWpyczlrUEh5enBvdG5rY1hhb2xR?=
 =?utf-8?B?VGl5N3dtTFptT1prNDNvVlB4S2MxUEVHMWxYWjRmM1FuNnlMZFZoTXVRcG8x?=
 =?utf-8?B?N3NCUTBZYkpBdlhKZXlNb1pTbjBGMElIMDB5S1ZpK29mV3JqMTVZSDlTUGlt?=
 =?utf-8?B?ZHFtam5pZjlvVTllY2Vub2xSUlF5MW02cmEyZU5CYmdXN3M0NVRSb1EvdlhI?=
 =?utf-8?B?MGhqWElDVkJhNkUwSjZ5Z0JVcDRmWHNwT0xRUWlJelNDOUdEM0dEZDZQb1pL?=
 =?utf-8?B?R04yZEJ0MHZvRGRaREwzeTAySlQydjk4Z3NrRnpYMG8yL0FzTG0zVmY2MVZL?=
 =?utf-8?B?dEZrdVJRZVhmS2kvUklqYXVYS2RwTTFveEx0UHQrd09OVHNKT0xFT05UTXgw?=
 =?utf-8?B?dHpTR0JFYzZVSmF6Y1I1U1JETW95WUdsM1g3ZlBKZmFiN2RXWUQ3VGQ3bnpx?=
 =?utf-8?B?MGw3S3VDUy93MGNxTmQ3VjRXbHY1K3lJbUdQdFFuL3JBa215STQyUEM2bEVm?=
 =?utf-8?B?OE9MS3BSYmwzN0NiMGtDZ0RZUUVPMFVVdExLTjB6WDc2cmRsN0xTVWpWZ2xY?=
 =?utf-8?B?eXc9PQ==?=
Content-ID: <ED88B1B28DC92D4A8F09F866385A0305@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5d42f7-e443-43cb-bcb7-08da8a9befa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 15:25:57.0901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pk4d9h2jWGRA19wGkSkmW022eIK4jpavJlqmf2z9ZKIemiIOUITtcvjxoxzCzLwRnQawXUacgMvitP369+oeJZw1qqn/mQ3HJwypb4h0tqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3465
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_082608_414384_5F7EBE68 
X-CRM114-Status: GOOD (  16.09  )
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

On 30/08/2022 15:37, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 30/08/2022 13:17, Conor Dooley wrote:
>> Add compatibles for both configurations of the Aries Embedded
>> M100PFSEVP SOM + EVK platform.
>>
>> Link: https://www.aries-embedded.com/polarfire-soc-fpga-microsemi-m100pfs-som-mpfs025t-pcie-serdes
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  Documentation/devicetree/bindings/riscv/microchip.yaml | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
>> index 485981fbfb4b..04ebd48caaa7 100644
>> --- a/Documentation/devicetree/bindings/riscv/microchip.yaml
>> +++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
>> @@ -27,9 +27,12 @@ properties:
>>
>>        - items:
>>            - enum:
>> +              - aries,m100pfsevp-emmc
>> +              - aries,m100pfsevp-sdcard
> 
> Usually sd card is pluggable, so what is the actual difference here? For
> example this one:
> https://shop.aries-embedded.de/evaluation-kit/m/m100pfsevp/445/m100pfsevp-250baab
> has eMMC and SD card...

Yeah, both are there but it is muxed by the bootloader using a GPIO. For
icicle this is done by a mux in the FPGA fabric instead. Tw dts were
needed so that the gpio-hog could be set correctly. Out of curiosity, I can
have the same compatible in multiple devicetrees right? In that case, it
would just be "aries,m100pfsevp" here and I could put that in both?
Would make things easier..

> 
>>                - sundance,polarberry
>>            - const: microchip,mpfs
>>
>> +
> 
> No need for line break.

Gah, that's a silly one to miss..

Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
