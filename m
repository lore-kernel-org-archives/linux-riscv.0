Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76176C00140
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Jul 2022 08:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5SnIFD01sOABlnbNzDfiW1FZlBvXrPnsClovJmkCfpk=; b=BTvonHWox7DLiX
	E0ZkTnVPA1JCqUhFJCDLVK8tgmxd2hByAHMQiXl1hoMpI7abV65bsHSGFO6aq1U2xKA/SZ0E8pHiH
	0SOL8Ocs6per0WjBXX/DPENso/FLT4EnU4F9clh8mHkWPyayDZTgYOrb6Ig3YJdv96nQo5AqUZ6DK
	j5N0J0/YLT1XS2cgKQODGlBjRDWWlFJpL4aOtOB60VneYRo4DS6DTpb4R1azpjnQbW9Cr6Ke5lZjn
	vCR6gB2ajaCxOZoN6kbd/X+2tnt1TfLvEYpYDEcXQxqli0XjhdJKP3jMR6ek5SWnD+lB+cSbQb3iR
	O7yz92qFTenmSlrrsoZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oI4l8-00ABgJ-Ei; Sun, 31 Jul 2022 08:57:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oI4l3-00ABZZ-VK
	for linux-riscv@lists.infradead.org; Sun, 31 Jul 2022 08:57:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1659257829; x=1690793829;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=AKZQDOQ4XRPUmfXPB1Mn44Y0wfjhStjWtn5owJR6G3o=;
  b=mM2VHMME/jt+L4YmMhC7NTG+ysGfGZQRLvim+tErlsr4ZV5j60PeLpPH
   90ZSl6JCzUuOAp0pW8uJU/YS4dvGZ5C2Bc7Wiuaa81hFUUcPOGcKbhxvq
   8MZjlx0eU+vDe3LTNmfpKoKrTuTvhgYzLn2hvu6/LfNP2mEvQW6zn9UFS
   q05Qwg+AOnWpL2f6VCn7n2yCCDGFOIZOwt2MlhMq7xE2pFJq8tMk2yxqA
   fAIbXvie/ecDdCSNSaSL5Xrsd52NIX3dUTDrTcudXFbfCa9HbhNbdC2X6
   3YyuwwVLOzoWMN6Rt5itGDvewEWc6TasF2etBJ1jm5IrEKLnoj6xiVLMW
   g==;
X-IronPort-AV: E=Sophos;i="5.93,206,1654585200"; 
   d="scan'208";a="106886443"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Jul 2022 01:57:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Sun, 31 Jul 2022 01:57:03 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Sun, 31 Jul 2022 01:57:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R40G+3I+qejywf/EG5jbd8PDpCsVikUXSqBq1Xh+RvOb+Bo3WZd25wQKvF0UMcpAWmH+pb+JFui6BjdM40gSFTQA20KGuS9AMTGJclH79dHjVf2DGBZKxnn3U5U0WaAEz+0KRyHNl0HxmBUM2KDf3xR8AEgoVYJFlsDiGaqU44CDKQxZGUSi4ugbXabqTkReMOcSd/yN3IOzCfK/Kmtx423ablNRKF4SVOWH2zdD00WsL1hnZ2W1/rsKpCoxu4dXgZC8Q3C1ZgQWBhdSIYqMLM2OM3ovIWOiOQPC8tPoViTwtH377rMdll7rZAp8iqn3u6mb87De9EayzSY0e3l6YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKZQDOQ4XRPUmfXPB1Mn44Y0wfjhStjWtn5owJR6G3o=;
 b=X4GwxWcDkVOuqsKpBdAvofrpu0bgn+G+ctpZRPV6frPQsDxoYe3Zic2xPabnP2Y/I37/bzgxg6q6lennEd8iSPTuDKZ4yExFoRoa94O5fvitgMwPQeaFVdO1aQRAPu+nuYilmNm2FuBT+X1/4z63fFml1xfyR1XgWpgeJXNre3m6TcC+vNikv4sh8FkcFkxVmjzI67E4sDGmBmOYfza0t/NRKckRK9vxVugWvri+ngiisKA+SIdxWOHqXaxFTWuLmz2DCNa9O3rTI2O5FRBNxKXdC6HFaUgwzF2wZ8cndALlI20Z3JHlsAxwJhtDE3RNRzaeMImWweMaf29+cP7kkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKZQDOQ4XRPUmfXPB1Mn44Y0wfjhStjWtn5owJR6G3o=;
 b=O7foZbfLiR+/8px+mtrPDhw5kJtl1lcVEYSS/b/yy3ab6TH7KhMNNdljE+VXIXcrG7yEzmKgnXA+z5zFkbJE8xGE3rQeLdgphKio9eN+ujReX9UylHT+L4hYIiiMeeTNGU1tew5qnJmDQnDemmlgtvC8j4ro88vP1cIgkJ30mzg=
