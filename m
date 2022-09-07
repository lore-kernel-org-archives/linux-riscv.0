Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC07EC38145
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Sep 2022 16:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HpxwhMz8RPBiMvcI9Fa5NdGu7CDMRE+y6D7qfKNgPtc=; b=Xdgs+R5vKHQYE+
	euZ4teqoJCGXCkEq+L2ptd1iiY4wgrc5QcEvUslhGtkCSSZ1RGvu51SVk6UcxzVFz+igHFgeWwpXa
	RLUUfxe6jYXsQzUlJJI72V/LsZQZ97fNr61pS2mAl9zDfgZbh8eUB1COT0r0J1lrbuGPGryZwnRF2
	Ax2bbxeSg+84wZAJ/5TKdPZ2R1ofAXyO94Ck3/iEfoGezwXKlylPN8Beatp3ENqPY2gsjwaTd3etS
	Wg9mf30lxh3DoAfEXO//aULxkq/E3T6n05CPVMczyhOGJ/Ge2b0aCKg5gAyYly/pSCsDBKUizrCOt
	oe2DKnkQZU7JpLvcyuAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVy5U-007py5-9k; Wed, 07 Sep 2022 16:39:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVy5R-007pwX-Lj; Wed, 07 Sep 2022 16:39:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662568777; x=1694104777;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=WTIDlFIiwwTxacwlDSpQ2gzq+EIo9lGUxo0rwNAHQVo=;
  b=fQf41Getn4CZofG2eSotrqOVUoOUrQdhPqaIkhzPEu8RWe/+fKxZP2+D
   AJ15NEX5UbmOA3phX/Nz+WHwBhhkv6bduBVMgHUrsLUibBvyKaxQsHsKY
   sLSop0c34Sg7ek4DqO1dkGO45wsTeFHfE0VGgtGeH57H2MW9Fkhqa//Jg
   PnXOOalgapoOKoV7dMcQfUPtVq+qwqI0L5zGQ2ep+ZrJZ+HjMexRZs4Rn
   TgtgNq5nMKaQilhp3XqEIDsDxYOU9ClbWEJpKmzaMMTPHf575sjLxyLKf
   8yTOpsx6/Fwy0GPp2/UU4jGM69Ai32xqaP7GPpqVIn36CCUbSSG8H8iH9
   g==;
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; 
   d="scan'208";a="176050034"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Sep 2022 09:39:36 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Sep 2022 09:39:35 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 7 Sep 2022 09:39:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETbfI0YTcJ7OzyoCDdpbEq1hCqhOYN0isb/TdnnxwMKl4waC7c9MieEsIClk5HHb8oKDPH9Zinyd45sFlSCL9kHJ9hs0ejIFWkF/a20Vg1iuVDm9r46s8BBZYT96Rzlu6detPC3PpmBf44ICtZUCWAMZJUttvGvIJlHNFQxtMny+qhwSDTN6ZifZTZMKBaQ9r8dOCCVLWjZGwb/hYUGangJD+WY0UA7iTP8D78IyVjxgZQuUuET+KuTqZB4vIOvQemqQb0PGNm/u5A7JuOR6NHQWlIjwDR7bzn1cT/izvtm2TSwe4/UJVkuUo9BY4ns6Cr190JXaTUJfII1tFE4DAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTIDlFIiwwTxacwlDSpQ2gzq+EIo9lGUxo0rwNAHQVo=;
 b=DrymWN8wQlPpaPuMSanAJ3lNntHmJyrFuFg/kKIa7Fy3ZTbn/cGLnnL8NSsZEO2VYSHFf2RHHountmDSz9Q99cKyK5awyKMogPrhKuVYNwTq230N8F4pWkNksaPp1kH9Xyn7YUZnbVG9JiZ9dyd3Yu8LIJu2gWst+dkVKe5kbvF4rJyqwk4ugfzhdID1dbjsF63YySFd9HA+c2wVKnSbP9mJw/Uf3FjpY7QanUyyhqE3qBg0AOIhHmBi9Ctry5YrS+JmnwAA04qBs+zrw/wCrpKFXc2qRBa5JT9rFj1Ni2J20QnQ+1JIb+2x5mBCBVujSp0zphk7tjJQ1jeew77d4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTIDlFIiwwTxacwlDSpQ2gzq+EIo9lGUxo0rwNAHQVo=;
 b=YRsNx5g0pJWW91cd7xuS04V21ynDSs0WuIOKJxzFdMJNq5JdcN+ZwxRofECNsveUxPskPZHwk6XfcO/e6G5JRdkiAc1dkDm1eK1rE6Lb6HoSl8OVEz/jHJ/Cpntn3RpxFRrh7VY/5ezNT9RmjaZMe1VVeri66MXzxwrLOIBGr/8=
