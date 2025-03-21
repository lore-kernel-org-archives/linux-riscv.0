Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56CEC35FF3
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 07:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bLNSYJtX7M5WTuVEAeaoe4HwGdNRQ6IXItVWbRDMLi8=; b=Z6WexRmKA5U1cA
	WJyg4nOxcEGHtZ1tg+CFdU8EaKMM+FsQaooQZblPWRlucITmpo538cj3VaTG9qPlJclXNNcofJS0b
	DEL4lRMZIDAZVQQxmA7XOskYrctZ8rz+ynQqlrSxQSiNQG5zs8wjtZ6KcIRZE5acOLxLA4ia175PT
	gRHDZNux87+rVmMj1eUoNy9lD4MLo/KCQlwMmypSge4TxkKWrwYpomXNc7sPG5MpHMFPGWDHGpRc7
	xiq3FG37x0uZZObzixeE1P3qx5glWbZGm+7ZASfcChucOcKPLL8vRQeDfU/7mNS5QsVH1fdnPOFWs
	cz8SC3VxYVGdqaC56asg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvX65-0000000E9I7-23e2;
	Fri, 21 Mar 2025 07:47:17 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWr4-0000000E6Ws-2HVD
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 07:31:47 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-38da6a1a20bso79238f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Mar 2025 00:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742542305; x=1743147105; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EA53ZruOOQL6IYeAD91OZdQ4lvT8qFBPlQC4O1CwTT0=;
        b=dyTA9GBW8Xe9WNmgxzOMdaPcZitnjgHMsnCGbodiFJB/H+kFnX/XblKSHAA10WtCFW
         5aYghqprrdKCFEXGv6VBoaCIUB4M7boYRtZPt9BugqHmOKaVpPu/k1sMaWk52xItZmbx
         sn1CtDhE5qKpM0uIT3C06UDERCUYF0yK4fpsRyp0/JUfFkWcP8Fox4f9wulBU3S7DBhk
         4j/ISt877qgpVhW6XjlZa9fDMWe1tBw2zkL46bV1ssqwQ0+MIF5gTEut6PSC45vkusEB
         ynoLQuo0TCOYT3J+tT25MONg53k6v4Rl2wRC/CI0/D3pCZsZmUiZdLr5B9wQlOWcQEtG
         6VEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742542305; x=1743147105;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EA53ZruOOQL6IYeAD91OZdQ4lvT8qFBPlQC4O1CwTT0=;
        b=nOAAgBU7Q0OH8hJCXtqCamGDuamgUYkT1TgPCPOH7pjhc262me2Z7NkcdC5tX9roFM
         lvkfYBxcZljvE7LVe2w5crq9Hnmgo6q5dEKi6UVLUW1EkB+51uyO8xS/KNLs+ZZb5+12
         LWzLHjcEUIcFlSIvYi2tsrlgce3WWd4YjsPSfkAOqJ2c0W1xbs0IKbntW9wXHLBrOAwT
         WiblebVS6z1NNKCmAzo9A1dmlJ9H7e7PEBAAzXvrfrmP8jFhgRV4j+yV1N9nXho0AicV
         2GNK2RNbqsfxE+x4X4as+Awc09tfJGwp0bp2AfJ89ggXGfutwKtEl3y17xooEkrokBMT
         etNw==
X-Forwarded-Encrypted: i=1; AJvYcCU7cyBkyTR90iZWeTelZ78aGxgjAPjGjQYYz1Buu+zNqYmKqwPPIuWiYlwGF5nprQ4hkFeJxuaJA4LXQA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywqiwvspdaa1aUewYtp8MTV88cl3/k6WHEvv9Hnia7OJoCGy8y7
	m00vNO8Iq8+tdL1gHclr3g9tHZICSs5UJUZIRv3xjY1XQ2eB0FhHPlqg/I84ZF4=
