Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFDFC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 12:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6v9YLraBuufzGvzqc3b96di3+eYhcEfEmA86e4Mjfc=; b=43VzXPde+8BB7O
	adt1yKeHyaKFLaZy5XcUuvZzfyDSJst3Z10LTS1gYYYnDZSIrfFHGgzXv1K32xhBPX2g3Cvnx05af
	r3dHZ0IN3E7HlrdAzVJMO01ZcTbJ21HTJ/VKxqePlnwrGWN1ENNBiprW3AWGEr+7YXpIQZpurTZeY
	DwXDre/G6dAmc2iveEaF00US2/JG8VbABvp+wn6PxRm0bIvYjCiqQ8yVtQI0ngE74djFv9aIw6AMl
	wDZ3qesy6kfgrmvGLYYMl54+EoHhH/+UHG2J4qMK4scGgGbBuGBiEoPUTowdpobTPFQBIGO65x9P7
	sp0b42zuEWpjrEg/otDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyAcP-007WGs-0f;
	Wed, 01 Nov 2023 12:46:45 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyAcL-007WEn-0a
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 12:46:44 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-41cd4cc515fso48312471cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 05:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698842800; x=1699447600; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mygXGcRJ5YlWP61Tr7KN5KWyfhmOoXTRmQYYFZqOKKI=;
        b=Ev/lTRwVn1dy8zvEyzlaGwv2yR3Rf1ra+5LouhwGh4sWd8fjuHRpSYHMnjkE7Syp3B
         HuUR5An1RfyMlJBv9AsuuctRBEtA1ePVdfKSNrLymWy3zmiVxNAvcUBzQF+0SlrVAIPH
         4rhh39qHLDBvwv5lKF/xDTO/a3yz4ASLsmK1RQyQCAAFKQGJ0oOoO4JlmNaHuRSP1G34
         JVfNexTQHKzo+loecpzHqXG0J2I/z0F6PDKh1o1jcrAXzQyv17S+mIdNl/Z8gqLi0z4A
         pA7kEo3m0m3aEYe+liEqrtHy3BTyn9zC26018kL4So3to0XyZxftUVqMi9VZ2I6sWkBv
         eULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698842800; x=1699447600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mygXGcRJ5YlWP61Tr7KN5KWyfhmOoXTRmQYYFZqOKKI=;
        b=p+UmzQfPllh5pztaEavW91YuaJvV+w6QRO7rXOIxfPJML0UaxOXxtGku0qLcTS9eZU
         7wTPHlFX7HJeL6FU0mio8i7Y0iuwg3PYFiooqkReBQpkRseRovmCEUMDDE0AGQHyspU2
         kqOQX56QIgZqmzsYUQzgXh9lpAULf2Tqjr3qNZ/+sQTM5IXkYV527tmlAfcN/fAxUvVl
         I0LNWFI+2oPUS6QV65mNCjZK1xBYbiPs83XvjviDHJUiCWE6uBHJN6+3AMYqE2JSLfoQ
         WQKKSdNAHwE48gElUhGaogt1oU4JMjkJrPgwvPdV8wh4Zy0cETXEJUyQFOnXOlck7HfW
         7ENg==
X-Gm-Message-State: AOJu0Yxg+d7ebZ3o4h5Fp/UDBUmtbomWTAD2X+94ZLHAt2D7LZyVH6jo
	PdzfibUQtIpt2AUBxN5thILg2jJJIG1gaPq9zq6kFw==
X-Google-Smtp-Source: AGHT+IHd9N8dL6zdz3IA97hhnoDYG1Yv2Mx5veJZKoCg3Vt6EBcnFz3FSACXzGNwepp4FUZ865yy59BtQyGtgdViYUM=
X-Received: by 2002:a05:6214:f6c:b0:671:739e:e2fa with SMTP id
 iy12-20020a0562140f6c00b00671739ee2famr13258176qvb.59.1698842799599; Wed, 01
 Nov 2023 05:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-2-seanjc@google.com>
