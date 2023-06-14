Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D9DEB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 09:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EBEdxt+8sf3nAwOZ5ZytvSUr0IupPAxqnEqUEDaAVOc=; b=qPR5j3wI5Au8aB
	t+6zACGVvlIPHXxfNipg2lva9xUF7BxoFrZhTC+xaW6R61WUQoF7grAGAr37h2RNYhW+Pe4fCc3X8
	hRPILbTx8rPYrtn+UYREAH4PmiLJxAv0v8OkYjSl5PzErIhfxRJEG+06QD9aRX6bV2YdW5vEny9Ss
	c3vQwlPLZYyGRwE1uCWT84rIJIdgppgVC2qtl1zj/4O3Fsb59SsCmHNmwnML4tcr45Ae3SxWl8SNf
	UGQsSmaY0ur98DngDqNpE7cEfhRUXYQ6yJccKowYot97fIPpx3ki8fQrJhtyzJwCMuJqGMzEjQWFc
	2b+6SFwPCmzkWC52jzwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9NAN-00B81s-1E;
	Wed, 14 Jun 2023 09:51:51 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9NAJ-00B7yk-2H
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 09:51:50 +0000
X-QQ-mid: bizesmtp80t1686736285t42fgc5x
Received: from [192.168.1.114] ( [58.240.82.166])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 14 Jun 2023 17:51:23 +0800 (CST)
X-QQ-SSF: 00200000000000908000000A0000000
X-QQ-FEAT: 3M0okmaRx3jzgAw+wb429lo2o1gXaW/FxYZHzmCIb34GNNzzsix5dtaZLgYla
	op1QCU6hjX5k7wFcefIaFsrzIo6jJoSaPuYUXw0ZO6tVvAM5xqKW8TX1T6xul2qe6EUPlsj
	XXFyj/8VkeYGiamiZdgxSzLqT773i32qA3wEeuA+ZDlo96EEHnIwLt7/SLCTSw3k/xzVBmX
	ZVPO5xF8EHVd7KW+wPVswrIdb7l+/xLVwBHJ2bz+/RkhvIXe/KzTlI1I+oItKt5in7OuR9l
	xthWFkKIvUWzPBNFtzpShYTZSpkd8FmhCHx4ib77G/604w2VCuU/pD47O0thPPcZdaHaGCI
	aeiNVsJu/c1NS6ELWSrLTCO/tplKA==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10273009568546625320
Message-ID: <6B512C74DCAB0BF0+0ad9a892-6933-baa3-0848-1e1efc685c9f@tinylab.org>
Date: Wed, 14 Jun 2023 17:51:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] riscv: move memblock_allow_resize() after lm is ready
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Woody Zhang <woodylab@foxmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <tencent_D656D683705F41324657ED3393C3384C7408@qq.com>
 <CAHVXubiYHQCYkymde2y_okNb2XcE-xVBMj8iZ7kM5d08bhqxiQ@mail.gmail.com>
