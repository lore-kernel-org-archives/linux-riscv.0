Return-Path: <SRS0=I7Ft=LG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABCFCC48BE5
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 04:43:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6953561073
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 04:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6953561073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ad8tEQ0LqR5kJ/uUnW2s5LzLX+sib+eEEhEws+gchAA=; b=yGBbLENFMzgeOw
	SXI+x1jNAb3Ejf9ufNXX+KzSuUHHlRHs6idaLhBdXiNXzMXmmu54g7JmOIUF7GujV52UyyjEEkA9R
	OO4Pmfz1hWFoz71EnyDfN8u72tA5SPxQewKNRnNnpVOQXBuTWL9EAoQEtQ7gMc22s8cLb8aQPs4ts
	O37xBgcccSyHpDCaag9JkPDJ2kN9uMru4owEhHb5TOM0wkEV4DDYKpcyilpOZfX9b7/CArfBgC7dK
	HWt2IC7Iinq3NtFHEPjc+lEKMN8SDKbPmcliYC1gnto6HAM1Z+Fq/9giWglMn7qVACi442BJ2fBks
	Alcv510L3zy+nahGLdtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrvTl-007pHr-PC; Sat, 12 Jun 2021 04:42:41 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrvTi-007pHK-LT
 for linux-riscv@lists.infradead.org; Sat, 12 Jun 2021 04:42:40 +0000
Received: by mail-wr1-x42f.google.com with SMTP id c9so8061815wrt.5
 for <linux-riscv@lists.infradead.org>; Fri, 11 Jun 2021 21:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DkaEs5OoDbQVi5eWL76O0urBiumXEDrqwDT+nb75JPs=;
 b=lesx5X2EuoJQiu/wKMrxbfJEJQAUQ8l3Ut3kqbYeRNdAuzgf884npk+8H6F0NRrNYD
 itOveEVo6B+eROFErPspJrWleFoJDTFeu5z2YMnlIGzatz4IN5Uj/xkKrbtLHDWLgQ+A
 raG6jeLdt+g4eNZUGxGE48SGlSQlr6uwhkfXqM4vbQP1SCoWFyTtnfEAEJ7pXvoaaVYY
 MBAbjl9i0tw659eSxDXl0OfHT7otqxnK1fX5fbqPs1BI7BeB+mTaLZ7Vorz1uL09ikBr
 bAhJN/kCeI/oHxLBQscmWSkwojbgREtmOHhZFw+bhm8BStoRAxFfwrbVVUQhjM0crxUb
 PBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DkaEs5OoDbQVi5eWL76O0urBiumXEDrqwDT+nb75JPs=;
 b=sKBEIX5knPK35StMSkarocA7PWaB+PCylKs3wVjfs56ZC7aZlLPQg9CVEJpa0T0wzM
 AEyJZe7UvPvAgeUqSCUE4QBX0Pd5TgF61qN3+gRxaDp6XbggC10BBoqXGNgrjJCeOMZC
 bisqpSzjz4AkvrrexbXU1VRSJL1QrT2e61S4Wj3ZO1Q3rZ50leftSMHz9DbaZpmDQp55
 //mGiOI3x8XqjFYk9w0yiVRBuxrLs8bnzEhAkrqBYha+UFMa9QvTwnn7RT6nvy0rruHo
 IgZ5MPw48jODmX6x5MAznNrvN+07czDStABV+ja1K8BRgODURGVsZvo2Yvlz0daL+8w8
 RCRQ==
X-Gm-Message-State: AOAM533OVRq2SFbG9r/7jQRdURQiGhXE6e0879LRICsLEyFiM7n7odm3
 tVEHLvUfE0gotYLeTAJZTxYIoAR4sT99wA0BqnUmfQ==
X-Google-Smtp-Source: ABdhPJz6MgYW8qegCjYiMAcvP1BdzEERmLrzyeX2egYw73NO+adeef4vNNmPs8kyOBbt8qvNYC4CR2cqQzs5nGMsvu4=
X-Received: by 2002:adf:efc3:: with SMTP id i3mr7189395wrp.356.1623472955642; 
 Fri, 11 Jun 2021 21:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210612034042.3043112-1-palmer@dabbelt.com>
In-Reply-To: <20210612034042.3043112-1-palmer@dabbelt.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 12 Jun 2021 10:12:24 +0530
Message-ID: <CAAhSdy2oYbSa_c4cqaHcXKiMagOK9NB4F8stBM=cwi6hfAAHBA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Use asm-generic for {in,out}{bwlq}
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <Atish.Patra@wdc.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kernel-team@android.com, Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_214239_563965_793F8435 
X-CRM114-Status: GOOD (  14.05  )
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

On Sat, Jun 12, 2021 at 9:25 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> From: Palmer Dabbelt <palmerdabbelt@google.com>
>
> The asm-generic implementation is functionally identical to the RISC-V
> version.
>
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>

Indeed, these are same as asm-generic.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/io.h | 13 -------------
>  1 file changed, 13 deletions(-)
>
> diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
> index c025a746a148..69605a474270 100644
> --- a/arch/riscv/include/asm/io.h
> +++ b/arch/riscv/include/asm/io.h
> @@ -52,19 +52,6 @@
>  #define __io_pbw()     __asm__ __volatile__ ("fence iow,o" : : : "memory");
>  #define __io_paw()     __asm__ __volatile__ ("fence o,io"  : : : "memory");
>
> -#define inb(c)         ({ u8  __v; __io_pbr(); __v = readb_cpu((void*)(PCI_IOBASE + (c))); __io_par(__v); __v; })
> -#define inw(c)         ({ u16 __v; __io_pbr(); __v = readw_cpu((void*)(PCI_IOBASE + (c))); __io_par(__v); __v; })
> -#define inl(c)         ({ u32 __v; __io_pbr(); __v = readl_cpu((void*)(PCI_IOBASE + (c))); __io_par(__v); __v; })
> -
> -#define outb(v,c)      ({ __io_pbw(); writeb_cpu((v),(void*)(PCI_IOBASE + (c))); __io_paw(); })
> -#define outw(v,c)      ({ __io_pbw(); writew_cpu((v),(void*)(PCI_IOBASE + (c))); __io_paw(); })
> -#define outl(v,c)      ({ __io_pbw(); writel_cpu((v),(void*)(PCI_IOBASE + (c))); __io_paw(); })
> -
> -#ifdef CONFIG_64BIT
> -#define inq(c)         ({ u64 __v; __io_pbr(); __v = readq_cpu((void*)(c)); __io_par(__v); __v; })
> -#define outq(v,c)      ({ __io_pbw(); writeq_cpu((v),(void*)(c)); __io_paw(); })
> -#endif
> -
>  /*
>   * Accesses from a single hart to a single I/O address must be ordered.  This
>   * allows us to use the raw read macros, but we still need to fence before and
> --
> 2.32.0.272.g935e593368-goog
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
