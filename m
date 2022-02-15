Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6D9C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 10:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AQuIcB05RudobnKT7c/7x0Ufa7ryrfyDIyNATZSvq00=; b=UnLgz9PgY6hUYx
	Ufmri95mwmz38iI9Tf1rSshg66t4K/KmAQ/4nrqndFRTMKekKJv65+HSx+D4BYRH89KjPEZ9Vklo1
	10tqTafA59rZOH+bUXsLoQCyvzVKSfJwH9j5jc0zWq0gb3/Y0UbtLDIO6n5hG5Vyp7Dbd9bilNXfW
	blGKvJfsusotHZt5ok2QKX+P83ZKQpYjHw54RBLLNb+w49GWyd9G2qgWWVdSSTolbXN+0rzfPEFSM
	BLgm8hjuLCZzaocqzZNyseyj+ipGNTdydgw9SW4FCVjo+ClMH55/+RzWLUwXgrMxm7zCD9ZB9io6i
	+eq2GS/B3Xu+nWxqscNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJv0P-002IMR-9s; Tue, 15 Feb 2022 10:24:21 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJv0C-002IHE-CP
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 10:24:09 +0000
Received: by mail-wr1-x42c.google.com with SMTP id w11so31251408wra.4
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 02:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yheAniF0b6YkThnNE53f6BLG90+fIq+Lpxxu/aXM9PQ=;
 b=GLyey6r/f9CmsAcYOpwFsXlueKIOjQtPpUvxSmFinLSUTMJN8YvMxrJ0D9vat3hSpp
 kK5iaUHOP8rUI5Pam3ZQv6YoB45CXbM7o6RWzY1cAmYxgbly5hTZx1W1sL11G6cF+GqN
 PsKBqxxbV9l5oHrBvH1Ykxv9nE/j6p4vrSrFE0oohrT8Df+RSqNrpnKGYd5ibZBGRMWW
 f7IDjZVin7/usCk36NfA4QGpIsI7jUe3TJ3+AWmlEFybvti3+LeOy2ot4acVWCeqchJe
 12ZnWyW6/t6btNNs6rjJglBxkXmHBwfcGybJBBhY36tSg9wLz0xnxuF2Zj4/H370wbO+
 tjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yheAniF0b6YkThnNE53f6BLG90+fIq+Lpxxu/aXM9PQ=;
 b=MWAcpM88Gr2KAXBX8plxxFf8gFN6mL1wQKAWsww05KvNvwcQrMJrij8/ZfSqwas2s/
 LmZWfsmvLHhY5Z9kK38TlgqdsRttvkWMtSpTvk6/N1mwAYpL+Vsqeb5qBahAi5QuXr8+
 zAo95+nKyUlNVnwQ0HzLJYsIya5ahaQNnT/+e/8ylTFYunhPYU12uAgqloJX3TGzJFLL
 P884uXnTvXSdewGYxAqFrMTwOL0Ddc8J7NsPtKIXpmXh4PT2WKIpj93N4/JEngCoqoj6
 SLC+KgUjhMVBOEUoyjQnxb9dojphXCR/S7sZWF1lRxeY3ssXJYZfJPwz5LMUCuEZHAmW
 So5w==
X-Gm-Message-State: AOAM530RWncuYuEZh0Vh9cHcVkJhZKjJMoertXcrboJgpjavN1P1Nem5
 6r/n9bL1TZf+/sSHxTxZWkCH8Hdt51l9eAJBa0tKWw==
X-Google-Smtp-Source: ABdhPJyqchpD0AQQenT8srcc7TOgqmYacME/qw1r4e63mnHDlpWQDpYEVlRB3exN4scEv+KnyIqUsIgMvHibQ8uenyk=
X-Received: by 2002:a5d:4e45:: with SMTP id r5mr2632030wrt.313.1644920646281; 
 Tue, 15 Feb 2022 02:24:06 -0800 (PST)
MIME-Version: 1.0
References: <20220215090211.911366-1-atishp@rivosinc.com>
 <20220215090211.911366-5-atishp@rivosinc.com>
In-Reply-To: <20220215090211.911366-5-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 15 Feb 2022 15:53:54 +0530
Message-ID: <CAAhSdy29nzXFesfeMjY_FkTmTZ4yrHjGxTweBCVn-wFFHnMV=A@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] RISC-V: Implement multi-letter ISA extension
 probing framework
To: Atish Patra <atishp@rivosinc.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 DTML <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_022408_448713_01A4DC43 
X-CRM114-Status: GOOD (  24.54  )
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

On Tue, Feb 15, 2022 at 2:32 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> Multi-letter extensions can be probed using exising
> riscv_isa_extension_available API now. It doesn't support versioning
> right now as there is no use case for it.
> Individual extension specific implementation will be added during
> each extension support.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 18 ++++++++++++++++++
>  arch/riscv/kernel/cpufeature.c | 27 ++++++++++++++++++++++++---
>  2 files changed, 42 insertions(+), 3 deletions(-)
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
> index cd9eb34f8d11..af9a57ad3d4e 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -83,7 +83,7 @@ void __init riscv_fill_hwcap(void)
>
>         for_each_of_cpu_node(node) {
>                 unsigned long this_hwcap = 0;
> -               unsigned long this_isa = 0;
> +               uint64_t this_isa = 0;

Why not use a bitmap here ?

>
>                 if (riscv_of_processor_hartid(node) < 0)
>                         continue;
> @@ -167,12 +167,22 @@ void __init riscv_fill_hwcap(void)
>                         if (*isa != '_')
>                                 --isa;
>
> +#define SET_ISA_EXT_MAP(name, bit)                                             \

Where is this macro used ?

> +                       do {                                                    \
> +                               if ((ext_end - ext == sizeof(name) - 1) &&      \
> +                                    !memcmp(ext, name, sizeof(name) - 1)) {    \
> +                                       this_isa |= (1UL << bit);               \

You can use set_bit() here when using bitmap.

> +                                       pr_info("Found ISA extension %s", name);\
> +                               }                                               \
> +                       } while (false)                                         \
> +
>                         if (unlikely(ext_err))
>                                 continue;
>                         if (!ext_long) {
>                                 this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
>                                 this_isa |= (1UL << (*ext - 'a'));
>                         }
> +#undef SET_ISA_EXT_MAP
>                 }
>
>                 /*
> @@ -185,10 +195,21 @@ void __init riscv_fill_hwcap(void)
>                 else
>                         elf_hwcap = this_hwcap;
>
> -               if (riscv_isa[0])
> +               if (riscv_isa[0]) {

You can use bitmap_weight() here

> +#if IS_ENABLED(CONFIG_32BIT)
> +                       riscv_isa[0] &= this_isa & 0xFFFFFFFF;
> +                       riscv_isa[1] &= this_isa >> 32;
> +#else
>                         riscv_isa[0] &= this_isa;
> -               else
> +#endif
> +               } else {
> +#if IS_ENABLED(CONFIG_32BIT)
> +                       riscv_isa[0] = this_isa & 0xFFFFFFFF;
> +                       riscv_isa[1] = this_isa >> 32;
> +#else
>                         riscv_isa[0] = this_isa;
> +#endif
> +               }
>         }
>
>         /* We don't support systems with F but without D, so mask those out
> --
> 2.30.2
>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
