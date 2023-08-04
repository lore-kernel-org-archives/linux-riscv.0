Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92ECFC00528
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 09:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SUeeJb41/rjNkOtQ4OHcBcfHuoP4FIoPGVfL11eNg1s=; b=Vst66bUVP1cT/4
	MJ8uA/DzoTyCY4BTFzL3kaa9sOJNxYNkMsiYTH2TDvF4pEjmwLHdDwZ8WcwHY2Yi4T8T1UUn/xSwf
	4HX/jc+PKfF8nQ/gn/VtS71j2WUm1oxc4h6kRxPUEa9QpKn6hsLDNsqBGbQnjijFs32lYgun1e5Sn
	MSoxILc3nwyt/ze0fAokCGMux3QhEGhlynUjQp7zDG16pANy1CCSW4tDQ3kTeKbxUPd6AQZ3dX+wI
	dGSoXT1XpRLR7KMQLeD0Q86ybCvoJopQPGVATMjYIQPyDXIyuRobiQWSPK11nQLleu4LKlW4zWvsn
	5lg4u4Fb8WTjzvK+L9fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRrVL-00C40z-0E;
	Fri, 04 Aug 2023 09:53:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRrVI-00C3zl-0Q
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 09:53:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A976F61F89
	for <linux-riscv@lists.infradead.org>; Fri,  4 Aug 2023 09:53:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F124C43395
	for <linux-riscv@lists.infradead.org>; Fri,  4 Aug 2023 09:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691142830;
	bh=lFjC4WLEGW/Lxj/DKzfS0u7bd1MtVnM5jRt8bx/kdNk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=j/VzISMGkKFqczwmYJ4NAmOw3dS0sIOEO0ctYzxw9EQ6Kko8QvOjgIE8opzZOBZbR
	 cX4y+S/JUHzaynL1Q16fkyqqYCTZd9tDFAblMvFU+216yOBP/0Q2EK2PiwXYpse50c
	 RoAlXihP8eWkF0xwhCdnXwZ/U28pTyDnwZ4rbTMKc9N5sPyhdHmYzBI9o1SqwXUdC7
	 zAV0xUK9j42iWztIu+R3CEgGOCx3aCUZb+rPYJPRvV2QAyhjSvzwI72eO7DxWrMwJM
	 kg5zYCCtKaBaaNLGGUIHq9Odtc/K+JgHJv8HRRvvnlgwQRO8p7NZ7DpqJcRfAqT4wD
	 DFJg/1LqDbr7w==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5231f439968so354539a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 02:53:50 -0700 (PDT)
X-Gm-Message-State: AOJu0YysvvUXfZWhx6pZ0hC8FlxDlPqtZZJrRF6VF6CDVPRf5Tra8SSq
	xRwdZI4p4UJ1Me1PFxUNHbNJBJIQ8ZAEGjl/iOg=
X-Google-Smtp-Source: AGHT+IF8AAzraBkBm5B+nYL1Q5LtSEgdlWGk+4YKUvg6xeg0Cs+wG7JxM0ZjqXkqLm7lj5kiuhRQcz1AnJfqJltrKHY=
X-Received: by 2002:aa7:dd14:0:b0:523:10c7:317c with SMTP id
 i20-20020aa7dd14000000b0052310c7317cmr1120233edv.41.1691142828721; Fri, 04
 Aug 2023 02:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230802164701.192791-1-guoren@kernel.org> <20230802164701.192791-8-guoren@kernel.org>
 <20230804-refract-avalanche-9adb6b4b74e9@wendy>
In-Reply-To: <20230804-refract-avalanche-9adb6b4b74e9@wendy>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 4 Aug 2023 17:53:35 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTfLmCe7eDhfPU1qFTBoVZN8oFACEd4NmTyZaAVtdMK-w@mail.gmail.com>
Message-ID: <CAJF2gTTfLmCe7eDhfPU1qFTBoVZN8oFACEd4NmTyZaAVtdMK-w@mail.gmail.com>
Subject: Re: [PATCH V10 07/19] riscv: qspinlock: errata: Introduce ERRATA_THEAD_QSPINLOCK
To: Conor Dooley <conor.dooley@microchip.com>
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org, 
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com, longman@redhat.com, 
	boqun.feng@gmail.com, tglx@linutronix.de, paulmck@kernel.org, 
	rostedt@goodmis.org, rdunlap@infradead.org, catalin.marinas@arm.com, 
	xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, alexghiti@rivosinc.com, 
	keescook@chromium.org, greentime.hu@sifive.com, ajones@ventanamicro.com, 
	jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn, 
	linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-csky@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_025352_253222_EE23B3DE 
X-CRM114-Status: GOOD (  35.44  )
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

