Return-Path: <SRS0=ju53=KW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 830A6C4707F
	for <linux-riscv@archiver.kernel.org>; Thu, 27 May 2021 13:11:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D7BC613AB
	for <linux-riscv@archiver.kernel.org>; Thu, 27 May 2021 13:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D7BC613AB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QDeQITZ+Azu2s6dzxNrwOLV+PjNf0sblMl+Ot9uOd9U=; b=j0kFNC++eYnW/y
	I34U/WIKRF5T5yvLzQyckwajW6Ti/FIgqnQGkXS4qpai1jVqOMkynJS4plswTCi7vU9lpPj0e2G4B
	6jc9XojiwOIfcbhSq/W9jrDSqt544pLA/11Um8ltqD1RLOT8lxTsVO5fVEI2RnBVhE7rrjvbO4bhL
	EJj49DCwzRmVi0zu/VFKC8itHdhNBD6C/1woV7khwCMPMsW5FcNupGD56KFXdkg3jcRKMShstTO1F
	g5AW+QJBdSTUzNn6/pP+0+vkWUh8Y+/5uTa0aYXpkylJgJSwsSKrz+K5ywkOHYDNVs0fD1NKGaYjD
	G26Iev1nZt6UlXFxdRtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmFnJ-00660X-8l; Thu, 27 May 2021 13:11:25 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmFmO-00657S-1P
 for linux-riscv@lists.infradead.org; Thu, 27 May 2021 13:10:32 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so433863wmh.4
 for <linux-riscv@lists.infradead.org>; Thu, 27 May 2021 06:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gi/2uGXRA4m7buLNFSZpdec9y47o451L1U73/6UvsZY=;
 b=PCDthHnPi3LXYTFLY1599mN5MqKFMgRBuToCZo5ghmTEvU81sseNnUDPO6UNz3xYC8
 etYvWimu/RopZdS1H4DoApK0vsKAZAenYSGkbtkuc8+kGbgUq4DtmTXZl+X1ajWc/G6C
 rUTcfFOdwawmVem2sMP0rnsZG1FIwtZhlD24IajckNRazba1b4fGuv5mixab4wSaMfJr
 bYi1L3uHxYALzQIfqtd0Oh7Gj8dLaa8vKfcWDE0I/lOzqd5Tt4Wdu8WIN3UqrEXT8qtK
 zoB2OoM0/qmK3XUKnLzuhO4IO7Av8A9uM0PFX3EqIthvx3HkBkS+CuJ88GTdROKAPMba
 fnYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gi/2uGXRA4m7buLNFSZpdec9y47o451L1U73/6UvsZY=;
 b=JNDQHFQkVD0BHLzxVzrDICokCZLlA8/dVnjHsQiVU7hiSGKuDRYgy1sAkB+t4F1PSy
 z0uryAgZ/2YgYvL0XiYHAVx0TwiIyQE/E6rfBhhbpCWUuhhgZ680ichwrK+0AXEA4Qqg
 2LB0IRpPAkyWacMrV+UrkkARyB/zxUIq8jvApf0JfV5N/aQkFerujvvgQ/geRba+MvIS
 2JzX8zpJaunaLlr4NFJEAig4JnYvewuBm9r6PpBY/aIIjAncRk6L5m5ypD+1M8EcisJX
 KUDs7APDLDrT3dAN3SXJQ9xnYOu/fCzwis/ovymLyFWMqCdmXD1gaXPndySa3pYGrWZD
 fBCw==
X-Gm-Message-State: AOAM533Z9omqmJJVh+R+1TmmwZ7dVaZH8VZGkEBJzpV2sk4r+VJxps6D
 wuAA9OcbNjAFw3sH3cOsugEWK4c7IvqtmAPovAQyqQ==
X-Google-Smtp-Source: ABdhPJz5eBdd7UFK7+oROWcaU3k74JX+hAazXMPbHcp6yyfzuXv2UTg1xDBqSKvgHgdIdwLndn+Hbh1edWnUKW2WqzA=
X-Received: by 2002:a1c:4e0b:: with SMTP id g11mr3373281wmh.3.1622121024584;
 Thu, 27 May 2021 06:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210527072047.2572741-1-hch@lst.de>
In-Reply-To: <20210527072047.2572741-1-hch@lst.de>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 27 May 2021 18:40:12 +0530
Message-ID: <CAAhSdy0GQNmXeOwhhaxPAPNgK+zP=EGzNc3LUPg_BhEaqv6yBg@mail.gmail.com>
Subject: Re: [PATCH] riscv: remove unused SBI helpers and exports
To: Christoph Hellwig <hch@lst.de>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_061028_185709_852614A7 
X-CRM114-Status: GOOD (  30.60  )
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

