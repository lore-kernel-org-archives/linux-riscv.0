Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C67C52D6F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 13:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5qtWgdi6W7wNRP4IS5A3WpzXUxUZYIFFEpqTjws3fw0=; b=k14Q4YjGSGiwo2lXamGcROmBTg
	I8BFMZOBdWA7TpuwWzdURAa1fpbK+1P4E0wGTMCCd14rLWhgV0pF+eIgbSq7kET+aJowJHbVTYDTk
	OXflPSf+aJZF4uNJYMbQUHXz0EcGGfvixEc0fRk0pi2Fnjo35aL5BC74/UVUCR1UOUvMVOQs/sxUA
	PzR40tvg89XftWVHVmsjMo3sPtnjPvdpFM2U1di1KtQDsfa/6f6appSRyi6W/O3aDxOehWxCRftkx
	GPwRxBTIc8FtiEQ5GlkfFqq0DJ4uzmjCnfm0zhDe3rVk2FDMCGa+OK1ILRTkZUsJi5dS7TRhdB9KC
	Urgs2iCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc31n-00000008Llj-2co9;
	Thu, 08 Aug 2024 13:18:03 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc30b-00000008LP9-2Mwt
	for linux-riscv@lists.infradead.org;
	Thu, 08 Aug 2024 13:16:51 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-70e910f309eso1141153b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Aug 2024 06:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723123008; x=1723727808; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ep+xfrS41+80V4sejFNz0q3mTB6TQE8jTTfF1Jh5lTI=;
        b=z6A1KYZo1X++IZ+IoefuGK1xPN+ALFkB1CMjsYM8KH0e7R6uWFpW+C0GnNLih4ciNx
         205zFlHg8IysUiyZpAp9mNHaXrSdLSmvnwIrIMOs17WJeJ+3J879BJ+8RRW9VNi+yb+4
         B0z099LSgtQli3mz9p2kDmUhNqa5npwsHjOGe7Zi/8FOPH9mwejpNd81+5iU/0y3e23g
         G5r7Syd9lf/5zDB/EmnMSXncjcb5XmZgdLLnRjWPaXOcwRSQMPOJptW5jFubOV0W7ZLK
         H89tBudY4c09PWsZIPoohoecUDo5SBPnehtDPHVZ7ushKNoUxSfqgJomzYeEzPqoqh3z
         M5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723123008; x=1723727808;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ep+xfrS41+80V4sejFNz0q3mTB6TQE8jTTfF1Jh5lTI=;
        b=sPPDwaBluschjKNLfyZI/BQp49hW3TOexdKUtTMQ8i3nHgE5G9Q9Yrzw7lnumPwOVo
         N+XBrYs0E3NNBwiDeuqYBM7BGgU6yQ5WaK4TDyIN9FeinlfnXzmJg8lwYt1+WdH2ZKQo
         9N6e4mfwv4/0aqXuzIf9a9PbGtgkMh3Lu+NNTNYi/6Ynk7CIYFI3pTeRMSGfRu52StQK
         795cxpRX7fPXHdGcOtZtChF1f/Kz9ECxNl7Bdj+T5uioavuTiUZabuqULhYiItdhpWMH
         FBdSiXM651Scf0RK1WiGPnU/fWX9yUwAuRTfh3FF5H/MCIURZWVHBzm1n6iVslMYXsIF
         gIow==
X-Forwarded-Encrypted: i=1; AJvYcCW/HXTe8y4IJa6sLW4oPLna6nHxhiPvjp6DoB6lVKrvPlnqQbEpCnRpucPhCFCQqSeWa0pcI3Puu1lPCID8+wffxWv2IcerfRv1rCj5xNgI
X-Gm-Message-State: AOJu0YxYHZhbrHhJBOWq5tpjOLN6z1a1xMO1YNgAQUnM+3DZDzNqXh4p
	dFpl03fKsIdlSHnYVcY2dZXZhPpjX9VaBn/5a9Gi1Xt7I2dhKfGmH3Pp88Bn38mTkSOiv3JgATd
	H0A==
