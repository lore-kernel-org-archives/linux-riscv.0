Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDFFE9D826
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Apr 2026 00:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gO/sKwozKX3msU1EzIeXB/T3uO8q3oItmyieiRIDGSg=; b=ce8RsF1AnpHx7k
	qVAGQOxIwk1O6cEdOPayKYcpPQcpkWkY2RgsnCDzEjuKxtvkfKM82QR2FUe15pidIBMPZcFs3FbZj
	XEX87Y0kTIiQ/hK9GOZXXOG8fXbiLXwDoO6m6dGxN+7UX5mMZwyw2krcZClBHIP3YHR+DNM3BNfS+
	CAlGIyTZtTiNpuNvoH1T/R4sUAcpSeAOSl7Mxe23bdaCOI6ta2KGmz334knExPrbJYPu+JxJxc9Vl
	FTmRGJHR5tuAxNG0rVT8+Q7L/+Eo9ub0+1h7WQbUgvkUhyzgwF7lABNtxskolAVvuaBilztwBKSlx
	e1NHz7FtYGahX3wBtW7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9XWm-00000004dbD-2hkd;
	Mon, 06 Apr 2026 00:09:16 +0000
Received: from mail-ukwestazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c206::3] helo=CWXP265CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9XWk-00000004dao-0bT6;
	Mon, 06 Apr 2026 00:09:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ro7dA3iFxTBK9c3AFkInmNJf9Acv2LTKbqM2cgj9NKeqRH0clwS2GqzO6DtcuUlDqNgjGqnMMzWV26QRC1OULrNrdT9AvpYFdM+KTGNDojFbiDtYd9+pu34W7Gi4AIxVGdnmjDh89EqOGwPOw6H4QB5n/MLlO3aZkV70s2LnBhsgyE/Eou8hueRFp1PwLPyir3MEPfnkL1Eur/hOLamgSescmlMYTugDpeng7MnPDx5uDJ4efgMLC7SBmEUmsxnqWmX1RagFr8qGetbxZdZBV+L9hiB5+kh2OMLTkNMwOT1Wy+/ktV8cqB+Wlp+OHZLgYU+kpoGr/2W5+IpC76ut7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRzIu6sBMia7PX1fMw1AGKpctDdUZfL+eftZEQVOsHY=;
 b=H/yUZ+cTGpZg+VK/ArGk6RKUvR0Ek1z4kqQDIRNL0y3AU68qrQzxF0tqY2xNT4f5Va3LsY1SK6qZJG1yyV7nR51e9lWUTtXotnhUtp82MGHT24SBeaQRL1rDk7TacZwp8G8cpicmZvmxckmpjJ8MM9YIhcGXP1H2E/UO69Mlg0Ok41z25/i4Cf0VeVME6eKFhRYcKXKwaINJ4IcJsR7b0nEqnGg1S5b+BpqoJ6RiFCVss9VT50IWXmfdOInRZ2OQl49SR00/Ogn7sNBygPF2HBMxefSPoZVA3jBGsexVQgENav+wAOcjyzTn6Or3Bff8LUx9+t2wZ9nkDtnG240Ucw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRzIu6sBMia7PX1fMw1AGKpctDdUZfL+eftZEQVOsHY=;
 b=i+P2r/qq77hUUK80X08pDIl2STq5KTLp5qCHQwEt9gzjz/euyO8uUUk6XMLNkI3VEGrNvsnWj+6UAyDBVKccOF+yzmmb04DQBvOJ1EkGMg+iTM78ubNEk+X74Ty5/b6VEeT3ougIrwLpHrJFDjvtN8oGFKgoQ6DtHbW5gpZx5KA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6978.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Mon, 6 Apr
 2026 00:09:10 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Mon, 6 Apr 2026
 00:09:10 +0000
