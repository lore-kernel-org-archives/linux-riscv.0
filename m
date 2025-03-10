Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E52C282DE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 19:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S1BSNuMUeDBHfQIeSNWizY0I6Zd4QoPpwlQ+B/PJ9vM=; b=z6koDIuTKOiaJp
	ENbSXZBVoLy/ozWW4nSQcEmjH3AKuNSkonDaI+IL21/1kRNAEzzrXKvWLcwqnNhoHWGrweeIX/mfh
	J1Wid1W3DXvuIdUeGMFQPZfWSl7OlCyKuDRaiyGR2P6QV38d6Szetbis7Oelfy0Ix/ZjOhiixx96x
	/9+YBIMfmyZr7EH0RiXq8Oqf6w9fbqFKzYNmDDsOM7B2oEk67tTc/M1eoSZFIVfLrj6re/wmrrNgR
	Gf7tjLBMk4jm2EzouMNfgNvrIYPqdhFKcqn/uzP6cPRXXfwnVQVjb7lTSD0wOVkcFSckE6r+6Rgq3
	BDd7w6BJw0hftXqfkiuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1triUR-00000003hxB-10v6;
	Mon, 10 Mar 2025 19:08:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1triUO-00000003hvx-1uXK
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 19:08:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DE29BA46182;
	Mon, 10 Mar 2025 19:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44CD0C4CEE5;
	Mon, 10 Mar 2025 19:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741633714;
	bh=GqmO+njjlVZaD53TkAjsULATLMQpxKPpyMnJa0HozUk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VZE1OGlxbVyHaKZEYerhJqaBrWHZIVVvrjv/y3wXC88U3VbdOtZn69yDwqPKl7lli
	 8mo1IPVUa07rdI5o1mvhDYkYZVKr0Ip++7TPOsT5/HkgQRdZ1XQImlSy3mq7H1X3PH
	 pUlm7iIDz5Dhckyz8QJdpXy3oufTO+PhTLtJeyooXQOjnMu+KDbR4Q37xPyjACmRvd
	 tTCh6TvQ3pafHivknrHy7LUqAvjwv52mI0mKby8BN6pWjDn6vR9CzF9piRYtDyBwdM
	 yfekuSTnCiU03ceywhF3/UoolrvLhxpZGTcmr4NONkInh2Z6Ai2v4t3o2m8JB7V3Ch
	 wY/v6SQs7a3cQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andybnac@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
Cc: Andy Chiu <andybnac@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, bjorn@rivosinc.com, puranjay12@gmail.com,
 alexghiti@rivosinc.com, yongxuan.wang@sifive.com, greentime.hu@sifive.com,
 nick.hu@sifive.com, nylon.chen@sifive.com, tommy.wu@sifive.com,
 eric.lin@sifive.com, viccent.chen@sifive.com, zong.li@sifive.com,
 samuel.holland@sifive.com
Subject: Re: [PATCH v3 6/7] riscv: add a data fence for CMODX in the kernel
 mode
In-Reply-To: <20241127172908.17149-7-andybnac@gmail.com>
References: <20241127172908.17149-1-andybnac@gmail.com>
 <20241127172908.17149-7-andybnac@gmail.com>
Date: Mon, 10 Mar 2025 20:08:31 +0100
Message-ID: <87ldtck8k0.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_120836_566681_664729C9 
X-CRM114-Status: GOOD (  19.44  )
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

