Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A80AC43327
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 16:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QhLrIWruNOutQEb1FmKq4tlJiJ9sOhb5kUd86JlVRf0=; b=3/HCro8rNhILdH
	WIeADWIC8JIu+wc7I77SOls6ZckgjNaIUjSU3l7MNYA4HayADYwmg0BlLD2bMCBhWO9N+doFpJOm3
	DfCNmft4g5vgS9auBrM6qInxT2IqlbbfJrSDdQQOH6tnEe5fOFBklpBp5J4JsuckYTRScHD1+NECN
	i5iNoxwfM7CyoksOyuMn4oEt+28iuz9b8KgBumc4LtsCyM5hqIx483N/TUI22znLg1293XKgn7BxA
	PQANHib3GHl0ZPGMhb5+hemCRZxLa7Cig5LMQa0fopk52WQx3bBPXh6ypqGaTVuncjwB3MV8Bv8fU
	SrGm5f9L9puwjG7+Gy/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weFA2-0000000FFPZ-3m6R;
	Mon, 29 Jun 2026 16:48:42 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weFA0-0000000FFOR-2GWl
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 16:48:41 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-664d7863920so1211668d50.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 09:48:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782751719; cv=none;
        d=google.com; s=arc-20260327;
        b=JuRD1QhDpUJubeH5Bb8gu+uBoRVveRE2h8kFYTCDeDSkCcWEvZEsC6DFPP+EhZg3kC
         1ug8v1QwCu5KJMX/DpAPj6kO19GzYSobZv3/2ZdQ0boUwb+ksMDM5s+E+wuRCa55QUKw
         sxjZIEaHfxCahKPZJh6fckvZL4K8tZvJg0KzG4zvXDeI50dYaroEPHX30i+hwFC1JdcQ
         kknRd39M/Z2dnV3jQ1SDQ0QQca2qwg0qQ+7fx/RC9WZQwygwv5KQkBu9xZyGoHoTpgnI
         bXnFsqMysDsE4JdtLcFd7gmDcFSRHzaeUUBgmOA0MWONZ9vuHs6JrOHJ5Q+HHK1scCML
         9quw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pqu0ijd46YxLc8T2KWk89iPbnUD8g36UVIY5VbePUtk=;
        fh=ydMszYnEuPR0F2DLfVtTgSryTlsHG3Y4ZTFTND4EY50=;
        b=LcMcgQmoZbyDx4XKFgCHo+VIfoEeIY/TXW+UbodEmfTESez3uG4NwvQTKd1HMuspNN
         cWaxXBNFEMkxUDClyPkghVabrFdkXSAoroZmXWauKx6UR7dRbrlvCyet8iKx8hDBf603
         es6xoGCe35wO2L8EEyZblysaPKDT1CQel82JHqJCc8NqtQ2Efv0Ay/8RRNNLGfei9v7J
         HqL7aaFRwcqsP8NWI//igWI5FFJS0Dk0gJx0u+5VAo6oe9SyhoK+V3nYdWlNnz13xuIF
         6vyD075FlikEDV0myq0HbGnznjrW0N6ldRDWDeodiV0pWeqE8diVbz6KNT2b4Kw5w6KS
         bD0Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782751719; x=1783356519; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pqu0ijd46YxLc8T2KWk89iPbnUD8g36UVIY5VbePUtk=;
        b=jDig6LzCOKHm542CM4SrqNktw8ha7r6YOjLEPt5gu8wuKbSB3OjVnalJAzQW4uSkNT
         YO7Y1dUsXpXBdL8u8j4S9icC9yeV710ChJYua7cjACG+9OnTFxmQ6CtnKhARJOB2Tw9l
         21rkwSFNRXeJXpTjOVMGK5P9EpBPj1IOpc7RB9Mb3dRDH/v6+i0bvuVxjl4CBJxEu0Aq
         HwlmE0wG33okr2nw+JBW4QXh8C8XJO/0fM1Xf+ptc5A/mL6S5sXHvYW6kBvptTVRi+A6
         meeL1G1ujXUhjyiypkWZTAuk4ZLREyHOQcEWF+EKLfv0DugtAmxcd50kj32GjpDt0Q++
         wfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782751719; x=1783356519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pqu0ijd46YxLc8T2KWk89iPbnUD8g36UVIY5VbePUtk=;
        b=MrUA38QORCuJDJGWULMch4HUSgvjG+CXiQ+a+aHmw7Sz5cv4E7j23sWvejbDO60xqA
         QCoqDrbq2X0OSWrJY45GANkIDsFCnRQcOlqa0zsAcuG3tWsrIdQJwWxQlnLSj/Ccl7p4
         sH9yty66SlFYC+V96MUh423ishtpwCwaIEskvogX8E/N+jgjMeU6NH0qRro6kU4oj2/K
         0s1cLzX/cbzTN0gWSWPrLtFuXQVrJ4rqBhIhUlnkh+2GdhXUpSlOQ1B2V/f2hxssacHK
         SN2//1iXkYS37KYb+EG/i6XuS2eKiSuHt3QkcXqipEIi4NjU8kZrdE5i2/303kD5Ukyv
         B/8w==