Received: from SA2PR11MB5163.namprd11.prod.outlook.com (2603:10b6:806:113::20)
 by MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Wed, 7 Sep
 2022 16:39:32 +0000
Received: from SA2PR11MB5163.namprd11.prod.outlook.com
 ([fe80::1169:5ec9:62a8:d220]) by SA2PR11MB5163.namprd11.prod.outlook.com
 ([fe80::1169:5ec9:62a8:d220%5]) with mapi id 15.20.5588.011; Wed, 7 Sep 2022
 16:39:31 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>, <palmer@dabbelt.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <atishp@atishpatra.org>,
	<Brice.Goglin@inria.fr>, <gregkh@linuxfoundation.org>
Subject: Re: [GIT PULL] Fix RISC-V's arch-topology reporting
Thread-Topic: [GIT PULL] Fix RISC-V's arch-topology reporting
Thread-Index: AQHYsPRyXnHNGxm8rkSgpyoSWfWKT63UTuQA
Date: Wed, 7 Sep 2022 16:39:31 +0000
Message-ID: <afa3b7a8-3615-36bb-4850-b7966028f74c@microchip.com>
References: <4849490e-b362-c13a-c2e4-82acc3268a3f@microchip.com>
In-Reply-To: <4849490e-b362-c13a-c2e4-82acc3268a3f@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b61d5ab6-0806-4806-97de-08da90ef8a4a
x-ms-traffictypediagnostic: MWHPR11MB1358:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iOSrhsKFvVluK7fJK5omMN1HMaG2BW0jYCIvHbLMK+Fd9vyHmT+U+ZpHixxeRXuOM7fZypYHo+7FhekUtz2psLU+G2wBAkuBq1AyEm7p+jK/faGfPEEwyUaJMi5abtvIhtF6O2poi/8oTY2sBSPrwLNcwx0KDUgu8+HgOWdBu+GTLK1oCzgjgC0R2F8DkfKSv0u4bYxT69qGG7dRPE/5L2x9J6X/gtOx8xI9zEqO6K0HVJLER6tZGif2p7KvqrfSf894N7a6m6Xm4AD2yfOOEgCeMRlU6lP4TpR8kPHatWccMf+FXhu7odCvepFJ9CoUMMI8ojURP2wcPUzJgvOa03sZ7YGSuPk7lLJUzgRAt5E60s/d1JOmyo5DHt+0u2u7Ruxy1mfHFfUj3tdxivTM8SGrxmto3ls+dJ7GXFMaJov9x7hglnP5UpVRwDRv5YMP31lnks6IZYjlQUfopwYJwpU1JNVEhoFUr+MQq1+ZBJYIh9hLAebWHPOmJtEg4jpoT8QWI6dEVlaVa5gnZ8YU98Ck1y/VUF91ENDH2m1bUGU/R37RMATEJOegMHh0ZwQWy91nS+lJpupJ7gMHpCFF3PL/iZigA7OXtvBg3SiCAPkW1Hq5hZWqJLuD0XpH1wfrxH7ejMuhcg87pJvvEeB15De42+vor+uaHug7vfAKDxyb2lfOPHOkqlKb3IYYTzXnfJx5WIP0TkBpywqEAskd3nkWbRFxtV+NhKIFlWL4hwaXTWInYdVL8yC++Xs+aB21Ckt9iBs2384nHXNSzwEgj0perDi4ExtnHqZVSvEs0FwVaMAChbdSzcpVLHRO6iF/VETqZHC9pSLFpKwJ1x8pI8w271zJvX7S4FE5qXnZOSzARSDTdyqEgWyy2NBubGreKv9s12p3a3i/uXtPYOCZSg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB5163.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(366004)(39860400002)(346002)(136003)(8936002)(36756003)(316002)(5660300002)(31686004)(6512007)(41300700001)(54906003)(478600001)(53546011)(86362001)(110136005)(26005)(6486002)(71200400001)(966005)(7416002)(6506007)(83380400001)(38070700005)(91956017)(186003)(66556008)(8676002)(2906002)(66946007)(66446008)(4326008)(38100700002)(2616005)(66476007)(64756008)(31696002)(76116006)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDJZY3pMMXJhT2VPYjJtQXZacVk1RHJzTERDa1kyUnR2a2oybmdjZ2J6aTVW?=
 =?utf-8?B?QUpyeTkvajhFUnlJRkpVejZDTUwzQWdVMzJBazF2WUM3VmJ6Vmd6UEV1aWtR?=
 =?utf-8?B?dUVLem9wazJIeDR4eEZpcFVGTHVFTjdKd3VCWlozcWgvOUlIZHkwQWdXZHY1?=
 =?utf-8?B?UEdjZTFhNUFqQU5Ya29ZRTlFbEsxYlBrd2htTGNxSjJadmxhSGZLTVZ2ZENT?=
 =?utf-8?B?TmZ6czNsZEh5MytGb0RIcHZPWnBwYVgyU1o3bXVVYzIyVUJQd2VURlNPUTV5?=
 =?utf-8?B?NDdvemhlOVZhcmFlQ2hPckdsa2NMcmlFOFFNYXdKN25GdU13UkNDdjQ2MmRZ?=
 =?utf-8?B?VXdYc2E0UG9MUVd3TFZJMjVCalVocWRvdmZPcUo3eWhVWE90MkNJVHplalI3?=
 =?utf-8?B?TWFYQ09CU3VNZk9HZWNXMC96RGlUMUJENjY5N2lkNndnQ3ZPeTlWeWNRWTRi?=
 =?utf-8?B?Y3YzZ2lvUkhSK3dqRExUZmRXSVhHZmJ5aHB5bnovQmVFUiszOGF5SkUwcHhy?=
 =?utf-8?B?QmUvdGh3SXp5bmJwMnliMWlvN3doZGtVTy91Ym1qZkNmYWR3UXloeHFRTEpD?=
 =?utf-8?B?TDZ2TVdjZVhENW9WaEJaZnNZQmxkbVIwUDNHZ0xPdEM3aGdZZTlxV2hodDN2?=
 =?utf-8?B?NXIwQUxoaEwyR29ZRlBpUzNLWWpLajR4WjllWk5YSnlDbmh0UmJ5SXpNQllK?=
 =?utf-8?B?MEZ0UlZaOThxWTZMZWs2bjZtSXROZ0JVdFBHZVNTUkhONjR1bDlLTXVUbjFo?=
 =?utf-8?B?ZjlYdGVEb3I3bDhvcHo3VmdjNTF4RE1YSmNHbmpkRmI1bTVuekFrZmpCS2ZW?=
 =?utf-8?B?MXlKVjBLNFlBV3hKZERETm1BbURxR2wxckJMOFNsMGhYMWdOSWlIVCtSM3dY?=
 =?utf-8?B?YVNHUFI1bVFvckdLejZyNnFxN1V0R0tFWEh1aDRlekJiRVI2YnlJK3c1YVZ4?=
 =?utf-8?B?Yms3dmMwMGFuMWRnMnYxTGt5K2xKRGlqMnJ6R0YxdnhUUU53enhFZEs4bDhO?=
 =?utf-8?B?ZzVVYzNTMm5URGJyYlYyQmMxdFhGY2JGQWxtZ2NGRnAzTFpNVitlWEgzeE9o?=
 =?utf-8?B?OUpDWStScUdON0dGV3NlL1pJV0g2UXlWcFBnV0R0aWhHYWUwUjJKdHlud2F6?=
 =?utf-8?B?aXErUGlJclZ3TG56YnNjcmFXcENBd2ZBclN6LzRKcCtkZ2x5Y2VNSXhheFYz?=
 =?utf-8?B?b25HamFTNy9WWXZKa0tVZ2J5czR2bGVtQVdBT1ZUZnN4UHNvalhtZ1NCT3dD?=
 =?utf-8?B?VERwei8xbEQ1aEtZZGFmZWI5RzM4eExhdEtzNmw1eG9hMFVDZzdIZVAyVlgr?=
 =?utf-8?B?dTZLRmMrUW54UXBHVjR4aDB1TU1sRHk3cjJKOXNCNGJITEJraTl0aldBWWYx?=
 =?utf-8?B?ZkRvdkVzeXBpVUh3Nys1d3MxcXJBekNrRjMwQnJYSklEckhKMzB2aTRRZHZu?=
 =?utf-8?B?OHdNYWVVYkQ5dnZMTDlEUmdrVXVuUTUxN2s3M1hZMDdKSmY3LzFNdGF5dW5D?=
 =?utf-8?B?NTJScUpqd0xRczMrTElTS2o1d3pmRFVBajgyL0x2c0pjbTRSWFc2TUpqRnUv?=
 =?utf-8?B?eWVkK09PREVyMjB6NzlJRGpnWVFLbDRQcGQ2QStCeWozYmVKcktqZmNvbm00?=
 =?utf-8?B?dWlXb012S0NXbjVvYjVwT0ZlL2xGYlhscGFsczNwUVprQlJBU2JORHRDTnZq?=
 =?utf-8?B?TDdXZnoybzZNbmdTbWdobEc5dTBQcFhSeHdaWkZmc25jT09Lci9ONk85UHBn?=
 =?utf-8?B?a2RrOHRJU2ttMnArREVoZFljVmlNQjJwMHNMdXhhWC82VVJ2QWV3WCttNVY2?=
 =?utf-8?B?UDFabzNqZm9PbzhLWDBVaVlUVHk0RENTaXJleFlveXZqRXNWRUJpVlJDMElt?=
 =?utf-8?B?WU9ybkxmRitZdFR0cS9lWlNSQk5QWEdCSElXZ0JrRVhQNGZjV3pETkMzbWNu?=
 =?utf-8?B?K1JlK2xnUFdlREJqQnZLK0Mwc3ltQzJVYitBWHhkdVRCTmUxN2pHbXVDVDZx?=
 =?utf-8?B?aitXVzZreU5FMVRqMHB5bU1jd0QzWndyVnFRUnVxaytxNDlZOSs1RW5Pa0Rm?=
 =?utf-8?B?WHp0YmVTY0l5MmNsdGdPMHJ4Y3JRNjVXS0l0SEdjdHJ5OTdxZUd1M1NOQjlU?=
 =?utf-8?Q?ucBh9SHEVEVcF2keNSHPKHt/+?=
