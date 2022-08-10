Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB3DC00140
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Aug 2022 19:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fSiBF206Pz121xuP3oSD7HON9Pus3PG7CY8pJ9Vunh8=; b=PjBGaR60i93CR9
	E7mkrKDR++Knpz3A/2gnlGzkkZRxYdJPk7K0Me7OgBHximvO6vIonU4OFgRIslytK0LsCRDDqTXhQ
	0PsC1SPfxJJ/jjdWDdk1N2ayiOE8J1Zt7KrcUvi/nGaCP4500GOZVZaRyI5aURichacEcEnfGHeVz
	DitjMoQdcyft0/3QcHPzGvi8FpWCE+kC85Uk1sj2PTDZe0W+hiTQNyB6BjZsRePkBIMvv4TyP4iuC
	7ugtmUwA2Ovp3K6gPris7RMhZD7z/HO8+IYN9hXgnSAZiUM/OjREqp0kUFgDREV3HZb6yfCNabNdG
	h9gqbOASaFkgYNSUv3hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLrcX-00EJyb-TC; Wed, 10 Aug 2022 19:44:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLrcK-00EJmx-Ng
	for linux-riscv@lists.infradead.org; Wed, 10 Aug 2022 19:43:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660160629; x=1691696629;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=kc6E5/pmsaVoK6OX+RyG1rzQITapgiydWjP+gvVIjiE=;
  b=NL7HUndjtZjGWB28IySLU4/KVjhLp+TU0z91g9ZopaHcQKWRZReNY83L
   rFq/jURP0Wxofx5PdJVK7kjo5cP8D706xHHMSoYDwHk/BgiZhLoy1eySE
   D0o7MVG+Gp1gxG+1TM9WddPUj5MDpmOML7K20doNhjph4S6q50zT9a6V4
   oFj7A6RQziSrSRj4bHWm9or7IA0abYal3r47KS0kzzM8y5XAoM1VHaebt
   0sVUl8G3pUk88kwHtvbTy7usB2upiI2oAsWXFW658oYxgumdwntt8ht7J
   pei571ap8rmv1w+zq7mCIM57d1BMwwivKV0cDE7Ut64AqnjmXSE1DiNb1
   w==;
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="175745557"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Aug 2022 12:43:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 10 Aug 2022 12:43:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 10 Aug 2022 12:43:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UChzfZQAuzp+P42Hm33lD4TaVby0eBM7gPEiYD5Yrc1eogcdRxdUA17V0PDLQ7MWP4lq+w6DSrEmg/T0TEagQvJ5zLLnauPOIx3BAKSrLQ1SQFOHWbJK5jH7X16RH0JqQQ1AsaToraWsuP44GfWNa09hV2eyvzBCBs39eZqis5meSsN+zbeJV9xJhoTdp2XBtDFxP//mG92+tkEc8dvka2Bvd5SZ4fl5m+1nnjf3UrFnevO77aeU6u1OoUtJHOHK9kHbec6w1g7yE4ia6KT5fW2MNUuoz+tgjcD4x9riSzbKpTv7AWVJjnp/3kEJtVFCA2mVin1UyP/CTMlT2xWxWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kc6E5/pmsaVoK6OX+RyG1rzQITapgiydWjP+gvVIjiE=;
 b=ia4pu3Dci70lH9qHxsYk9fTFQProLgYrgTX4nGgVnKU4qZQZIRWNBIiz/qhCPM5AnYo3wUnqkj7mVuW2yusxHB8NJyDFtBOjCGulDqfHOsHdZcIToUPBNbJulwq6s3skXaZBlTTLX3UeHVN/WaL3pGz/aiju35ynobziDu/BoynNSEkYc8O5u1iXWQ0rVijeium2prWyOnspwCpXdx4IipWHlHVr78DFBz+gffw3i4guHOpe1dFm4wIfIpebwHGMHA2/O1lm3/7FpHrLLmBvL7CoT0LdgQfqSzgkAQNm6TlkfG2bHtT6vyrG2/RSbytL5ooGKAWe6t1G33dzYBOx/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kc6E5/pmsaVoK6OX+RyG1rzQITapgiydWjP+gvVIjiE=;
 b=GqW0DbgT+IJl1hBr3evJvhC/QK/+AuhnccSsfkB3a6crDDng2vg1TimeAzi3eJrgF4vW6Pgd6aGlc1v3r+//yO8LqLxrB5+MLM3eJXShYtFDxjMKOwUg36AbppPMZ7y81bjN0cDVk059ddwNOfVf05yBCTW+SlED5r4f78qldP4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR11MB1609.namprd11.prod.outlook.com (2603:10b6:4:8::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.17; Wed, 10 Aug 2022 19:43:38 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Wed, 10 Aug 2022
 19:43:38 +0000
