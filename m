Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D457C54E41
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 13:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/8zn/EK1vuJS4uknc98CikfbgnZRP/+9l+WKvUP+8F4=; b=pbHbHRMN3CbKdM
	r018Gudj5O9djkk9zzG4GGNlyShtHng28YRlwpx5RaiinSnula5VEZU+fbd7XWNGPndd98DUVvZTn
	imWHskRTtzxJaqIhdeS/DXYVQePeYlIkfnsmJyypD7MQJ2D8bsqUTEPNFAlIru5RJlpeu3mWwnQMv
	O8Bh4h61j46JALY43UuYmIUpIrojVRtAi7hHsk8T078KVqGl8NnMhTN8EWz7jxj0vORqsY6PxjCM0
	lHS4U+gPfFNhonYATJkPkWa81FA66wobiFglWJn/knQyi00U1lw72dtLCRhuuI4wqqCmBSHhQBuFu
	jnZzpjS9GWX3NrroSNFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhr1P-00000000KYG-3Nob;
	Wed, 06 Mar 2024 13:09:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhr1N-00000000KXm-3Vv1
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 13:09:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC90361778
	for <linux-riscv@lists.infradead.org>; Wed,  6 Mar 2024 13:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29656C43609
	for <linux-riscv@lists.infradead.org>; Wed,  6 Mar 2024 13:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709730560;
	bh=Qya9yJoMGG3fudaQfNFX/s/AVyf3oZ2gxPRqZT8uKeQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XwIWtSoLbvEa9MhGORRYxc8QnVHeSBZx51PTtbZB7fxTEPlXUS7zchMwigINxmwsA
	 wlfRa6xgG6jV03x8bk2o775DNydGMGIs/5jy8VjXh/b+hEGuIMZmIrl1LByAylEzxc
	 M107S7flaE0Vn6O8d7JyrGLEJGBsL2JRo2F0P+mFOo9IilxDJGb93Xu1QapTYWbu9n
	 m+1tqmU19+hh5m9BrZMpgfxNHfzLfqriMxqcVZ7jb/N5DB1i2IauttaxwQsh4Z8Moz
	 cD9irKSGJxR4SqWaEsVEFyyQMeN675D1FVNS1cDQSAttQcW6ijiqdeeyLYCagIsnmr
	 zQ4j9FjGDjNYQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5131316693cso8917179e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 05:09:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUdaCugof2MArbfldcBOgF13MTHZh5i0nFxIB/Z/vpmzqakiZdSkKAxu6VXgmkXU13QGhuvMJF11tq5X4Vs+PilLu6+w/dMmpTCoUDjDn1A
X-Gm-Message-State: AOJu0YxT3807PPn0Ws/t5q4+XW2y0hsINEdJqKDSoq6xINvilMJWonxG
	8zJrOjAjyZ08tk/XSGn0VC7AWDVEuXVDIKNfgZqwW9a1XflKyv3TzD5omFXmX9z3TVRzYJLmWwE
	OMNuCDU9JYZhTtWK+Ldmj84AjLYI=
X-Google-Smtp-Source: AGHT+IG1umg2a74pIqVk/gcNbcCB3wjXo/3Jy5oVRf6N2X3k6Avjv/4LBUAamkxwcSjo41Byn67QX79jDAeUuBJqscs=
X-Received: by 2002:a05:6512:3b0e:b0:513:57af:2416 with SMTP id
 f14-20020a0565123b0e00b0051357af2416mr3635734lfv.42.1709730558218; Wed, 06
 Mar 2024 05:09:18 -0800 (PST)
MIME-Version: 1.0
References: <20240306085622.87248-1-cuiyunhui@bytedance.com>
 <20240306085622.87248-3-cuiyunhui@bytedance.com> <CAMj1kXEjjFAeVAVwiDO22RJECSM=L=0q6J=zog7JR38rUZpLGQ@mail.gmail.com>
 <CAEEQ3w=2pX+pjwoz=hNFpR4thD+d6o9OmBob8LMzZ8BbKZ=pqg@mail.gmail.com> <CAMj1kXFG=y_XXiaBHZOXDApZiCb48i0U5pX+GBRO2KAUom52VA@mail.gmail.com>
