Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D18CA0EED
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 23:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZfbEE4MZvXI4s6mWIxmEvzI8abJ2hbPG+RU70LWGaxE=; b=CJK7IDuF+TXZ/J
	Geepu3IqQpIE3PZfV8S3ArS8wa08qESwIxnH0bGleUGKowUwLtmUuvoWb+ZLJiWeG9BC7hBDbDjKG
	5nHtRcJIrPe71AYsmI/Lc+VKk1OY9csMWZZgKcADtGz2ReDd5mwmPOC2u59k7U5bqAhmx/jhV6ZOP
	1Ku7jaGcNyIUP2LtnjSXyK1JqmA5zFv1bpD8iCeAJA5Wp8Xx9aebumcPMOV6kCEpPGy7OsI80GCBd
	XYLAsOLE3EXwp2woJ0a263EcTR+fm5cVgoultITWl9VMUpfs5U9n7HnMX1VMaCD1Jd/Sp7CVZAzHg
	m6JzmD/akFmZQ+uQYOKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urm1U-00000003gGB-3QNB;
	Thu, 28 Aug 2025 23:27:16 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urlO1-00000003WbX-0Vb6;
	Thu, 28 Aug 2025 22:46:30 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2489d5251f0so1878565ad.0;
        Thu, 28 Aug 2025 15:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756421188; x=1757025988; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWTfsYajgxspjw0BEVIGAJj43TSZuMXWhqAKPxCzuMo=;
        b=imY6oXIiD8TBWJHGI1OkB1Fl+NnlfUogrturdwePpuO836pIRDAsN2YCFta/KK0EyY
         35Ow0B7xiAJp2tnijocKAKEdYwlXmSZrQf54GWYQIBdMI9enhAn577+6fxG803xVtZB3
         x3j9zcpjB44Hsu27374u/O1PxORq2z6AiUefzzAmUuhHUyZM+ESdj+ad3XbQoFfJYQAU
         JK2axvk5fhZf7Ufdxz7D/sMxwIKbGMuczuLgyHrQthK9ssL3iQdXh7vkDJZctc7Q/jDj
         Xd/uRuWfnJtVpiBxzv42CBXxM01FSZaJKMmigzDzjeTKkegVld6Bh4VbGQi5Fmz5qskS
         4O1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756421188; x=1757025988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWTfsYajgxspjw0BEVIGAJj43TSZuMXWhqAKPxCzuMo=;
        b=jPWvCOcyY17vVUaQnSkX9Cqh9cFcg1HtCAx62GiqI14q8suZUy6CPcq+rFNTJKO3T3
         K+5BPWuoqz3FRhLjXVizt6aMellOedgJsMmgOA+W5GQn4ZOoUaRIDJWriRNvCMoLLViG
         VG6OlhCT6GOkjPeg0G6/t35RD/lQ44/bRjTsxPK7UrVAErICe8+UJT6Stz5Fga4dWMhf
         UBTtxR1Qy8AAfdQ0Z/XWr0o33mLuzinXy8ybzDm7luSk34bEreqJsw4UjA94Q+KLzBQR
         9OgG1fFZUcY1PEep0UtW7bsIBmzbT6aF1VzdRUaS8qRwsgieRNySdSt7QCHyK3076LCA
         Xfcw==
X-Forwarded-Encrypted: i=1; AJvYcCUGNhm1qckiSPUMYoPL6EYaCf8QC3ykl4eZDpPrcQ1cV29hBjlp+87gel79OD22MZQWFg5sSd83SNraL0Y=@lists.infradead.org, AJvYcCXNdjZ6wvAZ/TVGueAFF9NgWxi6TeGiJuqG2TLpWYZmlYP5jHGJeAI7D1VCVrzMLMWddN6yPDpoep+x/R6R9tCj@lists.infradead.org
X-Gm-Message-State: AOJu0YxoOnpInsumCroDvJo2LYWmb0Om3sFNtcPuiXEPLh+Qj76jIjK/
	36i69451EIqmDVisg2qGQh8DOjzkvZ1LAM/lTWp6+xjqQrBX+0BvZSYgFqbLmatYx6UTLgNDk8O
	7UivjpVTURm1Zei6lI1oZc4AzbGucfe8=
X-Gm-Gg: ASbGncvdYHhFkN5rsrriW0Clm9UYoSUyu/wK1ShCHJB9xivaTT4ZwMqVKH6PoZCo+CO
	lnREv38b+yDsvdjKdcgb0HQHTOS2djdbRRbtTEsWZrAxx80nMYshGOdyKVdCePpT2wTHfKz/X5v
	RA7qjOrHiMutC3veY4qYYjZbQo2k96enqCJn7Td06jV5cosluaudXOJ92nZPI9v9zqxu6TEZlYB
	w5u2akTnfAUlCil7dw3lNAR0Gc3QZokZ4upGeabtd6bknvWBkNSwe/IyCK8pO9xCO1vekIqfV6Z
	LTdLBRcbug7tpeQ8RLFz/HaGuA==
