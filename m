Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50490C52D7B
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 15:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AQStvAKzS/14IjyNAZTRd8m3HH71Yodcwa7qy3Kw3V0=; b=MqgnUGs4bjmpav
	i2hS4D2l7XIeM9LqnZzirEyzx3nCmus9hXRlrdoZLVTGU69sMfadspwpKJEJBtApM8NoIWF7oB/WW
	v07r0HyIl4PvoAsNAh/ExnDCra3tOSK44j/gRBd/0wH2KhX7FTDfm2RRh+qJ6ADIkwizd4NXjnrlB
	J5rf7MmbYgtcR3hoLTmGz7X0b4TsArLoSZ6llwjlOtctoORvXmsdwxzfFxTPZ87dr05Pt6D/OeF49
	A4sW/LJqTHF0dpoNEaRv9bWOanpdN8fU4/WuoXEyNRfHi2ejJs5xBJ1Ul/ENpAIMIZ2mwjyFvkoyz
	cpFxrZzsIi+jRLMRSjUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc4uH-00000008hBf-2E8R;
	Thu, 08 Aug 2024 15:18:25 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc4uD-00000008h9f-2qia
	for linux-riscv@lists.infradead.org;
	Thu, 08 Aug 2024 15:18:23 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-428163f7635so8168855e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 Aug 2024 08:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723130300; x=1723735100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tobJ9z30Evl1jF8OZuU4Lc5uAJoWjkGhLZnI88VCnqo=;
        b=kU1iypMOLnvqdo77GI54u6VhIOqBlPy7uTmocnxlf6/YheRaQkS2iwG7byo9Jdmf9T
         7fDCeyrKE4rQnkTV7FDTYOMgN/CBplhrUTUsay+EAyd2Kf8+ke/W037UpBwPonFYBG+k
         33+FLXunbqXsOmnnQNZVbSJaTXpbEM42vGuX48Tetr1lF0QZL6kJVV3YWjh3T+B14sjo
         Kt3me4WBLq37711hDl4qq5Hnesea0NcYLPzbkWpmTQ+OTr8VbY8jLs5mnryo7vR2vtVZ
         cVJGtFH8dlJ7qLKwJl7HmgkwlSoVD2MHYVDxoKGxyiH/0Rt0e1YhhF1X07OTmmZfNxZ4
         RjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723130300; x=1723735100;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tobJ9z30Evl1jF8OZuU4Lc5uAJoWjkGhLZnI88VCnqo=;
        b=FHMyGsX9vAp1huDqkLz9ZRVnrOfShLcQeAx8TGWHMa+TrYFz0Q6OH22QadJDJdWplf
         QoKxIlPpbmKMmSdar69SBPN9HfAqKIJruGEZi9DsRyfxY+qnJqlqezhwViVx1Xumfgr2
         6i4KJBS+BEWU7ecPHAG9R1KIpzyn+maPR9QnQo3eKCl5j4hHKJK22EUjDSr4MO2Di81C
         Huknbu/YdgN4t3WfbHArzsdlvGykhJTSA1iBA8NMoP+V/OF7AelE1v/be/+JV5um5JK9
         s1hHQ1DbLGT2HhYWY2sg3DjsqZ+wSFuR7JGS0gNDbD2f8itOXBG5ONzjy+X5GdEviLQY
         YXrw==
X-Forwarded-Encrypted: i=1; AJvYcCUXIJk2wy+PpyCkeO5RR6Zp/gLVsu+Ab+k3oCyj8KDf+wYzRtVJFCXyaVOYMnaDH/UezNeQh2mF5kMBZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmZy3gTmjzWHeuqLENYy7/FnqATxfRX4Px2nxJKhWit4Zqhyln
	bJTsp7dEU5Sgrk4HPMefsg2+UQFsrfJ6v6UFCBNoAuQ219l2GnZSo7EHtaK999w=
