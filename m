Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB416C3ABB2
	for <linux-riscv@archiver.kernel.org>; Wed, 28 May 2025 05:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nUC6Xd1TixUrerbDvVTewN5XkuVUz3geslTClBILa+w=; b=jh7tXFD0S91zGl
	p7jLZjhEfcvRtOkCE5I0Ifjx7PQdc49PWaRA+0xLPQJVH+NH4m2jHDqk+TG4sGdc8y51yahbBHH15
	NRDSyDbdjhLm358TP0XJ8YhZVI8w+iCZkYHJjVaiDvp9wKAuvDQTJrnqGv9uFRsmNnF7P8GbWV9fS
	ZnzhjmVawgL6zrx99YUBiG5XFYxwSDob4a06Dwlkh9KgIyrjKxlN0nZRQAQ/e3C6Pj6uhVpACwaO2
	biMlnWSKl5EbNa4bZVfFj6Rr+51vWI5N91CpnWEVHPyb7rXtvqKjV96BtzTcOX7yRFBOLKOHnZX1C
	FOigFac21fQMp9dePr3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK9lG-0000000CFFX-1y7r;
	Wed, 28 May 2025 05:55:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK9lF-0000000CFF6-2R4k;
	Wed, 28 May 2025 05:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
	Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:
	From:Sender:Reply-To:Content-Description;
	bh=WP2bed6KYhDQM4Gwj5U8y2Vuscv4EwD2xZpPlSeTXVw=; b=VM22jxpziiijOZSxE/muWBCpcV
	qVCwkGzsjNhET0LhwphJpbzgC7R3lNUCAii7adfXoR/J1/h7EmINYLh1bbhVV1FiqcPDGxrboQ23Q
	lnaKZCSTUwCGOios501i7ulviYFguSPtF0/wvti0c+haGYRsu91aYA7Z97spqSt/OVy1X0X3VG9zK
	ltzVnU2I4n54Kg41bE8Qr3UzRdVBRXvIy+dbwzkAETva+dgMEbidLuVMcMpWQ8AzzvBFo25yQtINw
	nhMwRNWdysi8UgjS4H1sxk8IbhaLMf9NXRp00zrK2jjnn5ZGh74yyqFLRRPX8il+o9DmT3its9CYG
	rIos69Aw==;
Received: from [2406:e500:4440:2::700] (helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK9lA-0000000DGqi-393J;
	Wed, 28 May 2025 05:55:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/dV9mN2XNBkMP0sb0kGFB7YASIV3aRQm3DV8R1qNuFNM3wa4Z2fcMvBMDsQrYn0BMr0EBMcIUC6tpJVkHONMAD35vkF2IebvnmXNUcXup8OhXmZ643ANr1hJBXWN8kbjLZNfhwBijMJNckOJnhTl4YqbrbPtEBbZm3WuTaM/yRsZka1XV5MzrTEaQDy0eM5u/w7enFsaeEPchmak/gz3sPvd4smM3Vo0sfDBOAY5cPVo319Ju3AT4qliV9/ve2g5dQTBusumun2phQvEg90gjOzVUWbUHlN2rb/50kNf/BM0vScaNCcCHNgqAeVSVK15JHygoFI+iHc4CSOs/JCRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WP2bed6KYhDQM4Gwj5U8y2Vuscv4EwD2xZpPlSeTXVw=;
 b=HvBYCDv2ZpCjOHhtUt58dKtk0v8faFIX9Yzono/djX+Y1DVJ5wi7W0wXlpZPZ/6s/xtpjIjg3Tr77S+i2nb/H2+6k3cL4IJ1Fb0KbjnVW07aV5EXaU+wKsPYW8awY1pH1VYG/BBak5zUFS3ukXsBnnIu04J6dPw0aTFz6g2zDMVe31Yp5cJSp768wK5EbLlcF3sQCWs0AjJwyxJN918J7zUvvjxqfQU0mDZ2DXeBumjR8OEGG/Nn0bc6nh+1tH5rlZ+LPUX1zrY60mFp+nNeBeZGMCs/lwHKi/Lwbjf5rhdrQ212oqpqH1PId7lqzadpYS70ZQgkXHZp818ZcJItQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NT0PR01MB1182.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:10::10) by NT0PR01MB1006.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 28 May
 2025 05:38:37 +0000
