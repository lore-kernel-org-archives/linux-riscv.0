Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887ABC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jun 2022 13:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EjVdxZq24ljx9P3LenPDkp6xUuLxfm3q7ySMOvXa54w=; b=wDoPZ8FkZlxDoz
	F6Hur8vn2m1jzH5pgHuyd5R4p09d66gPpDPHtUhhyQz+YF8fSPh1E2uiBZwscQNCASSRHWZDT5elI
	NG0b05VIqcKCf5WOCdwxNRUC/TQyAntV0S83LC+7LwYJFzbag+/Oz2eI20zVbcPuUzFUr6a4wyPCo
	PNXs/ZiEZ+C5ge9qaoRQwhT8nPqm7DPiHkCJefpq5PhJX80gl1zUrRQe5iPl0+Kj/iBtIVbqp16O5
	PByKqOeQhv27g2llhUaRvgi7DKepF/P9oXOEW/kjKf12qlUh+rTfmCYQSIrHEnWTJpXwN8JG4NcTb
	1WUEZGat5+LqjZrSC1OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4McS-00FHPY-C6; Thu, 23 Jun 2022 13:11:36 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4McN-00FHN0-Ca
	for linux-riscv@lists.infradead.org; Thu, 23 Jun 2022 13:11:35 +0000
Received: by mail-wm1-x332.google.com with SMTP id z9so10999606wmf.3
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 06:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JF3KFGuU5d1nPOiqYMvyN5E84aUzwajF94ekFp44h3w=;
        b=LBM2kqEtnMXJotGt8/OvyPuEtGx1Lesxgls/2wFhLs9qSftGQ766tmIXd3WtwmiAmJ
         bQrPEbNbQZlDk8k5THkJ5JiD9r+CUc/co1hveaXpvT3hW/fP8g+dZfjW8FdtvzE0cCvW
         05IVbMQGu7Y5AvjL3f5J6255yMHT5RNJ6uym2VtetnFXj+Uk1k5QidCWSDIDaU6bgHip
         c4wN1OLm7R9uBf4TL+T3pOkDJA/e1GKHRnUdG25r/1DuGPdE9PR1VmlVsiS8e+dJDPsH
         VFw1wZYF+EAvKWjfhE9/8H7Q8GyRWbUxpCPp0YLXcgGrs/epk+o7o95YiFYR7b9H2czt
         P3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JF3KFGuU5d1nPOiqYMvyN5E84aUzwajF94ekFp44h3w=;
        b=D/0Q7IAFT5DsA+e51RmhM6qjspkWyTyg5IZLaQa+YxdCSopgXm5chU+eyAiAuApNw0
         blBFkIKYcAyz90SN0MBbtwXN1QjfaAflaXW+u5Y9JISLcXdH1oOwuoASaTYrZJ6cGRzc
         k0D1p4EVup3LKlUgELhUqjc5i7ZGIaf5K7ZZiiMYmq3L84iXgv2czqSu7IiNRaoNIK/a
         6k0kP8jYyxCI5XT6DOa7SrPoYgxoI1l05AAJpvSOxwqmVjevdTxwpf4sMdvd+ngDZDr0
         JpLJWlpTHDGeeOTNOODnbMMzepmbHHew3IgU/EQ/ODjMljcEn3pBW57rMVJV+o2QUiqw
         23Rw==
X-Gm-Message-State: AJIora+vY2ZbF6zRUPrgCFbeBB54EEiQvzKqleTCaAHkkQmH4h9LYVUH
	JxwtCKDXB3qLuZcw/GUOpbhcC2JyYaA2EVqReBy66A==
X-Google-Smtp-Source: AGRyM1s8jERg0p36PqyphiAkwtRLgjreNmeqmAHlkeVHNpYZOMl7w1X/p6JVFgAnddSW/XKcAhKGiNVel50D01z461A=
X-Received: by 2002:a05:600c:4fd4:b0:3a0:334e:241e with SMTP id
 o20-20020a05600c4fd400b003a0334e241emr2072446wmq.73.1655989887621; Thu, 23
 Jun 2022 06:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220623112905.253157-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220623112905.253157-1-krzysztof.kozlowski@linaro.org>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 23 Jun 2022 18:41:15 +0530
Message-ID: <CAAhSdy35972j=qpqQWak1Ot1nZb0iiURzYqhrbZ1bfuuAdpw_w@mail.gmail.com>
Subject: Re: [PATCH] riscv: traps_misaligned: do not duplicate stringify
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_061131_687339_FB107645 
X-CRM114-Status: GOOD (  12.75  )
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

On Thu, Jun 23, 2022 at 4:59 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Use existing stringify macro from the kernel headers.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kernel/traps_misaligned.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index 46c4dafe3ba0..378f5b151443 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -7,6 +7,7 @@
>  #include <linux/mm.h>
>  #include <linux/module.h>
>  #include <linux/irq.h>
> +#include <linux/stringify.h>
>
>  #include <asm/processor.h>
>  #include <asm/ptrace.h>
> @@ -150,9 +151,6 @@
>  #define PRECISION_S 0
>  #define PRECISION_D 1
>
> -#define STR(x) XSTR(x)
> -#define XSTR(x) #x
> -
>  #define DECLARE_UNPRIVILEGED_LOAD_FUNCTION(type, insn)                 \
>  static inline type load_##type(const type *addr)                       \
>  {                                                                      \
> @@ -207,9 +205,9 @@ static inline ulong get_insn(ulong mepc)
>         asm ("and %[tmp], %[addr], 2\n"
>                 "bnez %[tmp], 1f\n"
>  #if defined(CONFIG_64BIT)
> -               STR(LWU) " %[insn], (%[addr])\n"
> +               __stringify(LWU) " %[insn], (%[addr])\n"
>  #else
> -               STR(LW) " %[insn], (%[addr])\n"
> +               __stringify(LW) " %[insn], (%[addr])\n"
>  #endif
>                 "and %[tmp], %[insn], %[rvc_mask]\n"
>                 "beq %[tmp], %[rvc_mask], 2f\n"
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
