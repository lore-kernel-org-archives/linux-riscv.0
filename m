Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BD5C25B0C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 15:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=j4I0QiRSBl4AC+An9N7rIU80lzQvbPBTvuS7sgR6X+4=; b=mzehREeklPZCj91UpJqqXAAQXL
	721HzSZ5nmL+pcoGjj21rJgp1JwTL3+f7qizrnVpC5y/47ULvmwBuEm4RS0HudimOrMdmhH7dmSE0
	K/VP+jT0IOGp8iGMne012l89C3lRNgSf1SzYMQTr+KAXUGa4lt38bLYU//h9ug8qtYzYiChqYQWuY
	MGhD1otNXHmMSqBAxsrJwnRjUVyprBDqRh66HcX3Iu/dQVRtl0s9fK6sQ7BFXW/fO4xZzuB90Z1jn
	Nftzcz3OOKMN1H028Df5kzH4hUVvDkmIGIPCdwG+uvZAdmU1prSwEMXqjOJUhvxzygiiyzxLtxZZe
	bEozpTxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMAND-00EBbl-Nu; Thu, 11 Aug 2022 15:45:27 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMAN8-00EBVd-AA
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 15:45:26 +0000
Received: by mail-pj1-x102c.google.com with SMTP id gj1so18069708pjb.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 08:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=IqdpAm+3ZI27zm3WrWt4kogz8HX3uySUVAkMSid/X6U=;
        b=1G0z6VKeHyOv+DmFlwNaDXpbESavfOAPdJ0y7qxpkZ8KGb1ELkE4Oi3sNw5j1vlVrv
         YsT/Jvnr4Qx4zxafupJ6e465wLqyqB94XpJdUo1RMy0UAaoWJ2m9rEns8gIXEddP+y/G
         1Lcw6OCuCuxqK9qvhxVrW914AGArcswAUhTHLJZ7gA/zEismEh7/w4AKVuAwf0eAzk5j
         bAbiWFDAIE7pU3pwRWZqCGEl9PkgLvUfdi/HBFADY5zuJ8T8djjykzn2LsYLXKNoJKjt
         ZKfPAOFCPCMSlKygsEwhK8NAgqV+i6VGFHBBNq3eAyEi2+/p6PBbELjvq6J9dh4q4dxY
         IJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=IqdpAm+3ZI27zm3WrWt4kogz8HX3uySUVAkMSid/X6U=;
        b=Z02rYSAeuwNxkjUT7jBS8as+kRi3fGSE9u9X8N48ntGpfs1YVhOnkSgKRg716peBVb
         iK9EFQKCZABRvO2HJNIihkeKdrYgpTZOuLKY0PT+ewufV+uC427VdG0QR2BknXmtK/8P
         +HFhvPc6gTrztHUKBWQQ6SO0pjWn1tKSCYY0DFI7mrWeZu2mTERxuPgYnuwOUVoPRqPP
         HrxtDlt8FkD1PWbDDsdhcKCVnqiBEF1tQPqk5pok924Jze7H/PivKqoQ0JLTxdLh9nnr
         UXN9fGaklSR3PrxUyVZFc7raMms3E5M9kAbimWVMaHwKLJtIxMImsMZt/RlEBImr/NWL
         9f4g==
X-Gm-Message-State: ACgBeo0BMm1ELv85Ns4mtISir/oWgqzxRdyicZO9vXR1EjPlHbFBIjGL
	CobdtyCie9lbXCFtkC+bxeTtA/HaweN64A==
X-Google-Smtp-Source: AA6agR4aa6Jphe0Y0Hlh91VQt7xwxcn4/ibQAux03E/k/HY8C9mVj0pgJLt4eegG06tTQiRHNA5sfg==
X-Received: by 2002:a17:903:31cb:b0:16f:3d1:f5b with SMTP id v11-20020a17090331cb00b0016f03d10f5bmr33577264ple.148.1660232719614;
        Thu, 11 Aug 2022 08:45:19 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id n129-20020a622787000000b0052dcbd87ae8sm4216988pfn.25.2022.08.11.08.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 08:45:19 -0700 (PDT)
Date: Thu, 11 Aug 2022 08:45:19 -0700 (PDT)
X-Google-Original-Date: Thu, 11 Aug 2022 08:39:47 PDT (-0700)
Subject: Re: [PATCH] riscv: traps_misaligned: do not duplicate stringify
In-Reply-To: <20220623112905.253157-1-krzysztof.kozlowski@linaro.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: krzysztof.kozlowski@linaro.org
Message-ID: <mhng-1a6d1fe9-4b73-4088-bd89-015486990666@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_084522_404672_20A53ED8 
X-CRM114-Status: GOOD (  14.24  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 23 Jun 2022 04:29:05 PDT (-0700), krzysztof.kozlowski@linaro.org wrote:
> Use existing stringify macro from the kernel headers.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
>  #define DECLARE_UNPRIVILEGED_LOAD_FUNCTION(type, insn)			\
>  static inline type load_##type(const type *addr)			\
>  {									\
> @@ -207,9 +205,9 @@ static inline ulong get_insn(ulong mepc)
>  	asm ("and %[tmp], %[addr], 2\n"
>  		"bnez %[tmp], 1f\n"
>  #if defined(CONFIG_64BIT)
> -		STR(LWU) " %[insn], (%[addr])\n"
> +		__stringify(LWU) " %[insn], (%[addr])\n"
>  #else
> -		STR(LW) " %[insn], (%[addr])\n"
> +		__stringify(LW) " %[insn], (%[addr])\n"
>  #endif
>  		"and %[tmp], %[insn], %[rvc_mask]\n"
>  		"beq %[tmp], %[rvc_mask], 2f\n"

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
