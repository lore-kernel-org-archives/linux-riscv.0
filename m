Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED9FC9832F
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 02:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JBNF83FaP8k47AUZEnYVrYWjj4zfAVBzktGk8+lrsW4=; b=ywkcD1kSt1S8ux
	9K2tsSZGW8FaQ8jDzODE1y2OtcXQl8cOBShl+o9JP6Cu2PsGGtWPCI7b1TyOCrUH9PYUVmIk20g6t
	7AF+lJ4nWjl3UVbzlJqOCUUgF7bPVwEQenpYF4pxC1Ot9ksDPELD5ZhZIaYaBoUJEy/t5GEQQg/YC
	SU/AELIrl2virEKf6gED89x1tXEyEFsIldcejgown+vFkruu+UYO+r8f8o/Zb9mAK9bdAVTMIycxj
	6/bvGrN8zGF5PYWJUyNgStY/iqbtlH3E4GCw8o+zdE2xQjgaht+qJjKizLdI/Edodu8k2v3csbHuA
	fWxyxnleFLNPSXzRwdaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB1QG-0000000HC8Z-0LHK;
	Mon, 28 Sep 2026 02:48:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB1QF-0000000HC8G-18P1
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 02:48:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A215A4451F
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 02:48:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844A91F0089A
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 02:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790563733;
	bh=YZXmNamni8YTdkgj3WsVi9gU+V406f6mQymnA8E88y0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O25pkvFHPnrIrFqD4jTGb58pzeF/yYdz+xqlud6LvYLra40cEEfQW5YVOGDAi1+yq
	 WtTq52ls8MYgjOKyFspGXIbInelB+hKEBDO5TT0OWe6OZGinzQp6HhGD4F67v+hvqY
	 ppriEstVjVqnmzJeKR0y48f9O0JuR6ACyGsS0llxzK9xjAUnxKguffRUk1P4tc/dp/
	 wCimEJYqg5qIHscksIE7jZ3a1BOFofxmNWSzDrcFKKWrM7NJWA6eTM089/fvoaCIEX
	 Qp6vJhZJ97UA9xb1WCxQ+x8+nm2t4+LeXDylaENFl4AjkT438bc5izWWWaXpPHyYoQ
	 1/ewTcsMuEi6A==
Received: by mail-qk2-f39.google.com with SMTP id d75a77b69052e-5332bdd8296so25098181cf.2
        for <linux-riscv@lists.infradead.org>; Sun, 27 Sep 2026 19:48:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByqX1TMvLrF6z16s91434RWNZyOWT13Z8c/jihKMNXx+/0zh/TNteQDX10gLm64N+tue+GIJ4iu1ySdrA==@lists.infradead.org
X-Gm-Message-State: AFuF++nynnEmnurgvV5zpUmd9E54LKBZBDA1VmpKduu5Zop6ao0PdnNE
	CufH9P3vlVhXi9x89QZUXa7HcqVgk6Q/cBhR0R/gNAkZnsDGvy89J3PnLkpv9ASwF2NUh5/LeYD
	r+FSzaOCgbr8ICC6CEUGkLbi5UOoB4Rw=
X-Received: by 2002:a05:620a:2614:b0:93a:2bdc:cd57 with SMTP id
 af79cd13be357-93c43b7f72amr1824335585a.2.1790563732750; Sun, 27 Sep 2026
 19:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260911025613.1220845-1-zhanghongru@xiaomi.com>
 <arFYRAa-i7CIwmHL@gremlin> <arF-E3Nsw9ZliH0t@casper.infradead.org>
 <arI_w2wTfA00Mgy9@gremlin> <armexcXDiG8ryZd6@casper.infradead.org>
