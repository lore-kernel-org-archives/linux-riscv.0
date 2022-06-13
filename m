Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0C7C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 00:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bIqQeDSjGwD9y03AkRnDNgCropWUaPX4Jp1hceloGpQ=; b=qxxChse2hsUiNh
	8bDsgPc3Xy30inVq0Ui8JqMXM98J7DNal63ttvsRitvCAmJCLRsv7zmtO690dC1sBdBAqR2lzJx47
	+QqfDIYvXeFyAEE4Vebdrm3H4f4LK7exUl6oQYLwICUdtC98LKVVx+cUNj7DdazCQqwTOAfLCnFof
	zXSCdiszDAUkw1agNMh/EgHwVLV1ut+Ctks0XLMukftxnvAYZULIFPer0NbrIjwFrfQesXKfPt6Jo
	d+nEkkGIrblH9tDwHhN6NgC2ZoplZ+jAqrnVMXFdnVraGP2A0ELP5NdjRUL1/fCGidv/9b3FCFzrh
	jyrzHuOk5RVJZTTS+2TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0XXH-000ZuO-JW; Mon, 13 Jun 2022 00:02:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0XXD-000Zsf-Kt; Mon, 13 Jun 2022 00:02:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 2A92BCE0EC7;
	Mon, 13 Jun 2022 00:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5FFC34115;
	Mon, 13 Jun 2022 00:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655078536;
	bh=ZlQBYr8CVFKg9jC19bbC2S1Ejn+8iBBKa/BTt5EXxNE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KfgXbb7SVWFGWbNXSuj16bpGceUsLtbDu1Hewt3CIJPbVPDc+xtiyzOSrQiSfJ3L5
	 V5Nf70q9aNZ9pP28hqCcRB82eBPGnElrWZOc+Jddd6fTOaRWgSoINxmSJrnG1bzPJ7
	 5ZuprE6bDAzV6ZNjZBF0A7gpmfjtQmeOIGu2fNilLUuiiu1FSE40vcKKC0MsJaNJwh
	 pBDnu9DBKYoe6n0hxC5YypdAubYP0kE0WkRnj3EbBwdD/PCFyaR+mKjVYvBZ8b1/nO
	 JWT1yveTzJdM1Eej+Ox9IUke9l8mofawIhq3C9185eoPW8CeCvmxzr/ba+FtPTbAt/
	 jkwNZn9Cqb+hA==
Date: Mon, 13 Jun 2022 09:01:54 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Ard Biesheuvel <ardb@kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>,
 Song Liu <song@kernel.org>, Guo Ren <guoren@kernel.org>, Jarkko Sakkinen
 <jarkko@profian.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Nathaniel McCallum <nathaniel@profian.com>,
 Russell King <linux@armlinux.org.uk>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
 <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, the arch/x86
 maintainers <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Anil S Keshavamurthy
 <anil.s.keshavamurthy@intel.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Kees Cook <keescook@chromium.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, Nathan Chancellor
 <nathan@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, "Eric W. Biederman" <ebiederm@xmission.com>, Marco
 Elver <elver@google.com>, Dan Li <ashimida@linux.alibaba.com>, Sami
 Tolvanen <samitolvanen@google.com>, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>, Nick Desaulniers <ndesaulniers@google.com>,
 Linus Walleij <linus.walleij@linaro.org>, Chen Zhongjin
 <chenzhongjin@huawei.com>, Nicolas Pitre <nico@fluxnic.net>, Mark Brown
 <broonie@kernel.org>, Luis Machado <luis.machado@linaro.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Joey Gouly <joey.gouly@arm.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Andrey Konovalov <andreyknvl@gmail.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Atsushi Nemoto
 <anemo@mba.ocn.ne.jp>, Guenter Roeck <linux@roeck-us.net>, Dave Anglin
 <dave.anglin@bell.net>, Alexei Starovoitov <ast@kernel.org>, Nicholas
 Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>, Aneesh Kumar
 K.V <aneesh.kumar@linux.ibm.com>, Jordan Niethe <jniethe5@gmail.com>, Anup
 Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Changbin
 Du <changbin.du@intel.com>, Heiko Stuebner <heiko@sntech.de>, Liao Chang
 <liaochang1@huawei.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, Wu
 Caize <zepan@sipeed.com>, Emil Renner Berthing <kernel@esmil.dk>, Alexander
 Egorenkov <egorenar@linux.ibm.com>, Thomas Richter <tmricht@linux.ibm.com>,
 Tobias Huschle <huschle@linux.ibm.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>, Daniel Bristot
 de Oliveira <bristot@redhat.com>, Michael Roth <michael.roth@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Javier Martinez
 Canillas <javierm@redhat.com>, Miroslav Benes <mbenes@suse.cz>,
 =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, Tiezhu Yang
 <yangtiezhu@loongson.cn>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Aaron Tomlin <atomlin@redhat.com>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "open list:BROADCOM NVRAM DRIVER"
 <linux-mips@vger.kernel.org>, Parisc List <linux-parisc@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, "linux-modules@vger.kernel.org"
 <linux-modules@vger.kernel.org>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
