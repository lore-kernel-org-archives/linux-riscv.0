Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B68C2BA15
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 13:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8U4AqFpp8zulrZTejMAwGCV/J4ifN9bkjuhE6BRN9HA=; b=GcyypLpQ+QEzmN
	51VL/ew3wO7v3f9ppXgnT4d+Ywu+GDXbtlhYO+gcLVwLTvw2TsfR101ZqRo6oGIpk3kPV9nsQ8ELX
	ra6qqZUHrSiiIs8VPb9jBMQSYPc7pgI/Kj3eRKH0J/ugWLOxMmTGUjxcdjsMAGDro1CKHI3jv2WH9
	2ofN+nHwiTJYvvQrRW3oC1SXocOVhK9OWSvqWjFQtjpStamsFTEboShQKcajT7N+nIrrZOnJSaNHn
	nlsLdv9fyLyWxZXwUxcypG6lUbr9Ox+kyT73AeS+QPEUMxmRddHGqADTqtfDgZyzoQjNGgKF7f/fx
	fitsmMDJiQutpNAFjjxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCVK-0000000AsK3-0vzL;
	Mon, 17 Jun 2024 13:34:38 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCVG-0000000AsHv-2l53;
	Mon, 17 Jun 2024 13:34:35 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so45062111fa.3;
        Mon, 17 Jun 2024 06:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718631271; x=1719236071; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlh1MuJTyolH8Bza5fsBuYqZhmwiMHDDS1wFAKMhcW4=;
        b=KkgXgO3e0z/6e6WliJgzBRvZh8GsKcg0eIQYzVNHfKLE7eMeq/WZFmIg7mRy4TGSvr
         WH7deR+ktgDssmeiO3+vc6lYfqi+2CLKxRyflQPuHHjLOmmdj7aTV0aAT9v6zT7RFtJy
         No7fH20RSIKsI5axymnNVGJ1XYtIkZ1Pkav4H2rNp2SdPcqg3rpb3Q7EGIToKxSwqbmp
         /qplLD98D2mZKkS2JT2bsZIsSUkrGPmNMfZiPM7+lqr74PV7xXUNxcCCOYZr2RMdSaJu
         XkXR3hXSDL1qtx7mayp+RIxVcPhOkBEvBlNoNxSTs4HOYLUbzQ9YV38u1kvdiaDrrsMR
         SL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718631271; x=1719236071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlh1MuJTyolH8Bza5fsBuYqZhmwiMHDDS1wFAKMhcW4=;
        b=hXUzN5ItYa5V3xOAJ0Otgo6gA464AiOn6LaUAfq4P/4ZHMCS38Rsg+2sSnC6/Z08h7
         zPT1XaxddTG360oIIjDVuURGm3ibK7SAIsoCG+MItINA+TQCjEYLPHpbAG43IYBLMOlJ
         dUqWkpVDVbkkJeYXizyDE7HQyChLynPIliS5Q8esNG1MfHR5jk4x1zU3UERk+znooLU1
         kud+vJqd2PiOaK/WXZHJCVkNxXvWPAOqP6gdWyKU0nJZRsPSGcDOMfxMcoQaRhvP8TeM
         qEfZrRlJSc0uIVEkbgpi4XD7Tna5KfqePbxFWmnQp4QihKMTpMj4Uxsoj4nB57F2vp+W
         7DMA==
X-Forwarded-Encrypted: i=1; AJvYcCUF/gW8oDrgaBuj2A8b/4pl4xlsSGavg08pxtRWx6KwfDmDUXtOOG6ZkDL0oDEEk0SnMfoPR93Qs+iEoqkLfvFOJcg0Y/w3hs8TdBfBbsQs7l+k9DaMPqAVjiEeVicR4aAJgLyGe8DNPd11zjUYsmM1TJV4jOc=
X-Gm-Message-State: AOJu0Yx1hmTTfr8zN71pP2F3KBdLPYMhQ2Qo8QYn/iwAkx9bYfhrcCCb
	eRKbLAy8hu00SOcOkUXUqsygoeKsc8ezi3BcK5ZAX2rWZR6McjCp0SEoVjYzQJZ+Tx9d6s91gl1
	7QCbgncv/DEGnelxdmiWsKUMEnv8=
