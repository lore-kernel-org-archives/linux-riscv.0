Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A38ECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 08:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0oY2KIuJQUGIJ+gl59pak848tZTlziKqJQDo+puo7z0=; b=SDheXmTrix97My
	M0prxpWx8LCQKA5IsX/IZ6qc8Zw3t9Qz6lc9CLSmRTDMSpyHlMw32dzs2sGdDZ8pQNjpBdxa6ViQ7
	+KFHqwXXKHoZG9hlXrKYKMv+dWMOxua0Twg7xSUD/biC7a1BgWY1n1BHeRtMMGONJ39vviZ1XYbQt
	F0g9A6cBf+5UKxgIV1DgkjAskG/mwhTAw0sz7Cr1Y8HYG5b6EIx5PMI9VZEER7wCcBi2MzHpt9i0b
	7f9RWRX9AOyzB9mLFrJjeyk4F9GYjsQjPq0ILg1V9ijxJrAFpxU4RtPhO1qZKgvW6WGX20TSdW8Et
	sunzpyZM5CjvswtOGhOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSaK2-006J49-4h; Mon, 29 Aug 2022 08:40:42 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSaHd-006HHq-HQ
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 08:38:16 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-3321c2a8d4cso177861937b3.5
        for <linux-riscv@lists.infradead.org>; Mon, 29 Aug 2022 01:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=mK4rg30aTYEASjNFzr6HKKVbPhWWXO7rNvgLsCU003E=;
        b=PGNuleX37vDR6dOY0fMMebPTnPZ1XM8BvngSnofhx4oo7AfrJ8BCfLOiBV8TDw2TZP
         cTH/rajG5+vCdjIsy+Ydpuf4qa9Hr502L0HZqHlRJT8qltGhZWPoxzzzdG3tzJ0dZGL+
         QAm6/LbNOMZHQwf+AMrqWC07OgKKKIfTCaAZZ/SUCXm7/X4WmzUxj30QigHFBL4mKHGi
         eDGSu9HbapVr6lx8UGADsY44ruVqs54cOMZEZ2i+xVYRpWON4c+zqedcMtIMSeuJb/vw
         pXf+SjhCRQ+G0aSAuG6TEoMXWvzaOvTP7/77JUO3tjYfeKfDP0zVxN4xmO+L7cGEanNZ
         i5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=mK4rg30aTYEASjNFzr6HKKVbPhWWXO7rNvgLsCU003E=;
        b=t3Jwkpi6zrqZOCIFXBP2CHuheQ322MtPslVazhgs9wgBOP75Eyt37GHwsNibNJkF/s
         bBF8QJpc8xSd+5Xyc5DreLmmvalSuSyGTiINP+v3OqVE01hqnfpOcO6w/XS5ZhjQQZH4
         xVlcPxX08c9l9Mg4vDUrogjbivxaZBY3UOaS3qgR53aaSSn9F8iHMj61Vm+KrW1ZMb6K
         r3QwqlYctmf0LUyNQ6EqZyPSIUSpl/dGARPlboYvVbXDKMT9y0I67ZnjeXXkL3IDTa4k
         nUTxwbbwyhKKarNyAJS4b7MkdyWxgwbDR32d1IYukUI6kcJSJYBpbxGgjWy6iOsfsDpP
         4DrQ==
X-Gm-Message-State: ACgBeo1bevtMd8BSmHd+Swq4DvI1DCIi7cz9DSRU1AVs00Wak4AWZ3az
	Mtl3TL1/HnW/At3AuCm0VMGfMWAT2pMcAMj8HCZFOQmycbM67A==
X-Google-Smtp-Source: AA6agR6NdQQdI+j2k9zFaYZtFdhtE4xru7weApQHoj/gdV8ZfU2z17o0wqu4xl5EcEcB2xm1CEIvGYCG+IgANG2FVWM=
X-Received: by 2002:a0d:ca90:0:b0:337:e1b4:93f7 with SMTP id
 m138-20020a0dca90000000b00337e1b493f7mr9143765ywd.153.1661762291640; Mon, 29
 Aug 2022 01:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220819140250.3892995-1-ajones@ventanamicro.com> <20220819140250.3892995-4-ajones@ventanamicro.com>
