Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6406BC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 16:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+O4Yb61rLTGxxBjrTYFt6gVkQYvbudpkB+Zckk+kWg=; b=klagTk7i5l95BY
	tJOC8PJjjXyV57H9BTL7YKUGnAvxNWBXZ+9CHooIKYnboWbAdHJ8sNRwlAnHByBlBSw4Vy1hZiblV
	TNxakzrfPSxEhXB+gVa6S4L1kOA+EFSQrrWLItYlC4l/6TM6Me09yGA52KfNbYWtrt7fI7ieev0U0
	hcH0IT2eHU86SeSjizd0VokKKaJ36UJd2JiNiQomf9agcYB8MY0MQrNHSYWAbnPMMKVFthUDBpvBp
	SXjookPlnY0yyI0hZDRVHR3grD2qnYz72KslhORZf+t5P2rMqvYGIX8QXGyZ4vQiOS8jv31Li3pS2
	O0Dd0X7UXQTM/Ze+jn9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc5oy-00000008upo-3EML;
	Thu, 08 Aug 2024 16:17:00 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc5oL-00000008uaZ-0tWy
	for linux-riscv@lists.infradead.org;
	Thu, 08 Aug 2024 16:16:22 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2ef2cb7d562so10766601fa.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Aug 2024 09:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723133779; x=1723738579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLPa+w6AdBa1cUfelytt4eYDYgnS/jumqOLX9cOCUyA=;
        b=X5ZcwCrsr/D3ymKDQSEg8lAZzfQMMQ1mgpTG8Kv5Bk3Y4X3jnaICRFs6Y6B2MdpXYx
         VHraPX4p1erfN1C6bLHCYtoBtzaZmyictJsC0te4DzMPJeiuRo7d/bJ474vnzpykO6xC
         H+idraIyIyYjOxsNyhi8p1aM2LZ536x7O27i8V1KggoanWsCC2fYnK9nhcpwY2iPtKR+
         hwrujjYkzIAPGhCMX30r8twY56ovw9oNLV/wUFn4CX7NaCteYzX6wCo9lICm/Hjp01VO
         /AWGvxgRrnWiAH8ER7aqJEKf2ERSNDBfPoK2H6xWIvqYi7DZk8zdWbJUI83tngee+V5o
         Ljdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723133779; x=1723738579;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLPa+w6AdBa1cUfelytt4eYDYgnS/jumqOLX9cOCUyA=;
        b=WSWcQzN0kcRDpJKN84MHiPmXOXcznyhxoyEWMHDpwtmPWm7dnTt+aEJcyNhXBBXK+c
         qJiH/Jv5Xd93ltDDolaltHGfX79LoPY27c1/hziYBtpfOyN93VXvMacOa1o5o4jOXgAL
         oE4X/QUGAqn1XBVcq+8UeS53BcrR8UW5WKFkmw55cqmZjZtx35GsHJl1aLa1Up/gRkqI
         taI53lgmKEQJzyLY9qh8whiF44yMHAHqgqiFtH5wbFPOQk8IVmtvvhqfmlhnUJSKQc5C
         2JIFBS+CFWvcAA80/i03lunKYje+OKOZvUQuaregzRpndh3bTYG0SP08umKfno65dy4Y
         sQJw==
X-Forwarded-Encrypted: i=1; AJvYcCXUqdmvRWw5ihmdK6dqeiCPMkCEWqR2H8Mmervo08Agg8PcUxRQVvQKpLo7rDCMDqVux4VnCuADZwO2AJn9x4uXU/udt14Uk4yY0c9dhVFp
X-Gm-Message-State: AOJu0YzXL+xSJ5+gMWvpbjuM23hMrzPlEQGewLYqhY+gYs3kDZpF4Glr
	OpKmMR+k9GK+Z5JrCTEx5zZc6viyJLHvdqQgYLDGEr0Yt0GqMzjiO1M3kQlLIJQ=
