Return-Path: <SRS0=53Iy=OY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A263DC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Oct 2021 16:15:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C05161108
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Oct 2021 16:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C05161108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4NpODOTiXa/mynx9u36gN9q4nzqVIgk5j1zI9LilpiY=; b=ghx397hXhYJ4Dq
	KEseSxJ8pTrNwfKd6kxJ6SsyVLKpzt/rwG0A5edWlb39hOJs3XWALPYtHc3eWpnUec5Yb+PMDo24M
	DI137H7wEKqRKLfYkFqwsGYl+Z9tBEIABHtWrE0eAH4ugQNCnjdMfNTKHw7Mb4lVs4Mjx5MNczOg5
	+25WHoq5nQ8rzr30mj3/FGpNwlfLHtsaavIuFzpD6s/U2ur8swDGa4Rv22SXAzrzVzmPccAAPW4dY
	7mHAKjbsJxoteXq3QNqmytAGhZu6KXPwsO/jmuScuYQkhY8syy6BGup70hGZvWzBNrt3PAYeH7dgm
	GnbHSpWFczwWdkffKdQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXQcC-0073Hd-28; Mon, 04 Oct 2021 16:14:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXQc9-0073GT-6a; Mon, 04 Oct 2021 16:14:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D77ED61244;
 Mon,  4 Oct 2021 16:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633364092;
 bh=8N3io59QQ0yk2xvq79v6A76Jo8igPpKM4ZcyigWQ5Xk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ebCyIDxHlUG0gomlz17oCQQRweYX8uD6LXm8haicom+A9TuGHwa3BLiVh5tNfdx6u
 fgihLk2EwoiAjrnNfNiE8UOxTvOWz8GjndCEZb79KhHGHTlytzOYP/avPd02p/MkNk
 ccI403SPp7EodCAVN148ExuDS0rZKk2Cab9O1N0jUdq09yXA2/dRYWmGgwNGejp6kb
 0MweI5gO0oRivlV4dZwcA9cDUHN/j6YpyzzyPxx5r/4TKyOZf3CfDcV18IsTkJ+7vh
 4LYrnovpV2pfEAHqAV3rZ20UgVDugqgV3Smqn9pVeVbVsdPIgEPaF0HLPjTdqh1+uO
 JBmxl9mzx/BWw==
Received: by mail-ua1-f43.google.com with SMTP id j13so4094946uaq.0;
 Mon, 04 Oct 2021 09:14:52 -0700 (PDT)
X-Gm-Message-State: AOAM530gGHoxoRXQtYiX9a7cM3zk6+1Z+4ixl+HwaCxffD71D2RXrMuW
 QTVTgDT4ogdZhBLkHhSn/MzUB19KKg55n9gkIyA=
X-Google-Smtp-Source: ABdhPJxeJZSlFzH2l7JpmmIxwDMjE+f3XeiQGV3+sNxcCN24QoLwDI3Mc7RY4HQcxewkBtpZ/n4i9Tc16oYFgfV1/5w=
X-Received: by 2002:ab0:5b59:: with SMTP id v25mr7446923uae.57.1633364091998; 
 Mon, 04 Oct 2021 09:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210927114016.1089328-1-anup.patel@wdc.com>
 <20210927114016.1089328-18-anup.patel@wdc.com>
In-Reply-To: <20210927114016.1089328-18-anup.patel@wdc.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 5 Oct 2021 00:14:40 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR8JC+vMQ69t9UJxAf2q1xcYYN3Ecj23GdLEpngVN0YiQ@mail.gmail.com>
Message-ID: <CAJF2gTR8JC+vMQ69t9UJxAf2q1xcYYN3Ecj23GdLEpngVN0YiQ@mail.gmail.com>
Subject: Re: [PATCH v20 17/17] RISC-V: KVM: Add MAINTAINERS entry
To: Anup Patel <anup.patel@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <graf@amazon.com>,
 Atish Patra <atish.patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, 
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_091453_276036_9B93CB3E 
X-CRM114-Status: GOOD (  12.45  )
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

Acked-by: Guo Ren <guoren@kernel.org>

On Mon, Sep 27, 2021 at 7:42 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> Add myself as maintainer for KVM RISC-V and Atish as designated reviewer.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Alexander Graf <graf@amazon.com>
> ---
>  MAINTAINERS | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b33791bb8e9..65afc028f4d3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10269,6 +10269,18 @@ F:     arch/powerpc/include/uapi/asm/kvm*
>  F:     arch/powerpc/kernel/kvm*
>  F:     arch/powerpc/kvm/
>
> +KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
> +M:     Anup Patel <anup.patel@wdc.com>
> +R:     Atish Patra <atish.patra@wdc.com>
> +L:     kvm@vger.kernel.org
> +L:     kvm-riscv@lists.infradead.org
> +L:     linux-riscv@lists.infradead.org
> +S:     Maintained
> +T:     git git://github.com/kvm-riscv/linux.git
> +F:     arch/riscv/include/asm/kvm*
> +F:     arch/riscv/include/uapi/asm/kvm*
> +F:     arch/riscv/kvm/
> +
>  KERNEL VIRTUAL MACHINE for s390 (KVM/s390)
>  M:     Christian Borntraeger <borntraeger@de.ibm.com>
>  M:     Janosch Frank <frankja@linux.ibm.com>
> --
> 2.25.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