Received: from NT0PR01MB1182.CHNPR01.prod.partner.outlook.cn
 ([fe80::f92e:ed2b:961a:ffca]) by
 NT0PR01MB1182.CHNPR01.prod.partner.outlook.cn ([fe80::f92e:ed2b:961a:ffca%4])
 with mapi id 15.20.8769.025; Wed, 28 May 2025 05:38:37 +0000
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>, Andrey Konovalov
	<andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino
	<vincenzo.frascino@arm.com>, "kasan-dev@googlegroups.com"
	<kasan-dev@googlegroups.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>, Catalin Marinas
	<catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>,
	Evgenii Stepanov <eugenis@google.com>, Andrew Morton
	<akpm@linux-foundation.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 0/9] kasan: RISC-V support for KASAN_SW_TAGS using
 pointer masking
Thread-Topic: [PATCH v2 0/9] kasan: RISC-V support for KASAN_SW_TAGS using
 pointer masking
Thread-Index: AQHbz5LCggCRyeDhFUyVwdwWhSEppQ==
Date: Wed, 28 May 2025 05:38:37 +0000
Message-ID: <46458788-54e1-4b4e-b7ef-852d9fb09ca6@starfivetech.com>
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
In-Reply-To: <20241022015913.3524425-1-samuel.holland@sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NT0PR01MB1182:EE_|NT0PR01MB1006:EE_
x-ms-office365-filtering-correlation-id: 9957ff34-53f5-4b73-4ecf-08dd9da9e550
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|41320700013|7416014|38070700018;
x-microsoft-antispam-message-info: Xc3KyDUF/tpXGwQVYwbX9utWh6W1HksN6qW51B02Yj/8Fp5nakSLLd5G4+bA20CN13m1POe0bmDgZ2zr9+XKft5yuWyfef2PN/foLOY6t5H7OrPlEYdEO8s6F5juldP+QXKf0EChJ32L6ND1MY6BfN0CkrGKQ1wUWdpxKLPFowWpjI7iZ9u6IWi9F7QRVHVzpthHx5nO9afTZ5dZqHHB0VFL6Jn2gd2mYz47RGGf3JCXBCTrXrCms+CRhYuTAXvqXlChsk3lsc9HQ6pL9nVGoCO/2jZUi/evf+9QuJmL+YJU31O4KBCrRWHxC4JzZFXmZc3w8o7d15joj0ZBOGrmwvLWBYVl8qMhiqBRyhlZGJuVX4ZzFIl2RBJT60lftvkmM/5j8vcP5geeKvUAofm5kFFg4Z/g3t/ul6k8K99T+xPGb7B8Hccvr7mGLDU5aoRQJr3ftrcAq4bKt150VhzRtKLYra7CL4uyp55r/xDeY71JFeA9fB6m5lGEvr635rmZ63OqQ2h6UBDX9KSQXmuZ7WuSSJ/iehUzF0eeCnzjUzVxtSF8OED3Zjl0EtWSsi8Sarw2jcYSB4Uw2SAMtLIBZw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1182.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(41320700013)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qm9sMUZvMldmZkNXOGJ0N2pXVXcyMy83N3BBZTRITmUwUlZqZVdXaUJ2RzBp?=
 =?utf-8?B?WDNUclMwMVd3TC8wa1Nja0k1UFIzbXkyRWVybzIzUFBLSmx3ekxpT0I0VUcw?=
 =?utf-8?B?d3hHNW1UMUo4eGRRQlJyYXdHWWNJOEdJOXhvODZBeXVNeDZIZFEzRW92VVRU?=
 =?utf-8?B?UUVBOWlCQ05HSDBheUM1K1pvZVNCc2Vhd25Nb2xwaGVZdGU4QzRVcFVjbXVC?=
 =?utf-8?B?S1hWNGFyd3ZiWmVyNlQrZ3ByYk51SVBDa0VoQ3VheVZRak9BZ3psWVJFc200?=
 =?utf-8?B?Q24zT3Mvc2QvL3diWUdQWW9ocDhicVpDeTI1dTFzbWdTY0k1WVF5aDF1YjZ3?=
 =?utf-8?B?cUNJQXVFMlhaVmtjMThRT3VnYVh3OHU4NURPR29TbGcreDY1SU1IR2V4VnJS?=
 =?utf-8?B?d0o1TVFkaXd5OFRlZWEvS0l5OEpUZnVrbEpqRWRMYnlLOHRBZWZuZUl4SVli?=
 =?utf-8?B?dXkzc2Nqb1dHbUdVeDBmWUN6OVRTTjJXZVBzbmxxZ1FSQzhDRnhFNE41Szdw?=
 =?utf-8?B?TXNVTjJVYmZzaUtvUlg0MlhLUFphVU50dWl4TWJSWHc2Uk5Tb0dxV2cwRjRH?=
 =?utf-8?B?NzIvRG9KTEh3cnBHd3pXWHByY2JjQmtBaVE4YXN0WHZjWGIyWTZQbkMxSnVi?=
 =?utf-8?B?RHdGRSs2QW1mdDhMYlZVR2grM3NIeER2ZGlBSGFQVy9qLzRzR2hHWFJIVmc5?=
 =?utf-8?B?OWNzMVpzSTZqcXVmazFvbG5xY3hxTlVMODFtY2JCZ3hQRlp3Y1NiMG9JVW9Z?=
 =?utf-8?B?R2xIQmhBS2F5Wit2T0ZNSFZQUVBMK0dBcHZ2M25qRnkwSEhldkh1a3E0SXRV?=
 =?utf-8?B?dG9VdlNDOUg4U2picHlKZmxuY09BSDE5a2ttNTB3dFh5bHNqUjZIUmRRemE1?=
 =?utf-8?B?cjdLZStKelduYnlVZi9WTjMzNlJ6VzdpT1pISVFjUjZ6MEtrRjB2aDhaK2xw?=
 =?utf-8?B?d1VNM2s3eGtFby80QWdyM29paUxwNFg3d0RabVMvUlpsREI2aEVmY3pCZlFn?=
 =?utf-8?B?SjM3Q0JxZGRhMHdTZlpYK0VYUlgzaG5vYytXU0Z4OXdyaFhGN1hESyt2aG9U?=
 =?utf-8?B?R2V6cDdrK1RxWFd6QVQ2SDB2S0w3M0lRR1h5TDA3MzZRT295VXFXM0lKblh4?=
 =?utf-8?B?UThyQ21RclYwRGJOMTRrWktIWDR1NlZ4cVY1dnBtOEZjV01QSExKQzdERHpC?=
 =?utf-8?B?aGpIcUVtMG1IOURtNFR0MTlaWXZKclc5VWZwQnlNLzZhVVJabWsvc1g3NWQ4?=
 =?utf-8?B?ZDNCYzRmUmp5UTNLaGVjVU5WSWR6RUVtMmtTUmZxSHRmL0dRa2RRcGZ6NXBy?=
 =?utf-8?B?MHNERzU1eGhyRisrU0VaQks4YUVNZjRCa3ZtQnF6cHpPQmMyaTRCbGczZzd1?=
 =?utf-8?B?VHJQTFhHTTlRRDZmeVgybFZRd0ExcGFPeUtLaCtRT1J1OUt2OVRNTWpVTHhP?=
 =?utf-8?B?N0pzU1J5MVdLNm9iTk1HYTMrclJhZ1R6SG81dDBYYytoSWxZU1JnanU5UHpq?=
 =?utf-8?B?Z3gzWGZNNnUvZGVtVW9VUFdUK1dzNlBML0dQT0FFc2pMWGF2RkRaSFlLdXFZ?=
 =?utf-8?B?Zmp5N1FEeHZ2WFVOMHBacTRHM05sQktESysrK2sxNlVLSFJ3TWg3UTk2Q05k?=
 =?utf-8?B?WFdaMjJ5ampnR0tQTk92dkhZc3FNbFEwZDZLK3l2STlUUi9UMTVnL1VsMEpV?=
 =?utf-8?B?cEY5bkR0eURhSHJDSzFHMzZLQUcybWhpTDNhVU1HbVJWWHFyL05PSmE2VG1D?=
 =?utf-8?B?RGJxZmFZTTdUdytkT2ZBdTRlN2dIdkIrcWxrL0xXY21Eb0NtYmdYNE1XcXRq?=
 =?utf-8?B?YmdkcmJXaUtqZEVpWDNUcnhndDl1amE5bnlyRzZYRmc5c3gvN1ZYOWs2R3g4?=
 =?utf-8?B?LzJvL2kxNVlzakhxanhBZk9ZaDRNalVZVUZ5NWN6ZjhXUEh1MiszY1VJc1NK?=
 =?utf-8?B?TC9TRitxamhRR083TFdNR094V04xVTJ6dVFYdGFVRCtsSUMyajZlTnU0Mi9q?=
 =?utf-8?B?bEJuQTlLNndvRGdjVDkvU09sM1RITmg5U0M4c1NiQ010aHdHVE1nYnpsWEZk?=
 =?utf-8?B?ZC9lK2h6eFFzUnBiczVSOW9POVYzdXJOSkJZY3NLK3pQVC9WZCtPM0ZzajM3?=
 =?utf-8?Q?GpaxMWjuPba/J7wAlAsG6nRft?=