From: <Conor.Dooley@microchip.com>
To: <nathan@kernel.org>, <Conor.Dooley@microchip.com>
CC: <ndesaulniers@google.com>, <llvm@lists.linux.dev>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <p.zabel@pengutronix.de>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<Daire.McNamara@microchip.com>, <palmer@dabbelt.com>
Subject: Re: [PATCH v2 00/12] PolarFire SoC reset controller & clock cleanups
Thread-Topic: [PATCH v2 00/12] PolarFire SoC reset controller & clock cleanups
Thread-Index: AQHYj5/vIrxOVV1EL0SoHOsgiQHkyK2nacwAgAFM1ACAAAaZgIAAA0QAgAADOwA=
Date: Wed, 10 Aug 2022 19:43:38 +0000
Message-ID: <3d2c56fa-8245-4992-2074-cd39677c2b3f@microchip.com>
References: <20220704121558.2088698-1-conor.dooley@microchip.com>
 <bd14f1a2-750d-2511-df0a-85a9f5925f84@microchip.com>
 <YvP/bjh+wXihlrdG@dev-arch.thelio-3990X>
 <fc470bf4-33bb-d67b-3860-3ac775982f27@microchip.com>
 <YvQHtGObJwyBKGCQ@dev-arch.thelio-3990X>
