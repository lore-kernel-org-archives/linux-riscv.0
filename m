Return-Path: <SRS0=hRw5=MF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE94C11F68
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jul 2021 15:31:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 783BD60698
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jul 2021 15:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 783BD60698
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bgH8OsmQH3R0s2hlXWh0Kf0Lp/4d6pFsjTJg/J88rcI=; b=yGvlb2Y3ieLuVC
	Da3veYNrkE7m05swCITk1AKAtDIU00CiK82rs5d+Am44svryQBoNpV7ee3++7mHBy66lLIIX0LPhb
	P+i45Df9yXYH4Y5HZA07lsrqVMnmDxmdbH9CwNgXbXRrrb8fsLKoRhTLGAB2YQLeacbqlFS/rLvG5
	LHnJ+dohWazce8iE298mFIP4dMAA0EMW98MliP+PsR7pRtousJRisUKvs4vst80ozhNug8UadzJ4k
	Pq3SQlmQHJFA/HKMId5adhMNvUJdeEpRW312nYo6zKBEAsZ0tVgG2Px0ww6xZxyATuxMPbNGJwJaz
	WYxemCxlT3oPq7pxJ6hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3KNO-00AmMo-Di; Tue, 13 Jul 2021 15:31:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3KNL-00AmM8-TI
 for linux-riscv@lists.infradead.org; Tue, 13 Jul 2021 15:31:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1626190272; x=1657726272;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fS7e4jaLv5R4o9jqAlK3q5NmgS1KLdEcnDQICvkEOq4=;
 b=I3X++hf+kIMsDXwlAg+lMC8UUAK8XDbKeHhYs9UHg6dbMmQuhTjkN92h
 6t0ekEFCnfnVViytWwlJVSc1YhRbkWlzHFdnSO5W1N6XgZAzjqWZnUwCB
 4exX09z7YgNSlvYThCLRa9KFUzCd4ME7OIpmaPf7k/BkvbwX6awIT+4/c
 VfFG4yxRKii49CwSclQ1GfFVVem3nBWr0ah3fVTy5g3sVhqZQnlp+YXgB
 U4Rw1qdDF3aoMn/coELgkJp0ILVJQc4kYZsyB5+Yc+vJtE8tjMGjxWU06
 iGmlg/dc5uPU+mLjRJMbavXZ3hJqTAGt6p+I8BTPc8y1mWoAjsBBkw3Gh w==;
IronPort-SDR: GULcsuWKrEasYVa0BlZDtqWwHIk6LSqw9XuffvSuOv3plelW5sx3qd2uoqZ8mAM2nKDp4IPYNw
 FjPM0TDQc/8n7P3TQlB/gAIgVJ5FnpUjUGjhu5W+KkDwHLmWMyYaeZcuAoQzDI7PjMusV5c62+
 OMJPGqkTN8Z1/d/szzg0+Ud0eFcKxN7uhzd0M4Xy0n5/Q6VZf2bMBOT31LtLpkgiE1Mw0+ol4w
 J7WzBLosMXuSvWK9YEfeVxPnAW9k2vDGJRKcZ+f1J/ePaUuoieIfCqPCRId0SNuXuV2wslgCxa
 LXY=
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="124408891"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Jul 2021 08:31:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Jul 2021 08:31:03 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Tue, 13 Jul 2021 08:31:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQL2Y/j2opZZwREXySB+EhBnlkILJE0RV2OSKfPFyJ8x+PQ6TYbGBFDrIc/7qIxmbMMkFkZhFjBUlZo01+Y+Ugn6E/usG9s2JRh8nnFTcL1HxNJeeBI9j/FRbVD1as/98EyXK+ikBRKeOfDYbPtdHRWkwypgcIeUjfrtENuc5hz0dY3OWNpuh1wYdMnN290CyPck3fWBMxS/o6Kgzs1m/7TtI+q5JYxy3zK5/bGJjZsPu8+pBWcv2uIQtailwl2iaF7hvxumchfV/BcR5dtylPTuWPgSgk1lK94EqD9RPAazYokbvt62qd0xHgYwiWQsyfXt0JlZRhcNpSEiEak3ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fS7e4jaLv5R4o9jqAlK3q5NmgS1KLdEcnDQICvkEOq4=;
 b=mKo7pyVpOf7a0e0Sn4CIMO92nnD2Su/Vhmj9jl/SC5TW1zcmR9Fn8bj+ICVV1kpAmh7Gu/LLtowyD9pBON3Qwa1pkPs/gf4XKQafR08DNunp3afQfDESqmWxO9h1iXLqejHtTN+z2eqKu7wNX7GRUscAmPNpzoNmATrF4X5bha01lID1u07n3KjHX2Forn+iXPk3wgsien5bR5c+Z21wt5QyJUA6WsbfExqkIv9wrbgvuaT9+J7jyiCIfZxXKw9H1r31CDEqoqRRA5Th/DW4T/9zMjENyElg5hDBKl29kd0MjFztov7pqmfQLGoo3sdiikiV0ID1ka6GGM8Jq8+Z6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fS7e4jaLv5R4o9jqAlK3q5NmgS1KLdEcnDQICvkEOq4=;
 b=ImLwbcaZiaASEu3YdMh+pzyhL5bGcIx/hs1TzRzKGAZrzVyaGjYpZdERTlZOywGPPoITi/yjNex3eI/ISdGed7FB9sWmgQm8k1C0AWJ96DRALteXwUl5UQIXQkJnLL8TEPcXtlfctxBBKxKSBV2KGB+PDSwAi5U3XnPjsXyxXCI=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by PH0PR11MB5157.namprd11.prod.outlook.com (2603:10b6:510:3d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Tue, 13 Jul
 2021 15:31:02 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::a825:537d:74ba:2aaf]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::a825:537d:74ba:2aaf%7]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 15:31:02 +0000
