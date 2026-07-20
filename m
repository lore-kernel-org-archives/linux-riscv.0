Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98159C44515
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 17:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+llWHsej/56LVtLE2Zxih/IwfeWZzaWObfnCOacoMms=; b=yEPkG4EfMVFy/8
	xd3z1FnkndJjvPX0lgK2Lyk9kZlym+yM3pZNpYzodoqCYAN0/3yg1RKRj2Kgd+tv1S4tpJHowgoUf
	/oN12NLtDYvggKXYJuou3ZfQc9Bdi2Y/MmKVswKeIbst4pQSo+vm4TO/f3brNE87KQszyPvARfhs0
	hEHX+FcN5Oe9zplCKvFkvBaZUma+/fQ+NajE0gKe6H9zER+kii2k+YnNJEUelBho5ycXykTosBXw/
	Xlch7btkEG8ioMNSLwSx4EF3FbPQu2gWeRxn+KfZGV6bEL9LttkVSL83UEE+6X97WQWDeaglyhiU0
	M3IuEg0RDyi6bqQtz7vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrVK-00000007TxC-0T3n;
	Mon, 20 Jul 2026 17:10:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrVI-00000007Twj-2IQf
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 17:10:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D93060052;
	Mon, 20 Jul 2026 17:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03961F000E9;
	Mon, 20 Jul 2026 17:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784567407;
	bh=BjfOV+NKNZXLs5UViExwi4UTvSENVwLsFID1r6Q/kEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=itoK4Mdjj5ii0LNFWHvWvZeKb1bM5ZWQY2SLjLXjkfO1feztT6Gn6G8NiVOat+KPg
	 0D/NB12mkVZe0Qu8dpRL0oONt2wA5dLQq2HFtDJt5+6MzcZEUaN8ebT6E6dQey+8Bv
	 U67NhgIIVjM0yZ2RgwCjpyBriixC3kOUjNzXDQkdhvIe5nvIncSc+M1s1QCf4Glnzw
	 79N0nsDl390dkbxedNNurbefhulS5jWgAZhH6RiSFZ8JtYiyqnIGyKYLSKviEh1SQL
	 11vzxbZo4cCDnI1BgewLbszrJZvcJRudTbDKrMrm+59/LFG+1WpbrwjdfmaUCqah49
	 bbOMVK1BbfpDw==
Date: Mon, 20 Jul 2026 10:10:05 -0700
From: Drew Fustini <fustini@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Tony Luck <tony.luck@intel.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	x86@kernel.org, devicetree@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [External] [PATCH v5 4/8] riscv_cbqri: Add capacity controller
 probe and allocation device ops
Message-ID: <al5WbTyTVYye70LW@thelio>
References: <20260714-dfustini-atl-sc-cbqri-dt-v5-0-b0ae7e9c932e@kernel.org>
 <20260714-dfustini-atl-sc-cbqri-dt-v5-4-b0ae7e9c932e@kernel.org>
 <CAEEQ3w=kVgMnQ8mu=X+d3xYbANT6dNfv7w71BUwmYxP6qcUhgg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3w=kVgMnQ8mu=X+d3xYbANT6dNfv7w71BUwmYxP6qcUhgg@mail.gmail.com>
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

