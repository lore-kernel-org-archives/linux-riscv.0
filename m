Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28C8C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Nov 2022 05:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TeErUE+1UrUltXSrLyGHNTaOlVyDjDR+4yUgOd/04XY=; b=DH1vxwQYt47xWG
	1IO50XqxpspXhyWFMvpr3jsLruUYQ2sLLnA1BCkT1hfZWOvDnPOwtyFuGhX28p9gdwCoGQcY2Bexp
	vx3ro/UV8GwEA/kDibikb8wy3Im1EqOKyH/oLJ16RoOtlbet5TebfWmV+1UE3xOlfz6g5aT2XIFum
	7NTnAh6tydW4bTuctaMT8FWCZp2qWFvexnR1RPl/wKXiRyHAHQX4a8KjV7rHcpaQbUKdQBjypu2vx
	o58PMWUGcNCTVu0vvIspl4HKib5RMNgmczYEIkA3aGdVMXlbLWakiXZHHF/z9DZ4wnoEOGNVAdGjq
	+irr7hkTmLx0SYajKsFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozANJ-009hXB-2k; Sun, 27 Nov 2022 05:38:45 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozANB-009hTd-DC
	for linux-riscv@lists.infradead.org; Sun, 27 Nov 2022 05:38:43 +0000
Received: by mail-ed1-x52d.google.com with SMTP id b8so11386070edf.11
        for <linux-riscv@lists.infradead.org>; Sat, 26 Nov 2022 21:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6Sk0VZftOnbS2klODrlGuurP9FIIYoaRZgNZhzo41rA=;
        b=iFHSV015zpdjvPwTGbYaH/xJ42Nn3jjQ4pkU6OvfcZgXcHWOuUmpGohzlcspZoPhER
         y7F37y39RlGTlrr6Dp9OQfrjR0zX9dIc3JcYDcsT/F9zwxSPlDDBRf68VC0lDXJghdW/
         3miVwzc/u2mMMD9aXBGIhb3Uxh0wOu0Of/p85aGBTy13YKSHyxcYv/lPzn77NQ3e3wa/
         3KroWatT3y6ukkuv5A+qt2YaHsoa5ETibX0EBYIX0IWc6AFt0dDWcQmLmAgB8EFSDZX0
         q7FWKG+thZtu8oHzOhf3PEOItCIUyuprmIWIN6GnoppQn1Zh0K9ifNWN/AdhtZyq10C/
         e9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Sk0VZftOnbS2klODrlGuurP9FIIYoaRZgNZhzo41rA=;
        b=LWW3w8vEa+GoZZfdfv3BS/JOHhjtp1ksxBLei7Vkg4azEh93ZmOCqlZEfwcT6GIZVQ
         4FJPRKilnh+ZVp7/gYMpyT/VaWUiURTxSeTNDjAOrJ249BrI6TvPNKymfqOJG3X5Mziw
         wRhKRAEJwpe1Cenp1XvfCHUaIJn0jU3liFldZnXfCyQbLLI7Z9GQxtNxro7eC+l+nNhE
         Qlrc4qc2NWLA8MqtQ1WBXgCYiL64dRwrkpzRNdaLRiVsI2CktukSvLBheWEs6gXv8ByX
         Qnd95Wc0JRJv5UHoAlL7LccSlmhkffHGOS6Tew7tKrhWnYIhf8wfovOLE2jjME2BPnIK
         U7kA==
X-Gm-Message-State: ANoB5plLDotrrPpCRCF7771FAgLtdctsPLPtRkIEsDeqMGaY024RYgJ3
	1DoaHY2atd33sMN4ULxHyLoIjkGY6hrpJZBZwXoSRg==
X-Google-Smtp-Source: AA0mqf4IWKXwr7MT6OKkb4aNl9MjtvxXLaNr1EySwl/Muwlg0okYkBFTVB5P3Rv1embmJ6RzJYMGRbuCOvhhvhjKhMo=
X-Received: by 2002:a05:6402:1d87:b0:459:41fa:8e07 with SMTP id
 dk7-20020a0564021d8700b0045941fa8e07mr25277806edb.140.1669527515512; Sat, 26
 Nov 2022 21:38:35 -0800 (PST)
MIME-Version: 1.0
References: <20221027130247.31634-1-ajones@ventanamicro.com> <20221027130247.31634-7-ajones@ventanamicro.com>
In-Reply-To: <20221027130247.31634-7-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 27 Nov 2022 11:08:24 +0530
Message-ID: <CAAhSdy2i=vytPkF5B7aommPfwTvLwYEgHKDoNjsLdHuF9bSn8A@mail.gmail.com>
Subject: Re: [PATCH 6/9] RISC-V: KVM: Expose Zicboz to the guest
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, 
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Atish Patra <atishp@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_213841_813987_21AD1662 
X-CRM114-Status: GOOD (  16.77  )
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

On Thu, Oct 27, 2022 at 6:34 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> Guests may use the cbo.zero instruction when the CPU has the Zicboz
> extension and the hypervisor sets henvcfg.CBZE.
>
> Add Zicboz support for KVM guests which may be enabled and
> disabled from KVM userspace using the ISA extension ONE_REG API.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu.c             | 4 ++++
>  2 files changed, 5 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 4bbf55cb2b70..8dc21ceee7aa 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -103,6 +103,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>         KVM_RISCV_ISA_EXT_SVINVAL,
>         KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
>         KVM_RISCV_ISA_EXT_ZICBOM,
> +       KVM_RISCV_ISA_EXT_ZICBOZ,
>         KVM_RISCV_ISA_EXT_MAX,
>  };
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 18a739070b51..7758faec590a 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -62,6 +62,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>         KVM_ISA_EXT_ARR(SVPBMT),
>         KVM_ISA_EXT_ARR(ZIHINTPAUSE),
>         KVM_ISA_EXT_ARR(ZICBOM),
> +       KVM_ISA_EXT_ARR(ZICBOZ),
>  };
>
>  static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
> @@ -821,6 +822,9 @@ static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
>         if (riscv_isa_extension_available(isa, ZICBOM))
>                 henvcfg |= (ENVCFG_CBIE | ENVCFG_CBCFE);
>
> +       if (riscv_isa_extension_available(isa, ZICBOZ))
> +               henvcfg |= ENVCFG_CBZE;
> +
>         csr_write(CSR_HENVCFG, henvcfg);
>  #ifdef CONFIG_32BIT
>         csr_write(CSR_HENVCFGH, henvcfg >> 32);
> --
> 2.37.3
>
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
