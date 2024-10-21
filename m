Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5E6D17123
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 18:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5/MViTFqsRR4sQGnv3cNbDwsfOuyH4/ISWFSutkQees=; b=MAIQTJgKv2uIWtOnHhKUCwaI1i
	jo4RGErKTYg26B3Wk+OJYbf2CZ2gqeaAfMsodMLlrW8bxtUWhpjK29x6a6N7Tna8dnUw7HKrdM9Fp
	UudEjXifjWfTD3UZo0vMMefyMG+OrQh0ruN8ByVx2m5IVGxwKCc1htYf5Ly9TXEK+Pj2QfTVqGjJk
	ODZGPsBUFO5oQ947MdBWuzns3eQ22twKQhVbgLtCUPA9zy9ZtALNo3zpZZ+tHENEfXprhJue5PTLj
	KBTHUZhFSP5lcXTT8YEQREGStCy90nvYx0DjAjcExdZASQkwA6azebogwW/zeWOuGr9js1YSS0Kdi
	EhqF+fTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2wuE-00000008Gko-3d71;
	Mon, 21 Oct 2024 18:13:26 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2wu0-00000008Gdm-0kX6
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 18:13:13 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e293b3e014aso7393659276.3
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 11:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729534389; x=1730139189; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/aTJKIPGdXYIQ4z1/mPhLVqGYb++KmSjcoFUbuTd6EE=;
        b=sw7MSl85+W5LK+7+b72UkvuMVSIusI/hlAZzwX9bNBTcWWoptBVZ4rKy7+wKM/zUjs
         waY1nTWD1bwYMEZ1Q88ORnu1TS0RWaSRc/NSrUH+813OdDeVk3wO3X0bbtS0vG9zw0CL
         OCY2grFSUFy+Gho5qfzJitCKrfrp0coG7fi6jT6fldCEcilBfe8yQbZuENOlXKr8FriL
         m0/Y3tI+SeFYIc6NtcAML3dASt4qnoV9SATbrds/3TXRMI9dK8YGABELvTeFw5Eju1+U
         JZzw6FouC/MVUIEU5DgooNF3qPxU7kKllP6a7h9k28PFocbmObe8FV3K71BZ/BXaYgtF
         vfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729534390; x=1730139190;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/aTJKIPGdXYIQ4z1/mPhLVqGYb++KmSjcoFUbuTd6EE=;
        b=xRQlIC8upXrcWT0hwD+fs7YEh2TSk8jXy3l7hy6qJC/BM17XCTnZF/usv50orcn0Qp
         I8f1rD8/LzNMp9wPEO8FEMxWocIpFrALaQyZOPj0xdNHA5HC6kaVpYsw4MFVfJxwS+IP
         zepg49UkghjrPjpL4A65YxIe20Z3GUj1iRJOO8vHk+4P1fmIUsE/jx0/QCYeOCtLOgAZ
         ymZVCYkABFXtipQjFyBNi4tdtbgyrrnLF2K1vUn2liGbTi5TuYgGWY/mNlnuN6pIlzOj
         4JnWid+eRfuadOZn1VfMMjpTDufL23SYcabVKpNML7fLfL3QxL6y/rBjAWYIeir9yqxx
         sykA==
X-Forwarded-Encrypted: i=1; AJvYcCUwSxueQz5mjrOqAfpuKQuAZSaTusX8iCqd9GI5agnX92fr0c5Ks7gc+X7yPEDRLWU45BhG5EI/zXRPvg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDWlgf2SR29X+tggUkqJuJrf8GVoHPsavi3oK+Phz6t3LBJss3
	FWoGyJ9xaLI1A06oUVU/dfWHVRbosf3yJZVhCHLjy0hNRuGEzqfe4LUpy2/KDv3txfYl27nhgGp
	s1A==
X-Google-Smtp-Source: AGHT+IGB051RPG0qZ1hHpRMmy9gqDX/0GH7so+xa+rGGnhbzxuPrj+6CH4debSRqPENvRC2d7Upq2p/funE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:8389:0:b0:e2b:e955:d58a with SMTP id
 3f1490d57ef6-e2be955d949mr2592276.7.1729534389536; Mon, 21 Oct 2024 11:13:09
 -0700 (PDT)
Date: Mon, 21 Oct 2024 11:13:08 -0700
In-Reply-To: <ZxYeFKl2KbZ3Ila1@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com> <20241010182427.1434605-35-seanjc@google.com>
 <ZxYeFKl2KbZ3Ila1@yzhao56-desk.sh.intel.com>
Message-ID: <ZxaZtJGfN2_5Db6h@google.com>
Subject: Re: [PATCH v13 34/85] KVM: Get writable mapping for __kvm_vcpu_map()
 only when necessary
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
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
	"Alex =?utf-8?Q?Benn=C3=A9e?=" <alex.bennee@linaro.org>, David Matlack <dmatlack@google.com>, 
	David Stevens <stevensd@chromium.org>, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_111312_314669_0D44B078 
