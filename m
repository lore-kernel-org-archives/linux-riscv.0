Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695B5C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 08:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rAaqGfI3ModkOqsDewLGdfcc1I3IK9BM+XIkXidy/h0=; b=t6vxtIUs+orWXn
	g6hqYoX/EUsL8XsQPlJtE4WnYIouY2bdDVRxQ2dbGLCYcxIscJ3//3kl/Q58cmLWyEoEUV2A9qGk2
	Z/FrGdgGFGVi6+e05oCTBOZxxuRrqWtzydWRjHNOSQUr94d4FaMfUwFHveXVUggYAfyChayd/Kor5
	MD3bFhyXwdeR+gY1v0R08MGki7SK3P4ePHuel3/WflOWHaNqx7KMZiUdL+jjCRzXSmNV31HkuW5Ay
	IewWMI5napZAFoUW+5YiYCboBIaH/tvtFK4WaL2MvrGe8I2wtIigVMw2xb5m5Z6nOO/uuiw3Loe8M
	FMwYdQd6odQsykHw5lrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzDq7-000Nl2-2C; Thu, 09 Jun 2022 08:48:27 +0000
Received: from mail-pr2fra01on0602.outbound.protection.outlook.com ([2a01:111:f400:7e18::602] helo=FRA01-PR2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzDc8-000H4O-DO; Thu, 09 Jun 2022 08:34:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNIckOkTnVW0Ddqs4ZIFVLxyaZ3Y2fCGcgzdcB+GoJop6Kh3mcWvQwgchywRUkiCZi68F4nQv9hFmPvPuG9qLgSQAGJJcL82x8UBgE6KSkZv0Yy0TwjAyDd9YpwFoh4ooI1H6FGKHetWmWRVk5wHJcmQFtvy2EHTfYgEVWbKCCQiDDmJ/xFR6U/103qO83FKVIQilKdw4DTiModl/XBT8Un5BalAK79PQ0uQNAXnWueDO2IHl5JfEsam24UX2cSkxQip9a9PDGfaPUAY4VQr2Y7+wu7Mt5fkQEN9nHD5BVMg5sK5jm2O7Dx3sTkWpiCpjg3RdFBPoXVCMiyk0qWQVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guPly/9qmVnbEFidLJROkofoCwUC2ZDjdrfiOl97cxg=;
 b=cgV58ztSCvocydqplZF58o+bYw8UFf6StdKl814XNakOwUtHk7AzX+bUBrNnblFZk/vrPAk1Qs/OoqkkoxCiwAuGGANMc7A6BME60LzTNkfd4wFOWbl3aEnG79nKHSmcLBEXlD+LGk1DSmbe/qboYhadSCqMEnOpckzDoGK7HsebbdJx9N5roxJrbSIRWs1pUbT46TOSeuPJ+G7GRvlM3ZExbEIPgXCHzAEnIg7Ddi6a0Xm+dxGUpJxrpI7DP1xZZ1SMkImP6bb4giYnLU0Q66nQxt0/5bzkheQxYpYc3JXlpeP+sJtFmFGhW6ryQ551ohgzrqNxOXwyjmmeqgHPJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guPly/9qmVnbEFidLJROkofoCwUC2ZDjdrfiOl97cxg=;
 b=GlLTmjAdXJnThv2iFCnQzThiqd6LwkY2sRFmtrjOYo8BjUmzvbG57pL5eEbQ9epxSb3UljlTj5MFx/4xpSaF+jJV0JX15Q0KojY/XT9QNE7/av1G1jZr9SvQ76bBy8R5uHBlJ07xe+EFnoIsXGzws3+al2q3AevH+fnSjWGJ2OIbKIpPnWbQKZJUMeN8TrwkhGoGg+ff674NHh9HOJxBXl3lFoPjzPDzLcYa2uOiGayV1E0ueLAynboEpYYyXcAUPa0XCZmHHTW9YIzdndUwJjkrGU7vcYZTr1atL01QLbj5FEpGeeahtgL0to0J+xycUGP0qt+/mA/laYmADPszdw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1933.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 08:33:55 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%6]) with mapi id 15.20.5332.012; Thu, 9 Jun 2022
 08:33:55 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Song Liu <song@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