In-Reply-To: <YvQHtGObJwyBKGCQ@dev-arch.thelio-3990X>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93cb06ad-cbb4-490b-4fb5-08da7b089f2f
x-ms-traffictypediagnostic: DM5PR11MB1609:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V2zcgCU8pVkW+rnXigbDSd3vLF+RfX8uNpPtHmh6VlEPPcA85l6Njt3EsViVediZqkIWobqonM5rExsKfXm6R7uqIkDeoGoHPCAv12CubwXfqWBho90dGgCy3B55CwxHzFIYmQnN9oDOtt7dOlDA4g73VAarX7W5m9aWOZb20mZj3xJIeLjfZecYpYVSo6Mlsxr+yl+qUloRBWO9tcL5KwAgAiGOP2t69/WHlHwXubAMoQTywdldXsgnc+odybJ9b3k96JbSNs3ftLlwADlONanDWLW11UnoEdbJYTR9bmYeycar4q3YpP/feODqcvEP5W8s/yo5uzWV67gRMW3VGL8AemxvIV/fSFbNUSsnxg0tEk5LqV1JHXcYS/JXL88KrDPrsOpWr4gw2ictFdThrDrU8mLQb2JJ8Dc1TSZROBz6rxx0QuR0mcx+IvAY2OLYt0WnTtASysZnxsmxhrSVxwcfV0axkui+ZgaejKuEaf7ZQPrIcARRRF1GTwN8/MrLaLd79KFLBWitLo4I7pZAhE3zRtkf419YVzvDahDJ7SPUwqezhhnIPGusDNR+K1euJBqsBYFVWq8zgvkxDkoPiBuFvwqV37WfFNbbb+7+Rt7Ecg4uEDeHhp4iMyn1+Ei76LQ7shhtGzLhFE9pgd9jGbSd5ZiwDNSdGVIcek0LnXgXRsuPccnnql7JUcP9iQGNYW/ECaKNZL59XzS/eTHjiVza95/lE07NGgsU7AmdX2iLn9i6DtuUgJ+H8xQfzMUAltdzetXsw3vgehRZAc2pnV9UKGZMNe3E7WDwTI48LgT6X+t1gFRwrsuxQMqvw75W5mm7VHpSiI2qFjX/wnALxvFXy29CE6TrtB3dRP7xhiKFn8BR/ZQuwKVBRu8YlokwQoWSBNqISjmfBOCGl0vr5zPcAHNJ6bXTNrI6wZBijM+YvNjRj9NoXVuAf2g1kSgM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(346002)(39860400002)(376002)(366004)(83380400001)(38070700005)(2616005)(186003)(91956017)(4326008)(8676002)(66556008)(66476007)(30864003)(66446008)(316002)(64756008)(5660300002)(76116006)(36756003)(54906003)(66946007)(8936002)(7416002)(110136005)(31686004)(53546011)(6512007)(6506007)(86362001)(6486002)(478600001)(26005)(41300700001)(966005)(71200400001)(2906002)(31696002)(38100700002)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjY2Q2NianU1NU1JRTU5MG01U3ZWaWpTRDlUSGFHRFVMdkVJQVRxeVJSZWY2?=
 =?utf-8?B?cUp6UW9jRU8wMkxzSGs4Vi9wb0tMaVgxb291cStheEp6aUJZL0Y0bkk5aVcr?=
 =?utf-8?B?MnBaM0RBaVFzNE5OTGNnVnZOSlYwdnpkVkNEcVFwZWJUd1d0K3BHc0JTK1di?=
 =?utf-8?B?QjJhM0lVb2JhK2t0Y3dzVzEwY3JpZW1hQ2YvRjFweEJ3dkZzV0lBS0xIQkxz?=
 =?utf-8?B?WkRLOUFWaGhPM0tQeHBBbWdrWElSS01Yang2d0FGbjM3OUVlaUVsMnh6WVhJ?=
 =?utf-8?B?VGxQUUR4Y0JiUTVSOEtmQkJ5TnFMMkp5ZitzWGNNNDhhYi9wTkpEM28ydXBU?=
 =?utf-8?B?MnVmNjZPUHlzd2g3YkFxRFpadWJoaTJEVlU0aFFKVzB0RStGWmZ4Ym94UmVJ?=
 =?utf-8?B?aU1oSnBSalkvV1NJSHRXcHkrUnoyZ3c1cWFBTVpzZHVUMHhLOVpHNXZPVDVi?=
 =?utf-8?B?d1BkR0tPRjUveFRLaU1zRm1QV2RlazNMRnAwc1FXbFVFL2dHeis0S3d3bzVl?=
 =?utf-8?B?SVhkTVNqSjh4bEVEVkcwaVREVy9Zcnd6bjVOWDZxaGx5Wm1Fb0wvelV5MUx6?=
 =?utf-8?B?aUs1WWRKWGlvQUxIb0dXeS9lUHA2bElnUnlIQmxrNy83aXg2WXNCUy9MaU51?=
 =?utf-8?B?N2NEcmlDK2t2WHptVHhxemwzd016UU9sU3krbU5YWW5GMTVEazRoTHE4Vk5q?=
 =?utf-8?B?dC9xUXk1aXozS3RqQnlhcVMvblU2VTJBVWVjeEs3VlFWcTMxVkdNLzNiL05l?=
 =?utf-8?B?MUFPOEJMUFNDaDJXdEFMNnZYdGtaeXNYTVQ2bTFMVFRYNWpJK1NXdXNpYTlO?=
 =?utf-8?B?Y0xyeUozVlVMV2d4QVFwOXAxSytJSWl2NUk1L3Ixek9MbGl4WVZJYzAzQkdy?=
 =?utf-8?B?RlNYb3Qwd0Z1Q0NhYVRKaDZMQWdoWTJGR1lzRFFqMnRVbHpaUDNlcWhZYVZh?=
 =?utf-8?B?L2hoMHRGQnd4ZXFhRTdxaUc2TzJzcGdKYlRnc1puWFBneVFnd2hob3RaaU5o?=
 =?utf-8?B?QzZ0aHAzS3VsVUlaSGozb2NUeW1kSWtKM1hsVjMwdjZBckhNNXYrR2Q0UEVM?=
 =?utf-8?B?Z3phMCtrb2VYWjgvQTdCam9WUDFDb2g2TVYyNHh1Z1Fra2N3bUhQZm9DUXI2?=
 =?utf-8?B?VktvTnp3WFFpWkY1T2Zxa2lKWC9nd0l2S1l6YzNDVjNFb0hIZEtFNk5PMW9k?=
 =?utf-8?B?TGpkanF3NDhCSFEwVUQweEZYVEhPUjhydTVXL2lOYzdKR0NBMGZoYjNDZkJp?=
 =?utf-8?B?VmdJM2NucXZSRXd6ZnB0QmF1Z2NiT1c4ZkREMHdZZkxHMTJjbndlZ2ExK2xy?=
 =?utf-8?B?YmtSMDkrd1E1OVAzMzFvS1RuczNrSHB1YmFUSnl6SDNmMFhaRUYxUnBnaU9L?=
 =?utf-8?B?eDlrQ3dteGsydllLdnpEVW1EREduaUZyd3RZV2NXRlpRNFZoaVAxSXVXR0lV?=
 =?utf-8?B?SkIxMVRCSWppbzZsZWNJaHJ6OVpDOHFPWHdZVmdrVDZzUk5TYnRYZ25LdmlN?=
 =?utf-8?B?MEdlWW1kLzM4dGRWbTRuTFQ3OWhCcUJ1c0xMVklPWndGYmNOb3ExUld5b0RX?=
 =?utf-8?B?cGVGdk9jcnVUTDJlNzhVbFZyVHJnNmx3azNrQ09RSS93aFVJa3M1cmpRRlRV?=
 =?utf-8?B?YjdEaE9HQU05OFlQZUF3VkFBVDh0RE9mU1dBZkVac01xNHM5R2hDSVI4OU5w?=
 =?utf-8?B?L3Zyd1I1RlBTRXRGSVFrSjg3SGM4azRvSEM2OWZjeGtuZFRxZDlCNVFJNURi?=
 =?utf-8?B?aVgvM2VSL29ZZ0hoYTBEMXc0S1FoU2FwRW5MbDNMb1ZmY3oyc0dCSG9idHV6?=
 =?utf-8?B?c1l0dWNUZmpoMUJ6NTVueXpkVThnbTlDWWg2NmhscDZvejdIQzE0Q2lDcmIw?=
 =?utf-8?B?bDJLM1lKaWIrL3JmbXdBdFNZeGtOUFB2R2g4ZDNmZ0FGTE9scVFRL1JhK2E0?=
 =?utf-8?B?VjdLZ05oZVRNMkdPL2doUUMyV3o1YWZiWlA1aUVtNUV4NFAzOFcxOEpwdC83?=
 =?utf-8?B?dXhCSkhoV1QwQkNCVkpqRCszTVRMWHFWSHNXVThvMkdLbXJ4QlRaQWFUbCt3?=
 =?utf-8?B?NjJxTzdXQnk3YjJlMExEZDRLOURORUk2b3kyTjNDMS92MDJIaVdqZWtvQmlT?=
 =?utf-8?Q?cDZILvQFs+cLLWe+XaXmZkL8w?=
