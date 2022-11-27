Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E934C4321E
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Nov 2022 12:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SjN9OsEkNQ1Lkx3VqNraZcPKxN0QnSit5/yc+2RXsdI=; b=ElWqwgy1czJDD3
	VEtUnqdMhBpx+JQqpmJANjSOVeuhyET2TkdWXJM4+hsOGPXJPxrpTdBQYIOXE2SCMqP4P6EuQ2E9W
	jR4oRBCJ6inUg7DufeIatti/Gs3EUUOEWD8YWm9z65N6Lw/H22ZiWAHn8m8tEQ5WXfWr89iGs5AMh
	g/n4aJJ0WFNZFKRTqm4xF46QgMrIFlWac8+LyRXubnOgXLcEkfHxVPwZIAMT6eNO1ZrASopHjFeGt
	J5mjpxOM++zbPibndmogudLcBxCeGLKI9rKZp3UYVD8eFqpcksiC/AGK8YvVKA8uxhNEfOCAuYgdE
	3azpMLRYcdKnVinfjinQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozGuc-00BFj8-KK; Sun, 27 Nov 2022 12:37:34 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozGuZ-00BFhB-QI
	for linux-riscv@lists.infradead.org; Sun, 27 Nov 2022 12:37:33 +0000
Received: by mail-ej1-x632.google.com with SMTP id vp12so18494943ejc.8
        for <linux-riscv@lists.infradead.org>; Sun, 27 Nov 2022 04:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4/jGKMCRGMK21dJ1aCsortAFYXlCDfIKm1QYzbvgS2c=;
        b=NXW07i+fE98DmbrjPPH7Em35P9hSzgrdqGIspcOhXrHkH45LeFM4Ma9uzZyAwqM4nf
         kyHZcHVZQ1ODY5HvfgpH4tf0q9xmXaYsadXiJ2GiCNZJc6afvbPIBI2MpVA3erqHSLHh
         avQgmwPVPhy4KbRq8MyOqZgeDlD0go2IT9WzVsg6H0KLZvi28SmzjLXYSgGXQc56bPxf
         QbY9ctnOfmjk+u3nn0U62MaQYdOCmmXRjY8Ry+Wt6D7WJgvoS+AnDPIUF72yvcNaWI9v
         4rMQrMMoaClwCzyhv/QQ/ZRUTma6IYKY06rC0CLInBNvwAxwASr84tfas+Z+J1NvjEQZ
         PCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/jGKMCRGMK21dJ1aCsortAFYXlCDfIKm1QYzbvgS2c=;
        b=SbwSMkf5bKxyhS6UT2NudSS8juXlmI2JGPATe7xiDhAnyzTV3cU+BO9CJNfPmiefaF
         2rMWJa4VwiFPAi+W6WfJwoy4+yVc1DSG3nK/kNQfLPprRc3BVYnKb3ZZGoylLaSfJ8MU
         krMo3A2HMqUqX6UqXerq1Ke2+jHwTjpgVhvt4AzeRx7FAj/5oAJ74TdsPjzRDBIBvbIF
         bPnxZJwHKw9UfXigBubaC2z24bj2MB0wXhMtlXp9xnUmnuRovM1UI1Dr5VxVMkSFdPs1
         bjAgBshxYwxsPuU8hPZzHVydLUtFgDTWMEIuQ7pzgbO/3eJYAHoLb6rH0fuNgQykVIju
         R54w==
X-Gm-Message-State: ANoB5pmV2gXfLcFKRpQdeI1avTZWQhWXqZZxzYv9mYz0dt6HrdevHxEE
	RPiJ/cGOuFiVILATeP6wml7iCx/GkTmjJ3bEbz1ZuQ==
X-Google-Smtp-Source: AA0mqf5TLdtOn1SM7fZHuK8d3xbApVAEEoYMbYRU6OCiFSk08wOADH6h3JlS7ZP3Y0sl9LqAOTiR03Ho+7xq3BMoelQ=
X-Received: by 2002:a17:906:6dd5:b0:78d:a633:b55 with SMTP id
 j21-20020a1709066dd500b0078da6330b55mr41141442ejt.106.1669552649306; Sun, 27
 Nov 2022 04:37:29 -0800 (PST)
MIME-Version: 1.0
References: <c5e918630ba37273d7b0f4e4dbb6f90d4c2f321d.1668347565.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <c5e918630ba37273d7b0f4e4dbb6f90d4c2f321d.1668347565.git.christophe.jaillet@wanadoo.fr>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 27 Nov 2022 18:07:17 +0530
Message-ID: <CAAhSdy1JPKwknR7HrNXkcBxL3QoVDAAzFthDS6nCocnzJor0XA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Simplify kvm_arch_prepare_memory_region()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_043731_859641_E2D7C2D5 
X-CRM114-Status: GOOD (  17.45  )
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

On Sun, Nov 13, 2022 at 7:22 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> In kvm_arch_prepare_memory_region(), if no error occurs, a spin_lock()/
> spin_unlock() call can be avoided.
>
> Switch to kvm_riscv_gstage_iounmap() that is the same as the current code,
> but with a better semantic.
> It also embeds the locking logic. So it is avoided if ret == 0.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

I have tested this on QEMU virt machine for RV64.

Queued this patch for Linux-6.2

Thanks,
Anup

> ---
> I don't use cross-compiler, so this patch is NOT even compile tested.
> ---
>  arch/riscv/kvm/mmu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 3620ecac2fa1..c8834e463763 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -537,10 +537,8 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>         if (change == KVM_MR_FLAGS_ONLY)
>                 goto out;
>
> -       spin_lock(&kvm->mmu_lock);
>         if (ret)
> -               gstage_unmap_range(kvm, base_gpa, size, false);
> -       spin_unlock(&kvm->mmu_lock);
> +               kvm_riscv_gstage_iounmap(kvm, base_gpa, size);
>
>  out:
>         mmap_read_unlock(current->mm);
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