T24gTW9uLCBKdWwgMjAsIDIwMjYgYXQgMDU6NTY6MjlQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBEcmV3LAo+IAo+IE9uIFdlZCwgSnVsIDE1LCAyMDI2IGF0IDg6MjTigK9BTSBEcmV3
IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gQWRkIHN1cHBvcnQg
Zm9yIHRoZSBSSVNDLVYgQ0JRUkkgY2FwYWNpdHkgY29udHJvbGxlci4gQSBwbGF0Zm9ybSBkcml2
ZXIKPiA+IHBhc3NlcyBhIGNicXJpX2NvbnRyb2xsZXJfaW5mbyBkZXNjcmlwdG9yIHRvZ2V0aGVy
IHdpdGggdGhlIGNhY2hlIGxldmVsCj4gPiB0byByaXNjdl9jYnFyaV9yZWdpc3Rlcl9jY19kdCgp
LCB3aGljaCBwcm9iZXMgdGhlIGNvbnRyb2xsZXIgYW5kIGFkZHMgaXQKPiA+IHRvIHRoZSBjb250
cm9sbGVyIGxpc3QuCj4gPgo+ID4gQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1cy00LTgK
PiA+IENvLWRldmVsb3BlZC1ieTogQWRyaWVuIFJpY2NpYXJkaSA8YXJpY2NpYXJkaUBiYXlsaWJy
ZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBZHJpZW4gUmljY2lhcmRpIDxhcmljY2lhcmRpQGJh
eWxpYnJlLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IERyZXcgRnVzdGluaSA8ZnVzdGluaUBrZXJu
ZWwub3JnPgo+ID4gLS0tCj4gPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgfCAg
IDMgKwo+ID4gIGRyaXZlcnMvcmVzY3RybC9LY29uZmlnICAgICAgICAgIHwgIDEzICsKPiA+ICBk
cml2ZXJzL3Jlc2N0cmwvTWFrZWZpbGUgICAgICAgICB8ICAgMyArCj4gPiAgZHJpdmVycy9yZXNj
dHJsL2NicXJpX2RldmljZXMuYyAgfCA1NjMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCj4gPiAgZHJpdmVycy9yZXNjdHJsL2NicXJpX2ludGVybmFsLmggfCAxMjIgKysr
KysrKysrCj4gPiAgaW5jbHVkZS9saW51eC9yaXNjdl9jYnFyaS5oICAgICAgfCAgNDUgKysrKwo+
ID4gIDYgZmlsZXMgY2hhbmdlZCwgNzQ5IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+ID4gaW5kZXggYTBhNGI0MWYwMmM1Li4wNjRh
NmFlMjgyM2UgMTAwNjQ0Cj4gPiAtLS0gYS9NQUlOVEFJTkVSUwo+ID4gKysrIGIvTUFJTlRBSU5F
UlMKPiA+IEBAIC0yMzM2NSw2ICsyMzM2NSw5IEBAIEw6ICAgICAgbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+ID4gIFM6ICAgICBTdXBwb3J0ZWQKPiA+ICBGOiAgICAgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9xb3MuaAo+ID4gIEY6ICAgICBhcmNoL3Jpc2N2L2tlcm5lbC9xb3MuYwo+
ID4gK0Y6ICAgICBkcml2ZXJzL3Jlc2N0cmwvY2JxcmlfZGV2aWNlcy5jCj4gPiArRjogICAgIGRy
aXZlcnMvcmVzY3RybC9jYnFyaV9pbnRlcm5hbC5oCj4gPiArRjogICAgIGluY2x1ZGUvbGludXgv
cmlzY3ZfY2JxcmkuaAo+ID4KPiA+ICBSSVNDLVYgUlBNSSBBTkQgTVBYWSBEUklWRVJTCj4gPiAg
TTogICAgIFJhaHVsIFBhdGhhayA8cmFodWxAc3VtbWF0aW9ucy5uZXQ+Cj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9yZXNjdHJsL0tjb25maWcgYi9kcml2ZXJzL3Jlc2N0cmwvS2NvbmZpZwo+ID4g
aW5kZXggNjcyYWJlYTNiMDNjLi45MmI5YzgyY2Y5ZjMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L3Jlc2N0cmwvS2NvbmZpZwo+ID4gKysrIGIvZHJpdmVycy9yZXNjdHJsL0tjb25maWcKPiA+IEBA
IC0yOSwzICsyOSwxNiBAQCBjb25maWcgQVJNNjRfTVBBTV9SRVNDVFJMX0ZTCj4gPiAgICAgICAg
IGRlZmF1bHQgeSBpZiBBUk02NF9NUEFNX0RSSVZFUiAmJiBSRVNDVFJMX0ZTCj4gPiAgICAgICAg
IHNlbGVjdCBSRVNDVFJMX1JNSURfREVQRU5EU19PTl9DTE9TSUQKPiA+ICAgICAgICAgc2VsZWN0
IFJFU0NUUkxfQVNTSUdOX0ZJWEVECj4gPiArCj4gPiArbWVudWNvbmZpZyBSSVNDVl9DQlFSSQo+
ID4gKyAgICAgICBib29sICJSSVNDLVYgQ0JRUkkgc3VwcG9ydCIKPiA+ICsgICAgICAgZGVwZW5k
cyBvbiBSSVNDViAmJiBSSVNDVl9JU0FfU1NRT1NJRAo+ID4gKyAgICAgICBoZWxwCj4gPiArICAg
ICAgICAgQ2FwYWNpdHkgYW5kIEJhbmR3aWR0aCBRb1MgUmVnaXN0ZXIgSW50ZXJmYWNlIChDQlFS
SSkgc3VwcG9ydCBmb3IKPiA+ICsgICAgICAgICBSSVNDLVYgY2FjaGUgUW9TIHJlc291cmNlcy4g
Q0JRUkkgZXhwb3NlcyBjYWNoZSBjYXBhY2l0eQo+ID4gKyAgICAgICAgIGFsbG9jYXRpb24gdGhy
b3VnaCB0aGUgcmVzY3RybCBmaWxlc3lzdGVtIGF0IC9zeXMvZnMvcmVzY3RybCB3aGVuCj4gPiAr
ICAgICAgICAgUkVTQ1RSTF9GUyBpcyBhbHNvIGVuYWJsZWQuCj4gPiArCj4gPiAraWYgUklTQ1Zf
Q0JRUkkKPiA+ICsKPiA+ICtlbmRpZgo+IAo+IFNob3VsZCB0aGlzIGVtcHR5IGlmL2VuZGlmIGJs
b2NrIGdvIGluIHBhdGNoIFs4LzhdIGluc3RlYWQ/CgpHb29kIHBvaW50LiBJJ2xsIG1vdmUgaXQg
dG8gcGF0Y2ggOC4KClRoYW5rcywKRHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