Date: Mon, 06 Apr 2026 01:09:09 +0100
Message-Id: <DHLMVOOB2U58.1M64OYVFFTLV@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Courbot" <acourbot@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Brendan
 Higgins" <brendan.higgins@linux.dev>, "David Gow" <david@davidgow.net>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, "Todd Kjos"
 <tkjos@android.com>, "Christian Brauner" <christian@brauner.io>, "Carlos
 Llamas" <cmllamas@google.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 "Uladzislau Rezki" <urezki@gmail.com>, <linux-block@vger.kernel.org>,
 "moderated for non-subscribers" <linux-arm-kernel@lists.infradead.org>,
 "Alexandre Ghiti" <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Rae
 Moar" <raemoar63@gmail.com>, <linux-kselftest@vger.kernel.org>,
 <kunit-dev@googlegroups.com>, "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, <llvm@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Shuah Khan" <skhan@linuxfoundation.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 32/33] rust: kbuild: support global per-version flags
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-33-ojeda@kernel.org>
 <DHHX9O7V06VZ.G0N1CQ7BUKFO@garyguo.net>
 <CANiq72mTaA2tjhkLKf0-2hrrrt9rxWPgy6SfNSbponbGOegQvA@mail.gmail.com>
In-Reply-To: <CANiq72mTaA2tjhkLKf0-2hrrrt9rxWPgy6SfNSbponbGOegQvA@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0126.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::23) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: ae1ce629-83c5-43a4-e992-08de9370ba85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: xOp6a83gBRdLE4U6obQUBgYLQ0MsUt22RLTUCkr2T42n986JVcXiVcPU+lF7pKnQHBQwhaFqpxv3hnZOudRy50FvOInCwnSU187m/AQkE798W0yPc03kHqqmbmWmNb4SfCj/IZ8gPbt9D2T3iQuh4xuaW/tNvPNYwJyBlen4HIyhA59xTt2QjiMjVt2NY5cOj0bNcCYhWq0OuBdCXW3ZaBEGWewUf49+HG08va//r8MXpCaZUib0wjBKx/7z/vx7L/nDMn5m354g7ZcC36UPVTdiHT1YS0MDBur+dCj6NgWVQg5MJrwjbUwlBZ1ONfdKibzy4sifUPwP7K9ObGEQB/43aW/cNJUjC64eFZo2Kw9RXG8zaxmceJpCLndhd3lEfgopIhX2amxf3LMPaHKeRTM2hFTyMX8XtWvHPgm0S0XcSLcqGkLLeoZBuh4ElKh0D4hiePgwY+KKJaZhnkaUK4hab2rl++lkEswLobGWkjrpDaXJlYv9C+2bM8ntHIQXm/s+6xrI5+izsBSrJL3HaG4WwoEu9mtEvcQ15GWPT4zMPhcE1cMQLM+lrmCQi2M0RQcD5nzGnvOysJYSxBGrOBs75k3o1oFeliLsM5EGeA4wEUYBko85L8PhUbOFHt1oMxh7g1rJeUgBKUtGESEwFOJP8waAty7hoNQ7F3K7ywBvbmFqxOwaDrPgXJOb+x4tV6GNexuXZxpBICipFZCa5kFo/s3S2w6U+4GnX1B8J18=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlFiT0JhckFOTGZycFYwdjlBeUJHczd5WnhOYkFYM2w2Skx4ZXhJYmlvY01O?=
 =?utf-8?B?R01NNTZyeC9KWkIwM0xFZXozWUhkM3NxZDJNM2JEcFFlaWFFNU9YbXArN1Fi?=
 =?utf-8?B?L3lBRTZDSzMrNFdWdHRmWmg1Ri9QazBUSUdKb1U0aDRvRWVwZng1K2lZdWhp?=
 =?utf-8?B?T3dKQ09BM3dDZ3RHYnVnV3pWbnQwaEFhanRoY2RvR0k0TUllb3QvZUYxYlVZ?=
 =?utf-8?B?SHUrL05FZVAzR1pUUE5sb0RhOFBkcVBkcG1YYlRNaVZxQkNOTlZ5T1NyZEVw?=
 =?utf-8?B?RFlRSDhmZm9SSFhmV2JWeUJJdVJ4N0JUbXYvV3ZFeXgzYTVmMHMzZlpaY241?=
 =?utf-8?B?KzdVcGZidWJMeENzMVdaU3N5d0pUTFVCNHJnK213L0daMFVLZVZqMWJrZkU0?=
 =?utf-8?B?dkxGUmxhdi9mQ0FDQnRYR1ZQM2pDOUlHVmhscndWdzZYbFFBWXlLMXJrNStC?=
 =?utf-8?B?b2JPUVBBRXhGdFpjRm1RRnN6OXV2QnhEa1FXSXFOZTVVR2dPWTY5M3ZOWFdB?=
 =?utf-8?B?d3RLY1VJNHQwYmEyallySHFKb0FDWDgxVkRHVjBaWnB4T0p1V3JoQkRlSjlG?=
 =?utf-8?B?cnpDL3lNbDF1THpEdUtYR3B0SzN0cnRaQkV5YllkNDZQVDNFQmZNampFOEts?=
 =?utf-8?B?WVd1YzFWZWFHVmg4Y1hQT0t2Ulp6NWM5SU0wbk8yWm5XbVMwTjZnLzhtdi9i?=
 =?utf-8?B?dlBWaFIvVmoveWxPdDhnaEp0UE1hVENrU0dSWERaNGp5NDE5UW5QUEtLNVFM?=
 =?utf-8?B?TldSbGZaYTAvdmF6SlVObjJZRWRLRzl6S09pdFQ4Rlk3ek5oL293L2NDb0NS?=
 =?utf-8?B?V0prZ0xGUHRkT3prQ2tLS29JVGNzRjJnYW94ZForN3pQWDlJRkNDa2FaRmI4?=
 =?utf-8?B?VTk2MDBjZ3h3UGk0QmhlbFV4ZlEwNXQ4R2JiRzdFeC9UemZNcGplYXpSS2VC?=
 =?utf-8?B?SXd5SmZvNVZ3eWJVT0h4VDJDQkpqK3V3L2lyRXFWZm9aMXM0Qm5uRVdzMkRK?=
 =?utf-8?B?QzJ6OFBYYkQ4OUlpVS94cnpGa0tPQk8xaGlMV0pUWmhzaGV4WHdGclpSSjdi?=
 =?utf-8?B?WU5OUE5tdDRGZ1N0NGU3WmpFVjRtMFlPSFNNK2xpSFluZmEvUFE3S2FJY0FU?=
 =?utf-8?B?UDFvdkJsaGUxbGR1TE9FMzlMcTN6TXdmNHNHSHpuMzNoYTlZYWpPL2pvR0VZ?=
 =?utf-8?B?L1hkZzlIQTlkQitQVHJYOTlhQU0va0FadC90d3gwL1N6YkZIeW0xV1c2dE5a?=
 =?utf-8?B?bVBzbzc5MUpDU3F2V1dKbDVxY000SzJWS2lHaU1UV0NCMGNpdnNiU0IyeGJj?=
 =?utf-8?B?enRRa0MyZmNLUlFMNzhhcU5YZUgySi9PenlKQUhLSU9HdXN6ZVJPVWhpZUY4?=
 =?utf-8?B?LzFQQW9LU29ZbytFV3pQc2FvelhTU21OM1JSN1hrV1VFa1R4YW9ZTDNKY3VQ?=
 =?utf-8?B?RGtMajA0OFdqckM4VDNjTnBpNmFVaitpL0xadFQ2anBCYWk0Rll3ZjYweVU4?=
 =?utf-8?B?ckNKdG81dUxtTW5uUndQdy8reVVCYzBacEpacCtBbk1JWmRKMk9NQTJQTm0x?=
 =?utf-8?B?L3lGSHR6c1RkbDB2S2VSSHpsSGQ5TmlWOHRsZVpxM3NVdWJSVjZ1dnJ0TE51?=
 =?utf-8?B?RTVNbXUyMDRsZENRU1JpNUQ1VjZnMUpjQzY0dCtEUDN6OFU1djN1TXFka0pt?=
 =?utf-8?B?elp6TmJiUU5Xa0xlM3hpcko1SHhqa3NVOUdxUnQ2UUgydHU5ekdDTUlodEVm?=
 =?utf-8?B?alB2c1puTXoxOUFqMlRBRUlGV3F6MklMMXVCZGxzeWw4QVFiOEM3SWhwODdO?=
 =?utf-8?B?T3J3Z3dDWEMrQ3doVXo0eHRQaXZQQmxpZStFdTZzNGp1ZGpYeVQvU2dhbnFJ?=
 =?utf-8?B?TmFNMVNhQ3I2aFFEdGRxTjVqM2FIVVQvOElmWEkxdUZlcW9Kd0grc1doYlZu?=
 =?utf-8?B?MHM3dmo1QS81S2Jydm9QN0pOSmhTazZKU2JkbjRiL2hFR0l5ZHRRbWMwUFVX?=
 =?utf-8?B?enM3aldKU2RHNjJCTGVFRmZBanVqQnY4QkpjMkdraWlEeE9GY2RvRzBkSVhj?=
 =?utf-8?B?d04xcHdDYkpCSGdCeWZqRlhTYjNQM2c0QTJTYTNDcW5TR1YvR1pKVUlZZ09P?=
 =?utf-8?B?WXgzbUkvMTFlNm8rUDE1MnpMTVFKZWlLQXl1YUMxdEZhMVlGSjNYSy82b0Vn?=
 =?utf-8?B?bkpYbHd1WlpjeDVxamU3ZzNaSDRmRFFZYWMrNnloWGg2eldCd0FpY3FiVGg2?=
 =?utf-8?B?K00wM1MvbXlXaDN3YlBFWW9yQzR5Wjd0eXhYdVRXbGY4K1BaU2hvNG1WMnFu?=
 =?utf-8?B?dis1SmRhT2hrSzRXUGg2M0xxT0tYMDhXZ2c5a2lUdGtPT09aMmt5UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1ce629-83c5-43a4-e992-08de9370ba85
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 00:09:10.8936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xibHt/6xHNPmHv7kfNUTOoVm+cKBbIz1wKOlRe8A3s0RzdkujYdTmUU4jOfyBimzRen6gBPBAFqmNMrwr1yp5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6978
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_170914_188498_EBD3E3FF 
X-CRM114-Status: GOOD (  19.58  )
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

