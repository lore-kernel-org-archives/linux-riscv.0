Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E634AC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 08:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MQt2XAOKqdf0C6xrIjQ/ZsWpm9bTn5Py2aig9/FHCoo=; b=c1Mpz7CtKLSIdO
	09Cy3+hM+/0HVCycNj/p+yxXZJ3m3IFgimefNIN6UeH2NAvtlP9472HmijraNyqnugDmFnDpeZ8Vo
	4b8R3s7PBFp5CzkJeIVagZRKKSU1cjVmgz4XhumT4sTd+SkqNnU7CC2UW81N3i7l4k7g1chY/Ralm
	/Zh8y4RXmJfLzTbDk4js6Y7G0XOstbprpKs7jm3cTFZWQlOCuxj0XRn45MdxeFSSWKFGEry/LitRQ
	fwUv2gN64HrdK3jY0SrQx0komwc0HRsortcQVRHayJ97+67sNVOuNRC6ffLvs5HE3O7EvKWL2hCe1
	qZ9+VbJBx9MefjBkdyDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZReG-00000004RmU-1yNC;
	Thu, 01 Aug 2024 08:59:00 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZRco-00000004RQk-2Z2U
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 08:57:51 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5a156557029so10785164a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 01:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722502649; x=1723107449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Syi3zSlJ8k1vqxBzUq6nZD+avtMgHQU+/NZ7B5gDmQ4=;
        b=aAGEBadaymA72olGvPJRub6hK8usZQ33nCX0ZsvuSt44H+66yn16t5JZz4icu6ZEMb
         TrUiYwb0r1NJoc8vpRJA5I3GM9KsEsDIbxUTNSyur5BB1P6vAhdU4pZb8/8qyiEoJcYb
         MzalYJ69mkmrK7ZPvp7nOnaBOSPAXJw3eGVaIejd6Zl8wJpyXy8n+FZmAOgALjFu4dWA
         oAGALLi5xGo6A2kFG+3kgR6Bv7QkR+RrkEBrdDTVSyhMFtJ8wqDqRfpuWFcrcWR/Tg8C
         ZTCseNr+ZDOs0B9sk/B/KI8xKQvNB9MzSX67rwb+ZvCM2a8uYz1o1Aghafu7gReGOBzA
         fgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722502649; x=1723107449;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Syi3zSlJ8k1vqxBzUq6nZD+avtMgHQU+/NZ7B5gDmQ4=;
        b=CiYXkfIbWSsEMAKVUtfWlabiImYzD8xAKIIaQMCDCYrhWqeAoXqXJPk3stCoi/rkBX
         h66nh08w1RpvFzwXrWfrVIFj/JNUWwu/EKO8tqCDcEvfNVDJUd3vRLMFzSvhuUW9k9Bq
         VwmV6a6GiYyKciwKBX+p3X1SWdOc8OGI29C92mZwhYyLUVaiLt1dAKDjZ8U+Td+NhAgW
         2Io67lVbAVAFhao5kVHLTrZ5H3riJMTVptlIx9ku/KWw0trt/a4k34Hi+RYZpDdRWaQl
         1B7d7LVPNinWOPBVbiEwWvItBQVSDXwoAtJsIVTtFrluHNlYQh3R/XDA1x+1iHKQf/Nl
         BqMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVVpDGjM2g9zSG5KkQCpTMjlRFws1E+Sj3QSPrm+kCzQ1SWr50m2q4TflaCKpPcFlq4EE480dUrBBz+lBq9y9H2c8Vf3HKNqiQba0aFqCD
X-Gm-Message-State: AOJu0YyFmVfNedd8VTe4JxMCgz+iz6PvAYzhVLVvRLOwj8wC5fZQ14IP
	wnMLiqHIEpYrFgQhlvgVURFrqQ/Ic61oRmHK2MW+6ooeVxYjqDbvBa2jetOC//4=
X-Google-Smtp-Source: AGHT+IEdS3NM6t6Y7T/95sEL4C7ubpn/6F0Cu3mCtANczyd9mmWSLE4tcyyhWaOoIZKPq4CsXdarWQ==
X-Received: by 2002:a17:907:6d0e:b0:a75:1069:5b94 with SMTP id a640c23a62f3a-a7daf535320mr136914966b.21.1722502647807;
        Thu, 01 Aug 2024 01:57:27 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acadb82d5sm865337466b.199.2024.08.01.01.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 01:57:27 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 3FE7E5F80C;
	Thu,  1 Aug 2024 09:57:26 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Marc Zyngier <maz@kernel.org>,
  Oliver Upton <oliver.upton@linux.dev>,  Tianrui Zhao
 <zhaotianrui@loongson.cn>,  Bibo Mao <maobibo@loongson.cn>,  Huacai Chen
 <chenhuacai@kernel.org>,  Michael Ellerman <mpe@ellerman.id.au>,  Anup
 Patel <anup@brainfault.org>,  Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
  Christian Borntraeger <borntraeger@linux.ibm.com>,  Janosch Frank
 <frankja@linux.ibm.com>,  Claudio Imbrenda <imbrenda@linux.ibm.com>,
  kvm@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  kvmarm@lists.linux.dev,  loongarch@lists.linux.dev,
  linux-mips@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,
  kvm-riscv@lists.infradead.org,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org,  David Matlack <dmatlack@google.com>,
  David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v12 03/84] KVM: Drop KVM_ERR_PTR_BAD_PAGE and instead
 return NULL to indicate an error
In-Reply-To: <20240726235234.228822-4-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:12 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-4-seanjc@google.com>
Date: Thu, 01 Aug 2024 09:57:26 +0100
Message-ID: <875xskfwnd.fsf@draig.linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_015730_655780_844ECE91 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
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

U2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+IHdyaXRlczoKCj4gUmVtb3Zl
IEtWTV9FUlJfUFRSX0JBRF9QQUdFIGFuZCBpbnN0ZWFkIHJldHVybiBOVUxMLCBhcyAiYmFkIHBh
Z2UiIGlzIGp1c3QKPiBhIGxlZnRvdmVyIGJpdCBvZiB3ZWlyZG5lc3MgZnJvbSBkYXlzIG9mIG9s
ZCB3aGVuIEtWTSBzdHVmZmVkIGEgImJhZCIgcGFnZQo+IGludG8gdGhlIGd1ZXN0IGluc3RlYWQg
b2YgYWN0dWFsbHkgaGFuZGxpbmcgbWlzc2luZyBwYWdlcy4gIFNlZSBjb21taXQKPiBjZWE3YmIy
MTI4MGUgKCJLVk06IE1NVTogTWFrZSBnZm5fdG9fcGFnZSgpIGFsd2F5cyBzYWZlIikuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KClJl
dmlld2VkLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+CgotLSAKQWxl
eCBCZW5uw6llClZpcnR1YWxpc2F0aW9uIFRlY2ggTGVhZCBAIExpbmFybwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
