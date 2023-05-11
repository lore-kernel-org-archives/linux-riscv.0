Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B97BC7EE22
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 00:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=GgMSQTkiTYEREwrLMHtfHas3PoBLBDJa2sssk7M2Udk=; b=nx4lVRvK1mz0DNvpYk3tLl+ihn
	uzby3EEvjxOtFyGb64HHXG98GBSyQ3HrU4zfMf6TwFoHjTo27h496ZdMVgSMyFPqpBrlkxKL4Kkuv
	IXzSNBts5YnOmyHPktL4aNKybDN5XI+uvr7YtQxNAR3/leQNam6G4aau7gE564A8RcmSh2BNnYMBP
	dpVNN6o6AYClD4HEP83cRICjO61pKSFmUdOhfXotwV/WOSmd8aWjHzrAh6ZVi69UW3X+u5NcqRRfx
	lE8AF6zgqtpg9C2/DwcohoJWcdIFUSSPKZMqXUulwK0fQpK/lruuQNtlXPI0hsa56vNJ0CI5TOFBQ
	kM6uSm7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxGDj-00AQXD-2f;
	Fri, 12 May 2023 00:01:15 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxFDE-00AGbA-2p
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 22:56:42 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6439bbc93b6so6400722b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 15:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1683845799; x=1686437799;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/EBpBOm5vo3q71SlWRs0MuC5Apo6vy0eW96vyd8toI=;
        b=mQO5zt9Ba5t9UkAThyuSS9r90cQ4QX3N4N7mLDQfIstKGZopIVWqUnWtMG7NxP1CU4
         OvhFPZdx6fORueaQpi1tD2Z3I1ilpQfmPX/mdD70knOX9IrfHvLz9nHY35B3eh+rIwxg
         LXv/uRbhoMqvkBmoRjoMpQw476MFY1UI2ncl515LU5vTL6cPrseubJJgLQp6TgFIpnlK
         aFL/RxwLVtHA1fyTJHvfJo9US1/BheGvTKHm+ff0UwFFUHWHz2TRs4juEGVR5vnhHTrt
         o9OKL3CbKqFoIu7HH8OBKcH8khvJJptm+2C4VRA3a5nX6SBjSPUuzfRrQPQtts3ZnPt9
         zsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683845799; x=1686437799;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/EBpBOm5vo3q71SlWRs0MuC5Apo6vy0eW96vyd8toI=;
        b=T6Qoe2OUqbK5iGwuzSq9sVMeuhvEWlreXyTgyESPS0o63j1+eFZXoxTlZNO+OvBGpH
         Np5EOOdeLeY+btmiEUwC7SQYAX/bf3sunDy5LnZo/YtOLu5lbXOUcxfWl0DbKxSmGO7F
         wFsl+NAmPk8KJsw5lAwwP6//RmC8ugT5rbsJXUECwObdeS5JUiFWR5BN2Ywz40dwmCrW
         KFn+nTe/8YwIKWsEQOVRDyR6KEDojfQgGoKAA65RXmJD2GZc6uLmbWt95w3Btv9VuQu9
         NhRCJD+93tBjWO5tZRDDke65lu3YU0JptZij/N62G7LbY15wffp9WYhIj2caBt0rtjx8
         IA8A==
X-Gm-Message-State: AC+VfDx/JUTRUhMJUkLqfxBT8A7GAwiq05ik61ZDseelC7ROWEZ4r5Pq
	RqTRpzufzsKG9a61ecsFpV7+a1SE6rDA39PCM7A=
X-Google-Smtp-Source: ACHHUZ5dbn7gAu3zCZgMg81mlwRuznXrjNVO/EHp9Yuy6xgQdH4qVWUmx+G8s/NoSxGa91AL2ZRLaQ==
X-Received: by 2002:a05:6a20:7d9c:b0:100:c125:5c93 with SMTP id v28-20020a056a207d9c00b00100c1255c93mr20011274pzj.21.1683845798797;
        Thu, 11 May 2023 15:56:38 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id i2-20020aa78b42000000b006352a6d56ebsm5805516pfd.119.2023.05.11.15.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 15:56:38 -0700 (PDT)
Date: Thu, 11 May 2023 15:56:38 -0700 (PDT)
X-Google-Original-Date: Thu, 11 May 2023 15:47:41 PDT (-0700)
Subject: Re: [PATCH -next v19 05/24] riscv: Clear vector regfile on bootup
In-Reply-To: <20230509103033.11285-6-andy.chiu@sifive.com>
CC: linux-riscv@lists.infradead.org, anup@brainfault.org, atishp@atishpatra.org,
  kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, Vineet Gupta <vineetg@rivosinc.com>,
  greentime.hu@sifive.com, guoren@linux.alibaba.com, andy.chiu@sifive.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, heiko.stuebner@vrull.eu, vincent.chen@sifive.com,
  Conor Dooley <conor.dooley@microchip.com>, guoren@kernel.org, alex@ghiti.fr, masahiroy@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: andy.chiu@sifive.com
Message-ID: <mhng-6740b2a0-90ed-49c7-8908-87d55dbda354@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_155640_943368_B8EB95D0 
X-CRM114-Status: GOOD (  16.62  )
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

On Tue, 09 May 2023 03:30:14 PDT (-0700), andy.chiu@sifive.com wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>
> clear vector registers on boot if kernel supports V.
>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/kernel/head.S | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 4bf6c449d78b..3fd6a4bd9c3e 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -392,7 +392,7 @@ ENTRY(reset_regs)
>  #ifdef CONFIG_FPU
>  	csrr	t0, CSR_MISA
>  	andi	t0, t0, (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D)
> -	beqz	t0, .Lreset_regs_done
> +	beqz	t0, .Lreset_regs_done_fpu
>
>  	li	t1, SR_FS
>  	csrs	CSR_STATUS, t1
> @@ -430,8 +430,31 @@ ENTRY(reset_regs)
>  	fmv.s.x	f31, zero
>  	csrw	fcsr, 0
>  	/* note that the caller must clear SR_FS */
> +.Lreset_regs_done_fpu:
>  #endif /* CONFIG_FPU */
> -.Lreset_regs_done:
> +
> +#ifdef CONFIG_RISCV_ISA_V
> +	csrr	t0, CSR_MISA
> +	li	t1, COMPAT_HWCAP_ISA_V
> +	and	t0, t0, t1
> +	beqz	t0, .Lreset_regs_done_vector
> +
> +	/*
> +	 * Clear vector registers and reset vcsr
> +	 * VLMAX has a defined value, VLEN is a constant,
> +	 * and this form of vsetvli is defined to set vl to VLMAX.
> +	 */
> +	li	t1, SR_VS
> +	csrs	CSR_STATUS, t1
> +	csrs	CSR_VCSR, x0
> +	vsetvli t1, x0, e8, m8, ta, ma
> +	vmv.v.i v0, 0
> +	vmv.v.i v8, 0
> +	vmv.v.i v16, 0
> +	vmv.v.i v24, 0
> +	/* note that the caller must clear SR_VS */
> +.Lreset_regs_done_vector:
> +#endif /* CONFIG_RISCV_ISA_V */
>  	ret
>  END(reset_regs)
>  #endif /* CONFIG_RISCV_M_MODE */

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
