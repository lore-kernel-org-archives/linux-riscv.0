Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53E3C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 13:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2pLlizm/JMaHJ4QA7mE2no+utVvWkXjEpuRDjAH/yJI=; b=ynREqi+A52kbNPpNxm4z/6GMdc
	xXeTjaMHSz0TbVDStRcmVSCJn2v5BqgiCf/aQXcT+VYDl6qmJ4Hz3CcwjZqpbS4adUwZqowMyxg/8
	xNFo2C/cZM7N9UAXtJYM3CtXfvSVLWovwRH8ufAdUGfQnonWjE8AQKyybxI8Dc34yfQH3xthQCAZ4
	hAMvkSbxro1L8v6RVV7Ahu74mli3FZOmPdq6OMtm+1yN7sFqeZ2FT7JnjJ8bV+SnAcNh5CKYk+e7M
	Q7t+/vyUBpcnsux5Jqa2SiJFNvv9ZyuBfv+4SaJ4NqKaWnVHOI4Yex6ZtKsJfrrcVtXtVHAvHKC+T
	t06k3Heg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxoXJ-005Jzf-0Z;
	Tue, 31 Oct 2023 13:12:01 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxoXF-005Jxm-28
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 13:11:59 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2AEC340633
	for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 13:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698757910;
	bh=b2T7hXExx+WhS9Dv9tSkQ0JEJTevpbCwf8KukhTzG9g=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=MmPLwNDpV0ZLcNAJvumKQG1V/4nq+yQsy8zRbj7zAL9/fKQmSaWPINCMikvPUSAxg
	 b5hAEYBVm7mRZZYi39y9x+8lBM2uU+99dFYcHOLnd7lslB3jKPygs4ttFbROy/8RKL
	 4S31jGNFfuqXqn0zA32t+vOmRY0dTkm9VRvrkmsr/fPonAwXzrTKcuCjtgfXmw3fzd
	 eZvUZgXZhchslBUDFwdnglLBwJEA1sBs/eXkIzVudmYvbRxhBfIAinCIjryeqaqzTz
	 DcqwAB5wNlmzySqm+AP0u9vI4YLjFlRphExXJT/lkrcTabRqfy0fNmUu2B7HrFL+eg
	 mts6l/CO2YQ3g==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-41cb577d45aso69776741cf.3
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 06:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698757908; x=1699362708;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b2T7hXExx+WhS9Dv9tSkQ0JEJTevpbCwf8KukhTzG9g=;
        b=RO00a18NFHYkAjmsjkR9ZIhdn5ndh1fJaGWaZhbqEGLItLE+2otOgL6TfGDuMBxLHF
         EnRg1JiAhi7atBDEx2Zf5Up0JdCV1YTZnrZl0wm/It3+ppBba1+WmwHn0inzn44SUNLy
         Nv7XdiLvFkp8XUS9NwlfFHaD5zRmBYVXqfqnNr+zeMxqN0mpmQE8YoxATtKZrPnqYpc7
         vgF1PP2GVi5ucdXXuRihd6GxPMSOWvl8JYG4K3EpNETKHGDLZM/nCzHn2yX9UQa4GuUY
         z5uXARCMCl7F+Dr5nCzauRJvpKckCSIHSvJALRfPu1popjPImqcaO2z1tngI4BUUdsyg
         kk8A==
X-Gm-Message-State: AOJu0Yx8R1Z7ltv4rGJYExYdUZcKghcxi476H4e1Nk2AXTt0UObN2dDL
	sDBhHmgFMEdrxcuJ3pwXqJt3qDBsRLEEzzNq3i6AjXIusLJf3hOM1CgCdDo/E8JcNGE+h+YIGEi
	dAM03UeaMlKJ6d9LLpM+YXm+IeNTWdvN/NaXxcXwf7vT27MsfaGyPkPWa6KweNg==
X-Received: by 2002:a05:622a:351:b0:418:d3d:30e1 with SMTP id r17-20020a05622a035100b004180d3d30e1mr15984869qtw.4.1698757908397;
        Tue, 31 Oct 2023 06:11:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLydeufNQ40CIQK34i2W51RxoHoaC5kevrpJPqzBNZkr96WHN3wruIvi91h0D+mmmgNmgd+N5Yhsyd5FWYItM=
X-Received: by 2002:a05:622a:351:b0:418:d3d:30e1 with SMTP id
 r17-20020a05622a035100b004180d3d30e1mr15984845qtw.4.1698757908147; Tue, 31
 Oct 2023 06:11:48 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 31 Oct 2023 06:11:47 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231031-module_relocations-v7-1-6f4719b64bf7@rivosinc.com>
References: <20231031-module_relocations-v7-0-6f4719b64bf7@rivosinc.com> <20231031-module_relocations-v7-1-6f4719b64bf7@rivosinc.com>
Mime-Version: 1.0
Date: Tue, 31 Oct 2023 06:11:47 -0700
Message-ID: <CAJM55Z-v0EwrZp876DdLSzad2u55nJV_uBs_+MUJDqFW5MTPkA@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] riscv: Avoid unaligned access when relocating modules
To: Charlie Jenkins <charlie@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@linux-m68k.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Nelson Chu <nelson@rivosinc.com>, 
	Emil Renner Berthing <kernel@esmil.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_061157_850284_AA331913 
X-CRM114-Status: GOOD (  16.66  )
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

Charlie Jenkins wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>
> With the C-extension regular 32bit instructions are not
> necessarily aligned on 4-byte boundaries. RISC-V instructions
> are in fact an ordered list of 16bit little-endian
> "parcels", so access the instruction as such.
>
> This should also make the code work in case someone builds
> a big-endian RISC-V machine.
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/kernel/module.c | 153 +++++++++++++++++++++++----------------------
>  1 file changed, 77 insertions(+), 76 deletions(-)
>
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 7c651d55fcbd..a9e94e939cb5 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -27,68 +27,86 @@ static bool riscv_insn_valid_32bit_offset(ptrdiff_t val)
>  #endif
>  }
>
> -static int apply_r_riscv_32_rela(struct module *me, u32 *location, Elf_Addr v)
> +static int riscv_insn_rmw(void *location, u32 keep, u32 set)
> +{
> +	u16 *parcel = location;
> +	u32 insn = (u32)le16_to_cpu(parcel[0]) | (u32)le16_to_cpu(parcel[1]) << 16;
> +
> +	insn &= keep;
> +	insn |= set;
> +
> +	parcel[0] = cpu_to_le32(insn);

Why cpu_to_le32(insn)? Unless I've misunderstood something downcasting unsigned
to unsigned values in C (eg. from u32 to u16) is defined to always discard the
most signifcant bits, so cpu_to_le16(insn) should be fine.

> +	parcel[1] = cpu_to_le16(insn >> 16);
> +	return 0;
> +}
> +
> +static int riscv_insn_rvc_rmw(void *location, u16 keep, u16 set)
> +{
> +	u16 *parcel = location;
> +
> +	*parcel = cpu_to_le16((le16_to_cpu(*parcel) & keep) | set);

In this case, maybe consider writing it out like above just so it's easy to see
that the two functions does the same just for differently sized instructions.
The compiler should generate the same code.

> +	return 0;
> +}
> +
> ...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
