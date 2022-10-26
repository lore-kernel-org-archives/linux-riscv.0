Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEB3C38A2D
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Oct 2022 05:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BT/RVNxuEWnX5iyVBKowwcv3XfP0pW2kJriVVqX391k=; b=yYArleRnje7p2y
	oSh1JavsTLDJiIuzugtg5CxRIrAPPyODTWrnRkgyN3Q3+UyVpaImTBpo+n14ZVNt24Vc6WxUnaxOc
	YtrgQNjRMuj4M9tNw9FbV0ltfKUT5Q8/L057oqzrhkuEadEKSd4ciSyiQRtpV07vT7W+TUw/fRz5S
	Dxpzi8XTE1IJMEoap80rdFW2/N4vuPmCrjj8DfBF8UuAN1ANJm9lCen1hmzrk8Xn9SI7iWsiyb1Hr
	vDDeduRRW/5JZfgRc5T/8ZwD0zgdccuTOsAFbrdfPUOW85i/P3b6/373GdZEtvJOkkLsfYS0lnRpo
	RNx+f0XIqJbLAvMhHkpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onZN2-0084xl-1r; Wed, 26 Oct 2022 05:54:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onZMw-0084ri-Sa
	for linux-riscv@lists.infradead.org; Wed, 26 Oct 2022 05:54:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1666763666; x=1698299666;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=pqzhzEQqk7VyB7Ab9+L27bxW5/MsoF/k24tq6q4/qpg=;
  b=ZTdQU7tgRs4oA3NhifDfsmtLCEpWZazca+WzCZzbIbUU39zVzyCabxTg
   lFXyawwYAgrQTvRTudjLLCjAcxk41D59nbCI3Rx4poQ43e/cj/FJdXfIy
   df0WW/QqWmBkdRtZO4iYyZsn40Iy/R/eWf3rqrBOTXsqJIS1ookEXmso3
   QcyZTu1+sfTbFwh2nzsg9bvGWOtwEHo55NFW559s6qNRvLxSPv7fIf78K
   i5YLTchw4TCXPonNP8UXO7qcVVOr36pZkF11nn4u7F6XtV6XQPYD83ehD
   EZAI0jHoMkgbIwbK9Co3ShCnB+OnmOenJGgNgHbJVDs4FW96komUtIy4r
   g==;
X-IronPort-AV: E=Sophos;i="5.95,213,1661842800"; 
   d="scan'208";a="120382490"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Oct 2022 22:54:21 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 25 Oct 2022 22:54:20 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 25 Oct 2022 22:54:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=maBfLWmFMPsDHA43OJCc28VSm8QcA6ZX7HEhiUKunkP9DvcXduZWjVfarbyTUNGtRVtGBkilTvT5SvClHsFFf8L4Hcfm3+8Cke843bcaIS2XZSPQgKyPcDV4UX3hr2znmwbX5H7Tc458pInzFiq1isqTKU+HlDSaSo4iVstXEvKEfp2oOiXNNAGauA+0Gf11uRraRgu5+rF6jODR+nSgGwhMUkPJ8yo5/MQUQ+w3rqGY275MzeWgRr8G6r3Go7Wr7r1ZWDzI3bYBLLuUs1vDQdNhIiT68a2n1oKOl2pDSzIgZKv+cmoH5IY9XOOoHkA6vec07PklkBZpbxNFD3pD0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqzhzEQqk7VyB7Ab9+L27bxW5/MsoF/k24tq6q4/qpg=;
 b=YOPPaM3OVN4gWFTvwwqvW86VXE2e6ExlIWLOGyPPIeatfdhcAZd5nyuEoV1rxWPfcW670xzPgvZ9TFbIbldglRozETjXLFfpbSdWcsnoh3IY/0hAEkLbPe1p3457GCqjrWzDbPCBQhVUhuD76kEFkrodJdq2A7PcjGXjuQELx8ievkIgR0zIx0VAsQwnTqLLMktP6AYUaTdK0pQxgLaychTIu3qCpSl9ZPRpTImRreZ0ARaMLY0DeNWVLQB1XtCfYBERSnw2H+zMZX3yDgEC83yiat/rsGNciRo3GF/uN5kpiKbIsOS6G0tHM1XMdhTAFo5oDdZhXLrthqtJc7c2dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqzhzEQqk7VyB7Ab9+L27bxW5/MsoF/k24tq6q4/qpg=;
 b=DqFbOOKPQ4FgsoDyfDoJly57ORYHJHwOudzXYKusmQYJ3tW/RVYk+fxFXzfaeeNVQXLrOLV4IGRb9oABGEMiGc+ybZfe6OKFxO2v+HXxYDEqP4u/FAvj3jltDakXIVKbjrCcryklW8+5WrMR320IoyiajzJjPmWk/iLScVGnwGY=
