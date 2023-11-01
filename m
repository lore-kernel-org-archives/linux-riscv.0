Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDA4C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 13:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SFg8hGI9Hivgs1wdrsLVShPMLOqCoqzATmqvAc9Mr+Y=; b=G22W/jIAavbunx
	whmEV4mtdQODq1Mc0QDv6zQYyHCnrjPQGBv8xhyrCqU6KYQ8o61QJnRh1XrYiltDO1S6Hn1Vinitn
	RAn2dm9h7yakexWE2WImfqQ93pOWM58xgNEZW6q0JMiqixNF7H6J2PrPboPlHEd1yuky1ZOp8+CpU
	1d08NcQ6nvEgxdS07SCuo5pPFd+iO2BwWqxlOi2jVEfKemSWWGiAA/ZulnESs5WKP94+v5KNkXCt0
	bShcZRJNlfOpk8PySNGiIuyk4fNBRikxzWvWAhYexchLpZ665RUps/YNh6V32Uf8tPbw78bfxH41v
	AgB/swu4g3SC7NBWOycw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyBbd-007bP8-2C;
	Wed, 01 Nov 2023 13:50:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyBbZ-007bNF-0p
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 13:50:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698846595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8nWuZfMltD4ivs2KoMTFabKsH4/GDdWsbpvxlt/w2Uk=;
	b=jL3WY9buMvcmSLWYW8VSR+Yzmz3v/6tr0hdtjTAehz4PwjdPhpur56l4p6kZedMQZd2G92
	KoeFoTkAwZARXMScnVviyF+D5ZDVBGmkze5if+aufAK0wO8L5Eq3ynYm01uLBKg+heOri9
	ig/m+JUsrNkva4s0E6KzPF5cUxB64uk=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-72cjMW0tMrSpDL48yK1WOw-1; Wed, 01 Nov 2023 09:49:54 -0400
X-MC-Unique: 72cjMW0tMrSpDL48yK1WOw-1
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-457ed9f83bfso2356930137.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 06:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698846593; x=1699451393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nWuZfMltD4ivs2KoMTFabKsH4/GDdWsbpvxlt/w2Uk=;
        b=ZMtnme9z7p3KixIJyue7SZ0Ru5c+0pG9KIvaNfv5VEmUZGWzNd3fDujC6P+YJ9YmpO
         8mXFpQoDTchd97j0m3a6AjydGEFRmFKJtH2kOjEMBBP7EkJpuru/Sc4xbMfG5xTymMm7
         Z3rvHszcf1ZTpyI+KWvzoAnBh5jVzd4rebyka//QAYt6L8paRKW2c2EWXpW1qbmw94sr
         ZPnY62ePdCvrhPq0NrGSn/TCZZMq0BDtkEd/vYGgSm1flh3q1iScROS8gL6goVYXot92
         iuknWYEl1v3keVtPpBq9inbfW3Rl+Znnk6XbC5N7WHIY2vDbhq2s3HofP90gmkd5vJL9
         qgAw==
X-Gm-Message-State: AOJu0YzyB8licmyWBXKl2B7yHp8C0tZjI8TjJpYDSuLJ2dRbAHjMyvcS
	0lKZJRsH3VkFaWfCBxeVJrTnySZQNxbILUqzLwA16mnHVYr5UbCFdrO7ck6nK0989wflgfbw5HM
	/mkJjBS3toJ10D3BQ3YEdfw8VZ0yw0NK3m8BSzUo3krfp
X-Received: by 2002:a67:a20b:0:b0:45b:529:cffb with SMTP id l11-20020a67a20b000000b0045b0529cffbmr13944637vse.27.1698846593177;
        Wed, 01 Nov 2023 06:49:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwXCml3dQ0y1Cr/jFjux1lHGIWg//wB9GtnyXEiXbtExQlCwIylI67p1IY3V8uopiP51EusJ56Du+cgZSOAjo=
X-Received: by 2002:a67:a20b:0:b0:45b:529:cffb with SMTP id
 l11-20020a67a20b000000b0045b0529cffbmr13944598vse.27.1698846592873; Wed, 01
 Nov 2023 06:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-18-seanjc@google.com>
 <7c0844d8-6f97-4904-a140-abeabeb552c1@intel.com> <ZUEML6oJXDCFJ9fg@google.com>
 <92ba7ddd-2bc8-4a8d-bd67-d6614b21914f@intel.com> <ZUJVfCkIYYFp5VwG@google.com>
In-Reply-To: <ZUJVfCkIYYFp5VwG@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 1 Nov 2023 14:49:40 +0100
Message-ID: <CABgObfaw4Byuzj5J3k48jdwT0HCKXLJNiuaA9H8Dtg+GOq==Sw@mail.gmail.com>
Subject: Re: [PATCH v13 17/35] KVM: Add transparent hugepage support for
 dedicated guest memory
