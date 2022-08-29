Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA615ECAAD4
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 08:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NR2l95HkdVCz3fBNAqlZ2gH0xS71HWoqPeiFzpI/PY4=; b=fGab8oQwiv1AC2
	m4NMbVNQB+7vNGkF6o+rm/HIQmj0Dc5yWjmcUcvHEk+9mM4pmpmDfvqCPdvDh/X4Y+Ztjrqhi+r0b
	LoG53dEr8sH2uN6veVrHaod3vJjRj4IuvG/os0IyGS7c2VfekKoajiV+weuX5CD6lbp04T7qJC7cd
	SYoLZKTNhdU9+s2WaqUuP53wL2itv2sm+POiieqGB07Gpt0wKEUUGjpNG4YaBE8SiDm4Z06R05I0Z
	m8OCmoptgY32KlRjjvIOt2gUenPfTN/mUfxjg051LMmYk7m+isabx5Go9mnBGb3VaVBoSedkdzEAJ
	lIl9lGrZmHpoCKnRO0uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSaO8-006Lrt-Jk; Mon, 29 Aug 2022 08:44:56 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSaNu-006Lhl-IS
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 08:44:46 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-33dc31f25f9so177828527b3.11
        for <linux-riscv@lists.infradead.org>; Mon, 29 Aug 2022 01:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=1yW+bhE9+ZFac5QeY281cS30MjpG8faRBPP5xaLH1ik=;
        b=QlgzppbUe2lymOGkvPwg+0AeCbLuxdihrHKCrgRIrwnUqdBLm3t1ZAIk9uHBYcOp31
         BDz+A1fB2qoonPf0GNlPTKEPz3qHg+jPB6dzaYaAE9tb0pB1ZCFmQqEA0LNVnETv+eMT
         1MVrXM9mJ1LAmiVlGA2pcq/kVdtRstHVexIUxFcOkg+0IlnCxYxlLmrKMHStVLNZEmki
         7v8h3YEQh00wLEwXVtKA8sf3ndOUVgzIaFLrN6RTrLTU7eoGaDs0jioDlkOpMK1fc8jS
         AH9F9/9TLDjVIFImCoSerqcbu5gBtWrMw9hgoUVFCScD8zHJZFFIYYbf8iLMPqs63pgk
         miMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=1yW+bhE9+ZFac5QeY281cS30MjpG8faRBPP5xaLH1ik=;
        b=T2/tI9HCoMUYn+DMXqM6Ofh9zGBc1ZfjeiPVjyDzBoCmGIZ8TsWEqPTyl2eAvyOxhp
         Eq9gNocE+DL6N6TEVsQzXeaKn1olKm4EqzgK8I9iYph76MiQjnB5+s6qmnl5qn8dL332
         4BYZYKMX131QsTbtaHZYLSBMYEaYYGtyZiTHarEzorgM7futFO9QLpR2eJBSVxpVVLIt
         5R4vVyYBkYfWtI/krzx0ijE0zIefZtEx34P5PJTJ0dGBAElcqb6+ec/heEuL+76mBSmA
         7PFbNP2jnfvmqAPQeVklnCo2Q1g2QEE6Qg0Jo+lAx02UjF/x2Qru9PvSeno+SthIO0x2
         3Ucg==
X-Gm-Message-State: ACgBeo37iJrThJksPte2x5iazThAl5nswvIH3U9aYXo3Yq3x8qed537s
	nS+Mc6WpiXTRpbCf6via7OcjtcIirVRcqY4R5ZE0YI3wjTA=
X-Google-Smtp-Source: AA6agR6xQlUeyzZ565/n3/dG5B76qdPOm3hNh3tVEJe93vgFGTVmrP1dbEMeHGNNG+po4+lFLfdz+JltfSHm/Besd1Q=
X-Received: by 2002:a25:234a:0:b0:696:435f:df06 with SMTP id
 j71-20020a25234a000000b00696435fdf06mr7510246ybj.180.1661762681311; Mon, 29
 Aug 2022 01:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220819140250.3892995-1-ajones@ventanamicro.com> <20220819140250.3892995-5-ajones@ventanamicro.com>
In-Reply-To: <20220819140250.3892995-5-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 29 Aug 2022 14:14:29 +0530
Message-ID: <CAAhSdy1W4fxNtyF5pqi3Riv3bXv3v+6t7cdf8z_3YGGB7xBEEQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] riscv: KVM: Apply insn-def to hlv encodings
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, mchitale@ventanamicro.com, heiko@sntech.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_014442_764648_27D3DBA3 
X-CRM114-Status: GOOD (  14.48  )
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