Content-ID: <F51010EB3846364AA221E98AB9FD7440@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5163.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b61d5ab6-0806-4806-97de-08da90ef8a4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 16:39:31.7606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sFj++72pMhPiPbB+IQauPXGvjVlouLpFQNpOGYqnfQQn36RPekPtSLNHyBMvJajJ1ASu/fixLxDnlHj0j2hoYi7jQ5+U6Yk9jmU/iK5/gC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1358
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_093937_821487_0F7C9292 
X-CRM114-Status: GOOD (  27.86  )
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

On 15/08/2022 23:14, Conor Dooley wrote:
> Hey Will/Palmer/Sudeep,
> 
> Catalin suggested [0] dropping the CC: stable for the arm64 patch and
> instead making it a specific prereq of the RISC-V patch & making a PR,
> so here we are.. I was still up when -rc1 came out so pushed it last
> night to get the test coverage, but LKP seems to not have reported a
> build success since early on the 13th so not holding my horses! I built
> it again for both ARMs and RISC-V myself.
> 
> I tagged it tonight, so it's on conor/linux.git as riscv-topo-on-6.0-rc1
> with the prereq specified.
> 
> Not sure if you want to merge this too Sudeep or if that's up to Greg?

What's the story with this from an arm64 & topology PoV?
Palmer merged this into riscv/for-next a couple weeks ago, so just
wondering what the craic is on the other fronts.