To: Sean Christopherson <seanjc@google.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Xu Yilun <yilun.xu@intel.com>, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_064957_377729_42C0A3FF 
X-CRM114-Status: GOOD (  36.42  )
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

T24gV2VkLCBOb3YgMSwgMjAyMyBhdCAyOjQx4oCvUE0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vh
bmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBOb3YgMDEsIDIwMjMsIFhpYW95YW8g
TGkgd3JvdGU6Cj4gPiBPbiAxMC8zMS8yMDIzIDEwOjE2IFBNLCBTZWFuIENocmlzdG9waGVyc29u
IHdyb3RlOgo+ID4gPiBPbiBUdWUsIE9jdCAzMSwgMjAyMywgWGlhb3lhbyBMaSB3cm90ZToKPiA+
ID4gPiBPbiAxMC8yOC8yMDIzIDI6MjEgQU0sIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6Cj4g
PiA+ID4gPiBFeHRlbmRlZCBndWVzdF9tZW1mZCB0byBhbGxvdyBiYWNraW5nIGd1ZXN0IG1lbW9y
eSB3aXRoIHRyYW5zcGFyZW50Cj4gPiA+ID4gPiBodWdlcGFnZXMuIFJlcXVpcmUgdXNlcnNwYWNl
IHRvIG9wdC1pbiB2aWEgYSBmbGFnIGV2ZW4gdGhvdWdoIHRoZXJlJ3Mgbm8KPiA+ID4gPiA+IGtu
b3duL2FudGljaXBhdGVkIHVzZSBjYXNlIGZvciBmb3JjaW5nIHNtYWxsIHBhZ2VzIGFzIFRIUCBp
cyBvcHRpb25hbCwKPiA+ID4gPiA+IGkuZS4gdG8gYXZvaWQgZW5kaW5nIHVwIGluIGEgc2l0dWF0
aW9uIHdoZXJlIHVzZXJzcGFjZSBpcyB1bmF3YXJlIHRoYXQKPiA+ID4gPiA+IEtWTSBjYW4ndCBw
cm92aWRlIGh1Z2VwYWdlcy4KPiA+ID4gPgo+ID4gPiA+IFBlcnNvbmFsbHksIGl0IHNlZW1zIG5v
dCBzbyAidHJhbnNwYXJlbnQiIGlmIHJlcXVpcmluZyB1c2Vyc3BhY2UgdG8gb3B0LWluLgo+ID4g
PiA+Cj4gPiA+ID4gUGVvcGxlIG5lZWQgdG8gMSkgY2hlY2sgaWYgdGhlIGtlcm5lbCBidWlsdCB3
aXRoIFRSQU5TUEFSRU5UX0hVR0VQQUdFCj4gPiA+ID4gc3VwcG9ydCwgb3IgY2hlY2sgaXMgdGhl
IHN5c2ZzIG9mIHRyYW5zcGFyZW50IGh1Z2VwYWdlIGV4aXN0czsgMilnZXQgdGhlCj4gPiA+ID4g
bWF4aW11bSBzdXBwb3J0IGh1Z2VwYWdlIHNpemUgMykgZW5zdXJlIHRoZSBzaXplIHNhdGlzZmll
cyB0aGUgYWxpZ25tZW50Owo+ID4gPiA+IGJlZm9yZSBvcHQtaW4gaXQuCj4gPiA+ID4KPiA+ID4g
PiBFdmVuIHNpbXBsZXIsIHVzZXJzcGFjZSBjYW4gYmxpbmRseSB0cnkgdG8gY3JlYXRlIGd1ZXN0
IG1lbWZkIHdpdGgKPiA+ID4gPiB0cmFuc3BhcmVudCBodWdhcGFnZSBmbGFnLiBJZiBnZXR0aW5n
IGVycm9yLCBmYWxsYmFjayB0byBjcmVhdGUgd2l0aG91dCB0aGUKPiA+ID4gPiB0cmFuc3BhcmVu
dCBodWdlcGFnZSBmbGFnLgo+ID4gPiA+Cj4gPiA+ID4gSG93ZXZlciwgaXQgZG9lc24ndCBsb29r
IHRyYW5zcGFyZW50IHRvIG1lLgo+ID4gPgo+ID4gPiBUaGUgInRyYW5zcGFyZW50IiBwYXJ0IGlz
IHJlZmVycmluZyB0byB0aGUgdW5kZXJseWluZyBrZXJuZWwgbWVjaGFuaXNtLCBpdCdzIG5vdAo+
ID4gPiBzYXlpbmcgYW55dGhpbmcgYWJvdXQgdGhlIEFQSS4gIFRoZSAidHJhbnNwYXJlbnQiIHBh
cnQgb2YgVEhQIGlzIHRoYXQgdGhlIGtlcm5lbAo+ID4gPiBkb2Vzbid0IGd1YXJhbnRlZSBodWdl
cGFnZXMsIGkuZS4gd2hldGhlciBvciBub3QgaHVnZXBhZ2VzIGFyZSBhY3R1YWxseSB1c2VkIGlz
Cj4gPiA+IChtb3N0bHkpIHRyYW5zcGFyZW50IHRvIHVzZXJzcGFjZS4KPiA+ID4KPiA+ID4gUGFv
bG8gYWxzbyBpc24ndCB0aGUgYmlnZ2VzdCBmYW5bKl0sIGJ1dCB0aGVyZSBhcmUgYWxzbyBkb3du
c2lkZXMgdG8gYWx3YXlzCj4gPiA+IGFsbG93aW5nIGh1Z2VwYWdlcywgZS5nLiBzaWxlbnQgZmFp
bHVyZSBkdWUgdG8gbGFjayBvZiBUSFAgb3IgdW5hbGlnbmVkIHNpemUsCj4gPiA+IGFuZCB0aGVy
ZSdzIHByZWNlZGVudCBpbiB0aGUgZm9ybSBvZiBNQURWX0hVR0VQQUdFLgo+ID4gPgo+ID4gPiBb
Kl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzg0YTkwOGFlLTA0YzctNTFjNy1jOWE4LTEx
OWUxOTMzYTE4OUByZWRoYXQuY29tCj4gPgo+ID4gQnV0IGl0J3MgZGlmZmVyZW50IHRoYW4gTUFE
Vl9IVUdFUEFHRSwgaW4gYSB3YXkuIFBlciBteSB1bmRlcnN0YW5kaW5nLCB0aGUKPiA+IGZhaWx1
cmUgb2YgTUFEVl9IVUdFUEFHRSBpcyBub3QgZmF0YWwsIHVzZXIgc3BhY2UgY2FuIGlnbm9yZSBp
dCBhbmQKPiA+IGNvbnRpbnVlLgo+ID4KPiA+IEhvd2V2ZXIsIHRoZSBmYWlsdXJlIG9mIEtWTV9H
VUVTVF9NRU1GRF9BTExPV19IVUdFUEFHRSBpcyBmYXRhbCwgd2hpY2ggbGVhZHMKPiA+IHRvIGZh
aWx1cmUgb2YgZ3Vlc3QgbWVtZmQgY3JlYXRpb24uCj4KPiBGYWlsaW5nIEtWTV9DUkVBVEVfR1VF
U1RfTUVNRkQgaXNuJ3QgdHJ1bHkgZmF0YWwsIGl0IGp1c3QgcmVxdWlyZXMgZGlmZmVyZW50Cj4g
YWN0aW9uIGZyb20gdXNlcnNwYWNlLCBpLmUuIGluc3RlYWQgb2YgaWdub3JpbmcgdGhlIGVycm9y
LCB1c2Vyc3BhY2UgY291bGQgcmVkbwo+IEtWTV9DUkVBVEVfR1VFU1RfTUVNRkQgd2l0aCBLVk1f
R1VFU1RfTUVNRkRfQUxMT1dfSFVHRVBBR0U9MC4KPgo+IFdlIGNvdWxkIG1ha2UgdGhlIGJlaGF2
aW9yIG1vcmUgbGlrZSBNQURWX0hVR0VQQUdFLCBlLmcuIHRoZW9yZXRpY2FsbHkgd2UgY291bGQK
PiBleHRlbmQgZmFkdmlzZSgpIHdpdGggRkFEVl9IVUdFUEFHRSwgb3IgYWRkIGEgZ3Vlc3RfbWVt
ZmQga25vYi9pb2N0bCgpIHRvIGxldAo+IHVzZXJzcGFjZSBwcm92aWRlIGFkdmljZS9oaW50cyBh
ZnRlciBjcmVhdGluZyBhIGd1ZXN0X21lbWZkLiAgQnV0IEkgc3VzcGVjdCB0aGF0Cj4gZ3Vlc3Rf
bWVtZmQgd291bGQgYmUgdGhlIG9ubHkgdXNlciBvZiBGQURWX0hVR0VQQUdFLCBhbmQgSU1PIGEg
cG9zdC1jcmVhdGlvbiBoaW50Cj4gaXMgYWN0dWFsbHkgbGVzcyBkZXNpcmFibGUuCj4KPiBLVk1f
R1VFU1RfTUVNRkRfQUxMT1dfSFVHRVBBR0Ugd2lsbCBmYWlsIG9ubHkgaWYgdXNlcnNwYWNlIGRp
ZG4ndCBwcm92aWRlIGEKPiBjb21wYXRpYmxlIHNpemUgb3IgdGhlIGtlcm5lbCBkb2Vzbid0IHN1
cHBvcnQgVEhQLiAgQW4gaW5jb21wYXRpYmxlIHNpemUgaXMgbGlrZWx5Cj4gYSB1c2Vyc3BhY2Ug
YnVnLCBhbmQgZm9yIG1vc3Qgc2V0dXBzIHRoYXQgd2FudCB0byB1dGlsaXplIGd1ZXN0X21lbWZk
LCBsYWNrIG9mIFRIUAo+IHN1cHBvcnQgaXMgbGlrZWx5IGEgY29uZmlndXJhdGlvbiBidWcuICBJ
LmUuIG1hbnkvbW9zdCB1c2VzICp3YW50KiBmYWlsdXJlcyBkdWUgdG8KPiBLVk1fR1VFU1RfTUVN
RkRfQUxMT1dfSFVHRVBBR0UgdG8gYmUgZmF0YWwuCj4KPiA+IEZvciBjdXJyZW50IGltcGxlbWVu
dGF0aW9uLCBJIHRoaW5rIG1heWJlIEtWTV9HVUVTVF9NRU1GRF9ERVNJUkVfSFVHRVBBR0UKPiA+
IGZpdHMgYmV0dGVyIHRoYW4gS1ZNX0dVRVNUX01FTUZEX0FMTE9XX0hVR0VQQUdFPyBvciBtYXli
ZSAqUFJFRkVSKj8KPgo+IFdoeT8gIFZlcmJzIGxpa2UgInByZWZlciIgYW5kICJkZXNpcmUiIGFy
ZW4ndCBhIGdvb2QgZml0IElNTyBiZWNhdXNlIHRoZXkgc3VnZ2VzdAo+IHRoZSBmbGFnIGlzIGEg
aGludCwgYW5kIGhpbnRzIGFyZSB1c3VhbGx5IGJlc3QgZWZmb3J0IG9ubHksIGkuZS4gYXJlIGln
bm9yZWQgaWYKPiB0aGVyZSBpcyBhIGZ1bmRhbWVudGFsIGluY29tcGF0aWJpbGl0eS4KPgo+ICJB
bGxvdyIgaXNuJ3QgcGVyZmVjdCwgZS5nLiBJIHdvdWxkIG11Y2ggcHJlZmVyIGEgc3RyYWlnaHQg
S1ZNX0dVRVNUX01FTUZEX1VTRV9IVUdFUEFHRVMKPiBvciBLVk1fR1VFU1RfTUVNRkRfSFVHRVBB
R0VTIGZsYWcsIGJ1dCBJIHdhbnRlZCB0aGUgbmFtZSB0byBjb252ZXkgdGhhdCBLVk0gZG9lc24n
dAo+ICh5ZXQpIGd1YXJhbnRlZSBodWdlcGFnZXMuICBJLmUuIEtWTV9HVUVTVF9NRU1GRF9BTExP
V19IVUdFUEFHRSBpcyBzdHJvbmdlciB0aGFuCj4gYSBoaW50LCBidXQgd2Vha2VyIHRoYW4gYSBy
ZXF1aXJlbWVudC4gIEFuZCBpZi93aGVuIEtWTSBzdXBwb3J0cyBhIGRlZGljYXRlZCBtZW1vcnkK
PiBwb29sIG9mIHNvbWUga2luZCwgdGhlbiB3ZSBjYW4gYWRkIEtWTV9HVUVTVF9NRU1GRF9SRVFV
SVJFX0hVR0VQQUdFLgoKSSB0aGluayB0aGF0IHRoZSBjdXJyZW50IHBhdGNoIGlzIGZpbmUsIGJ1
dCBJIHdpbGwgYWRqdXN0IGl0IHRvIGFsd2F5cwphbGxvdyB0aGUgZmxhZywKYW5kIHRvIG1ha2Ug
dGhlIHNpemUgY2hlY2sgZXZlbiBpZiAhQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFLgpJZiBo
dWdlcGFnZXMgYXJlIG5vdCBndWFyYW50ZWVkLCBhbmQgKHRoZW9yZXRpY2FsbHkpIHlvdSBjb3Vs
ZCBoYXZlIG5vCmh1Z2VwYWdlIGF0IGFsbCBpbiB0aGUgcmVzdWx0LCBpdCdzIG9rYXkgdG8gZ2V0
IHRoaXMgcmVzdWx0IGV2ZW4gaWYgVEhQIGlzIG5vdAphdmFpbGFibGUgaW4gdGhlIGtlcm5lbC4K
ClBhb2xvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
