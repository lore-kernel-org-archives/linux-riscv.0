Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2225CC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Mar 2022 03:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UF6055Myfy1L5RnP8tvM2EMeYZvrleYHiuQdvn9ll6M=; b=E1MIS3uApv8tMy
	0Vk9SPe5y2X1UABgH7uIAZgs4OmhsAkr3fi9OgAimD7UDkJ74A4yFkfKDDRNw19blOqRP/R33um2F
	TZ1RN0VrQ/JZLtaQeQ8s/q9CTdE9gPoiCc0ZDM+gm+wDAyBhfuZVL8apvhZO55a1T8LRrvCSj9pst
	HllLJ7oSBrxIhz3F8CEz9rCFD4H+0RpZ482oq+2em7r81C3Z0enp1oTNcEesRiixIj0dkHrtEIXF1
	xaK4fnZ+4PcPdtAAVEd/tR2tNda45pBLrX1K3+acUAi2lYk1RP07WaWj9fKiEQGea0evuU1rDN2aC
	lL12SgJP3qGIqgWaCM9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTxYp-007b4L-Id; Tue, 15 Mar 2022 03:09:23 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTxYm-007b3h-D8
 for linux-riscv@lists.infradead.org; Tue, 15 Mar 2022 03:09:21 +0000
Received: by mail-wr1-x42a.google.com with SMTP id u10so26935235wra.9
 for <linux-riscv@lists.infradead.org>; Mon, 14 Mar 2022 20:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7g0K54nVLUTeFY+Xiq13+Lcl23/G9XSsoGzliKSx0N0=;
 b=aOwohZrc2UJGtL5DFjR0H3NtcWGZNigBz5f79Ll5nvrQr2V7ER7sOTahWSqOlExHv2
 hGCZ4vVGRL3owxOUGUtW/YbNVAx4SczJ9rlvd9iRCI4H98VGda7Q7codlaHwUED9arjx
 POie1YTd5NVz1MloBrFYKSK6zjwgyuOo8d6osOD05OLz8xyhf7jtnm0OjPaE/8WBkYJU
 KKcd8/s7hjOipaepas9lVRBRhhEBmhp/yWIlJ5xStAVa2IE/qzL/N7F6ewELKyu3OQFq
 P1zNzzF1hOxUB7uOGSkXeGMZs7OBhdn9YTX5z4bWLI8AX3S0S2zcLaU+MZoVmbMihvZB
 1sEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7g0K54nVLUTeFY+Xiq13+Lcl23/G9XSsoGzliKSx0N0=;
 b=VG58ZHXnbMdlFiDTVlRU0DjAoEqLrJC5OZr8ktxaarf/obwpRGm+zpauw1vKiE50t0
 8Xt1aW6eo+3ULtfZk3Jnuu248nfcfX8m4FsYSW77Au1Nu3N+6uw4Q3AfGPhemZCj++zZ
 irvQ+g47PkUIcSGjMToUpJRErXsxG/xYdlblpV9tbw11IG/rGERxRVmgE0gAEMVDNhbK
 tMTsBpb+7wmhXVyFDTeJllaEuzjMC7+jyIwmjcZoIBkKhZuXcUFdvhuTOj4WNlRkNjWT
 mRsgitwzR7+s5xYgkcWMQtJTsP6QbV4H0JlWqqIJTP02ukD9Y52/hLn+hYPe5s7p0jOn
 k0Jw==
X-Gm-Message-State: AOAM530naumtaCUiaeH2CGxjQiolJ3xjz7xyG4ajY97qOhEFGo1Re/fV
 YJtyqCQ/dzLzGRrTTBXOE0mUjPnozMxG/qFG4tMn6g==
X-Google-Smtp-Source: ABdhPJxrZ9uUPr/2beAT1DxtmsZj50aZ8qJ86HDlV7xe2tV7yaAy+bjEFVuM/aweUE6mfUpFYYSJVTMTCsNk0kVM/HE=
X-Received: by 2002:adf:b645:0:b0:1e3:bab:7594 with SMTP id
 i5-20020adfb645000000b001e30bab7594mr18994102wre.346.1647313758874; Mon, 14
 Mar 2022 20:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220314203845.832648-1-atishp@rivosinc.com>
 <20220314203845.832648-5-atishp@rivosinc.com>
