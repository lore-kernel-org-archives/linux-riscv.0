Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E952C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 06:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dsPj6MJpOyjFl+N17uAdNqWbG55Mi0stP2tGpfybxzU=; b=OexMC2fv1T0DKz
	bbRcJMZOWCgoLNuTS2IZkDWfisnLHkRDCWSH+ti+dGgK9GCiisZPzyqZB+ljv8OhGYNj5sJlmhSD6
	DqNVW6a0yRXM50RVfNheq8KjvbzMNPq2HxZqTZK4W6BFk8dlp2ZlRTgYhC5Zr9VJfqi2kYirB9SWU
	nxCg3a/tIXxuN7Ixpw1SIQXh/e5V3q8zxSktXiL2jX9/dnW6PYt2/qUpggDMFBu+dJ2QhTpAKNf6Q
	FcQfpWaXBUg3X/VxoExlM3dBB5gMLr9f0SJvC9N2i11bUNulBPiSCE/iCfl1NQSsfpn2zmLpKbwXx
	V3M6Zd7IqJjCsSApgzHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKDOM-005dRf-5Q; Wed, 16 Feb 2022 06:02:18 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKDOI-005dPS-UG
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 06:02:16 +0000
Received: by mail-yb1-xb35.google.com with SMTP id v63so2833674ybv.10
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 22:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1rbKjtTuqSd76t2artUCByRA28ELNC5Nnlp8GtVRo1A=;
 b=ebvZHN/qAMvc+F6EmLJRBahtwaxjIryTHv9sw/WSGaVH5iEa/BjCWVL7MoM15leGvl
 RQkQ97eClLWb29wqvJoyxn/sNYqXaPaAY68WYGyF+aR44oEZmxHgMil8MaWUctgRsKZK
 bdGPEaJU88J3GriIeu72b6DGUpbmHsipamMkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1rbKjtTuqSd76t2artUCByRA28ELNC5Nnlp8GtVRo1A=;
 b=zCcS5RRukcBNZ2DxuQtlKbWBwWdfWVK+JGFSTnkKgHmGR7AyYHqPjoSSTa2M2F1zNz
 EfhvHsDuA6rSF2eL0850x/GcYO5ZBdT4NiRqtEN78vORd16f11lB+96UwvOxql2sOiZV
 zHxLxmwlct5E0wtv8Lp7rs5dmICpPxp89+v/eZMfrQJp9gQuq5B8O7faPrPXZxca1etu
 ibO/CGMqqkRfhGqRKIiRdgMhYWIXmuTF1YagV48Kg6wL1gpKsBNrdXOPo1j83ZYuoXDK
 ltDLkSCmOoPw3zLa9W7hWWFABtjdy8E6z1zkjk9xH9Uxq3UHyNV3Dtm3b1TaiNyFj8UP
 8ADg==
X-Gm-Message-State: AOAM5321UYvIlx6UZJy2TqVxRLd/VkAAO1gMV4JyuTjdoUHcfATINJzI
 lQzEi2HB8te2qlmrjSlkJt5XyDjHOpc17lwPmgjR
X-Google-Smtp-Source: ABdhPJzvezDUbOdbNXn+8RclKv+n+iemPric6QYwKX7XXEtQz9vXo1ArziNPBlkh5QDcmGlgKx1YbVk8Rede/nannYg=
X-Received: by 2002:a25:fe03:0:b0:61d:f5ce:56a9 with SMTP id
 k3-20020a25fe03000000b0061df5ce56a9mr938290ybe.472.1644991330084; Tue, 15 Feb
 2022 22:02:10 -0800 (PST)
MIME-Version: 1.0
References: <20220216002911.1219593-1-atishp@rivosinc.com>
 <cover.1644987761.git.research_trasio@irq.a4lg.com>
 <8d7e1937f9476d14f64a53684b11bedd6f4ff88d.1644987761.git.research_trasio@irq.a4lg.com>
In-Reply-To: <8d7e1937f9476d14f64a53684b11bedd6f4ff88d.1644987761.git.research_trasio@irq.a4lg.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 15 Feb 2022 22:01:59 -0800
Message-ID: <CAOnJCUKPBht9OY6bhHracxsX7U0w8jPKX-kFcQ5ZYkD-k7q4mQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] RISC-V: Extract base ISA from device tree
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_220215_056484_E07E7A48 
X-CRM114-Status: GOOD (  27.11  )
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

