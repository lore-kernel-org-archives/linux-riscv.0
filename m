Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D1DE9D827
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Apr 2026 00:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qsU1Vu+BwwEU6f/0bs6/EEeCpQZylum5bcM2HIWFeJ4=; b=u47GnCc6CbhQu1
	1T1xzAPYi9AJwilEmGT16pEztELDIUzOIKV+hUZPSpSF7OuHO5U04VUHMA8pT45eRnyiwYKJgQ43Q
	eGaVK9JR9e5beoT7Qp40zT4XLCMzB2muRU7Rn5Nz5uLoyrAiQVMDn+4DidS/iiDf6NbiufrhlgCsa
	altnnPsZPUTHs83+qpAYJOHbLlJ91e3BRdWY5aII8Patgyj0avo6CP0/+RtddzFrl2q/AR18BB9HM
	4veiu227ioj+Tgg1YWlDwdzBDi0vsQ8tZ2N4nd3GEwCN5b1i56HL8lrDldt6hb+fhElsvRFtMJHdM
	6qdIREJEJ9xaihJx5KjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9XUD-00000004dPi-1r75;
	Mon, 06 Apr 2026 00:06:37 +0000
Received: from mail-uksouthazon11022082.outbound.protection.outlook.com ([52.101.96.82] helo=LO0P265CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9XUA-00000004dOy-2RAh;
	Mon, 06 Apr 2026 00:06:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WjU41YX1t8Hq26MBiJrxh6RTfb3mpTUWIb1V3FymMh3asalkIiHZ4hEmtpv8ry47xx9bp2B1MA71QYu1IKYdF2E+zpuVhpy/HxVOwSWh69AY2CnmIQCqV25JkPcy/A6E4waf7pRcU+Vazf+gfi3CQm5WPE9wOwzs8APii0rxLGsB91r2vvmqwI5BX8i0gllz/b1CojVr60/3pkkb7qQ6Ig6mZLbAo92EgaFNIjCQBunsFuzyxLHqR9vQd415CisaVnehUbMh3JY9CC9/puhzrn/7WVUF+dzHgJSKHM4was4GcvxM3CKLxjMkTs8Fg7HA/9nYUUTn1Qw2bp/NaMxhIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hG+arfldw+87ogy+l5GHFKsV4qEoOrFb3oSCw7B0ok8=;
 b=pua4MAOUeq1l29V61OANAi6B1cyXGaDFzmrBeah9NHlyfT5RXkQRDEcbaT21569IH79qfcazsc6BHW+3U4D3ZAisMHMLGrZyBaaDi3N3b0Ogxt7VO9+OeeqLFbPPTPGd9xE6EN98T8KE2QvxeEmlwIMF+BpgEEpl4Tpx4A+o+JVQHqONKPIXSVKkpcor+toZtoXGXBn17Iabh9CXADN3pWhSxxVhsd2jeAD+4UQPxFqKbHSaq8YhQvmsob2k/7PlnaFm9uAiF291UAfouQKeKfg0nsjUIqGL9KsjrYFH1ammVNJZX5MJjS9krl2Yvu1Dmca1k1TRYYa6YNFm3eiWNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hG+arfldw+87ogy+l5GHFKsV4qEoOrFb3oSCw7B0ok8=;
 b=xglSXtOGsxMRJIsyCLXImNOgWfuKXhXz3vx4vVGBTjflBHEiQsLNEvpTvpW+C0VJbBqktbIKHv9DT+56rF92YOb1fdq0eZvT4Ux7uxxVVY6q3l0P8wRZV7tIcizhd0pvbMVtDQa4JcXWh+EGEpFQlx+BwAoqHXX+DOpbgGQp2ng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6978.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Mon, 6 Apr
 2026 00:06:27 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Mon, 6 Apr 2026
 00:06:27 +0000
Date: Mon, 06 Apr 2026 01:06:25 +0100
Message-Id: <DHLMTLCY6U4N.3VOMQXRIT1RFY@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Tamir Duberstein"
 <tamird@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Brendan Higgins" <brendan.higgins@linux.dev>, "David Gow"
 <david@davidgow.net>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, "Todd Kjos"
 <tkjos@android.com>, "Christian Brauner" <christian@brauner.io>, "Carlos
 Llamas" <cmllamas@google.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "Boqun Feng" <boqun@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Vlastimil Babka" <vbabka@kernel.org>, "Liam
 R . Howlett" <Liam.Howlett@oracle.com>, "Uladzislau Rezki"
 <urezki@gmail.com>, <linux-block@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Alexandre Ghiti" <alex@ghiti.fr>,
 <linux-riscv@lists.infradead.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, "Rae Moar" <raemoar63@gmail.com>,
 <linux-kselftest@vger.kernel.org>, <kunit-dev@googlegroups.com>, "Nick
 Desaulniers" <nick.desaulniers+lkml@gmail.com>, "Bill Wendling"
 <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 <llvm@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Shuah Khan"
 <skhan@linuxfoundation.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 23/33] docs: rust: quick-start: update Ubuntu versioned
 packages
