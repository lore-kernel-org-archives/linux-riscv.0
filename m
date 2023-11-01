Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C688C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 23:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IpS1ryFXQFyNm39alvXxmNbs9rSCUwm4cDeDUOEaWxo=; b=t+nenlQOlT09rh
	mRZxigyHPGA4cw+O7S+E1ucdFdS16lDRRixeU9OAUYuv/LM/RqFAs4FNt96taNeZ23YNjsRTNkKP9
	gziEiw1oGLSBtEwWEPG7puUmLY9p98cV445v7YNpSOJDLSggE6L8pRDYn1n5Xhu0xLVzgh6q+fp59
	MSIeoghZJdEgVrSZAw0m0eBiqtq/lnt4/Cw+QMijnV/haP6IHhGaVvT9KTsyUEr+rBmQ3Pr/4AT0H
	h4xj9XRpSJgxME9s017NzqsMHstAHOX0F61HxTGIn4yReTlE1pxUjVTAunfYVUJcx9tOuFzucy06A
	U7G2ixOdtqWwX22AGHQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyKSs-008GyI-15;
	Wed, 01 Nov 2023 23:17:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyKSm-008GvO-1G
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 23:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698880646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0vwHZc+/Gns5rEzdivTNKNr5j0n3GZLH4TX/0o56Y/4=;
	b=BoOXjcHe0ucw5ePureb+X6kC3ObxAnXglgGCCAFHW6RMdQ9S8yL/ag/ZFS/z6+bWcBHCcw
	EhihPfGnnrPcxYfQNeaJdgMBYOu0nddhYyC/HVIRaR1BiMWxG3UrCySj7f9Tht5EE810Xv
	6qeS8C8zQCmsPMn8JJYs6lLL6GxTv30=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-FKNVYSCCMLOCMij0KNbNHQ-1; Wed, 01 Nov 2023 19:17:26 -0400
X-MC-Unique: FKNVYSCCMLOCMij0KNbNHQ-1
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-457c24e223bso152852137.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 16:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698880645; x=1699485445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0vwHZc+/Gns5rEzdivTNKNr5j0n3GZLH4TX/0o56Y/4=;
        b=IsRW16CMfz4uo79SoZIBm8/mC/OUcfcLRhL5ynQA4cRqEdSWWBJhRBVRbmQkiUifJG
         dKwke6Gvejj66lV/8z5YmEOfaDkfDkfl4mg37WtuxkT1LV9A3+sBJuuvPi+qWB+yBcid
         qLr90pygAG+rkBHc7dsXSJTh9+6GC9Xv4UxQE1+WP2qFP8VXmYCqqoqd/xA9+stTWzT8
         ZRomFOHqsbA3qEM5KObEWo9Ul2R/+el2klPvKL1rRnI7EsLMXlrxsFc6C3jchYBFu65r
         i/JXeavEnv+f6ow7IBWgBwigBugjdxVXAAktc22JPUQlNfA1bBOgE5bK3tni4xfSV85I
         rVZg==
X-Gm-Message-State: AOJu0YxazoEPDFLGP9QjJaQIIid6pq3sdK5RooTSPR96FZO3UaDCal4s
	F21O0VJ8tbAb81CHna5SMnJacVvlszpFbGUuLuWUUCO7Hs+XVNhggy9VLprwxWNI8W0miLpDdfm
	VDI4MBDpg6fwE6pZAoL6VrcercrFPRWmNN7HFF2HHkrpd
X-Received: by 2002:a67:b70e:0:b0:450:8e58:2de4 with SMTP id h14-20020a67b70e000000b004508e582de4mr14946765vsf.7.1698880645426;
        Wed, 01 Nov 2023 16:17:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERW8ZMUKS1oQBttUXGlXfpcF1aXMGz29SltsJOczMO7DdV5tM2YzmJ2Q5mLWwPrzL7OcDPCpWawHIyBUWWBis=
