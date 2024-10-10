Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114DDD24459
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 23:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lc2xoNXRtpGmTofFpPNwLwTx32tqwU/oquAiyzzOPDw=; b=oYkxyIVVU7Xa1k
	rybxygPhos+TRUpltUiLSRwlWMaM6PeQDUPqavZeysayjVBJAOZ0Or3gw0Vmd1LU4eO0/ZXq6lV2y
	1spWMtgjZ3umbWe9swe7x6J3gLF7gc6NDmcSnDeolJVvHxlQ2KC54wXLUoRtYdO3EYJFH6ZFxndep
	4iyb508sjbgZm7PQ7snr3+1g0zXKT7AZJjx5sp6d5zsGBXtmCT02UUnCNay2KZXVAwii1cAHlRNDM
	X7uJqkOr9+jcFq+wFOj4S5PtihoaYnmbUlRn4cFcLT/d7WwJbJeEYZf2Hu2z1OWQg8dkhgsgWafvN
	BAbz4+PL08HNzqekRKvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz2cy-0000000Ef4V-2rM2;
	Thu, 10 Oct 2024 23:31:28 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxrS-0000000DqYk-0ra1
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:26:08 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7e9fb5352dfso1520878a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584765; x=1729189565; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ByBZxBThzycQ9+5cWv7LHsEIs8PvxVG+sWS1etQw10Y=;
        b=VR8H35J0pZub8PS/JM9vp2UKN2Zg/mExpEpDuTzNIH+FW762bLByCaHMK7vSiwjC4T
         x8MhTpwSZld0moJyvFJhg/1ohUP78VLZJ2X6yOnBjBPRs6ofdVEEpZ+NJRm6GxM2xpIF
         vvKfeZIRuv9EOalwyRkzpan94NKDtcJUocISdZUZPJJRPvvy2UgbHhkgYUXorzexJZLT
         NrdOa2be9cJP1lh0sOESqVIGY224l57JOIbn+rYAnjihqpPZGA1yK9opXvvM7mbxD+LE
         3SPXzF81rFiZFm76cK9RPr7dhR2qr/NnlTVK8HwKmkY+DzSCLdf0+4721hzjhid+NXrL
         3Crg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584765; x=1729189565;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ByBZxBThzycQ9+5cWv7LHsEIs8PvxVG+sWS1etQw10Y=;
        b=hOlAz/UN6TmVijU5amNha9CfMrLdQSiogvv1oWvuoB5yQBfO4JF0SRoxD7wCnVwnP2
         KRvTVVBjaEFPm/FBpQnum7+uLFwuBdp3Jdifye/4tErnQCreZKw8DuKeOTcoArgTZ49L
         dob0ZtCQVTJiSMjUW0VC35suM9PZqgeoCYTxVZmjhjdT3AKXpPCrFeYhysVzoo/f3xYy
         6htW+BNiUZnNsMkmRb6kG5wFO+o7tuNoC8Baus65uejY+R8y9D/aovEOspew95U7iSeG
         M+QifhwF+3rnjgy/3aR/Rnc3836a/2DUHhc2UrbGU3Xp5efOo5c6TKB47Sw1T8+SbZYI
         J4bg==
X-Forwarded-Encrypted: i=1; AJvYcCUooy4O51osrXWB6QCkBhH5uYOWsKsSqQ6vhTSqJaASIXXVg0KLbtBb/J6z55AuXrUzmSy/5KfC9iFr2w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7If4gGnm5N2xSAFgmkjqqemFH5tB4YSdoowkqC2BKSIIp093v
	FBx4NeGG/yGui2bYyw1xzRN88hIXAvoiHslpnuYcCwYCY5jCGmcPA9SDDPKfOcMEcXqn30u5GSs
	CYw==
