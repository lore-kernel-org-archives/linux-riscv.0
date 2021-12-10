Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3566C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 19:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qJgKcB++sE85lH3poU5Fbd3YHr1Byda1FzhvDqt2WIk=; b=nMdu+tnXj2udQC
	gLgJHpm22Wxh2BExdn4Y4xCe/ODaVUqwluCrk4qPNOOBOh/brOBKb326HkgbfCw5qEDlukarGzfsO
	besU5DpZQQB1OPPmOIKT6GmW3Iql3t4bWVBY8uTQO5pUWJoBZiUkVSouE5i85TRCLzuoA+M5Jom2b
	GhCFI63CVrKRndJIvJ4kElkIv9WW6FVigI4Sc6DRBj2fn4Sxy8uNvpN+OTnJyLvvne8jba81ggxls
	T+LIVJBoAh29wRSiJ4078x9e/kQZZocy/HHSe72F9MMk+0XWkg8x3YkvwrEBbc9H4kiH178AiXNCb
	IhSo4m9a2HOhUW8JOdtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvlZ6-003XqI-BU; Fri, 10 Dec 2021 19:28:20 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvlLy-003Rp7-SG; Fri, 10 Dec 2021 19:14:48 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 35-20020a9d08a6000000b00579cd5e605eso10665350otf.0; 
 Fri, 10 Dec 2021 11:14:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=StDkoZeh1lHUw1DDm/KpSH6johK86ICDiu5dChogaP8=;
 b=pCf6NvUc/EL4w0lQOCXDFMKVXJPwkiGoM9ifapXprqCH+gkBidoek4rLFlLAK9uV5L
 Mg7axj+Mp/IL7iKoqQ6H4lOcDyD6TNxKMSxnMeSN2cOtTQo7OxbIGX0SALHKsjb9GsI+
 8AzPhjO3oNDO/vnbXJ0ANJDTw+49RK0Jfys3+D1JncdeWsK6aRdsxP5sg9sQTFKNbG0z
 oZW+j9jjm0DhINMkR7GZbirU5mbt4XZsbxFxIilevPojI9/QPK223lbceTLfNiaM8kjJ
 CUU09o+skHAmn3Qtd8Nb6Z4b5Mb919Abbb/7hH3sIAV8lGKfB49jyy1dwUJ8PSgY5iTl
 KdWA==
X-Gm-Message-State: AOAM533XucEK6/FHAPXHSg23sCcUD0mg1cFeTQkyPWuqRFvywupaUs4k
 SXB0EaGaOf8ILZCI79Z7WObbZQZXPN/MRc7iD/g=
X-Google-Smtp-Source: ABdhPJwI6PbHk846M9cWi0KvS3EvMhQYMsgwdseNjfmW3x73dR5HGBiuvU5f7TYKM/YR00y87Pqhei6Yd6KAs40K6Eo=
X-Received: by 2002:a05:6830:1e57:: with SMTP id
 e23mr12575530otj.16.1639163685443; 
 Fri, 10 Dec 2021 11:14:45 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-6-digetx@gmail.com>
 <YaLNOJTM+lVq+YNS@qmqm.qmqm.pl>
 <033ddf2a-6223-1a82-ec64-30f17c891f67@gmail.com>
 <YaQeQgbW+CjEdsqG@qmqm.qmqm.pl>
 <091321ea-4919-0579-88a8-23d05871575d@gmail.com>
 <CAJZ5v0jMvdhfBqjY+V9h_Z6EH1ohuJH+KjuGiOw_Jor1Tnp7vg@mail.gmail.com>
 <45025b2d-4be1-f694-be61-31903795cf5d@gmail.com>
In-Reply-To: <45025b2d-4be1-f694-be61-31903795cf5d@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Dec 2021 20:14:34 +0100
Message-ID: <CAJZ5v0ieTwnBVjW8R_VTdPFH3yr5AwLc+ZEG5N3KrpTH+j8qZw@mail.gmail.com>
Subject: Re: [PATCH v4 05/25] reboot: Warn if restart handler has duplicated
 priority
To: Dmitry Osipenko <digetx@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, 
 Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Greentime Hu <green.hu@gmail.com>, 
 Vincent Chen <deanbo422@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "the arch/x86 maintainers" <x86@kernel.org>, 
 "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Len Brown <lenb@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 alankao@andestech.com, "K . C . Kuen-Chern Lin" <kclin@andestech.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-riscv@lists.infradead.org, 
 Linux-sh list <linux-sh@vger.kernel.org>, xen-devel@lists.xenproject.org, 
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, 
 linux-tegra <linux-tegra@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_111446_984479_0B9E0EE0 
X-CRM114-Status: GOOD (  45.69  )
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