X-Google-Smtp-Source: AGHT+IGxoq/R66V25JVO/HBkhcEl96wxiJMXgGXl/k0tPpvsH4sU61K9F58Kdy+baOZ9nLjumpg95HzDP25Dn6D6uvU=
X-Received: by 2002:ac2:5551:0:b0:52c:893c:6c2c with SMTP id
 2adb3069b0e04-52ca6e6e205mr5569411e87.40.1718631270478; Mon, 17 Jun 2024
 06:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1718268003.git.haibo1.xu@intel.com> <f1f96377b8ecd6e3183f28abf5c9ac21cb9855ea.1718268003.git.haibo1.xu@intel.com>
In-Reply-To: <f1f96377b8ecd6e3183f28abf5c9ac21cb9855ea.1718268003.git.haibo1.xu@intel.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Mon, 17 Jun 2024 21:34:18 +0800
Message-ID: <CAJve8o=8thBhU3NyTaS6sE9rQ1VR_Qf4O8FkAxpmp1q8P-6VaQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] ACPI: NUMA: change the ACPI_NUMA to a hidden option
To: Haibo Xu <haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_063434_718932_D4864DEC 
X-CRM114-Status: GOOD (  18.54  )
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
Cc: Alison Schofield <alison.schofield@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Zong Li <zong.li@sifive.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Dave Jiang <dave.jiang@intel.com>, Robert Richter <rrichter@amd.com>, Baoquan He <bhe@redhat.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, James Morse <james.morse@arm.com>, Dan Williams <dan.j.williams@intel.com>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, arnd@arndb.de, Charlie Jenkins <charlie@rivosinc.com>, Chen Jiahao <chenjiahao16@huawei.com>, Yuntao Wang <ytcoode@gmail.com>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>, Zhao Ke <ke.zhao@shingroup.cn>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Samuel Holland <samuel.holland@sifive.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andy.chiu@sifive.com>, Andrew Morton <akpm@linux-foundation.org>, ajones@ventanamicro.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QENhdGFsaW4gTWFyaW5hcyBASHVhY2FpIENoZW4KCkNvdWxkIHlvdSBwbGVhc2UgaGF2ZSBhIGxv
b2sgYXQgdGhpcyBwYXRjaCBmb3IgdGhlIEFDUElfTlVNQSBjb25maWcgb24KQVJNNjQgYW5kIExP
T05HQVJDSCByZXNwZWN0aXZlbHkuCgpUaGFua3MhCgpPbiBUaHUsIEp1biAxMywgMjAyNCBhdCA0
OjM34oCvUE0gSGFpYm8gWHUgPGhhaWJvMS54dUBpbnRlbC5jb20+IHdyb3RlOgo+Cj4geDg2L2Fy
bTY0L2xvb25nYXJjaCB3b3VsZCBzZWxlY3QgQUNQSV9OVU1BIGJ5IGRlZmF1bHQgYW5kIHJpc2N2
Cj4gd291bGQgZG8gdGhlIHNhbWUgdGhpbmcsIHNvIGNoYW5nZSBpdCB0byBhIGhpZGRlbiBvcHRp
b24gYW5kIHRoZQo+IHNlbGVjdCBzdGF0ZW1lbnRzIGV4Y2VwdCBmb3IgdGhlIFg4Nl82NF9BQ1BJ
X05VTUEgY2FuIGFsc28gZ28gYXdheS4KPgo+IFN1Z2dlc3RlZC1ieTogQXJuZCBCZXJnbWFubiA8
YXJuZEBhcm5kYi5kZT4KPiBTdWdnZXN0ZWQtYnk6IFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5h
bWljcm8uY29tPgo+IFNpZ25lZC1vZmYtYnk6IEhhaWJvIFh1IDxoYWlibzEueHVAaW50ZWwuY29t
Pgo+IFJldmlld2VkLWJ5OiBTdW5pbCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3JvLmNvbT4KPiAt
LS0KPiAgYXJjaC9hcm02NC9LY29uZmlnICAgICAgICB8IDEgLQo+ICBhcmNoL2xvb25nYXJjaC9L
Y29uZmlnICAgIHwgMSAtCj4gIGRyaXZlcnMvYWNwaS9udW1hL0tjb25maWcgfCA1ICstLS0tCj4g
IDMgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDYgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm02NC9LY29uZmlnIGIvYXJjaC9hcm02NC9LY29uZmlnCj4gaW5kZXgg
NWQ5MTI1OWVlN2I1Li41MDc5YWQ0ZTIxYTUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9LY29u
ZmlnCj4gKysrIGIvYXJjaC9hcm02NC9LY29uZmlnCj4gQEAgLTE0ODQsNyArMTQ4NCw2IEBAIGNv
bmZpZyBIT1RQTFVHX0NQVQo+ICBjb25maWcgTlVNQQo+ICAgICAgICAgYm9vbCAiTlVNQSBNZW1v
cnkgQWxsb2NhdGlvbiBhbmQgU2NoZWR1bGVyIFN1cHBvcnQiCj4gICAgICAgICBzZWxlY3QgR0VO
RVJJQ19BUkNIX05VTUEKPiAtICAgICAgIHNlbGVjdCBBQ1BJX05VTUEgaWYgQUNQSQo+ICAgICAg
ICAgc2VsZWN0IE9GX05VTUEKPiAgICAgICAgIHNlbGVjdCBIQVZFX1NFVFVQX1BFUl9DUFVfQVJF
QQo+ICAgICAgICAgc2VsZWN0IE5FRURfUEVSX0NQVV9FTUJFRF9GSVJTVF9DSFVOSwo+IGRpZmYg
LS1naXQgYS9hcmNoL2xvb25nYXJjaC9LY29uZmlnIGIvYXJjaC9sb29uZ2FyY2gvS2NvbmZpZwo+
IGluZGV4IGUzODEzOWM1NzZlZS4uOGQ5ZTA2ZTRhZDg0IDEwMDY0NAo+IC0tLSBhL2FyY2gvbG9v
bmdhcmNoL0tjb25maWcKPiArKysgYi9hcmNoL2xvb25nYXJjaC9LY29uZmlnCj4gQEAgLTQ3MCw3
ICs0NzAsNiBAQCBjb25maWcgTlJfQ1BVUwo+ICBjb25maWcgTlVNQQo+ICAgICAgICAgYm9vbCAi
TlVNQSBTdXBwb3J0Igo+ICAgICAgICAgc2VsZWN0IFNNUAo+IC0gICAgICAgc2VsZWN0IEFDUElf
TlVNQSBpZiBBQ1BJCj4gICAgICAgICBoZWxwCj4gICAgICAgICAgIFNheSBZIHRvIGNvbXBpbGUg
dGhlIGtlcm5lbCB3aXRoIE5VTUEgKE5vbi1Vbmlmb3JtIE1lbW9yeSBBY2Nlc3MpCj4gICAgICAg
ICAgIHN1cHBvcnQuICBUaGlzIG9wdGlvbiBpbXByb3ZlcyBwZXJmb3JtYW5jZSBvbiBzeXN0ZW1z
IHdpdGggbW9yZQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvbnVtYS9LY29uZmlnIGIvZHJp
dmVycy9hY3BpL251bWEvS2NvbmZpZwo+IGluZGV4IDg0OWMyYmQ4MjBiOS4uZjMzMTk0ZDFlNDNm
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYWNwaS9udW1hL0tjb25maWcKPiArKysgYi9kcml2ZXJz
L2FjcGkvbnVtYS9LY29uZmlnCj4gQEAgLTEsOSArMSw2IEBACj4gICMgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAKPiAgY29uZmlnIEFDUElfTlVNQQo+IC0gICAgICAgYm9vbCAiTlVN
QSBzdXBwb3J0Igo+IC0gICAgICAgZGVwZW5kcyBvbiBOVU1BCj4gLSAgICAgICBkZXBlbmRzIG9u
IChYODYgfHwgQVJNNjQgfHwgTE9PTkdBUkNIKQo+IC0gICAgICAgZGVmYXVsdCB5IGlmIEFSTTY0
Cj4gKyAgICAgICBkZWZfYm9vbCBOVU1BICYmICFYODYKPgo+ICBjb25maWcgQUNQSV9ITUFUCj4g
ICAgICAgICBib29sICJBQ1BJIEhldGVyb2dlbmVvdXMgTWVtb3J5IEF0dHJpYnV0ZSBUYWJsZSBT
dXBwb3J0Igo+IC0tCj4gMi4zNC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
