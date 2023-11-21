Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D8EC61D85
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 17:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jxKHinIO4geKplVbv1v/3d5g86K5rnrGLEAfYYhm4NE=; b=xYSYoWoRSPM8FI
	+/vmFvrtMZfYyNN4ytyYHse5eqBkaWtppXLyv8Cme7s5KOqGx8ohfXbxez0bsxdSq/egjNmcfTjk9
	DUvffIMlczjfXZfrvbKrgHN1IGaKECkv+5JnIoZ+WYGWw/otVLohChAtfkXRZr0OJnp+ew4ugybpP
	lJCK7xBi3CSIBhkX6jsb3ZI+5+zyVcBS92yYGTPbH1GqElvniqaKV7kxbaYVit6EUfvVqJTGkagg8
	0oKpcga4EiLqhERKV1Uh/ARhy5p0J6Dmqlre5Ejopoj5asLTzdCbTYgpa7khLFsoisy2jG4mW8r/b
	I75Z+q2WtqmV/jZZqjFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5U7i-00HLYt-0p;
	Tue, 21 Nov 2023 17:01:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5U7e-00HLX2-0M
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 17:01:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700586071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v93FwVXoTzkwCTHloTDbAyzgq12DcyzYpNvU8V0mZJE=;
	b=BukZWAwWoMzDnykIthbpTWJ20Htab7d/JFNhjEAivJgpF3MMFRDqTHDhczlSz2nbrasmOl
	CP5KoyjwzSoZflizWQkJ9+l4zkgBPebSWM3Mk/Uw9WW+xY9j/B+00EQqza+Y3qb+FXjhw5
	E+5MM7FENi3MCmp+ollVwLNwi6F5AaQ=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-cbdZrEHzM6WxLAOsJWkkqw-1; Tue, 21 Nov 2023 12:01:09 -0500
X-MC-Unique: cbdZrEHzM6WxLAOsJWkkqw-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3b2f3015ce6so7474547b6e.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 09:01:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700586069; x=1701190869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v93FwVXoTzkwCTHloTDbAyzgq12DcyzYpNvU8V0mZJE=;
        b=Vf2NWjhPKUPxErh7OzDDMBCgZ8ZF1zBAcw6v7ZVZjQTUPT1kOz+pANj5SK+gKNQt8b
         3JwuAbYthVOuQ+o+3oZ8JhM1hEpA/VuNmulwwAUMrIUrLPXgOVOPHkf6c/tPn20j5XgZ
         fqajTMw0i6CO1t7Fb0LFlMpzu2YhAtLqJt6ng0L+0HHFv8EL5Owfzez5Q5mxkEU8jbti
         w/h3QRDnhLMwrzUqkdPNkm8jB4QXWMQIR/KtD9uz6CPDHBOiSP1BkuRLUcFsNd4UFdUt
         /FdOO3EVUEPM9uCqr66k6xUBPVc52vj+59ZXrg09ocjvUndX27OL7ErI4/QjDbH7r3mn
         GHZQ==
X-Gm-Message-State: AOJu0Yy03TaJ9J/919ywmqj3SwiWN/LhNNS1Q/Mm2yyQavIRX/xucMJ3
	Qak/pNizJVTufxa8eoweMTfE0RuIWpVTdbBkjbu0o686PZYCmU1bkbomxIPX+volXBGh1IbRkHf
	SC4aCnu8xhJgWCWglG+6a9DaNuPCk45Tbmi8YBGSGiI7K
X-Received: by 2002:a05:6358:7e47:b0:169:a9d4:3faf with SMTP id p7-20020a0563587e4700b00169a9d43fafmr12581512rwm.11.1700586069073;
        Tue, 21 Nov 2023 09:01:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzwqwXTcQOMVq6+W/ToO1AFQnqdGCzNKV3DK3CezCKFyIOZTTVBddsfYxnVHAme/q2N84DW6rxhPtI5xPi31c=
X-Received: by 2002:a05:6358:7e47:b0:169:a9d4:3faf with SMTP id
 p7-20020a0563587e4700b00169a9d43fafmr12581454rwm.11.1700586068588; Tue, 21
 Nov 2023 09:01:08 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-35-pbonzini@redhat.com>
 <CAF7b7mpmuYLTY6OQfRRoOryfO-2e1ZumQ6SCQDHHPD5XFyhFTQ@mail.gmail.com> <13677ced-e464-4cdb-82ae-4236536e169c@sirena.org.uk>
In-Reply-To: <13677ced-e464-4cdb-82ae-4236536e169c@sirena.org.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 21 Nov 2023 18:00:56 +0100
Message-ID: <CABgObfZdk9Jn60QLJGweVZMN_yWsxo1d7W3Mu-NNTPZVO0uCnw@mail.gmail.com>
Subject: Re: [PATCH 34/34] KVM: selftests: Add a memory region subtest to
 validate invalid flags
To: Mark Brown <broonie@kernel.org>
Cc: Anish Moorthy <amoorthy@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_090114_243221_64BF6AB7 
X-CRM114-Status: GOOD (  12.85  )
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

T24gTW9uLCBOb3YgMjAsIDIwMjMgYXQgMzowOeKAr1BNIE1hcmsgQnJvd24gPGJyb29uaWVAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIE5vdiAwOCwgMjAyMyBhdCAwNTowODowMVBNIC0w
ODAwLCBBbmlzaCBNb29ydGh5IHdyb3RlOgo+ID4gQXBwbHlpbmcgWzFdIGFuZCBbMl0gcmV2ZWFs
cyB0aGF0IHRoaXMgYWxzbyBicmVha3Mgbm9uLXg4NiBidWlsZHMtIHRoZQo+ID4gTUVNX1JFR0lP
Tl9HUEEvU0xPVCBkZWZpbml0aW9ucyBhcmUgZ3VhcmRlZCBiZWhpbmQgYW4gI2lmZGVmCj4gPiBf
X3g4Nl82NF9fLCB3aGlsZSB0aGUgdXNhZ2VzIGludHJvZHVjZWQgaGVyZSBhcmVuJ3QuCj4gPgo+
ID4gU2hvdWxkCj4gPgo+ID4gT24gU3VuLCBOb3YgNSwgMjAyMyBhdCA4OjM14oCvQU0gUGFvbG8g
Qm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+ICsgICAgICAg
dGVzdF9pbnZhbGlkX21lbW9yeV9yZWdpb25fZmxhZ3MoKTsKPiA+Cj4gPiBiZSAjaWZkZWYnZCwg
cGVyaGFwcz8gSSdtIG5vdCBxdWl0ZSBzdXJlIHdoYXQgdGhlIGludGVudCBpcy4KPgo+IFRoaXMg
aGFzIGJlZW4gYnJva2VuIGluIC1uZXh0IGZvciBhIHdlZWsgbm93LCBkbyB3ZSBoYXZlIGFueSBw
cm9ncmVzcwo+IG9uIGEgZml4IG9yIHNob3VsZCB3ZSBqdXN0IHJldmVydCB0aGUgcGF0Y2g/CgpT
b3JyeSwgSSB3YXMgYXdheSBsYXN0IHdlZWsuIEkgaGF2ZSBub3cgcG9zdGVkIGEgcGF0Y2guCgpQ
YW9sbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