On Fri, Aug 19, 2022 at 7:32 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> Introduce hlv instruction encodings and apply them to KVM's use.
> We're careful not to introduce hlv.d to 32-bit builds. Indeed,
> we ensure the build fails if someone tries to use it.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/insn-def.h | 14 ++++++++++++++
>  arch/riscv/kvm/vcpu_exit.c        | 29 +++++------------------------
>  2 files changed, 19 insertions(+), 24 deletions(-)
>
> diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> index cd1c0d365f47..c66d5745c5b4 100644
> --- a/arch/riscv/include/asm/insn-def.h
> +++ b/arch/riscv/include/asm/insn-def.h
> @@ -87,4 +87,18 @@
>  #define HFENCE_GVMA(gaddr, vmid)       \
>         INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(49), RD(0), gaddr, vmid)
>
> +#define HLVX_HU(dest, addr)    \
> +       INSN_R(OPCODE_SYSTEM, FUNC3(4), FUNC7(50), dest, addr, RS2(3))
> +
> +#define HLV_W(dest, addr)      \
> +       INSN_R(OPCODE_SYSTEM, FUNC3(4), FUNC7(52), dest, addr, RS2(0))
> +
> +#ifdef CONFIG_64BIT
> +#define HLV_D(dest, addr)      \
> +       INSN_R(OPCODE_SYSTEM, FUNC3(4), FUNC7(54), dest, addr, RS2(0))
> +#else
> +#define HLV_D(dest, addr)      \
> +       __ASM_STR(.error "hlv.d requires 64-bit support")
> +#endif
> +
>  #endif /* __ASM_INSN_DEF_H */
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index d5c36386878a..9cb075e72799 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -8,6 +8,7 @@
>
>  #include <linux/kvm_host.h>
>  #include <asm/csr.h>
> +#include <asm/insn-def.h>
>
>  static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
>                              struct kvm_cpu_trap *trap)
> @@ -82,22 +83,12 @@ unsigned long kvm_riscv_vcpu_unpriv_read(struct kvm_vcpu *vcpu,
>                         ".option push\n"
>                         ".option norvc\n"
>                         "add %[ttmp], %[taddr], 0\n"
> -                       /*
> -                        * HLVX.HU %[val], (%[addr])
> -                        * HLVX.HU t0, (t2)
> -                        * 0110010 00011 00111 100 00101 1110011
> -                        */
> -                       ".word 0x6433c2f3\n"
> +                       HLVX_HU("%[val]", "%[addr]")
>                         "andi %[tmp], %[val], 3\n"
>                         "addi %[tmp], %[tmp], -3\n"
>                         "bne %[tmp], zero, 2f\n"
>                         "addi %[addr], %[addr], 2\n"
> -                       /*
> -                        * HLVX.HU %[tmp], (%[addr])
> -                        * HLVX.HU t1, (t2)
> -                        * 0110010 00011 00111 100 00110 1110011
> -                        */
> -                       ".word 0x6433c373\n"
> +                       HLVX_HU("%[tmp]", "%[addr]")
>                         "sll %[tmp], %[tmp], 16\n"
>                         "add %[val], %[val], %[tmp]\n"
>                         "2:\n"
> @@ -121,19 +112,9 @@ unsigned long kvm_riscv_vcpu_unpriv_read(struct kvm_vcpu *vcpu,
>                         ".option norvc\n"
>                         "add %[ttmp], %[taddr], 0\n"
>  #ifdef CONFIG_64BIT
> -                       /*
> -                        * HLV.D %[val], (%[addr])
> -                        * HLV.D t0, (t2)
> -                        * 0110110 00000 00111 100 00101 1110011
> -                        */
> -                       ".word 0x6c03c2f3\n"
> +                       HLV_D("%[val]", "%[addr]")
>  #else
> -                       /*
> -                        * HLV.W %[val], (%[addr])
> -                        * HLV.W t0, (t2)
> -                        * 0110100 00000 00111 100 00101 1110011
> -                        */
> -                       ".word 0x6803c2f3\n"
> +                       HLV_W("%[val]", "%[addr]")
>  #endif
>                         ".option pop"
>                 : [val] "=&r" (val),
> --
> 2.37.1
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
