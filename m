Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C14CD4F54
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 21:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJtPJiv1/6yYoVQMH/NOQcyS3ecTqEFmeMAJNAsKTS4=; b=SDFF2P0Gh8h6gM
	T6QW5/FPl4MD6qVEWbx/M1BoDaFrfnTd8ON7zUIzGerkUjLAV3KmvGE1sUb4nYAJXzU3JvSz273H8
	gRbbS6aKxNvGEy1WQc3ofszXaoUyu6c5fciiwY5oAm0xnlyD5gFvpDKQWstkB1QnkvC+MyIZEKH5Q
	kznLxRiSETJQuPjJz0mCY3siypBh3w7NTkmHHDkASgWAzyKBjTIeYfOeo9BR6/l1vmD/DuUPCcoXu
	8wz6SqvZWWXP6+fa9riur2776YxAPtxa6uWeL3OCUyOiZiqK/B8KXevYZ+7wQFPVJKIGZkCJrjTqJ
	lsldQqdgWczOqNKqM4Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPoFQ-00000005oFq-2tn1;
	Wed, 20 May 2026 21:14:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPoFO-00000005oE8-0ton
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 21:14:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6652F444FA
	for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 21:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC301F00A3C
	for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 21:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779311673;
	bh=1rF6qiFpXobWU7JpkXbQs61u2QeAi7J+W2nUaLHy7Vk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HK/SOOl8prV9nDfcU4qR27QfrnPfAvRTe04dADtuUvM/vASUzu7erWdJn65vHYk4W
	 bMjAyFw8jd0koqYYTqCWL5jLHS8XcZFVM+/LyEnGwj77SGWYvRR04rXQOmGrntAgcn
	 0P/iTap4ezpBnCuekLA0xkC6MDE6oDtTMC7MLcKWd/AHmn0N/aeOu750e/e/80nhol
	 UKg7K7q6AP+27tw/U71YnXT8I1+gEP1D3flmj1O9i3F0KUf5DZiwCbVzoonnS4SGIV
	 gpLlyKaLa63QwhGox5IAoKUkCp0H+ALsCmUihp3rverakPWUN/meBF+cjvZIYH/FPp
	 NFKqXA8ZQ8jVw==
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-911488599e3so613730985a.3
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 14:14:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ904PfnXce2aomqoj1fdk6DN9Ns4YzBDksWyVrPZmjBM3EZu30FrH4v+Nfub83sRUVTH4ntMg4g3K+m3A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2PLB0+JsoKaq035ikD/XyHAZ7vV6WXS3q4z+G4Cc4REmyM1kG
	JUGYva9F9DqP71cSxIndX/Noo7a6/Gs5e0U4QMQUC2oP/y5TTNEapIEapucOseVY0bTnR13hUav
	T91yJezZAC2Na6W2VXrL2Dh/q+yzZ8T8=
X-Received: by 2002:a05:620a:4083:b0:911:1a2c:f953 with SMTP id
 af79cd13be357-911cd75d3e6mr3875314385a.20.1779311672425; Wed, 20 May 2026
 14:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer> <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
 <CAGsJ_4zgeE3ebEJ+j7GJFzWVoVYHeiOn4dOoOsmWCLA6s=oECQ@mail.gmail.com>
 <5zdaa5uv5oj27q3taopl3amops57ouxgyfsdveudz4ovmbdw7z@6lwrlyvmhcp2>
 <CAGsJ_4yKxg1QugcsJi3WD0KVGJKe-zXycgm5D6cRi9vWtNcpDQ@mail.gmail.com> <ag4h87CBd-gph9zX@casper.infradead.org>
In-Reply-To: <ag4h87CBd-gph9zX@casper.infradead.org>
From: Barry Song <baohua@kernel.org>
Date: Thu, 21 May 2026 05:14:20 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zA8afu0xXy0WS+tMe-eesDX1W6UBmfAsuouUpcAgK8JQ@mail.gmail.com>
X-Gm-Features: AVHnY4Ipz6n3Spqx2zj00QGF2vF70GrKqLnsMaayM8MuFibnvRKE25oqOs1hwAE
Message-ID: <CAGsJ_4zA8afu0xXy0WS+tMe-eesDX1W6UBmfAsuouUpcAgK8JQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Matthew Wilcox <willy@infradead.org>
Cc: "Liam R. Howlett" <liam@infradead.org>, Suren Baghdasaryan <surenb@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	david@kernel.org, vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, 
	chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com, 
	nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Nanzhe Zhao <nzzhao@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_141434_302538_733C1A9A 
X-CRM114-Status: GOOD (  20.51  )
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

