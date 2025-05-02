Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC55C3ABAA
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 11:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XMwknhEkCqtevbtCVg7cxs+0PuTk12mQCIWeS4145m8=; b=oBZYhliFu40aKLWtCEcKm5Q5+E
	SZ3qYCYTmfxMbJSVEFsi5kdOk2UPfV52qtd/ck9DF1GTsxvUiqr+u6/+1Ea1StRqFVHtCqAe26BFV
	olaZJ5dcVQCkGS8nxrDYWQAN6SWoOV+X6ez1A1Rj6Q+fggYV7c7116yd9f+/uZ+dsYxspLH7AHzLP
	G9uhzM+y2cOUhTJ/8MjkbBZWdhtrYPwHxYI1Rw2WUjMbeujEFzeZMDhvo3EA2yotRjIJv0UmCjPoP
	+bImmvrsCZrtfzBijUbAaOVSYgo6ESH2jXXQGchR/0UdRgXjKbYfskFlr9cgIMFu5NKDM0pP8gxzf
	PDAxZRIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAog8-00000001nJi-28QX;
	Fri, 02 May 2025 11:35:40 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAoOU-00000001lDI-2Ny8
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 11:17:27 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso7962185e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 May 2025 04:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746184643; x=1746789443; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p5OL8nU942aSLT09UgHbmIML3ySj45uDmdMG5/wKvHc=;
        b=lZOYktcCiHRuBmGPR3g0MAmtYTnqitLSQijF3TOKnh3AaX91wHWutdpIEfowekbw8A
         TNjdC+djfZRkp7AVD8fhFX+tXQvcqAuJO0zB4e9cbqWHKgp0s1HbIo8bFs+bvUuBp5K4
         FQwvo3UmmwiTnXaNT3lv2/khG+5SgxjfrBgVbFR6/S25topC9ThcH9mb21ZG7EOneRfG
         c6bsLtx0/dlSjJ+TTPpfpRcD9fkn97Nacz6pPoKplWQfQwawg7bepsacyMu21Q/zjMWd
         HjcNlR3RrbI5x/TJvfSrcCGi42kwrcaoai6ewuuI/hp22TadJ6JD6O2kjyphrZ5WhEo/
         DaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746184643; x=1746789443;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p5OL8nU942aSLT09UgHbmIML3ySj45uDmdMG5/wKvHc=;
        b=mFXP0u2z3SnyefnJ1MTWuQyQXrgD+Ipd3IoZ0sUHsZu/abYxxcrHm4nbX6eBcKhEXs
         X28yb6ADoBJxsB8hQXIyTABV2mB7ny1j5AVdzwOf0EMCc+0QsGTWHQaW86Wwv+leuw6m
         JRgrDZvG7aHok+Dh/bPIo/DXoJ/Ndr7iZnkkTcLocMJ2ZRXAd49qUa/MbYy9272cdWXc
         9R9AQ6PuTRKAVdsn97LhWCW6U4mz0X2KLgh9G5QxbQcGmzBprXjOCB3N5Ke83zQ3UPyn
         aciFXfcVurEEcc5itF3hPLHVh056GycHPRHxNzJ4MxiEAflUvgZFdx9IyNfgx14B1PAX
         +0RA==
X-Forwarded-Encrypted: i=1; AJvYcCW16KCbq9f7nNP+rEN/xqk0dV0r0nKneEx6V77TBHEEMZ2W4jSuXoYTtd1aDlHvC9o+NBs/7ZC63eLmmg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxaBaD7Mdg4jorCqGFWwF4+mZUi6sqIcdfT8asYKq79vOY69Vfi
	r+MO4Zr4uBUv7yMIR35egyrImqtc23ycELT9LQqi4+X88pfVnhZ+YoztZ2MBZ/26wXDyu0zLTGg
	85cf/VnqQ1hnXsA==
X-Google-Smtp-Source: AGHT+IE72hvZ6mV4D/kXtlS6V50J8cDZa9GKooUY0w71JECu4b4Ctc5ADtyJqEQ5cdCjB5Oy5b/n+Jkyg9Gzn9c=
X-Received: from wmbel14.prod.google.com ([2002:a05:600c:3e0e:b0:440:5f8a:667c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3acd:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-441b72c0a66mr50048405e9.9.1746184643608;
 Fri, 02 May 2025 04:17:23 -0700 (PDT)
Date: Fri, 2 May 2025 11:17:21 +0000
In-Reply-To: <20250502094537.231725-5-fujita.tomonori@gmail.com>
Mime-Version: 1.0
References: <20250502094537.231725-1-fujita.tomonori@gmail.com> <20250502094537.231725-5-fujita.tomonori@gmail.com>
Message-ID: <aBSpwXh0GnuyXyST@google.com>
Subject: Re: [PATCH v6 4/4] rust: Add warn_on macro
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, peterz@infradead.org, hpa@zytor.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, tangyouling@loongson.cn, hejinyang@loongson.cn, 
	yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu, 
	dakr@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_041726_600707_134BCAD4 
X-CRM114-Status: GOOD (  14.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, May 02, 2025 at 06:45:36PM +0900, FUJITA Tomonori wrote:
> Add warn_on macro, uses the BUG/WARN feature (lib/bug.c) via assembly
> for x86_64/arm64/riscv.
> 
> The current Rust code simply wraps BUG() macro but doesn't provide the
> proper debug information. The BUG/WARN feature can only be used from
> assembly.
> 
> This uses the assembly code exported by the C side via ARCH_WARN_ASM
> macro. To avoid duplicating the assembly code, this approach follows
> the same strategy as the static branch code: it generates the assembly
> code for Rust using the C preprocessor at compile time.
> 
> Similarly, ARCH_WARN_REACHABLE is also used at compile time to
> generate the assembly code; objtool's reachable annotation code. It's
> used for only architectures that use objtool.
> 
> For now, Loongarch and arm just use a wrapper for WARN macro.
> 
> UML doesn't use the assembly BUG/WARN feature; just wrapping generic
> BUG/WARN functions implemented in C works.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
