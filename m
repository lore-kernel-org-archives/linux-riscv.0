Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAE6C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 14:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gSykqKlJTH4QA8wDjLv/87NjgFVl8lfN/ltz/LFd2KM=; b=jiMusm5WycDNFbRvVSwfIzmzVH
	YOPOBKcx0jiad2nZ0WqkzQXmBJGJYP52quyL9Ogx0Nd3vbxPyoQOoCODf2RQwKJgk5oo0BxADYbSY
	d1YygMcJFegiOT1+0Bgp76YUOaFVUWSRm0hpFqebG/gBaukYBclyu5vHfYjSZhRLDyohAL39XqghP
	5KT32C9cSZdYnD+Nvhv8esd0v0WDDMaerAtdZ02xGEWD9DQ/gSpUdcQ54NrnJvGliZpPUYWevZIvj
	4e0IeHkVfAzsH/zEBiymPor6h1oG7I6/a+a32v/jWvwY3rn1dZ0+hukcaWRpKLFnyIaEjsnae1qWX
	Jy3wANxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZX24-00000005ibg-3bEM;
	Thu, 01 Aug 2024 14:43:56 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZX1Q-00000005iLs-4BVK
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 14:43:19 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e0b7922ed63so8248285276.0
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 07:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722523395; x=1723128195; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9BUCK9RfTKafiexBRvCEwFw2qC43V57hNjDHfumiy08=;
        b=p2r4NHfEScjvQchoa2mImy38578qnAnTkRie2NFrp4TJ59sQwQqvESudFKoBLC1WkF
         1xPybnXn9eDFNeCA/sz/yyECcMQYTeLdPFumful8PbGB4D1eQEfUMbsHZeRcN0hZEAmz
         0O4BdVx13E5+14uhnK00gYOqt2FmQEaiV6ZaBAmRrQkTZDrYitjRvTPWs7CWFfy1uTXq
         np4gqeMlIzRo1V1hIDwo/upjfAI1WzaufSC7YcGZbIIJrnpRCvojvJiEZWydfkmWpWwZ
         R6UahbV+Bw8xJuT3zKfN/0a089OzSoCwbcOl9Gf3FNzsZFZmapI2yYkR5+7CCZHyk04A
         Wl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722523395; x=1723128195;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9BUCK9RfTKafiexBRvCEwFw2qC43V57hNjDHfumiy08=;
        b=vplbBatOzjR+6JWfYTlDwAKhZtMspqfBb7kQdSrrZX3z0bUuKCj5k5QpBeVGUB0a5X
         RWbDN/1F2tGQeGIGS0V6RsGhHbYQduyCm9KuRrK/IXo5t/ICtiRvUkU8m5+/XPC4Fhgp
         mZONeSmUtPtrI3yqCkOD7+QmXFHjofppY8U4f9/vf61oY0/OPwXD+JlbcvD/RhZFimYN
         dt993NbYNMy52LEmvZc4Jbfc/cHCC8IrOXvMoza4lUJK4BsYPE+gbho2gokPccJzlz34
         VjfVk/C2qMKdGd8FT6C3VgyYqQv7SnrAlyb62vZu8NHuB2jkXtbuKDN3Lv9jO7ECv7EP
         r68w==
X-Forwarded-Encrypted: i=1; AJvYcCWT7rlaqtTYdAS4ALGfcjeP0GLPqhAlWOGgMIhsF97GL9NHty8UqXxF5oXU4smpBLhPeElusdg70f99ZmWWFZLx3bp5XlMrKjB+zTIl8zK9
X-Gm-Message-State: AOJu0YyDK//GtrVUYVZmfEDQltgjOupSawvghd3ZiC+PIHxQrRR7AMzK
	DXRUhkbNL3AvBC8sR/M7I70v639VxNF7H7TMDCTtwmjQHGAsSgy7FhEMabyflQpjM6TPRz5E2XY
	Zug==
X-Google-Smtp-Source: AGHT+IHkE7Ce/eHqXIIWUhOrz6iZ7wUAM+0kNmbjyrQoG1wEe6+vtvmxZ2gwjb9N0RAQKGaJuDaT2daG0VE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1104:b0:e0b:b6f3:85 with SMTP id
 3f1490d57ef6-e0bde2f0105mr658276.2.1722523394843; Thu, 01 Aug 2024 07:43:14
 -0700 (PDT)
