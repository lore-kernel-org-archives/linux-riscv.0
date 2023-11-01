Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4566C0018A
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 12:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/6dfMLVGRpc78ZYoVmRONu0dXFmLKtfltxEO+Vd//k=; b=a4q/jkTxxhPRnI
	gCJ6yXSR8btHbKEC2AgOoE4tNOC6USrKsB9xliWaBZz1cdNhXpYmCJof7AzaLRQlszkxszbuaEA8b
	R6Q9m3KJ4tOg3PuDUPDyT5cROUzJ0poGiHQpY6SAsvU1pWdfAJaXCDjSDAnQH1773UvvrCBBnLAcq
	Jq3jXTlk91KL9jNdqEb3tb9MHgZr5zJ2m+ThZSRsh7oi2jhpIcjT9FZ+jlej5LgjKwfc8MM8aYNp1
	aMFriXav3MFm+pPIXpS1CJGKuwvyOzgUpRgPJGeUWBu1FmuiR5tUEYScfjzDvLHuNGMaQkryvBuHl
	AEG9zOwFXDAT5NXDTTLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyAhT-007X0w-1M;
	Wed, 01 Nov 2023 12:51:59 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyAhR-007Wzg-11
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 12:51:58 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-49dd3bb5348so2769733e0c.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 05:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698843115; x=1699447915; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3o84LhG/JDs4XT09LqOqAL557WR+kTbV5Toac0tgZE=;
        b=kb7VlMFYxatVVZY/+Dd6tfyqQPyrFQaTeDNSsInJMz0yQFvNnVXS+hCzXVJPg+glW+
         6zcP2PhXpCVtc28QG0lNjgRpMRsGRfzLf/CCSFjozlQK4xZsV1D8wq8I7wDi6+GPcRDS
         ILbgZTMWwZPIb3vehafzbj2+zCT6W4yjb3ABoiE4R3cNajvXBfSpLEabkUaQ5Aw/aJep
         HtI6Gv0yqmkomFcyv2AharlNgS0IGH/CaK1HbBC0pzpRIHyxqU819IWA7JkesfsrCuRs
         UMrhYqBsRjslIzrBFOXmc3pyYzK/SByYK607L5PbBnhPRMh9C3Bcm9TFgVNuD9FJOftE
         3dRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698843115; x=1699447915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3o84LhG/JDs4XT09LqOqAL557WR+kTbV5Toac0tgZE=;
        b=Sfyd5fx3UjZDFppD9vlk6Rnm+zngdeYAXrXujB7VeCGW1fWUz5MSS4eYR7TK23xWMz
         +UsGrHIxrWVPE8xG4eY+y/w8oKUZ1lV9IOQu/79N+Qs1iU+2U2j77p00AIOQlTVPCqZl
         ZxdiYxHVIFGJ+jgqe/+IQUvEmwcBxsJckB4B0TUr/Ni6DqGLS598y6Ykfef/yUmL6e37
         ey3kUWDgR5PpfgXgEKwYVgNwfRrdSJI47Fwc5LRHJa8Rfczz0ja61jIgMcLKJj2OmZZw
         0c0COlvobMZnvObw0ayFyJKIFaWXrjZj+Jmmdys1Q411dIfBhsqSLLHCy3mM7ERZCc+r
         oCaQ==
X-Gm-Message-State: AOJu0YxLC2fDcJzV6cg2/7ISvSH71Ylb04EUsnnuuBtXrA3qCPZCsuTJ
	P7Dz1tfpMzBUcMfrg4vICGhndjrKk+jpKMacEe03tg==
X-Google-Smtp-Source: AGHT+IF0GS509bXC109Q/KsllvKKbuNv6izlI+nfo857C1iROxiLKrI4wNuuGIZxmkDtH9Saf2Z2BbskHZJDaldFC6s=
X-Received: by 2002:a1f:9b13:0:b0:4a1:7278:3bf5 with SMTP id
 d19-20020a1f9b13000000b004a172783bf5mr13903007vke.4.1698843115068; Wed, 01
 Nov 2023 05:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-6-seanjc@google.com>
