Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9670AC352A1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 07:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=plh8R08BPe7Oj8GF8E9igXKCYDM21AyGLuZZE196hiw=; b=xIVKF42t9iIJyr
	I6ARj5++e1VIttm58cmi7JUvsghKU5ZgKOUogEq2LfMO/+Qp5pxm6PuKlUx7mJIXDgZwdNNQL3+sT
	/HGThSaKFaJ3SEYWbqiPBVp9IYFddKEPIXV1Vn5VtXW9nOzsOOlSEKE+zziE3s8aYWBKFxmn9uO2w
	11H2u9ELBm5qbwAJ4lrxmgahx2LlJEmt9b5s4BBh47hfFO/08sSZUrhJybgRg2YtmU355bbE6NLuS
	3wS3+oRP0MFcGJ6eWbpFS9FxYe86XfvJ9SjWFuEBKpzTzTMYkqlJlNQ3I3ttfAZo29ZAO18kNWMh8
	BM8qTszIj25gojuPBGTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2RzV-003BOb-Mp; Tue, 06 Dec 2022 07:03:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2RzS-003BLq-PM
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 07:03:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0DFAB6145C;
	Tue,  6 Dec 2022 07:03:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06436C433C1;
	Tue,  6 Dec 2022 07:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670310221;
	bh=uyC7NDu0kYuneC2q0Yg1F4ZMc2RuAARWGUstvb0JORM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Xn0Ab43zudPFmTTpXzfogCXfEG9sHc9qr/83uOa40cYmeLmV1HysQqWTNTRZM5wPn
	 7fl/dgbAz4N2Go8+npeThW4igE+uhIsQLxsCU4EhmZtgjCZRwq0FIdauvqkxBiZsRU
	 gKGokIDnQLOH9BBmdZDj+5LgBB7A4cPwEs9i/nwAavkqzZU739kOuHAQCZL2B0+U05
	 cM6uV0N5o9LFnfGwpNeUuKHFtC0AwYFXcP/8W1MOC+JsZX4Cv3qrGhB8AkJGYectLn
	 PbJAoIcCmHWIxk8sspJAJUx13xmRpWWtvZw1WTCmcnFTa3ADHSnh0nqq5XXN+Cmp9h
	 HiXcN3PhUkaEw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de,
 peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com,
 heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com,
 falcon@tinylab.org, chenhuacai@kernel.org, apatel@ventanamicro.com,
 atishp@atishpatra.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 mark.rutland@arm.com, zouyipeng@huawei.com, bigeasy@linutronix.de,
 David.Laight@aculab.com, chenzhongjin@huawei.com, greentime.hu@sifive.com,
 andy.chiu@sifive.com, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Guo Ren
 <guoren@linux.alibaba.com>
Subject: Re: [PATCH -next V8 00/14] riscv: Add GENERIC_ENTRY support and
 related features
In-Reply-To: <CAJF2gTSgvKV3Oh6t2dpbJGnt3cDZU14Qk_CxKPMXmEmgvMg8-Q@mail.gmail.com>
References: <20221103075047.1634923-1-guoren@kernel.org>
 <877cz69o8f.fsf@all.your.base.are.belong.to.us>
 <CAJF2gTSgvKV3Oh6t2dpbJGnt3cDZU14Qk_CxKPMXmEmgvMg8-Q@mail.gmail.com>
Date: Tue, 06 Dec 2022 08:03:38 +0100
Message-ID: <875yep3tf9.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_230342_889587_691D9491 
X-CRM114-Status: GOOD (  15.19  )
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

