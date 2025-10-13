Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B58CCD185
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 22:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TcrqRzQKfOXfiO9ORH7Td/9yGctrNgyfaEQ1fvkoFRE=; b=GrjxTI9RrAFwRA
	tZ7VkjMhCRShSpXtrzMyPPatJ/HzjicS/3S537qsobsYnGoolNXNc/BcmqP6iJQs0WUWJ2FO/bdfh
	FCf11GmZM/k3B7AyxcCM6zEj/8gSVReLEecFhxlFL6IW64Mtl+l7ShKv0I/wzP1AzB0HUSDjoQc/6
	PTpY8fyyFmiFeBbH07/Ac/yEqBrBHEDlOIK8EZal4436BpiahIyhbJDidtT5t1mK1EKKF/9krBDsN
	Zg/RFct2T2tkt6HhkJZiyYSOAwgoVqRUKacy6sdRkgXLlw0sRMsSMfSVpCXJwpjY8AKwx5SaH/ufi
	+BOBhBWhiCqvy+HqaOmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8RDX-0000000Ej24-48PS;
	Mon, 13 Oct 2025 22:40:35 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8RDV-0000000Ej1E-21lZ
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 22:40:34 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7bc626c5467so3711437a34.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 15:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760395231; x=1761000031; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XwbGv4J28a1dG4lLmSXG6e+W+t/2iTnwMsiuMvjryc0=;
        b=AMA35ahvxvmelpfkeOvPjusSpRQKnFrrf+80KuzZcxWQZRFjKDJ6U9Pk2/IuhDh2vM
         z711RuUInrgjMxIWHnwkTCOmD9lH7svZ1s/hFn510qVTabluUeIWVPJ4Bzom5kVZT9oU
         eoi8dawRaIefXWYGX5e1dGduXj2vyBcMqCxm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760395231; x=1761000031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwbGv4J28a1dG4lLmSXG6e+W+t/2iTnwMsiuMvjryc0=;
        b=WmH9fZ8JeSXMqGTHDy7OAgbNLeKWucfkUnLvrEKjv7TSKNBARbZYtIpf/8TMQGXP8v
         5Z0BqayyWgsYkvl2JoQiGWE54jXxk7lodhMPe8GfJpdzuWXq1gCpT70v0aMhkl3CF9an
         Rcd2uEfMy0a11Sd1BQUdg/PIr/VnFJjEFoHCm+iHYhfF0iKDa71jRdWNu7a5Nf8Z/0Ua
         PXP/P/sqwI5AEtLcotwEJJy1Gk+QANLgE3AvvVpSH3IDLKKFsRzcJ9r/5NIwBjZiLpBR
         gEUlbve4XqlbEi4FbHvRfpYORoqUNRLR2mqNNFWE7zuTuTKF6UDleDjflaM5b4CHezgg
         Ticw==
X-Forwarded-Encrypted: i=1; AJvYcCUZj2KPwjxmMDFobWPKY8Ck3lQUWrusbwQErDrYW5vexZ9VMCGkov5yCbpH/bIqoLpi7k2gLsOVQjrk3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZU0rRnjPiAQ5Zv60nO0LcYh398CP7DXV1RapxvDGIXfXr0nqu
	/AJZww4knL6URlIV7rJxLtFNmQPJHpRRNm93sybFryrLYOh3FpKeL1Ob7ccjL6cNtpBVuorLMm4
	AraY=
X-Gm-Gg: ASbGnctRe4AlURaxp75/hte1NjAijxRgb5zz6AcAhW5NslxyOEZrFl4jnA0ycv9N800
	E2LMx8zmtnd7sGgDl8LjpWlN3+zbBoZnxMRtX+cXqB6jqJdMm9USoHxarPwu8eo6rxa/cKYehLv
	v6ATsc/KX+wSnfw0tTjr2t4pTBTfakpeQwKIr3ea2W+dY0NNY3US84EvfGfPMnWRlamlCvOiLUm
	VuFkHIDWAgPFedFdimfKM5f8GE5mDMuIddP9nxtmhS0B92CrunSEu9hEHud7a/GP4d6CyK9dLio
	8xB4TXCNGv6Kq3c3ZMLRSvC1d6fJrlytFzVdfmN5ybnHdb/RthFoQzmjS45tRfeXJ84QE1Sm3gx
	QIotwhI15TciKVc9lps0Jszro3cBlH/hpjSj2bI12rBcBI0RA9ZitkmlsR5SotrYHX4E1NlAQLW
	S79ZR1XsB9Fhr5TjU=
X-Google-Smtp-Source: AGHT+IFFYmJBadduYS6ZwKQFJ+IUsEOK9IBWSahXUjfaGf/wRk8N/Hupa6A+3+q4egLtn1Ubt/btvA==
X-Received: by 2002:a05:6830:641c:b0:757:a00:83f5 with SMTP id 46e09a7af769-7c0df7fba0fmr12219856a34.35.1760395231627;
        Mon, 13 Oct 2025 15:40:31 -0700 (PDT)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com. [209.85.210.42])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c0f8f18f29sm3910832a34.0.2025.10.13.15.40.28
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 15:40:30 -0700 (PDT)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7b00927607eso3415063a34.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 15:40:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXphZgQAvJQrzW/TmzUV4xolSynOB1DiTJ7+FRer4RFz99NieCyjM09Zk1AllFwG+XFlUMf4/ohFe/t2w==@lists.infradead.org
X-Received: by 2002:a17:903:11cf:b0:269:63ea:6d4e with SMTP id
 d9443c01a7336-290272c1aa5mr269142435ad.37.1760394855700; Mon, 13 Oct 2025
 15:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <20251009032838.63060-1-cuiyunhui@bytedance.com> <20251009032838.63060-2-cuiyunhui@bytedance.com>
