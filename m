Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48377C433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Nov 2022 21:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UXscP0hilOQVqlX3jAdwU5Kw0Wy+ABLvLFXjzZvtvgM=; b=3iysEr8UknwIQ3
	U0DFxokAlV9JHVEADt/gakSOANNA1dMA1nj89dk2MowP3rwU1AVSGZGgnYpDt0iIxd/obtGEFdVJj
	KpvxkJ517+LXLprqxNwsJ013Q4zdTuwAdtTSP7psDpgizts4AOF1J+IJ8kYlvbgtNSPamLL0PDGAq
	B15iSB5XINr6RA3f6w8UR+JBBQSwdYrL0yL6oW4RQt+aY/h+0eMEJY1kPvI7cNIf6srsI6Fcc65DZ
	xwpiBE/C/gnsvdlNaexitq+bbC5ddG/MFLZ7NCSxdeDn125u1w01YQgI/j5uRO5T7bh+ncEPqDdLc
	sCLCDahGCISxQMJusDwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otyF0-007vF3-9F; Sat, 12 Nov 2022 21:40:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otyEv-007vC2-LB; Sat, 12 Nov 2022 21:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668289237; x=1699825237;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=KbozLfgQbHH2eSMDr27/fnWh8xq91/7N4ksyIqfFDBk=;
  b=ixwPfqeseCnkP9TSi5Bg2fjFuPWjLoPYP3Cz6UDlVZpQ1w0vqXaW2nCr
   h/qUWRonP6hVJlvAXs5W9COUnzjUvUv6azOjrc1GJ6VLL/YxRYWTklStv
   hYGbSqczQ/5Bbjb1knIcUNtsyM3gMoyNnbPKVc6yMIBAoIawir1yxSgx5
   TrRxU9zhjEhmD8MdMAmj/ZWrdqnUKPm9uMxlBoItjLzhAJnIRtut9gFPu
   kIFMyHkKnGWXmMGMpgRnGGUUcfmDSq+JpquWtBYAD2ly929Ja1jvmbHtS
   /+qO+krN54/xzZVpI9bhRJ9xDTSfEgketeg3QqZzswr5hVQ6oFjDym9+9
   w==;
X-IronPort-AV: E=Sophos;i="5.96,160,1665471600"; 
   d="scan'208";a="199563314"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Nov 2022 14:40:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sat, 12 Nov 2022 14:40:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Sat, 12 Nov 2022 14:40:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=caH33a7h0N17X/IPPQPuElGeTUfRV4dihP9Ux06OyNuvD/6kuWcvKYbPslC6S/PSUVE8+EsTd453nb1omlknDHB5WZOsEMiFyML/Y0DwekVo0tvM3vMuHauG2pu8riUdpLDzrWRRpdXeKTb05pgd5qzUz7l8wIZWCCe4ywEjxm0UyMcqrjYLpPjmQCP5AuPOMlbMoswST7RYYxHy2ikOjtNbZtH2VjspJRJ1x8RHgIUq0P/w1AHwR9yI3aF9xZXQiuBYFCErI5/GeAF2LkeiFaUgAlZLuH4aCfmUDjRW+CLKaYu0r51bO1X/xVFosSYqdNTVLn46Ry8rpAKMFRqOaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KbozLfgQbHH2eSMDr27/fnWh8xq91/7N4ksyIqfFDBk=;
 b=AoltaTnM8rwwrEs2B/MeqI2x9VvWYgEV+Z0ca782gztEMZv3oQ71fK2KxUaE36V5iIspJ7oCk1C0dFUDw/v/43ncYUUDQzXP1mETG32sWC4m4K4Olb97+WKaJlcG8nQic4XMfAXr0dwkBoYCeGEC3ppclxz/0nPotOgRh6Z99nDSfiCV4NGp+9bNEKCKpwXRI6/RlPimPtOVQSm8/YT5VS+H0LoLgGrnwhcYsV/AsG5rY3i1CvhHGM0allYNC4fHapRUCq1XmyEz5o1AIgvYqz5dkPsVwnrt5bhcpFhnZ6Yq5il19K1/4y7BR31goXDygSDoB6tQekcrvr5DgUN9WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbozLfgQbHH2eSMDr27/fnWh8xq91/7N4ksyIqfFDBk=;
 b=Z1h+SyPAnbBYzKgtAhOJnRD9bKMUb5lSfhOuqp9RcAaEwpiLE1QQia85oErtng2vBnpxDrJFvTnwb0OIu6a68KOn2FGY7XZpl6m0L/zx2eN213feHvApmOTtN55IlC7ZtLDF9vNOWfqLeMQaaLLv6NFq/jWFuFVlHAuKCfZDqHE=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CO1PR11MB4897.namprd11.prod.outlook.com (2603:10b6:303:97::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Sat, 12 Nov
 2022 21:40:28 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::5461:59a6:33b5:b985]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::5461:59a6:33b5:b985%7]) with mapi id 15.20.5813.016; Sat, 12 Nov 2022
 21:40:28 +0000
