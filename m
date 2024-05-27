Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A68FC25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 16:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ce6U/epgv46ftCZi/IUX/lnfDUrFv3nQrWVikjSXqdw=; b=u6sC1ougoORTce
	N1FQ7Rc6G0t+pbSSy72TsM4CnjgCsdSgs/LmUMpnd4decxYp1A8oKwUjMNTy3Ok0bJJQ16WMWwZKB
	vXbqLzmUTYBxfrVmrvkuDaQsuquSvmJL8MuP12CDURn20ko6Rfek4rczSpeO7zeB9sVGgMgeAhKzB
	G+yClYiTGg/T5rCQsn4btDgCHABALpk1MKXeBVJtF/D+w8OleXwoHASZgTFB9KlEEfswSr0zPGUf0
	slJJypXnLDws7kBYaVP6dQuvw7ZirTSCNflMeQEoAzoZBe1HJljUaHMM95treTxUd+/lwuUdKO62H
	Ixo7s0L8Sr0InbUcqMNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBdE2-0000000FrJZ-2WeZ;
	Mon, 27 May 2024 16:29:30 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBdDz-0000000FrIZ-2UtC
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 16:29:28 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-354ba5663c9so4718708f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 May 2024 09:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1716827366; x=1717432166; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DCdwiEKZsSLlzQmI564yzAeMM+d5MqZnvy70D5v6p6g=;
        b=D9mu0tWyPwJ2v/oteBc8IPy0IEAvXQv//LhSOudC/S7UYyhCyoLrnrnZMv7Jyd563f
         DZ7kauVG1340BAclGThM+QyFV7BHIPib4jCraQkH5G0BJ7d0Oi/BzEfZ4pVa27nG2kCa
         FMG281MjOgEEZYvKr5qDAY/ekwpjDT/ik8eUA0oCjzBdqt9bfiS+TxXji+LcWCGYNqNW
         GnZ1QppUvIZ/NlFo/sQ9pKmWIBDvg2VvkzEX4Bar5WrrqZZxF5uLFgMlEjgY7I4vwhyG
         MPBwWNtc5uR6sOmoZM3GB9712Bxtuln9mu1HM4uuQMDFyky3/UFjw5Y7meoGvnZ8lXDH
         J1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716827366; x=1717432166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCdwiEKZsSLlzQmI564yzAeMM+d5MqZnvy70D5v6p6g=;
        b=eJSPrq9SdgCNz/o45uP0dGC7onkoFInQCJIPZubKO7Sru5BhxHglti9nK+LQUpbDYD
         70UJT0bpJ6z//aGQBufOUuBfHixmcppeFrZGKM9nSuum4XvIEKuq7QcJny7YpTLzaQ4U
         v2fZ1TaKFkxAvQwSoUHnbn15VdJh2sp0xsI2fWmoc1M6KMA5Cx/FRbQoyRQIeODvjM8P
         e3XU9PuEtdBJ1XMZiWOYMt8xrlUUN5W7PJJWIIq9WVJ2mPO8YeWSxyHH4Ppm6mfm60eO
         QN2Zocv8T1ULL+BRwaGt/nb6rEKPx85Nwo/OohbfQavTXgEwrk0dKBGoArD9xF23ajv2
         in0w==
X-Gm-Message-State: AOJu0Yx8fxAbf7VRzKtxmRNPc2CejgpgOkAHOKI8cRNqu/VsIkRklQ08
	a0eOb2Wn2tQTkfajyY54a4KcTijKjJANyWTlqZC1hoF8olJJW+i2nzlnN/ThLRo=
X-Google-Smtp-Source: AGHT+IE/a37MX42XQNRb/+dniYNRx1NJyY5t2V95xUKst84x1kU49Lx+w+odCrcs8XgwmmBFVgQQoA==
X-Received: by 2002:a5d:420c:0:b0:354:f724:641d with SMTP id ffacd0b85a97d-355270489a7mr6855127f8f.42.1716827365576;
        Mon, 27 May 2024 09:29:25 -0700 (PDT)
Received: from localhost ([176.74.158.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a1c931csm9402469f8f.79.2024.05.27.09.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 09:29:25 -0700 (PDT)
Date: Mon, 27 May 2024 18:29:24 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, greentime.hu@sifive.com, vincent.chen@sifive.com, 
	cleger@rivosinc.com, alex@ghiti.fr, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v4 3/5] RISC-V: KVM: Add Svadu Extension Support for
 Guest/VM
Message-ID: <20240527-0a37c07cf34bbb0d4fb8067c@orel>
References: <20240524103307.2684-1-yongxuan.wang@sifive.com>
 <20240524103307.2684-4-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240524103307.2684-4-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_092927_659173_99A14089 
X-CRM114-Status: GOOD (  15.37  )
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

On Fri, May 24, 2024 at 06:33:03PM GMT, Yong-Xuan Wang wrote:
> We extend the KVM ISA extension ONE_REG interface to allow VMM tools to
> detect and enable Svadu extension for Guest/VM. The ADUE bit in henvcfg
> is cleared by default for backward-compatibility.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu_onereg.c      | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index a59a8448deea..bcf99264560d 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -167,6 +167,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZFA,
>  	KVM_RISCV_ISA_EXT_ZTSO,
>  	KVM_RISCV_ISA_EXT_ZACAS,
> +	KVM_RISCV_ISA_EXT_SVADU,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 994adc26db4b..4166665e215d 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -37,6 +37,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(SMSTATEEN),
>  	KVM_ISA_EXT_ARR(SSAIA),
>  	KVM_ISA_EXT_ARR(SSTC),
> +	KVM_ISA_EXT_ARR(SVADU),
>  	KVM_ISA_EXT_ARR(SVINVAL),
>  	KVM_ISA_EXT_ARR(SVNAPOT),
>  	KVM_ISA_EXT_ARR(SVPBMT),
> -- 
> 2.17.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
