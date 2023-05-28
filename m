Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD1FC7EE23
	for <linux-riscv@archiver.kernel.org>; Sun, 28 May 2023 09:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BKL2FQndt9HgdWbvgfT+qUjgxtdcPyODm4pidhOyu8s=; b=Vwbu5si8HgJFw1
	CZhVEGaypP+sHmfVQ7a8st32h1vza67fuTMH1w08PtO+JtUBlUY8kEKkUMB5kFOabjLb4jIFAmgbL
	0C/78EWNYXkdPrShf1dT30UD0CVgKPQTxyCSIIeZ4m8Gd9ky8SSvR+oc/dZsZ89dF21UqE09WkxGl
	6XUDdsaSY2kh2ClX4Wvw6DW9bFr8hWkkV+4ZakGmM+vXSJ/ODpulh4JZR71CF9ZnpuI7t/bxajJIc
	IxGQkqXpUnG9iSjm3M6sLT2CjTH7ZJOql9X3psb73p0RPk48U3uhI23PLXuJDDv54Xa4eaTJ+3/rH
	GDYW7q8licu4l1ATfzfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3CuX-007HqK-2O;
	Sun, 28 May 2023 09:42:01 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3CuV-007HpN-0B
	for linux-riscv@lists.infradead.org;
	Sun, 28 May 2023 09:42:00 +0000
Date: Sun, 28 May 2023 11:41:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1685266914; bh=KfYW6zrk9bUzHSL1GVXFbu1Ry7vy9dldYOJGxwZi/mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CmOHwghuAOKY2uzDsSrgfGLV0frdG3brN0uOXw4bVJU9EFD/8Ql6I+AvKmjLWnP2H
	 eYWckRvBRB6El8lYyEOAAY8t3DS4f9hRsLY1T2PZ0SFC5RnpbRnlP7pY4cVrIJIfKi
	 ANo3fbMa1tzuy9YRRx5zujJadbLd8YONmH/80As0=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Willy Tarreau <w@1wt.eu>, Zhangjin Wu <falcon@tinylab.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: Re: [PATCH 00/13] tools/nolibc: riscv: Add full rv32 support
Message-ID: <30bf1742-64ff-4f92-beab-332108d0201f@t-8ch.de>
References: <cover.1684949267.git.falcon@tinylab.org>
 <20230528075955.GE1956@1wt.eu>
 <210e5ed9-be89-4e48-9c1e-3eb5b0dd288a@t-8ch.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <210e5ed9-be89-4e48-9c1e-3eb5b0dd288a@t-8ch.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_024159_255292_23EEB27C 
X-CRM114-Status: GOOD (  23.53  )
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

