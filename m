Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51575C32771
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 21:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ynG1oaJfBnw2Ek4vOoFCLpG/PNveO1ILN2m8xW/bt1Q=; b=bJI11jNaulDtuj
	0A2fRFtQgqZSjVP2dF/nvk6KqI5xCoryc+ekUIWgAMucGuSRbUbl+kEtzSU2UPTDxk4PSe10RSkTN
	tigZPkMwxUq3QVszBQZulvUUmdGc1h2ca6cs0quTtjLWSOjNXNfM4BQCOaXgcmUsvKEaPKXu4tP4j
	4jvKnQgjJ3bnsxbuSTGHzETS6sAvRS1C45QJkToIWxZXnaTsbuQcjBfD7ECjoSEVHo26vWisBvaWj
	xSe+bYEuCQEpqZo9T6XjDEa+vnRiM4JFRf+WeETUS6nNdoMjutCUqJihxKJfMpYFhDqSwCHkDm9jO
	KeNf4nc33uJVBuk8lIOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYwWx-000Gd7-49; Thu, 15 Sep 2022 21:36:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYwWt-000GaT-JP
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 21:36:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663277775; x=1694813775;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=r+qJMjgs4U0tyqjz5l/QEZS/GLS9dKzs1wErfTd6mEY=;
  b=JtF/jydbotxbkJQdkOOHoLgDiOP4DwXMuf3otPcU/CtPgqV5nyg681MC
   nAdznvoAw1gPA+JMShE3fYKf9tv8f5sLDVPnha3fVx5xIQdp2pZR68Goi
   59VTbeOgF7/tLXExl8yUM+I/0pYhJKBRTBFU//QQpvf1gBf4AwhJrusXV
   D9e0cxe1ay9VJ/xfdqhvZc/0/ZQYEvYR0cUvlzZdLE+SOOxNLF7QKlLuW
   fyus/R7Yqb+TIL9N0jQ44CjqILlur0tvdhxvsT5hbyFGCDzaVIDLXd464
   ASCrmTD3En2FzDUqnPTLhstQnYMKMefdROcdp6e4+dduJ2T0ONl9lHcnd
   g==;
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; 
   d="scan'208";a="191070510"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Sep 2022 14:36:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 15 Sep 2022 14:36:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Thu, 15 Sep 2022 14:36:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQO/TRzqy904g1ykAN6e/kpUzgXjdlUI56/FPxslvcsPQdBrQIIkTkiUaPMaiupbimCX1wQ4G77/Q+sXaSWR6bcZAZ1WAPuLLVpcGi4h8Jvdl/sI1Rdnet9k1CYYQAix7o9pZL3Bn61TEqXpT7gAflKp5Zk0jmdJ5zChsNlIs/FlBqc9jIopJ5BAXAj1zmGiKfSAP4YCHflSksVrOPICSqklVGGLZPZ6E6DsvjOQFYujVQ8X76MZ8di3IkT4v3D6g58mU90WzqTadXwsZh8S1hKRxQZmCLVzZ8mJ2W6DGbogMEi7KnjcO3b2eL/Ek7Nc1NleSOjkn1h1Ph1/VNLswQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+qJMjgs4U0tyqjz5l/QEZS/GLS9dKzs1wErfTd6mEY=;
 b=QhEcVibBnVhjkOP64DhBl1OSjgty3oDNPYE4d1lcqfcWxxa7Yi/dfIiNGwtxL9TmhEXn3D7D9fHytCI5o/eGy3Yaav9d48m0hXrbYxa3A6lugEwCabTXqzs6uDqre00YiNNN5bcLGc7evLjoqJAOUkfAMZuUFRisViXzIXULhUkDQoj7dNiToEW7gEJrTfnVbbn5yhOu8gDfUXssfa2NT0ewldmL0wnNLFIXcXb7nWWlYZzzrRI+AlZaGUF0njtK2RGYMMgSuJ4kx9FRnNpoDynWdebLi02lpdRabSkIv9s5a5cxOGDP1x4+9qdbgQsaVjafBNascFKu2WesgqGElw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+qJMjgs4U0tyqjz5l/QEZS/GLS9dKzs1wErfTd6mEY=;
 b=HBH7UaMzll9TvN8P9Um8J2wZsuP4amygLseo3/nMJQ5vnlDwdhN79cXHVo3FCI6EBiTSueoJagtNLMtIzVs7OvN8D8l28OHdv0etiHV4mJRqYLw58AfNwMqQxdpFmoRgkxl9RkTbVG8UAD+mMG/S/AbS6s0ekaJs5zzKm0lpLB8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN0PR11MB6012.namprd11.prod.outlook.com (2603:10b6:208:373::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Thu, 15 Sep
 2022 21:36:02 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 21:36:02 +0000
From: <Conor.Dooley@microchip.com>
To: <prabhakar.csengg@gmail.com>, <geert+renesas@glider.be>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <heiko@sntech.de>, <atishp@rivosinc.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <biju.das.jz@bp.renesas.com>,
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 07/10] riscv: boot: dts: r9a07g043: Add placeholder
 nodes