In-Reply-To: <CAMj1kXFG=y_XXiaBHZOXDApZiCb48i0U5pX+GBRO2KAUom52VA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 6 Mar 2024 14:09:07 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH1oMbONoHFMPaatfaqrHNE2ryfrG7kw-7J-eFsuXkK-Q@mail.gmail.com>
Message-ID: <CAMj1kXH1oMbONoHFMPaatfaqrHNE2ryfrG7kw-7J-eFsuXkK-Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 3/3] efistub: fix missed the initialization
 of gp
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	xuzhipeng.1973@bytedance.com, alexghiti@rivosinc.com, samitolvanen@google.com, 
	bp@alien8.de, xiao.w.wang@intel.com, jan.kiszka@siemens.com, 
	kirill.shutemov@linux.intel.com, nathan@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_050922_015480_AEE81E1E 
X-CRM114-Status: GOOD (  27.47  )
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

T24gV2VkLCA2IE1hciAyMDI0IGF0IDE0OjAyLCBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgNiBNYXIgMjAyNCBhdCAxMzozNCwgeXVuaHVpIGN1aSA8
Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIEFyZCwKPiA+Cj4gPiBP
biBXZWQsIE1hciA2LCAyMDI0IGF0IDU6MzbigK9QTSBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJu
ZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gV2VkLCA2IE1hciAyMDI0IGF0IDA5OjU2LCBZ
dW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4g
PiBDb21wYXJlZCB3aXRoIGdjYyB2ZXJzaW9uIDEyLCBnY2MgdmVyc2lvbiAxMyB1c2VzIHRoZSBn
cAo+ID4gPiA+IHJlZ2lzdGVyIGZvciBjb21waWxhdGlvbiBvcHRpbWl6YXRpb24sIGJ1dCB0aGUg
ZWZpc3R1YiBtb2R1bGUKPiA+ID4gPiBkb2VzIG5vdCBpbml0aWFsaXplIGdwLgo+ID4gPiA+Cj4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+
Cj4gPiA+ID4gQ28tRGV2ZWxvcGVkLWJ5OiBaaGlwZW5nIFh1IDx4dXpoaXBlbmcuMTk3M0BieXRl
ZGFuY2UuY29tPgo+ID4gPgo+ID4gPiBUaGlzIG5lZWRzIGEgc2lnbi1vZmYsIGFuZCB5b3VyIHNp
Z25vZmYgbmVlZHMgdG8gY29tZSBhZnRlci4KPiA+ID4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgYXJj
aC9yaXNjdi9rZXJuZWwvZWZpLWhlYWRlci5TIHwgMTEgKysrKysrKysrKy0KPiA+ID4gPiAgMSBm
aWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gPgo+ID4g
PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9lZmktaGVhZGVyLlMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9lZmktaGVhZGVyLlMKPiA+ID4gPiBpbmRleCA1MTViMmRmYmNhNzUuLmZhMTdj
MDhjMDkyYSAxMDA2NDQKPiA+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9lZmktaGVhZGVy
LlMKPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lZmktaGVhZGVyLlMKPiA+ID4gPiBA
QCAtNDAsNyArNDAsNyBAQCBvcHRpb25hbF9oZWFkZXI6Cj4gPiA+ID4gICAgICAgICAubG9uZyAg
IF9fcGVjb2ZmX2RhdGFfdmlydF9lbmQgLSBfX3BlY29mZl90ZXh0X2VuZCAgICAgIC8vIFNpemVP
ZkluaXRpYWxpemVkRGF0YQo+ID4gPiA+ICAjZW5kaWYKPiA+ID4gPiAgICAgICAgIC5sb25nICAg
MCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8vIFNpemVPZlVuaW5pdGlh
bGl6ZWREYXRhCj4gPiA+ID4gLSAgICAgICAubG9uZyAgIF9fZWZpc3R1Yl9lZmlfcGVfZW50cnkg
LSBfc3RhcnQgICAgICAgICAvLyBBZGRyZXNzT2ZFbnRyeVBvaW50Cj4gPiA+ID4gKyAgICAgICAu
bG9uZyAgIF9lZmlzdHViX2VudHJ5IC0gX3N0YXJ0ICAgICAgICAgLy8gQWRkcmVzc09mRW50cnlQ
b2ludAo+ID4gPiA+ICAgICAgICAgLmxvbmcgICBlZmlfaGVhZGVyX2VuZCAtIF9zdGFydCAgICAg
ICAgICAgICAgICAgLy8gQmFzZU9mQ29kZQo+ID4gPiA+ICAjaWZkZWYgQ09ORklHXzMyQklUCj4g
PiA+ID4gICAgICAgICAubG9uZyAgX19wZWNvZmZfdGV4dF9lbmQgLSBfc3RhcnQgICAgICAgICAg
ICAgICAvLyBCYXNlT2ZEYXRhCj4gPiA+ID4gQEAgLTEyMSw0ICsxMjEsMTMgQEAgc2VjdGlvbl90
YWJsZToKPiA+ID4gPgo+ID4gPiA+ICAgICAgICAgLmJhbGlnbiAweDEwMDAKPiA+ID4gPiAgZWZp
X2hlYWRlcl9lbmQ6Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgLmdsb2JhbCBfZWZpc3R1Yl9l
bnRyeQo+ID4gPiA+ICtfZWZpc3R1Yl9lbnRyeToKPiA+ID4KPiA+ID4gVGhpcyBzaG91bGQgZ28g
aW50byAudGV4dCBvciAuaW5pdC50ZXh0LCBub3QgdGhlIGhlYWRlci4KPiA+ID4KPiA+ID4gPiAr
ICAgICAgIC8qIFJlbG9hZCB0aGUgZ2xvYmFsIHBvaW50ZXIgKi8KPiA+ID4gPiArICAgICAgIGxv
YWRfZ2xvYmFsX3BvaW50ZXIKPiA+ID4gPiArCj4gPiA+Cj4gPiA+IFdoYXQgaXMgc3VwcG9zZWQg
dG8gaGFwcGVuIGhlcmUgaWYgQ09ORklHX1NIQURPV19DQUxMX1NUQUNLPXk/IFRoZSBFRkkKPiA+
ID4gc3R1YiBNYWtlZmlsZSByZW1vdmVzIHRoZSBTQ1MgQ0ZMQUdTLCBzbyB0aGUgc3R1YiB3aWxs
IGJlIGJ1aWx0Cj4gPiA+IHdpdGhvdXQgc2hhZG93IGNhbGwgc3RhY2sgc3VwcG9ydCwgd2hpY2gg
SSBndWVzcyBtZWFucyB0aGF0IGl0IG1pZ2h0Cj4gPiA+IHVzZSBHUCBhcyBhIGdsb2JhbCBwb2lu
dGVyIGFzIHVzdWFsPwo+ID4gPgo+ID4gPiA+ICsgICAgICAgY2FsbCBfX2VmaXN0dWJfZWZpX3Bl
X2VudHJ5Cj4gPiA+ID4gKyAgICAgICByZXQKPiA+ID4gPiArCj4gPiA+Cj4gPiA+IFlvdSBhcmUg
cmV0dXJuaW5nIHRvIHRoZSBmaXJtd2FyZSBoZXJlLCBidXQgYWZ0ZXIgbW9kaWZ5aW5nIHRoZSBH
UAo+ID4gPiByZWdpc3Rlci4gU2hvdWxkbid0IHlvdSByZXN0b3JlIGl0IHRvIGl0cyBvbGQgdmFs
dWU/Cj4gPiBUaGVyZSBpcyBubyBuZWVkIHRvIHJlc3RvcmUgdGhlIHZhbHVlIG9mIHRoZSBncCBy
ZWdpc3Rlci4gV2hlcmUgZ3AgaXMKPiA+IG5lZWRlZCwgdGhlIGdwIHJlZ2lzdGVyIG11c3QgZmly
c3QgYmUgaW5pdGlhbGl6ZWQuIEFuZCBoZXJlIGlzIHRoZQo+ID4gZW50cnkuCj4gPgo+Cj4gQnV0
IGhvdyBzaG91bGQgdGhlIGZpcm13YXJlIGtub3cgdGhhdCBHUCB3YXMgY29ycnVwdGVkIGFmdGVy
IGNhbGxpbmcKPiB0aGUga2VybmVsJ3MgRUZJIGVudHJ5cG9pbnQ/IFRoZSBFRkkgc3R1YiBjYW4g
cmV0dXJuIHRvIHRoZSBmaXJtd2FyZQo+IGlmIGl0IGVuY291bnRlcnMgYW55IGVycm9ycyB3aGls
ZSBzdGlsbCBydW5uaW5nIGluIHRoZSBFRkkgYm9vdAo+IHNlcnZpY2VzLgo+CgpBY3R1YWxseSwg
SSB3b25kZXIgaWYgR1AgY2FuIGJlIG1vZGlmaWVkIGF0IGFsbCBiZWZvcmUKRXhpdEJvb3RTZXJ2
aWNlcygpLiBUaGUgRUZJIHRpbWVyIGludGVycnVwdCBpcyBzdGlsbCBsaXZlIGF0IHRoaXMKcG9p
bnQsIGFuZCBzbyB0aGUgZmlybXdhcmUgaXMgYmVpbmcgY2FsbGVkIGJlaGluZCB5b3VyIGJhY2ss
IGFuZCBtaWdodApyZWx5IG9uIEdQIHJldGFpbmluZyBpdHMgb3JpZ2luYWwgdmFsdWUuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
