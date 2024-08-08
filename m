Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39B2C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 12:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZFFamuelGCBTS+DUuR9F03/jbI0oj77rsbRuqHHnQQE=; b=hufzVMbDW/05S1
	8ZbDfYkKV9HHCCU1Zmt0ZNMS6YW3koMQsXgfwOUeNnhjsLBi4o3NcNafPN+FekzpuCCRaLqBN7i4s
	XJgLKwlJ5uJ7U1khlVxhQPdZ8k5EUhyzDyCMxLmqfIXkfWmNSzRcRMrz1WCMTjgeLzpYxRjVqX/s8
	5JsUDOD36WxqZ711qSCqbLs1WWcydO/s6ajypdCrjDk7PemJbedP5uZRm+iNYdRRugCEGl/Ks/0PO
	rT8CQfJyDUs2zQXTQtRsvzwj1JL8DORK0VBQT46gfmMMTK/xjFjBaWW/Y9QBGve3fQ/kS2OJ1P8Zc
	2OK8DyzSDf7Q0BSkdeag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc1ow-000000088I0-1sad;
	Thu, 08 Aug 2024 12:00:42 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc1oL-00000008898-0cV7
	for linux-riscv@lists.infradead.org;
	Thu, 08 Aug 2024 12:00:07 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3685b3dbcdcso489402f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Aug 2024 05:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723118403; x=1723723203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8fBZbfSfQMp8/8SurSvfBz+MaimrqNdI2CubOLP3Ew=;
        b=xNIitkLg7Hn52QZCVxNjF52WUwcVVhJsS7rrSHzxZK307WZbq/Xf6yd3YrIa3LFDIS
         U9lnTOWUeRhDsDfx4pzQNeSeWtSMpxhiez6XTb8sRebDM/SfXetaVZWNKz99X3OtBaaX
         ctmYWH3GTGP2IHZrWARu6+yiFMDeyYX1uJO0nutAc/kYpsrT6j1E877emeEtOCi7rKSp
         PoXnVzknSwqdoWcgZZwRneHwBDz2A2nTzk4fDzXRIvDKeFVI5n2CM81BisBe5WOHXeWS
         qufh+ZZzJ8o+VQqf7QTMAidEyyK+zpvbcpwvKe5Xj/kS3q6MSSNf8k1roflHxsLBWBCH
         qowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723118403; x=1723723203;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8fBZbfSfQMp8/8SurSvfBz+MaimrqNdI2CubOLP3Ew=;
        b=YwcZu5VdGPidnextQU8+5vC9DkpouxGOpHIPaGVXeuGtXeymBFRS0Y7LwMVfDlaPw8
         rltnCWt+N0iQ3Wg5sY9v+BJ4xIXTwJzPyWGJ5EsIjHpuUSnFY/ATvOIQ3QtBn1Y0ULAp
         6tdivf3pvgK8SHIXTzUdRy6mEzbOJzWtggVKOtzj1qPMUYTzU63Qy5Pk/SW9kwyQhb4a
         r2PfDftAy67Cb3tt0Sen+BDF7g6XE14y95y/mfU7PXvhClTKRF2yASzi7+IOvr7Psceh
         9I+/s0+lR/u76yHWFXQl7W1XHNBKI4f8puHLIVoOkEnFdwUkDqN6IryPmy5fY9VOaz1n
         Zv3w==
X-Forwarded-Encrypted: i=1; AJvYcCXISYzaJo3gqn1G8k4anNufI/1QC3hwT8XTMmirf3iERevONTakNRuSMBlx7vXW8poTJW/pyDYq1ldrd3wGFt38sP1HZWRvutP9toIiZ6FP
X-Gm-Message-State: AOJu0YyV/GDnX/xOVUJxakM7exN98+1qLyPZ2CHZoz5zB36VxvqU7fvY
	E4y5AjzsFGaA1tjpC3yOaQxyFV907sR8ZIaP3G/ZW5aL2+a4IY21Fm7C8aw7KJE=
X-Google-Smtp-Source: AGHT+IHHX2fBYyF3bzrkIN6FI+lRc2WcNWD9HizbtFbwpwdbf6zDJoYFHOfDyhNaZKL5sM+Jijm6XQ==
X-Received: by 2002:a5d:698f:0:b0:367:8fee:443b with SMTP id ffacd0b85a97d-36d27561461mr1129489f8f.41.1723118402280;
        Thu, 08 Aug 2024 05:00:02 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d27156c8asm1700288f8f.24.2024.08.08.05.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 05:00:01 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 751635F769;
	Thu,  8 Aug 2024 13:00:00 +0100 (BST)
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
Subject: Re: [PATCH v12 13/84] KVM: Annotate that all paths in hva_to_pfn()
 might sleep
