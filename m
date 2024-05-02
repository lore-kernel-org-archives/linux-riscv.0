Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C0AC04FFE
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 16:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=es4nDK1QesC5uUEEscae31K/ban/G9HtiZF9Xw9Lz9k=; b=YWdjeKvLZha9uK
	koCAv48Uomy04C6f/CULzCAFYnYVsghL6Y8pNVNnlJDtQutcbVhQ6k4k32r4A6QVyaaOdsCILYFTd
	Crg447Hjmv3Vqzjs/BlBjOm038FC+AuJ5s4DyGr00k/3PrmySKAxm0sW/rfIt3Mj1g2+/h3tDxX2n
	FucCg7QPqQCMZj2s0kCSu5ZE+MwIVYIggiprtWa+fNkuEfFCctCrfgMhR3tdEki+/amzfM4t8o4ew
	JNpzUJ1GbPzGnVID/ZX3aYmLZ7Z6bUhHvP2q6Z7VzCcYlMgDY4IIapYpNvp41qOgCX429p0iq8QnI
	7JSksMpbySkf+l3CEgig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Z8U-0000000DFuD-381G;
	Thu, 02 May 2024 16:18:18 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Z8R-0000000DFs1-2AeJ
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 16:18:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2B949CE1758;
	Thu,  2 May 2024 16:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE04C113CC;
	Thu,  2 May 2024 16:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714666690;
	bh=6NQhuMcNkmpWazM0HHYky5tZ2j68IK0b4aybNOPTBRY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DVaarcyhyqTPFst4peTVuc9ArbfOqACLBdPeQH2p0+rqkOhyOVV9Xh7OIoX4FknVF
	 Sn7+gecM7Sz2oICS+8bVUzPW07FGUfDKOPvxD8TmgTuEA5XZEG81KISdQ20CO4ZomE
	 M41E8o8MPBSi10WXCPXPdoqB3wxlXwYidlLSQFevLud01ck5Q34NJdqluekPKBsAmO
	 LgNBL0JWTFWd+X3yljpjs2+pQscTMvQ1icWonnkskJYDbFHVjHM7xGVzJwo8bqmkV9
	 nwtSs7vru4n/aufQYAj5IYbSkIEykr+3lvf/Em5TCttCsNh5CvAJLZ6F8X72dNCbZk
	 nSwTGsVhdrjuQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>, Puranjay Mohan
 <puranjay@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pu Lehui <pulehui@huawei.com>,
 puranjay12@gmail.com
Subject: Re: [PATCH bpf-next v2 1/2] riscv, bpf: add internal-only MOV
 instruction to resolve per-CPU addrs
In-Reply-To: <CAEf4Bzb2NY+wuK159Xb8F9Nu4CuVoYJ6WWR3_0LeTAi+zONewQ@mail.gmail.com>
References: <20240430175834.33152-1-puranjay@kernel.org>
 <20240430175834.33152-2-puranjay@kernel.org>
 <CAEf4Bzb2NY+wuK159Xb8F9Nu4CuVoYJ6WWR3_0LeTAi+zONewQ@mail.gmail.com>
Date: Thu, 02 May 2024 18:18:06 +0200
Message-ID: <87jzkcw5kx.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_091815_960577_9295954D 
X-CRM114-Status: GOOD (  15.76  )
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

