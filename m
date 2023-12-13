Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076B1C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 17:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1co0vbCpZpdsENtVPuQ/7kvJ74eoTQX0+hTfb7OZ3c0=; b=LvOWCOy/WoeVOf
	PDJ11VtnvCwyEJVemEY8gI8uYSn93ystqVnJ7pzH8lqnTZI39HjgUnukUDrbp/WS2/EhguolIJ/eS
	tPCkC9Ldf+/2+tclC9zohlGsJoA447LyNhZd21Jm32Okwcht0rdLgKfoDXvxvLW5qQhnu9rZRG+HL
	PCB5z8AUtuOVD07F1NMv8qcEk7VptkxzH2UQMV1dqHR4yNf1TKF4cQmpTNf+gHXjh/VGnQIiDVnMs
	BxZItm5ZWw0CT1WqSVsvNX9Y60eL6mKQqClc8ZAZnklValHxtBU/K8pEN/5vD3amoyOSLI0+vE5X6
	nNGRGM0eyhlTlH1+zQCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSr6-00FZ3f-0I;
	Wed, 13 Dec 2023 17:17:08 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSr3-00FZ1g-02
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 17:17:06 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3333fbbeab9so6113534f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 09:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702487820; x=1703092620; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C506FxcdrW3cyYw/Gu8XEv6qnEjyNrzFxfEz8PrYaS0=;
        b=S5LIzSB/4cUlKWu89nNM4G011TLTA+gWReRd19vBNjem8nwnXgg5UvUDhVU7GTGEZp
         U03lecYCU/YNRfUhvknm291FdVNLYcT0aVysXHRbNRiPgOZqrnn6SHieGj9/uI9kicGZ
         5l4f/660bQBmQ5kjdmLko1L9PytDkP21kMPkRJ5lIT/XTLQxr7BhU131ZE7gwP+Zxq+S
         Uf+XkPlLeMuSMsMV7DB1TB+HcedVkDDK53WH6Bl6VW0rf4jQLHBN3SlhB87+L1T7+e/E
         xkrVCyO7bTwixHtpKKO+wGGH7bxUAP27l8NN1Acf7LNZf5waxX2VWvvfJadZpqs3Ogr/
         wMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702487820; x=1703092620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C506FxcdrW3cyYw/Gu8XEv6qnEjyNrzFxfEz8PrYaS0=;
        b=iMAtbiqyIXy2kp3/LHn5lubeyMRY8FEym1TmRUfsoP5m0xx2EjR3UGVLHaiBfwrTAq
         YWFuz0WG92Uy2WWE6zccYi+afOrkEWGX7N4cMbruvr4rhGGwaTZxH6bdYOxKlrYzqwCc
         BBGoSNrtKp7KCGyYJyS0hranFIsKr94br2ech40TRVvH/smtaa9VhDOE86N0hQm0tS80
         O7l+8wd51fnBqqfYiLa+EQuPp0y0j/SmpTsFMoClrcTsbXV3lhVQm1BKMSvbq9cUSUE1
         E5kNS6u98lQ5wyhdVE4ZmDbUQsY2Ej/cSox4oesE7VticJX0My9+4rPPmE0YHNSmchEa
         +gww==
X-Gm-Message-State: AOJu0Ywtph2OYOgLKdDz4D5Xrs8npS8+ihhnD1rZeaQf2Z8ZZ63EBDj9
	5/JeONwTeSF0XQCdwQL+S1ZvgQ==
X-Google-Smtp-Source: AGHT+IEVDrfNO7CiPC4KOQpU3GVq/lmfkGprbr9y6hJhwCs4R3hB+0wxmUeWY8FRM2GIz0IX65tHbA==
X-Received: by 2002:a5d:4fc5:0:b0:336:3749:83b9 with SMTP id h5-20020a5d4fc5000000b00336374983b9mr797373wrw.108.1702487820605;
        Wed, 13 Dec 2023 09:17:00 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id o8-20020a5d4a88000000b00334b302e97fsm13746137wrq.96.2023.12.13.09.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 09:17:00 -0800 (PST)
Date: Wed, 13 Dec 2023 18:16:59 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 02/15] RISC-V: KVM: Allow Zbc extension for Guest/VM
Message-ID: <20231213-73671e24dacd8ae821943638@orel>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
 <20231128145357.413321-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231128145357.413321-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_091705_047301_F795AA64 
X-CRM114-Status: GOOD (  14.13  )
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

On Tue, Nov 28, 2023 at 08:23:44PM +0530, Anup Patel wrote:
> We extend the KVM ISA extension ONE_REG interface to allow KVM
> user space to detect and enable Zbc extension for Guest/VM.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu_onereg.c      | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 60d3b21dead7..518b368b41e5 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -139,6 +139,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZIHPM,
>  	KVM_RISCV_ISA_EXT_SMSTATEEN,
>  	KVM_RISCV_ISA_EXT_ZICOND,
> +	KVM_RISCV_ISA_EXT_ZBC,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index f8c9fa0c03c5..f789517c9fae 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -42,6 +42,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(SVPBMT),
>  	KVM_ISA_EXT_ARR(ZBA),
>  	KVM_ISA_EXT_ARR(ZBB),
> +	KVM_ISA_EXT_ARR(ZBC),
>  	KVM_ISA_EXT_ARR(ZBS),
>  	KVM_ISA_EXT_ARR(ZICBOM),
>  	KVM_ISA_EXT_ARR(ZICBOZ),
> @@ -92,6 +93,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_SVNAPOT:
>  	case KVM_RISCV_ISA_EXT_ZBA:
>  	case KVM_RISCV_ISA_EXT_ZBB:
> +	case KVM_RISCV_ISA_EXT_ZBC:
>  	case KVM_RISCV_ISA_EXT_ZBS:
>  	case KVM_RISCV_ISA_EXT_ZICNTR:
>  	case KVM_RISCV_ISA_EXT_ZICOND:
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
