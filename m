Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2DAC00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ikMy6UU2g52T597JycINvI5cPpUAocufUXS03qOJS8c=; b=N8cIDu4A9FPdHk
	O73SHPjj91BFM7Tma4FRqLdcq3R4pXQ8/zaavuM+Sthz7IKbh7gSiO5Yc3u15jb2ZEd4v1nNDwAKd
	RoS4/9mTGftDJvDrOYUK0fgqnQhzkUMRNyQGmz6vlrpoi6i8irzvl16NlFdTXS8CAB5ytcdc6Lu7f
	xTQm0YwooNjpmBT/kRfXQqYmn4aeHAeanN1fjHfWd6MhyPOl0sElS+Tg+bUAsVNmYsLYadiHk2siV
	oej78Qt8wGfgHbQJKI8/RUAD9Kxe8NfjHBQMIBQ/WGQxRpq9Vyr373DTuzEX1xYNe0Hs8SjaoXWKi
	Hy+svGOSgujFK5yyZanQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNfHS-003ZxT-GY; Mon, 15 Aug 2022 18:57:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNfCu-003V7v-3s
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 18:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660589579; x=1692125579;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=oii10WxaGtqIju7S10s4D+DOVzG/J016pxfkE8MgTDk=;
  b=Y9hP3RV2JLHX3J75KvooeAjbxLlsPPQpKaM7VJ1rtWYDtGLmN16LdC+n
   m0iZyh+6i/e9LdkJAywORpXftvg3Zf9eNlVF5aQbwninUbwIKP+7my/Q4
   CJ4bTGFAaMVQyL34bZHKSc4pgJmRvEAsZ2Adr65SHWFNntMWYAvlSMgZV
   NwuyP56/VLR/umEFkkBKjILtelm5xhp5fNF+YpL89MTciNejJAasZDN9m
   dxVx3dpmPT0f6mL5kFJPxtYemGFR469gF8aIuZXt97LFkJE4bPO9WcO3N
   imTw4rw2OHmADpFheJKUu4m2V2X3Skk33E259He9COvTF54/wbKkZdY4E
   w==;
X-IronPort-AV: E=Sophos;i="5.93,239,1654585200"; 
   d="scan'208";a="186541258"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Aug 2022 11:52:54 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 15 Aug 2022 11:52:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 15 Aug 2022 11:52:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=camL2NmqbFlYfo0vYZmQkEcY9ME6j2rGys0vtOCazsywhrWCjocoxhLTxCYyVfdwJ846tIdv+TxULu+zMK7r97Rwrr2bv9VpaKKb9EhMj1BE7z4pwHWCB9Kk/S6UGqvZpOu+Co/UzKJAJ+ShrDYs0iufcXp8skyqwb+MrJdsZq6ykojXuK60GqOKhg/j3jv34qsiRHUcASnMnb/X+8Uim3HS5qd8R/4Uju/pG9UrNtlB8EWqjX1gL7TdaD/ZUOnY3GJGfjeqKA6IMqAJSglPFsf79C0taAVSGlQux3zO/KolkqkiOX2OxVhPFghANHGQN7FN64MZPvDioDvkaRTGig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oii10WxaGtqIju7S10s4D+DOVzG/J016pxfkE8MgTDk=;
 b=cbjl/YIKQDxfA5jr1gRTLz7wdZVv957yV48thw5VpuhwENAJgFvVnn052jgkKduAJoa0XTDasNBuJWpctYLzpZTwrw1P7ZcQIy+Enz5KieToQSqnDWBR1WDwpfzUNgGjC3fdOnNu1mZslXNyLTOqH7k5jRyMp6wkOna0vZnMtib5A1NFy8+mRsGjJ/8t+17xO9uXPdOvZ8YSQi+VK+UauACSlBMCsZ/jLgvvKbFyot5KB+xGum+/qqZQmQmYaUAZhBrA11Gg7vL1ov0GvCw9cPQMhPKkULYzAmamHAulnEHJPhPghshU0QhGc0W/Neiemb+f/67Z3fBjtI1CUNw+jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oii10WxaGtqIju7S10s4D+DOVzG/J016pxfkE8MgTDk=;
 b=HjFryUuoBPG4UbvIWNkl9vsgwCTzjUTTNbaf36S9TPSKTOfrAIwbqBZOnNZgxBeLi/RAZRB0R41mCcPZOXVyFHa5E4ahWCqvn07XHvTlsLPEJeAQ3JuH+wT+OyXmvAXPolWTw2o4w16SQtlkBA9Okkj79+piWG6FYrW2K/kzyxw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BL1PR11MB5446.namprd11.prod.outlook.com (2603:10b6:208:31e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Mon, 15 Aug
 2022 18:52:50 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 18:52:50 +0000
From: <Conor.Dooley@microchip.com>
To: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <geert+renesas@glider.be>
CC: <anup@brainfault.org>, <linux-renesas-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <prabhakar.csengg@gmail.com>,
	<biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 8/8] RISC-V: configs: defconfig: Enable Renesas RZ/Five
 SoC