CC: Jarkko Sakkinen <jarkko@kernel.org>, Guo Ren <guoren@kernel.org>, Jarkko
 Sakkinen <jarkko@profian.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Nathaniel McCallum <nathaniel@profian.com>,
	Russell King <linux@armlinux.org.uk>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>, "James E.J. Bottomley"
	<James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
	<gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, the arch/x86
 maintainers <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "Naveen N.
 Rao" <naveen.n.rao@linux.ibm.com>, Anil S Keshavamurthy
	<anil.s.keshavamurthy@intel.com>, Luis Chamberlain <mcgrof@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, Kees Cook <keescook@chromium.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Nathan Chancellor
	<nathan@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, "Eric W. Biederman" <ebiederm@xmission.com>, Marco
 Elver <elver@google.com>, Dan Li <ashimida@linux.alibaba.com>, Sami Tolvanen
	<samitolvanen@google.com>, Ard Biesheuvel <ardb@kernel.org>, "Russell King
 (Oracle)" <rmk+kernel@armlinux.org.uk>, Nick Desaulniers
	<ndesaulniers@google.com>, Linus Walleij <linus.walleij@linaro.org>, Chen
 Zhongjin <chenzhongjin@huawei.com>, Nicolas Pitre <nico@fluxnic.net>, Mark
 Brown <broonie@kernel.org>, Luis Machado <luis.machado@linaro.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Joey Gouly <joey.gouly@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, Andrey Konovalov <andreyknvl@gmail.com>, Kefeng
 Wang <wangkefeng.wang@huawei.com>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
	Guenter Roeck <linux@roeck-us.net>, Dave Anglin <dave.anglin@bell.net>,
	Alexei Starovoitov <ast@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
	Daniel Axtens <dja@axtens.net>, Aneesh Kumar K.V
	<aneesh.kumar@linux.ibm.com>, Jordan Niethe <jniethe5@gmail.com>, Anup Patel
	<anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Changbin Du
	<changbin.du@intel.com>, Heiko Stuebner <heiko@sntech.de>, Liao Chang
	<liaochang1@huawei.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, Wu Caize
	<zepan@sipeed.com>, Emil Renner Berthing <kernel@esmil.dk>, Alexander
 Egorenkov <egorenar@linux.ibm.com>, Thomas Richter <tmricht@linux.ibm.com>,
	Tobias Huschle <huschle@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, Daniel Bristot de Oliveira
	<bristot@redhat.com>, Michael Roth <michael.roth@amd.com>, "Kirill A.
 Shutemov" <kirill.shutemov@linux.intel.com>, Javier Martinez Canillas
	<javierm@redhat.com>, Miroslav Benes <mbenes@suse.cz>,
	=?utf-8?B?QW5kcsOpIEFsbWVpZGE=?= <andrealmeid@igalia.com>, Tiezhu Yang
	<yangtiezhu@loongson.cn>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Aaron
 Tomlin <atomlin@redhat.com>, Linux ARM
	<linux-arm-kernel@lists.infradead.org>, "open list:BROADCOM NVRAM DRIVER"
	<linux-mips@vger.kernel.org>, Parisc List <linux-parisc@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-riscv
	<linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>,
	sparclinux <sparclinux@vger.kernel.org>, "linux-modules@vger.kernel.org"
	<linux-modules@vger.kernel.org>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
