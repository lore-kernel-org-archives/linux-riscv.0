Return-Path: <SRS0=OIoX=J5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41D8C43460
	for <linux-riscv@archiver.kernel.org>; Sun,  2 May 2021 14:07:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1ED6613D3
	for <linux-riscv@archiver.kernel.org>; Sun,  2 May 2021 14:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1ED6613D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/5hmJ869vSQwfp81FNUODAEepdiQHeAMvhrvIsjvWFc=; b=Kk2UiOx/oX1qG5dq6bWIkb7f+
	O37/dJXou5iMLIh1lFWU4al263xe3EZSzWzO1n3hIMIBhus0eKL3YcGZvGAosQ+PHhSuegXhAD8XD
	YpHU/AkLO0uKcUYTOEqb662CpvKv/3P2HfQVswU+616cUZ6eChZOIZa89d7sQhuZz06dgNdWJ/rm6
	OgJNdE77UQLKXq/F1qjXbWn6688bFEZQ5WENEQGDZEf6QeHI5cTbOv7UAq2yjAFm/fY58iHbvfpN0
	anTuPIZx6j78V/7DJpSlvQhCoJLBw/3JdeNIqiHPuhN++3n2CMcmfxvp4Zr6i6TG9I5NemsOo8N86
	4mgi/Bibg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldCkS-00BtTF-1B; Sun, 02 May 2021 14:07:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldCk3-00BtK3-CT
 for linux-riscv@desiato.infradead.org; Sun, 02 May 2021 14:06:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=jAj5esyjALD7HGj9ix0SKK620afFvLfg0lJ8DH4F7hU=; b=zB10uU5F5WtY5Z7NsGuODS8H2k
 u00UtTnG/s4APmFTcfnctLXI9YEXA1gNEujhHvgSD0t8Yi/TBUJeHXsqTR5w67Mcj+JBYOSatv/4i
 InDnn+STwGj6IECg0tERV4K/KeyAwvY8mTgwRVHfdkM0pUIhi7OdrLxW1Ub5CzYZ3Y7SwNDmMJaLG
 9tBeRuH1Vkmla+NTODKu6mDx71a0CYGYvMnW918nyI9/vMUgHK+bS4Zxw19WzMnWH7Or/C/sekQvn
 OUuEPDdCYx5m7Y7kCthgXYPiSTJCkHa9zTD4ANrCqgtv2stXZdOaaOJ6/LywIT+sc+4aYu3XXqBg1
 /lTzWXyQ==;
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldCk0-002Yf6-2u
 for linux-riscv@lists.infradead.org; Sun, 02 May 2021 14:06:38 +0000
X-Originating-IP: 2.7.49.219
Received: from [192.168.1.100] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C457D20002;
 Sun,  2 May 2021 14:06:29 +0000 (UTC)
Subject: Re: [PATCH] riscv: Consistify
 protect_kernel_linear_mapping_text_rodata() use
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Vitaly Wool <vitaly.wool@konsulko.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <b89a090317cf26bbe1caaa3cfa513a789ece1b19.1619708711.git.geert+renesas@glider.be>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <288c578a-d680-e2e8-33a1-004e11a4f6f0@ghiti.fr>
Date: Sun, 2 May 2021 10:06:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <b89a090317cf26bbe1caaa3cfa513a789ece1b19.1619708711.git.geert+renesas@glider.be>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210502_070636_423715_38A3931E 
X-CRM114-Status: GOOD (  20.50  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Le 4/29/21 =E0 11:10 AM, Geert Uytterhoeven a =E9crit=A0:
> The various uses of protect_kernel_linear_mapping_text_rodata() are
> not consistent:
>    - Its definition depends on "64BIT && !XIP_KERNEL",
>    - Its forward declaration depends on MMU,
>    - Its single caller depends on "STRICT_KERNEL_RWX && 64BIT && MMU &&
>      !XIP_KERNEL".
> =

> Fix this by settling on the dependencies of the caller, which can be
> simplified as STRICT_KERNEL_RWX depends on "MMU && !XIP_KERNEL".
> Provide a dummy definition, as the caller is protected by
> "IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)" instead of "#ifdef
> CONFIG_STRICT_KERNEL_RWX".
> =

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Only tested on K210 (SiPeed MAIX BiT).
> ---
>   arch/riscv/include/asm/set_memory.h | 7 ++++++-
>   arch/riscv/kernel/setup.c           | 2 --
>   arch/riscv/mm/init.c                | 2 +-
>   3 files changed, 7 insertions(+), 4 deletions(-)
> =

> diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm=
/set_memory.h
> index a9c56776fa0e74d6..086f757e8ba3cc69 100644
> --- a/arch/riscv/include/asm/set_memory.h
> +++ b/arch/riscv/include/asm/set_memory.h
> @@ -17,7 +17,6 @@ int set_memory_x(unsigned long addr, int numpages);
>   int set_memory_nx(unsigned long addr, int numpages);
>   int set_memory_rw_nx(unsigned long addr, int numpages);
>   void protect_kernel_text_data(void);
> -void protect_kernel_linear_mapping_text_rodata(void);
>   #else
>   static inline int set_memory_ro(unsigned long addr, int numpages) { ret=
urn 0; }
>   static inline int set_memory_rw(unsigned long addr, int numpages) { ret=
urn 0; }
> @@ -27,6 +26,12 @@ static inline void protect_kernel_text_data(void) {}
>   static inline int set_memory_rw_nx(unsigned long addr, int numpages) { =
return 0; }
>   #endif
>   =

> +#if defined(CONFIG_64BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
> +void protect_kernel_linear_mapping_text_rodata(void);
> +#else
> +static inline void protect_kernel_linear_mapping_text_rodata(void) {}
> +#endif
> +
>   int set_direct_map_invalid_noflush(struct page *page);
>   int set_direct_map_default_noflush(struct page *page);
>   bool kernel_page_present(struct page *page);
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 7b31779101f662e4..03901d3a8b027343 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -293,9 +293,7 @@ void __init setup_arch(char **cmdline_p)
>   =

>   	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
>   		protect_kernel_text_data();
> -#if defined(CONFIG_64BIT) && defined(CONFIG_MMU) && !defined(CONFIG_XIP_=
KERNEL)
>   		protect_kernel_linear_mapping_text_rodata();
> -#endif
>   	}
>   =

>   #ifdef CONFIG_SWIOTLB
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 3ebc0f5d2b73b42b..6cc0421a5d0ef4a3 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -646,7 +646,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>   #endif
>   }
>   =

> -#if defined(CONFIG_64BIT) && !defined(CONFIG_XIP_KERNEL)
> +#if defined(CONFIG_64BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
>   void protect_kernel_linear_mapping_text_rodata(void)
>   {
>   	unsigned long text_start =3D (unsigned long)lm_alias(_start);
> =


I tested this on the following configs:

- rv32_defconfig (build and valid on qemu)
- defconfig (with and without CONFIG_STRICT_KERNEL_RWX) (build and valid =

on qemu)
- xip kernel (build and valid on qemu)
- nommu_k210_defconfig (build only)

so you can add:

Tested-by: Alexandre Ghiti <alex@ghiti.fr>

Thank you for the cleanup!

Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