In-Reply-To: <20220819140250.3892995-4-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 29 Aug 2022 14:07:59 +0530
Message-ID: <CAAhSdy0d8mjr5-5Um2DpLgnhPb3UnGggXvbu_=oqEHWYzMP1SQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] riscv: KVM: Apply insn-def to hfence encodings
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, mchitale@ventanamicro.com, heiko@sntech.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_013813_708875_82D6188D 
X-CRM114-Status: GOOD (  17.37  )
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
> Introduce hfence instruction encodings and apply them to KVM's use.
> With the self-documenting nature of the instruction encoding macros,
> and a spec always within arm's reach, it's safe to remove the
> comments, so we do that too.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/insn-def.h |   8 ++
>  arch/riscv/kvm/tlb.c              | 117 ++++--------------------------
>  2 files changed, 21 insertions(+), 104 deletions(-)
>
> diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> index 4cd0208068dd..cd1c0d365f47 100644
> --- a/arch/riscv/include/asm/insn-def.h
> +++ b/arch/riscv/include/asm/insn-def.h
> @@ -79,4 +79,12 @@
>  #define RS1(v)         __REG(v)
>  #define RS2(v)         __REG(v)
>
> +#define OPCODE_SYSTEM  OPCODE(115)
> +
> +#define HFENCE_VVMA(vaddr, asid)       \
> +       INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(17), RD(0), vaddr, asid)
> +
> +#define HFENCE_GVMA(gaddr, vmid)       \
> +       INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(49), RD(0), gaddr, vmid)
> +
>  #endif /* __ASM_INSN_DEF_H */
> diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> index 1a76d0b1907d..f742a0d888e1 100644
> --- a/arch/riscv/kvm/tlb.c
> +++ b/arch/riscv/kvm/tlb.c
> @@ -12,22 +12,7 @@
>  #include <linux/kvm_host.h>
>  #include <asm/cacheflush.h>
>  #include <asm/csr.h>
> -
> -/*
> - * Instruction encoding of hfence.gvma is:
> - * HFENCE.GVMA rs1, rs2
> - * HFENCE.GVMA zero, rs2
> - * HFENCE.GVMA rs1
> - * HFENCE.GVMA
> - *
> - * rs1!=zero and rs2!=zero ==> HFENCE.GVMA rs1, rs2
> - * rs1==zero and rs2!=zero ==> HFENCE.GVMA zero, rs2
> - * rs1!=zero and rs2==zero ==> HFENCE.GVMA rs1
> - * rs1==zero and rs2==zero ==> HFENCE.GVMA
> - *
> - * Instruction encoding of HFENCE.GVMA is:
> - * 0110001 rs2(5) rs1(5) 000 00000 1110011
> - */
> +#include <asm/insn-def.h>
>
>  void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
>                                           gpa_t gpa, gpa_t gpsz,
> @@ -41,31 +26,14 @@ void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
>         }
>
>         for (pos = gpa; pos < (gpa + gpsz); pos += BIT(order)) {
> -               /*
> -                * rs1 = a0 (GPA >> 2)
> -                * rs2 = a1 (VMID)
> -                * HFENCE.GVMA a0, a1
> -                * 0110001 01011 01010 000 00000 1110011
> -                */
> -               asm volatile ("srli a0, %0, 2\n"
> -                             "add a1, %1, zero\n"
> -                             ".word 0x62b50073\n"
> -                             :: "r" (pos), "r" (vmid)
> -                             : "a0", "a1", "memory");
> +               asm volatile (HFENCE_GVMA("%0", "%1")
> +               : : "r" (pos >> 2), "r" (vmid) : "memory");

You can drop the for-loop braces "{ }"

>         }
>  }
>
>  void kvm_riscv_local_hfence_gvma_vmid_all(unsigned long vmid)
>  {
> -       /*
> -        * rs1 = zero
> -        * rs2 = a0 (VMID)
> -        * HFENCE.GVMA zero, a0
> -        * 0110001 01010 00000 000 00000 1110011
> -        */
> -       asm volatile ("add a0, %0, zero\n"
> -                     ".word 0x62a00073\n"
> -                     :: "r" (vmid) : "a0", "memory");
> +       asm volatile(HFENCE_GVMA("zero", "%0") : : "r" (vmid) : "memory");
>  }
>
>  void kvm_riscv_local_hfence_gvma_gpa(gpa_t gpa, gpa_t gpsz,
> @@ -79,45 +47,16 @@ void kvm_riscv_local_hfence_gvma_gpa(gpa_t gpa, gpa_t gpsz,
>         }
>
>         for (pos = gpa; pos < (gpa + gpsz); pos += BIT(order)) {
> -               /*
> -                * rs1 = a0 (GPA >> 2)
> -                * rs2 = zero
> -                * HFENCE.GVMA a0
> -                * 0110001 00000 01010 000 00000 1110011
> -                */
> -               asm volatile ("srli a0, %0, 2\n"
> -                             ".word 0x62050073\n"
> -                             :: "r" (pos) : "a0", "memory");
> +               asm volatile(HFENCE_GVMA("%0", "zero")
> +               : : "r" (pos >> 2) : "memory");

You can drop the for-loop braces "{ }"

>         }
>  }
>
>  void kvm_riscv_local_hfence_gvma_all(void)
>  {
> -       /*
> -        * rs1 = zero
> -        * rs2 = zero
> -        * HFENCE.GVMA
> -        * 0110001 00000 00000 000 00000 1110011
> -        */
> -       asm volatile (".word 0x62000073" ::: "memory");
> +       asm volatile(HFENCE_GVMA("zero", "zero") : : : "memory");
>  }
>
> -/*
> - * Instruction encoding of hfence.gvma is:
> - * HFENCE.VVMA rs1, rs2
> - * HFENCE.VVMA zero, rs2
> - * HFENCE.VVMA rs1
> - * HFENCE.VVMA
> - *
> - * rs1!=zero and rs2!=zero ==> HFENCE.VVMA rs1, rs2
> - * rs1==zero and rs2!=zero ==> HFENCE.VVMA zero, rs2
> - * rs1!=zero and rs2==zero ==> HFENCE.VVMA rs1
> - * rs1==zero and rs2==zero ==> HFENCE.VVMA
> - *
> - * Instruction encoding of HFENCE.VVMA is:
> - * 0010001 rs2(5) rs1(5) 000 00000 1110011
> - */
> -
>  void kvm_riscv_local_hfence_vvma_asid_gva(unsigned long vmid,
>                                           unsigned long asid,
>                                           unsigned long gva,
> @@ -134,17 +73,8 @@ void kvm_riscv_local_hfence_vvma_asid_gva(unsigned long vmid,
>         hgatp = csr_swap(CSR_HGATP, vmid << HGATP_VMID_SHIFT);
>
>         for (pos = gva; pos < (gva + gvsz); pos += BIT(order)) {
> -               /*
> -                * rs1 = a0 (GVA)
> -                * rs2 = a1 (ASID)
> -                * HFENCE.VVMA a0, a1
> -                * 0010001 01011 01010 000 00000 1110011
> -                */
> -               asm volatile ("add a0, %0, zero\n"
> -                             "add a1, %1, zero\n"
> -                             ".word 0x22b50073\n"
> -                             :: "r" (pos), "r" (asid)
> -                             : "a0", "a1", "memory");
> +               asm volatile(HFENCE_VVMA("%0", "%1")
> +               : : "r" (pos), "r" (asid) : "memory");

You can drop the for-loop braces "{ }"

>         }
>
>         csr_write(CSR_HGATP, hgatp);
> @@ -157,15 +87,7 @@ void kvm_riscv_local_hfence_vvma_asid_all(unsigned long vmid,
>
>         hgatp = csr_swap(CSR_HGATP, vmid << HGATP_VMID_SHIFT);
>
> -       /*
> -        * rs1 = zero
> -        * rs2 = a0 (ASID)
> -        * HFENCE.VVMA zero, a0
> -        * 0010001 01010 00000 000 00000 1110011
> -        */
> -       asm volatile ("add a0, %0, zero\n"
> -                     ".word 0x22a00073\n"
> -                     :: "r" (asid) : "a0", "memory");
> +       asm volatile(HFENCE_VVMA("zero", "%0") : : "r" (asid) : "memory");
>
>         csr_write(CSR_HGATP, hgatp);
>  }
> @@ -184,15 +106,8 @@ void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
>         hgatp = csr_swap(CSR_HGATP, vmid << HGATP_VMID_SHIFT);
>
>         for (pos = gva; pos < (gva + gvsz); pos += BIT(order)) {
> -               /*
> -                * rs1 = a0 (GVA)
> -                * rs2 = zero
> -                * HFENCE.VVMA a0
> -                * 0010001 00000 01010 000 00000 1110011
> -                */
> -               asm volatile ("add a0, %0, zero\n"
> -                             ".word 0x22050073\n"
> -                             :: "r" (pos) : "a0", "memory");
> +               asm volatile(HFENCE_VVMA("%0", "zero")
> +               : : "r" (pos) : "memory");
>         }
>
>         csr_write(CSR_HGATP, hgatp);
> @@ -204,13 +119,7 @@ void kvm_riscv_local_hfence_vvma_all(unsigned long vmid)
>
>         hgatp = csr_swap(CSR_HGATP, vmid << HGATP_VMID_SHIFT);
>
> -       /*
> -        * rs1 = zero
> -        * rs2 = zero
> -        * HFENCE.VVMA
> -        * 0010001 00000 00000 000 00000 1110011
> -        */
> -       asm volatile (".word 0x22000073" ::: "memory");
> +       asm volatile(HFENCE_VVMA("zero", "zero") : : : "memory");
>
>         csr_write(CSR_HGATP, hgatp);
>  }
> --
> 2.37.1
>

Apart from a few nits above, this looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