Thread-Topic: [PATCH] kprobes: Enable tracing for mololithic kernel images
Thread-Index: AQHYessDwND8kPCFFkWhvh7Pg63gL61Ey08AgAAvegCAAJWmgIAAHxoAgAESMIA=
Date: Thu, 9 Jun 2022 08:33:55 +0000
Message-ID: <f7ff2a8d-4128-dac9-9768-1d98bfb06a06@csgroup.eu>
References: <20220608000014.3054333-1-jarkko@profian.com>
 <CAJF2gTQgCn2CyZ4+VBqEEBT2b4+1KxoEXxrd+Ritk=58+U8EFA@mail.gmail.com>
 <YqAy0qjI4Lktk/uJ@iki.fi>
 <20220608232115.ccd4399f4a1d133e9b65c2a9@kernel.org>
 <CAPhsuW6iUieQvA6KqzSLgtxmjkVSWCuVwNA338DATb_myHxo7w@mail.gmail.com>
In-Reply-To:  <CAPhsuW6iUieQvA6KqzSLgtxmjkVSWCuVwNA338DATb_myHxo7w@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e753c3a-7d15-43e8-63d4-08da49f2caa4
x-ms-traffictypediagnostic: PR1P264MB1933:EE_
x-microsoft-antispam-prvs:  <PR1P264MB1933BC7A15BA656D04A0485DEDA79@PR1P264MB1933.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  9R0xwjPy3sAXAzKKEqwlZFm1v5zgaXpSakyShXLm/5roCupsiyI5x6niCO8Es7TOxMfItTNwcAbo3wsRs/kvbCD6XiyCzUUG+CortvvFkSGgnYcJxB6fTfWE74MXfs2DMkv4urzD2BodTdQ9s6nMDvxQy3YCCEtHDLJjV52nH/66MGV0wbA6X0vHPvjtM+vb5E3UG1eZhwCBetL7Ixua/xi+7UiM45d4PhpdhVpWml1yXMfew2gjCGQ2oBRZbs/5a9ID78rqJSSrGfRrCprOh3K2O4hU57jstHb0YDlNk1EXbF3ibNQV2F0fvabz3NeTpUjvSntixFYuzszzfg1+2iPv0XAKHtpGRpYCIgUG8nJviJ8p4UPIFVM8ozJnWpv7jFzZGxB9Fqnkna/rRuaPKA5XeXInu6BGMIggigzCPMjdtO/7iMQg2jRAV78PxBiQRC0nSwRVe3yc7F3fory/Y+KsJkyKgn4cYZkK6cJK+MrnpyMuwjiS3cnTnrQidOk0vrIcTynMuMNYQGhXpmZHppucSxRf9N0xRK66QvXTXD/S9hwY/7whzZ5KwpgeoMFvulub4XifGrlKOhtl1pociAPAfz3xhq36kC6zbY7yWikxJVkjyJcllOpWAgVoTPlwkgQS9N7XwbO88dYZIAnEzOf13/qxRESCP9XuGbywXk0Mbirtz6fEMC4wvA6U8JVvcj+AEKb3wVVbH2ZVdtH2PAUrx5mQy2dTMkMy6fRivbVf0DpLsBbdA//H5g1J/BBAYHq8nbEgGm9stWVl3/S8cZMCasKhQBDzaknM72jXVgqk4RpnMREJ9t8PTgYAQpgjtfy1hgMHY5JoxX3zx3nDPo4mroFZmHjtyNlO/7EDq7E=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(966005)(2906002)(508600001)(53546011)(71200400001)(2616005)(122000001)(36756003)(5660300002)(4326008)(110136005)(91956017)(66446008)(66946007)(31686004)(76116006)(38070700005)(44832011)(8676002)(7416002)(31696002)(6506007)(7336002)(7406005)(7366002)(54906003)(66476007)(66556008)(6512007)(316002)(26005)(86362001)(64756008)(186003)(8936002)(6486002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VTVQWFhWdWx1eGtYMVRCdkl5eVJUaWlXbWJzQ042SWNWMWZDK3l5VkNXSEJt?=
 =?utf-8?B?SVg5a3JsWU1iSUI3R0JQOEtqZllaNUViNHJVQTBtWmZBSXZyWHNPZWltRzE2?=
 =?utf-8?B?Z1lneTlpdXptZkxnLzZXVmJ5RWRYamlGakMvVEVqZFRPT1FxQXFvNjVhS1dD?=
 =?utf-8?B?a01vOU1TQ1Rwa0hnRFhZRGNJN0RsZVpHakNyTEMxUlBvTW53a1MxNmNhN3ZW?=
 =?utf-8?B?Q3RRNU5ZM3haeHlKR05nLzZuNVk1WmNEUjdkaXdEUTl1Y3VkY0FpckJSeG15?=
 =?utf-8?B?QTFSaWFjUUR0WGxQdy9MN3V3d1MvMkJqTTRNS2NnOW9JdEhJWWI0MlFGTEpV?=
 =?utf-8?B?OHBZRnJIREFWU1FJdFY1SWdGZ0ZqTFhjdDYvbzJhdStDempScU9NcWV0OXBj?=
 =?utf-8?B?OGRsdXZrdXlrWnlsU2NrcytxWUlnNmhJMnNXTlpzTG52QlRhN2dSeFJ5Wlpa?=
 =?utf-8?B?ZzBLeStzM1FzSGJQbEF0bS9jVVlqVk10VDZlbFZUbkhQMStqTmswczludzBQ?=
 =?utf-8?B?THJXWTdIMk5yYXY3VXIzSWd4N0xBT0JIRzdoMFlIRmh2dlMrMjBrbWQxMkdN?=
 =?utf-8?B?Rm1yZ2VpNStQQXFkSU9Pa2k4SE1VNDBNdUhqRmI5anRNVEFCMVFlTyt3N201?=
 =?utf-8?B?dEVEL2d4SWcwMDBtYm0rU2ZOVUlZcVNNOHJYalhRRnJhaURLRmJoQnMxc0Vj?=
 =?utf-8?B?dDlZdWlJZ25XSTI2Nzl4RitvdysvQU83ellaL2tEeUcyUTZ1UlRuM0N2MWRq?=
 =?utf-8?B?WWVyMjUvTDNtOWNuVmZxQndhZVJhVDVvNWtRWnFNaVRVSDl5STR6YU83WTds?=
 =?utf-8?B?dEdUMGtnWkR4dzhGRWFjdDF3enVIY05HRHIrc0ViU0FZb21DZUFUazFESFlG?=
 =?utf-8?B?bFlaSTJrcnlHWjJlL0QxR3U4RUUrNFlqRS9YeW8zMGdzRjJySnBBWldzYkZw?=
 =?utf-8?B?V09meFppcFBUemFXUG9TMHFOd3VySkZPbXZva25vSDJ5OWUxNGFBSGtzZ0hI?=
 =?utf-8?B?QW1IR2RaL0Z2QjMrL2NyQ3lxVDk1VmlJcmxnZGUyZldaeFlWM1JYNU54SFJw?=
 =?utf-8?B?RGdDVjhGQldwSTlTWEFuRldzRmppYlZ0ZHloYlVNSUpIZ1JrMmNtY2dmZ0Fx?=
 =?utf-8?B?dVE3RHR6VGIyTmFUVnVCM2c0QXVFSXdIbm5YRU8xMTRKTms4eU9VN3lQMGRy?=
 =?utf-8?B?K051ZnR4QW9FbDBqaDNHcms3NkVZaUszVE91YWtKZEJoL3Y0b240TnJZUEZF?=
 =?utf-8?B?TldyWFhaaXpleHlONkkxZkdzWmFCVGt2L0ZoMldodWxlNjJlazA1UWhpNDhC?=
 =?utf-8?B?VjFDQzA4MXdyaGJFcEZKVmxRVE1XOG5Ga290R2dMY0o2aS9ldFIxSHY2ZmNF?=
 =?utf-8?B?U0JTK1ZLbU1XeHhrQk9adjk0RDBUQmdHWHhCOTZibHM5U3VKK0ZXWmVxcFNT?=
 =?utf-8?B?d2prb3k5ejYvZkFLYWNyaTdWRFVYeTcxSzZhcjhBUlRSSTlXV1RSTE5tYkM3?=
 =?utf-8?B?MmhnbkdpNHllRnRFUmZrR1JZN0dUNXdCRnFWZXNmYlJZSTZ2dXBScWlsQXZQ?=
 =?utf-8?B?REl0ZGdEbzd5d25ERk85ZHlFK0ZuRFVyUWtvZzlMcXQ3NEE3bHMxUUVNVWEy?=
 =?utf-8?B?cG5yL1ExUllzTkxhZjNOS0JONm00WWg3Z2VmNkkzOWVHVGlaazllWHFGRUc4?=
 =?utf-8?B?elNxN2dTVVEwNVNUQy9SSGRHcjZFekNRdDNGU054NkhabnhyenB4VXBwY2RI?=
 =?utf-8?B?ZE9iMWc1aFlxSFZsZU9idXpuUktCTXcrUnNKRUl1RVA3WGc0NWp6MHZYQU9x?=
 =?utf-8?B?S1Uwb3JJeU5jTE9HSm5paVJQZWFmUXV4WWEzMWg2b3lLNHljRitYWGtDaHNX?=
 =?utf-8?B?WERjWVJiTEhHMlN1L2dXVHhnb3VtaUYyV3lWU3JJQkxXRmFtQ0pyc2sxcjRJ?=
 =?utf-8?B?VEZSSjY0VjE0aUpEK2pXUFZQbHhFNGdMcHJGUnpaVW5ROWV0N0tmMGFEd0Fn?=
 =?utf-8?B?OGxtUU9BV0tNdUppK1ZsTHRBU0R1cm4wRVRlTUlwM01JZU52QTVwdEtkaXcx?=
 =?utf-8?B?NzlVbEdYZzAwK2ZWeC8wWjYzZStCK0d4OE41aCthRE83SENDVmFiNGMyU3FX?=
 =?utf-8?B?WXZyZ2dyTEJkRzFJRzdEMGJwL1FXU0xMZnk3Rkw5SkFHRkQxVzNSaVA5TlU0?=
 =?utf-8?B?YXhFWXZFWE40aFFqeTFnQ2pOTmVqQkFPaUxnWGdhWGM0WFljRksvWlAxOVJw?=
 =?utf-8?B?bEpzNitqMVdNczlPT01ITy9hV0dmYUxTMmZjMVZKQTVOckQxVmZxRHgwWk5k?=
 =?utf-8?B?TzU4OUJZRmkyU2ZIZmFjbXY5WG82RFhyYUNNTm4zYVBod1RBejc0azVQTWlB?=
 =?utf-8?Q?zGpfJioG3p01zUjBIz5M04boh7yZw9nklV6Tf?=