In-Reply-To: <20251009032838.63060-2-cuiyunhui@bytedance.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 Oct 2025 15:34:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VcgDFk-Ad8nhOYK8Ay_8==3JRxaZ=8j3SHCa2rTKJCTA@mail.gmail.com>
X-Gm-Features: AS18NWDRlpKOc8vUNSnX7EzUSo2l7O6rFyMCga60WeZRtc9k0KplotG4eFs760Y
Message-ID: <CAD=FV=VcgDFk-Ad8nhOYK8Ay_8==3JRxaZ=8j3SHCa2rTKJCTA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] watchdog: move arm64 watchdog_hld into common code
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atish.patra@linux.dev, catalin.marinas@arm.com, 
	johannes@sipsolutions.net, lihuafei1@huawei.com, mark.rutland@arm.com, 
	masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_154033_542796_98C378C9 
X-CRM114-Status: GOOD (  15.92  )
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

SGksCgpPbiBXZWQsIE9jdCA4LCAyMDI1IGF0IDg6MjnigK9QTSBZdW5odWkgQ3VpIDxjdWl5dW5o
dWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBNb3ZlIHRoZSBjb250ZW50cyBvZiBhcmNoL2Fy
bTY0L3dhdGNoZG9nX2hsZC5jIHRvIGtlcm5lbC93YXRjaGRvZ19wZXJmLmMKPiB0byBjcmVhdGUg
YSBnZW5lcmljIGltcGxlbWVudGF0aW9uIHRoYXQgY2FuIGJlIHJldXNlZCBieSBvdGhlciBhcmNo
LAo+IHN1Y2ggYXMgUklTQy1WLgo+Cj4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVu
aHVpQGJ5dGVkYW5jZS5jb20+Cj4gLS0tCj4gIGFyY2gvYXJtNjQvS2NvbmZpZyAgICAgICAgICAg
ICAgIHwgIDIgKwo+ICBhcmNoL2FybTY0L2tlcm5lbC9NYWtlZmlsZSAgICAgICB8ICAxIC0KPiAg
YXJjaC9hcm02NC9rZXJuZWwvd2F0Y2hkb2dfaGxkLmMgfCA5NCAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL3BlcmYvYXJtX3BtdS5jICAgICAgICAgICB8IDEwICsr
Ky0KPiAgaW5jbHVkZS9saW51eC9wZXJmL2FybV9wbXUuaCAgICAgfCAgMiAtCj4gIGtlcm5lbC93
YXRjaGRvZ19wZXJmLmMgICAgICAgICAgIHwgODMgKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kwo+ICBsaWIvS2NvbmZpZy5kZWJ1ZyAgICAgICAgICAgICAgICB8ICA4ICsrKwo+ICA3IGZpbGVz
IGNoYW5nZWQsIDEwMiBpbnNlcnRpb25zKCspLCA5OCBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvYXJtNjQva2VybmVsL3dhdGNoZG9nX2hsZC5jCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm02NC9LY29uZmlnIGIvYXJjaC9hcm02NC9LY29uZmlnCj4gaW5kZXggYjU0Mzhm
ZjQ3NzJjZS4uNDc1OWU0OTY5YzRhNiAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L0tjb25maWcK
PiArKysgYi9hcmNoL2FybTY0L0tjb25maWcKPiBAQCAtMjMxLDYgKzIzMSw4IEBAIGNvbmZpZyBB
Uk02NAo+ICAgICAgICAgc2VsZWN0IEhBVkVfR0NDX1BMVUdJTlMKPiAgICAgICAgIHNlbGVjdCBI
QVZFX0hBUkRMT0NLVVBfREVURUNUT1JfUEVSRiBpZiBQRVJGX0VWRU5UUyAmJiBcCj4gICAgICAg
ICAgICAgICAgIEhXX1BFUkZfRVZFTlRTICYmIEhBVkVfUEVSRl9FVkVOVFNfTk1JCj4gKyAgICAg
ICBzZWxlY3QgV0FUQ0hET0dfUEVSRl9BREpVU1RfUEVSSU9EIGlmIEhBUkRMT0NLVVBfREVURUNU
T1JfUEVSRiAmJiBcCj4gKyAgICAgICBDUFVfRlJFUQoKbml0OiB0aGUgbGluZSBsaW1pdCBpcyBn
ZW5lcmFsbHkgYWNjZXB0ZWQgdG8gYmUgfjEwMCBjaGFyYWN0ZXJzIG5vdy4KSXQgd291bGQgYmUg
bmljZSBub3QgdG8gd3JhcC4gSWYgeW91IHJlYWxseSBuZWVkIHRvIHdyYXAsIGluZGVudCBsaWtl
CnRoZSB3cmFwcGluZyBhYm92ZS4KCkluIGFueSBjYXNlLCB0aGlzIHNlZW1zIGxpa2UgYSByZWFz
b25hYmxlIHRoaW5nIHRvIGRvIHRvIG1lLgoKUmV2aWV3ZWQtYnk6IERvdWdsYXMgQW5kZXJzb24g
PGRpYW5kZXJzQGNocm9taXVtLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
