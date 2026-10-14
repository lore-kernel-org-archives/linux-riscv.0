Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA246CC6B1A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 13:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ORFifyNrGngidOwki/Ns7e2GqM0e11wg+uciw4Zi9Tw=; b=Jd7cO+BnXwohs3
	ICVAUFY0wG4PhhuyNNS81I5ZgJoJSb/JCtyxseHg97/kRN7uXVK79HCkNr5er6YVL1L6crfBaNLDQ
	+wkEwNIgLy2FfkQAIqcAkXRHXAXRwZvWiq0EBfMY9NjxcT6R75+5suvRojE2zqA29XiwymDMalzy0
	HN2FG/jeq4vnctneOAHaVsHADaH4xTO2swS7d9XR2OiRZJeylFDbZ00wHqvLl/ISIAOH9UivNjlfN
	fBQsKezFI7zbPKCvSBPxHX7rqj/eUn9UJUPSCEFtNCcgyqbPa3xZl5AZAVDbl0A0aYbFLPEGDVr5m
	sFd7Jgw1I+X4fcBYrl9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGydU-0000000FWPP-1exb;
	Wed, 14 Oct 2026 13:03:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGydM-0000000FWOT-2kPJ
	for linux-riscv@bombadil.infradead.org;
	Wed, 14 Oct 2026 13:03:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To
	:From:Sender:Reply-To:Content-Description;
	bh=iyskYM3DDhYoizQmZtJf1AXlj51ALRtFCtbezzQ7DQE=; b=lNnFkWNIbpuP9zA+fwMr+8fDn9
	ILSXFDABxR9V0l43w4/YEcfl5ocuX7v+46wClMhFkXiQY8WsOQaqEOcT2D4cpkv2Ws73859dUt/lm
	DwR385HQjFDoUx20YQtE8qWZupBfqTghT1H8nuoQnSO93D4O4evl9X6IM9cH7kj2ewT0QyfjND6Ll
	oo5xLIZyHOYnF1E7HdBoSGATAV5L+LxgVHbzwKt/j7YlIi9qqdUNMNqPfWDtKewpmTf1VkQKYIJ9r
	+4Oun33hHV/kpelwyBtyEm5pGdaeMY4ecTGObOUHWsxUI0laYezsrkJBcizT2sLIgNGJmQ/AL+Am7
	ylRc6fuA==;
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGydJ-0000000GmmD-2ESC
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 13:03:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JbkETn0uROD8n+1Y6N94yFZFOrbcj4GV/xOmFvRtQHwgJHxaFisxsOEXJr0mZyHpiAiyhkY5KoUQzgdwkv2MlmG146/quMMWN4lDeCzhSIWAShidoBFIiv4mBBMoqjJYKQHLOdm9ga4A7pzd0OdkeGnsV6xXq4kSWl49hvrNmaupWOpZ4nGD4TlqakMSsQMG2y0l9wGaCTsUAKnQU95a0BfbYwHeabt93GoyMHeftFI+gl45H6yfolGRzEzxKxrgkeEE2Vm5O9FvY/jQ4zqZo2uYP+YUeITI7ht5Dbi9xFfcJLSS5+uzKqDIKT50mTgifTr4gyu3mG2tRHKqUX7KzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyskYM3DDhYoizQmZtJf1AXlj51ALRtFCtbezzQ7DQE=;
 b=QSDrGxegplwz85j1itjhu/AJNafu4vll0LePO/ndHM9PjaB0ljGZC4WVQXntekUpvOKl+xuWdkxZz8YipQ9sdYBjn6bcyOk64Prmq/fF4gvYRvq/hKYNK+1Co6/1NoSnL+e63jjxViQq/W0V1Lyom5h8VdToEJhXdpmSIQl9SPYTxGEAnDw9fCwbabW7gVPLRxwq23jduMs695mCQ+Pg9CmnAc1P8mLX381cfHYDBfiPeSQCjLb2a0sc1c1Gq1eflFvAPyDfy5vuxESemphy9gwCZlOHQ7B9tX2zahRcR39qoWmucQkZ3mGcv27jf3Q9wZQrvutHQN1QlhWlZtAqbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyskYM3DDhYoizQmZtJf1AXlj51ALRtFCtbezzQ7DQE=;
 b=rq/1p+yCiD+hqIHarZ7IZ/ptWUG/YQShZDfP9uUCxXFWQI3cLeMwfLwTPrqvhhJJzPAbLjCTQoWXYmghX6vVFlF38bj5vJ/PTU+OnP1lkMSKsntxb8Jf0D5ZbrI/1a4twoZeFAWs8rHsR0zgdWAifDYb3qrASxPM0hIQgzj7XCH3Kgl6Yver0SKYvxOzrvYCuRC4NtYxBYb0syDxrSjdauvGDECA8uRXsqC85z0WMbJuj16AWUiS6CfGfQkQ87Fgf85ILHz8yVB3gTW1cInYwmth06olgaOgoppYQ5Bkiv5DLT73HfosXbMOs7pr2jKCRhhnh7OPwei34mKdY6TVaA==
