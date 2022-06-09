Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7257CC43334
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 22:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cLIn9ctViQfA712y6sEvvoLBOks8XVzbxh59gvR4qPs=; b=OQfuhbKt8SyMKu
	pOXhUHXxdd3KM+GvLmZKtyH1B6tY17UcFFs1Ig3GpTXWnBMHoVgxnG34sUAcS/H+m4CfXvcTvPdIg
	MlC7ry8LF3knj6TvjXDO6zWlDR/w6wOmYFw0qqgeUUJK0cACEvUzTZ5MHrD9YaM4pPQIS1mYVD59+
	G6LZTAUuP4Agd+1TM/3XK98hLFVxKHqGmI2eiQpvGySXCnFK/aNF+BPHPcGQYHcDorBY0c5Xestvf
	XM7XN7F9X31SqD8nvwjMYObHoRTaWKBp4BpKPXKHlzpTCpvpG4k7QxvQCW5d7chxV2WdnIVoKafMw
	T/q7mO3MqeoVQiT7Wr8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzQYs-004OLR-RR; Thu, 09 Jun 2022 22:23:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzQYp-004OKc-1f; Thu, 09 Jun 2022 22:23:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8E0BE61F96;
	Thu,  9 Jun 2022 22:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198AFC341D1;
	Thu,  9 Jun 2022 22:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654813405;
	bh=z3Jhlwc3PQEgsjMohe71D/i53Eq6SNGSccBMpFOwt4k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ck3AUkzbsBZezflJocw9zOjL/O7W+Kv8m0QA0BWWxYDhG4pRCd/G2CjKMTq/fC9c1
	 YDNJYznqiEIRugQsJ37KCtmFgdeOGurtnYp3KcOlLoT/AuXQJ1xFQ01PLNaPuPrniX
	 o9DIY8DcqggM7iRQQv6RSEuWXTgHJ/U6NHDMrFYk/AsalPOGLOXKYsBHvI333WH8dN
	 ebZHsPO17DYhEkGqqmvhIjoY9hWt2nOdAWOzvaXbFIWq3dR/5HSlguDxAQP+21u1/1
	 VkLbgWA+pA+yM8yGgWFQASY92sYL1GnFC2OWBJ/5Yje+BH1mik8t3w0FK7H+HRgXch
	 6rK8u6pNFWjZQ==
Received: by mail-ot1-f50.google.com with SMTP id c24-20020a9d4818000000b0060c2372addeso2548911otf.11;
        Thu, 09 Jun 2022 15:23:25 -0700 (PDT)
X-Gm-Message-State: AOAM530zLjF8A38hHTsoURai4+QyYNrfuFD77FPUCStJTX6CkzEvAyXp
	K18jBzN3pISpRYUFIWa/p/oah59n6Jt21EeUqFo=
X-Google-Smtp-Source: ABdhPJzANLs6nyK/WG2Y1yCpx8YIaUD2OiJdlTAbvSByFB1d3SGWElQ7owoxfdbySFyAvjdjDfiWZ3ugKMwaWDz7IWk=
X-Received: by 2002:a0d:eb4d:0:b0:30c:9849:27a1 with SMTP id
 u74-20020a0deb4d000000b0030c984927a1mr44312236ywe.472.1654813393600; Thu, 09
 Jun 2022 15:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220608000014.3054333-1-jarkko@profian.com> <CAJF2gTQgCn2CyZ4+VBqEEBT2b4+1KxoEXxrd+Ritk=58+U8EFA@mail.gmail.com>
 <YqAy0qjI4Lktk/uJ@iki.fi> <20220608232115.ccd4399f4a1d133e9b65c2a9@kernel.org>
 <CAPhsuW6iUieQvA6KqzSLgtxmjkVSWCuVwNA338DATb_myHxo7w@mail.gmail.com> <f7ff2a8d-4128-dac9-9768-1d98bfb06a06@csgroup.eu>
