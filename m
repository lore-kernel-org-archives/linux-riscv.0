Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417FBC25B74
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 05:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JZxAE5cSmnKRssvTSkBVjW99WzhpOtgfJExwgrRw+18=; b=vm4pkpf4ePqPHv
	S0SlMooF6p9Flss/aLRuFvDVDi+XfBGnRQbBkdoQPJDbE4I59mGto94A9lGkv+ogkUeCIEjTfrovL
	mEkZPtpL/00670k1iHAj3nkxmrtVJXZTIDmr8qwD/72TJzdVVlM1SdcEacqd2/jElWgRShp4J/uKf
	dr3b6OOT0Q4g7TrffGNYvihhgPafqWmrGNR9MnoMn+KN6sik+vN9S25xRSt0fJCbsn8BZ58AEGnlE
	8txRPmWBy+1K80Pp2e6vWLQY8m11Dy0xU9+hIg9bM17F41jbY40ZN/TytY9Z3iE/xHg+UvNxl4nzS
	CVf9ukYF/hqqCWCh876w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9I9z-0000000GOYK-45n1;
	Tue, 21 May 2024 05:35:40 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9I9w-0000000GOXQ-1CVn;
	Tue, 21 May 2024 05:35:37 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5238b5c080cso6191887e87.1;
        Mon, 20 May 2024 22:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716269733; x=1716874533; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ig5IFTDhN8p1vBKS35cjX3QT6gQn7mrpFK4GK2Ml+nc=;
        b=U3Qn31kP6Xa/iGUR2l/DkTVIpfHGEm7emsz5bNwMf4CuKu6uRPC1XoPs04+XsNRwYO
         xdV9yGh9vIqVMQSqViGlPkAuNmJAcCdldafYiEEjXH3FAx6NIF69cl3Qod3Yzef4ms0T
         mZ4cWECDGwxLIIpITSnwMwjrVtxVzIqF14oYU1RaqeRi92QrweQ7dUH76HoZRj89a8QA
         QTY2vDS/MMH+Vyb786bvTWOj0v/VSK6IQzGSQv9RrTh8kT9cVElF+oaFP5vtcGdgySnS
         TyeSgngV8bNR3l9QVnI2UHW6AedVX1LxQ8Y4pAypp6NMGg76sIWI6S0pEtl2UBXu/0ju
         vYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716269733; x=1716874533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ig5IFTDhN8p1vBKS35cjX3QT6gQn7mrpFK4GK2Ml+nc=;
        b=Nz5IQjbBukTDwGLwZsOrh929QQtgHHLVWqSHND1T91TVl9WDtAZnPTiNUYu9jSOjET
         llNA7RgQbVqwBogP/yQaOCepav47ID4IHk13KKuSbbTMwrRHvN42JBcDrbs3QmYACdny
         hNkKb7q9AIcLyzf+Pj85wvUGbB+eeUnbJdEhgsrQFJhro9fmvrJAR4kPvqWlhBsjwUKl
         O/qNfRIwq/Be16W4JuoEBD99e+drZpq3OXjs2fZL+2MlcRCl5q8igS9p1IS0zjiXIOki
         G0SvN0M5wTCo+jicTNiRacGrOaBF0npnNhI2fN8yNCKqzxxz2mQbHoT/CH/vqE+Tcslh
         zNlA==
X-Forwarded-Encrypted: i=1; AJvYcCXPNpSfT2+AasUR9yMPVWB9HektezSKiLxlLkkdEK+j1M8uFI1D87qdFVLnMasvc4ASVhHywuivairhxv+1MqTLfV1UFr+9Ac0SwzZYcI3aRS20POjDpj2a7+Nx6/+joen31l8lQROThiN42vh05iiTDmCFDWA=
X-Gm-Message-State: AOJu0YwZnfv45PuX3K4YPdmIujuYfKEhvlJTVN5OMZC947ca2G83ImFH
	eyZFFpA7s+T6cq3T6SPNW/tkggUWkhZWPsdM/EuH6Tlz67oNptvyA0kQKNHVal0kVa3BnOPaQT5
	B4nyw5eo6E5L/9WpTgn+4LyzTHVY=