Received: from SN6PR11MB2749.namprd11.prod.outlook.com (2603:10b6:805:5f::16)
 by MW4PR11MB5910.namprd11.prod.outlook.com (2603:10b6:303:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 05:54:16 +0000
Received: from SN6PR11MB2749.namprd11.prod.outlook.com
 ([fe80::c345:76f0:58a8:31ba]) by SN6PR11MB2749.namprd11.prod.outlook.com
 ([fe80::c345:76f0:58a8:31ba%6]) with mapi id 15.20.5746.028; Wed, 26 Oct 2022
 05:54:16 +0000
From: <Padmarao.Begari@microchip.com>
To: <conor@kernel.org>, <Conor.Dooley@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-kernel@vger.kernel.org>, <Daire.McNamara@microchip.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [RFC] riscv: dts: microchip: add OPPs to mpfs
Thread-Topic: [RFC] riscv: dts: microchip: add OPPs to mpfs
Thread-Index: AQHY5+AqRQC095ECRkKX8E8fBbJFtq4gLwGA
Date: Wed, 26 Oct 2022 05:54:16 +0000
Message-ID: <bf68f00675b5cbc6ba8099496ddb68ed20e84f05.camel@microchip.com>
References: <20221024193647.1089769-1-conor@kernel.org>
In-Reply-To: <20221024193647.1089769-1-conor@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2749:EE_|MW4PR11MB5910:EE_
x-ms-office365-filtering-correlation-id: cbae2e58-a501-4c60-0d67-08dab716846f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2lKKMLgv7EQqc4GTu3EaBTJyBQ1A7J6tWy/2/PhfTRsIFo5cmoh0WrZJh5K1pc0M6Swbw6QyRy3SpVv4Z/EqQa2MWmpyijv/tRw8Ao/o+0DFJFStmF3IwQd+o2WSwd3EoqML51gV/R6Cvr81tw+oitOfpYpGeHWj2e2QyfpG41wWug2ATHzwfZkvqGtYwSp4GkcjsfDH7MeMoNFpUUl1Gi2c3/07+xBxUhzv7GL9S3KLBuSL6c1tHTLKV/MFtbxnqlSX020haSfsEWOPadKuqwA0FNCNrPKzqaTfnM2Y9f/F0xzoFG/a++vgS4zoPVs9KVqXRDuY94X1vFy28pmAzDLBD0y56SofjKRwUAgCCG/QQlosqkUqjo/TtB4DuE3cbixqRes7YBG1YprQoW7Y7EAcKMipNdv/98C8bpMxk/0K8YNcpF8z7OY0GNrTp9xXB5EOvFe8C3GybIzXfR2/9WPN0qjTD/+DCpoX6duAGZ9pPa7timwBuyGxaWsYjeSvpB1ftpHTAWa7WBXyCeGF4PIV0RmDNKso6qNIWaqJHSxDteedQHPcTearmz1Rn+79rH+4jCjf6HmDYg/eMXRU6dN7ZIN6jA2pmPaAgselu33AsD0iXUs4jgjo+CZe/PIkxP6ucDV3VooPoY+Vzh/gFEtfbsjGzjkpQvbxQVfPwUqd7DWsrnFHEuyLlu4G9yC+TAXMM5c02j4AOT3dxWMCtLe4brqGwXkLc/EfxVmDJca+YRkng9FMOlS0APuBYrKbZ3Z6CF1eBT6xtUbvavnlrQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2749.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199015)(38070700005)(86362001)(38100700002)(71200400001)(4001150100001)(2906002)(6486002)(36756003)(478600001)(110136005)(8676002)(26005)(316002)(5660300002)(4326008)(91956017)(66446008)(66476007)(66556008)(66946007)(76116006)(64756008)(8936002)(54906003)(6636002)(41300700001)(6506007)(83380400001)(122000001)(6512007)(2616005)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U28yZ0hZZmIwNEh1UFZvbjZZdzBKdTc1VG9kVjhSUWNlaCsxdk5tSkFHZEdx?=
 =?utf-8?B?WkhSb1VoQkowSnJ1WjliVnFqVFdpTkJ5M01rVUVkTFEvNTRUbndOdDZiOUJR?=
 =?utf-8?B?VWhocGt0TWtXQjhBQ2V1dDV6bkFhZExUbUIxNnM1TzhDK3VTUm0xeDZrSWhk?=
 =?utf-8?B?UkdtWkQ3RUxrWk1WRG1uUnM4S1E2eEtoaittNWJrbDlwUFJORVZuUnpKdlJV?=
 =?utf-8?B?TkFNcHJlSXpTeFlYT0wvSHRUcHlpYXhlMWpIZ08xN0hTalRiWmhiMW12OFFM?=
 =?utf-8?B?cmJRSjRHYWhhVHIzMmFBeHcxMm44RFl1ZDlreTdReXc4a3R6aGhFaCtGNjFy?=
 =?utf-8?B?bzZJTFdxYW9Od2g1YjVSZTFsT1AvY2dHUlBFQm9EWlZ4YWpGcXJldVRmWkZ0?=
 =?utf-8?B?MDlQQWRIeFhzSkZTWjhBUTI5QTNQN2xkdnhhcm9kK3VOY2g5ZTd4c0NhWU1n?=
 =?utf-8?B?cEcreHcwWEpZZ00xbVdtNm5vMmNaeDYzK1l6dVhlbFZWQkhYNTZVamNrR20v?=
 =?utf-8?B?c0V4Um5YenhFTWZHaWQ1SUxITWFwcDNsajJwV2tIVHIzZVNiSlF5Z2t0Z3F1?=
 =?utf-8?B?ejFlNVBMOFBYbExFTGhjckZVM1YwSkdxM0UrdXNIZG42eDE4aXpHWE5HVTQy?=
 =?utf-8?B?dzI4MHFBMFg0cmk1TWsyeHpZbGl2QVA5WlZ5eGJJamxMblQzYkw2SzN0eE5V?=
 =?utf-8?B?WlYxWGUxV3JUUkd1RmxKaDRHWFJpcXh5Sld6QzhXa2lUZ1dFSzNsR1c4WmEy?=
 =?utf-8?B?K0JlV2dtcGtMZjk3R1pqdlBVZ29KTFpMblZtU0NkUWFYcnRXNUU0MTdpYmht?=
 =?utf-8?B?NzlpYUVQOE9wTUc3ZVpVM2xUM2lJNUZmSHE2aTUzdng1VmF3eFJTcWk1MXN0?=
 =?utf-8?B?KzFneWFxSlgwRmxBTHB4WHJxa2dXOWJOREw0TlY4NmlpcjZCK1picmpyL2lw?=
 =?utf-8?B?YThKL3R4dHZ3YzhXZ0hEemNJNHVrRUJVenRBakVaSDk2KzYrb2lZSmM1VEQx?=
 =?utf-8?B?dytmNHdiOWxLSy94NGdXQnFIR1RUNXFKNlpLVlpPTFFZM2ppa3E2amNFVDJC?=
 =?utf-8?B?NWVIV3VBUS9iemc2bE5jV3g4TFphUURFcnlJUXdCVFREc1gvd3hETDl5ckV2?=
 =?utf-8?B?Z0daRE5rd1pnZVRXUFJiRTN4NVJHRmxnSTdSd1ZMUTIwQ3VTMlprdzVLc2s3?=
 =?utf-8?B?d0FTNFI3WWlqMkpPVk9XQ1ZZeitpMkRmQkpadTFjaTVHalUzS1NvVDd3MllJ?=
 =?utf-8?B?UUFsYkJQMFdNeUhYUUx2Q3RyVjIxMUtMcHRJOXdBR3RJd0lyRVZ1ell2SHN2?=
 =?utf-8?B?d09Lck1MUmNUSzBpZW0vN3kxNU9lRVdWVmIzS0lRTnVzS3I1b3JOYTh5Y0dT?=
 =?utf-8?B?Q0xoVmpTVWFpU0ZraWQ3Z3YrZENNTFdZeGRRd3ZkZDl1NzFuWXdVSHg5TFhw?=
 =?utf-8?B?UWFtTTZDcnUvTktaUlpWNVIyT3FSMFlWQkdtNXNLRnJxa00vRk9oTmlXeGJJ?=
 =?utf-8?B?ZWJvOW9JOVBGZGtPaHhtZ3VuWkNwb0xtMmt6Qk5rak1RRGhUUXRQZHF3UXNn?=
 =?utf-8?B?RVE3eTMyZVFTUjdVRFlmQWlERXo0UjlOWUh4SnF2dDlNalp4REJoa1FRTmRt?=
 =?utf-8?B?OWV4WmxwS2g1RnpNOW5qNHk0bnZjV2RQbytqbjJYRkJDOC9IalZzdlZ5RTFP?=
 =?utf-8?B?Ny83WThXclRUR3ZTbHlTQTFSYkxhZ3JlYkJJcE1VcVV1clRNVFNhVFhQNHh4?=
 =?utf-8?B?aXdiRE5DREVxSTJNb2FKVlNBUFZac0w0QmZXaHdvaTBLNjk3QTg4eDdsdnVv?=
 =?utf-8?B?OTVIRTdxMWMyQy9LRGdVVGVtM2thUkZ0cTFhWDA2c2grVjlXS09vOEIxbnQ2?=
 =?utf-8?B?T0hpOVc2aFJET3VOSWZQeWhKdDVGV3o1KzJGV0ZVSW9POWNrMzNybXpJWGJJ?=
 =?utf-8?B?TVoxSEtvR0xkK216WkxuSy9kSnIweXlLck1uaGVBVGVpUDNFcUd6VWVlN1c3?=
 =?utf-8?B?enFvd0V2SEliQWNkMjBCZmQrN21CL2dZQnBDSEl5UENQN3dNbmZ6dTN1Rm9o?=
 =?utf-8?B?b1JOZ3gyTkQrbVk3UXdnQmRkcERiczN3KzN6UnVjYzMwdmppU0JUYmtqWHEz?=
 =?utf-8?B?VURFYzFJT28zRDR0MTI3cU83TS9hK1lGUUo0ajBManZlODh2TUhEYVVyUXVU?=
 =?utf-8?B?eHc9PQ==?=
