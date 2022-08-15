Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0C0C00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 19:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DjGgJyZRRJ3UEwQlgrGWA2AXOd0KFweK+ySEJcmhCmg=; b=Gn8ntBMSOGcaln
	TqKbUAUXwYLN5M0S7U/pQbGl81DZ+FalBWt76q0aHx3kJOzQnO4YKi3UiGmUmvSqe2GXIPXyl+aFW
	b+XZuSJ6UTcE79BmsCp9KBHRnSJdZJ/FCU6nj4N6dTMWX5QxgB5uuMC5tA8glaI7mF7obxOxAygoH
	uEqA8issls0ZVtVEqHahEYkv4DL9YPtAicj1EhO8GbCchqhE1YPEUV0OTUQqP9Qe4Ju4IzRvZZBZU
	eNZVJlRfjGQbD/dtxbg6GydXwAi+Gwl6A6dYd/iN45cl+4IsvhCX0jobVvz8szNVwsIVrfZNw8lOe
	YE2+xoeNyXsrp86e6SWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNfUD-003liQ-PT; Mon, 15 Aug 2022 19:10:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNfTd-003kts-K6
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 19:10:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660590617; x=1692126617;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=J/JPhVs81qTXNGUrFY4AhNf3YA4cq/stojr2Gfkf/pM=;
  b=nrdRW8Kg/EOJttaoi+JU/Sf+LkVDNSsWeyMSnH1OArbnkgYfkfOCgGoZ
   RrfIBjyiKI3Gmj+W/KYz/cFL/Xm3+HxxH7q63OGqMIzNwGoYrew0uDZI1
   6+TDBez/MOd/7P8X3n6CCM6FOP8cJJkXUIjc/pNX8dRgPRmOitnv1qr5W
   9rCO4aTYKSAGtlwcqagodObOv7hDsD8qkakXZz1rImbXSwdGDgFdvIzQs
   RIgDq/OwuV2VYeFL2pS3LwDJgEx/P0molRNgdg8pSId9HqqNgxpMoA7CZ
   Pci8IgLKhxrrchTjHjEb2Mg7fTo4be23BG60YqUvsaf6XkqZDpGEcj9q9
   g==;
X-IronPort-AV: E=Sophos;i="5.93,239,1654585200"; 
   d="scan'208";a="172538702"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Aug 2022 12:10:10 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 15 Aug 2022 12:10:09 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 15 Aug 2022 12:10:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJTDxCNXdySLpbUw97DJ+4cS0QUxmkjoYpixYD0949riCMwsDKdyDlQK/vcs+tjsOe/xrriMu2LiI/fvwWpP7ge+g8QbW2LUxww89AgHeSPtrbW3jtN2d1Fh5aixXQTKhAviUYy9dZ2bZbpCycKf/XvgL67fxQqhyMgjR+pj8Nnnv+pEzRF/pIZD26KkaVwFSuYGTvuMrThBi+Mj6VTBhCU+JyWJbJVqWYM+sUKgUECvsVxZbVeHHyQ+VALiP/0Tc32bm5aEi5wh5IIT1jIAADt24YkaEmPGk4EBAabxyXAnMd5+FSSvJLFoQLiB6xY6ulZXtF20l8IxocwLZlSfsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/JPhVs81qTXNGUrFY4AhNf3YA4cq/stojr2Gfkf/pM=;
 b=mt3MLWFR1U03MoxW0RrQHJDlCgXenaoMImX45xEPCQp8emdgI69fcjbJXqZU7Nd5ff6/DWPhVEWOPOFMkDVLSJbdQQ7muKHbbLPcOPGnNfvZkCHiKY1ffRzq4o1PHhphtU521Ktgwz3GO9N3u5rirYI4KOwGo/8Up+9nVGeuGjKE9/62Rg1uIz2S7OPIpLh7VIcaVXItCFYrYHld+lCOsuvOvMbY+s5wwCqAmZ0JuIpL2aCgwAjGX44LIkgjZ+drVKgLrgamU6Nstof3LxVF6IZnSWfT6uqs193VBcAFbfEwzvQW0/NHiqDD8nMut2tU954eohG8i3pcufr674WSgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/JPhVs81qTXNGUrFY4AhNf3YA4cq/stojr2Gfkf/pM=;
 b=g0kjYg0+NsrPrDFMNNfRoPFdpFKj8QC2BW9lyBmIzeWy0jKgmqh3Rsftjw0xRGO8/m07EibJ/FOJCy9IBwIDES/zjjG/qEUHV5AUOKwOp+DKURw1Q27q9G0qA9LRYNQaX8F6O8m6ZnlaOiB+3PA8qkOCTXm9DZC3WMIA0QSfXYg=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN2PR11MB4551.namprd11.prod.outlook.com (2603:10b6:208:269::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 15 Aug
 2022 19:10:04 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 19:10:04 +0000
From: <Conor.Dooley@microchip.com>
To: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <geert+renesas@glider.be>
CC: <anup@brainfault.org>, <linux-renesas-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <prabhakar.csengg@gmail.com>,
	<biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 4/8] RISC-V: Kconfig.socs: Add Renesas RZ/Five SoC
 kconfig option
