Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9EC9CCFA13
	for <linux-riscv@archiver.kernel.org>; Fri,  1 May 2026 17:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GmmYZPPSKuLv5s65wyO+DomYBtMiJfdzTmrxzL7yQt8=; b=SIVmXzH26q8ZaJ
	E/wcT4/uUvF+7nNLetXl7ADzScnUBnyhz2EeaSgPXB3vF6YzWcsl3oUzZ0rY0olBAmoLi/BXBgnEs
	hzHkQReIQbXCiB/1CwsT5rVU7L6SoWSjKEvPgyEqPD1W5vWffWIxYtbVKa2ZLjRTQfRlPgYIUZT+R
	05tK2P7mIFd+KO6gV/ewfnI9EtISgIffGa0sb83Ovo9ajViCa5DYBmyXx+pp/Mw/V/51PrVu0SJLB
	bAQCZYqg3Qt/DC2YwjsQVGVC4bhKlTS6GmVskdOv1FDqmrIrgB6rae3FKll1ag+SuwvKXIXk4V70f
	/x/CuRihmCrIn29NanvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIs9A-00000007XmO-1AWO;
	Fri, 01 May 2026 17:59:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIs98-00000007Xlt-3iva
	for linux-riscv@lists.infradead.org;
	Fri, 01 May 2026 17:59:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E84D760125
	for <linux-riscv@lists.infradead.org>; Fri,  1 May 2026 17:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B835C2BCFB
	for <linux-riscv@lists.infradead.org>; Fri,  1 May 2026 17:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777658365;
	bh=q/vvVmaTofrvdifxLcOjX8owb4zQpccO2C7Xr55syLA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JbTv8Nf1y3JWuLvIXZgUs1p4s5+B1GUlld0WRZbXF6rHJnF7FXG1rC3Vd4wOH+FWf
	 /lu8+oad1AE755FSug1ZcbNt0IQc1USHsGef5ccGfcxzq95KtuLoC1nLMlrSQKzgi+
	 tTiQMMhrfbld8ymAgyQwEiY7I8BtqZz3pZGkD9sFmJ46nTjfdLk01RnECNuTHbUx0N
	 /o9MUrK9GRGCK4V7AJo9DxsUNN94FU6bSe/lBLB3HEZbgoDtdPCtJ4BLITTZoIcrFs
	 HYAyPtyGq9f56cLDbdFj9zzu20514g+BkK1RgtuqirVOywKHAzhsojpDQjUdjBms4R
	 0K/BQ+D5iTcCQ==
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8b1f2b7f1bcso29857746d6.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 May 2026 10:59:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8DYMp9jlzmOrIo0RORKS7DQqeSBwyd9o/3fiIoyUSlhPvhPdZOpppNwlDfCuWo1Xsj1eF0CrGPp7VTBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6coyO4flblw7HSJWe9s2VMSh52/h/dTSLP3TOphBN0C5Yu1hJ
	ZqEMX1M1bH0jdKpqgSGY7bFVPYry/wsD+uggTgqaJSuu3Rx9yVviYT4GvYMzMcJLkyVMlUrnqf4
	1+WONldO9aQIiW5IavmQ7jY8fLCftQW8=
X-Received: by 2002:a05:6214:3113:b0:89c:7bf8:c564 with SMTP id
 6a1803df08f44-8b4000bc68amr106932516d6.27.1777658364833; Fri, 01 May 2026
 10:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <afTKsSj0i-ZkRZN5@lucifer>
In-Reply-To: <afTKsSj0i-ZkRZN5@lucifer>
From: Barry Song <baohua@kernel.org>
Date: Sat, 2 May 2026 01:59:13 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4w4jyQTzvPSzGtv1r5G35kARHrf4WgDvEiOAw8k5AAABg@mail.gmail.com>
X-Gm-Features: AVHnY4IozGRsOfIFCBuTWYpA9lpafQxUB9l3oBl_1mgfquoOdt6gfYLqIWFbDj8
Message-ID: <CAGsJ_4w4jyQTzvPSzGtv1r5G35kARHrf4WgDvEiOAw8k5AAABg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	david@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, jack@suse.cz, pfalcato@suse.de, 
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com, 
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, 
	bhe@redhat.com, youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org
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

