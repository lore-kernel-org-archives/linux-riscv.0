Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35F4C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 01:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1GzVPVnwjxQ/Xb8PcYAJJlaCdcIyCgXMrbVs7Oijmw=; b=dVfDrgNOXLXqh/
	Yen1dzIRcOAIaoZHCBhS51A5GOZOL/kSESgSlGzYadXkYuTjdVIo2RizmMi1Jx3fEfE0GthEOSf0N
	pUZxULM8Gi1zw0/AJvivNGECx+o2xKr4oE7RBRvYPAJAQEpREbyq+b+e4NCfcWm1UpSu+RKrZyW5d
	CC4fxavVOVxuFfs+kk58f8kN6FQUW/FkErDQlfaePiVctiw0dwkItQgVYTHzoca4Z66jQvEf5t77b
	54UtuBcbCulhuMEDBwzHsz0/XnBfYLgZteFud4gBozRxA5F83IwWUZPNO5SP5llbcdMy4mjkPYJG9
	wR7udq3oLMoyrkhEdxHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBR6K-00GM2X-71; Wed, 13 Jul 2022 01:23:40 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBR6H-00GLzw-EN
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 01:23:38 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-31cf1adbf92so98756717b3.4
        for <linux-riscv@lists.infradead.org>; Tue, 12 Jul 2022 18:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ie5knz6Z7le3iq/Y674AyR+LGN3gRnAoNdlxx7P/y9I=;
        b=RTsKcNxUJJz87MBB2H9d50Uc3Goi8S+lsi1B77YpCFUTLx1Nh7BPBDKPacVZBx1ejr
         zB71wkVArXOsLKhg66kDL+hNE8ZWZrist3SWBobyvIPmFKQNb2Kfb3/5ZFAtHlnL46Lk
         mCo7oVRGdLcynpPypBb3qpQ5njCXRRIxrqPdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ie5knz6Z7le3iq/Y674AyR+LGN3gRnAoNdlxx7P/y9I=;
        b=TAh2lZPD/A3Bux4z+3DuSBOhcq8fypeWunGLKOgrVO4fprC+8ty8eYLZo1AaFJmvvI
         d0hGLmocFzEdMoHRTXaMEfkMUPBj1I40m/qZzXde6W4UokYU2Fg0M+Kj8XZdMp09GNBO
         q5y9+eZ6B1QKDbCsZHUNpXSkqP3ywEqJMZQhNrmiZKAzYxVaOY2Lit0bGYFV4uyEkgK5
         ViB6RL2QZ34XujMzoT80zVX/JsZV85IPFmiWJ/CyMWSyUj3WkrQ/zvf24E+fciac1Jqt
         QNCgW/MVkLR+yf5gBosBjH1uHfXdz8j0+WF2bayiP55Sj9MIRAczTX6CroawSwR4Adf+
         Wzrg==
X-Gm-Message-State: AJIora8OgyPZkEDOL7VAXEm8tYW6qyaaixcyUTQcnF/ry6YB44KP66E1
	Ws3usHOmaVJOremvInpMhOA6CzNkWCohMDkhX1Rf
X-Google-Smtp-Source: AGRyM1tqyP71llyjRs2TrZupwm5NzJqxWxkUC/TBWrNYs7b2AbEUEKsjzxC+kLWriHpNto4Ma84s+Tf/oDKV492vYnI=
X-Received: by 2002:a81:1514:0:b0:31c:a84b:350a with SMTP id
 20-20020a811514000000b0031ca84b350amr1426871ywv.400.1657675414441; Tue, 12
 Jul 2022 18:23:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220707145248.458771-1-apatel@ventanamicro.com> <20220707145248.458771-5-apatel@ventanamicro.com>
In-Reply-To: <20220707145248.458771-5-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 12 Jul 2022 18:23:23 -0700
Message-ID: <CAOnJCUKjFMMsrNWR=hzB+qbw4SECWS3+DOJDun90emnM-Vkpiw@mail.gmail.com>
Subject: Re: [PATCH 4/5] RISC-V: KVM: Use PAGE_KERNEL_IO in kvm_riscv_gstage_ioremap()
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alistair Francis <Alistair.Francis@wdc.com>, 
	Anup Patel <anup@brainfault.org>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_182337_504015_C9306249 
X-CRM114-Status: GOOD (  15.56  )
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

On Thu, Jul 7, 2022 at 7:53 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> When the host has Svpbmt extension, we should use page based memory
> type 2 (i.e. IO) for IO mappings in the G-stage page table.
>
> To achieve this, we replace use of PAGE_KERNEL with PAGE_KERNEL_IO
> in the kvm_riscv_gstage_ioremap().
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/mmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index f7862ca4c4c6..bc545aef6034 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -361,7 +361,7 @@ int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
>         pfn = __phys_to_pfn(hpa);
>
>         for (addr = gpa; addr < end; addr += PAGE_SIZE) {
> -               pte = pfn_pte(pfn, PAGE_KERNEL);
> +               pte = pfn_pte(pfn, PAGE_KERNEL_IO);
>
>                 if (!writable)
>                         pte = pte_wrprotect(pte);
> --
> 2.34.1
>

LGTM.

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