QW5kcmlpIE5ha3J5aWtvIDxhbmRyaWkubmFrcnlpa29AZ21haWwuY29tPiB3cml0ZXM6Cgo+IE9u
IFR1ZSwgQXByIDMwLCAyMDI0IGF0IDEwOjU44oCvQU0gUHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBTdXBwb3J0IGFuIGluc3RydWN0aW9uIGZvciByZXNv
bHZpbmcgYWJzb2x1dGUgYWRkcmVzc2VzIG9mIHBlci1DUFUKPj4gZGF0YSBmcm9tIHRoZWlyIHBl
ci1DUFUgb2Zmc2V0cy4gVGhpcyBpbnN0cnVjdGlvbiBpcyBpbnRlcm5hbC1vbmx5IGFuZAo+PiB1
c2VycyBhcmUgbm90IGFsbG93ZWQgdG8gdXNlIHRoZW0gZGlyZWN0bHkuIFRoZXkgd2lsbCBvbmx5
IGJlIHVzZWQgZm9yCj4+IGludGVybmFsIGlubGluaW5nIG9wdGltaXphdGlvbnMgZm9yIG5vdyBi
ZXR3ZWVuIEJQRiB2ZXJpZmllciBhbmQgQlBGCj4+IEpJVHMuCj4+Cj4+IFJJU0MtViB1c2VzIGdl
bmVyaWMgcGVyLWNwdSBpbXBsZW1lbnRhdGlvbiB3aGVyZSB0aGUgb2Zmc2V0cyBmb3IgQ1BVcwo+
PiBhcmUga2VwdCBpbiBhbiBhcnJheSBjYWxsZWQgX19wZXJfY3B1X29mZnNldFtjcHVfbnVtYmVy
XS4gUklTQ1Ygc3RvcmVzCj4+IHRoZSBhZGRyZXNzIG9mIHRoZSB0YXNrX3N0cnVjdCBpbiBUUCBy
ZWdpc3Rlci4gVGhlIGZpcnN0IGVsZW1lbnQgaW4KPj4gdGFza19zdHJ1Y3QgaXMgc3RydWN0IHRo
cmVhZF9pbmZvLCBhbmQgd2UgY2FuIGdldCB0aGUgY3B1IG51bWJlciBieQo+PiByZWFkaW5nIGZy
b20gdGhlIFRQIHJlZ2lzdGVyICsgb2Zmc2V0b2Yoc3RydWN0IHRocmVhZF9pbmZvLCBjcHUpLgo+
Pgo+PiBPbmNlIHdlIGhhdmUgdGhlIGNwdSBudW1iZXIgaW4gYSByZWdpc3RlciB3ZSByZWFkIHRo
ZSBvZmZzZXQgZm9yIHRoYXQKPj4gY3B1IGZyb20gYWRkcmVzczogJl9fcGVyX2NwdV9vZmZzZXQg
KyBjcHVfbnVtYmVyIDw8IDMuIFRoZW4gd2UgYWRkIHRoaXMKPj4gb2Zmc2V0IHRvIHRoZSBkZXN0
aW5hdGlvbiByZWdpc3Rlci4KPj4KPj4gVG8gbWVhc3VyZSB0aGUgaW1wcm92ZW1lbnQgZnJvbSB0
aGlzIGNoYW5nZSwgdGhlIGJlbmNobWFyayBpbiBbMV0gd2FzCj4+IHVzZWQgb24gUWVtdToKPj4K
Pj4gQmVmb3JlOgo+PiBnbG9iLWFyci1pbmMgICA6ICAgIDEuMTI3IMKxIDAuMDEzTS9zCj4+IGFy
ci1pbmMgICAgICAgIDogICAgMS4xMjEgwrEgMC4wMDRNL3MKPj4gaGFzaC1pbmMgICAgICAgOiAg
ICAwLjY4MSDCsSAwLjA1Mk0vcwo+Pgo+PiBBZnRlcjoKPj4gZ2xvYi1hcnItaW5jICAgOiAgICAx
LjEzOCDCsSAwLjAxMU0vcwo+PiBhcnItaW5jICAgICAgICA6ICAgIDEuMzY2IMKxIDAuMDA2TS9z
Cj4+IGhhc2gtaW5jICAgICAgIDogICAgMC42NzYgwrEgMC4wMDFNL3MKPj4KPj4gWzFdIGh0dHBz
Oi8vZ2l0aHViLmNvbS9hbmFrcnlpa28vbGludXgvY29tbWl0LzhkZWM5MDA5NzVlZgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBQdXJhbmpheSBNb2hhbiA8cHVyYW5qYXlAa2VybmVsLm9yZz4KPj4gLS0t
Cj4+ICBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIHwgMjQgKysrKysrKysrKysrKysr
KysrKysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyBiL2FyY2gvcmlzY3YvbmV0
L2JwZl9qaXRfY29tcDY0LmMKPj4gaW5kZXggMTVlNDgyZjJjNjU3Li45OWQ3MDA2ZjE0MjAgMTAw
NjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPj4gKysrIGIvYXJj
aC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+PiBAQCAtMTIsNiArMTIsNyBAQAo+PiAgI2lu
Y2x1ZGUgPGxpbnV4L3N0b3BfbWFjaGluZS5oPgo+PiAgI2luY2x1ZGUgPGFzbS9wYXRjaC5oPgo+
PiAgI2luY2x1ZGUgPGFzbS9jZmkuaD4KPj4gKyNpbmNsdWRlIDxhc20vcGVyY3B1Lmg+Cj4+ICAj
aW5jbHVkZSAiYnBmX2ppdC5oIgo+Pgo+PiAgI2RlZmluZSBSVl9GRU5UUllfTklOU05TIDIKPj4g
QEAgLTEwODksNiArMTA5MCwyNCBAQCBpbnQgYnBmX2ppdF9lbWl0X2luc24oY29uc3Qgc3RydWN0
IGJwZl9pbnNuICppbnNuLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCwKPj4gICAgICAgICAg
ICAgICAgICAgICAgICAgZW1pdF9vcihSVl9SRUdfVDEsIHJkLCBSVl9SRUdfVDEsIGN0eCk7Cj4+
ICAgICAgICAgICAgICAgICAgICAgICAgIGVtaXRfbXYocmQsIFJWX1JFR19UMSwgY3R4KTsKPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4+ICsgICAgICAgICAgICAgICB9IGVsc2Ug
aWYgKGluc25faXNfbW92X3BlcmNwdV9hZGRyKGluc24pKSB7Cj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGlmIChyZCAhPSBycykKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBl
bWl0X212KHJkLCBycywgY3R4KTsKCk5vIGJpZ2dpZSwgYnV0IHlvdSBkaWQgbm90IGZvbGQgdGhp
cyBjaGVjayBpbnRvIGVtaXRfbXYoKS4KCj4+ICsjaWZkZWYgQ09ORklHX1NNUAo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC8qIExvYWQgY3VycmVudCBDUFUgbnVtYmVyIGluIFQx
ICovCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW1pdF9sZChSVl9SRUdfVDEs
IG9mZnNldG9mKHN0cnVjdCB0aHJlYWRfaW5mbywgY3B1KSwKPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFJWX1JFR19UUCwgY3R4KTsKPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAvKiA8PCAzIGJlY2F1c2Ugb2Zmc2V0cyBhcmUgOCBieXRlcyAqLwo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVtaXRfc2xsaShSVl9SRUdfVDEsIFJW
X1JFR19UMSwgMywgY3R4KTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBM
b2FkIGFkZHJlc3Mgb2YgX19wZXJfY3B1X29mZnNldCBhcnJheSBpbiBUMiAqLwo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGVtaXRfYWRkcihSVl9SRUdfVDIsICh1NjQpJl9fcGVy
X2NwdV9vZmZzZXQsIGV4dHJhX3Bhc3MsIGN0eCk7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgLyogQWRkIG9mZnNldCBvZiBjdXJyZW50IENQVSB0byAgX19wZXJfY3B1X29mZnNl
dCAqLwo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVtaXRfYWRkKFJWX1JFR19U
MSwgUlZfUkVHX1QyLCBSVl9SRUdfVDEsIGN0eCk7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgLyogTG9hZCBfX3Blcl9jcHVfb2Zmc2V0W2NwdV0gaW4gVDEgKi8KPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBlbWl0X2xkKFJWX1JFR19UMSwgMCwgUlZfUkVHX1Qx
LCBjdHgpOwo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIEFkZCB0aGUgb2Zm
c2V0IHRvIFJkICovCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW1pdF9hZGQo
cmQsIHJkLCBSVl9SRUdfVDEsIGN0eCk7Cj4KPiBpcyB0aGlzIHRoZSByaWdodCBsZXZlbCBvZiBj
b2RlIGluZGVudGF0aW9uPwoKTG9va3Mgd3JvbmcuCgpXaGVuIHRoZSBpbmRlbnQgaXMgZml4ZWQs
IGZlZWwgZnJlZSB0byBhZGQ6CgpBY2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVs
Lm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