X-Forwarded-Encrypted: i=1; AHgh+RpMrkz2QnIlgKqPaTqWZImzt93GIaHk9Qc6282KD/gVmKJQK+TBpwRNMoe1YULB1RN1np9n2EZs5FXs/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwvzA4WNTWiMs2kFeBOJNLG8Di2eMBiDdYeivQlHC/Z4bTbxLce
	htpNaIbEoZLmnW7orbGibj5ovQeM7mnjQqFPdPJsL8SZxp78J+opuSBp/D6EZCaDfIfjc8DV+VX
	PjozTfwAmGqhaySqECGb36eNjBsIFl78=
X-Gm-Gg: AfdE7cmB4N1xPyZ1i2hgbHR9rE4MIhIVwnXfK2zUjOqMYNQ3JdpUFHi3//rdaLahFog
	h5s4gOyoOh0y5d7yRqjT7igykkCKPhWQDvM/mHW5gF1ppQfcRkPQJaA2Sjz5FzL03IPu0tDAyYb
	Co034fwtd804U2k/kv+0b7ypenz3fsMC8DC5KR0qYUofJZyxTQLXqTzRnRHOe33PimCvUr0EpIr
	e7bEjeDuwzzKPTf8gnpCRuntZkx3A9XcIfqlPxiU3YBFuCcaX11HU7uZJx6wzPZWF0/7g==
X-Received: by 2002:a53:a7cd:0:b0:664:c1a2:36ed with SMTP id
 956f58d0204a3-664f9a828b9mr336123d50.63.1782751719282; Mon, 29 Jun 2026
 09:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260621145919.1453-1-ekffu200098@gmail.com> <aj426bA-YiOKt06m@kernel.org>
 <CABFDxME8wej3m8T5gn8y4dmpOLZutm=tDTa7ZcfhbWwScTu_5Q@mail.gmail.com> <akJafRKJJBd5Jrv0@kernel.org>
In-Reply-To: <akJafRKJJBd5Jrv0@kernel.org>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Tue, 30 Jun 2026 01:48:27 +0900
X-Gm-Features: AVVi8Ce7e8tTlZ7wLMJcBpYQ1j4KVXqbB4X7R45vGUUSJRnYUp1U99vuoyq3ILs
Message-ID: <CABFDxMFTfFO_jePBnM_uZXcmLBHJM3db-=VzFE+bxSYgm1G-1Q@mail.gmail.com>
Subject: Re: [PATCH 0/6] treewide: remove unnecessary invalid range checks in
 memblock iteration loops
To: Mike Rapoport <rppt@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Will Deacon <will@kernel.org>, Alexander Potapenko <glider@google.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrey Konovalov <andreyknvl@gmail.com>, David Hildenbrand <david@kernel.org>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, WANG Xuerui <kernel@xen0n.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_094840_586110_8972479B 
X-CRM114-Status: GOOD (  22.25  )
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

