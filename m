Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A31C25B7E
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 01:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UOUpa9ySY8tV7RHQZOf5gFdh9xuWObvVa+P4Fh+9wEI=; b=koimyIhGAnyAwK
	yIiUoNWYOBOTgZF1eJic4JHH3HUmPZPWtI/0VjHiZxIkV5BbnO+MPmpC1eCoXD7x69XCdVd4kG6Sn
	XOqY7p0gLCqnBnm8RMLaYBlV2/sJ0QDC+RpqQwfkjbP0Q5WV9IhGmkDCbT0wmCjhXSC+aKmj96hhE
	2nR4qXHfKEwh+wfMBVu5qlZDJuTGRMJBI8GQ+ORNP9rZCzI23f1f6T9eeAmQnH6UcF0R8RewIPrpy
	dR/xssipccF0c3D1KpPDMwR4jRusWJoel2brzUFNT9Ax8uPG6XyARmRmvgLZ9VAcKh1zoZeZwWLCR
	25hCeuUilc+W2INPHWkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCUHl-00000005xm5-48Ux;
	Thu, 30 May 2024 01:08:53 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCUHg-00000005xix-1zFI
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 01:08:51 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-43f87dd6866so167791cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 18:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717031324; x=1717636124; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNCYiTPJ+jmwqf05JMT+AdSr7J72TbIz2CKFhve3Jy0=;
        b=lczTdgrz7OkUYzlzZsjk+jg5FY6Wlp3lYbL3ag6Nl4J0U7By5sMCrcTXGs1soV/KY8
         /czECsUJSlrpWJetrVIgL3xHZz+FOI0X4fMHix9zNPXuE9ErqxjBU5L3TSUubFk2qixZ
         nPeuZ3naqBGlI8X31hJ0Ozi7IF08g64Ue4uADoCGma2ELNXlK6/rgZ7YGhC+DmunVLgs
         xw0UPiLrRUwrlAD/8S8oX5vYWOGIlqqwmkQ+O8TX1W+VpTGG3nr0BnCKJJ+oNGFPgYeX
         MDKUzcuvK2pKxmLdld5YvAy+xBEmnT1OWDo+xlSn+pgNkRcnye0EZvl6X02AaUXq9+Ao
         NG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717031324; x=1717636124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RNCYiTPJ+jmwqf05JMT+AdSr7J72TbIz2CKFhve3Jy0=;
        b=O2+Al1NGYCgyRmmik1ENhsqonY1rfPgA3kYr5o+bbuSt3S8OOwUQdgdMfMwAVOVi+G
         tM051azB1L7RphLvji0fWv0vkSzbtTNOG4HlezpJbWQJhpsSVKtbAkdT5yzz+q6FGocq
         JEKXZcr2hSAnjYV4SAYc+S7qdJcdV+ztYyv+PmiZWTZGvPVxhrHhiBQ4zTnyhhCztFS4
         BV3yiHZ5rzVmPRHu5qwyQsUUs0XcN/Y9AHFAU3sP1pqEwTU8SGfqp+x+Oy/6hIXUgnJd
         orjhAC5N6eeuR8LtoVeN2Md+YQRrx9WkCJysI23v+OwBskEwrnyes8PDI+GcbPvmqRhT
         Pb+w==
X-Forwarded-Encrypted: i=1; AJvYcCXkGImDXG9vbpdxOqhBXgmdUg/ykaQI36348yKmvvIhY5jKL6ljdeq2WdotDPBQ+kI//gx7rVgmpTS1f9kWjdCRHvDWxaet8hAXucG551ef
X-Gm-Message-State: AOJu0YwbvC09ZgWR5zEwicDDI9SgMTIRVwdnztr8pF1uocXgiuci/7dI
	Udlum3Cpg/2D1Rqy3K4wA7We0ouxLAA09tZX5kAFoAgoDxcyrgAUrDMnJy/Gbu7mw0yFlanz8bW
	p+NYJa8tImd9m2V2MhOmUa4MMj4KAetQZEeXO
X-Google-Smtp-Source: AGHT+IFJBPRQlkDyYJeSsGM/RxiiiLg1VsLLsha8SGwYsobiZXs39Abfff+lsGr1GDYLgVu96Cm8k7GvNnaVZDK3Ruk=
X-Received: by 2002:a05:622a:5509:b0:43b:6b6:8cad with SMTP id
 d75a77b69052e-43fe8e0b1dfmr1268341cf.10.1717031323987; Wed, 29 May 2024
 18:08:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <ZlelW93_T6P-ZuSZ@google.com> <CAOUHufZdEpY6ra73SMHA33DegKxKaUM=Os7A7aDBFND6NkbUmQ@mail.gmail.com>
 <Zley-u_dOlZ-S-a6@google.com>
