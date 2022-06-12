Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F94AC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jun 2022 15:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9FnG8wZa5eH6Ja2PQKXQ1u2KxmcOR6PPbvYpeRQEfjA=; b=JOMSm8iXizR/Aq
	bLDjDX5nz429GEGdul+73PxnpKkVwtgDqERo8mLySCTouO2F4gQpc/e0HnNWnWq487orZ5YZyO/AR
	V+F0hLYaLCofXEUfUEt5nSwwmOBihbExBLFGviVoY4CrrQhyl0ViVlap8JpRc+UAP5WKBOKNsSgYu
	bEplBTjAkFwF/IcGAzIBO0S78rdYbr4qCbO1yVleBHdZUMdt6vsiqCxweVZowxMSTvJ7qYOTWjNDb
	kPsXPtqJmFuJAz7XabVpsRdSoceYOhCGQX56t5fQiECL01LORrsmKIHvznOgd6cTmKy6Ggm1gwSG+
	FO7SSKS7CpfqwZUBGl5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0Q04-00H1tC-Dk; Sun, 12 Jun 2022 15:59:40 +0000
Received: from mail-pr2fra01on061b.outbound.protection.outlook.com ([2a01:111:f400:7e18::61b] helo=FRA01-PR2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0Q00-00H1qs-1E; Sun, 12 Jun 2022 15:59:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDxgMV9vGezrXfqaV4UkX4cPrVdos7IiCNy61LAohD3e1NZ3LILMRdgLUu3O50il7Q4q4vyhPPh4yUlxS2U5XxeNhMGh2Z7Dmcsv0VFl+hesl2eoyMH1wEtb8KbuFzfPTBdGcNKLes7uNizwMqi7Yh6InbT1Yye7GJOU3MCZF98oSLL0CyjCP38YQoIuk6xiQ8pDwr9ApD1RxWvjHUbkMuqUxm1KyPTqDUPFgTrdGNRwArM1pm2P4yZwSKpYo0sN+3kRhEr1UCC+EeZbrg9YaZF8SbH3FlK8jSj25VvamEQqvj/UWxiHXLoADZ9UXwhJHcUYroUwEGAA+6wCb13fow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=METq6qv4Ep8WRfWydVCtrAo2H5+3jDZ1RMdKxilZTi0=;
 b=iFJgTxgh46dRfrbHh5fbMUDDmVERch9XOptTrjdLCnVMDNYseuENjPanqqAL0h/1tgv+thqOVi74uqS6BcyI0Gsr1bj0kAEZgMIIYwEZwboIKOP/XdQNFXXKrfPn2BZsarj4vvOFIe+r1MR2Uh4ToZ0pr6BiJnW7KvKh71dGWj3UesEqF5j1gRgdMtRP3SVwh3KqQgD2tp6iI6xMxLLRbNViZ4BGu+c20O/LoO7wW16y58pYJwM3OI1g0x9Ofqjgrq8rVwwe0nhdtsMEorsneJNdZcf5zSpHs8xU1oyYxUVMO9alaGjazQ3C6omfQtZGUYuhC0c6k2r8/Dbuv/VCdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=METq6qv4Ep8WRfWydVCtrAo2H5+3jDZ1RMdKxilZTi0=;
 b=m0xpCfKOhh1kgYt0uHTpKIzZq8ElVPBQWTPUrkrpIXQFtrA7rMQ+XLQ1A+icwyp/urk7M2I8GKid22WB4CLXRvkHCF8ulpD6Uo+Pj/U+HeMoKElRKYTCxvPNFs/J5p0e8UlFJnJQgAGgwgY8O5Lgfj0kOzpkTJo+BlE19QxJf+g+wtSQgbCZ8qs1ATGbF8DfzIvKlbrwhTkc+8phN6HmHQHzpwYmVmnth8d4FvVTQ87DCROgysgnS/IO6HTS+8erDyDJV3XReSk6oUdQeR8M75dnTilhQ9p00NTt4gCYXDSjap+fennzS7VHNErTVmCOor8JhdIj5/9KC8fusHMbGA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3735.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:d9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Sun, 12 Jun
 2022 15:59:29 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%6]) with mapi id 15.20.5332.020; Sun, 12 Jun 2022
 15:59:29 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Ard Biesheuvel
	<ardb@kernel.org>