X-Google-Smtp-Source: AGHT+IGvryFhFZyruwyY4esgEivQLYITNxgcfgoPAmbjFk+Vzw8kMU8OO4VMz6KIvqZ2Rys90VZ6yQ==
X-Received: by 2002:a05:600c:1914:b0:426:4f47:6037 with SMTP id 5b1f17b1804b1-4290af13367mr16171145e9.19.1723130299428;
        Thu, 08 Aug 2024 08:18:19 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059a5dbbsm78703665e9.36.2024.08.08.08.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 08:18:18 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id BF0C45F769;
	Thu,  8 Aug 2024 16:18:17 +0100 (BST)
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
In-Reply-To: <ZrTFPhy0e1fFb9vA@google.com> (Sean Christopherson's message of
	"Thu, 8 Aug 2024 06:16:46 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-14-seanjc@google.com>
	<87bk23ql6n.fsf@draig.linaro.org> <ZrTFPhy0e1fFb9vA@google.com>
Date: Thu, 08 Aug 2024 16:18:17 +0100
Message-ID: <877ccrqc06.fsf@draig.linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_081821_911404_FC11DA3E 
X-CRM114-Status: GOOD (  11.35  )
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
biA8c2VhbmpjQGdvb2dsZS5jb20+IHdyaXRlczoKPj4gCj4+ID4gTm93IHRoYXQgaHZhX3RvX3Bm
bigpIG5vIGxvbmdlciBzdXBwb3J0cyBiZWluZyBjYWxsZWQgaW4gYXRvbWljIGNvbnRleHQsCj4+
ID4gbW92ZSB0aGUgbWlnaHRfc2xlZXAoKSBhbm5vdGF0aW9uIGZyb20gaHZhX3RvX3Bmbl9zbG93
KCkgdG8KPj4gPiBodmFfdG9fcGZuKCkuCj4+IAo+PiBUaGUgY29tbWVudGFyeSBmb3IgaHZhX3Rv
X3Bmbl9mYXN0IGRpc2FncmVlcy4KPj4gCj4+ICAgLyoKPj4gICAgKiBUaGUgZmFzdCBwYXRoIHRv
IGdldCB0aGUgd3JpdGFibGUgcGZuIHdoaWNoIHdpbGwgYmUgc3RvcmVkIGluIEBwZm4sCj4+ICAg
ICogdHJ1ZSBpbmRpY2F0ZXMgc3VjY2Vzcywgb3RoZXJ3aXNlIGZhbHNlIGlzIHJldHVybmVkLiAg
SXQncyBhbHNvIHRoZQo+PiAgICAqIG9ubHkgcGFydCB0aGF0IHJ1bnMgaWYgd2UgY2FuIGluIGF0
b21pYyBjb250ZXh0Lgo+PiAgICAqLwo+PiAgIHN0YXRpYyBib29sIGh2YV90b19wZm5fZmFzdChz
dHJ1Y3Qga3ZtX2ZvbGxvd19wZm4gKmtmcCwga3ZtX3Bmbl90ICpwZm4pCj4+IAo+PiBBdCB3aGlj
aCBwb2ludCBkaWQgaXQgbG9vc2UgdGhlIGFiaWxpdHkgdG8gcnVuIGluIHRoZSBhdG9taWMgY29u
dGV4dD8gSQo+PiBjb3VsZG4ndCB3b3JrIGl0IG91dCBmcm9tIHRoZSBjb21taXRzLgo+Cj4gSXQg
ZGlkbid0IGxvc2UgdGhlIGFiaWxpdHkgcGVyIHNlIChjYWxsaW5nIGh2YV90b19wZm5fZmFzdCgp
IGluIGF0b21pYyBjb250ZXh0Cj4gd291bGQgc3RpbGwgYmUgZnVuY3Rpb25hbGx5IG9rKSwgcmF0
aGVyIHRoZSBwcmV2aW91cyBwYXRjaAo+Cj4gICBLVk06IERyb3AgQGF0b21pYyBwYXJhbSBmcm9t
IGdmbj0+cGZuIGFuZCBodmE9PnBmbiBBUElzCj4KPiByZW1vdmVkIHN1cHBvcnQgZm9yIGRvaW5n
IHNvIGluIG9yZGVyIHRvIHNpbXBsaWZ5IGh2YV90b19wZm4oKSBhcyBhIHdob2xlLgoKSXQgc3Rp
bGwgc3RpY2tzIG91dCBnaXZlbiB0aGUgb25seSBjYWxsZXIgbm8gbG9uZ2VyIGVuZm9yY2VzIHRo
aXMuIAoKSG93IGFib3V0OgoKICAgICogdHJ1ZSBpbmRpY2F0ZXMgc3VjY2Vzcywgb3RoZXJ3aXNl
IGZhbHNlIGlzIHJldHVybmVkLiAgSXQncyBhbHNvIHRoZQogICAgKiBvbmx5IHBhcnQgdGhhdCBj
b3VsZCBydW4gaW4gYW4gYXRvbWljIGNvbnRleHQgaWYgd2Ugd2FudGVkIHRvCiAgICAqIChhbHRo
b3VnaCBubyBjYWxsZXJzIGV4cGVjdCBpdCB0bykuCgo/CgotLSAKQWxleCBCZW5uw6llClZpcnR1
YWxpc2F0aW9uIFRlY2ggTGVhZCBAIExpbmFybwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
