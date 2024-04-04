Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F68DCD1284
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 22:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dw+Q1DzaNSJiOqFkhZEvNx0+c6Oos6Mk4PhzeCKMwpw=; b=U2bvxw8O02LVKy
	ZdNO+Ezrugxrie8V+5xsaqCH1Gxhg+ykXmQFqoHd1Jp0f1MPGnCk0l4+zOGJsElpPAEN/LbzjNw2r
	uakHTHRs0xABtlL/P2OnH0n4jhW6Y0u3RcuPVDNr7iaTaTd67KQR0zUXcBnGZbCj+hyKmHZdszKgy
	ZkLW6L9FBOQSA0scnp+QWqgCLws0gIsbfdmbOU7SwmBJ7VLu1JViKUBdTvZmiJ1StGFEhxka7kXQB
	8UX1PY1MydWqX2FExNEdxmq1ND6de233EE1sJnFA1fe0lZznJdiIBSp3uM9Y3tT2B0OlcMbJKhvXz
	EMEedpQlWEir3fpiqnfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsVlm-00000004TJQ-1LaK;
	Thu, 04 Apr 2024 22:41:18 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsVli-00000004TIY-3vvu
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 22:41:16 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-4da99a22b18so555861e0c.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 15:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712270473; x=1712875273; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8A5tKiFBa0lbUbCLGluriwofV6tCs9WRKtzaqV10d5w=;
        b=WJcxuGNhHXVET0IPWJcw/Car4uZawdLPkusp8fSZ2BtrQ7Q7LEpH/ml7I6QoKh/RL2
         ukU02kYdmUz5ped1t0r67c6w4kPHmIRL/5oATnDD8cI7kRDNW55lL+wdFYYUtxeBuhu2
         1RzVzZGVj6B7B6GI+eEl3yM7sLLxL3tNGe+ttGpKLM2YvC9CJ9tsldPltnG9ZD0ld7Wy
         j3wTjePweibwDDuNr6yvu8sKlyMkAf2py+EdQfESbJdE0Mmf1yIBJ7ihwsbLnI9OdST+
         TxJk+S47JWKPuOJFz82t8zgiHFNb6+6Gaup6RDam5SUa9nLrrNRXnbQv/29YQat2jO0G
         CBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712270473; x=1712875273;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8A5tKiFBa0lbUbCLGluriwofV6tCs9WRKtzaqV10d5w=;
        b=nr0mWiDCPCrJxGHMoTEvFH3gC41SwrWUE1/ViqVSc0NvDUQ8jAye5/wiqHCUVtxSkg
         ZrP/Stz+pZlZEy8aNQNunxQ+vKMtxP7Hxzjr8jVM9Pwm8/VB1Sf6TCkidRYShq10KdJK
         jHFQfDBEJhL5cg3fckDjoTWwgu5As1VwNPyZAHpwEaNM4c4RIZi4hWU8hWv/AgmDPthu
         PFlCTr5ZDqZG3Jhc8IvQc5ntd3LYIwEYlIhcUj14jS8FKNzxCn8507ssWC4QYQ7SolJf
         O4EEJb+8r2WUOG1o3o78Mbi9nEmD0vSopGOrKNrfdKod46mptMAuy7+qaEURLAoJNnlw
         3AZw==
X-Forwarded-Encrypted: i=1; AJvYcCUzkk9Mc4VONE3c/dNX7ndCoqPA+Erb8QzdJMpcfDQpjKeSEqRvCkep54dwd98SPEKa/hWOBP/ZTgXWlZTTr69F88S/ShdZmwWnchc445aP
X-Gm-Message-State: AOJu0Yw294PQv1dfAUqrI5d4viZwONRjYYu9vjLJaFUrOMnhF+8jVCKT
	FT+SF43MprudNTzynnXFO+B6CuQH5+NHomP0in4BH6GzXbbabXfD1g+xGn1LnHhHNn+E/+kNzS0
	T734ndd26Bk1kWMEJr0KabcGMzvhCKfq79oraP9uVO45+V1jJObM08rUpIQ==
X-Google-Smtp-Source: AGHT+IFZOijUz7nc+slBJ8zOHyZ8cj9MgnjzviT3lXApOXO2vYVNI4DlpN571/pk/cWTagxBQ7uu8R14TkT0NKKSOs4=
X-Received: by 2002:ac5:cdf3:0:b0:4d3:3a0f:77ce with SMTP id
 v19-20020ac5cdf3000000b004d33a0f77cemr3746386vkn.13.1712270473349; Thu, 04
 Apr 2024 15:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240404-providing-emporium-e652e359c711@spud>
 <20240404153258.GA852748@dev-arch.thelio-3990X> <CANiq72kSfC2j07mAaV591i4kDwejWRYcFTvASgQmNnHVe5ZwCw@mail.gmail.com>
In-Reply-To: <CANiq72kSfC2j07mAaV591i4kDwejWRYcFTvASgQmNnHVe5ZwCw@mail.gmail.com>
From: Ramon de C Valle <rcvalle@google.com>
Date: Fri, 5 Apr 2024 00:41:02 +0200
Message-ID: <CAOcBZOS2kPyH0Dm7Fuh4GC3=v7nZhyzBj_-dKu3PfAnrHZvaxg@mail.gmail.com>
Subject: Re: [PATCH v3] rust: make mutually exclusive with CFI_CLANG
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_154115_101511_727F51A3 
X-CRM114-Status: GOOD (  12.45  )
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

>
> We track the unstable feature(s) at
> https://github.com/Rust-for-Linux/linux/issues/2 (I just moved this
> one there since it is close to ready, but it was in #355 previously,
> and cleaned things up a bit).

Sorry about that, I should've done this already. In addition to the
link you added above, here's a tracking issue for KCFI support for
Rust:
https://github.com/rust-lang/rust/issues/123479

There are still a few unresolved questions that I'd like to hear from
you as you experiment with it, which the tl,dr. is: KCFI support for
Rust shares most of its implementation with the CFI support, with some
key differences:

KCFI performs type tests differently and are implemented as different
LLVM passes than CFI to not require LTO.
KCFI has the limitation that a function or method may have one type id
assigned only.

Because of limitation listed above (2), the current KCFI
implementation (not CFI) does reifying of types (i.e., adds
shims/trampolines for indirect calls in these cases) for:

Supporting casting between function items, closures, and Fn trait objects.
Supporting methods being cast as function pointers.

There may be possible costs of these added levels of indirections for
KCFI for cache coherence/locality and performance, possible
introduction of gadgets or KCFI bypasses, and increased
artifact/binary sizes, which haven't been looked at yet, and I'm
honestly not super happy about it (but it's better than the original
proposal of adding shims/trampolines to every virtual call in the Rust
compiler), so I'd be interested in any performance results or
regressions you may have while experimenting with it, more
specifically:

Linux Kernel without KCFI vs Linux Kernel with KCFI vs Linux Kernel
with Rust and KCFI, possibly isolated to the code of a driver that has
an implementation in C vs an alternative implementation in Rust.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