Content-ID: <E78402C305E88F4B9406929C51F6D62D@FRAP264.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e753c3a-7d15-43e8-63d4-08da49f2caa4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2022 08:33:55.6406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lM9xZmaNnOUEhobJHV5aV2vE+HqCo0eYqqJh/2HL8WIg3COZZsU2M/UB/1ne8KK4gKqQD6SWsVDmJ3XxzGZy+WOdJHGDh3s8+JKMjhjTz2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1933
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_013400_748867_209D2E3F 
X-CRM114-Status: GOOD (  19.74  )
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

DQoNCkxlIDA4LzA2LzIwMjIgw6AgMTg6MTIsIFNvbmcgTGl1IGEgw6ljcml0wqA6DQo+IE9uIFdl
ZCwgSnVuIDgsIDIwMjIgYXQgNzoyMSBBTSBNYXNhbWkgSGlyYW1hdHN1IDxtaGlyYW1hdEBrZXJu
ZWwub3JnPiB3cm90ZToNCj4+DQo+PiBIaSBKYXJra28sDQo+Pg0KPj4gT24gV2VkLCA4IEp1biAy
MDIyIDA4OjI1OjM4ICswMzAwDQo+PiBKYXJra28gU2Fra2luZW4gPGphcmtrb0BrZXJuZWwub3Jn
PiB3cm90ZToNCj4+DQo+Pj4gT24gV2VkLCBKdW4gMDgsIDIwMjIgYXQgMTA6MzU6NDJBTSArMDgw
MCwgR3VvIFJlbiB3cm90ZToNCj4+Pj4gLg0KPj4+Pg0KPj4+PiBPbiBXZWQsIEp1biA4LCAyMDIy
IGF0IDg6MDIgQU0gSmFya2tvIFNha2tpbmVuIDxqYXJra29AcHJvZmlhbi5jb20+IHdyb3RlOg0K
Pj4+Pj4NCj4+Pj4+IFRyYWNpbmcgd2l0aCBrcHJvYmVzIHdoaWxlIHJ1bm5pbmcgYSBtb25vbGl0
aGljIGtlcm5lbCBpcyBjdXJyZW50bHkNCj4+Pj4+IGltcG9zc2libGUgYmVjYXVzZSBDT05GSUdf
S1BST0JFUyBpcyBkZXBlbmRlbnQgb2YgQ09ORklHX01PRFVMRVMuICBUaGlzDQo+Pj4+PiBkZXBl
bmRlbmN5IGlzIGEgcmVzdWx0IG9mIGtwcm9iZXMgY29kZSB1c2luZyB0aGUgbW9kdWxlIGFsbG9j
YXRvciBmb3IgdGhlDQo+Pj4+PiB0cmFtcG9saW5lIGNvZGUuDQo+Pj4+Pg0KPj4+Pj4gRGV0YWNo
aW5nIGtwcm9iZXMgZnJvbSBtb2R1bGVzIGhlbHBzIHRvIHNxdWVlemUgZG93biB0aGUgdXNlciBz
cGFjZSwNCj4+Pj4+IGUuZy4gd2hlbiBkZXZlbG9waW5nIG5ldyBjb3JlIGtlcm5lbCBmZWF0dXJl
cywgd2hpbGUgc3RpbGwgaGF2aW5nIGFsbA0KPj4+Pj4gdGhlIG5pY2UgdHJhY2luZyBjYXBhYmls
aXRpZXMuDQo+Pj4+Pg0KPj4+Pj4gRm9yIGtlcm5lbC8gYW5kIGFyY2gvKiwgbW92ZSBtb2R1bGVf
YWxsb2MoKSBhbmQgbW9kdWxlX21lbWZyZWUoKSB0bw0KPj4+Pj4gbW9kdWxlX2FsbG9jLmMsIGFu
ZCBjb21waWxlIGFzIHBhcnQgb2Ygdm1saW51eCB3aGVuIGVpdGhlciBDT05GSUdfTU9EVUxFUw0K
Pj4+Pj4gb3IgQ09ORklHX0tQUk9CRVMgaXMgZW5hYmxlZC4gIEluIGFkZGl0aW9uLCBmbGFnIGtl
cm5lbCBtb2R1bGUgc3BlY2lmaWMNCj4+Pj4+IGNvZGUgd2l0aCBDT05GSUdfTU9EVUxFUy4NCj4+
Pj4+DQo+Pj4+PiBBcyB0aGUgcmVzdWx0LCBrcHJvYmVzIGNhbiBiZSB1c2VkIHdpdGggYSBtb25v
bGl0aGljIGtlcm5lbC4NCj4+Pj4gSXQncyBzdHJhbmdlIHdoZW4gTU9EVUxFUyBpcyBuLCBidXQg
dm1saW51eCBzdGlsbCBvYnRhaW5zIG1vZHVsZV9hbGxvYy4NCj4+Pj4NCj4+Pj4gTWF5YmUgd2Ug
bmVlZCBhIGtwcm9iZV9hbGxvYywgcmlnaHQ/DQo+Pj4NCj4+PiBQZXJoYXBzIG5vdCB0aGUgYmVz
dCBuYW1lIGJ1dCBhdCBsZWFzdCBpdCBkb2N1bWVudHMgdGhlIGZhY3QgdGhhdA0KPj4+IHRoZXkg
dXNlIHRoZSBzYW1lIGFsbG9jYXRvci4NCj4+Pg0KPj4+IEZldyB5ZWFycyBhZ28gSSBjYXJ2ZWQg
dXAgc29tZXRoaW5nICJoYWxmLXdheSB0aGVyZSIgZm9yIGtwcm9iZXMsDQo+Pj4gYW5kIEkgdXNl
ZCB0aGUgbmFtZSB0ZXh0X2FsbG9jKCkgWypdLg0KPj4+DQo+Pj4gWypdIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC8yMDIwMDcyNDA1MDU1My4xNzI0MTY4LTEtamFya2tvLnNha2tpbmVuQGxp
bnV4LmludGVsLmNvbS8NCj4+DQo+PiBZZWFoLCBJIHJlbWVtYmVyIHRoYXQuIFRoYW5rIHlvdSBm
b3IgdXBkYXRpbmcgeW91ciBwYXRjaCENCj4+IEkgdGhpbmsgdGhlIGlkZWEgKHNwbGl0IG1vZHVs
ZV9hbGxvYygpIGZyb20gQ09ORklHX01PRFVMRSkgaXMgZ29vZCB0byBtZS4NCj4+IElmIG1vZHVs
ZSBzdXBwb3J0IG1haW50YWluZXJzIHRoaW5rIHRoaXMgbmFtZSBpcyBub3QgZ29vZCwgeW91IG1h
eSBiZQ0KPj4gYWJsZSB0byByZW5hbWUgaXQgYXMgdGV4dF9hbGxvYygpIGFuZCBtYWtlIHRoZSBt
b2R1bGVfYWxsb2MoKSBhcyBhDQo+PiB3cmFwcGVyIG9mIGl0Lg0KPiANCj4gSUlVQywgbW9zdCB1
c2VycyBvZiBtb2R1bGVfYWxsb2MoKSB1c2UgaXQgdG8gYWxsb2NhdGUgbWVtb3J5IGZvciB0ZXh0
LCBleGNlcHQNCj4gdGhhdCBtb2R1bGUgY29kZSB1c2VzIGl0IGZvciBib3RoIHRleHQgYW5kIGRh
dGEuIFRoZXJlZm9yZSwgSSBndWVzcyBjYWxsaW5nIGl0DQo+IHRleHRfYWxsb2MoKSBpcyBub3Qg
MTAwJSBhY2N1cmF0ZSB1bnRpbCB3ZSBjaGFuZ2UgdGhlIG1vZHVsZSBjb2RlICh0byB1c2UNCj4g
YSBkaWZmZXJlbnQgQVBJIHRvIGFsbG9jYXRlIG1lbW9yeSBmb3IgZGF0YSkuDQoNCldoZW4gQ09O
RklHX0FSQ0hfV0FOVFNfTU9EVUxFU19EQVRBX0lOX1ZNQUxMT0MsIG1vZHVsZSBjb2RlIHVzZXMg
DQptb2R1bGVfYWxsb2MoKSBmb3IgdGV4dCBhbmQgdm1hbGxvYygpIGZvciBkYXRhLCBzZWUgZnVu
Y3Rpb24gDQptb3ZlX21vZHVsZSgpIGluIGtlcm5lbC9tb2R1bGUvbWFpbi5jDQoNCj4gDQo+IFRo
YW5rcywNCj4gU29uZw0KPiANCj4+DQo+PiBBY2tlZC1ieTogTWFzYW1pIEhpcmFtYXRzdSAoR29v
Z2xlKSA8bWhpcmFtYXRAa2VybmVsLm9yZz4NCj4+IGZvciBrcHJvYmUgc2lkZS4NCj4+DQo+PiBU
aGFuayB5b3UsDQo+Pg0KPj4gLS0NCj4+IE1hc2FtaSBIaXJhbWF0c3UgKEdvb2dsZSkgPG1oaXJh
bWF0QGtlcm5lbC5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
