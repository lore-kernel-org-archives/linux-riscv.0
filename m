Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4449EE14A9
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 22:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+QXoY+89NDTPuC4fK2q16BPS+KODqpTF1vJ33Dk/y5s=; b=bGwu5GaslpBR0r
	HlaXA0nljwGgkUSPTQ72l3ixSqOjWJ+smpY3Hn86Jiiv8UvxRrGrZ3mC0Pe13uZlsKcjs8a7o4/wx
	NVibsKxlG6SmOwc7HxDR5nW9/Y1jH2DdEk6a1GsJaoiYJ5FGt+H/U1iXKKC5a7VyS9AUzQB8s76tq
	b8X8eERyBkUPE6U3GXbD3B9k4JnZtgRmQblX/H0zgEx/pzHfh5G1BfQbUisKeh644HRm43OasNIx9
	BkpG0PU+RgCighGsUGNcFECVZytsKMHuddhr4B6Dp8w1M/ZWydiKKsGgsIMxHjwGprU8CsBubdMxw
	zV3zAUA/OGF+hfDU6iFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qe0jI-00Axgc-1Q;
	Wed, 06 Sep 2023 22:10:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qe0jF-00Axf8-1q
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 22:10:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694038227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2sW5n0U9nqfDRjI4qbYKErrgizSRaxysFjpyGkvRHBg=;
	b=Pg99Aw0dhrjssfj+plRZ73iAzmz80+t6FzoooYMo5YOjDFkLKZv62XF4FxljMbibakqOrb
	gWlugmjp43pbB5CdnXYoQls8seJQWvdY++J14P9i7h5PP0X9VcuRGlwMkKJAy4kV+FVodZ
	XQCAdiOokbHqs1rtsWQOjmjv9FyPDWo=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-HLyCO6pvMgSF-Zl8gfcilQ-1; Wed, 06 Sep 2023 18:10:25 -0400
X-MC-Unique: HLyCO6pvMgSF-Zl8gfcilQ-1
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-7a515393474so105402241.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Sep 2023 15:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694038225; x=1694643025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2sW5n0U9nqfDRjI4qbYKErrgizSRaxysFjpyGkvRHBg=;
        b=ErBhdJ/6Kg6svgkldEK7VkyClu/PfmNqLX883ArDBGvvBl/I44nOGWpfbVR6X1hyhR
         MymU0yuAv8hWqy9/ZYj80HtuYLMJ/gno0Il7frt82HgDjdb+tWKr6zTWZmL+PN1BG5ox
         ldwBLKO+bSTrvp9PJ5GSLJ8luNNpyDv7KGLJUNayxpMjw25r/oPt8F29NKXVCGTjknFm
         NW3C5DHyo6mWGhQmfFQsNApuxdDZOdkZkbmiu26jjYoxAW7YaGtAIlfc0lNmE8sGBaiL
         RX+J7tBo/L9wdbGkdNDPMTeC/fQXRX+XCibbLef7/g3gtem7mBwKrXDMz+1yNmTJi2lR
         tsiQ==
X-Gm-Message-State: AOJu0YzAkx7Kcbu4iyBoabzu0e8wXkgRiL6IbVMAp9fsVvn3OTsK4fzh
	glQtWCVqF18nVk1HWZnA04+fX3onuxxUh7QR02DsO3IGOjpn4wCRW7wr4IXHfpiKbVdYv55E/el
	/JVupWlhVOqTOTYeP4HeR9nwY4vU14aavd57u4x2GmPME
X-Received: by 2002:a67:ee4d:0:b0:444:17aa:df60 with SMTP id g13-20020a67ee4d000000b0044417aadf60mr4110695vsp.13.1694038225094;
        Wed, 06 Sep 2023 15:10:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp5n1WB8R1og/NcZaTM8SckALAeHpMUrTVBDu8TXyXcr3qI/pIRPsrfv30I89brgsoG52emGtevyCvY1jn784=
X-Received: by 2002:a67:ee4d:0:b0:444:17aa:df60 with SMTP id
 g13-20020a67ee4d000000b0044417aadf60mr4110646vsp.13.1694038224758; Wed, 06
 Sep 2023 15:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-14-seanjc@google.com>
 <84a908ae-04c7-51c7-c9a8-119e1933a189@redhat.com> <ZLq8ylTsFQ1s4BAZ@google.com>
In-Reply-To: <ZLq8ylTsFQ1s4BAZ@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 7 Sep 2023 00:10:13 +0200
Message-ID: <CABgObfYLuRx5oAfOKM1fNuyRw5BNhe127sbRYhmpoT9MsjMYQQ@mail.gmail.com>
Subject: Re: [RFC PATCH v11 13/29] KVM: Add transparent hugepage support for
 dedicated guest memory
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, Vlastimil Babka <vbabka@suse.cz>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_151029_699966_3EBC30EE 
X-CRM114-Status: GOOD (  13.27  )
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

T24gRnJpLCBKdWwgMjEsIDIwMjMgYXQgNzoxM+KAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPiBPbiBGcmksIEp1bCAyMSwgMjAyMywgUGFvbG8gQm9u
emluaSB3cm90ZToKPiA+IE9uIDcvMTkvMjMgMDE6NDQsIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3Jv
dGU6Cj4gPiA+IEBAIC00MTMsNiArNDU0LDkgQEAgaW50IGt2bV9nbWVtX2NyZWF0ZShzdHJ1Y3Qg
a3ZtICprdm0sIHN0cnVjdCBrdm1fY3JlYXRlX2d1ZXN0X21lbWZkICphcmdzKQo+ID4gPiAgICAg
dTY0IGZsYWdzID0gYXJncy0+ZmxhZ3M7Cj4gPiA+ICAgICB1NjQgdmFsaWRfZmxhZ3MgPSAwOwo+
ID4gPiArICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFKSkKPiA+
ID4gKyAgICAgICAgICAgdmFsaWRfZmxhZ3MgfD0gS1ZNX0dVRVNUX01FTUZEX0FMTE9XX0hVR0VQ
QUdFOwo+ID4gPiArCj4gPgo+ID4gSSB0aGluayBpdCBzaG91bGQgYmUgYWx3YXlzIGFsbG93ZWQu
ICBUaGUgb3V0Y29tZSB3b3VsZCBqdXN0IGJlICJuZXZlciBoYXZlCj4gPiBhIGh1Z2VwYWdlIiBp
ZiB0aHAgaXMgbm90IGVuYWJsZWQgaW4gdGhlIGtlcm5lbC4KPgo+IEkgZG9uJ3QgaGF2ZSBhIHN0
cm9uZyBwcmVmZXJlbmNlLiAgTXkgdGhpbmtpbmcgd2FzIHRoYXQgdXNlcnNwYWNlIHdvdWxkIHBy
b2JhYmx5Cj4gcmF0aGVyIGhhdmUgYW4gZXhwbGljaXQgZXJyb3IsIGFzIG9wcG9zZWQgdG8gc2ls
ZW50bHkgcnVubmluZyB3aXRoIGEgbWlzY29uZmlndXJlZAo+IHNldHVwLgoKQ29uc2lkZXJpbmcg
dGhhdCBpcyBob3cgbWFkdmlzZShNQURWX0hVR0VQQUdFKSBiZWhhdmVzLCB5b3VyIHBhdGNoIGlz
Cmdvb2QuIEkgZGlzYWdyZWUgYnV0IGNvbnNpc3RlbmN5IGlzIGJldHRlci4KClBhb2xvCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
