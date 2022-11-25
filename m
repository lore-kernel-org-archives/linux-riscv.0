Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BBAC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 08:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6AVSohVhFCtlUAPlhzDPmXJvAu8cDdOgBr5+4xvvrS8=; b=38waki5MZIK5WA
	MxUYGHZ//BgJ4F+5oiK8kDqTrpQ9HpcOLslnI3QmcLmReEllLftEcdFwpczRtX0ocvTr7MdMGa/es
	vYQewgvA1hHyD8ECz6d7iow1hXsKChYY6cTHS0RTd/ksnoOPK5hrD2ibbzdhaYUJWS6yF5nUbktD0
	CKT23bfu/cDWpRGeHJ1SE11sqjwBU+VsW/f2/KuVnmZBPDo8ju/e8Q4sFTJ5Gqc2tHjjX/Z3MPKAU
	WKqh0GwtLzCOvoZq2x3zXZnvL3AMUzQOgbZ76LTnGBwQ/9RPXW3xfHFmf0YAJtzIA1fsS9yJLn93R
	fsZulS38LDUcQNJHaR/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyTtm-00ESPw-8t; Fri, 25 Nov 2022 08:17:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyTti-00ESLd-Vs
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 08:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669364242; x=1700900242;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=vzTNw+2KFcQTYK1tLdfgIABIGJxyC1eLMOfZyafAm0s=;
  b=xIwnKXWpBA3wexwrRMl2Y3Speg+lJR0FiGULXRLrHRNhdqcyWFk6rfpt
   NOAujjpUqHBcq3Gb7KaRt6h4W9fg793ubBp5uvgPhtIe5r1Ln2XgT4WOF
   hc0Te8AhxDHKk/i9ZKkWFK7J+Qy274AZFNdVnRxD5phX8/P6S5INpTEgq
   oyw7k/hjLvZ5no5iZ6pFfK6hdkCd7rdcGzJUwDrXf+zgjDG8d3o82AmpK
   oe3b67bpQ4MLz7PQK9cwfJQJvzEvSrJaTEcAH2fwaY3Y8qGSTpLI9DPGp
   w8j4QcAw/1j/ZqUzmg/HLvKRg/PpWnJ7EFOuEv9FqvlTiErUkbaOkTOHf
   g==;
X-IronPort-AV: E=Sophos;i="5.96,192,1665471600"; 
   d="scan'208";a="125065119"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Nov 2022 01:17:15 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 25 Nov 2022 01:17:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Fri, 25 Nov 2022 01:17:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCTMXphXDstE7Wu6AB2oTo9xModIMtV+SweSjt3J6P0kxdJ/qpqX0hnhPtbDFTvx03N8hX5vfZJkLDKlLWyoOxFzFOMIR32bFFqfpjHXNg40o6kbTZ3do0WEFQ1RDQLYl13XwpGozelQ2y3A07qfJoVQGe7WR8GNdhRQ6Vk231Mp8J2FL9Koa3xPHAVa2giIqZ2s7llMA28yTVz60AhERt56BS5fHXOV+bBrrn0YMmWRIuPsT2by+T+tPCOwt6NECufdc+P0IB4gGn0QYvPeb/seT/CBBmlosS4CQMDSAukSVQVIRb5X3UX18qq2X3/ojrjVGW1SNuBIuZumErMzgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzTNw+2KFcQTYK1tLdfgIABIGJxyC1eLMOfZyafAm0s=;
 b=O9JLCzgZz44G6DS6jK+Oax3A60xtT3IT0PhCei4O+15f8CCSa73rxWxlGK6TQHi4j2uXu+nYrGSu9RTnMcek/Btd/BxWe0grLicTDIogVa6u2jv/hq5QkLA1QhdzJoWWHj0D7vSeGtL0WVjDcxAw9C8hl/ucBe04+saNtzN7xPjce6vh9i1uEIan9efkz5V3XlZYT8ZHegy2o2zIfxB/00s8blA/4xVG9EBGn3peSgtLNGR2GJoYG83JkQmW6nqomo64pICsJB9YX2pK64OXIBGi2ZOhG/05Suxhrny85A0/1cvVCjbJm+Za1AMn6hfl2+IC+TScJwb7mzUlHsT7EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzTNw+2KFcQTYK1tLdfgIABIGJxyC1eLMOfZyafAm0s=;
 b=Bu6gMhFSm46Vu8/78sZ7XNK6jwuDnjRgKS0yyshAG26QuDaXD9mkjhU5t9GWpOk8Wc2eM9OLzd5GeCDSSJWRuwY8sEDHywKUuZjWDFpRNrZaDX3G3RPyJBg7LLCBIfPql7AhS3pwsmxDygDIowphh8arqstzDuO7uhDEDcGcJ7I=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM4PR11MB5325.namprd11.prod.outlook.com (2603:10b6:5:390::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Fri, 25 Nov
 2022 08:17:09 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6%4]) with mapi id 15.20.5857.020; Fri, 25 Nov 2022
 08:17:09 +0000
