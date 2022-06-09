Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3036BC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 13:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jWijrzfYxHrNICYNo+Xi+2L7uOSoLbcE4xAsBaf61Dg=; b=ka0XTrmIXYvibI
	Gg3Sh3d1vKvZjpOC6yDvTHII+chPG0gWn92fWjoQ5tiSfIIuaDmEIVfJ2wVggiRbfHfkPLBiT14gy
	uWW4EK8pTANHofCTLtjdGjTenuACobBlOIi0XDsnDqzITXqPIefhQQIG911wXhjxvp/EDCzsPK8UQ
	xqrQx9fmTDeq0WZOt5hnjG4b71DSKeglq6GpA+WToTSWkfiUBWaoozLwEvsOlhCpLeB0fe/yBshtF
	rAy5/r9YPYFkNme4tjcNXxyEH3G8eTGIjA8gYvmvSez0+ODnRBJnVDNBmL+rOjq1KLjtHsEaTYSeC
	4/gkPlXvPujzOOp1nhxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzIR5-002Eld-4f; Thu, 09 Jun 2022 13:42:55 +0000
Received: from mail-pr2fra01on0605.outbound.protection.outlook.com ([2a01:111:f400:7e18::605] helo=FRA01-PR2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzIQz-002EgW-0l; Thu, 09 Jun 2022 13:42:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EL51PQFvUmUhyDMNrc0V76ZzURJ9nhDb6ZdNxvxs5zvEeVd7qxYDf8yILZie2W5JYYIEe5QAirjaoVT2bk5wK7aNNMYzI3TrDkWBrdYObv1G+UZiFP0oHGVNcrTWzIccg4fp885foaYBVawkGSsC+2gotlc6QpIElW4o2jMmOWZw+oqurNWl+cagt6NliIxV+yWvfkmD8n+1U3lLY4iYIVsudH67onTaMFej36FhN/L6dox3Fb/yOaAFMge72oOT6CfN/FhrG4eDZWUyCcVc9oOewbxM5D+7RIhuegFtpcLE02JfTSG7/bCyA6F/Fh2Rz+RPkyXfXBTIAJj5caZwsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWV/Mq7ELxOoK20yaq2RZy+IG+nhjODFeLv9TtNQfg0=;
 b=L+GeeS8FMCrAAl/CPtEjfmlC26kugmTZxqgv1c49UyHABGDIsEc2ooldydbm4kQZfggI1vnGeabVATnX4Wb1gSlupKQLaVMUrxTkjkRttJZnGgwS3yCHFn2fmAzolBj0k+1m+QIY+/3m4RVmjfs9txWKWiesK1eNIro03U0aybrC3OqAxIpH7Jiw7j64/U7xu98k+ZvQnP0zTn7Fn1WxelmlzjDcYEktieHYq8v2TfqRp866VhLJUXoJ4qZtxLfIDI/Avt8t3+vKC7rgAuOb/0cCxq5+eHOwzUkebBGw1ffoFoQFjNVh6WQ2Y880d4QrocwKhtaRUd0k/xDN34w7JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWV/Mq7ELxOoK20yaq2RZy+IG+nhjODFeLv9TtNQfg0=;
 b=taahTl3xKbwHadBgaKYfrjozhfnTJ3AYTiYpox+HQpNn1dWw7tnfQ8VXCB598N0CF+izRrUTN18btLFR48oewzeArKKzAB8oW94RmmPtWBGZnqlA7ygSAnDkZvKdij+2jwMzGzGyJ9U39yHnlsxIo1hvw0WoPYW+GXu7sD2zdRaDodr2jbIOLnWbbbEmKDXw18wUaDrzWIK+LGGYLA1IrkKcJzy1PoZ9N0LgM7WTm8YrmL89ss8R5jKH9yvSt0lFvAHMTdMUms9Hs8lzoUBgo3D9MrP1Owzc8HtsxHN6gtDHk4ckKkd19VtLLzG/gdVOZvsr1eQ+XJA6943bDZ1vfg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2884.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:39::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.11; Thu, 9 Jun
 2022 13:42:45 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%6]) with mapi id 15.20.5332.012; Thu, 9 Jun 2022
 13:42:45 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jarkko Sakkinen <jarkko@kernel.org>