Content-ID: <D52E5BD6C5CE824BAE1D51A2C2F2CEF0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2749.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbae2e58-a501-4c60-0d67-08dab716846f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2022 05:54:16.4755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v4wieY11NygPLbKfJlbs6xVSbe/xiJl59STJ0iDF3YMvTCBnaYWQKeiFEBhwZ71n3lT8WDKqhRX5yG2BRp6JeAbg8wif2WPjFoB/Gl40O90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5910
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_225427_042088_B3F808F0 
X-CRM114-Status: GOOD (  19.33  )
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

Hi Conor,
> On Mon, 2022-10-24 at 20:36 +0100, Conor Dooley wrote:
> 
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The U-Boot dts for mpfs defines three OPPs which are missing from the
> Linux dts. For ease of synchronisation of the two, add the missing
> OPPs
> to the Linux dt too.
> 
> CC: Padmarao Begari <padmarao.begari@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> 
> Hey Padmarao,
> I've been trying to pick off the bits that're different between the
> Linux
> & U-Boot dts. Do you remember why we added OPPs to the U-Boot dts but
> didn't propagate them elsewhere?
> 

Initially We added OPPs to the Linux dts for the CPU Frequency and
Voltage scaling while bringing up the Linux on an Emulation Platform
and the Icicle Kit for PolarFire SoC and same dts used for the U-Boot
but the U-Boot dts upstreamed first.