T24gVGh1LCBNYXkgMjEsIDIwMjYgYXQgNTowNeKAr0FNIE1hdHRoZXcgV2lsY294IDx3aWxseUBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgTWF5IDIwLCAyMDI2IGF0IDA2OjAxOjU2
QU0gKzA4MDAsIEJhcnJ5IFNvbmcgd3JvdGU6Cj4gPiA+IGltcGxpZWQgaXMgdGhhdCB0aGUgcGVy
LXZtYSBsb2NraW5nIG1heSBzdGFsbCBtbWFwX2xvY2sgd3JpdGVzIGZvcgo+ID4gPiBsb25nZXIg
dGhhbiBpZiB0aGUgbW1hcF9sb2NrIHdhcyB0YWtlbiBpbiByZWFkIG1vZGU/ICBCYXJyeSwgaXMg
dGhhdAo+ID4gPiBjb3JyZWN0Pwo+ID4KPiA+IE5vdCB0aGUgY2FzZSDigJQgdGhlIGFjdHVhbCBz
aXR1YXRpb24gaXMgKGlmIHdlIG1vZGlmeSB0aGUKPiA+IGN1cnJlbnQga2VybmVsIHRvIHBlcmZv
cm0gSS9PIHdpdGhvdXQgcmVsZWFzaW5nIFZNQSByZWFkIGxvY2tzKToKPiA+Cj4gPiB0aHJlYWQg
MSBQRjogbG9jayB2bWExIHJlYWQgLS0tLSAgSU8gLS0tLS0gOwo+ID4gdGhyZWFkIDIgUEY6IGxv
Y2sgdm1hMiByZWFkIC0tLS0tIElPIC0tLS0tIDsKPiA+IHRocmVhZCAzIFBGOiAgbG9jayB2bWEz
IHJlYWQgLS0tLSBJTyAtLS0tLSA7Cj4gPiB0aHJlYWQgNCBmb3JrOiAgbW1hcF9sb2NrX3dyaXRl
IC0tLS0gbG9jayB2bWExLCB2bWEyLCB2bWEzIHdyaXRlIDsKPiA+IHRocmVhZCA1IDogIHRha2Ug
bW1hcF9sb2NrIGZvciBhbnkgcmVhZC93cml0ZSByZWFzb24KPiA+Cj4gPiBOb3cgeW91IGNhbiBz
ZWUgdGhhdCB0aHJlYWQgNCBoYXMgdG8gd2FpdCBmb3IgdGhlIEkvTyBvZgo+ID4gVk1BMSwgVk1B
MiwgYW5kIFZNQTMgdG8gY29tcGxldGUsIGFuZCB0aHJlYWQgNSB0aGVuIGhhcyB0bwo+ID4gd2Fp
dCBmb3IgdGhyZWFkIDQgdG8gcmVsZWFzZSBtbWFwX2xvY2suIEJvdGggdGhyZWFkIDQgYW5kCj4g
PiB0aHJlYWQgNSBjYW4gYmVjb21lIGV4dHJlbWVseSBzbG93LCBiZWNhdXNlIEkvTyBtYXkgYmUg
c3R1Y2sKPiA+IGFueXdoZXJlIGluIHRoZSBiaW8vcmVxdWVzdCBxdWV1ZSBvciBmaWxlc3lzdGVt
IEdDLgo+ID4KPiA+IFNvIG5vdyB3ZSBoYXZlIHR3byBjaG9pY2VzOgo+ID4KPiA+IDEuIENoYW5n
ZSBmb3JrKCkgdG8gYXZvaWQgdGFraW5nIHRoZSB2bWEgd3JpdGUgbG9jayBmb3Igdm1hMS8yLzMg
d2hlcmUgcG9zc2libGU7Cj4gPiAyLiBLZWVwIHRoZSBjdXJyZW50IGtlcm5lbCBiZWhhdmlvciBh
bmQgZHJvcCB0aGUgVk1BIGxvY2sgYmVmb3JlIEkvTzoKPgo+IE9wdGlvbiAzOiBTYXkgdGhhdCB0
aGlzIGlzIGEgdmVyeSBzaWxseSB0aGluZyB0byBvcHRpbWlzZSBmb3IuICBJIGhhdmUgYQo+IGhh
cmQgdGltZSBiZWxpZXZpbmcgdGhhdCBhbnkgYXBwbGljYXRpb24gd2lsbCBjYXJlIGFib3V0IHRo
ZSBsYXRlbmN5IG9mCj4gZm9yaygpLCBvciB0aGUgbGF0ZW5jeSBvZiBwYWdlIGZhdWx0cyB3aGls
ZSBpdCdzIGluIHRoZSBtaWRkbGUgb2YgZm9yaygpLgo+IE11bHRpdGhyZWFkZWQgYXBwbGljYXRp
b25zIGp1c3QgZG9uJ3QgZm9yayB0aGF0IG9mdGVuIQoKTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0
IHdlIHNob3VsZCBub3QgYmxhbWUgYXBwbGljYXRpb25zIGhlcmUuIFRoaXMgaXMgMjAyNjoKdGhl
cmUgYXJlIGJhc2ljYWxseSBvbmx5IHR3byBraW5kcyBvZiBhcHBsaWNhdGlvbnMg4oCUIHNpbmds
ZS10aHJlYWRlZCBhbmQKbXVsdGktdGhyZWFkZWQg4oCUIGFuZCBzaW5nbGUtdGhyZWFkZWQgYXBw
bGljYXRpb25zIGFyZSBuZWFybHkgZXh0aW5jdC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