T24gRnJpLCBNYXkgMSwgMjAyNiBhdCAxMTo1MuKAr1BNIExvcmVuem8gU3RvYWtlcyA8bGpzQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBBcHIgMzAsIDIwMjYgYXQgMDE6Mzc6MTRQTSAr
MDEwMCwgTWF0dGhldyBXaWxjb3ggd3JvdGU6Cj4gPiBPbiBUaHUsIEFwciAzMCwgMjAyNiBhdCAx
MjowNDoyMlBNICswODAwLCBCYXJyeSBTb25nIChYaWFvbWkpIHdyb3RlOgo+ID4gPiAoMSkgSWYg
d2UgbmVlZCB0byB3YWl0IGZvciBJL08gY29tcGxldGlvbiwgd2Ugc3RpbGwgZHJvcCB0aGUgcGVy
LVZNQSBsb2NrLCBhcwo+ID4gPiBjdXJyZW50IHBhZ2UgZmF1bHQgaGFuZGxpbmcgYWxyZWFkeSBk
b2VzLiBIb2xkaW5nIGl0IGZvciB0b28gbG9uZyBtYXkgaW50cm9kdWNlCj4gPiA+IHZhcmlvdXMg
cHJpb3JpdHkgaW52ZXJzaW9uIGlzc3VlcyBvbiBtb2JpbGUgZGV2aWNlcy4gQWZ0ZXIgSS9PIGNv
bXBsZXRlcywgd2UKPiA+ID4gcmV0cnkgdGhlIHBhZ2UgZmF1bHQgd2l0aCB0aGUgcGVyLVZNQSBs
b2NrLCByYXRoZXIgdGhhbiBmYWxsaW5nIGJhY2sgdG8KPiA+ID4gbW1hcF9sb2NrLgo+ID4KPiA+
IFlvdSdyZSBnb2luZyB0byBoYXZlIHRvIGRvIGJldHRlciB0aGFuIHRoYXQuICBZb3Uga25vdyBJ
IGhhdGUgdGhlCj4gPiBhZGRpdGlvbmFsIGNvbXBsZXhpdHkgeW91J3JlIGFkZGluZy4gIFlvdSBu
ZWVkIHRvIGV4cGxhaW4gd2h5IG15IGlkZWEgb2YKPiA+IHJpcHBpbmcgb3V0IGFsbCB0aGUgY29t
cGxleGl0eSBub3cgdGhhdCB3ZSBoYXZlIHBlci1WTUEgbG9ja3MgZG9lc24ndAo+ID4gd29yay4K
Pgo+IEFmdGVyIGEgYnJpZWYgZXllYmFsbCBJIHNoYXJlIE1hdHRoZXcncyBhc3Nlc3NtZW50LCBJ
IHJlYWxseSBkb24ndCBsaWtlIHRoaXMKPiBzZXJpZXMsIGl0J3MgcGlsaW5nIG9uIGNvbXBsZXhp
dHkgZm9yIHdoYXQgc2VlbSBsaWtlIG5pY2hlIGNhc2VzLgoKSeKAmWQgcmVhbGx5IGFwcHJlY2lh
dGUgaXQgaWYgeW91IGNvdWxkIHBvaW50IG91dCB0aGUgc3BlY2lmaWMgcGFydHMgeW91CmRpc2xp
a2UsIHJhdGhlciB0aGFuIHRoZSB3aG9sZSBzZXJpZXPigJRJIGRvbuKAmXQgdGhpbmsgdGhhdOKA
mXMgYSBmYWlyCmFzc2Vzc21lbnQuCgpJ4oCZbSBub3Qgc3VyZSB3aGF0IHlvdSBtZWFuIGJ5IOKA
nG5pY2hlIGNhc2VzLuKAnSBEbyB5b3UgbWVhbiBhdm9pZGluZyB0YWtpbmcKbW1hcF9sb2NrIGZv
ciBtYWpvciBwYWdlIGZhdWx0cywgb3IgcmVsZWFzaW5nIHRoZSBwZXItVk1BIGxvY2sgYW5kIHJl
dHJ5aW5nCnRoZSBwYWdlIGZhdWx0PwoKUmlnaHQgbm93LCBtYWpvciBwYWdlIGZhdWx0cyBhbHdh
eXMgZmFsbCBiYWNrIHRvIG1tYXBfbG9jaywgd2hpY2ggaXMgYQpzaWduaWZpY2FudCBzb3VyY2Ug
b2YgbG9jayBjb250ZW50aW9uLiBJIGFzc3VtZSB3ZSBhZ3JlZSB0aGF0IHRoaXMgZmFsbGJhY2sK
c2hvdWxkIGJlIGVsaW1pbmF0ZWQuIE9yIGlzIHRoZXJlIHN0aWxsIG5vIGFncmVlbWVudCBvbiB0
aGlzIHBvaW50IGVpdGhlcj8KCldoZXJlIHdlIG1heSBkaWZmZXIgaXMgd2hldGhlciB0byBob2xk
IHRoZSBwZXItVk1BIGxvY2sgYW5kCmF2b2lkIHJldHJ5aW5nIHRoZSBwYWdlIGZhdWx0LCBvciB0
byByZWx5IG9uIHJldHJ5aW5nIHRoZQpmYXVsdCB3aGlsZSB1c2luZyB0aGUgcGVyLVZNQSBsb2Nr
ICh3aXRoIHRoZSBjdXJyZW50Cm1haW5saW5lIGFwcHJvYWNoIHVzaW5nIG1tYXBfbG9jayBpbnN0
ZWFkKSA/Cgo+Cj4gV2UgYWxyZWFkeSBoYXZlIGVub3VnaCB3ZWlyZG5lc3MgaW4gZmF1bHQgY29k
ZSBob25lc3RseS4KPgo+IExldCdzIG1heWJlIGRpc2N1c3MgYXQgTFNGIGlmIHlvdSdyZSBhdHRl
bmRpbmc/CgpTdXJlIDotKQoKPgo+IEkgd2lsbCB0cnkgdG8gaGF2ZSBhIG1vcmUgdGhvcm91Z2gg
bG9vayB0aHJvdWdoIHdoZW4gSSBnZXQgYSBjaGFuY2UuCgpUaGFuayB5b3UsIG11Y2ggYXBwcmVj
aWF0ZWQuCgpCZXN0IFJlZ2FyZHMKQmFycnkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
