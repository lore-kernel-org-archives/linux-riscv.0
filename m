Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987BFC7115D
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 05:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lsGY6/cdYjs9/4omuIrlSQvbaqLgwVLsK/IIY+ER2hM=; b=4yex0PryM/3W65
	wNG8bWRicm1z/8ExU6ioTmEdj4yumkfnJ84eHks3K9Sq14mH8MyGWgE+ESCgL5XS9cNwtcklWKXs4
	JnNkvduvY8l3mDerfG5HjGSTqcSgKANfA9D5VaQPL3RAUenyYifJLSrw+O3GqlhxOewhPNRj5gx/X
	ZFc03fYx28L2qlzRs07CndyN/ud3GHiCKGw5E21jUcQ5YucKU3QzXzEufsHtwLdNA1QU+3t+mjS1S
	7c0eMz9cufAKzeC3M23eGKGG1Nj4dlw93DVHRuKLqxPsm3OYyphcgYxjSYxGNgv7K1Y3f8sVq+Q7l
	3mHISnSKHothPoItZE2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjXYf-00000000Zg3-00zJ;
	Thu, 29 Aug 2024 05:18:57 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjXYb-00000000ZfB-2avs
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 05:18:54 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-53346132365so313842e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 22:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724908732; x=1725513532; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADd1pz5qb8GZVaGnMeyK+BMDRUUvVX49wNmIVUmxoso=;
        b=nzOGgPxswCuSRO65J4rgkfpKy1KX1MzeF5MGyYLWYed4FBPNFyRCqLUMF/2ZVfukzt
         lFAY8QrBGqq8om8apiUFJKqPia7StbV47QstZ0usBVkUxteZxiENgjTzrOssSGrKHxeQ
         vPlK6w51jKjURO6m+xSneXH2elZCLR9gFkJrQHgPkXs9gHiiF5XWngvzwpGQN6V2ILne
         SAHspwYOu8DTli68Q/YdD6znfrUGaqgnslSu0NX40PsB/Mm2tDz/2Sea13ZUa8eTYZif
         Q5D6DETOe00qb4UdWbjgwhgD0TW+DwQSu1adsXhGwkOJDw5CX9NXJuUUI7Prcyn2D0zp
         Amag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724908732; x=1725513532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADd1pz5qb8GZVaGnMeyK+BMDRUUvVX49wNmIVUmxoso=;
        b=SbHC4/8RVqFcgmW2Nz7t67IOTxaXuOlT+2Dmt/hWJ3ZmeoGzcXhFinUESW2aXQkB6I
         9i+z+5dQkN/O9sWkwQ5s8WZU8wVtKoxJmkqCeQyaAh/LgloXJuaUoxZTBnYRRvtWGMwH
         Q5JIOg+bsADXVXTNqDhoEGDNAjP7v6jvcScvPg1uGeadqa8nELVZDxwhqZeVI6MN9K1J
         hvL3/4wHjDLKwEoOSRjqngiF746i9ZRVGR4+pAl7jnciUiYIlxKkqtAsQPPErpa8hJFR
         s2dsjvt6qIt5trf/4pPXElxKhFAr8QsJS3yDuIQqVz+Elj3vu6QFx8RjtG18vXFqS+9Z
         f+2A==
X-Forwarded-Encrypted: i=1; AJvYcCXDZJlvzxma/AAVb+UZrSCCtyQpCHEoZpFl1BmL5Q38RUYs2qu7c7ezeqk/CQj6sy1pHVF0O2iaAHRzuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxcLQFsjY+Sp3oAr7aPGRfPmqR+03tJiGkEIH+38s4t5mP9cYSY
	2CIq1xYYIKsRTlH9N9rSeiugsME8xcTdb5Uy/TKIfQkzWj14U/kQuG/s6DJtcZkRQAlo2/NkflV
	jubgRTOG2vf5NrS5ZJvFF1Vp/ZfjJGZPoW/zapg==
