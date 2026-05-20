Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3643FCD4F3C
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 08:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C+phwq30yxq7DfenRfilIaC6TJGX8wH0pGp11V81et4=; b=0T3a6s+VNu4arS
	Xm9A9AJS9yjvlH8s6JBvQaESPITAJUy+4kfWeTC9M16PsFDuFpIB9+GklJmrcJVajDIqCeBXJOajb
	Xii2rh58lGh/R6HmzfUatxpI5pIGEk1YL2MnpCVg/1bONvmPpx4BRomGaQ3Ah4t9ZIUnoPfMxcaNt
	TKCdYGa+5Mn8vSCwxk+G9beC35a3glOuUwjUHx3VAolxB/QW1dRuo+dFnJn1dLzDd6ho1HmF3ohP3
	mKkiO8/0dzg/3r8+5pg5jsoPMTagHW2Sjgq8DVtGWeoIJtmTFnem1ZAZMs7SVF0kg2pdu9agQQTpe
	hwE01gGTgqTmTPixswDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPc1e-00000003u7Z-3SHf;
	Wed, 20 May 2026 08:11:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPc1b-00000003u6G-3E4d;
	Wed, 20 May 2026 08:11:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1089060129;
	Wed, 20 May 2026 08:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B3F1F000E9;
	Wed, 20 May 2026 08:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779264690;
	bh=CXxzzbCeNo3sDfk3dzWGFhN8IehnqsFdAWbxh92ducY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bnkpa3FzKkUUdWFG0smRQZfU40dk46M5NgdqdIyfXEPD1h20NL7bKr72VFJoHgNPK
	 Zpt0f97bM5yOlAFtMWk1oRJvIjsf1+ECrk3QzWUIz/BWNXDJW0ZYJ2FFouGZZmuMrM
	 Wo4p0Vkb6/RLl4doyo6ixLI4oE7LpahGy1KRkeyMwou5u+LN+Sw4rNKaJQ+5yI6oFf
	 vB2uTeyCpF+Vdg78uiOeOk2xvyBn7mhcgugFMKCdMzmjrO0Fwf6NwhxUTUhIuawNn+
	 NrJZl4Ke/LYbTbo3EkZd4QjkXwxp4OdeRjoSgwxJx/swz4bFwcKMo8A4KVWXBu3sjy
	 W937Gs5yLpfaw==
Date: Wed, 20 May 2026 09:11:20 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Yang Shi <shy828301@gmail.com>
Cc: Barry Song <baohua@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	surenb@google.com, akpm@linux-foundation.org, linux-mm@kvack.org, david@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, bhe@redhat.com, 
	youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <ag1qo0q_bfePgOzx@lucifer>
References: <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org>
 <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org>
 <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <CAHbLzkrOSoh-jmR=uaNvx73n_wn+vExoKY0UzH5zGcfdAiDbNg@mail.gmail.com>
 <agxfLNuLCAT3F4cW@lucifer>
 <agxnJ8R-G3CRjeTR@lucifer>
 <CAHbLzkpjOLrdRSUF3-G4d9uz6tn6QYwgB66UU9bud5WHr5FWEw@mail.gmail.com>
 <CAHbLzkrTF7w+T5mGsQuDRuhnTk6evTKBNRcH4oS=nRcUg2zpsg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHbLzkrTF7w+T5mGsQuDRuhnTk6evTKBNRcH4oS=nRcUg2zpsg@mail.gmail.com>
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