CC: Jarkko Sakkinen <jarkko@profian.com>, "linux-kernel@vger.kernel.org"
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
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "Naveen N. Rao"
	<naveen.n.rao@linux.ibm.com>, Anil S Keshavamurthy
	<anil.s.keshavamurthy@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Kees Cook <keescook@chromium.org>, "Peter Zijlstra (Intel)"
	<peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, Josh Poimboeuf
	<jpoimboe@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Eric W.
 Biederman" <ebiederm@xmission.com>, Marco Elver <elver@google.com>, Dan Li
	<ashimida@linux.alibaba.com>, Sami Tolvanen <samitolvanen@google.com>, Song
 Liu <song@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, "Russell King
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
	<aneesh.kumar@linux.ibm.com>, Jordan Niethe <jniethe5@gmail.com>, Guo Ren
	<guoren@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra
	<atishp@atishpatra.org>, Changbin Du <changbin.du@intel.com>, Heiko Stuebner
	<heiko@sntech.de>, Liao Chang <liaochang1@huawei.com>, Philipp Tomsich
	<philipp.tomsich@vrull.eu>, Wu Caize <zepan@sipeed.com>, Emil Renner Berthing
	<kernel@esmil.dk>, Alexander Egorenkov <egorenar@linux.ibm.com>, Thomas
 Richter <tmricht@linux.ibm.com>, Tobias Huschle <huschle@linux.ibm.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>,
	Daniel Bristot de Oliveira <bristot@redhat.com>, Michael Roth
	<michael.roth@amd.com>, "Kirill A. Shutemov"
	<kirill.shutemov@linux.intel.com>, Javier Martinez Canillas
	<javierm@redhat.com>, Miroslav Benes <mbenes@suse.cz>,
	=?utf-8?B?QW5kcsOpIEFsbWVpZGE=?= <andrealmeid@igalia.com>, Tiezhu Yang
	<yangtiezhu@loongson.cn>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Aaron
 Tomlin <atomlin@redhat.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-parisc@vger.kernel.org"
	<linux-parisc@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "sparclinux@vger.kernel.org"
	<sparclinux@vger.kernel.org>, "linux-modules@vger.kernel.org"
	<linux-modules@vger.kernel.org>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
Thread-Topic: [PATCH] kprobes: Enable tracing for mololithic kernel images
Thread-Index: AQHYessDwND8kPCFFkWhvh7Pg63gL61GwK6AgABKzQCAAAyGAA==
Date: Thu, 9 Jun 2022 13:42:44 +0000
Message-ID: <f22e34b8-5dae-55c8-c04e-e8b913b40b80@csgroup.eu>
References: <20220608000014.3054333-1-jarkko@profian.com>
 <f2030fb4-4978-068b-6250-5bd5b2746675@csgroup.eu> <YqHuUsevcvaaunVq@iki.fi>