T24gRnJpLCBEZWMgMTAsIDIwMjEgYXQgODowNCBQTSBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gMTAuMTIuMjAyMSAyMToyNywgUmFmYWVsIEouIFd5c29ja2kg
0L/QuNGI0LXRgjoKPiA+IE9uIE1vbiwgTm92IDI5LCAyMDIxIGF0IDEyOjM0IFBNIERtaXRyeSBP
c2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiAyOS4xMS4yMDIxIDAz
OjI2LCBNaWNoYcWCIE1pcm9zxYJhdyDQv9C40YjQtdGCOgo+ID4+PiBPbiBNb24sIE5vdiAyOSwg
MjAyMSBhdCAxMjowNjoxOUFNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gPj4+PiAy
OC4xMS4yMDIxIDAzOjI4LCBNaWNoYcWCIE1pcm9zxYJhdyDQv9C40YjQtdGCOgo+ID4+Pj4+IE9u
IEZyaSwgTm92IDI2LCAyMDIxIGF0IDA5OjAwOjQxUE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3
cm90ZToKPiA+Pj4+Pj4gQWRkIHNhbml0eSBjaGVjayB3aGljaCBlbnN1cmVzIHRoYXQgdGhlcmUg
YXJlIG5vIHR3byByZXN0YXJ0IGhhbmRsZXJzCj4gPj4+Pj4+IHJlZ2lzdGVyZWQgd2l0aCB0aGUg
c2FtZSBwcmlvcml0eS4gTm9ybWFsbHkgaXQncyBhIGRpcmVjdCBzaWduIG9mIGEKPiA+Pj4+Pj4g
cHJvYmxlbSBpZiB0d28gaGFuZGxlcnMgdXNlIHRoZSBzYW1lIHByaW9yaXR5Lgo+ID4+Pj4+Cj4g
Pj4+Pj4gVGhlIHBhdGNoIGRvZXNuJ3QgZW5zdXJlIHRoZSBwcm9wZXJ0eSB0aGF0IHRoZXJlIGFy
ZSBubyBkdXBsaWNhdGVkLXByaW9yaXR5Cj4gPj4+Pj4gZW50cmllcyBvbiB0aGUgY2hhaW4uCj4g
Pj4+Pgo+ID4+Pj4gSXQncyBub3QgdGhlIGV4YWN0IHBvaW50IG9mIHRoaXMgcGF0Y2guCj4gPj4+
Pgo+ID4+Pj4+IEknZCByYXRoZXIgc2VlIGEgYXRvbWljX25vdGlmaWVyX2NoYWluX3JlZ2lzdGVy
X3VuaXF1ZSgpIHRoYXQgcmV0dXJucwo+ID4+Pj4+IC1FQlVTWSBvciBzb21ldGhpbmcgaXN0ZWFk
IG9mIGFkZGluZyBhbiBlbnRyeSB3aXRoIGR1cGxpY2F0ZSBwcmlvcml0eS4KPiA+Pj4+PiBUaGF0
IHdheSBpdCB3b3VsZCBuZWVkIG9ubHkgb25lIGxpc3QgdHJhdmVyc2FsIHVubGVzcyB5b3Ugd2Fu
dCB0bwo+ID4+Pj4+IHJlZ2lzdGVyIHRoZSBkdXBsaWNhdGUgYW55d2F5ICh0aGVuIHlvdSB3b3Vs
ZCBjYWxsIHRoZSBvbGRlcgo+ID4+Pj4+IGF0b21pY19ub3RpZmllcl9jaGFpbl9yZWdpc3Rlcigp
IGFmdGVyIHJlcG9ydGluZyB0aGUgZXJyb3IpLgo+ID4+Pj4KPiA+Pj4+IFRoZSBwb2ludCBvZiB0
aGlzIHBhdGNoIGlzIHRvIHdhcm4gZGV2ZWxvcGVycyBhYm91dCB0aGUgcHJvYmxlbSB0aGF0Cj4g
Pj4+PiBuZWVkcyB0byBiZSBmaXhlZC4gV2UgYWxyZWFkeSBoYXZlIHN1Y2ggdHJvdWJsaW5nIGRy
aXZlcnMgaW4gbWFpbmxpbmUuCj4gPj4+Pgo+ID4+Pj4gSXQncyBub3QgY3JpdGljYWwgdG8gcmVn
aXN0ZXIgZGlmZmVyZW50IGhhbmRsZXJzIHdpdGggYSBkdXBsaWNhdGVkCj4gPj4+PiBwcmlvcml0
aWVzLCBidXQgc3VjaCBjYXNlcyByZWFsbHkgbmVlZCB0byBiZSBjb3JyZWN0ZWQuIFdlIHNob3Vs
ZG4ndAo+ID4+Pj4gYnJlYWsgdXNlcnMnIG1hY2hpbmVzIGR1cmluZyB0cmFuc2l0aW9uIHRvIHRo
ZSBuZXcgQVBJLCBtZWFud2hpbGUKPiA+Pj4+IGRldmVsb3BlcnMgc2hvdWxkIHRha2UgYWN0aW9u
IG9mIGZpeGluZyB0aGVpcnMgZHJpdmVycy4KPiA+Pj4+Cj4gPj4+Pj4gKE9yIHlvdSBjb3VsZCBy
ZXR1cm4gPiAwIHdoZW4gYSBkdXBsaWNhdGUgaXMgcmVnaXN0ZXJlZCBpbgo+ID4+Pj4+IGF0b21p
Y19ub3RpZmllcl9jaGFpbl9yZWdpc3RlcigpIGlmIHRoZSBjYWxsZXJzIGFyZSBwcmVwYXJlZAo+
ID4+Pj4+IGZvciB0aGF0LiBJIGRvbid0IHJlYWxseSBsaWtlIHRoaXMgd2F5LCB0aG91Z2guKQo+
ID4+Pj4KPiA+Pj4+IEkgaGFkIGEgc2ltaWxhciB0aG91Z2h0IGF0IHNvbWUgcG9pbnQgYmVmb3Jl
IGFuZCBkZWNpZGVkIHRoYXQgSSdtIG5vdCBpbgo+ID4+Pj4gZmF2b3Igb2YgdGhpcyBhcHByb2Fj
aC4gSXQncyBuaWNlciB0byBoYXZlIGEgZGVkaWNhdGVkIGZ1bmN0aW9uIHRoYXQKPiA+Pj4+IHZl
cmlmaWVzIHRoZSB1bmlxdWVuZXNzLCBJTU8uCj4gPj4+Cj4gPj4+IEkgZG9uJ3QgbGlrZSB0aGUg
cGFydCB0aGF0IGl0IHRyYXZlcnNlcyB0aGUgbGlzdCBzZWNvbmQgdGltZSB0byBjaGVjawo+ID4+
PiB0aGUgdW5pcXVlbmVzcy4gQnV0IGFjdHVhbGx5IHlvdSBjb3VsZCBhdm9pZCB0aGF0IGlmCj4g
Pj4+IG5vdGlmaWVyX2NoYWluX3JlZ2lzdGVyKCkgd291bGQgYWx3YXlzIGFkZCBlcXVhbC1wcmlv
cml0eSBlbnRyaWVzIGluCj4gPj4+IHJldmVyc2Ugb3JkZXI6Cj4gPj4+Cj4gPj4+ICBzdGF0aWMg
aW50IG5vdGlmaWVyX2NoYWluX3JlZ2lzdGVyKHN0cnVjdCBub3RpZmllcl9ibG9jayAqKm5sLAo+
ID4+PiAgICAgICAgICAgICAgIHN0cnVjdCBub3RpZmllcl9ibG9jayAqbikKPiA+Pj4gIHsKPiA+
Pj4gICAgICAgd2hpbGUgKCgqbmwpICE9IE5VTEwpIHsKPiA+Pj4gICAgICAgICAgICAgICBpZiAo
dW5saWtlbHkoKCpubCkgPT0gbikpIHsKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgIFdBUk4o
MSwgImRvdWJsZSByZWdpc3RlciBkZXRlY3RlZCIpOwo+ID4+PiAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIDA7Cj4gPj4+ICAgICAgICAgICAgICAgfQo+ID4+PiAtICAgICAgICAgICAgIGlm
IChuLT5wcmlvcml0eSA+ICgqbmwpLT5wcmlvcml0eSkKPiA+Pj4gKyAgICAgICAgICAgICBpZiAo
bi0+cHJpb3JpdHkgPj0gKCpubCktPnByaW9yaXR5KQo+ID4+PiAgICAgICAgICAgICAgICAgICAg
ICAgYnJlYWs7Cj4gPj4+ICAgICAgICAgICAgICAgbmwgPSAmKCgqbmwpLT5uZXh0KTsKPiA+Pj4g
ICAgICAgfQo+ID4+PiAgICAgICBuLT5uZXh0ID0gKm5sOwo+ID4+PiAgICAgICByY3VfYXNzaWdu
X3BvaW50ZXIoKm5sLCBuKTsKPiA+Pj4gICAgICAgcmV0dXJuIDA7Cj4gPj4+ICB9Cj4gPj4+Cj4g
Pj4+IFRoZW4gdGhlIGNoZWNrIGZvciB1bmlxdWVuZXNzIGFmdGVyIGFkZGluZyB3b3VsZCBiZToK
PiA+Pj4KPiA+Pj4gIFdBUk4obmItPm5leHQgJiYgbmItPnByaW9yaXR5ID09IG5iLT5uZXh0LT5w
cmlvcml0eSk7Cj4gPj4KPiA+PiBXZSBjYW4ndCBqdXN0IGNoYW5nZSB0aGUgcmVnaXN0cmF0aW9u
IG9yZGVyIGJlY2F1c2UgaW52b2NhdGlvbiBvcmRlciBvZgo+ID4+IHRoZSBjYWxsIGNoYWluIGRl
cGVuZHMgb24gdGhlIHJlZ2lzdHJhdGlvbiBvcmRlcgo+ID4KPiA+IEl0IGRvZXNuJ3QgaWYgdW5p
cXVlIHByaW9yaXRpZXMgYXJlIHJlcXVpcmVkIGFuZCBpc24ndCB0aGF0IHdoYXQgeW91IHdhbnQ/
Cj4gPgo+ID4+IGFuZCBzb21lIG9mIGN1cnJlbnQKPiA+PiB1c2VycyBtYXkgcmVseSBvbiB0aGF0
IG9yZGVyLiBJJ20gcHJldHR5IHN1cmUgdGhhdCBjaGFuZ2luZyB0aGUgb3JkZXIKPiA+PiB3aWxs
IGhhdmUgdW5mb3J0dW5hdGUgY29uc2VxdWVuY2VzLgo+ID4KPiA+IFdlbGwsIHRoZSBXQVJOKCkg
ZG9lc24ndCBoZWxwIG11Y2ggdGhlbi4KPiA+Cj4gPiBFaXRoZXIgeW91IGNhbiBtYWtlIGFsbCBv
ZiB0aGUgdXNlcnMgcmVnaXN0ZXIgd2l0aCB1bmlxdWUgcHJpb3JpdGllcywKPiA+IGFuZCB0aGVu
IHlvdSBjYW4gbWFrZSB0aGUgcmVnaXN0cmF0aW9uIHJlamVjdCBub24tdW5pcXVlIG9uZXMsIG9y
IHlvdQo+ID4gY2Fubm90IGFzc3VtZSB0aGVtIHRvIGJlIHVuaXF1ZS4KPgo+IFRoZXJlIGlzIG5v
IHN0cm9uZyByZXF1aXJlbWVudCBmb3IgcHJpb3JpdGllcyB0byBiZSB1bmlxdWUsIHRoZSByZWJv
b3QuYwo+IGNvZGUgd2lsbCB3b3JrIHByb3Blcmx5LgoKSW4gd2hpY2ggY2FzZSBhZGRpbmcgdGhl
IFdBUk4oKSBpcyBub3QgYXBwcm9wcmlhdGUgSU1WLgoKQWxzbyBJJ3ZlIGxvb2tlZCBhdCB0aGUg
ZXhpc3RpbmcgY29kZSBhbmQgYXQgbGVhc3QgaW4gc29tZSBjYXNlcyB0aGUKb3JkZXIgaW4gd2hp
Y2ggdGhlIG5vdGlmaWVycyBydW4gZG9lc24ndCBtYXR0ZXIuICBJJ20gbm90IHN1cmUgd2hhdAp0
aGUgcHVycG9zZSBvZiB0aGlzIHBhdGNoIGlzIFRCSC4KCj4gVGhlIHBvdGVudGlhbCBwcm9ibGVt
IGlzIG9uIHRoZSB1c2VyJ3Mgc2lkZSBhbmQgdGhlIHdhcm5pbmcgaXMgaW50ZW5kZWQKPiB0byBh
aWQgdGhlIHVzZXIuCgpVbmxlc3Mgc29tZWJvZHkgaGFzIHRoZSBwYW5pY19vbl93YXJuIG1lbnRp
b25lZCBwcmV2aW91c2x5IHNldCBhbmQKcmVhbGx5IHRoZSB1c2VyIG5lZWQgbm90IHVuZGVyc3Rh
bmQgd2hhdCB0aGUgV0FSTigpIGlzIGFib3V0LiAgSU9XLApXQVJOKCkgaGVscHMgZGV2ZWxvcGVy
cywgbm90IHVzZXJzLgoKPiBXZSBjYW4gbWFrZSBpdCBhIHN0cm9uZyByZXF1aXJlbWVudCwgYnV0
IG9ubHkgYWZ0ZXIgY29udmVydGluZyBhbmQKPiB0ZXN0aW5nIGFsbCBrZXJuZWwgZHJpdmVycy4K
ClJpZ2h0LgoKPiBJJ2xsIGNvbnNpZGVyIHRvIGFkZCBwYXRjaGVzIGZvciB0aGF0LgoKQnV0IGNh
biB5b3UgYXZvaWQgYWRkaW5nIG1vcmUgcGF0Y2hlcyB0byB0aGlzIHNlcmllcz8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