In-Reply-To: <20231027182217.3615211-2-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 1 Nov 2023 12:46:02 +0000
Message-ID: <CA+EHjTy5tmgGmVNGTX4a2Engb+r1AQizsMxwb8xqOi1f9+VQLA@mail.gmail.com>
Subject: Re: [PATCH v13 01/35] KVM: Tweak kvm_hva_range and hva_handler_t to
 allow reusing for gfn ranges
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
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
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_054641_224347_B9612B33 
X-CRM114-Status: GOOD (  19.79  )
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

T24gRnJpLCBPY3QgMjcsIDIwMjMgYXQgNzoyMuKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IFJld29yayBhbmQgcmVuYW1lICJzdHJ1Y3Qga3Zt
X2h2YV9yYW5nZSIgaW50byAia3ZtX21tdV9ub3RpZmllcl9yYW5nZSIgc28KPiB0aGF0IHRoZSBz
dHJ1Y3R1cmUgY2FuIGJlIHVzZWQgdG8gaGFuZGxlIG5vdGlmaWNhdGlvbnMgdGhhdCBvcGVyYXRl
IG9uIGdmbgo+IGNvbnRleHQsIGkuZS4gdGhhdCBhcmVuJ3QgdGllZCB0byBhIGhvc3QgdmlydHVh
bCBhZGRyZXNzLiAgUmVuYW1lIHRoZQo+IGhhbmRsZXIgdHlwZWRlZiB0b28gKGFyZ3VhYmx5IGl0
IHNob3VsZCBhbHdheXMgaGF2ZSBiZWVuIGdmbl9oYW5kbGVyX3QpLgo+Cj4gUHJhY3RpY2FsbHkg
c3BlYWtpbmcsIHRoaXMgaXMgYSBub3AgZm9yIDY0LWJpdCBrZXJuZWxzIGFzIHRoZSBvbmx5Cj4g
bWVhbmluZ2Z1bCBjaGFuZ2UgaXMgdG8gc3RvcmUgc3RhcnQrZW5kIGFzIHU2NHMgaW5zdGVhZCBv
ZiB1bnNpZ25lZCBsb25ncy4KPgo+IFJldmlld2VkLWJ5OiBQYW9sbyBCb256aW5pIDxwYm9uemlu
aUByZWRoYXQuY29tPgo+IFJldmlld2VkLWJ5OiBYaWFveWFvIExpIDx4aWFveWFvLmxpQGludGVs
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xl
LmNvbT4KPiAtLS0KClJldmlld2VkLWJ5OiBGdWFkIFRhYmJhIDx0YWJiYUBnb29nbGUuY29tPgpU
ZXN0ZWQtYnk6IEZ1YWQgVGFiYmEgPHRhYmJhQGdvb2dsZS5jb20+CgpDaGVlcnMsCi9mdWFkCgoK
PiAgdmlydC9rdm0va3ZtX21haW4uYyB8IDM0ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2t2bV9tYWluLmMgYi92aXJ0L2t2bS9rdm1fbWFp
bi5jCj4gaW5kZXggNDg2ODAwYTcwMjRiLi4wNTI0OTMzODU2ZDQgMTAwNjQ0Cj4gLS0tIGEvdmly
dC9rdm0va3ZtX21haW4uYwo+ICsrKyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKPiBAQCAtNTQxLDE4
ICs1NDEsMjIgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3Qga3ZtICptbXVfbm90aWZpZXJfdG9fa3Zt
KHN0cnVjdCBtbXVfbm90aWZpZXIgKm1uKQo+ICAgICAgICAgcmV0dXJuIGNvbnRhaW5lcl9vZiht
biwgc3RydWN0IGt2bSwgbW11X25vdGlmaWVyKTsKPiAgfQo+Cj4gLXR5cGVkZWYgYm9vbCAoKmh2
YV9oYW5kbGVyX3QpKHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2bV9nZm5fcmFuZ2UgKnJhbmdl
KTsKPiArdHlwZWRlZiBib29sICgqZ2ZuX2hhbmRsZXJfdCkoc3RydWN0IGt2bSAqa3ZtLCBzdHJ1
Y3Qga3ZtX2dmbl9yYW5nZSAqcmFuZ2UpOwo+Cj4gIHR5cGVkZWYgdm9pZCAoKm9uX2xvY2tfZm5f
dCkoc3RydWN0IGt2bSAqa3ZtLCB1bnNpZ25lZCBsb25nIHN0YXJ0LAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBlbmQpOwo+Cj4gIHR5cGVkZWYgdm9pZCAoKm9u
X3VubG9ja19mbl90KShzdHJ1Y3Qga3ZtICprdm0pOwo+Cj4gLXN0cnVjdCBrdm1faHZhX3Jhbmdl
IHsKPiAtICAgICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQ7Cj4gLSAgICAgICB1bnNpZ25lZCBsb25n
IGVuZDsKPiArc3RydWN0IGt2bV9tbXVfbm90aWZpZXJfcmFuZ2Ugewo+ICsgICAgICAgLyoKPiAr
ICAgICAgICAqIDY0LWJpdCBhZGRyZXNzZXMsIGFzIEtWTSBub3RpZmllcnMgY2FuIG9wZXJhdGUg
b24gaG9zdCB2aXJ0dWFsCj4gKyAgICAgICAgKiBhZGRyZXNzZXMgKHVuc2lnbmVkIGxvbmcpIGFu
ZCBndWVzdCBwaHlzaWNhbCBhZGRyZXNzZXMgKDY0LWJpdCkuCj4gKyAgICAgICAgKi8KPiArICAg
ICAgIHU2NCBzdGFydDsKPiArICAgICAgIHU2NCBlbmQ7Cj4gICAgICAgICB1bmlvbiBrdm1fbW11
X25vdGlmaWVyX2FyZyBhcmc7Cj4gLSAgICAgICBodmFfaGFuZGxlcl90IGhhbmRsZXI7Cj4gKyAg
ICAgICBnZm5faGFuZGxlcl90IGhhbmRsZXI7Cj4gICAgICAgICBvbl9sb2NrX2ZuX3Qgb25fbG9j
azsKPiAgICAgICAgIG9uX3VubG9ja19mbl90IG9uX3VubG9jazsKPiAgICAgICAgIGJvb2wgZmx1
c2hfb25fcmV0Owo+IEBAIC01ODEsNyArNTg1LDcgQEAgc3RhdGljIGNvbnN0IHVuaW9uIGt2bV9t
bXVfbm90aWZpZXJfYXJnIEtWTV9NTVVfTk9USUZJRVJfTk9fQVJHOwo+ICAgICAgICAgICAgICBu
b2RlID0gaW50ZXJ2YWxfdHJlZV9pdGVyX25leHQobm9kZSwgc3RhcnQsIGxhc3QpKSAgICAgIFwK
Pgo+ICBzdGF0aWMgX19hbHdheXNfaW5saW5lIGludCBfX2t2bV9oYW5kbGVfaHZhX3JhbmdlKHN0
cnVjdCBrdm0gKmt2bSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnN0IHN0cnVjdCBrdm1faHZhX3JhbmdlICpyYW5nZSkKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBrdm1f
bW11X25vdGlmaWVyX3JhbmdlICpyYW5nZSkKPiAgewo+ICAgICAgICAgYm9vbCByZXQgPSBmYWxz
ZSwgbG9ja2VkID0gZmFsc2U7Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX2dmbl9yYW5nZSBnZm5fcmFu
Z2U7Cj4gQEAgLTYwOCw5ICs2MTIsOSBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIGludCBfX2t2
bV9oYW5kbGVfaHZhX3JhbmdlKHN0cnVjdCBrdm0gKmt2bSwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBsb25nIGh2YV9zdGFydCwgaHZhX2VuZDsKPgo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIHNsb3QgPSBjb250YWluZXJfb2Yobm9kZSwgc3RydWN0IGt2bV9tZW1vcnlfc2xv
dCwgaHZhX25vZGVbc2xvdHMtPm5vZGVfaWR4XSk7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAg
aHZhX3N0YXJ0ID0gbWF4KHJhbmdlLT5zdGFydCwgc2xvdC0+dXNlcnNwYWNlX2FkZHIpOwo+IC0g
ICAgICAgICAgICAgICAgICAgICAgIGh2YV9lbmQgPSBtaW4ocmFuZ2UtPmVuZCwgc2xvdC0+dXNl
cnNwYWNlX2FkZHIgKwo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKHNsb3QtPm5wYWdlcyA8PCBQQUdFX1NISUZUKSk7Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgaHZhX3N0YXJ0ID0gbWF4X3QodW5zaWduZWQgbG9uZywgcmFuZ2UtPnN0YXJ0LCBz
bG90LT51c2Vyc3BhY2VfYWRkcik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaHZhX2VuZCA9
IG1pbl90KHVuc2lnbmVkIGxvbmcsIHJhbmdlLT5lbmQsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHNsb3QtPnVzZXJzcGFjZV9hZGRyICsgKHNsb3QtPm5wYWdlcyA8
PCBQQUdFX1NISUZUKSk7Cj4KPiAgICAgICAgICAgICAgICAgICAgICAgICAvKgo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAqIFRvIG9wdGltaXplIGZvciB0aGUgbGlrZWx5IGNhc2Ugd2hlcmUg
dGhlIGFkZHJlc3MKPiBAQCAtNjYwLDEwICs2NjQsMTAgQEAgc3RhdGljIF9fYWx3YXlzX2lubGlu
ZSBpbnQga3ZtX2hhbmRsZV9odmFfcmFuZ2Uoc3RydWN0IG1tdV9ub3RpZmllciAqbW4sCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9u
ZyBzdGFydCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBsb25nIGVuZCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bmlvbiBrdm1fbW11X25vdGlmaWVyX2FyZyBhcmcsCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaHZhX2hhbmRsZXJfdCBoYW5k
bGVyKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdm
bl9oYW5kbGVyX3QgaGFuZGxlcikKPiAgewo+ICAgICAgICAgc3RydWN0IGt2bSAqa3ZtID0gbW11
X25vdGlmaWVyX3RvX2t2bShtbik7Cj4gLSAgICAgICBjb25zdCBzdHJ1Y3Qga3ZtX2h2YV9yYW5n
ZSByYW5nZSA9IHsKPiArICAgICAgIGNvbnN0IHN0cnVjdCBrdm1fbW11X25vdGlmaWVyX3Jhbmdl
IHJhbmdlID0gewo+ICAgICAgICAgICAgICAgICAuc3RhcnQgICAgICAgICAgPSBzdGFydCwKPiAg
ICAgICAgICAgICAgICAgLmVuZCAgICAgICAgICAgID0gZW5kLAo+ICAgICAgICAgICAgICAgICAu
YXJnICAgICAgICAgICAgPSBhcmcsCj4gQEAgLTY4MCwxMCArNjg0LDEwIEBAIHN0YXRpYyBfX2Fs
d2F5c19pbmxpbmUgaW50IGt2bV9oYW5kbGVfaHZhX3JhbmdlKHN0cnVjdCBtbXVfbm90aWZpZXIg
Km1uLAo+ICBzdGF0aWMgX19hbHdheXNfaW5saW5lIGludCBrdm1faGFuZGxlX2h2YV9yYW5nZV9u
b19mbHVzaChzdHJ1Y3QgbW11X25vdGlmaWVyICptbiwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0LAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGxvbmcgZW5kLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGh2YV9oYW5kbGVyX3QgaGFuZGxlcikKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnZm5faGFuZGxl
cl90IGhhbmRsZXIpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBrdm0gKmt2bSA9IG1tdV9ub3RpZmll
cl90b19rdm0obW4pOwo+IC0gICAgICAgY29uc3Qgc3RydWN0IGt2bV9odmFfcmFuZ2UgcmFuZ2Ug
PSB7Cj4gKyAgICAgICBjb25zdCBzdHJ1Y3Qga3ZtX21tdV9ub3RpZmllcl9yYW5nZSByYW5nZSA9
IHsKPiAgICAgICAgICAgICAgICAgLnN0YXJ0ICAgICAgICAgID0gc3RhcnQsCj4gICAgICAgICAg
ICAgICAgIC5lbmQgICAgICAgICAgICA9IGVuZCwKPiAgICAgICAgICAgICAgICAgLmhhbmRsZXIg
ICAgICAgID0gaGFuZGxlciwKPiBAQCAtNzcxLDcgKzc3NSw3IEBAIHN0YXRpYyBpbnQga3ZtX21t
dV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KHN0cnVjdCBtbXVfbm90aWZpZXIgKm1u
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qg
bW11X25vdGlmaWVyX3JhbmdlICpyYW5nZSkKPiAgewo+ICAgICAgICAgc3RydWN0IGt2bSAqa3Zt
ID0gbW11X25vdGlmaWVyX3RvX2t2bShtbik7Cj4gLSAgICAgICBjb25zdCBzdHJ1Y3Qga3ZtX2h2
YV9yYW5nZSBodmFfcmFuZ2UgPSB7Cj4gKyAgICAgICBjb25zdCBzdHJ1Y3Qga3ZtX21tdV9ub3Rp
Zmllcl9yYW5nZSBodmFfcmFuZ2UgPSB7Cj4gICAgICAgICAgICAgICAgIC5zdGFydCAgICAgICAg
ICA9IHJhbmdlLT5zdGFydCwKPiAgICAgICAgICAgICAgICAgLmVuZCAgICAgICAgICAgID0gcmFu
Z2UtPmVuZCwKPiAgICAgICAgICAgICAgICAgLmhhbmRsZXIgICAgICAgID0ga3ZtX3VubWFwX2dm
bl9yYW5nZSwKPiBAQCAtODM1LDcgKzgzOSw3IEBAIHN0YXRpYyB2b2lkIGt2bV9tbXVfbm90aWZp
ZXJfaW52YWxpZGF0ZV9yYW5nZV9lbmQoc3RydWN0IG1tdV9ub3RpZmllciAqbW4sCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBtbXVfbm90aWZp
ZXJfcmFuZ2UgKnJhbmdlKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qga3ZtICprdm0gPSBtbXVfbm90
aWZpZXJfdG9fa3ZtKG1uKTsKPiAtICAgICAgIGNvbnN0IHN0cnVjdCBrdm1faHZhX3JhbmdlIGh2
YV9yYW5nZSA9IHsKPiArICAgICAgIGNvbnN0IHN0cnVjdCBrdm1fbW11X25vdGlmaWVyX3Jhbmdl
IGh2YV9yYW5nZSA9IHsKPiAgICAgICAgICAgICAgICAgLnN0YXJ0ICAgICAgICAgID0gcmFuZ2Ut
PnN0YXJ0LAo+ICAgICAgICAgICAgICAgICAuZW5kICAgICAgICAgICAgPSByYW5nZS0+ZW5kLAo+
ICAgICAgICAgICAgICAgICAuaGFuZGxlciAgICAgICAgPSAodm9pZCAqKWt2bV9udWxsX2ZuLAo+
IC0tCj4gMi40Mi4wLjgyMC5nODNhNzIxYTEzNy1nb29nCj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