T24gTW9uIEFwciA2LCAyMDI2IGF0IDEyOjE1IEFNIEJTVCwgTWlndWVsIE9qZWRhIHdyb3RlOgo+
IE9uIFRodSwgQXByIDIsIDIwMjYgYXQgMTI6MjjigK9BTSBHYXJ5IEd1byA8Z2FyeUBnYXJ5Z3Vv
Lm5ldD4gd3JvdGU6Cj4+Cj4+IEkgdGhpbmsgSSB3b3VsZCBwcmVmZXIgbW92aW5nIHRoZXNlIGRv
d24uCj4+Cj4+IFRoZSBjdXJyZW50IGFwcHJvYWNoIGFwcGVuZCB0aGUgZmxhZ3MgdG8gYWxsIHZh
cmlhYmxlcywgd2hpY2ggd2lsbCBjYXVzZSB0aGUKPj4gZm9sbG93aW5nIGVxdWl2YWxlbmNlIHRv
IHN0b3AgaG9sZGluZyBhZnRlciB0aGUgZmxhZyB1cGRhdGUuCj4+Cj4+IEtCVUlMRF9IT1NUUlVT
VEZMQUdTIDo9ICQocnVzdF9jb21tb25fZmxhZ3MpIC1PIC1Dc3RyaXA9ZGVidWdpbmZvIFwKPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgLVphbGxvdy1mZWF0dXJlcz0gJChIT1NUUlVTVEZMQUdT
KQo+Pgo+PiAoUGVyIHZlcnNpb24gZmxhZ3MgZG9lc24ndCBnbyBiZWZvcmUgLU8gYW55bW9yZSwg
aXQgY29tZXMgYWZ0ZXIgSE9TVFJVU1RGTEFHUykuCj4KPiBbIEZvciBjb250ZXh0IGZvciBvdGhl
cnMsIFNhc2hpa28gcmVwb3J0ZWQgdGhlIHNhbWUgYW5kIHdlIGFsc28gdGFsa2VkCj4gYWJvdXQg
aXQgaW4gYSBSdXN0IGZvciBMaW51eCBjYWxsLiBdCj4KPiBJIGhhdmUgYmVlbiB0aGlua2luZyBh
Ym91dCB0aGlzLCBhbmQgYWJvdXQgcG90ZW50aWFsIG90aGVyIHdheXMgdG8KPiBhY2hpZXZlIHRo
ZSBzYW1lIHRoaW5nLiBJIHRoaW5rIHRoZSBiZXN0IGF0IHRoZSBtb21lbnQgaXMgdG8gbW92ZSBq
dXN0Cj4gdGhlIGAkKEhPU1RSVVNURkxBR1MpYCBiZWxvdywgYnV0IG5vdCB0aGUgcmVzdC4KPgo+
IFRoZSByZWFzb24gaXMgdGhhdCBpdCBpcyBjbG9zZXIgdG8gd2hhdCB3ZSBkbyB3aXRoIG90aGVy
IHVzZXIgKGtlcm5lbCkKPiBmbGFncyAoZS5nLiBhcmNoIGZsYWdzIGNvbWUgYWZ0ZXIgdGhlIGdl
bmVyYWwgb25lcykuIEJ1dCBJIGFtCj4gd29uZGVyaW5nIGlmIHdlIHNob3VsZC9jb3VsZCBzZXQg
YWxsIHRoZSB1c2VyIHZhcmlhYmxlcyBsYXRlciBpbiB0aGUKPiBgTWFrZWZpbGVgIGluIGdlbmVy
YWwgYEhPU1QqRkxBR1NgIGxhdGVyIGluIHRoZSBgTWFrZWZpbGVgLgo+Cj4gSW4gZmFjdCwgdGhl
cmUgaXMgYWxyZWFkeSBhIGxpbWl0YXRpb24gd2l0aCB0aGUgaG9zdCBmbGFnczogYC1XZXJyb3Jg
LAo+IGkuZS4gdGhhdCBvbmUgZ2V0cyBhcHBlbmRlZCBsYXRlciwgYW5kIHNvIHVzZXJzIGNhbm5v
dCBvdmVycmlkZSBpdC4KCkkgY2FyZWQgYSBiaXQgbW9yZSBhYm91dCB0aGUgY29kZSBjbGFyaXR5
ICh3aGVyZSBhcHBlbmRpbmcgdG8gYWxsIHZhcmlhYmxlcwpmZWVsIGxpa2UgYSBoYWNrLCB3aGls
ZSBtb3ZpbmcgdGhlIGNvZGUgYmxvY2sgaXMgbmF0dXJhbCkuCgpCZXN0LApHYXJ5Cgo+IFsuLi5d
Cj4KPiBBbnl3YXksIGZvciBub3cgSSBtb3ZlZCB0aGUgZXhwYW5zaW9uIG9mIGBIT1NUUlVTVEZM
QUdTYCBpbiB2Mi4gSWYKPiBLYnVpbGQgKE5hdGhhbiwgTmljb2xhcykgdGhpbmsgaXQgaXMgYSBn
b29kIGlkZWEgdG8gZG8gb25lIG9mIHRoZQo+IGJpZ2dlciBjaGFuZ2VzIChlLmcuIGZvciBtb3Jl
IGBIT1NUKmAgZmxhZ3MsIGFwcGVuZGluZyBpdCBldmVuIGxhdGVyKSwKPiB0aGVuIHdlIGNhbiBk
byBpdCBhZnRlcndhcmRzLgo+Cj4gQ2hlZXJzLAo+IE1pZ3VlbAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