In-Reply-To: <Zley-u_dOlZ-S-a6@google.com>
From: James Houghton <jthoughton@google.com>
Date: Wed, 29 May 2024 18:08:06 -0700
Message-ID: <CADrL8HXHWg_MkApYQTngzmN21NEGNWC6KzJDw_Lm63JHJkR=5A@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
To: Sean Christopherson <seanjc@google.com>
Cc: Yu Zhao <yuzhao@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ankit Agrawal <ankita@nvidia.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Bibo Mao <maobibo@loongson.cn>, Catalin Marinas <catalin.marinas@arm.com>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Morse <james.morse@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Raghavendra Rao Ananta <rananta@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_180848_630968_E1DBA468 
X-CRM114-Status: GOOD (  41.65  )
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

T24gV2VkLCBNYXkgMjksIDIwMjQgYXQgMzo1OOKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgTWF5IDI5LCAyMDI0LCBZdSBaaGFv
IHdyb3RlOgo+ID4gT24gV2VkLCBNYXkgMjksIDIwMjQgYXQgMzo1OeKAr1BNIFNlYW4gQ2hyaXN0
b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gV2VkLCBN
YXkgMjksIDIwMjQsIFl1IFpoYW8gd3JvdGU6Cj4gPiA+ID4gT24gV2VkLCBNYXkgMjksIDIwMjQg
YXQgMTI6MDXigK9QTSBKYW1lcyBIb3VnaHRvbiA8anRob3VnaHRvbkBnb29nbGUuY29tPiB3cm90
ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBTZWNvbmRhcnkgTU1VcyBhcmUgY3VycmVudGx5IGNvbnN1
bHRlZCBmb3IgYWNjZXNzL2FnZSBpbmZvcm1hdGlvbiBhdAo+ID4gPiA+ID4gZXZpY3Rpb24gdGlt
ZSwgYnV0IGJlZm9yZSB0aGVuLCB3ZSBkb24ndCBnZXQgYWNjdXJhdGUgYWdlIGluZm9ybWF0aW9u
Lgo+ID4gPiA+ID4gVGhhdCBpcywgcGFnZXMgdGhhdCBhcmUgbW9zdGx5IGFjY2Vzc2VkIHRocm91
Z2ggYSBzZWNvbmRhcnkgTU1VIChsaWtlCj4gPiA+ID4gPiBndWVzdCBtZW1vcnksIHVzZWQgYnkg
S1ZNKSB3aWxsIGFsd2F5cyBqdXN0IHByb2NlZWQgZG93biB0byB0aGUgb2xkZXN0Cj4gPiA+ID4g
PiBnZW5lcmF0aW9uLCBhbmQgdGhlbiBhdCBldmljdGlvbiB0aW1lLCBpZiBLVk0gcmVwb3J0cyB0
aGUgcGFnZSB0byBiZQo+ID4gPiA+ID4geW91bmcsIHRoZSBwYWdlIHdpbGwgYmUgYWN0aXZhdGVk
L3Byb21vdGVkIGJhY2sgdG8gdGhlIHlvdW5nZXN0Cj4gPiA+ID4gPiBnZW5lcmF0aW9uLgo+ID4g
PiA+Cj4gPiA+ID4gQ29ycmVjdCwgYW5kIGFzIEkgZXhwbGFpbmVkIG9mZmxpbmUsIHRoaXMgaXMg
dGhlIG9ubHkgcmVhc29uYWJsZQo+ID4gPiA+IGJlaGF2aW9yIGlmIHdlIGNhbid0IGxvY2tsZXNz
bHkgd2FsayBzZWNvbmRhcnkgTU1Vcy4KPiA+ID4gPgo+ID4gPiA+IEp1c3QgZm9yIHRoZSByZWNv
cmQsIHRoZSAoY3J1ZGUpIGFuYWxvZ3kgSSB1c2VkIHdhczoKPiA+ID4gPiBJbWFnaW5lIGEgbGFy
Z2Ugcm9vbSB3aXRoIG1hbnkgYmlsbHMgKCQxLCAkNSwgJDEwLCAuLi4pIG9uIHRoZSBmbG9vciwK
PiA+ID4gPiBidXQgeW91IGFyZSBvbmx5IGFsbG93ZWQgdG8gcGljayB1cCAxMCBvZiB0aGVtIChh
bmQgcHV0IHRoZW0gaW4geW91cgo+ID4gPiA+IHBvY2tldCkuIEEgc21hcnQgbW92ZSB3b3VsZCBi
ZSB0byBzdXJ2ZXkgdGhlIHJvb20gKmZpcnN0IGFuZCB0aGVuKgo+ID4gPiA+IHBpY2sgdXAgdGhl
IGxhcmdlc3Qgb25lcy4gQnV0IGlmIHlvdSBhcmUgY2FycnlpbmcgYSA1MDAgbGJzIGJhY2twYWNr
LAo+ID4gPiA+IHlvdSB3b3VsZCBqdXN0IHdhbnQgdG8gcGljayB1cCB3aGljaGV2ZXIgdGhhdCdz
IGluIGZyb250IG9mIHlvdSByYXRoZXIKPiA+ID4gPiB0aGFuIHdhbGsgdGhlIGVudGlyZSByb29t
Lgo+ID4gPiA+Cj4gPiA+ID4gTUdMUlUgc2hvdWxkIG9ubHkgc2NhbiAob3IgbG9va2Fyb3VuZCkg
c2Vjb25kYXJ5IE1NVXMgaWYgaXQgY2FuIGJlCj4gPiA+ID4gZG9uZSBsb2NrbGVzcy4gT3RoZXJ3
aXNlLCBpdCBzaG91bGQganVzdCBmYWxsIGJhY2sgdG8gdGhlIGV4aXN0aW5nCj4gPiA+ID4gYXBw
cm9hY2gsIHdoaWNoIGV4aXN0ZWQgaW4gcHJldmlvdXMgdmVyc2lvbnMgYnV0IGlzIHJlbW92ZWQg
aW4gdGhpcwo+ID4gPiA+IHZlcnNpb24uCj4gPiA+Cj4gPiA+IElJVUMsIGJ5ICJleGlzdGluZyBh
cHByb2FjaCIgeW91IG1lYW4gY29tcGxldGVseSBpZ25vcmUgc2Vjb25kYXJ5IE1NVXMgdGhhdAo+
ID4gPiBkb24ndCBpbXBsZW1lbnQgYSBsb2NrbGVzcyB3YWxrPwo+ID4KPiA+IE5vLCB0aGUgZXhp
c3RpbmcgYXBwcm9hY2ggb25seSBjaGVja3Mgc2Vjb25kYXJ5IE1NVXMgZm9yIExSVSBmb2xpb3Ms
Cj4gPiBpLmUuLCB0aG9zZSBhdCB0aGUgZW5kIG9mIHRoZSBMUlUgbGlzdC4gSXQgbWlnaHQgbm90
IGZpbmQgdGhlIGJlc3QKPiA+IGNhbmRpZGF0ZXMgKHRoZSBjb2xkZXN0IG9uZXMpIG9uIHRoZSBl
bnRpcmUgbGlzdCwgYnV0IGl0IGRvZXNuJ3QgcGF5Cj4gPiBhcyBtdWNoIGZvciB0aGUgbG9ja2lu
Zy4gTUdMUlUgY2FuICpvcHRpb25hbGx5KiBzY2FuIE1NVXMgKHNlY29uZGFyeQo+ID4gaW5jbHVk
ZWQpIHRvIGZpbmQgdGhlIGJlc3QgY2FuZGlkYXRlcywgYnV0IGl0IGNhbiBvbmx5IGJlIGEgd2lu
IGlmIHRoZQo+ID4gc2Nhbm5pbmcgaW5jdXJzIGEgcmVsYXRpdmVseSBsb3cgb3ZlcmhlYWQsIGUu
Zy4sIGRvbmUgbG9ja2xlc3NseSBmb3IKPiA+IHRoZSBzZWNvbmRhcnkgTU1VLiBJT1csIHRoaXMg
aXMgYSBiYWxhbmNlIGJldHdlZW4gdGhlIGNvc3Qgb2YKPiA+IHJlY2xhaW1pbmcgbm90LXNvLWNv
bGQgKHdhcm0pIGZvbGlvcyBhbmQgdGhhdCBvZiBmaW5kaW5nIHRoZSBjb2xkZXN0Cj4gPiBmb2xp
b3MuCj4KPiBHb3RjaGEuCj4KPiBJIHRlbmQgdG8gYWdyZWUgd2l0aCBZdSwgZHJpdmluZyB0aGUg
YmVoYXZpb3IgdmlhIGEgS2NvbmZpZyBtYXkgZ2VuZXJhdGUgc2ltcGxlcgo+IF9jb2RlXywgYnV0
IEkgdGhpbmsgaXQgaW5jcmVhc2VzIHRoZSBvdmVyYWxsIHN5c3RlbSBjb21wbGV4aXR5LiAgRS5n
LiBkaXN0cm9zCj4gd2lsbCBsaWtlbHkgZW5hYmxlIHRoZSBLY29uZmlnLCBhbmQgaW4gbXkgZXhw
ZXJpZW5jZSBwZW9wbGUgdXNpbmcgS1ZNIHdpdGggYQo+IGRpc3RybyBrZXJuZWwgdXN1YWxseSBh
cmVuJ3Qga2VybmVsIGV4cGVydHMsIGkuZS4gbGlrZWx5IHdvbid0IGtub3cgdGhhdCB0aGVyZSdz
Cj4gZXZlbiBhIGRlY2lzaW9uIHRvIGJlIG1hZGUsIGxldCBhbG9uZSBiZSBhYmxlIHRvIG1ha2Ug
YW4gaW5mb3JtZWQgZGVjaXNpb24uCj4KPiBIYXZpbmcgYW4gbW11X25vdGlmaWVyIGhvb2sgdGhh
dCBpcyBjb25kaXRpb25hbGx5IGltcGxlbWVudGVkIGRvZXNuJ3Qgc2VlbSBvdmVybHkKPiBjb21w
bGV4LCBlLmcuIGV2ZW4gaWYgdGhlcmUncyBhIHJ1bnRpbWUgYXNwZWN0IGF0IHBsYXksIGl0J2Qg
YmUgZWFzeSBlbm91Z2ggZm9yCj4gS1ZNIHRvIG51bGxpZnkgaXRzIG1tdV9ub3RpZmllciBob29r
IGR1cmluZyBpbml0aWFsaXphdGlvbi4gIFRoZSBoYXJkZXN0IHBhcnQgaXMKPiBsaWtlbHkgZ29p
bmcgdG8gYmUgZmlndXJpbmcgb3V0IHRoZSB0aHJlc2hvbGQgZm9yIGhvdyBtdWNoIG92ZXJoZWFk
IGlzIHRvbyBtdWNoLgoKSGkgWXUsIFNlYW4sCgpQZXJoYXBzIEkgInNpbXBsaWZpZWQiIHRoaXMg
Yml0IG9mIHRoZSBzZXJpZXMgYSBsaXR0bGUgYml0IHRvbyBtdWNoLgpCZWluZyBhYmxlIHRvIG9w
cG9ydHVuaXN0aWNhbGx5IGRvIGFnaW5nIHdpdGggS1ZNIChldmVuIHdpdGhvdXQKc2V0dGluZyB0
aGUgS2NvbmZpZykgaXMgdmFsdWFibGUuCgpJSVVDLCB3ZSBoYXZlIHRoZSBmb2xsb3dpbmcgcG9z
c2liaWxpdGllczoKLSB2NDogYWdpbmcgd2l0aCBLVk0gaXMgZG9uZSBpZiB0aGUgbmV3IEtjb25m
aWcgaXMgc2V0LgotIHYzOiBhZ2luZyB3aXRoIEtWTSBpcyBhbHdheXMgZG9uZS4KLSB2MjogYWdp
bmcgd2l0aCBLVk0gaXMgZG9uZSB3aGVuIHRoZSBhcmNoaXRlY3R1cmUgcmVwb3J0cyB0aGF0IGl0
IGNhbgpwcm9iYWJseSBiZSBkb25lIGxvY2tsZXNzbHksIHNldCBhdCBLVk0gTU1VIGluaXQgdGlt
ZS4KLSBBbm90aGVyIHBvc3NpYmlsaXR5PzogYWdpbmcgd2l0aCBLVk0gaXMgb25seSBkb25lIGV4
YWN0bHkgd2hlbiBpdApjYW4gYmUgZG9uZSBsb2NrbGVzc2x5IChpLmUuLCBtbXVfbm90aWZpZXJf
dGVzdC9jbGVhcl95b3VuZygpIGNhbGxlZApzdWNoIHRoYXQgaXQgd2lsbCBub3QgZ3JhYiBhbnkg
bG9ja3MpLgoKSSBsaWtlIHRoZSB2NCBhcHByb2FjaCBiZWNhdXNlOgoxLiBXZSBjYW4gY2hvb3Nl
IHdoZXRoZXIgb3Igbm90IHRvIGRvIGFnaW5nIHdpdGggS1ZNIG5vIG1hdHRlciB3aGF0CmFyY2hp
dGVjdHVyZSB3ZSdyZSB1c2luZyAod2l0aG91dCByZXF1aXJpbmcgdXNlcnNwYWNlIGJlIGF3YXJl
IHRvCmRpc2FibGUgdGhlIGZlYXR1cmUgYXQgcnVudGltZSB3aXRoIHN5c2ZzIHRvIGF2b2lkIHJl
Z3Jlc3NpbmcKcGVyZm9ybWFuY2UgaWYgdGhleSBkb24ndCBjYXJlIGFib3V0IHByb2FjdGl2ZSBy
ZWNsYWltKS4KMi4gSWYgd2UgY2hlY2sgdGhlIG5ldyBmZWF0dXJlIGJpdCAoMHg4KSBpbiBzeXNm
cywgd2UgY2FuIGtub3cgZm9yCnN1cmUgaWYgYWdpbmcgaXMgbWVhbnQgdG8gYmUgd29ya2luZyBv
ciBub3QuIFRoZSBzZWxmdGVzdCBjaGFuZ2VzIEkKbWFkZSB3b24ndCB3b3JrIHByb3Blcmx5IHVu
bGVzcyB0aGVyZSBpcyBhIHdheSB0byBiZSBzdXJlIHRoYXQgYWdpbmcKaXMgd29ya2luZyB3aXRo
IEtWTS4KCkZvciBsb29rLWFyb3VuZCBhdCBldmljdGlvbiB0aW1lOgotIHY0OiBkb25lIGlmIHRo
ZSBtYWluIG1tIFBURSB3YXMgeW91bmcgYW5kIG5vIE1NVSBub3RpZmllcnMgYXJlIHN1YnNjcmli
ZWQuCi0gdjIvdjM6IGRvbmUgaWYgdGhlIG1haW4gbW0gUFRFIHdhcyB5b3VuZyBvciAodGhlIFNQ
VEUgd2FzIHlvdW5nIGFuZAp0aGUgTU1VIG5vdGlmaWVyIHdhcyBsb2NrbGVzcy9mYXN0KS4KCkkg
bWFkZSB0aGlzIGxvZ2ljIGNoYW5nZSBhcyBwYXJ0IG9mIHJlbW92aW5nIGJhdGNoaW5nLgoKSSdk
IHJlYWxseSBhcHByZWNpYXRlIGd1aWRhbmNlIG9uIHdoYXQgdGhlIGNvcnJlY3QgdGhpbmcgdG8g
ZG8gaXMuCgpJbiBteSBtaW5kLCB3aGF0IHdvdWxkIHdvcmsgZ3JlYXQgaXM6IGJ5IGRlZmF1bHQs
IGRvIGFnaW5nIGV4YWN0bHkKd2hlbiBLVk0gY2FuIGRvIGl0IGxvY2tsZXNzbHksIGFuZCB0aGVu
IGhhdmUgYSBLY29uZmlnIHRvIGFsd2F5cyBoYXZlCk1HTFJVIHRvIGRvIGFnaW5nIHdpdGggS1ZN
IGlmIGEgdXNlciByZWFsbHkgY2FyZXMgYWJvdXQgcHJvYWN0aXZlCnJlY2xhaW0gKHdoZW4gdGhl
IGZlYXR1cmUgYml0IGlzIHNldCkuIFRoZSBzZWxmdGVzdCBjYW4gY2hlY2sgdGhlCktjb25maWcg
KyBmZWF0dXJlIGJpdCB0byBrbm93IGZvciBzdXJlIGlmIGFnaW5nIHdpbGwgYmUgZG9uZS4KCkkn
bSBub3Qgc3VyZSB3aGF0IHRoZSBleGFjdCByaWdodCB0aGluZyB0byBkbyBmb3IgbG9vay1hcm91
bmQgaXMuCgpUaGFua3MgZm9yIHRoZSBxdWljayBmZWVkYmFjay4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
