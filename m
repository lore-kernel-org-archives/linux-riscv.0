Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E96AC3601E
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 14:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uYz2f+6ObJ4QK+P5MrPxIiq9pOHbJBy/vha1mdxl9Gs=; b=nwWE2JWX3XIClO
	YilYp5208i6IA/9njjUPGL1NU3tgbAcadRPKYYTVMstAbfv44ezPqdbugHiQEo42hhuRugVCXD8+Z
	87EyiwAZkuYnXRkTym8BcNQg3Me99GuQsvO1mZWzfE4EVYgIdtRE5tiA6yTBFj23rDeUBSabw1G5e
	dbQh3xkf9mCklpYJ9eRA7i36UI53Yuxqq3cUOzHB6X5Jehij95A9VX/L2nW1MJAc0StnvVv0EG/XT
	FS9lId82jXJAhRkEwold9iv56dSTitTArpZ9klRbSJbBWeXNZijIdVOdFM94eIjwpRdsIt1q7Ppad
	mb2tCtNthApObVXzLscA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sk6-0000000AotQ-093p;
	Thu, 10 Apr 2025 14:18:58 +0000
Received: from mail-ed1-f50.google.com ([209.85.208.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sk2-0000000Aos8-3Ovd
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 14:18:56 +0000
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5cd420781so1852057a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Apr 2025 07:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744294728; x=1744899528;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GdSoTiFrBKyNtxOX3muUasy2YSOI6Sn7jCp2NmeOuXM=;
        b=TmSp6/oVBNswiW7TFACOV3SpwgStwIHnIh7kEQG1hUKw3x2ZOn2+S+Tch2vm4Bk7Ei
         ekTUezwZsIthWVtMByIFHpFY+SsigHEN3g4lGv35A4zuY/yzC/hBF1s1Oid89tOJ4XI1
         dwq6fJcqM6e0OhXJ5cJyjxxuI1G4F4B+/QY2VAUncNwJvkze2YoqxF8NkDNswQS3goIp
         txfo0aa8fXGQ8jdYaHhwmfN9sXyMC/YFDhvHyX8+mdqsNzrBt9TECrBs6iAg2fA3XoDu
         IfGMNft6/ta7xQW8qsUX+sqj97VECYalkw1jcZQj3DRnO7MQQkt/VRkll54zmLpCK799
         qDsA==
X-Gm-Message-State: AOJu0Yxyaw+fKJWzJS329724A+DHrnGy5CFBgdDifeZrW9uccwn+5NUM
	DGbK8HQI/eNAWwEV57UtlJk7ddVj1wqFng/H8vDojk4FIAHal2u5DnjBRmAdPMc=
X-Gm-Gg: ASbGncteHVQP+xjW/0wnQwpj0Kl9Pa9uXtBqyRFJ9XuPN5cZSVJ7nDCwMcgsMEOt9Or
	RA6PKdo/h0M+gB2evvYr3cmhQhvXINtbW3MfT4zC9czptipRoR8bxxNqdNVeoybs1HtbdeWYvfM
	9hUy6ptjkbdBFd9BckbJcfqr2MRQ8xCocVug4eJ2c0mg+1c7kfBKgm+3l8dPD0yK4herPgxlK6J
	A0YTpVXFKzPUgbHHAGO3dTy8UJ2QgAWo4ICcYME+lGm5kgMcrItKhuQkNB2iYFn8fznCgwqi/tv
	ZqptlsIrHGCV4xWAwDddLEF0rxBIF2HuNJxWGdpSeHJqIplmOwrLnUGpfGLncR6Y3RW8/erWJZO
	PB2caRI4KtV6akA==
X-Google-Smtp-Source: AGHT+IHaesHc5SqS3WOVZAj2JBQQ3lKy6nZzgAi4Hc6EhXPiNP2jVq9DL79uYtQ6Op1HkqZ79N+7Mg==
X-Received: by 2002:a17:906:1e4d:b0:aca:c687:6ca2 with SMTP id a640c23a62f3a-acac687730emr86600066b.26.1744294728166;
        Thu, 10 Apr 2025 07:18:48 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce7322sm277561666b.164.2025.04.10.07.18.44
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 07:18:45 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac73723b2d5so175291366b.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Apr 2025 07:18:44 -0700 (PDT)
X-Received: by 2002:a17:907:7f0d:b0:ac7:3323:cfdc with SMTP id
 a640c23a62f3a-acabd123a89mr274752666b.10.1744294724513; Thu, 10 Apr 2025
 07:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250409153650.84433-2-ajones@ventanamicro.com>
In-Reply-To: <20250409153650.84433-2-ajones@ventanamicro.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 16:18:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVjxWais7O32zO-aX3tzVKA=aWUfttADn9OD+dxFp7HoA@mail.gmail.com>
X-Gm-Features: ATxdqUF2BhrEGJtMhKie_nWpHtZyJHSNFLWdzfe8DuYkkq82db_rzyPZQc5ZMYc
Message-ID: <CAMuHMdVjxWais7O32zO-aX3tzVKA=aWUfttADn9OD+dxFp7HoA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix unaligned access info messages
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, cleger@rivosinc.com, 
	alexghiti@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_071854_851439_58A4F0D9 
X-CRM114-Status: GOOD (  17.31  )
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

Hi Andrew,

On Wed, 9 Apr 2025 at 17:36, Andrew Jones <ajones@ventanamicro.com> wrote:
> Ensure we only print messages about command line parameters when
> the parameters are actually in use. Also complain about the use
> of the vector parameter when vector support isn't available.
>
> Fixes: aecb09e091dc ("riscv: Add parameter for skipping access speed tests")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/all/CAMuHMdVEp2_ho51gkpLLJG2HimqZ1gZ0fa=JA4uNNZjFFqaPMg@mail.gmail.com/
> Closes: https://lore.kernel.org/all/CAMuHMdWVMP0MYCLFq+b7H_uz-2omdFiDDUZq0t_gw0L9rrJtkQ@mail.gmail.com/
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Thanks, this gets rid of the bogus messages!

Impact on SiPEED MAiX BiT:

    -scalar unaligned access speed set to '(null)' by command line
    -vector unaligned access speed set to 'unsupported' by command line

BeagleV Beta Starlight:

    -vector unaligned access speed set to 'unsupported' by command line

Renesas RZ/Five:

    -vector unaligned access speed set to 'unsupported' by command line

MPFS Icicle:

    -vector unaligned access speed set to 'unsupported' by command line

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
