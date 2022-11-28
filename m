Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5DCC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 21:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fqXBNAGh/bZFjygA6qISo1JvYaQcDCfIxwIr7uk6r+4=; b=d3e9ixo/+i3d8w
	33JszJoGnsmhPXi+GMlB8aAZc5qok3Cg7tim6tTHqc4BF0veq5i1ZOvPztqPYKv4RrgqJeHM39LSL
	RVTv9ipIb8zbumaVEgPJ7Vzjfj6MxBzzc7QFg3ZPJrCrcWF9Hro9bsNDNccqz+RRYaM1w4/uKflLQ
	MWFWBBRcGE7Mdl4/vxW2U1xeAkDVb9XPR8upsQf75I0lA0rpwu/DIc1W4qn7E1jVR+90LmxK8qdGC
	Ig/DwdRtwC9J4shScjdF5lFxvJpHYc+mXuKuYTKl068O4RHTnuUawbU97+FWcKSsXzoLDqZBMctwX
	cc38bByUGT+DICIULP0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozlIq-004Qn6-O8; Mon, 28 Nov 2022 21:04:36 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozlIn-004Qks-Hx
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 21:04:35 +0000
Received: by mail-oi1-x230.google.com with SMTP id n205so13036982oib.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 13:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3p6Xc2awnVHXaW8GbjDppIU7epKFr+L8bVkeNSCSj5A=;
        b=KkgARuVQ5Drz/MpWTLAgUaK/xzIwu2TSlICaiYVUTUx9VBuvrt1kHIqDEKm06Q9h52
         CgZZeFUDjx4dD+MvKfsmpr+plfOBrPsTXwoapMOuPnumz21i68R+EC9mA3gzao7j7H3W
         D8mdjIPQvhxQDVJpTJtTZ4HISn1MeQEbBmDGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3p6Xc2awnVHXaW8GbjDppIU7epKFr+L8bVkeNSCSj5A=;
        b=53kO33aGI+QK+ENSMXcSWOsxnOWaFHkKU9cJcCgIxxwjdaztCPFKoZHfK3AFeMQg7n
         cZKct4jC3W12XqvSsY9xqk2Q9n4jLpUWdF9+ckeTvCOm2MI3wAB/rAVic+argHhP2BEn
         8D0CkNiCqv8pYYe7zCo8oomRFq8AJQEUne2eLXXOjY14n+/C4DUtj1f4XPY63W+KW7ND
         tj1M/cs5go2ViLv2qRY6krTClsAmfx1lSF4cZoIUG5Msp3R56JDqaBZNHb3K7g3fqzQE
         Y4UKW0YfFovUiUjk9KyPafDY11mRKEZnUh2LR4WUokUg84O57Qcs/7I/WuLjeyCfz/MC
         QkGQ==
X-Gm-Message-State: ANoB5pkysj8yfDAsi5u92FZ3ETgYiRVlcbAW2ndj2ohLJxioJ8H8MNdI
	2MAJak1Kqrw989dI4jQPTJ+pV6rKkLa7kNecoU3F
X-Google-Smtp-Source: AA0mqf6+TtI7x5ueOyiSCG1Vj99YDCfroMM8WEeQkC/lPIQCBjwnxfvfqirvJGhdH3th8KIIqIvlRcvQ0sfSAVJu0G4=
X-Received: by 2002:a05:6808:51:b0:359:f091:104 with SMTP id
 v17-20020a056808005100b00359f0910104mr29346146oic.274.1669669470813; Mon, 28
 Nov 2022 13:04:30 -0800 (PST)
MIME-Version: 1.0
References: <20221128161424.608889-1-apatel@ventanamicro.com> <20221128161424.608889-4-apatel@ventanamicro.com>
In-Reply-To: <20221128161424.608889-4-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 28 Nov 2022 13:04:20 -0800
Message-ID: <CAOnJCUJT_WcBk3bkB7BnA+xPSGoLH0W19ZAwUD2NhnfyApsL5g@mail.gmail.com>
Subject: Re: [PATCH 3/9] RISC-V: KVM: Remove redundant includes of asm/csr.h
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_130433_646953_9B023660 
X-CRM114-Status: GOOD (  10.79  )
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

On Mon, Nov 28, 2022 at 8:14 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We should include asm/csr.h only where required so let us remove
> redundant includes of this header.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_host.h | 1 -
>  arch/riscv/kvm/vcpu_sbi_base.c    | 1 -
>  arch/riscv/kvm/vcpu_sbi_hsm.c     | 1 -
>  arch/riscv/kvm/vcpu_sbi_replace.c | 1 -
>  arch/riscv/kvm/vcpu_sbi_v01.c     | 1 -
>  5 files changed, 5 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index dbbf43d52623..6502f9099965 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -13,7 +13,6 @@
>  #include <linux/kvm.h>
>  #include <linux/kvm_types.h>
>  #include <linux/spinlock.h>
> -#include <asm/csr.h>
>  #include <asm/hwcap.h>
>  #include <asm/kvm_vcpu_fp.h>
>  #include <asm/kvm_vcpu_insn.h>
> diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
> index 22b9126e2872..0c806f61c629 100644
> --- a/arch/riscv/kvm/vcpu_sbi_base.c
> +++ b/arch/riscv/kvm/vcpu_sbi_base.c
> @@ -10,7 +10,6 @@
>  #include <linux/err.h>
>  #include <linux/kvm_host.h>
>  #include <linux/version.h>
> -#include <asm/csr.h>
>  #include <asm/sbi.h>
>  #include <asm/kvm_vcpu_sbi.h>
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
> index 239dec0a628a..2e915cafd551 100644
> --- a/arch/riscv/kvm/vcpu_sbi_hsm.c
> +++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
> @@ -9,7 +9,6 @@
>  #include <linux/errno.h>
>  #include <linux/err.h>
>  #include <linux/kvm_host.h>
> -#include <asm/csr.h>
>  #include <asm/sbi.h>
>  #include <asm/kvm_vcpu_sbi.h>
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
> index 4c034d8a606a..03a0198389f0 100644
> --- a/arch/riscv/kvm/vcpu_sbi_replace.c
> +++ b/arch/riscv/kvm/vcpu_sbi_replace.c
> @@ -9,7 +9,6 @@
>  #include <linux/errno.h>
>  #include <linux/err.h>
>  #include <linux/kvm_host.h>
> -#include <asm/csr.h>
>  #include <asm/sbi.h>
>  #include <asm/kvm_vcpu_timer.h>
>  #include <asm/kvm_vcpu_sbi.h>
> diff --git a/arch/riscv/kvm/vcpu_sbi_v01.c b/arch/riscv/kvm/vcpu_sbi_v01.c
> index 8a91a14e7139..489f225ee66d 100644
> --- a/arch/riscv/kvm/vcpu_sbi_v01.c
> +++ b/arch/riscv/kvm/vcpu_sbi_v01.c
> @@ -9,7 +9,6 @@
>  #include <linux/errno.h>
>  #include <linux/err.h>
>  #include <linux/kvm_host.h>
> -#include <asm/csr.h>
>  #include <asm/sbi.h>
>  #include <asm/kvm_vcpu_timer.h>
>  #include <asm/kvm_vcpu_sbi.h>
> --
> 2.34.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
