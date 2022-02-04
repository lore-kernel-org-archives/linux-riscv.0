Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA6AC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Feb 2022 16:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ElpTIFgJ4Ih5sXPCNKoTBh9tCnJ62B2Ewc5t91J8dBE=; b=ML3ZNbNC5ElMkt
	VnwqSi0By641xptJxMNFAX2zqR+vcXZiBppSUGk7Kt5P75OeX5IPd/bqMxI6vWVAmNMxr36yHFmfG
	DMs0K2zQkU6oE9Oo1COLx9LZLj4WebL+qUaomdAP5QXbj0d5242Nj2XfVERD/oyMo+49BkNqkX5qr
	17XY3i9ZkD2SDJMg70ePt1E2+n3qg+ZXOSP6RqdGFrFQS+SEy6uUMAhW2psoWk1nxon3P70qQtfjV
	Zj5AmDaZqfHRSKUDfc1mP8Ik7B84mwpG+9oBtJubFhiIItSzyzkAo0dC1xwG8+RSpQmOxgv3nNdum
	1dyYBKoq13b9lYN3McnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nG1ti-004xhO-D0; Fri, 04 Feb 2022 16:57:22 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nG1tf-004xgR-NM
 for linux-riscv@lists.infradead.org; Fri, 04 Feb 2022 16:57:21 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so1062328wml.0
 for <linux-riscv@lists.infradead.org>; Fri, 04 Feb 2022 08:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DPPRbmf3r5hnY6ZMBY/ScsB36bryxp+paqrTDwP7FQQ=;
 b=uF3FVGks9Ybuig9KskJ7tvAbqnzOwyQSAsB+53thzphSFRnIc9WB0k+cREu8nTHwY2
 Ma6glKQt6MzRSzCZaosb/6C77kOkhYtNuZ8au4s2GwHWJ2qwqKzBZeV3W0kzfCJWxe3Q
 DoIHavMQJ8mq417K7avpeFqeMEtp4ECiF9HW9iiEKM8xcOGl4Xx0xS+57dKoFo8u+736
 Ex0FqkTWgsKKHzSB1QSTVKWC5ZNvcd6eqcZeIoTmG53WiJkvXOqYUAX8DtxPi40eO4RE
 TA1wChCI0pVvMS0JuNP0Op1bbb7Rw269eQ3hdhVWEwnAgJUmjOjqEZaybgDoDVy54ykz
 t1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DPPRbmf3r5hnY6ZMBY/ScsB36bryxp+paqrTDwP7FQQ=;
 b=mSCuVK2t81LaCn9xM3Gbs+IjCw2hZWfdielh4CuGGoxWc6flAzAziPx2OLCAEm7nGT
 qt/7D8iv3/p/Kwh7d5y082WxFQ7IUAMoS8bk6U9up4NWZXIa47EFHQeQhNWzurFK3M9f
 WeLKBzYF3l6hRWBCMxHjnUrd6hsxfD0HZSBcZCPr2NoYrXV9G/qHwF9qEpHrrVj7G4/Z
 dNePhLaj9RNpSt4zYcfLg5Ubcs/sh24OA931LDAyVmgjbo0hOM5xVI9Up7WWtN1kKJr2
 kKKHrVeG9+ovo22brSVFQOhZgbnmgg1BdmMZBClkU53CgcEo/8zE6I+5MBBasZmJWMmB
 t3jg==
X-Gm-Message-State: AOAM531O6YcRuLdtY3WZX1Xre94SRJUaVITbZW+LIPaGNM5QCmKeK9k3
 va2rjZVrIgNt+xHMSPQvOjs+P88jHlqxmqrHZgDu64W+GTyv8A==
X-Google-Smtp-Source: ABdhPJwUSjcdBYlTM1qMypRMCmNnomNECfYhLnIJFAl4ym++WU0VTUqxEd7awU5JIMRyULwkYrudRjrwnp7tPUgg0hE=
X-Received: by 2002:a05:600c:3392:: with SMTP id
 o18mr2985430wmp.59.1643993836742; 
 Fri, 04 Feb 2022 08:57:16 -0800 (PST)
MIME-Version: 1.0
References: <20220204152347.1469380-1-mchitale@ventanamicro.com>
In-Reply-To: <20220204152347.1469380-1-mchitale@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 4 Feb 2022 22:27:05 +0530
Message-ID: <CAAhSdy3oepnaEijKYGn0cTtNUyH+BnMo0R6U7xN6aRPxt7VQJQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: defconfig: enable hugetlbfs option
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_085719_829338_CFE2E4DD 
X-CRM114-Status: GOOD (  12.02  )
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

On Fri, Feb 4, 2022 at 8:54 PM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> Enabling hugetlbfs in the defconfigs to allow tuning KVM
> guest performance using huge pages.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/configs/defconfig      | 1 +
>  arch/riscv/configs/rv32_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index f120fcc43d0a..7cd10ded7bf8 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -108,6 +108,7 @@ CONFIG_MSDOS_FS=y
>  CONFIG_VFAT_FS=y
>  CONFIG_TMPFS=y
>  CONFIG_TMPFS_POSIX_ACL=y
> +CONFIG_HUGETLBFS=y
>  CONFIG_NFS_FS=y
>  CONFIG_NFS_V4=y
>  CONFIG_NFS_V4_1=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 8b56a7f1eb06..e0e5c7c09ab8 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -100,6 +100,7 @@ CONFIG_MSDOS_FS=y
>  CONFIG_VFAT_FS=y
>  CONFIG_TMPFS=y
>  CONFIG_TMPFS_POSIX_ACL=y
> +CONFIG_HUGETLBFS=y
>  CONFIG_NFS_FS=y
>  CONFIG_NFS_V4=y
>  CONFIG_NFS_V4_1=y
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