Thread-Topic: [PATCH v3 07/10] riscv: boot: dts: r9a07g043: Add placeholder
 nodes
Thread-Index: AQHYyS+CZOOXVCviDEujy5qP/PiW3q3hA+2A
Date: Thu, 15 Sep 2022 21:36:02 +0000
Message-ID: <3693a3a1-5a2a-4cc5-fb55-f6ad9a4b3f72@microchip.com>
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220915181558.354737-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220915181558.354737-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|MN0PR11MB6012:EE_
x-ms-office365-filtering-correlation-id: 95941c96-5f87-4eae-ac83-08da97624972
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rXJWd3O8/LCxLa54ZXvjLH5ydjil6lnmWJm9kREIwlnWRMkA4Omhnvbm8jdjnX6L5lcN8061MXdW0ylf7yn3DS6IKCoYvzJvJnU5/ze2aJffcB2CAj4mesZrTSWk2PfUA7gryEO5hPqdg/utMfsaxKg5MAlgaqrnYRR+KniSh7Ip7R9ZXn63L0mys1orYGOLGbgcqchm/kGg7YmA10V8QrpIh+WabOyBQtoz8YA1eVERLwusR/gfdSjtISqAoT+Ne6mYgnRjxlvASEZrPQ21UVb/rDsCEGj0QFjcAdW1gtUAEL9z0aL3gOWQbMgAQXnmfI4E1s8KechdE9BpkxAbgB2Ep5QFYGeCt1MNNkl4EmsLL30MRitH2jXovYi8u6saf2Ihd1Vikso1uMMQna1rTVtJC3FotLK+WD40Q0gfRcIoKBTs9KdGGiflr3xc0YxUVvCXbEHAWe8sxcy6FNGH+t7Xg+3ylJ9dSM1HpbM1XHqyn96y05tZZCHZ+tQW9wkP9SBoc4FI24QNotjS1xv3svCTTA9TueuEXS+6vy3+tiW92ZVcblTC/TdEOonfKncjvb/T67IpmgQtxxfsL4pNTd3KUWeL158MenUbDK5/jjgZm7xVF+tQP1r0bfDwTcEVEtiK8L2uUoMMIyj1lRqN69nhM3/IFujF/TMG3qOINtyEdx7ocRuS02lf7aTvzymZhqwBf32xm4TVSMjJIJ1y33m4aOm90FQMHU72DL1Y//dWa7+aIU57u+S7xiEZkBTA+C8Ebsk/J7kE3Nwc0FLpgDArmXjz6iQo/QEP21kTsVV1jWxZZcU6OpqWET/UDIZre1Y6W//tTn7aeNXWKRaLrw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199015)(8676002)(122000001)(86362001)(66556008)(6512007)(31696002)(66446008)(4326008)(66946007)(31686004)(64756008)(66476007)(91956017)(2906002)(2616005)(38100700002)(8936002)(7416002)(6506007)(41300700001)(186003)(38070700005)(26005)(71200400001)(36756003)(478600001)(53546011)(5660300002)(54906003)(110136005)(76116006)(316002)(83380400001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QlZRREk0UG5nc2JuNFZrL2Q0OXRQd3o4UkhlWTJ3TEhxak5paENCb0hRSW9U?=
 =?utf-8?B?aTlqdGlRMHZEZ2V1K2JuTHQvWExKNnZsNFBaQ1BCYXpsdzFkekJzRHRSVXMz?=
 =?utf-8?B?bFh6S3liTWFDVURsaGRpRGFOMHIvdTFGazFKWHdZRFJyWVFTNHQ2ZXRjMnVY?=
 =?utf-8?B?eDdNQU9pZmFZektkZDhCTHlEaGJnVzE5ZGo0cElzR0c5TU9QWi9id1FENEo5?=
 =?utf-8?B?MXdMdE1QS1VUTFV4U2JmTEhjcXNsaWFYSmpuaGx1NE93ODkxL2JZZzhrandB?=
 =?utf-8?B?YkJWdmxzMVNpbHlMK3NFbE1WcTBzaXdndjZUZTg1M2Y2OUFlakZ2d0dlSmI4?=
 =?utf-8?B?K0pMTEdjQ1N0ZDUrVEdWM3ZKSXlFUTFsdUhxeWlLUkZjV3o1QmdkREFvU3lV?=
 =?utf-8?B?WDk5eWFvemQyMnJSQnBBREJ6VlJrRm51ZGJvQUMvL3ppT2ROZjRxVExLZ0d1?=
 =?utf-8?B?WnJYMEJwZ3ZsSWxUNDJ6UWowKy95YVpMWUdpVU9pZERnOWVjblhqRmhVNFpt?=
 =?utf-8?B?T25JTEdOU2xnUUxkQlRIVDZ4TjdKcExVempvUmFQTDZFWER3STNmOG8xSy9m?=
 =?utf-8?B?bk1FV0lEeFdGQmNDNy9YNGdQdE9KM3BMTnhLb0o1VXNXUkNLaTRwM1lJTmJQ?=
 =?utf-8?B?MDZxZC9IWVYxN0gyektvRXJsQmMwdTlQWk42SFU1SGE0K2hiaHk5VE9WTng5?=
 =?utf-8?B?RUZsUmZEN1pPUGdXOXBCcjJQU3ZUdG1pdmhVRk5waWlPWlFYcmF0TG5Xb1RV?=
 =?utf-8?B?RnlBaTdOWFl4bFM2alpEODh1d01vbGR2emlEckNlQ0VDVU0vZ1Z4dXBxdFNU?=
 =?utf-8?B?OFEvWXJ3S250Tld1V0MxbmJObm5LemZ4VndsWDFJWFZyRW5pOWl4SnJidG1r?=
 =?utf-8?B?QVZMeG4yTkxjQkwreCtKS1dXQ0hEaWRSaHFuOUVBV0RNSWphZi9nVzVpYkRI?=
 =?utf-8?B?L3lvRHRUMG83VURhMVFDY0Uzblpya1J4V1lRQnZHUSsrTGVuZHMwZHAycyty?=
 =?utf-8?B?QTRvK21CbmdVd3BnN0Q0dDFMQVdPbzVXZGVOYkVNUGsvUUtFRVBYNld2QjB0?=
 =?utf-8?B?MDZKbFZmWE0vUUorbE1IbFpyN1FKMGlNZG9yYXU0cGlOZDVJbTVnVlI2MjE1?=
 =?utf-8?B?ZFZQVjlPSWI1N3c5cmtIZjNEWElzMG5aWkJLRWZtK1FXaVZQVWhCaHRZY1Rt?=
 =?utf-8?B?OVV3MG5sT0tDRWM2eDdzNE1GU01oaEFvSFJjb3BLd3lSUHQwN2x0UlR5QzZB?=
 =?utf-8?B?Y3pFVnhPdTAvNy9xdTRyRUE3QzNNYXJXMUpRLzNnSi9NYXBvMGRVWHMrZHVi?=
 =?utf-8?B?M3EwZjJRR3lRRnp6dVQ0eVpJMitNcDVjczRPQkFpRHlBaEdybmVLV1R5V2R6?=
 =?utf-8?B?ZHFaUmVFeXlXZDNMaHBMTjNqdTQ1cjBJbnpzMVJQRGZLdktYL2diSGZHR0J6?=
 =?utf-8?B?OE9jWFloc2sxVE9Fc25Tb1lKTVRHSFZpVXloVkVYOE4vbEFNM0tMK2xJbnRO?=
 =?utf-8?B?QW9RQ1VyRmZ2aHpaTkRGQndmd1RtaFBRdHZraFNEK3ZHdkt6R2RHd01mZWd0?=
 =?utf-8?B?bnorRVZ2MVJHaHJPaHl6TVJudzh5cTg5cTMrSVR1RFBCRnR4cFhkcmNxNWNG?=
 =?utf-8?B?YzNwRG1SQXhOL3NwYUVYOWk0WU4yRWJPY1QwbWJsUHFKVUVLZzY0NUR3dkNB?=
 =?utf-8?B?YWxGRFJaZXdpdXJickdRbXROdFdqYnk2QjVQYUpDLzQxQU96ME9MOGVMOE5o?=
 =?utf-8?B?Vk0wdVpJeU9lWnYrVFpOQ2VzeVByKzdUelBiWlE5Q1N3VGtFZVpzRnBJbk5o?=
 =?utf-8?B?bWJiQWVWb2lNZEt5a0F3cHBjb2hzSFczWVU2eHZlZk10aDllcWh2NENONUVX?=
 =?utf-8?B?czFRT1d0T0FyUVNEd3FCNzJaTXlUTm9wTHVXRjZobkduQkdqQW9MeUVlWUlv?=
 =?utf-8?B?MDJVK3dJSVBMY0tYc2FzM1cwTEI5cFRHVVRVUzVlZ29pWjFSdGVKQm9ySndv?=
 =?utf-8?B?VnRGdlY5WTk0ZXNZUGhRN0RJTy9HOXd6TURiQnlJa1Y2RVJyQmdIZjU3b1gz?=
 =?utf-8?B?b0llNDNwekh6eTBFc2N5MUpJU2lKbnE1eWdabFVPdU1VbU4weTYzblVRUmpQ?=
 =?utf-8?B?QmhWTjNZMjNUMkVyNjFYb0tlaStPeTh4bmxndlB0YStpVXY1amZNWFg5bGxE?=
 =?utf-8?B?Vmc9PQ==?=
