Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4ACC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Mar 2022 03:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ow/dYUU0U1+kY2bulOfq+KOm/W/BfSuEcsna7WhQCZs=; b=dPtBoqRxmZyHeI
	0PF/QzjN/vtHQ9BLzilrYT3j6XVj697IlDk+3OdY85s5GIkTymQfHYJPwHYVTtmrqYc5CgvChe4U2
	F+94DREhpsdyKkUZ6lff2vlpF+rj2P+lrmF1XEeuOGOTZ5Kyaq1EifCz/rQd02x1gT+a5JgK17v6K
	PNj0/I7u6zZ9qgjAHBrCaT6oQvV/OW0Fa/+X8gsqcSRZqGdy6C9MZBtt4CKdLp06y/CUCKB6q+xJw
	Zx0weBeL94cptLYE8Rss25cm4MRHnxZiHoqERqDRyVOGi+Fu7SpQfn8tFlbrluuVasA/SHUNRlUnP
	Od5aj1fuACQxWzrrwEMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTxaw-007bO4-Sg; Tue, 15 Mar 2022 03:11:34 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTxau-007bNB-2z
 for linux-riscv@lists.infradead.org; Tue, 15 Mar 2022 03:11:33 +0000
Received: by mail-wr1-x431.google.com with SMTP id e24so26881944wrc.10
 for <linux-riscv@lists.infradead.org>; Mon, 14 Mar 2022 20:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZMzCXIdLqAyGtaz7rlkDmeg46RvpOTj0ly0PLz7MJt0=;
 b=pSKVP9N5ahguUkJjtp7SxHsAXpLuCZX3IzElc4APDhBQsxOEXiyyWYYhsQMCx1pn3p
 WjBzJiqcjzR4STI2FP9gEUCgiLqx5P6Z+2dW6+ReTpSvYzO85sRWMiyzHpYnciB3gp28
 3CzPGZVh8N4wYM5T1mkRCtBJ36HYMNxpOOGrciPAIUmZiSuMkcmCXjXWCDNIPM5R2sMA
 BBkzJhO7qv6q4i8g5z/YdRKu2eBdLuX5zgnXCyXMJPqlBMXVTkHPqEXXSi06dvJLpFFP
 9dY+nJlGFAuURVBJ9kusniyDn3+pCYLynm+0bOX4HKoDXACeBivq9Ac5b6TmOu1KWqZg
 X82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZMzCXIdLqAyGtaz7rlkDmeg46RvpOTj0ly0PLz7MJt0=;
 b=qmsPjYBqiSbnqOdALTNYSLlZGCYa12sgQuOA2/eAe76L7bzxpmPtnvgH8+u726HlTj
 CGN2Xb1pwrEEr+LvEyEP/7Cx/hA8b3n/N9SXJFSWk+I2uKHQ5uS/KT5jTbb9gBkBXdib
 4awFqkIZX6T25m5DESTYjd56HO6kZuI6nL4TXK6BeK7lqNWauzXewCyCHO2pYrdC93qg
 yg+sPPV4Ooux4wpuZjt1GTcG565m+OZTP4MTAOyo6WAbgc022mM767E2oE/l5XiiOUgg
 +vL8ldRnQ0GnkS39Npz5hf0XxnijNnCI8AfTNpIVgGT2+8FTdpiXZCql94xzLwaoqBor
 XAfw==
X-Gm-Message-State: AOAM533YsxK5mxK0ojYI/gBd9gZmZYTzu8t4hodxG2xOV4M9d7uAUdpI
 3E2u22b0fUv1xiZZ1lejzv0+oE6P/mGXxvqJ3kTQfA==
X-Google-Smtp-Source: ABdhPJzZF6NSEHadRn0WzLtO/L7BqiZdjpJJvaXSM7RzJ7jse3Mp+YFHB8JDzSCI/CLynk6yoB+T9SfDP4fW/wOsDP4=
X-Received: by 2002:adf:b645:0:b0:1e3:bab:7594 with SMTP id
 i5-20020adfb645000000b001e30bab7594mr18998652wre.346.1647313890542; Mon, 14
 Mar 2022 20:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220314203845.832648-1-atishp@rivosinc.com>
 <20220314203845.832648-7-atishp@rivosinc.com>
