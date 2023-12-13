Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649A6C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 15:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CpcP7YtPMwQL0NvC5eJOTuXiKacAmIe88NQ1QpPzAXU=; b=plYTcpsf0op9Mi
	Yw4AuhWOiK0EIPMGIxWjLNRic/4UYBMJDnjkuUV6rGrjZOjjRjybdvx/lgrhACPYkLozq4baDZLbn
	WBKwbHAIJdRtPFmWSgn+lMOXnR3ksimWniOYByQrdsmoLlaz00Nr2rFbzIGJHq4cIrjWudqGimfdO
	d+ZNWF/oJFpOe+7+RnpKbr5QFIb4CNW7Aeti5IgtNL2ujxMdLvlLhB9lz7NVq0ith/bWQqNziPLt+
	IEOpis8Rf/jKCr6rGi9vVymixieCWLpyWG+1ii+Dluae07F9teNoq7AUUWHMdfDfLMEkqA1nkzZFf
	nSUIC1jG6TDPvCFhIjmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDRRf-00FK9Z-2w;
	Wed, 13 Dec 2023 15:46:47 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDRRa-00FK5z-1m;
	Wed, 13 Dec 2023 15:46:45 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 3BDFis7u072509;
	Wed, 13 Dec 2023 23:44:54 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Wed, 13 Dec 2023 23:44:53 +0800
Date: Wed, 13 Dec 2023 23:44:49 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v5 03/16] irqchip/riscv-intc: Introduce Andes hart-level
 interrupt controller
