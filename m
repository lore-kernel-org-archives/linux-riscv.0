Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98491ECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 06:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r5Yq4NbUVLKlAMJiNMN5cYdwdFTwdjeJ3i6gLh9/Em4=; b=jq5y+tukIdphJe
	Zg5nWI+TPlWfdk9w8LAwtwkUw3Acgh+Q0J1USVnN/r3peZHi0zAHuz3YG8zl/fiSc79xs37QEDSVg
	NT0sG3t4cTp0s96eg5sf2rwmQ9qSRkskuGYKZQfvoqHYSmNfE+kueQ5Re8JqChr+sIjTxHzkiYtnF
	ohlhsv8kEDaDOxArVOAxkB3fOAtCdcNOncxR/hKX5GSTudpU0rZdpf0wDYN/FHqWEodd2/o6IWh9T
	O4c3DwZ3mdo/VLyqE+PdQ1ZX5R+eI/MM+OnawkZjuVO2IOqhSoOk1pWkw1yd9GK4C+2jYGzDHP3fr
	MqMHW5vREUeDDGybxCTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU0Yk-0011ct-Cu; Fri, 02 Sep 2022 06:53:46 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU0Yh-0011Xy-Pq
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 06:53:45 +0000
Received: by mail-yb1-xb30.google.com with SMTP id g5so1848187ybg.11
        for <linux-riscv@lists.infradead.org>; Thu, 01 Sep 2022 23:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=wIY3Cp70hOwu5cFFqibpP3VvX84nHcY+aOjHPogHvC8=;
        b=dFiTkme8yhUBNTEDn/G5bfjKQV3zaMBemnKrGUidQPKV73pDDm0/O3rJikO7OmNcNC
         CeyZyBAPE6BNDl84ueflTzvDXws9uQTiHGpC6U7SCxiQTzHS2x/K1hHERhe66PPfCJyI
         Un61ZDQS0+93PiwFOIHD8Y2h0Kye6B0H7KZnEJzwx6MSPMfjybPR0bKEj88gbK2GhCua
         z+WsdwqScNbnpT6r20Mp1aiyHVYdN5Pje/2wplBqCKg9w9ygdDLhNdIaHwlV3Bwm2l01
         qcZDo7tCyFT4KSll1wtj3WiScdDPj1Pwx3D5G5V3VC84M+2kc1igW61TifKII3lrDeW2
         3Gaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=wIY3Cp70hOwu5cFFqibpP3VvX84nHcY+aOjHPogHvC8=;
        b=MTVfH6QZdnnxhk7YjXRVwoiP2CCZh7Q5FZ9SFOl33UqoEvMg0yh05xQua7uMkzM6cl
         hmOzoRyCHruWAzqgnFU1GI+i+JbzF1uAMJt09OYSH6wbzybE0VUIixc80uFud0h55TQb
         CeH2C/8Ou95TmCt87F4xUbvWcimmoRhmc/06P08dE6sYUdHT22MZ/4+Lui1yD5LVZzk8
         /JCf9/5crRR3jxxBAUvQ431ruwNcdWZQUOh7cdIiWOZS8mAi54lIbwiF/utsEbva50sm
         uVTtmsRjbrrSKwX7vQc57HZ1X0nN9cYA8/8OupvNHPh95QkH1SQoELiOtqY+dI+TvA2k
         oziw==
X-Gm-Message-State: ACgBeo1wzUNgBSVtQL/Xjtq8tk3/gVWTOp9SF57sEF8JZOT7vkkC8FU3
	MvbBzL9C/RoRuMZOZPVJUhqNd9OxZGh1TQ8UngAom/PjMfKA73Fs
X-Google-Smtp-Source: AA6agR6MuE7RB8+w12z3VJ7uoIW/RDkmfJPN4yb5SS8a3RCWRegG5J0V5LcMVfNFMSF7X6Sauts4+68neHFzBxdb7ss=
X-Received: by 2002:a25:234a:0:b0:696:435f:df06 with SMTP id
 j71-20020a25234a000000b00696435fdf06mr21650473ybj.180.1662101619673; Thu, 01
 Sep 2022 23:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220831172500.752195-1-ajones@ventanamicro.com> <20220831172500.752195-5-ajones@ventanamicro.com>
In-Reply-To: <20220831172500.752195-5-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Sep 2022 12:23:27 +0530
Message-ID: <CAAhSdy1746pbZKBuFizhv6e8_ivSd4ePNkN_OG6X0NEhcrVRfw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] riscv: KVM: Apply insn-def to hlv encodings
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, mchitale@ventanamicro.com, heiko@sntech.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_235343_854987_5D413D56 
X-CRM114-Status: GOOD (  15.81  )
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

On Wed, Aug 31, 2022 at 10:55 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> Introduce hlv instruction encodings and apply them to KVM's use.
> We're careful not to introduce hlv.d to 32-bit builds. Indeed,
> we ensure the build fails if someone tries to use it.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>

I have queued this patch for Linux-6.1

Thanks,
Anup

> ---
>  arch/riscv/include/asm/insn-def.h | 17 +++++++++++++++++
>  arch/riscv/kvm/vcpu_exit.c        | 29 +++++------------------------
>  2 files changed, 22 insertions(+), 24 deletions(-)
>
> diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> index 86c1f602413b..8fe9036efb68 100644
> --- a/arch/riscv/include/asm/insn-def.h
> +++ b/arch/riscv/include/asm/insn-def.h
> @@ -93,4 +93,21 @@
>         INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(49),              \
>                __RD(0), RS1(gaddr), RS2(vmid))
>
> +#define HLVX_HU(dest, addr)                                    \
> +       INSN_R(OPCODE_SYSTEM, FUNC3(4), FUNC7(50),              \
> +              RD(dest), RS1(addr), __RS2(3))
> +
> +#define HLV_W(dest, addr)                                      \
> +       INSN_R(OPCODE_SYSTEM, FUNC3(4), FUNC7(52),              \
> +              RD(dest), RS1(addr), __RS2(0))
> +
> +#ifdef CONFIG_64BIT
> +#define HLV_D(dest, addr)                                      \
> +       INSN_R(OPCODE_SYSTEM, FUNC3(4), FUNC7(54),              \
> +              RD(dest), RS1(addr), __RS2(0))
> +#else
> +#define HLV_D(dest, addr)      \
> +       __ASM_STR(.error "hlv.d requires 64-bit support")
> +#endif
> +
>  #endif /* __ASM_INSN_DEF_H */
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index d5c36386878a..da793f113a72 100644
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
> +                       HLVX_HU(%[val], %[addr])
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
> +                       HLVX_HU(%[tmp], %[addr])
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
> +                       HLV_D(%[val], %[addr])
>  #else
> -                       /*
> -                        * HLV.W %[val], (%[addr])
> -                        * HLV.W t0, (t2)
> -                        * 0110100 00000 00111 100 00101 1110011
> -                        */
> -                       ".word 0x6803c2f3\n"
> +                       HLV_W(%[val], %[addr])
>  #endif
>                         ".option pop"
>                 : [val] "=&r" (val),
> --
> 2.37.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
