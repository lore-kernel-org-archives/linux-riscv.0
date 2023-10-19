Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D4ECDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 09:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=APopzHbfCRZQzdzg6BwHbsK5VD+u36ACXWelBq4sKv4=; b=yNO/reBktIk6mH
	Wb99b/hfnwjbE+7m5Z1twwALeYgzyVYqDMCC6TCx5LbeNLTh6EYH7HWJXNKwghhP6/f9gEH/bfBYQ
	5Hg1NpFx0D6awyYHI0Ak8r/3JRgQcddkibgrtFHDcpv3aQXQlkb9LzsF+ZyHqvfqEyHBPcLtLxPk0
	l722WxWuzc67F/UabRhjpQPdpDWH3FHCqditU1q0AdPZWmFXVllG+1ddG5zTMcDu21snCpLd/JQ/R
	dQ8rVpDswVI26XT6kGk9XQLkcDMX/REhsV2gNl7GM2fTsTuuc6dpS2jvh+01fG0jW6WwXrSUkvd1l
	fxuPKCCG7Dv4uCzeUMpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtP9r-00Gpu3-17;
	Thu, 19 Oct 2023 09:17:35 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtP9o-00Gps8-1V
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 09:17:33 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3296b49c546so5953490f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 02:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697707048; x=1698311848; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bcsnYpAdLM0em0FjxCCFcChvrh3CN3lWApFF37wa+JE=;
        b=GakUo38F9o6kW4cwr+e5OFpHrTLU1RY9yWifI4seNAKKjPivtqQqBOU+4LXWdGntdo
         P4eVFpjO9K2beNp/+nwH2P5WgfrnHGU06QjiIEj+WYhAepopuBVFXpYYuadQoDpEe6KT
         B+8llwctZsNXyUa9H1rvHHxcz50kknWf+Hs9luFpB6S+Qa9BKKSojOj/9xOh0Lc12gvd
         Pt0DxSy6+tzbfrbgOlGcXluN+YFAyGQMiExWs6oNipmzG+G7KN8U/6ezAQtr4JaLX0tW
         RemDbsfCtr8sKcaCtEdieMdnVlktTzkjMfcoz0kKFa985tWuG1DhYPSmmjoVrFRCbBX0
         5xNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697707048; x=1698311848;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcsnYpAdLM0em0FjxCCFcChvrh3CN3lWApFF37wa+JE=;
        b=TuLKFNE4za4X3boZvvwyU/YFjPmI+7n0idJFXWcmNMoD73rkDeEmZJRqyoB2vAGYjk
         QKm7ZiEIpH7USc52Oi+CGYwworXtmndez9V7phu39vBmGwiZYWM7wz4/5czh4Z0giomG
         PX6wxIYOiUwqIy0QOuBNAZqlu9hE+ifTA8fPfY096iXQ1781RsjwCHoRt5l0njsbnm0B
         oHM8mxoWHqOC5RdXQGdR1bbjdEsSCuFuwrZFVwDpp2ExGCitGbdWE6s+hJm31eAkja10
         nEBrBkbybny4b5LkUDs26PaakGGJMEuqKi0WCEJIjZCqHdXslwZjp8cdKycTTDWqqidh
         DkTA==
X-Gm-Message-State: AOJu0YxHN8RoJN843TbA9nDhRJ7n+8IkR/3hP3/TyjM8Z/l6W8UYQj+W
	akoFz7GNFLVIrzzCaWNyoL+6/w==
X-Google-Smtp-Source: AGHT+IG8jOCLnI027DgY6Yx/fVy/qYUq7DqIReW1lUlcofpdY/Llx77hEFpM5sP3dOt6SenXND9+/w==
X-Received: by 2002:adf:f74d:0:b0:32d:8da0:48d0 with SMTP id z13-20020adff74d000000b0032d8da048d0mr923979wrp.68.1697707048600;
        Thu, 19 Oct 2023 02:17:28 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id x8-20020adfec08000000b0032dbf6bf7a2sm3994451wrn.97.2023.10.19.02.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 02:17:27 -0700 (PDT)
Date: Thu, 19 Oct 2023 11:17:26 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Conor Dooley <conor@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/8] RISC-V: KVM: Forward SBI DBCN extension to
 user-space
Message-ID: <20231019-7471d3927d94ab7158d61c6b@orel>
References: <20231012051509.738750-1-apatel@ventanamicro.com>
 <20231012051509.738750-5-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231012051509.738750-5-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_021732_506044_F3376B35 
X-CRM114-Status: GOOD (  19.03  )
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

On Thu, Oct 12, 2023 at 10:45:05AM +0530, Anup Patel wrote:
> The frozen SBI v2.0 specification defines the SBI debug console
> (DBCN) extension which replaces the legacy SBI v0.1 console
> functions namely sbi_console_getchar() and sbi_console_putchar().
> 
> The SBI DBCN extension needs to be emulated in the KVM user-space
> (i.e. QEMU-KVM or KVMTOOL) so we forward SBI DBCN calls from KVM
> guest to the KVM user-space which can then redirect the console
> input/output to wherever it wants (e.g. telnet, file, stdio, etc).
> 
> The SBI debug console is simply a early console available to KVM
> guest for early prints and it does not intend to replace the proper
> console devices such as 8250, VirtIO console, etc.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  1 +
>  arch/riscv/include/uapi/asm/kvm.h     |  1 +
>  arch/riscv/kvm/vcpu_sbi.c             |  4 ++++
>  arch/riscv/kvm/vcpu_sbi_replace.c     | 32 +++++++++++++++++++++++++++
>  4 files changed, 38 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index c02bda5559d7..6a453f7f8b56 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -73,6 +73,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
>  
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 917d8cc2489e..60d3b21dead7 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -156,6 +156,7 @@ enum KVM_RISCV_SBI_EXT_ID {
>  	KVM_RISCV_SBI_EXT_PMU,
>  	KVM_RISCV_SBI_EXT_EXPERIMENTAL,
>  	KVM_RISCV_SBI_EXT_VENDOR,
> +	KVM_RISCV_SBI_EXT_DBCN,

We should add this new register to the get-reg-list kselftest, i.e.

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 234006d035c9..4a0f8a8cfbf8 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -565,6 +565,7 @@ static __u64 base_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_SRST,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_HSM,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_PMU,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_DBCN,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_EXPERIMENTAL,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_MULTI_EN | 0,

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