Thread-Topic: [PATCH v2 4/8] RISC-V: Kconfig.socs: Add Renesas RZ/Five SoC
 kconfig option
Thread-Index: AQHYsLoPyzdSi5rmak2RSuYw1tRBkK2wU8sA
Date: Mon, 15 Aug 2022 19:10:04 +0000
Message-ID: <d9d0deef-92e1-05b4-a195-d2ca03801129@microchip.com>
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220815151451.23293-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220815151451.23293-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8dd55728-02c7-4ed7-50e1-08da7ef1c2c1
x-ms-traffictypediagnostic: MN2PR11MB4551:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tHj2dh2cc4VIruK3KJPO8jvwjz9TF5XtydGsyv+Ur/5AuVkN8lqzrD+JmCZwUFusZ1Su5C1SWa/0VnPIRpibfPx6O2q8XLV9r7BNCXCOQysnUca48n870wSdRAqyLNrJMyYqirwS/IlZAuC9KAqGzV5oL1WVsDDkXaGkMWIkmhuK6aSscSUMBskwjT8DPus5KmGCOOFH4YCJCGLPx2i+U/9sD77P3ePO0tilVBBneAyHJ6HJ00+NPQGrasIaZg9Oh53kSiPK8eoKj5fupINoLUs/KFLuBriGOelu8jgpEBQMjyS++OWM5Z0g8hAjXvNvyk0xdas0wHntaGAyYaZatM6ZqNzeKuHm4NyAA4ufS5ocyRaGw/PRb8hp4IdkEvq3VnGHaypfg03CIZqsaP2MGZPa0Wtxqtpr73Sd+4wALoK9A5jUxuvKPe16kGgOBvLkIn1ZAr1bVJj+ZEof2rqakXqluNpgF7wrV5ouuXhuSZmX3ZCoeWlJqkRJWMleKZU8lrsRMCY/RUarmd/4bbS55URQ3VbURG/IU6O4f++3ld9BitgEs5DYYHWDTPpI3Nk+qprE1QVymEgPYYPLmXMKFXglIUGOizMv8ykz2J9UrYVcL7XMd+4QxVCa2ahJ5p296BOH8PY1rBrVJIR2PRG4G2LG8Z2kRek8qF0pCMvJ2HeEJxVpajs9g2verGtX+jROiZ18gTyWl7xyFBrBd5GKJBGPR36Tc8VFVT3z0JDqt033uV9yXtFUv6aiOh4SFUjxZwqTGYiQsFmWgMD++Y61QcjXtok5zjkhPCqmUQ77pc7X+UcldPBXuK1ZCH1d4h+LWiXf6KNlMLIj3W0g82nH3EJAPTd2vY+RLPFoa2CB2uSUwI2hLHu3QC9gnYwoKWve
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(396003)(366004)(39860400002)(376002)(186003)(110136005)(54906003)(31696002)(86362001)(83380400001)(38100700002)(8676002)(6486002)(36756003)(66556008)(66476007)(66446008)(64756008)(4326008)(91956017)(76116006)(31686004)(71200400001)(66946007)(316002)(5660300002)(8936002)(38070700005)(6506007)(6512007)(2906002)(2616005)(53546011)(122000001)(26005)(41300700001)(7416002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDFVQXlWYkUvclhDMkVVcmFaZXA4Sy95RG1Vc1MxZzlLVEZxNW4xaDJOSC9s?=
 =?utf-8?B?V1hYSW85RytiTVEzRDBkY1k1STNiN2VYNEJpQXpBYkpQVU5VcGtBYVd4VXdZ?=
 =?utf-8?B?RjgwdW5SLzFmYUU4TDUvVGdYSmtVU21HamY2dnRQYmlFSmE1cW5DeHdhOTFN?=
 =?utf-8?B?aHh5UHdNVksyLzZtNEtyU2tLM0NobUVZc2J4dGN0ODhoVG1nbTZDOSs4MGxE?=
 =?utf-8?B?cnFKWmdKQmNUSzZGOEc5bkVSeFA0Uzh0THRkK2VXeXFEWmFEOUtmc2d0bzFZ?=
 =?utf-8?B?Yjk2enBxUjMwazhaL2hvNlB0RmNrUmRta3czMUFLM3FaZTlVV0IrbzJuV1Jk?=
 =?utf-8?B?ZG9OY2hnVitCYjNLTlZuN0I1dmlaVHM0Z0NWd3Q2a3RCOTNvZWdsS05qYlJU?=
 =?utf-8?B?RjFoZEtMWkZlVW1zT09RQVVvTGxQZnFkN05Za3EzWmZjaXA5SlVsNjVtQlNs?=
 =?utf-8?B?RFNHK0p6cWJwK0xWVE9ybkhmS0Y4bVFxNjZvaEJQcEgyODZONDhkeTdHdUJw?=
 =?utf-8?B?aUNpMXJ3eTlhclZzbGZTR2tvR0VkU2UvY1hRdy9mVlpUYjJlVGVraGY4R243?=
 =?utf-8?B?VkFYQ3E0QUtjNmNrYTQrQVMwUVNwZTMzZ09ma2hDZ3FRQVN2VGpHb3VLeWVs?=
 =?utf-8?B?MU9WZTV2ejZlTWk2bno1ZHE2eDg2WjM1dmIzcmUvaXpUbXVuNUNhU3JLa2d5?=
 =?utf-8?B?Z3lsbXFJODZtZE9ZN1M1VG1WbjFabW16RVZXaXNWSnVKMDVDbm9UYnJxR1VS?=
 =?utf-8?B?UGRWa3ZVajdmSFJqeldHeUlIWTF4K2MrWUFPVEhrNmdERFdva1NmckxOcC90?=
 =?utf-8?B?QndPeitnOUtvdmNMZVZQMGFUZ2tVeC9EbHlSbW9WMnV5bEJWQ01zQUYvVERk?=
 =?utf-8?B?eDcvditSWmtVS0g2c2NmVlk5M3QvWnJNR0RoZkFWUkpJY1h0QXpVUlhVZ0h2?=
 =?utf-8?B?OVNJZlRBZmZIUWRxRUYydTNkVEFmRjkyUHd4aS9DSU05c2RGT1E1cHp3RXNP?=
 =?utf-8?B?N3JFdTlZRnk2czhwelpSY0MwZXVNbmh0SlRMamw5ZmFqSDZzdzhWVmVQWTA2?=
 =?utf-8?B?MmsyRUlYWEV5aEJ2bld0b2ZQL01EMzhRYittWXpUTndLS0pIT0Z1SnhhMnF4?=
 =?utf-8?B?dXdnUTlQNU9rNjFQODE2RGJnc0hSTVBjUlJ6TmF3YlM4VUdNTU9ZMnVtWGJ1?=
 =?utf-8?B?NUtoazMzcE1yaGlsU1VXNThXcnNjSHloS3pESGJ0S2YvSHR3TXhNemFjc2VY?=
 =?utf-8?B?K0NhSnBqY0ZCUEdlNnEydEFmZGN4cjRXMzI2YW5PZ2piTCtyZkl0TGdQSHZV?=
 =?utf-8?B?TVM2VlEzVTZJS3c0ZitmZkkyVzJFSTVCN0JxS3lhM1I4SkRqYUdMa3N2VDE1?=
 =?utf-8?B?WTdzVHozZEY2WnExVW1jc0p4MGJVZjZrbjgySTRiWEZkTlhhditpUnVHZXR6?=
 =?utf-8?B?YmQvaElmelA5Y1ZzQ2VPeE9WMnQ2K0JKTXpsdkdMS3ByUVJOaFZNSHV5V3ZJ?=
 =?utf-8?B?YmNNOFMyLy82eXY1dDNydHFGaE10QXlGdG5XaDJyMFNLVGdQUmF6Znd3NkVH?=
 =?utf-8?B?VHZDaGVHUCtPaXVHUEphNG1oTDhYYzJhNzBsSmRnei9SSW9nRnBzb21OU3VF?=
 =?utf-8?B?dGdtTk5Ua3RpRVdnbitwclRrY29LbjR1Y09ObUhWbkVzUUI4VFdidUJDNk9R?=
 =?utf-8?B?Um9sQlJRU0d2dFhmeWwzaFJ0Q253cExNQ0lpeXdTLzZQRHdDbTV0Wkd0MmtP?=
 =?utf-8?B?S3gwWUxnSFg1VnVwd2lqcDA0WHJCQWZOZWxHbU9mR3JhcjlYa04zTGJvRCs2?=
 =?utf-8?B?eC9TdlBkZ1NTWEtqTStDT0VlR1ZZak9HRFFYZnFSZHRQbVduUThPbGpWVnNB?=
 =?utf-8?B?QUdRSFBiRHl4dW9tRUJEQzdHSHJpa0M3MGVoOVJ5dWJuOU1ma2oxT2NQdHhl?=
 =?utf-8?B?K2prM1gzeWFOeGZmbVh5YnN2VytMZHdzbUM5bm9Seit6TXAxQUwxYmFKcDdZ?=
 =?utf-8?B?Wks5QVQzYk0xUkNHekJmeEpTWms4TWxqc2MxS3Jma3dnWHA5NUhXSUxTT3FS?=
 =?utf-8?B?ZTNhYXNMMUZwejg1cEpUdWJhemRCNTI5Yk9mYkx5STAwTkZZQzRsQ3Fsc2dt?=
 =?utf-8?Q?N0agmvPEHbjzr+OceXZN73BPJ?=
Content-ID: <3A80B40DF22834419DF80944A001C584@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dd55728-02c7-4ed7-50e1-08da7ef1c2c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 19:10:04.5857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8zr2sH/OrUTeObsPu731CY1xU17GJoPUMLlVyis/akm3rkZsyl5BPy3vubG5QIylUlvFtZogoNs/IW4ldplDD0+IRkq44sPpjsOa3hXPzss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4551
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_121017_862161_38283E74 
X-CRM114-Status: GOOD (  18.38  )
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

On 15/08/2022 16:14, Lad Prabhakar wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Introduce SOC_RENESAS_RZFIVE config option to enable Renesas RZ/Five
> (R9A07G043) SoC, along side also add ARCH_RENESAS config option as most
> of the Renesas drivers depend on this config option.

Hey Lad,

I think I said something similar on v1, but I said it again
to Samuel today so I may as well repost here too:
"I think this and patch 12/12 with the defconfig changes should be
deferred until post LPC (which still leaves plenty of time for
making the 6.1 merge window). We already have like 4 different
approaches between the existing SOC_FOO symbols & two more when
D1 stuff and the Renesas stuff is considered.

Plan is to decide at LPC on one approach for what to do with
Kconfig.socs & to me it seems like a good idea to do what's being
done here - it's likely that further arm vendors will move and
keeping the common symbols makes a lot of sense to me..."

Also, for the sake of my OCD could you pick either riscv or
RISC-V and use it for the whole series? Pedantic I guess, but
/shrug

Thanks,
Conor.

> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> * No Change
> ---
>  arch/riscv/Kconfig.socs | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 69774bb362d6..91b7f38b77a8 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -80,4 +80,18 @@ config SOC_CANAAN_K210_DTB_SOURCE
> 
>  endif # SOC_CANAAN
> 
> +config ARCH_RENESAS
> +       bool
> +       select GPIOLIB
> +       select PINCTRL
> +       select SOC_BUS
> +
> +config SOC_RENESAS_RZFIVE
> +       bool "Renesas RZ/Five SoC"
> +       select ARCH_R9A07G043
> +       select ARCH_RENESAS
> +       select RESET_CONTROLLER
> +       help
> +         This enables support for Renesas RZ/Five SoC.
> +
>  endmenu # "SoC selection"
> --
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