From: <Conor.Dooley@microchip.com>
To: <bmeng.cn@gmail.com>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
 <atish.patra@wdc.com>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
CC: <bin.meng@windriver.com>
Subject: Re: [PATCH] riscv: dts: microchip: Define hart clocks
Thread-Topic: [PATCH] riscv: dts: microchip: Define hart clocks
Thread-Index: AQHXYni+ww8V9O36KECu4yl9LqyAo6tBMzmA
Date: Tue, 13 Jul 2021 15:31:02 +0000
Message-ID: <cd14275c-4a81-ad92-ffc7-d81ead203fad@microchip.com>
References: <20210616062739.398790-1-bmeng.cn@gmail.com>
In-Reply-To: <20210616062739.398790-1-bmeng.cn@gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 769eadc0-22ed-47d6-e8b0-08d946133919
x-ms-traffictypediagnostic: PH0PR11MB5157:
x-microsoft-antispam-prvs: <PH0PR11MB515733CFD6E22048F3B1E95A98149@PH0PR11MB5157.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9xRZG8cms5Q/BBGr+VBbC0ncHIvw6Y/gofCO7VXdpc24DtM18bqdGygK6WLXYj1RkxHRHqrPaOXZd6bpN/P7gsh6ahizHlUo/WAbc7Gu72RwYSnDbVZAatJZ5V3HL3NsRaNw1shr2qbXH7NrZfutgvOoH2E7o9VzHUUqLAcxCCSehX3gpM3CD8pU6cdmmksZEsK12En3kXNQxGUnoS6JmplyujojYYywkhwxvnjAMdQAusS9/X441CSoHxKoaFtYttUa/K+ip3rC4101R69zgjJBS0sCWZCZ/Xy9GhE2LqqnlCH9HAPNHw900qOVk0l3TMDWtoZmKMm0Rc1eSL7qLWUsIF71h5zZE0rxDgInd0MpB/CvNJNKa3rmro7Hkbkb8GLAbV3UQ0zBn/ZnHiWWQcXWyZ3YZU4/GPytEkRb6yFtzVl3qVqO8y496Af5MxVMWUq49zpOKBb9QpGjPj3aNbaBsteBuHkXXPDKyTSdiZMd1tUljs3nPs1Ukuibk8Gpl7ETdVAhJXatL6aF7Gpop3im0m/Uvj+LTOKXPcI2rqm3fP/t2y34Tm7hk9QhzOLlyNE7/IL2kRrXIF13ZUI6JR2tySrzeQ3GsMy5bVOFvD/lFf2oGf3rm+RISoTw8QoeDBM1rONcjP4Mrs1J2FdGV27s01g3j6s49IpHPmy38WNI+9twd2zkqidlmzWcqkNjc3KLpSs2dC7bbmCc5jEPR/bVIDa+ezOaK4XQX6w0WysNQwTdcFdXqvhQyPQUTZdCRSBMkLIQdOdFPKzV+yRpW/AyY5aI1s4msAVFXLMkAN9E4k+M/FJYqlqUpBSXbqnw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5160.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(346002)(366004)(136003)(376002)(6512007)(2616005)(36756003)(31696002)(966005)(122000001)(6486002)(4326008)(110136005)(8936002)(8676002)(316002)(91956017)(6506007)(76116006)(5660300002)(83380400001)(66556008)(86362001)(2906002)(66946007)(66476007)(66446008)(478600001)(31686004)(186003)(53546011)(38100700002)(26005)(71200400001)(64756008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVBKYnE3OWNocktHSzdpRFF0UXZPRUdmVU05aDNiTzdtR2gwR09VZFBkWlVz?=
 =?utf-8?B?cEJtQ3JkVUNqQWwybGg2dnBnTzlLa05UeVZSTW5XOWcwQXo1Tzh4NFQwSzc5?=
 =?utf-8?B?NjFHOXZSVEljNTdDUVZuajNUcEllaUE3RXcwcmowVmJwYVBkR2ZiSWRKOFNB?=
 =?utf-8?B?MHlwVGR5NnM4N1F2OUlVbFkrVUFBMUlxVW9hdCtTYVhJb2Rxa2ZSdmJjOFZ1?=
 =?utf-8?B?SXJ3Z0E3VlVZMnVMUkExWVlJQnNpbWhDSXZCQ0xDNUI1NFVpMGI1WDBwUVg4?=
 =?utf-8?B?M2t5MEg2RVJqeHRtNFV6ZXZRQmpaUGhUb3R0MGoyQ3R0T2N4b0V2S3l3dkgx?=
 =?utf-8?B?bVhxTkNUUDQyanNkT1pjL2toNDZ5TWdoZjBILzRCcXU1NWU2SXRneHRwL0tG?=
 =?utf-8?B?bVc5R1k5QlFOYlRHbWNhSm5PSlduNXg0RTRCNmR4WWkyU1ZCUDUxRE1vQzZv?=
 =?utf-8?B?REpPTUVmWmhGV2dFT1lXY0xoVWpqTkJqL1ZKN0pNVFZReHNtbFNkVGY4amF5?=
 =?utf-8?B?Q2NhNnhBTEFyUDc5MnBpZW5Oam54RDJnZHZnTUxScEpIdi9zUnpDNm9ScEVD?=
 =?utf-8?B?SnRBdGo1QnpyQVRIUkc1ZHIzOE54STJWdlVnOERGQzBWcmgvQkxMUk1hRk9U?=
 =?utf-8?B?ZWdSNGtWQ1NLZlhhWE9reEhOdE56S2xVWHZhL0dUNkYwQnJzVkpZWm1rNWVH?=
 =?utf-8?B?bnJYK1VQdlpTa2JQeHZzeWtOc2g4N2JnS1dwYTdFQkpkVWRORnJLbFF3clM1?=
 =?utf-8?B?UHBSa08xUXhYc0drUzB4WmRyUWx6SWMzSy9JMlFzR3N2Y3lxNUxkLzNUbWEx?=
 =?utf-8?B?dUlRODJLbEFzemtxK2hZZzZGRElPcFErbzdGNGNGR1BOVkZXUVcrWUNwSGRH?=
 =?utf-8?B?WDEwT3VacTJqbW9zcmpNRGd2TXdDZHhtTzVVbS9nWnR6SUU4WVhxbzljdFJC?=
 =?utf-8?B?SHJhSXdZNjJPNzlhaXJ1dkdZK3lDM3NaMTRMdmoxU2d4aEw3Y2VPNEFBa3Qz?=
 =?utf-8?B?MEFTVDNHUEpCYVRVTEhlUk5mQWZZUkY0MUdLQm8zUmxYbWJqWnI2dktZaGw5?=
 =?utf-8?B?N29ack8rRTRrQ1BSZ3pkYktIcFBacWR0b1dnVzN6SEpCZzMvWnEwS2JEUXl1?=
 =?utf-8?B?NE15Z0lnK1dXbDZOU01IRTg0VXl0Q3JxOGp4L1hubjZUamszaTI5aXFZZmIy?=
 =?utf-8?B?TFNkM2kwajEyNDUydHlNeExZSEEvT1pibW04OVh6M1Q4ZXM4czFEWFJjUWVC?=
 =?utf-8?B?MW9XWkdHMmR5c0Y5Y0tSekgrdTNTbjNLOXpRWXhraTdaVTNzYzZNajVQdDNK?=
 =?utf-8?B?dHIrdHdKQWJkcDRsM2hCTVdITUV2YVVTdzk3aVZHSi9KZ0I5RHl3WnlKeWNC?=
 =?utf-8?B?RVpZZlZ6OWNlOEdzQ2ZxaEszQkhBY24wSW0xQkl5YjNSWDBCWHJaQmRkWGFs?=
 =?utf-8?B?VzZwWDNCaGJWTVlRRm0wM1pSdExVSW42Q21iV2F3N1pqeVMrU3daZ1hMaThL?=
 =?utf-8?B?WXI1c0JENStSNnRHd0VjYUgzRnJOaThxNjUyVGVnNmRGNFJaUWsrSXlIL3hV?=
 =?utf-8?B?REVBc3VPSUJkb2pLcHJXRDZWa0FKZW1KaUtYbklReHpYU2hwRko1bm55MU1K?=
 =?utf-8?B?ODlLVVR4M1M1SFVNNXlKbllUUWFpWmpxYkdOaDhNMlhwbGZHcFZIdjBRZ0py?=
 =?utf-8?B?VDdDK0s1dnN0Mm1KRUdEd3diVG5kNzJ0Ri8wbkdmNXpXTDBESW9JU1RHcWNk?=
 =?utf-8?Q?mziCkU8VoqwRQQe8WyaYbcd4XjtYKpxVsJo1D6E?=
x-ms-exchange-transport-forked: True
Content-ID: <3FD7CC67539AA64F928B4934EC22D8A9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 769eadc0-22ed-47d6-e8b0-08d946133919
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2021 15:31:02.5251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pI8MpUcAH1nFTWsLuzoq57pHMVSBgW95HY5I7kFKl/zJHNOWbKAlAhmUOkOMqhDQHMnfoBGSKR/9yAU+hI8Z+QAxEUUe68dy2cKxwO6srcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_083112_094548_5BB790F7 
X-CRM114-Status: GOOD (  16.05  )
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

On 16/06/2021 07:27, Bin Meng wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Declare that each hart in the DT is clocked by <&clkcfg 0>.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> ---
> Similar to https://patchwork.kernel.org/project/linux-riscv/patch/1592308864-30205-3-git-send-email-yash.shah@sifive.com/,
> this adds the same <clock> property to PolarFire SoC CPU nodes so that we can
> calculate the running frequency of the hart.
>
>   arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> index a00d9dc560d3..0659068b62f7 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -24,6 +24,7 @@ cpu@0 {
>                          i-cache-size = <16384>;
>                          reg = <0>;
>                          riscv,isa = "rv64imac";
> +                       clocks = <&clkcfg 0>;
>                          status = "disabled";
>
>                          cpu0_intc: interrupt-controller {
> @@ -50,6 +51,7 @@ cpu@1 {
>                          reg = <1>;
>                          riscv,isa = "rv64imafdc";
>                          tlb-split;
> +                       clocks = <&clkcfg 0>;
>                          status = "okay";
>
>                          cpu1_intc: interrupt-controller {
> @@ -76,6 +78,7 @@ cpu@2 {
>                          reg = <2>;
>                          riscv,isa = "rv64imafdc";
>                          tlb-split;
> +                       clocks = <&clkcfg 0>;
>                          status = "okay";
>
>                          cpu2_intc: interrupt-controller {
> @@ -102,6 +105,7 @@ cpu@3 {
>                          reg = <3>;
>                          riscv,isa = "rv64imafdc";
>                          tlb-split;
> +                       clocks = <&clkcfg 0>;
>                          status = "okay";
>
>                          cpu3_intc: interrupt-controller {
> @@ -128,6 +132,7 @@ cpu@4 {
>                          reg = <4>;
>                          riscv,isa = "rv64imafdc";
>                          tlb-split;
> +                       clocks = <&clkcfg 0>;
>                          status = "okay";
>                          cpu4_intc: interrupt-controller {
>                                  #interrupt-cells = <1>;
> --
> 2.25.1
>

Reviewed-by: conor dooley<conor.dooley@microchip.com>

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
