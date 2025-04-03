Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD42C3600C
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Apr 2025 15:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wv6ESp2Re5Bqt5/3JJRef4G3vQYTOkGjeIaICiuFqDY=; b=gz4J5pKksDC2vV
	4YAkl+BwZtvXWkC6v1sVP6sREKvLTtbEsSYjAV6cy9m878jXU41oh8akhtJwN64gMpVAIwicvmeYQ
	T576lf/rB8CdZQxhvE3npuAHELKNi5fTJQkltH52W1YE6Jhe6Vvd5pY1xXTCuw3L4kvWxRA0fac1P
	tt9aVW1lJFqze6hnJrSfGi5lrWITFU9Y7GoWe86oqkh02L0zWyMThLovXcpzY6yaeEuQC4II7rVpU
	UXq721D7FOaXBY7AfF4tL4mQeSFSfLOKdWBPda+xckzTiKTIVKX7VQEwNgTYiG2D8KnHQXH3M+zX6
	+Om+X1dE/dyGJ/6+/V8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ME6-00000009BdD-1SQC;
	Thu, 03 Apr 2025 15:11:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ME3-00000009BcW-1Qa7
	for linux-riscv@lists.infradead.org;
	Thu, 03 Apr 2025 15:11:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B6092A43826
	for <linux-riscv@lists.infradead.org>; Thu,  3 Apr 2025 15:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B11CC4CEE5
	for <linux-riscv@lists.infradead.org>; Thu,  3 Apr 2025 15:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743693086;
	bh=NIvLpPfAXrTuXtMOMB/pagZd8SPTLCI7I/aXMEmuZks=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rg+elceHnlADL1mNP5zqvH3MnNX1SQTBq0g1DCEixGhxkvzyh0bOPFJCkL0ALZKyt
	 +VCgmEkvQMtKdswZTk0K56LU+TDECxM85B1covP7XNz/If7qqhoT5TvDrn7HLoN9pz
	 Rl9qHuAxeZTqau7PVURw/Zhr6jlYiMbZFHuIQSXA7XwEXkvzOzZN8Bs4mvEwYi1P9h
	 JCZmfN1+807U9Eh1iCW6I1FgfnputbMkqPL5r4VEmr2pLWoLP5E32HPSY3oWk8JCW7
	 k/ven923jDB2Khmp8j0mO9NxvC06cxe1YwAFAJ+x7vwn3GtSsLLGjIG3Wr999oHAce
	 Bzw+vV9ZBS2qg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5499c5d9691so1191796e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 03 Apr 2025 08:11:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAVsrgI0dnwUcEQlwJr4nC1H/fSITRfoU8yKTAaTTIShbC4IJwk+VDGHuj9ky0Cb87PjGSyhW8sjcVPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0CRCHkIRrdOcdyXY8SIlV1JKlmthGVvY2N/l3VNqoDHJa8iDQ
	TfNcf5S2dw3hADH0tozbPZ5SrgXZZamrA5/PcE0wHuMv5ItXbKfTpe0kuBqDT9UvZNjpgbeDTPN
	urvOYKIi4MRoNMR+ZeaFHHv+77iM=
X-Google-Smtp-Source: AGHT+IGHaE5sR5WjLPaAAsOgHiAcSbArxim9/nuGpNofJcAx2t/1OKmIKbXzElP29VwvJc0LcNAX9hLMl1nwdhodQks=
X-Received: by 2002:a05:6512:3b13:b0:549:5b54:2c5b with SMTP id
 2adb3069b0e04-54c1d8a6e03mr1065423e87.24.1743693084626; Thu, 03 Apr 2025
 08:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250403134200.385077-1-alexghiti@rivosinc.com>
In-Reply-To: <20250403134200.385077-1-alexghiti@rivosinc.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 3 Apr 2025 18:11:13 +0300
X-Gmail-Original-Message-ID: <CAMj1kXGzrn6i20LvUBnz_mGi946=GCogNHHUL=mNsv513qYv7A@mail.gmail.com>
X-Gm-Features: AQ5f1JoKfhV3MERR1uNecpsdZk0_Zd-PQo949ieFdRrYe-B6KsP3bxkK_BwZ46w
Message-ID: <CAMj1kXGzrn6i20LvUBnz_mGi946=GCogNHHUL=mNsv513qYv7A@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: Do not strip .rela.dyn section
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_081127_504769_D3A21D54 
X-CRM114-Status: GOOD (  20.46  )
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

On Thu, 3 Apr 2025 at 16:42, Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> riscv uses the .rela.dyn section to relocate the kernel at runtime but
> that section is stripped from vmlinux. That prevents kexec to
> successfully load vmlinux since it does not contain the relocations info
> needed.
>

Maybe explain that .rela.dyn contains runtime relocations, which are
only emitted if they are actually needed - as opposed to the static
relocations that are not emitted as SHF_ALLOC sections, and are not
considered to be part of the runtime image in the first place. It
would be nice if we could use --remove-relocations= here, which only
removes static relocations, but unfortunately, llvm-objcopy does not
support this.

Also, I wonder if this should apply to all of .rel.dyn, .rela.dyn and
.relr.dyn, as they all carry runtime relocations.

Finally, I'd be curious to know why RISC-V relies on --emit-relocs in
the first place? Is the relocs check really needed? If not, it would
be a nice opportunity to get rid of Makefile.postlink entirely.

In any case, for this change, or a variation along the lines of what I
wrote above,

Acked-by: Ard Biesheuvel <ardb@kernel.org>


> Fixes: 71d815bf5dfd ("kbuild: Strip runtime const RELA sections correctly")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  scripts/Makefile.lib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index cad20f0e66ee..0a1f1e67a0ed 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -377,7 +377,7 @@ quiet_cmd_objcopy = OBJCOPY $@
>  cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
>
>  quiet_cmd_strip_relocs = RSTRIP  $@
> -cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $@
> +cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' --remove-section=!.rela.dyn $@
>
>  # Gzip
>  # ---------------------------------------------------------------------------
> --
> 2.39.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