X-Google-Smtp-Source: AGHT+IHJBsGw5UgR/iugxzmSr+QeSrp5dZN/v/XODES4sTP0wn0G9d+/VHKS2R50We/GZxKaCQexvWJSP70=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2d8c:b0:70d:2a24:245d with SMTP id
 d2e1a72fcca58-710cae763e9mr108614b3a.3.1723123007877; Thu, 08 Aug 2024
 06:16:47 -0700 (PDT)
Date: Thu, 8 Aug 2024 06:16:46 -0700
In-Reply-To: <87bk23ql6n.fsf@draig.linaro.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-14-seanjc@google.com>
 <87bk23ql6n.fsf@draig.linaro.org>
Message-ID: <ZrTFPhy0e1fFb9vA@google.com>
Subject: Re: [PATCH v12 13/84] KVM: Annotate that all paths in hva_to_pfn()
 might sleep
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
X-CRM114-CacheID: sfid-20240808_061649_634203_E606C521 
X-CRM114-Status: GOOD (  11.71  )
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

T24gVGh1LCBBdWcgMDgsIDIwMjQsIEFsZXggQmVubsOpZSB3cm90ZToKPiBTZWFuIENocmlzdG9w
aGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4gd3JpdGVzOgo+IAo+ID4gTm93IHRoYXQgaHZhX3Rv
X3BmbigpIG5vIGxvbmdlciBzdXBwb3J0cyBiZWluZyBjYWxsZWQgaW4gYXRvbWljIGNvbnRleHQs
Cj4gPiBtb3ZlIHRoZSBtaWdodF9zbGVlcCgpIGFubm90YXRpb24gZnJvbSBodmFfdG9fcGZuX3Ns
b3coKSB0bwo+ID4gaHZhX3RvX3BmbigpLgo+IAo+IFRoZSBjb21tZW50YXJ5IGZvciBodmFfdG9f
cGZuX2Zhc3QgZGlzYWdyZWVzLgo+IAo+ICAgLyoKPiAgICAqIFRoZSBmYXN0IHBhdGggdG8gZ2V0
IHRoZSB3cml0YWJsZSBwZm4gd2hpY2ggd2lsbCBiZSBzdG9yZWQgaW4gQHBmbiwKPiAgICAqIHRy
dWUgaW5kaWNhdGVzIHN1Y2Nlc3MsIG90aGVyd2lzZSBmYWxzZSBpcyByZXR1cm5lZC4gIEl0J3Mg
YWxzbyB0aGUKPiAgICAqIG9ubHkgcGFydCB0aGF0IHJ1bnMgaWYgd2UgY2FuIGluIGF0b21pYyBj
b250ZXh0Lgo+ICAgICovCj4gICBzdGF0aWMgYm9vbCBodmFfdG9fcGZuX2Zhc3Qoc3RydWN0IGt2
bV9mb2xsb3dfcGZuICprZnAsIGt2bV9wZm5fdCAqcGZuKQo+IAo+IEF0IHdoaWNoIHBvaW50IGRp
ZCBpdCBsb29zZSB0aGUgYWJpbGl0eSB0byBydW4gaW4gdGhlIGF0b21pYyBjb250ZXh0PyBJCj4g
Y291bGRuJ3Qgd29yayBpdCBvdXQgZnJvbSB0aGUgY29tbWl0cy4KCkl0IGRpZG4ndCBsb3NlIHRo
ZSBhYmlsaXR5IHBlciBzZSAoY2FsbGluZyBodmFfdG9fcGZuX2Zhc3QoKSBpbiBhdG9taWMgY29u
dGV4dAp3b3VsZCBzdGlsbCBiZSBmdW5jdGlvbmFsbHkgb2spLCByYXRoZXIgdGhlIHByZXZpb3Vz
IHBhdGNoCgogIEtWTTogRHJvcCBAYXRvbWljIHBhcmFtIGZyb20gZ2ZuPT5wZm4gYW5kIGh2YT0+
cGZuIEFQSXMKCnJlbW92ZWQgc3VwcG9ydCBmb3IgZG9pbmcgc28gaW4gb3JkZXIgdG8gc2ltcGxp
ZnkgaHZhX3RvX3BmbigpIGFzIGEgd2hvbGUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