Content-ID: <FC2EB196A10BF948902E3985F38A001B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93cb06ad-cbb4-490b-4fb5-08da7b089f2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 19:43:38.6666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: km7FpCVWm0JJa2CuLvyBvV8z6XmDLPBXH/syxc5nhPc1tvU4Eulz/DWJWUnE5IEN+jo7O5JdGMOjl8ZTjNgmRx1BAr1VDzocV9mBl9C0Spo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1609
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_124348_866569_B4828962 
X-CRM114-Status: GOOD (  34.57  )
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

On 10/08/2022 20:32, Nathan Chancellor wrote:
> On Wed, Aug 10, 2022 at 07:20:24PM +0000, Conor.Dooley@microchip.com wrote:
>> On 10/08/2022 19:56, Nathan Chancellor wrote:
>>> Hi Conor,
>>>
>>> On Tue, Aug 09, 2022 at 11:05:32PM +0000, Conor.Dooley@microchip.com wrote:
>>>> +CC clang people :)
>>>>
>>>> Got an odd one here and would appreciate some pointers for where to
>>>> look. This code when built with gcc boots fine, for example with:
>>>> riscv64-unknown-linux-gnu-gcc (g5964b5cd727) 11.1.0
>>>> The same code but build with clang build it fails to boot but prior to
>>>> that applying this patchset it boots fine. Specifically it is the patch
>>>> "clk: microchip: mpfs: move id & offset out of clock structs"
>>>>
>>>> I applied this patchset on top of tonight's master (15205c2829ca) but
>>>> I've been seeing the same problem for a few weeks on -next too. I tried
>>>> the following 2 versions of clang/llvm:
>>>> ClangBuiltLinux clang version 15.0.0 (5b0788fef86ed7008a11f6ee19b9d86d42b6fcfa), LLD 15.0.0
>>>> ClangBuiltLinux clang version 15.0.0 (bab8af8ea062f6332b5c5d13ae688bb8900f244a), LLD 15.0.0
>>>
>>> Good to know that it reproduces with fairly recent versions of LLVM :)
>>>
>>>> It's probably something silly that I've overlooked but I am not au
>>>> fait with these sort of things unfortunately, but hey - at least I'll
>>>> learn something then.
>>>
>>> I took a quick glance at the patch you mentioned above and I don't
>>> immediately see anything as problematic...
>>
>> Yeah, I couldn't see any low hanging fruit either.
>>
>>> I was going to see if I could
>>> reproduce this locally in QEMU since I do see there is a machine
>>> 'microchip-icicle-kit' but I am not having much success getting the
>>> machine past SBI. Does this reproduce in QEMU or are you working with
>>> the real hardware? If QEMU, do you happen to have a working invocation
>>> handy?
>>
>> Yeah... So there was a QEMU incantation that worked at some point in
>> the past (ie when someone wrote the QEMU port) but most peripherals
>> are not implemented and current versions of our openSBI implementation
>> requires more than one of the unimplemented peripherals. I was trying to
>> get it working lately in the evenings based on some patches that were a
>> year old but no joy :/
> 
> Heh, I guess that would explain why it wasn't working for me :)
> 
>> I'm running on the real hardware, I'll give the older combo of qemu
>> "bios" etc a go again over the weekend & try to get it working. In the
>> meantime, any suggestions?
> 
> Are you building with 'LLVM=1' or just 'CC=clang'? If 'LLVM=1', I would
> try breaking it apart into the individual options (LD=ld.lld,
> OBJCOPY=llvm-objcopy) and see if dropping one of those makes a
> difference. We have had subtle differences between the GNU and LLVM
> tools before and it is much easier to look into that difference if we
> know it happens in only one tool.

