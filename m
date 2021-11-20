Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901B1C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Nov 2021 04:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q50AhyZOd2ojf3ewFt4zuM1TD1MkELPL84cF5ETaq0k=; b=40LOI8ZXcjwCtp
	jQQvFw2b4TewlkjSiVUlrYzfOrD1/3zb2cRxrAOYBTsC72ly3CWyTNtzlRvnaVxGcL1US2KbbzqGc
	vIshIOTz6SW7AlzuhMuzR5ZWhrJV21gwB1iWPzgThBy/EL4NCR7m+G5YYiCqbbUQygtb+wJAqn5Ri
	0hTjV/LOrAQnsaRiWK+gE8ty+uLmHOqZxddHBBNlZxiMsuG0+5jFlJ1E1IyBMFOQy6NM2p2Hh3bBe
	weDKht0v+AOx0pJGk/bdHaI6Bz3I665PKXhy2WTUWIhE8nloopnrnCpm0A5kUvjzQVb90QpLU2pYn
	xN7/gSbDjCEH3WliNsAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moHfa-00C1Vs-Co; Sat, 20 Nov 2021 04:08:06 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moHfX-00C1VJ-Dg
 for linux-riscv@lists.infradead.org; Sat, 20 Nov 2021 04:08:04 +0000
Received: by mail-wr1-x436.google.com with SMTP id s13so21533293wrb.3
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 20:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G4ydXLmENcWqIX+Tlurw+hnOBKkomj9PPrQ5ZVgaUww=;
 b=zGxiXe93hdqAChtKAjR6w68ZB/NJH2v2WqscZef8UWGzXCwDcaid8rvU39O4RycozU
 PT3kpjB+NJL1C/cCbfMvnIqv/4GLo85TUu4eWjyPPoWTbGeaXBlYmOcHkzYLv5h3qT/A
 n4/qhNMzs1x+MGohfF0TyyuRJdfkT3aZ+C74fORUxJLRGzu4quCDM0nnzefTl6A2ub2W
 V1yDBYlT6FakvZleNo5ztgrIRS6yZHO1wMV3P989NT/Q7oP0mpDS/QvUnDXfjQAEUGgP
 C9vTS12S6GngnMY4dJl9ws1TchUveIYbjsxkKkGDgHa6CFhGJUiOnZZQwr5X1vIp7d3c
 wUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G4ydXLmENcWqIX+Tlurw+hnOBKkomj9PPrQ5ZVgaUww=;
 b=OqqXO6q3W/KIJaX5v0ZFKqvtXqucmMkjcOzwW9MsrBfwVBK04SlKGS+oKnMX+Es9tK
 lxNvC0rUmZYtHCNFg711W0iz5nZnA+l3bJkCNRqJyzWJleLVYXwt0075fpoL3YcWoE52
 lvQ3jlJp/kSkVj8N/NZSeZqF+C9plhWk3xbcyW5BfdmeKZorZQp0jna5X+HM0JpWRg+W
 gRu4omoOrMaqXgHp2UEGgLZsgAJMTULJN4Cvrqah5T3veb1r24AMdw6yebnJDNyEhYGW
 /y403L0heJHNeZvWUoBf/yqVQJ4ce8hbtbwRdtw/F2LHlS6i/MAcZXkbO6w8r8x3JI1I
 nEpw==
X-Gm-Message-State: AOAM532tzV/iOEgZx3pMR34z54Ke9NmWyg65Qup7uU3kCahoFxs78RFE
 6pdAqIoplkjGWzyjMR0OrcyKIwYS90I+/WVwWjsY9w==
X-Google-Smtp-Source: ABdhPJwRiFtmtNChRRr+VVtCV80D8ZI1iEww8eLto+FUM2ylA1gIZdXZWWpnjBnLpz4b7NtJL1nKHnZYigdsm+rGlnc=
X-Received: by 2002:a5d:4846:: with SMTP id n6mr13686700wrs.249.1637381281578; 
 Fri, 19 Nov 2021 20:08:01 -0800 (PST)
MIME-Version: 1.0
References: <20211119164413.29052-1-palmer@rivosinc.com>
 <20211119164413.29052-13-palmer@rivosinc.com>
In-Reply-To: <20211119164413.29052-13-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 20 Nov 2021 09:37:50 +0530
Message-ID: <CAAhSdy0-KDtUM7Oot=FBdRtRbYGk8D1jxkH0XZ1iw237jnXUKA@mail.gmail.com>
Subject: Re: [PATCH 12/12] RISC-V: defconfigs: Remove redundant K210 DT source
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, axboe@kernel.dk, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_200803_483779_4CE5E889 
X-CRM114-Status: GOOD (  12.67  )
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

On Fri, Nov 19, 2021 at 10:15 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> The "k210_generic" DT has been the default in Kconfig since 7d96729a9e7
> ("riscv: Update Canaan Kendryte K210 device tree"), so drop it from the
> defconfigs to avoid diff with savedefconfig.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/configs/nommu_k210_defconfig        | 1 -
>  arch/riscv/configs/nommu_k210_sdcard_defconfig | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
> index 89ab76349ea8..e8ceab678e8b 100644
> --- a/arch/riscv/configs/nommu_k210_defconfig
> +++ b/arch/riscv/configs/nommu_k210_defconfig
> @@ -29,7 +29,6 @@ CONFIG_EMBEDDED=y
>  CONFIG_SLOB=y
>  # CONFIG_MMU is not set
>  CONFIG_SOC_CANAAN=y
> -CONFIG_SOC_CANAAN_K210_DTB_SOURCE="k210_generic"
>  CONFIG_MAXPHYSMEM_2GB=y
>  CONFIG_SMP=y
>  CONFIG_NR_CPUS=2
> diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> index 84b87f8bfc8f..46aa3879f19c 100644
> --- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
> +++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> @@ -21,7 +21,6 @@ CONFIG_EMBEDDED=y
>  CONFIG_SLOB=y
>  # CONFIG_MMU is not set
>  CONFIG_SOC_CANAAN=y
> -CONFIG_SOC_CANAAN_K210_DTB_SOURCE="k210_generic"
>  CONFIG_MAXPHYSMEM_2GB=y
>  CONFIG_SMP=y
>  CONFIG_NR_CPUS=2
> --
> 2.32.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