Date: Thu, 1 Aug 2024 07:43:13 -0700
In-Reply-To: <87wml0egzo.fsf@draig.linaro.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-6-seanjc@google.com>
 <87wml0egzo.fsf@draig.linaro.org>
Message-ID: <ZqufAYyVOa9M1z76@google.com>
Subject: Re: [PATCH v12 05/84] KVM: Add kvm_release_page_unused() API to put
 pages that KVM never consumes
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
X-CRM114-CacheID: sfid-20240801_074317_056901_E7607EC6 
X-CRM114-Status: GOOD (  23.50  )
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

T24gVGh1LCBBdWcgMDEsIDIwMjQsIEFsZXggQmVubsOpZSB3cm90ZToKPiBTZWFuIENocmlzdG9w
aGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4gd3JpdGVzOgo+IAo+ID4gQWRkIGFuIEFQSSB0byBy
ZWxlYXNlIGFuIHVudXNlZCBwYWdlLCBpLmUuIHRvIHB1dCBhIHBhZ2Ugd2l0aG91dCBtYXJraW5n
Cj4gPiBpdCBhY2Nlc3NlZCBvciBkaXJ0eS4gIFRoZSBBUEkgd2lsbCBiZSB1c2VkIHdoZW4gS1ZN
IGZhdWx0cy1pbiBhIHBhZ2UgYnV0Cj4gPiBiYWlscyBiZWZvcmUgaW5zdGFsbGluZyB0aGUgZ3Vl
c3QgbWFwcGluZyAoYW5kIG90aGVyIHNpbWlsYXIgZmxvd3MpLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgo+ID4gLS0tCj4gPiAg
aW5jbHVkZS9saW51eC9rdm1faG9zdC5oIHwgOSArKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva3Zt
X2hvc3QuaCBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAo+ID4gaW5kZXggM2Q5NjE3ZDFkZTQx
Li5jNWQzOWEzMzdhYTMgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgK
PiA+ICsrKyBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAo+ID4gQEAgLTEyMDEsNiArMTIwMSwx
NSBAQCB1bnNpZ25lZCBsb25nIGdmbl90b19odmFfcHJvdChzdHJ1Y3Qga3ZtICprdm0sIGdmbl90
IGdmbiwgYm9vbCAqd3JpdGFibGUpOwo+ID4gIHVuc2lnbmVkIGxvbmcgZ2ZuX3RvX2h2YV9tZW1z
bG90KHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3QsIGdmbl90IGdmbik7Cj4gPiAgdW5zaWdu
ZWQgbG9uZyBnZm5fdG9faHZhX21lbXNsb3RfcHJvdChzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpz
bG90LCBnZm5fdCBnZm4sCj4gPiAgCQkJCSAgICAgIGJvb2wgKndyaXRhYmxlKTsKPiA+ICsKPiA+
ICtzdGF0aWMgaW5saW5lIHZvaWQga3ZtX3JlbGVhc2VfcGFnZV91bnVzZWQoc3RydWN0IHBhZ2Ug
KnBhZ2UpCj4gPiArewo+ID4gKwlpZiAoIXBhZ2UpCj4gPiArCQlyZXR1cm47Cj4gPiArCj4gPiAr
CXB1dF9wYWdlKHBhZ2UpOwo+ID4gK30KPiAKPiBJIGd1ZXNzIGl0J3MgdW5mYW1pbGlhcml0eSB3
aXRoIHRoZSBtbSBsYXlvdXQgYnV0IEkgd2FzIHRyeWluZyB0byBmaW5kCj4gd2hlcmUgdGhlIGdl
dF9wYWdlcyBjb21lIGZyb20gdG8gc2VlIHRoZSBmdWxsIHBhdHRlcm4gb2YgYWxsb2NhdGUgYW5k
Cj4gcmV0dXJuLiBJIGd1ZXNzIHNvbWV3aGVyZSBpbiB0aGUgZGVwdGhzIG9mIGh2YV90b19wZm4o
KSBmcm9tCj4gaHZhX3RvX3Bmbl9yZXRyeSgpPwoKSWYgc3VjY2Vzc2Z1bCwgZ2V0X3VzZXJfcGFn
ZV9mYXN0X29ubHkoKSBhbmQgZ2V0X3VzZXJfcGFnZXNfdW5sb2NrZWQoKSBncmFiIGEKcmVmZXJl
bmNlIG9uIGJlaGFsZiBvZiB0aGUgY2FsbGVyLgoKQXMgb2YgdGhpcyBwYXRjaCwgaHZhX3RvX3Bm
bl9yZW1hcHBlZCgpIGFsc28gZ3JhYnMgYSByZWZlcmVuY2UgdG8gcGFnZXMgdGhhdAphcHBlYXIg
dG8gYmUgcmVmY291bnRlZCwgd2hpY2ggaXMgdGhlIHVuZGVybHlpbmcgd2FydCB0aGlzIHNlcmll
cyBhaW1zIHRvIGZpeC4KSW4gS1ZNJ3MgZWFybHkgZGF5cywgaXQgX29ubHlfIHN1cHBvcnRlZCBH
VVAsIGkuZS4gaWYgS1ZNIGdvdCBhIHBmbiwgdGhhdCBwZm4Kd2FzIChhKSBiYWNrZWQgYnkgc3Ry
dWN0IHBhZ2UgYW5kIChiKSBLVk0gaGFkIGEgcmVmZXJlbmNlIHRvIHNhaWQgcGFnZS4gIFRoYXQK
bGVkIHRvIHRoZSBjdXJyZW50IG1lc3MsIGFzIEtWTSBkaWRuJ3QgZ2V0IHJld29ya2VkIHRvIHBy
b3Blcmx5IHRyYWNrIHBhZ2VzIHZzLgpwZm5zIHdoZW4gc3VwcG9ydCBmb3IgVk1fTUlYRURNQVAg
d2FzIGFkZGVkLgoKCS8qCgkgKiBHZXQgYSByZWZlcmVuY2UgaGVyZSBiZWNhdXNlIGNhbGxlcnMg
b2YgKmh2YV90b19wZm4qIGFuZAoJICogKmdmbl90b19wZm4qIHVsdGltYXRlbHkgY2FsbCBrdm1f
cmVsZWFzZV9wZm5fY2xlYW4gb24gdGhlCgkgKiByZXR1cm5lZCBwZm4uICBUaGlzIGlzIG9ubHkg
bmVlZGVkIGlmIHRoZSBWTUEgaGFzIFZNX01JWEVETUFQCgkgKiBzZXQsIGJ1dCB0aGUga3ZtX3Ry
eV9nZXRfcGZuL2t2bV9yZWxlYXNlX3Bmbl9jbGVhbiBwYWlyIHdpbGwKCSAqIHNpbXBseSBkbyBu
b3RoaW5nIGZvciByZXNlcnZlZCBwZm5zLgoJICoKCSAqIFdob2V2ZXIgY2FsbGVkIHJlbWFwX3Bm
bl9yYW5nZSBpcyBhbHNvIGdvaW5nIHRvIGNhbGwgZS5nLgoJICogdW5tYXBfbWFwcGluZ19yYW5n
ZSBiZWZvcmUgdGhlIHVuZGVybHlpbmcgcGFnZXMgYXJlIGZyZWVkLAoJICogY2F1c2luZyBhIGNh
bGwgdG8gb3VyIE1NVSBub3RpZmllci4KCSAqCgkgKiBDZXJ0YWluIElPIG9yIFBGTk1BUCBtYXBw
aW5ncyBjYW4gYmUgYmFja2VkIHdpdGggdmFsaWQKCSAqIHN0cnVjdCBwYWdlcywgYnV0IGJlIGFs
bG9jYXRlZCB3aXRob3V0IHJlZmNvdW50aW5nIGUuZy4sCgkgKiB0YWlsIHBhZ2VzIG9mIG5vbi1j
b21wb3VuZCBoaWdoZXIgb3JkZXIgYWxsb2NhdGlvbnMsIHdoaWNoCgkgKiB3b3VsZCB0aGVuIHVu
ZGVyZmxvdyB0aGUgcmVmY291bnQgd2hlbiB0aGUgY2FsbGVyIGRvZXMgdGhlCgkgKiByZXF1aXJl
ZCBwdXRfcGFnZS4gRG9uJ3QgYWxsb3cgdGhvc2UgcGFnZXMgaGVyZS4KCSAqLwoJaWYgKCFrdm1f
dHJ5X2dldF9wZm4ocGZuKSkKCQlyID0gLUVGQVVMVDsKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