Content-ID: <35853A93384BC046898ADF72E4EEF6DA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95941c96-5f87-4eae-ac83-08da97624972
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2022 21:36:02.1187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IjZUPdTIL8JSHm22VIGx9JIDgcf48IYcIOvjU6316XjJCcQQdEE4KzfqtbJ7R1B4vo+Lc+22r1oikG09QOg6/vC+DKNn1X0tmjZ+nEMvswA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_143615_711538_70E48004 
X-CRM114-Status: GOOD (  16.63  )
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

On 15/09/2022 19:15, Prabhakar wrote:
> riscv: boot: dts: r9a07g043: Add placeholder nodes

nit: s/boot//

> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add empty placeholder nodes to RZ/Five (R9A07G043) SoC DTSI.

Can you explain why do you need placeholder nodes for this and
cannot just directly include the other dtsis?

> 
> This is in preparation to reuse the RZ/G2UL SMARC SoM and carrier
> board DTS/I.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v3
> * New patch
> ---
>  arch/riscv/boot/dts/renesas/r9a07g043.dtsi | 177 +++++++++++++++++++++
>  1 file changed, 177 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/renesas/r9a07g043.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043.dtsi
> index fb6733f3cc2b..6d9db759a847 100644
> --- a/arch/riscv/boot/dts/renesas/r9a07g043.dtsi
> +++ b/arch/riscv/boot/dts/renesas/r9a07g043.dtsi
> @@ -13,6 +13,14 @@ / {
>         #address-cells = <2>;
>         #size-cells = <2>;
> 
> +       audio_clk1: audio1-clk {
> +               /* placeholder */
> +       };
> +
> +       audio_clk2: audio2-clk {
> +               /* placeholder */
> +       };
> +
>         cpus {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
> @@ -54,6 +62,23 @@ soc: soc {
>                 #size-cells = <2>;
>                 ranges;
> 
> +               ssi1: ssi@1004a000 {
> +                       reg = <0 0x1004a000 0 0x400>;
> +                       #sound-dai-cells = <0>;
> +                       status = "disabled";
> +
> +                       /* placeholder */
> +               };
> +
> +               spi1: spi@1004b000 {
> +                       reg = <0 0x1004b000 0 0x400>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +
> +                       /* placeholder */
> +               };
> +
>                 scif0: serial@1004b800 {
>                         compatible = "renesas,scif-r9a07g043",
>                                      "renesas,scif-r9a07g044";
> @@ -73,6 +98,48 @@ scif0: serial@1004b800 {
>                         status = "disabled";
>                 };
> 
> +               canfd: can@10050000 {
> +                       reg = <0 0x10050000 0 0x8000>;
> +                       status = "disabled";
> +
> +                       /* placeholder */
> +               };
> +
> +               i2c0: i2c@10058000 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0 0x10058000 0 0x400>;
> +                       status = "disabled";
> +
> +                       /* placeholder */
> +               };
> +
> +               i2c1: i2c@10058400 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0 0x10058400 0 0x400>;
> +                       status = "disabled";
> +
> +                       /* placeholder */
> +               };
> +
> +               adc: adc@10059000 {
> +                       reg = <0 0x10059000 0 0x400>;
> +                       status = "disabled";
> +
> +                       /* placeholder */
> +               };
> +
> +               sbc: spi@10060000 {
> +                       reg = <0 0x10060000 0 0x10000>,
> +                             <0 0x20000000 0 0x10000000>,
> +                             <0 0x10070000 0 0x10000>;
> +                       reg-names = "regs", "dirmap", "wbuf";
> +                       status = "disabled";
> +
> +                       /* placeholder */
> +               };
> +
>                 cpg: clock-controller@11010000 {
>                         compatible = "renesas,r9a07g043-cpg";
>                         reg = <0 0x11010000 0 0x10000>;
> @@ -104,6 +171,95 @@ pinctrl: pinctrl@11030000 {
>                                  <&cpg R9A07G043_GPIO_SPARE_RESETN>;
>                 };
> 
> +               sdhi0: mmc@11c00000 {
> +                       reg = <0x0 0x11c00000 0 0x10000>;
> +                       status = "disabled";
> +
> +                       /* placeholder */
> +               };
> +
> +               sdhi1: mmc@11c10000 {
> +                       reg = <0x0 0x11c10000 0 0x10000>;
> +                       status = "disabled";
> +
> +                       /* placeholder */
> +               };
> +
> +               eth0: ethernet@11c20000 {
> +                       reg = <0 0x11c20000 0 0x10000>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +
> +                       /* placeholder */
> +               };
> +
> +               eth1: ethernet@11c30000 {
> +                       reg = <0 0x11c30000 0 0x10000>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +
> +                       /* placeholder */
> +               };
> +
> +               phyrst: usbphy-ctrl@11c40000 {
> +                       reg = <0 0x11c40000 0 0x10000>;
> +                       #reset-cells = <1>;
> +                       status = "disabled";
> +
> +                       /* placeholder */
> +               };
> +
> +               ohci0: usb@11c50000 {
> +                       reg = <0 0x11c50000 0 0x100>;
> +                       status = "disabled";
> +
> +                       /* placeholder */
> +               };
> +
> +               ohci1: usb@11c70000 {
> +                       reg = <0 0x11c70000 0 0x100>;
> +                       status = "disabled";
> +
> +                       /* placeholder */
> +               };
> +
> +               ehci0: usb@11c50100 {
> +                       reg = <0 0x11c50100 0 0x100>;
> +                       status = "disabled";
> +
> +                       /* placeholder */
> +               };
> +
> +               ehci1: usb@11c70100 {
> +                       reg = <0 0x11c70100 0 0x100>;
> +                       status = "disabled";
> +
> +                       /* placeholder */
> +               };
> +
> +               usb2_phy0: usb-phy@11c50200 {
> +                       reg = <0 0x11c50200 0 0x700>;
> +                       status = "disabled";
> +
> +                       /* placeholder */
> +               };
> +
> +               usb2_phy1: usb-phy@11c70200 {
> +                       reg = <0 0x11c70200 0 0x700>;
> +                       status = "disabled";
> +
> +                       /* placeholder */
> +               };
> +
> +               hsusb: usb@11c60000 {
> +                       reg = <0 0x11c60000 0 0x10000>;
> +                       status = "disabled";
> +
> +                       /* placeholder */
> +               };
> +
>                 plic: interrupt-controller@12c00000 {
>                         compatible = "renesas,r9a07g043-plic", "andestech,nceplic100";
>                         #interrupt-cells = <2>;
> @@ -116,5 +272,26 @@ plic: interrupt-controller@12c00000 {
>                         resets = <&cpg R9A07G043_NCEPLIC_ARESETN>;
>                         interrupts-extended = <&cpu0_intc 11 &cpu0_intc 9>;
>                 };
> +
> +               wdt0: watchdog@12800800 {
> +                       reg = <0 0x12800800 0 0x400>;
> +                       status = "disabled";
> +
> +                       /* placeholder */
> +               };
> +
> +               ostm1: timer@12801400 {
> +                       reg = <0x0 0x12801400 0x0 0x400>;
> +                       status = "disabled";
> +
> +                       /* placeholder */
> +               };
> +
> +               ostm2: timer@12801800 {
> +                       reg = <0x0 0x12801800 0x0 0x400>;
> +                       status = "disabled";
> +
> +                       /* placeholder */
> +               };
>         };
>  };
> --
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
