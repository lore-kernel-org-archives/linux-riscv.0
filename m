Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED94C54E41
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 20:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CU8OxAQKpssX32j1gXWRLnWPbPY/HyDn6+KkXPtZNa0=; b=m+zXUBSfzlg6Fb
	aW5VC5eAUSyEU+c7tzoqI44yTSYFKonC6w7ZzJ03U5KvfBbvqH4xfw3sWNYXAx0cTYlTGYp/gyY4r
	V8BODUxKqT1wBU+mcbmKCbB9LFG2jpXLNrzDwJfCl8eBmvsdWfKjcdc4O4kWQYqxn21QuJHQJlbfT
	GTnSHLenvtmdbb7kH3FDNzyiipAfqcHEziTODgwH9FDjZo52RHfkD2FEW/SLgKCtE1pbFdGKBtZrz
	1Ylk0F0tr2k5/WkiEqsbzCBWxZ3sx+VDtmUh3ZZUHWCbQwCtQC6y7ekrrqwvxZ2eLvtXmGLo6U0v5
	ib+KSAsP7wxP6ml8IJYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhxdJ-00000001mO7-284e;
	Wed, 06 Mar 2024 20:12:57 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhxdG-00000001mMz-1xxd
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 20:12:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2539120002;
	Wed,  6 Mar 2024 20:12:50 +0000 (UTC)
Message-ID: <ca097f2a-59ec-4945-9860-5e380e1665e4@ghiti.fr>
Date: Wed, 6 Mar 2024 21:12:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: compat_vdso: install compat_vdso.so.dbg to
 /lib/modules/*/vdso/
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20231117125807.1058477-1-masahiroy@kernel.org>
 <CAK7LNAStoCja1gnoFmsKikbzGZmKTcTu+Vc7v9zg8B9hwsH+iQ@mail.gmail.com>
 <CAK7LNATVAcj-pa_G-NGBTr9doCACGk1nKCNbxM50-M0mi9q=7w@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAK7LNATVAcj-pa_G-NGBTr9doCACGk1nKCNbxM50-M0mi9q=7w@mail.gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_121254_671280_5B1243E4 
X-CRM114-Status: GOOD (  13.02  )
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

SGkgTWFzYWhpcm8sCgpPbiAyNC8wMi8yMDI0IDA0OjM3LCBNYXNhaGlybyBZYW1hZGEgd3JvdGU6
Cj4gUGluZyB4IDIgPwo+Cj4KPgo+Cj4KPiBPbiBTdW4sIEphbiAyMSwgMjAyNCBhdCA2OjQ44oCv
QU0gTWFzYWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4gd3JvdGU6Cj4+IE9uIEZy
aSwgTm92IDE3LCAyMDIzIGF0IDk6NTjigK9QTSBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBr
ZXJuZWwub3JnPiB3cm90ZToKPj4+ICdtYWtlIHZkc29faW5zdGFsbCcgaW5zdGFsbHMgZGVidWcg
dmRzbyBmaWxlcyB0byAvbGliL21vZHVsZXMvKi92ZHNvLy4KPj4+Cj4+PiBPbmx5IGZvciB0aGUg
Y29tcGF0IHZkc28gb24gcmlzY3YsIHRoZSBpbnN0YWxsYXRpb24gZGVzdGluYXRpb24gZGlmZmVy
czsKPj4+IGNvbXBhdF92ZHNvLnNvLmRiZyBpcyBpbnN0YWxsZWQgdG8gL2xpYi9tb2R1bGUvKi9j
b21wYXRfdmRzby8uCj4+Pgo+Pj4gVG8gZm9sbG93IHRoZSBzdGFuZGFyZCBpbnN0YWxsIGRlc3Rp
bmF0aW9uIGFuZCBzaW1wbGlmeSB0aGUgdmRzb19pbnN0YWxsCj4+PiBsb2dpYywgY2hhbmdlIHRo
ZSBpbnN0YWxsIGRlc3RpbmF0aW9uIHRvIHN0YW5kYXJkIC9saWIvbW9kdWxlcy8qL3Zkc28vLgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5v
cmc+Cj4+PiAtLS0KPj4KPj4gUGluZz8KPj4gKGluIGNhc2UgInlldCBtb3JlIFJJU0MtViB1cGRh
dGVzIiBoYXBwZW5zKQo+Pgo+Pgo+Pgo+Pgo+Pj4gICBhcmNoL3Jpc2N2L01ha2VmaWxlIHwgMiAr
LQo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+
Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvTWFrZWZp
bGUKPj4+IGluZGV4IGE3NGJlNzg2NzhlYi4uNWNiZTU5NjM0NWMxIDEwMDY0NAo+Pj4gLS0tIGEv
YXJjaC9yaXNjdi9NYWtlZmlsZQo+Pj4gKysrIGIvYXJjaC9yaXNjdi9NYWtlZmlsZQo+Pj4gQEAg
LTE0Niw3ICsxNDYsNyBAQCBlbmRpZgo+Pj4gICBlbmRpZgo+Pj4KPj4+ICAgdmRzby1pbnN0YWxs
LXkgICAgICAgICAgICAgICAgICs9IGFyY2gvcmlzY3Yva2VybmVsL3Zkc28vdmRzby5zby5kYmcK
Pj4+IC12ZHNvLWluc3RhbGwtJChDT05GSUdfQ09NUEFUKSAgKz0gYXJjaC9yaXNjdi9rZXJuZWwv
Y29tcGF0X3Zkc28vY29tcGF0X3Zkc28uc28uZGJnOi4uL2NvbXBhdF92ZHNvL2NvbXBhdF92ZHNv
LnNvCj4+PiArdmRzby1pbnN0YWxsLSQoQ09ORklHX0NPTVBBVCkgICs9IGFyY2gvcmlzY3Yva2Vy
bmVsL2NvbXBhdF92ZHNvL2NvbXBhdF92ZHNvLnNvLmRiZwo+Pj4KPj4+ICAgaWZuZXEgKCQoQ09O
RklHX1hJUF9LRVJORUwpLHkpCj4+PiAgIGlmZXEgKCQoQ09ORklHX1JJU0NWX01fTU9ERSkkKENP
TkZJR19BUkNIX0NBTkFBTikseXkpCj4+PiAtLQo+Pj4gMi40MC4xCj4+Pgo+Pgo+PiAtLQo+PiBC
ZXN0IFJlZ2FyZHMKPj4gTWFzYWhpcm8gWWFtYWRhCj4KPgo+IC0tCj4gQmVzdCBSZWdhcmRzCj4g
TWFzYWhpcm8gWWFtYWRhCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2CgoKQ291bGRuJ3QgY2hhbmdpbmcgdGhpcyBsaWJyYXJ5IGluc3RhbGwg
cGF0aCBicmVhayBzb21lIGV4aXN0aW5nIAphcHBsaWNhdGlvbj8gSSBtZWFuIGl0IGtpbmQgb2Yg
YnJlYWtzIHdoZXJlIHRoZSBsaWJyYXJ5IGlzIGV4cGVjdGVkIHRvIApiZSByaWdodD8KClRoYW5r
cywKCkFsZXgKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
