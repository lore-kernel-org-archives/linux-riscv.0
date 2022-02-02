Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8536EC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Feb 2022 11:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IZFbF3Vmx5pVEn19Sh90yK0oDFAh+e8rMkJJe6Ad8/c=; b=Zb8hX1jDG/FOPi
	pZdn2LUuBma4LXIHCT0Lc06rU4zxNvtjSKqbxNauEoTIWE3BB4qK5MtUJg7dc/gtBPj6Cx+CDgKfc
	iEpvZUeR7BLNTbCoVVi30GE1gxNzFNm+krKS/KC3cLT/VTsoKZbpFfEtRN3kbzb+WoecK2v7tLlOT
	CWHMMGLVRYrLvqLqbZRZOZeXk0FR1+MRxzYIT6ByxWHVrpgoh+sKjgzeKv98eLuiLJYSBMyUNVVcJ
	FpkaqRxgOAFnaK7YXESq2PLL9z2deqLTy8el/XTLMhMdZrNw4LD3Ep/1eZooXEt7ertkZNtghyc0T
	6A09+YdixwHdgwXsaAiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFDak-00F1ws-Bt; Wed, 02 Feb 2022 11:14:26 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFDag-00F1v7-Uz
 for linux-riscv@lists.infradead.org; Wed, 02 Feb 2022 11:14:24 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso4322946wmj.2
 for <linux-riscv@lists.infradead.org>; Wed, 02 Feb 2022 03:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X+Ou2Ig8ojG1Q4rpLhdtlRjQ2QYsf4tk9df7vvSqqRQ=;
 b=HG7pcW+bWSzCh9vAOoccHchduY1ExRfO/ZCl7GAs6q/Yy6zXSNA9QzaaJMyArPE/Ol
 Reu9Rg03Kq/hheJ9HMRhTkj+C8RViQoXugdWycbhyvY2HTpWsHQCzKxApaVH/qWpKjXb
 OteVz8qFVQK7ihQiirPEjYh5N6xFhmJpOcnr5hj1zzh2PG5qGY+Qo48SVaa9Oc8vyYl2
 7fRoiGGG65RdE1bfofNDXBBAXnswoOmIUbszqbAlYO2EIsdkCsis7sXHcp3U31UTL6pX
 8BwG2UOVY7O5KZ3CS7JWue5Nb2QkwYfMe3F0ZNw49cLUYq+LY8uutBrXnZ5Z+akLOV2T
 8Y0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X+Ou2Ig8ojG1Q4rpLhdtlRjQ2QYsf4tk9df7vvSqqRQ=;
 b=NAhoj06YQ35xifiF5yATC5f4/Zzu/nEMgaajJ/Loc7Gl3hSeGkA5qZJkF6muAk6uOc
 futgWTxZ4IXXMXm4OSIgsbpEHe6UeBqIIsFB7AlLMLO5OmsauHZq2fe/kNqu2aPyiKqT
 RVcu1MOVJPYIUO2dzPxz5+YZF5+LdbLu0ChH1EJE8i8a8xbC8NXNZMXQiiSLk8OJL3I5
 GqnfFJeSClqPyiR5sKH1zG1pRxjfzi9Y87giCr11FbqZK2BWFkZMzW7lD0wwf4Qw1kKS
 m58kX4yfiVNn6IyrATDY5dpcRgf3nzngOXSeCClgO5+TZBrjWuke0FsX84GiQx6ElwW3
 Grhw==
X-Gm-Message-State: AOAM530s8IwHxfVT8uOLMA90+fPRtWQVrHA7WIY1Okxusm/HFQQbfmNz
 DN8jMGLsTIFTYjWsltcHehGpH8hpPc/naWi0M+vI0Q==
X-Google-Smtp-Source: ABdhPJwfKpQBfo85BYAHZ/tEJa3QnknYF8q5UcmzvqGAKCRaiqIgFBdfTdXirLuIv3sy03Hv3xEsI0lLuc0gj6VQHwo=
X-Received: by 2002:a05:600c:21c1:: with SMTP id
 x1mr5689397wmj.59.1643800460371; 
 Wed, 02 Feb 2022 03:14:20 -0800 (PST)
MIME-Version: 1.0
References: <20220131110307.1684739-1-mchitale@ventanamicro.com>
In-Reply-To: <20220131110307.1684739-1-mchitale@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 2 Feb 2022 16:44:08 +0530
Message-ID: <CAAhSdy2wX7Re4yepV7ReNQazF9jb-eqSUDE7rLCarr3iUchzkQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: make CY, TM, and IR counters accessible in
 VU mode
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 kvm-riscv@lists.infradead.org,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_031423_027511_DB0807E3 
X-CRM114-Status: GOOD (  16.20  )
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

On Mon, Jan 31, 2022 at 4:33 PM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> Those applications that run in VU mode and access the time CSR cause
> a virtual instruction trap as Guest kernel currently does not
> initialize the scounteren CSR.
>
> To fix this, we should make CY, TM, and IR counters accessibile
> by default in VU mode (similar to OpenSBI).
>
> Fixes: a33c72faf2d73 ("RISC-V: KVM: Implement VCPU create, init and
> destroy functions")
> Cc:stable@vger.kernel.org
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>

Thanks, I have queued this for fixes.

Regards,
Anup

> ---
>  arch/riscv/kvm/vcpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 0c5239e05721..caaf824347b9 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -90,6 +90,7 @@ int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
>  int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>  {
>         struct kvm_cpu_context *cntx;
> +       struct kvm_vcpu_csr *reset_csr = &vcpu->arch.guest_reset_csr;
>
>         /* Mark this VCPU never ran */
>         vcpu->arch.ran_atleast_once = false;
> @@ -106,6 +107,9 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>         cntx->hstatus |= HSTATUS_SPVP;
>         cntx->hstatus |= HSTATUS_SPV;
>
> +       /* By default, make CY, TM, and IR counters accessible in VU mode */
> +       reset_csr->scounteren=0x7;
> +
>         /* Setup VCPU timer */
>         kvm_riscv_vcpu_timer_init(vcpu);
>
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
