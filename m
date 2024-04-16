Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD070C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 11:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GMC7QUbCG+2NsXnG3n63UJAfNeYRi/b7VmYR7RPYXfQ=; b=KSm3A2Psr8GVGC
	Zpre4UqQUQyWKRmDGPu2Fk8/dlmXeyhlxx4k7Wyn4LHaNCe07kF/bSlkORpBpNBCP4BPzFsZ1Bw+7
	yHOUeZ2SxElXRja6ulicqeA9GfXyTkArYPiOb8EIbeAZG2yMyhyG13a6BWPJFgQWp7NnHw4AWf2ug
	/3GiTd0TlwpAkfMTg/7/WH3/clCtFqqYvZAdwcnuJdG2mulxXUweWaKI7DolK5CNPfGmpsZ9WTqJE
	0A2pOlTjmgL0v9+LX9NvRDrZUuIiWQnuXyxv+8dduyuqlbDcNQAqOQT5lKwIAKZQwmfXAeDmzmwI4
	r9X/mIQTPpWkBiyCKYrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwga8-0000000BuRL-3vwo;
	Tue, 16 Apr 2024 11:02:32 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwga3-0000000BuPd-0eRs
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 11:02:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 837DDCE0F25;
	Tue, 16 Apr 2024 11:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3845CC113CE;
	Tue, 16 Apr 2024 11:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713265344;
	bh=bkDgWr7XyI1pfPFJlziFtGVw4ovew4FuLAiRHzSxUPg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WdfLqDfI1HZOvcHPxnKxS8UR3ya06gFVkKMTxtYXUfQLGiVD+iYLjLjfs+Cc4Ayu6
	 JkbkQ5r/TOID5m3ht8wZdsRgOfD02I/a2tciX+BhNltGkMqmJETnXK59mqiV7BLYs5
	 0Hnfkwn0ir7rFqPFWZSm4bZEEfaPlxpzGe1r8biQHxpShDstBCWBz6GXbMT4ImHssM
	 fpsAlJsTYaHvI8McL1S07XGqFsa+EKugasztU7N6UjIjUk4kO6gD3dTa0hGjh70ZwO
	 gOJChqN8/gmcu5OGH5mxvMY1TsYYbkYrad78+Rkgy74O7lAxpmpZXrelRy2NdFuTPZ
	 aLfhw0hmzfZhA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Christian Brauner <brauner@kernel.org>, Nam Cao <namcao@linutronix.de>,
 Mike Rapoport <rppt@kernel.org>
Cc: Andreas Dilger <adilger@dilger.ca>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Theodore Ts'o <tytso@mit.edu>, Ext4
 Developers List <linux-ext4@vger.kernel.org>, Conor Dooley
 <conor@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Anders Roxell <anders.roxell@linaro.org>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
In-Reply-To: <20240416-deppen-gasleitung-8098fcfd6bbd@brauner>
References: <20240416-deppen-gasleitung-8098fcfd6bbd@brauner>
Date: Tue, 16 Apr 2024 13:02:20 +0200
Message-ID: <8734rlo9j7.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_040227_578115_E0021F5C 
X-CRM114-Status: GOOD (  22.51  )
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

