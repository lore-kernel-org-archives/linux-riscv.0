Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DBFC47DD9
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 01:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TlwIDf9KR2LbjEeWDEBytYyPCa20114eTqPNEllqr34=; b=IiMA1zxG/2Cg2s
	AqGXdL/DtFuCfC+7SYGJXmK6IsXyZMKmKkUyKm7aCdlsyhMv/FO6Mc5I3qoQOpYaxsW9WGITfBfsL
	NHlhuTyGvZbc9OoZ0OAevEjpuMWvsWtttWkhTDeOT29cMt6JCU4EwMKb3qLlgPpU1BeBImAxEvW+Z
	wbU5g045Cs9enEFArvNAJSpoUwX7bkr1lEghm11arOD/3IhTZDZQmn1iZZAOWBfItSjEoAvl2848D
	feJ4aHdqqaVtAt+8MvLWfFfpKe4CpMLmFzaVlJ9eV5C2m+V/ULRgg4QYnQp/CLUAXj0PvS8lch/oo
	phv0A1cuLWBwLRgSH+tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpf2k-0000000C1w5-05d4;
	Thu, 28 Mar 2024 01:59:02 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpf2g-0000000C1vS-16fT
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 01:59:00 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso441442276.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 18:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711591136; x=1712195936; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixVd6sHhRte5be07PDHwpHq0YTAzRJfXqkR9VbnbXt0=;
        b=h/k7MqaYr1y9x2RbXfxUMYQQVSPiB8qyxV15g97sOWP4R3iH6tNjBpYMdEL5wBZt3w
         1BIHxGDaVIyjeicyqYtYC6B/AQyhdGJ1Lti+9r7Z4jZf7+oborXK243wg7jhO32GOoof
         FlXxPwZg+Pk2XVmgRmXYdelkKCQo8Cswooagz360Y/v8ePYd7ewyLVCqK8Y1u5t3JQ+U
         8Sm231Njc06914C2j1WNEumlm0fplv8U7D/B4uYPCfSpmgCZmaJnSTnUQkMVXZrQE707
         1ie/aln5S4lcqF/VLvPrJsmlmqI0agd89MSCSjzTVPCQLQp7ZOmSpIhB2QHtsDe7AT+Q
         aDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711591136; x=1712195936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixVd6sHhRte5be07PDHwpHq0YTAzRJfXqkR9VbnbXt0=;
        b=s9S2M1Go12WyEBmpPC9IJiRfbY9n2pHL6KHfx0DYS2SHi2trHbEqpVDmwOCOmpi8R8
         tfRc5xTbpPZsSFk2yCYIwYxpgcGe5EJhwnimSAkUyrDQadV9up2aoBtiaJnCPHt4zSt3
         ovNzdl0XwYCYkmfu/pRydPIx0Hw5Uga03omQAN0R9YQMOiggXitchqvaz8BPqvWbFUCf
         hdl09dJpWuK5rLfJXRDEWmpJuk43GG32nHKSPZNe4Ytycvh7Oj0Q8VlFJLsWJOrjVBsa
         zbQSemjFKurQ5jrHEqajLaLaxmiAtYl0jBXZgZKMy/5r13c/bqRABi4xsUPK8/as+dIS
         Qiow==
X-Forwarded-Encrypted: i=1; AJvYcCUxL4w7sl2BpZECWde9WU8EOIVVlDbIZQmFCiu8GDg4z5RTnfhhB6s4V3qdbmbq7EGPifQZLd5pEhfpeIDL0vs9FGHy292uSH8vuJTY1PJe
X-Gm-Message-State: AOJu0Yyx9EDevhtydxG7xStQHB0dFgXG/WYsGGwk7NaC8hN9ar0/cjML
	S+4+8PX6Qe+RuIq0lKXsuAaeh5GsHub2b++5bICX9eQg6k1ww06gTiPVNUmqZUdnyQfTu8KoyWB
	S3RvEKreB8efcJLO+EGxrsNh6riyUYDUxprM8VA==
X-Google-Smtp-Source: AGHT+IFVk742SrsLxx/xN8qOIT0jNnA3IKiDDXlmlpeVRfNvYaVFpDTr5g+tJ4iscdYuJ4oZ7FJJqUipXvjVYpIdzJk=
X-Received: by 2002:a25:860b:0:b0:dc6:9c51:760f with SMTP id
 y11-20020a25860b000000b00dc69c51760fmr1468859ybk.56.1711591135824; Wed, 27
 Mar 2024 18:58:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240319215915.832127-1-samuel.holland@sifive.com>
 <20240319215915.832127-6-samuel.holland@sifive.com> <CAKC1njSg9-hJo6hibcM9a-=FUmMWyR39QUYqQ1uwiWhpBZQb9A@mail.gmail.com>
 <40ab1ce5-8700-4a63-b182-1e864f6c9225@sifive.com>