Received: from PH0PR11MB5925.namprd11.prod.outlook.com (2603:10b6:510:143::10)
 by BYAPR11MB2999.namprd11.prod.outlook.com (2603:10b6:a03:90::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Sun, 31 Jul
 2022 08:56:58 +0000
Received: from PH0PR11MB5925.namprd11.prod.outlook.com
 ([fe80::5c03:1f60:ee1d:3928]) by PH0PR11MB5925.namprd11.prod.outlook.com
 ([fe80::5c03:1f60:ee1d:3928%7]) with mapi id 15.20.5482.014; Sun, 31 Jul 2022
 08:56:57 +0000
From: <Lewis.Hanly@microchip.com>
To: <maz@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <Conor.Dooley@microchip.com>,
	<brgl@bgdev.pl>, <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
	<palmer@dabbelt.com>, <linux-kernel@vger.kernel.org>,
	<Daire.McNamara@microchip.com>
Subject: Re: [PATCH v3 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Topic: [PATCH v3 1/1] gpio: mpfs: add polarfire soc gpio support
Thread-Index: AQHYmONEe8u9iky0lEWQnR2PO9enTa2AzRoAgBd4GYA=
Date: Sun, 31 Jul 2022 08:56:57 +0000
Message-ID: <77fcd05bc976f9eb14a08974ea7c600b0292b145.camel@microchip.com>
References: <20220716071113.1646887-1-lewis.hanly@microchip.com>
	 <20220716071113.1646887-2-lewis.hanly@microchip.com>
	 <87r12l4aaj.wl-maz@kernel.org>
In-Reply-To: <87r12l4aaj.wl-maz@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7f792ac-483c-44e2-234b-08da72d29ff9
x-ms-traffictypediagnostic: BYAPR11MB2999:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wRebixFJeqQHBTKqdDWVtN2u1Cq1lvMURIVmr4kaTPApsFu9TPqc88ViSCbNOggqQKkrrPhhAZHdXFQijd4EZQKG/kXN5hxp366J9kNkDRNw6kk2x3EavmtUnV7ShtuEErXDCHAucjQ7KWWpPryEEUU2LqX8q762p9U8ulyjDDrbreCWT0Re8/5elJoIZatzufNopIt7fPrjRZQ4q7I4pVMVdVLyL3WlbpHauhmJJtRe3ytwZVCeSbtuWH4UlBxKw9MXIEuJVSOD58u/p6TEIIQZ/MOhx2G3iFfLJDHm04D/agdKoyWdI5i/d3b8fE5weOCt0t6su884lvDAvxNp1pIxdVEHbjwxdrIFJNUUGoMKG7s3iYbXvmm4gGdQKNXVcFytBFbdA6bGibueaZbSpDxjQBWeQYMN3U1Y27iuurCK/b4ZkoxchLQkdZwkEXtBprrtrJ6Ae8Z5uUBmOHzGrHp9xDeP9wVjtJa6pK2QiniNGo6IkyZE0wY0fvKvgjjS2UOq5tFa3WdD07xHX5u73Y2SqH8SuJqotidCEXhjfsUTeCp0Xv532pl63h2gSo55dvba5uhApsHXX8wEi2E417L6FiLCPLbf1CWK2LuwSQMKLhaa89A/Rogk2taNjs+vCGpzKST9raHoVNxtoEsM6yDNq/FIEWixSywzrQ665meU32t7pCwg10l0bU8xLWcEnVkrtXvwKsNT2b6jSqxfUKrbT+txV7c7fGPd8mbOh0YK+qgmRO2fNcGJ461y4kXVsZCA+Khdy5hDc7Ypnymw9mIO0Ik2/d2jCmBCLnuak70=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(346002)(39850400004)(396003)(136003)(76116006)(91956017)(2616005)(66946007)(5660300002)(41300700001)(2906002)(107886003)(8936002)(478600001)(6506007)(26005)(6512007)(66446008)(66556008)(8676002)(71200400001)(4326008)(64756008)(66476007)(86362001)(6486002)(6916009)(54906003)(122000001)(38100700002)(83380400001)(186003)(38070700005)(316002)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXhablZwaWovekxHbGhLaEhQQ2lxbEF6cjUzN1M3Sm8walVpV01jcGRhdmwy?=
 =?utf-8?B?QnA3RklXdElaek02c0w1N242RVAybzBkY21nczB0eUJHQnp0QUtGV2kwT2pa?=
 =?utf-8?B?TENac3RHYnZEU1JsZkxKZmRPOUQrWjNzRzZoMVgwOUNVRlNEN0dkRWxvUDNC?=
 =?utf-8?B?TjQrcWk4RVZ1R21YRDdhdGx1RG16bTk3RzJDbUgrWTdobXJ1bkpHN2d5bHAz?=
 =?utf-8?B?R0pZY2VrM01xbDFBVCtwaFVxRVUvS2xZYnMrWnVwQlRhbFFRNG1Ca2dtc2dO?=
 =?utf-8?B?aUNzdWZ6R3lUMjcvcnRqZnROcGp3RFNaWjJaQ2phWXpMcjZJU1NSTGZ2a3NE?=
 =?utf-8?B?cFRUMnY1K1hvT1Nzb2pPMkF1Y1RnS0dyLzBZQktkbmFEbVRuenhMV3Q0SjVU?=
 =?utf-8?B?bDJ3OXFUVEJPenRZbEI5aWIvM21EdUVRdjY1K0V6TG45cktQNTFUN3JVWUpT?=
 =?utf-8?B?L2JOcTFYZzFuVldHZU5raHpLTHk5YW5oWkV6Nlk5REZkS3RvOER5bWFmMDJs?=
 =?utf-8?B?SGw0Q1hWV3ZDNUVqY3haQkJWd3F5dENhcnNRL2Rpa0J5K3A0M1cwTlBLNU9U?=
 =?utf-8?B?dFpRcHA1cTBtVGZoVmoxdzdZaDVKQ1NtbjIvaXdGVFlUWFBvNUJ5Yml0RXRs?=
 =?utf-8?B?bWs5YVRMMzRRMTV5bWtKR0wrU1BTRTJZWFRrUEREVFZmMGw2Qy9hVGd2dXJW?=
 =?utf-8?B?d3J5Zml3bTRsM0hvb0VaTG13YlFSYVVqeGtoeW1IcGJVVmwrd1ppMVVxZnFv?=
 =?utf-8?B?b1dERXBPaDJhNXhQSUk3VVN1bkwwYzlnOHAxR0l2VHBzRVJDNnJtU0hEQUVv?=
 =?utf-8?B?ZTNoUG8zeXp4enkvUDJBTE4wajFENHg3LzcxaE9Vd0w2Y0cveHVwNGRNUWRr?=
 =?utf-8?B?eHpNalpVNG5yYmp1Y3Qwb3g0dFRuK0hHZXJnTERDZFR6QVlvVGFjL2xnZDhY?=
 =?utf-8?B?bzFhWVRkK0ptdS9DaXBNa3ROVklnRWlSdXFyU0RXdVV4QjE2Y1N1NDRpOGo3?=
 =?utf-8?B?S2pST2pYTGVsWTJxRzVZNWttY1gxMjFJNjRHVGRyN2lnQ0pQQUJJcWM0ajlW?=
 =?utf-8?B?ZCtWWVNrQmZvVGlQbUU2eHE0NjR1bnNOY1M5ZzNwZ2o0SnlaNVBvOHZQY1VW?=
 =?utf-8?B?RFRxajNReGNEMldGUGhoOGs3TjFaSjBwdDdmUjdEWEMwclBCMVRZR200NEpy?=
 =?utf-8?B?NmJWZy9MVU5laFhZM2EyV3ZxQUNZSGw5c1RxdEI2TmczQkJ3Tm4xU2FHbXhT?=
 =?utf-8?B?NkZkQ2tyR3NnbDVyUTFRL25jNEwvM1RxNVFkYStqdmtKaGZ2Q3JvQU4vL1hG?=
 =?utf-8?B?dU8rN2xSdk1TSVN6QXlMY0RzM1F1ZVRadmUyWjV0dGpma3dwaytKWW45dEg1?=
 =?utf-8?B?N2ZHRVZud0RxMnhvWllTU1U1ZVQvaFl5aWFManFGUGVSSy9xY1h1c1IyOEFy?=
 =?utf-8?B?c0N3cFBlSk9iT2Ztb2x0eVhkR3RDMDRoa1dJbUllcDM2RTNpVjVNL3VUQnBU?=
 =?utf-8?B?UVhzZ3hOOEVlZU9SeGlMcE9VTFdTWUhPdzZ0UE5rSzFLT3ZGWDc1VWZDRG9X?=
 =?utf-8?B?cEgrNEZhalBYT0J4UFlDSTY4aVRycFkyL2xOOVVCdGNMaWNlUFhMeUR4bUtC?=
 =?utf-8?B?emxoL3RiZUpBRFBha2s4Ykc4b3FKcHl2Szl4cS9QOGlFbmt6QStxM1p5d0ov?=
 =?utf-8?B?VTFYMlY2NHlZMEVpZ2dTRXlwV2pCd3dRTXdMUWQvSGZVMnByNU1TOS8zOFAw?=
 =?utf-8?B?bmRNNUJuVVNnWTJHaDhRTFJtZ2hHQ2Qwdlk2a1NJWEtsR0NZaFNpMDZNclNk?=
 =?utf-8?B?ZUtEMUI1eDM1MFpsWDZ0KytYRzJkZVN0NWF6UEtNU2RYdDJtRVVneGh4NVNP?=
 =?utf-8?B?VjByYUlucXZjMXR4a01vVTh2cm42cnRha3ZhWC9FbkdPVUtIMnRFTGxuWGpX?=
 =?utf-8?B?akQwVnpQYVFIN3lhWmRkWEh4Uk1BbCsxdXE0cnlWVXNSM041YkVJVXNMd1pG?=
 =?utf-8?B?aWhRRVBiQ2tIS0pOeitrU2p0Y0pkNGVUWnJuaVhMd3dTMFN3Z0hJcVBvY3lv?=
 =?utf-8?B?ZHF3TnU0N3phOXJydm9WOXBJcmxLMWY3USt2UFQxY1E2bGdiOU0ySjdGQ3pX?=
 =?utf-8?B?N05WWUtmVEU4NlpDSmx5Q09QczZ6ZE5vb3ZGdHhsZGVJM3dKWXR6K3JyMWdE?=
 =?utf-8?B?OEE9PQ==?=
Content-ID: <20393F673F4B674DBBB5A72862C9A027@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f792ac-483c-44e2-234b-08da72d29ff9
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2022 08:56:57.8626
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3zIIw41oFPcfG1llduWNUxZTT8JTuEpup2+iM2Cyj0Ze/3cWUYauzCOKrnMYP0fWdnHnoDtLlsDxLoxSRuXq5nn7vNN3g6FTHQiYK9z2TyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2999
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220731_015710_396011_32E1D5FC 
X-CRM114-Status: GOOD (  24.65  )
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

On Sat, 2022-07-16 at 11:33 +0100, Marc Zyngier wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you
> know the content is safe
> 
> On Sat, 16 Jul 2022 08:11:13 +0100,
> <lewis.hanly@microchip.com> wrote:
> > From: Lewis Hanly <lewis.hanly@microchip.com>
> > 
> > Add a driver to support the Polarfire SoC gpio controller.
> > 
> > Signed-off-by: Lewis Hanly <lewis.hanly@microchip.com>
> 
> [...]
> 
> > +static int mpfs_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
> > +                                        unsigned int child,
> > +                                        unsigned int child_type,
> > +                                        unsigned int *parent,
> > +                                        unsigned int *parent_type)
> > +{
> > +     struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> > +     struct irq_data *d = irq_get_irq_data(mpfs_gpio-
> > >irq_number[child]);
> 
> This looks totally wrong. It means that you have already instantiated
> part of the hierarchy, and it is likely that you will get multiple
> hierarchy sharing some levels, which isn't intended.
Thanks Marc, as you have pointed out the hierarchical interrupt flow is
not fitting our hw. I am in the process of reworking the driver to
implement chained interrupt flow as you pointed out before.
> 
> > +     *parent_type = IRQ_TYPE_NONE;
> > +     *parent = irqd_to_hwirq(d);
> > +
> > +     return 0;
> > +}
> > +
> > +static int mpfs_gpio_probe(struct platform_device *pdev)
> > +{
> > +     struct clk *clk;
> > +     struct device *dev = &pdev->dev;
> > +     struct device_node *node = pdev->dev.of_node;
> > +     struct device_node *irq_parent;
> > +     struct gpio_irq_chip *girq;
> > +     struct irq_domain *parent;
> > +     struct mpfs_gpio_chip *mpfs_gpio;
> > +     int i, ret, ngpio;
> > +
> > +     mpfs_gpio = devm_kzalloc(dev, sizeof(*mpfs_gpio),
> > GFP_KERNEL);
> > +     if (!mpfs_gpio)
> > +             return -ENOMEM;
> > +
> > +     mpfs_gpio->base = devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(mpfs_gpio->base))
> > +             return dev_err_probe(dev, PTR_ERR(mpfs_gpio->clk),
> > "input clock not found.\n");
> > +
> > +     clk = devm_clk_get(dev, NULL);
> > +     if (IS_ERR(clk))
> > +             return dev_err_probe(dev, PTR_ERR(clk), "devm_clk_get
> > failed\n");
> > +
> > +     ret = clk_prepare_enable(clk);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to enable
> > clock\n");
> > +
> > +     mpfs_gpio->clk = clk;
> > +
> > +     ngpio = of_irq_count(node);
> > +     if (ngpio > NUM_GPIO) {
> > +             ret = -ENXIO;
> > +             goto cleanup_clock;
> > +     }
> > +
> > +     irq_parent = of_irq_find_parent(node);
> > +     if (!irq_parent) {
> > +             ret = -ENODEV;
> > +             goto cleanup_clock;
> > +     }
> > +     parent = irq_find_host(irq_parent);
> > +     if (!parent) {
> > +             ret = -ENODEV;
> > +             goto cleanup_clock;
> > +     }
> > +
> > +     /* Get the interrupt numbers. */
> > +     /* Clear/Disable All interrupts before enabling parent
> > interrupts. */
> > +     for (i = 0; i < ngpio; i++) {
> > +             mpfs_gpio->irq_number[i] = platform_get_irq(pdev, i);
> 
> Bingo. You are allocating the interrupt for the level below. You
> really shouldn't do that.
> 
> If you need to retrieve the *hwirq* for the level below, you need to
> parse the DT without triggering an IRQ allocation (of_irq_parse_one()
> and co).
> 
>         M.
> 
> --
> Without deviation from the norm, progress is not possible.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
