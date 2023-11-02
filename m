Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1071EC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 13:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qsWrAz6xs84gJ0Rk7LmAVVX1FXPPWuJMGUwWJp5bImA=; b=Cqk9ZZw2Jy5tr5
	2z88rV03XlEk5BXxbXxoFUtnxvy5Ze6CZZm9g4i7aooz0JpB4tQecdbEma8AbsdB9Z/t6Wo67s+f2
	B/kIH63e3DAge6ci1TKhnjpw6H13Fu/e0yafZt0Ffy4lHDXWAQUImPmKpZlHVUR6pfpcs968anD0v
	IUm7SqEKrW+yVW3DZkmOevnPewltweQuE01qFKJHfzodRI0BcO0UH7xDQ9zVq4JGnslpACq9l9a0K
	rAGnRd3a2aISjQFzdYl8E6lvHQgF5oEyWmIR3uY2UAsHlu2h3FcMJI/qBKHNhEvuE/ArXBCGfnw0c
	5PcptzWd07iJiEhCoWBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyYAj-009a4u-0x;
	Thu, 02 Nov 2023 13:55:45 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyYAe-009a2Y-2a
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 13:55:43 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-4a87f9a3961so402028e0c.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 06:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698933339; x=1699538139; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Yb/48Ns1tpOy5twJOpAhL4i1qPmUF1LLO7pfzUXbus=;
        b=Lem++8Ba56ZPB3q55YmIDzta89evcn9VnJ/xLNwlPpnBO2f9tUf7Z6YbiEpEjmN+Vv
         xK3Enlh3HiLAE+s5t0QH/mHjr4RMMi3RCs0UCrh1OIM5mxxuSkJT/YX9YWAqqWq9qAla
         GMccbPS53KwtH4Df7Kg23tusGoP0NguiLdddFeecFkK63F4nixhvC6u47T0kFHGF/Cc5
         ajOUSEqNtimDJm02o1FZRUiCfFr1qGXkn6JAX4L7yxFnd3S/I+iFE7tLhF8p19C890rO
         SgCblEHIExXvGPj6f6HqVdCnCm52YNoW5TfEXQBmCFflfSSEO+RdD74psasxdXL8QU6W
         PHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698933339; x=1699538139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Yb/48Ns1tpOy5twJOpAhL4i1qPmUF1LLO7pfzUXbus=;
        b=uimyoJyQVPhjqSnxPUg3FQJ2fGSjsl/2ETt61uIiMdYqDpBYsxdemTKSNIe9dIclGQ
         lldJD/ac646iwf1NNduQWw3spkVGBh5DwZeeMceiHCBelR7XMddEUE+yOX+BVaPSV7Fh
         zSRKrFkLZ/cZf2FCclcO0t/xXyTADM6/5gOA+WWO5kJs3KJ2sLdsfEzLxk2Z7B6faXJr
         qX7GCNBSfhf0l0VTVXdiSfR6dvobMVfBIbmgjHR2e8IQkwP3HtI7hhAN7pDp7L+hSav7
         jB30eOSqx4D8Dwgj9tZ+OrSLOPZtYKiv5kWrBT1ozHHGMXn3ASo8npQE95lWFm/TTTml
         zYKg==
X-Gm-Message-State: AOJu0YyybvTJ6C5iSnAcY0Q11esKXWi9opu2twIgwDN6HtPFfBNKKE0X
	bwXBemC4vzu3nXn7Ww6sZgw3LRsKXH2+p3H1KSSg/w==
X-Google-Smtp-Source: AGHT+IHGemWDnkL7WTN8LWokDsgbdlhg4M3963xhuFMSCwbYM702stLA5BFN7Yk4qTk9o3bsEJ0EqjHFUXiDw4OizcA=
X-Received: by 2002:a1f:984f:0:b0:49d:a52a:4421 with SMTP id
 a76-20020a1f984f000000b0049da52a4421mr16094320vke.4.1698933338782; Thu, 02
 Nov 2023 06:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-11-seanjc@google.com>