T24gMjAyMy0wNS0yOCAxMDo0MjozOSswMjAwLCBUaG9tYXMgV2Vpw59zY2h1aCB3cm90ZToKPiBP
biAyMDIzLTA1LTI4IDA5OjU5OjU1KzAyMDAsIFdpbGx5IFRhcnJlYXUgd3JvdGU6Cj4gPiBPbiBU
aHUsIE1heSAyNSwgMjAyMyBhdCAwMTozMzoxNEFNICswODAwLCBaaGFuZ2ppbiBXdSB3cm90ZToK
PiA+ID4gVGhhbmtzIHZlcnkgbXVzaCBmb3IgeW91ciBraW5kbHkgcmV2aWV3LCBkaXNjdXNzIGFu
ZCBzdWdnZXN0aW9uLCBub3cgd2UKPiA+ID4gZ2V0IGZ1bGwgcnYzMiBzdXBwb3J0IDstKQo+ID4g
PiAKPiA+ID4gSW4gdGhlIGZpcnN0IHNlcmllcyBbMV0sIHdlIGhhdmUgZml4ZWQgdXAgdGhlIGNv
bXBpbGUgZXJyb3JzIGFib3V0Cj4gPiA+IF9zdGFydCBhbmQgX19OUl9sbHNlZWsgZm9yIHJ2MzIs
IGJ1dCBsZWZ0IGNvbXBpbGUgZXJyb3JzIGFib3V0IHRvbnMgb2YKPiA+ID4gdGltZTMyIHN5c2Nh
bGxzIChyZW1vdmVkIGFmdGVyIGtlcm5lbCBjb21taXQgZDRjMDhiOTc3NmIzICgicmlzY3Y6IFVz
ZQo+ID4gPiBsYXRlc3Qgc3lzdGVtIGNhbGwgQUJJIikpIGFuZCB0aGUgbWlzc2luZyBmc3RhdCBp
biBub2xpYmMtdGVzdC5jIFsyXSwKPiA+ID4gbm93IHdlIGhhdmUgZml4ZWQgdXAgYWxsIG9mIHRo
ZW0uCj4gPiAKPiA+ICguLi4pCj4gPiAKPiA+IEkgaGF2ZSByZWFkIHRoZSBjb21tZW50cyB0aGF0
IG90aGVycyBtYWRlIG9uIHRoZSBzZXJpZXMgYW5kIG92ZXJhbGwKPiA+IGFncmVlLiBJJ3ZlIHNl
ZW4gdGhhdCB5b3UgaW50ZW5kIHRvIHByZXBhcmUgYSB2Mi4gSSB0aGluayB3ZSBtdXN0Cj4gPiBm
aXJzdCBkZWNpZGUgaG93IHRvIGJldHRlciBkZWFsIHdpdGggZW11bGF0ZWQgc3lzY2FsbHMgYXMg
SSBzYWlkIGluCj4gPiBhbiBlYXJsaWVyIG1lc3NhZ2UuIFByb2JhYmx5IHRoYXQgd2Ugc2hvdWxk
IGp1c3QgYWRkIGEgc3BlY2lmaWMgdGVzdAo+ID4gY2FzZSBmb3IgRUZBVUxUIGluIG5vbGliYy10
ZXN0IHNpbmNlIGl0J3MgdGhlIG9ubHkgb25lIChJIHRoaW5rKSB0aGF0Cj4gPiByaXNrcyB0byB0
cmlnZ2VyIGNyYXNoZXMgd2l0aCBlbXVsYXRlZCBzeXNjYWxscy4gV2UgY291bGQgYWxzbyBpbWFn
aW5lCj4gPiBkZWFsaW5nIHdpdGggdGhlIHNpZ25hbCBvdXJzZWx2ZXMgYnV0IEknbSBub3QgdGhh
dCBrZWVuIG9uIGdvaW5nIHRvCj4gPiBpbXBsZW1lbnQgc2lnbmFsKCkgJiBsb25nam1wKCkgZm9y
IG5vdyA6LS8KPiA+IAo+ID4gUmVnYXJkbGVzcywgaW4gb3JkZXIgdG8gY2xlYW4gdGhlIHRoaW5n
cyB1cCBhbmQgcmVsaWV2ZSB5b3UgZnJvbSB0aGUKPiA+IG5vbi1ydjMyIHN0dWZmLCBJJ3ZlIGp1
c3QgcmV2ZXJ0ZWQgdGhlIHR3byBwYXRjaGVzIHRoYXQgeW91ciBzZXJpZXMKPiA+IHJldmVydHMg
KDEgJiAyKSwgYW5kIGFkZGVkIHRoZSBFT1ZFUkZMT1cgb25lICgzKS4gSSdtIHB1c2hpbmcgdGhp
cyB0bwo+ID4gYnJhbmNoIDIwMjMwNTI4LW5vbGliYy1ydjMyK3N0a3A1Lgo+IAo+IElmIHlvdSBh
cmUgZmluZSB3aXRoIHB1c2hpbmcgbW9yZSBzdHVmZiB0byB0aGlzIGJyYW5jaCwgcGlja2luZyB1
cCAKPiB0aGUgZml4IGZvciB0aGUgZHVwbGljYXRlZCB0ZXN0IGdldHRpbWVvZmRheV9iYWQyICg3
KSB3b3VsZCBiZSBuaWNlLCB0b28uCgpBbmQgdGhlIHBwb2xsKCkgYXJndW1lbnQgY2xlYW51cCAo
MTApIGZvciB0aGF0IG1hdHRlci4KClpoYW5namluOgoKSU1PIGl0IHdvdWxkIGJlIG1vcmUgY29u
dmVuaWVudCB0byBtb3ZlIGdlbmVyaWMgY2xlYW51cCBwYXRjaGVzIHRvIHRoZQpiZWdpbm5pbmcg
b2YgdGhlIHNlcmllcy4KV2hlbiB0aGUgcmV2aWV3ZXJzIGFyZSBmb2N1c3Npbmcgb24gdGhlIHJl
YWwgY2hhbmdlcyB0aGV5IHdvbid0IGJlCmludGVycnVwdGVkIGJ5IHRoZSBjbGVhbnVwcy4gQWxz
byB0aGUgbWFpbnRhaW5lciBjYW4gbW9yZSBlYXNpbHkgcGljawp0aGVtIHVwIGluZGVwZW5kZW50
bHksIHNvIHRoZXkgYXJlIGRlYWx0IHdpdGggYW5kIG5vYm9keSBoYXMgdG8gd29ycnkKYWJvdXQg
dGhlbSBhbnltb3JlLgoKVGhvbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