X-Google-Smtp-Source: AGHT+IEwwSxGvw+su8rRrZrkNwlYiQ2EFKkWxDMRK3KWzk3cnll9uMBfnc1fpRtZZF+HmjwRiHVlXMVqPB5OOrvsChI=
X-Received: by 2002:a05:6512:2248:b0:523:3be3:cbfe with SMTP id
 2adb3069b0e04-5233be3cc5bmr18150114e87.65.1716269733053; Mon, 20 May 2024
 22:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1713778236.git.haibo1.xu@intel.com> <5c3a005a67096010cf3c465f8e3362651763fe3b.1713778236.git.haibo1.xu@intel.com>
In-Reply-To: <5c3a005a67096010cf3c465f8e3362651763fe3b.1713778236.git.haibo1.xu@intel.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Tue, 21 May 2024 13:35:21 +0800
Message-ID: <CAJve8okHV1r4H-yCNbMTg_Bg1pTgeh6zPTyqZtS25G+GVOu8ww@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] ACPI: NUMA: change the ACPI_NUMA to a hidden option
To: Haibo Xu <haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_223536_352199_3F81A8C9 
X-CRM114-Status: GOOD (  18.20  )
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
Cc: Alison Schofield <alison.schofield@intel.com>, Jisheng Zhang <jszhang@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Zong Li <zong.li@sifive.com>, James Morse <james.morse@arm.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Dave Jiang <dave.jiang@intel.com>, Baoquan He <bhe@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, Greentime Hu <greentime.hu@sifive.com>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, arnd@arndb.de, Charlie Jenkins <charlie@rivosinc.com>, Chen Jiahao <chenjiahao16@huawei.com>, Yuntao Wang <ytcoode@gmail.com>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Samuel Holland <samuel.holland@sifive.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, ajones@ventanamicro.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QEFybmQgQmVyZ21hbm4KCkNvdWxkIHlvdSBoZWxwIHJldmlldyB0aGlzIHBhdGNoPwoKVGhhbmtz
LApIYWlibwoKT24gV2VkLCBBcHIgMjQsIDIwMjQgYXQgMTozMeKAr1BNIEhhaWJvIFh1IDxoYWli
bzEueHVAaW50ZWwuY29tPiB3cm90ZToKPgo+IHg4Ni9hcm02NC9sb29uZ2FyY2ggd291bGQgc2Vs
ZWN0IEFDUElfTlVNQSBieSBkZWZhdWx0IGFuZCByaXNjdgo+IHdvdWxkIGRvIHRoZSBzYW1lIHRo
aW5nLCBzbyBjaGFuZ2UgaXQgdG8gYSBoaWRkZW4gb3B0aW9uIGFuZCB0aGUKPiBzZWxlY3Qgc3Rh
dGVtZW50cyBleGNlcHQgZm9yIHRoZSBYODZfNjRfQUNQSV9OVU1BIGNhbiBhbHNvIGdvIGF3YXku
Cj4KPiBTdWdnZXN0ZWQtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gU3VnZ2Vz
dGVkLWJ5OiBTdW5pbCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3JvLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBIYWlibyBYdSA8aGFpYm8xLnh1QGludGVsLmNvbT4KPiAtLS0KPiAgYXJjaC9hcm02NC9L
Y29uZmlnICAgICAgICB8IDEgLQo+ICBhcmNoL2xvb25nYXJjaC9LY29uZmlnICAgIHwgMSAtCj4g
IGRyaXZlcnMvYWNwaS9udW1hL0tjb25maWcgfCA1ICstLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9LY29uZmlnIGIvYXJjaC9hcm02NC9LY29uZmlnCj4gaW5kZXggN2IxMWM5OGIzZTg0Li5jNmM2
Njc4OThkYTYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9LY29uZmlnCj4gKysrIGIvYXJjaC9h
cm02NC9LY29uZmlnCj4gQEAgLTE0MzksNyArMTQzOSw2IEBAIGNvbmZpZyBIT1RQTFVHX0NQVQo+
ICBjb25maWcgTlVNQQo+ICAgICAgICAgYm9vbCAiTlVNQSBNZW1vcnkgQWxsb2NhdGlvbiBhbmQg
U2NoZWR1bGVyIFN1cHBvcnQiCj4gICAgICAgICBzZWxlY3QgR0VORVJJQ19BUkNIX05VTUEKPiAt
ICAgICAgIHNlbGVjdCBBQ1BJX05VTUEgaWYgQUNQSQo+ICAgICAgICAgc2VsZWN0IE9GX05VTUEK
PiAgICAgICAgIHNlbGVjdCBIQVZFX1NFVFVQX1BFUl9DUFVfQVJFQQo+ICAgICAgICAgc2VsZWN0
IE5FRURfUEVSX0NQVV9FTUJFRF9GSVJTVF9DSFVOSwo+IGRpZmYgLS1naXQgYS9hcmNoL2xvb25n
YXJjaC9LY29uZmlnIGIvYXJjaC9sb29uZ2FyY2gvS2NvbmZpZwo+IGluZGV4IGE1ZjMwMGVjNmYy
OC4uMjlkNTc0YTVjMzRjIDEwMDY0NAo+IC0tLSBhL2FyY2gvbG9vbmdhcmNoL0tjb25maWcKPiAr
KysgYi9hcmNoL2xvb25nYXJjaC9LY29uZmlnCj4gQEAgLTQ2NSw3ICs0NjUsNiBAQCBjb25maWcg
TlJfQ1BVUwo+ICBjb25maWcgTlVNQQo+ICAgICAgICAgYm9vbCAiTlVNQSBTdXBwb3J0Igo+ICAg
ICAgICAgc2VsZWN0IFNNUAo+IC0gICAgICAgc2VsZWN0IEFDUElfTlVNQSBpZiBBQ1BJCj4gICAg
ICAgICBoZWxwCj4gICAgICAgICAgIFNheSBZIHRvIGNvbXBpbGUgdGhlIGtlcm5lbCB3aXRoIE5V
TUEgKE5vbi1Vbmlmb3JtIE1lbW9yeSBBY2Nlc3MpCj4gICAgICAgICAgIHN1cHBvcnQuICBUaGlz
IG9wdGlvbiBpbXByb3ZlcyBwZXJmb3JtYW5jZSBvbiBzeXN0ZW1zIHdpdGggbW9yZQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2FjcGkvbnVtYS9LY29uZmlnIGIvZHJpdmVycy9hY3BpL251bWEvS2Nv
bmZpZwo+IGluZGV4IDg0OWMyYmQ4MjBiOS4uZjMzMTk0ZDFlNDNmIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvYWNwaS9udW1hL0tjb25maWcKPiArKysgYi9kcml2ZXJzL2FjcGkvbnVtYS9LY29uZmln
Cj4gQEAgLTEsOSArMSw2IEBACj4gICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAK
PiAgY29uZmlnIEFDUElfTlVNQQo+IC0gICAgICAgYm9vbCAiTlVNQSBzdXBwb3J0Igo+IC0gICAg
ICAgZGVwZW5kcyBvbiBOVU1BCj4gLSAgICAgICBkZXBlbmRzIG9uIChYODYgfHwgQVJNNjQgfHwg
TE9PTkdBUkNIKQo+IC0gICAgICAgZGVmYXVsdCB5IGlmIEFSTTY0Cj4gKyAgICAgICBkZWZfYm9v
bCBOVU1BICYmICFYODYKPgo+ICBjb25maWcgQUNQSV9ITUFUCj4gICAgICAgICBib29sICJBQ1BJ
IEhldGVyb2dlbmVvdXMgTWVtb3J5IEF0dHJpYnV0ZSBUYWJsZSBTdXBwb3J0Igo+IC0tCj4gMi4z
NC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
