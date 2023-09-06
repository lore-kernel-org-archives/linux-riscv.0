Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554F7EE14C3
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 21:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ybBVVONng4J4F1oDMw4GnFmi/K5ZIH8HOg9XYKzsSRk=; b=tWFwLMWIRAfuhK
	Tr2KsX6tMdd1E23g7a9mlDGIIl5jT9kYe7yxzqLqwk8urq23RjZMTjtmT0N9fieK4VlNll8+yuKos
	LAoXEUEYTiQOWTft9TBQPU3DkDymBN0aiIvMXhAvp6vGPn+pbsGvB/TUEShIwIzT8YjYX0FkuzsFn
	ofLN5TMna7EtnwIAuraqRFk2Kl2ePUOwrWVCDfOs100bXovQUiI3YGOYcfZu+ikPQZCGDYel/Tgr0
	HiU/wWtizkOIjBHjIGdoEmdiLibOYXj4C3TsW/E/Nc0Y68bzYXtdDeQe4mft76UYaIY4axzl/J8vx
	0zgCgfmhvwsriV9jA+9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdzsH-00Au2z-1i;
	Wed, 06 Sep 2023 21:15:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdzsE-00Au2N-1m
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 21:15:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694034940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gGIDxeEIjrmniLnAwcRaZhEhoprTMiMG+eryvzhOGZk=;
	b=hkVGMfLWtItKa2sscwWgnqOV/dCXGrRjKMTNyg09TkkoqWjTmA8q1HQJCnHAaLd6wDEfB3
	QASKGHAbp9aczL/bJJGyOFT1i4T9t/ivHKDrAnJ2TTjA7CtfsWpsUGZvfIuzaX+pvlk3km
	58ROgZa/UgkVk4C6UkRgNuyOQIfPmAo=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-ZzgBxY5EN16uy7yHTSGQCg-1; Wed, 06 Sep 2023 17:15:39 -0400
X-MC-Unique: ZzgBxY5EN16uy7yHTSGQCg-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-412136f4706so3524391cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Sep 2023 14:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694034939; x=1694639739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGIDxeEIjrmniLnAwcRaZhEhoprTMiMG+eryvzhOGZk=;
        b=D6kJR5o/yFEQ2U/J4XngF5+jpVm7o4CXuuBe9KfVj52cJIfBiwlsP6Lf/RoCYoJo9/
         6gFtYuX82Gzn7Vph7d96AqajOKYBKb8a764/t3KZKeFG1D5i1tcdyDF0oo+2A/Wo7BB6
         fGlC1L2YbsfqSsRHukWhxAXzk8mHVnZCqg8kg10GQaVpHyCdlYfaYFwB6rYZRyfZr/0G
         6FR+4ZtZL4pY5RfZZLIYEEJlfcRrKyk26L4Ws4FXp+cucguzaoiUtLPr1nnm3oK3u3mY
         PG53eBhL1zTIn7VzzBVCaAIvBPzYrFqbf5Wx6b4LFbcRb9BAqh0qQXHyjNHiglq1qhH3
         iZCA==
X-Gm-Message-State: AOJu0YzUAXsLsvp36Bsm/ommI1ewB3TMmcO3IV8xCkM51H1r5LVZ8JeQ
	sZuzfzvmO0PTd1ECeJkm8gixfI6/PLmqZ+KJnqactkp55Rph8Q+iDf+qd+iwsDtxB/Zgz/euryy
	W3fHgs/HniGZFf370MZfYGlA0UganQRQFd///Dz8y71pa
X-Received: by 2002:ac8:5788:0:b0:404:a649:879c with SMTP id v8-20020ac85788000000b00404a649879cmr23505200qta.49.1694034939051;
        Wed, 06 Sep 2023 14:15:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGTlsLimhiG7g4l7TR8BKuZzowkBAwxrjki6I+0aIHLfI7xehZRFgZM0GOD3X1kn8Abbi99S9xon3gEc25KOE=
X-Received: by 2002:ac8:5788:0:b0:404:a649:879c with SMTP id
 v8-20020ac85788000000b00404a649879cmr23505184qta.49.1694034938822; Wed, 06
 Sep 2023 14:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-92f37526-d36c-48c0-8fbd-7676df1b6086@palmer-ri-x1c9> <2a4f1f47e945772b9fbb53a51e148636e0ae6e48.camel@redhat.com>