From: <Conor.Dooley@microchip.com>
To: <ajones@ventanamicro.com>, <heiko@sntech.de>, <palmer@dabbelt.com>
CC: <conor@kernel.org>, <linux-riscv@lists.infradead.org>,
	<christoph.muellner@vrull.eu>, <prabhakar.csengg@gmail.com>,
	<philipp.tomsich@vrull.eu>, <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH 7/7] RISC-V: add zbb support to string functions
Thread-Topic: [PATCH 7/7] RISC-V: add zbb support to string functions
Thread-Index: AQHY9SSXrqKnpol1l0qtIrXpQ3sHe649hUuAgBE3FACAAAK/AIAAFg4AgACFdICAAAeiAA==
Date: Fri, 25 Nov 2022 08:17:08 +0000
Message-ID: <b4fb0510-ccb8-2f20-a74f-e8721a191a24@microchip.com>
References: <20221110164924.529386-1-heiko@sntech.de>
 <14728581.RDIVbhacDa@diego> <Y3/xGhkbf6qEr+5r@spud> <3259590.VLH7GnMWUR@phil>
 <20221125074933.2xuyaeuk5kmi5miw@kamzik>
In-Reply-To: <20221125074933.2xuyaeuk5kmi5miw@kamzik>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|DM4PR11MB5325:EE_
x-ms-office365-filtering-correlation-id: 44850518-7985-463a-3451-08dacebd726e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QWhU+w7GEAt/PQ39Qvc25Do5spDwkoRX/c9oSjlHd+5bEgV3BJABAgxpfFaM9v7EjSg6RM1xHpev6dBXQQpZGLNuFIsf3xFlggG4Aed+zBTEBNrsvpnI20AAj/GAl/IK5DbZurv2lBRe1ADOPq5nDzZ+SYu3W3PoViR+vyOyRZVItoVFuffaju5H2ZlExo1MPFQvYu4FE0fYwaRgy4ktfzYS+C2yt9GJGZfJbZvOzofqMMQ3NSHTktYddg2+QSPYJui9YqA9S4vXnAnEPEQRfZuihPNGttTJMtQwH0FfidjZ9EL0L72Duv24Pz/QOgVddcWqnOVv/4/g92R4TNSIUu7nR6z3M5hf+54wwInVbXG8ZOuF1ZGIN6892eJPGZKjFt6sjoGPocQUZ4kZeUDOWgEiGQRhMCXLhI6nxYam1+/A2jVXK64X8gmAGo/j+Ace+kW6y0UkHr3vYILhHHYoTETI0JuxCuOrc/i9WKP2ZxDhYH8yLnRGG/8AmuTRbD9hXJXCN72MihMKEUmEAVm1mdZU1kQzVGpY+uzD8Qz9ilpxZyPtoFLaJNscbmR3QWWwlppkwP7fPa73FNB1VkTeNi5qlAiOEZkwdWXpT8ytnyPkCPRr+zKf4ktvtPgonHElp49CU7ubZivROzFutgaTQpdZqJj9khfsygB11yA5f53R8MVTMmjaJTXx6xwO5KyKU75aetbUUxxkyn0VCrgGVYOJXWhidUzKfdPqC5Oi3QkRy/5E2rFhgV3ao05kaRep6sRdMGgs8aVAuOWBMDW6zA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199015)(5660300002)(2906002)(31686004)(66946007)(83380400001)(36756003)(64756008)(66556008)(76116006)(8676002)(91956017)(4326008)(66446008)(66476007)(110136005)(86362001)(54906003)(316002)(31696002)(41300700001)(8936002)(6486002)(478600001)(26005)(6506007)(53546011)(6512007)(38070700005)(2616005)(66574015)(186003)(38100700002)(71200400001)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGZONU5xQWp6NWJLQlk0SWNCMENEMDBvTjk4UkswWVhIWnBad0ttWk9kakoz?=
 =?utf-8?B?K09JVW5YdHJVOW95QnpSOUlhQjJGU2RMLzVkeFk2aWRJOUp1WSs3QXd6NmFR?=
 =?utf-8?B?UFFuRWVsTWt6T29NVkFwdUlVVEhQQTRTT0dNN3kybzZ3V1RJbWdHOHpVbVlN?=
 =?utf-8?B?N0JjSjgvTUtzbzA2WXFMNTNVaE5lTjl1bDNERGNRNDUwcjY4T0tzRGVjQlFW?=
 =?utf-8?B?cFBkQzZHa25Ib3V3U0tTTWNxM2VMN1l3MWpXdWFaYmRCUS9CaGl1RmNPTGxC?=
 =?utf-8?B?bGFsYVloYWdjV0Z4dWlNRTJ3a0N4cVlmcEQwdmZNMTF6TzA5dnJYd2JNT3Jw?=
 =?utf-8?B?ZklyaFJNODZUSWZ1OG5RbW0vNkZKWE16elJaT0VyTWZlUDAwM0RCY1NiSnZ2?=
 =?utf-8?B?QzlNaERWTnZZSUdYU0cxMnVGSlpUZ1QwOU9Ma05Ud2QzTjVFWlJQa1d1bThn?=
 =?utf-8?B?WlNJY3NqbDBCNTdkNGRzYm5jc1pYK3ZJNjd2N0FYTmlzOS9TM3VTTmdqZlQw?=
 =?utf-8?B?cmR0OGFBTUI2R2Z0OThHZ3dtelEvUzFFWjVmRjV5TmlWWUR3NTZ5S1B4ZGg0?=
 =?utf-8?B?OUxzbkg4bFpmdThOQXN5YmZqOGI2b3Q3RUtDZ3hmc1I2ZXN6YytWa3FRbkZr?=
 =?utf-8?B?bll5TVRTcjc2Vy9XN1BsZWxDUC9vc0kyL0pMNmR0QmlVVTRpSzB0M1I5bVc1?=
 =?utf-8?B?dEtSK0Fuc3ZxdktHYlQ0bGxSa1JBQWpEai9GMUpqTHVqazBneDl4dTNFdCt4?=
 =?utf-8?B?SDE2cnlFanF2MnlLZXdWazVBZGthTkJ2d3hMSWdEYUdwRDdwMWdmenczckd6?=
 =?utf-8?B?UHE2bVZFNUdqRlJlc1NKZXpwUkRYTE1WQVdkVnVsMTdjV3dwM3kwQmJZRmo3?=
 =?utf-8?B?Y2p6UWdOT1p4eWpwTE9YNVJyVkR4RUN2cHpmNEdmWUlMUDlkbEVGd21XRWpR?=
 =?utf-8?B?UE5FVlJ5ZGt0d0ZrOUJqSDdYa3VJQ0JvNUF6bis1dFRRMVlBUS84Y3ZWUlYv?=
 =?utf-8?B?UGw2R2NBQW56MzFiSE9YeWFnby9yR284aTNSeXl6MDdiOThQREd6bWJXcFpm?=
 =?utf-8?B?dGJjUXAwa1BQZ1hJU1RERmc1bkJ0a3dxQWNTQTNteFo1RnhnODhDUlFpcXBM?=
 =?utf-8?B?bWh0eDRVdGRrVmFwMVRkdGJGdzNiQTR1U2Z4d2JGRzNEemtLRXJtZUVOOXAy?=
 =?utf-8?B?NzlBV00zeUo2Ym5QOFhJZ2FvKzdPa0tqM0NxM0tHUUl2OXNVL3NLc2VoemxH?=
 =?utf-8?B?eWtuK08rK1ZhYU1LYjB0c3NjRnFKSFZhb1lQbEZYTHBqSzc4Nk80c213L1Rw?=
 =?utf-8?B?Y2pFbHAxYjJGUEJjYTg3NGdKZEJ1Vm13ZFpUajE1UWtqLzBhVUQ0Z2haR1Fy?=
 =?utf-8?B?UGh6QmJvSTNNZGN6aURoWlNIbU1yQ205K3JveW1JVmpGaFRXOHVka2Q0TTdO?=
 =?utf-8?B?QnB4WlJwbGhYRWswcUJsbmFnWVN0UzRwSGtkUXIvOWh4RjI1a2s4NXpqdXV6?=
 =?utf-8?B?Vks3M0ZITTl0b1BUbUlIdldOMXdYMytJZ3NQNDlXWU1BRS92SXVEbms0UkFB?=
 =?utf-8?B?cnRMWkJuclNuNndlcE9odTlkWEFCZ2loSmdWUzlIMEdpRlJLb3ZiL1JmVjFF?=
 =?utf-8?B?SDgvUTA3QkhNdXBia29EdSthK3lkOEp5VWkwdldtYTRtSmNSSGw4aytXbjlU?=
 =?utf-8?B?b1ppS01sc0ROT0Q1MXNSS2Y0cHczVE95MmRmVkt6dFErRVYza2pwbHcxazYx?=
 =?utf-8?B?MitYdWJ5N3VYNzZ2UXRIZlFvamMzemwwcFk3Y3RDYnEyUmtsR21vRmx0c3lj?=
 =?utf-8?B?TTMwSWlJUDI2Ukxid21nS09Sbkt0MDg1UkxXMXFrV29RUXVxZG5YSzhCRHhr?=
 =?utf-8?B?ZlMzMlVWSWZ5K2JIUXBlTmUzUEgwenFIRXQyNm1GeXQ3K3NJTGFjOSsvMEF6?=
 =?utf-8?B?eXpFeEFUc2dZVWpNaGlpT0Q4cWp2VndZOFdFdFdXTG9YUDhLdnF4MHRIQWJ4?=
 =?utf-8?B?a0VqTnlCVzNNV1JNN0xkNUcvWWM2L3N5OWl5MkJCMDlMaWpLNEoyM1A3d3Ux?=
 =?utf-8?B?eDI4L2FIYzY1aE9PWm53VFZuU1NONWpyUDE3ZEtEdkd2N1JRdjZtVVhUSnBv?=
 =?utf-8?Q?rDejqlOAqXeFhCaZoGEbwE3E7?=