On Thu, May 27, 2021 at 12:51 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Except for sbi_console_getchar and sbi_console_putchar none of
> the SBI helpers are used in modular code, and many are not used at all
> or only inside of sbi.c.  Remove the dead wood.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/include/asm/sbi.h |  17 ------
>  arch/riscv/kernel/sbi.c      | 103 +----------------------------------
>  2 files changed, 2 insertions(+), 118 deletions(-)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 0d42693cb65e..c051556d5bbc 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -101,9 +101,6 @@ long sbi_get_mvendorid(void);
>  long sbi_get_marchid(void);
>  long sbi_get_mimpid(void);
>  void sbi_set_timer(uint64_t stime_value);
> -void sbi_shutdown(void);
> -void sbi_clear_ipi(void);
> -int sbi_send_ipi(const unsigned long *hart_mask);
>  int sbi_remote_fence_i(const unsigned long *hart_mask);
>  int sbi_remote_sfence_vma(const unsigned long *hart_mask,
>                            unsigned long start,
> @@ -113,20 +110,6 @@ int sbi_remote_sfence_vma_asid(const unsigned long *hart_mask,
>                                 unsigned long start,
>                                 unsigned long size,
>                                 unsigned long asid);
> -int sbi_remote_hfence_gvma(const unsigned long *hart_mask,
> -                          unsigned long start,
> -                          unsigned long size);
> -int sbi_remote_hfence_gvma_vmid(const unsigned long *hart_mask,
> -                               unsigned long start,
> -                               unsigned long size,
> -                               unsigned long vmid);
> -int sbi_remote_hfence_vvma(const unsigned long *hart_mask,
> -                          unsigned long start,
> -                          unsigned long size);
> -int sbi_remote_hfence_vvma_asid(const unsigned long *hart_mask,
> -                               unsigned long start,
> -                               unsigned long size,
> -                               unsigned long asid);
>  int sbi_probe_extension(int ext);
>
>  /* Check if current SBI specification version is 0.1 or not */
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 7402a417f38e..c152c0c43358 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -12,7 +12,6 @@
>
>  /* default SBI version is 0.1 */
>  unsigned long sbi_spec_version __ro_after_init = SBI_SPEC_VERSION_DEFAULT;
> -EXPORT_SYMBOL(sbi_spec_version);
>
>  static void (*__sbi_set_timer)(uint64_t stime) __ro_after_init;
>  static int (*__sbi_send_ipi)(const unsigned long *hart_mask) __ro_after_init;
> @@ -44,7 +43,6 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>
>         return ret;
>  }
> -EXPORT_SYMBOL(sbi_ecall);

This is used by the SBI HSM based CPU Idle driver which is under review.

Atish's SBI PMU based driver also uses sbi_ecall().

>
>  int sbi_err_map_linux_errno(int err)
>  {
> @@ -63,7 +61,6 @@ int sbi_err_map_linux_errno(int err)
>                 return -ENOTSUPP;
>         };
>  }
> -EXPORT_SYMBOL(sbi_err_map_linux_errno);

Even this is used by the SBI HSM based CPU Idle driver and SBI PMU based
PMU driver which are under review.

>
>  #ifdef CONFIG_RISCV_SBI_V01
>  /**
> @@ -98,22 +95,10 @@ EXPORT_SYMBOL(sbi_console_getchar);
>   *
>   * Return: None
>   */
> -void sbi_shutdown(void)
> +static void sbi_shutdown(void)
>  {
>         sbi_ecall(SBI_EXT_0_1_SHUTDOWN, 0, 0, 0, 0, 0, 0, 0);
>  }
> -EXPORT_SYMBOL(sbi_shutdown);

This one is fine.

> -
> -/**
> - * sbi_clear_ipi() - Clear any pending IPIs for the calling hart.
> - *
> - * Return: None
> - */
> -void sbi_clear_ipi(void)
> -{
> -       sbi_ecall(SBI_EXT_0_1_CLEAR_IPI, 0, 0, 0, 0, 0, 0, 0);
> -}
> -EXPORT_SYMBOL(sbi_clear_ipi);

Even this one is fine.

>
>  /**
>   * __sbi_set_timer_v01() - Program the timer for next timer event.
> @@ -364,11 +349,10 @@ void sbi_set_timer(uint64_t stime_value)
>   *
>   * Return: 0 on success, appropriate linux error code otherwise.
>   */
> -int sbi_send_ipi(const unsigned long *hart_mask)
> +static int sbi_send_ipi(const unsigned long *hart_mask)
>  {
>         return __sbi_send_ipi(hart_mask);
>  }
> -EXPORT_SYMBOL(sbi_send_ipi);

This is fine as well.