T24gVHVlLCBNYXkgMTksIDIwMjYgYXQgMDI6MDI6MDlQTSAtMDcwMCwgWWFuZyBTaGkgd3JvdGU6
Cj4gT24gVHVlLCBNYXkgMTksIDIwMjYgYXQgMTE6NDHigK9BTSBZYW5nIFNoaSA8c2h5ODI4MzAx
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBTZWNv
bmRseSwgaWYgdm1hLT5hbm9uX3ZtYSBpcyBOVUxMLCBpdCBiYXNpY2FsbHkgbWVhbnMgZWl0aGVy
IG5vIHBhZ2UKPiA+ID4gPiA+IGZhdWx0IGhhcHBlbmVkIG9yIG5vIGNvdyBoYXBwZW5lZCwgc28g
dGhlcmUgaXMgbm8gcGFnZSB0YWJsZSB0byBjb3B5LAo+ID4gPiA+ID4gdGhpcyBpcyBhbHNvIHdo
YXQgY29weV9wYWdlX3JhbmdlKCkgZG9lcyBjdXJyZW50bHkuIFNvIHdlIGNhbiBzaHJpbmsKPiA+
ID4gPiA+IHRoZSBjcml0aWNhbCBzZWN0aW9uIHRvOgo+ID4gPiA+Cj4gPiA+ID4gRmlyc3RseSwg
d2l0aCBubyBWTUEgd3JpdGUgbG9jaywgIXZtYS0+YW5vbl92bWEgbWVhbnMgYSBmYXVsdCBjYW4g
cmFjZSBhbmQKPiA+ID4gPiBzZWNvbmRseSBjb3B5X3BhZ2VfcmFuZ2UoKSBjaGVja3Mgdm1hX25l
ZWRzX2NvcHkoKSwgdGhlcmUgYXJlIG90aGVyIGNhc2VzIC0gUEZOCj4gPiA+ID4gbWFwcywgbWl4
ZWQgbWFwcywgVUZGRCBXL1AgKHVnaCksIGd1YXJkIHJlZ2lvbnMuCj4gPiA+ID4KPiA+ID4gPiBT
byB5ZWFoIHRoaXMgaXNuJ3Qgc3VmZmljaWVudC4KPiA+ID4KPiA+ID4gSG93ZXZlciB0aGlzIGlz
IHRydWUuLi4KPiA+Cj4gPiBZZXMsIGZhdWx0IGNhbiByYWNlIHdpdGggZm9yay4gQmFzaWNhbGx5
IHRoaXMgaXMgYWN0dWFsbHkgdGhlIHB1cnBvc2UKPiA+IG9mIHRoaXMgaWRlYS4gV2UgY2FuIGhh
dmUgaW1wcm92ZWQgcGFnZSBmYXVsdCBzY2FsYWJpbGl0eS4gSW4gbXkKPiA+IHByb3Bvc2FsICh0
YWtlIHdyaXRlIHZtYSBsb2NrIGlmIHZtYS0+YW5vbl92bWEgaXMgbm90IE5VTEwpLCB0aGUgcmFj
ZQo+ID4ganVzdCBoYXBwZW5zIG9uIHRoZSBWTUFzIHdoaWNoIHBhZ2UgZmF1bHQgaGFzIG5vdCBo
YXBwZW5lZCBvbiBiZWZvcmUuCj4KPiBTb3JyeSwgdGhpcyBpcyBpbmNvcnJlY3QuIFBhZ2UgZmF1
bHQgY2FuJ3QgaGFwcGVuIG9uIHRob3NlIFZNQXMKPiBiZWNhdXNlIHBhZ2UgZmF1bHQgbmVlZHMg
dG8gY3JlYXRlIGFub25fdm1hLCBidXQgaXQgcmVxdWlyZXMgdGFraW5nCj4gbW1hcF9sb2NrLgo+
IElmIGFub25fdm1hIGlzIG5vdCBOVUxMLCB2bWEgd3JpdGUgbG9jayB3aWxsIHNlcmlhbGl6ZSBh
Z2FpbnN0IHBhZ2UKPiBmYXVsdC4gU28gdGhlcmUgc2hvdWxkIGJlIG5vIHJhY2Ugd2l0aCBwYWdl
IGZhdWx0LiBSZW1vdmluZyB2bWEgd3JpdGUKPiBsb2NrIHN1Z2dlc3RlZCBieSBCYXJyeSBtYXkg
aW5jcmVhc2UgcmFjZS4KCkZpcnN0bHksIGxldCdzIG5vbmUgb2YgdXMgYmUgd29ycmllZCBhYm91
dCBtYWtpbmcgbWlzdGFrZXMgaGVyZSwgdGhlIGFub25fdm1hCnN0dWZmIGlzIGNvbmZ1c2luZywg
YW5kIEkndmUgc3RhcmVkIGF0IGl0IG1vcmUgdGhhbiBtb3N0bHksIGFuZCBldmVuIHNvIEkKbWFu
YWdlZCB0byBtYWtlIG1pc3Rha2VzIChhcyBjb3JyZWN0ZWQgaGVyZSkgYW5kIGZvcmdldCBkZXRh
aWxzIDopKQoKSXQncyBhIHNpZ24gaXQgYWxsIG5lZWRzIHNpbXBsaWZ5aW5nLCBidXQgaGV5IHRo
YXQncyB3aGF0IG15IHNjYWxhYmxlIENvVwpwcm9qZWN0IGlzIChwYXJ0bHkpIGFib3V0IDopCgpS
ZW1vdmluZyB0aGUgVk1BIHdyaXRlIGxvY2sgd291bGQgY2F1c2UgcmFjZXMgd2l0aCBwYWdlIGZh
dWx0IHdoaWNoIGNhbiByZXN1bHQKaW4gcGFnZSB0YWJsZXMgYmVpbmcgaW5zdGFsbGVkIHdoaWNo
IGFyZSB0aGVuIG5vdCBjb3JyZWN0bHkgZHVwbGljYXRlZCBmb3IKcmFuZ2VzIHRoYXQgbXVzdCBi
ZS4KCkFuZCBhZ2FpbiBJIHRoaW5rIHRoZSB1bmRlcmx5aW5nIHRoaW5nIGhlcmUgb3ZlcmFsbCBJ
IHRoaW5rIGlzOgoKMS4gQ2xlYXJseSBtYW55IGNhc2VzIHJlcXVpcmUgc2VyaWFsaXNhdGlvbiAo
YW55IHRoYXQgY2F1c2UgY29weV9wYWdlX3JhbmdlKCkgdG8KICAgZmlyZSkuCgoyLiBJZiB3ZSB3
ZXJlIHRvIGRlY2lkZSBub3QgdG8gdGFrZSBhIGxvY2sgd2l0aCBjb25jdXJyZW50IHBhZ2UgZmF1
bHRzLCB0aGF0CiAgIGxheXMgYSB0cmFwIGZvciBhbnkgZnV0dXJlIGNoYW5nZSB0aGF0IChyZWFz
b25hYmx5KSBhc3N1bWVzIHRoYXQgcGFnZSB0YWJsZXMKICAgY2Fubm90IGJlIHNpbXVsdGFuZW91
c2x5IGNvcGllZCB3aGlsZSBiZWluZyBhY2Nlc3NpYmxlIHRvIHBhZ2UgZmF1bHQKICAgaGFuZGxl
cnMsIHdoaWNoIGlzIGJ1ZyBwcm9uZS4KCjMuIEFzIHBlciAyLCBldmVuIGlmIHdlIHdlcmUgdG8g
b25seSB0YWtlIHRoZSBsb2NrIHdoZW4gd2UgZmVsdCB3ZSBhYnNvbHV0ZWx5CiAgIG5lZWRlZCB0
bywgd2Ugc3RpbGwgY2F1c2UgcmlzayB0aHJvdWdoIGFkZGluZyB5ZXQgYW5vdGhlciAneW91IGp1
c3QgaGF2ZSB0bwogICBrbm93JyByaXNrIHRvIHRoaXMgcGFydCBvZiBtbS4KCjQuIFRoZSBzZXJp
YWxpc2F0aW9uIGlzIHF1aXRlIGxpa2VseSByZWxpZWQgdXBvbiBieSBvdGhlciB0aGluZ3MsIHRo
aXMgaXMgb2Z0ZW4KICAgdGhlIGNhc2UgaW4gbW0sIGFuZCB3ZSBtYXkgb25seSByZWFsaXNlIHRo
YXQgc3VjaCBzZXJpYWxpc2F0aW9uIGlzIGNyaXRpY2FsCiAgIGF0IHRoZSBwb2ludCBhIHN1YnRs
ZSBpc3N1ZSBhcmlzZXMgb3V0IG9mIGl0LgoKNS4gRm9yayBpcyBvbmUgb2YgdGhlIG1vc3Qgc2Vu
c2l0aXZlLCBpbnR1YXRpb24tZGVmeWluZywgY29tcGxpY2F0ZWQsIGFuZAogICBjb3JuZXItIGNh
c2UtcHJvYmxlbS1iYWl0aW5nIGFyZWFzIG9mIG1tIGFuZCBJIHJlYWxseSBvcHBvc2UgdXMgY2hh
bmdpbmcKICAgZnVuZGFtZW50YWwgYmVoYXZpb3VyIGhlcmUgdW5sZXNzIGluY3JlZGlibHkgd2Vs
bCBqdXN0aWZpZWQuCgpPbiB0aGlzIGJhc2lzLCBsZXQncyBsZXQgdGhlIHNsZWVwaW5nIGRvZ3Mg
bGllIGFuZCBsZWF2ZSBmb3JrIGFsb25lIEkgdGhpbmsgOikKCkkgdGhpbmsgSSBhbSBmYXIgbW9y
ZSBpbmNsaW5lZCB0byB0YWtlIEJhcnJ5J3MgZmF1bHQgYXBwcm9hY2ggKGFzIEkndmUgc2FpZCB0
bwpoaW0pIHZzLiBjaGFuZ2luZyBmb3JrIGJlaGF2aW91ci4KCkJ1dCBJIHdhbnQgdG8gbWFrZSBz
dXJlIHRoZXJlJ3Mgbm90IGEgJ3RoaXJkIHdheScgdGhhdCBjb3VsZCBhdm9pZCBlaXRoZXIhCgpJ
IGFtIGdvaW5nIHRvIGhhdmUgYSBsb29rIHRocm91Z2ggQmFycnkncyBzZXJpZXMgaW4gZGV0YWls
IHNvIHdlIGNhbiBoYXZlIHNvbWUKbW92ZW1lbnQgb24gdGhpcyBvbmUgd2F5IG9yIGFub3RoZXIg
OikKCj4KPiBUaGFua3MsCj4gWWFuZwo+CgpDaGVlcnMsIExvcmVuem8KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
