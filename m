Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7A6C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 19:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tj+unUiH/f21xrZS1mHKe85+iCeFsV8RgjSWbfQMmc8=; b=1TbRXU36MXL/Z7
	pzCn8nVkeme8b/A4QLUjtriFhrQuKKK0XHfkcBaZkG3AGOQUTAUb4f2NM+de3fbxxThKMQ678qiXt
	v7JXQsXhnkHQKSFsNY6QU3TD1YEu50wm8N2poAaKBQ4+ndPyXavKR2sCdm0xbe007ESxcVttVha/u
	TzPSYv7xS2PGsV6IGvx8DJQzeRGbcYbikXtsRvq4veGIfv/uCB9Orc9ChDFvHtCem/ooeU9u1rzsT
	VvG2Qz/N+GeoHqRLPpEC10W5L/9XaFEeGXLEVr31zibB+TzaW2MDiF6taqRQKSfYL1cWhZBh+LHV+
	koECSSVxaAcm5q5GuXZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shDJh-0000000E3u3-1YCT;
	Thu, 22 Aug 2024 19:17:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shDIu-0000000E3co-08FI
	for linux-riscv@lists.infradead.org;
	Thu, 22 Aug 2024 19:17:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724354221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8YIGGOCAzyFLMegU+7vlNDExeBWij0GRi4vYqrn2fMA=;
	b=bsE7Juvxqdfr7b385vESNRNAv5wUuV2nAXdUwxP/BZZYnpQqLicGAzH/1H/NKiGqcTbKdk
	uAK+Q8PjiHlT4/4UXgTArrKv/dgcIixQINGkSLEk+85lR/kd6lpZX6Epy2ydh97orvqyXA
	Z5CSHk/HkOEZUiBvVeStdB9iNdrOux4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-blvqNvRDNP2Kz2ekGvygQw-1; Thu, 22 Aug 2024 15:16:59 -0400
X-MC-Unique: blvqNvRDNP2Kz2ekGvygQw-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6bf6a05cb2eso13035226d6.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Aug 2024 12:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724354219; x=1724959019;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8YIGGOCAzyFLMegU+7vlNDExeBWij0GRi4vYqrn2fMA=;
        b=JMrzX9tP4pVqADYdtNw0HT/wFtBIzYeni0xzL55RyoZrdN/3KPzbZbLpPvSNOtyw+u
         pTUoXVUd74Rvp3tiYsB9mS9QT04YEj7fZEnlx1AyPCQHXxhzB4Q+CEUnqk9TfuNnddX6
         1/BBlUlW7UYbrWCt7vV7afJlp14v69GB13+vR4+vemvd++78oAZrJ/xNP39o4IfY9tQA
         x/OAVJ4ynZzaBcQQq+Mz67X8cwTAMQn/wqfYlj2saTRSZbSipgJxylOzrAjGr0ovPeDf
         3GTWqFQ12E8DO7mAlxCw5JkEAXknuLsvBRpb67/O82NJHaxvAqkjtRBDNici8SKtkL4r
         aosA==
X-Forwarded-Encrypted: i=1; AJvYcCWz7XrWkIiTUnlMHXz3z9V6dLc7cXzeqVo4vMgTTnxMirYJMjmqmqqv+HWs8dZPbpo9SEh0rLMnmIgd4w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzC8D9uVdiHNjyA2OsLbmh3B+QKLGo1/uljluTerMlMXsFbw2CZ
	1C/IHjuZfBWRcPYzJ/AhtIciPHynCZ5tOPhag4NRUUsb+WudimvDZl0EoGENq1Vv1T0GI5uH2fk
	UbtI6g4qPJyX3tq/qU8pJQpeV1e2EmSNDHJaKf6oq4s0QTP7dnPhjdi8pqXM6w0c++A==
X-Received: by 2002:a05:6214:5d0b:b0:6bf:77d2:bd1b with SMTP id 6a1803df08f44-6c155d50b2cmr98300166d6.1.1724354219381;
        Thu, 22 Aug 2024 12:16:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFYSGXCSjeDYuhWfImPH5iwMXkcbcR5SnsnH9Y1R2sqbG+oUFa29LZaEVT2+yBaXWcgJ2DTA==