Regards
Padmarao 
 
>  arch/riscv/boot/dts/microchip/mpfs.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi
> b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> index 0a9bb84af438..9d9ff7174341 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> @@ -23,6 +23,7 @@ cpu0: cpu@0 {
>                         reg = <0>;
>                         riscv,isa = "rv64imac";
>                         clocks = <&clkcfg CLK_CPU>;
> +                       operating-points-v2 = <&cluster0_opps>;
>                         status = "disabled";
> 
>                         cpu0_intc: interrupt-controller {
> @@ -51,6 +52,7 @@ cpu1: cpu@1 {
>                         clocks = <&clkcfg CLK_CPU>;
>                         tlb-split;
>                         next-level-cache = <&cctrllr>;
> +                       operating-points-v2 = <&cluster0_opps>;
>                         status = "okay";
> 
>                         cpu1_intc: interrupt-controller {
> @@ -79,6 +81,7 @@ cpu2: cpu@2 {
>                         clocks = <&clkcfg CLK_CPU>;
>                         tlb-split;
>                         next-level-cache = <&cctrllr>;
> +                       operating-points-v2 = <&cluster0_opps>;
>                         status = "okay";
> 
>                         cpu2_intc: interrupt-controller {
> @@ -107,6 +110,7 @@ cpu3: cpu@3 {
>                         clocks = <&clkcfg CLK_CPU>;
>                         tlb-split;
>                         next-level-cache = <&cctrllr>;
> +                       operating-points-v2 = <&cluster0_opps>;
>                         status = "okay";
> 
>                         cpu3_intc: interrupt-controller {
> @@ -136,6 +140,7 @@ cpu4: cpu@4 {
>                         tlb-split;
>                         next-level-cache = <&cctrllr>;
>                         status = "okay";
> +                       operating-points-v2 = <&cluster0_opps>;
>                         cpu4_intc: interrupt-controller {
>                                 #interrupt-cells = <1>;
>                                 compatible = "riscv,cpu-intc";
> @@ -166,6 +171,24 @@ core4 {
>                                 };
>                         };
>                 };
> +
> +               cluster0_opps: opp-table {
> +                       compatible = "operating-points-v2";
> +                       opp-shared;
> +
> +                       opp-600000000 {
> +                           opp-hz = /bits/ 64 <600000000>;
> +                           opp-microvolt = <1100000>;
> +                       };
> +                       opp-300000000 {
> +                           opp-hz = /bits/ 64 <300000000>;
> +                           opp-microvolt = <950000>;
> +                       };
> +                       opp-150000000 {
> +                           opp-hz = /bits/ 64 <150000000>;
> +                           opp-microvolt = <750000>;
> +                       };
> +               };
>         };
> 
>         refclk: mssrefclk {
> --
> 2.38.0
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
