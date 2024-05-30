Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393EBC25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 09:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FTAo5yd9/W6TOpQdPjPJaAFBEiAY0AJxWYfZWqjsaAU=; b=lvGMvSyIv3Tn9C
	UsRHfCglNqvAbBl26PHfBTBAzqazjwIGyybVc7teqPvlgDhqgIebvdLKpCD/jL2W9lh2IoDcEZ0Or
	t9DkttPZ2YZ/bdeBHZr276ulwG7xG3JHwGbSSbnfBjvmb8+XlKheX/MEsA/mcU3V5RkjaKU70Hh15
	Ae3OR1Y+e+FoBwV5skP2DtLAiH9TodgQ3OMjModQFD4Mrb5hI+TaJRs1rqeQ47HKFt0XSwi42WaQO
	jE3Lp5IdyI7HIAo2Emv444zrEYZCSdl6z92cBdkQsZ/uIqzL4r29qkIV35v5jKNf7RHD5z6dyITRV
	30EmwSmg7Mp8jDtN1qHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCcCK-00000006qon-04ux;
	Thu, 30 May 2024 09:35:48 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCcCB-00000006qeU-3CNC
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 09:35:41 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-24cbb884377so357208fac.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 May 2024 02:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1717061727; x=1717666527; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIKK60Me9RhDM5LPzOVIbg3hAvv72+j6Tp3QihasYZ0=;
        b=f71R+qIm03Nv1fH/YRilqc0JKDmtiuJNQZrVvdxbYVcDZ84Vet6RAbAKxaN2eY1rWH
         7aV/ynKjnfXoBa6YLr7jIV5Jhw8Q67AsnBKwJDO2c9DWTYqaXtdLgjSneJG11WU/Uf1C
         enkv4t19RVGeIfgLLNL9tnUYDm/CgutjUnwGqEkJLtLshyqpbiJJW+R0RDmo+hB72Wji
         NiVW6u07IiZ5fxc+GriRdyWCngCnNEZFLkaRqVoSLjRLO+5e3pLonq8jfQZzUimgyg7y
         qAt5rPTfHW2qBSba0sf2nTq71buHx7dUfG6De+6RG9cjMxEBupcTh6uzu/FZTV+5ob58
         u1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717061727; x=1717666527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIKK60Me9RhDM5LPzOVIbg3hAvv72+j6Tp3QihasYZ0=;
        b=DinbCzsCrb0T8zWFX3guFPH7C6pXIW0x/knf4UnUUAjWwibvj74TCNhLMBwYLSGRfM
         IN3/3E4SwoDDqOz0RPGsRmO6V/ggygq8KmgEFiexUpMPnyp3+V/RuFSCSk1YEFFO0Y1Z
         Uol32j/VDYoXepbY25Nb/khgdeDbdqxaJFmREgoERxisI5bwkLqbEES4SSC+cVDuQ5j8
         lPz+GBfx6judEbnyVIexQgJyVFmpbDPwASqTngCi5RqlqeTUlRxXIyKZoGrcfsCTzJvD
         cFpLm1jko/A/X2t9q7zh7hwCyLFByAQqiim8l284hhjwd3R4sXNguiIoe44hkU+VFErj
         +EFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzCX3lWFx4QNc9N+Z5FpX5Hd/93rDqr+ioZUvnfbVQY+6hYahGXibQR4epaGX0nbn6OWljVB91y0t5s/rXoqTF/mgueCNZ2TLhNXl53SvZ
X-Gm-Message-State: AOJu0YxvGUoz3+XVERKqJqY6g8xjfJ7b6+i4PX2vaD1XrsH9V8Me19A0
	Vq8A9FErvDpkBZ0+h8J7rmzfQxPEQL57RH5NOc+nNkfFv1PFSaQYY1SRjjDIgQ724iCHg2l6lEU
	sURtNX4NRszJGVyqBDoFZDHT96rA6rA11ya+0jw==
X-Google-Smtp-Source: AGHT+IGQo/4+Bcec7GR4w4t9VuGgDnfgRuIzi4gbmVB9EXNZxFk4++tYC42KZVEUtna/+lcQBmHO84N93cneyoHhbbs=
X-Received: by 2002:a05:6871:3329:b0:24c:ac96:ac78 with SMTP id
 586e51a60fabf-25060de9e8amr1722957fac.44.1717061727430; Thu, 30 May 2024
 02:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240131155929.169961-1-alexghiti@rivosinc.com> <20240131155929.169961-5-alexghiti@rivosinc.com>
In-Reply-To: <20240131155929.169961-5-alexghiti@rivosinc.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 30 May 2024 17:35:16 +0800
Message-ID: <CAEEQ3wnmCr5NTEFo3wTN_zWse2DPkE6ieVUk_=Vv7A-UzDCCvQ@mail.gmail.com>
Subject: Re: [External] [PATCH RFC/RFT v2 4/4] riscv: Stop emitting preventive
 sfence.vma for new userspace mappings with Svvptc
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Ved Shanbhogue <ved@rivosinc.com>, Matt Evans <mev@rivosinc.com>, Dylan Jhong <dylan@andestech.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_023539_863099_78F1F441 
X-CRM114-Status: GOOD (  21.79  )
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