Message-Id: <20220613090154.13331896ce8692afc0584cce@kernel.org>
In-Reply-To: <de3ab735-54f7-c97b-1d2f-bed0ad4ff366@csgroup.eu>
References: <20220608000014.3054333-1-jarkko@profian.com>
	<CAJF2gTQgCn2CyZ4+VBqEEBT2b4+1KxoEXxrd+Ritk=58+U8EFA@mail.gmail.com>
	<YqAy0qjI4Lktk/uJ@iki.fi>
	<20220608232115.ccd4399f4a1d133e9b65c2a9@kernel.org>
	<CAPhsuW6iUieQvA6KqzSLgtxmjkVSWCuVwNA338DATb_myHxo7w@mail.gmail.com>
	<YqHx1d+MwRLLzGQe@iki.fi>
	<CAMj1kXGGyO-DL9hjKYKR2sp87s4KExiQybES8pp4JgqJcHkfLA@mail.gmail.com>
	<20220612211802.30a16623e8b0a55122b02386@kernel.org>
	<de3ab735-54f7-c97b-1d2f-bed0ad4ff366@csgroup.eu>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_170224_073532_157977A8 
X-CRM114-Status: GOOD (  44.32  )
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

T24gU3VuLCAxMiBKdW4gMjAyMiAxNTo1OToyOSArMDAwMApDaHJpc3RvcGhlIExlcm95IDxjaHJp
c3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgoKPiAKPiAKPiBMZSAxMi8wNi8yMDIyIMOg
IDE0OjE4LCBNYXNhbWkgSGlyYW1hdHN1IChHb29nbGUpIGEgw6ljcml0wqA6Cj4gPiBbWW91IGRv
bid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIG1oaXJhbWF0QGtlcm5lbC5vcmcuIExlYXJuIHdoeSB0
aGlzIGlzIGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRp
ZmljYXRpb24gXQo+ID4gCj4gPiBPbiBUaHUsIDkgSnVuIDIwMjIgMTU6MjM6MTYgKzAyMDAKPiA+
IEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gCj4gPj4gT24gVGh1
LCA5IEp1biAyMDIyIGF0IDE1OjE0LCBKYXJra28gU2Fra2luZW4gPGphcmtrb0BrZXJuZWwub3Jn
PiB3cm90ZToKPiA+Pj4KPiA+Pj4gT24gV2VkLCBKdW4gMDgsIDIwMjIgYXQgMDk6MTI6MzRBTSAt
MDcwMCwgU29uZyBMaXUgd3JvdGU6Cj4gPj4+PiBPbiBXZWQsIEp1biA4LCAyMDIyIGF0IDc6MjEg
QU0gTWFzYW1pIEhpcmFtYXRzdSA8bWhpcmFtYXRAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4+Pj4K
PiA+Pj4+PiBIaSBKYXJra28sCj4gPj4+Pj4KPiA+Pj4+PiBPbiBXZWQsIDggSnVuIDIwMjIgMDg6
MjU6MzggKzAzMDAKPiA+Pj4+PiBKYXJra28gU2Fra2luZW4gPGphcmtrb0BrZXJuZWwub3JnPiB3
cm90ZToKPiA+Pj4+Pgo+ID4+Pj4+PiBPbiBXZWQsIEp1biAwOCwgMjAyMiBhdCAxMDozNTo0MkFN
ICswODAwLCBHdW8gUmVuIHdyb3RlOgo+ID4+Pj4+Pj4gLgo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IE9u
IFdlZCwgSnVuIDgsIDIwMjIgYXQgODowMiBBTSBKYXJra28gU2Fra2luZW4gPGphcmtrb0Bwcm9m
aWFuLmNvbT4gd3JvdGU6Cj4gPj4+Pj4+Pj4KPiA+Pj4+Pj4+PiBUcmFjaW5nIHdpdGgga3Byb2Jl
cyB3aGlsZSBydW5uaW5nIGEgbW9ub2xpdGhpYyBrZXJuZWwgaXMgY3VycmVudGx5Cj4gPj4+Pj4+
Pj4gaW1wb3NzaWJsZSBiZWNhdXNlIENPTkZJR19LUFJPQkVTIGlzIGRlcGVuZGVudCBvZiBDT05G
SUdfTU9EVUxFUy4gIFRoaXMKPiA+Pj4+Pj4+PiBkZXBlbmRlbmN5IGlzIGEgcmVzdWx0IG9mIGtw
cm9iZXMgY29kZSB1c2luZyB0aGUgbW9kdWxlIGFsbG9jYXRvciBmb3IgdGhlCj4gPj4+Pj4+Pj4g
dHJhbXBvbGluZSBjb2RlLgo+ID4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4gRGV0YWNoaW5nIGtwcm9iZXMg
ZnJvbSBtb2R1bGVzIGhlbHBzIHRvIHNxdWVlemUgZG93biB0aGUgdXNlciBzcGFjZSwKPiA+Pj4+
Pj4+PiBlLmcuIHdoZW4gZGV2ZWxvcGluZyBuZXcgY29yZSBrZXJuZWwgZmVhdHVyZXMsIHdoaWxl
IHN0aWxsIGhhdmluZyBhbGwKPiA+Pj4+Pj4+PiB0aGUgbmljZSB0cmFjaW5nIGNhcGFiaWxpdGll
cy4KPiA+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+IEZvciBrZXJuZWwvIGFuZCBhcmNoLyosIG1vdmUgbW9k
dWxlX2FsbG9jKCkgYW5kIG1vZHVsZV9tZW1mcmVlKCkgdG8KPiA+Pj4+Pj4+PiBtb2R1bGVfYWxs
b2MuYywgYW5kIGNvbXBpbGUgYXMgcGFydCBvZiB2bWxpbnV4IHdoZW4gZWl0aGVyIENPTkZJR19N
T0RVTEVTCj4gPj4+Pj4+Pj4gb3IgQ09ORklHX0tQUk9CRVMgaXMgZW5hYmxlZC4gIEluIGFkZGl0
aW9uLCBmbGFnIGtlcm5lbCBtb2R1bGUgc3BlY2lmaWMKPiA+Pj4+Pj4+PiBjb2RlIHdpdGggQ09O
RklHX01PRFVMRVMuCj4gPj4+Pj4+Pj4KPiA+Pj4+Pj4+PiBBcyB0aGUgcmVzdWx0LCBrcHJvYmVz
IGNhbiBiZSB1c2VkIHdpdGggYSBtb25vbGl0aGljIGtlcm5lbC4KPiA+Pj4+Pj4+IEl0J3Mgc3Ry
YW5nZSB3aGVuIE1PRFVMRVMgaXMgbiwgYnV0IHZtbGludXggc3RpbGwgb2J0YWlucyBtb2R1bGVf
YWxsb2MuCj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gTWF5YmUgd2UgbmVlZCBhIGtwcm9iZV9hbGxvYywg
cmlnaHQ/Cj4gPj4+Pj4+Cj4gPj4+Pj4+IFBlcmhhcHMgbm90IHRoZSBiZXN0IG5hbWUgYnV0IGF0
IGxlYXN0IGl0IGRvY3VtZW50cyB0aGUgZmFjdCB0aGF0Cj4gPj4+Pj4+IHRoZXkgdXNlIHRoZSBz
YW1lIGFsbG9jYXRvci4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gRmV3IHllYXJzIGFnbyBJIGNhcnZlZCB1
cCBzb21ldGhpbmcgImhhbGYtd2F5IHRoZXJlIiBmb3Iga3Byb2JlcywKPiA+Pj4+Pj4gYW5kIEkg
dXNlZCB0aGUgbmFtZSB0ZXh0X2FsbG9jKCkgWypdLgo+ID4+Pj4+Pgo+ID4+Pj4+PiBbKl0gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjAwNzI0MDUwNTUzLjE3MjQxNjgtMS1qYXJra28u
c2Fra2luZW5AbGludXguaW50ZWwuY29tLwo+ID4+Pj4+Cj4gPj4+Pj4gWWVhaCwgSSByZW1lbWJl
ciB0aGF0LiBUaGFuayB5b3UgZm9yIHVwZGF0aW5nIHlvdXIgcGF0Y2ghCj4gPj4+Pj4gSSB0aGlu
ayB0aGUgaWRlYSAoc3BsaXQgbW9kdWxlX2FsbG9jKCkgZnJvbSBDT05GSUdfTU9EVUxFKSBpcyBn
b29kIHRvIG1lLgo+ID4+Pj4+IElmIG1vZHVsZSBzdXBwb3J0IG1haW50YWluZXJzIHRoaW5rIHRo
aXMgbmFtZSBpcyBub3QgZ29vZCwgeW91IG1heSBiZQo+ID4+Pj4+IGFibGUgdG8gcmVuYW1lIGl0
IGFzIHRleHRfYWxsb2MoKSBhbmQgbWFrZSB0aGUgbW9kdWxlX2FsbG9jKCkgYXMgYQo+ID4+Pj4+
IHdyYXBwZXIgb2YgaXQuCj4gPj4+Pgo+ID4+Pj4gSUlVQywgbW9zdCB1c2VycyBvZiBtb2R1bGVf
YWxsb2MoKSB1c2UgaXQgdG8gYWxsb2NhdGUgbWVtb3J5IGZvciB0ZXh0LCBleGNlcHQKPiA+Pj4+
IHRoYXQgbW9kdWxlIGNvZGUgdXNlcyBpdCBmb3IgYm90aCB0ZXh0IGFuZCBkYXRhLiBUaGVyZWZv
cmUsIEkgZ3Vlc3MgY2FsbGluZyBpdAo+ID4+Pj4gdGV4dF9hbGxvYygpIGlzIG5vdCAxMDAlIGFj
Y3VyYXRlIHVudGlsIHdlIGNoYW5nZSB0aGUgbW9kdWxlIGNvZGUgKHRvIHVzZQo+ID4+Pj4gYSBk
aWZmZXJlbnQgQVBJIHRvIGFsbG9jYXRlIG1lbW9yeSBmb3IgZGF0YSkuCj4gPj4+Cj4gPj4+IEFm
dGVyIHJlYWRpbmcgdGhlIGZlZWRiYWNrLCBJJ2Qgc3RheSBvbiB1c2luZyBtb2R1bGVfYWxsb2Mo
KSBiZWNhdXNlCj4gPj4+IGl0IGhhcyBhcmNoLXNwZWNpZmljIHF1aXJrcyBiYWtlZCBpbi4gRWFz
aWVyIHRvIGRlYWwgd2l0aCB0aGVtIGluIG9uZQo+ID4+PiBwbGFjZS4KPiA+Pj4KPiA+Pgo+ID4+
IEluIHRoYXQgY2FzZSwgcGxlYXNlIGVuc3VyZSB0aGF0IHlvdSBlbmFibGUgdGhpcyBvbmx5IG9u
IGFyY2hpdGVjdHVyZXMKPiA+PiB3aGVyZSBpdCBpcyBuZWVkZWQuIGFybTY0IGltcGxlbWVudHMg
YWxsb2NfaW5zbl9wYWdlKCkgd2l0aG91dCByZWx5aW5nCj4gPj4gb24gbW9kdWxlX2FsbG9jKCkg
c28gSSB3b3VsZCBub3QgZXhwZWN0IHRvIHNlZSBhbnkgY2hhbmdlcyB0aGVyZS4KPiA+IAo+ID4g
SG1tLCB3aGF0IGFib3V0IGFkZGluZyBDT05GSUdfQVJDSF9IQVZFX0FMTE9DX0lOU05fUEFHRSBh
bmQgY2hlY2sgaXQ/Cj4gPiBJZiBpdCBpcyBkZWZpbmVkLCBrcHJvYmVzIHdpbGwgbm90IGRlZmlu
ZSB0aGUgX193ZWFrIGZ1bmN0aW9uLCBidXQKPiA+IGlmIG5vdCwgaXQgd2lsbCB1c2UgbW9kdWxl
X2FsbG9jKCk/Cj4gPiAKPiAKPiBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kLiBXaGF0J3MgdGhl
IHByb2JsZW0gd2l0aCB0aGUgX193ZWFrIGZ1bmN0aW9uIAo+IGhlcmUgPwo+IAo+IElmIHdlIGRv
bid0IGRlZmluZSB0aGUgX193ZWFrIGFsbG9jX2luc25fcGFnZSgpIHdoZW4gYXJjaCBoYXMgCj4g
Q09ORklHX0FSQ0hfSEFWRV9BTExPQ19JTlNOX1BBR0UsIHRoZW4gd2hhdCdzIHRoZSBwb2ludCBp
biBtYWtpbmcgaXQgd2VhayA/Cj4gCj4gcG93ZXJwYyBoYXMgaXQncyBvd24gYWxsb2NfaW5zbl9w
YWdlKCksIGJ1dCBjYWxscyBtb2R1bGVfYWxsb2MoKS4gU28gaG93IAo+IHdpbGwgaXQgd29yayA/
CgpHb29kIHBvaW50ISBJbiB0aGF0IGNhc2UsIGl0IHdpbGwgbmVlZCB0byBzZXBhcmF0ZSB0aGUg
bW9kdWxlX2FsbG9jKCkKZnJvbSBrbW9kdWxlIHN1cHBvcnQgZXZlbiB3aXRob3V0IHRoZSBfX3dl
YWsuCgpUaGFuayB5b3UsCgo+IAo+IHZvaWQgKmFsbG9jX2luc25fcGFnZSh2b2lkKQo+IHsKPiAJ
dm9pZCAqcGFnZTsKPiAKPiAJcGFnZSA9IG1vZHVsZV9hbGxvYyhQQUdFX1NJWkUpOwo+IAlpZiAo
IXBhZ2UpCj4gCQlyZXR1cm4gTlVMTDsKPiAKPiAJaWYgKHN0cmljdF9tb2R1bGVfcnd4X2VuYWJs
ZWQoKSkgewo+IAkJc2V0X21lbW9yeV9ybygodW5zaWduZWQgbG9uZylwYWdlLCAxKTsKPiAJCXNl
dF9tZW1vcnlfeCgodW5zaWduZWQgbG9uZylwYWdlLCAxKTsKPiAJfQo+IAlyZXR1cm4gcGFnZTsK
PiB9Cj4gCj4gQ2hyaXN0b3BoZQoKLS0gCk1hc2FtaSBIaXJhbWF0c3UgKEdvb2dsZSkgPG1oaXJh
bWF0QGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