In-Reply-To: <f7ff2a8d-4128-dac9-9768-1d98bfb06a06@csgroup.eu>
From: Song Liu <song@kernel.org>
Date: Thu, 9 Jun 2022 15:23:02 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4C0KJT3osBSC9bpi1x7X0HWUE+as+wZi1h63LzHVsptg@mail.gmail.com>
Message-ID: <CAPhsuW4C0KJT3osBSC9bpi1x7X0HWUE+as+wZi1h63LzHVsptg@mail.gmail.com>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Jarkko Sakkinen <jarkko@profian.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nathaniel McCallum <nathaniel@profian.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Kees Cook <keescook@chromium.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	"Eric W. Biederman" <ebiederm@xmission.com>, Marco Elver <elver@google.com>, 
	Dan Li <ashimida@linux.alibaba.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Nick Desaulniers <ndesaulniers@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Chen Zhongjin <chenzhongjin@huawei.com>, Nicolas Pitre <nico@fluxnic.net>, 
	Mark Brown <broonie@kernel.org>, Luis Machado <luis.machado@linaro.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Joey Gouly <joey.gouly@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
	Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Guenter Roeck <linux@roeck-us.net>, 
	Dave Anglin <dave.anglin@bell.net>, Alexei Starovoitov <ast@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>, 
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Jordan Niethe <jniethe5@gmail.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Changbin Du <changbin.du@intel.com>, Heiko Stuebner <heiko@sntech.de>, 
	Liao Chang <liaochang1@huawei.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	Wu Caize <zepan@sipeed.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Alexander Egorenkov <egorenar@linux.ibm.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Tobias Huschle <huschle@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, 
	Michael Roth <michael.roth@amd.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, Miroslav Benes <mbenes@suse.cz>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Aaron Tomlin <atomlin@redhat.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Parisc List <linux-parisc@vger.kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	sparclinux <sparclinux@vger.kernel.org>, 
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_152327_192555_08D20D17 
X-CRM114-Status: GOOD (  33.88  )
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