From: Song Shuai <songshuaishuai@tinylab.org>
In-Reply-To: <CAHVXubiYHQCYkymde2y_okNb2XcE-xVBMj8iZ7kM5d08bhqxiQ@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_025148_060795_1D9B033C 
X-CRM114-Status: GOOD (  25.80  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgrlnKggMjAyMy82LzEyIDE1OjE1LCBBbGV4YW5kcmUgR2hpdGkg5YaZ6YGTOgo+IEhpIFdvb2R5
LAo+IAo+IE9uIFNhdCwgSnVuIDEwLCAyMDIzIGF0IDE6NDnigK9BTSBXb29keSBaaGFuZyA8d29v
ZHlsYWJAZm94bWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBUaGUgaW5pdGlhbCBtZW1ibG9jayBtZXRh
ZGF0YSBpcyBhY2Nlc3NlZCBmcm9tIGtlcm5lbCBpbWFnZSBtYXBwaW5nLiBUaGUKPj4gcmVnaW9u
cyBhcnJheXMgbmVlZCB0byAicmVhbGxvY2F0ZWQiIGZyb20gbWVtYmxvY2sgYW5kIGFjY2Vzc2Vk
IHRocm91Z2gKPj4gbGluZWFyIG1hcHBpbmcgdG8gY292ZXIgbW9yZSBtZW1ibG9jayByZWdpb25z
LiBTbyB0aGUgcmVzaXppbmcgc2hvdWxkCj4+IG5vdCBiZSBhbGxvd2VkIHVudGlsIGxpbmVhciBt
YXBwaW5nIGlzIHJlYWR5LiBOb3RlIHRoYXQgdGhlcmUgYXJlCj4+IG1lbWJsb2NrIGFsbG9jYXRp
b25zIHdoZW4gYnVpbGRpbmcgbGluZWFyIG1hcHBpbmcuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFdv
b2R5IFpoYW5nIDx3b29keWxhYkBmb3htYWlsLmNvbT4KPj4gLS0tCj4+ICAgYXJjaC9yaXNjdi9t
bS9pbml0LmMgfCA0ICsrKy0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2luaXQuYyBiL2Fy
Y2gvcmlzY3YvbW0vaW5pdC5jCj4+IGluZGV4IDllOWRhNjk3MjBjZS4uOGEzM2VjYmI0ZDBmIDEw
MDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L21tL2luaXQuYwo+PiArKysgYi9hcmNoL3Jpc2N2L21t
L2luaXQuYwo+PiBAQCAtMjU4LDcgKzI1OCw2IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9i
b290bWVtKHZvaWQpCj4+ICAgICAgICAgIGRtYV9jb250aWd1b3VzX3Jlc2VydmUoZG1hMzJfcGh5
c19saW1pdCk7Cj4+ICAgICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR182NEJJVCkpCj4+ICAg
ICAgICAgICAgICAgICAgaHVnZXRsYl9jbWFfcmVzZXJ2ZShQVURfU0hJRlQgLSBQQUdFX1NISUZU
KTsKPj4gLSAgICAgICBtZW1ibG9ja19hbGxvd19yZXNpemUoKTsKPj4gICB9Cj4+Cj4+ICAgI2lm
ZGVmIENPTkZJR19NTVUKPj4gQEAgLTEyNTAsNiArMTI0OSw5IEBAIHN0YXRpYyB2b2lkIF9faW5p
dCBzZXR1cF92bV9maW5hbCh2b2lkKQo+PiAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX1NBVFAsIFBG
Tl9ET1dOKF9fcGFfc3ltYm9sKHN3YXBwZXJfcGdfZGlyKSkgfCBzYXRwX21vZGUpOwo+PiAgICAg
ICAgICBsb2NhbF9mbHVzaF90bGJfYWxsKCk7Cj4+Cj4+ICsgICAgICAgLyogRGVwZW5kIG9uIHRo
YXQgTGluZWFyIE1hcHBpbmcgaXMgcmVhZHkgKi8KPj4gKyAgICAgICBtZW1ibG9ja19hbGxvd19y
ZXNpemUoKTsKPj4gKwo+PiAgICAgICAgICBwdF9vcHNfc2V0X2xhdGUoKTsKPj4gICB9Cj4+ICAg
I2Vsc2UKPj4gLS0KPj4gMi4zOS4yCj4+Cj4gCj4gVGhlIGNvbW1pdCBsb2cgZG9lcyBub3QgZGVz
Y3JpYmUgdGhlIGlzc3VlIHRob3JvdWdobHkgZW5vdWdoIHRvIG1lLAo+IG1heWJlIHlvdSBjb3Vs
ZCBwb2ludCB0byB0aGUgYXJtNjQgY29tbWl0IHRoYXQgZGlkIHRoZSBzYW1lPyBJIG1lYW4KPiBj
b21taXQgMjRjYzYxZDhjYjVhICgiYXJtNjQ6IG1lbWJsb2NrOiBkb24ndCBwZXJtaXQgbWVtYmxv
Y2sgcmVzaXppbmcKPiB1bnRpbCBsaW5lYXIgbWFwcGluZyBpcyB1cCIpLgpAQWxleAoKSSByZXBy
b2R1Y2VkIHRoZSBwcm9ibGVtIGFzIHRoZSBhcm02NCBjb21taXQgZGVzY3JpYmVzLgpZb3UgY2Fu
IGZpbmQgdGhlIGNvbXBsZXRlIGxvZyB2aWEgdGhpcyBsaW5rOiBodHRwczovL3Rlcm1iaW4uY29t
L2J4MG8KCkkgY29uc3RydWN0ZWQgdGhlIGR0YiB3aXRoIG51bWVyb3VzIGRpc2NyZXRlIC9tZW1y
ZXNlcnZlLyByZWdpb25zCih0aGUgbnVtYmVycyBvZiB0aGVzZSByZWdpb25zIGFwcHJveGltYXRl
IElOSVRfTUVNQkxPQ0tfUkVHSU9OUykgd2hpY2ggCmZ1bGwgdGhlIHJlc2VydmVkIHJlZ2lvbnMg
dXAuCgpXaGVuIG1lbWJsb2NrX2FsbG93X3Jlc2l6ZSB3YXMgc2V0LCB0aGUgY2FsbGluZyBvZiBt
ZW1ibG9ja19yZXNlcnZlKCkgd291bGQKZG91YmxlL3Jlc2l6ZSB0aGUgcmVzZXJ2ZWQgcmVnaW9u
cyBhbmQgZG8gdGhlIF9fbWVtY29weSgpIGZyb20gdGhlIG9sZCAKcmVnaW9ucyAoIG1hcHBlZCBi
eSBrZXJuZWwpCnRvIHRoZSBuZXcgb25lcyAocHJvdmlkZWQgYnkgX192YSgpKS4KQnV0IGJlZm9y
ZSB0aGUgbGluZWFyIG1hcHBpbmcgd2FzIHJlYWR5IChsaWtlOiBkdXJpbmcgdGhlIGNyZWF0aW5n
IG9mIApsaW5lYXIgbWFwcGluZyksCm1lbWJsb2NrX3Jlc2VydmUoKSB3YXMgY2FsbGVkIGFuZCB0
aGUgbWVtY29weSB3b3VsZCB0cmlnZ2VyIGEgU3RvcmUvQU1PIApwYWdlIGZhdWx0LgoKPiAKPiBB
bm90aGVyIHBvaW50IGlzIHRoYXQgSSB3b3VsZCBub3QgcHV0IHRoaXMgY2FsbCBpbnRvIHNldHVw
X3ZtX2ZpbmFsKCksCj4gSSdkIHJhdGhlciBhZGQgaXQgaW4gcGFnaW5nX2luaXQoKSBhcyBpdCBk
b2VzIG5vdCBzZWVtIGxpa2UgYSBnb29kIGZpdAo+IGZvciBzZXR1cF92bV9maW5hbCgpLiBCdXQg
dGhhdCdzIGEgbml0IHNvIHVwIHRvIHlvdSBvZiBjb3Vyc2UuCj4gCkkgYWdyZWUuCgpAV29vZHkK
Ckkgbm90aWNlZCB5b3VyIFYyIFsxXSBkaWRuJ3QgdGFrZSB0aGlzIHN1Z2dlc3Rpb24sIG1heWJl
IHlvdSBjYW4gdGFrZSBpdCAKYXQgVjMuCkFuZCBpdCB3aWxsIGJlIG1vcmUgc291bmQgaWYgeW91
IHN1cHBsZW1lbnQgdGhlIGNvbW1pdC1tc2cgd2l0aCB0aGUgCnBhbmljIGluZm8gZnJvbSB0aGUg
bG9nLgoKWzFdOiAKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvdGVuY2VudF85
N0Y2QzE5QkFGN0M5OUIyMkJCMTE5OUZFMTZCMjY2QzJCMDdAcXEuY29tLwo+IEFueXdheSwgdGhh
dCdzIGEgZ29vZCBjYXRjaCwgdGhhbmtzIQo+IAo+IEFsZXgKPiAKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgotLSAKVGhhbmtzClNvbmcgU2h1
YWkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