QW5keSBDaGl1IDxhbmR5Ym5hY0BnbWFpbC5jb20+IHdyaXRlczoKCj4gUklTQy1WIHNwZWMgZXhw
bGljaXRseSBjYWxscyBvdXQgdGhhdCBhIGxvY2FsIGZlbmNlLmkgaXMgbm90IGVub3VnaCBmb3IK
PiB0aGUgY29kZSBtb2RpZmljYXRpb24gdG8gYmUgdmlzYmxlIGZyb20gYSByZW1vdGUgaGFydC4g
SW4gZmFjdCwgaXQKPiBzdGF0ZXM6Cj4KPiBUbyBtYWtlIGEgc3RvcmUgdG8gaW5zdHJ1Y3Rpb24g
bWVtb3J5IHZpc2libGUgdG8gYWxsIFJJU0MtViBoYXJ0cywgdGhlCj4gd3JpdGluZyBoYXJ0IGFs
c28gaGFzIHRvIGV4ZWN1dGUgYSBkYXRhIEZFTkNFIGJlZm9yZSByZXF1ZXN0aW5nIHRoYXQgYWxs
Cj4gcmVtb3RlIFJJU0MtViBoYXJ0cyBleGVjdXRlIGEgRkVOQ0UuSS4KPgo+IFRodXMsIGFkZCBh
IGZlbmNlIGhlcmUgdG8gb3JkZXIgZGF0YSB3cml0ZXMgYmVmb3JlIG1ha2luZyB0aGUgSVBJLgo+
Cj4gU2lnbmVkLW9mZi1ieTogQW5keSBDaGl1IDxhbmR5Ym5hY0BnbWFpbC5jb20+Cj4gLS0tCj4g
IGFyY2gvcmlzY3YvbW0vY2FjaGVmbHVzaC5jIHwgMTUgKysrKysrKysrKysrKystCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNoLmMgYi9hcmNoL3Jpc2N2L21tL2NhY2hlZmx1c2gu
Ywo+IGluZGV4IGI4MTY3MjcyOTg4Ny4uYjJlNGI4MTc2M2Y4IDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3YvbW0vY2FjaGVmbHVzaC5jCj4gKysrIGIvYXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNoLmMK
PiBAQCAtMjQsNyArMjQsMjAgQEAgdm9pZCBmbHVzaF9pY2FjaGVfYWxsKHZvaWQpCj4gIAo+ICAJ
aWYgKG51bV9vbmxpbmVfY3B1cygpIDwgMikKPiAgCQlyZXR1cm47Cj4gLQllbHNlIGlmIChyaXNj
dl91c2Vfc2JpX2Zvcl9yZmVuY2UoKSkKPiArCj4gKwkvKgo+ICsJICogTWFrZSBzdXJlIGFsbCBw
cmV2aW91cyB3cml0ZXMgdG8gdGhlIEQkIGFyZSBvcmRlcmVkIGJlZm9yZSBtYWtpbmcKPiArCSAq
IHRoZSBJUEkuIFRoZSBSSVNDLVYgc3BlYyBzdGF0ZXMgdGhhdCBhIGhhcnQgbXVzdCBleGVjdXRl
IGEgZGF0YSBmZW5jZQo+ICsJICogYmVmb3JlIHRyaWdnZXJpbmcgYSByZW1vdGUgZmVuY2UuaSBp
biBvcmRlciB0byBtYWtlIHRoZSBtb2RpZmljYXRpb24KPiArCSAqIHZpc2FibGUgZm9yIHJlbW90
ZSBoYXJ0cy4KPiArCSAqCj4gKwkgKiBJUElzIG9uIFJJU0MtViBhcmUgdHJpZ2dlcmVkIGJ5IE1N
SU8gd3JpdGVzIHRvIGVpdGhlciBDTElOVCBvcgo+ICsJICogUy1JTVNJQywgc28gdGhlIGZlbmNl
IGVuc3VyZXMgcHJldmlvdXMgZGF0YSB3cml0ZXMgImhhcHBlbiBiZWZvcmUiCj4gKwkgKiB0aGUg
TU1JTy4KPiArCSAqLwo+ICsJUklTQ1ZfRkVOQ0Uodywgbyk7CgooSSBsb3ZlIHRoZSBzdWJtaXQv
cmV2aWV3IGxhdGVuY3kgaGVyZSEgOy0pKQoKRldJVywgdGhlIGZvciBTLUlNU0lDIHRoZSB3cml0
ZSBpcyBhbHJlYWR5IHdyaXRlbCgpLCBzbyB3ZSdsbCBoYXZlIHRoZQp0ZXh0IHBhdGNoaW5nIGFu
ZCBJUEkgb3JkZXJlZC4gUmVnYXJkbGVzcywgdGhlcmUncyBtb3JlIHRoYW4gb25lIGZsYXZvcgpv
ZiBJUEkgb24gUklTQy1WIQoKUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9z
aW5jLmNvbT4KCj4gKwlpZiAocmlzY3ZfdXNlX3NiaV9mb3JfcmZlbmNlKCkpCj4gIAkJc2JpX3Jl
bW90ZV9mZW5jZV9pKE5VTEwpOwo+ICAJZWxzZQo+ICAJCW9uX2VhY2hfY3B1KGlwaV9yZW1vdGVf
ZmVuY2VfaSwgTlVMTCwgMSk7Cj4gLS0gCj4gMi4zOS4zIChBcHBsZSBHaXQtMTQ1KQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