In-Reply-To: <YqHuUsevcvaaunVq@iki.fi>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04ef55ca-0d09-4efe-8c0f-08da4a1deeee
x-ms-traffictypediagnostic: MR1P264MB2884:EE_
x-microsoft-antispam-prvs:  <MR1P264MB2884BBBF9466F1CA3086E585EDA79@MR1P264MB2884.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Ea6Os62Q+Zsi1v7RDyMQ/umBDObn8+2WoPAr+DeYskm2YTnMXOtf4570yrhdmqGdyDocLlzngGVHoeBsdLVxWD2U1+4aXsTgJJZSNGTehbObo3ZLrum10nfpF0H7pr1b4kQpubaEPejT4OnTfVaTuNqu9W2/L9/IpJJEYPF8fkd+a816yKksIAiOaSKxJYFgV2ns70SYTII7lT+BUA/MAV2PySFlOvnEVGxwvKa0d0ay4xcjyxT5dURStsjd1r/PRuOwt/vXZjvLkeKrL/YsJsXXu7B/vmtiYwGfEib8dxtUUKGYL2xGKlSuyb0OR1Cdel2qkm1IsBz+eDdUqJXhCqhf0wbwsybwUGTw6x32hkJ5EEJe7Dm/13wxlzUb3iC9cbKxgMRwX4ODDufZM+Ab5YfU70G9gYvrGMt0Sb2owqNaft2ZinKXDi127qbqU7pLJtsb4C7Pw4vNp/t2if8sEwGBNcy8SZflTr15o2GbnFekH8I3+As6XWLwggFd4EWRsUPogCOH74nFeN92pYeYq7CtgPVoRxTDxPYIUaycTZS8m1fOL1V5nR8eBE08ixxuDvAwF3VtNX4Nbm9CWcP7EtW0beOg4sOLGhts9EkA3fzVNv5//UOTnG31XG8u3hRZn2SMfjHYE5NzNofraSiv4wppp+byZk/I7M+BR0Vm+cKlbpFeWTAJogL+/U9IdEdMbVKxaDEmTT+sgo0Iq43Am1RBrmjR8IkBpva6xIzLq7sMDuM7IAjLCS4DHdEK6P/lt60sfaEa+vkVsOIj0B+xfA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(91956017)(7416002)(6916009)(7366002)(508600001)(966005)(7336002)(4326008)(5660300002)(54906003)(71200400001)(7406005)(44832011)(8936002)(2906002)(83380400001)(38100700002)(316002)(66476007)(64756008)(66946007)(76116006)(66556008)(66446008)(8676002)(2616005)(38070700005)(6486002)(31696002)(31686004)(86362001)(36756003)(26005)(186003)(122000001)(6512007)(66574015)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Yy8ycnpSZ0tML1E1dFl5Y3oycEE0WjhxVVovOFJLWW1CRWVoYVVJdHVtMi9C?=
 =?utf-8?B?a1BjditMaU1nR1I0ZTgrc1JXMGkrTkZXMWNYWHRzWDBmenkrell5a3B0bmNk?=
 =?utf-8?B?VG1QYk9YVXkzdEV4ME16ZFZ2SFRsY0E1bTVDenVFWFc4TkxPZEx3dnNhRldQ?=
 =?utf-8?B?N0dkRDZwZGhvM3dYWnBBV2pyek9EVVYzdGhCdml4UjlIcFpGWi9Za1h4SkMw?=
 =?utf-8?B?blhGczJhQmRDbWRFeXBDWTU5WDZ1R3FIMXQzTjZTS2Q0Mlk0ZE9razVGeGJz?=
 =?utf-8?B?dTRENXI2Mi80QkhxRWs2c1NBVUVPVDNmMmVFa2k2NFZEVlN3TlBvWDdod3VH?=
 =?utf-8?B?cUN1OWN3N1JnZlJ0d2dtSVJBOVcwWTRUekp3TjVhMGx0Vmh6MWpVRnN1UU5k?=
 =?utf-8?B?ZE1oSlhQaVlYNVN4UGxKeDBicStnWWNzdFo3L0l6S2ltNnpzQ003K0wyM2hv?=
 =?utf-8?B?T3ZyUjlBNENNMmxPdlJNbzdHR0l2NEtUa0tzZWJiNXdWZloybDk1Rk5Jc0wv?=
 =?utf-8?B?d2J3TytnMTEweVdwU1pLdHYxdTczelMzeVlaUFpIVjltWEZiQ3YzcDkwcVoy?=
 =?utf-8?B?dUtHSUgvZUFFUWx3OWZHeTE0L0cyOGNaNXNxL00wbDRkRHFNdWJpMzEvZHVE?=
 =?utf-8?B?ZDR4Q1FMNjVjMnVkcHliSU1jUVpPMTBoYTEyaWtXQm1QbU9KRTByQ1c4bDRl?=
 =?utf-8?B?ZGcvMVYwY01iSWIwcStmbThVclNHdEZxL3ZETFlmcEEwUjR0cXgyWXlIMlov?=
 =?utf-8?B?NjNaYTBaaWxkVmQ5VkR6Zm42M1Z3SkFWdnBXOWQ0ZWl4YkNNVGJiUEN0eUFP?=
 =?utf-8?B?ei9Ya1U3dDI3SHMvZnhZVDMzNFEyb2QxT3dMNmZraEx4Z0poNk56Yy92QVZu?=
 =?utf-8?B?WThYV1BZVEowdHZlRHAzc3Nidko1SVBwNTc4MEgyVkkxZFhoenQ3ankzQkRM?=
 =?utf-8?B?cXZWV3NQeTZBZ1FscHYxTUk3T1ZmMGthRWZnRWtkWm03bURPakZ2UDI0WmhD?=
 =?utf-8?B?czlXQ2ZBcUszWkRyVTYxVU1SUzQ4RjA0V2lyaXFhRWZHb0dFWEJncTJmSThC?=
 =?utf-8?B?R283TUZoUFNmVkVRT1IzM2tjY0k4ZUxVYlR0MUpEZll6UlNOeWZ6S3JqeHo5?=
 =?utf-8?B?U0hmU1NJanBJQlZwSnR4TitueXNQMUJTMUordkxMdTFYS0tZZTZRZ0YvWEo0?=
 =?utf-8?B?OWd6Qng5M3lCY3JkVGw1OE52Ymt3VUo4RFhrWjNoZ1V1TGc3ODNmWTVWYlpa?=
 =?utf-8?B?ZnVXZ1JGaDd1WmdxWEZUVWY3RldGVDdNNkFVYmdPZ3lzbFU1ZERsbzZnN1l1?=
 =?utf-8?B?Yjdhck9MOFV5eDRyM21yZlhMOTB2cHhFRUkreXNldkVnMjJsRWNVM3RzV3dl?=
 =?utf-8?B?eEpsRjBlclhCUWNMZERiMExsWENRb0kyL3lWRzJ3MGtzWmNsQUpxcFRPdGJL?=
 =?utf-8?B?VGhJUXk5cXNSTEJOekVMMVdsN085c3p5TlVCYUpJcUIyUURzT2NYWFZaNndx?=
 =?utf-8?B?aXQzbWZnLzlBeDQrVExoRUlmK3VWckF3clJnTEszMHV1aUVBQ3NDVXZ3a3lw?=
 =?utf-8?B?YTgxSlNlMnlmMk9xa3JvMlRVbktSWTRsYlhXUm43RzRuUFR4NGMzWnNxYksx?=
 =?utf-8?B?bmFIcmE3aWVRUVBiMWdQWHBnREFwQTlpYmJyZ3crQVhhbGFzZGd5REVLZTJs?=
 =?utf-8?B?VU9QTVVBYVVvdW5WeTNHVkhkYnRWTWw3MWF3SW1OdmxMMGcyZnJVSTZiY3Vv?=
 =?utf-8?B?YVhBVFBadHN3akVoMERQeVkrRVdhNytWZ2tVK2dLZ09vZ0xHbk9zdWtYM1V5?=
 =?utf-8?B?Tng4c1QvQmV4QndBaFF4K2FpL3JDbVVheXhyR1RueEVadXg1dEZZNHZIZHlu?=
 =?utf-8?B?akg5ZDQ1bG9INXptNU1vZHRJNUI3WTkyUXJNd2V3Q3hiaUZPVWRVQjJLMEpH?=
 =?utf-8?B?UEJaRGpmVDB4Z05LSDdMb1dpcjlXTzZiajFOaFF6VmU5TXdVR0VGVC94YzU0?=
 =?utf-8?B?emwwOGd5SFJBaUZhZmFlTVMxMVNxeit2eWhZTGFNd0xkY05BSkxxTTRHL1hW?=
 =?utf-8?B?V1hFdTJvL1ZaczlHbnNWZlYwb09rVVc2R25DNmdjbXAzY3BLanhHSmF5eDVD?=
 =?utf-8?B?M0x0WWkrOSs5RFpxaTU1cG9sMlB6TzNZU3VxRGNDVUNkYjFPTkVtaEg3d0Nm?=
 =?utf-8?B?dlR2UTh3TktXcEkvdE1SZlZybWtZdXNpSFNQcDFSaVo0SURSN3hjNU9oMlk3?=
 =?utf-8?B?Z1NRVXRBZmgxTzlTWlIrbzZsQkt6ZkhHeVNRdlJwcXVzZGtkRjZ6SmRxRENG?=
 =?utf-8?B?VGNMVXdHUjBrTURSdWNaK0RaQmhFaWNnZ00rdnNjdzlwcDVjam9kSDUzTWZi?=
 =?utf-8?Q?I25hsSZLj7Q6cXloe7wMtiXCjwrZSqcLRZ+II?=