T24gRnJpLCBBdWcgNCwgMjAyMyBhdCA1OjA24oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBIZXkgR3VvIFJlbiwKPgo+IE9uIFdlZCwgQXVn
IDAyLCAyMDIzIGF0IDEyOjQ2OjQ5UE0gLTA0MDAsIGd1b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+
ID4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4KPiA+IEFjY29y
ZGluZyB0byBxc3BpbmxvY2sgcmVxdWlyZW1lbnRzLCBSSVNDLVYgZ2l2ZXMgb3V0IGEgd2VhayBM
Ui9TQwo+ID4gZm9yd2FyZCBwcm9ncmVzcyBndWFyYW50ZWUgd2hpY2ggZG9lcyBub3Qgc2F0aXNm
eSBxc3BpbmxvY2suIEJ1dAo+ID4gbWFueSB2ZW5kb3JzIGNvdWxkIHByb2R1Y2Ugc3Ryb25nZXIg
Zm9yd2FyZCBndWFyYW50ZWUgTFIvU0MgdG8KPiA+IGVuc3VyZSB0aGUgeGNoZ190YWlsIGNvdWxk
IGJlIGZpbmlzaGVkIGluIHRpbWUgb24gYW55IGtpbmQgb2YKPiA+IGhhcnQuIFQtSEVBRCBpcyB0
aGUgdmVuZG9yIHdoaWNoIGltcGxlbWVudHMgc3Ryb25nIGZvcndhcmQKPiA+IGd1YXJhbnRlZSBM
Ui9TQyBpbnN0cnVjdGlvbiBwYWlycywgc28gZW5hYmxlIHFzcGlubG9jayBmb3IgVC1IRUFECj4g
PiB3aXRoIGVycmF0YSBoZWxwLgo+ID4KPiA+IFQtSEVBRCBlYXJseSB2ZXJzaW9uIG9mIHByb2Nl
c3NvcnMgaGFzIHRoZSBtZXJnZSBidWZmZXIgZGVsYXkKPiA+IHByb2JsZW0sIHNvIHdlIG5lZWQg
RVJSQVRBX1dSSVRFT05DRSB0byBzdXBwb3J0IHFzcGlubG9jay4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvS2Nv
bmZpZy5lcnJhdGEgICAgICAgICAgICAgIHwgMTMgKysrKysrKysrKysrKwo+ID4gIGFyY2gvcmlz
Y3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jICAgICAgIHwgMjQgKysrKysrKysrKysrKysrKysrKysr
KysrCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oICAgfCAyMCArKysr
KysrKysrKysrKysrKysrKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVuZG9yaWRfbGlz
dC5oIHwgIDMgKystCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgICAg
fCAgMyArKy0KPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZy5lcnJhdGEgYi9h
cmNoL3Jpc2N2L0tjb25maWcuZXJyYXRhCj4gPiBpbmRleCA0NzQ1YTVjNTdlN2MuLmViNDM2Nzdi
MTNjYyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZy5lcnJhdGEKPiA+ICsrKyBi
L2FyY2gvcmlzY3YvS2NvbmZpZy5lcnJhdGEKPiA+IEBAIC05Niw0ICs5NiwxNyBAQCBjb25maWcg
RVJSQVRBX1RIRUFEX1dSSVRFX09OQ0UKPiA+Cj4gPiAgICAgICAgIElmIHlvdSBkb24ndCBrbm93
IHdoYXQgdG8gZG8gaGVyZSwgc2F5ICJZIi4KPiA+Cj4gPiArY29uZmlnIEVSUkFUQV9USEVBRF9R
U1BJTkxPQ0sKPiA+ICsgICAgIGJvb2wgIkFwcGx5IFQtSGVhZCBxdWV1ZWQgc3BpbmxvY2sgZXJy
YXRhIgo+ID4gKyAgICAgZGVwZW5kcyBvbiBFUlJBVEFfVEhFQUQKPiA+ICsgICAgIGRlZmF1bHQg
eQo+ID4gKyAgICAgaGVscAo+ID4gKyAgICAgICBUaGUgVC1IRUFEIEM5eHggcHJvY2Vzc29ycyBp
bXBsZW1lbnQgc3Ryb25nIGZ3ZCBndWFyYW50ZWUgTFIvU0MgdG8KPiA+ICsgICAgICAgbWF0Y2gg
dGhlIHhjaGdfdGFpbCByZXF1aXJlbWVudCBvZiBxc3BpbmxvY2suCj4gPiArCj4gPiArICAgICAg
IFRoaXMgd2lsbCBhcHBseSB0aGUgUVNQSU5MT0NLIGVycmF0YSB0byBoYW5kbGUgdGhlIG5vbi1z
dGFuZGFyZAo+ID4gKyAgICAgICBiZWhhdmlvciB2aWEgdXNpbmcgcXNwaW5sb2NrIGluc3RlYWQg
b2YgdGlja2V0X2xvY2suCj4KPiBXaGF0ZXZlciBhYm91dCB0aGUgYWNjZXB0YWJpbGl0eSBvZiBh
bnl0aGluZyBlbHNlIGluIHRoaXMgc2VyaWVzLAo+IGhhdmluZyBfc3Ryb25nZXJfIGd1YXJhbnRl
ZXMgaXMgbm90IGFuIGVycmF0dW0sIGlzIGl0PyBXZSBzaG91bGQgbm90Cj4gYWJ1c2UgdGhlIGVy
cmF0YSBzdHVmZiBmb3IgdGhpcyBJTU8uCj4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tl
cm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+IGlu
ZGV4IGY4ZGJiZTFiYmQzNC4uZDk2OTRmZTQwYTlhIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0
dXJlLmMKPiA+IEBAIC0zNDIsNyArMzQyLDggQEAgdm9pZCBfX2luaXQgcmlzY3ZfZmlsbF9od2Nh
cCh2b2lkKQo+ID4gICAgICAgICAgICAgICAgKiBzcGlubG9jayB2YWx1ZSwgdGhlIG9ubHkgd2F5
IGlzIHRvIGNoYW5nZSBmcm9tIHF1ZXVlZF9zcGlubG9jayB0bwo+ID4gICAgICAgICAgICAgICAg
KiB0aWNrZXRfc3BpbmxvY2ssIGJ1dCBjYW4gbm90IGJlIHZpY2UuCj4gPiAgICAgICAgICAgICAg
ICAqLwo+ID4gLSAgICAgICAgICAgICBpZiAoIWZvcmNlX3FzcGlubG9jaykgewo+ID4gKyAgICAg
ICAgICAgICBpZiAoIWZvcmNlX3FzcGlubG9jayAmJgo+ID4gKyAgICAgICAgICAgICAgICAgIXJp
c2N2X2hhc19lcnJhdGFfdGhlYWRfcXNwaW5sb2NrKCkpIHsKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICBzZXRfYml0KFJJU0NWX0lTQV9FWFRfWFRJQ0tFVExPQ0ssIGlzYWluZm8tPmlzYSk7Cj4K
PiBJcyB0aGlzIGEgZ2VuZXJpYyB2ZW5kb3IgZXh0ZW5zaW9uIChsb2wgQCB0aGF0IG1pc25vbWVy
KSBvciBpcyBpdCBhbgo+IGVycmF0dW0/IE1ha2UgeW91ciBtaW5kIHVwIHBsZWFzZS4gQXMgaGFz
IGJlZW4gc2FpZCBvbiBvdGhlciBzZXJpZXMsIE5BSwo+IHRvIHVzaW5nIG1hcmNoL3ZlbmRvci9p
bXAgSURzIGZvciBmZWF0dXJlIHByb2JpbmcuClRoZSBSSVNDVl9JU0FfRVhUX1hUSUNLRVRMT0NL
IGlzIGEgZmVhdHVyZSBleHRlbnNpb24gbnVtYmVyLCBhbmQgaXQncwpzZXQgYnkgZGVmYXVsdCBm
b3IgZm9yd2FyZC1jb21wYXRpYmxlLiBXZSBhbHNvIGRlZmluZSBhIHZlbmRvcgpleHRlbnNpb24g
KHJpc2N2X2hhc19lcnJhdGFfdGhlYWRfcXNwaW5sb2NrKSB0byBmb3JjZSBhbGwgb3VyCnByb2Nl
c3NvcnMgdG8gdXNlIHFzcGlubG9jazsgb3RoZXJzIHN0aWxsIHN0YXkgb24gdGlja2V0X2xvY2su
CgpUaGUgb25seSBwb3NzaWJsZSBjaGFuZ2luZyBkaXJlY3Rpb24gaXMgZnJvbSBxc3BpbmxvY2sg
dG8gdGlja2V0X2xvY2sKYmVjYXVzZSB0aWNrZXRfbG9jayB3b3VsZCBkaXJ0eSB0aGUgbG9jayB2
YWx1ZSwgd2hpY2ggcHJldmVudHMKY2hhbmdpbmcgdG8gcXNwaW5sb2NrIG5leHQuIFNvIHN0YXJ0
dXAgd2l0aCBxc3BpbmxvY2sgYW5kIGNoYW5nZSB0bwp0aWNrZXRfbG9jayBiZWZvcmUgc21wIHVw
LiBZb3UgYWxzbyBjb3VsZCB1c2UgY21kbGluZSB0byB0cnkgcXNwaW5sb2NrCihmb3JjZV9xc3Bp
bmxvY2spLgoKPgo+IEkndmUgZ290IHNvbWUgdGhvdWdodHMgb24gb3RoZXIgcGFydHMgb2YgdGhp
cyBzZXJpZXMgdG9vLCBidXQgSSdtIG5vdAo+IGdvaW5nIHRvIHNwZW5kIHRpbWUgb24gaXQgdW5s
ZXNzIHRoZSBsb2NraW5nIHBlb3BsZSBhbmQgUGFsbWVyIGFzY2VudAo+IHRvIHRoaXMgc2VyaWVz
Lgo+Cj4gQ2hlZXJzLAo+IENvbm9yLgoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