>
>  /**
>   * sbi_remote_fence_i() - Execute FENCE.I instruction on given remote harts.
> @@ -381,7 +365,6 @@ int sbi_remote_fence_i(const unsigned long *hart_mask)
>         return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_FENCE_I,
>                             hart_mask, 0, 0, 0, 0);
>  }
> -EXPORT_SYMBOL(sbi_remote_fence_i);
>
>  /**
>   * sbi_remote_sfence_vma() - Execute SFENCE.VMA instructions on given remote
> @@ -399,7 +382,6 @@ int sbi_remote_sfence_vma(const unsigned long *hart_mask,
>         return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA,
>                             hart_mask, start, size, 0, 0);
>  }
> -EXPORT_SYMBOL(sbi_remote_sfence_vma);
>
>  /**
>   * sbi_remote_sfence_vma_asid() - Execute SFENCE.VMA instructions on given
> @@ -420,86 +402,6 @@ int sbi_remote_sfence_vma_asid(const unsigned long *hart_mask,
>         return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID,
>                             hart_mask, start, size, asid, 0);
>  }
> -EXPORT_SYMBOL(sbi_remote_sfence_vma_asid);
> -
> -/**
> - * sbi_remote_hfence_gvma() - Execute HFENCE.GVMA instructions on given remote
> - *                        harts for the specified guest physical address range.
> - * @hart_mask: A cpu mask containing all the target harts.
> - * @start: Start of the guest physical address
> - * @size: Total size of the guest physical address range.
> - *
> - * Return: None
> - */
> -int sbi_remote_hfence_gvma(const unsigned long *hart_mask,
> -                          unsigned long start,
> -                          unsigned long size)
> -{
> -       return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA,
> -                           hart_mask, start, size, 0, 0);
> -}
> -EXPORT_SYMBOL_GPL(sbi_remote_hfence_gvma);
> -
> -/**
> - * sbi_remote_hfence_gvma_vmid() - Execute HFENCE.GVMA instructions on given
> - * remote harts for a guest physical address range belonging to a specific VMID.
> - *
> - * @hart_mask: A cpu mask containing all the target harts.
> - * @start: Start of the guest physical address
> - * @size: Total size of the guest physical address range.
> - * @vmid: The value of guest ID (VMID).
> - *
> - * Return: 0 if success, Error otherwise.
> - */
> -int sbi_remote_hfence_gvma_vmid(const unsigned long *hart_mask,
> -                               unsigned long start,
> -                               unsigned long size,
> -                               unsigned long vmid)
> -{
> -       return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID,
> -                           hart_mask, start, size, vmid, 0);
> -}
> -EXPORT_SYMBOL(sbi_remote_hfence_gvma_vmid);
> -
> -/**
> - * sbi_remote_hfence_vvma() - Execute HFENCE.VVMA instructions on given remote
> - *                          harts for the current guest virtual address range.
> - * @hart_mask: A cpu mask containing all the target harts.
> - * @start: Start of the current guest virtual address
> - * @size: Total size of the current guest virtual address range.
> - *
> - * Return: None
> - */
> -int sbi_remote_hfence_vvma(const unsigned long *hart_mask,
> -                          unsigned long start,
> -                          unsigned long size)
> -{
> -       return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA,
> -                           hart_mask, start, size, 0, 0);
> -}
> -EXPORT_SYMBOL(sbi_remote_hfence_vvma);
> -
> -/**
> - * sbi_remote_hfence_vvma_asid() - Execute HFENCE.VVMA instructions on given
> - * remote harts for current guest virtual address range belonging to a specific
> - * ASID.
> - *
> - * @hart_mask: A cpu mask containing all the target harts.
> - * @start: Start of the current guest virtual address
> - * @size: Total size of the current guest virtual address range.
> - * @asid: The value of address space identifier (ASID).
> - *
> - * Return: None
> - */
> -int sbi_remote_hfence_vvma_asid(const unsigned long *hart_mask,
> -                               unsigned long start,
> -                               unsigned long size,
> -                               unsigned long asid)
> -{
> -       return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID,
> -                           hart_mask, start, size, asid, 0);
> -}
> -EXPORT_SYMBOL(sbi_remote_hfence_vvma_asid);

All sbi_remote_hfence_xyz() calls are used by KVM RISC-V module.

>
>  /**
>   * sbi_probe_extension() - Check if an SBI extension ID is supported or not.
> @@ -519,7 +421,6 @@ int sbi_probe_extension(int extid)
>
>         return -ENOTSUPP;
>  }
> -EXPORT_SYMBOL(sbi_probe_extension);

This is used by SBI HSM based cpuidle driver.

This is also used by SBI PMU based PMU driver.

>
>  static long __sbi_base_ecall(int fid)
>  {
> --
> 2.30.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