Content-ID: <D014B0B65500164483C9E55D19A099A7@FRAP264.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ef55ca-0d09-4efe-8c0f-08da4a1deeee
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2022 13:42:44.9151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T2axa1bs43aL+5ZdShBxsOFp9rEfcuDOwhvbXnlgcrq6KdzoSUHsmShhZ4aQO5oL0ZdvW6gNiz51XZJC/meIeX0i2uilASNOgYsKLUUjMgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2884
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_064250_344660_06AB686C 
X-CRM114-Status: GOOD (  21.76  )
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

DQoNCkxlIDA5LzA2LzIwMjIgw6AgMTQ6NTcsIEphcmtrbyBTYWtraW5lbiBhIMOpY3JpdMKgOg0K
PiBPbiBUaHUsIEp1biAwOSwgMjAyMiBhdCAwODozMDoxMkFNICswMDAwLCBDaHJpc3RvcGhlIExl
cm95IHdyb3RlOg0KPj4NCj4+DQo+PiBMZSAwOC8wNi8yMDIyIMOgIDAxOjU5LCBKYXJra28gU2Fr
a2luZW4gYSDDqWNyaXTCoDoNCj4+PiBbWW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIGph
cmtrb0Bwcm9maWFuLmNvbS4gTGVhcm4gd2h5IHRoaXMgaXMgaW1wb3J0YW50IGF0IGh0dHBzOi8v
YWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+Pj4NCj4+PiBUcmFjaW5n
IHdpdGgga3Byb2JlcyB3aGlsZSBydW5uaW5nIGEgbW9ub2xpdGhpYyBrZXJuZWwgaXMgY3VycmVu
dGx5DQo+Pj4gaW1wb3NzaWJsZSBiZWNhdXNlIENPTkZJR19LUFJPQkVTIGlzIGRlcGVuZGVudCBv
ZiBDT05GSUdfTU9EVUxFUy4gIFRoaXMNCj4+PiBkZXBlbmRlbmN5IGlzIGEgcmVzdWx0IG9mIGtw
cm9iZXMgY29kZSB1c2luZyB0aGUgbW9kdWxlIGFsbG9jYXRvciBmb3IgdGhlDQo+Pj4gdHJhbXBv
bGluZSBjb2RlLg0KPj4+DQo+Pj4gRGV0YWNoaW5nIGtwcm9iZXMgZnJvbSBtb2R1bGVzIGhlbHBz
IHRvIHNxdWVlemUgZG93biB0aGUgdXNlciBzcGFjZSwNCj4+PiBlLmcuIHdoZW4gZGV2ZWxvcGlu
ZyBuZXcgY29yZSBrZXJuZWwgZmVhdHVyZXMsIHdoaWxlIHN0aWxsIGhhdmluZyBhbGwNCj4+PiB0
aGUgbmljZSB0cmFjaW5nIGNhcGFiaWxpdGllcy4NCj4+DQo+PiBOaWNlIGlkZWEsIGNvdWxkIGFs
c28gYmUgbmljZSB0byBoYXZlIEJQRiB3aXRob3V0IE1PRFVMRVMuDQo+IA0KPiBZZWFoLCBmb3Ig
c3VyZS4gWW91IGhhdmUgdG8gc3RhcnQgZnJvbSBzb21ld2hlcmUgOi0pIEknZCBndWVzcyB0aGlz
DQo+IGEgc3RlcCBmb3J3YXJkIGFsc28gZm9yIEJQRi4NCj4gDQo+Pj4NCj4+PiBGb3Iga2VybmVs
LyBhbmQgYXJjaC8qLCBtb3ZlIG1vZHVsZV9hbGxvYygpIGFuZCBtb2R1bGVfbWVtZnJlZSgpIHRv
DQo+Pj4gbW9kdWxlX2FsbG9jLmMsIGFuZCBjb21waWxlIGFzIHBhcnQgb2Ygdm1saW51eCB3aGVu
IGVpdGhlciBDT05GSUdfTU9EVUxFUw0KPj4+IG9yIENPTkZJR19LUFJPQkVTIGlzIGVuYWJsZWQu
ICBJbiBhZGRpdGlvbiwgZmxhZyBrZXJuZWwgbW9kdWxlIHNwZWNpZmljDQo+Pj4gY29kZSB3aXRo
IENPTkZJR19NT0RVTEVTLg0KPj4NCj4+IE5pY2UsIGJ1dCB0aGF0J3Mgbm90IGVub3VnaC4gWW91
IGhhdmUgdG8gYXVkaXQgZXZlcnkgcGVhY2Ugb2YgY29kZSB0aGF0DQo+PiBkZXBlbmRzIG9uIENP
TkZJR19NT0RVTEVTIGFuZCBzZWUgaWYgaXQgbmVlZHMgdG8gYmUgYWN0aXZhdGVkIGZvciB5b3Vy
DQo+PiBjYXNlIGFzIHdlbGwuIEZvciBpbnN0YW5jZSBzb21lIHBvd2VycGMgY29uZmlndXJhdGlv
bnMgZG9uJ3QgaG9ub3IgZXhlYw0KPj4gcGFnZSBmYXVsdHMgb24ga2VybmVsIHBhZ2VzIHdoZW4g
Q09ORklHX01PRFVMRVMgaXMgbm90IHNlbGVjdGVkLg0KPiANCj4gVGhhbmtzIGZvciBwb2ludGlu
ZyB0aGlzIG91dC4gV2l0aCAiZXZlcnkgcGVhY2Ugb2YgY29kZSIgeW91IHByb2JhYmx5DQo+IGFy
ZSByZWZlcnJpbmcgdG8gdGhlIDEzIGFyY2gtZm9sZGVycywgd2hpY2ggc3VwcG9ydCBrcHJvYmVz
IGluIHRoZSBmaXJzdA0KPiBwbGFjZSAoanVzdCBjaGVja2luZyk/DQoNCkluIGEgd2F5IHllcywg
SSB3YXMgbWFpbmx5IHRoaW5raW5nIGFib3V0IHRoZSBkb3plbiBvZiBwbGFjZXMgaW4gDQphcmNo
L3Bvd2VycGMvIHRvIGJlZ2luIHdpdGguIEFuZCBhbHNvIHRvIGNoZWNrIHRoZSAzMCBwbGFjZXMg
d2l0aCANCkNPTkZJR19NT0RVTEVTIGluIGluY2x1ZGVzLyBkaXJlY3Rvcnkgd2hpY2ggY29udGFp
bnMgdGhpbmdzIHRoYXQgbWF5IGJlIA0KdXNlZCBieSBhcmNoaXRlY3R1cmVzLg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