Thread-Topic: [PATCH v2 8/8] RISC-V: configs: defconfig: Enable Renesas
 RZ/Five SoC
Thread-Index: AQHYsLoNIrzcJ1b/ykeOQ3jLymgw4q2wTvmA
Date: Mon, 15 Aug 2022 18:52:50 +0000
Message-ID: <ca555430-055c-debb-fdb4-fa7f78129780@microchip.com>
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220815151451.23293-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220815151451.23293-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f944baf-02ca-434f-db75-08da7eef5a40
x-ms-traffictypediagnostic: BL1PR11MB5446:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TAfdJ2B5D9ODpS+0XIC1hGxp/XfkFZlcqXruFJCZWZILG8swlHnDxRUjuPGaryD8TxI1yfoWT67kg0IdvQRC8x8mUcKmZIlNkTDbcA/16gt1U6+kLbFEcKjeVwRQYi+cDAzYXKJSazdR+AypoqQJYNcUyn+FA5mV7evspOJxPN0Pb2UVWLW3yog2XBEde4vIhrrAqTnEKG9GhJHFNGMt64WWOo+dKNvyntFz1HCIQSk24JIwcAYflxSjNzcVdrggHJ9zLr9FZ04fUyGoIUpiYPibkyDQGBg4G1hYjR53vPKkxf7Nh3qoZrIJM04ejeQGbZPjTrSjb2EkHOdhnJfPVWEBIQQZzvDmyKP2A4hvUHm1rmPQ9VnfvkFIEUSbwy7PXbRc2bqG0a2K3VxJJi7qtq5yCwO8mubwTIjXyaAWAXvtG5SWiPggBxerQEnC4xmGMLMC30B/NNteujUVhUjBrGxJWyE2FWdO2Piba3ObHhOWXZZ8QN7slTEfXfwiPtrGcBMR/VDikqZiE//nGceKceV+G6x8BVkCaw5GgpwhVHIfJ+VxT++7ErRcgl+38cVAW4NPdSUWkj8tJkseQYJcHx500EOJEx9PCw29TQRdpKxoJdaL+OsUXb8ol+I3SJ658KCf+VIgBJ0DkEBJW9zSd295TyJPIzwYtJYrZ+JRUvKzny6XpJAqtoCabEMsgM+aK/Ie0dUZthjLluy6SKID0hTC2kyJ7B2FdbD3YL7TLgDDPifnwBwjrCb2lwLIQwW7IKZ+Az2412VjEobAQ75n8CQJa4CWy5iKYYsVAXzp0x8SKksgG7z5ZKSG8zCMtbS0WL0sTgH974XPrW1WgGnOMF+gGu+F6+ZJETEr7lKftEM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(366004)(376002)(39860400002)(346002)(26005)(6512007)(38100700002)(122000001)(7416002)(6486002)(71200400001)(8936002)(5660300002)(86362001)(31696002)(478600001)(53546011)(6506007)(38070700005)(41300700001)(91956017)(2906002)(4326008)(66556008)(66946007)(66476007)(76116006)(66446008)(31686004)(186003)(64756008)(8676002)(54906003)(36756003)(2616005)(316002)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blBLTjBqak5DSDRjMDJPSUY0MVB4WnM2ZlZJL2svdkVEd2xhRE1tc2lzQ2dW?=
 =?utf-8?B?TnNMaklmNEZTWVZyN3Z6RzFtMTY2R1Qva2FSYTdvV1VnaVVhR3o0b3prcUdS?=
 =?utf-8?B?QXNTMHVqUmlTZTVHUll2Njk5dlBDUUw1UWE4UXlwYmIrYzM1VlI0dmkvVmp1?=
 =?utf-8?B?bnJkQ1ZBdTdFWVlMdklucEh6T1QrUzRSUDZNbmF5L1lNbTNLTnZRMnVaN1JH?=
 =?utf-8?B?Y2RKSTZJdGVyd0hZOVhaR2RsTDBpZkkwMUlRL0UxcXBzY3ZRMU5SOENRMDMz?=
 =?utf-8?B?YmgyMnhrTXBvOU1xVklBenBtNy8zSlJpeUZFdS80OThXdmVnTHkzUVdDVkVz?=
 =?utf-8?B?QURMais4RGhEMC92RzRqNkNmb1gxR01SeFlYdkNwTjlTT2U3L2lQei9lKzdP?=
 =?utf-8?B?YjhkVWNtWGNYZE15SFNYeE1QdFBGNk5NZUl3VWpKZDdmakhjbEdBTWdSSlpi?=
 =?utf-8?B?ekNHWjZkcFZLM3RBVUNMazN4WVlmbTZrVXFkY1FCYVVHajh3MDcrSWxsN2JB?=
 =?utf-8?B?SE5oVEJIemNiSTlHYmFDbmljVnovY0lsTm1xMUFsUHBjRGVIQ0trU0hPRDVM?=
 =?utf-8?B?WUtJQ21pL2tyZ0NSbFZReFZveVBobkEzcW5MRXJ3Q2QxMDNjVWd0M2g4Rm1S?=
 =?utf-8?B?eTMydm5xbTV6VnlvTVYybHduOVV1elY1U2JUcW81dTFxc2xINzRNUzNESXJp?=
 =?utf-8?B?YjRMSzU5Q0h6RWNxcWVhMEJpVFkvSk5nMitJQ2w2bmdWZmErTzdueFFsd1NH?=
 =?utf-8?B?QzBFVitQWUlwRTJFTVFpc3dpeEpYYWppZzM0YmRwT0N4L1hLSUpUQ3RlSzZT?=
 =?utf-8?B?UkJ1czlGQ05adGJ1WXM2dU5LbE0yN0ZhVGlhYUp6UnRtZ2VPNnlJdXh2M1FB?=
 =?utf-8?B?VVZmdlQyUncrOTEzTFdzbU83b3dQUlBpT2c2djZ6TFIzSGw1aTgrcXFYQVVy?=
 =?utf-8?B?MFNBUlVBMU8vSUNHTG5uUGpRczFSRVdVeWdLOUtMV2ZxdXVWNlFNZEw3ZjVM?=
 =?utf-8?B?d2ZPOWY4QTh4dXgwVkNKaEQ2Y2VsYzNYOVZ0am9oc2kyVlU0dFpTdDh0ZTd5?=
 =?utf-8?B?eTRhb3JuQzBqVDk3NnZEdlFmSkJpRkR1RFIwREZuV1lROWFsQUZ4R3JPVnVX?=
 =?utf-8?B?TmpjSHh4K3ZaRzdmQlE0UVdVR3pWbjdEKy9ndlZmOU5JS29nL2NlZVQ1MFIv?=
 =?utf-8?B?Zm5rWUNMMVljRDZ4b2h4SjVzdFkzelIyNG5lUDhJd2ZSVVpqZVM4VE82MWZm?=
 =?utf-8?B?ZFBEdUNkZnZXWGJvWGdoaTRma25BZkRQZDV4MjJ6WlIwZ3ZtbGNDYkZIY0Js?=
 =?utf-8?B?ZWthZDZ2U3R4UU1kUGRRUDRNbndSOUdZL1M4c1Q4NVJvZGRxUTE0bkgvOG5p?=
 =?utf-8?B?SDh6RVl6ai9Qa3FwOGJmY1YwZnZtVFZ2bVRpUisxckxjeXlIdzUyT29TSi90?=
 =?utf-8?B?M3hmSUk1UGZkSXVta3RNV3NMM084MkxRdUs4K3ZHeVRMTGxmUFhpaGhoWkRj?=
 =?utf-8?B?OFJEc29pNEVLc25ZSEE2N0pOVkpaS0xsdThiVEgvR1BLdFNiOTNSaVM0SDV4?=
 =?utf-8?B?WThWdUVnYTQxVXhxazN0WlY5dmFXVmlQcXR5Qm12UTVaU3FNNTJmbUg0OGtV?=
 =?utf-8?B?YzNIbUczNGtLWUN0Y3BRNmJqaE90TmlNZlFXY3c5TktXZUZuWmU0N0dCWnhr?=
 =?utf-8?B?TkR3bXQrOTg5N29KUFZScGZPcEhWNHBZdldMRDFiZHJieWFYcExHTzNxa1Jt?=
 =?utf-8?B?TG1zaXVyb2pjZzROaitsU0UzRUViN0hIZDJoN2t0RmhpbHFicFhoNm9NK1hs?=
 =?utf-8?B?ejZUNFVJcG1nTVU4ck9jak9jNHE4ZVhhR21qVWUxa0g3YW90ZWtWWGhMMDVj?=
 =?utf-8?B?b0lxQkNxYXpPdGxPWEw2ZEJFNXcxUlVWaWhYcnYxS1daeWNzNHNqbFFCYzRW?=
 =?utf-8?B?dW9PVWVJL1g5Y0RFeGtwWDNVZkRDTGhCdndneWwzVFZFV0FwMzlDKzUya2s0?=
 =?utf-8?B?OUVsL05UQ2tmTGRGUXJDMG5la3dnT0JTNEx3Tmg5V2xHeTh6bTdtU1o1dnVk?=
 =?utf-8?B?SnpuUGhTNDFYTnVJVHpkWVhYN2FMK3ZrQWRsSG1rNnlVNEgxKzRteUVDM0Q2?=
 =?utf-8?Q?8t4w1SbKaMO+we+a6WfhxFTju?=
