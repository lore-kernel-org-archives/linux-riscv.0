Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C9CC0015E
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 15:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4GneZi/53Ml+2FfHd/DBsj8KQRQPy7UiQwwWC/CU5eI=; b=EFPizhRsejhWho
	zgIf5lBBQo3E4vPZJq0GjIEC/QjTazt4Fe/bhtAkOBL9cdjqLCzTkkkLYMZenKnvoh/4ikNbQbIEM
	o+Kg0xbz7txEu4wDTkbEI0Jju7GRcwUJarH7GxXVIt889sPmU56x3WmmiXipsyqeImlX+T8q14ph0
	kTzEW32Ei7rme2qpxL+lqLh0/RYeElEwawfrQI7Ih4qDUfOh2yx70k/O3xQAewtoaH8qI9mYqltdt
	acNJsdRlYU6m17Gl6sAl2cS6EOOLv2IOnZsIw/yLRv6scP72qWupWel4b9PGFsXUkb3vCAcDrcHby
	hND2v5urVup0x5YMv4PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTkhs-005G9f-0y;
	Wed, 09 Aug 2023 15:02:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTkho-005G8u-2V
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 15:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691593356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2NYYbX0Ny/eDp4l06N9hZE4kvGy1+pASnAt7JajSyFo=;
	b=N1NEanMZPsOYYIgvqvV/e+6O6eH6D0n3klMO/OgpPpwG1BWfcygYmMG49jQIYIqgdl7c1N
	kJ9uI3Sgz1fY8tvPF1Dhqp6cedUNf6WoMzY7ARY/+DGyz5TrwUmBPlx96x4JWdsfoNiFn/
	Zg9rGKC/jcUKlLida1iw/CXxUCakFKU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589--YaCdUlVMgittnQGE9FU3g-1; Wed, 09 Aug 2023 11:02:34 -0400
X-MC-Unique: -YaCdUlVMgittnQGE9FU3g-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-403ba1eebedso93527251cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 08:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691593353; x=1692198153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2NYYbX0Ny/eDp4l06N9hZE4kvGy1+pASnAt7JajSyFo=;
        b=gQ0OmkC+hqLIwJ8mbogpj0K9iTTPvjRKiuBdMdNGJ938aVzQ3vPiVkhoU20rpSVBwB
         nchoRIyVKsTYJvq+8TBKXUr45Qz5KZAoWpm+por2Skag90TC1SzqgrzaG17ucLKzbj/M
         k1VdTyvkGHtfopG6jNdwGMzVWa1XhVnwWz32UVp9d9/9AArmZXBgSHqRCBXA6buMgJX0
         bFkjppZ5NJjAR94KiPoBy3ROcCHSbEZEN1AwFLYikObLmf80ph7PA+DHx/RZiHt6qqEV
         CION0QnbXeNAI3wiIqEgeDQzPEqvktlANj8M2dcfOxlc11aLZZkQRtwgDI7XCvsxlWu3
         m1FQ==
X-Gm-Message-State: AOJu0Yyv+hCbSyk4mSzJvAVZvTy/LL/O5PBSXAbAVP6nokyQ5zPEMix1
	ZndyZSOnpag5NZVMCL931QQqJEQhP9SPY6DgNtCvExFvbRWadlO9UWQd36ufejCQ4ezfZ+Y+Mlf
	VTSf2IEXFb1zkwv/2CqZx5F+4XALW5NpSRetVlUPMLtJh
X-Received: by 2002:ac8:4e8b:0:b0:40f:db89:8616 with SMTP id 11-20020ac84e8b000000b0040fdb898616mr4162714qtp.67.1691593353252;
        Wed, 09 Aug 2023 08:02:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSF647FR6HPptz0wXsij0RUWgRN1QjmtT6Jrtmo+lRqMtDdZ5gy7XDMtl5sYjvOIzXxmZxxvkvYG2dq/sizNI=
X-Received: by 2002:ac8:4e8b:0:b0:40f:db89:8616 with SMTP id
 11-20020ac84e8b000000b0040fdb898616mr4162646qtp.67.1691593352652; Wed, 09 Aug
 2023 08:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230809021311.1390578-2-leobras@redhat.com>
In-Reply-To: <20230809021311.1390578-2-leobras@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 9 Aug 2023 12:02:21 -0300
Message-ID: <CAJ6HWG525eMQxbQ8BPsy9WMZvkiqSOHBJBCUtW_wV1Cv55cWxQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 0/5] Rework & improve riscv cmpxchg.h and atomic.h
To: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Leonardo Bras <leobras@redhat.com>, 
	Andrea Parri <parri.andrea@gmail.com>, Ingo Molnar <mingo@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Guo Ren <guoren@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_080236_882928_C091388D 
X-CRM114-Status: GOOD (  26.53  )
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

