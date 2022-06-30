Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E92C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 22:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OLtKMcbbiGzmQNwWFhqMZuC3ThZtEPWyVSI78WgcpPc=; b=ni1FhW96LZWa7x
	S56aaErgPqQBQYa5URZnRya8JlqwC+vM2832WuTeua0anxrGlpsLpJw7n+HKmNNiVg5oY5o/e03ZI
	w+9qE0gcs9osD5Bjy5P9caWEJ3zQIlqFVF5x6EdrWKkFYrvYVcgb9Osu0MvD+GDw17FKGV0aBMHy4
	6E3hzpwpwrD/tk1bcEvtCTml4KZzSbudjLde0RDnOyjIBUJHKSsOb6+e2Mht0Fi15CZpeKNvx5kOE
	9M3n2UIcohN6oODeg2oZPDnzAlCefyC0g6+bc6XQA+DxZBudEu/LGc6QLLRcEoQ6q4P/aqfE51P9K
	urnrIRp9NsAUMMRQ1ZhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o72Kc-001lC8-Fj; Thu, 30 Jun 2022 22:08:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o72KP-001l5w-GN; Thu, 30 Jun 2022 22:08:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656626881; x=1688162881;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/F/0liJCEPwiLG3dAjfAqLm3SACsi0eCwJfaAudm8f0=;
  b=IMxGoIXU9OMuQhstrWbm6MTqIWSW69FOpIV3j0Rt77cjMLYc18yflp7Y
   w2x4fEVfGOFFtTi+hxhTWl3siZCqHJy4SbgCs2iXnPC8K3JvhyzEvAWrC
   R1A1lzdazvPzC9MKgaViphZlZ+ARwBtcaaHPn11ow4vUj+rHk0WDb+9JX
   k2GzgFX4E78fPQDcq+FFzgdgFKfEy3H33TaGCObzXZZikmi/zWmSSLE4f
   F8WxdG+3tYFEk2O0W40uIv6mCL4w4fkltPI4voCk8rXHEktuSDiy1jtRu
   S8a4aUsQyn0ZDa4YgEAtzFC1UOMt/Mt0G0QcHTpgJjRJRYmhZvByshriN
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; 
   d="scan'208";a="165918206"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jun 2022 15:07:57 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 15:07:55 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 30 Jun 2022 15:07:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmlqXOxRnSBeFCqAxdJIG9iOp0O9Pv9066mNgzmSvHyHF+iEKaSzeYWdIPOWEezXg4lg6tJu8alN7pC5lJbBgjtDdbqd4YPRxD+ssOmfSmgUXQu/vT2z+fitYvv+SmSwLm6flHgq4Ae6u/Zc1ZiJimLRs6ffObVNvNRV0F8tBrKIqFjUZmWIqNUOu0hL/IN63r8ijWVZQ6lUTIaOIlmqUSi4AvMjaH7G3k88ss488Lw2QcOTD8A5UjMdCh6Tb8ORLju/8FQbgjfkUIr9JEzWgCmvNO3Z5fUEKf7AyXoIW8n7x06xPJ3ICTqy4tIIC2Vdu1bqcPDbxPehbUCuUQDEGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/F/0liJCEPwiLG3dAjfAqLm3SACsi0eCwJfaAudm8f0=;
 b=S+NNiIc/P9bwqn/SAcFgf8ILX2Ow1HVyBFuW5UGVnTKgAgfscGB5CrVSkeoY58+gzcSTn+ftfj6ph6Y1RM8fIdLgaPM+4b2fI1iobrLkjRD9LNQt2irKqkPblNCupVEpgmwf63/P8B7LdDvhdpChqIBKHX4AIV7H0lla2pvx2xmbJIz/GFwS0kFKR2JM+8zsp+BtKdu9T9+SVheqhA7K9SMBydxeQ54hbD04DcJ9xkb0yDSjQaFNhwoScCVbxnR4E/oMLSg7CnHCXHEWDD5XBqOXtax36igqaQwrjAru5uDK81s6+D6xQFQhh4b4cVJsnqr9mhlPAKJUnpy6D+mzKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/F/0liJCEPwiLG3dAjfAqLm3SACsi0eCwJfaAudm8f0=;
 b=R7GmSj1O8S+y2Tcg5p8ge+PqVRG9QpDEAGBygrxcQoiZRcd2moYoIiN4ljjV5iVEerpVybrLAzhx4lREDmgyOVMJ6P4if9et43xf9Mpd+3cEy2ncLOQVCRV3Ctu0JJkzXVoarFOCT36qSZmLrskTxZZv5ALYEr+shtfAWB6CAZY=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CH0PR11MB5441.namprd11.prod.outlook.com (2603:10b6:610:d0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 30 Jun
 2022 22:07:49 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.022; Thu, 30 Jun 2022
 22:07:49 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>, <Conor.Dooley@microchip.com>
CC: <linux-kernel@vger.kernel.org>, <gregkh@linuxfoundation.org>,
	<atishp@atishpatra.org>, <atishp@rivosinc.com>, <vincent.guittot@linaro.org>,
	<dietmar.eggemann@arm.com>, <wangqing@vivo.com>, <robh+dt@kernel.org>,
	<rafael@kernel.org>, <ionela.voinescu@arm.com>, <pierre.gondois@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<gshan@redhat.com>, <Valentina.FernandezAlanis@microchip.com>
Subject: Re: [PATCH v5 09/19] arch_topology: Use the last level cache
 information from the cacheinfo
Thread-Topic: [PATCH v5 09/19] arch_topology: Use the last level cache
 information from the cacheinfo
Thread-Index: AQHYikaSsliGXUqkU0W62iFZL9A2pK1mrJEAgAAIIICAAAargIAAEAyAgAAEPgCAAAqJAIAAMFoAgAC8ZgCAAGP7gIAAEAqAgAAdSoCAAA0zgIAAAdqAgAACLICAAB2mAA==
Date: Thu, 30 Jun 2022 22:07:49 +0000
Message-ID: <f5d73b6b-081e-328e-6599-92e8abadbdc0@microchip.com>
References: <f1f4a30e-7a84-30e2-197c-4153b3e66b64@microchip.com>
 <20220629195454.vbsjvcadmukiunt7@bogus>
 <03433f57-04ed-44a9-a2f6-5577df94f11e@microchip.com>
 <b2ab0ac1-bfef-5ba0-4ee5-15e604d8aa2e@microchip.com>
 <20220630103958.tcear5oz3orsqwg6@bogus>
 <9d9e80b8-17e2-b1d9-14fa-f1d8d7dfbd9a@microchip.com>
 <20220630173513.dyrrmjbpxzi3e6fe@bogus>
 <3840dbf7-ca18-b7ab-4d7a-92c9305476fa@microchip.com>
 <20220630200717.zlc6z6zcqbsw7euk@bogus>
 <ddb8238a-003e-fe5a-2a11-cb34c324fb33@microchip.com>
 <20220630202141.37p5qhppkiz6wrcb@bogus>
In-Reply-To: <20220630202141.37p5qhppkiz6wrcb@bogus>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83e4ba3f-2b8b-461c-b200-08da5ae4f880
x-ms-traffictypediagnostic: CH0PR11MB5441:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BGH43PkoqEs0/d56HNA9SvuwDK+6CHLJRWKh1WqMwwU5z/6RbEKUDeaGxxcG9pMiKBnoqpq896Uu2M2SPTc2WFLQT/S2FRAkQybRXrKKva2u3xaAA5kTf9eTGZpoKcdOfYBlh4mMbYtg8KeDcwMVgRxksdN/3AjUL+XaMyeriUrYZDMHttns+Gj9UYnxosCzz4A06GZnT7LYdR3Pzg3eNSv0hFQZOvJQWWO8GjePABQciEgzb2oXCLBMcVt6tfb0VBk1DfH0wGOYM+W9ebgF5xoRGwIfzgk18j7fG8wDrUgvoyAIUhwxviAPpzJ+2U6Kiy5ReuWhOBmsE9H8v7nz44ZJpOj7d2jhvImZgVEXykjBIB8VtnP4t2V1+FHtiEJESfdEnri/09JU97wVAeU5fHPq+hag6EXMrCrOpHZKdT8QnKiF9mNFQCcsppNeT7dfPc3kdfLMQ4O4Bfiu+J2WrVoxa/vs9p3iJV8OIR1DI4EVI+RkZdAAlJTMWaE2FRwZChpuMeQAn1hNyV1mk3jjuBPX+0rXmg5YLFzouw2Fq46aGyr2BJGbuJCG40RS8popQvXaKzbrdoWD4hlAOQf/ADwYZXRhv/d2upiDSS8gKB/OpVK16ToJDyovOL0FcZ3jfG+VWulZNQ0QK3CkBlM7+jYHmGUNB15abHCz8CyD0CziMuxWjbTFKtHtTDd/yp5KPE3JhzgWGybHG/J6VtaZU9G4jFNPU/o736GunqnfoSfU3ZB+bEJH3lIsejgBponLCTX1i1VFoSpgnY7VdjzreHMjUW6tQVICAYQH+GurWb5UkkK/Se4ipLuBKMrnHJhkeFP2o5hJpxqJ+xwV8uJEgHHN79Dg/IKIJHQAmUO4XokuT+E3yO+VBg1RQfcl76eW
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(376002)(39860400002)(366004)(396003)(7416002)(478600001)(8936002)(5660300002)(36756003)(2906002)(64756008)(54906003)(38070700005)(110136005)(4326008)(86362001)(316002)(122000001)(76116006)(91956017)(31696002)(66556008)(6486002)(66476007)(8676002)(71200400001)(66946007)(66446008)(41300700001)(2616005)(6512007)(107886003)(186003)(53546011)(26005)(6506007)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2IvTFFnSnBEOHQvdnF6YzRvNjl3a3NVaFRQV3RKK0hoZ3N5VGg4Qm9UQnFN?=
 =?utf-8?B?dUlCZFFBRXFuSnlBc2dNaVNMM0g0azdLaDU1TG56TDNQSzZkMy9sYU5Cbkln?=
 =?utf-8?B?b2dJTHVxU3hOQ1h3bjFDU2JadTFtQXc3WHdrMzc3Y3Y4WXJXdWhnUHRkY0Q4?=
 =?utf-8?B?SnFyTGt2bVErNUg1ZGlBMXFEN1ZxTVVXVXdNakpXdFhpUk5qc20yNE1iTlk1?=
 =?utf-8?B?OHFLZVNCT2R3V2kxN2ErYXljVzNLeWlxZ2pLZzQ1YTZycUVsMW5VamlWUVE5?=
 =?utf-8?B?Ti9pY21RUDMzelo3ejVpQy9uc2EzM0pxTWpTVURDYVZyNDFtOEZseHhWSmxm?=
 =?utf-8?B?dGRZdFM4cll4c1YwOW5oZ3dsejdOcWwycEZSTlNSYlloQlQyRGtmZmNvTDFX?=
 =?utf-8?B?Z29aYS9EZmFmT0VpZ1hVREpxekFJVUxXRjVLOWRocUMxSWNaY0c4Ym5SeTJQ?=
 =?utf-8?B?djQrbXZTL3Y2RjBQekJEMjlDS0krdWtKMGFpdFJXdUlyVUY1bGZZSXZ3Tld1?=
 =?utf-8?B?clU1aGJTU2Vka3VZUWZFOURhZzQ2RDhnWEp0TkhNa01NS3R1WldPQXlWczA4?=
 =?utf-8?B?eGYvRm9Kc21YcXIzMEFvUzdyRnM2dnIvVU1Nb05vSTFYTDkzc2RwMXhMbnZV?=
 =?utf-8?B?aU1sS3BNc0VqNXR3REtoTHlpODF4elBsZFBSZmpUc2ZCQm5LdTBmMVhmNWVy?=
 =?utf-8?B?THg4UXZFN0tCalMrczBYbm1KNTc0cDAzbFFRZDhPckpFOW96S0VNMmRWbTBJ?=
 =?utf-8?B?dkp4dU1kZzNOdXphR2xIYWtPN3VrVnJXSXpGYldjcnNibU9RcDhkc21nNGZ1?=
 =?utf-8?B?RDBZNEN0enByVW9vUWUveW04VUx1QWRpS0hQa3lnbTh2WlBzdUV6RWplZ0dV?=
 =?utf-8?B?NkRRSU1VTTA1OFl4QXFYUm5mWGhRaWJndVJ6UDRJOWxOWWNRRzV1U1hLMlFn?=
 =?utf-8?B?TE0vY2htN2hjVlhlRGQ4aFNEVFNwQTh0TGFQdU5PT3RQSnhFV1dIb1ZRcHhF?=
 =?utf-8?B?M0xxNmd2OXV4YXhpajhCMUs2eTdaUXMvTHRlTFdlaHladzNreUNvRVRDaVA3?=
 =?utf-8?B?QVhFUFNYbFpWUDU4Z3JzaUNJRDBkS3pBWjYvS3ZnVFd2aHJxcFVHSk54eDAv?=
 =?utf-8?B?dnNicXMzWG9UeEZpbmZqMFpnQkZBWEtVeG1pR2R3bmRtemR6QW5xRThCc0Qr?=
 =?utf-8?B?Zk9FTE0wcEZ4WUJQWTlGREFhbHZxR1NEdG83RlBROXhjeVNUOFJPZm5VVG1j?=
 =?utf-8?B?bEh3b1c4STRNQVp6L0tvdml6RnZIZTRmS3BYZWRTY0ZvdTJ2bUE3NUEwOGk0?=
 =?utf-8?B?akl3V01ydTZBdzFVWTJ6U1BwZVNBUDY3UFlyQ1k3VkhJbzUwMmNWekl2Tzli?=
 =?utf-8?B?OTAwQk9PeVZCTFdQQWxleE5IVjdJYnRTL2lmV2x6eUhIcHJIdXNXckREci83?=
 =?utf-8?B?NGxOZ3FTM2NCT3F5cW1TTWMzaGMvSk5UZnNkcEdSQk5wOWI0SDk2anJaTC9t?=
 =?utf-8?B?M2Jza3NLTVJsOCsrVnlpcUtTV25ld0phUDVNRkRYcXBmWEFyYlN2MTZEckJU?=
 =?utf-8?B?NFJzTk1TT2dCUlcwTzBySS8yVWJWaXhQNk5Zb2RaM3lLTDJMS21RRUxjalhB?=
 =?utf-8?B?Y2dxWmQ1QlNUZEdNSC9vOU82ZytzbXpuMTFRR3dNMFpQaS91aW1vbTNURFRv?=
 =?utf-8?B?cFUrSHFyL1NBdCtDMHlsUUJkR3pOQTlhNHovZ3hxU1VqTy9QdWd3OGxmS3lO?=
 =?utf-8?B?c0xYYUpRcCtQOUNmQmJ4d0pmeWEzelhCS1RDNzZyZ3hFUXlQL0NrWm5va1R1?=
 =?utf-8?B?aUVkWXhKdUpnQWlaZ0FyTjhFbmZXd01NcldNMmlDa1RGZXJtYkQ2U1dwZjVC?=
 =?utf-8?B?cW5sZzJoUEVwd3doUmd3akwzdUlaZ3BiT3paL2tzQmZrZzRMaHNJS1RXN3RO?=
 =?utf-8?B?ZGFrS1EvdzRERk5iZGI5QkljTHhzZnQyZ3NoZFV1Vnl0ZkNWdXJta00ralNv?=
 =?utf-8?B?Zjh1YkNPYTlyb0MybDVTZmFWNDFUN0RTMlVjY2d1cW5vNmNPUW1JY1BsaWZk?=
 =?utf-8?B?bk50ZUJxM3FVb2daS3lkTHNZaTJqbG43dWZPem5haWd2RVR5Tk5HTnJJQ1Av?=
 =?utf-8?B?a1V5UlFXVVU1ZnJOcHp0eEh6bU82UXlFTStCL3dDUDE3NFNvZlBUczRVVnF3?=
 =?utf-8?B?aUE9PQ==?=
Content-ID: <E7FC5F3ACC13DB46BCA95690E998A564@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e4ba3f-2b8b-461c-b200-08da5ae4f880
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 22:07:49.3948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EvwKq3Olm8d8CO7t9saiKFO0WkRtV5QHmdBtFnnJCwrr1a2lDpKmEFL8L5EKDDVym8mYWwvfcO3niE9x3oR3sr1+5s0cTMVZzV1jx0nnOoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5441
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_150801_856735_79987014 
X-CRM114-Status: GOOD (  18.17  )
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



On 30/06/2022 21:21, Sudeep Holla wrote:
> On Thu, Jun 30, 2022 at 08:13:55PM +0000, Conor.Dooley@microchip.com wrote:
>>
>> I didn't have the time to go digging into things, but the following
>> macro looked odd:
>> #define per_cpu_cacheinfo_idx(cpu, idx)		\
>> 				(per_cpu_cacheinfo(cpu) + (idx))
>> Maybe it is just badly named, but is this getting the per_cpu_cacheinfo
>> and then incrementing intentionally, or is it meant to get the
>> per_cpu_cacheinfo of cpu + idx?
> 
> OK, basically per_cpu_cacheinfo(cpu) get the information for a cpu
> while per_cpu_cacheinfo_idx(cpu, idx) will fetch the information for a
> given cpu and given index within the cpu. So we are incrementing the
> pointer by the index. These work just fine on arm64 platform.

Right, that's what I figured but wanted to be sure.

> 
> Not sure if compiler is optimising something as I still can't understand
> how we can end up with valid llc but fw_token as NULL.
See idk about that. The following fails to boot.
index 167abfa6f37d..9d45c37fb004 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -36,6 +36,8 @@ struct cpu_cacheinfo *get_cpu_cacheinfo(unsigned int cpu)
 static inline bool cache_leaves_are_shared(struct cacheinfo *this_leaf,
                                           struct cacheinfo *sib_leaf)
 {
+       if (!this_leaf || !sib_leaf)
+               return false;
        /*
         * For non DT/ACPI systems, assume unique level 1 caches,
         * system-wide shared caches for all other levels. This will be used
@@ -74,8 +76,12 @@ bool last_level_cache_is_shared(unsigned int cpu_x, unsigned int cpu_y)
 
        llc_x = per_cpu_cacheinfo_idx(cpu_x, cache_leaves(cpu_x) - 1);
        llc_y = per_cpu_cacheinfo_idx(cpu_y, cache_leaves(cpu_y) - 1);
+       if (!llc_x || !llc_y){
+               printk("llc was null\n");
+               return false;
+       }
 
-       return cache_leaves_are_shared(llc_x, llc_y);
+       return false; //cache_leaves_are_shared(llc_x, llc_y);
 }
 
 #ifdef CONFIG_OF

and this boots:

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 167abfa6f37d..01900908fe31 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -36,6 +36,8 @@ struct cpu_cacheinfo *get_cpu_cacheinfo(unsigned int cpu)
 static inline bool cache_leaves_are_shared(struct cacheinfo *this_leaf,
                                           struct cacheinfo *sib_leaf)
 {
+       if (!this_leaf || !sib_leaf)
+               return false;
        /*
         * For non DT/ACPI systems, assume unique level 1 caches,
         * system-wide shared caches for all other levels. This will be used
@@ -75,7 +77,7 @@ bool last_level_cache_is_shared(unsigned int cpu_x, unsigned int cpu_y)
        llc_x = per_cpu_cacheinfo_idx(cpu_x, cache_leaves(cpu_x) - 1);
        llc_y = per_cpu_cacheinfo_idx(cpu_y, cache_leaves(cpu_y) - 1);
 
-       return cache_leaves_are_shared(llc_x, llc_y);
+       return false; //cache_leaves_are_shared(llc_x, llc_y);
 }
 
 #ifdef CONFIG_OF
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