LLVM=1.

> 
> Otherwise, I am not sure I have any immediate ideas other than looking
> at the disassembly and trying to see if something is going wrong. Is
> the object file being modified in any other way (I don't think there is
> something like objtool for RISC-V but I could be wrong)?

I'll give the options a go so, I'll LYK how I get on.
Thanks,
Conor.

> 
> Cheers,
> Nathan
> 
>>>> The boot log is fairly short so here ya go:
>>>>
>>>> [    0.000000] Linux version 5.19.0-13253-g374b508ee318 (conor@spud) (ClangBuiltLinux clang version 15.0.0 (git@g
>>>> ithub.com:llvm/llvm-project.git 5b0788fef86ed7008a11f6ee19b9d86d42b6fcfa), LLD 15.0.0) #1 SMP Tue Aug 9 22:42:10 IST 
>>>> 2022
>>>> [    0.000000] OF: fdt: Ignoring memory range 0x80000000 - 0x80200000
>>>> [    0.000000] Machine model: Microchip PolarFire-SoC Icicle Kit
>>>> [    0.000000] earlycon: ns16550a0 at MMIO32 0x0000000020100000 (options '115200n8')
>>>> [    0.000000] printk: bootconsole [ns16550a0] enabled
>>>> [    0.000000] efi: UEFI not found.
>>>> [    0.000000] Zone ranges:
>>>> [    0.000000]   DMA32    [mem 0x0000000080200000-0x00000000ffffffff]
>>>> [    0.000000]   Normal   [mem 0x0000000100000000-0x000000103fffffff]
>>>> [    0.000000] Movable zone start for each node
>>>> [    0.000000] Early memory node ranges
>>>> [    0.000000]   node   0: [mem 0x0000000080200000-0x00000000adffffff]
>>>> [    0.000000]   node   0: [mem 0x0000001000000000-0x000000103fffffff]
>>>> [    0.000000] Initmem setup node 0 [mem 0x0000000080200000-0x000000103fffffff]
>>>> [    0.000000] On node 0, zone Normal: 16064512 pages in unavailable ranges
>>>> [    0.000000] SBI specification v0.3 detected
>>>> [    0.000000] SBI implementation ID=0x1 Version=0x9
>>>> [    0.000000] SBI TIME extension detected
>>>> [    0.000000] SBI IPI extension detected
>>>> [    0.000000] SBI RFENCE extension detected
>>>> [    0.000000] SBI HSM extension detected
>>>> [    0.000000] CPU with hartid=0 is not available
>>>> [    0.000000] CPU with hartid=0 is not available
>>>> [    0.000000] riscv: base ISA extensions acdfim
>>>> [    0.000000] riscv: ELF capabilities acdfim
>>>> [    0.000000] percpu: Embedded 18 pages/cpu s34168 r8192 d31368 u73728
>>>> [    0.000000] pcpu-alloc: s34168 r8192 d31368 u73728 alloc=18*4096
>>>> [    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3
>>>> [    0.000000] CPU node for /cpus/cpu@0 exist but the possible cpu range is :0-3
>>>> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 224263
>>>> [    0.000000] Kernel command line: root=/dev/nfs ip=dhcp debug nfsroot=192.168.2.5:/stuff/nfs_share earlycon
>>>> [    0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
>>>> [    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
>>>> [    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
>>>> [    0.000000] software IO TLB: area num 4.
>>>> [    0.000000] software IO TLB: mapped [mem 0x00000000aa000000-0x00000000ae000000] (64MB)
>>>> [    0.000000] Virtual kernel memory layout:
>>>> [    0.000000]       fixmap : 0xffffffc6fee00000 - 0xffffffc6ff000000   (2048 kB)
>>>> [    0.000000]       pci io : 0xffffffc6ff000000 - 0xffffffc700000000   (  16 MB)
>>>> [    0.000000]      vmemmap : 0xffffffc700000000 - 0xffffffc800000000   (4096 MB)
>>>> [    0.000000]      vmalloc : 0xffffffc800000000 - 0xffffffd800000000   (  64 GB)
>>>> [    0.000000]       lowmem : 0xffffffd800000000 - 0xffffffe7bfe00000   (  62 GB)
>>>> [    0.000000]       kernel : 0xffffffff80000000 - 0xffffffffffffffff   (2047 MB)
>>>> [    0.000000] Memory: 803032K/1800192K available (7485K kernel code, 2858K rwdata, 4096K rodata, 2181K init, 394K bss, 997160K reserved, 0K cma-reserved)
>>>> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
>>>> [    0.000000] rcu: Hierarchical RCU implementation.
>>>> [    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=4.
>>>> [    0.000000] rcu:     RCU debug extended QS entry/exit.
>>>> [    0.000000]  Tracing variant of Tasks RCU enabled.
>>>> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
>>>> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
>>>> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
>>>> [    0.000000] CPU with hartid=0 is not available
>>>> [    0.000000] riscv-intc: unable to find hart id for /cpus/cpu@0/interrupt-controller
>>>> [    0.000000] riscv-intc: 64 local interrupts mapped
>>>> [    0.000000] plic: interrupt-controller@c000000: mapped 186 interrupts with 4 handlers for 9 contexts.
>>>> [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
>>>> [    0.000000] riscv_timer_init_dt: Registering clocksource cpuid [0] hartid [4]
>>>> [    0.000000] clocksource: riscv_clocksource: mask: 0xffffffffffffffff max_cycles: 0x1d854df40, max_idle_ns: 3526361616960 ns
>>>> [    0.000003] sched_clock: 64 bits at 1000kHz, resolution 1000ns, wraps every 2199023255500ns
>>>> [    0.009713] Console: colour dummy device 80x25
>>>> [    0.014676] printk: console [tty0] enabled
>>>> [    0.019217] printk: bootconsole [ns16550a0] disabled
>>>>
>>>> FWIW this is right about when the clock driver gets loaded
>>>> as you might imagine.
>>>>
>>>> My config is here, but it's been reproduced on a few different
>>>> defconfigs:
>>>> https://raw.githubusercontent.com/ConchuOD/polarfire-soc-buildroot-sdk/dev/conf/lowmem/defconfig
>>>>
>>>> On 04/07/2022 13:15, Conor Dooley wrote:
>>>>> Hey all,
>>>>> I know I have not sat on the RFC I sent about the aux. bus parts
>>>>> for too long, but figured I'd just send the whole thing anyway to all
>>>>> lists etc.
>>>>>
>>>>> Kinda two things happening in this series, but I sent it together to
>>>>> ensure the second part would apply correctly.
>>>>>
>>>>> The first is the reset controller that I promised after discovering the
>>>>> issue triggered by CONFIG_PM & the phy not coming up correctly. I have
>>>>> now removed all the messing with resets from clock enable/disable
>>>>> functions & now use the aux bus to set up a reset controller driver.
>>>>> Since I needed something to test it, I hooked up the reset for the
>>>>> Cadence MACB on PolarFire SoC. This has been split into a second series
>>>>> for v2:
>>>>> https://lore.kernel.org/all/20220704114511.1892332-1-conor.dooley@microchip.com/
>>>>>
>>>>> The second part adds rate control for the MSS PLL clock, followed by
>>>>> some simplifications to the driver & conversions of some custom structs
>>>>> to the corresponding structs in the framework.
>>>>>
>>>>> Thanks,
>>>>> Conor.
>>>>>
>>>>> Changes since v1:
>>>>> - split off the net patches
>>>>> - clk: actually pass the spinlock to the converted dividers & gates
>>>>> - reset: added a spinlock around RMW access to registers
>>>>> - reset: switched to BIT(i) macros
>>>>> - reset: used local copies of some variables as pointed out by Philipp
>>>>> - reset: dropped the success printout
>>>>>
>>>>> Conor Dooley (12):
>>>>>   dt-bindings: clk: microchip: mpfs: add reset controller support
>>>>>   clk: microchip: mpfs: add reset controller
>>>>>   reset: add polarfire soc reset support
>>>>>   MAINTAINERS: add polarfire soc reset controller
>>>>>   riscv: dts: microchip: add mpfs specific macb reset support
>>>>>   clk: microchip: mpfs: add module_authors entries
>>>>>   clk: microchip: mpfs: add MSS pll's set & round rate
>>>>>   clk: microchip: mpfs: move id & offset out of clock structs
>>>>>   clk: microchip: mpfs: simplify control reg access
>>>>>   clk: microchip: mpfs: delete 2 line mpfs_clk_register_foo()
>>>>>   clk: microchip: mpfs: convert cfg_clk to clk_divider
>>>>>   clk: microchip: mpfs: convert periph_clk to clk_gate
>>>>>
>>>>>  .../bindings/clock/microchip,mpfs.yaml        |  17 +-
>>>>>  MAINTAINERS                                   |   1 +
>>>>>  arch/riscv/boot/dts/microchip/mpfs.dtsi       |   7 +-
>>>>>  drivers/clk/microchip/Kconfig                 |   1 +
>>>>>  drivers/clk/microchip/clk-mpfs.c              | 379 +++++++++---------
>>>>>  drivers/reset/Kconfig                         |   7 +
>>>>>  drivers/reset/Makefile                        |   2 +-
>>>>>  drivers/reset/reset-mpfs.c                    | 157 ++++++++
>>>>>  include/soc/microchip/mpfs.h                  |   8 +
>>>>>  9 files changed, 386 insertions(+), 193 deletions(-)
>>>>>  create mode 100644 drivers/reset/reset-mpfs.c
>>>>>
>>>>>
>>>>> base-commit: b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