X-Received: by 2002:a05:6214:5d0b:b0:6bf:77d2:bd1b with SMTP id 6a1803df08f44-6c155d50b2cmr98299806d6.1.1724354219032;
        Thu, 22 Aug 2024 12:16:59 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c162db0986sm10643056d6.97.2024.08.22.12.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 12:16:58 -0700 (PDT)
Date: Thu, 22 Aug 2024 15:16:55 -0400
From: Peter Xu <peterx@redhat.com>
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Michal Hocko <mhocko@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>, "x86@kernel.org" <x86@kernel.org>,
	Alistair Popple <apopple@nvidia.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Hugh Dickins <hughd@google.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH RFC 2/6] mm: PGTABLE_HAS_P[MU]D_LEAVES config options
Message-ID: <ZseOp7M9AmZtW4jw@x1n>
References: <20240717220219.3743374-1-peterx@redhat.com>
 <20240717220219.3743374-3-peterx@redhat.com>
 <dcdde9fc-7e7c-45a8-8dc7-7f7ed13b81ec@cs-soprasteria.com>
MIME-Version: 1.0
In-Reply-To: <dcdde9fc-7e7c-45a8-8dc7-7f7ed13b81ec@cs-soprasteria.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_121704_174947_209720C6 
X-CRM114-Status: GOOD (  26.02  )
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

