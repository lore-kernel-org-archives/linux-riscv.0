Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA913C021B8
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 08:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uE0XJYnIz4CKUIq4XX3HLRk1CTqZQr4Kges+Pm+NbUI=; b=yrOG1zkX2NgN1J
	CiPQoRNv7N9RpyShrFf9i/9KyxO2GbxqAxlIJS2NGEHRzj3GHi+0zCxdcoty3lLkEHBbC/YBL6S5X
	Yy+3V6HiE55pNRsvA5u2EH8mU0FE461qFxM1lDMq4MjSLaLgKnInJU7mZtd08doqHcKJ8FIPhFWiN
	OxYsqiAgakk4vqbpCz7cNm04ovlNYlA+oJY5t+NOWgpw3p9bPeTOQZfc+VlcR95K2BjcjyLhrshQx
	OOgCA7l6I5nIe9M9DMgU8Qdf6NFzSfDwwQct3WZHuFkVxPja78W07glZIf61BxM0meflFxuYuzqld
	YNqV95TfdgnlKWsAF3Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpO7F-00000003jto-3rPA;
	Tue, 04 Mar 2025 08:59:05 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpO6V-00000003jly-14rB
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 08:58:20 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4398ec2abc2so48194335e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Mar 2025 00:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741078697; x=1741683497; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+xt0a9MOKxcngTL6D0NlkBxMF5DrrijsvR0wGk0H/sc=;
        b=m9Ho3Xh59KL9D5Glf3hdBQh9CTTv722Enrqq/r7JwiT8IV19YAaYkm00+uBBWwcbLS
         pVX9abVCsPn8jh1OImIVCtpdfjvAm1Pmt28IUOjvVRz9DQ+jC8+rwGIUpYRh2ORXJQLr
         KEF/WiVVsu+wJmyhU5eldkLHisCMhHyhyFITNgtZ8QGI7MR5eoaHsFiNfMf420B1nhbZ
         qHKS8eIavMr88h9zwLgZOFqLdKMCvfDTI/nr9xzRLsIHOox/qjFHxSZTy8uAQu11/Kvp
         9PvD/M2bq9FpheRvlxy/nCVXJLuEKqngWaAGiYf6qXyX0kFCHii7KLtUcsl26ycYkzC7
         nVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741078697; x=1741683497;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+xt0a9MOKxcngTL6D0NlkBxMF5DrrijsvR0wGk0H/sc=;
        b=QS8/Dbh3Ie8oyD9IzZMYQIsnbYbKzxk61t8y7y8FzG0OCRvL4fJJHQA/uyYc/ol2T3
         y8Jiep9sqH/nKKam6Iv65yYBiaZh0D05Q51TliwJ1vk6m301vBxsZjxDS7uMyviqyBh9
         EvGNanrwI9gq0ePKB5SAqDV/izy8Uyj1wQdQclW4lGV2EwolMAom9oUKVbl3AbWBPJM2
         +jAP4iprdNtmB0PhS99rMA0UDRYTeLIEYDn9+Psmxt+czo4Pji6DuqBfe/ztx5bnnliv
         hkH6MG9rXFPNGsevHtAnAH+V9/ydUCr6dsBhX7HZAJe34jZ2UTSKR+WPwBfx+X3Y2Nnm
         tz8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWTk7C9HSGb1xjoeLyQWWfg1z7orgOJ5K3i4DJQijiJuOvm7dVUcLKcnDJZwYW7ghZ1XRWOQcy/EWd0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxbR1eUu/PAramVCaAV/f5nVqmX0xFc0/RgI8xNvTvelZQSrdC
	9p8CuMXyV2fghemKiT7aBIl+8YFlvgrOmAvEqDAweigwjiH95cQrJyKKfvBtXSM=
X-Gm-Gg: ASbGncsnCT3zvyVoUwCs2JDY4XVm8KBR7weXe184HqFpOI7RuSjhWzYqp8RafcvYhl6
	OJca9dQzD7mVo2SjIPRtMf98p8oi9rmGguHO1EedZvbJJbL0Lhv/fGrBGkfcp/XpYAQoMQyyVtv
	wPWDODywFw/+uNqxwW+lNhfWhza8TUCfBR+RIkyzfvReQVsAQCWYV1p0yMkmgS6ileKqc/qLlbH
	boejt9aL6LyqH0RPRvbT2037x04cfsKsv9LNuRObCgAorKj+PQkK5y2iI9fWIDPP069EcGDKARj
	Tj4KCs/cjPWOj15e3guenR3DjxGQ1+0s
X-Google-Smtp-Source: AGHT+IH6MvxZS60faFjjSE/SOwTs7ArGKMS/DI+pAYNkmL1uwIQZP3dtDN6thfBALwaicYstcm9hQg==
X-Received: by 2002:a05:600c:5111:b0:43b:ba52:bcaf with SMTP id 5b1f17b1804b1-43bba52c199mr77383595e9.5.1741078697098;
        Tue, 04 Mar 2025 00:58:17 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::688c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485e03asm17306599f8f.95.2025.03.04.00.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 00:58:16 -0800 (PST)
Date: Tue, 4 Mar 2025 09:58:15 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 4/4] KVM: riscv: selftests: Allow number of interrupts to
 be configurable
Message-ID: <20250304-5a85b3a246f14f60f61a45e0@orel>
References: <20250226-kvm_pmu_improve-v1-0-74c058c2bf6d@rivosinc.com>
 <20250226-kvm_pmu_improve-v1-4-74c058c2bf6d@rivosinc.com>
 <20250227-f7b303813dab128b5060b0c3@orel>
 <CAHBxVyGGw6Ur4Kdd8Vvwp6viKWPx64w7gNvNiUzmAGeXF2PGoA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHBxVyGGw6Ur4Kdd8Vvwp6viKWPx64w7gNvNiUzmAGeXF2PGoA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_005819_296205_4D794F3E 
X-CRM114-Status: GOOD (  12.83  )
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

T24gTW9uLCBNYXIgMDMsIDIwMjUgYXQgMDE6Mjc6NDdQTSAtMDgwMCwgQXRpc2ggS3VtYXIgUGF0
cmEgd3JvdGU6Cj4gT24gVGh1LCBGZWIgMjcsIDIwMjUgYXQgMTI6MTbigK9BTSBBbmRyZXcgSm9u
ZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIEZlYiAy
NiwgMjAyNSBhdCAxMjoyNTowNlBNIC0wODAwLCBBdGlzaCBQYXRyYSB3cm90ZToKLi4uCj4gSSB3
aWxsIGNoYW5nZSB0aGUgZGVmYXVsdCB2YWx1ZSB0byAwIHRvIGF2b2lkIGFtYmlndWl0eSBmb3Ig
bm93Lgo+IFBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3Ugc3Ryb25nbHkgdGhpbmsgd2Ugc2hvdWxk
IHN1cHBvcnQgLW4gMC4KPiBXZSBjYW4gYWx3YXlzIHN1cHBvcnQgaXQuIEkganVzdCBkb24ndCBz
ZWUgdGhlIHBvaW50IG9mIHNwZWNpZnlpbmcgdGhlCj4gdGVzdCB3aXRoIG9wdGlvbnMgdG8gZGlz
YWJsZSBpdCBhbnltb3JlLgo+CgpJIGRvbid0IG1pbmQgbm90IHN1cHBvcnRpbmcgJy1uIDAnLgoK
VGhhbmtzLApkcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