In-Reply-To: <armexcXDiG8ryZd6@casper.infradead.org>
From: Barry Song <baohua@kernel.org>
Date: Mon, 28 Sep 2026 10:48:41 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xuFi7K+crAcFQ998SxXS0xPM6QeA34JV+6+Sy005rXLg@mail.gmail.com>
X-Gm-Features: AclHuK-KBiQtm0KE630BoXAk92dmhRT-WqzJYFoYV9V1f9Qw5fyAD0u8MfblD04
Message-ID: <CAGsJ_4xuFi7K+crAcFQ998SxXS0xPM6QeA34JV+6+Sy005rXLg@mail.gmail.com>
Subject: Re: [PATCH v6] mm: retry page faults once under the per-VMA lock
To: Matthew Wilcox <willy@infradead.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Hongru Zhang <zhanghongru06@gmail.com>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, surenb@google.com, 
	david@kernel.org, liam@infradead.org, mhocko@suse.com, rppt@kernel.org, 
	shakeel.butt@linux.dev, vbabka@kernel.org, zhaonanzhe@xiaomi.com, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, 
	chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, linuxppc-dev@lists.ozlabs.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, agordeev@linux.ibm.com, 
	gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, linux-s390@vger.kernel.org, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de, x86@kernel.org, 
	hpa@zytor.com, Hongru Zhang <zhanghongru@xiaomi.com>
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