X-Gm-Gg: ASbGncvAhtcSOr7rZzZ+R11gWUmVXxvNEBb0wevtstNdxFVF6KiFQ08NBHFvnBziYA1
	Q3M3CCcXjZWPrElHQhb7g9gZqrr0HhqH0b2rBaUZ6Fr8td/v1AQXCKLXGxW6k+pL+K/GkcsVy0i
	ievfM30xAJrc4bRo1l5ush1CVS494aQIBAXPznwiQCTW4QEKYYhY7GCGplyH8b2gJFwDjEd5jlF
	LIG/oF6UnmLNzSXP+wZNypRvnkppA1pLDUjcQP37O9hAuOK8HBIbU7l5dbZ/0NBp/GCt0cyOvPU
	QR8Vq3tCJQyqc0RdIovOFSRXFHPwGbXzFj5o1z/L/wONmNm4jSztn3H6pSHNSEdsNXLNLeRX+Ll
	bisET
X-Google-Smtp-Source: AGHT+IGUPJ1yScRfM5ZckM0YOEUPSKKsLT1uHikzcP6azc7wS+CuSOBN2Ombs1xBV9GpD69REV2V/A==
X-Received: by 2002:a5d:64c7:0:b0:386:3a50:8c52 with SMTP id ffacd0b85a97d-3997f917397mr932780f8f.7.1742542304656;
        Fri, 21 Mar 2025 00:31:44 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b260fsm1585165f8f.43.2025.03.21.00.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 00:31:44 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 21 Mar 2025 08:31:43 +0100
Message-Id: <D8LROZ1Y2LLF.20T6DQS0A39QN@ventanamicro.com>
Subject: Re: [PATCH v12 23/28] riscv: kernel command line option to opt out
 of user cfi
Cc: "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar"
 <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Andrew Morton" <akpm@linux-foundation.org>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, "Vlastimil Babka" <vbabka@suse.cz>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Conor Dooley" <conor@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Arnd Bergmann" <arnd@arndb.de>, "Christian Brauner" <brauner@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Oleg Nesterov" <oleg@redhat.com>,
 "Eric Biederman" <ebiederm@xmission.com>, "Kees Cook" <kees@kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan" <shuah@kernel.org>, "Jann
 Horn" <jannh@google.com>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <alistair.francis@wdc.com>, <richard.henderson@linaro.org>,
 <jim.shu@sifive.com>, <andybnac@gmail.com>, <kito.cheng@sifive.com>,
 <charlie@rivosinc.com>, <atishp@rivosinc.com>, <evan@rivosinc.com>,
 <cleger@rivosinc.com>, <alexghiti@rivosinc.com>, <samitolvanen@google.com>,
 <broonie@kernel.org>, <rick.p.edgecombe@intel.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Deepak Gupta" <debug@rivosinc.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-23-e51202b53138@rivosinc.com>
 <D8LF0RDZ6809.1I3MCCVSHRSQ2@ventanamicro.com>
 <CAKC1njQR9yARvWffjznjpeZK5zLFpg0-qCUo25_8niH29YL6uA@mail.gmail.com>
In-Reply-To: <CAKC1njQR9yARvWffjznjpeZK5zLFpg0-qCUo25_8niH29YL6uA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_003146_587295_3712E17C 
X-CRM114-Status: UNSURE (   6.26  )
X-CRM114-Notice: Please train this message.
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

MjAyNS0wMy0yMFQxNTozMTowOS0wNzowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5j
b20+Ogo+IE9uIFRodSwgTWFyIDIwLCAyMDI1IGF0IDI6MzXigK9QTSBSYWRpbSBLcsSNbcOhxZkg
PHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4+IDIwMjUtMDMtMTRUMTQ6Mzk6NDIt
MDc6MDAsIERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPjoKPj4gPiArX19zZXR1cCgi
ZGlzYWJsZV9yaXNjdl91c2VyY2ZpPSIsIHNldHVwX2dsb2JhbF9yaXNjdl9lbmFibGUpOwo+Pgo+
PiBJJ2QgcHJlZmVyIHR3byBjb21tYW5kIGxpbmUgb3B0aW9ucyBpbnN0ZWFkLgo+Cj4gT25lIGZv
ciB6aWNmaWxwIGFuZCBvbmUgZm9yIHppY2Zpc3MgPwoKWWVzLiAgSSBkb24ndCB3YW50IHRvIHN1
Z2dlc3QgdGhlIG5hbWluZywgYmVjYXVzZSBJIHdvdWxkIGhhdmUgdXNlZAoibm91c2VyY2ZpIiB3
aXRob3V0IGFuIGFyZ3VtZW50IGZvciB0aGUgY3VycmVudCBvbmUuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
