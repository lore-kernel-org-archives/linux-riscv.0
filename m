Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A77CD4F26
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 08:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=56x5Rnk2q8rnylUdAgNzJA/lRkGxph1ghM4EC17Mpn8=; b=QjTyL5hX8QU0Cr
	75CVdoSUg6elkUYrNVadTTByHhif8lP7wd8J77fTNZ/Zh/O7LdmZFs3i/DJB+kiDTUiwf/OlCUJWI
	LuqS+0IYF8DyfRKonk/F97n9IDIgII+25EJFiHO6gE85ZdbEDaSJjL8teJdZIW77RyNBRomfYfUws
	ciWyCQE1KamXKTKpoy32/JH0MeDi5Fz2fZk1gMVw4BUQXOHU37jJae84BIVfRlwkPE160L5waGqGg
	LdsjflJf62LMHLIMITzocIPA+DGY6hObV6CuX3I/rmjO1Soq2E6GQ7oMJizMb2G5haspCZz6GMuGI
	I+UvETmWib9z9IDsTJoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbw5t-00000005s87-3Nlt;
	Tue, 23 Jun 2026 08:02:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbw5s-00000005s7r-34Ae;
	Tue, 23 Jun 2026 08:02:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C6A2437DF;
	Tue, 23 Jun 2026 08:02:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986D81F000E9;
	Tue, 23 Jun 2026 08:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782201771;
	bh=uGXAbbvDtMgdseoEBMP4tUzRSWv2MJSuTR3Me0ClWC8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FklgZfZvf9emq2gmny2eGq6EMuPFgTPg3jmwAxmLaYfdeYYOx9o/LUsxGSyhC90Aj
	 wyT19RvXdWlMCbyU9x5qRfWKwzHtDUwLyiTaRdHPzlhCnqASxByUiH+reBxZa6dm6/
	 2eUrKJ7Sl3Ard2QCWFs5RMYz0cEIAQCf+F3cTsedtE8mzwpzHancQo4aEImHF0L8cr
	 Fy0cEII7dznV9is/6QM/nYIXsQ76KUnc8J3lz0n9fEPXD9BgbtOHKKHco2unHFN5KT
	 hMyDhDgPqCuk0aLgK7toBqI2XUvKRYcOcAAOK274SYOnvXU30gUDeEG5XgOjyI10Dd
	 19K+31feZDQsg==
Message-ID: <d04f745d-eb3e-4d2c-8ea2-5fdcf2cf27b8@kernel.org>
Date: Tue, 23 Jun 2026 10:02:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Hongru Zhang <zhanghongru06@gmail.com>
Cc: akpm@linux-foundation.org, baohua@kernel.org, bhe@redhat.com,
 chentao@kylinos.cn, chrisl@kernel.org, jack@suse.cz, kasong@tencent.com,
 kunwu.chan@gmail.com, liam@infradead.org, lianux.mm@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 liyangouwen1@oppo.com, ljs@kernel.org, loongarch@lists.linux.dev,
 mhocko@suse.com, nphamcs@gmail.com, nzzhao@126.com, pfalcato@suse.de,
 rppt@kernel.org, shikemeng@huaweicloud.com, surenb@google.com,
 vbabka@kernel.org, wanglian@kylinos.cn, willy@infradead.org,
 youngjun.park@lge.com
References: <3be9475b-0e8a-4df8-a130-4262f993973d@kernel.org>
 <20260623075805.466317-1-zhanghongru@xiaomi.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260623075805.466317-1-zhanghongru@xiaomi.com>
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