Content-ID: <574075A7DDAB034190582EC40F87D767@CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1182.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 9957ff34-53f5-4b73-4ecf-08dd9da9e550
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 05:38:37.8514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QtPkQxX8YtA2y1vlaU7nlBs7kcORqwOpJo56CIZ9ViIXM7daOKrk5XN/ruAN6js0OqY0auEOx/ket3hZstydjYonafBGUV8TT5kI9jz6Fko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_065528_810978_EEDF7894 
X-CRM114-Status: GOOD (  18.72  )
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

On 22/10/2024 9:57 am, Samuel Holland wrote:
> This series implements support for software tag-based KASAN using the
> RISC-V pointer masking extension[1], which supports 7 and/or 16-bit
> tags. This implementation uses 7-bit tags, so it is compatible with
> either hardware mode. Patch 4 adds supports for KASAN_SW_TAGS with tag
> widths other than 8 bits.
> 
> Pointer masking is an optional ISA extension, and it must be enabled
> using an SBI call to firmware on each CPU. If the SBI call fails on the
> boot CPU, KASAN is globally disabled. Patch 2 adds support for boot-time
> disabling of KASAN_SW_TAGS, and patch 3 adds support for runtime control
> of stack tagging.
> 
> Patch 1 is an optimization that could be applied separately. It is
> included here because it affects the selection of KASAN_SHADOW_OFFSET.
> 
> This implementation currently passes the KASAN KUnit test suite:
> 
>   # kasan: pass:64 fail:0 skip:9 total:73
>   # Totals: pass:64 fail:0 skip:9 total:73
>   ok 1 kasan
> 
> One workaround is required to pass the vmalloc_percpu test. I have to
> shrink the initial percpu area to force the use of a KASAN-tagged percpu
> area in the test (depending on .config, this workaround is also needed
> on arm64 without this series applied, so it is not a new issue):
> 
> masking, the kernel still boots successfully:
> 
>   kasan: test: Can't run KASAN tests with KASAN disabled
>       # kasan:     # failed to initialize (-1)
>   not ok 1 kasan
> 
> This series can be tested by applying patch series to LLVM[2] and
> QEMU[3], and using the master branch of OpenSBI[4].
> 
> [1]: https://github.com/riscv/riscv-j-extension/raw/d70011dde6c2/zjpm-spec.pdf
> [2]: https://github.com/SiFiveHolland/llvm-project/commits/up/riscv64-kernel-hwasan
> [3]: https://lore.kernel.org/qemu-devel/20240511101053.1875596-1-me@deliversmonkey.space/
> [4]: https://github.com/riscv-software-src/opensbi/commit/1cb234b1c9ed
> 

