Return-Path: <SRS0=Kh2H=QF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CDD8C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 07:53:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F9DE61875
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 07:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F9DE61875
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lLqBsNY8btG7oaGY9jj61pOf3Ha1jUL0FVvQhXhIrbI=; b=Wa41Lsyb83UygX
	22HQuOJYbkcE1XU/Rp7m+Ks8CrFHf7pf04fZhFptHdeaPzIgvG2LE5VdE6X5nfz+4Ptn7mYNZMT7v
	IlWMCyySU9+s4h1qc/k0yYmBjcsdgSt86EZ7QWav34ra/Hya3xmHipsne8HtxXdoP6QC0jFHNONvR
	NUQM90Fq/7eO/I2mNfUt/wxhQ4bQWu49Zkz7DQU6avpexyJac+K5wHU2DTwkl6B5FtRbYP3yfVbzy
	5ovfYis4Gx8ZMN5hRL0EODDw/sirop22ctUYh/BDEBE6Exp4pnGk8zuaI21cJ/qW5qEpJqtnXhFCy
	IK/75ocWkfAThGx0mk1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mncEg-0078lW-Fc; Thu, 18 Nov 2021 07:53:34 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mncEe-0078kn-Am
 for linux-riscv@lists.infradead.org; Thu, 18 Nov 2021 07:53:33 +0000
Received: by mail-yb1-xb32.google.com with SMTP id e71so15456028ybh.10
 for <linux-riscv@lists.infradead.org>; Wed, 17 Nov 2021 23:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TDKkX88+RykK6wFZB2EhLlhOTISSe/7PLhp9ZnITJ4w=;
 b=GBPf3ujyvv0e/Ary9Bbgc77cgsmIbFvTE/JT0m3GhcdkloU/Wx58qnaZxMsMdDo/j5
 zULXuXv7FVQ+wyLH2mAwWPKqFg8oyOivakS302gBbrEjwB91SfYILsj1VGIzHtsF95mv
 V1hHkbRcGqxcjOiKYGOlDUQC+HYO+mI0kqlHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TDKkX88+RykK6wFZB2EhLlhOTISSe/7PLhp9ZnITJ4w=;
 b=o65XJUHdMcnhCki8ObyzcCd1ZI+zx38c7Apa3a2ycG9OBPK55hDDWF7R9KfirGcQvM
 PJsWwySi5aPKgUhH8eDTMV1Ii8O+rx77IX8/cmVmNsbF5yFJTOgQ+kNFvcZWlqFGNFXA
 2SuCOggshawGQTIwxU+d2+zC2gBV1QtOZa94/dXw/jVmfpQdhtwbVe8OkWI6HIh0uTSj
 pbOnY59HcOXawZ4R7OmEA9ijY8DXBiIFvE7zMLdo8qlzBS2JjeCNN8EloraoBYixs9Et
 8WJgX+qvK4xGTCDtUYqHsnwOzqMGhJFXg2mIC1RyTGjC8Xpgz7dgZJ4cauEMzt3IVFd8
 Vhtw==
X-Gm-Message-State: AOAM532LKGfS6PesKiMKmLrMHY0dwaFnzxbjdcNM5uMJMWB1vpWrAF7q
 CK8X1vL+s9zGrCpOlueXMxHyOILO1+Wlq1EEK5Sq
X-Google-Smtp-Source: ABdhPJxYS+1xnfc4pBR9/P4FZ+QxojJsLGzE4XFFT6z5qm2enZAwYkcIxqwk5PMY7nbGklDq2K2ZjW8EyyQ8O/QyOTo=
X-Received: by 2002:a25:5f4c:: with SMTP id h12mr25017780ybm.169.1637222010841; 
 Wed, 17 Nov 2021 23:53:30 -0800 (PST)
MIME-Version: 1.0
References: <20211117060241.611391-1-anup.patel@wdc.com>
In-Reply-To: <20211117060241.611391-1-anup.patel@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 17 Nov 2021 23:53:20 -0800
Message-ID: <CAOnJCU+KZn2JnZg-FZcJ7PXRpGo5SyOmdUYFeJgBenPO9xxE1w@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix incorrect KVM_MAX_VCPUS value
To: Anup Patel <anup.patel@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Anup Patel <anup@brainfault.org>,
 kvm-riscv@lists.infradead.org, 
 kvm@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_235332_461772_B29C1010 
X-CRM114-Status: GOOD (  14.20  )
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

On Tue, Nov 16, 2021 at 10:03 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The KVM_MAX_VCPUS value is supposed to be aligned with number of
> VMID bits in the hgatp CSR but the current KVM_MAX_VCPUS value
> is aligned with number of ASID bits in the satp CSR.
>
> Fixes: 99cdc6c18c2d ("RISC-V: Add initial skeletal KVM support")
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/include/asm/kvm_host.h | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 25ba21f98504..2639b9ee48f9 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -12,14 +12,12 @@
>  #include <linux/types.h>
>  #include <linux/kvm.h>
>  #include <linux/kvm_types.h>
> +#include <asm/csr.h>
>  #include <asm/kvm_vcpu_fp.h>
>  #include <asm/kvm_vcpu_timer.h>
>
> -#ifdef CONFIG_64BIT
> -#define KVM_MAX_VCPUS                  (1U << 16)
> -#else
> -#define KVM_MAX_VCPUS                  (1U << 9)
> -#endif
> +#define KVM_MAX_VCPUS                  \
> +       ((HGATP_VMID_MASK >> HGATP_VMID_SHIFT) + 1)
>
>  #define KVM_HALT_POLL_NS_DEFAULT       500000
>
> --
> 2.25.1
>


Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
