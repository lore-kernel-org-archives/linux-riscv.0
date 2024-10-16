Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AB6D2A53F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 19:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AtJKdlK7oijVTcv4DQdLLyrl7bETsBxIwsy6sMO+LoI=; b=SwGqZxtdNoCem5
	dEz90f28MnfgAWc3aFh86v+S4RrRwYt65wQennR+iRicAYdzzT3lZIIxYd1/GK5w/fApqL08B8fYn
	bfjTevB6l6XShxEDxpffU8I7NYbSjK8cikVh7R77NOPllmmIbgsSyouKlsGZiFQtEI8sf6KivBmLv
	38TPTYtlBsPvaaSTzXSzis/BCi1NTUfb3TfDMyhBnZdav2xMwaiB10ITH0fml4YjPmeCpr+oDBiIi
	RUFkY5tkLJcUFGZXOS0G9gHrP7pul1IYF8DTTbXjVJwFU+r8fGiTdJ3TG14SFSbxQrp3RdjHIevnT
	PpSH3GuPh/yCoCTxURKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t19KL-0000000ClXk-0ShW;
	Wed, 16 Oct 2024 19:04:57 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t19JK-0000000ClNI-3dIk
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 19:03:56 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3a3aeb19ea2so1093145ab.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 12:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1729105433; x=1729710233; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxyFXAuH+mgf3dl67t38IiOCtsPnCcipqPsettp6piQ=;
        b=t4JEZwvCkQYPhLlFeqp+JgT4nkFU4/ESeMBw//T8DtDOSx+LnJZ6SGWmUKWuDOmAJU
         nI9dveu+ULDWEicFGgAoPU41fLyUvZOjD7Jf4J4uSgpEpW54vjv5x9/NhY+KrryWjvyo
         Ku+er3S7LmXUn8m4J/wvNLSyD2DEpYdzVBquvI2Vn7zfyUbu0YpAV//qMzekDHkBFYW0
         gHneGUe70sEC/qkFQjKkq7fsmKDVMgqQtmaoQ/CeFiInnxegRUwgqJRO6x+y6X+rKVQp
         UMA88d588fS2+kebruvV12kZV4zU4CTK82OOkryjR0aV0V5pN8TOsYnyZwSbJv95jZEd
         FUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729105433; x=1729710233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CxyFXAuH+mgf3dl67t38IiOCtsPnCcipqPsettp6piQ=;
        b=DeQiAJ67poggg6qdiJVke4EOT/6WKocYRFF6Eum7640TOvuQ7JywBqh6b9JVJaASfy
         GbgZlEnky/iLHpL3DrpculxYUp37JI2VncqBHpSKLC2orhKNW3a1txKmSRBe0Kgaaq2d
         IIAuVtVtnSx1li5apaamW2fQ9+Xk5XZY02HNaL7PLEdrqCZQxiiHwu2imb49BET2nIv7
         vWhjdX1DwDZAXtd00MuBcoS7j/Y7q8xH+/T8tWcl/zbBSGx4/RSThpEkdpiLxfH7zjRh
         agfoDJeoRvaVhOCvmRHTlmTvo8wjhVdDV1uWH7JI0l2SKY3WAzELQ3l5mVfr2F8xDda4
         1now==
X-Forwarded-Encrypted: i=1; AJvYcCW80zXCIF4apPQw0pcB4I4uQGazSGE/yhf8ZzzOiP7V0cHHsvxMyzRjhAn6BHnlgMlSd8de8HhibnH49g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4VkNrA2c7gOlj6pd5Yya0ObG3+N0R+j4PMTBLMWj1m78GGnnH
	hyKgSr9FM5Ibb4JO8rm0knNOkqZGEd/U2oLQFrz5zuN/+4ImFFZYbGjEuiZNdQ0=
X-Google-Smtp-Source: AGHT+IFN4BQomLzr5kcRH/fIUJNMPAHP7KDnpJqCP2efyNjSfr3q1aTjpUQkcj+hd8dhGj91RZQEZw==
X-Received: by 2002:a05:6e02:1c21:b0:3a0:bc39:2d72 with SMTP id e9e14a558f8ab-3a3dc4cc8a8mr49777475ab.12.1729105433066;
        Wed, 16 Oct 2024 12:03:53 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea9c6c403csm3651632a12.35.2024.10.16.12.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 12:03:52 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: apatel@ventanamicro.com
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [01/13] RISC-V: KVM: Order the object files alphabetically
Date: Wed, 16 Oct 2024 12:03:49 -0700
Message-Id: <20241016190349.640640-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719160913.342027-2-apatel@ventanamicro.com>
References: 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_120355_184374_5DB73897 
X-CRM114-Status: GOOD (  10.58  )
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

> Order the object files alphabetically in the Makefile so that
> it is very predictable inserting new object files in the future.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/Makefile | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
> index c2cacfbc06a0..c1eac0d093de 100644
> --- a/arch/riscv/kvm/Makefile
> +++ b/arch/riscv/kvm/Makefile
> @@ -9,27 +9,29 @@ include $(srctree)/virt/kvm/Makefile.kvm
>  
>  obj-$(CONFIG_KVM) += kvm.o
>  
> +# Ordered alphabetically
> +kvm-y += aia.o
> +kvm-y += aia_aplic.o
> +kvm-y += aia_device.o
> +kvm-y += aia_imsic.o
>  kvm-y += main.o
> -kvm-y += vm.o
> -kvm-y += vmid.o
> -kvm-y += tlb.o
>  kvm-y += mmu.o
> +kvm-y += tlb.o
>  kvm-y += vcpu.o
>  kvm-y += vcpu_exit.o
>  kvm-y += vcpu_fp.o
> -kvm-y += vcpu_vector.o
>  kvm-y += vcpu_insn.o
>  kvm-y += vcpu_onereg.o
> -kvm-y += vcpu_switch.o
> +kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o
>  kvm-y += vcpu_sbi.o
> -kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_v01.o
>  kvm-y += vcpu_sbi_base.o
> -kvm-y += vcpu_sbi_replace.o
>  kvm-y += vcpu_sbi_hsm.o
> +kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_sbi_pmu.o
> +kvm-y += vcpu_sbi_replace.o
>  kvm-y += vcpu_sbi_sta.o
> +kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_v01.o
> +kvm-y += vcpu_switch.o
>  kvm-y += vcpu_timer.o
> -kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o vcpu_sbi_pmu.o
> -kvm-y += aia.o
> -kvm-y += aia_device.o
> -kvm-y += aia_aplic.o
> -kvm-y += aia_imsic.o
> +kvm-y += vcpu_vector.o
> +kvm-y += vm.o
> +kvm-y += vmid.o
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