Content-ID: <8951017F1CF6F6438C03FE698AC72DC1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44850518-7985-463a-3451-08dacebd726e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2022 08:17:08.9843
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nVBtjWe09ngLUEyLrBDCDOL1M+/bPB3V5YeUm+nn9JTYDWB5g4gLiW2M67NzHdFMbIRFghECRczxRpV40cbitup9OTrnb99cZkhfeDLj2OM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5325
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_001723_452415_37F9D3E0 
X-CRM114-Status: GOOD (  27.53  )
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

T24gMjUvMTEvMjAyMiAwNzo0OSwgQW5kcmV3IEpvbmVzIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIEZyaSwgTm92IDI1LCAyMDIyIGF0IDEyOjUx
OjU0QU0gKzAxMDAsIEhlaWtvIFN0dWVibmVyIHdyb3RlOg0KPj4gQW0gRG9ubmVyc3RhZywgMjQu
IE5vdmVtYmVyIDIwMjIsIDIzOjMyOjU4IENFVCBzY2hyaWViIENvbm9yIERvb2xleToNCj4+PiBP
biBUaHUsIE5vdiAyNCwgMjAyMiBhdCAxMToyMzowOFBNICswMTAwLCBIZWlrbyBTdMO8Ym5lciB3
cm90ZToNCj4gLi4uDQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdS5j
IGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMNCj4+Pj4+PiBpbmRleCBiZjlkZDY3NjRiYWQuLjY2
ZmYzNmE1N2UyMCAxMDA2NDQNCj4+Pj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYw0K
Pj4+Pj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdS5jDQo+Pj4+Pj4gQEAgLTE2Niw2ICsx
NjYsNyBAQCBzdGF0aWMgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSBpc2FfZXh0X2FycltdID0g
ew0KPj4+Pj4+ICAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShzc3RjLCBSSVNDVl9JU0FfRVhU
X1NTVEMpLA0KPj4+Pj4+ICAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShzdmludmFsLCBSSVND
Vl9JU0FfRVhUX1NWSU5WQUwpLA0KPj4+Pj4+ICAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShz
dnBibXQsIFJJU0NWX0lTQV9FWFRfU1ZQQk1UKSwNCj4+Pj4+PiArICAgICBfX1JJU0NWX0lTQV9F
WFRfREFUQSh6YmIsIFJJU0NWX0lTQV9FWFRfWkJCKSwNCj4+Pj4+PiAgICAgICAgX19SSVNDVl9J
U0FfRVhUX0RBVEEoemljYm9tLCBSSVNDVl9JU0FfRVhUX1pJQ0JPTSksDQo+Pj4+Pj4gICAgICAg
IF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHppaGludHBhdXNlLCBSSVNDVl9JU0FfRVhUX1pJSElOVFBB
VVNFKSwNCj4+Pj4+PiAgICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoIiIsIFJJU0NWX0lTQV9F
WFRfTUFYKSwNCj4+Pj4+DQo+Pj4+PiBUaGlzIG9uZSBJIGRvIGtub3cgdGhhdCBQYWxtZXIgd2Fu
dHMgY2Fub25pY2FsbHkgb3JkZXJlZC4NCj4+Pg0KPj4+IGJ0dywgaWRrIGlmIHlvdSBub3RpY2Vk
IGJ1dCBJIGFwcGVhciB0byBoYXZlIHBpY2tlZCBjYW5vbmljYWwgb3JkZXJpbmcNCj4+PiBhcyB0
b2RheSdzIHRoaW5nIHRvIGdldCBjb25mdXNlZCBhYm91dCBhIGxvdC4NCj4+Pg0KPj4+IFlvdSBw
dXQgemJiIGFmdGVyIHRoZSBTIGV4dGVudGlvbnMgLSBkb2VzIHRoYXQgbWVhbnQgaXQgaXMgKm5v
dCogYW4NCj4+PiAiQWRkaXRpb25hbCBTdGFuZGFyZCBFeHRlbnNpb24iIGJ1dCByYXRoZXIgYSBy
ZWd1bGFyIFogb25lPw0KPj4NCj4+IFRoaXMgY29uZnVzZXMgbWUgY29tcGxldGVseSBub3cgOi0p
IC4NCj4+DQo+IA0KPiBDYW4gd2UgaW5zdGVhZCBwb3N0IGEgcGF0Y2ggdG8gdGhlIHNwZWMgdGhh
dCBjaGFuZ2VzIHRoZSBvcmRlciB0bw0KPiBhbHBoYWJldGljYWw/IFRoZSBvbmx5IG90aGVyIG9w
dGlvbiBJIHNlZSBpcyB0byBkZXZlbG9wIGEgdG9vbCB3aGljaCBzb3J0cw0KPiBleHRlbnNpb25z
IGFuZCBldmVyeSBSSVNDLVYgZGV2ZWxvcGVyIGtlZXBzIGl0IGluIHRoZWlyIGJhY2sgcG9ja2V0
LiBBDQo+IGtlcm5lbCBzcGVjaWZpYyB0b29sIHRvIGNoZWNrIGVhY2ggbGlzdCB3ZSB3YW50IHRv
IGtlZXAgc29ydGVkIHdvdWxkIGJlDQo+IG5pY2UgdG9vLg0KDQpJcyB0aGVyZSBzb21lIHJlYXNv
biB0aGF0IHRoZXNlIHRoaW5ncyBuZWVkIHRvIGJlIG91dHB1dCBpbiBjYW5vbmljYWwNCm9yZGVy
IGluIHRoZSBmaXJzdCBwbGFjZSBieSB0aGUga2VybmVsPw0KQ291bGQgd2Ugc2F5IHRvIGhlbGwg
d2l0aCBldmVuIHRyeWluZyB0byBmaWd1cmUgb3V0IHdoYXQgdGhlIGNvcnJlY3QNCm9yZGVyIGlz
IChzaW5jZSB5ZWFoLCBpdCdsbCBiZSBhIGNvbnZlcnNhdGlvbiB+ZXZlcnkgdGltZSB0aGlzIGNv
bWVzIHVwKQ0Kb3IgaXMgdGhhdCBicmVha2luZyB1QVBJIHNpbmNlIHNvbWVvbmUncyBwYXJzZXIg
aW4gdXNlcmxhbmQgbWF5IGV4cGVjdCB0bw0Kc2VlIGNhbm9uaWNhbCBvcmRlciBvbmx5Pw0KVGhh
dCdzIGJlZW4gbXkgYXNzdW1wdGlvbiBmb3Igd2h5IGl0IHdhcyByZS1zb3J0ZWQsIEBQYWxtZXI/
DQoNCj4gTXkgcHJlZmVyZW5jZSB3b3VsZCBiZSB0byBjaGFuZ2UgdGhlIHNwZWMgdG8gYWxwaGFi
ZXRpY2FsIG9yZGVyLCB0aG91Z2gsDQo+IGJlY2F1c2UgdGhlIHNwZWMgaXNuJ3QgZXhwbGljaXRb
Kl0gZW5vdWdoIHRvIHdyaXRlIGEgdG9vbCB0aGF0IGNhbiBoYW5kbGUNCj4gYWxsIGNhc2VzLiBX
ZSdsbCBlbmQgdXAgbmVlZGluZyB0byBoYXZlIGNvbnZlcnNhdGlvbnMgbGlrZSB0aGlzIG9uZSB0
bw0KPiB3cml0ZSB0aGUgdG9vbCBhbmQgZXZlbnR1YWxseSB0aGUgdG9vbCB3aWxsIGJlIHdoYXQg
ZXZlcnlvbmUgbG9va3MgdG8sDQo+IHJhdGhlciB0aGFuIHRoZSBzcGVjLi4uDQoNCklmIGl0IGNv
dWxkIGJlIGV4cGxpY2l0bHkgY2xlYXIgd2hhdCBjb25zdGl0dXRlcyBhbiAiYWRkaXRpb25hbCBz
dGFuZGFyZA0KZXh0ZW5zaW9uIiB0aGF0J2QgYmUgZ29vZCBlbm91Z2ggZm9yIG1lISBTYXk6DQoN
CmRpZmYgLS1naXQgYS9zcmMvbmFtaW5nLnRleCBiL3NyYy9uYW1pbmcudGV4DQppbmRleCBiZmQ2
N2Q0Li45ZDYzYTg2IDEwMDY0NA0KLS0tIGEvc3JjL25hbWluZy50ZXgNCisrKyBiL3NyYy9uYW1p
bmcudGV4DQpAQCAtODAsNyArODAsOSBAQCBTdGFuZGFyZCBleHRlbnNpb25zIGNhbiBhbHNvIGJl
IG5hbWVkIHVzaW5nIGEgc2luZ2xlIGBgWicnIGZvbGxvd2VkIGJ5IGFuDQogIGFscGhhYmV0aWNh
bCBuYW1lIGFuZCBhbiBvcHRpb25hbCB2ZXJzaW9uIG51bWJlci4gIEZvciBleGFtcGxlLA0KICBg
YFppZmVuY2VpJycgbmFtZXMgdGhlIGluc3RydWN0aW9uLWZldGNoIGZlbmNlIGV4dGVuc2lvbiBk
ZXNjcmliZWQgaW4NCiAgQ2hhcHRlcn5ccmVme2NoYXA6emlmZW5jZWl9OyBgYFppZmVuY2VpMicn
IGFuZCBgYFppZmVuY2VpMnAwJycgbmFtZSB2ZXJzaW9uDQotMi4wIG9mIHNhbWUuDQorMi4wIG9m
IHNhbWUuIFRoZSBlbnRpcmUgc2V0IG9mIEFkZGl0aW9uYWwgU3RhbmRhcmQgRXh0ZW5zaW9ucyBh
cmUgZG9jdW1lbnRlZA0KK2luIHRoZSBTdGFuZGFyZCBVbnByaXZpbGVnZWQgRXh0ZW5zaW9ucyBz
ZWN0aW9uIG9mIFRhYmxlflxyZWZ7aXNhbmFtZXRhYmxlfQ0KK2JlbG93Lg0KICANCiAgVGhlIGZp
cnN0IGxldHRlciBmb2xsb3dpbmcgdGhlIGBgWicnIGNvbnZlbnRpb25hbGx5IGluZGljYXRlcyB0
aGUgbW9zdCBjbG9zZWx5DQogIHJlbGF0ZWQgYWxwaGFiZXRpY2FsIGV4dGVuc2lvbiBjYXRlZ29y
eSwgSU1BRkRRQ1ZILiAgRm9yIHRoZSBgYFphbScnDQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