Content-ID: <A82E234C39CEDB428CEBF05EF5CD97E5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f944baf-02ca-434f-db75-08da7eef5a40
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 18:52:50.2517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 42x35ukqNI3LDIXTvkAiZv/hY9SsQp1qJ6NMFx1yK6UvrKz2n3xH0Yl0+a+6vyiTA7kaIw32SMhH9POdQMSJBRlnD0o/Dqy15u7SEjng6zk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5446
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_115300_513341_3C046340 
X-CRM114-Status: GOOD (  15.42  )
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
> Enable Renesas RZ/Five SoC config in defconfig. It allows the default
> upstream kernel to boot on RZ/Five SMARC EVK board.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> * New patch
> ---
>  arch/riscv/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index aed332a9d4ea..de0ccf816c08 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -26,6 +26,7 @@ CONFIG_EXPERT=y
>  # CONFIG_SYSFS_SYSCALL is not set
>  CONFIG_PROFILING=y
>  CONFIG_SOC_MICROCHIP_POLARFIRE=y
> +CONFIG_SOC_RENESAS_RZFIVE=y
>  CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_STARFIVE=y
>  CONFIG_SOC_VIRT=y
> @@ -123,6 +124,7 @@ CONFIG_INPUT_MOUSEDEV=y
>  CONFIG_SERIAL_8250=y
>  CONFIG_SERIAL_8250_CONSOLE=y
>  CONFIG_SERIAL_OF_PLATFORM=y
> +CONFIG_SERIAL_SH_SCI=y

What's this? The patch text makes this look like an accidental
inclusion, but I figure it is required for boot?
Thanks,
Conor.

>  CONFIG_VIRTIO_CONSOLE=y
>  CONFIG_HW_RANDOM=y
>  CONFIG_HW_RANDOM_VIRTIO=y
> --
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
