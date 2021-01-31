Return-Path: <SRS0=I0e9=HC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36AEFC433E0
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Jan 2021 10:00:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E47264DDC
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Jan 2021 10:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E47264DDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h/HL3Xls+kB72o48gxmiJwluZAA7UmyjUsIBCMAy/uw=; b=BIfeBhTOpmzrqRE5xnsaOuuJK
	ExcJ7s1t/DTXmkgTKkS/5bARWHsOBgHI8+/ihtX2sZqonKjn0ef9oXsZlVhPyhBoxgqzNbgc2r189
	8od8shDHDcLW2drIs22tEtlvSxsKatRh0E+640DfODDO4+ajxHTJPRruJDYyTioaHmXpC09R1iGtM
	BrTme5UwefAi3iAe+I5s0q5W+b9fXP5V3uqR4S04NEI1FXV1RnkjcWJdchcBrztOImHfHqXXa0ojN
	qajdjfM+7sARWTiTq5OWwIz/Vx6lj7YvUHu5iUWcvDypqmEPDiNnPAfUHQBw3rWwStyjV3EEei53T
	ocUhiD3Ew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l69Wv-0002Jp-WE; Sun, 31 Jan 2021 10:00:30 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l69Ws-0002JO-MQ
 for linux-riscv@lists.infradead.org; Sun, 31 Jan 2021 10:00:27 +0000
Received: by mail-qk1-x734.google.com with SMTP id n7so13356632qkc.4
 for <linux-riscv@lists.infradead.org>; Sun, 31 Jan 2021 02:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6XPpC5iWPkqaZeLnJgI3weALZbBUAEPVHmKrFmfIhV4=;
 b=goNRaFYmTaG8BUEpJjI5+D7VkeSS8Vw3WCidmfh7z5F69eEYlCKPWjUYHKSNv4LlXW
 aA2wsdAZdn9Sn2JGUVVGTU1c2msJ9juf4It0P+1DcEF0Mh3MGD3mlp50tKxp3iZ0uL/z
 jmveZhNa4lNCDoakWYshbC2J/EpSiqo70LqMu5Fg6DOLLRcu83ookO0uLUlAasEfSKCm
 +ba3ahzhHF/IqcVnkG+BHkxjKv1fPtUGwLoUr91HM6N2pRJQgfcMHnu5xR0TBFf4uZZj
 7iJTQKy48bkQfOcHJqGeTqA4rosGZkxoKQm4X4cXagGcZaIyK3lS6cptn3beUVZge2Mq
 PLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6XPpC5iWPkqaZeLnJgI3weALZbBUAEPVHmKrFmfIhV4=;
 b=BYoSdKaFrAFm1ONE4ERyV7aA2333VPhLJmdyibRsQ6k3b0MdCwaDUfMrv58hc1rUow
 JpiDvU/JRtvJho14PFCqIhfw4W1eKUxjF+g4eqquWEzQLoy/Hy6RZXYI9CEFSFb5nBLd
 Bh+yJCae9ya0Dj/KsJCHw1tO3j8Cj4IaUjVLLZjX55XoY6hiZmshPwrlxWcREFzY5MU/
 Vjc5kUeyKRcjIc9KX/FoE8/S9uGYg0yRj6Y2T4JBhvhnDNrRaOP+Zls310jFsFu1JrX5
 SxzV1wCtJ3F7phy8Zs6SAMGngL64fhvgKdVQL8H9ceXY9E15ktGAihD5R3vEpGVT327M
 DwqQ==
X-Gm-Message-State: AOAM531+S2R3XgKF10BVKNd/+KwPR7wWD2bzol1y/TGV199B3oiQAltJ
 4qpVColNr7iikoWHdaLsM9nH/Hu+z5EEmB2SRIhrog==
X-Google-Smtp-Source: ABdhPJyph78/rd4/9XFp9fgx0ClwAtxtwK4JgD43nV7zUeghphf7AbgfoQLqOnuLWNHg1FTsBjTrgrmBk1kBkls7FQY=
X-Received: by 2002:a37:2716:: with SMTP id n22mr11570565qkn.265.1612087224408; 
 Sun, 31 Jan 2021 02:00:24 -0800 (PST)
MIME-Version: 1.0
References: <20210129173105.22020-1-alex@ghiti.fr>
In-Reply-To: <20210129173105.22020-1-alex@ghiti.fr>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Sun, 31 Jan 2021 11:00:12 +0100
Message-ID: <CACT4Y+bPy-XpynfRvUbE-wSXnGe_AitusJ=2cANdb-O0ONtgtw@mail.gmail.com>
Subject: Re: [PATCH] riscv: virt_addr_valid must check the address belongs to
 linear mapping
To: Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_050026_803702_1E951E17 
X-CRM114-Status: GOOD (  15.43  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 LKML <linux-kernel@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jan 29, 2021 at 6:31 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> virt_addr_valid macro checks that a virtual address is valid, ie that
> the address belongs to the linear mapping and that the corresponding
>  physical page exists.
>
> Add the missing check that ensures the virtual address belongs to the
> linear mapping, otherwise __virt_to_phys, when compiled with
> CONFIG_DEBUG_VIRTUAL enabled, raises a WARN that is interpreted as a
> kernel bug by syzbot.

Thanks, Alexandre. Much appreciated.

> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  arch/riscv/include/asm/page.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 2d50f76efe48..64a675c5c30a 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -135,7 +135,10 @@ extern phys_addr_t __phys_addr_symbol(unsigned long x);
>
>  #endif /* __ASSEMBLY__ */
>
> -#define virt_addr_valid(vaddr) (pfn_valid(virt_to_pfn(vaddr)))
> +#define virt_addr_valid(vaddr) ({                                              \
> +       unsigned long _addr = (unsigned long)vaddr;                             \
> +       (unsigned long)(_addr) >= PAGE_OFFSET && pfn_valid(virt_to_pfn(_addr)); \
> +})
>
>  #define VM_DATA_DEFAULT_FLAGS  VM_DATA_FLAGS_NON_EXEC
>
> --
> 2.20.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
