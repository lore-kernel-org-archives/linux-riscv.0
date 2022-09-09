Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0923FECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 18:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VZq44ngLBh5Vxb9BvX49XqX4v31/jFAFF1l5P5XXO2M=; b=w/mVAUuVSLvXW1
	BD1oZZFplRIfIMTFMrF6lU6g8gCSOJM+mSKGTyUg3LKwEKIrb1psCMW7clZKuqd7hIQpEfAWKeVwE
	XzS844YFN4tBEj+vKSroZVSK6DQdkGM//BwV4AY3fkegZ12esSoDM8pLbcKx1PQeXNIdMByv5/EgY
	plue/U7tq0miTS6WsY7dJeDKcS2Q3WUbhPZMX0hkylKER/Qys3fcZ4EAh5mUJLQQW9LmgDoBuucE5
	qy1psE0HSXLQj0CDPBiJ6vbsK00uF/YN42dbsQlTRKUliZAFf3ksZ2+lrqDy86NDLyzos2VIUSdNp
	8c5qtBAq3iVo7LDmk3LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWisf-001I8R-GK; Fri, 09 Sep 2022 18:37:33 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWisc-001Hx3-3S
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 18:37:31 +0000
Received: by mail-il1-x12d.google.com with SMTP id m16so1259050ilg.3
        for <linux-riscv@lists.infradead.org>; Fri, 09 Sep 2022 11:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=kghJ1b085rNUYsmH/YICo8BzBq1CQoiPzLrByiYFnKU=;
        b=mLGXeRORx88c+OrK4h6NCtEU4TayydrwoFyVOQVJVd9avpgj8t5d7pn6U0c1OnQd5M
         FPrCGea/ni6oshhn1Wj0OIEFBfMk5hiBC2nhu6Ot2rAtFlMneYCdBrHKKVPfP0zCB2a+
         BKioIOr0GgdX0WgexE7aTPi9Badk6EWZU/QpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=kghJ1b085rNUYsmH/YICo8BzBq1CQoiPzLrByiYFnKU=;
        b=1Q0kyuqjjAd0FwKTBNu5Pdqy/lxx1wiqpHmomvSiKbIKJR1oviM7/FWp5yHcwRS6EK
         /sTfZopEOyl8ICFBTQ6u2yYf3B2zobXI4QGMMesoLEfmdbXMb1BBaHoK96F5cBKcbuQZ
         iHUGCuY+IRhgx+8FvGXt/GvqED/Q1TQ/I7cD5sS61DB/HMogfhnw8ya1+QsxcuQ7M8Sx
         CThdFRMwrVNL7IBGiibodz9wCGQjIcrv5REqWgIBh5rWD37n0yHuImbo2uSLa8DJz8PC
         68gua1hoBdhi5MJ3sRiF9V6Z7e8FO2PzHS8tyvWKgZr9LF2RzGskNnb7t163opu61RDI
         6/jA==
X-Gm-Message-State: ACgBeo1FqaKrO0l/dE5i2kPLXyLaVzDBfPKz1DsyBjTMpqM+vElJifKw
	G8yfrGZckaF860x+uftS9Q9SlB2IQct9CTw3wy0G
X-Google-Smtp-Source: AA6agR6sshRKqLx6mk1YA9/bV7RToRdp9jAavsoFHIdNPzXaT1DlCL3rwgnKevbYIp2C6T+dmxhHJoDFlHXXMAhqLVE=
X-Received: by 2002:a05:6e02:2166:b0:2eb:4c28:50d6 with SMTP id
 s6-20020a056e02216600b002eb4c2850d6mr4704488ilv.213.1662748647553; Fri, 09
 Sep 2022 11:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220909144400.1114485-1-ajones@ventanamicro.com> <20220909144400.1114485-3-ajones@ventanamicro.com>
In-Reply-To: <20220909144400.1114485-3-ajones@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 9 Sep 2022 11:37:16 -0700
Message-ID: <CAOnJCU+meVE_A=ki1bTMNCf-CHMwCQvTn-0aaHydREAH=OdcFw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] RISC-V: KVM: Expose Zicbom to the guest
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_113730_477638_6CC5E9AD 
X-CRM114-Status: GOOD (  18.81  )
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

On Fri, Sep 9, 2022 at 7:44 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> Guests may use the cbo.inval,clean,flush instructions when the
> CPU has the Zicbom extension and the hypervisor sets henvcfg.CBIE
> (for cbo.inval) and henvcfg.CBCFE (for cbo.clean,flush).
>
> Add Zicbom support for KVM guests which may be enabled and
> disabled from KVM userspace using the ISA extension ONE_REG API.
>
> Also opportunistically switch the other isa extension checks in
> kvm_riscv_vcpu_update_config() to riscv_isa_extension_available().
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu.c             | 9 +++++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index b9a4cf36be4b..ed37a4a6e5cf 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -99,6 +99,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>         KVM_RISCV_ISA_EXT_M,
>         KVM_RISCV_ISA_EXT_SVPBMT,
>         KVM_RISCV_ISA_EXT_SSTC,
> +       KVM_RISCV_ISA_EXT_ZICBOM,
>         KVM_RISCV_ISA_EXT_MAX,
>  };
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 2ef33d5d94d1..74d1532b26c0 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -54,6 +54,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>         RISCV_ISA_EXT_m,
>         RISCV_ISA_EXT_SVPBMT,
>         RISCV_ISA_EXT_SSTC,
> +       RISCV_ISA_EXT_ZICBOM,
>  };
>
>  static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
> @@ -792,11 +793,15 @@ static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
>  {
>         u64 henvcfg = 0;
>
> -       if (__riscv_isa_extension_available(isa, RISCV_ISA_EXT_SVPBMT))
> +       if (riscv_isa_extension_available(isa, SVPBMT))
>                 henvcfg |= ENVCFG_PBMTE;
>
> -       if (__riscv_isa_extension_available(isa, RISCV_ISA_EXT_SSTC))
> +       if (riscv_isa_extension_available(isa, SSTC))
>                 henvcfg |= ENVCFG_STCE;
> +

Ideally, these should be in a separate patch.

> +       if (riscv_isa_extension_available(isa, ZICBOM))
> +               henvcfg |= (ENVCFG_CBIE | ENVCFG_CBCFE);
> +
>         csr_write(CSR_HENVCFG, henvcfg);
>  #ifdef CONFIG_32BIT
>         csr_write(CSR_HENVCFGH, henvcfg >> 32);
> --
> 2.37.2
>

Otherwise, LGTM.
Reviewed-by: Atish Patra <atishp@rivosinc.com>
-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