X-Received: by 2002:a67:b70e:0:b0:450:8e58:2de4 with SMTP id
 h14-20020a67b70e000000b004508e582de4mr14946722vsf.7.1698880645133; Wed, 01
 Nov 2023 16:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-18-seanjc@google.com>
 <7c0844d8-6f97-4904-a140-abeabeb552c1@intel.com> <ZUEML6oJXDCFJ9fg@google.com>
 <92ba7ddd-2bc8-4a8d-bd67-d6614b21914f@intel.com> <ZUJVfCkIYYFp5VwG@google.com>
 <CABgObfaw4Byuzj5J3k48jdwT0HCKXLJNiuaA9H8Dtg+GOq==Sw@mail.gmail.com>
 <ZUJ-cJfofk2d_I0B@google.com> <4ca2253d-276f-43c5-8e9f-0ded5d5b2779@redhat.com>
 <ZULSkilO-tdgDGyT@google.com>
In-Reply-To: <ZULSkilO-tdgDGyT@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 2 Nov 2023 00:17:13 +0100
Message-ID: <CABgObfbq_Hg0B=jvsSDqYH3CSpX+RsxfwB-Tc-eYF4uq2Qw9cg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231101_161728_552332_079248DA 
X-CRM114-Status: GOOD (  27.14  )
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