Hi Samuel,

I noticed vector instructions failing with sw tag-based kasan enabled.
E.g. running the rvv_memcpy example from
https://github.com/riscv-non-isa/rvv-intrinsic-doc/tree/main

Error log:
# ./rvv_memcpy.elf
[  354.145633] Unable to handle kernel paging request at virtual address ff7ac00001078410
[  354.146334] Oops [#6]
[  354.146511] Modules linked in:
[  354.146791] CPU: 2 UID: 0 PID: 134 Comm: rvv_memcpy.elf Tainted: G      D            6.12.19-00023-g6ec23f450118-dirty #200
[  354.147771] Tainted: [D]=DIE
[  354.148350] Hardware name: riscv-virtio,qemu (DT)
[  354.148888] epc : arch_exit_to_user_mode_prepare+0x32/0x80
[  354.149334]  ra : irqentry_exit_to_user_mode+0x1e/0x9a
[  354.149659] epc : ffffffff801b8836 ra : ffffffff8213db8c sp : ff200000007b7e90
[  354.150173]  gp : ffffffff82c2bbc8 tp : 9560000080c56600 t0 : 0000000000000001
[  354.150709]  t1 : fef0001000000000 t2 : 9560000080c56600 s0 : ff200000007b7ea0
[  354.151082]  s1 : ff200000007b7ee0 a0 : ff200000007b7ee0 a1 : 9560000080c56dff
[  354.151658]  a2 : bd60000083c20800 a3 : 0000000000000600 a4 : 0000000000000100
[  354.153212]  a5 : fff5ffff080c5661 a6 : fff60000080c5660 a7 : fff5ffff080c5660
[  354.154668]  s2 : 0000000000000001 s3 : 00000000c22026f3 s4 : 0000000000000002
[  354.158327]  s5 : 00007fffaac623e0 s6 : 000055555eec6de0 s7 : 00007fffaac8fcb0
[  354.159481]  s8 : 00007fffaac90008 s9 : 0000000000000000 s10: 00005555844b1bd4
[  354.162673]  s11: 00005555844b1b48 t3 : 000000000000004a t4 : 408a03c3cac3a788
[  354.164378]  t5 : 40659b6a3963f6d4 t6 : 4083e9c60c55738c
[  354.165117] status: 8000000200000700 badaddr: ff7ac00001078410 cause: 000000000000000d
[  354.166137] [<ffffffff801b8836>] arch_exit_to_user_mode_prepare+0x32/0x80
[  354.167201] [<ffffffff8213db8c>] irqentry_exit_to_user_mode+0x1e/0x9a
[  354.169119] [<ffffffff8213d4cc>] do_trap_insn_illegal+0x5a/0x92
[  354.171989] [<ffffffff82156bf8>] handle_exception+0x148/0x156
[  354.174056] Code: 0593 7ff2 b603 4615 0693 6000 a073 1006 7757 0c30 (0007) 0206
[  354.175524] ---[ end trace 0000000000000000 ]---
[  354.177344] note: rvv_memcpy.elf[134] exited with irqs disabled
Segmentation fault

Thanks
Jia Jie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