CC: Jarkko Sakkinen <jarkko@kernel.org>, Song Liu <song@kernel.org>, Guo Ren
	<guoren@kernel.org>, Jarkko Sakkinen <jarkko@profian.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Nathaniel McCallum
	<nathaniel@profian.com>, Russell King <linux@armlinux.org.uk>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
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
	<samitolvanen@google.com>, "Russell King (Oracle)"
	<rmk+kernel@armlinux.org.uk>, Nick Desaulniers <ndesaulniers@google.com>,
	Linus Walleij <linus.walleij@linaro.org>, Chen Zhongjin
	<chenzhongjin@huawei.com>, Nicolas Pitre <nico@fluxnic.net>, Mark Brown
	<broonie@kernel.org>, Luis Machado <luis.machado@linaro.org>, Geert
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
Thread-Index:  AQHYessDwND8kPCFFkWhvh7Pg63gL61Ey08AgAAvegCAAJWmgIAAHxoAgAFgIYCAAALnAIAEpMUAgAA93gA=
Date: Sun, 12 Jun 2022 15:59:29 +0000
Message-ID: <de3ab735-54f7-c97b-1d2f-bed0ad4ff366@csgroup.eu>
References: <20220608000014.3054333-1-jarkko@profian.com>
 <CAJF2gTQgCn2CyZ4+VBqEEBT2b4+1KxoEXxrd+Ritk=58+U8EFA@mail.gmail.com>
 <YqAy0qjI4Lktk/uJ@iki.fi>
 <20220608232115.ccd4399f4a1d133e9b65c2a9@kernel.org>
 <CAPhsuW6iUieQvA6KqzSLgtxmjkVSWCuVwNA338DATb_myHxo7w@mail.gmail.com>
 <YqHx1d+MwRLLzGQe@iki.fi>
 <CAMj1kXGGyO-DL9hjKYKR2sp87s4KExiQybES8pp4JgqJcHkfLA@mail.gmail.com>
 <20220612211802.30a16623e8b0a55122b02386@kernel.org>
