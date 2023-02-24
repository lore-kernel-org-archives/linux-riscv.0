Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2F6C64ED8
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 20:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hqUlVHDIQo97mMhqkJPlRedE5RVAC9qfLsK1lqiY7nI=; b=hR77lyh8HJXDIF
	h+YxzXBLrrhyFkUVP89zbt/7Drh6JZBlQ3v/nazyG8fM6ZD13i3kP+mHAQefraG+k2R7oZPDVn5hg
	F9mPiTpg6Qk+BKnLf8RdNs1DYhTWc9AhrrBlFF9yzWNXTu/ZNAj8BSFLtGTlbpZ5+nwt69+cE7Kz4
	9ZW0X4GTyzhOJjHv+xcBew47S840ZQaRfurPDVrHQL9gwC3T+9xf0BDvn6Pr1WlwfUhOgEE/phC4K
	1HPehVGIXYWspPe9dl/WJoHDu+5B2LA4RkITZiq97HHYfEs4+OdbIX6ZK30P60MS5S5YPabdldw3I
	RUVnaCivYVC3GyGLpkJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVewU-003qGv-2Z; Fri, 24 Feb 2023 20:45:22 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVewQ-003qFs-TF
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 20:45:20 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-536c02eea4dso12327987b3.4
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 12:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gbwZ7KJxlkNyIKWiZuH4bGbwcOZpsexyARY/sQCYU7Q=;
        b=EM6i17xmf4rHEkb6+ZAxBNfq12n66NGEbB3Bp0oCP6oXSZB+KWXgzh18MCjf8H0KqO
         buVvmlAfgnzYq7uX31oLSJ0w+3QaSYZ7LsPdi7nTrssLwQ8+j5EA9bC/WqcCz4FI4Olh
         Ox67BeF01mkW8yvtN9Z5/uQj2LxLLk1ByRbpIz5qHdqcRL+mirLXAELY4tz3FVU5pb2V
         +HO0kiEcs7n7xPiJwz2paZls62gb7WzQw0CCvRIAyYBUeLZ9dEnA29Xa+DXYQBJmkBVG
         TSgiVJ8a2gDNODRc+UclMPNqKnlCXFLZAW2SeqkdjdgQ+W8nSfg683q6VbHQfQ5WN/K9
         sqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gbwZ7KJxlkNyIKWiZuH4bGbwcOZpsexyARY/sQCYU7Q=;
        b=FSb119GLaER4blE6diGzDivDofVUKmqBIbEnek6j4c1b+oKcfQpDFclw3dEqXGqHbM
         jTMoLUP7o8tQCageMcyZ0DGFfjRliMD841d/uIKSrKYUEwtu67VvaZEyx96p3RrlzzbD
         7naUkg9zLz9B+uq8QkioLJda3nHsal51wb32POeRsNUP7rPTyN5MJdru3uSUWdeltS7/
         fk+WFyVu9/yJQtud/WBD7BN/3EegYIyQtbA8uZhHs8tITqTJ/eOdt1IFoXbPky5y1Gsj
         YmLzOUmpQUCU8GV+kB60FtARsmbningrz6F7BAbMW63KwPJ6P6ba/5uRECFqYcAvsRic
         oQqg==
X-Gm-Message-State: AO0yUKXEcBu8H8cN60l143L1Yjp2ku5DcE/bGrtUUrGLQ0h/raIznyW6
	7qCFLRTkqOjzU7l9ZdckcL+PFpClj9nyA0HxtJU=
X-Google-Smtp-Source: AK7set84Zz1Zr7T7N8qHPRl6RNV3+nFpbLtN1bYDnhyNzpxCSNaUv0uEVh3ISprN44/2u3gUR//r6clsUubamtYQ/C4=
X-Received: by 2002:a81:af1b:0:b0:533:8080:16ee with SMTP id
 n27-20020a81af1b000000b00533808016eemr5353877ywh.10.1677271517377; Fri, 24
 Feb 2023 12:45:17 -0800 (PST)
MIME-Version: 1.0
References: <20230224135044.2882109-1-conor.dooley@microchip.com> <20230224135044.2882109-3-conor.dooley@microchip.com>
In-Reply-To: <20230224135044.2882109-3-conor.dooley@microchip.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 24 Feb 2023 21:45:05 +0100
Message-ID: <CANiq72m1bnHZEd1n+tzaTXYqk8kU83CEPSFO7TBMX44J3poKOw@mail.gmail.com>
Subject: Re: [RFC RESEND 2/2] RISC-V: enable building the 64-bit kernels with
 rust support
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_124518_966255_BC427D35 
X-CRM114-Status: UNSURE (   9.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Feb 24, 2023 at 2:51 PM Conor Dooley <conor.dooley@microchip.com> wrote:
>
> The rust modules work on 64-bit RISC-V, with no twiddling required.
> Select HAS_RUST and provide the required flags to kbuild so that the

HAS -> HAVE

> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
> index 6982b63775da..197919158596 100644
> --- a/Documentation/rust/arch-support.rst
> +++ b/Documentation/rust/arch-support.rst
> @@ -15,5 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
>  ============  ================  ==============================================
>  Architecture  Level of support  Constraints
>  ============  ================  ==============================================
> +``riscv``     Maintained        ``rv64`` only.
> +============  ================  ==============================================
>  ``x86``       Maintained        ``x86_64`` only.

I think this separator between rows should not be here (it is not in
`rust-for-linux/rust`). Please see
https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#simple-tables.

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