X-Google-Smtp-Source: AGHT+IFRqTsQ8ZecaWgM2Dv+1zg5sGgzkhwWVX9acELeYxsUIxzlJDrqJ7iynAbrAbJ7Rf0HT/LZsQk0wrd27CzsnIQ=
X-Received: by 2002:a05:6512:12d1:b0:533:7ce:20e0 with SMTP id
 2adb3069b0e04-5353e548573mr869523e87.8.1724908731314; Wed, 28 Aug 2024
 22:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240829033904.477200-1-nick.hu@sifive.com> <20240829033904.477200-3-nick.hu@sifive.com>
In-Reply-To: <20240829033904.477200-3-nick.hu@sifive.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 29 Aug 2024 10:48:40 +0530
Message-ID: <CAK9=C2Xui8c0b55WrZxCZYqK=AFmiPT+nG8d_E0d7SpamwvO-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] time-riscv: Stop stimecmp when cpu hotplug
To: Nick Hu <nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_221853_679592_6064BCE8 
X-CRM114-Status: GOOD (  19.25  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, zong.li@sifive.com, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Pavel Machek <pavel@ucw.cz>, Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBBdWcgMjksIDIwMjQgYXQgOToxMOKAr0FNIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBTdG9wIHRoZSBzdGltZWNtcCB3aGVuIHRoZSBjcHUgaXMgZ29pbmcg
dG8gYmUgb2ZmIG90aGVyd2lzZSB0aGUgdGltZXIKPiBpbnRlcnJ1cHQgbWF5IHBlbmRpbmcgd2hp
bGUgcGVyZm9ybWluZyBwb3dlciBkb3duIG9wZXJhdGlvbi4KPgo+IFNpZ25lZC1vZmYtYnk6IE5p
Y2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9jbG9ja3NvdXJjZS90
aW1lci1yaXNjdi5jIHwgMjIgKysrKysrKysrKysrKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMTUgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVy
LXJpc2N2LmMKPiBpbmRleCA0OGNlNTBjNWY1ZTYuLjlhNmFjYWE4ZGZiMCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMKPiArKysgYi9kcml2ZXJzL2Nsb2Nr
c291cmNlL3RpbWVyLXJpc2N2LmMKPiBAQCAtMzIsMTUgKzMyLDE5IEBACj4gIHN0YXRpYyBERUZJ
TkVfU1RBVElDX0tFWV9GQUxTRShyaXNjdl9zc3RjX2F2YWlsYWJsZSk7Cj4gIHN0YXRpYyBib29s
IHJpc2N2X3RpbWVyX2Nhbm5vdF93YWtlX2NwdTsKPgo+ICtzdGF0aWMgdm9pZCByaXNjdl9jbG9j
a19zdG9wX3N0aW1lY21wKHZvaWQpCj4gK3sKPiArICAgICAgIGNzcl93cml0ZShDU1JfU1RJTUVD
TVAsIFVMT05HX01BWCk7Cj4gKyAgICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfMzJCSVQpKQo+
ICsgICAgICAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX1NUSU1FQ01QSCwgVUxPTkdfTUFYKTsKPiAr
fQo+ICsKPiAgc3RhdGljIHZvaWQgcmlzY3ZfY2xvY2tfZXZlbnRfc3RvcCh2b2lkKQo+ICB7Cj4g
LSAgICAgICBpZiAoc3RhdGljX2JyYW5jaF9saWtlbHkoJnJpc2N2X3NzdGNfYXZhaWxhYmxlKSkg
ewo+IC0gICAgICAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX1NUSU1FQ01QLCBVTE9OR19NQVgpOwo+
IC0gICAgICAgICAgICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfMzJCSVQpKQo+IC0gICAgICAg
ICAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfU1RJTUVDTVBILCBVTE9OR19NQVgpOwo+IC0g
ICAgICAgfSBlbHNlIHsKPiArICAgICAgIGlmIChzdGF0aWNfYnJhbmNoX2xpa2VseSgmcmlzY3Zf
c3N0Y19hdmFpbGFibGUpKQo+ICsgICAgICAgICAgICAgICByaXNjdl9jbG9ja19zdG9wX3N0aW1l
Y21wKCk7Cj4gKyAgICAgICBlbHNlCj4gICAgICAgICAgICAgICAgIHNiaV9zZXRfdGltZXIoVTY0
X01BWCk7Cj4gLSAgICAgICB9Cj4gIH0KPgo+ICBzdGF0aWMgaW50IHJpc2N2X2Nsb2NrX25leHRf
ZXZlbnQodW5zaWduZWQgbG9uZyBkZWx0YSwKPiBAQCAtMTI2LDcgKzEzMCwxMSBAQCBzdGF0aWMg
aW50IHJpc2N2X3RpbWVyX3N0YXJ0aW5nX2NwdSh1bnNpZ25lZCBpbnQgY3B1KQo+Cj4gIHN0YXRp
YyBpbnQgcmlzY3ZfdGltZXJfZHlpbmdfY3B1KHVuc2lnbmVkIGludCBjcHUpCj4gIHsKPiAtICAg
ICAgIGRpc2FibGVfcGVyY3B1X2lycShyaXNjdl9jbG9ja19ldmVudF9pcnEpOwo+ICsgICAgICAg
aWYgKHN0YXRpY19icmFuY2hfbGlrZWx5KCZyaXNjdl9zc3RjX2F2YWlsYWJsZSkpCj4gKyAgICAg
ICAgICAgICAgIHJpc2N2X2Nsb2NrX3N0b3Bfc3RpbWVjbXAoKTsKPiArICAgICAgIGVsc2UKPiAr
ICAgICAgICAgICAgICAgZGlzYWJsZV9wZXJjcHVfaXJxKHJpc2N2X2Nsb2NrX2V2ZW50X2lycSk7
Cj4gKwoKTm90IGRpc2FibGluZyByaXNjdl9jbG9ja19ldmVudF9pcnEgaGVyZSBmb3IgU3N0YyB3
b3VsZCBub3cKY2F1c2UgcmlzY3ZfdGltZXJfc3RhcnRpbmdfY3B1KCkgdG8gdW5uZWNlc3Nhcmls
eSBlbmFibGUgaXQKd2hlbiB0aGUgQ1BVIGlzIHBvd2VyZWQtdXAuCgpJIHRoaW5rIHRoZSBiZWxv
dyBjaGFuZ2UgaXMgc3VmZmljaWVudCBmb3IgdGhpcyBwYXRjaDoKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMKYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVy
LXJpc2N2LmMKaW5kZXggNDhjZTUwYzVmNWU2Li41NDZmZDI0OGY0ZmYgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYworKysgYi9kcml2ZXJzL2Nsb2Nrc291cmNl
L3RpbWVyLXJpc2N2LmMKQEAgLTEyNyw2ICsxMjcsMTEgQEAgc3RhdGljIGludCByaXNjdl90aW1l
cl9zdGFydGluZ19jcHUodW5zaWduZWQgaW50IGNwdSkKIHN0YXRpYyBpbnQgcmlzY3ZfdGltZXJf
ZHlpbmdfY3B1KHVuc2lnbmVkIGludCBjcHUpCiB7CiAgICAgICAgZGlzYWJsZV9wZXJjcHVfaXJx
KHJpc2N2X2Nsb2NrX2V2ZW50X2lycSk7CisgICAgICAgLyoKKyAgICAgICAgKiBTdG9wIHRoZSB0
aW1lciB3aGVuIHRoZSBjcHUgaXMgZ29pbmcgdG8gYmUgb2ZmbGluZSBvdGhlcndpc2UKKyAgICAg
ICAgKiB0aGUgdGltZXIgaW50ZXJydXB0IG1heSBiZSBwZW5kaW5nIHdoaWxlIHBlcmZvcm1pbmcg
cG93ZXItZG93bi4KKyAgICAgICAgKi8KKyAgICAgICByaXNjdl9jbG9ja19ldmVudF9zdG9wKCk7
CiAgICAgICAgcmV0dXJuIDA7CiB9CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