In-Reply-To: <20220314203845.832648-7-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 15 Mar 2022 08:41:17 +0530
Message-ID: <CAAhSdy1SvpAOX063OyE3iZwfAwND_QVxTNeLsB0hQtJWH4o9tw@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] RISC-V: Improve /proc/cpuinfo output for ISA
 extensions
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
X-CRM114-CacheID: sfid-20220314_201132_156830_F10FC628 
X-CRM114-Status: GOOD (  28.94  )
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
> Currently, the /proc/cpuinfo outputs the entire riscv,isa string which
> is not ideal when we have multiple ISA extensions present in the ISA
> string. Some of them may not be enabled in kernel as well.
> Same goes for the single letter extensions as well which prints the
> entire ISA string. Some of they may not be valid ISA extensions as
> well (e.g 'su')
>
> Parse only the valid & enabled ISA extension and print them.
>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/hwcap.h |  7 ++++
>  arch/riscv/kernel/cpu.c        | 65 ++++++++++++++++++++++++++++++++--
>  2 files changed, 70 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 170bd80da520..691fc9c8099b 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -54,6 +54,13 @@ enum riscv_isa_ext_id {
>         RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
>  };
>
> +struct riscv_isa_ext_data {
> +       /* Name of the extension displayed to userspace via /proc/cpuinfo */
> +       char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];
> +       /* The logical ISA extension ID */
> +       unsigned int isa_ext_id;
> +};
> +
>  unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
>
>  #define riscv_isa_extension_mask(ext) BIT_MASK(RISCV_ISA_EXT_##ext)
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index ad0a7e9f828b..fc115e307ef5 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -6,6 +6,7 @@
>  #include <linux/init.h>
>  #include <linux/seq_file.h>
>  #include <linux/of.h>
> +#include <asm/hwcap.h>
>  #include <asm/smp.h>
>  #include <asm/pgtable.h>
>
> @@ -63,12 +64,72 @@ int riscv_of_parent_hartid(struct device_node *node)
>  }
>
>  #ifdef CONFIG_PROC_FS
> +#define __RISCV_ISA_EXT_DATA(UPROP, EXTID) \
> +       {                                                       \
> +               .uprop = #UPROP,                                \
> +               .isa_ext_id = EXTID,                            \
> +       }
> +/**
> + * Here are the ordering rules of extension naming defined by RISC-V
> + * specification :
> + * 1. All extensions should be separated from other multi-letter extensions
> + *    from other multi-letter extensions by an underscore.
> + * 2. The first letter following the 'Z' conventionally indicates the most
> + *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
> + *    If multiple 'Z' extensions are named, they should be ordered first
> + *    by category, then alphabetically within a category.
> + * 3. Standard supervisor-level extensions (starts with 'S') should be
> + *    listed after standard unprivileged extensions.  If multiple
> + *    supervisor-level extensions are listed, they should be ordered
> + *    alphabetically.
> + * 4. Non-standard extensions (starts with 'X') must be listed after all
> + *    standard extensions. They must be separated from other multi-letter
> + *    extensions by an underscore.
> + */
> +static struct riscv_isa_ext_data isa_ext_arr[] = {
> +       __RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
> +};
> +
> +static void print_isa_ext(struct seq_file *f)
> +{
> +       struct riscv_isa_ext_data *edata;
> +       int i = 0, arr_sz;
> +
> +       arr_sz = ARRAY_SIZE(isa_ext_arr) - 1;
> +
> +       /* No extension support available */
> +       if (arr_sz <= 0)
> +               return;
> +
> +       for (i = 0; i <= arr_sz; i++) {
> +               edata = &isa_ext_arr[i];
> +               if (!__riscv_isa_extension_available(NULL, edata->isa_ext_id))
> +                       continue;
> +               seq_printf(f, "_%s", edata->uprop);
> +       }
> +}
> +
> +/**
> + * These are the only valid base (single letter) ISA extensions as per the spec.
> + * It also specifies the canonical order in which it appears in the spec.
> + * Some of the extension may just be a place holder for now (B, K, P, J).
> + * This should be updated once corresponding extensions are ratified.
> + */
> +static const char base_riscv_exts[13] = "imafdqcbkjpvh";
>
>  static void print_isa(struct seq_file *f, const char *isa)
>  {
> -       /* Print the entire ISA as it is */
> +       int i;
> +
>         seq_puts(f, "isa\t\t: ");
> -       seq_write(f, isa, strlen(isa));
> +       /* Print the rv[64/32] part */
> +       seq_write(f, isa, 4);
> +       for (i = 0; i < sizeof(base_riscv_exts); i++) {
> +               if (__riscv_isa_extension_available(NULL, base_riscv_exts[i] - 'a'))
> +                       /* Print only enabled the base ISA extensions */
> +                       seq_write(f, &base_riscv_exts[i], 1);
> +       }
> +       print_isa_ext(f);
>         seq_puts(f, "\n");
>  }
>
> --
> 2.30.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
