Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D21C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 09:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LY3gG2VjDVqdImeHpksIXIkH3Z1j8eFEeVzQTQzM0wI=; b=Mhsha846r/KzIS
	PAUJ20UA6v0DPBDtt31YzGGUwyJ+U+L8RQASyveQCEQ+N1uumoUpaq6Oy37LshHYRoTiPgU5r8lP+
	1qN3H6BsXXVPfSdzornsPOwihZfZhnX0aSXXZ9q+8jh9LQrkMl7nmlYX+ur5Otidj0YWo2oBJkdAz
	QfDb3MIrAggtPkwmWEdDcYFjMjwDV0XgzC836bTBu1vzJdtu/TxAyVIx/lJdziA1q0yQooKMgVvuJ
	N5cULYheSTHc7kz0BPYJ22G5Io8F0RKTVmKRNSI1pyqPh44KzYAjIsc5hda0m1HKSq4RVdAlkvTSR
	wL0RUziZvoWGROELK8WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0ga2-002aoc-Jf; Mon, 13 Jun 2022 09:41:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0gZq-002ak4-Ey; Mon, 13 Jun 2022 09:41:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D0FA36137A;
	Mon, 13 Jun 2022 09:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE3AC3411C;
	Mon, 13 Jun 2022 09:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655113301;
	bh=3puFac3kf4giRZYoO/LUKKimJuAXXCEnp+VaAFnVp0o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EI79bY9mlA9e+vYEx3uUUMNO6sq8+/PDdG2zOjbwdzhpBT5leidQSOyGozcRT3Ghb
	 o5ssxRmDK/wronkeLdXsP/EtgKSNYhpVUDSKuo+aULIi8qsZpvwOQvf4MJXUvkqCRP
	 2KwNLhRCBMaFJW2XwbGPwj7v0j7/aRmSzBjskTIl1fT+5riJV9/6hkIB2hDoidLE8h
	 3tYi0lftDAzhGMOosxrgU8tJZer3KygMzLqjr8gJ5irMmV4lVlj9kDhRX2evUc0fXk
	 LbGk1oFBMga+929A47QJVIYO6FMcnq0H8XwAGKBcYv4mpD8mSp69g9yTmqlumu7DG2
	 oy3cQxwTwh6fw==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-fe15832ce5so7683341fac.8;
        Mon, 13 Jun 2022 02:41:41 -0700 (PDT)
X-Gm-Message-State: AOAM533hocNedCIvmgYxZ7neIqyX20ITnkVQMww/J3vsTXVky8CgcI1j
	EoLg48XFQH1vCCkTiZVaJ56R479oQcRdcRYeG/k=
X-Google-Smtp-Source: ABdhPJzJUE5eQIFQw1wDEuVAU3BsFccZwzLeam8ZSG5GUbrm7+bJ19w2hvDgq/MdVlhPhpH4bgTqWjWDxk7foXjlYlM=
X-Received: by 2002:a05:6871:5c8:b0:f3:3c1c:126f with SMTP id
 v8-20020a05687105c800b000f33c1c126fmr7222252oan.126.1655113289866; Mon, 13
 Jun 2022 02:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220613082147.183145-1-mawupeng1@huawei.com> <20220613082147.183145-3-mawupeng1@huawei.com>
In-Reply-To: <20220613082147.183145-3-mawupeng1@huawei.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 13 Jun 2022 11:41:17 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEWRXKZdLz3C2MofKXgx6yadSOQru979brm3r_sgBdMgw@mail.gmail.com>
Message-ID: <CAMj1kXEWRXKZdLz3C2MofKXgx6yadSOQru979brm3r_sgBdMgw@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] arm64/mirror: arm64 enabling - find mirrored
 memory ranges
To: Wupeng Ma <mawupeng1@huawei.com>
Cc: corbet@lwn.net, will@kernel.org, catalin.marinas@arm.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	dvhart@infradead.org, andy@infradead.org, rppt@kernel.org, 
	akpm@linux-foundation.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, paulmck@kernel.org, keescook@chromium.org, 
	songmuchun@bytedance.com, rdunlap@infradead.org, 
	damien.lemoal@opensource.wdc.com, swboyd@chromium.org, wei.liu@kernel.org, 
	robin.murphy@arm.com, david@redhat.com, anshuman.khandual@arm.com, 
	thunder.leizhen@huawei.com, wangkefeng.wang@huawei.com, gpiccoli@igalia.com, 
	chenhuacai@kernel.org, geert@linux-m68k.org, vijayb@linux.microsoft.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_024142_621477_6BA8E896 
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

On Mon, 13 Jun 2022 at 10:00, Wupeng Ma <mawupeng1@huawei.com> wrote:
>
> From: Ma Wupeng <mawupeng1@huawei.com>
>
> Commit b05b9f5f9dcf ("x86, mirror: x86 enabling - find mirrored memory ranges")
> introduced mirrored memory support for x86 and this could be used on arm64.
>
> Since we only support this feature on arm64, efi_find_mirror() won't be placed
> into efi_init(), which is used by riscv/arm/arm64, it is added in setup_arch()
> to scan the memory map and mark mirrored memory in memblock.
>
> Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
> Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>  arch/arm64/kernel/setup.c                       | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 8090130b544b..e3537646b6f7 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2301,7 +2301,7 @@
>
>         keepinitrd      [HW,ARM]
>
> -       kernelcore=     [KNL,X86,IA-64,PPC]
> +       kernelcore=     [KNL,X86,IA-64,PPC,ARM64]
>                         Format: nn[KMGTPE] | nn% | "mirror"
>                         This parameter specifies the amount of memory usable by
>                         the kernel for non-movable allocations.  The requested
> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> index cf3a759f10d4..6e9acd7ecf0f 100644
> --- a/arch/arm64/kernel/setup.c
> +++ b/arch/arm64/kernel/setup.c
> @@ -328,6 +328,7 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
>
>         xen_early_init();
>         efi_init();
> +       efi_find_mirror();
>
>         if (!efi_enabled(EFI_BOOT) && ((u64)_text % MIN_KIMG_ALIGN) != 0)
>              pr_warn(FW_BUG "Kernel image misaligned at boot, please fix your bootloader!");

As suggested by Kefeng Wang, I think this call needs to be moved into
efi_init() [the generic version]

Please drop this hunk, and add this call to efi_init() in patch #1.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
