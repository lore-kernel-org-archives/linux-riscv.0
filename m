Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1BEC54EBD
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 10:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hBMnobZrgsg5bakla0pYMXNnjSWlTMzFYHU7aZmmuoE=; b=0jC6j1S0ZvX7VM
	qE1/rQ6pFF8VwZ9OkZicb+zRYl2g4T10OVhl4x3a1+Pb0op3JIoGaGcI9oFPZlZvzAla7uLQKS4mA
	LPqSp5gU2cdE6NtpdQ4zvmCkeSEwDcKELllqKtU7O31yTlvc6Rxiwmae90km/2h5QAqMqkNt4tqWz
	feDrEuu4bHzFMwyQhlObDPK9nB4aITXKsHXKaSK9t96Y13YczCIAE4khJI6NBNctC989fl0XGIsEl
	z6dZcrVgcJyI6C79TTVqvBZolXX8RE44CWaMdFbE9iG4nT17zH3PC0U/fsqdSwVLpaGiNCmJOKHBW
	nj3WJq0eu4Yi/6K15Z+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFuiT-00EYf4-8v; Thu, 12 Jan 2023 10:21:49 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFuiQ-00EYdK-DC
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 10:21:47 +0000
Received: by mail-ej1-x636.google.com with SMTP id u19so43515181ejm.8
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jan 2023 02:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2jyknxSTt2NQw2hfgMQYd2CfekI+TJ/MujvE+w3CPTs=;
        b=ID1mSBwtij4q3V+xmbjdDpYaTZjx5gqBxN6wsmB3LUOo9WXhzTjYZLpcihT2JeGRVM
         f1a/bjEGrHwJ1UXMBdtC7GKaCMXaLvVyBEsYKUFo5k8Bv98faLHBuWF49h/V71CdPeFO
         O6Ux1M5i1GeASyV7JwiNzqrYzfrlB04kojMNAnnF+r3lzznyJkrwEf6BywnPh2k/LPK1
         QByR9e2mG5BqRa76SCYo+oyEUW41X6Api2I/YJTmKKsY9vJsMPBACvBZm0WFg43LXrw8
         KGjpSGPtykno+ClZgQWUC8BT52Ge0oLX9YZIOzlUhi09YdFtIVmi2+mAT3VBoeQS7fd6
         oNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jyknxSTt2NQw2hfgMQYd2CfekI+TJ/MujvE+w3CPTs=;
        b=2UOeLSGp5x8woKOiq32fy5m6pqSoApteqn9WPPRn6D4jTJuRWaGQ8y4nL2ylngrWwY
         FzuGWJYh9KNkn2T4jL//E24wRnCZjjtB3PyoY4yweHVF/++7MD9uSIs5bSKBk9tQ+h6j
         tWDe3lLlqeV2YgTr/GcUaQOLGdmex8gamAq0kinbzdtqOX5i/EeEiFIY30uFsVs8+cgp
         m9+JExkyzT3l8fnUWD5g/bCxfsv8XRBSqK8oQahxIRy4tUoZSDitNlKBaLiNEvWUVuFK
         X9dACTOzimPC5nucjdC644UQTgtoyf/TM6nGD8xWIcpAN+bY5i8pwTgomrEMj7Cu7l/7
         dsew==
X-Gm-Message-State: AFqh2krzgZPvAskN6666ExOcsiUJy9c8SV17lpNgY8W8C4NGEpJmib0O
	PH+32G9yjlPwg9moAO682PdxZw==
X-Google-Smtp-Source: AMrXdXstE2goO/ZfgFaOC5o6KAc94kfn/S1VI810KcC/mfZ5erQj9qFTjhY6z9iVjYkkQngORCF0fw==
X-Received: by 2002:a17:907:3ad8:b0:85d:3771:18b7 with SMTP id fi24-20020a1709073ad800b0085d377118b7mr5031588ejc.70.1673518902582;
        Thu, 12 Jan 2023 02:21:42 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id 9-20020a170906318900b0080c433a9eeesm7252556ejy.182.2023.01.12.02.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 02:21:42 -0800 (PST)
Date: Thu, 12 Jan 2023 11:21:41 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Eric Lin <eric.lin@sifive.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 02/11] RISC-V: KVM: Define a probe function for SBI
 extension data structures
Message-ID: <20230112102141.chpcqzoko25s2cak@orel>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
 <20221215170046.2010255-3-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221215170046.2010255-3-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_022146_475269_F7DFA19A 
X-CRM114-Status: GOOD (  25.14  )
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

On Thu, Dec 15, 2022 at 09:00:37AM -0800, Atish Patra wrote:
> Currently the probe function just checks if an SBI extension is
> registered or not. However, the extension may not want to advertise
> itself depending on some other condition.
> An additional extension specific probe function will allow
> extensions to decide if they want to be advertised to the caller or
> not. Any extension that does not require additional dependency checks
> can avoid implementing this function.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  3 +++
>  arch/riscv/kvm/vcpu_sbi_base.c        | 13 +++++++++++--
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index f79478a..61dac1b 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -29,6 +29,9 @@ struct kvm_vcpu_sbi_extension {
>  	int (*handler)(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  		       unsigned long *out_val, struct kvm_cpu_trap *utrap,
>  		       bool *exit);
> +
> +	/* Extension specific probe function */
> +	unsigned long (*probe)(struct kvm_vcpu *vcpu, unsigned long extid);

It doesn't seem like the extid parameter should be necessary since the
probe function is specific to the extension, but it doesn't hurt either.

>  };
>  
>  void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
> diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
> index 5d65c63..89e2415 100644
> --- a/arch/riscv/kvm/vcpu_sbi_base.c
> +++ b/arch/riscv/kvm/vcpu_sbi_base.c
> @@ -19,6 +19,7 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  {
>  	int ret = 0;
>  	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> +	const struct kvm_vcpu_sbi_extension *sbi_ext;
>  
>  	switch (cp->a6) {
>  	case SBI_EXT_BASE_GET_SPEC_VERSION:
> @@ -43,8 +44,16 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  			 */
>  			kvm_riscv_vcpu_sbi_forward(vcpu, run);
>  			*exit = true;
> -		} else
> -			*out_val = kvm_vcpu_sbi_find_ext(cp->a0) ? 1 : 0;
> +		} else {
> +			sbi_ext = kvm_vcpu_sbi_find_ext(cp->a0);
> +			if (sbi_ext) {
> +				if (sbi_ext->probe)
> +					*out_val = sbi_ext->probe(vcpu, cp->a0);
> +				else
> +					*out_val = 1;
> +			} else
> +				*out_val = 0;
> +		}
>  		break;
>  	case SBI_EXT_BASE_GET_MVENDORID:
>  		*out_val = vcpu->arch.mvendorid;
> -- 
> 2.25.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