X-Google-Smtp-Source: AGHT+IFeg1aw2R2jdtW33+RTmD0GoFD4AbJwR/eufpV8IO4HacBEUsTerwG6znblRji34uNx3VzDqg==
X-Received: by 2002:a2e:331a:0:b0:2f0:2d85:2238 with SMTP id 38308e7fff4ca-2f19de75d02mr16453671fa.44.1723133777752;
        Thu, 08 Aug 2024 09:16:17 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d27229eaasm2377515f8f.103.2024.08.08.09.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 09:16:16 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 824915F769;
	Thu,  8 Aug 2024 17:16:15 +0100 (BST)
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
In-Reply-To: <ZrTk4sQS8k1-GBb3@google.com> (Sean Christopherson's message of
	"Thu, 8 Aug 2024 08:31:46 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-14-seanjc@google.com>
	<87bk23ql6n.fsf@draig.linaro.org> <ZrTFPhy0e1fFb9vA@google.com>
	<877ccrqc06.fsf@draig.linaro.org> <ZrTk4sQS8k1-GBb3@google.com>
Date: Thu, 08 Aug 2024 17:16:15 +0100
Message-ID: <8734nfq9bk.fsf@draig.linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_091621_264447_3A0D0DD5 
X-CRM114-Status: GOOD (  13.97  )
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

U2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+IHdyaXRlczoKCj4gT24gVGh1
LCBBdWcgMDgsIDIwMjQsIEFsZXggQmVubsOpZSB3cm90ZToKPj4gU2VhbiBDaHJpc3RvcGhlcnNv
biA8c2VhbmpjQGdvb2dsZS5jb20+IHdyaXRlczoKPj4gCj4+ID4gT24gVGh1LCBBdWcgMDgsIDIw
MjQsIEFsZXggQmVubsOpZSB3cm90ZToKPj4gPj4gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vhbmpj
QGdvb2dsZS5jb20+IHdyaXRlczoKPj4gPj4gCj4+ID4+ID4gTm93IHRoYXQgaHZhX3RvX3Bmbigp
IG5vIGxvbmdlciBzdXBwb3J0cyBiZWluZyBjYWxsZWQgaW4gYXRvbWljIGNvbnRleHQsCj4+ID4+
ID4gbW92ZSB0aGUgbWlnaHRfc2xlZXAoKSBhbm5vdGF0aW9uIGZyb20gaHZhX3RvX3Bmbl9zbG93
KCkgdG8KPj4gPj4gPiBodmFfdG9fcGZuKCkuCj4+ID4+IAo+PiA+PiBUaGUgY29tbWVudGFyeSBm
b3IgaHZhX3RvX3Bmbl9mYXN0IGRpc2FncmVlcy4KPj4gPj4gCj4+ID4+ICAgLyoKPj4gPj4gICAg
KiBUaGUgZmFzdCBwYXRoIHRvIGdldCB0aGUgd3JpdGFibGUgcGZuIHdoaWNoIHdpbGwgYmUgc3Rv
cmVkIGluIEBwZm4sCj4+ID4+ICAgICogdHJ1ZSBpbmRpY2F0ZXMgc3VjY2Vzcywgb3RoZXJ3aXNl
IGZhbHNlIGlzIHJldHVybmVkLiAgSXQncyBhbHNvIHRoZQo+PiA+PiAgICAqIG9ubHkgcGFydCB0
aGF0IHJ1bnMgaWYgd2UgY2FuIGluIGF0b21pYyBjb250ZXh0Lgo+PiA+PiAgICAqLwo+PiA+PiAg
IHN0YXRpYyBib29sIGh2YV90b19wZm5fZmFzdChzdHJ1Y3Qga3ZtX2ZvbGxvd19wZm4gKmtmcCwg
a3ZtX3Bmbl90ICpwZm4pCj4+ID4+IAo+PiA+PiBBdCB3aGljaCBwb2ludCBkaWQgaXQgbG9vc2Ug
dGhlIGFiaWxpdHkgdG8gcnVuIGluIHRoZSBhdG9taWMgY29udGV4dD8gSQo+PiA+PiBjb3VsZG4n
dCB3b3JrIGl0IG91dCBmcm9tIHRoZSBjb21taXRzLgo+PiA+Cj4+ID4gSXQgZGlkbid0IGxvc2Ug
dGhlIGFiaWxpdHkgcGVyIHNlIChjYWxsaW5nIGh2YV90b19wZm5fZmFzdCgpIGluIGF0b21pYyBj
b250ZXh0Cj4+ID4gd291bGQgc3RpbGwgYmUgZnVuY3Rpb25hbGx5IG9rKSwgcmF0aGVyIHRoZSBw
cmV2aW91cyBwYXRjaAo+PiA+Cj4+ID4gICBLVk06IERyb3AgQGF0b21pYyBwYXJhbSBmcm9tIGdm
bj0+cGZuIGFuZCBodmE9PnBmbiBBUElzCj4+ID4KPj4gPiByZW1vdmVkIHN1cHBvcnQgZm9yIGRv
aW5nIHNvIGluIG9yZGVyIHRvIHNpbXBsaWZ5IGh2YV90b19wZm4oKSBhcyBhIHdob2xlLgo+PiAK
Pj4gSXQgc3RpbGwgc3RpY2tzIG91dCBnaXZlbiB0aGUgb25seSBjYWxsZXIgbm8gbG9uZ2VyIGVu
Zm9yY2VzIHRoaXMuIAo+Cj4gT2gsIHNvcnJ5LCBJIHNob3VsZCBoYXZlIGJlZW4gbW9yZSBleHBs
aWNpdC4gIEknbGwgZml4IHRoZSBjb21tZW50LCBJIHNpbXBseQo+IG1pc3NlZCBpdC4KCk5vIHdv
cnJpZXMsIHdpdGggdGhlIGZpeGVkIGNvbW1lbnQ6CgpSZXZpZXdlZC1ieTogQWxleCBCZW5uw6ll
IDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgoKLS0gCkFsZXggQmVubsOpZQpWaXJ0dWFsaXNhdGlv
biBUZWNoIExlYWQgQCBMaW5hcm8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