In-Reply-To: <20231027182217.3615211-11-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 2 Nov 2023 13:55:03 +0000
Message-ID: <CA+EHjTx4dQwU3CWzoib_x1tgw66HCtBEiGW_7E8yZxttem6+vw@mail.gmail.com>
Subject: Re: [PATCH v13 10/35] KVM: Add a dedicated mmu_notifier flag for
 reclaiming freed memory
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
X-CRM114-CacheID: sfid-20231102_065540_843604_648A246E 
X-CRM114-Status: GOOD (  29.68  )
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
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IEhhbmRsZSBBTUQgU0VWJ3Mga3ZtX2FyY2hfZ3Vl
c3RfbWVtb3J5X3JlY2xhaW1lZCgpIGhvb2sgYnkgaGF2aW5nCj4gX19rdm1faGFuZGxlX2h2YV9y
YW5nZSgpIHJldHVybiB3aGV0aGVyIG9yIG5vdCBhbiBvdmVybGFwcGluZyBtZW1zbG90Cj4gd2Fz
IGZvdW5kLCBpLmUuIG1tdV9sb2NrIHdhcyBhY3F1aXJlZC4gIFVzaW5nIHRoZSAub25fdW5sb2Nr
KCkgaG9vawo+IHdvcmtzLCBidXQga3ZtX2FyY2hfZ3Vlc3RfbWVtb3J5X3JlY2xhaW1lZCgpIG5l
ZWRzIHRvIHJ1biBhZnRlciBkcm9wcGluZwo+IG1tdV9sb2NrLCB3aGljaCBtYWtlcyAub25fbG9j
aygpIGFuZCAub25fdW5sb2NrKCkgYXN5bW1ldHJpY2FsLgo+Cj4gVXNlIGEgc21hbGwgc3RydWN0
IHRvIHJldHVybiB0aGUgdHVwbGUgb2YgdGhlIG5vdGlmaWVyLXNwZWNpZmljIHJldHVybiwKPiBw
bHVzIHdoZXRoZXIgb3Igbm90IG92ZXJsYXAgd2FzIGZvdW5kLiAgQmVjYXVzZSB0aGUgaXRlcmF0
aW9uIGhlbHBlcnMgYXJlCj4gX19hbHdheXNfaW5saW5lZCwgcHJhY3RpY2FsbHkgc3BlYWtpbmcs
IHRoZSBzdHJ1Y3Qgd2lsbCBuZXZlciBhY3R1YWxseSBiZQo+IHJldHVybmVkIGZyb20gYSBmdW5j
dGlvbiBjYWxsIChub3QgdG8gbWVudGlvbiB0aGUgc2l6ZSBvZiB0aGUgc3RydWN0IHdpbGwKPiBi
ZSB0d28gYnl0ZXMgaW4gcHJhY3RpY2UpLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2VhbiBDaHJpc3Rv
cGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Cj4gLS0tCgpSZXZpZXdlZC1ieTogRnVhZCBUYWJi
YSA8dGFiYmFAZ29vZ2xlLmNvbT4KVGVzdGVkLWJ5OiBGdWFkIFRhYmJhIDx0YWJiYUBnb29nbGUu
Y29tPgoKQ2hlZXJzLAovZnVhZAoKCj4gIHZpcnQva3ZtL2t2bV9tYWluLmMgfCA1MyArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDM3IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3ZpcnQv
a3ZtL2t2bV9tYWluLmMgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCj4gaW5kZXggM2Y1YjdjMmM1MzI3
Li4yYmMwNGM4YWUxZjQgMTAwNjQ0Cj4gLS0tIGEvdmlydC9rdm0va3ZtX21haW4uYwo+ICsrKyBi
L3ZpcnQva3ZtL2t2bV9tYWluLmMKPiBAQCAtNTYxLDYgKzU2MSwxOSBAQCBzdHJ1Y3Qga3ZtX21t
dV9ub3RpZmllcl9yYW5nZSB7Cj4gICAgICAgICBib29sIG1heV9ibG9jazsKPiAgfTsKPgo+ICsv
Kgo+ICsgKiBUaGUgaW5uZXItbW9zdCBoZWxwZXIgcmV0dXJucyBhIHR1cGxlIGNvbnRhaW5pbmcg
dGhlIHJldHVybiB2YWx1ZSBmcm9tIHRoZQo+ICsgKiBhcmNoLSBhbmQgYWN0aW9uLXNwZWNpZmlj
IGhhbmRsZXIsIHBsdXMgYSBmbGFnIGluZGljYXRpbmcgd2hldGhlciBvciBub3QgYXQKPiArICog
bGVhc3Qgb25lIG1lbXNsb3Qgd2FzIGZvdW5kLCBpLmUuIGlmIHRoZSBoYW5kbGVyIGZvdW5kIGd1
ZXN0IG1lbW9yeS4KPiArICoKPiArICogTm90ZSwgbW9zdCBub3RpZmllcnMgYXJlIGF2ZXJzZSB0
byBib29sZWFucywgc28gZXZlbiB0aG91Z2ggS1ZNIHRyYWNrcyB0aGUKPiArICogcmV0dXJuIGZy
b20gYXJjaCBjb2RlIGFzIGEgYm9vbCwgb3V0ZXIgaGVscGVycyB3aWxsIGNhc3QgaXQgdG8gYW4g
aW50LiA6LSgKPiArICovCj4gK3R5cGVkZWYgc3RydWN0IGt2bV9tbXVfbm90aWZpZXJfcmV0dXJu
IHsKPiArICAgICAgIGJvb2wgcmV0Owo+ICsgICAgICAgYm9vbCBmb3VuZF9tZW1zbG90Owo+ICt9
IGt2bV9tbl9yZXRfdDsKPiArCj4gIC8qCj4gICAqIFVzZSBhIGRlZGljYXRlZCBzdHViIGluc3Rl
YWQgb2YgTlVMTCB0byBpbmRpY2F0ZSB0aGF0IHRoZXJlIGlzIG5vIGNhbGxiYWNrCj4gICAqIGZ1
bmN0aW9uL2hhbmRsZXIuICBUaGUgY29tcGlsZXIgdGVjaG5pY2FsbHkgY2FuJ3QgZ3VhcmFudGVl
IHRoYXQgYSByZWFsCj4gQEAgLTU4MiwyMiArNTk1LDI1IEBAIHN0YXRpYyBjb25zdCB1bmlvbiBr
dm1fbW11X25vdGlmaWVyX2FyZyBLVk1fTU1VX05PVElGSUVSX05PX0FSRzsKPiAgICAgICAgICAg
ICAgbm9kZTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiAgICAgICAgICAgICAgbm9kZSA9IGludGVydmFsX3RyZWVfaXRlcl9uZXh0
KG5vZGUsIHN0YXJ0LCBsYXN0KSkgICAgICBcCj4KPiAtc3RhdGljIF9fYWx3YXlzX2lubGluZSBp
bnQgX19rdm1faGFuZGxlX2h2YV9yYW5nZShzdHJ1Y3Qga3ZtICprdm0sCj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qga3ZtX21t
dV9ub3RpZmllcl9yYW5nZSAqcmFuZ2UpCj4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUga3ZtX21u
X3JldF90IF9fa3ZtX2hhbmRsZV9odmFfcmFuZ2Uoc3RydWN0IGt2bSAqa3ZtLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
c3RydWN0IGt2bV9tbXVfbm90aWZpZXJfcmFuZ2UgKnJhbmdlKQo+ICB7Cj4gLSAgICAgICBib29s
IHJldCA9IGZhbHNlLCBsb2NrZWQgPSBmYWxzZTsKPiArICAgICAgIHN0cnVjdCBrdm1fbW11X25v
dGlmaWVyX3JldHVybiByID0gewo+ICsgICAgICAgICAgICAgICAucmV0ID0gZmFsc2UsCj4gKyAg
ICAgICAgICAgICAgIC5mb3VuZF9tZW1zbG90ID0gZmFsc2UsCj4gKyAgICAgICB9Owo+ICAgICAg
ICAgc3RydWN0IGt2bV9nZm5fcmFuZ2UgZ2ZuX3JhbmdlOwo+ICAgICAgICAgc3RydWN0IGt2bV9t
ZW1vcnlfc2xvdCAqc2xvdDsKPiAgICAgICAgIHN0cnVjdCBrdm1fbWVtc2xvdHMgKnNsb3RzOwo+
ICAgICAgICAgaW50IGksIGlkeDsKPgo+ICAgICAgICAgaWYgKFdBUk5fT05fT05DRShyYW5nZS0+
ZW5kIDw9IHJhbmdlLT5zdGFydCkpCj4gLSAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gcjsKPgo+ICAgICAgICAgLyogQSBudWxsIGhhbmRsZXIgaXMgYWxs
b3dlZCBpZiBhbmQgb25seSBpZiBvbl9sb2NrKCkgaXMgcHJvdmlkZWQuICovCj4gICAgICAgICBp
ZiAoV0FSTl9PTl9PTkNFKElTX0tWTV9OVUxMX0ZOKHJhbmdlLT5vbl9sb2NrKSAmJgo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICBJU19LVk1fTlVMTF9GTihyYW5nZS0+aGFuZGxlcikpKQo+IC0g
ICAgICAgICAgICAgICByZXR1cm4gMDsKPiArICAgICAgICAgICAgICAgcmV0dXJuIHI7Cj4KPiAg
ICAgICAgIGlkeCA9IHNyY3VfcmVhZF9sb2NrKCZrdm0tPnNyY3UpOwo+Cj4gQEAgLTYzMSw4ICs2
NDcsOCBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIGludCBfX2t2bV9oYW5kbGVfaHZhX3Jhbmdl
KHN0cnVjdCBrdm0gKmt2bSwKPiAgICAgICAgICAgICAgICAgICAgICAgICBnZm5fcmFuZ2UuZW5k
ID0gaHZhX3RvX2dmbl9tZW1zbG90KGh2YV9lbmQgKyBQQUdFX1NJWkUgLSAxLCBzbG90KTsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICBnZm5fcmFuZ2Uuc2xvdCA9IHNsb3Q7Cj4KPiAtICAgICAg
ICAgICAgICAgICAgICAgICBpZiAoIWxvY2tlZCkgewo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbG9ja2VkID0gdHJ1ZTsKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoIXIu
Zm91bmRfbWVtc2xvdCkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgci5mb3Vu
ZF9tZW1zbG90ID0gdHJ1ZTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEtWTV9N
TVVfTE9DSyhrdm0pOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFJU19L
Vk1fTlVMTF9GTihyYW5nZS0+b25fbG9jaykpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJhbmdlLT5vbl9sb2NrKGt2bSk7Cj4gQEAgLTY0MCwxNCArNjU2LDE0IEBA
IHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgaW50IF9fa3ZtX2hhbmRsZV9odmFfcmFuZ2Uoc3RydWN0
IGt2bSAqa3ZtLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKElTX0tWTV9O
VUxMX0ZOKHJhbmdlLT5oYW5kbGVyKSkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYnJlYWs7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgfQo+IC0gICAgICAgICAg
ICAgICAgICAgICAgIHJldCB8PSByYW5nZS0+aGFuZGxlcihrdm0sICZnZm5fcmFuZ2UpOwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHIucmV0IHw9IHJhbmdlLT5oYW5kbGVyKGt2bSwgJmdmbl9y
YW5nZSk7Cj4gICAgICAgICAgICAgICAgIH0KPiAgICAgICAgIH0KPgo+IC0gICAgICAgaWYgKHJh
bmdlLT5mbHVzaF9vbl9yZXQgJiYgcmV0KQo+ICsgICAgICAgaWYgKHJhbmdlLT5mbHVzaF9vbl9y
ZXQgJiYgci5yZXQpCj4gICAgICAgICAgICAgICAgIGt2bV9mbHVzaF9yZW1vdGVfdGxicyhrdm0p
Owo+Cj4gLSAgICAgICBpZiAobG9ja2VkKSB7Cj4gKyAgICAgICBpZiAoci5mb3VuZF9tZW1zbG90
KSB7Cj4gICAgICAgICAgICAgICAgIEtWTV9NTVVfVU5MT0NLKGt2bSk7Cj4gICAgICAgICAgICAg
ICAgIGlmICghSVNfS1ZNX05VTExfRk4ocmFuZ2UtPm9uX3VubG9jaykpCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgcmFuZ2UtPm9uX3VubG9jayhrdm0pOwo+IEBAIC02NTUsOCArNjcxLDcgQEAg
c3RhdGljIF9fYWx3YXlzX2lubGluZSBpbnQgX19rdm1faGFuZGxlX2h2YV9yYW5nZShzdHJ1Y3Qg
a3ZtICprdm0sCj4KPiAgICAgICAgIHNyY3VfcmVhZF91bmxvY2soJmt2bS0+c3JjdSwgaWR4KTsK
Pgo+IC0gICAgICAgLyogVGhlIG5vdGlmaWVycyBhcmUgYXZlcnNlIHRvIGJvb2xlYW5zLiA6LSgg
Ki8KPiAtICAgICAgIHJldHVybiAoaW50KXJldDsKPiArICAgICAgIHJldHVybiByOwo+ICB9Cj4K
PiAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBpbnQga3ZtX2hhbmRsZV9odmFfcmFuZ2Uoc3RydWN0
IG1tdV9ub3RpZmllciAqbW4sCj4gQEAgLTY3Nyw3ICs2OTIsNyBAQCBzdGF0aWMgX19hbHdheXNf
aW5saW5lIGludCBrdm1faGFuZGxlX2h2YV9yYW5nZShzdHJ1Y3QgbW11X25vdGlmaWVyICptbiwK
PiAgICAgICAgICAgICAgICAgLm1heV9ibG9jayAgICAgID0gZmFsc2UsCj4gICAgICAgICB9Owo+
Cj4gLSAgICAgICByZXR1cm4gX19rdm1faGFuZGxlX2h2YV9yYW5nZShrdm0sICZyYW5nZSk7Cj4g
KyAgICAgICByZXR1cm4gX19rdm1faGFuZGxlX2h2YV9yYW5nZShrdm0sICZyYW5nZSkucmV0Owo+
ICB9Cj4KPiAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBpbnQga3ZtX2hhbmRsZV9odmFfcmFuZ2Vf
bm9fZmx1c2goc3RydWN0IG1tdV9ub3RpZmllciAqbW4sCj4gQEAgLTY5Niw3ICs3MTEsNyBAQCBz
dGF0aWMgX19hbHdheXNfaW5saW5lIGludCBrdm1faGFuZGxlX2h2YV9yYW5nZV9ub19mbHVzaChz
dHJ1Y3QgbW11X25vdGlmaWVyICptbgo+ICAgICAgICAgICAgICAgICAubWF5X2Jsb2NrICAgICAg
PSBmYWxzZSwKPiAgICAgICAgIH07Cj4KPiAtICAgICAgIHJldHVybiBfX2t2bV9oYW5kbGVfaHZh
X3JhbmdlKGt2bSwgJnJhbmdlKTsKPiArICAgICAgIHJldHVybiBfX2t2bV9oYW5kbGVfaHZhX3Jh
bmdlKGt2bSwgJnJhbmdlKS5yZXQ7Cj4gIH0KPgo+ICBzdGF0aWMgYm9vbCBrdm1fY2hhbmdlX3Nw
dGVfZ2ZuKHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2bV9nZm5fcmFuZ2UgKnJhbmdlKQo+IEBA
IC03OTgsNyArODEzLDcgQEAgc3RhdGljIGludCBrdm1fbW11X25vdGlmaWVyX2ludmFsaWRhdGVf
cmFuZ2Vfc3RhcnQoc3RydWN0IG1tdV9ub3RpZmllciAqbW4sCj4gICAgICAgICAgICAgICAgIC5l
bmQgICAgICAgICAgICA9IHJhbmdlLT5lbmQsCj4gICAgICAgICAgICAgICAgIC5oYW5kbGVyICAg
ICAgICA9IGt2bV9tbXVfdW5tYXBfZ2ZuX3JhbmdlLAo+ICAgICAgICAgICAgICAgICAub25fbG9j
ayAgICAgICAgPSBrdm1fbW11X2ludmFsaWRhdGVfYmVnaW4sCj4gLSAgICAgICAgICAgICAgIC5v
bl91bmxvY2sgICAgICA9IGt2bV9hcmNoX2d1ZXN0X21lbW9yeV9yZWNsYWltZWQsCj4gKyAgICAg
ICAgICAgICAgIC5vbl91bmxvY2sgICAgICA9ICh2b2lkICopa3ZtX251bGxfZm4sCj4gICAgICAg
ICAgICAgICAgIC5mbHVzaF9vbl9yZXQgICA9IHRydWUsCj4gICAgICAgICAgICAgICAgIC5tYXlf
YmxvY2sgICAgICA9IG1tdV9ub3RpZmllcl9yYW5nZV9ibG9ja2FibGUocmFuZ2UpLAo+ICAgICAg
ICAgfTsKPiBAQCAtODMwLDcgKzg0NSwxMyBAQCBzdGF0aWMgaW50IGt2bV9tbXVfbm90aWZpZXJf
aW52YWxpZGF0ZV9yYW5nZV9zdGFydChzdHJ1Y3QgbW11X25vdGlmaWVyICptbiwKPiAgICAgICAg
IGdmbl90b19wZm5fY2FjaGVfaW52YWxpZGF0ZV9zdGFydChrdm0sIHJhbmdlLT5zdGFydCwgcmFu
Z2UtPmVuZCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBodmFf
cmFuZ2UubWF5X2Jsb2NrKTsKPgo+IC0gICAgICAgX19rdm1faGFuZGxlX2h2YV9yYW5nZShrdm0s
ICZodmFfcmFuZ2UpOwo+ICsgICAgICAgLyoKPiArICAgICAgICAqIElmIG9uZSBvciBtb3JlIG1l
bXNsb3RzIHdlcmUgZm91bmQgYW5kIHRodXMgemFwcGVkLCBub3RpZnkgYXJjaCBjb2RlCj4gKyAg
ICAgICAgKiB0aGF0IGd1ZXN0IG1lbW9yeSBoYXMgYmVlbiByZWNsYWltZWQuICBUaGlzIG5lZWRz
IHRvIGJlIGRvbmUgKmFmdGVyKgo+ICsgICAgICAgICogZHJvcHBpbmcgbW11X2xvY2ssIGFzIHg4
NidzIHJlY2xhaW0gcGF0aCBpcyBzbG9vb29vdy4KPiArICAgICAgICAqLwo+ICsgICAgICAgaWYg
KF9fa3ZtX2hhbmRsZV9odmFfcmFuZ2Uoa3ZtLCAmaHZhX3JhbmdlKS5mb3VuZF9tZW1zbG90KQo+
ICsgICAgICAgICAgICAgICBrdm1fYXJjaF9ndWVzdF9tZW1vcnlfcmVjbGFpbWVkKGt2bSk7Cj4K
PiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4gLS0KPiAyLjQyLjAuODIwLmc4M2E3MjFhMTM3LWdv
b2cKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