Received: from MMZPR09MB547520.eurprd09.prod.outlook.com
 (2603:10a6:190:56::10) by MI3PR09MB8523.eurprd09.prod.outlook.com
 (2603:10a6:290:6f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 13:02:55 +0000
Received: from MMZPR09MB547520.eurprd09.prod.outlook.com
 ([fe80::5b5:f191:1ccc:f9ee]) by MMZPR09MB547520.eurprd09.prod.outlook.com
 ([fe80::5b5:f191:1ccc:f9ee%3]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 13:02:54 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "conor@kernel.org" <conor@kernel.org>
CC: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "anup@brainfault.org" <anup@brainfault.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "daniel.lezcano@kernel.org"
	<daniel.lezcano@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Djordje Todorovic
	<Djordje.Todorovic@htecgroup.com>, "inochiama@outlook.com"
	<inochiama@outlook.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"radu@rendec.net" <radu@rendec.net>, "robh@kernel.org" <robh@kernel.org>,
	"tglx@kernel.org" <tglx@kernel.org>, "vladimir.kondratiev@mobileye.com"
	<vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH 1/9] dt-bindings: vendor-prefixes: Add GlobalFoundries,
 Inc.
Thread-Topic: [PATCH 1/9] dt-bindings: vendor-prefixes: Add GlobalFoundries,
 Inc.
Thread-Index: AQHdRFDMjousBHSoKECPSyesbZWZc7bP5TmAgC1KyoA=
Date: Wed, 14 Oct 2026 13:02:54 +0000
Message-ID: <7773b811-f540-46da-bc60-f95416988e71@htecgroup.com>
References: <20260915-engulf-backpedal-fef3a5fc2607@spud>
In-Reply-To: <20260915-engulf-backpedal-fef3a5fc2607@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MMZPR09MB547520:EE_|MI3PR09MB8523:EE_
x-ms-office365-filtering-correlation-id: c6e60646-b824-44dc-10d9-08df29f3761b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|366016|1800799024|376014|6133799003|10067099003|18002099003|22082099003|11063799006|261009223027099003|38070700021|56012099006;
x-microsoft-antispam-message-info: K6DiZId4BzAO6GqnY4dcd6YIzX2QAztt0GSRKD84e1GbrXbEu5+93bQda0Ztx1a9VODiysz8ZVEeOzU8JM+PFLJhLcnsQCPu41jtzOSBEFe5yizLpB6tMdfWsgXGzNq5xehXKYmOL1fwVvHjfwd6BeISnS1FAg0T1MNG8sgFVTcs7e9NJD9DUX5rSWiyntKM1SzUodh/2ePIhHQtGROg9fBg+76Bijj/sUWshz2MC8qucmH9Bbczm7sGac/S1+sfKePiS7y5o5skwRgr5jRAJvonkeR5d/CE3O0wemGp/OtxlNu5XrBKhd6pFFAxH7hWMXAU/t2MByqqhdUzPI0n5YXUGqXiN+Qx8Mk/Eesn2EXBqO2X7H33S6h7RnoZo1GeXGPAYIfMiPEYi8UwxgYM8dEcvgRJ0x7uCYweQBJ9kjHHR9exSHpB5j1ShvPe2bFh0XyVN+XjRi8AymIWnJgab1CcFh5SlQLfhFNHSUWD84vWmpt/U76Czp3AuzaRPPwxrF4D1DYNVqxTFAIu9Pmb29M4w3nI9moBT9vce/ua6owe1r+/z40kWLLz3rZ8v1r8SL9Pf/nEDfS7cEs80SQAArnGEVwDFkmOYAdvFlwK9eap1GxmglcD2vYzaQlUt9pPmSsPnjR8mp67AA0fFf74bQOSRzx3x/mwDnWyDW0TkvqSpu63CMUbvE6Zk27R4A+d+kwzzegwxDUxnkfG+M/1kyrN9nfW8Eg6Rwwxp++C1Rc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR09MB547520.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(1800799024)(376014)(6133799003)(10067099003)(18002099003)(22082099003)(11063799006)(261009223027099003)(38070700021)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEpRK0ZHQWhleGE3UjZqWXFyQ2U3V1c3OHBOWTJqTWZURHFGd0prcU5oZThC?=
 =?utf-8?B?MkhwMUg5QnFpOGF4RmRwNUYvTUhRcFk5NFNHbnhVK084aEtkdUNwUDVhUHRX?=
 =?utf-8?B?S0lxNEZwTHI1cFNSZm5nUS8yMGM4aUJVZTVyWWo1QXpaR1ByZTBoUFRNbTVN?=
 =?utf-8?B?Zk1ldTJuMHAvWmw0WG93YWdYUnI1eTRyQWFTNFcySTdDd05YSUVrOTBtbDZh?=
 =?utf-8?B?UFRmVFhVZUozRzBsZEJlRUJqWGd6UjNDdyt3SmpwTjRkSU1sOUdVb2M0eGsz?=
 =?utf-8?B?Qlc4K1piaEsrYitpc2FIMHIrWGxXVEExZW4yRk5kSlpkYk85S3F5bFhWMksz?=
 =?utf-8?B?VmhyTGRmYmlRUittQUJiMngvVEVGbkdYNkFBUHovTTBBaXk1emkrZlR5dEZz?=
 =?utf-8?B?TjV0SnV0NktJZnMrbUE2RDdlSk9xTmx5VXpqV05FZ0ZLWk9QWGFLNzhsdmEx?=
 =?utf-8?B?R0RqSWh0SE9HR0kwOHdJKzJyS05qYlVHbm42VEgvL0YzL012b3ZFMFphVUF3?=
 =?utf-8?B?eFVJVC9sK0Yzbnhsa01OQnNITjJxUk9QYlErWkoyMVF1eXhCbTNhVGtyOEs0?=
 =?utf-8?B?cmljM0dGY0hDREpldDh1a1lyNHBnTjF1Um9QaVhSOXg3ZE9RUUhYL1JFcVZF?=
 =?utf-8?B?TnYwZkhQOUNRRHltMlY0Umw1K3l3Qnl0OWJmTGg5N2o0Q0xSRklwWlBjSkxB?=
 =?utf-8?B?NG1kUzZVQU9yNFBCZUVVZ2hvY0N5d1lTUEMwY3ArZlUxZCtDeTNxVE12Tkc1?=
 =?utf-8?B?VzlxaHBhWktveFB6Vnk4QzZLL1RvaE93NzA2OWpqUjVPQ2c5YXBhT3ZhUjVW?=
 =?utf-8?B?QzRwWGl0UjVycm5ZSkVwdUg1U3lKeVJncEhGZDBKTkpCOTljYmxFYlp5NU0w?=
 =?utf-8?B?cTFTY0JGbi9PN3d3Rmh1dFVqaDV4a0E1WUVRTlBDRlFCQ05hU1REOXVTYVhy?=
 =?utf-8?B?VDNsVjFVMXIwOEdjWGpyR0pUd0JHZlN2ZXRsakFsaEtnSzltWnhvMnpXeWM4?=
 =?utf-8?B?THFkMmljVTEyNTlvMmczc1BkajFvQ1NUNlRCSkFYRE9pdVVWcnNZb2pmUzZa?=
 =?utf-8?B?YUpHTGM2eWZ2eEI3VVU5ckc5djM4WVJVcnNycFo1b3Z0WWhzNGpLcS9tS1lK?=
 =?utf-8?B?a2FUMENZTXpYamFFSHRPU1g5ZWZwUGs1bklRNVQ3MUl6ZDdkQzBlMEJDU0VL?=
 =?utf-8?B?VDFUY1RScTVVUkt2cmNEcFJYUndTWlhxWDI4M1lYdGszU0IvTWxqRFlPQVlq?=
 =?utf-8?B?WVdvZEVRa2J0QTdjZkVhU2k5bS80bS9sRE9kOFIxQlVla3ZMYjdzK0I2SGVO?=
 =?utf-8?B?TGd0QXZsT3VxNWFUUWY3eGN3RFNEelErZTYwemlBY3YwYzNLRlVqTmJudDF5?=
 =?utf-8?B?MExHb3ZLbGswRy9UUzFtMHloaXN3d1VkQVkvUDBzSGxoZ203Wm1QcXBTSkhB?=
 =?utf-8?B?YVRuNGxMaXc1QmxWM21US1J0ckRtbmpWa3NWekY1L1ZNOVZmc3dpaS92RitR?=
 =?utf-8?B?Qjc3aDk4Vk1tV25BSFBZWmsvOGhTZjJsd01oS3pzNWoyV0VQOWlmT2tyb2FZ?=
 =?utf-8?B?OXhBUG9WaHM4NFVSRnVXeDZDQnY1ZFlzWUpKVGZBUDVqUmJKZjdIcHpLNUdh?=
 =?utf-8?B?YWg5dytPZCtuQjI1NTVyamx1cWZPNDJkbWNMQUwyR0xVa1NFbU4zbUcwdytI?=
 =?utf-8?B?VUpBWjdGUDZTdVFiL3FyMndwQjdwcGQwVzV1V2hTYm9OYUwrY0tLZytBODVm?=
 =?utf-8?B?Qit0aVpSS21VRytMdExzY09XZ25qVG1sbkJGUTZ2NHk3YlJDcURoY0FnRWNG?=
 =?utf-8?B?c2Z2RFNjT0JjQWI4cWFNbEtITFNuZ2h0ZGZmam5yVHJUemZPWk8xVmxEN1lI?=
 =?utf-8?B?eWoxK25YOVVWV2p5VFlsMnpKbi9ha1RpMHFna0daSlQ5R0lKNzZrR0l3UjJh?=
 =?utf-8?B?T092MWR2VFZFNW4xdHc2a01xamd6UWt4YmROZVNUZHNOV2I1TERtK3A4eWNy?=
 =?utf-8?B?ZVl4VFFYeWQ0UmVBSjVlK3RwQ0xTazI5VTd6SkQyYW0vWWhGa1JZdVMvOTJX?=
 =?utf-8?B?NndqUEVRVGYwdHlMbEs0c3B4aWRZdzlUU3F1WUZraWZVS1dET1Q2NzRIdTR5?=
 =?utf-8?B?WkdSaXIwKzNweWY0dGxTbE5QU09SSGxBZU1Kai80WnR3cVBoWUkrRVkwQzc5?=
 =?utf-8?B?MTNrZW0rS0RMNURQN0JiY1Jma2gxUlN6SGxES24wcmdrTk1pdGNxaFlaMlBl?=
 =?utf-8?B?ODFQODNReGJCdlBmUEdhSDFmdHdCYU1nYjNieEF6SndVSGR2eXB2aEtJUzha?=
 =?utf-8?B?YmJUaDRMQzFtSEZ3RXdUM3FEenFDTXpFcFFRbkdKR3FBc0hKQ0ZHV0dUU25w?=
 =?utf-8?Q?93iLwwWK7lQgY++I=3D?=
Content-ID: <8B32455641CB2B4C8B6DD1D701598F35@eurprd09.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MMZPR09MB547520.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e60646-b824-44dc-10d9-08df29f3761b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 13:02:54.4658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ApWsmTmRYdD1uUbR1Y3rxwqu3pmrag76RKoM4JSvZjcPgz++6AeN0xfK5jLHMAkaeslLtysZj9mdcxKTZpqQ+CfB43laIkPucyMs317Qlts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR09MB8523
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_140301_647301_7055D5AA 
X-CRM114-Status: GOOD (  13.85  )
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

On 9/15/26 19:23, Conor Dooley wrote:
> On Mon, Sep 14, 2026 at 03:55:49PM +0200, Aleksa Paunovic via B4 Relay wrote:
>> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>>
>> GlobalFoundries acquired MIPS. All MIPS RISC-V
>> compatibles should be labeled with the 'gf' prefix in the future.
>>
>> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>> ---
>>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> index ba2002969373433b1f48118872c46cf7bcfff276..b699935f60b96b3cfbb9c6e8ce802fcbedc52c1b 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> @@ -668,6 +668,8 @@ patternProperties:
>>      description: Genexis BV/AB
>>    "^geniatech,.*":
>>      description: Geniatech, Inc.
>> +  "^gf,.*":
>> +    description: GlobalFoundries, Inc.
>>    "^giantec,.*":
>>      description: Giantec Semiconductor, Inc.
>>    "^giantplus,.*":
>> @@ -1104,7 +1106,7 @@ patternProperties:
>>    "^minix,.*":
>>      description: MINIX Technology Ltd.
>>    "^mips,.*":
>> -    description: MIPS Technology (deprecated, use 'mti' or 'img')
>> +    description: MIPS Technology (deprecated, use 'mti', 'img', or 'gf')
> This is starting to look a bit hilarious.
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
Thanks!
> pw-bot: not-applicable
>
>>      deprecated: true
>>    "^miramems,.*":
>>      description: MiraMEMS Sensing Technology Co., Ltd.
>>
>> -- 
>> 2.43.0
>>
>>
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