X-Google-Smtp-Source: AGHT+IEki7N5+ZTphBMAlPvPh8Ed2D0soQ3ee4I0yeC35pDHbq+VM6I/+v50+BWUjpOg7vsfojcxdwe+ytoieurevJg=
X-Received: by 2002:a17:903:2f0c:b0:248:b43a:3ff with SMTP id
 d9443c01a7336-248b43a098cmr46736235ad.8.1756421188295; Thu, 28 Aug 2025
 15:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250825141316.work.967-kees@kernel.org> <20250825142603.1907143-5-kees@kernel.org>
 <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
 <202508250834.E2456B9@keescook> <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
 <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net> <20250827013444.GA2859318@ax162>
 <56c2b1ce-00a4-403c-9927-79bfd9a23574@infradead.org> <20250827193815.GA2293657@ax162>
 <CANiq72nX7d3XQtQKDdeUh2RFy5HqSg360m4pzesJyBP+y9K7FA@mail.gmail.com> <20250828201915.GA219815@ax162>
In-Reply-To: <20250828201915.GA219815@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 29 Aug 2025 00:46:16 +0200
X-Gm-Features: Ac12FXy71Ta7noj8hoAJaRqNi-cWiWGGHMHvo9xSNtrTkaZTnVcq8IZX729diUc
Message-ID: <CANiq72mRKHunT2Zkdj4dS5yHrx==MsmY33BvBqOy52_pNqrZFw@mail.gmail.com>
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Nathan Chancellor <nathan@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@outflux.net>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, 
	Puranjay Mohan <puranjay@kernel.org>, David Woodhouse <dwmw2@infradead.org>, 
	Jonathan Corbet <corbet@lwn.net>, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_154629_163260_58080AFE 
X-CRM114-Status: GOOD (  12.24  )
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

T24gVGh1LCBBdWcgMjgsIDIwMjUgYXQgMTA6MTnigK9QTSBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0
aGFuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gQWggeWVzLCBJIHJlcmVhZCB5b3VyIHN1Z2dlc3Rp
b24gYW5kIHRoYXQgd291bGQgcHJvYmFibHkgYmUgdGhlIGJlc3QKPiBjb3Vyc2Ugb2YgYWN0aW9u
LCBhcyBpdCBkb2VzIGF2b2lkIHRoZSBleHRyYSBzeW1ib2wgKGFsdGhvdWdoIEkgYW0gbm90Cj4g
c3VyZSB3aGF0IHlvdSBtZWFuIGJ5IG9uZSBsZXNzIHJlbmFtZT8pLiBBcyBJIHVuZGVyc3RhbmQg
aXQ6Cj4KPiAgIGNvbmZpZyBDRklfQ0xBTkcKPiAgICAgICBib29sICJVc2UgS2VybmVsIENvbnRy
b2wgRmxvdyBJbnRlZ3JpdHkgKGtDRkkpIgo+ICAgICAgIGRlcGVuZHMgb24gQVJDSF9TVVBQT1JU
U19DRkkKPiAgICAgICBkZXBlbmRzIG9uICQoY2Mtb3B0aW9uLC1mc2FuaXRpemU9a2NmaSkKPiAg
ICAgICBoZWxwCj4gICAgICAgICA8Z2VuZXJpYyBoZWxwIHRleHQ+Cj4KPiAgIGNvbmZpZyBDRkkK
PiAgICAgICBkZWZfYm9vbCBDRklfQ0xBTkcKPgo+IHRoZW4ga2VlcCB0aGUgcmVzdCBvZiB0aGUg
Y2hhbmdlIHRoZSBzYW1lIHdpdGggdGhlIHJlbmFtZT8gSSBndWVzcyB0aGUKClllYWgsIGV4YWN0
bHkuIFRoZSBuYW1lIGlzbid0IGdyZWF0LCB0aG91Z2gsIGFzIHlvdSBtZW50aW9uLCBpZiB1c2Vy
cwp3aXRoIEdDQyBzZWUgaXQgZWFybHkgb24uCgpCeSBvbmUgbGVzcyByZW5hbWUgSSBqdXN0IG1l
YW50IHRoYXQgd2Ugd291bGRuJ3QgaGF2ZSBib3RoIENGSV9HQ0MgYW5kCkNGSV9DTEFORyAibW92
ZWQiLyJtZXJnZWQiIGludG8gQ0ZJIGxhdGVyIG9uIChqdXN0IDEpLgoKQ2hlZXJzLApNaWd1ZWwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