Q2hyaXN0aWFuIEJyYXVuZXIgPGJyYXVuZXJAa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBbQWRkaW5n
IE1pa2Ugd2hvJ3Mga25vd2xlZGdlYWJsZSBpbiB0aGlzIGFyZWFdCgo+PiA+IEZ1cnRoZXIsIGl0
IHNlZW1zIGxpa2UgcmlzY3YzMiBpbmRlZWQgaW5zZXJ0cyBhIHBhZ2UgbGlrZSB0aGF0IHRvIHRo
ZQo+PiA+IGJ1ZGR5IGFsbG9jYXRvciwgd2hlbiB0aGUgbWVtYmxvY2sgaXMgZnJlZSdkOgo+PiA+
IAo+PiA+ICAgfCBbPGMwMjQ5NjFjPl0gX19mcmVlX29uZV9wYWdlKzB4MmE0LzB4M2VhCj4+ID4g
ICB8IFs8YzAyNGE0NDg+XSBfX2ZyZWVfcGFnZXNfb2srMHgxNTgvMHgzY2MKPj4gPiAgIHwgWzxj
MDI0YjFhND5dIF9fZnJlZV9wYWdlc19jb3JlKzB4ZTgvMHgxMmMKPj4gPiAgIHwgWzxjMGMxNDM1
YT5dIG1lbWJsb2NrX2ZyZWVfcGFnZXMrMHgxYS8weDIyCj4+ID4gICB8IFs8YzBjMTc2NzY+XSBt
ZW1ibG9ja19mcmVlX2FsbCsweDFlZS8weDI3OAo+PiA+ICAgfCBbPGMwYzA1MGIwPl0gbWVtX2lu
aXQrMHgxMC8weGE0Cj4+ID4gICB8IFs8YzBjMTQ0N2M+XSBtbV9jb3JlX2luaXQrMHgxMWEvMHgy
ZGEKPj4gPiAgIHwgWzxjMGMwMGJiNj5dIHN0YXJ0X2tlcm5lbCsweDNjNC8weDZkZQo+PiA+IAo+
PiA+IEhlcmUsIGEgcGFnZSB3aXRoIFZBIDB4ZmZmZmYwMDAgaXMgYSBhZGRlZCB0byB0aGUgZnJl
ZWxpc3QuIFdlIHdlcmUganVzdAo+PiA+IGx1Y2t5ICh1bmx1Y2t5PykgdGhhdCBwYWdlIHdhcyB1
c2VkIGZvciB0aGUgcGFnZSBjYWNoZS4KPj4gCj4+IEkganVzdCBlZHVjYXRlZCBteXNlbGYgYWJv
dXQgbWVtb3J5IG1hcHBpbmcgbGFzdCBuaWdodCwgc28gdGhlIGJlbG93Cj4+IG1heSBiZSBjb21w
bGV0ZSBub25zZW5zZS4gVGFrZSBpdCB3aXRoIGEgZ3JhaW4gb2Ygc2FsdC4KPj4gCj4+IEluIHJp
c2N2J3Mgc2V0dXBfYm9vdG1lbSgpLCB3ZSBoYXZlIHRoaXMgbGluZToKPj4gCW1heF9sb3dfcGZu
ID0gbWF4X3BmbiA9IFBGTl9ET1dOKHBoeXNfcmFtX2VuZCk7Cj4+IAo+PiBJIHRoaW5rIHRoaXMg
aXMgdGhlIHJvb3QgY2F1c2U6IG1heF9sb3dfcGZuIGluZGljYXRlcyB0aGUgbGFzdCBwYWdlCj4+
IHRvIGJlIG1hcHBlZC4gUHJvYmxlbSBpczogbm90aGluZyBwcmV2ZW50cyBQRk5fRE9XTihwaHlz
X3JhbV9lbmQpIGZyb20KPj4gZ2V0dGluZyBtYXBwZWQgdG8gdGhlIGxhc3QgcGFnZSAoMHhmZmZm
ZjAwMCkuIElmIG1heF9sb3dfcGZuIGlzIG1hcHBlZAo+PiB0byB0aGUgbGFzdCBwYWdlLCB3ZSBn
ZXQgdGhlIHJlcG9ydGVkIHByb2JsZW0uCj4+IAo+PiBUaGVyZSBzZWVtcyB0byBiZSBzb21lIGNv
ZGUgdG8gbWFrZSBzdXJlIHRoZSBsYXN0IHBhZ2UgaXMgbm90IHVzZWQKPj4gKHRoZSBjYWxsIHRv
IG1lbWJsb2NrX3NldF9jdXJyZW50X2xpbWl0KCkgcmlnaHQgYWJvdmUgdGhpcyBsaW5lKS4gSXQg
aXMKPj4gdW5jbGVhciB0byBtZSB3aHkgdGhpcyBzdGlsbCBsZXRzIHRoZSBwcm9ibGVtIHNsaXAg
dGhyb3VnaC4KPj4gCj4+IFRoZSBmaXggaXMgc2ltcGxlOiBuZXZlciBsZXQgbWF4X2xvd19wZm4g
Z2V0cyBtYXBwZWQgdG8gdGhlIGxhc3QgcGFnZS4KPj4gVGhlIGJlbG93IHBhdGNoIGZpeGVzIHRo
ZSBwcm9ibGVtIGZvciBtZS4gQnV0IEkgYW0gbm90IGVudGlyZWx5IHN1cmUgaWYKPj4gdGhpcyBp
cyB0aGUgY29ycmVjdCBmaXgsIGZ1cnRoZXIgaW52ZXN0aWdhdGlvbiBuZWVkZWQuCj4+IAo+PiBC
ZXN0IHJlZ2FyZHMsCj4+IE5hbQo+PiAKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5p
dC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPj4gaW5kZXggZmEzNGNmNTUwMzdiLi4xN2NhYjBh
NTI3MjYgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4+ICsrKyBiL2FyY2gv
cmlzY3YvbW0vaW5pdC5jCj4+IEBAIC0yNTEsNyArMjUxLDggQEAgc3RhdGljIHZvaWQgX19pbml0
IHNldHVwX2Jvb3RtZW0odm9pZCkKPj4gIAl9Cj4+ICAKPj4gIAltaW5fbG93X3BmbiA9IFBGTl9V
UChwaHlzX3JhbV9iYXNlKTsKPj4gLQltYXhfbG93X3BmbiA9IG1heF9wZm4gPSBQRk5fRE9XTihw
aHlzX3JhbV9lbmQpOwo+PiArCW1heF9sb3dfcGZuID0gUEZOX0RPV04obWVtYmxvY2tfZ2V0X2N1
cnJlbnRfbGltaXQoKSk7Cj4+ICsJbWF4X3BmbiA9IFBGTl9ET1dOKHBoeXNfcmFtX2VuZCk7Cj4+
ICAJaGlnaF9tZW1vcnkgPSAodm9pZCAqKShfX3ZhKFBGTl9QSFlTKG1heF9sb3dfcGZuKSkpOwo+
PiAgCj4+ICAJZG1hMzJfcGh5c19saW1pdCA9IG1pbig0VUwgKiBTWl8xRywgKHVuc2lnbmVkIGxv
bmcpUEZOX1BIWVMobWF4X2xvd19wZm4pKTsKClllYWgsIEFGQUlVIG1lbWJsb2NrX3NldF9jdXJy
ZW50X2xpbWl0KCkgb25seSBsaW1pdHMgdGhlIGFsbG9jYXRpb24gZnJvbQptZW1ibG9jay4gVGhl
ICJmb3JiaWRkZW4iIHBhZ2UgKFBBIDB4YzAzZmYwMDAgVkEgMHhmZmZmZjAwMCkgd2lsbCBzdGls
bApiZSBhbGxvd2VkIGluIHRoZSB6b25lLgoKSSB0aGluayB5b3VyIHBhdGNoIHJlcXVpcmVzIG1l
bWJsb2NrX3NldF9jdXJyZW50X2xpbWl0KCkgaXMKdW5jb25kaXRpb25hbGx5IGNhbGxlZCwgd2hp
Y2ggY3VycmVudGx5IGlzIG5vdCBkb25lLgoKVGhlIGhhY2sgSSB0cmllZCB3YXMgKHdoaWNoIHNl
ZW1zIHRvIHdvcmspOgoKLS0KZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJj
aC9yaXNjdi9tbS9pbml0LmMKaW5kZXggZmU4ZTE1OTM5NGQ4Li4zYTFmMjVkNDE3OTQgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCisrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCkBA
IC0yNDUsOCArMjQ1LDEwIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9ib290bWVtKHZvaWQp
CiAgICAgICAgICovCiAgICAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR182NEJJVCkpIHsKICAg
ICAgICAgICAgICAgIG1heF9tYXBwZWRfYWRkciA9IF9fcGEofih1bG9uZykwKTsKLSAgICAgICAg
ICAgICAgIGlmIChtYXhfbWFwcGVkX2FkZHIgPT0gKHBoeXNfcmFtX2VuZCAtIDEpKQorICAgICAg
ICAgICAgICAgaWYgKG1heF9tYXBwZWRfYWRkciA9PSAocGh5c19yYW1fZW5kIC0gMSkpIHsKICAg
ICAgICAgICAgICAgICAgICAgICAgbWVtYmxvY2tfc2V0X2N1cnJlbnRfbGltaXQobWF4X21hcHBl
ZF9hZGRyIC0gNDA5Nik7CisgICAgICAgICAgICAgICAgICAgICAgIHBoeXNfcmFtX2VuZCAtPSA0
MDk2OworICAgICAgICAgICAgICAgfQogICAgICAgIH0KIAogICAgICAgIG1pbl9sb3dfcGZuID0g
UEZOX1VQKHBoeXNfcmFtX2Jhc2UpOwotLQoKSSdkIHJlYWxseSBsaWtlIHRvIHNlZSBhbiBhY3R1
YWwgTU0gcGVyc29uIChNaWtlIG9yIEFsZXg/KSBoYXZlIHNvbWUKaW5wdXQgaGVyZSwgYW5kIG5v
dCBzaW1wbHkgbXkgcGFzdGEtb24td2FsbCBhcHByb2FjaC4gOy0pCgoKQmrDtnJuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
