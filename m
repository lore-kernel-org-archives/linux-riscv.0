Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AD1C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 07:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HDQWWWWRO1ATqhf7NzxyiDZiM2M0XTBWZVFFochhCSo=; b=q6GMJIBWGeIFpJ
	IY/f4VYllxbhHZJedg/ey2wzI0XEDeNh7G/b42M1JSnoG5u8zvKocgbj+ocQFy970ctwZYZVw65T4
	4PlbM+5FncTFTO7I04yBze55CFj2n4wU7yRBBbFs9EFBmfY99SHFGu1CRq/hWHZ2II6UmOmp1X6AJ
	dCTm8naPCTyj73ugGAHgkoj2TnQOvHpF17NexU4dE32tSWicVbFsPYaeSvKIhtnNwqr756Sjoj8mG
	nAHf34aW+AUSxB+gcutrk4q3H5J4CSlV6+llcYLrpEat48hOUTuqofgxbhK+sSEN+x6vbtQwCqouD
	pZWsLZY5vj9Z+xQkw0tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4dov-0010MR-IT; Fri, 24 Jun 2022 07:33:37 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4dor-0010KG-Qc
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 07:33:35 +0000
Received: by mail-qk1-x733.google.com with SMTP id p21so1335216qki.7
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jun 2022 00:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fR6uKfBDYRieZiuAMXFfm7AitfVVlF5V4Jud/klMDd0=;
        b=rBsMrbkOvHn2lXCYMQP3Wze/vl2AJoykTr0v0omTH75CKCTzEQINNWWBGN+2N94qPS
         lboLFvCO1H+csqUpI/DfYbOIdCZvQUM8nC8x7eTXRmW3+3KC9ArjftWj3gY2Ld/RZTVA
         8BKqI8dnZPVNp1VInit08K9O92G56LBkXs3gevqoY2NKwxuf8WbjkGx2xsu0J1gqJa+S
         aybJWcWeYQ4qCjVsldNl2BDAnCq+rnwJmWZP1Wdme5lOG0KHw9H33siUdxHRs+jwk1I7
         pNwBXN5qGg7TBo4g5SXSxJmyLzOKtRfWUslXzvkOIgLfruSt2u1vor59m0ld+bBr9ZaV
         EZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fR6uKfBDYRieZiuAMXFfm7AitfVVlF5V4Jud/klMDd0=;
        b=rGHF0gwas7x96K/0qoIA/ZVHnww+UEFfxoBsRXubH4ysrTvIK5kEqYDvcVyKe9LGgF
         sglV82uoNV7mTAzRkQ7gwQ7tbpL8A6Qeg3ppzGtrMSE/QlBFhsYyR1KHZDohHgmGqw+T
         Gfiu73Jw86o/AGP9F5JyMafmWAyUZg/iwqHfUTp/lAT07zTg3wRZ5D05H/nuLe+AQHv8
         SGdLvYDx8GhD2QFAyR0C3z2p6djECR0AdRfRciGR49QcwA0PdXsti+hLAC+ejbtO0wG/
         AnRoEvciKK+OM9CWGF0uGS8uPLnbaVB2ixLVkSxZ8xUG5A78js0k3ah7VpH3Kl3Q7Jxw
         kKeA==
X-Gm-Message-State: AJIora90J5aYUKU0qdINvUK+E/vRR0Mi/B7jgE0zQ0EM8bE38f+pWvST
	aN5QC6I0AV2/oi0KiuiF2ygCMiJMFg3mvKcfzNgh4Q==
X-Google-Smtp-Source: AGRyM1vW1GrBPEbbxDBjM3RFXMgO6JY9qkykLiXUWcYVbtoEe0fi2Nqvgwk1vmP6EaWE+FZAKs3xUig5WBYfQruzVC0=
X-Received: by 2002:a05:620a:4591:b0:6a7:5a82:3d2d with SMTP id
 bp17-20020a05620a459100b006a75a823d2dmr9266728qkb.694.1656056006349; Fri, 24
 Jun 2022 00:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220623152948.1607295-1-christoph.muellner@vrull.eu> <1903087.PYKUYFuaPT@diego>
