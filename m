Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA052C3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 20:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YtSGqVfbRQcxAeGRNeLFo2gfReFJ1wYQjk8bw7TDmYg=; b=f95ocdBpDJShCCRAhhHUizQ89v
	cOZ9TKW35h9tyTHBjsw7c8alJYJj3sRYqPSfLAcqUEjJ01DymUFVPhaMJYPBSMMHAapmYIpdDkJcy
	MDOxH/UvZF2feg77kmG3LYAHn8+ujn7cqomOeVBwEQDnmgZrnTvcWLjeFytKTBzsrhhUcIjUsb6G+
	Mr4D0zvkXCLzm4FGvKtwnyg21zx1knT7Guud9BZbjrdHGAJGxcVy0/GVwDxAWuWmq7qwtKl/XxhZ+
	JsGj5xy5WFm1BZtu+k0nKz31GLEdjHWqAzbjBoPiJ+D3YvokwpBr8g+vt+4Ud3pvUpg7GkiS9LO10
	qlnq9oFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZG3k-00000002TF9-0tsY;
	Wed, 31 Jul 2024 20:36:32 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZG3g-00000002TDn-2Mb5
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 20:36:30 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e0bcd04741fso172439276.2
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 13:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722458186; x=1723062986; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kd/mYHbPzOSIwsUM5m5UMPqJkKyWoklOLcVSOqbILGs=;
        b=gLFhZvKzhuC7jLD0Nm8gx1QWe7heoXLaGvRTR/j/wCY8+QtpqyYOjR8USq1pkjM626
         Bgmhl3mAOvA2HFv1M5W+9lp59AKj1h8Q1VvAomgzaHXYA30pwo8TAQ5ewzcH3ge24dRm
         TJCPMaR1ck9siWrTjzZdREsoBq1WR50sh8V/TsfVp6gA8n3mOO3XALiUa4cW5L7S3ic3
         UNg5jfYS2C4PbxqEYzD8d5uCWK5Hh7KKQ1DGFrUMwI5WlxzJ6SthjrcWnUzaa6+q1bvp
         OMg5S+/cAjuNTYUuDnmbnA0AcP7JPcb6ka9Shqb7oXVukTArK/08AkWKVEj+b+gPNi/C
         wJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722458186; x=1723062986;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Kd/mYHbPzOSIwsUM5m5UMPqJkKyWoklOLcVSOqbILGs=;
        b=heP9ElRNWY8pm8Hy5qmKp0hCKyzheY21K7aQddhBkg+v0lEUMRuhqVod9WPPrrJ0ru
         Dc2z1qRyFxS07LkCDyoKqWc/8O+deYbmFx+bSpmQRrt/qxM3JZ7Ad01yz7Xrt0eFx1Zz
         FGYqFpoo/uXJ2hjBi34nh+yaGG4uDXyV1QvSsBYZWlbtH/2NDYQrYFsIot81Fpg2MP/v
         GMFMFCwzPELWiZSe0nKQpSaPGkx0n7HtsARFi9f2E+aPDPU/7u2rFILXtihFEIz7J/RZ
         q/WtQ9BGK6CjNoO4jJh4HheewzMEatGXVKTqtvYwRhrssiIB26sfUXq1sfNivCRznBcZ
         yTqw==
X-Forwarded-Encrypted: i=1; AJvYcCXnav9gjEk50OcZBBQGX/+u5QyYsSsBZRwhUppNqZQr4srmpS+YbdihBT7jN9nKjYI4XpKRVZ2sZcyzDXOuj/tIvQHudJKv8at1zVMk4Fna
X-Gm-Message-State: AOJu0Yy5bYUfNXfkPai/h0dku+6bubgHwWzqy0yQkldQ32YjL3fXW+e7
	NAVBJ12lcBAAZeJU31HApUuh6A0qUjba9R1Zou2oQFB2Ep6TkZ7Tf5A2colC1wpQALHUZH3OeyY
	D0Q==
X-Google-Smtp-Source: AGHT+IH0DRpeCdEjd5+EVXte2iiNPB7q7dTvECq86U0Z8nMo4fguKYduL9RXt42ZsXAM2SH8mq6gA4JZJ0k=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:18d2:b0:e0b:bf20:4ff8 with SMTP id
 3f1490d57ef6-e0bccf7b434mr932276.0.1722458186501; Wed, 31 Jul 2024 13:36:26
 -0700 (PDT)
Date: Wed, 31 Jul 2024 13:36:25 -0700
In-Reply-To: <87a5hxfs3d.fsf@draig.linaro.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-2-seanjc@google.com>
 <87a5hxfs3d.fsf@draig.linaro.org>
Message-ID: <ZqqgSW1Z07aBGwQh@google.com>
Subject: Re: [PATCH v12 01/84] KVM: arm64: Release pfn, i.e. put page, if
 copying MTE tags hits ZONE_DEVICE
From: Sean Christopherson <seanjc@google.com>
To: "Alex =?utf-8?Q?Benn=C3=A9e?=" <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_133628_629598_65415DD2 
X-CRM114-Status: GOOD (  17.32  )
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