T24gVHVlLCBBdWcgOCwgMjAyMyBhdCAxMToxM+KAr1BNIExlb25hcmRvIEJyYXMgPGxlb2JyYXNA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBXaGlsZSBzdHVkeWluZyByaXNjdidzIGNtcHhjaGcuaCBm
aWxlLCBJIGdvdCByZWFsbHkgaW50ZXJlc3RlZCBpbgo+IHVuZGVyc3RhbmRpbmcgaG93IFJJU0NW
IGFzbSBpbXBsZW1lbnRlZCB0aGUgZGlmZmVyZW50IHZlcnNpb25zIG9mCj4ge2NtcCx9eGNoZy4K
Pgo+IFdoZW4gSSB1bmRlcnN0b29kIHRoZSBwYXR0ZXJuLCBpdCBtYWRlIHNlbnNlIGZvciBtZSB0
byByZW1vdmUgdGhlCj4gZHVwbGljYXRpb25zIGFuZCBjcmVhdGUgbWFjcm9zIHRvIG1ha2UgaXQg
ZWFzaWVyIHRvIHVuZGVyc3RhbmQgd2hhdCBleGFjdGx5Cj4gY2hhbmdlcyBiZXR3ZWVuIHRoZSB2
ZXJzaW9uczogSW5zdHJ1Y3Rpb24gc3VmaXhlcyAmIGJhcnJpZXJzLgo+Cj4gQWxzbywgZGlkIHRo
ZSBzYW1lIGtpbmQgb2Ygd29yayBvbiBhdG9taWMuYy4KPgo+IEFmdGVyIHRoYXQsIEkgbm90ZWQg
Ym90aCBjbXB4Y2hnIGFuZCB4Y2hnIG9ubHkgYWNjZXB0IHZhcmlhYmxlcyBvZgo+IHNpemUgNCBh
bmQgOCwgY29tcGFyZWQgdG8geDg2IGFuZCBhcm02NCB3aGljaCBkbyAxLDIsNCw4Lgo+Cj4gTm93
IHRoYXQgZGVkdXBsaWNhdGlvbiBpcyBkb25lLCBpdCBpcyBxdWl0ZSBkaXJlY3QgdG8gaW1wbGVt
ZW50IHRoZW0KPiBmb3IgdmFyaWFibGUgc2l6ZXMgMSBhbmQgMiwgc28gSSBkaWQgaXQuIFRoZW4g
R3VvIFJlbiBhbHJlYWR5IHByZXNlbnRlZAo+IG1lIHNvbWUgcG9zc2libGUgdXNlcnMgOikKPgo+
IEkgZGlkIGNvbXBhcmUgdGhlIGdlbmVyYXRlZCBhc20gb24gYSB0ZXN0LmMgdGhhdCBjb250YWlu
ZWQgdXNhZ2UgZm9yIGV2ZXJ5Cj4gY2hhbmdlZCBmdW5jdGlvbiwgYW5kIGNvdWxkIG5vdCBkZXRl
Y3QgYW55IGNoYW5nZSBvbiBwYXRjaGVzIDEgKyAyICsgMwo+IGNvbXBhcmVkIHdpdGggdXBzdHJl
YW0uCj4KPiBQYXRoZXMgNCAmIDUgd2VyZSBjb21waWxlZC10ZXN0ZWQsIG1lcmdlZCB3aXRoIGd1
b3Jlbi9xc3BpbmxvY2tfdjExIGFuZAo+IGJvb3RlZCBqdXN0IGZpbmUgd2l0aCBxZW11IC1tYWNo
aW5lIHZpcnQgLWFwcGVuZCAicXNwaW5sb2NrIi4KClRoaXMgaXMgdGhlIHRyZWUgdGhhdCBJIHVz
ZWQ6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9MZW9CcmFzL2xpbnV4Ly0vY29tbWl0cy9ndW9fcXNwaW5s
b2NrX3YxMQoKPgo+IFRoYW5rcyEKPiBMZW8KPgo+IENoYW5nZXMgc2luY2Ugc3F1YXNoZWQgY21w
eGNoZyBSRkN2MzoKPiAtIEZpeGVkIGJ1ZyBvbiBjbXB4Y2hnIG1hY3JvIGZvciB2YXIgc2l6ZSAx
ICYgMjogbm93IHdvcmtpbmcKPiAtIE1hY3JvcyBmb3IgdmFyIHNpemUgMSAmIDIncyBsci53IGFu
ZCBzYy53IG5vdyBhcmUgZ3VhcmFudGVlZCB0byByZWNlaXZlCj4gICBpbnB1dCBvZiBhIDMyLWJp
dCBhbGlnbmVkIGFkZHJlc3MKPiAtIFJlbmFtZWQgaW50ZXJuYWwgbWFjcm9zIGZyb20gX21hc2sg
dG8gX21hc2tlZCBmb3IgcGF0Y2hlcyA0ICYgNQo+IC0gX19yYyB2YXJpYWJsZSBvbiBtYWNyb3Mg
Zm9yIHZhciBzaXplIDEgJiAyIGNoYW5nZWQgZnJvbSByZWdpc3RlciB0byB1bG9uZwo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDgwNDA4NDkwMC4xMTM1NjYwLTItbGVvYnJhc0By
ZWRoYXQuY29tLwo+Cj4gQ2hhbmdlcyBzaW5jZSBzcXVhc2hlZCBjbXB4Y2hnIFJGQ3YyOgo+IC0g
UmVtb3ZlZCByYyBwYXJhbWV0ZXIgZnJvbSB0aGUgbmV3IG1hY3JvOiBpdCBjYW4gYmUgaW50ZXJu
YWwgdG8gdGhlIG1hY3JvCj4gLSAyIG5ldyBwYXRjaGVzOiBjbXB4Y2hnIHNpemUgMSBhbmQgMiwg
eGNoZyBzaXplIDEgYW5kIDIKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA4MDMw
NTE0MDEuNzEwMjM2LTItbGVvYnJhc0ByZWRoYXQuY29tLwo+Cj4gQ2hhbmdlcyBzaW5jZSBzcXVh
c2hlZCBjbXB4Y2hnIFJGQ3YxOgo+IC0gVW5pZmllZCB3aXRoIGF0b21pYy5jIHBhdGNoc2V0Cj4g
LSBSZWJhc2VkIG9uIHRvcCBvZiB0b3J2YWxkcy9tYXN0ZXIgKHRoYW5rcyBBbmRyZWEgUGFycmkh
KQo+IC0gUmVtb3ZlZCBoZWxwZXIgbWFjcm9zIHRoYXQgd2VyZSBub3QgYmVpbmcgdXNlZCBlbHNl
d2hlcmUgaW4gdGhlIGtlcm5lbC4KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA0
MTkwNjI1MDUuMjU3MjMxLTEtbGVvYnJhc0ByZWRoYXQuY29tLwo+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDIzMDQwNjA4MjAxOC43MDM2Ny0xLWxlb2JyYXNAcmVkaGF0LmNvbS8KPgo+
IENoYW5nZXMgc2luY2UgKGNtcHhjaGcpIFJGQ3YzOgo+IC0gU3F1YXNoZWQgdGhlIDYgb3JpZ2lu
YWwgcGF0Y2hlcyBpbiAyOiBvbmUgZm9yIGNtcHhjaGcgYW5kIG9uZSBmb3IgeGNoZwo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDQwNDE2Mzc0MS4yNzYyMTY1LTEtbGVvYnJhc0By
ZWRoYXQuY29tLwo+Cj4gQ2hhbmdlcyBzaW5jZSAoY21weGNoZykgUkZDdjI6Cj4gLSBGaXhlZCAg
bWFjcm9zIHRoYXQgZGVwZW5kIG9uIGhhdmluZyBhIGxvY2FsIHZhcmlhYmxlIHdpdGggYSBtYWdp
YyBuYW1lCj4gLSBQcmV2aW91cyBjYXN0IHRvIChsb25nKSBpcyBub3cgb25seSBhcHBsaWVkIG9u
IDQtYnl0ZXMgY21weGNoZwo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDMyMTA3
NDI0OS4yMjIxNjc0LTEtbGVvYnJhc0ByZWRoYXQuY29tLwo+Cj4gQ2hhbmdlcyBzaW5jZSAoY21w
eGNoZykgUkZDdjE6Cj4gLSBGaXhlZCBwYXRjaCA0LzYgc3VmZml4IGZyb20gJ3cuYXFybCcgdG8g
Jy53LmFxcmwnLCB0byBhdm9pZCBidWlsZCBlcnJvcgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDIzMDMxODA4MDA1OS4xMTA5Mjg2LTEtbGVvYnJhc0ByZWRoYXQuY29tLwo+Cj4KPiBM
ZW9uYXJkbyBCcmFzICg1KToKPiAgIHJpc2N2L2NtcHhjaGc6IERlZHVwbGljYXRlIHhjaGcoKSBh
c20gZnVuY3Rpb25zCj4gICByaXNjdi9jbXB4Y2hnOiBEZWR1cGxpY2F0ZSBjbXB4Y2hnKCkgYXNt
IGFuZCBtYWNyb3MKPiAgIHJpc2N2L2F0b21pYy5oIDogRGVkdXBsaWNhdGUgYXJjaF9hdG9taWMu
Kgo+ICAgcmlzY3YvY21weGNoZzogSW1wbGVtZW50IGNtcHhjaGcgZm9yIHZhcmlhYmxlcyBvZiBz
aXplIDEgYW5kIDIKPiAgIHJpc2N2L2NtcHhjaGc6IEltcGxlbWVudCB4Y2hnIGZvciB2YXJpYWJs
ZXMgb2Ygc2l6ZSAxIGFuZCAyCj4KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hdG9taWMuaCAg
fCAxNjQgKysrKysrLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NtcHhjaGcuaCB8
IDM5NCArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwg
MTk1IGluc2VydGlvbnMoKyksIDM2MyBkZWxldGlvbnMoLSkKPgo+IC0tCj4gMi40MS4wCj4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