X-Mailer: aerc 0.21.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-24-ojeda@kernel.org>
 <177508434465.73816.4492182082440539007.b4-review@b4>
 <CANiq72nqenC30r7QQAmdKxS8ehGU2SoSGr+LCnoTAGLegH-KnA@mail.gmail.com>
In-Reply-To: <CANiq72nqenC30r7QQAmdKxS8ehGU2SoSGr+LCnoTAGLegH-KnA@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0363.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: 7376bf55-7c0b-44ac-adea-08de937058ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: uytaZ9NA0/dRopRAnBztFo5VdI3QszPdMD273Dd06+5rhE1BY9uy1qZJyrseTQC8pg9ftHoZIwqx8k9yyTACtiWKqsYakAGQ1dzUHpq/gZizGAIdRM9z+uBLIxLzndr/1pegFJrzOijWeHjYRYjOs32snQS4Qnh3Ge0NEiAD4+aD5dKpiMmnyHiUHAU3aiuKoLgJ1Z77t7dLWdjbkT2xYxzitpWH4H6cqytstXp8jOJZkxKXv2rjkuVps1k3ebwPBAhtEfobeiMFDld0EhBRgmtrT7bxCbEdw+fjfhAcZluYQ3vt2LIShjTGyNXzArMDeQPxxZnk1aLgVqxikiMRjR++QuJgyOJBAiVl7m1YkYmYkEY8SSTHf810CGNUBmzhzTBD9AQYLabXg65m+daQF5Gz0VrVvXBojhjdgCmzgstkn5oVGxsk9BAUelovRtKj7Rere5fgWUs3jELNAAf/QnmdBkhc07yR36hnub9fdF2T+YhAMcitUVIknh8Tp3vkhP2/7ZxDwM0tok85BfZw9QQ+huQ3CMYTGZbbG3pdctrqfOrA6F9yiidBTAIhqACcmIprkN/W6+XRkBrnMmghElPeObLzLJZa0nllvoFoWU+jQ4RClMPiOVY2HUPxDKnTpHgp5NIS7BjhtpUw+1m4p5Z9m4SFIMDDUUGt1f4+Fkr9omoRNhsCp+o4UX3JTE41
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0Nxb3ZDYXhPSHgzWUJLWUN6Y1BWTmllNHl3aVEzZ1hiZTBENmJLWWw2SXpL?=
 =?utf-8?B?MCtvMVVXWllaME8zU0ZJNlRHM0h4QkZFc3FZaU1WRFdiQjNVQzEwYXk3RG90?=
 =?utf-8?B?bWRka2RMclpuc2RKVXN3RzNMcytzQTJsWWFLdldEdTU0Yjc4RHlKYUI5Y2tP?=
 =?utf-8?B?eWoyMG9OR2hpbjJEZVBSSEFJUWo4STB5eFJsTDVFR1lGT0FDNVNmS3ByaXRm?=
 =?utf-8?B?VFpzTE9yM3IzOU8xWXNhczlpQ3hnZ2dFK1pkMUhuQzVDK0MyUXJ2RkZ2YitH?=
 =?utf-8?B?NFp3OTNsMVhmaTdoYzVXT3ZZSkxHUy9icFVreGJIREs5elRjbE1vYXhxbXBa?=
 =?utf-8?B?SDJXTGZIMjMzRWQ5NS9BR21zWG5DcU56MzFOVUdkNENpcjVGU3loeGMxU0N5?=
 =?utf-8?B?L1kvT0M5ZUdubGIvbmoyWmtrYU1sZ0hoUmZaTGlOcS8vWmpYUTVGWXViL1dC?=
 =?utf-8?B?dEkrMDFRSi9uMC9Lem9KMlEwZjhlRDUvM3kzVjJHaEFadi9tMFNkSGVuNXl2?=
 =?utf-8?B?ZDhTdFB6WTdSVndIMVdpTk5QeFVPTzJpQTlLNGN4TU5rZUlKUzUyYkJjMHNR?=
 =?utf-8?B?elk2OVpBRGVzbGx1MkFRbmFRS2hLY1dJTDNmNzhXM252M3lKczd4Vk9oR05O?=
 =?utf-8?B?eGswcjBhcDBOWDBTOVNLOTdGNkFBYkZLckkvaEFjdTVlU0FSVFBZbUliWU00?=
 =?utf-8?B?NmJ4YkJZNE1mMXpZUkhOVHBJbXVTVll1Qks1bk5oZFBKZjZMdzJpY1c0bVQ0?=
 =?utf-8?B?a2QzbllpdUZMQk45TlBJMjYxZ2w5Vk5UcHJkN2s2MDl3dUdQd24vcmlKbmRq?=
 =?utf-8?B?RzQ5TGs2Z1ZJcUx0VWFaMUplUDVoQng4cXN0VEtTaUdUTWlZd0ZYKy8yUU5K?=
 =?utf-8?B?Qkl5dzIrdFJwbGRFdWJWRGF3NDg2LzZsSWNycFM5bkJEdk85cFBTL2YyYzlG?=
 =?utf-8?B?aUtaV3pXNGM4bDVKMkV0ZzQ3dkxraGE3Qk5OajdtV1JsNXg0aEQxRlR1Nlky?=
 =?utf-8?B?Z2xGTkpaLy91ZEU1Ym00QUdJZlNQWTU3dGdSaGhvdFVmN1VjRHd2SEZqd3Uz?=
 =?utf-8?B?SGNBS29iN0ZBQzRoN3dkYklZMkhUVnROcUpyRml4NjJoT1dIaXRTKzJ3OUNN?=
 =?utf-8?B?K2VxN0loQUF1aHR4b3loemx2Z0N5d3lLcnI1NnhxMkQzSmp5NndmbjU1Z01R?=
 =?utf-8?B?NGQ3NEJGUkE4SERRaWkxYkh5eDVBVENkV2tGbzZQbGdKNDA4THoyWlVCUzRR?=
 =?utf-8?B?Y0hFVitmdFZka0svZU1RVzZOY1lXSFB1N3BPcVQ1eGRBTjVOQzFtcGtHaVlx?=
 =?utf-8?B?blViRGdMcXNHQVo1aGdqbU51RWxmUEpBSll2SFVpMlNaQWsyZ2diYmMzeUFk?=
 =?utf-8?B?R1ZjWUhjT0FTTUlHeElhVmZjWkxzZmdSN0NkR0VDTmh2STJNUWJ3dHBDMjRs?=
 =?utf-8?B?b25JdzBodHV0dzFCNU1MYXlMblFRQzFwVXhFTXc0YTQ4RjNMTW5nVzZHU2hu?=
 =?utf-8?B?ejZGZXhPOWZDNDhVMzB2UEZYWEI4TmVkaW1IVWsxb2xIc3JpQVIxdHNqMFEz?=
 =?utf-8?B?STJaMnZJUEkzVndaTiszME5tb3dHajdJY1NjamhndW95bTlxaFAvdjlwdWJG?=
 =?utf-8?B?NFg4Ylc5bzFGU3oydmMwa2g2N3QzdDdLNk5Gbi9uOWxlbFhObmh0OS90Wll0?=
 =?utf-8?B?T25JZTNsK2JKWTluZ1FXYkhydndGQ2hlSjE3M2E3TGVmTVFPaUN6cVEwbmxF?=
 =?utf-8?B?c29CZWlzVlF6L2NoRFVPajhyK2pRU01FL2hzUnIwWXo2SGZRQ0IyNDlsa1pC?=
 =?utf-8?B?K0RlSVdISUhSQUFsTXF5ZjhidVpSdTdqeEZLSjFlcEEzU3h1M3VabjM4bUVB?=
 =?utf-8?B?RUZpQjdQaFRNbWFqVFpYUkIzeEpHbEVFOEhHU1h1NHRLeUkrVExhUXdnYTRL?=
 =?utf-8?B?N3FFeVRDZGllL0FxWFlEakI4b3o3NEo5NGRsL3R0em9IZFZKMGMyRnlXdVdQ?=
 =?utf-8?B?bC9zNWdPbGVwV3lkaDV2V29oaW83aGFrNG0vcGtlSXpWaDVuQS9qSzZObTF4?=
 =?utf-8?B?VjZjYkxFTlA4R0JSR25xOU1OQTRybU5xbG5GWmtFbVVRV2diaWFHM0x0UlJR?=
 =?utf-8?B?WlRIdDB5OVZ6MHNXbkh4bm5aRW5pR1E1QWpWR0RlYzRtamV0QVNkSDhTckxK?=
 =?utf-8?B?Z3BScWpYcXVocFVZcENJQWFUaGZxRmlwNGdmS3FKWERrM09xNTNsRHlhT0I3?=
 =?utf-8?B?Z25OUDFaQXgvK2RTcGd4UnpxbnhlbGVQRmJycit0T0g0VzdZRDJpQTl6S3VV?=
 =?utf-8?B?WGdJc3QydFJnUlhmaE9DS2lTOGhnOWVLV3h2aklwdmJHdUNCYXhuQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7376bf55-7c0b-44ac-adea-08de937058ec
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 00:06:27.1667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzp+cXU80/RK2iPhUqWb0yQgbWHvQfE7ybguXBHR/p7JuMpN43g3X86uvtu9hbUnnUM0h6M8pQQI6JDufmqG2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6978
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_170634_651638_9E4BAC38 
X-CRM114-Status: GOOD (  17.31  )
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