In-Reply-To: <1903087.PYKUYFuaPT@diego>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Fri, 24 Jun 2022 09:33:15 +0200
Message-ID: <CAEg0e7g2jfT1X0pMo8oNaaeQ5B6d=qJe-YK0r8vrDzbFYE_ARQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2] riscv: Add Zawrs support for spinlocks
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	Aaron Durbin <adurbin@rivosinc.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_003333_902172_ADE98802 
X-CRM114-Status: GOOD (  35.71  )
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

T24gVGh1LCBKdW4gMjMsIDIwMjIgYXQgNjozMiBQTSBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250
ZWNoLmRlPiB3cm90ZToKPgo+IEhpIENocmlzdG9waCwKPgo+IEFtIERvbm5lcnN0YWcsIDIzLiBK
dW5pIDIwMjIsIDE3OjI5OjQ4IENFU1Qgc2NocmllYiBDaHJpc3RvcGggTXVlbGxuZXI6Cj4gPiBG
cm9tOiBDaHJpc3RvcGggTcO8bGxuZXIgPGNocmlzdG9waC5tdWVsbG5lckB2cnVsbC5ldT4KPiA+
Cj4gPiBUaGUgY3VycmVudCBSSVNDLVYgY29kZSB1c2VzIHRoZSBnZW5lcmljIHRpY2tldCBsb2Nr
IGltcGxlbWVudGF0aW9uLAo+ID4gdGhhdCBjYWxscyB0aGUgbWFjcm9zIHNtcF9jb25kX2xvYWRf
cmVsYXhlZCgpIGFuZCBzbXBfY29uZF9sb2FkX2FjcXVpcmUoKS4KPiA+IEN1cnJlbnRseSwgUklT
Qy1WIHVzZXMgdGhlIGdlbmVyaWMgaW1wbGVtZW50YXRpb24gb2YgdGhlc2UgbWFjcm9zLgo+ID4g
VGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgUklTQy1WIHNwZWNpZmljIGltcGxlbWVudGF0aW9uLCBv
ZiB0aGVzZQo+ID4gbWFjcm9zLCB0aGF0IHBlZWxzIG9mZiB0aGUgZmlyc3QgbG9vcCBpdGVyYXRp
b24gYW5kIG1vZGlmaWVzIHRoZSB3YWl0aW5nCj4gPiBsb29wIHN1Y2gsIHRoYXQgaXQgaXMgcG9z
c2libGUgdG8gdXNlIHRoZSBXUlMuU1RPIGluc3RydWN0aW9uIG9mIHRoZSBaYXdycwo+ID4gSVNB
IGV4dGVuc2lvbiB0byBzdGFsbCB0aGUgQ1BVLgo+ID4KPiA+IFRoZSByZXN1bHRpbmcgaW1wbGVt
ZW50YXRpb24gb2Ygc21wX2NvbmRfbG9hZF8qKCkgd2lsbCBvbmx5IHdvcmsgZm9yCj4gPiAzMi1i
aXQgb3IgNjQtYml0IHR5cGVzIGZvciBSVjY0IGFuZCAzMi1iaXQgdHlwZXMgZm9yIFJWMzIuCj4g
PiBUaGlzIGlzIGNhdXNlZCBieSB0aGUgcmVzdHJpY3Rpb25zIG9mIHRoZSBMUiBpbnN0cnVjdGlv
biAoUklTQy1WIG9ubHkKPiA+IGhhcyBMUi5XIGFuZCBMUi5EKS4gQ29tcGlsZXIgYXNzZXJ0aW9u
cyBndWFyZCB0aGlzIG5ldyByZXN0cmljdGlvbi4KPiA+Cj4gPiBUaGlzIHBhdGNoIHVzZXMgdGhl
IGV4aXN0aW5nIFJJU0MtViBJU0EgZXh0ZW5zaW9uIGZyYW1ld29yawo+ID4gdG8gZGV0ZWN0IHRo
ZSBwcmVzZW50cyBvZiBaYXdycyBhdCBydW4tdGltZS4KPiA+IElmIGF2YWlsYWJsZSBhIE5PUCBp
bnN0cnVjdGlvbiB3aWxsIGJlIHJlcGxhY2VkIGJ5IFdSUy5OVE8gb3IgV1JTLlNUTy4KPiA+Cj4g
PiBUaGUgd2hvbGUgbWVjaGFuaXNtIGlzIGdhdGVkIGJ5IEtjb25maWcgc2V0dGluZywgd2hpY2gg
ZGVmYXVsdHMgdG8gWS4KPiA+Cj4gPiBUaGUgWmF3cnMgc3BlY2lmaWNhdGlvbiBjYW4gYmUgZm91
bmQgaGVyZToKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi16YXdycy9ibG9iL21h
aW4vemF3cnMuYWRvYwo+ID4KPiA+IE5vdGUsIHRoYXQgdGhlIFphd3JzIGV4dGVuc2lvbiBpcyBu
b3QgZnJvemVuIG9yIHJhdGlmaWVkIHlldC4KPiA+IFRoZXJlZm9yZSB0aGlzIHBhdGNoIGlzIGFu
IFJGQyBhbmQgbm90IGludGVuZGVkIHRvIGdldCBtZXJnZWQuCj4gPgo+ID4gQ2hhbmdlcyBzaW5j
ZSB2MToKPiA+ICogQWRkaW5nICJkZXBlbmRzIG9uICFYSVBfS0VSTkVMIiB0byBSSVNDVl9JU0Ff
WkFXUlMKPiA+ICogRml4aW5nIHR5cGUgY2hlY2tpbmcgY29kZSBpbiBfX3NtcF9sb2FkX3Jlc2Vy
dmVkKgo+ID4gKiBBZGp1c3RtZW50cyBhY2NvcmRpbmcgdG8gdGhlIHNwZWNpZmljYXRpb24gY2hh
bmdlCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgu
bXVlbGxuZXJAdnJ1bGwuZXU+Cj4KPiBXaXRoIHRoZSBtYXRjaGluZyBRZW11LVBhdGNoIG9uCj4g
LSBydjY0ICsgRGViaWFuIHJvb3Rmcwo+IC0gcnYzMiArIDMyYml0LUJ1aWxkcm9vdCByb290ZnMK
Pgo+IFRlc3RlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPgo+IGFwYXJ0
IGZyb20gdGhlIG9uZSBuaXQgYmVsb3cKPiBSZXZpZXdlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhl
aWtvQHNudGVjaC5kZT4KPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAg
ICAgICAgICAgIHwgMTEgKysrKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYmFycmllci5o
ICAgICB8IDkyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2VycmF0YV9saXN0LmggfCAxOSArKysrKy0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2h3Y2FwLmggICAgICAgfCAgMyArLQo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdS5j
ICAgICAgICAgICAgICB8ICAxICsKPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMg
ICAgICAgfCAxMyArKysrCj4gPiAgNiBmaWxlcyBjaGFuZ2VkLCAxMzYgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIv
YXJjaC9yaXNjdi9LY29uZmlnCj4gPiBpbmRleCAzMmZmZWY5ZjZlNWIuLjlkNDA1NjkyMzdjOSAx
MDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gKysrIGIvYXJjaC9yaXNjdi9L
Y29uZmlnCj4gPiBAQCAtMzU4LDYgKzM1OCwxNyBAQCBjb25maWcgUklTQ1ZfSVNBX0MKPiA+Cj4g
PiAgICAgICAgICBJZiB5b3UgZG9uJ3Qga25vdyB3aGF0IHRvIGRvIGhlcmUsIHNheSBZLgo+ID4K
PiA+ICtjb25maWcgUklTQ1ZfSVNBX1pBV1JTCj4gPiArICAgICBib29sICJaYXdycyBleHRlbnNp
b24gc3VwcG9ydCIKPiA+ICsgICAgIGRlcGVuZHMgb24gIVhJUF9LRVJORUwKPiA+ICsgICAgIHNl
bGVjdCBSSVNDVl9BTFRFUk5BVElWRQo+ID4gKyAgICAgZGVmYXVsdCB5Cj4gPiArICAgICBoZWxw
Cj4gPiArICAgICAgICBBZGRzIHN1cHBvcnQgdG8gZHluYW1pY2FsbHkgZGV0ZWN0IHRoZSBwcmVz
ZW5jZSBvZiB0aGUgWmF3cnMgZXh0ZW5zaW9uCj4gPiArICAgICAgICAod2FpdCBmb3IgcmVzZXJ2
YXRpb24gc2V0KSBhbmQgZW5hYmxlIGl0cyB1c2FnZS4KPiA+ICsKPiA+ICsgICAgICAgIElmIHlv
dSBkb24ndCBrbm93IHdoYXQgdG8gZG8gaGVyZSwgc2F5IFkuCj4gPiArCj4gPiAgY29uZmlnIFJJ
U0NWX0lTQV9TVlBCTVQKPiA+ICAgICAgIGJvb2wgIlNWUEJNVCBleHRlbnNpb24gc3VwcG9ydCIK
PiA+ICAgICAgIGRlcGVuZHMgb24gNjRCSVQgJiYgTU1VCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9iYXJyaWVyLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2JhcnJp
ZXIuaAo+ID4gaW5kZXggZDBlMjRhYWEyYWEwLi4xZjk2MjhhYWE3Y2IgMTAwNjQ0Cj4gPiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2JhcnJpZXIuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9iYXJyaWVyLmgKPiA+IEBAIC0xMiw2ICsxMiw4IEBACj4gPgo+ID4gICNpZm5k
ZWYgX19BU1NFTUJMWV9fCj4gPgo+ID4gKyNpbmNsdWRlIDxhc20vZXJyYXRhX2xpc3QuaD4KPiA+
ICsKPiA+ICAjZGVmaW5lIG5vcCgpICAgICAgICAgICAgICAgIF9fYXNtX18gX192b2xhdGlsZV9f
ICgibm9wIikKPiA+Cj4gPiAgI2RlZmluZSBSSVNDVl9GRU5DRShwLCBzKSBcCj4gPiBAQCAtNDIs
NiArNDQsNjQgQEAgZG8geyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gICAgICAgX19fcDE7ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICB9
KQo+ID4KPiA+ICsjaWYgX19yaXNjdl94bGVuID09IDY0Cj4gPiArCj4KPiBuaXQ6IEkgZ3Vlc3Mg
d2UgY291bGQgZG8gd2l0aG91dCB0aGUgZXh0cmEgYmxhbmtzPwo+IGFzbS5oIGRvZXMgc28sIGFu
ZCBhbHNvIHRoZSAjZWxzZSBibG9jayBiZWxvdyBhbHNvIGRvZXNuJ3QKPiB1c2UgdGhlbSA7LSkg
LiBCdXQgSSBndWVzcyB0aGF0IGlzIG1vcmUgYSBzdHlsZSBkZWJhdGUKCk9rLCB3aWxsIHJlbW92
ZSB0aGUgZW1wdHkgbGluZXMgaW4gYSBuZXcgcmV2aXNpb24uCgpUaGFua3MhCgoKPgo+ID4gKyNk
ZWZpbmUgX19yaXNjdl9scnNjX3dvcmQodCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiA+ICsgICAgIChzaXplb2YodCkgPT0gc2l6ZW9mKGludCkgfHwgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgc2l6ZW9mKHQpID09IHNp
emVvZihsb25nKSkKPiA+ICsKPiA+ICsjZWxpZiBfX3Jpc2N2X3hsZW4gPT0gMzIKPiA+ICsKPiA+
ICsjZGVmaW5lIF9fcmlzY3ZfbHJzY193b3JkKHQpICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gPiArICAgICAoc2l6ZW9mKHQpID09IHNpemVvZihpbnQpKQo+ID4g
Kwo+ID4gKyNlbHNlCj4gPiArI2Vycm9yICJVbmV4cGVjdGVkIF9fcmlzY3ZfeGxlbiIKPiA+ICsj
ZW5kaWYgLyogX19yaXNjdl94bGVuICovCj4KPiBbLi4uXQo+Cj4gVGhhbmtzCj4gSGVpa28KPgo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
