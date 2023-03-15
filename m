Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33A5C6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 04:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=EABZDalVSW7nuvFSgkpuLWXDZA8X9PnSxCovG38Anbg=; b=YemByAFvl+UEmaKWOvnNXfJxB9
	hdCZnOpW9pVxdWvIaqKEeHYYharyh6n66zqkJjGh6aIYP3o+kGPNfdZtY8XGGySzmI9vzZacNYqxh
	TPGSPH/cQj9q3ENp6jQVf6EvUV+EXuW63H1aTTTpj8EagclSiSHv6tnCpdeObq98r5QH1yEOAoQYl
	UWtevhxGkUm2WTWDvQ8p40m5k1yLAgkeJMJV9cvEr1qEUsEeak2YGxp3wPmGoajooRVX/doU0xw6G
	PkuTuOdmHgPrwJEC9/xnNmMOwPnQjbj61UW5RR8a2M6acpRPNkjqMDM7e6lajPUsOuF2wJIoY4lbH
	Y2tJnr6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcIuO-00CIZt-36;
	Wed, 15 Mar 2023 04:38:40 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcIuM-00CIYv-0p
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 04:38:39 +0000
Received: by mail-pg1-x529.google.com with SMTP id q23so10122753pgt.7
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 21:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678855116;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ot/Kqm87pKKITp9FgIINg6STXrgBNEYzCbiPYciv9Rw=;
        b=XN2KYGCBc8qLHIbu9/3/gA8h9qX44MaM3+Nnv+6yFYnDr93MqybeQmMUI8kQsfTSPy
         ths3vvKvV9w43FmTNTewhXxjFZrrWCfEEAe/7XIXbyvymadSLlEwmwTUymuoaSi86X8n
         zFlRLaa2HEWTQ/Jin+O6vyf1IwKzkmoUgPgc/vixAE4ml0h3d/j9Fl3lJDyMoFA+205M
         DCA7eCwJ/07WXJB+yx8PPI9/FrYWbbgv4m0tZQemhAtA1SXvjHtn7AGRG4Q2mH73bO1J
         S0lXAIOqC5cZfc02PfEY9Ndk7N5Qe7iOSwu83GGI4AooLHkw7ERZ1RZM/V5zL6IXTJnt
         tNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678855116;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ot/Kqm87pKKITp9FgIINg6STXrgBNEYzCbiPYciv9Rw=;
        b=iIC2mZDrQVmjUCp2Q/jLS/k4BbCzZ0+GwA9lWmszTeRW7X6ujZj63+FP9cdx/7JSBM
         /UZ5P++8yNj32ubASMdGL2kUZwwykNLUjCDvqqL9TgSy9MGl16o8uPStCSUFb1vir7C9
         i2FCDMry89Lz67XEha3jUeo0XerqFceO0tSCNpXeDkIeNJW0Iy+fTLZ3bLwLfZe+k8dm
         hYkKAcFe5mU+qnUqKWHWPJBuLIbBY/0bFCl+x4SdJGsLgEPLrlRDKbKDFLF61fUj24w7
         rWNU8aJewCngBE2M8ySOlSrsaVpx90zdxNGe3vNAwmgSC/nwy/6Y+bgEp+WVVNbNMK+y
         IoLQ==
X-Gm-Message-State: AO0yUKV7tgnDV881mZ0naV1DHzF8iZXIdmB8O0BgZmuDyNin0hLKnMxk
	DH9XRAO/xqkclpB5kpKvRX7fSi8WlKwpdiEY6t0=
X-Google-Smtp-Source: AK7set+VHTtmboYpV9L3aDih/5qO5NmZnKx50j6qqhcn1b8irqDBR5N97JQ06Ze9oE7rDOQLm9dM1g==
X-Received: by 2002:a62:648e:0:b0:625:c241:5690 with SMTP id y136-20020a62648e000000b00625c2415690mr89474pfb.13.1678855116072;
        Tue, 14 Mar 2023 21:38:36 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id x28-20020aa793bc000000b00593baab06dcsm2412363pff.198.2023.03.14.21.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 21:38:35 -0700 (PDT)
Date: Tue, 14 Mar 2023 21:38:35 -0700 (PDT)
X-Google-Original-Date: Tue, 14 Mar 2023 21:37:40 PDT (-0700)
Subject: Re: [PATCH v6 8/8] RISC-V: KVM: Expose Zicboz to the guest
In-Reply-To: <20230224162631.405473-9-ajones@ventanamicro.com>
CC: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
  devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
  Paul Walmsley <paul.walmsley@sifive.com>, sudip.mukherjee@codethink.co.uk, ben.dooks@codethink.co.uk,
  Atish Patra <atishp@rivosinc.com>, aou@eecs.berkeley.edu, krzysztof.kozlowski+dt@linaro.org, robh@kernel.org,
  jszhang@kernel.org, heiko@sntech.de, anup@brainfault.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ajones@ventanamicro.com, apatel@ventanamicro.com
Message-ID: <mhng-f27eaa3e-34e3-4843-abdb-4b17cbe24ddb@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_213838_295149_31170821 
X-CRM114-Status: GOOD (  19.02  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 24 Feb 2023 08:26:31 PST (-0800), ajones@ventanamicro.com wrote:
> Guests may use the cbo.zero instruction when the CPU has the Zicboz
> extension and the hypervisor sets henvcfg.CBZE.
>
> Add Zicboz support for KVM guests which may be enabled and
> disabled from KVM userspace using the ISA extension ONE_REG API.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Sorry, I guess I wasn't looking closely enough.  It's just a review, not 
an ack.

Anup: is it OK if this goes along with the others?

> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu.c             | 4 ++++
>  2 files changed, 5 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index c1a1bb0fa91c..e44c1e90eaa7 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -106,6 +106,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_SVINVAL,
>  	KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
>  	KVM_RISCV_ISA_EXT_ZICBOM,
> +	KVM_RISCV_ISA_EXT_ZICBOZ,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index e5126cefbc87..198ee86cad38 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -63,6 +63,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(SVPBMT),
>  	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
>  	KVM_ISA_EXT_ARR(ZICBOM),
> +	KVM_ISA_EXT_ARR(ZICBOZ),
>  };
>
>  static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
> @@ -865,6 +866,9 @@ static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
>  	if (riscv_isa_extension_available(isa, ZICBOM))
>  		henvcfg |= (ENVCFG_CBIE | ENVCFG_CBCFE);
>
> +	if (riscv_isa_extension_available(isa, ZICBOZ))
> +		henvcfg |= ENVCFG_CBZE;
> +
>  	csr_write(CSR_HENVCFG, henvcfg);
>  #ifdef CONFIG_32BIT
>  	csr_write(CSR_HENVCFGH, henvcfg >> 32);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