On Tue, Feb 15, 2022 at 9:04 PM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>
> This commit replaces print_isa function to extract base ISA from device
> tree ("riscv,isa").  It uses a subset of Tsukasa's riscv_fill_hwcap ISA
> parser.
>
> Design choices (1):
>
> It constructs base ISA string from the original string (does not cut
> the original string like Atish's).  This is to strip version numbers
> (too minor to represent as major ISA) but this behavior may be
> debatable.
>

A simpler solution would be to just invoke
__riscv_isa_extension_available for all the base
extensions (imafdc) and print the base isa string.
We don't need to parse the ISA string again here.

> Design choices (2):
>
> It skips when single-letter 'S' or 'U' is encountered.  It improves
> familiarity with regular ISA string.
>

I don't think this is necessary because only Qemu appends 'S' & 'U' in
the isa string.
Your patch in Qemu will fix that for future releases of Qemu.
All other commonly used platforms (hardware/spike) already use the
correct ISA string.

> This commit is intended to be squashed into Atish's isa_framework_v4
> PATCH 6/6.
>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> ---
>  arch/riscv/kernel/cpu.c | 83 ++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 74 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 6f9660c0a973..3f9607a66d95 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -101,17 +101,82 @@ static void print_isa_ext(struct seq_file *f)
>
>  static void print_isa(struct seq_file *f, const char *isa)
>  {
> -       char *ext_start;
> -       int isa_len = strlen(isa);
> -       int base_isa_len = isa_len;
> -
> -       ext_start = strnchr(isa, isa_len, '_');
> -       if (ext_start)
> -               base_isa_len = isa_len - strlen(ext_start);
> +       unsigned char parse_break = 0;
> +       char base_isa[RISCV_ISA_EXT_BASE + 5];
> +       char *base_isa_end = base_isa;
> +       const char *isa_end = isa;
> +#if IS_ENABLED(CONFIG_32BIT)
> +       if (!strncmp(isa, "rv32", 4))
> +               isa_end += 4;
> +#elif IS_ENABLED(CONFIG_64BIT)
> +       if (!strncmp(isa, "rv64", 4))
> +               isa_end += 4;
> +#endif
> +       if (isa != isa_end) {
> +               strncpy(base_isa, isa, isa_end - isa);
> +               base_isa_end += isa_end - isa;
> +               for (; *isa_end; ++isa_end) {
> +                       switch (*isa_end++) {
> +                       case 'x':
> +                       case 'z':
> +                               parse_break = 1;
> +                               break;
> +                       case 's':
> +                               if (*isa_end != 'u') {
> +                                       parse_break = 1;
> +                                       break;
> +                               }
> +                               /**
> +                                * Workaround for invalid single-letter 's'
> +                                * (QEMU).  Should break for valid ISA string.
> +                                */
> +                               fallthrough;
> +                       default:
> +                               if (unlikely(!islower(isa_end[-1])
> +                                   || base_isa_end == base_isa + sizeof(base_isa))) {
> +                                       parse_break = 2;
> +                                       break;
> +                               }
> +                               switch (isa_end[-1]) {
> +                               case 's':
> +                               case 'u':
> +                                       break;
> +                               default:
> +                                       *base_isa_end++ = isa_end[-1];
> +                               }
> +                               /* Skip version number */
> +                               if (!isdigit(*isa_end))
> +                                       break;
> +                               while (isdigit(*++isa_end))
> +                                       ;
> +                               if (*isa_end != 'p')
> +                                       break;
> +                               if (!isdigit(*++isa_end)) {
> +                                       --isa_end;
> +                                       break;
> +                               }
> +                               while (isdigit(*++isa_end))
> +                                       ;
> +                               break;
> +                       }
> +                       if (*isa_end != '_')
> +                               --isa_end;
> +                       if (parse_break)
> +                               break;
> +               }
> +       }
>
> -       /* Print only the base ISA as it is */
> +       /**
> +        * Print only the base ISA
> +        * (original ISA string as is if an error is encountered)
> +        */
>         seq_puts(f, "isa\t\t: ");
> -       seq_write(f, isa, base_isa_len);
> +       if (parse_break < 2) {
> +               seq_write(f, base_isa, base_isa_end - base_isa);
> +       } else {
> +               isa_end += strlen(isa_end);
> +               seq_write(f, isa, isa_end - isa);
> +       }
>         seq_puts(f, "\n");
>  }
>
> --
> 2.32.0
>


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