T24gV2VkLCBOb3YgMSwgMjAyMyBhdCAxMTozNeKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgTm92IDAxLCAyMDIzLCBQYW9sbyBC
b256aW5pIHdyb3RlOgo+ID4gT24gMTEvMS8yMyAxNzozNiwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3
cm90ZToKPiA+ID4gPiA+ICJBbGxvdyIgaXNuJ3QgcGVyZmVjdCwgZS5nLiBJIHdvdWxkIG11Y2gg
cHJlZmVyIGEgc3RyYWlnaHQgS1ZNX0dVRVNUX01FTUZEX1VTRV9IVUdFUEFHRVMKPiA+ID4gPiA+
IG9yIEtWTV9HVUVTVF9NRU1GRF9IVUdFUEFHRVMgZmxhZywgYnV0IEkgd2FudGVkIHRoZSBuYW1l
IHRvIGNvbnZleSB0aGF0IEtWTSBkb2Vzbid0Cj4gPiA+ID4gPiAoeWV0KSBndWFyYW50ZWUgaHVn
ZXBhZ2VzLiAgSS5lLiBLVk1fR1VFU1RfTUVNRkRfQUxMT1dfSFVHRVBBR0UgaXMgc3Ryb25nZXIg
dGhhbgo+ID4gPiA+ID4gYSBoaW50LCBidXQgd2Vha2VyIHRoYW4gYSByZXF1aXJlbWVudC4gIEFu
ZCBpZi93aGVuIEtWTSBzdXBwb3J0cyBhIGRlZGljYXRlZCBtZW1vcnkKPiA+ID4gPiA+IHBvb2wg
b2Ygc29tZSBraW5kLCB0aGVuIHdlIGNhbiBhZGQgS1ZNX0dVRVNUX01FTUZEX1JFUVVJUkVfSFVH
RVBBR0UuCj4gPiA+ID4gSSB0aGluayB0aGF0IHRoZSBjdXJyZW50IHBhdGNoIGlzIGZpbmUsIGJ1
dCBJIHdpbGwgYWRqdXN0IGl0IHRvIGFsd2F5cwo+ID4gPiA+IGFsbG93IHRoZSBmbGFnLCBhbmQg
dG8gbWFrZSB0aGUgc2l6ZSBjaGVjayBldmVuIGlmICFDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBB
R0UuCj4gPiA+ID4gSWYgaHVnZXBhZ2VzIGFyZSBub3QgZ3VhcmFudGVlZCwgYW5kICh0aGVvcmV0
aWNhbGx5KSB5b3UgY291bGQgaGF2ZSBubwo+ID4gPiA+IGh1Z2VwYWdlIGF0IGFsbCBpbiB0aGUg
cmVzdWx0LCBpdCdzIG9rYXkgdG8gZ2V0IHRoaXMgcmVzdWx0IGV2ZW4gaWYgVEhQIGlzIG5vdAo+
ID4gPiA+IGF2YWlsYWJsZSBpbiB0aGUga2VybmVsLgo+ID4gPiBDYW4geW91IHBvc3QgYSBmaXh1
cCBwYXRjaD8gIEl0J3Mgbm90IGNsZWFyIHRvIG1lIGV4YWN0bHkgd2hhdCBiZWhhdmlvciB5b3Ug
aW50ZW5kCj4gPiA+IHRvIGVuZCB1cCB3aXRoLgo+ID4KPiA+IFN1cmUsIGp1c3QgdGhpczoKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvdmlydC9rdm0vZ3Vlc3RfbWVtZmQuYyBiL3ZpcnQva3ZtL2d1ZXN0
X21lbWZkLmMKPiA+IGluZGV4IDdkMWEzM2MyYWQ0Mi4uMzRmZDA3MGUwM2Q5IDEwMDY0NAo+ID4g
LS0tIGEvdmlydC9rdm0vZ3Vlc3RfbWVtZmQuYwo+ID4gKysrIGIvdmlydC9rdm0vZ3Vlc3RfbWVt
ZmQuYwo+ID4gQEAgLTQzMCwxMCArNDMwLDcgQEAgaW50IGt2bV9nbWVtX2NyZWF0ZShzdHJ1Y3Qg
a3ZtICprdm0sIHN0cnVjdCBrdm1fY3JlYXRlX2d1ZXN0X21lbWZkICphcmdzKQo+ID4gIHsKPiA+
ICAgICAgIGxvZmZfdCBzaXplID0gYXJncy0+c2l6ZTsKPiA+ICAgICAgIHU2NCBmbGFncyA9IGFy
Z3MtPmZsYWdzOwo+ID4gLSAgICAgdTY0IHZhbGlkX2ZsYWdzID0gMDsKPiA+IC0KPiA+IC0gICAg
IGlmIChJU19FTkFCTEVEKENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRSkpCj4gPiAtICAgICAg
ICAgICAgIHZhbGlkX2ZsYWdzIHw9IEtWTV9HVUVTVF9NRU1GRF9BTExPV19IVUdFUEFHRTsKPiA+
ICsgICAgIHU2NCB2YWxpZF9mbGFncyA9IEtWTV9HVUVTVF9NRU1GRF9BTExPV19IVUdFUEFHRTsK
PiA+ICAgICAgIGlmIChmbGFncyAmIH52YWxpZF9mbGFncykKPiA+ICAgICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7Cj4gPiBAQCAtNDQxLDExICs0MzgsOSBAQCBpbnQga3ZtX2dtZW1fY3JlYXRl
KHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2bV9jcmVhdGVfZ3Vlc3RfbWVtZmQgKmFyZ3MpCj4g
PiAgICAgICBpZiAoc2l6ZSA8IDAgfHwgIVBBR0VfQUxJR05FRChzaXplKSkKPiA+ICAgICAgICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiAtI2lmZGVmIENPTkZJR19UUkFOU1BBUkVOVF9IVUdF
UEFHRQo+ID4gICAgICAgaWYgKChmbGFncyAmIEtWTV9HVUVTVF9NRU1GRF9BTExPV19IVUdFUEFH
RSkgJiYKPiA+ICAgICAgICAgICAhSVNfQUxJR05FRChzaXplLCBIUEFHRV9QTURfU0laRSkpCj4g
PiAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gLSNlbmRpZgo+Cj4gVGhhdCB3b24n
dCB3b3JrLCBIUEFHRV9QTURfU0laRSBpcyB2YWxpZCBvbmx5IGZvciBDT05GSUdfVFJBTlNQQVJF
TlRfSFVHRVBBR0U9eS4KPgo+ICNlbHNlIC8qIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRSAq
Lwo+ICNkZWZpbmUgSFBBR0VfUE1EX1NISUZUICh7IEJVSUxEX0JVRygpOyAwOyB9KQo+ICNkZWZp
bmUgSFBBR0VfUE1EX01BU0sgKHsgQlVJTERfQlVHKCk7IDA7IH0pCj4gI2RlZmluZSBIUEFHRV9Q
TURfU0laRSAoeyBCVUlMRF9CVUcoKTsgMDsgfSkKCldvdWxkIGhhdmUgY2F1Z2h0IGl0IHdoZW4g
YWN0dWFsbHkgdGVzdGluZyBpdCwgSSBndWVzcy4gOikgSXQgaGFzIHRvCmJlIFBNRF9TSVpFLCBw
b3NzaWJseSB3aXRoCgojaWZkZWYgQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFCkJVSUxEX0JV
R19PTihIUEFHRV9QTURfU0laRSAhPSBQTURfU0laRSk7CiNlbmRpZgoKZm9yIGV4dHJhIHNhZmV0
eS4KClBhb2xvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
