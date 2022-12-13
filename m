Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CF9C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 17:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ph2EcjGoAsxl5+ELETAI/wJmYTM0AkTuwFu6RgRrMWc=; b=trM2qjwzH/aqmv
	C9DLJGbhrR+RW8CyunZ9m6grxwupwMJOVkAw8xf581+NmPir08QwSCglOdb9CV/PZ8gnEOujxpohS
	uGd4PiW9Up0EZhf7iFDhO3HMAj2YorLlgcBmC1/hNbEtjA3lBJI/riSEPafTzvpFUVi+bfTcOFMCN
	vuVfybSHQeWN4ORV+QVgx6aHvLwoLwiaX4QMvaSSn6AUj/5KZP5ADxFpA6G3o6ritSCrK2J/UcGsP
	jg+RImPvg0qQYsxvl4jSs7i61wT6XKy2f5pp6iQU/Xd4Cc50MHIPWlaLx6Uz1U635ZMFYKCWtpE/F
	sRvVVTDBkrG/Gfw/ndTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p58s4-003Zgf-2J; Tue, 13 Dec 2022 17:15:12 +0000
Received: from mail-yb1-f181.google.com ([209.85.219.181])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p58s1-003Zcj-9v
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 17:15:10 +0000
Received: by mail-yb1-f181.google.com with SMTP id v71so18432892ybv.6
        for <linux-riscv@lists.infradead.org>; Tue, 13 Dec 2022 09:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7aP+igB0NaircxiSkGrnkdOtF08vfazQfrJeriBa6Dg=;
        b=Z8bGefsxXJUw+uZpbPnH7eSSv+r864GcgnrMbzxCZ30lIu6PbKxLJvGc6QC4uxwLqX
         xa4zT7SzcAHxUujZDetYGeDbpSb+yzOPT2WRr4EvL1FEpHBJIZn/mrcNePW7ylQoJope
         guO8m/nkWacPlECs4zBl90ls35Zdsc1SreJJPAMUw30OqpTzua1fPWEJtnvx1pM8QEKe
         h6I77Ykhupl32gIVuVVyv0dkvrh3+SKKwcGFsf2ybqxZE3vmrJrjzoGVt5uulD3ly9yj
         8OIh6DwrBi/VyR9yXo/09mKvrzzTzu1fwo29MV8/LxmJgAQJGEQynrUdl9pBZYqiZymW
         yiug==
X-Gm-Message-State: ANoB5pkk7OObTH5F+5z2tPE+0zB+sbTPMfpPcqHeksRjnHPilPHTuoOu
	axVfR70583kLcq4w2KNZt5hwZewwxb2Wkw==
X-Google-Smtp-Source: AA0mqf6fDN4icuZ93+PxAoHYHzL2jPeIIdxwTfcn6vanaqehoS2dcUrtIrys+Ul78UEcWju2lUkepA==
X-Received: by 2002:a25:2541:0:b0:703:9426:7803 with SMTP id l62-20020a252541000000b0070394267803mr19541842ybl.7.1670951707684;
        Tue, 13 Dec 2022 09:15:07 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id i19-20020a05620a249300b006fc9fe67e34sm3879240qkn.81.2022.12.13.09.15.06
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 09:15:07 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-3bfd998fa53so201356227b3.5
        for <linux-riscv@lists.infradead.org>; Tue, 13 Dec 2022 09:15:06 -0800 (PST)
X-Received: by 2002:a0d:dd4b:0:b0:370:61f5:b19e with SMTP id
 g72-20020a0ddd4b000000b0037061f5b19emr27207087ywe.316.1670951706562; Tue, 13
 Dec 2022 09:15:06 -0800 (PST)
MIME-Version: 1.0
References: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221212115505.36770-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221212115505.36770-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Dec 2022 18:14:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXeeCoHNt0tSD51HmexQG7qVBnJO+-_pURix7fr678LNQ@mail.gmail.com>
Message-ID: <CAMuHMdXeeCoHNt0tSD51HmexQG7qVBnJO+-_pURix7fr678LNQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] riscv: mm: dma-noncoherent: Pass direction and
 operation to ALT_CMO_OP()
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Samuel Holland <samuel@sholland.org>, Guo Ren <guoren@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jisheng Zhang <jszhang@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Nathan Chancellor <nathan@kernel.org>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_091509_363997_78A7E1F2 
X-CRM114-Status: GOOD (  19.95  )
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

Hi Prabhakar,

On Mon, Dec 12, 2022 at 12:55 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Pass direction and operation to ALT_CMO_OP() macro.
>
> Vendors might want to perform different operations based on the direction
> and callbacks (arch_sync_dma_for_device/arch_sync_dma_for_cpu/
> arch_dma_prep_coherent) so to handle such cases pass the direction and
> operation to ALT_CMO_OP() macro. This is in preparation for adding errata
> for the Andes CPU core.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -124,7 +124,7 @@ asm volatile(ALTERNATIVE(                                           \
>  #define THEAD_flush_A0 ".long 0x0275000b"
>  #define THEAD_SYNC_S   ".long 0x0190000b"
>
> -#define ALT_CMO_OP(_op, _start, _size, _cachesize)                     \
> +#define ALT_CMO_OP(_op, _start, _size, _cachesize, _dir, _ops)         \

Since commit a49ab905a1fc8630 ("RISC-V: Implement arch specific PMEM
APIs") in riscv/for-next, there are two new users of this macro,
which need to be updated to (add two zeroes?).

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
