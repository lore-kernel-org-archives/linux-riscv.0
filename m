Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA04C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 04:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8JgNqNEPooe/Er5zNrQALRV4k7o9aScmt0QTUDfq3nM=; b=F4CMhXzyMoblRJ
	ArW6MYXpJibY2PiV4nyLElDRKRTolzvfYZGMQLj7NBd1RIWw0lXtAR3aa2EUWQ9oUrHAo2KlFxPXt
	moqI1tUvbu2POg6STh2w7yMqne9tN+uKnyV60SEo+kZQiFQLhdRmbTJcS/7wJMly1v4/nH7O6V+Pw
	i0gao7Ps85AnHe0roFzozx1P3ZwOug3AhZ71ciL7sdoXfZdfJCPCzonP3NjmMWm9mnhufmua+69p7
	hX620HfuXGDfpYCxHv3rUMsKLZeOA1oJkqooC3exV45akfLqCK6fdgbzYTar1LKMdC3WGixc9l2nS
	ndVcQ6gBPomp/2vR6pAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEO84-007zPk-IR; Mon, 31 Jan 2022 04:17:24 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEO81-007zOx-OQ
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 04:17:23 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 f202-20020a1c1fd3000000b0034dd403f4fbso8475852wmf.1
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 20:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8HnH9Zt6R9fMT+vzNU6lZCDo2VCXBihuUUKx7xESYC4=;
 b=0eomZB6oDi+B2PWHxL749knbLFreIeZoy97lij1LRfXB9GM1IDHoeX87wMHRFVMpRW
 mZQKccb+LLGrXoFeBn8JeYS4oL+nEovgL98ccI4ifqSpbQtieKS5bOYSbvhXqMvrObwm
 qXLU185eoDiLIw9+hfivqFudXrjxwwj4P3xcRWnQu53fgYhtG2uoZh8+QwmviA907yI6
 4F0qU/H/gzY7geH/J6lYqcrywqPwZqkqhRHk+8N5uAndk317jHDHWCYS3I7q19PjlwzK
 6ogFaV6lAC+znFXrPWYBe14i2LSYVkkODrvLmmRIfN9YU7xR6iGeskBiJSZFYnpWRn74
 Ds7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8HnH9Zt6R9fMT+vzNU6lZCDo2VCXBihuUUKx7xESYC4=;
 b=IDIHvghC+ksdmTTpCEZFvGBCvxcxsCYPnkG7zuSmzUcFF2DtWOQjUKHX0wS3saNdz9
 CMPoGxiSqynzQTVsSnYgeKwBLXDxCMorSg5YWlrYkKSNdBdScigen9Yabxbrdj2iHOA/
 xC1LUe88VXCXHa7ELlUcWjIO8PXi8vju9qYq5LEmWTgTzCeKgKj1mP3DdkVevR2aVOBQ
 4RlvN50M91xVvKtSa5xgofm/TICN0ZS/NuliU/1GCr7yVV7wep1+SEIthHPHKpTcDVXR
 7U9eo49VHWXa8ZYt5NMqm2+Y8CHyvZk0SRsvJoAJO0wQcU89kTlUJDF8Pu2wQXP7BfjN
 1Org==
X-Gm-Message-State: AOAM532qj6zGMXa9MT1FJqLfRrWXbPdf7wiCRzdfWeD0ZKPUwNBFrHgD
 9AdkC7dijM3ataB25pInpeCRGAgKSHo7w05DDuE0gQ==
X-Google-Smtp-Source: ABdhPJzVMzJp/elZCaxwqku1hZwYdiGLhgfcNoVLwLf27ozYDMCaPEGd8/rdnwQeKt1LHLsO+LAlMfv7evAMDGmJ/F0=
X-Received: by 2002:a1c:750f:: with SMTP id o15mr16545257wmc.137.1643602639403; 
 Sun, 30 Jan 2022 20:17:19 -0800 (PST)
MIME-Version: 1.0
References: <20220111010454.126241-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20220111010454.126241-1-yang.lee@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 31 Jan 2022 09:47:05 +0530
Message-ID: <CAAhSdy1xnb=D70rHkewRka6_-bT0+7JAMTYc3fM1MRjs+s1uRQ@mail.gmail.com>
Subject: Re: [PATCH -next] RISC-V: KVM: remove unneeded semicolon
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Abaci Robot <abaci@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_201721_873506_9750BFBA 
X-CRM114-Status: GOOD (  14.43  )
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

On Tue, Jan 11, 2022 at 6:35 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> Eliminate the following coccicheck warning:
> ./arch/riscv/kvm/vcpu_sbi_v01.c:117:2-3: Unneeded semicolon
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Thanks, I have queued this patch for 5.18

Regards,
Anup

> ---
>  arch/riscv/kvm/vcpu_sbi_v01.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_v01.c b/arch/riscv/kvm/vcpu_sbi_v01.c
> index 4c7e13ec9ccc..9acc8fa21d1f 100644
> --- a/arch/riscv/kvm/vcpu_sbi_v01.c
> +++ b/arch/riscv/kvm/vcpu_sbi_v01.c
> @@ -114,7 +114,7 @@ static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>         default:
>                 ret = -EINVAL;
>                 break;
> -       };
> +       }
>
>         return ret;
>  }
> --
> 2.20.1.7.g153144c
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