Message-ID: <ZXnRcfuvQBo6UDCx@APC323>
References: <20231213070301.1684751-1-peterlin@andestech.com>
 <20231213070301.1684751-4-peterlin@andestech.com>
 <CAK9=C2WC2i7XkjDgbjccVn03BYfnE_YS4YiA6ZWMj6GDyTjJKA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2WC2i7XkjDgbjccVn03BYfnE_YS4YiA6ZWMj6GDyTjJKA@mail.gmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3BDFis7u072509
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_074643_056553_7BC3ECEE 
X-CRM114-Status: GOOD (  26.24  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, jszhang@kernel.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBEZWMgMTMsIDIwMjMgYXQgMDg6MTU6MjhQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBXZWQsIERlYyAxMywgMjAyMyBhdCAxMjozNeKAr1BNIFl1IENoaWVuIFBldGVyIExp
bgo+IDxwZXRlcmxpbkBhbmRlc3RlY2guY29tPiB3cm90ZToKPiA+Cj4gPiBBZGQgc3VwcG9ydCBm
b3IgdGhlIEFuZGVzIGhhcnQtbGV2ZWwgaW50ZXJydXB0IGNvbnRyb2xsZXIuIFRoaXMKPiA+IGNv
bnRyb2xsZXIgcHJvdmlkZXMgaW50ZXJydXB0IG1hc2svdW5tYXNrIGZ1bmN0aW9ucyB0byBhY2Nl
c3MgdGhlCj4gPiBjdXN0b20gcmVnaXN0ZXIgKFNMSUUpIHdoZXJlIHRoZSBub24tc3RhbmRhcmQg
Uy1tb2RlIGxvY2FsIGludGVycnVwdAo+ID4gZW5hYmxlIGJpdHMgYXJlIGxvY2F0ZWQuCj4gPgo+
ID4gVG8gc2hhcmUgdGhlIHJpc2N2X2ludGNfZG9tYWluX21hcCgpIHdpdGggdGhlIGdlbmVyaWMg
UklTQy1WIElOVEMgYW5kCj4gPiBBQ1BJLCBhZGQgYSBjaGlwIHBhcmFtZXRlciB0byByaXNjdl9p
bnRjX2luaXRfY29tbW9uKCksIHNvIGl0IGNhbiBiZQo+ID4gcGFzc2VkIHRvIHRoZSBpcnFfZG9t
YWluX3NldF9pbmZvKCkgYXMgcHJpdmF0ZSBkYXRhLgo+ID4KPiA+IEFuZGVzIGhhcnQtbGV2ZWwg
aW50ZXJydXB0IGNvbnRyb2xsZXIgcmVxdWlyZXMgdGhlICJhbmRlc3RlY2gsY3B1LWludGMiCj4g
PiBjb21wYXRpYmxlIHN0cmluZyB0byBiZSBwcmVzZW50IGluIGludGVycnVwdC1jb250cm9sbGVy
IG9mIGNwdSBub2RlLgo+ID4gZS5nLiwKPiA+Cj4gPiAgIGNwdTA6IGNwdUAwIHsKPiA+ICAgICAg
IGNvbXBhdGlibGUgPSAiYW5kZXN0ZWNoLGF4NDVtcCIsICJyaXNjdiI7Cj4gPiAgICAgICAuLi4K
PiA+ICAgICAgIGNwdTAtaW50YzogaW50ZXJydXB0LWNvbnRyb2xsZXIgewo+ID4gICAgICAgICAg
ICNpbnRlcnJ1cHQtY2VsbHMgPSA8MHgwMT47Cj4gPiAgICAgICAgICAgY29tcGF0aWJsZSA9ICJh
bmRlc3RlY2gsY3B1LWludGMiLCAicmlzY3YsY3B1LWludGMiOwo+ID4gICAgICAgICAgIGludGVy
cnVwdC1jb250cm9sbGVyOwo+ID4gICAgICAgfTsKPiA+ICAgfTsKPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBZdSBDaGllbiBQZXRlciBMaW4gPHBldGVybGluQGFuZGVzdGVjaC5jb20+Cj4gPiBSZXZp
ZXdlZC1ieTogQ2hhcmxlcyBDaS1KeXVuIFd1IDxkbWludXNAYW5kZXN0ZWNoLmNvbT4KPiA+IFJl
dmlld2VkLWJ5OiBMZW8gWXUtQ2hpIExpYW5nIDx5Y2xpYW5nQGFuZGVzdGVjaC5jb20+Cj4gPiAt
LS0KPiA+IENoYW5nZXMgdjEgLT4gdjI6Cj4gPiAgIC0gTmV3IHBhdGNoCj4gPiBDaGFuZ2VzIHYy
IC0+IHYzOgo+ID4gICAtIFJldHVybiAtRU5YSU8gaWYgbm8gdmFsaWQgY29tcGF0aWJsZSBJTlRD
IGZvdW5kCj4gPiAgIC0gQWxsb3cgZmFsbGluZyBiYWNrIHRvIGdlbmVyaWMgUklTQy1WIElOVEMK
PiA+IENoYW5nZXMgdjMgLT4gdjQ6IChTdWdnZXN0ZWQgYnkgVGhvbWFzIFsxXSkKPiA+ICAgLSBB
ZGQgY29tbWVudCB0byBhbmRlcyBpcnEgY2hpcCBmdW5jdGlvbgo+ID4gICAtIFJlZmluZSBjb2Rl
IGZsb3cgdG8gc2hhcmUgd2l0aCBnZW5lcmljIFJJU0MtViBJTlRDIGFuZCBBQ1BJCj4gPiAgIC0g
TW92ZSBBbmRlcyBzcGVjaWZpYyBkZWZpbml0aW9ucyB0byBpbmNsdWRlL2xpbnV4L3NvYy9hbmRl
cy9pcnEuaAo+ID4gQ2hhbmdlcyB2NCAtPiB2NTogKFN1Z2dlc3RlZCBieSBUaG9tYXMpCj4gPiAg
IC0gRml4IGNvbW1pdCBtZXNzYWdlCj4gPiAgIC0gU3VidHJhY3QgQU5ERVNfU0xJX0NBVVNFX0JB
U0UgZnJvbSBkLT5od2lycSB0byBjYWxjdWxhdGUgdGhlIHZhbHVlIG9mIG1hc2sKPiA+ICAgLSBE
byBub3Qgc2V0IGNoaXBfZGF0YSB0byB0aGUgY2hpcCBpdHNlbGYgd2l0aCBpcnFfZG9tYWluX3Nl
dF9pbmZvKCkKPiA+ICAgLSBGb2xsb3cgcmV2ZXJzZSBmaXIgdHJlZSBvcmRlciB2YXJpYWJsZSBk
ZWNsYXJhdGlvbnMKPiA+Cj4gPiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9q
ZWN0L2xpbnV4LXJpc2N2L3BhdGNoLzIwMjMxMDE5MTM1NzIzLjM2NTcxNTYtMS1wZXRlcmxpbkBh
bmRlc3RlY2guY29tLwo+ID4gLS0tCj4gPiAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRj
LmMgfCA1MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQo+ID4gIGluY2x1ZGUvbGlu
dXgvc29jL2FuZGVzL2lycS5oICAgIHwgMTcgKysrKysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdl
ZCwgNjQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgaW5jbHVkZS9saW51eC9zb2MvYW5kZXMvaXJxLmgKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2
LWludGMuYwo+ID4gaW5kZXggMmZkZDQwZjJhNzkxLi4wYjZiZjNmYjFkYmEgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYwo+ID4gKysrIGIvZHJpdmVycy9p
cnFjaGlwL2lycS1yaXNjdi1pbnRjLmMKPiA+IEBAIC0xNyw2ICsxNyw3IEBACj4gPiAgI2luY2x1
ZGUgPGxpbnV4L21vZHVsZS5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9vZi5oPgo+ID4gICNpbmNs
dWRlIDxsaW51eC9zbXAuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvc29jL2FuZGVzL2lycS5oPgo+
ID4KPiA+ICBzdGF0aWMgc3RydWN0IGlycV9kb21haW4gKmludGNfZG9tYWluOwo+ID4KPiA+IEBA
IC00Niw2ICs0NywzMSBAQCBzdGF0aWMgdm9pZCByaXNjdl9pbnRjX2lycV91bm1hc2soc3RydWN0
IGlycV9kYXRhICpkKQo+ID4gICAgICAgICBjc3Jfc2V0KENTUl9JRSwgQklUKGQtPmh3aXJxKSk7
Cj4gPiAgfQo+ID4KPiA+ICtzdGF0aWMgdm9pZCBhbmRlc19pbnRjX2lycV9tYXNrKHN0cnVjdCBp
cnFfZGF0YSAqZCkKPiA+ICt7Cj4gPiArICAgICAgIC8qCj4gPiArICAgICAgICAqIEFuZGVzIHNw
ZWNpZmljIFMtbW9kZSBsb2NhbCBpbnRlcnJ1cHQgY2F1c2VzIChod2lycSkKPiA+ICsgICAgICAg
ICogYXJlIGRlZmluZWQgYXMgKDI1NiArIG4pIGFuZCBjb250cm9sbGVkIGJ5IG4tdGggYml0Cj4g
PiArICAgICAgICAqIG9mIFNMSUUuCj4gPiArICAgICAgICAqLwo+ID4gKyAgICAgICB1bnNpZ25l
ZCBpbnQgbWFzayA9IEJJVChkLT5od2lycSAtIEFOREVTX1NMSV9DQVVTRV9CQVNFKTsKPiA+ICsK
PiA+ICsgICAgICAgaWYgKGQtPmh3aXJxIDwgQU5ERVNfU0xJX0NBVVNFX0JBU0UpCj4gPiArICAg
ICAgICAgICAgICAgY3NyX2NsZWFyKENTUl9JRSwgbWFzayk7Cj4gPiArICAgICAgIGVsc2UKPiA+
ICsgICAgICAgICAgICAgICBjc3JfY2xlYXIoQU5ERVNfQ1NSX1NMSUUsIG1hc2spOwo+ID4gK30K
PiA+ICsKPiA+ICtzdGF0aWMgdm9pZCBhbmRlc19pbnRjX2lycV91bm1hc2soc3RydWN0IGlycV9k
YXRhICpkKQo+ID4gK3sKPiA+ICsgICAgICAgdW5zaWduZWQgaW50IG1hc2sgPSBCSVQoZC0+aHdp
cnEgLSBBTkRFU19TTElfQ0FVU0VfQkFTRSk7Cj4gPiArCj4gPiArICAgICAgIGlmIChkLT5od2ly
cSA8IEFOREVTX1NMSV9DQVVTRV9CQVNFKQo+ID4gKyAgICAgICAgICAgICAgIGNzcl9zZXQoQ1NS
X0lFLCBtYXNrKTsKPiA+ICsgICAgICAgZWxzZQo+ID4gKyAgICAgICAgICAgICAgIGNzcl9zZXQo
QU5ERVNfQ1NSX1NMSUUsIG1hc2spOwo+IAo+IENsZWFybHksIEFuZGVzIGRvZXMgbm90IGhhdmUg
YW55IENTUiBmb3I6Cj4gWExFTiA8PSBsb2NhbCBpbnRlcnJ1cHQgPEFOREVTX1NMSV9DQVVTRV9C
QVNFCj4gYW5kCj4gQU5ERVNfU0xJX0NBVVNFX0JBU0UgKyBYTEVOIDw9IGxvY2FsIGludGVycnVw
dAoKQWgsIHdoYXQgYW0gSSBkb2luZyBoZXJlLgpzb3JyeSBmb3IgdGhhdCBzaWxseSBwYXRjaC4K
ClJlZ2FyZHMsClBldGVyIExpbgoKPiBSZWdhcmRzLAo+IEFudXAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