R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyaXRlczoKCj4gT24gTW9uLCBEZWMgNSwgMjAy
MiBhdCA1OjQ2IFBNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+
PiBndW9yZW5Aa2VybmVsLm9yZyB3cml0ZXM6Cj4+Cj4+ID4gRnJvbTogR3VvIFJlbiA8Z3VvcmVu
QGxpbnV4LmFsaWJhYmEuY29tPgo+PiA+Cj4+ID4gVGhlIHBhdGNoZXMgY29udmVydCByaXNjdiB0
byB1c2UgdGhlIGdlbmVyaWMgZW50cnkgaW5mcmFzdHJ1Y3R1cmUgZnJvbQo+PiA+IGtlcm5lbC9l
bnRyeS8qLiBBZGRpdGlvbmFsbHksIGFkZCBpbmRlcGVuZGVudCBpcnEgc3RhY2tzIChJUlFfU1RB
Q0tTKQo+PiA+IGZvciBwZXJjcHUgdG8gcHJldmVudCBrZXJuZWwgc3RhY2sgb3ZlcmZsb3dzLiBB
ZGQgZ2VuZXJpY19lbnRyeSBiYXNlZAo+PiA+IFNUQUNLTEVBSyBzdXBwb3J0LiBTb21lIG9wdGlt
aXphdGlvbiBmb3IgZW50cnkuUyB3aXRoIG5ldyAubWFjcm8gYW5kCj4+ID4gbWVyZ2UgcmV0X2Zy
b21fa2VybmVsX3RocmVhZCBpbnRvIHJldF9mcm9tX2ZvcmsuCj4+ID4KPj4gPiBXZSBoYXZlIHRl
c3RlZCBpdCB3aXRoIHJ2NjQsIHJ2MzIsIHJ2NjQgKyAzMnJvb3RmcywgYWxsIGFyZSBwYXNzZWQu
Cj4+ID4KPj4gPiBZb3UgY2FuIGRpcmVjdGx5IHRyeSBpdCB3aXRoOgo+PiA+IFsxXSBodHRwczov
L2dpdGh1Yi5jb20vZ3VvcmVuODMvbGludXgvdHJlZS9nZW5lcmljX2VudHJ5X3Y4Cj4+Cj4+IEd1
bywgdGhpcyBpcyBhIHJlYWxseSBuaWNlIHdvcmssIGFuZCBJJ20gbG9va2luZyBmb3J3YXJkIGhh
dmluZyBnZW5lcmljCj4+IGVudHJ5IHN1cHBvcnQgZm9yIFJWLiBIb3dldmVyLCB0aGVyZSBhcmUg
bWFueSBwYXRjaGVzIGluIHRoaXMgc2VyaWVzCj4+IHRoYXQgcmVhbGx5IHNob3VsZG4ndCBiZSBw
YXJ0IG9mIHRoZSBzZXJpZXMuCj4+Cj4+IFBhdGNoIDIsIDMsIDQsIGFuZCAxMCBzaG91bGQgZGVm
aW50ZWx5IGJlIHB1bGxlZCBvdXQuCj4gT2theS4KPgo+Pgo+PiBJJ20gbm90IHN1cmUgNywgOCwg
YW5kIDkgYmVsb25nIHRvIHNlcmllcywgYXMgaXQncyByZWFsbHkgYSBzZXBhcmF0ZQo+PiBmZWF0
dXJlLgo+IFRoZSBzZXBhcmF0ZSBpcnEvc29mdGlycSBzdGFjayBwYXRjaGVzIGRwZW5kIG9uIGdl
bmVyaWNfZW50cnkgdGlnaHRseSwKPiBzbyBJIHJlY29tbWFuZCBwdXQgdGhlbSB0b2dldGhlci4K
CkknZCBzYXkgKmRlcGVuZHMqIG9uIHRoZSBzZXJpZXMsIG5vdCByZXF1aXJlZCBmb3IgZ2VuZXJp
YyBlbnRyeS4gQWdhaW4sCmtlZXBpbmcgdGhlIHNlcmllcyBvcnRob2dvbmFsIGFuZCBzbWFsbCBp
cyBhIGdvb2QgdGhpbmcuCgo+PiBGb3IgR0VORVJJQ19FTlRSWSBzdXBwb3J0IG9ubHkgcGF0Y2gg
MSwgNSwgNiwgMTIsIDEzLCBhbmQgMTQsIHJlYWxseQo+PiByZXF1aXJlZC4gVGhlIG90aGVycyBh
cmUgdW5yZWxhdGVkLgo+IFRoeCBmb3IgdGhlIHJlbWluZGVyOyBJIHdpbGwgcmUtb3JnYW5pemUg
dGhlbS4KClRoaXMgaXMgYSByZWFsbHkgbmljZSBjbGVhbiB1cCwgYW5kIHRoZSByZWFzb24gSSdt
IHB1c2hpbmcgZm9yIHJlbW92aW5nCnVucmVsYXRlZCBwYXRjaGVzIGluIHRoZSBzZXJpZXMsIGlz
IGJlY2F1c2UgSSB3YW50IHRvIHNlZSBpdCBsYW5kIGluIHRoZQpSViB0cmVlIHNvb25lciwgcmF0
aGVyIHRoYW4gbGF0ZXIuIFNlbmQgdGhlc2UgYXMgZm9sbG93LXVwcyB0byBnZW5lcmljCmVudHJ5
LCBvbmNlIGl0IGxhbmRzIGluIHRoZSB0cmVlLgoKClRoYW5rIHlvdSBmb3IgdGhlIGhhcmQgd29y
ayEKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