T24gU3VuIEFwciA1LCAyMDI2IGF0IDg6MzUgUE0gQlNULCBNaWd1ZWwgT2plZGEgd3JvdGU6Cj4g
T24gVGh1LCBBcHIgMiwgMjAyNiBhdCAxOjAx4oCvQU0gVGFtaXIgRHViZXJzdGVpbiA8dGFtaXJk
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBSVVNUX0xJQl9TUkMgaXMgYWxzbyBtZW50aW9uZWQg
aW4gdGhlIG5peCBzZWN0aW9uLCBkbyB5b3Uga25vdyBpZiBpdCBpcwo+PiBzdGlsbCBuZWVkZWQg
dGhlcmU/Cj4KPiBZZWFoLCB0aGF0IHdvdWxkIGJlIG5pY2UgdG8ga25vdy4KCkl0J3Mgc3RpbGwg
cmVxdWlyZWQuIEl0J3MgdXNlZCBoZXJlOgpodHRwczovL2dpdGh1Yi5jb20vTml4T1Mvbml4cGtn
cy9ibG9iL2FjZjdhZTU3ODU4OWJiOGJkZDZmOTI3MzE0MWQ3MDUzZmVkODRiZWQvcGtncy9vcy1z
cGVjaWZpYy9saW51eC9rZXJuZWwvZ2VuZXJpYy5uaXgjTDE4NgoKPgo+IEkgdHJpZWQgb24gbXkg
b3duLCBhbmQgaXQgZG9lcyBzZWVtIHN0aWxsIHJlcXVpcmVkIChhdCBsZWFzdCB3aXRoCj4gdGhv
c2UgcGFja2FnZXMgbWVudGlvbmVkIGluIHRoZSBleGFtcGxlKS4gQnV0IHBlcmhhcHMgYSBOaXgg
dXNlciBrbm93cwo+IG9mIGEgYmV0dGVyIHdheSB0byBkbyBpdCwgYW55d2F5Lgo+Cj4gU28gSSBr
ZXB0IGl0Lgo+Cj4gQnkgdGhlIHdheSwgSSB0aGluayBpdCB3b3VsZCBiZSBuaWNlIHRvIGhhdmUg
YSAic3RhbmRhcmQiLAo+IHdlbGwtbWFpbnRhaW5lZCBgc2hlbGwubml4YCAob3IgYSBmbGFrZSBv
ciB3aGF0ZXZlciBpcyBiZXN0IG5vd2FkYXlzKQo+IGluIHRoZSBrZXJuZWwgdHJlZSBzb21ld2hl
cmUsIGkuZS4gb25lIHRoYXQgaXMga25vd24gdG8gd29yaywgdGhhdAo+IGNvdmVycyBtb3N0IHRv
b2xpbmcgdXNlZCBpbiB0aGUga2VybmVsLCBldGMuCj4KPiBDaGVlcnMsCj4gTWlndWVsCgpJIGhh
dmUgbXkgZGV2IHNoZWxsIGhlcmUgaW4gY2FzZSBpdCBoZWxwczoKaHR0cHM6Ly9naXRodWIuY29t
L25iZGQwMTIxL25peC1jb2xsZWN0aW9uL2Jsb2IvdHJ1bmsvZGV2L2xpbnV4Lm5peAoKSXQgbWFr
ZXMgdXNlIG9mIG94YWxpY2EncyBydXN0LW92ZXJsYXkuIEl0IGNhbiBiZSB1c2VkIHdpdGggc2hl
bGwubml4IGJ5IGEKZmV0Y2hUYXJiYWxsLCBidXQgZm9yIG9idmlvdXMgcmVhc29ucyB5b3Ugd2Fu
dCB0aGF0IHRvIGJlIHBpbm5lZCBhbmQgbm90IGJlCmZldGNoaW5nIGxhdGVzdCB2ZXJzaW9uIGV2
ZXJ5dGltZS4KCkZsYWtlIGlzIGdvb2QgZm9yIHBpbm5pbmcsIGJ1dCB1c2luZyBmbGFrZSBpcyBh
IHR3by1lZGdlZCBzd29yZCAtLSBpdCBib3RoIGdpdmVzCnlvdSBzdXBlcmIgcmVwcm9kdWNpYmls
aXR5IHNvIHllYXJzIGRvd24gdGhlIGxpbmUgeW91IGNhbiBzdGlsbCBidWlsZCBhbiBvbGQKZW52
aXJvbm1lbnQgKGFzc3VtaW5nIHRoZSBzb3VyY2UgdGFyYmFsbHMgdXNlZCBhcmUgc3RpbGwgYXZh
aWxhYmxlIG9yIE5peE9TCmNhY2hlIHNlcnZlciBzdGlsbCBoYXMgYSBjb3B5KS4KCkJ1dCBpdCBh
bHNvIG1lYW5zIHRoYXQgaXQgY2FuIGJlIG91dGRhdGVkLiBTbyBwZW9wbGUgKG15c2VsZiBpbmNs
dWRlZCkgdXN1YWxseQpjb21iaW5lIHBpbm5pbmcgKyByZWd1bGFyIHVwZGF0aW5nIGJ5IGhhdmlu
ZyBmbGFrZS5sb2NrIHJvdXRpbmVseSB1cGRhdGVkLgpJJ20gbm90IHN1cmUgdGhhdCByZWFsbHkg
Zml0cyB3ZWxsIGluc2lkZSBrZXJuZWwuCgpJZiB3ZSBkb24ndCB1c2UgYW55dGhpbmcgb3V0c2lk
ZSBuaXhwa2dzIHRob3VnaCwgd2UgY2FuIHVzZSAiY2hhbm5lbCIgZmVhdHVyZSBvZgppbXBlcmF0
aXZlIG5peCB3aGljaCBzYXlzIGBpbXBvcnQgPG5peHBrZ3M+YCB3aWxsIGltcG9ydCB1c2VyJ3Mg
bG9jYWwgbml4cGtncwp2ZXJzaW9uLiBBIHNoZWxsLm5peCB1c2luZyBvbmx5IHRoYXQgc2hvdWxk
IHdvcmssIGJ1dCBpdCB3aWxsIG9ubHkgYmUgYWJsZSB0bwp1c2UgbGF0ZXN0IHJ1c3RjL2NsaXBw
eS9jYXJnby9iaW5kZ2VuIGluIG5peHBrZ3MgYW5kIHdvbid0IGJlIGFibGUgdG8gaW5jbHVkZQp0
aGluZ3MgbGlrZSBrbGludC4KClBlcmhhcHMgaGF2aW5nIGEgcmVwbyBpbiBydXN0LWZvci1saW51
eCBHaXRIdWIgb3JnIChvciBzb21ld2hlcmUgZWxzZSBpbgprZXJuZWwub3JnIFNDTSkgd2hlcmUg
d2UgY2FuIHBvaW50IHBlb3BsZSB0bz8KCkJlc3QsCkdhcnkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