In-Reply-To: <20220612211802.30a16623e8b0a55122b02386@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8fa07577-7d65-4de8-5bdc-08da4c8c889b
x-ms-traffictypediagnostic: PAZP264MB3735:EE_
x-microsoft-antispam-prvs:  <PAZP264MB37355CEB61CFE426610FC6D4EDA89@PAZP264MB3735.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  2EsWn3qsQosLapVMFgnY3bQdWtXjC68kIIOsvSO7aGfd8kaFfo6Yt7IRhoxU2l903dsFThpPQrzn6dCebqalo8OevePt6f0dL/OYyPEgezHsamEGWnvLHv9CGsiuAjAklJKzq8pDfNyEs0O7BikEjBbre8qIvS99aSCUyIxpXyz4UE+YOMUfakZpPWYWOh30a059Wf7xB/SIXhDKC5fHQvUoUWNE0DpTdyuxzVg8P28at2W43w5plPbW2d1Dxom/NyiocVyj7qedL1ip+v5GFr63Vg6hOCjxInm07p8EwrQIBAwyTbSM3Y/uwC5Euwq5HDnbjax05ag7l6SZuHDBnFtPZIHttXl7NJNXLAJ7OQZX392z2r+YqHqaFREgI66mYDj8hK8TNd9nbRoUvURf5qxbAXlmczGuJQ4Nku5kzNghZ4+JatAM/pxj27Wfs84DpT7RelvRBn16jgrU5x4X8ybXRjJFZHon20WAYhjf+o5a5wPa9DWvV5pPe5ed+WQik4ruYKwujL/3jUBBDx/atmJkiNMHEloK7XLMPEpgRWbnt7xr5n9oaRVAA7z+FN+rOChJVUW09GW+vN35vTxp+Xe0m94BCgDPqlc3F1MCcivEml9+2MAAkdT3vSShWHkVXSfWNVHi5dW5SrAsFKY1WsKGgNm2MM/eQPyK6Mb0zvbEhoaW7e0jWxJY5s8dFlG18xyMJX+0nek/8IQjImnTjfO0qkDQTHZGS2tjxLn6jod0H4+8bi+cf+9EVkojIazhxM1rz7ax5A5iQCxL0TnP3trYDuLGubu200OS6X6n48VlwYYTUL6toj39oGz4zmNb0JZ9LHRXky/w/zmWU7/N9eiewhkH8rS3AYvYB+p+zHU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(8676002)(38100700002)(122000001)(6506007)(6486002)(31686004)(966005)(6512007)(26005)(8936002)(66446008)(91956017)(64756008)(38070700005)(66476007)(76116006)(54906003)(66946007)(66556008)(316002)(2616005)(36756003)(110136005)(66574015)(71200400001)(186003)(508600001)(53546011)(4326008)(2906002)(86362001)(7416002)(5660300002)(7366002)(31696002)(7406005)(44832011)(7336002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Wm55OFNyRCtmR3NNeEp6RUQyUmZtNUp1R2xvS2xzN3VRRnJLSWhUV0lBVTdk?=
 =?utf-8?B?cHEvM0Z6eDEwTVRIcTBYZXdyOGJKdUpIaUNOb2ZKdWxrL1hJNWZjQnlLalJw?=
 =?utf-8?B?NTEzenp1ZjVubzVDWDNLT1IyaC9neXM3aGtsWUd2Nk9wckVnVjVXVzQzZTI1?=
 =?utf-8?B?dW5Rb2ZuQVFIUklhSVZmbEwxSlQvbGJVODJkc1hHZWYxNUhzUWtrMlpxV3ZK?=
 =?utf-8?B?QW4rQnFBaGIwS3JML1VzM3dWRy80YlJDRHV5NVhieGRYLzFFTGEyUWFFS1Fm?=
 =?utf-8?B?YWNKV1VHbmxCTjZ3dHpQeXBtSTY1UWpTNE0reXZseldhUlBQNWNsQ0MwNTRq?=
 =?utf-8?B?M0c0dytSUXFEdGNIRUtzRnVFYkpoYXNrb1RCMUkvSUE2dE1ZV2NqRDltODM1?=
 =?utf-8?B?aDJUY1gxc3BkSlRJZktUcEJrZ200V3JxZlMyUE9ZaU5hclBuUjVNdXJKZ3NO?=
 =?utf-8?B?NDQ0elNXazg5UEdlTUhvZzlzT2l5NjIvaUw4Yy9MOUVGRmNrb0JId242cUxP?=
 =?utf-8?B?cXlxdlZNQk1YRTFndEZnSnJmdEIyaHpHeDZxS3FPckp4Uk9VVG5mNjZqT1lM?=
 =?utf-8?B?ayszOVgyc3ByY1NMOFhTSG5xaWluK3lJWkdMQ1FLQksyWHgvOHNPTUhwRUZn?=
 =?utf-8?B?eWFrNVc1a09VRFlpSGtsK1ZMbERDNW1LangxODB1cW4wVXRnYVhZZmR2eDhK?=
 =?utf-8?B?Y1BOTE1TVUptTFZManRGMG9mVi9xcDlyZmwyWEpMTlNFcFVZWDBhVlhEKzJD?=
 =?utf-8?B?WDdRZ0pKcXdKck5sMktCUG5iYUZjNEZNcS9vblIvVkNaWnhORCtTM1BlWlhi?=
 =?utf-8?B?TUlmdno3ZzhzdUFXZG1oWUlmYk5CcG9MVnVwRTJxUHhpdXMwZUdYSHN2QS95?=
 =?utf-8?B?QnluaDRyYTZKUTdDZ0UwVFFJNXhYaFdPNnhoM0hhbHYzS2tKR0M1UUhnc2xY?=
 =?utf-8?B?cGJUbXd5cWxqekUwL0JLRVd0dnZSRExpejNRdVNEUmRzLzNrbFNFMzhsRDVE?=
 =?utf-8?B?V29YSEdkOEYrVkVQYXRQc3NUdUR5TW1EaEg0VDZrS09MUGlFVVBYclJNZVVW?=
 =?utf-8?B?Nml0QU9SZzRGc1pTbkVoUDJmM2JlU1kwVEc1aDdmSkVzeFBEWnJoa1B1dkNM?=
 =?utf-8?B?NlJKb09FWTVGeW1oMlNCNE1nd0tpTzcybWdVUDlJUkpLZXpENG51c2JuOC9a?=
 =?utf-8?B?YzBjOG11K21zRFdRNER1elYrVEIzN3hzRklmZzg3eW5rSTY0SmlMaU85dzAy?=
 =?utf-8?B?VjhXY3ZaYlhrdG1CKzhQSnM2TDE3NVVSKzU3ZU9xQkRGYWVmMGpkeTZKWFdV?=
 =?utf-8?B?MVBvQU1ldk5haXZiNXgyNi9VVS85N0UzcThGMzFIQnJkMTRhZG5lQVJJZ0dZ?=
 =?utf-8?B?VXRKbnF6dVR0ZHR0alFoTzF4WVFBU25lWnRxQXIwanV4Z1pEYm9UUXFZeUV0?=
 =?utf-8?B?K3dZMGlaNFZMT004Zkx6bVRpdTVWeTVNNjU2WXJ5RDBZUkVodXJtbTdmR0xS?=
 =?utf-8?B?eEVxalU4NVZoaEhUcWtLa3FDQ2l1NThlcE5xaWdWSTF2bE9FcVhYZWwvNndp?=
 =?utf-8?B?cDZBdXozM1NsbHVVUXYxaEl1TXJ0R0VSZjhSc282V0FubmpObTMzZFFRNVor?=
 =?utf-8?B?ZmhzTFRZa09iV2pINkpJL0JxaEF5RHVMN3hGSWMzQmhISlVvUUtSQndrTUFs?=
 =?utf-8?B?aDVzL3VjMmtuNFZEUDdISnYzeWxQdUJ2TXJlR09Qa0RvaldITHl6TFEvZloy?=
 =?utf-8?B?ZkM4UkdKNkw3Z2Q2OWpBcHZiQmVvRFBVNTBnbE9wQ0plTkJnM3Z0V3dwZDR4?=
 =?utf-8?B?WnBwODlWYlNGdFpBdmpYNHlwUi9jOElLc3R4bXc2R0tIVS82WGg4Y0h5aklW?=
 =?utf-8?B?UXBUd3NlNnJQU0w5b3lXc3pRM0NUYU5CVjU5UXJtUk5UMUVWWk96ZUo1c0ZJ?=
 =?utf-8?B?RFJXSXg2WVM1YlcydzhLUitZSVdITnE4dkhsUzVyRlh6bWVNeEhoK0llSFFz?=
 =?utf-8?B?cHdDaDhHQXM0Q3Y2Vkp5V1FKSFZZU2M4OFRnQkVaOVl4Y3RBa3k4MHJUN1pz?=
 =?utf-8?B?RUhKbmJkdDJWOVY3MjFuSndXWXRYVTM1c1NWOHNJQUY3ZnFOMWllclVCSU1p?=
 =?utf-8?B?U3BSMElVRzdYbWFEK0FtMm1KVkJzcWhCekdSRE1LYldIYXRpdUZrL3hRM2tw?=
 =?utf-8?B?T3k4NG1McE9CWnFGSVMyMFlwZmtDbmtTcENsbTBTdjY1K0IzdTFyb3Z5cUlx?=
 =?utf-8?B?dFZvMHJUQzFQQXNBa0xTSEtLai9Uc3J0M1BDYjh2ODlpT0E4ZUx3bTN4OGRO?=
 =?utf-8?B?a3lXVUttcldnZzcyQTBmV1NRRFhVNWJDQWhmVDZ3SWdOSzNtd1ZWSFArdXBL?=
 =?utf-8?Q?qX3xjqT1zGL7Ya20N3GZwf11FLMox4ITSPbSs?=
Content-ID: <782E20A9E441D849BDA3F169CF9EF157@FRAP264.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa07577-7d65-4de8-5bdc-08da4c8c889b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2022 15:59:29.6737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ndhF6vIAgyPA1upq7Gj7afuMbrfm7118lkVBJTDiWpebGHeQAFf0UIX22FWloldzg1R3LkqZpBw6XovGEsBobb+yTZY51xeMCc4MLH/l8lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3735
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_085936_273457_D8BAA96D 
X-CRM114-Status: GOOD (  18.10  )
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

DQoNCkxlIDEyLzA2LzIwMjIgw6AgMTQ6MTgsIE1hc2FtaSBIaXJhbWF0c3UgKEdvb2dsZSkgYSDD
qWNyaXTCoDoNCj4gW1lvdSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBtaGlyYW1hdEBrZXJu
ZWwub3JnLiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVh
cm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IE9uIFRodSwgOSBKdW4gMjAyMiAx
NToyMzoxNiArMDIwMA0KPiBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3JnPiB3cm90ZToN
Cj4gDQo+PiBPbiBUaHUsIDkgSnVuIDIwMjIgYXQgMTU6MTQsIEphcmtrbyBTYWtraW5lbiA8amFy
a2tvQGtlcm5lbC5vcmc+IHdyb3RlOg0KPj4+DQo+Pj4gT24gV2VkLCBKdW4gMDgsIDIwMjIgYXQg
MDk6MTI6MzRBTSAtMDcwMCwgU29uZyBMaXUgd3JvdGU6DQo+Pj4+IE9uIFdlZCwgSnVuIDgsIDIw
MjIgYXQgNzoyMSBBTSBNYXNhbWkgSGlyYW1hdHN1IDxtaGlyYW1hdEBrZXJuZWwub3JnPiB3cm90
ZToNCj4+Pj4+DQo+Pj4+PiBIaSBKYXJra28sDQo+Pj4+Pg0KPj4+Pj4gT24gV2VkLCA4IEp1biAy
MDIyIDA4OjI1OjM4ICswMzAwDQo+Pj4+PiBKYXJra28gU2Fra2luZW4gPGphcmtrb0BrZXJuZWwu
b3JnPiB3cm90ZToNCj4+Pj4+DQo+Pj4+Pj4gT24gV2VkLCBKdW4gMDgsIDIwMjIgYXQgMTA6MzU6
NDJBTSArMDgwMCwgR3VvIFJlbiB3cm90ZToNCj4+Pj4+Pj4gLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBP
biBXZWQsIEp1biA4LCAyMDIyIGF0IDg6MDIgQU0gSmFya2tvIFNha2tpbmVuIDxqYXJra29AcHJv
Zmlhbi5jb20+IHdyb3RlOg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IFRyYWNpbmcgd2l0aCBrcHJvYmVz
IHdoaWxlIHJ1bm5pbmcgYSBtb25vbGl0aGljIGtlcm5lbCBpcyBjdXJyZW50bHkNCj4+Pj4+Pj4+
IGltcG9zc2libGUgYmVjYXVzZSBDT05GSUdfS1BST0JFUyBpcyBkZXBlbmRlbnQgb2YgQ09ORklH
X01PRFVMRVMuICBUaGlzDQo+Pj4+Pj4+PiBkZXBlbmRlbmN5IGlzIGEgcmVzdWx0IG9mIGtwcm9i
ZXMgY29kZSB1c2luZyB0aGUgbW9kdWxlIGFsbG9jYXRvciBmb3IgdGhlDQo+Pj4+Pj4+PiB0cmFt
cG9saW5lIGNvZGUuDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gRGV0YWNoaW5nIGtwcm9iZXMgZnJvbSBt
b2R1bGVzIGhlbHBzIHRvIHNxdWVlemUgZG93biB0aGUgdXNlciBzcGFjZSwNCj4+Pj4+Pj4+IGUu
Zy4gd2hlbiBkZXZlbG9waW5nIG5ldyBjb3JlIGtlcm5lbCBmZWF0dXJlcywgd2hpbGUgc3RpbGwg
aGF2aW5nIGFsbA0KPj4+Pj4+Pj4gdGhlIG5pY2UgdHJhY2luZyBjYXBhYmlsaXRpZXMuDQo+Pj4+
Pj4+Pg0KPj4+Pj4+Pj4gRm9yIGtlcm5lbC8gYW5kIGFyY2gvKiwgbW92ZSBtb2R1bGVfYWxsb2Mo
KSBhbmQgbW9kdWxlX21lbWZyZWUoKSB0bw0KPj4+Pj4+Pj4gbW9kdWxlX2FsbG9jLmMsIGFuZCBj
b21waWxlIGFzIHBhcnQgb2Ygdm1saW51eCB3aGVuIGVpdGhlciBDT05GSUdfTU9EVUxFUw0KPj4+
Pj4+Pj4gb3IgQ09ORklHX0tQUk9CRVMgaXMgZW5hYmxlZC4gIEluIGFkZGl0aW9uLCBmbGFnIGtl
cm5lbCBtb2R1bGUgc3BlY2lmaWMNCj4+Pj4+Pj4+IGNvZGUgd2l0aCBDT05GSUdfTU9EVUxFUy4N
Cj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBBcyB0aGUgcmVzdWx0LCBrcHJvYmVzIGNhbiBiZSB1c2VkIHdp
dGggYSBtb25vbGl0aGljIGtlcm5lbC4NCj4+Pj4+Pj4gSXQncyBzdHJhbmdlIHdoZW4gTU9EVUxF
UyBpcyBuLCBidXQgdm1saW51eCBzdGlsbCBvYnRhaW5zIG1vZHVsZV9hbGxvYy4NCj4+Pj4+Pj4N
Cj4+Pj4+Pj4gTWF5YmUgd2UgbmVlZCBhIGtwcm9iZV9hbGxvYywgcmlnaHQ/DQo+Pj4+Pj4NCj4+
Pj4+PiBQZXJoYXBzIG5vdCB0aGUgYmVzdCBuYW1lIGJ1dCBhdCBsZWFzdCBpdCBkb2N1bWVudHMg
dGhlIGZhY3QgdGhhdA0KPj4+Pj4+IHRoZXkgdXNlIHRoZSBzYW1lIGFsbG9jYXRvci4NCj4+Pj4+
Pg0KPj4+Pj4+IEZldyB5ZWFycyBhZ28gSSBjYXJ2ZWQgdXAgc29tZXRoaW5nICJoYWxmLXdheSB0
aGVyZSIgZm9yIGtwcm9iZXMsDQo+Pj4+Pj4gYW5kIEkgdXNlZCB0aGUgbmFtZSB0ZXh0X2FsbG9j
KCkgWypdLg0KPj4+Pj4+DQo+Pj4+Pj4gWypdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDIwMDcyNDA1MDU1My4xNzI0MTY4LTEtamFya2tvLnNha2tpbmVuQGxpbnV4LmludGVsLmNvbS8N
Cj4+Pj4+DQo+Pj4+PiBZZWFoLCBJIHJlbWVtYmVyIHRoYXQuIFRoYW5rIHlvdSBmb3IgdXBkYXRp
bmcgeW91ciBwYXRjaCENCj4+Pj4+IEkgdGhpbmsgdGhlIGlkZWEgKHNwbGl0IG1vZHVsZV9hbGxv
YygpIGZyb20gQ09ORklHX01PRFVMRSkgaXMgZ29vZCB0byBtZS4NCj4+Pj4+IElmIG1vZHVsZSBz
dXBwb3J0IG1haW50YWluZXJzIHRoaW5rIHRoaXMgbmFtZSBpcyBub3QgZ29vZCwgeW91IG1heSBi
ZQ0KPj4+Pj4gYWJsZSB0byByZW5hbWUgaXQgYXMgdGV4dF9hbGxvYygpIGFuZCBtYWtlIHRoZSBt
b2R1bGVfYWxsb2MoKSBhcyBhDQo+Pj4+PiB3cmFwcGVyIG9mIGl0Lg0KPj4+Pg0KPj4+PiBJSVVD
LCBtb3N0IHVzZXJzIG9mIG1vZHVsZV9hbGxvYygpIHVzZSBpdCB0byBhbGxvY2F0ZSBtZW1vcnkg
Zm9yIHRleHQsIGV4Y2VwdA0KPj4+PiB0aGF0IG1vZHVsZSBjb2RlIHVzZXMgaXQgZm9yIGJvdGgg
dGV4dCBhbmQgZGF0YS4gVGhlcmVmb3JlLCBJIGd1ZXNzIGNhbGxpbmcgaXQNCj4+Pj4gdGV4dF9h
bGxvYygpIGlzIG5vdCAxMDAlIGFjY3VyYXRlIHVudGlsIHdlIGNoYW5nZSB0aGUgbW9kdWxlIGNv
ZGUgKHRvIHVzZQ0KPj4+PiBhIGRpZmZlcmVudCBBUEkgdG8gYWxsb2NhdGUgbWVtb3J5IGZvciBk
YXRhKS4NCj4+Pg0KPj4+IEFmdGVyIHJlYWRpbmcgdGhlIGZlZWRiYWNrLCBJJ2Qgc3RheSBvbiB1
c2luZyBtb2R1bGVfYWxsb2MoKSBiZWNhdXNlDQo+Pj4gaXQgaGFzIGFyY2gtc3BlY2lmaWMgcXVp
cmtzIGJha2VkIGluLiBFYXNpZXIgdG8gZGVhbCB3aXRoIHRoZW0gaW4gb25lDQo+Pj4gcGxhY2Uu
DQo+Pj4NCj4+DQo+PiBJbiB0aGF0IGNhc2UsIHBsZWFzZSBlbnN1cmUgdGhhdCB5b3UgZW5hYmxl
IHRoaXMgb25seSBvbiBhcmNoaXRlY3R1cmVzDQo+PiB3aGVyZSBpdCBpcyBuZWVkZWQuIGFybTY0
IGltcGxlbWVudHMgYWxsb2NfaW5zbl9wYWdlKCkgd2l0aG91dCByZWx5aW5nDQo+PiBvbiBtb2R1
bGVfYWxsb2MoKSBzbyBJIHdvdWxkIG5vdCBleHBlY3QgdG8gc2VlIGFueSBjaGFuZ2VzIHRoZXJl
Lg0KPiANCj4gSG1tLCB3aGF0IGFib3V0IGFkZGluZyBDT05GSUdfQVJDSF9IQVZFX0FMTE9DX0lO
U05fUEFHRSBhbmQgY2hlY2sgaXQ/DQo+IElmIGl0IGlzIGRlZmluZWQsIGtwcm9iZXMgd2lsbCBu
b3QgZGVmaW5lIHRoZSBfX3dlYWsgZnVuY3Rpb24sIGJ1dA0KPiBpZiBub3QsIGl0IHdpbGwgdXNl
IG1vZHVsZV9hbGxvYygpPw0KPiANCg0KSSdtIG5vdCBzdXJlIEkgdW5kZXJzdGFuZC4gV2hhdCdz
IHRoZSBwcm9ibGVtIHdpdGggdGhlIF9fd2VhayBmdW5jdGlvbiANCmhlcmUgPw0KDQpJZiB3ZSBk
b24ndCBkZWZpbmUgdGhlIF9fd2VhayBhbGxvY19pbnNuX3BhZ2UoKSB3aGVuIGFyY2ggaGFzIA0K
Q09ORklHX0FSQ0hfSEFWRV9BTExPQ19JTlNOX1BBR0UsIHRoZW4gd2hhdCdzIHRoZSBwb2ludCBp
biBtYWtpbmcgaXQgd2VhayA/DQoNCnBvd2VycGMgaGFzIGl0J3Mgb3duIGFsbG9jX2luc25fcGFn
ZSgpLCBidXQgY2FsbHMgbW9kdWxlX2FsbG9jKCkuIFNvIGhvdyANCndpbGwgaXQgd29yayA/DQoN
CnZvaWQgKmFsbG9jX2luc25fcGFnZSh2b2lkKQ0Kew0KCXZvaWQgKnBhZ2U7DQoNCglwYWdlID0g
bW9kdWxlX2FsbG9jKFBBR0VfU0laRSk7DQoJaWYgKCFwYWdlKQ0KCQlyZXR1cm4gTlVMTDsNCg0K
CWlmIChzdHJpY3RfbW9kdWxlX3J3eF9lbmFibGVkKCkpIHsNCgkJc2V0X21lbW9yeV9ybygodW5z
aWduZWQgbG9uZylwYWdlLCAxKTsNCgkJc2V0X21lbW9yeV94KCh1bnNpZ25lZCBsb25nKXBhZ2Us
IDEpOw0KCX0NCglyZXR1cm4gcGFnZTsNCn0NCg0KQ2hyaXN0b3BoZQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
