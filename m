Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFAFC25B75
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 19:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sva9QnPdoGVNKpPiVptkf4Kpf0JtUcjpDTI9VP7JLCU=; b=um3PxU7Cdw8gJ7
	Bzn630FmPWGx2gZnV2ZJdwiK8+Aiotse2B34f/ur/Nuw33Qr3v1eBGMyYIrzCy5T5PdRuvfB9ySGp
	tZbo6IjbZd5/mYE7cA0/+K9c9zWuJG/ed/OZS9UIehGjqPlM+joVPwoAMaQe7NPAbetaEGNj1GQnm
	LFOyLWjYRXdvry/U9WV14La1XZmmWFSCmQLNdBG+NKzGvSG6EpsGaXlu5lBNKGuHT8UYBB0qTnl+s
	92JFdDr9gEG2/ekgj41PCrKl4Q7uqnrRfcBehy8/rTeoRPVNQ3QFKyqmZZx54ngSzYgPS1PxBRO4S
	lgWJqXeyGhXhhvv49/gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6xsL-0000000Gxtq-35qG;
	Tue, 14 May 2024 19:31:49 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6xsI-0000000Gxst-0lhO
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 19:31:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 80D0BCE12FE;
	Tue, 14 May 2024 19:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56FDBC2BD10;
	Tue, 14 May 2024 19:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715715101;
	bh=Se3Ij8G283o4D8/qcripghOev92UNfpmzpuWpKYRLZ0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DfV27Ypb9DUvKPmZ1am0CxQXDO+ouVeL4LJZgUYe35yJPaFRkBqmI5HGhUiUkGIp2
	 urZIW/6Hx1MHSOG9mF7TIWBpMaCVwfab/uUZZrdidwMqzJTbIopXD9/LNs7bEpS2M6
	 aceqBh5tXX79S+7rMaEQ2EuxSPz1VR+N230Of4BmNUBRMVELVeLgchHn5nsBWKqgqR
	 oVYDu3KUvODgxvR83K9SK/olDocN/FyKkuiFwoXguQvjVPxXE2tOrozgpT/lO2UqKo
	 YDSy0QwJbyejnaH4W02iFtelUOu9vl73PWhmYHqvSuALLfB/xyrHymtDRHKI0fhrEM
	 psIL73cdwNqBw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v2 4/8] riscv: mm: Add memory hotplugging support
In-Reply-To: <CAHVXubh8VpOmFqXrAN+G_Om-+6VjfeEyTRAFp8EWae3mFgjB=Q@mail.gmail.com>
References: <20240514140446.538622-1-bjorn@kernel.org>
 <20240514140446.538622-5-bjorn@kernel.org>
 <CAHVXubh8VpOmFqXrAN+G_Om-+6VjfeEyTRAFp8EWae3mFgjB=Q@mail.gmail.com>
Date: Tue, 14 May 2024 21:31:38 +0200
Message-ID: <87eda442cl.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_123146_542200_E3DBFCF0 
X-CRM114-Status: GOOD (  10.46  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, virtualization@lists.linux-foundation.org, Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IE9uIFR1
ZSwgTWF5IDE0LCAyMDI0IGF0IDQ6MDXigK9QTSBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwu
b3JnPiB3cm90ZToKCj4+ICtpbnQgX19yZWYgYXJjaF9hZGRfbWVtb3J5KGludCBuaWQsIHU2NCBz
dGFydCwgdTY0IHNpemUsIHN0cnVjdCBtaHBfcGFyYW1zICpwYXJhbXMpCj4+ICt7Cj4+ICsgICAg
ICAgaW50IHJldDsKPj4gKwo+PiArICAgICAgIGNyZWF0ZV9saW5lYXJfbWFwcGluZ19yYW5nZShz
dGFydCwgc3RhcnQgKyBzaXplLCAwLCAmcGFyYW1zLT5wZ3Byb3QpOwo+PiArICAgICAgIGZsdXNo
X3RsYl9hbGwoKTsKPj4gKyAgICAgICByZXQgPSBfX2FkZF9wYWdlcyhuaWQsIHN0YXJ0ID4+IFBB
R0VfU0hJRlQsIHNpemUgPj4gUEFHRV9TSElGVCwgcGFyYW1zKTsKPj4gKyAgICAgICBpZiAocmV0
KSB7Cj4+ICsgICAgICAgICAgICAgICByZW1vdmVfbGluZWFyX21hcHBpbmcoc3RhcnQsIHNpemUp
Owo+PiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPj4gKyAgICAgICB9Cj4+ICsKPgo+IFlv
dSBuZWVkIHRvIGZsdXNoIHRoZSBUTEIgaGVyZSB0b28gc2luY2UgX19hZGRfcGFnZXMoKSBwb3B1
bGF0ZXMgdGhlCj4gcGFnZSB0YWJsZSB3aXRoIHRoZSBuZXcgdm1lbW1hcCBtYXBwaW5nIChvbmx5
IGJlY2F1c2UgcmlzY3YgYWxsb3dzIHRvCj4gY2FjaGUgaW52YWxpZCBlbnRyaWVzLCBJJ2xsIGFk
YXB0IHRoaXMgaW4gbXkgbmV4dCB2ZXJzaW9uIG9mIFN2dnB0Ywo+IHN1cHBvcnQpLgo+Cj4+ICsg
ICAgICAgbWF4X3BmbiA9IFBGTl9VUChzdGFydCArIHNpemUpOwo+PiArICAgICAgIG1heF9sb3df
cGZuID0gbWF4X3BmbjsKPj4gKyAgICAgICByZXR1cm4gMDsKPj4gK30KPj4gKwo+PiArdm9pZCBf
X3JlZiBhcmNoX3JlbW92ZV9tZW1vcnkodTY0IHN0YXJ0LCB1NjQgc2l6ZSwgc3RydWN0IHZtZW1f
YWx0bWFwICphbHRtYXApCj4+ICt7Cj4+ICsgICAgICAgX19yZW1vdmVfcGFnZXMoc3RhcnQgPj4g
UEFHRV9TSElGVCwgc2l6ZSA+PiBQQUdFX1NISUZULCBhbHRtYXApOwo+PiArICAgICAgIHJlbW92
ZV9saW5lYXJfbWFwcGluZyhzdGFydCwgc2l6ZSk7Cj4KPiBZb3UgbmVlZCB0byBmbHVzaCB0aGUg
VExCIGhlcmUgdG9vLgoKSSdsbCBhZGRyZXNzIGFsbCBvZiB0aGUgYWJvdmUgaW4gdGhlIG5leHQg
dmVyc2lvbi4gVGhhbmtzIGZvciByZXZpZXdpbmcKdGhlIHNlcmllcyEKCgpCasO2cm4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