T24gVGh1LCBKdW4gOSwgMjAyMiBhdCAxOjM0IEFNIENocmlzdG9waGUgTGVyb3kKPGNocmlzdG9w
aGUubGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6Cj4KPgo+Cj4gTGUgMDgvMDYvMjAyMiDDoCAxODox
MiwgU29uZyBMaXUgYSDDqWNyaXQgOgo+ID4gT24gV2VkLCBKdW4gOCwgMjAyMiBhdCA3OjIxIEFN
IE1hc2FtaSBIaXJhbWF0c3UgPG1oaXJhbWF0QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4g
SGkgSmFya2tvLAo+ID4+Cj4gPj4gT24gV2VkLCA4IEp1biAyMDIyIDA4OjI1OjM4ICswMzAwCj4g
Pj4gSmFya2tvIFNha2tpbmVuIDxqYXJra29Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4KPiA+Pj4g
T24gV2VkLCBKdW4gMDgsIDIwMjIgYXQgMTA6MzU6NDJBTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiA+Pj4+IC4KPiA+Pj4+Cj4gPj4+PiBPbiBXZWQsIEp1biA4LCAyMDIyIGF0IDg6MDIgQU0gSmFy
a2tvIFNha2tpbmVuIDxqYXJra29AcHJvZmlhbi5jb20+IHdyb3RlOgo+ID4+Pj4+Cj4gPj4+Pj4g
VHJhY2luZyB3aXRoIGtwcm9iZXMgd2hpbGUgcnVubmluZyBhIG1vbm9saXRoaWMga2VybmVsIGlz
IGN1cnJlbnRseQo+ID4+Pj4+IGltcG9zc2libGUgYmVjYXVzZSBDT05GSUdfS1BST0JFUyBpcyBk
ZXBlbmRlbnQgb2YgQ09ORklHX01PRFVMRVMuICBUaGlzCj4gPj4+Pj4gZGVwZW5kZW5jeSBpcyBh
IHJlc3VsdCBvZiBrcHJvYmVzIGNvZGUgdXNpbmcgdGhlIG1vZHVsZSBhbGxvY2F0b3IgZm9yIHRo
ZQo+ID4+Pj4+IHRyYW1wb2xpbmUgY29kZS4KPiA+Pj4+Pgo+ID4+Pj4+IERldGFjaGluZyBrcHJv
YmVzIGZyb20gbW9kdWxlcyBoZWxwcyB0byBzcXVlZXplIGRvd24gdGhlIHVzZXIgc3BhY2UsCj4g
Pj4+Pj4gZS5nLiB3aGVuIGRldmVsb3BpbmcgbmV3IGNvcmUga2VybmVsIGZlYXR1cmVzLCB3aGls
ZSBzdGlsbCBoYXZpbmcgYWxsCj4gPj4+Pj4gdGhlIG5pY2UgdHJhY2luZyBjYXBhYmlsaXRpZXMu
Cj4gPj4+Pj4KPiA+Pj4+PiBGb3Iga2VybmVsLyBhbmQgYXJjaC8qLCBtb3ZlIG1vZHVsZV9hbGxv
YygpIGFuZCBtb2R1bGVfbWVtZnJlZSgpIHRvCj4gPj4+Pj4gbW9kdWxlX2FsbG9jLmMsIGFuZCBj
b21waWxlIGFzIHBhcnQgb2Ygdm1saW51eCB3aGVuIGVpdGhlciBDT05GSUdfTU9EVUxFUwo+ID4+
Pj4+IG9yIENPTkZJR19LUFJPQkVTIGlzIGVuYWJsZWQuICBJbiBhZGRpdGlvbiwgZmxhZyBrZXJu
ZWwgbW9kdWxlIHNwZWNpZmljCj4gPj4+Pj4gY29kZSB3aXRoIENPTkZJR19NT0RVTEVTLgo+ID4+
Pj4+Cj4gPj4+Pj4gQXMgdGhlIHJlc3VsdCwga3Byb2JlcyBjYW4gYmUgdXNlZCB3aXRoIGEgbW9u
b2xpdGhpYyBrZXJuZWwuCj4gPj4+PiBJdCdzIHN0cmFuZ2Ugd2hlbiBNT0RVTEVTIGlzIG4sIGJ1
dCB2bWxpbnV4IHN0aWxsIG9idGFpbnMgbW9kdWxlX2FsbG9jLgo+ID4+Pj4KPiA+Pj4+IE1heWJl
IHdlIG5lZWQgYSBrcHJvYmVfYWxsb2MsIHJpZ2h0Pwo+ID4+Pgo+ID4+PiBQZXJoYXBzIG5vdCB0
aGUgYmVzdCBuYW1lIGJ1dCBhdCBsZWFzdCBpdCBkb2N1bWVudHMgdGhlIGZhY3QgdGhhdAo+ID4+
PiB0aGV5IHVzZSB0aGUgc2FtZSBhbGxvY2F0b3IuCj4gPj4+Cj4gPj4+IEZldyB5ZWFycyBhZ28g
SSBjYXJ2ZWQgdXAgc29tZXRoaW5nICJoYWxmLXdheSB0aGVyZSIgZm9yIGtwcm9iZXMsCj4gPj4+
IGFuZCBJIHVzZWQgdGhlIG5hbWUgdGV4dF9hbGxvYygpIFsqXS4KPiA+Pj4KPiA+Pj4gWypdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIwMDcyNDA1MDU1My4xNzI0MTY4LTEtamFya2tv
LnNha2tpbmVuQGxpbnV4LmludGVsLmNvbS8KPiA+Pgo+ID4+IFllYWgsIEkgcmVtZW1iZXIgdGhh
dC4gVGhhbmsgeW91IGZvciB1cGRhdGluZyB5b3VyIHBhdGNoIQo+ID4+IEkgdGhpbmsgdGhlIGlk
ZWEgKHNwbGl0IG1vZHVsZV9hbGxvYygpIGZyb20gQ09ORklHX01PRFVMRSkgaXMgZ29vZCB0byBt
ZS4KPiA+PiBJZiBtb2R1bGUgc3VwcG9ydCBtYWludGFpbmVycyB0aGluayB0aGlzIG5hbWUgaXMg
bm90IGdvb2QsIHlvdSBtYXkgYmUKPiA+PiBhYmxlIHRvIHJlbmFtZSBpdCBhcyB0ZXh0X2FsbG9j
KCkgYW5kIG1ha2UgdGhlIG1vZHVsZV9hbGxvYygpIGFzIGEKPiA+PiB3cmFwcGVyIG9mIGl0Lgo+
ID4KPiA+IElJVUMsIG1vc3QgdXNlcnMgb2YgbW9kdWxlX2FsbG9jKCkgdXNlIGl0IHRvIGFsbG9j
YXRlIG1lbW9yeSBmb3IgdGV4dCwgZXhjZXB0Cj4gPiB0aGF0IG1vZHVsZSBjb2RlIHVzZXMgaXQg
Zm9yIGJvdGggdGV4dCBhbmQgZGF0YS4gVGhlcmVmb3JlLCBJIGd1ZXNzIGNhbGxpbmcgaXQKPiA+
IHRleHRfYWxsb2MoKSBpcyBub3QgMTAwJSBhY2N1cmF0ZSB1bnRpbCB3ZSBjaGFuZ2UgdGhlIG1v
ZHVsZSBjb2RlICh0byB1c2UKPiA+IGEgZGlmZmVyZW50IEFQSSB0byBhbGxvY2F0ZSBtZW1vcnkg
Zm9yIGRhdGEpLgo+Cj4gV2hlbiBDT05GSUdfQVJDSF9XQU5UU19NT0RVTEVTX0RBVEFfSU5fVk1B
TExPQywgbW9kdWxlIGNvZGUgdXNlcwo+IG1vZHVsZV9hbGxvYygpIGZvciB0ZXh0IGFuZCB2bWFs
bG9jKCkgZm9yIGRhdGEsIHNlZSBmdW5jdGlvbgo+IG1vdmVfbW9kdWxlKCkgaW4ga2VybmVsL21v
ZHVsZS9tYWluLmMKClRoYW5rcyBmb3IgdGhlIHBvaW50ZXIhIEkgd2lsbCBwbGF5IHdpdGggaXQu
CgpTb25nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
