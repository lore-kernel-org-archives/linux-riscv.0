Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B5BC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 06:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=evx2XTq3slBoINX2jKwebp/+BcTpo0yM3gpuBudHwLY=; b=lU472uEVBJ++i/
	Juey8NVUCi2e4qpeJs65TweAg9SEcjfQlCs5sx7jNjPdfPciBIh4OtB+rsjOJVqWLtBpifbcYtXL1
	q03R/XCAqJcjtUkY9CgJ+5Kas1D3Sl37MOZU8yEwyt0x+feTx3OS+IXAvxaY4BDhcjhvIy+MQORB8
	bFpJFlDpk+2HGrykSGg+fq7mwIn9+oiX3czGJzRProXV08shte5zV6fIWsclZbQSFf3TyUNvIM5th
	Cku4J0/oGubS4N5tP4Tv8zU7EuhvbtcVU86XS8Onv1Q9fVh/kWQInPh4WdE8RGPucAzOQQWjI2zbx
	ZuCWd+QVqy2+3N8JUYog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seqAM-0000000BuYI-0YDd;
	Fri, 16 Aug 2024 06:10:26 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seqAI-0000000BuXS-43dZ
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 06:10:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1723788606; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=P3pWPXD8rUFdVwHpPsItVKycREgekzseH2ccvogBTJ0Z9cHBknTqEBPbpPDpdVq15uRp/sfKEXnE0Svo52x+Q/82Er5FxXuI1EwGNWNeUsyvQMNgBLA0Xe5uHZTOAwy42ORJrRXNNyfYnJA+ctQlNa4Z8YVrDivrMIiNZTtJxZs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1723788606; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hcSGRbUU39H4+aPq6230lrePyX9/aHkH59blGuwBUeE=; 
	b=VsPZy/BqHpdUoXcS5azY7IrVRbWYjFNB5odQH0CsT5ly3Wm4zVGeSAIslAtS7n2jSENfmlwJuG5rRJh9o2TBBShZbp4JY4B5+Mec/weoodFFg9AHo8rdlrMfUbITyrKGyaqFjih4Ys5FN6Nq+13C06ZStR4QZ7APQUXqtWWJnPM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723788606;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=hcSGRbUU39H4+aPq6230lrePyX9/aHkH59blGuwBUeE=;
	b=CJICe07bvpnF7gUM6cxv7f3TmmyPJ6b7op/BUo+rdbDKdOLpfJ+xPj3/Dv1OgUfq
	WYLKpgY5fiH9opkHbZCP4GkUcT0KbAYUtAif0tF75vcTapAA4zF3AKWFtO9/rrVxCzN
	IwU2UbECnOixNyuGF4LMbMbCyQAqLgfVIFkrvqgkplxB25YZV6w4xbjdr0A3ANrE5w2
	lhrrdoRtq786+MiIp9/lefT5x4u4jhHooV4mGpRnYN6cF5UDaJdweJPDHgMQBxJJsSr
	oJH/zV6hezMuUN6a7c3mOESGC1/ykz4fahfvhSE0md02ucvR5sVFgBens5Gt3pOP88v
	vF5JJ3+zFA==
Received: by mx.zohomail.com with SMTPS id 1723788604231899.4893413463349;
	Thu, 15 Aug 2024 23:10:04 -0700 (PDT)
Message-ID: <ce7d2ebb2a82935c68bd41d6379f8f20591c2539.camel@icenowy.me>
Subject: Re: [PATCH v1 0/9] Fix Allwinner D1 boot regression
From: Icenowy Zheng <uwu@icenowy.me>
To: Anup Patel <apatel@ventanamicro.com>, Samuel Holland
	 <samuel.holland@sifive.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Emil Renner Berthing
 <emil.renner.berthing@canonical.com>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Fri, 16 Aug 2024 14:09:58 +0800
