Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF03C25B0E
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 19:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HVhAdenglJM+bOlStMemIPf6ntvNcyxG6I/FLHc1IYY=; b=su1xHd0RbxDkgD
	5kNvBqJ9tF4Mp8bNc5vY09Qng08JKA6MGklSaRIrPcntAkTkBZRRdSA/5qGbDrYdwCJxcGTkQNwX1
	UD1H8KoEOs3xThIKA0K2qgDhMkz0B9V0Ke3TYZrk+QkZrBGf/UNEDZUg07eDZPVt/g6Ym1fkF+owg
	ddvaFnYFqzFE/CQ9HBkuoLYLGtwkx9weaKR3ylqhVBsf5NkJxcFiUB2J5/NyLXtCC7AG34I9G5lWZ
	3SagruIo8CWTrEwoD+l9ACkPupfRNMMwDLrAuYMQSZnXm3ccE+RxTJai6dzfTEbLjxFymZBaCQs08
	/asn+U8vQYIhCYAJJMGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNfzJ-004DYg-4F; Mon, 15 Aug 2022 19:43:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNfzE-004DSX-7M
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 19:42:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660592576; x=1692128576;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=usNUddUUWfRW5fxZ/YvPTTVtcqbBCceUIBBBTXLlnJU=;
  b=Uj2aTg5zZPXs6qXDJC6PPEIjslNntEdtpCzZBxjtzaZL6ESsb0L7AOGX
   OSrb6nQfDXAP7GPc1bcpsvK1r4Bw/Afx/mjKYrk6Ed/f+J9ZQ7Z0tks00
   TsNpvlICrHCymNIwIhQIN2E3Lim/w8I606nbu+NCZmlF5Q5ea9hE8+OnR
   EuKo1MgZpgRw4T+TA3j8K9RbllKNLdhFAkYgAXZogjPyk9DUUL2PsrjQJ
   jFdJchq7eFuvhKAcZrsuzfGY2wnbiJ+sz2O4p9TtGPz/gqMIY2ASw5SN7
   kwc6q7VL43p/vZ+1mZf0G4BGQXBYMejf19YV26w1eOzob7tRAV+KcLAA8
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,239,1654585200"; 
   d="scan'208";a="109131845"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Aug 2022 12:42:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 15 Aug 2022 12:42:52 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 15 Aug 2022 12:42:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jB/SQrps76X09kMEKlaKckLve4rLPPwDIHf+dwFXaUWw4B7uJpbSzar6QVqCmCVFcvLe2WeyEi7X6YpZZLBjPFAmGql74yL017hLOdaT89lKJ74dFA+xamVJe2mZTDByniDQsPWJa7TKX12pxWJ9gP+LAw6WUz9mluw0QRpqjPcg3qyhMAzHdMl6ObfG3i+bFoAJW6FitW6ej30My+allywpTWgosoPk9pm7D2sVaPuDfNbe+pRaVIjuv0euas4N43dN8GXJW8Sv6fLythEHKuoo8RskwGiEty9JHk60FOR6fJK7/CP5SmR0t8HTfqldIxlr5Kg6fNcrUZXvNv0uhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usNUddUUWfRW5fxZ/YvPTTVtcqbBCceUIBBBTXLlnJU=;
 b=ROIgJ3mXXPas2IfX7FlF0rtOnJ02d8v9Cwv0tYXph6fC+p3tOjpupDLgTY7FJI6V6HFVx83qcv/1KoGsf2KMUed5YKMTQEehgOZDAvftpbbjsZp+jUK8XppfO2ZMTlpYQee5LOx/Dpdk/GgBqh4Do153ASrF0MYKgfAKSSlGOLtB/dfpMMQ7vRq20LdzVr/GlGPKJ6uXcenm4+29rjo0gFfsA3b/pFoo45zRvc59TfTfvKF8vOYIGn18hdZsx69qhUF+Jjx1qH17csQ3m7M/PD/ga4D3YSs1SiiW3gD8+ofCN/oiDh8Mda8nWk+VEnj5ke5Tbrxz03XpvMLFICzfJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usNUddUUWfRW5fxZ/YvPTTVtcqbBCceUIBBBTXLlnJU=;
 b=ZWLsr5PEBYYa2qeR9508tfT4edaYtnWoUsOi1hsXZu4ga8T6b6wxDq5GexBUxiQnEvybksN/pCXBas+w4uudOiZxZE5GE7whCr4A0v9+yvBAIcx57m2W7kIczBhQMN8OGhzjcgtMYqdNxzZq4JWkBWtqXjgPAvQwCoCo2YCJxu4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM4PR11MB6286.namprd11.prod.outlook.com (2603:10b6:8:a7::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.28; Mon, 15 Aug 2022 19:42:50 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 19:42:49 +0000
From: <Conor.Dooley@microchip.com>
To: <prabhakar.csengg@gmail.com>, <Conor.Dooley@microchip.com>
CC: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <geert+renesas@glider.be>,
	<anup@brainfault.org>, <linux-renesas-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: soc: renesas: renesas.yaml: Document
 Renesas RZ/Five SoC
Thread-Topic: [PATCH v2 3/8] dt-bindings: soc: renesas: renesas.yaml: Document
 Renesas RZ/Five SoC
Thread-Index: AQHYsLn3v99KeFhKkECk1bkoK2HiZq2wVRAAgAAHPACAAACmgA==
Date: Mon, 15 Aug 2022 19:42:49 +0000
Message-ID: <ad39d430-2d11-e74f-e0a6-20ec08d13b0b@microchip.com>
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220815151451.23293-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <57e17d1e-e809-065e-831f-cdd3a8602e0a@microchip.com>
 <CA+V-a8vDP8k9c8VM++68uKjQLGURC=pe571+QrmPb+tBo0j7Jw@mail.gmail.com>
In-Reply-To: <CA+V-a8vDP8k9c8VM++68uKjQLGURC=pe571+QrmPb+tBo0j7Jw@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6345ead3-9b57-40cf-8e4f-08da7ef6562f
x-ms-traffictypediagnostic: DM4PR11MB6286:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gVmR7vEPIC+BR8byPbTIDLCbGAGtr9ObBccKU2ivk2Y6MHvAptL47BUImCpqFx2WjXVsFA/P57P94O0FyaAFeZ2Pe54ZIlvBigemv+aXjCkMP0HbMenNmfJjTOx1WHC2iAadxhWuf4iIacdGdOdoUSrjD9bLddTWd3QOGgxL+AzyPbC/s2CuT+lGeWlw0Z2X7eTPoifn4pYzRblms2WPKK73Avm5pdHgF20RX6eZwMTgRoC4XmoNBYIln8Gb2qR5m9nH5dA/UIdIYADiYZV8cDm6XiODeu/XgVSuHXs9wmPVRndwqzkBo1SNk9RgrP4Pkg8uTMGjNL+27qN6cBQYUo6+hSvXFBS3KAIXq0g7+YgcQ+5jsCsxbJQM/fse8mgd8JOxzhquvzWi+nW6Ug6J5KbitH8NBYT1OV/hNcNfDOAvv/i76fweiRP9TT9445tLxmFPGTH6I/z7vlCjYiVmFYl5HEBYkpm+ISvHni1SIJYAsvc1mZ/P4FIiyf24YH7ROFJNc52CXYBCKkEBOcTrjJC5Cy78ocFebyFX2nVMvLuC1WPdCsC50WnHY65hoICGz0Ly6UnioE4oYDC6auKT4HmSovj5vZ3vXhvmlmc5zMslLIstrYGNEkgsKciMBcRmRhxE3fhwefJAkBku+kxCgZpEGka5kyvF1tFp1qEJHhFVhZVEPVtqs+pxxBjU6hMASxaetTTGO1zuRN4+Gh9pOBwTCMcuosHolMtCiThPsH51SLwT5VGtYzK8RdCp7wrbjA21JJBVoH49/SpQ4+2IZPbtmOE57PbTlZBkz3kB6DT7RaxyxV31VJyENqH7lABQPZUn51h3mBgKTOvES42ioqFaZCc8Vw+VWuAxpRoSs9G6DLqFyA4EVxS6f2F2G/FVOYG5f7LCRtmU42ZRsY1mHA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(346002)(366004)(396003)(136003)(66946007)(38100700002)(122000001)(38070700005)(5660300002)(66446008)(64756008)(76116006)(26005)(66556008)(66476007)(91956017)(186003)(478600001)(71200400001)(53546011)(2616005)(41300700001)(8676002)(6512007)(966005)(6486002)(6506007)(4326008)(83380400001)(54906003)(316002)(110136005)(31686004)(7416002)(36756003)(8936002)(31696002)(2906002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjNRRUs4ZzVpWXJsUzJ2cEF2WkZUNVRBVDcwVmM1d3loaE9acGI3Zkc4bG4y?=
 =?utf-8?B?b1NZa1FLOVZybm9VRlh4QXRRWmtJK1JDY2NpTXREVnh1TnkwSFVmWGo3eDBz?=
 =?utf-8?B?TFFmb0VSeHR0K3JFYjExbmV1aTFFbnVLR0tFbnBiZ00wZXJreFQwN3hFQ2FX?=
 =?utf-8?B?a2x4Qk5hbUVNb0FUODhaY0VHK3BUUDZHaDFUQWRGeURNSURVMmNyNzlVNUwz?=
 =?utf-8?B?OE9YQnB0Y3QrZFFxZUxneWhEVkVHa1IvZDFtSXVNTnVSREttWnVmK2hlRmJv?=
 =?utf-8?B?RXBVb29GaWJTMFZ4MEptaHZTMFo5Q0RQMlozYXd2WGEyQkpsNmFMNlEwei9B?=
 =?utf-8?B?MDdhcUl2WHFteGV5SkpHbFlWVmR6TDBBVjBJeVRmb2tMTzg0ajU2VENCRENu?=
 =?utf-8?B?R1hjSUVndllXM0ZpRzBZcHZWMTJta1hHUG5YTENETEpOSzZXNlJ2cC9IT3B0?=
 =?utf-8?B?NHhnWjNXSWlFSzRVSEltclg3bWlqc2NQcytXeDJST2k4QnJocjJxOCtFZkJ0?=
 =?utf-8?B?L0kyTUdWbm90aitMbHF2UEUvNnVXZTE1djEyTTFUSlBzRUphMis5NjZBTDc4?=
 =?utf-8?B?bmVpUGhoTUtXNUVBQ3FHVmlSVnVWaFYwMzQ4VlRvK0VDSUFCWUxERmNDQkFw?=
 =?utf-8?B?dkdtOUNxWGZEV1llQTFmQ3J2OG9zNVdBMDJBTkN2NS84SUNDREc5SGJsWk5i?=
 =?utf-8?B?aUxrOUFhVW9Ib2VneFRRWmM1NmZVQ3BLR1k0WVIrU0ZpRE80aGlXUTVYV29T?=
 =?utf-8?B?ZWdWbkxBRzd1K0RPY2liZlkvS3hzTzVDOWFieFpMNHBIMVFMNUgyQU1heGxV?=
 =?utf-8?B?WEU0WFh2M1UxbGFFNzRyc2QxeUV0Nmdha3pBR3pmMWZYeUQ1WkdLL0Zoa1hD?=
 =?utf-8?B?dFJ0RHdtaklEVnBJamNIbkM3VnJNam92OWpKY253emQrNGtRdzhQZFJ2Y0RG?=
 =?utf-8?B?K2xscnFzaDVTVHFmNEt5WWJYeHRJU1dCejJPVDV1YkM3YTR6TDFScnZ1NW1S?=
 =?utf-8?B?WVd2eUJDN3o4Q1RNaVNlcmdJSER4elFBWE53dXJQYWtOTWErOC9vc3VOZno4?=
 =?utf-8?B?MDZGM2plV1R4UXRTY3lqdXV0RjJwckJYS1VCQ2R0T09NY3k0U1RSUUZPcXlt?=
 =?utf-8?B?c0RBMXV0Tm56dE55elE1MjA3M2pXRllrWmJsWHFta3pvbVZhcktBSEI5QlZB?=
 =?utf-8?B?YUdqTG5LSE1MTVRYSS96QjhrYnZRL3hWN0tyUGRzcjl6OCtYWEJBTCtIOFhQ?=
 =?utf-8?B?QVFlWnF6S2JQS3NDVzVtWDFpNzBnVGtTY0tnN2lLbUlaTzErQWxObXpoSElr?=
 =?utf-8?B?b0RPRGdJZS9lL20vT2grbzNmRWdSWVdjQUY3WGEzemd3UGlMWXRMUU5ucGlS?=
 =?utf-8?B?WG1mMDMzSmVFOHpJYUZMd1ZpRWl4SFRrUjFMT1NtVDVZc1l4Qk9PbFlFK2Vr?=
 =?utf-8?B?TlBsSERUeTRLNGpOb056cVNpNzltMG5iTnFEaXkvZW00dlVnMEtMMFFES2xX?=
 =?utf-8?B?UzIrZEp5MUNqZk9xV2liTzZjZzhYRGlvZUFWYi9veEdmRXJVbzkwbDlKaE1i?=
 =?utf-8?B?OU9rUVhHM0hldlVsckF5WEFjOUExK1dVeWZ2MHRKd1ZON0R5TG1Cd212dm5a?=
 =?utf-8?B?MDRLZTVmcDQxeTFOSEI0Y0g0WXNLYm1wYVZ3bVZHWXpHeUNXSU5USjBFWkNT?=
 =?utf-8?B?RE10cHBDa1lkWXltSGYrMU83cWs3NnU1UlY5RUtmUE1qQnFscnAwM1VtWHk1?=
 =?utf-8?B?K2NxVVFCYlNqZmdEbXZ4cE9kam9BOTJKOWg3WlJpa3ZYRHhvenJheVhSNFB3?=
 =?utf-8?B?bUJOSm1jLzJkbkNEeTNGTUpqakhScDh4cm40NHVBbWlTeUVMeHc1VjN4cW0r?=
 =?utf-8?B?ZkJlalBMamxXcFJKNmNOWHFFWmUyaHZkNlQ0a2xJSWxFRzBEMGFQM1FnaEdr?=
 =?utf-8?B?YkdiZjVxNnVEY1I5YkxmWTQrR0tTU2dQSnZEQjl2VEZwMzljSnhRZnI4cWRP?=
 =?utf-8?B?ZUFWTjRPNDN6Nk9rclBjOVVNUGVnMVZpQm4vRnNpWXRGTC9LS0R3SDc3ZEtV?=
 =?utf-8?B?amdjMEdjTmNpL0NGTDJ6bWFCWENqYlNORzhxVzB3ZHRtQURMNWVrRXlnVGM3?=
 =?utf-8?Q?bX2587dWrhCsb1jz5El8TW8iE?=
Content-ID: <D6CF77038D40614AA59CCE45E02E05FD@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6345ead3-9b57-40cf-8e4f-08da7ef6562f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 19:42:49.9202
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7LDLX1nsd8aAGWCT9cP2bJJiWnOfWeSDiux80SgWTEGydjVDoGFfWHg1SxE/1xKmZ+t340cXDb8yY4gUfZsQOrjtFJ6aZuWWEBifLHqx/Q0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6286
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_124256_414104_CA5E604E 
X-CRM114-Status: GOOD (  20.10  )
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

On 15/08/2022 20:40, Lad, Prabhakar wrote:
> Hi Conor,
> 
> Thank you for the review.
> 
> On Mon, Aug 15, 2022 at 8:14 PM <Conor.Dooley@microchip.com> wrote:
>>
>> On 15/08/2022 16:14, Lad Prabhakar wrote:
>>> dt-bindings: soc: renesas: renesas.yaml: Document Renesas RZ/Five SoC
>>
>> Hey Lad,
>>
>> Maybe I am missing something on the arm side, but "soc"?
>> Was the intent to move this to Documentation/devicetree/bindings/soc
>> but you moved it back to arm by accident?
>>
> Ouch I sent out the older version of my patch for this. I did actually
> send out a patch which moves arm renesas.yaml to the soc folder.

Cool thought I saw one of those this morning.

> 
> Cheers,
> Prabhakar
> 
>> Thanks,
>> Conor.
>>
>>
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Document Renesas RZ/Five (R9A07G043) SoC.
>>>
>>> More info about RZ/Five SoC:
>>> https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzfive-risc-v-general-purpose-microprocessors-risc-v-cpu-core-andes-ax45mp-single-10-ghz-2ch-gigabit-ethernet
>>>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> ---
>>> v1->v2
>>> * New patch
>>> ---
>>>  Documentation/devicetree/bindings/arm/renesas.yaml | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
>>> index ff80152f092f..233847eb23fd 100644
>>> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
>>> @@ -415,11 +415,12 @@ properties:
>>>                - renesas,rzn1d400-db # RZN1D-DB (RZ/N1D Demo Board for the RZ/N1D 400 pins package)
>>>            - const: renesas,r9a06g032
>>>
>>> -      - description: RZ/G2UL (R9A07G043)
>>> +      - description: RZ/Five and RZ/G2UL (R9A07G043)
>>>          items:
>>>            - enum:
>>>                - renesas,smarc-evk # SMARC EVK
>>>            - enum:
>>> +              - renesas,r9a07g043f01 # RZ/Five (RISC-V core)
>>>                - renesas,r9a07g043u11 # RZ/G2UL Type-1
>>>                - renesas,r9a07g043u12 # RZ/G2UL Type-2
>>>            - const: renesas,r9a07g043
>>> --
>>> 2.25.1
>>>
>>
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
