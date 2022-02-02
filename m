Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C752BC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Feb 2022 11:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LmkTRyrSsPgX0GFyHcZVrhHwPe80HcAofxfbvE4m+t8=; b=QuLaBn5dWwyFcp
	Uwqpi5mCjuWr8BSk1Ouvuc5dN8E30ScWIzwAeX4lsbx6T/p0/EeQ0PhpK0hM9QTh6yaZaDyzASruY
	9hckppGJJKh4ospozlMIWGmjT+mdOvea6RxoXRsgff5+4n/WuqZqhTm4Eg7xOAc8PBrb/dF5XiMs8
	905kyLRYfA8kpIZO0l5wkoGyrnEeoKZ5SRMQ1nOew/Nft5kKR7R0CiSWJiWc7Vi1Q4xMWMAnq0AQe
	d80dfMaTLP7CAHl0da4XfeY/KhPaUeCpc/R67OAcTd4oV5njybBG045ecm45z1HKtZfIpB7t3RVJY
	6vsbx5VLvTRnfXt45GJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFDhr-00F2uA-ID; Wed, 02 Feb 2022 11:21:47 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFDhp-00F2t2-8N
 for linux-riscv@lists.infradead.org; Wed, 02 Feb 2022 11:21:46 +0000
Received: by mail-wr1-x42b.google.com with SMTP id m14so37470212wrg.12
 for <linux-riscv@lists.infradead.org>; Wed, 02 Feb 2022 03:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CLpBWpR4AdxV5k5a9SzxOwC4Is5G/R+GFZUj0OPG68E=;
 b=0GzZnB6+OCeckMUkTJmkIO5sfwKHCblMsvuWqQfWsqJAhSN7p5my9G/QCBoR6UwdAi
 jN/c7wPi23GCh/djF3RvdTynngxkjgI4Ct6t3wl5Qt/YFhFpU4FSATeju5bRLe6Xi05M
 6Q0voGGh4CpnD/whLpVbYzlLvBThs1p5AscZe1PUEtOENxlUTOZHWuQNPb/orkrS7CZq
 CKaZWk2Uxa89CqefqP9gdaLI9gb+wBBgh8QjhHLgzuCgCg3kGVjB6nLc5EgLxPRciSUN
 LU8GAoJvu9GdmAQPYgNnbPKtbIz0BgB+3D25b0wmvSaAL7w7c/ZFbRsKj8Ymy+C8GdWW
 Wkog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CLpBWpR4AdxV5k5a9SzxOwC4Is5G/R+GFZUj0OPG68E=;
 b=O5bSYCbJuZuJ9q4TdtLdRP5Kh9FLUJsb4aIktjAhveMue0tY4w1MX2vfTmADEjz5gX
 HdJm18zFBpB+V3/LAu23BssPZaG1RD7h4gEur+/LGg2b03VxQWKG2waS27BIvtW0UfRF
 2sW/gh5IqgMmutnPgZpQinH7Utysf84xsldaElKyeOQI8VO8TIwee1Tztv+HV8F+kgSt
 OU/RkKwy9cofo9ol9LsC4vjujaErYxK6bjNhsLSJddqo0+2CP3fQ+Ub/fBifteLAcFCb
 Dz6406ND9nnmyUQg2rLFYogibz3G934IB5GRxNQd+nZDyUe9aj3v62Z5MzMovupe7xQH
 uCAA==
X-Gm-Message-State: AOAM532aO2dsIFHrFYNlgeH01T9sfpi47EYsmDahrcjeoh3JjJZUtP51
 TLN7j9Xd0vcILrBxVgI59Ef1tmwTm6US/1Zv+p+SriUBwp4Kgg==
X-Google-Smtp-Source: ABdhPJzlXdO1QshYnBgRMzXJ2ivnlrYwpOvle2NHmkETsqwszvU55uwzYT90mGUVAB/9xurup36pfFR95cYb5rz617U=
X-Received: by 2002:adf:d08c:: with SMTP id y12mr25480446wrh.346.1643800903609; 
 Wed, 02 Feb 2022 03:21:43 -0800 (PST)
MIME-Version: 1.0
References: <20220131164232.295585-1-apatel@ventanamicro.com>
In-Reply-To: <20220131164232.295585-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 2 Feb 2022 16:51:30 +0530
Message-ID: <CAAhSdy3ReL2cJXZ+0YMcEeWJg02p86Sr-dNXKXm7GMMaqUZJiA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix SBI implementation version
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alistair Francis <Alistair.Francis@wdc.com>,
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_032145_321518_7F4BDA8A 
X-CRM114-Status: GOOD (  15.55  )
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

On Mon, Jan 31, 2022 at 10:13 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The SBI implementation version returned by KVM RISC-V should be the
> Host Linux version code.
>
> Fixes: c62a76859723 ("RISC-V: KVM: Add SBI v0.2 base extension")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Thanks, I have queued this for fixes.

Regards,
Anup

> ---
>  arch/riscv/kvm/vcpu_sbi_base.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
> index 4ecf377f483b..48f431091cdb 100644
> --- a/arch/riscv/kvm/vcpu_sbi_base.c
> +++ b/arch/riscv/kvm/vcpu_sbi_base.c
> @@ -9,6 +9,7 @@
>  #include <linux/errno.h>
>  #include <linux/err.h>
>  #include <linux/kvm_host.h>
> +#include <linux/version.h>
>  #include <asm/csr.h>
>  #include <asm/sbi.h>
>  #include <asm/kvm_vcpu_timer.h>
> @@ -32,7 +33,7 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>                 *out_val = KVM_SBI_IMPID;
>                 break;
>         case SBI_EXT_BASE_GET_IMP_VERSION:
> -               *out_val = 0;
> +               *out_val = LINUX_VERSION_CODE;
>                 break;
>         case SBI_EXT_BASE_PROBE_EXT:
>                 if ((cp->a0 >= SBI_EXT_EXPERIMENTAL_START &&
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