In-Reply-To: <CAK9=C2VHfPnYx8gMjodJNLu9+yR4KvuPXeQZiyZcbu1Mvze-0Q@mail.gmail.com>
References: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
	 <87jzgjnh9z.ffs@tglx>
	 <CAJM55Z8WERQgs=QMyFGWvAHOpwcnOAudBqovaEuDudPSXCvL5Q@mail.gmail.com>
	 <87ttfmm2ns.ffs@tglx>
	 <CAJM55Z88H635Crc-Aeq+K0qcAk7NC89WVTAFdXDd2aQKQ7QmEg@mail.gmail.com>
	 <CAJM55Z_qQX7n8tAeOFqrAH1BFjA9vaWA8rtsPG2BcKmiO88m=Q@mail.gmail.com>
	 <87plqalyd4.ffs@tglx> <686d61c4-e7ac-4dca-a7fd-decdd72e84d9@sifive.com>
	 <CAK9=C2VHfPnYx8gMjodJNLu9+yR4KvuPXeQZiyZcbu1Mvze-0Q@mail.gmail.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_231023_093914_B0F5AD9F 
X-CRM114-Status: GOOD (  33.99  )
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

5ZyoIDIwMjQtMDgtMTXmmJ/mnJ/lm5vnmoQgMjA6MDAgKzA1MzDvvIxBbnVwIFBhdGVs5YaZ6YGT
77yaCj4gT24gVGh1LCBBdWcgMTUsIDIwMjQgYXQgNzowMuKAr1BNIFNhbXVlbCBIb2xsYW5kCj4g
PHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4gCj4gPiBIaSBUaG9tYXMsIEVt
aWwsCj4gPiAKPiA+IE9uIDIwMjQtMDgtMTUgODoxNiBBTSwgVGhvbWFzIEdsZWl4bmVyIHdyb3Rl
Ogo+ID4gPiBPbiBUaHUsIEF1ZyAxNSAyMDI0IGF0IDA1OjE0LCBFbWlsIFJlbm5lciBCZXJ0aGlu
ZyB3cm90ZToKPiA+ID4gPiBFbWlsIFJlbm5lciBCZXJ0aGluZyB3cm90ZToKPiA+ID4gPiA+IDYu
MTEtcmMzICsgdGhlc2UgcmV2ZXJ0czrCoAo+ID4gPiA+ID4gaHR0cHM6Ly91czAxLnouYW50aWdl
bmEuY29tL2wvRXI0a1pXRG12TDUtYkx6SEhKb1p2MGs3MWl3VzJqQ0Q1cU5waXoweDBYZFlZNm9P
UkZfblhoN1U3anc2b3ViaGl+MzJISTRpNzFqVVc5djh+TnZTdlBlVVdyZFl4M1dKQnIyR1BEVWpP
dTZMWVBDT0JmUjJkVlF1TVd2bE5qNHREalhGcDNRRVFBbWVhd1pmbEQ0SnJJSmp0U1lJYktmZTZ2
LXRnSDdTRXVITWVTU3JpVTYzM0x2Cj4gPiA+ID4gPiA2LjExLXJjMyArIFNhbXVlbCdzIHBhdGNo
Ogo+ID4gPiA+ID4gaHR0cHM6Ly91czAxLnouYW50aWdlbmEuY29tL2wvRVVMdEFZa3k2WnZncVo0
OUtHUy1XQnNZVGd+SHQxTm9RdEVZbVVWYjU2eW1TOWpEYWdxWUhMSzkwV0RqblZ0NjlHZkI0SVg1
TlNSUVhtU2ZrTnNUekI4bEptRnZEaWhIUW1HcnNDdjlGemxvckQ5eUdmWERsUTZyRzZ2bW41Qk5E
d2xpcG1zc0dhT0dmaDl5a284bjlBcldSNFRMaEVmfmY5T0RxbWV+TlhYd0E5RExMYzlwCj4gPiA+
ID4gCj4gPiA+ID4gSSB0aGluayB0aGlzIGNvbmZpcm1zIHdoYXQgQ2hhcmxpZSBmb3VuZCBoZXJl
Ogo+ID4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L1pveWRWN3ZhZDVK
V0ljWmJAZ2hvc3QvCj4gPiA+IAo+ID4gPiBZZXMuIFNvIHRoZSByaXNjdiB0aW1lciBpcyBub3Qg
d29ya2luZyBvbiB0aGlzIHRoaW5nIG9yIGl0IHN0b3BzCj4gPiA+IHNvbWVob3cuCj4gPiAKPiA+
IFRoYXQncyBjb3JyZWN0LiBXaXRoIHRoZSAoZmlybXdhcmUpIGRldmljZXRyZWUgdGhhdCBFbWls
IGlzIHVzaW5nLAo+ID4gdGhlIE9wZW5TQkkKPiA+IGZpcm13YXJlIGRvZXMgbm90IGhhdmUgYSB0
aW1lciBkZXZpY2UsIHNvIGl0IGRvZXMgbm90IGV4cG9zZSB0aGUKPiA+IChvcHRpb25hbFsxXSkK
PiA+IFNCSSB0aW1lIGV4dGVuc2lvbiwgYW5kIHNiaV9zZXRfdGltZXIoKSBkb2VzIG5vdGhpbmcu
Cj4gCj4gT3BlblNCSSB1c2VzIHBsYXRmb3JtIHNwZWNpZmljIE0tbW9kZSB0aW1lciAobXRpbWUg
YW5kIG10aW1lY21wKSB0bwo+IHByb3ZpZGUgU0JJIHRpbWUgZXh0ZW5zaW9uIHRvIExpbnV4Lgo+
IAo+IFRoZSBSSVNDLVYgcHJpdmlsZWdlZCBzcGVjaWZpY2F0aW9uICh2MS4xMCBvciBoaWdoZXIp
IHJlcXVpcmVzCj4gcGxhdGZvcm0gdG8KPiBwcm92aWRlIGEgTS1tb2RlIHRpbWVyIChtdGltZSBh
bmQgbXRpbWVjbXApLgoKVGhlIFQtSGVhZCBjb3JlcycgZGVzaWduIGlzIHdlaXJkLCBhbmQgYmVj
YXVzZSBvZiBpdHMgc291cmNlIGNvZGUgaXMKYXZhaWxhYmxlIChhcyBPcGVuQzkwNiksIHdlIGNh
biBpbnZlc3RpZ2F0ZSBpdCBmdXJ0aGVyIGluIHRoZSBSVEwKbGV2ZWw6CgotIEZyb20gc29mdHdh
cmUgcGVyc3BlY3RpdmUsIGl0IGhhcyBubyBtdGltZSBtbWFwJ2VkIHJlZ2lzdGVyLCBidXQgaXQK
aGFzIG10aW1lY21wLCB3aGljaCBjb21wYXJlcyB3aXRoIHRpbWUgQ1NSIChhIENTUiBSL08gaW4g
YWxsIHByaXYKbGV2ZWxzKS4KLSBGcm9tIFNvQyBpbnRlZ3JhdGlvbiBwZXJzcGVjdGl2ZSwgdGhl
IHZhbHVlIG9mIHRoZSB0aW1lIENTUiBpcwpzb3VyY2VkIGZyb20gYW4gZXh0ZXJuYWwgaW5wdXQs
IHBhZF9jcHVfc3lzX2NudFs2MzowXSBbMV0uCgpCVFcgSSBhbHJlYWR5IGFkZGVkIHN1cHBvcnQg
Zm9yIHRoaXMga2luZCBvZiBub24tc3RhbmRhcmQgQ0xJTlQgdG8KT3BlblNCSSBbMl0sIGhvd2V2
ZXIgSSBkb24ndCB0aGluayB0aGUgY3VycmVudCBmaXJtd2FyZSBEVCBvZiBEMQp1dGlsaXplcyBp
dDsgYW5kIHRoaXMgaXMgYWxzbyBhIHF1aXRlIG5ldyBTQkkgdmVyc2lvbiBJIHRoaW5rLgoKWzFd
Cmh0dHBzOi8vZ2l0aHViLmNvbS9YVUFOVElFLVJWL29wZW5jOTA2L2Jsb2IvbWFpbi9DOTA2X1JU
TF9GQUNUT1JZL2dlbl9ydGwvY3B1L3J0bC9vcGVuQzkwNi52I0w4NApbMl0KaHR0cHM6Ly9naXRo
dWIuY29tL3Jpc2N2LXNvZnR3YXJlLXNyYy9vcGVuc2JpL2NvbW1pdC9iODQ4ZDg3NjNhNzM3ZGU0
NGI2NGJmYzAzNmM4ZjUxMjAwMjI2NDQwCgo+IAo+IFRoaXMgcGxhdGZvcm0gbm90IGhhdmluZyBh
bnkgTS1tb2RlIHRpbWVyIGlzIHlldCBhbm90aGVyIFJJU0MtViBzcGVjCj4gdmlvbGF0aW9uIGJ5
IHRoaXMgcGxhdGZvcm0uCj4gCj4gUmVnYXJkcywKPiBBbnVwCj4gCj4gPiAKPiA+IEkgd3JvdGUg
YSBwYXRjaCAobm90IHN1Ym1pdHRlZCkgdG8gc2tpcCByZWdpc3RlcmluZwo+ID4gcmlzY3ZfY2xv
Y2tfZXZlbnQgd2hlbiB0aGUKPiA+IFNCSSB0aW1lIGV4dGVuc2lvbiBpcyB1bmF2YWlsYWJsZSwg
YnV0IHRoaXMgZG9lc24ndCBmdWxseSBzb2x2ZSB0aGUKPiA+IGlzc3VlCj4gPiBlaXRoZXIsIGJl
Y2F1c2UgdGhlbiB3ZSBoYXZlIG5vIGNsb2NrZXZlbnQgYXQgYWxsIHdoZW4KPiA+IGNoZWNrX3Vu
YWxpZ25lZF9hY2Nlc3NfYWxsX2NwdXMoKSBpcyBjYWxsZWQuCj4gPiAKPiA+IEhvdyBlYXJseSBp
biB0aGUgYm9vdCBwcm9jZXNzIGFyZSB3ZSAicmVxdWlyZWQiIHRvIGhhdmUgYQo+ID4gZnVuY3Rp
b25hbCBjbG9ja2V2ZW50Pwo+ID4gRG8gd2UgbmVlZCB0byByZWZhY3RvciBjaGVja191bmFsaWdu
ZWRfYWNjZXNzX2FsbF9jcHVzKCkgc28gaXQKPiA+IHdvcmtzIG9uIHN5c3RlbXMKPiA+IHdoZXJl
IHRoZSBvbmx5IGNsb2NrZXZlbnQgaXMgcHJvdmlkZWQgYnkgYSBwbGF0Zm9ybSBkZXZpY2U/Cj4g
PiAKPiA+IFJlZ2FyZHMsCj4gPiBTYW11ZWwKPiA+IAo+ID4gWzFdCj4gPiBodHRwczovL2dpdGh1
Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1zYmktZG9jL2Jsb2IvbWFzdGVyL3NyYy9pbnRyby5h
ZG9jCj4gPiAKPiA+ID4gQ2FuIHlvdSBhcHBseSB0aGUgZGVidWcgcGF0Y2ggYmVsb3cgYW5kIGNo
ZWNrIHdoZXRoZXIgeW91IHNlZSB0aGUKPiA+ID4gJ0o6IC4uLi4nIG91dHB1dCBhdCBhbGwgYW5k
IGlmIHNvIHdoZXRoZXIgaXQgc3RvcHMgYXQgc29tZSBwb2ludC4KPiA+ID4gCj4gPiA+IFRoYW5r
cywKPiA+ID4gCj4gPiA+IMKgwqDCoMKgwqDCoMKgIHRnbHgKPiA+ID4gCj4gPiA+IC0tLQo+ID4g
PiAtLS0gYS9rZXJuZWwvdGltZS90aW1lci5jCj4gPiA+ICsrKyBiL2tlcm5lbC90aW1lL3RpbWVy
LmMKPiA+ID4gQEAgLTI0NTksNiArMjQ1OSw5IEBAIHN0YXRpYyB2b2lkIHJ1bl9sb2NhbF90aW1l
cnModm9pZCkKPiA+ID4gwqB7Cj4gPiA+IMKgwqDCoMKgwqAgc3RydWN0IHRpbWVyX2Jhc2UgKmJh
c2UgPQo+ID4gPiB0aGlzX2NwdV9wdHIoJnRpbWVyX2Jhc2VzW0JBU0VfTE9DQUxdKTsKPiA+ID4g
Cj4gPiA+ICvCoMKgwqDCoCBpZiAoIShqaWZmaWVzICYgMHhGRikpCj4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcHJfaW5mbygiSjogJWx4XG4iLCBqaWZmaWVzKTsKPiA+ID4gKwo+ID4g
PiDCoMKgwqDCoMKgIGhydGltZXJfcnVuX3F1ZXVlcygpOwo+ID4gPiAKPiA+ID4gwqDCoMKgwqDC
oCBmb3IgKGludCBpID0gMDsgaSA8IE5SX0JBU0VTOyBpKyssIGJhc2UrKykgewo+ID4gPiAKPiA+
ID4gCj4gPiA+IAo+ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+ID4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+ID4gbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4gPiA+IAo+ID4gCj4gCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
