Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E326C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 05:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mrPRGLKOCI4+AVFbDws8GRg7EumAQUtsCHNLPO8/QLM=; b=pYW7PmT9MXF7Ae
	YJM/fPbh1yGHCcO4sO8EVZNM0XcTKQJsB4Ti1SzKO0vqakWuc3DsoLztsuEjGbA7Fn1+Ia/oDWbFX
	ChNzkqiaJ5hAKa9QouzXTOBwPJJwJJMiL4DSHcioKQBDjOZEccXMS6ey8rlGJfphiSYKpJuJWnzvh
	rDxRB89sK9SxuFN6nejYV7KHJ4Blb1LdStapW8QLtmHf3Cyb3EzsoUaVoq4PE60q4+c8L/svz/uGM
	mLuaeeIKCH7KGpVfg28aDGTsmUZssofzNSyC8YzoFU1mbT8acf9efR/pYxcNPPVkR4whrSmX0MiTD
	c+wFN80tq657F/1ZiNSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rymCf-0000000C6nt-04mR;
	Mon, 22 Apr 2024 05:26:57 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rymCb-0000000C6ki-260l
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 05:26:55 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-36a165b8845so12594515ab.1
        for <linux-riscv@lists.infradead.org>; Sun, 21 Apr 2024 22:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1713763608; x=1714368408; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cial3YyC1sggqpy7QrWZpU+HgoNnfN50j0VIzR/hees=;
        b=RE/hHziP3pEV/O/B4pQtkG9+Ng04ZpfyasA5ilavWjM+fDGVEIps8jcgfsjFKxrwyD
         oe25VQfkUrWqEUm9tKpLIHlXhXdmrryiOhgv/Bc0GDgukcNB9CSDcIQUOUfh2obGwAGt
         1ThC4tW+6zkBr4e/37ZGbhSGEHLwkQVKIEWkwSlbq0mvD2Vyd938ItfJ3qzXl19lsUwv
         r7j+R5rGq38arpieSSEuU0/UzCwMz25ifceuvanEvgXKxRReqZmPvRiXIFB7DiH5SJWM
         n4lCbMn6okSWCC87XYzPLj3v52GJz9p22qkG8MjTRG6rtQTlTrIStifv24CGz1T+JN8Q
         YMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713763608; x=1714368408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cial3YyC1sggqpy7QrWZpU+HgoNnfN50j0VIzR/hees=;
        b=ppU8+0H83jC5OIxo6xuitXhtxY2Xjn4Gc5nIDJo8fu2v8qc1xearQfzqfNWAv+y56T
         BfXohctwokVe3ia/M+W80vUEsKwsYJRm47lzSh10uDJhpA7HHgkmcG4M8bF/x0+5mMhy
         l9rKSmXKdKFJ14L2r9IYEJfxfNcZHI4C5ey7UkB5lCHbcf0qBnfllAkIIuy/d9nACb/o
         zbUnNUjBbuxCoKqCE6cvUblysuS9tFF54ACRjJZAXkoBtDYJmvFwEuiE6HGNb+Msot/f
         UN8mL1z2Nt790sJa6a8/ZIoemdD8B+tY/uZgJc5Q5kmo06K3mwAb38y2Juoz5C6donqU
         F98Q==
X-Forwarded-Encrypted: i=1; AJvYcCXgrEgEdLigfuCP13sDqvUttRdPcWXIfCVOLXPHbXRt6/UItMKWYBmGRq5iLT4kYU6PZJ8GXg7coiCDnjgcMvbkhodvKSi55fAv1QHfMkgt
X-Gm-Message-State: AOJu0YwqpI6hIMMNwoiIDqDQhpCbQWSDUOgzngSfwadPA46E/gqA5A5+
	FAZ26GI+h/0rWC9I8NpgeD21PEwUuq85R4N2dNSYQW3hJwOxX1HfKa3VaMpk0qVIdgjytZ7/J4G
	BjO/+EH8PQkqD48ER2NmDdOqtu8DbLy6bxgePAg==
X-Google-Smtp-Source: AGHT+IEABacZ9QXPS+L5TLIrF699DxFIKbW3bDrYQOc34jyt+qHXpuDOMiVpMcu9RlTxm6mqruBv7i/++4LrvmLUpRQ=
X-Received: by 2002:a05:6e02:1386:b0:36b:aae:613 with SMTP id
 d6-20020a056e02138600b0036b0aae0613mr12274364ilo.10.1713763608202; Sun, 21
 Apr 2024 22:26:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240420151741.962500-1-atishp@rivosinc.com> <20240420151741.962500-17-atishp@rivosinc.com>
In-Reply-To: <20240420151741.962500-17-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 Apr 2024 10:56:37 +0530
Message-ID: <CAAhSdy0OPv3Fg1CWV9vzE_nHo943TNRh6-xxt8WTK6fOFg_ptg@mail.gmail.com>
Subject: Re: [PATCH v8 16/24] RISC-V: KVM: Improve firmware counter read function
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, samuel.holland@sifive.com, 
	Conor Dooley <conor.dooley@microchip.com>, Juergen Gross <jgross@suse.com>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, 
	Will Deacon <will@kernel.org>, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_222653_563980_8B2F8968 
X-CRM114-Status: GOOD (  16.47  )
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

