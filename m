Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD74C25B0E
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 21:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSqgI/60Q2bogbwRF47RID7Uzoekn8LBxDD/Vkq+HIo=; b=zS53JQfIfT/zfV
	ow6FVhujLP7eK7VQ1c0TyvEUOGo3UNzKhM35yvAyR3zFSJN1dkZ3/klIZcV+yIWrCnHFeiaUILkOF
	U/vvkXenv/e6p7P6WX/BhhVa3Wskg99GNVns0Ysnl5xyzQpf/klJV9Hb33zA8LJHg5rYkjOXB9EeK
	D0um0Mc6GxOpbMYrckGvlanMSumlElVPZ2AjXgkrAb+zdR77a5xGgnZDGYBx8+201skdGU0MzdRUn
	q+p6RlOrNOgag1JQBst4roGboU1QsLNKvABH15OylU8M5WcgzAYvgoX9EyohcZpIRVGenlhqwtkrf
	OiA8asQJ8ulCFPWCeZkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOmnI-009gO8-II; Thu, 18 Aug 2022 21:11:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOmnB-009gMD-Ub; Thu, 18 Aug 2022 21:11:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660857066; x=1692393066;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=c+nElr4kAC5Mvi9l7TXqvenOGIFPbJAnf4+btk5YsA4=;
  b=zPL1c4ZGVwJKN+h5L6BkfRI9tXcXoPgooqZPtwnXUmFMs0LANA9zj4Fd
   3grRmMGuq4oL1p5bjAzwpb7tt60XvgtNg73U/br1meuJSWtZHd6Ny/qLP
   1hPNT6SOfWjpPV5IFgpAj+jdk3uhCGtHN/+c2Jidpovtj5ExND0ePukEZ
   Dui7hbWuwWIS8ADat6zAajviibTirE0QRfY93EdHWa3fwqHDLTkhxbbWy
   J/xKRrMjB46B+djvZ4xY7lkHLvfUWntCfO71C9yJ8/l9HSTXi5NUvN3ae
   qQ/CGFaPVh5LqKdeGacgKOQZLWHuDQwO0qgAAIluYLtCu+QBv+8P7AVcl
   A==;
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="176842087"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Aug 2022 14:11:00 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 18 Aug 2022 14:10:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 18 Aug 2022 14:10:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9a6EXr5ANmSJCCgVdMEeVXVtU5a3THwO84wiV1yFWQcETD8wSylOYnHKjl8d2LZSA4wvdgwq6vZCxdfjiZDaBRekGh8a2eEZWkxOajhTqvBiu9DIobDB1mYlW6eJATbEk6BwKnFzMCUO18ugVmu/e+Zbl0aGyz2j6CzrZ3hHQJkmWW1LGzT7nDCLAGX5cmJnw6COn2GHfEGh/cXZwAThydJEmI1zCqG4EsfzndTnd96vwbkYF9q3L6pAvm77rftMRJt67QfNEHXHiiVoygKfGqX23YJIr1P1yxs0BO4RaFSSaPZXP6XwaZ0PXRVRnQOPOMoUzzuVHiz+x2Ykc0d5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+nElr4kAC5Mvi9l7TXqvenOGIFPbJAnf4+btk5YsA4=;
 b=ETh0SwghCUuQdqRVlPE5K3zjVE6msSKE1NRJ+rgzLf9rhtLFJQ+PaiDdPzfEugiDRMaHgrwpVNbncs9XmAr+/v7T8PCbxlpFCybZCUOd1TE1UKeoUNT9b51T7d2mdMcKDmtbu1+MUKpG2lMQi+Mb5TTCJz60YCn9kgmXeY6kRUfdGpMSwq9wgjq8PfMfmTF4jrwSaMlA7pcxeQHmyR+PwqOfhury69K9FIS++tdEePRac04Iqkn5mbb4WL7l6+JYv70pTTPJZh81e6kJQ1LgfFmLagQriUP+sFmLbmlAPUPU5foChvo+TGBzjm09lqKWdxru0ClytEOYiGEuKeRWXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+nElr4kAC5Mvi9l7TXqvenOGIFPbJAnf4+btk5YsA4=;
 b=eg8/3NxEcu7AjgAle+Ik+R868xkRLSshWTI/RwJoA+APZ+jxSU1o17aHRkmbbRpdQcwO64tIpeUYuHk9otPcAukiefgeXX5JmVnELks0tuTmUC8QWrSsChPBMbu2yun4j92MkhPMf6XKbtv7FLg17cfA9aG5llZ6falbtYg3His=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MW4PR11MB7126.namprd11.prod.outlook.com (2603:10b6:303:22b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 18 Aug
 2022 21:10:54 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Thu, 18 Aug 2022
 21:10:54 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@dabbelt.com>
CC: <sudeep.holla@arm.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Conor.Dooley@microchip.com>, <linux-arm-kernel@lists.infradead.org>,
	<atishp@atishpatra.org>, <Brice.Goglin@inria.fr>,
	<gregkh@linuxfoundation.org>
Subject: Re: [GIT PULL] Fix RISC-V's arch-topology reporting
Thread-Topic: [GIT PULL] Fix RISC-V's arch-topology reporting
Thread-Index: AQHYsPRyXnHNGxm8rkSgpyoSWfWKT621KgCAgAACGAA=
Date: Thu, 18 Aug 2022 21:10:54 +0000
Message-ID: <994ad6ea-5d3f-b3d1-e0e5-883530ebaf2a@microchip.com>
References: <mhng-fc4d9b57-2284-40dd-97f6-d32369b41cde@palmer-ri-x1c9>
In-Reply-To: <mhng-fc4d9b57-2284-40dd-97f6-d32369b41cde@palmer-ri-x1c9>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13195208-b1f8-4c0f-f361-08da815e2357
x-ms-traffictypediagnostic: MW4PR11MB7126:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zdUKJBWc4zphBMNBpA8KCKgGZOCKGwVZB+M6u1RxBCic3zXT028T7HGXb5hEj/rDHqZ2F0/+GRVupydJ3Bv2DzpBi41NjCn2YUL95alMhXQyNyjfq2LZavslyJfA7YF46fKT1uCQaiVGYGE+xOx5EeWVfBROSEgozice0LaKKhAD0fgjBTcyInP5i5PihPM+uYQYGfnZ4SwWNwve3QD4s8ua/I+qiRJnulN1IHwSJid+4c5fOWlchinS3iH1KDXIm66sLw94qwttEJren5PXMvfmj2iWPCPec5Rsp66zQxAZzH45TzDoeuEbN4+RE6ZmMi5hh1yIwQLcdqKElp8eDrSSy9IbuGEp51PdAUf3K5PP+NFr0uMCJbUeEGvAWFMdET9OmplPeQKMoJ1GeAuLUpwZViqRA6BHacUgRZsiU/E/ivMD2XHtY6ptNRMif0+uP9Qx2HLXV1YUECumm7G2EiXoj4XFVM7xaGAx9NXL6DFYaOihrntxAdqf0F8cvvbCXFJCKqCd4y9yYv0WqrnKVt7YzskHdOSomtkVQZI4VMuSPvxjzY7Cg2LRuWzAAMgD7ZQ5q4McqWEf7ts/kRHvr9jD8ud00ZjiF3nx8zHJdRdl/kNKOPaCTQRNrGez+8HAb5a/oGTBDMXmFEIJcRWJSReJIidtNlefR4T6Qb9z3x2OD8Ho24ksX4k9n2Aro0Tz/hbDmesY46skivDf/JNvSh1H4YcwqAal0FPDDtEmhRJ18noXHNVRO6YKz1P8gpupJInSDmbjaCAUcXinFhurQ0OU/Q2T8K7hmhxum7TYlm91c2hoG7YB7lk7vgIN6n3QXurdRysaEAzRRYNXyCxVSAZZJWqhG2/Fl4kVRxbhJLiffLUlkuH5Z6DvJLvbGQdL5GkQh6vAZspvQ1Q4XJYfoA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(396003)(376002)(39860400002)(346002)(86362001)(31696002)(38100700002)(66556008)(76116006)(2616005)(91956017)(8676002)(64756008)(66446008)(66476007)(122000001)(66946007)(316002)(4326008)(7416002)(966005)(38070700005)(53546011)(6486002)(478600001)(8936002)(83380400001)(5660300002)(6506007)(26005)(71200400001)(41300700001)(186003)(36756003)(6916009)(2906002)(31686004)(6512007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXFFMk9xM3Ywck9QbjZtT245TVU4V3VvMUNkS2hlS1R3dUdPcFZZdFZLUEox?=
 =?utf-8?B?ajhodzNhS3dwYWpxbThmSHV2Q0o5SWEzSGFvSXpXOWhFNEg1cmhMMUZ2QUND?=
 =?utf-8?B?dEIxU0JrcCs1Q1RWUGg0RVBzSkxlZU1hdHFzWlRXd212T2tVSDR6blpWVFhj?=
 =?utf-8?B?aTlvZVNMaDFnY1FQMHVBM1cyYVJaWXcrcHVVRTNaUHhqdlJBdzB2QytyR0p1?=
 =?utf-8?B?TFNsMUtnQldYT3RTZUV3ckc5MS8rbnFsRVZZbmFYelVBdFZBNVFTaWlGVDFi?=
 =?utf-8?B?SmVxMnpMQnZsc0kwbFJENVk1dEdUNUJ5aVZGeFBkdHd2OGlxVUVwYkNaUjlx?=
 =?utf-8?B?VWZkUlZ3SHc0QVJBNlJ1UDZrM1ZLREp1T2s4NEZacXZmSEx3bEZpWHRMNnh1?=
 =?utf-8?B?eVNiZzBMZEwxUUJwUC84NVljdVRnNjVBN2lCYzk2eXp2d0RCZG1KTDJ2OEtO?=
 =?utf-8?B?WUx0QXBtRnRFdnpCMWpTMkpjSFNvWUlkU3B6ZWpXSVBvS2lCSSsyaWJwVjRy?=
 =?utf-8?B?dERHUVJobmxicGsxY09JbzJMMFN2MklicCsrSlYrbUowS21xbys0Zi9XSkN0?=
 =?utf-8?B?L3FrK0FTaWZ3ZlB0WVNOZHRYNzY2SXpFVno0QzZVQ0d4ZkU2S2pmRCtKYWhK?=
 =?utf-8?B?Ymh6OWtFa012TlNTM3ZYLzdoaDArajFWNnRwbklBRVhWWFJST2NqSkVZQ2h0?=
 =?utf-8?B?UXBEbjRoUGhmT1J5U0RhaVE5RHhCVEg3TUFxSmhkY0wwUHNLcTJDM1QvTVAw?=
 =?utf-8?B?UFBpUkF2V3FJZGtHSmZHc3FiSnBrbmgyeXc4eE53eWQ1ZTFFazY3NkpsWjNG?=
 =?utf-8?B?ZXJaWDNqSzlKQmRNNHRHZThqa0lSRmlmVzREZmJDZjh3NnRFMHl3OUNLYUJO?=
 =?utf-8?B?SGJ0V3ZLaGRXcUI0cERtTGVFalV6Ykd2c3V4QUtsSWY5alZtSU0zV0dISlls?=
 =?utf-8?B?dWFRaWdSYURDWE1EQ2xxT2tsUVRRK21YcHUxVHpYajZ5S3RUZ3JYR0NlNUhU?=
 =?utf-8?B?ek5DTnlVUjc1Q096dUtKM0lTZzVCblpKMW43MkcxRmNaYmVBRVk2UTBLOHhI?=
 =?utf-8?B?dnFnRTRxaUdiWEdHYmtVTkFCUGpqQkFZV21pVkI4ZkV1TWhNWUlVZHJuNGpv?=
 =?utf-8?B?N1BNWk4xdlExMEFZcWo3b3l1ODYySzlZRFc3clA4V29XMnJyVlhKMEtZeDNG?=
 =?utf-8?B?WVVFR0lnSHBHTWNvQUlpdnVoeVpQS2ErSjFLV3BLSE41dURLdldFMzBnZ21k?=
 =?utf-8?B?NmpBaitWQW9SR1pJN3dRU0UxUzkwMU55VnNMQjNpNDZ5NVVxaEpRVW9wQis4?=
 =?utf-8?B?YVpPd1g5eGxtbGN3NTY0ZkN4ejVSZnljUDhmcXRNYWEyU0NQWkYrZEt0WTdo?=
 =?utf-8?B?a2pwSHQwRVhsRXRjbG1rNGpHUXlMUkRmZHFuV3FLaWd5R3JpcFRsNDB1NnFG?=
 =?utf-8?B?VC9HOGE4VXUzaDJBaFhtY2E5Sm41WWlpYXpTeFdQYWkwSU1aNXcvYmFCdmwz?=
 =?utf-8?B?N0N3VHY1VENSVVE3Skd5QmY1bmN5L1ZTYWhtRm5nb2RQcW9qcnFxTHRGdStm?=
 =?utf-8?B?QUhCYlNTb1VOc0hKZ2U2N2VObUd2VngzQXN1U20waVpFczV1WGoxdVlrUEJS?=
 =?utf-8?B?U1dMNHJKNm1HU2NtWHBmdEhUL0FFOC8rZjVORUtUZElWV2l4UXlvWXA1Njdr?=
 =?utf-8?B?Z25lQ25wVkJLSy9jRjh1Vll1WWZHWjF4K0pXZFFKS043QnBacEltMDBVOFRY?=
 =?utf-8?B?RXJFaTlYQWpKZ2JkM3lyQXZBTEVZMmhUL1FxRjVRWUcrSGNvUFpIdWNRK0J4?=
 =?utf-8?B?VXg5VmttNk1CaGpNa2RSd1ptMDJyYXlXR2xJL0o3TnNxakJwMTVSRzB5VDZX?=
 =?utf-8?B?M24vb3g3QlhrWGMvbDlvajRPRDNGbDVqVE13UlNCV1kzNmRiRmJiYnpOUHVU?=
 =?utf-8?B?WnRGcXhUZ0dGZk44RzNnZjdmWjQzWXZQS2EreW9CVWYxU1JEMXEwYWc0ejdJ?=
 =?utf-8?B?dGU4TGFZYTMycWE4QmZhWndTQXljWjhJWHBhSDB1OTFTYVlLajJJb3d5MC94?=
 =?utf-8?B?Q0FIeWJBMzJrOCs5b2gweDl0aWdFV25HOVJIKzlmRFNlME0vM3NmOGxpRmpK?=
 =?utf-8?Q?5EUBk5l6PK2pKrZJ8S/BxoC60?=
Content-ID: <5A59003E66279B46A3D86CB695653C96@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13195208-b1f8-4c0f-f361-08da815e2357
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 21:10:54.5909
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pWO0E9y4JW8SHPQeA3+0hcQjMbazTTwiVP8VH9d6VJ8wNLkZK+Wg5774wELyq7JLtcv1+hClg1UXSnWFoXKtLrO4AlFSipDIV1BFqHfFv4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_141106_316811_A3C8D40B 
X-CRM114-Status: GOOD (  33.90  )
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

DQoNCk9uIDE4LzA4LzIwMjIgMjI6MDMsIFBhbG1lciBEYWJiZWx0IHdyb3RlOg0KPiBPbiBNb24s
IDE1IEF1ZyAyMDIyIDE1OjE0OjU1IFBEVCAoLTA3MDApLCBDb25vci5Eb29sZXlAbWljcm9jaGlw
LmNvbSB3cm90ZToNCj4+IEhleSBXaWxsL1BhbG1lci9TdWRlZXAsDQo+Pg0KPj4gQ2F0YWxpbiBz
dWdnZXN0ZWQgWzBdIGRyb3BwaW5nIHRoZSBDQzogc3RhYmxlIGZvciB0aGUgYXJtNjQgcGF0Y2gg
YW5kDQo+PiBpbnN0ZWFkIG1ha2luZyBpdCBhIHNwZWNpZmljIHByZXJlcSBvZiB0aGUgUklTQy1W
IHBhdGNoICYgbWFraW5nIGEgUFIsDQo+PiBzbyBoZXJlIHdlIGFyZS4uIEkgd2FzIHN0aWxsIHVw
IHdoZW4gLXJjMSBjYW1lIG91dCBzbyBwdXNoZWQgaXQgbGFzdA0KPj4gbmlnaHQgdG8gZ2V0IHRo
ZSB0ZXN0IGNvdmVyYWdlLCBidXQgTEtQIHNlZW1zIHRvIG5vdCBoYXZlIHJlcG9ydGVkIGENCj4+
IGJ1aWxkIHN1Y2Nlc3Mgc2luY2UgZWFybHkgb24gdGhlIDEzdGggc28gbm90IGhvbGRpbmcgbXkg
aG9yc2VzISBJIGJ1aWx0DQo+PiBpdCBhZ2FpbiBmb3IgYm90aCBBUk1zIGFuZCBSSVNDLVYgbXlz
ZWxmLg0KPj4NCj4+IEkgdGFnZ2VkIGl0IHRvbmlnaHQsIHNvIGl0J3Mgb24gY29ub3IvbGludXgu
Z2l0IGFzIHJpc2N2LXRvcG8tb24tNi4wLXJjMQ0KPj4gd2l0aCB0aGUgcHJlcmVxIHNwZWNpZmll
ZC4NCj4+DQo+PiBOb3Qgc3VyZSBpZiB5b3Ugd2FudCB0byBtZXJnZSB0aGlzIHRvbyBTdWRlZXAg
b3IgaWYgdGhhdCdzIHVwIHRvIEdyZWc/DQo+IA0KPiBJdCdzIGEgbGl0dGxlIGJpdCB2YWd1ZSB3
aGF0IHlvdSdyZSBhc2tpbmcgZm9yIGhlcmUsIHNvIEknbSBqdXN0DQo+IGdvaW5nIHRvIGtpbmQg
b2YgZ3Vlc3NpbmcgaGVyZSBidXQgdGhpcyBvbiByaXNjdi9mb3ItbmV4dC4gIEknbSBub3QNCj4g
c3VyZSBpZiB5b3Ugd2VyZSBsb29raW5nIGZvciBtZSB0byBqdXN0IG1lcmdlIHRoZSBhcmNoL3Jp
c2N2IGJpdHMgb3INCj4gaWYgdGhpcyBzaG91bGQgYmUgb24gZml4ZXMgKGp1c3QgbG9va2luZyBh
dCB0aGUgcGF0Y2ggbWFrZXMgaXQgbG9vaw0KPiBsaWtlIGl0IHNob3VsZCBiZSksIGJ1dCBJIGRv
bid0IHdhbnQgdG8gc2VuZCB1cCBzb21lIGFybTY0IGNvZGUgdG8NCj4gZml4ZXMgd2l0aG91dCBp
dCBiZWluZyBwcmV0dHkgZXhwbGljaXQgdGhhdCBJIHNob3VsZCBkbyBzbw0KDQpBaGggc29ycnks
IEkgY29tcGxldGVseSBmb3Jnb3QgdG8gbWVudGlvbiB0aGF0IFdpbGwgc2FpZCAiZm9yIDUuMjEi
IGluDQpoaXMgcmVzcG9uc2UgdG8gbXkgb3JpZ2luYWwgcGF0Y2hzZXQuIGZvci1uZXh0IHNvdW5k
cyBmaW5lIHRvIG1lIC0gYWxsDQppbi10cmVlIGRldmljZXRyZWVzIGhhZCB0aGUgb3B0aW9uYWwg
cHJvcGVydGllcyBhZGRlZCB0byB0aGVtIHRoYXQgc29sdmUNCnRoZSBpc3N1ZSAtIGFuZCB0aGV5
IHdlcmUgQVVUT1NFTCdlZCB0b28gZnJvbSB3aGF0IEkgY2FuIHNlZS4NCg0KVGhhbmtzICYgc29y
cnkhDQpDb25vci4NCg0KPiANCj4gQWNrZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2
b3NpbmMuY29tPiAjIGFyY2gvcmlzY3YgYml0cywgZm9yIDYuMC1yYw0KPiANCj4gaW4gY2FzZSBz
b21lb25lIGVsc2Ugd2FudHMgdG8gc2VuZCBpdCB1cCBiZWZvcmUgSSBnZXQgYmFjayB0byB0aGlz
LA0KPiBJJ20gZmluZSBlaXRoZXIgd2F5Lg0KPiANCj4gVGhhbmtzIQ0KPiANCj4+DQo+PiBUaGFu
a3MsDQo+PiBDb25vci4NCj4+DQo+PiAwIC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
cmlzY3YvWXRhYzdHMXpscTZXVzRqdEBhcm0uY29tLw0KPj4NCj4+IFRoZSBmb2xsb3dpbmcgY2hh
bmdlcyBzaW5jZSBjb21taXQgNTY4MDM1YjAxY2ZiMTA3YWY4ZDJlNGJkMmZiOWFlYTIyY2Y1Yjg2
ODoNCj4+DQo+PiDCoCBMaW51eCA2LjAtcmMxICgyMDIyLTA4LTE0IDE1OjUwOjE4IC0wNzAwKQ0K
Pj4NCj4+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KPj4NCj4+IMKg
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Nvbm9yL2xp
bnV4LmdpdC8gdGFncy9yaXNjdi10b3BvLW9uLTYuMC1yYzENCj4+DQo+PiBmb3IgeW91IHRvIGZl
dGNoIGNoYW5nZXMgdXAgdG8gZmJkOTI4MDk5OTdhMzkxZjI4MDc1ZjFjOGI1ZWUzMTRjMjI1NTU3
YzoNCj4+DQo+PiDCoCByaXNjdjogdG9wb2xvZ3k6IGZpeCBkZWZhdWx0IHRvcG9sb2d5IHJlcG9y
dGluZyAoMjAyMi0wOC0xNSAyMjowNzozNCArMDEwMCkNCj4+DQo+PiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiBGaXgg
UklTQy1WJ3MgdG9wb2xvZ3kgcmVwb3J0aW5nDQo+Pg0KPj4gVGhlIGdvYWwgaGVyZSBpcyB0aGUg
Zml4IHRoZSBpbmNvcnJlY3RseSByZXBvcnRlZCBhcmNoIHRvcG9sb2d5IG9uDQo+PiBSSVNDLVYg
d2hpY2ggc2VlbXMgdG8gaGF2ZSBiZWVuIGJyb2tlbiBzaW5jZSBpdCB3YXMgYWRkZWQuDQo+PiBj
cHUsIHBhY2thZ2UgYW5kIHRocmVhZCBJRHMgYXJlIGFsbCBjdXJyZW50bHkgcmVwb3J0ZWQgYXMg
LTEsIHNvIHRvb2xzDQo+PiBsaWtlIGxzdG9wbyB0aGluayBzeXN0ZW1zIGhhdmUgbXVsdGlwbGUg
dGhyZWFkcyBvbiB0aGUgc2FtZSBjb3JlIHdoZW4NCj4+IHRoaXMgaXMgbm90IHRydWU6DQo+PiBo
dHRwczovL2dpdGh1Yi5jb20vb3Blbi1tcGkvaHdsb2MvaXNzdWVzLzUzNg0KPj4NCj4+IGFybTY0
J3MgdG9wb2xvZ3kgY29kZSBiYXNpY2FsbHkgYXBwbGllcyB0byBSSVNDLVYgdG9vLCBzbyBpdCBo
YXMgYmVlbg0KPj4gbWFkZSBnZW5lcmljIGFsb25nIHdpdGggdGhlIHJlbW92YWwgb2YgTVBJRFIg
cmVsYXRlZCBjb2RlLCB3aGljaA0KPj4gYXBwZWFycyB0byBiZSByZWR1ZGFudCBjb2RlIHNpbmNl
ICczMTAyYmMwZTZhYzcgKCJhcm02NDogdG9wb2xvZ3k6IFN0b3ANCj4+IHVzaW5nIE1QSURSIGZv
ciB0b3BvbG9neSBpbmZvcm1hdGlvbiIpJyByZXBsYWNlZCB0aGUgY29kZSB0aGF0IGFjdHVhbGx5
DQo+PiBpbnRlcmFjdGVkIHdpdGggTVBJRFIgd2l0aCBkZWZhdWx0IHZhbHVlcy4NCj4+DQo+PiAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQo+PiBDb25vciBEb29sZXkgKDIpOg0KPj4gwqDCoMKgwqDCoCBhcm02NDogdG9wb2xv
Z3k6IG1vdmUgc3RvcmVfY3B1X3RvcG9sb2d5KCkgdG8gc2hhcmVkIGNvZGUNCj4+IMKgwqDCoMKg
wqAgcmlzY3Y6IHRvcG9sb2d5OiBmaXggZGVmYXVsdCB0b3BvbG9neSByZXBvcnRpbmcNCj4+DQo+
PiDCoGFyY2gvYXJtNjQva2VybmVsL3RvcG9sb2d5LmMgfCA0MCAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiDCoGFyY2gvcmlzY3YvS2NvbmZpZ8KgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCAyICstDQo+PiDCoGFyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuY8KgIHzC
oCAzICsrLQ0KPj4gwqBkcml2ZXJzL2Jhc2UvYXJjaF90b3BvbG9neS5jIHwgMTkgKysrKysrKysr
KysrKysrKysrKw0KPj4gwqA0IGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDQyIGRl
bGV0aW9ucygtKQ0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0DQo+IGxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcNCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