Thanks,
Conor.

> 
> Thanks,
> Conor.
> 
> 0 - https://lore.kernel.org/linux-riscv/Ytac7G1zlq6WW4jt@arm.com/
> 
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-topo-on-6.0-rc1
> 
> for you to fetch changes up to fbd92809997a391f28075f1c8b5ee314c225557c:
> 
>   riscv: topology: fix default topology reporting (2022-08-15 22:07:34 +0100)
> 
> ----------------------------------------------------------------
> Fix RISC-V's topology reporting
> 
> The goal here is the fix the incorrectly reported arch topology on
> RISC-V which seems to have been broken since it was added.
> cpu, package and thread IDs are all currently reported as -1, so tools
> like lstopo think systems have multiple threads on the same core when
> this is not true:
> https://github.com/open-mpi/hwloc/issues/536
> 
> arm64's topology code basically applies to RISC-V too, so it has been
> made generic along with the removal of MPIDR related code, which
> appears to be redudant code since '3102bc0e6ac7 ("arm64: topology: Stop
> using MPIDR for topology information")' replaced the code that actually
> interacted with MPIDR with default values.
> 
> ----------------------------------------------------------------
> Conor Dooley (2):
>       arm64: topology: move store_cpu_topology() to shared code
>       riscv: topology: fix default topology reporting
> 
>  arch/arm64/kernel/topology.c | 40 ----------------------------------------
>  arch/riscv/Kconfig           |  2 +-
>  arch/riscv/kernel/smpboot.c  |  3 ++-
>  drivers/base/arch_topology.c | 19 +++++++++++++++++++
>  4 files changed, 22 insertions(+), 42 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
