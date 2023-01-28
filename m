Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF722C38142
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 14:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZE0JCrwmI3diPNxVzAbpakuqBJGraX7p/GB6EPILTU=; b=TjE/3ZIl+JiV/Y
	0Cp/rQ8Rl5xD/28t05nTOK8jJwOVCnOxmfEUnOvnkb2le89rAxSMt2Yz4mOHyw2qCw3jc04/b4DQq
	ieZR1Q+LUTmWI1BGnOEtpwgKpZ/3waPUvSbqQ3ko5fbO+hry0VZP7/W72O4cncyHqhXCp1vI4JAx3
	JT/51fdC9S8CjL3g9mxN5ehtiLlENl07tH5WB8Rm/4owQyOCTTV+03FgHDZubK17gJVUbxNP56gkD
	1o7LTHihUEjKD+RG+fFoynQ2E77p69gw7+BrfG1vSr5528A/jXhdVV9XUJ1H2E4khUoOzcZuqjcX4
	posYmr9RBLVgdIhxVieg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLmZU-000IvL-SA; Sat, 28 Jan 2023 14:52:48 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLmZS-000IuA-Lh
	for linux-riscv@lists.infradead.org; Sat, 28 Jan 2023 14:52:47 +0000
Received: by mail-ed1-x52a.google.com with SMTP id s3so7178453edd.4
        for <linux-riscv@lists.infradead.org>; Sat, 28 Jan 2023 06:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ijLxm1lKEfZs0IZlgOOAhHSKYX5QLiE4GGhNuEVcGng=;
        b=frQzbI8stra8ftvJmg/B4t7HWCvM9FnezzFATdbngE0HpGmiaL/TjPJIoSbNZ9A4VT
         TmqVpwwgbl9nEk931XnNjrIWQzD1UcenOwzz7GqmOsjVO7BYYbBpkzFJDhcxKpiEcTCX
         uzi6RWK9H2QU/hsKU3ApOaN/zDfb2Lmd4qhQ3vml3oB7T8z+VRPoQ2XASr0au1Tc8krm
         w/KeidcDztQFgvdZPPr37O235osye7NaYMTydT7lZdmtqzkxHCll2ApdWqQt9MGreTMW
         vXqptBUC9RS0RSP6flDXsebDs2Zk+3yAUrJhs3OYKD7CWrVsMAGNeuQ4LUaQCZyYZ+kN
         hU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ijLxm1lKEfZs0IZlgOOAhHSKYX5QLiE4GGhNuEVcGng=;
        b=hxgt56sIMc/KNRVVrYzkLogtAAhv+OlqjbwagdzKfNPQiyqVni5BPj0p4kZCQtWT9c
         gO3lQSK5ySOvvQjEW5jrlMoxWtZcRPI/koaH9XzoEKtPZaTKy6IteRgeNPaM/u9gQkjR
         wQjQpYl+6k+0UFKlOMF0glhogmQWLwOG8lMWIzFk4ZmDLkZg3kLq0q/HKDRkE14/JYK5
         efeWIzy0PXZCiZuo6Ub/9gWLK2YFlNY5jLAyhskrNbVUbZLUuPOQ6sXGkMtWi/kCAWyT
         LxBi3jdIIgBCNicqz7lIoHpR9vYM08G8Z4w1kgJ5L1pwVRGPg8QfyVMznxr8u02/PVfa
         TsEQ==
X-Gm-Message-State: AFqh2krLXG5rpVpQnM0CzfSIpSqHElqLhIlB9Nj+F5LVim8zOdbTdfK5
	DamCeav2zqds1ymEzJlrlNCVykAlkbkCS2WfKkbH1w==
X-Google-Smtp-Source: AMrXdXse7F8M1Kedc0Z1csa7K5rxc5NJv1iWBhk3K9TBNTVIFbV/IBRgCuYscAaDKH70PcJaPWPHOuAgkp3YkwYEPNY=
X-Received: by 2002:a05:6402:1008:b0:499:f0f:f788 with SMTP id
 c8-20020a056402100800b004990f0ff788mr7501420edu.25.1674917563804; Sat, 28 Jan
 2023 06:52:43 -0800 (PST)
MIME-Version: 1.0
References: <20230127182558.2416400-1-atishp@rivosinc.com> <20230127182558.2416400-6-atishp@rivosinc.com>
In-Reply-To: <20230127182558.2416400-6-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 28 Jan 2023 20:22:31 +0530
Message-ID: <CAAhSdy1XKbb47OOQshy5NZjVZrS_eJUFeEWmDgJ2MigSKpVpzQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/14] RISC-V: KVM: Return correct code for hsm stop function
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_065246_730198_2374DE37 
X-CRM114-Status: GOOD (  18.88  )
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

On Fri, Jan 27, 2023 at 11:56 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> According to the SBI specification, the stop function can only
> return error code SBI_ERR_FAILED. However, currently it returns
> -EINVAL which will be mapped SBI_ERR_INVALID_PARAM.
>
> Return an linux error code that maps to SBI_ERR_FAILED i.e doesn't map
> to any other SBI error code. While EACCES is not the best error code
> to describe the situation, it is close enough and will be replaced
> with SBI error codes directly anyways.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kvm/vcpu_sbi_hsm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
> index 2e915ca..619ac0f 100644
> --- a/arch/riscv/kvm/vcpu_sbi_hsm.c
> +++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
> @@ -42,7 +42,7 @@ static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
>  static int kvm_sbi_hsm_vcpu_stop(struct kvm_vcpu *vcpu)
>  {
>         if (vcpu->arch.power_off)
> -               return -EINVAL;
> +               return -EACCES;
>
>         kvm_riscv_vcpu_power_off(vcpu);
>
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