T24gVGh1LCBBdWcgMjIsIDIwMjQgYXQgMDU6MjI6MDNQTSArMDAwMCwgTEVST1kgQ2hyaXN0b3Bo
ZSB3cm90ZToKPiAKPiAKPiBMZSAxOC8wNy8yMDI0IMOgIDAwOjAyLCBQZXRlciBYdSBhIMOpY3Jp
dMKgOgo+ID4gSW50cm9kdWNlIHR3byBtb3JlIHN1Yi1vcHRpb25zIGZvciBQR1RBQkxFX0hBU19I
VUdFX0xFQVZFUzoKPiA+IAo+ID4gICAgLSBQR1RBQkxFX0hBU19QTURfTEVBVkVTOiBzZXQgd2hl
biB0aGVyZSBjYW4gYmUgUE1EIG1hcHBpbmdzCj4gPiAgICAtIFBHVEFCTEVfSEFTX1BVRF9MRUFW
RVM6IHNldCB3aGVuIHRoZXJlIGNhbiBiZSBQVUQgbWFwcGluZ3MKPiA+IAo+ID4gSXQgd2lsbCBo
ZWxwIHRvIGlkZW50aWZ5IHdoZXRoZXIgdGhlIGN1cnJlbnQgYnVpbGQgbWF5IG9ubHkgd2FudCBQ
TUQKPiA+IGhlbHBlcnMgYnV0IG5vdCBQVUQgb25lcywgYXMgdGhlc2Ugc3ViLW9wdGlvbnMgd2ls
bCBhbHNvIGNoZWNrIGFnYWluc3QgdGhlCj4gPiBhcmNoIHN1cHBvcnQgb3ZlciBIQVZFX0FSQ0hf
VFJBTlNQQVJFTlRfSFVHRVBBR0VbX1BVRF0uCj4gPiAKPiA+IE5vdGUgdGhhdCBoYXZpbmcgdGhl
bSBkZXBlbmQgb24gSEFWRV9BUkNIX1RSQU5TUEFSRU5UX0hVR0VQQUdFW19QVURdIGlzCj4gPiBz
dGlsbCBzb21lIGludGVybWVkaWF0ZSBzdGVwLiAgVGhlIGJlc3Qgd2F5IGlzIHRvIGhhdmUgYW4g
b3B0aW9uIHNheQo+ID4gIndoZXRoZXIgYXJjaCBYWFggc3VwcG9ydHMgUE1EL1BVRCBtYXBwaW5n
cyIgYW5kIHNvIG9uLiAgSG93ZXZlciBsZXQncwo+ID4gbGVhdmUgdGhhdCBmb3IgbGF0ZXIgYXMg
dGhhdCdzIHRoZSBlYXN5IHBhcnQuICBTbyBmYXIsIHdlIHVzZSB0aGVzZSBvcHRpb25zCj4gPiB0
byBzdGFibHkgZGV0ZWN0IHBlci1hcmNoIGh1Z2UgbWFwcGluZyBzdXBwb3J0Lgo+ID4gCj4gPiBT
aWduZWQtb2ZmLWJ5OiBQZXRlciBYdSA8cGV0ZXJ4QHJlZGhhdC5jb20+Cj4gPiAtLS0KPiA+ICAg
aW5jbHVkZS9saW51eC9odWdlX21tLmggfCAxMCArKysrKysrLS0tCj4gPiAgIG1tL0tjb25maWcg
ICAgICAgICAgICAgIHwgIDYgKysrKysrCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvaHVnZV9tbS5oIGIvaW5jbHVkZS9saW51eC9odWdlX21tLmgKPiA+IGluZGV4IDcxMTYzMmRm
N2VkZi4uMzc0ODJjODQ0NWQxIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9odWdlX21t
LmgKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvaHVnZV9tbS5oCj4gPiBAQCAtOTYsMTQgKzk2LDE4
IEBAIGV4dGVybiBzdHJ1Y3Qga29ial9hdHRyaWJ1dGUgdGhwc2l6ZV9zaG1lbV9lbmFibGVkX2F0
dHI7Cj4gPiAgICNkZWZpbmUgdGhwX3ZtYV9hbGxvd2FibGVfb3JkZXIodm1hLCB2bV9mbGFncywg
dHZhX2ZsYWdzLCBvcmRlcikgXAo+ID4gICAJKCEhdGhwX3ZtYV9hbGxvd2FibGVfb3JkZXJzKHZt
YSwgdm1fZmxhZ3MsIHR2YV9mbGFncywgQklUKG9yZGVyKSkpCj4gPiAgIAo+ID4gLSNpZmRlZiBD
T05GSUdfUEdUQUJMRV9IQVNfSFVHRV9MRUFWRVMKPiA+IC0jZGVmaW5lIEhQQUdFX1BNRF9TSElG
VCBQTURfU0hJRlQKPiA+ICsjaWZkZWYgQ09ORklHX1BHVEFCTEVfSEFTX1BVRF9MRUFWRVMKPiA+
ICAgI2RlZmluZSBIUEFHRV9QVURfU0hJRlQgUFVEX1NISUZUCj4gPiAgICNlbHNlCj4gPiAtI2Rl
ZmluZSBIUEFHRV9QTURfU0hJRlQgKHsgQlVJTERfQlVHKCk7IDA7IH0pCj4gPiAgICNkZWZpbmUg
SFBBR0VfUFVEX1NISUZUICh7IEJVSUxEX0JVRygpOyAwOyB9KQo+ID4gICAjZW5kaWYKPiA+ICAg
Cj4gPiArI2lmZGVmIENPTkZJR19QR1RBQkxFX0hBU19QTURfTEVBVkVTCj4gPiArI2RlZmluZSBI
UEFHRV9QTURfU0hJRlQgUE1EX1NISUZUCj4gPiArI2Vsc2UKPiA+ICsjZGVmaW5lIEhQQUdFX1BN
RF9TSElGVCAoeyBCVUlMRF9CVUcoKTsgMDsgfSkKPiA+ICsjZW5kaWYKPiA+ICsKPiA+ICAgI2Rl
ZmluZSBIUEFHRV9QTURfT1JERVIgKEhQQUdFX1BNRF9TSElGVC1QQUdFX1NISUZUKQo+ID4gICAj
ZGVmaW5lIEhQQUdFX1BNRF9OUiAoMTw8SFBBR0VfUE1EX09SREVSKQo+ID4gICAjZGVmaW5lIEhQ
QUdFX1BNRF9NQVNLCSh+KEhQQUdFX1BNRF9TSVpFIC0gMSkpCj4gPiBkaWZmIC0tZ2l0IGEvbW0v
S2NvbmZpZyBiL21tL0tjb25maWcKPiA+IGluZGV4IDYwNzk2NDAyODUwZS4uMmRiZGMwODhkZWU4
IDEwMDY0NAo+ID4gLS0tIGEvbW0vS2NvbmZpZwo+ID4gKysrIGIvbW0vS2NvbmZpZwo+ID4gQEAg
LTg2MCw2ICs4NjAsMTIgQEAgZW5kaWYgIyBUUkFOU1BBUkVOVF9IVUdFUEFHRQo+ID4gICBjb25m
aWcgUEdUQUJMRV9IQVNfSFVHRV9MRUFWRVMKPiA+ICAgCWRlZl9ib29sIFRSQU5TUEFSRU5UX0hV
R0VQQUdFIHx8IEhVR0VUTEJfUEFHRQo+ID4gICAKPiA+ICtjb25maWcgUEdUQUJMRV9IQVNfUE1E
X0xFQVZFUwo+ID4gKwlkZWZfYm9vbCBIQVZFX0FSQ0hfVFJBTlNQQVJFTlRfSFVHRVBBR0UgJiYg
UEdUQUJMRV9IQVNfSFVHRV9MRUFWRVMKPiA+ICsKPiA+ICtjb25maWcgUEdUQUJMRV9IQVNfUFVE
X0xFQVZFUwo+ID4gKwlkZWZfYm9vbCBIQVZFX0FSQ0hfVFJBTlNQQVJFTlRfSFVHRVBBR0VfUFVE
ICYmIFBHVEFCTEVfSEFTX0hVR0VfTEVBVkVTCj4gPiArCj4gCj4gV2hhdCBpZiBhbiBhcmNoaXRl
Y3R1cmUgaGFzIGh1Z2VwYWdlcyBhdCBQTUQgYW5kL29yIFBVRCBsZXZlbCBhbmQgCj4gZG9lc24n
dCBzdXBwb3J0IFRIUCA/CgpXaGF0J3MgdGhlIGFyY2ggdG8gYmUgZGlzY3Vzc2VkIGhlcmU/CgpU
aGUgd2hvbGUgcHVycG9zZSBvZiB0aGlzIHNlcmllcyBzbyBmYXIgaXMgdHJ5aW5nIHRvIG1ha2Ug
c29tZSBwbWQvcHVkCmhlbHBlcnMgdGhhdCBvbmx5IGRlZmluZWQgd2l0aCBDT05GSUdfVEhQPW9u
IHRvIGJlIGF2YWlsYWJsZSBldmVuIGlmIG5vdC4KSXQgbWVhbnMgdGhpcyBzZXJpZXMgYWxvbmUg
KG9yIGFueSBmdXR1cmUgcGxhbikgc2hvdWxkbid0IGFmZmVjdCBhbnkgYXJjaAp0aGF0IGhhcyBD
T05GSUdfVEhQPW9mZiBhbHdheXMuCgpCdXQgbG9naWNhbGx5IEkgdGhpbmsgd2Ugc2hvdWxkIG5l
ZWQgc29tZSBjb25maWcgb3B0aW9uIGp1c3QgdG8gc2F5ICJ0aGlzCmFyY2ggc3VwcG9ydHMgcG1k
IG1hcHBpbmdzIiBpbmRlZWQsIGV2ZW4gaWYgQ09ORklHX1RIUD1vZmYuICBXaGVuIHRoYXQncwp0
aGVyZSwgd2Ugc2hvdWxkIHBlcmhhcHMgYWRkIHRoYXQgb3B0aW9uIGludG8gdGhpcyBlcXVhdGlv
biBzbwpQR1RBQkxFX0hBU18qX0xFQVZFUyB3aWxsIGFsc28gYmUgc2VsZWN0ZWQgaW4gdGhhdCBj
YXNlLgoKLS0gClBldGVyIFh1CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
