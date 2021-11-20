Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07272C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Nov 2021 03:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2jzHZZjWQyNxpHrcsfFPXRnRtN5BXI807TfuDXZwuSU=; b=QZL9bHrUHOygmw
	ejm5nlWw2ic64K5FK12Ee2o2bqievMLbwfW4tlk2+yM/lRwS3I19PMaRUEuqA00K1UxxFIeh8O1Gc
	g1wj3153YZVF5sU/IvFiUM0AycTBm9xp+Iz/vRJFYzcyRnTJzQLANqgcGQrPyZ0/EDu2kqcY1nLl1
	KnB2zjmRP+RELuBEIMhiaWfVCb4MTfEVc8mSsibHIsI6kkuI/PIvfKryDIkOlwM1U7PY8jCuk4t7f
	fHKXO5ecGylEhojbZdv3qp7IDHcbAv1gq7iHZ9AAdGjLZwHMfSGcv9Xs9l+HHKyUA8c340+QrM5YK
	fphofTxZR34HiI6AdIQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moHWu-00Bzya-8k; Sat, 20 Nov 2021 03:59:08 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moHWk-00BzvN-Lg
 for linux-riscv@lists.infradead.org; Sat, 20 Nov 2021 03:58:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so8963170wmd.1
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 19:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DZYiApMduuSUSVo0a5ZI0oTWJ8xtKLdFelQTyemXbbQ=;
 b=5c6GORhf+WRLkc/gfr4y8e7I7nMGDHfnIYlS2jTIE8hbYuu7+jRGuXTpGHtjDS4aii
 O4vjrKpTO9e8YaO3rR/ezslgjA3pEoTswecPQOWSi4fMFVmREEon8nJJrJt31EqGAfZz
 SGZfMzbvui2C+03yudQ3ZhRqoi7C+9PqAFC2Asu6OrN7UYdyoBEncqC8iZ4qaCS836sm
 WBfWk5nDr0jUvCano/3mlwxu7fOksfi2aNi7lbql+r4xcVFBipz6yDWQLj3LSSrgcfH0
 C35zlAApYcaWCKS4xBN9bCpVyAJl0T9ZrV5eMhNXAq8adL5jHNhQjSKxYf4v7jiidzqF
 TPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DZYiApMduuSUSVo0a5ZI0oTWJ8xtKLdFelQTyemXbbQ=;
 b=YKL7lIAvWcCoVhab+cIhQl39OpVGOV/pmlr+N+9N1N8tEsh54tHTmRmKIR9P8zsrhn
 /nW95pF99HO/I/G2uO1RzohmKMjbWbcx5Cvmv8zmQodCXkJtGeC0UsJsOPNv91F0n0M6
 JslIeHNLZ+4uj/C28wGMXsmEVVlG2TU/dC33bN8VgZNrxsG49szTJpUbzZc7YkWx2AFf
 slpKYK7pO1EWX5c9FuSDF7HySHXNV6K5maQqTJj9L9i2QqfjuukPLZDr70TwErVIexVQ
 x3/MsxE1Og778O45aCUyZL3EjqSwPW6zT3n+cSzj1R+5sKxgc9fGedKuYbwe99KvLIg2
 v1Zg==
X-Gm-Message-State: AOAM532YDejFZq2z+e4DEZdHF0lIv8mLtpGvFmFaW+RV9bVtohQUz2Zg
 mcW1ouh9KdRL1+w6SB7Rt9pS8kkDIum2GuC/T4zn+g==
X-Google-Smtp-Source: ABdhPJyDN2ljnvSNv27TGYtAXhgwHlWULEDydkRR1sAalj1nRiTC2Oq+RxdD2dlTq1ZgCWiqzJ0zDASWV0+gp++akbQ=
X-Received: by 2002:a1c:20cc:: with SMTP id g195mr6455534wmg.137.1637380737029; 
 Fri, 19 Nov 2021 19:58:57 -0800 (PST)
MIME-Version: 1.0
References: <20211119164413.29052-1-palmer@rivosinc.com>
 <20211119164413.29052-5-palmer@rivosinc.com>
In-Reply-To: <20211119164413.29052-5-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 20 Nov 2021 09:28:45 +0530
Message-ID: <CAAhSdy1Yx0NzqCzyHeGfa_be+w0xZLMotp7n9+nq415_u+v_FA@mail.gmail.com>
Subject: Re: [PATCH 04/12] RISC-V: defconfigs: Sort CONFIG_SYSFS_SYSCALL
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Atish Patra <atish.patra@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>, 
 Damien Le Moal <damien.lemoal@wdc.com>, axboe@kernel.dk, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_195858_747806_6699EC23 
X-CRM114-Status: GOOD (  14.05  )
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
> This should have no functional change, it just sorts
> CONFIG_SYSFS_SYSCALL the same way savedefconfig does.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/configs/defconfig      | 2 +-
>  arch/riscv/configs/rv32_defconfig | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index a6cb99cf4d3c..96c2a3615bcd 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -14,6 +14,7 @@ CONFIG_USER_NS=y
>  CONFIG_CHECKPOINT_RESTORE=y
>  CONFIG_BLK_DEV_INITRD=y
>  CONFIG_EXPERT=y
> +# CONFIG_SYSFS_SYSCALL is not set
>  CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
>  CONFIG_SOC_MICROCHIP_POLARFIRE=y
> @@ -143,5 +144,4 @@ CONFIG_RCU_EQS_DEBUG=y
>  # CONFIG_FTRACE is not set
>  # CONFIG_RUNTIME_TESTING_MENU is not set
>  CONFIG_MEMTEST=y
> -# CONFIG_SYSFS_SYSCALL is not set
>  CONFIG_EFI=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 8a57c940d5ef..1f6808aa1261 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -14,6 +14,7 @@ CONFIG_USER_NS=y
>  CONFIG_CHECKPOINT_RESTORE=y
>  CONFIG_BLK_DEV_INITRD=y
>  CONFIG_EXPERT=y
> +# CONFIG_SYSFS_SYSCALL is not set
>  CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
>  CONFIG_ARCH_RV32I=y
> @@ -133,4 +134,3 @@ CONFIG_RCU_EQS_DEBUG=y
>  # CONFIG_FTRACE is not set
>  # CONFIG_RUNTIME_TESTING_MENU is not set
>  CONFIG_MEMTEST=y
> -# CONFIG_SYSFS_SYSCALL is not set
> --
> 2.32.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