T24gU2F0LCBBcHIgMjAsIDIwMjQgYXQgNToxOOKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IFJlbmFtZSB0aGUgZnVuY3Rpb24gdG8gaW5kaWNhdGUgdGhh
dCBpdCBpcyBtZWFudCBmb3IgZmlybXdhcmUKPiBjb3VudGVyIHJlYWQuIFdoaWxlIGF0IGl0LCBh
ZGQgYSByYW5nZSBzYW5pdHkgY2hlY2sgZm9yIGl0IGFzCj4gd2VsbC4KPgo+IFJldmlld2VkLWJ5
OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+IFNpZ25lZC1vZmYtYnk6
IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBB
bnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAg
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9wbXUuaCB8IDIgKy0KPiAgYXJjaC9yaXNj
di9rdm0vdmNwdV9wbXUuYyAgICAgICAgICAgICB8IDcgKysrKysrLQo+ICBhcmNoL3Jpc2N2L2t2
bS92Y3B1X3NiaV9wbXUuYyAgICAgICAgIHwgMiArLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2t2bV92Y3B1X3BtdS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNw
dV9wbXUuaAo+IGluZGV4IDU1ODYxYjVkMzM4Mi4uZmEwZjUzNWJiYmYwIDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfcG11LmgKPiArKysgYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3BtdS5oCj4gQEAgLTg5LDcgKzg5LDcgQEAgaW50IGt2bV9y
aXNjdl92Y3B1X3BtdV9jdHJfY2ZnX21hdGNoKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWdu
ZWQgbG9uZyBjdHJfYmEKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgbG9uZyBjdHJfbWFzaywgdW5zaWduZWQgbG9uZyBmbGFncywKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBlaWR4LCB1NjQgZXZ0ZGF0YSwK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGt2bV92Y3B1X3Ni
aV9yZXR1cm4gKnJldGRhdGEpOwo+IC1pbnQga3ZtX3Jpc2N2X3ZjcHVfcG11X2N0cl9yZWFkKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBjaWR4LAo+ICtpbnQga3ZtX3Jpc2N2
X3ZjcHVfcG11X2Z3X2N0cl9yZWFkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9u
ZyBjaWR4LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGt2bV92Y3B1
X3NiaV9yZXR1cm4gKnJldGRhdGEpOwo+ICBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11X2Z3X2N0cl9y
ZWFkX2hpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBjaWR4LAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGt2bV92Y3B1X3NiaV9yZXR1
cm4gKnJldGRhdGEpOwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jIGIv
YXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYwo+IGluZGV4IGUxNDA5ZWM5YWZjMC4uMDRkYjFmOTkz
YzQ3IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiArKysgYi9hcmNo
L3Jpc2N2L2t2bS92Y3B1X3BtdS5jCj4gQEAgLTIzNSw2ICsyMzUsMTEgQEAgc3RhdGljIGludCBw
bXVfY3RyX3JlYWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGNpZHgsCj4g
ICAgICAgICB1NjQgZW5hYmxlZCwgcnVubmluZzsKPiAgICAgICAgIGludCBmZXZlbnRfY29kZTsK
Pgo+ICsgICAgICAgaWYgKGNpZHggPj0ga3ZtX3BtdV9udW1fY291bnRlcnMoa3ZwbXUpIHx8IGNp
ZHggPT0gMSkgewo+ICsgICAgICAgICAgICAgICBwcl93YXJuKCJJbnZhbGlkIGNvdW50ZXIgaWQg
WyVsZF0gZHVyaW5nIHJlYWRcbiIsIGNpZHgpOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsKPiArICAgICAgIH0KPiArCj4gICAgICAgICBwbWMgPSAma3ZwbXUtPnBtY1tjaWR4XTsK
Pgo+ICAgICAgICAgaWYgKHBtYy0+Y2luZm8udHlwZSA9PSBTQklfUE1VX0NUUl9UWVBFX0ZXKSB7
Cj4gQEAgLTc0Nyw3ICs3NTIsNyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11X2Z3X2N0cl9yZWFk
X2hpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBjaWR4LAo+ICAgICAgICAg
cmV0dXJuIDA7Cj4gIH0KPgo+IC1pbnQga3ZtX3Jpc2N2X3ZjcHVfcG11X2N0cl9yZWFkKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBjaWR4LAo+ICtpbnQga3ZtX3Jpc2N2X3Zj
cHVfcG11X2Z3X2N0cl9yZWFkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBj
aWR4LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGt2bV92Y3B1X3Ni
aV9yZXR1cm4gKnJldGRhdGEpCj4gIHsKPiAgICAgICAgIGludCByZXQ7Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3BtdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlf
cG11LmMKPiBpbmRleCBjZjExMWRlNTFiZGIuLmU0YmUzNGUwM2U4MyAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9wbXUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVf
c2JpX3BtdS5jCj4gQEAgLTYyLDcgKzYyLDcgQEAgc3RhdGljIGludCBrdm1fc2JpX2V4dF9wbXVf
aGFuZGxlcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4sCj4gICAg
ICAgICAgICAgICAgIHJldCA9IGt2bV9yaXNjdl92Y3B1X3BtdV9jdHJfc3RvcCh2Y3B1LCBjcC0+
YTAsIGNwLT5hMSwgY3AtPmEyLCByZXRkYXRhKTsKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4g
ICAgICAgICBjYXNlIFNCSV9FWFRfUE1VX0NPVU5URVJfRldfUkVBRDoKPiAtICAgICAgICAgICAg
ICAgcmV0ID0ga3ZtX3Jpc2N2X3ZjcHVfcG11X2N0cl9yZWFkKHZjcHUsIGNwLT5hMCwgcmV0ZGF0
YSk7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IGt2bV9yaXNjdl92Y3B1X3BtdV9md19jdHJfcmVh
ZCh2Y3B1LCBjcC0+YTAsIHJldGRhdGEpOwo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAg
ICAgIGNhc2UgU0JJX0VYVF9QTVVfQ09VTlRFUl9GV19SRUFEX0hJOgo+ICAgICAgICAgICAgICAg
ICBpZiAoSVNfRU5BQkxFRChDT05GSUdfMzJCSVQpKQo+IC0tCj4gMi4zNC4xCj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
