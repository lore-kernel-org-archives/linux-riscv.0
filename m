Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDB9D0C61D
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 14:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VgwNJJrIIv2I+9WAUndzo4ctrUqD2d1e7X21HFbtBXc=; b=TQzimVgEhZADnE
	yEuKQQ8XIl0KZPMdrd44kqy3nYn0ckYEGBIEkuwLiHmwACn8y1Nsp/MZKubBOFAYFZsmntoIoVEa3
	fSnqq0+rXqglWE+VfKveLwqiqE/kd7PJztFOw0MZH9BUbA320BzoVKhjgtPvSdbMogkk9JbFOi3AS
	GA6dtZem9YpNIBpCcesbudNv5XKFZSCfDT/deUcfyMmfVK/ycxq66kk9lO5rDHC6f2QVwyQ0WgIMk
	UIYe9SwyKoiGVsRGlY8ocAhLMvdbbpqNbrFYFahfgfwVGrIrc8CSPNdk5XSKY0XIpMe+nO2IP8u0o
	rUp+pbgxUcYUISeMU8lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LZI-000000044Ai-32MC;
	Fri, 25 Oct 2024 14:45:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LL8-000000041Nl-0rKS
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 14:30:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 83A15A42EC6;
	Fri, 25 Oct 2024 14:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ADA7C4CEE9;
	Fri, 25 Oct 2024 14:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729866654;
	bh=OF/70o8NlOOAbbvPS34QecnaUEGCvVzevoHviGTWZO8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=of9KxQSZRl6hvInqEi5ITtFSy38Asc/iopeslC1Yl6LdQQyfnMOk5spZtwhIZgUE0
	 Y06VQ0lw2gUWFK+TzjA0NugCOpDJhG8Wf9bF04gCKNSNamfic7xDZpYlYuOpwbnphp
	 nHDrvZignvu1A13IoUA+sEK+SBZFkaM6hjSyDvX45MH2dmloHj1ZH5JdP/sbl0/w86
	 0arzE5KY9GblP9BgMMOdmoqK9zKJHKkyePWkXSB5CywvKqqHC0Dh8prcks6IECRMcO
	 rlvPTQQPw+DG6MT/FGNbzOMjpxgXEAhFzBY5rlqYzur/Zo527ZsBCQ9sAKaVhMpJUv
	 zVmi9CDERBkNA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Celeste Liu
 <coelacanthushex@gmail.com>, Celeste Liu via B4 Relay
 <devnull+CoelacanthusHex.gmail.com@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>,
 "Dmitry V. Levin" <ldv@strace.io>, Andrea Bolognani <abologna@redhat.com>,
 Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>,
 Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>, Yao Zi
 <ziyao@disroot.org>, Han Gao <gaohan@iscas.ac.cn>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] riscv/entry: get correct syscall number from
 syscall_get_nr()
In-Reply-To: <871q045ntd.ffs@tglx>
References: <20241017-fix-riscv-syscall-nr-v1-1-4edb4ca07f07@gmail.com>
 <87a5exy2rx.fsf@all.your.base.are.belong.to.us>
 <b72e3d2b-d540-47bf-adec-0ab6eda135d8@gmail.com>
 <8734kpqu8k.fsf@all.your.base.are.belong.to.us> <871q045ntd.ffs@tglx>
Date: Fri, 25 Oct 2024 07:30:53 -0700
Message-ID: <87ldycjluq.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_073058_402036_26A98323 
X-CRM114-Status: GOOD (  15.25  )
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

VGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+IHdyaXRlczoKCj4gT24gTW9uLCBP
Y3QgMjEgMjAyNCBhdCAwOTo0NiwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPj4gQ2VsZXN0ZSBMaXUg
PGNvZWxhY2FudGh1c2hleEBnbWFpbC5jb20+IHdyaXRlczoKPj4+IDEuIHN5c2NhbGxfZW50ZXJf
ZnJvbV91c2VyX21vZGUoKSB3aWxsIGRvIHR3byB0aGluZ3M6Cj4+PiAgICAxKSB0aGUgcmV0dXJu
IHZhbHVlIGlzIG9ubHkgdG8gaW5mb3JtIHdoZXRoZXIgdGhlIHN5c2NhbGwgc2hvdWxkIGJlIHNr
aXBwZWQuCj4+PiAgICAyKSByZWdzIHdpbGwgYmUgbW9kaWZpZWQgYnkgZmlsdGVycyAoc2VjY29t
cCBvciBwdHJhY2UgYW5kIHNvIG9uKS4KPj4+IDIuIGZvciBjb21tb24gZW50cnkgdXNlciwgdGhl
cmUgaXMgdHdvIGluZm9ybWF0aW9uczogc3lzY2FsbCBudW1iZXIgYW5kCj4+PiAgICB0aGUgcmV0
dXJuIHZhbHVlIG9mIHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUoKSAoY2FsbGVkIGlzX3Nr
aXBwZWQgYmVsb3cpLgo+Pj4gICAgc28gdGhlcmUgaXMgdGhyZWUgc2l0dWF0aW9uczoKPj4+ICAg
IDEpIGlmIHN5c2NhbGwgbnVtYmVyIGlzIGludmFsaWQsIHRoZSBzeXNjYWxsIHNob3VsZCBub3Qg
YmUgcGVyZm9ybWVkLCBhbmQKPj4+ICAgICAgIHdlIHNldCBhMCB0byAtRU5PU1lTIHRvIGluZm9y
bSB1c2Vyc3BhY2UgdGhlIHN5c2NhbGwgZG9lc24ndCBleGlzdC4KPj4+ICAgIDIpIGlmIHN5c2Nh
bGwgbnVtYmVyIGlzIHZhbGlkLCBpc19za2lwcGVkIHdpbGwgYmUgdXNlZDoKPj4+ICAgICAgIGEp
IGlmIGlzX3NraXBwZWQgaXMgLTEsIHdoaWNoIG1lYW5zIHRoZXJlIGFyZSBzb21lIGZpbHRlcnMg
cmVqZWN0IHRoaXMgc3lzY2FsbCwKPj4+ICAgICAgICAgIHNvIHRoZSBzeXNjYWxsIHNob3VsZCBu
b3QgcGVyZm9ybWVkLiAoT2YgY291cnNlLCB3ZSBjYW4gdXNlIGJvb2wgaW5zdGVhZCB0bwo+Pj4g
ICAgICAgICAgZ2V0IGJldHRlciBzZW1hbnRpYykKPj4+ICAgICAgIGIpIGlmIGlzX3NraXBwZWQg
IT0gLTEsIHdoaWNoIG1lYW5zIHRoZSBmaWx0ZXJzIGFwcHJvdmVkIHRoaXMgc3lzY2FsbCwKPj4+
ICAgICAgICAgIHNvIHdlIGludm9rZSBzeXNjYWxsIGhhbmRsZXIgd2l0aCBtb2RpZmllZCByZWdz
Lgo+Pj4KPj4+IEluIHlvdXIgZGVzaWduLCB0aGUgbG9naWNhbCBjb25kaXRpb24gaXMgbm90IG9i
dmlvdXMuIFdoeSBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKCkKPj4+IGluZm9ybWVkIHRo
ZSBzeXNjYWxsIHdpbGwgYmUgc2tpcHBlZCBidXQgdGhlIHN5c2NhbGwgaGFuZGxlciB3aWxsIGJl
IGNhbGxlZAo+Pj4gd2hlbiBzeXNjYWxsIG51bWJlciBpcyBpbnZhbGlkPyBUaGUgdXNlcnMgbmVl
ZCB0byB0aGluayB0d28gdGhpbmdzIHRvIGdldCByZXN1bHQ6Cj4+PiBhKSAtMSBtZWFucyBza2lw
Cj4+PiBiKSAtMSA8IDAgaW4gc2lnbmVkIGludGVnZXIsIHNvIHRoZSBza2lwIGNvbmRpdGlvbiBp
cyBhbHdheXMgYSBpbnZhbGlkIHN5c2NhbGwgbnVtYmVyLgo+Pj4KPj4+IEluIG1heSB3YXksIHRo
ZSB1c2VycyBvbmx5IG5lZWQgdG8gdGhpbmsgb25lIHRoaW5nOiBUaGUgc3lzY2FsbF9lbnRlcl9m
cm9tX3VzZXJfbW9kZSgpCj4+PiBzYWlkIC0xIG1lYW5zIHRoZSBzeXNjYWxsIHNob3VsZCBub3Qg
YmUgcGVyZm9ybWVkLCBzbyB1c2UgaXQgYXMgYSBjb25kaXRpb24gb2YgcmVqZWN0Cj4+PiBkaXJl
Y3RseS4gVGhleSBqdXN0IG5lZWQgdG8gY29tYmluZSB0aGUgaW5mb3JtYXRpb25zIHRoYXQgdGhl
eSBnZXQgZnJvbSBBUEkgYXMgdGhlCj4+PiBjb25kaXRpb24gb2YgY29udHJvbCBmbG93Lgo+Pgo+
PiBJJ20gYWxsLWluIGZvciBzaW1wbGVyIEFQSSB1c2FnZSEgTWF5YmUgbWFzc2FnZSB0aGUKPj4g
c3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZSgpIChvciBhIG5ldyBvbmUpLCBzbyB0aGF0IGFk
ZGl0aW9uYWwKPj4gc3lzY2FsbF9nZXRfbnIoKSBjYWxsIGlzIG5vdCBuZWVkZWQ/Cj4KPiBJdCdz
IGNvbXBsZXRlbHkgdW5jbGVhciB0byBtZSB3aGF0IHRoZSBhY3R1YWwgcHJvYmxlbSBpcy4gVGhl
IGZsb3cgaG93Cj4gdGhpcyB3b3JrcyBvbiBhbGwgYXJjaGl0ZWN0dXJlcyBpczoKPgo+ICAgICAg
ICByZWdzLT5vcmlnX2EwICA9IHJlZ3MtPmEwCj4gICAgICAgIHJlZ3MtPmEwID0gLUVOT1NZUzsK
Pgo+ICAgICAgICBuciA9IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUoLi4uLik7Cj4KPiAg
ICAgICAgaWYgKG5yID49IDApCj4gICAgICAgICAgIHJlZ3MtPmEwID0gbnIgPCBNQVhfU1lTQ0FM
TCA/IHN5c2NhbGwobnIpIDogLUVOT1NZUzsKPiAgICAgICAgICAgICAgICAgICAgICAKPiBJZiBz
eXNjYWxsX3RyYWNlX2VudGVyKCkgcmV0dXJucyAtMSB0byBza2lwIHRoZSBzeXNjYWxsLCB0aGVu
IHJlZ3MtPmEwCj4gaXMgdW5tb2RpZmllZCwgdW5sZXNzIG9uZSBvZiB0aGUgbWFnaWMgb3BlcmF0
aW9ucyBtb2RpZmllZCBpdC4KPgo+IElmIHN5c2NhbGxfdHJhY2VfZW50ZXIoKSB3YXMgbm90IGFj
dGl2ZSAobm8gdHJhY2VyLCBubyBzZWNjb21wIC4uLikgdGhlbgo+IHJlZ3MtPmEwIGFscmVhZHkg
Y29udGFpbnMgLUVOT1NZUy4KPgo+IFNvIHdoYXQncyB0aGUgZXhhY3QgcHJvYmxlbT8KCkl0J3Mg
YSBtaXggb2YgY2FsbGluZyBjb252ZW50aW9uLCBhbmQgVUFQSToKICAqIFJJU0MtViB1c2VzIGEw
IGZvciBhcmcwICphbmQqIHJldHVybiB2YWx1ZSAobGlrZSBhcm02NCkuCiAgKiBSSVNDLVYgZG9l
cyBub3QgZXhwb3NlIG9yaWdfYTAgdG8gdXNlcmxhbmQsIGFuZCBjYW5ub3QgZWFzaWx5IHN0YXJ0
CiAgICBkb2luZyB0aGF0IHcvbyBicmVha2luZyBVQVBJLgoKTm93LCB3aGVuIHNldHRpbmcgYTAg
dG8gLUVOT1NZUywgaXQncyBjbG9iYmVyaW5nIGFyZzAsIGFuZCB0aGUgcHRyYWNlcgp3aWxsIGhh
dmUgYW4gaW5jb3JyZWN0IGFyZzAgKC1FTk9TWVMpLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