In-Reply-To: <2a4f1f47e945772b9fbb53a51e148636e0ae6e48.camel@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 6 Sep 2023 18:15:27 -0300
Message-ID: <CAJ6HWG6Wi7Th=bcfxdnpg_Mu1UyV1wTuJV67b=3J2FjLykCBRA@mail.gmail.com>
Subject: Re: [RFC PATCH v5 5/5] riscv/cmpxchg: Implement xchg for variables of
 size 1 and 2
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>, peterz@infradead.org, 
	boqun.feng@gmail.com, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, parri.andrea@gmail.com, 
	andrzej.hajda@intel.com, guoren@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_141542_670006_EF7059B8 
X-CRM114-Status: GOOD (  41.95  )
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

T24gV2VkLCBBdWcgMzAsIDIwMjMgYXQgNjo1OeKAr1BNIExlb25hcmRvIEJyw6FzIDxsZW9icmFz
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCAyMDIzLTA4LTEwIGF0IDA5OjIzIC0wNzAw
LCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiA+IE9uIFRodSwgMTAgQXVnIDIwMjMgMDk6MDQ6MDQg
UERUICgtMDcwMCksIGxlb2JyYXNAcmVkaGF0LmNvbSB3cm90ZToKPiA+ID4gT24gVGh1LCAyMDIz
LTA4LTEwIGF0IDA4OjUxICswMjAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4gPiA+IE9uIFRo
dSwgQXVnIDEwLCAyMDIzLCBhdCAwNjowMywgTGVvbmFyZG8gQnJhcyB3cm90ZToKPiA+ID4gPiA+
IHhjaGcgZm9yIHZhcmlhYmxlcyBvZiBzaXplIDEtYnl0ZSBhbmQgMi1ieXRlcyBpcyBub3QgeWV0
IGF2YWlsYWJsZSBmb3IKPiA+ID4gPiA+IHJpc2N2LCBldmVuIHRob3VnaCBpdHMgcHJlc2VudCBp
biBvdGhlciBhcmNoaXRlY3R1cmVzIHN1Y2ggYXMgYXJtNjQgYW5kCj4gPiA+ID4gPiB4ODYuIFRo
aXMgY291bGQgbGVhZCB0byBub3QgYmVpbmcgYWJsZSB0byBpbXBsZW1lbnQgc29tZSBsb2NraW5n
IG1lY2hhbmlzbXMKPiA+ID4gPiA+IG9yIHJlcXVpcmluZyBzb21lIHJld29yayB0byBtYWtlIGl0
IHdvcmsgcHJvcGVybHkuCj4gPiA+ID4gPgo+ID4gPiA+ID4gSW1wbGVtZW50IDEtYnl0ZSBhbmQg
Mi1ieXRlcyB4Y2hnIGluIG9yZGVyIHRvIGFjaGlldmUgcGFyaXR5IHdpdGggb3RoZXIKPiA+ID4g
PiA+IGFyY2hpdGVjdHVyZXMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTGVv
bmFyZG8gQnJhcyA8bGVvYnJhc0ByZWRoYXQuY29tPgo+ID4gPiA+Cj4gPiA+Cj4gPiA+IEhlbGxv
IEFybmQgQmVyZ21hbm4sIHRoYW5rcyBmb3IgcmV2aWV3aW5nIQo+ID4gPgo+ID4gPiA+IFBhcml0
eSB3aXRoIG90aGVyIGFyY2hpdGVjdHVyZXMgYnkgaXRzZWxmIGlzIG5vdCBhIHJlYXNvbiB0byBk
byB0aGlzLAo+ID4gPiA+IGluIHBhcnRpY3VsYXIgdGhlIG90aGVyIGFyY2hpdGVjdHVyZXMgeW91
IGxpc3RlZCBoYXZlIHRoZSBpbnN0cnVjdGlvbnMKPiA+ID4gPiBpbiBoYXJkd2FyZSB3aGlsZSBy
aXNjdiBkb2VzIG5vdC4KPiA+ID4KPiA+ID4gU3VyZSwgSSB1bmRlcnN0YW5kIFJJU0MtViBkb24n
dCBoYXZlIG5hdGl2ZSBzdXBwb3J0IGZvciB4Y2hnIG9uIHZhcmlhYmxlcyBvZgo+ID4gPiBzaXpl
IDwgNEIuIE15IGFyZ3VtZW50IGlzIHRoYXQgaXQncyBuaWNlIHRvIGhhdmUgZXZlbiBhbiBlbXVs
YXRlZCB2ZXJzaW9uIGZvcgo+ID4gPiB0aGlzIGluIGNhc2UgYW55IGZ1dHVyZSBtZWNoYW5pc20g
d2FudHMgdG8gdXNlIGl0Lgo+ID4gPgo+ID4gPiBOb3QgaGF2aW5nIGl0IG1heSBtZWFuIHdlIHdv
bid0IGJlIGFibGUgdG8gZW5hYmxlIGdpdmVuIG1lY2hhbmlzbSBpbiBSSVNDLVYuCj4gPgo+ID4g
SUlVQyB0aGUgYXNrIGlzIHRvIGhhdmUgYSB1c2VyIHdpdGhpbiB0aGUga2VybmVsIGZvciB0aGVz
ZSBmdW5jdGlvbnMuCj4gPiBUaGF0J3MgdGhlIGdlbmVyYWwgdGhpbmcgdG8gZG8sIGFuZCBsYXN0
IHRpbWUgdGhpcyBjYW1lIHVwIHRoZXJlIHdhcyBubwo+ID4gaW4ta2VybmVsIHVzZSBvZiBpdCAt
LSB0aGUgcXNwaW5sb2NrIHN0dWZmIHdvdWxkLCBidXQgd2UgaGF2ZW4ndCBlbmFibGVkCj4gPiBp
dCB5ZXQgYmVjYXVzZSB3ZSdyZSB3b3JyaWVkIGFib3V0IHRoZSBwZXJmb3JtYW5jZS9mYWlybmVz
cyBzdHVmZiB0aGF0Cj4gPiBvdGhlciBwb3J0cyBoYXZlIHNlZW4gYW5kIG5vYm9keSdzIGdvdCBj
b25jcmV0ZSBiZW5jaG1hcmtzIHlldCAodGhvdWdoCj4gPiB0aGVyZSdzIGFub3RoZXIgcGF0Y2gg
c2V0IG91dCB0aGF0IEkgaGF2ZW4ndCBoYWQgdGltZSB0byBsb29rIHRocm91Z2gsCj4gPiBzbyB0
aGF0IG1heSBoYXZlIGNoYW5nZWQpLgo+ID4KPiA+IFNvIGlmIHNvbWV0aGluZyB1c2VzIHRoZXNl
IEknbSBoYXBweSB0byBnbyBsb29rIGNsb3Nlci4KPgo+IElJVUMgcGF0Y2hlcyA0ICYgNSB3aWxs
IGJlIHVzZWQgYnkgcXNwaW5sb2NrLCB3aGljaCBtYXkgbm90IGJlIGRvbmUgeWV0LCBzbyB3ZQo+
IGRvbid0IGhhdmUgYW4gdXNlIGZvciB0aGVtIGZvciB0aGUgdGltZSBiZWluZy4KPgo+IE90aGVy
d2lzZSwgYW55IGNvbW1lbnRzIG9uIHBhdGNoZXMgMSwgMiAmIDM/CgpIZWxsbyBQYWxtZXIsCkFu
eSBjaGFuY2Ugb2YgcGF0Y2hlcyAxLCAyICYgMyBiZWluZyBtZXJnZWQgaW4gdGhpcyBtZXJnZSB3
aW5kb3c/CgpUaGFua3MhCgoKPgo+ID4KPiA+ID4gPiBFbXVsYXRpbmcgdGhlIHNtYWxsIHhjaGco
KSB0aHJvdWdoIGNtcHhjaGcoKSBpcyBwYXJ0aWN1bGFybHkgdHJpY2t5Cj4gPiA+ID4gc2luY2Ug
aXQncyBlYXN5IHRvIHJ1biBpbnRvIGEgY2FzZSB3aGVyZSB0aGlzIGRvZXMgbm90IGd1YXJhbnRl
ZQo+ID4gPiA+IGZvcndhcmQgcHJvZ3Jlc3MuCj4gPiA+ID4KPiA+ID4KPiA+ID4gRGlkbid0IGdl
dCB0aGlzIHBhcnQ6Cj4gPiA+IEJ5ICJlbXVsYXRpbmcgc21hbGwgeGNoZygpIHRocm91Z2ggY21w
eGNoZygpIiwgZGlkIHlvdSBtZWFuIGxpa2UgZW11bGF0aW5nIGFuCj4gPiA+IHhjaGcgKHVzdWFs
bHkgMSBpbnN0cnVjdGlvbikgd2l0aCBsciAmIHNjIChzYW1lIHVzZWQgaW4gY21weGNoZykgPwo+
ID4gPgo+ID4gPiBJZiBzbywgeWVhaCwgaXQncyBhIGZhaXIgcG9pbnQ6IGluIHNvbWUgZXh0cmVt
ZSBjYXNlIHdlIGNvdWxkIGhhdmUgbXVsdGlwbGUKPiA+ID4gdGhyZWFkcyBhY2Nlc3NpbmcgZ2l2
ZW4gY2FjaGVsaW5lIGFuZCBoYXZlIHNjIGFsd2F5cyBmYWlsaW5nLiBPbiB0aGUgb3RoZXIgaGFu
ZCwKPiA+ID4gdGhlcmUgYXJlIDIgYXJndW1lbnRzIG9uIHRoYXQ6Cj4gPiA+Cj4gPiA+IDEgLSBP
dGhlciBhcmNoaXRlY3R1cmVzLCAoc3VjaCBhcyBwb3dlcnBjLCBhcm0gYW5kIGFybTY0IHdpdGhv
dXQgTFNFIGF0b21pY3MpCj4gPiA+IGFsc28gc2VlbSB0byByZWx5IGluIHRoaXMgbWVjaGFuaXNt
IGZvciBldmVyeSB4Y2hnIHNpemUuIEFub3RoZXIgYXJjaHMgbGlrZSBjc2t5Cj4gPiA+IGFuZCBs
b29uZ2FyY2ggdXNlIGFzbSB0aGF0IGxvb2sgbGlrZSBtaW5lIHRvIGhhbmRsZSBzaXplIDwgNEIg
eGNoZy4KPiA+ID4KPiA+ID4KPiA+ID4gPiAgVGhpcyBpcyBhbHNvIHNvbWV0aGluZyB0aGF0IGFs
bW9zdCBubyBhcmNoaXRlY3R1cmUKPiA+ID4gPiBzcGVjaWZpYyBjb2RlIHJlbGllcyBvbiAoZ2Vu
ZXJpYyBxc3BpbmxvY2sgYmVpbmcgYSBub3RhYmxlIGV4Y2VwdGlvbikuCj4gPiA+ID4KPiA+ID4K
PiA+ID4gMiAtIEFzIHlvdSBtZW50aW9uZWQsIHRoZXJlIHNob3VsZCBiZSB2ZXJ5IGxpdHRsZSBj
b2RlIHRoYXQgd2lsbCBhY3R1YWxseSBtYWtlCj4gPiA+IHVzZSBvZiB4Y2hnIGZvciB2YXJzIDwg
NEIsIHNvIGl0IHNob3VsZCBiZSBzYWZlIHRvIGFzc3VtZSBpdHMgZmluZSB0byBub3QKPiA+ID4g
Z3VhcmFudGVlIGZvcndhcmQgcHJvZ3Jlc3MgZm9yIHRob3NlIHJhcmUgdXNhZ2VzIChsaWtlIHNv
bWUgb2YgYWJvdmUgbWVudGlvbmVkCj4gPiA+IGFyY2hzKS4KPiA+ID4KPiA+ID4gPiBJIHdvdWxk
IHJlY29tbWVuZCBqdXN0IGRyb3BwaW5nIHRoaXMgcGF0Y2ggZnJvbSB0aGUgc2VyaWVzLCBhdCBs
ZWFzdAo+ID4gPiA+IHVudGlsIHRoZXJlIGlzIGEgbmVlZCBmb3IgaXQuCj4gPiA+Cj4gPiA+IFdo
aWxlIEkgYWdyZWUgdGhpcyBpcyBhIHZhbGlkIHBvaW50LCBJIGJlbGlldmUgaXRzIG1vcmUgaW50
ZXJlc3RpbmcgdG8gaGF2ZSBpdAo+ID4gPiBpbXBsZW1lbnRlZCBpZiBhbnkgZnV0dXJlIG1lY2hh
bmlzbSB3YW50cyB0byBtYWtlIHVzZSBvZiB0aGlzLgo+ID4gPgo+ID4gPgo+ID4gPiBUaGFua3Mh
Cj4gPiA+IExlbwo+ID4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