From: <Conor.Dooley@microchip.com>
To: <bigeasy@linutronix.de>, <jszhang@kernel.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<anup@brainfault.org>, <atishp@atishpatra.org>, <tglx@linutronix.de>,
	<rostedt@goodmis.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
	<kvm-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 0/5] riscv: add PREEMPT_RT support
Thread-Topic: [PATCH v2 0/5] riscv: add PREEMPT_RT support
Thread-Index: AQHYvWTJWdidtLbFYESs6cM+7jS71q3KyLAAgAFXEYCAAAVoAIBuFNKAgAAAhACAAgl5gA==
Date: Sat, 12 Nov 2022 21:40:28 +0000
Message-ID: <151be14c-3a2c-2721-a7dc-3f2be25bafb5@microchip.com>
References: <20220831175920.2806-1-jszhang@kernel.org>
 <4488b1ec-aa34-4be5-3b9b-c65f052f5270@microchip.com>
 <YxIAmT2X9TU1CZhC@xhacker>
 <ea5cdba4-7a79-56b3-f8d7-7785569dedd6@microchip.com>
 <Y25c626x6UPRtscs@linutronix.de>
 <ea0188d3-3886-6cb6-6811-82e4ffd992b8@microchip.com>
In-Reply-To: <ea0188d3-3886-6cb6-6811-82e4ffd992b8@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|CO1PR11MB4897:EE_
x-ms-office365-filtering-correlation-id: 60f4eadb-458f-4894-b9e1-08dac4f683ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r0djpBryXFkKObJDq6Em4rqF6e8/u5+e50q9hlSHD37NqoWszmN9hE7r6wfNF6/F0iJ+bOOU7dxHLUa+4cQaYCpi24hUCNSrv2addCGo8IQqQmOge5/324UW8DSN4fDskj/4MHIIteYJagPlGVLYBcKY/W8yFUDtddXrY9QY/GqleC7KxWZgdIUM9Wo4XU9qxOEH1LdTqCsQ1TevUhXhpo5i6oC3kSIYp6j1cIQZuk/IvxcqTihtiYd/9x3y2ssDdf5KXPNGtXn+9ffl9wgvopHEzOs8PIiINuZPjcEWnQryzWBIeiALgjaWtWJruhLjcdQnGgg2E0leG9Gd+5MFJy1LhYUtqOx13mhr/LmEdddUswKHoGc0VaOrKCM+PfIYWUG0WENkTrcyzqwkQJxejywrrP0Ct+3EsJZ6YVgh+CZjv26J5kRADO7yDhNChQPJrHq7yJ/z5uBpvqZ0curB+ddu1CQByLEMszVboLZ7CoqDdqPnSsIgBV0QouvFQkX9muoFLBUhcMXvzr+B2P2hWsg7Q9w4uKXKpRi36zaITxDEw6Znwy5Nw+sq2OLCWlUeAJQgjyOqVP5N25uBGrm5vU/pzathezfvqrtAGwq/WiE20aFrlI0d+grXczpn3cqVKBGY9OFw592uctCu3mhlV6HB45O6isrfG2naDIkzcZabcbWsSsnpT9aWPZWsqIv6k0zfCQyPBgLxllhnBD6WWCzCRrdpx1ZU/+76XsopX0lnD81Op17MED9nD991ehrftooBjmAz2NTFw1YQOChAMvlImjHMh5BdyxP8+qvebtqmSje+djvCstSjKg7cpp05QOLaARGmboVFHKnKkTHfYIjxMbd8ZYK6oY8yjXlyS8A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39850400004)(366004)(346002)(376002)(396003)(451199015)(38070700005)(316002)(31686004)(54906003)(66556008)(76116006)(91956017)(66946007)(4326008)(66446008)(64756008)(66476007)(38100700002)(110136005)(41300700001)(8676002)(122000001)(6486002)(478600001)(966005)(71200400001)(186003)(83380400001)(86362001)(7416002)(31696002)(5660300002)(26005)(2616005)(6512007)(2906002)(53546011)(6506007)(36756003)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUFWZCtKZmdzWm5qUC96LzlvQUt1VjlacTE0RkRRNnNyVEdDTCtJekxpbkx1?=
 =?utf-8?B?WU1pV0hrSC9pNVlOdEMza1AzQWhISk1vWnZnT2Yzc0JnRTRZMVpHbnhHWlQr?=
 =?utf-8?B?eXNrUzRxQUkzNFVGWUlqOVYraVBDV0pFcGpVaHR6NzlSMXpHaHBKdmxwcGtq?=
 =?utf-8?B?anhCaVltKy8xaS9EcWM1TkNOcWRLRTNkVG9vdkZhNllObUVHam9ENys3TVA2?=
 =?utf-8?B?VnFQTTJTajMrcmphenovaitDbGZyaC83ellmSTZzSFAzc1BrRWFXeUhnUURF?=
 =?utf-8?B?QVNMb0xnK0Zlc3ZQUEJ6bWN6QzhwajZlbE1wczF2d3Q4UGpsRjJYMkRVczRy?=
 =?utf-8?B?V0c0NHZSL2tVL3hvNE9SSEkydkVEV3U0TXJvbjdtNWQveEh1SStENkR0UDFs?=
 =?utf-8?B?ODV3QUdIVFE2RTBKaDlWNTdRSEV6SXYvNWFMVFlZaUxNUzdoN0laRnNlMDJ4?=
 =?utf-8?B?VHAyOGNoYVZXWjNSMnFXNTg2M2pFd01IcjFrakR3SDBpbXhWZGhDbGJLQm5i?=
 =?utf-8?B?RXEyeXJqRUJrc3Q1djR1MVplRnR4SG5xWkw4aTJadWNzcGVzdlBTTG1TWTBk?=
 =?utf-8?B?aUJkUmpoZ3B4MWRoWHdzanVSb3FRL3VzY2gvT1JCTTU4OTExL1dFbHhJMHcv?=
 =?utf-8?B?OEdIQWxKMkVBV1dEV0lweWZndExKK3JCVUFuVXZZRkloMERrQ1R5QmMzaXA0?=
 =?utf-8?B?SE9yUjFIMi9KUmZYRHlsZy83TExZOGdRM2t5TEFYYkptaDVxRXYvTHoyTEND?=
 =?utf-8?B?RDYxZXpNMU8yVVk2bkIyV0NDNDlJWFYxaUd5RkNYVExINy9UN0lKR25GdXc3?=
 =?utf-8?B?cndnY3ZtZ1A3VmQ4bU05V2g2V0wwaDJQY1RYY2EwTmlyOWpYOW5UT0U4RWdl?=
 =?utf-8?B?L2F1QVBZVlB1YzNCd09kQzZBNEVLaEZYb05mbDBSZFZkeFlQYytzQjdpMTdn?=
 =?utf-8?B?ci9rR2NFb2c4R3JXeUlXUk94Nmg0Y295U05tUnZhaituRlJJbXp1S2gybmlV?=
 =?utf-8?B?SmdXSlZTeWFZMjNndXEyV1hidkhwR1V0MEd1UFVDcGZaWUlmY016NmM0MTJK?=
 =?utf-8?B?ZlNWVHF1U3FKOGFKY3lncW14SXF6TFg3M0NYZzlwR3U1ZmdVek1NYit5bjZo?=
 =?utf-8?B?WlcwVXVwVWhPRDZiMzNkSWhYbW5EUDhQdXV1WjRPcWdNMkdHbFU3RzNRYkpK?=
 =?utf-8?B?TDErZEd4MS9uVFpmcFJWNlFVeGx3R0VNWTZHN01IbmxGMmVZbFU1Smx5UzRC?=
 =?utf-8?B?Ui96TGpZencwYUV5OEVOSU1GMTFLVk1LNng0Rk9vR3h6RStCUGZtaUpHY0ov?=
 =?utf-8?B?WTM0QUpMem5UektUNnNLaWt4bnNFaG54ZllLTVhZZVNRSHc2OG9FT1p0RTdu?=
 =?utf-8?B?MEdwTFAxUURYUXR1QXNjeDdWMSswalJheDR2MjZnVzlnWkdVcTFXTitEUzFm?=
 =?utf-8?B?Y1lNVlY1RmtRUDFlVlhUVkhQck80cVFyWmJ4cmdWMUVlTnQvYWZmYlJJK0VC?=
 =?utf-8?B?Q3VwNW1xcFlxL3JHQWYyVHpQb0MwRkVtalV6WTRyczhxbFFROHpqcjBwOWh4?=
 =?utf-8?B?UkNDcDRQdzNkM3dERDZRdUdKRCszdEZoYUlhUDU3bWdhNG5XTS9PQlNwMnJK?=
 =?utf-8?B?dERBRFdaVUtzTFE5Qm9XN0wzR3l6UmUvRS9FWTg4aldGUktSdlo2RXMrZVlu?=
 =?utf-8?B?THAydDVrM3NwNVN6U3hjUUtGdGFIVE1WVGEvR0hCMnRVWlFKMDdoenY3dFdz?=
 =?utf-8?B?ZGgvMWRIUzBaazNLendHRTgzUVVxMkJiazFyb1ZSdlF4OVBpa2ovbFc1TUpG?=
 =?utf-8?B?eWkyQnBISTB2U3JkR3owOUpyV05XS0drYmd4MWtLckVacHBhRXZaSnNydDVC?=
 =?utf-8?B?aTlUZndqRHlnZkZneC9yNmw1TjFiWHFsNkxTMmU3SmRpN2N3c244OWtocFNu?=
 =?utf-8?B?UlZCM0g4SWUvQ3AzN3B1RW8xWEZYbkNjSS9YTlFnV2ZKdzgrOVFyUjR3cHFs?=
 =?utf-8?B?cWY1eFdpTHdGZG5JdGk2N3lpcWNoVXd4SCtvYmUwT0hPMC9vSWJhM1NIZFBN?=
 =?utf-8?B?WHl1bUtFeXlONU16L2xVSUQrZElQY25GT3hramRxMWVCNkJad3M5ZFFiVXhj?=
 =?utf-8?Q?qmIHE3MBpAj+u085gLLjsNpq9?=
