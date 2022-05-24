Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0780AC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 24 May 2022 11:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OE+cNC8IeTiiOcNIZzUCz4faRKZjbR74jRjzcbHDJ6M=; b=hSCY6FSIP8VE3t
	wID3ZFUXRrJgC4AaZeSuKMk9Q6x1gnblIatHphQmCtbiMajHcwqz/I1A0eCqdxPPY2HdbaF6z23Qu
	fKFqx89E2w/X/NGx1mZfq+gC5Ptga9PDxIVK6I+vkUWUlZPAQHDNWiyMxIIMH6ZPc5tEMnD51OvwJ
	qHtH7ylllcaP5GHv9vgwZm5di+rOZcT1mYIDvWfBXhnYBQFAI5wCpfxM1qxDMtuQ37d16M1nhHR9L
	h0uDPAHdPit3h13FfqxfJzedIdvnvyBdjHvCYfNuMV6dLzfjCsxVM2FryhCt/FQ2cGnAe0rlBwMb9
	xvKTSfJhTwGYX5cdyzqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntSeR-007nOv-V8; Tue, 24 May 2022 11:24:35 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntSeO-007nLC-Bz
 for linux-riscv@lists.infradead.org; Tue, 24 May 2022 11:24:33 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 c9-20020a7bc009000000b0039750ec5774so1182120wmb.5
 for <linux-riscv@lists.infradead.org>; Tue, 24 May 2022 04:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yfCYl4aV74lIhtPwwS5Hj7a7JLAdHT5HtAXAEPKuxxw=;
 b=SkEJCBhdLlFzmsU79CLKeBLhUBGc21SllCmNz5BJw0D+GbWUAg3Zor9zFl//oWG9OQ
 1KqWUyp7inB2ZpNmoLokYAd8tGeJKSoR6AekxiFG2LEQatcPdWNKdIJWK29PLSmaZsB5
 JxL1fWSOpTzkKylyxE3ZuvMWFMEstvhrZYDbUuNk/rZ5Zx4zngCqCIbqcQ6YH/vuBi20
 VIks0/oZF9dqUp065iC0043Ymy+cQlQwBdgRz00WN4dOlxYm0cxnVAM5rVfDclmsh21e
 3fWOrYqDrjvFiqnovynEsyG8xRnUrUKu6yIGDITpsgMjPaUn6Cg+Ts3d7vsLJrCJ2tZH
 tHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yfCYl4aV74lIhtPwwS5Hj7a7JLAdHT5HtAXAEPKuxxw=;
 b=rpoKN2Gyw4jmrlLQQJMmkydohtmWIPypi4p57i0MsFTlILG+5zPZy/0E2efnSB+D78
 DPMcqTqojnku4L+ujG02raAblwYBqx65A5YNQTPVg4I5Wnow56vK5gORaRSELNQ3TFqy
 W2MMoNFFyP5VjIynCTohTHjsLHTFk+q8PzEUQ7k6IGTGVNf589QZmTxWxqQxSJr1Lwlx
 xWa8tts6uyLXo8V0jtdf6RAKwEljQiFn3c+YEZGifdURrLlf4SbcLt3fUj0Sn1+LBurV
 xJ6WyVRZ+jpzbtEjc6635UXHr6EQzY1zV69s39ev3h/4rrTaW+QkG4gN2Kir0sNTSBB7
 sR9g==
X-Gm-Message-State: AOAM530QoZao5l1rfClDluKo4dm0GMJA2VKuXpC1JpgZWxSkHTG95K3u
 6DNIPHOpIACvHaZgDUCCr6SUW1Q5OPaSHeaGirJIYg==
X-Google-Smtp-Source: ABdhPJw17mFO2a4bDkcxbKfi5pHfVkge6/luoUZPssTZkTO6b1Ep89/x1yZbqkfqlaxo1Z8MUx6f2F8ncymnnSC1FM0=
X-Received: by 2002:a05:600c:5112:b0:397:53f5:e15b with SMTP id
 o18-20020a05600c511200b0039753f5e15bmr3292625wms.93.1653391468187; Tue, 24
 May 2022 04:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220426185245.281182-1-atishp@rivosinc.com>
 <20220426185245.281182-2-atishp@rivosinc.com>
In-Reply-To: <20220426185245.281182-2-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 24 May 2022 16:54:16 +0530
Message-ID: <CAAhSdy2Xco9wZrQ8tFfFNkNxkOcDksvi3EySdVNFtKGxVyceYQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] RISC-V: Add SSTC extension CSR details
To: Atish Patra <atishp@rivosinc.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@atishpatra.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>, DTML <devicetree@vger.kernel.org>, 
 Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 KVM General <kvm@vger.kernel.org>, 
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_042432_432649_ACDCC75A 
X-CRM114-Status: GOOD (  13.74  )
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

On Wed, Apr 27, 2022 at 12:23 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> This patch just introduces the required CSR fields related to the
> SSTC extension.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/csr.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index e935f27b10fd..10f4e1c36908 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -227,6 +227,9 @@
>  #define CSR_SIP                        0x144
>  #define CSR_SATP               0x180
>
> +#define CSR_STIMECMP           0x14D
> +#define CSR_STIMECMPH          0x15D
> +
>  #define CSR_VSSTATUS           0x200
>  #define CSR_VSIE               0x204
>  #define CSR_VSTVEC             0x205
> @@ -236,6 +239,8 @@
>  #define CSR_VSTVAL             0x243
>  #define CSR_VSIP               0x244
>  #define CSR_VSATP              0x280
> +#define CSR_VSTIMECMP          0x24D
> +#define CSR_VSTIMECMPH         0x25D
>
>  #define CSR_HSTATUS            0x600
>  #define CSR_HEDELEG            0x602
> @@ -251,6 +256,8 @@
>  #define CSR_HTINST             0x64a
>  #define CSR_HGATP              0x680
>  #define CSR_HGEIP              0xe12
> +#define CSR_HENVCFG            0x60A
> +#define CSR_HENVCFGH           0x61A
>
>  #define CSR_MSTATUS            0x300
>  #define CSR_MISA               0x301
> @@ -312,6 +319,10 @@
>  #define IE_TIE         (_AC(0x1, UL) << RV_IRQ_TIMER)
>  #define IE_EIE         (_AC(0x1, UL) << RV_IRQ_EXT)
>
> +/* ENVCFG related bits */
> +#define HENVCFG_STCE   63
> +#define HENVCFGH_STCE  31
> +
>  #ifndef __ASSEMBLY__
>
>  #define csr_swap(csr, val)                                     \
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