In-Reply-To: <20231027182217.3615211-6-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 1 Nov 2023 12:51:19 +0000
Message-ID: <CA+EHjTxq9zBY02bqsThV5+afLY1mGXyfs+X1yiKL0kM8SSz_Ug@mail.gmail.com>
Subject: Re: [PATCH v13 05/35] KVM: PPC: Drop dead code related to KVM_ARCH_WANT_MMU_NOTIFIER
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
X-CRM114-CacheID: sfid-20231101_055157_357287_27970171 
X-CRM114-Status: GOOD (  17.28  )
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
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IEFzc2VydCB0aGF0IGJvdGggS1ZNX0FSQ0hfV0FO
VF9NTVVfTk9USUZJRVIgYW5kIENPTkZJR19NTVVfTk9USUZJRVIgYXJlCj4gZGVmaW5lZCB3aGVu
IEtWTSBpcyBlbmFibGVkLCBhbmQgcmV0dXJuICcxJyB1bmNvbmRpdGlvbmFsbHkgZm9yIHRoZQo+
IENPTkZJR19LVk1fQk9PSzNTX0hWX1BPU1NJQkxFPW4gcGF0aC4gIEFsbCBmbGF2b3JzIG9mIFBQ
QyBzdXBwb3J0IGZvciBLVk0KPiBzZWxlY3QgTU1VX05PVElGSUVSLCBhbmQgS1ZNX0FSQ0hfV0FO
VF9NTVVfTk9USUZJRVIgaXMgdW5jb25kaXRpb25hbGx5Cj4gZGVmaW5lZCBieSBhcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20va3ZtX2hvc3QuaC4KPgo+IEVmZmVjdGl2ZWx5IGRyb3BwaW5nIHVzZSBv
ZiBLVk1fQVJDSF9XQU5UX01NVV9OT1RJRklFUiB3aWxsIHNpbXBsaWZ5IGEKPiBmdXR1cmUgY2xl
YW51cCB0byB0dXJuIEtWTV9BUkNIX1dBTlRfTU1VX05PVElGSUVSIGludG8gYSBLY29uZmlnLCBp
LmUuCj4gd2lsbCBhbGxvdyBjb21iaW5pbmcgYWxsIG9mIHRoZQo+Cj4gICAjaWYgZGVmaW5lZChD
T05GSUdfTU1VX05PVElGSUVSKSAmJiBkZWZpbmVkKEtWTV9BUkNIX1dBTlRfTU1VX05PVElGSUVS
KQo+Cj4gY2hlY2tzIGludG8gYSBzaW5nbGUKPgo+ICAgI2lmZGVmIENPTkZJR19LVk1fR0VORVJJ
Q19NTVVfTk9USUZJRVIKPgo+IHdpdGhvdXQgaGF2aW5nIHRvIHdvcnJ5IGFib3V0IFBQQydzICJi
YXJlIiB1c2FnZSBvZgo+IEtWTV9BUkNIX1dBTlRfTU1VX05PVElGSUVSLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Cj4gLS0tCgpSZXZp
ZXdlZC1ieTogRnVhZCBUYWJiYSA8dGFiYmFAZ29vZ2xlLmNvbT4KCkNoZWVycywKL2Z1YWQKCj4g
IGFyY2gvcG93ZXJwYy9rdm0vcG93ZXJwYy5jIHwgNyArKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9w
b3dlcnBjL2t2bS9wb3dlcnBjLmMgYi9hcmNoL3Bvd2VycGMva3ZtL3Bvd2VycGMuYwo+IGluZGV4
IDcxOTdjODI1NjY2OC4uYjBhNTEyZWRlNzY0IDEwMDY0NAo+IC0tLSBhL2FyY2gvcG93ZXJwYy9r
dm0vcG93ZXJwYy5jCj4gKysrIGIvYXJjaC9wb3dlcnBjL2t2bS9wb3dlcnBjLmMKPiBAQCAtNjMy
LDEyICs2MzIsMTMgQEAgaW50IGt2bV92bV9pb2N0bF9jaGVja19leHRlbnNpb24oc3RydWN0IGt2
bSAqa3ZtLCBsb25nIGV4dCkKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICNlbmRpZgo+ICAg
ICAgICAgY2FzZSBLVk1fQ0FQX1NZTkNfTU1VOgo+ICsjaWYgIWRlZmluZWQoQ09ORklHX01NVV9O
T1RJRklFUikgfHwgIWRlZmluZWQoS1ZNX0FSQ0hfV0FOVF9NTVVfTk9USUZJRVIpCj4gKyAgICAg
ICAgICAgICAgIEJVSUxEX0JVRygpOwo+ICsjZW5kaWYKPiAgI2lmZGVmIENPTkZJR19LVk1fQk9P
SzNTX0hWX1BPU1NJQkxFCj4gICAgICAgICAgICAgICAgIHIgPSBodl9lbmFibGVkOwo+IC0jZWxp
ZiBkZWZpbmVkKEtWTV9BUkNIX1dBTlRfTU1VX05PVElGSUVSKQo+IC0gICAgICAgICAgICAgICBy
ID0gMTsKPiAgI2Vsc2UKPiAtICAgICAgICAgICAgICAgciA9IDA7Cj4gKyAgICAgICAgICAgICAg
IHIgPSAxOwo+ICAjZW5kaWYKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICNpZmRlZiBDT05G
SUdfS1ZNX0JPT0szU19IVl9QT1NTSUJMRQo+IC0tCj4gMi40Mi4wLjgyMC5nODNhNzIxYTEzNy1n
b29nCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