T24gTW9uLCBTZXAgMjgsIDIwMjYgYXQgNjo1NeKAr0FNIE1hdHRoZXcgV2lsY294IDx3aWxseUBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgU2VwIDIyLCAyMDI2IGF0IDA5OjU1OjIz
QU0gKzAxMDAsIExvcmVuem8gU3RvYWtlcyAoQVJNKSB3cm90ZToKPiA+IE9uIE1vbiwgU2VwIDIx
LCAyMDI2IGF0IDA3OjU3OjIzUE0gKzAxMDAsIE1hdHRoZXcgV2lsY294IHdyb3RlOgo+ID4gPiBt
b3JlIHRvIHNheSBvbiB0aGlzIGluIHR3byB3ZWVrcyBhdCBQbHVtYmVycy4KPiA+Cj4gPiBJIGxv
b2sgZm9yd2FyZCB0byBpdCA6KQo+Cj4gU28gd2hpbGUgZG9pbmcgbXkgc2xpZGVzLCBJIHJlYWxp
c2VkIHRoYXQgd2hhdCB3ZSBuZWVkIHRvIGF2b2lkIGRvaW5nCj4gaXMgKGEpIHNsZWVwaW5nIHdo
aWxlIGhvbGRpbmcgdGhlIG1tYXBfbG9jayAoYikgcmV0dXJuaW5nIFJFVFJZIHdoaWxlCj4gaG9s
ZGluZyB0aGUgVk1BIGxvY2sKPgo+IEFuZCB0aGF0IHR1cm5zIG91dCB0byBiZSBhcyBzaW1wbGUg
YXMgdGhpcyBwYXRjaDoKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21tLmggYi9pbmNs
dWRlL2xpbnV4L21tLmgKPiBpbmRleCBkZDA5YzQzOGZhMjMuLjk0ZWQyMzMzZjhkOCAxMDA2NDQK
PiAtLS0gYS9pbmNsdWRlL2xpbnV4L21tLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L21tLmgKPiBA
QCAtNzIzLDYgKzcyMyw4IEBAIGVudW0gewo+ICAgKi8KPiAgc3RhdGljIGlubGluZSBib29sIGZh
dWx0X2ZsYWdfYWxsb3dfcmV0cnlfZmlyc3QoZW51bSBmYXVsdF9mbGFnIGZsYWdzKQo+ICB7Cj4g
KyAgICAgICBpZiAoZmxhZ3MgJiBGQVVMVF9GTEFHX1ZNQV9MT0NLKQo+ICsgICAgICAgICAgICAg
ICByZXR1cm4gZmFsc2U7Cj4gICAgICAgICByZXR1cm4gKGZsYWdzICYgRkFVTFRfRkxBR19BTExP
V19SRVRSWSkgJiYKPiAgICAgICAgICAgICAoIShmbGFncyAmIEZBVUxUX0ZMQUdfVFJJRUQpKTsK
PiAgfQo+Cj4gT0ssIHRoaXMgaXMgYSBoYWNrLiAgVGhlIGZ1bmN0aW9uIGlzIHNwZWN0YWN1bGFy
bHkgYmFkbHkgbmFtZWQsIGFuZAo+IG5lZWRzIHRvIGJlIHJlbmFtZWQgYmVmb3JlIGEgcGF0Y2gg
Y2FuIGdvIHVwc3RyZWFtLiAgQnV0IHRoaXMgc2hvdWxkCj4gZml4IHRoZSBjb250ZW50aW9uIG9u
IG1tYXBfbG9jay4KClRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLgpUaGlzIGlzIGV4YWN0bHkg
d2hhdCB3ZSBkaWQgaW4gQW5kcm9pZCBDb21tb24gS2VybmVsIGJlZm9yZSB3ZSBoYWQKTG9yZW56
bydzIHByb3Bvc2FsIChieXBhc3NpbmcgYGZhdWx0X2ZsYWdfYWxsb3dfcmV0cnlfZmlyc3QoKWAp
OgoKaHR0cHM6Ly9hbmRyb2lkLmdvb2dsZXNvdXJjZS5jb20va2VybmVsL2NvbW1vbi8rLzFiOWIw
NDVhNTg2MjQ1Y2MxYzI5YjI3NDdjNjU4NjIzNGM3ZjViYWQlNUUlMjEvI0YyCgpBdCB0aGF0IHRp
bWUsIHdlIGNvdWxkbid0IG1vZGlmeSBBQ0sgd2l0aCBhIEdLSSBob29rIHRoYXQgaW50cm9kdWNl
ZAphIG5ldyBmbGFnLiBBbGwgcHJldmlvdXMgdmVyc2lvbnMgb2YgdGhpcyBwYXRjaHNldCBpbnRy
b2R1Y2VkIG5ldwpmbGFncywgd2hpY2ggd291bGQgaGF2ZSBicm9rZW4gdGhlIEtNSS4KU28gd2Ug
aGFkIHRvIGNob29zZSBiZXR3ZWVuIHR3byBldmlsczoKMS4gbW1hcF9sb2NrIGNvbnRlbnRpb24K
Mi4gVk1BIGxvY2sgY29udGVudGlvbgpXZSBjaG9zZSB0aGUgbGVzc2VyIGV2aWwg4oCUIG5vLiAy
IOKAlCBhbmQgc2VudCB0aGUgQW5kcm9pZCBob29rIGZvcgptZXJnaW5nIGludG8gQUNLLgoKTm93
IHRoYXQgd2UgaGF2ZSBMb3JlbnpvJ3MgcHJvcG9zYWwsIHdoaWNoIGRvZXNuJ3QgcmVxdWlyZSBh
bnkgbmV3CmZsYWcsIHdlIGFyZSBhZGRpbmcgYSBuZXcgQW5kcm9pZCBob29rIGp1c3QgdG8gbWlt
aWMgd2hhdCBMb3JlbnpvJ3MKcHJvcG9zYWwgYWxyZWFkeSBkb2VzOgpodHRwczovL2FuZHJvaWQt
cmV2aWV3Lmdvb2dsZXNvdXJjZS5jb20vYy9rZXJuZWwvY29tbW9uLysvNDMwNzk1Ny8zL2FyY2gv
YXJtNjQvbW0vZmF1bHQuYwoKTm90ZSB0aGF0IExvcmVuem8ncyBwcm9wb3NhbCBhdm9pZHMgbW1h
cF9sb2NrIGNvbnRlbnRpb24gd2l0aG91dAppbnRyb2R1Y2luZyBhbnkgbmV3IFZNQSBsb2NrIGNv
bnRlbnRpb24uIEl0IGFsc28gZG9lc24ndCByZXF1aXJlIGEgbmV3CmZsYWcgdGhhdCB3b3VsZCBi
cmVhayBLTUkuIFNvIHRoaXMgaXMgY2xlYXJseSB0aGUgcHJlZmVycmVkIGFwcHJvYWNoLgoKPgo+
IENvdWxkIHNvbWVib2R5IHRyeSBpdD8gIEkndmUgdmVyaWZpZWQgaXQgYm9vdHMgYW5kIHJ1bnMg
c29tZSB1c2Vyc3BhY2UKPiBmaW5lLCBidXQgSSBkb24ndCBoYXZlIHRoZSB3b3JrbG9hZCB0byB0
ZXN0IHRoZSBjb250ZW50aW9uLgoKQm90aCBOYW56aGUgYW5kIEhvbmdydSB0ZXN0ZWQgaXQgYmVm
b3JlIGFuZCByZXBvcnRlZCB0aGUgZm9yayBpc3N1ZS4KCkJlc3QgUmVnYXJkcwpCYXJyeQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