T24gNi8yMy8yNiAwOTo1OCwgSG9uZ3J1IFpoYW5nIHdyb3RlOgo+PiBPbiA1LzIwLzI2IDIzOjE1
LCBNYXR0aGV3IFdpbGNveCB3cm90ZToKPj4+Cj4+PiBhbGwgb2YgdGhlIGFwcGxpY2F0aW9ucyBp
IHJ1biBhcmUgZWl0aGVyIHNpbmdsZSB0aHJlYWRlZCBvciBkb24ndCBmb3JrLgo+Pj4gd2hhdCBt
dWx0aXRocmVhZGVkIGFwcGxpY2F0aW9ucyBjYWxsIGZvcms/Cj4+Cj4+IFRyYWRpdGlvbmFsbHkg
dGhlIHByb2JsZW0gd2FzIHJhbmRvbSBsaWJyYXJpZXMgdXNpbmcgZm9yaytleGVjdmUgdG8gbGF1
bmNoIG90aGVyCj4+IHByb2dyYW1zIC4uLiBpbnN0ZWFkIG9mIHVzaW5nIGFsdGVybmF0aXZlcyBs
aWtlIHBvc2l4X3Nwd2FuIChzb21lIHVzZSBjYXNlcwo+PiByZXF1aXJlIG1vcmUgd29yayBkb25l
IGJlZm9yZSBleGVjdmUgYW5kIGNhbm5vdCB5ZXQgc3dpdGNoIHRvIHRoYXQpLiBJJ2QgaG9wZQo+
PiB0aGF0IHRoYXQgaXMgbGVzcyBvZiBhIHByb2JsZW0gb24gQW5kcm9pZC4KPj4KPj4gSSBhc3N1
bWUgQW5kcm9pZCB6eWdvdGUgbWlnaHQgYmUgbXVsdGkgdGhyZWFkZWQ/IE1heWJlIHNzaGQgYXMg
d2VsbD8gU3lzdGVtZD8KPj4gQnV0IEknZCBiZSBzdXJwcmlzZWQgaWYgdGhlcmUgYXJlIHJlYWxs
eSBwZXJmb3JtYW5jZSBpbXBsaWNhdGlvbnMuCj4+Cj4+IE5vdCBzdXJlIGFib3V0IHdlYmJyb3N3
ZXJzIC4uLi4gSSB0aGluayBtb3N0IG9mIHRoZW0gc3dpdGNoZWQgdG8gZm9yayBzZXJ2ZXJzLAo+
PiB3aGVyZSBJIHdvdWxkIGFzc3VtZSBmb3JrIHNlcnZlcnMgd291bGQgYmUgc2luZ2xlLXRocmVh
ZGVkLgo+Pgo+PiBTbywgeWVhaCwgZ2V0dGluZyBhIGNsZWFyIHVuZGVyc3RhbmRpbmcgaG93IHRo
aXMgZW5kcyB1cCBiZWluZyBhIHByb2JsZW0gb24KPj4gQW5kcm9pZCB3b3VsZCBiZSBncmVhdC4K
PiAKPiBCYXJyeSBhc2tlZCBtZSB0byBzaGFyZSBvYnNlcnZhdGlvbnMgb24gZm9yaygpIHVzYWdl
IGFjcm9zcyBBbmRyb2lkCj4gYXBwbGljYXRpb25zLgo+IAo+IEkgd3JvdGUgYSBCUEYtYmFzZWQg
dHJhY2luZyB0b29sIChrcHJvYmUgb24gY29weV9wcm9jZXNzLCBjaGVja2luZwo+IENMT05FX1ZN
IHRvIGRpc3Rpbmd1aXNoIHByb2Nlc3MgY3JlYXRpb24gZnJvbSB0aHJlYWQgY3JlYXRpb24pIGFu
ZCByYW4KPiBpdCBhZ2FpbnN0IHRoZSB0b3AgMjAwIEFuZHJvaWQgYXBwbGljYXRpb25zIGluIHRo
ZSBDaGluYSBtYXJrZXQgZHVyaW5nCj4gbm9ybWFsIHVzYWdlIHNjZW5hcmlvcy4KPiAKPiBSZXN1
bHRzOgo+IC0gODIgb3V0IG9mIDIwMCBhcHBzICg0MSUpIGNhbGwgZm9yaygpIGR1cmluZyBub3Jt
YWwgb3BlcmF0aW9uCgpDcmF6eS4gVGhhbmtzIGZvciB0aGVzZSBudW1iZXJzLgoKPiAtIEFtb25n
IHRoZXNlLCBzb21lIGNhbGwgZm9yaygpIGZyb20gbXVsdGlwbGUgdGhyZWFkcwo+IAo+IFRoZXNl
IGFyZSBub3Qgenlnb3RlIGZvcmtzIOKAlCB0aGV5IGFyZSBmb3JrKCkgY2FsbHMgaW5pdGlhdGVk
IGJ5IGFwcAo+IHRocmVhZHMgYXQgcnVudGltZS4gRXhhbXBsZXMgYnkgY2F0ZWdvcnk6Cj4gCj4g
ICBCcm93c2VyczogICAgIGNvbS5xdWFyay5icm93c2VyLCBjb20uVUNNb2JpbGUsIGNvbS54dW5s
ZWkuYnJvd3Nlcgo+ICAgU2hvcHBpbmc6ICAgICBjb20udGFvYmFvLnRhb2JhbywgY29tLnRtYWxs
LndpcmVsZXNzLCBjb20uYWNoaWV2by52aXBzaG9wCj4gICBWaWRlbzogICAgICAgIGNvbS55b3Vr
dS5waG9uZSwgY29tLnFpeWkudmlkZW8sIGNvbS5odW5hbnR2LmltZ28uYWN0aXZpdHkKPiAgIFNv
Y2lhbC9JTTogICAgY29tLmFsaWJhYmEuYW5kcm9pZC5yaW1ldCwgY29tLnNzLmFuZHJvaWQubGFy
awo+ICAgTmV3czogICAgICAgICBjb20uc3MuYW5kcm9pZC5hcnRpY2xlLm5ld3MsIGNvbS5zcy5h
bmRyb2lkLmFydGljbGUubGl0ZQo+ICAgTmF2aWdhdGlvbjogICBjb20uYXV0b25hdmkubWluaW1h
cCwgY29tLnNkdS5kaWRpLnBzbmdlcgo+ICAgRmluYW5jZTogICAgICBjb20uZWcuYW5kcm9pZC5B
bGlwYXlHcGhvbmUsIGNvbS5jaGluYW13b3JsZC5tYWluCgpJIGtub3cgdGhhdCBlc3BlY2lhbGx5
IGJyb3dzZXIgdXN1YWxseSB1c2UgZm9yayBzZXJ2ZXJzOiBhIHRpbnkKKHNpbmdsZS10aHJlYWRl
ZCkgcHJvY2VzcyBqdXN0IHRvIGNyZWF0ZSBuZXcgY2hpbGQgcHJvY2Vzc2VzLiBBbnkgaW5mb3Jt
YXRpb24KcmVnYXJkaW5nIHRoZSBhcHBzIGFib3ZlIHRoYXQgdXNlIGZvcmsoKSBvbiBzbWFsbCB2
cy4gbGFyZ2UgcHJvY2Vzc2VzPwoKPiAKPiBUaGlzIGNvbmZpcm1zIHRoYXQgZm9yaygpIGlzIHdp
ZGVseSB1c2VkIGluIHJlYWwtd29ybGQgbXVsdGktdGhyZWFkZWQKPiBBbmRyb2lkIGFwcGxpY2F0
aW9ucy4KCkFib3ZlIHlvdSB3cml0ZSAic29tZSBjYWxsIGZvcmsoKSBmcm9tIG11bHRpcGxlIHRo
cmVhZHMiLiBBbnkgZnVydGhlcgppbmZvcm1hdGlvbiBvbiB0aGF0PwoKLS0gCkNoZWVycywKCkRh
dmlkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