SGkgQWxleCwKCk9uIFRodSwgRmViIDEsIDIwMjQgYXQgMTI6MDTigK9BTSBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gVGhlIHByZXZlbnRpdmUgc2Zl
bmNlLnZtYSB3ZXJlIGVtaXR0ZWQgYmVjYXVzZSBuZXcgbWFwcGluZ3MgbXVzdCBiZSBtYWRlCj4g
dmlzaWJsZSB0byB0aGUgcGFnZSB0YWJsZSB3YWxrZXIgYnV0IFN2dnB0YyBndWFyYW50ZWVzIHRo
YXQgeFJFVCBhY3QgYXMKPiBhIGZlbmNlLCBzbyBubyBuZWVkIHRvIHNmZW5jZS52bWEgZm9yIHRo
ZSB1YXJjaHMgdGhhdCBpbXBsZW1lbnQgdGhpcwo+IGV4dGVuc2lvbi4KPgo+IFRoaXMgYWxsb3dz
IHRvIGRyYXN0aWNhbGx5IHJlZHVjZSB0aGUgbnVtYmVyIG9mIHNmZW5jZS52bWEgZW1pdHRlZDoK
Pgo+ICogVWJ1bnR1IGJvb3QgdG8gbG9naW46Cj4gQmVmb3JlOiB+NjMwayBzZmVuY2Uudm1hCj4g
QWZ0ZXI6ICB+MjAwayBzZmVuY2Uudm1hCj4KPiAqIGx0cCAtIG1tYXBzdHJlc3MwMQo+IEJlZm9y
ZTogfjQ1awo+IEFmdGVyOiAgfjYuM2sKPgo+ICogbG1iZW5jaCAtIGxhdF9wYWdlZmF1bHQKPiBC
ZWZvcmU6IH42NjVrCj4gQWZ0ZXI6ICAgODMyICghKQo+Cj4gKiBsbWJlbmNoIC0gbGF0X21tYXAK
PiBCZWZvcmU6IH41NDZrCj4gQWZ0ZXI6ICAgNzE4ICghKQo+Cj4gU2lnbmVkLW9mZi1ieTogQWxl
eGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3BndGFibGUuaCB8IDE2ICsrKysrKysrKysrKysrKy0KPiAgYXJjaC9yaXNj
di9tbS9wZ3RhYmxlLmMgICAgICAgICAgfCAxMyArKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hh
bmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9w
Z3RhYmxlLmgKPiBpbmRleCAwYzk0MjYwYjVkMGMuLjUwOTg2ZTRjNDYwMSAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcGd0YWJsZS5oCj4gQEAgLTQ3Myw2ICs0NzMsOSBAQCBzdGF0aWMgaW5saW5lIHZv
aWQgdXBkYXRlX21tdV9jYWNoZV9yYW5nZShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwKPiAgICAgICAg
ICAgICAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkcmVz
cywKPiAgICAgICAgICAgICAgICAgcHRlX3QgKnB0ZXAsIHVuc2lnbmVkIGludCBucikKPiAgewo+
ICsgICAgICAgYXNtX3ZvbGF0aWxlX2dvdG8oQUxURVJOQVRJVkUoIm5vcCIsICJqICVsW3N2dnB0
Y10iLCAwLCBSSVNDVl9JU0FfRVhUX1NWVlBUQywgMSkKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgIDogOiA6IDogc3Z2cHRjKTsKPiArCj4gICAgICAgICAvKgo+ICAgICAgICAgICogVGhlIGtl
cm5lbCBhc3N1bWVzIHRoYXQgVExCcyBkb24ndCBjYWNoZSBpbnZhbGlkIGVudHJpZXMsIGJ1dAo+
ICAgICAgICAgICogaW4gUklTQy1WLCBTRkVOQ0UuVk1BIHNwZWNpZmllcyBhbiBvcmRlcmluZyBj
b25zdHJhaW50LCBub3QgYQo+IEBAIC00ODIsMTIgKzQ4NSwyMyBAQCBzdGF0aWMgaW5saW5lIHZv
aWQgdXBkYXRlX21tdV9jYWNoZV9yYW5nZShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwKPiAgICAgICAg
ICAqLwo+ICAgICAgICAgd2hpbGUgKG5yLS0pCj4gICAgICAgICAgICAgICAgIGxvY2FsX2ZsdXNo
X3RsYl9wYWdlKGFkZHJlc3MgKyBuciAqIFBBR0VfU0laRSk7Cj4gKwo+ICtzdnZwdGM6Cj4gKyAg
ICAgICAvKgo+ICsgICAgICAgICogU3Z2cHRjIGd1YXJhbnRlZXMgdGhhdCB4UkVUIGFjdCBhcyBh
IGZlbmNlLCBzbyB3aGVuIHRoZSB1YXJjaCBkb2VzCj4gKyAgICAgICAgKiBub3QgY2FjaGUgaW52
YWxpZCBlbnRyaWVzLCB3ZSBkb24ndCBoYXZlIHRvIGRvIGFueXRoaW5nLgo+ICsgICAgICAgICov
Cj4gKyAgICAgICA7Cj4gIH0KCkZyb20gdGhlIHBlcnNwZWN0aXZlIG9mIFJJU0MtViBhcmNoLCB0
aGUgbG9naWMgb2YgdGhpcyBwYXRjaCBpcwpyZWFzb25hYmxlLiBUaGUgY29kZSBvZiBtbSBjb21t
IHN1Ym1vZHVsZSBtYXkgYmUgbWlzc2luZwp1cGRhdGVfbW11X2NhY2hlX3JhbmdlKCksIGZvciBl
eGFtcGxlOiB0aGVyZSBpcyBubyBmbHVzaCBUTEIgaW4KcmVtYXBfcHRlX3JhbmdlKCkgYWZ0ZXIg
dXBkYXRpbmcgcHRlLgpJIHdpbGwgc2VuZCBhIHBhdGNoIHRvIG1tLyB0byBmaXggdGhpcyBwcm9i
bGVtIG5leHQuCgoKVGhhbmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