T24gTW9uLCBKdW4gMjksIDIwMjYgYXQgODo0NOKAr1BNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1biAyNiwgMjAyNiBhdCAwNzo1OToyMlBNICsw
OTAwLCBTYW5nLUhlb24gSmVvbiB3cm90ZToKPiA+IE9uIEZyaSwgSnVuIDI2LCAyMDI2IGF0IDU6
MjPigK9QTSBNaWtlIFJhcG9wb3J0IDxycHB0QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4g
PiBPbiBTdW4sIEp1biAyMSwgMjAyNiBhdCAxMTo1OToxMFBNICswOTAwLCBTYW5nLUhlb24gSmVv
biB3cm90ZToKPiA+ID4gPiBUaGUgbWVtYmxvY2sgQVBJIGd1YXJhbnRlZXMgdGhhdCBmb3JfZWFj
aF9tZW1fcmFuZ2UoKSBhbmQKPiA+ID4gPiBmb3JfZWFjaF9tZW1fcGZuX3JhbmdlKCkgbmV2ZXIg
cmV0dXJuIGFuIGludmFsaWQgcmFuZ2UsIG1lYW5pbmcgc3RhcnQgaXMKPiA+ID4gPiBhbHdheXMg
bGVzcyB0aGFuIGVuZC4KPiA+ID4gPgo+ID4gPiA+IFNldmVyYWwgbWVtYmxvY2sgY2FsbGVycyBz
dGlsbCBoYXZlIHVubmVjZXNzYXJ5IGludmFsaWQgcmFuZ2UgY2hlY2tzIGluCj4gPiA+ID4gdGhl
aXIgbG9vcCBib2RpZXMsIHNvIHJlbW92ZSB0aGVtLgo+ID4gPiA+Cj4gPiA+ID4gU2FuZy1IZW9u
IEplb24gKDYpOgo+ID4gPiA+ICAgYXJtNjQ6IG1tOiByZW1vdmUgdW5yZWFjaGFibGUgaW52YWxp
ZCByYW5nZSBjaGVjayBpbgo+ID4gPiA+ICAgICBrYXNhbl9pbml0X3NoYWRvdygpCj4gPiA+ID4g
ICBMb29uZ0FyY2g6IHJlbW92ZSB1bnJlYWNoYWJsZSBpbnZhbGlkIHJhbmdlIGNoZWNrIGluIGth
c2FuX2luaXQoKQo+ID4gPiA+ICAgcmlzY3Y6IHJlbW92ZSB1bnJlYWNoYWJsZSBpbnZhbGlkIHJh
bmdlIGNoZWNrIGluCj4gPiA+ID4gICAgIGNyZWF0ZV9saW5lYXJfbWFwcGluZ19wYWdlX3RhYmxl
KCkKPiA+ID4gPiAgIHJpc2N2OiByZW1vdmUgdW5yZWFjaGFibGUgaW52YWxpZCByYW5nZSBjaGVj
ayBpbiBrYXNhbl9pbml0KCkKPiA+ID4gPiAgIG1tOiByZW1vdmUgdW5uZWNlc3NhcnkgZW1wdHkg
cmFuZ2UgY2hlY2sgaW4KPiA+ID4gPiAgICAgZWFybHlfY2FsY3VsYXRlX3RvdGFscGFnZXMoKQo+
ID4gPiA+ICAgbW0vaHVnZXRsYjogcmVtb3ZlIHVubmVjZXNzYXJ5IGVtcHR5IHJhbmdlIGNoZWNr
IGluCj4gPiA+ID4gICAgIGh1Z2V0bGJfYm9vdG1lbV9zZXRfbm9kZXMoKQo+ID4gPgo+ID4gPiBJ
IHF1ZXVlZCB0aGlzIGZvciBpbmNsdXNpb24gaW50byBtZW1ibG9jayB0cmVlLgo+ID4KPiA+IFRo
YW5rIHlvdSwgTWlrZS4KPiA+Cj4gPiBDb3VsZCB5b3UgcGxlYXNlIHJldmlldyBhbmQgcXVldWUg
dGhpcyBwYXRjaCBbMV0gYXMgd2VsbD8gSXQgZG9lcyB0aGUKPiA+IHNhbWUga2luZCBvZiBjbGVh
biB1cCwgSSBqdXN0IG1pc3NlZCBpdCBhdCB0aGUgdGltZS4KPgo+IENhbiB5b3UgcGxlYXNlIHJl
c2VuZCB0aGVtIGFsbCBhcyBhIHNpbmdsZSBzZXQ/CgpUaGFua3MgZm9yIGNvbnNpZGVyaW5nLCBN
aWtlLgpJJ3ZlIHNlbnQgdjIgcGF0Y2ggc2VyaWVzIFsxXSB0aGF0IGluY2x1ZGVzIHRoZSBtaXNz
aW5nIHBhdGNoZXMuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNjI5MTYz
NzM2LjE2MDY2ODgtMS1la2ZmdTIwMDA5OEBnbWFpbC5jb20vI3QKCj4gPiBbMV0gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNjI2MDMyOTAyLjcwMzk0NC0xLWVrZmZ1MjAwMDk4QGdt
YWlsLmNvbS8KPiA+Cj4gPiA+ID4gIGFyY2gvYXJtNjQvbW0va2FzYW5faW5pdC5jICAgICB8IDMg
LS0tCj4gPiA+ID4gIGFyY2gvbG9vbmdhcmNoL21tL2thc2FuX2luaXQuYyB8IDMgLS0tCj4gPiA+
ID4gIGFyY2gvcmlzY3YvbW0vaW5pdC5jICAgICAgICAgICB8IDIgLS0KPiA+ID4gPiAgYXJjaC9y
aXNjdi9tbS9rYXNhbl9pbml0LmMgICAgIHwgMyAtLS0KPiA+ID4gPiAgbW0vaHVnZXRsYi5jICAg
ICAgICAgICAgICAgICAgIHwgMyArLS0KPiA+ID4gPiAgbW0vbW1faW5pdC5jICAgICAgICAgICAg
ICAgICAgIHwgMyArLS0KPiA+ID4gPiAgNiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDE1IGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4gPiA+ID4gLS0KPiA+ID4gPiAyLjQzLjAKPiA+ID4g
Pgo+ID4gPgo+ID4gPiAtLQo+ID4gPiBTaW5jZXJlbHkgeW91cnMsCj4gPiA+IE1pa2UuCj4gPgo+
ID4gQmVzdCBSZWdhcmRzLAo+ID4gU2FuZy1IZW9uIEplb24KPgo+IC0tCj4gU2luY2VyZWx5IHlv
dXJzLAo+IE1pa2UuCgpCZXN0IFJlZ2FyZHMsClNhbmctSGVvbiBKZW9uCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
