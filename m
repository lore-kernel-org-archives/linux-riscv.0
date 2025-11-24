Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7C4CFD2F6
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 01:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gryFg14RfeaUG3GINUfjQ2g5jjzE+DDGOw8mKhwVw8w=; b=Qpt9cM9s1mFHuv
	DD7UePgbF1OYU99FlrGFa5DoayuhV5SSgtQka3So8Ngij9vyhjORWC1bzRENPid8vMikQPLRT1DeL
	Wgvm5JGWl/AQlqO8z0AZfTAIcNI3DO15nSiYQj50M/sgfI32HsrwrSUUVHyTrESb4U0ePSAAQ10kU
	8CiZpDSZTlPl5eiG4JkJoEH0h0Iyqe2qkvji0mFaH3Q4kzHc6gHJ/JVCD70n+DsSUF2QICx4SJKPR
	9riTZI16TLZF1IRQU+MW03f5eVM3e38VWio/JJ0sIRT2QfB+kTfel3xkH+kozTDpZo4iT1FrdVh2y
	pXuStI3oa3j82xI4NotQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNLJu-0000000Av4O-2pqI;
	Mon, 24 Nov 2025 01:24:46 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNLJs-0000000Av42-2hJE
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 01:24:46 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7bac5b906bcso412122b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 23 Nov 2025 17:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763947484; x=1764552284; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OneiY8I0gUlFfju2yeygYk51QQ079MS3LKtwX0yTN7U=;
        b=SArjrJn6kR1H+RqVSp6iY4xPPgz0DqAHeUjMmrhsn0npHlKxKrcuvbSBJSQbkPHjZC
         LBCriMSGHlbym7OQX+q7UBzfN397PhrTIYPtWzQJNkX8GG3KakoL0I2SkmmR2ecopGV/
         fehB6FPi0/XIxnqf3RQ3SNKqSGVsTNYgNvx9uWKQ7yapxScN42kOyUBEaRJCCQjMxeRz
         TitlQGKskn3hPaw9l9qOBGhP4zRlj9vCz/zFZyDhnCGHLJj8ALHS2GogH/tK5Q6EUuKY
         voh0QaZmvGZcZnbyssLKszGNe3Pc/1/rzk+B4keoEMLW/8jwFIPky8f9KyOlrspObDhi
         FcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763947484; x=1764552284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OneiY8I0gUlFfju2yeygYk51QQ079MS3LKtwX0yTN7U=;
        b=IXWh5vMrC6MF6DcbL1OYubdqQ5otH/YeAmuebj6+5mL7b5DC5Z7b7MiSVHnYnlIzWO
         oJekLWUuhAbbJSAOQ4g3OTr9bCakJmUq4pEIPAI2ErLDx3BFMaInlu4/lEPMGkOA+8t3
         /gFNDl5aIk4CLVGdFDF/RC+Z0Me1PuXsMUXupf5lyphEnglGe4MnfZGuuFWG84A9M8Wy
         ttXCJGiUlmHIuZNpR+Udb7LQk2EDQnFeEhaQ8Myd6BEsuwJ0xyh/ClOtdKfcZJAN+ENB
         vFNfoXL4cGPdOJdN5Vh6aapDzOaMV5vowdBs6C5Tc59pUIfp7AiZnVrRhX/jKe9VC+HX
         huWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSD2NDorHnrnhj2FPRinZ0xHkh6y0npQBFgpVGATKu7ThdqN9Qfm32Z2TmQ1zDoVSUzlYdSp4npDdjaA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4sWkLvewXYVAD9zNupWjKr4VmQeFHcgMnfmByV5SnUk0t/yEW
	L2E9iI0kSyKr+8nTjJAI5nT8zgqoUJcppb/+NiLUIeIfF879BG9x2TP9RXcbq1tfzL6LJNSn+LW
	74Ix15s2TJuqtTqXOHF+I14clzCfImxw=
X-Gm-Gg: ASbGnct/a9QGuUvIemHAxudDDT3UcnKARDC0ZR1CeKKbn/YMTjZMsRy1s2xIQROw1+T
	7S4VxhgkVD4HZLi2gOMXgKvl6lJaYLGcPPrcChgK32Hoc3GFnu1rxanmcm+2Vk0Slv0xvMQJgNC
	RFOjMx20EH6M5a51I2UuA/YDAE8ZzPcXTST6I5Hn5KLryVJYWLdbHbidKgTsc5TVfv8SzhNys5u
	zLjKQjCdS1EVylhfViPifXhmsNHeY3hXYf7+8DzvxYuphmIPEVT94HGaxp7MVxEBlTmQnDQQixL
	L7BKQdfLhXs59Jgywfm5JYBJDJDkzgK8TZTBeSm+NN4xh5m1q5yDjz2P2hEs70eFM9RtAPr1sr5
	+DUoTsWScaI+NLw==
X-Google-Smtp-Source: AGHT+IE/FDIBNqUZA/G/+nKiTfBaSa9copxgf7FlXf8Svbk+fth/f6d611m28X3uKTN8JNKPOU1LrwubVCZnNZk0CiM=
X-Received: by 2002:a05:7300:ec16:b0:2a4:5129:fe99 with SMTP id
 5a478bee46e88-2a724bc5450mr5377066eec.2.1763947483691; Sun, 23 Nov 2025
 17:24:43 -0800 (PST)
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com> <20251124-gcc-rust-v4-v4-2-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-2-4e06e07421ae@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 02:24:31 +0100
X-Gm-Features: AWmQ_blKJN1cEm5aJqBoq0agAeCfqxj6IncPPqpzjooJxt-eYO2MrWfk7cdiYl0
Message-ID: <CANiq72mJqN09FvfjDeo+WBN=Pht74iidRxoU_JcMfXV6oMmKEg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] rust: generate a fatal error if BINDGEN_TARGET is undefined
To: Asuna Yang <spriteovo@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
	Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_172444_682545_4A447474 
X-CRM114-Status: UNSURE (   7.41  )
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

T24gTW9uLCBOb3YgMjQsIDIwMjUgYXQgMToyM+KAr0FNIEFzdW5hIFlhbmcgPHNwcml0ZW92b0Bn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gR2VuZXJhdGUgYSBmcmllbmRseSBmYXRhbCBlcnJvciBpZiB0
aGUgdGFyZ2V0IHRyaXBsZXQgaXMgdW5kZWZpbmVkIGZvcgo+IGJpbmRnZW4sIHJhdGhlciB0aGFu
IGhhdmluZyB0aGUgY29tcGlsZXIgZ2VuZXJhdGUgb2JzY3VyZSBlcnJvciBtZXNzYWdlcwo+IGR1
cmluZyB0aGUgYnVpbGQgc3RhZ2UuCgpJIG5vcm1hbGx5IHN1Z2dlc3QgcHV0dGluZyBpbiB0aGUg
bG9nIHRoZSBlcnJvcnMgaW4gY2FzZSBzb21lb25lCnNlYXJjaGVzIGZvciB0aGVtIGFuZCBmb3Ig
ZnV0dXJlIHJlZmVyZW5jZSBldGMuCgpBY2tlZC1ieTogTWlndWVsIE9qZWRhIDxvamVkYUBrZXJu
ZWwub3JnPgoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