T24gV2VkLCBKdWwgMzEsIDIwMjQsIEFsZXggQmVubsOpZSB3cm90ZToKPiBTZWFuIENocmlzdG9w
aGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4gd3JpdGVzOgo+IAo+ID4gUHV0IHRoZSBwYWdlIHJl
ZmVyZW5jZSBhY3F1aXJlZCBieSBnZm5fdG9fcGZuX3Byb3QoKSBpZgo+ID4ga3ZtX3ZtX2lvY3Rs
X210ZV9jb3B5X3RhZ3MoKSBydW5zIGludG8gWk9ORV9ERVZJQ0UgbWVtb3J5LiAgS1ZNJ3MgbGVz
cy0KPiA+IHRoYW4tc3RlbGxhciBoZXVyaXN0aWNzIGZvciBkZWFsaW5nIHdpdGggcGZuLW1hcHBl
ZCBtZW1vcnkgbWVhbnMgdGhhdCBLVk0KPiA+IGNhbiBnZXQgYSBwYWdlIHJlZmVyZW5jZSB0byBa
T05FX0RFVklDRSBtZW1vcnkuCj4gPgo+ID4gRml4ZXM6IGYwMzc2ZWRiMWRkYyAoIktWTTogYXJt
NjQ6IEFkZCBpb2N0bCB0byBmZXRjaC9zdG9yZSB0YWdzIGluIGEgZ3Vlc3QiKQo+ID4gU2lnbmVk
LW9mZi1ieTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Cj4gPiAtLS0K
PiA+ICBhcmNoL2FybTY0L2t2bS9ndWVzdC5jIHwgMSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva3ZtL2d1ZXN0LmMg
Yi9hcmNoL2FybTY0L2t2bS9ndWVzdC5jCj4gPiBpbmRleCAxMTA5OGViN2ViNDQuLmUxZjBmZjA4
ODM2YSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvYXJtNjQva3ZtL2d1ZXN0LmMKPiA+ICsrKyBiL2Fy
Y2gvYXJtNjQva3ZtL2d1ZXN0LmMKPiA+IEBAIC0xMDU5LDYgKzEwNTksNyBAQCBpbnQga3ZtX3Zt
X2lvY3RsX210ZV9jb3B5X3RhZ3Moc3RydWN0IGt2bSAqa3ZtLAo+ID4gIAkJcGFnZSA9IHBmbl90
b19vbmxpbmVfcGFnZShwZm4pOwo+ID4gIAkJaWYgKCFwYWdlKSB7Cj4gPiAgCQkJLyogUmVqZWN0
IFpPTkVfREVWSUNFIG1lbW9yeSAqLwo+ID4gKwkJCWt2bV9yZWxlYXNlX3Bmbl9jbGVhbihwZm4p
Owo+IAo+IEkgZ3Vlc3MgdGhpcyBnZXRzIHJlbmFtZWQgbGF0ZXIgaW4gdGhlIHNlcmllcy4KPiAK
PiBIb3dldmVyIG15IG1haW4gY29tbWVudCBpcyBkb2VzIGxhY2sgb2YgcGFnZSBhbHdheXMgbWVh
biBhIFpPTkVfREVWSUNFPwoKTm9wZS4KCj4gTG9va2luZyBhdCBwZm5fdG9fb25saW5lX3BhZ2Uo
KSBJIHNlZSBhIGJ1bmNoIG9mIG90aGVyIGNoZWNrcyBmaXJzdC4gV2h5Cj4gaXNuJ3QgaXQgdGhh
dCBmdW5jdGlvbnMgcmVzcG9uc2liaWxpdHkgdG8gY2xlYW4gdXAgYWZ0ZXIgaXRzZWxmIGlmIGl0
cwo+IHJldHVybmluZyBOVUxMcz8KCnBmbl90b19vbmxpbmVfcGFnZSgpIGlzIG1vcmUgc3RyaWN0
IHRoYW4gZ2ZuX3RvX3Bmbl9wcm90KCkuICBBdCBsZWFzdCBpbiB0aGVvcnksCmdmbl90b19wZm5f
cHJvdCgpIGNvdWxkIHJldHVybiBhIHBmbiB0aGF0IGhhcyBhbiBhc3NvY2lhdGVkICJzdHJ1Y3Qg
cGFnZSIsIHdpdGgKYSByZWZlcmVuY2UgaGVsZCB0byBzYWlkIHBhZ2UuICBCdXQgZm9yIHRoYXQg
c2FtZSBwZm4sIHBmbl90b19vbmxpbmVfcGFnZSgpIGNvdWxkCnJldHVybiBOVUxMLCBpbiB3aGlj
aCBjYXNlIEtWTSBuZWVkcyB0byBwdXQgdGhlIHJlZmVyZW5jZSBpdCBhY3F1aXJlZCB2aWEKZ2Zu
X3RvX3Bmbl9wcm90KCkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