X-CRM114-Status: GOOD (  18.79  )
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

T24gTW9uLCBPY3QgMjEsIDIwMjQsIFlhbiBaaGFvIHdyb3RlOgo+IE9uIFRodSwgT2N0IDEwLCAy
MDI0IGF0IDExOjIzOjM2QU0gLTA3MDAsIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6Cj4gPiBX
aGVuIGNyZWF0aW5nIGEgbWVtb3J5IG1hcCBmb3IgcmVhZCwgZG9uJ3QgcmVxdWVzdCBhIHdyaXRh
YmxlIHBmbiBmcm9tIHRoZQo+ID4gcHJpbWFyeSBNTVUuICBXaGlsZSBjcmVhdGluZyByZWFkLW9u
bHkgbWFwcGluZ3MgY2FuIGJlIHRoZW9yZXRpY2FsbHkgc2xvd2VyLAo+ID4gYXMgdGhleSBkb24n
dCBwbGF5IG5pY2Ugd2l0aCBmYXN0IEdVUCBkdWUgdG8gdGhlIG5lZWQgdG8gYnJlYWsgQ29XIGJl
Zm9yZQo+ID4gbWFwcGluZyB0aGUgdW5kZXJseWluZyBQRk4sIHByYWN0aWNhbGx5IHNwZWFraW5n
LCBjcmVhdGluZyBhIG1hcHBpbmcgaXNuJ3QKPiA+IGEgc3VwZXIgaG90IHBhdGgsIGFuZCBnZXR0
aW5nIGEgd3JpdGFibGUgbWFwcGluZyBmb3IgcmVhZGluZyBpcyB3ZWlyZCBhbmQKPiA+IGNvbmZ1
c2luZy4KPiA+IAo+ID4gVGVzdGVkLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFy
by5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29v
Z2xlLmNvbT4KPiA+IC0tLQo+ID4gIHZpcnQva3ZtL2t2bV9tYWluLmMgfCAyICstCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYg
LS1naXQgYS92aXJ0L2t2bS9rdm1fbWFpbi5jIGIvdmlydC9rdm0va3ZtX21haW4uYwo+ID4gaW5k
ZXggMDgwNzQwZjY1MDYxLi5iODQ1ZTkyNTI2MzMgMTAwNjQ0Cj4gPiAtLS0gYS92aXJ0L2t2bS9r
dm1fbWFpbi5jCj4gPiArKysgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCj4gPiBAQCAtMzEyMiw3ICsz
MTIyLDcgQEAgaW50IF9fa3ZtX3ZjcHVfbWFwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ2ZuX3Qg
Z2ZuLCBzdHJ1Y3Qga3ZtX2hvc3RfbWFwICptYXAsCj4gPiAgCXN0cnVjdCBrdm1fZm9sbG93X3Bm
biBrZnAgPSB7Cj4gPiAgCQkuc2xvdCA9IGdmbl90b19tZW1zbG90KHZjcHUtPmt2bSwgZ2ZuKSwK
PiA+ICAJCS5nZm4gPSBnZm4sCj4gPiAtCQkuZmxhZ3MgPSBGT0xMX1dSSVRFLAo+ID4gKwkJLmZs
YWdzID0gd3JpdGFibGUgPyBGT0xMX1dSSVRFIDogMCwKPiA+ICAJCS5yZWZjb3VudGVkX3BhZ2Ug
PSAmbWFwLT5waW5uZWRfcGFnZSwKPiA+ICAJCS5waW4gPSB0cnVlLAo+ID4gIAl9Owo+IFdoZW4g
d3JpdGFibGUgaXMgZmFsc2UsIGNvdWxkIHdlIHNldCAiLnBpbiA9IGZhbHNlLCIgPwoKSG1tLCBt
YXliZT8gIEkgY2FuJ3QgaW1hZ2luZSBhbnl0aGluZyB3b3VsZCBhY3R1YWxseSBicmVhaywgYnV0
IHVubGVzcyBGT0xMX1BJTgppbXBsaWVzIHdyaXRpbmcsIG15IHByZWZlcmVuY2Ugd291bGQgc3Rp
bGwgYmUgdG8gcGluIHRoZSBwYWdlIHNvIHRoYXQgS1ZNIGFsd2F5cwpwaW5zIHdoZW4gYWNjZXNz
aW5nIHRoZSBhY3R1YWwgZGF0YSBvZiBhIHBhZ2UuCgo+IEFsc28gbm90IHN1cmUgaWYgIi5tYXBf
d3JpdGFibGUgPSBOVUxMIiBpcyBtaXNzaW5nLgoKRG9oLCBteSBwcmV2aW91cyByZXNwb25zZSB3
YXMgc2xpZ2h0bHkgd3JvbmcsIGl0J3MgaW1wbGljaXRseSBpbml0aWFsaXplZCB0byBOVUxMLApu
b3QgZmFsc2UuICBJIGZvcmdvdCBtYXBfd3JpdGFibGUgaXMgYSBwb2ludGVyIHRvIGEgYm9vbC4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
