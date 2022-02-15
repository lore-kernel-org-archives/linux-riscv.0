Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1586EC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 10:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5lWED9sVb+tyqj76JYRdB6BMzF2T5f1l3K5N7t2h6iA=; b=T8CFls3XO9v6kO
	yoKhxgOji7YkR7BGP/HMZBOVKbkQKRUum5YNDsDzHHSKhXZrpysrHHYwvEbu6RqCoZBe7+QvpdkrT
	vOr9IEmkmYiAUQp2D7ZSWjdU790Ujv+QzWHGAOdMZhb7qN7nwfLT9txjgMZIB1wlVIAgeUlpDExWu
	QuN+xHmKtnL401pPvJFCh1+vliHkCs50V/f3V2E2d1O6o7HFUiE9yTXzs0sNe6b/G7aGnaREhUd7D
	adSOixVO+MUDWTqRR6l0Zv2NXjaQPptXbROpQOv+c0KVQWSDtJbvp4O/LKsd3Om6zigm5atZaG3ij
	I9E4WuKXaCNtfeKtJuqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJuqf-002GlX-UN; Tue, 15 Feb 2022 10:14:17 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJuqc-002Gke-Qs
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 10:14:16 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 j9-20020a05600c190900b0037bff8a24ebso1085369wmq.4
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 02:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oSCtsd3fzrUKJIHAZet+tjs87CCWa1yDtr7CzSuhxDE=;
 b=4P9S1itgLjR+WLtU0yKgH6geqBsZAQDIyLWXmwIAemApD0tzz70VbQnpUarv4j9Skc
 Dd9sRJdtdSAWdwvA71LxPJxQR0ld/p4WNxBuHz4G6jmUYcNlmvH6jwGje4S198KK3zRB
 sru5PO7Itxq4Auwd+uKtL6prn5yneWmZPzRmAMR9cJIlUYOCF91rZ98QvsLjEYt8qFpJ
 jsOjg7urvQVsmjYMM/r0zGx+9xLexJoxSx30wzY/y9sNbL8SbMZVFZ+AizWCQ6VKKibE
 SuPFd9Od2yUmIlBUyeVKrggPDxCvz1rbI4F1dvZPCK2XUqLYRInf+I1K8hJwbgPf5+6a
 bPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oSCtsd3fzrUKJIHAZet+tjs87CCWa1yDtr7CzSuhxDE=;
 b=Sz8RwF6YNDNSgEwEyWRDjFHuT2QywMBJnbiw/AorTSjZJ0rE2oS86WaRHwYDUTovd5
 7negKJHaVBfCfzOUUtQpJU1y4wNTTkLjhJLrlcMJYnWqfJb6TmKitEopFbT6Hs87DTZE
 vcfbu4UuGgyrBPosJ0tdF67B7vWLNqTTDEe4kkyS6U1aGy+RVbEuzP3k51GVZca+dxdh
 qBAn4S/Hg4j5FdzPf+Lp5brcyu/XXG6gjNv+0MewXNOmpcaGOjnFBfdw9y3DLQLOaGJo
 S3lGAOH4eTDSVl9fv3pTtURQF0PtVN9t88LI+MlBX+uPgm+x5RXdS06s+kiTF53AuYxh
 ZaNw==
X-Gm-Message-State: AOAM532ML9oya7BjRKNDfJ1KMqzd3y/VUIZu3K/N6rRV109recw6o607
 qSeJVWyahLWQ6KxPzwl2MgbhI2jdr6X5tXz/hCXjuA==
X-Google-Smtp-Source: ABdhPJwNWDxqimLiGPW3n0xj1IdnK8izeD/YPdGs8aF5FxCduWcL5ipg17QyPI0oH+gExeSy9a0tK6vxUt/OTD/sfCI=
X-Received: by 2002:a1c:750f:: with SMTP id o15mr2399030wmc.137.1644920052860; 
 Tue, 15 Feb 2022 02:14:12 -0800 (PST)
MIME-Version: 1.0
References: <20220215090211.911366-1-atishp@rivosinc.com>
 <20220215090211.911366-4-atishp@rivosinc.com>
In-Reply-To: <20220215090211.911366-4-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 15 Feb 2022 15:44:00 +0530
Message-ID: <CAAhSdy3ved0OWUEeYUvjpjs=UrtPyFj3O+2Xcc2sUNBsm=AsMQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] RISC-V: Extract multi-letter extension names from
 "riscv, isa"
To: Atish Patra <atishp@rivosinc.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Tsukasa OI <research_trasio@irq.a4lg.com>, 
 Heiko Stuebner <heiko@sntech.de>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 DTML <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_021414_906929_AD930EA7 
X-CRM114-Status: GOOD (  22.43  )
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
> From: Tsukasa OI <research_trasio@irq.a4lg.com>
>
> Currently, there is no usage for version numbers in extensions as
> any ratified non base ISA extension will always at v1.0.
>
> Extract the extension names in place for future parsing.
>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> [Improved commit text and comments]
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/kernel/cpufeature.c | 38 ++++++++++++++++++++++++++--------
>  1 file changed, 29 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 9d5448542226..cd9eb34f8d11 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -119,9 +119,28 @@ void __init riscv_fill_hwcap(void)
>                                 ext_long = true;
>                                 /* Multi-letter extension must be delimited */
>                                 for (; *isa && *isa != '_'; ++isa)
> -                                       if (!islower(*isa) && !isdigit(*isa))
> +                                       if (unlikely(!islower(*isa)
> +                                                    && !isdigit(*isa)))
>                                                 ext_err = true;
> -                               /* ... but must be ignored. */
> +                               /* Parse backwards */
> +                               ext_end = isa;
> +                               if (unlikely(ext_err))
> +                                       break;
> +                               if (!isdigit(ext_end[-1]))
> +                                       break;
> +                               /* Skip the minor version */
> +                               while (isdigit(*--ext_end))
> +                                       ;
> +                               if (ext_end[0] != 'p'
> +                                   || !isdigit(ext_end[-1])) {
> +                                       /* Advance it to offset the pre-decrement */
> +                                       ++ext_end;
> +                                       break;
> +                               }
> +                               /* Skip the major version */
> +                               while (isdigit(*--ext_end))
> +                                       ;
> +                               ++ext_end;
>                                 break;
>                         default:
>                                 if (unlikely(!islower(*ext))) {
> @@ -131,6 +150,7 @@ void __init riscv_fill_hwcap(void)
>                                 /* Find next extension */
>                                 if (!isdigit(*isa))
>                                         break;
> +                               /* Skip the minor version */

This comment should be moved to PATCH2

>                                 while (isdigit(*++isa))
>                                         ;
>                                 if (*isa != 'p')
> @@ -139,20 +159,20 @@ void __init riscv_fill_hwcap(void)
>                                         --isa;
>                                         break;
>                                 }
> +                               /* Skip the major version */

Same applies to this comment as well.

>                                 while (isdigit(*++isa))
>                                         ;
>                                 break;
>                         }
>                         if (*isa != '_')
>                                 --isa;
> -                       /*
> -                        * TODO: Full version-aware handling including
> -                        * multi-letter extensions will be added in-future.
> -                        */
> -                       if (ext_err || ext_long)
> +
> +                       if (unlikely(ext_err))
>                                 continue;
> -                       this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
> -                       this_isa |= (1UL << (*ext - 'a'));
> +                       if (!ext_long) {
> +                               this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
> +                               this_isa |= (1UL << (*ext - 'a'));
> +                       }
>                 }
>
>                 /*
> --
> 2.30.2
>

Otherwise it looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