Content-ID: <7548ABFD0DA79F4898A7CCDCBD5D037A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f4eadb-458f-4894-b9e1-08dac4f683ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2022 21:40:28.1763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6xCeZMqOedZwYKGu1usOQ3MJUg8NyJR83YxlbKPeX1STASEsjb3CaN6e+7dmQWELzgZ1O8zbdbtqjgYqJRPbdeRPvr1UJjG7eWUfKWFlHyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4897
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221112_134037_966727_FDA80195 
X-CRM114-Status: GOOD (  12.74  )
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

On 11/11/2022 14:34, Conor Dooley - M52691 wrote:
> On 11/11/2022 14:32, Sebastian Andrzej Siewior wrote:
>> On 2022-09-02 13:29:23 [+0000], Conor.Dooley@microchip.com wrote:
>>> I'll give it a run through tonight or tomorrow & give you a full log
>>> of what I saw. There's some splats all over the place for me, but I
>>> can't tell if that's just knock-on from the other issues.
>>
>> Is there an update to this or the series as a whole?
> 
> Not from me.. completely forgot about it.
> I'll put it back in my todo list, sorry.
> 

I tried out v6.0.5-rc5 + this patchset (it doesnt apply to v6.1-rcN)
and rt14, got the following:
[    4.036667] smp: Bringing up secondary CPUs ...
[    4.069365] BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:46
[    4.069389] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, name: swapper/1
[    4.069410] preempt_count: 1, expected: 0
[    4.069422] RCU nest depth: 1, expected: 1
[    4.069434] 3 locks held by swapper/1/0:
[    4.069449]  #0: ffffffd82cda3b58 (&pcp->lock){+.+.}-{2:2}, at: get_page_from_freelist+0x220/0x1094
[    4.069537]  #1: ffffffff8129b178 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire+0x0/0x2e
[    4.069602]  #2: ffffffff813a3e38 (&zone->lock){+.+.}-{2:2}, at: __rmqueue_pcplist+0x156/0xc28
[    4.069662] irq event stamp: 0
[    4.069670] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
[    4.069690] hardirqs last disabled at (0): [<ffffffff8000f0c8>] copy_process+0x50c/0xdaa
[    4.069727] softirqs last  enabled at (0): [<ffffffff8000f0d6>] copy_process+0x51a/0xdaa
[    4.069756] softirqs last disabled at (0): [<0000000000000000>] 0x0
[    4.069776] Preemption disabled at:
[    4.069782] [<ffffffff80041346>] migrate_enable+0x32/0x124
[    4.069819] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 6.0.5-rt14-00006-g0fda08a972f4-dirty #1
[    4.069848] Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
[    4.069861] Call Trace:
[    4.069870] [<ffffffff80006628>] show_stack+0x2c/0x38
[    4.069907] [<ffffffff80900ad4>] dump_stack_lvl+0x64/0x86
[    4.069935] [<ffffffff80900b0a>] dump_stack+0x14/0x1c
[    4.069959] [<ffffffff80047534>] __might_resched+0x1bc/0x1c6
[    4.069995] [<ffffffff80908f7a>] rt_spin_lock+0x42/0xb8
[    4.070033] [<ffffffff801cab7a>] __rmqueue_pcplist+0x156/0xc28
[    4.070061] [<ffffffff801cbade>] get_page_from_freelist+0x24e/0x1094
[    4.070088] [<ffffffff801cb712>] __alloc_pages+0xc6/0x244
[    4.070113] [<ffffffff801ede42>] new_slab+0x8c/0x4a8
[    4.070153] [<ffffffff801e955a>] ___slab_alloc+0x5d4/0x9a4
[    4.070181] [<ffffffff801ea206>] __kmalloc+0xc0/0x1fc
[    4.070209] [<ffffffff80578296>] detect_cache_attributes+0xb4/0x470
[    4.070238] [<ffffffff80590520>] update_siblings_masks+0x2c/0x202
[    4.070270] [<ffffffff80590aa0>] store_cpu_topology+0x30/0x6a
[    4.070296] [<ffffffff80007756>] smp_callin+0x38/0x66
[    4.231582] smp: Brought up 1 node, 4 CPUs

There's other stuff that goes awry later on too:
https://gist.githubusercontent.com/ConchuOD/47fd47dfa1f49eb4b0f2fb2a68852a7c/raw/b109b83eec6caa1d67cbb156c6f3e671c10aefe9/gistfile1.txt

The SDHCI stuff I am seeing without rt & in v6.1-rc4 so is
unrelated, but the rest resembles what I saw previously.
idk anything about -rt so if there's something blatant that
I've missed here, please lmk.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