In-Reply-To: <20240726235234.228822-14-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:22 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-14-seanjc@google.com>
Date: Thu, 08 Aug 2024 13:00:00 +0100
Message-ID: <87bk23ql6n.fsf@draig.linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_050005_198687_2FBB50C7 
X-CRM114-Status: GOOD (  15.22  )
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

U2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+IHdyaXRlczoKCj4gTm93IHRo
YXQgaHZhX3RvX3BmbigpIG5vIGxvbmdlciBzdXBwb3J0cyBiZWluZyBjYWxsZWQgaW4gYXRvbWlj
IGNvbnRleHQsCj4gbW92ZSB0aGUgbWlnaHRfc2xlZXAoKSBhbm5vdGF0aW9uIGZyb20gaHZhX3Rv
X3Bmbl9zbG93KCkgdG8KPiBodmFfdG9fcGZuKCkuCgpUaGUgY29tbWVudGFyeSBmb3IgaHZhX3Rv
X3Bmbl9mYXN0IGRpc2FncmVlcy4KCiAgLyoKICAgKiBUaGUgZmFzdCBwYXRoIHRvIGdldCB0aGUg
d3JpdGFibGUgcGZuIHdoaWNoIHdpbGwgYmUgc3RvcmVkIGluIEBwZm4sCiAgICogdHJ1ZSBpbmRp
Y2F0ZXMgc3VjY2Vzcywgb3RoZXJ3aXNlIGZhbHNlIGlzIHJldHVybmVkLiAgSXQncyBhbHNvIHRo
ZQogICAqIG9ubHkgcGFydCB0aGF0IHJ1bnMgaWYgd2UgY2FuIGluIGF0b21pYyBjb250ZXh0Lgog
ICAqLwogIHN0YXRpYyBib29sIGh2YV90b19wZm5fZmFzdChzdHJ1Y3Qga3ZtX2ZvbGxvd19wZm4g
KmtmcCwga3ZtX3Bmbl90ICpwZm4pCgpBdCB3aGljaCBwb2ludCBkaWQgaXQgbG9vc2UgdGhlIGFi
aWxpdHkgdG8gcnVuIGluIHRoZSBhdG9taWMgY29udGV4dD8gSQpjb3VsZG4ndCB3b3JrIGl0IG91
dCBmcm9tIHRoZSBjb21taXRzLgoKPgo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJz
b24gPHNlYW5qY0Bnb29nbGUuY29tPgo+IC0tLQo+ICB2aXJ0L2t2bS9rdm1fbWFpbi5jIHwgNCAr
Ky0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvdmlydC9rdm0va3ZtX21haW4uYyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMK
PiBpbmRleCA4NGM3M2I0ZmM4MDQuLjAzYWYxYTAwOTBiMSAxMDA2NDQKPiAtLS0gYS92aXJ0L2t2
bS9rdm1fbWFpbi5jCj4gKysrIGIvdmlydC9rdm0va3ZtX21haW4uYwo+IEBAIC0yODA3LDggKzI4
MDcsNiBAQCBzdGF0aWMgaW50IGh2YV90b19wZm5fc2xvdyh1bnNpZ25lZCBsb25nIGFkZHIsIGJv
b2wgKmFzeW5jLCBib29sIHdyaXRlX2ZhdWx0LAo+ICAJc3RydWN0IHBhZ2UgKnBhZ2U7Cj4gIAlp
bnQgbnBhZ2VzOwo+ICAKPiAtCW1pZ2h0X3NsZWVwKCk7Cj4gLQo+ICAJaWYgKHdyaXRhYmxlKQo+
ICAJCSp3cml0YWJsZSA9IHdyaXRlX2ZhdWx0Owo+ICAKPiBAQCAtMjk0Nyw2ICsyOTQ1LDggQEAg
a3ZtX3Bmbl90IGh2YV90b19wZm4odW5zaWduZWQgbG9uZyBhZGRyLCBib29sIGludGVycnVwdGli
bGUsIGJvb2wgKmFzeW5jLAo+ICAJa3ZtX3Bmbl90IHBmbjsKPiAgCWludCBucGFnZXMsIHI7Cj4g
IAo+ICsJbWlnaHRfc2xlZXAoKTsKPiArCj4gIAlpZiAoaHZhX3RvX3Bmbl9mYXN0KGFkZHIsIHdy
aXRlX2ZhdWx0LCB3cml0YWJsZSwgJnBmbikpCj4gIAkJcmV0dXJuIHBmbjsKCi0tIApBbGV4IEJl
bm7DqWUKVmlydHVhbGlzYXRpb24gVGVjaCBMZWFkIEAgTGluYXJvCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