In-Reply-To: <40ab1ce5-8700-4a63-b182-1e864f6c9225@sifive.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 27 Mar 2024 18:58:45 -0700
Message-ID: <CAKC1njTOgsOCpLMCch_YBE+qDoewADhzWwjjfX9nhWCS9hs0mQ@mail.gmail.com>
Subject: Re: [RISC-V] [tech-j-ext] [RFC PATCH 5/9] riscv: Split per-CPU and
 per-thread envcfg bits
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, tech-j-ext@lists.risc-v.org, 
	Conor Dooley <conor@kernel.org>, kasan-dev@googlegroups.com, 
	Evgenii Stepanov <eugenis@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_185858_527577_4E0CB0DB 
X-CRM114-Status: GOOD (  13.54  )
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

T24gVHVlLCBNYXIgMTksIDIwMjQgYXQgNzoyMeKAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+ID4gICAgICAgICBlbHNlCj4gPiAgICAgICAg
ICAgICAgICAgcmVncy0+c3RhdHVzIHw9IFNSX1VYTF82NDsKPiA+ICAjZW5kaWYKPiA+ICsgICAg
ICAgY3VycmVudC0+dGhyZWFkX2luZm8uZW52Y2ZnID0gRU5WQ0ZHX0JBU0U7Cj4gPiAgfQo+ID4K
PiA+IEFuZCBpbnN0ZWFkIG9mIGNvbnRleHQgc3dpdGNoaW5nIGluIGBfc3dpdGNoX3RvYCwKPiA+
IEluIGBlbnRyeS5TYCBwaWNrIHVwIGBlbnZjZmdgIGZyb20gYHRocmVhZF9pbmZvYCBhbmQgd3Jp
dGUgaXQgaW50byBDU1IuCj4KPiBUaGUgaW1tZWRpYXRlIHJlYXNvbiBpcyB0aGF0IHdyaXRpbmcg
ZW52Y2ZnIGluIHJldF9mcm9tX2V4Y2VwdGlvbigpIGFkZHMgY3ljbGVzCj4gdG8gZXZlcnkgSVJR
IGFuZCBzeXN0ZW0gY2FsbCBleGl0LCBldmVuIHRob3VnaCBtb3N0IG9mIHRoZW0gd2lsbCBub3Qg
Y2hhbmdlIHRoZQo+IGVudmNmZyB2YWx1ZS4gVGhpcyBpcyBlc3BlY2lhbGx5IHRoZSBjYXNlIHdo
ZW4gcmV0dXJuaW5nIGZyb20gYW4gSVJRL2V4Y2VwdGlvbgo+IGJhY2sgdG8gUy1tb2RlLCBzaW5j
ZSBlbnZjZmcgaGFzIHplcm8gZWZmZWN0IHRoZXJlLgo+CgpBIHF1aWNrIG9ic2VydmF0aW9uOgpT
byBJIHRyaWVkIHRoaXMgb24gbXkgc2V0dXAuIFdoZW4gSSBwdXQgYHNlbnZjZmdgIHdyaXRlcyBp
bgpgX19zd2l0Y2hfdG8gYCBwYXRoLCBxZW11IHN1ZGRlbmx5Cmp1c3QgdGFua3MgYW5kIHRha2Vz
IGEgbG90IG9mIHRpbWUgdG8gYm9vdCB1cCBhcyBvcHBvc2VkIHRvIHdoZW4KYHNlbnZjZmdgIHdh
cyBpbiB0cmFwIHJldHVybiBwYXRoLgpJbiBteSBjYXNlIGVudGlyZSB1c2Vyc3BhY2UgKGFsbCBw
cm9jZXNzZXMpIGhhdmUgY2ZpIGVuYWJsZWQgZm9yIHRoZW0KdmlhIGBzZW52Y2ZnYCBhbmQgaXQg
Z2V0cwpjb250ZXh0IHN3aXRjaGVkLiBOb3Qgc3VyZSBpdCdzIHNwZWNpZmljIHRvIG15IHNldHVw
LiBJIGRvbid0IHRoaW5rIGl0CnNob3VsZCBiZSBhbiBpc3N1ZSBvbiBhY3R1YWwKaGFyZHdhcmUu
CgpTdGlsbCBkZWJ1Z2dpbmcgd2h5IGl0IHNsb3dzIGRvd24gbXkgcWVtdSBkcmFzdGljYWxseSB3
aGVuIHNhbWUgd3JpdGVzCnRvIHNhbWUgQ1NSCmFyZSBtb3ZlZCBmcm9tIGByZXRfZnJvbV9leGNl
cHRpb25gIHRvIGBzd2l0Y2hfdG9gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