X-Google-Smtp-Source: AGHT+IE23QkhjcWr/3QASJ/S9+dapZUNy7Z4CCepJKqapzuUx8eBu6OhWGfM5laLrlsw47tRhKuFSYugMsQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:ff61:0:b0:7cb:c8c3:3811 with SMTP id
 41be03b00d2f7-7ea5356a658mr52a12.5.1728584764791; Thu, 10 Oct 2024 11:26:04
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:37 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-36-seanjc@google.com>
Subject: [PATCH v13 35/85] KVM: Disallow direct access (w/o mmu_notifier) to
 unpinned pfn by default
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_112606_373308_FF01BC20 
X-CRM114-Status: GOOD (  14.98  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QWRkIGFuIG9mZi1ieS1kZWZhdWx0IG1vZHVsZSBwYXJhbSB0byBjb250cm9sIHdoZXRoZXIgb3Ig
bm90IEtWTSBpcyBhbGxvd2VkCnRvIG1hcCBtZW1vcnkgdGhhdCBpc24ndCBwaW5uZWQsIGkuZS4g
dGhhdCBLVk0gY2FuJ3QgZ3VhcmFudGVlIHdvbid0IGJlCmZyZWVkIHdoaWxlIGl0IGlzIG1hcHBl
ZCBpbnRvIEtWTSBhbmQvb3IgdGhlIGd1ZXN0LiAgRG9uJ3QgcmVtb3ZlIHRoZQpmdW5jdGlvbmFs
aXR5IGVudGlyZWx5LCBhcyB0aGVyZSBhcmUgdXNlIGNhc2VzIHdoZXJlIG1hcHBpbmcgdW5waW5u
ZWQKbWVtb3J5IGlzIHNhZmUgKGFzIGRlZmluZWQgYnkgdGhlIHBsYXRmb3JtIG93bmVyKSwgZS5n
LiB3aGVuIG1lbW9yeSBpcwpoaWRkZW4gZnJvbSB0aGUga2VybmVsIGFuZCBtYW5hZ2VkIGJ5IHVz
ZXJzcGFjZSwgaW4gd2hpY2ggY2FzZSB1c2Vyc3BhY2UKaXMgYWxyZWFkeSBmdWxseSB0cnVzdGVk
IHRvIG5vdCBtdWNrIHdpdGggZ3Vlc3QgbWVtb3J5IG1hcHBpbmdzLgoKQnV0IGZvciBtb3JlIHR5
cGljYWwgc2V0dXBzLCBtYXBwaW5nIHVucGlubmVkIG1lbW9yeSBpcyB3aWxkbHkgdW5zYWZlLCBh
bmQKdW5uZWNlc3NhcnkuICBUaGUgQVBJcyBhcmUgdXNlZCBleGNsdXNpdmVseSBieSB4ODYncyBu
ZXN0ZWQgdmlydHVhbGl6YXRpb24Kc3VwcG9ydCwgYW5kIHRoZXJlIGlzIG5vIGtub3duIChvciBz
YW5lKSB1c2UgY2FzZSBmb3IgbWFwcGluZyBQRk4tbWFwcGVkCm1lbW9yeSBhIEtWTSBndWVzdCBf
YW5kXyBsZXR0aW5nIHRoZSBndWVzdCB1c2UgaXQgZm9yIHZpcnR1YWxpemF0aW9uCnN0cnVjdHVy
ZXMuCgpUZXN0ZWQtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KU2ln
bmVkLW9mZi1ieTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Ci0tLQog
dmlydC9rdm0va3ZtX21haW4uYyB8IDE4ICsrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDE4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS92aXJ0L2t2bS9rdm1fbWFpbi5jIGIv
dmlydC9rdm0va3ZtX21haW4uYwppbmRleCBiODQ1ZTkyNTI2MzMuLjZkY2I0ZjBlZWQzZSAxMDA2
NDQKLS0tIGEvdmlydC9rdm0va3ZtX21haW4uYworKysgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCkBA
IC05NCw2ICs5NCwxMyBAQCB1bnNpZ25lZCBpbnQgaGFsdF9wb2xsX25zX3NocmluayA9IDI7CiBt
b2R1bGVfcGFyYW0oaGFsdF9wb2xsX25zX3NocmluaywgdWludCwgMDY0NCk7CiBFWFBPUlRfU1lN
Qk9MX0dQTChoYWx0X3BvbGxfbnNfc2hyaW5rKTsKIAorLyoKKyAqIEFsbG93IGRpcmVjdCBhY2Nl
c3MgKGZyb20gS1ZNIG9yIHRoZSBDUFUpIHdpdGhvdXQgTU1VIG5vdGlmaWVyIHByb3RlY3Rpb24K
KyAqIHRvIHVucGlubmVkIHBhZ2VzLgorICovCitzdGF0aWMgYm9vbCBhbGxvd191bnNhZmVfbWFw
cGluZ3M7Cittb2R1bGVfcGFyYW0oYWxsb3dfdW5zYWZlX21hcHBpbmdzLCBib29sLCAwNDQ0KTsK
KwogLyoKICAqIE9yZGVyaW5nIG9mIGxvY2tzOgogICoKQEAgLTI4MTEsNiArMjgxOCw5IEBAIHN0
YXRpYyBrdm1fcGZuX3Qga3ZtX3Jlc29sdmVfcGZuKHN0cnVjdCBrdm1fZm9sbG93X3BmbiAqa2Zw
LCBzdHJ1Y3QgcGFnZSAqcGFnZSwKIAkgKiByZWZlcmVuY2UgdG8gc3VjaCBwYWdlcyB3b3VsZCBj
YXVzZSBLVk0gdG8gcHJlbWF0dXJlbHkgZnJlZSBhIHBhZ2UKIAkgKiBpdCBkb2Vzbid0IG93biAo
S1ZNIGdldHMgYW5kIHB1dHMgdGhlIG9uZSBhbmQgb25seSByZWZlcmVuY2UpLgogCSAqIERvbid0
IGFsbG93IHRob3NlIHBhZ2VzIHVudGlsIHRoZSBGSVhNRSBpcyByZXNvbHZlZC4KKwkgKgorCSAq
IERvbid0IGdyYWIgYSByZWZlcmVuY2UgZm9yIHBpbnMsIGNhbGxlcnMgdGhhdCBwaW4gcGFnZXMg
YXJlIHJlcXVpcmVkCisJICogdG8gY2hlY2sgcmVmY291bnRlZF9wYWdlLCBpLmUuIG11c3Qgbm90
IGJsaW5kbHkgcmVsZWFzZSB0aGUgcGZuLgogCSAqLwogCWlmIChtYXApIHsKIAkJcGZuID0gbWFw
LT5wZm47CkBAIC0yOTI5LDYgKzI5MzksMTQgQEAgc3RhdGljIGludCBodmFfdG9fcGZuX3JlbWFw
cGVkKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAogCWJvb2wgd3JpdGVfZmF1bHQgPSBrZnAt
PmZsYWdzICYgRk9MTF9XUklURTsKIAlpbnQgcjsKIAorCS8qCisJICogUmVtYXBwZWQgbWVtb3J5
IGNhbm5vdCBiZSBwaW5uZWQgaW4gYW55IG1lYW5pbmdmdWwgc2Vuc2UuICBCYWlsIGlmCisJICog
dGhlIGNhbGxlciB3YW50cyB0byBwaW4gdGhlIHBhZ2UsIGkuZS4gYWNjZXNzIHRoZSBwYWdlIG91
dHNpZGUgb2YKKwkgKiBNTVUgbm90aWZpZXIgcHJvdGVjdGlvbiwgYW5kIHVuc2FmZSB1bWFwcGlu
Z3MgYXJlIGRpc2FsbG93ZWQuCisJICovCisJaWYgKGtmcC0+cGluICYmICFhbGxvd191bnNhZmVf
bWFwcGluZ3MpCisJCXJldHVybiAtRUlOVkFMOworCiAJciA9IGZvbGxvd19wZm5tYXBfc3RhcnQo
JmFyZ3MpOwogCWlmIChyKSB7CiAJCS8qCi0tIAoyLjQ3LjAucmMxLjI4OC5nMDYyOThkMTUyNS1n
b29nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