In-Reply-To: <20220314203845.832648-5-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 15 Mar 2022 08:39:05 +0530
Message-ID: <CAAhSdy2kcFKC2-QTE28dujcBKybo_dxKrc+_+m3s97cr2mvxzg@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] RISC-V: Implement multi-letter ISA extension
 probing framework
To: Atish Patra <atishp@rivosinc.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>, DTML <devicetree@vger.kernel.org>, 
 Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_200920_478548_3D3BF7F2 
X-CRM114-Status: GOOD (  23.53  )
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

On Tue, Mar 15, 2022 at 2:09 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> Multi-letter extensions can be probed using exising
> riscv_isa_extension_available API now. It doesn't support versioning
> right now as there is no use case for it.
> Individual extension specific implementation will be added during
> each extension support.
>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/hwcap.h | 18 ++++++++++++++++++
>  arch/riscv/kernel/cpufeature.c | 22 ++++++++++++++++------
>  2 files changed, 34 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 5ce50468aff1..170bd80da520 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -34,7 +34,25 @@ extern unsigned long elf_hwcap;
>  #define RISCV_ISA_EXT_s                ('s' - 'a')
>  #define RISCV_ISA_EXT_u                ('u' - 'a')
>
> +/*
> + * Increse this to higher value as kernel support more ISA extensions.
> + */
>  #define RISCV_ISA_EXT_MAX      64
> +#define RISCV_ISA_EXT_NAME_LEN_MAX 32
> +
> +/* The base ID for multi-letter ISA extensions */
> +#define RISCV_ISA_EXT_BASE 26
> +
> +/*
> + * This enum represent the logical ID for each multi-letter RISC-V ISA extension.
> + * The logical ID should start from RISCV_ISA_EXT_BASE and must not exceed
> + * RISCV_ISA_EXT_MAX. 0-25 range is reserved for single letter
> + * extensions while all the multi-letter extensions should define the next
> + * available logical extension id.
> + */
> +enum riscv_isa_ext_id {
> +       RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
> +};
>
>  unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index b0df7eff47f7..3455fdfd680e 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -83,7 +83,7 @@ void __init riscv_fill_hwcap(void)
>
>         for_each_of_cpu_node(node) {
>                 unsigned long this_hwcap = 0;
> -               unsigned long this_isa = 0;
> +               DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
>
>                 if (riscv_of_processor_hartid(node) < 0)
>                         continue;
> @@ -100,6 +100,7 @@ void __init riscv_fill_hwcap(void)
>                 if (!strncmp(isa, "rv64", 4))
>                         isa += 4;
>  #endif
> +               bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
>                 for (; *isa; ++isa) {
>                         const char *ext = isa++;
>                         const char *ext_end = isa;
> @@ -172,12 +173,20 @@ void __init riscv_fill_hwcap(void)
>                         if (*isa != '_')
>                                 --isa;
>
> +#define SET_ISA_EXT_MAP(name, bit)                                             \
> +                       do {                                                    \
> +                               if ((ext_end - ext == sizeof(name) - 1) &&      \
> +                                    !memcmp(ext, name, sizeof(name) - 1))      \
> +                                       set_bit(bit, this_isa);                 \
> +                       } while (false)                                         \
> +
>                         if (unlikely(ext_err))
>                                 continue;
>                         if (!ext_long) {
>                                 this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
> -                               this_isa |= (1UL << (*ext - 'a'));
> +                               set_bit(*ext - 'a', this_isa);
>                         }
> +#undef SET_ISA_EXT_MAP
>                 }
>
>                 /*
> @@ -190,10 +199,11 @@ void __init riscv_fill_hwcap(void)
>                 else
>                         elf_hwcap = this_hwcap;
>
> -               if (riscv_isa[0])
> -                       riscv_isa[0] &= this_isa;
> +               if (bitmap_weight(riscv_isa, RISCV_ISA_EXT_MAX))
> +                       bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
>                 else
> -                       riscv_isa[0] = this_isa;
> +                       bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
> +
>         }
>
>         /* We don't support systems with F but without D, so mask those out
> @@ -207,7 +217,7 @@ void __init riscv_fill_hwcap(void)
>         for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
>                 if (riscv_isa[0] & BIT_MASK(i))
>                         print_str[j++] = (char)('a' + i);
> -       pr_info("riscv: ISA extensions %s\n", print_str);
> +       pr_info("riscv: base ISA extensions %s\n", print_str);
>
>         memset(print_str, 0, sizeof(print_str));
>         for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
> --
> 2.30.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
