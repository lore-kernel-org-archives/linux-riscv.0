Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1CDC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 05:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oDeEcsbJFrT3CsFT1vseqah9wq/hBcamRT+uJ7wH1VQ=; b=2GwBY/WnPm7kwA
	bJ9bYxPqiq2cxvSOuts0JqwqP7LwxwDz64mDc5b3Jygm6QP3GX68BA/XTjrUIhsPyZiA2S0T1//Uk
	IRo0R11ENIwhq9VwZlOILLwJLvtl5V1KPk1Opzf3DCHL5G/kLAk2fmrRp0HSYriAlLuUdjAH2TvnY
	EJqKrjS2GTEU92gPJdp5kyep94KPlWgHTT0lfEyzwBcke2JbDirJ4PtFqKorxjB/Cy+tonSod9jfa
	yoK3x4yLMQjC+CSkKNh5imTRYWxaULXpqyA9paI1dteA/KCnvVAt9dd/kqBan3gVbWgNdPqOtbQua
	QCe/yVslihXybZAJcW0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozt2W-006NE0-RV; Tue, 29 Nov 2022 05:20:16 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozt2T-006NB9-FK
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 05:20:15 +0000
Received: by mail-wr1-x42a.google.com with SMTP id g12so20269551wrs.10
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 21:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UNtdvjscBhLbwh2XhJBp9F2ZNT8kfwAr14y0tkrEfX4=;
        b=YTO1hgLZguCdb6dM2PGe/mFaxgvPJ9FFs5FLLLiKeEvJIF4E8z6L66+m0nHOLQWYTG
         Br5NP+RuRHUIzj+NdIrw6uuJVyGoA0MQytuPZR89PiunS3xcUsW2xuG3ApMF/002kb98
         pKkpohbCeUUS06R6+HLRImy+1pGoQsyhQilwsjs6C6mXM5v8UeDNZVJRNuiARtCIzLmf
         7lR4umfzB4BEtx56RR8sg2qHlIR6vF3EtGen4XLiuRYEPx2VPW9mY3Tc2y8GLJm329s9
         BWNInJHNLF3tzUiwb3ldQSNdN/mZ0sxPcSaD0r1SVi0E6zAIhDN3JMWeDXu9UDyZuB+G
         2uGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNtdvjscBhLbwh2XhJBp9F2ZNT8kfwAr14y0tkrEfX4=;
        b=UpVmMqixeABFp+NjPKFq0tSrJ9vKq8ltWcAUX5h3JiKkn+WDZ96rMRnFdysQUUUgPx
         AR+U4oAvhm9fORuY+exH0tOUj+RnwVad6jaVcYLnk4XxWhZKzlhIWJQwZAP/POL+izlx
         Qc+HNuLELGv97nselU98UpaZrrDpan2H5trelG99OubY/+1bTxf806wD7Ff6tmFUwp5A
         yXGBGJm8LveLLkjwg4Q/O1kXdi8B8bguwQNZOVFoycSEIXRr/K0AlEogz+6Ak4afLswO
         NZQmpvcdS033wga3yHK9mwZM+R2acQUw15r5rtWszuXOoyOisTgiB11YNpGTlQMLKHNI
         x2xw==
X-Gm-Message-State: ANoB5pmR9rgHmo2PkWRZGhoeAUDGLGN0ioKz+wGXCK3uXz9M0SCcnW7l
	VY43RDdsWMsWRpZ4DbtI2Hab9A==
X-Google-Smtp-Source: AA0mqf52narjPwuAD2X85QS2JLR4/KZBHsWfpzhuT8Zjpu5uwjDHTPLaoPhzIqv1I50SxY3DzMvX/Q==
X-Received: by 2002:a5d:58d1:0:b0:242:a3a:69cf with SMTP id o17-20020a5d58d1000000b002420a3a69cfmr9670017wrf.159.1669699209959;
        Mon, 28 Nov 2022 21:20:09 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id q8-20020adfcd88000000b00236576c8eddsm12357878wrj.12.2022.11.28.21.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 21:20:09 -0800 (PST)
Date: Tue, 29 Nov 2022 06:20:08 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] RISC-V: KVM: Remove redundant includes of
 asm/kvm_vcpu_timer.h
Message-ID: <20221129052008.jyoexzmhzo3n6l5w@kamzik>
References: <20221128161424.608889-1-apatel@ventanamicro.com>
 <20221128161424.608889-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128161424.608889-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_212013_520573_8AC17DE1 
X-CRM114-Status: GOOD (  14.54  )
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

On Mon, Nov 28, 2022 at 09:44:17PM +0530, Anup Patel wrote:
> The asm/kvm_vcpu_timer.h is redundantly included in vcpu_sbi_base.c
> so let us remove it.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_sbi_base.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
> index 48f431091cdb..22b9126e2872 100644
> --- a/arch/riscv/kvm/vcpu_sbi_base.c
> +++ b/arch/riscv/kvm/vcpu_sbi_base.c
> @@ -12,7 +12,6 @@
>  #include <linux/version.h>
>  #include <asm/csr.h>
>  #include <asm/sbi.h>
> -#include <asm/kvm_vcpu_timer.h>
>  #include <asm/kvm_vcpu_sbi.h>
>  
>  static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
