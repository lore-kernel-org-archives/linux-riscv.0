Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBDAC352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 11:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fpt165B7PFE5TkI3NSLpoLCtyUORo2dEjB4qJ5wwYBs=; b=bktlguOKjDkZzk
	JKZ5JSj+988LBQ3YLeIJ5UXoivg/qosT1EO9sLFtt7G43TszmtdK3N1WAL8oKZ2U/byxYQljxSdCn
	79YiOweEwYjqPP3UAzjaRxak3lpbYij6ZJ5km8MnNXh+cWUMoj4gBi+xdXls/nBOM2JjJ4j51v5R0
	ipZYsipB8m38/gEquLAmtP/KQZCWO2kMdijC1H4FyzQ+FpaYh7pYLRctxW1WTlTQZYEZdYJQftRsL
	z6zlp1yJlZk2W3RQw/rAyCsvjQZYdLmVyqwxPG5j39Q8AnuEGB303eJnwG6vj7Hu8Q7vb9fvnYdgM
	1UACMV0roZcAfC1iQCjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2sfV-000tb3-4p; Wed, 07 Dec 2022 11:32:53 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2sfR-000tZI-R3
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 11:32:51 +0000
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com [209.85.219.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2017C4431F
	for <linux-riscv@lists.infradead.org>; Wed,  7 Dec 2022 11:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1670412768;
	bh=XDg5r62PV7VGqC50P9tvlBcDd/B82GWTEhjgcrTBWj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=SRRuI9O4oYtobtk8E3ECcRmzN0SwWJj/IPsxDGGjJGvQ87wZdKIURmx6MFyXBAfIf
	 UAMM1bY80Qbmx2sBBIGu6oYe0iKGtjQ9QlJtGDjx2k/heVvLMR4n6E+fkEwmRGQEyU
	 pUL6c8vbROt3CE7THmRwMvowZDu3wePYlrXy+xN78cY7qLv9y+JZ9QqnaIiDcJV768
	 CPH4Aia38MICw0ZypmIp0VlhYPkc7Y3ovFTi1teTCMZei4IlGElQh2vukNA1aOi6pg
	 te1RsslezGvtZLxZaThkxZQBEcsid6EPF9lb6q8Sl1nlc/U6ExFfDySE00JAVbxo5I
	 Y2xrruEFzJO3g==
Received: by mail-yb1-f197.google.com with SMTP id e202-20020a2550d3000000b006f9d739c724so18547087ybb.6
        for <linux-riscv@lists.infradead.org>; Wed, 07 Dec 2022 03:32:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDg5r62PV7VGqC50P9tvlBcDd/B82GWTEhjgcrTBWj8=;
        b=LjPuoP3E/dlhSADkacAkJunC3mkXjOF68MG+tTI05I0NpGYrUfC6dl1udmC92PwXDW
         YjVAlAogYv61kCGFTWNP/CQJRYv3Hzr23l+IfFGY0uxOgGY0aJkiiNNzrFgXy4EeAdo8
         z8BwFXU7BmH84Lz9neoEBfDPnM2f5XtHXlfbqAIYZu5zyfeRgaRlihME3CIvHJjvyOHx
         /v2YmRFIn6lmM5RGl9jlf66+9w8s/8GbIRaO9XsMDV0ttHsdWW1SVJwktbYSH9R8EPht
         hrRlnLrv7Mav6xpJPOPEPQqAxJpPM30P7aNLa/0SiQidqOCJjw1ox34fb2nokPjD0La0
         3RJA==
X-Gm-Message-State: ANoB5pkoUVcrqyxtD0z0lqFu+8zvKis9aSb1rpTMFmKu6S+Yrazzj45N
	0lP2iShgxf0ju0kOC9TrQCBaKaJ7cP6GXbh37cg8OVb7pO0Us8ZaDdtMNf44eMgCOTflK6/Rk29
	mrGN2Eakv53ST7vszwwYueCxI8YH6SrE3ziW+k3sehF5y9GWNsepSQNjaC326Yw==
X-Received: by 2002:a05:6902:1823:b0:6f9:a75a:2769 with SMTP id cf35-20020a056902182300b006f9a75a2769mr34991589ybb.439.1670412766632;
        Wed, 07 Dec 2022 03:32:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5GS+SKiPtcPQ+n8XGvO2Ld7AkncsuCUC6vSlQ3RvjvKP/oeM/FHM1etTSEUsVatBC35mzZRHFttFa+mExULCQ=
X-Received: by 2002:a05:6902:1823:b0:6f9:a75a:2769 with SMTP id
 cf35-20020a056902182300b006f9a75a2769mr34991572ybb.439.1670412766373; Wed, 07
 Dec 2022 03:32:46 -0800 (PST)
MIME-Version: 1.0
References: <20221130225614.1594256-1-heiko@sntech.de> <20221130225614.1594256-12-heiko@sntech.de>
 <CAJM55Z_xCOgFx=S+wDEMfWeOG6JVZ9y+g6YBPyr+9cofeT9nTg@mail.gmail.com>
In-Reply-To: <CAJM55Z_xCOgFx=S+wDEMfWeOG6JVZ9y+g6YBPyr+9cofeT9nTg@mail.gmail.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 7 Dec 2022 12:32:29 +0100
Message-ID: <CAJM55Z_9afPaq7wpVkqnGRfduoYFDy+CvfjeCPZwAi_4KW-H8Q@mail.gmail.com>
Subject: Re: [PATCH v3 11/14] RISC-V: fix auipc-jalr addresses in patched alternatives
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, conor@kernel.org, 
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com, ardb@kernel.org, 
	linux-efi@vger.kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_033250_179332_84D2E784 
X-CRM114-Status: GOOD (  34.54  )
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

On Wed, 7 Dec 2022 at 12:29, Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:
>
> On Wed, 30 Nov 2022 at 23:57, Heiko Stuebner <heiko@sntech.de> wrote:
> >
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> >
> > Alternatives live in a different section, so addresses used by call
> > functions will point to wrong locations after the patch got applied.
> >
> > Similar to arm64, adjust the location to consider that offset.
> >
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > ---
> >  arch/riscv/include/asm/alternative.h |  3 ++
> >  arch/riscv/kernel/alternative.c      | 72 ++++++++++++++++++++++++++++
> >  arch/riscv/kernel/cpufeature.c       | 11 ++++-
> >  3 files changed, 84 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> > index 6511dd73e812..c58ec3cc4bc3 100644
> > --- a/arch/riscv/include/asm/alternative.h
> > +++ b/arch/riscv/include/asm/alternative.h
> > @@ -27,6 +27,9 @@ void __init apply_boot_alternatives(void);
> >  void __init apply_early_boot_alternatives(void);
> >  void apply_module_alternatives(void *start, size_t length);
> >
> > +void riscv_alternative_fix_auipc_jalr(void *alt_ptr, unsigned int len,
> > +                                     int patch_offset);
> > +
> >  struct alt_entry {
> >         void *old_ptr;           /* address of original instruciton or data  */
> >         void *alt_ptr;           /* address of replacement instruction or data */
> > diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> > index a7d26a00beea..292cc42dc3be 100644
> > --- a/arch/riscv/kernel/alternative.c
> > +++ b/arch/riscv/kernel/alternative.c
> > @@ -15,6 +15,8 @@
> >  #include <asm/vendorid_list.h>
> >  #include <asm/sbi.h>
> >  #include <asm/csr.h>
> > +#include <asm/insn.h>
> > +#include <asm/patch.h>
> >
> >  struct cpu_manufacturer_info_t {
> >         unsigned long vendor_id;
> > @@ -53,6 +55,76 @@ static void __init_or_module riscv_fill_cpu_mfr_info(struct cpu_manufacturer_inf
> >         }
> >  }
> >
> > +static unsigned int riscv_instruction_at(void *p, unsigned int offset)
> > +{
> > +       u16 *parcel = p + (offset * sizeof(u32));
> > +
> > +       return (unsigned int)parcel[0] | (unsigned int)parcel[1] << 16;
> > +}
> > +
> > +static inline bool riscv_insn_is_auipc_jalr(u32 insn1, u32 insn2)
> > +{
> > +       return riscv_insn_is_auipc(insn1) && riscv_insn_is_jalr(insn2);
> > +}
> > +
> > +#define JALR_SIGN_MASK         BIT(RV_I_IMM_SIGN_OPOFF - RV_I_IMM_11_0_OPOFF)
> > +#define AUIPC_PAD              (0x00001000)
> > +
> > +#define to_jalr_imm(value)                                             \
> > +       ((value & RV_I_IMM_11_0_MASK) << RV_I_IMM_11_0_OPOFF)
> > +
> > +#define to_auipc_imm(value)                                            \
> > +       ((value & JALR_SIGN_MASK) ?                                     \
> > +       ((value & RV_U_IMM_31_12_MASK) + AUIPC_PAD) :   \
> > +       (value & RV_U_IMM_31_12_MASK))
> > +
> > +void riscv_alternative_fix_auipc_jalr(void *alt_ptr, unsigned int len,
> > +                                     int patch_offset)
> > +{
> > +       int num_instr = len / sizeof(u32);
> > +       unsigned int call[2];
> > +       int i;
> > +       int imm;
> > +       u32 rd1;
> > +
> > +       /*
> > +        * stop one instruction before the end, as we're checking
> > +        * for auipc + jalr
> > +        */
> > +       for (i = 0; i < num_instr - 1; i++) {
> > +               u32 inst1 = riscv_instruction_at(alt_ptr, i);
> > +               u32 inst2 = riscv_instruction_at(alt_ptr, i + 1);
> > +
> > +               if (!riscv_insn_is_auipc_jalr(inst1, inst2))
> > +                       continue;
> > +
> > +               /* call will use ra register */
> > +               rd1 = RV_EXTRACT_RD_REG(inst1);
> > +               if (rd1 != 1)
> > +                       continue;
> > +
> > +               /* get and adjust new target address */
> > +               imm = RV_EXTRACT_UTYPE_IMM(inst1);
> > +               imm += RV_EXTRACT_ITYPE_IMM(inst2);
> > +               imm -= patch_offset;
> > +
> > +               /* pick the original auipc + jalr */
> > +               call[0] = inst1;
> > +               call[1] = inst2;
> > +
> > +               /* drop the old IMMs */
> > +               call[0] &= ~(RV_U_IMM_31_12_MASK);
> > +               call[1] &= ~(RV_I_IMM_11_0_MASK << RV_I_IMM_11_0_OPOFF);
> > +
> > +               /* add the adapted IMMs */
> > +               call[0] |= to_auipc_imm(imm);
> > +               call[1] |= to_jalr_imm(imm);
>
> It's fine like this, but as explained in
> https://git.kernel.org/torvalds/c/0966d385830de3470b7131db8e86c0c5bc9c52dc
> we can get rid of the conditional by doing
>
> call[0] |= (imm + 0x800) >> 12;
> call[1] |= imm & 0xfff;

Ugh, sorry this is of course wrong. It still needs to take into
account how the immediates are encoded in the instruction, but
calculating the immediates can still be done without a conditional.

> > +
> > +               /* patch the call place again */
> > +               patch_text_nosync(alt_ptr + i * sizeof(u32), call, 8);
> > +       }
> > +}
> > +
> >  /*
> >   * This is called very early in the boot process (directly after we run
> >   * a feature detect on the boot CPU). No need to worry about other CPUs
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 694267d1fe81..ba62a4ff5ccd 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -316,8 +316,15 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> >                 }
> >
> >                 tmp = (1U << alt->errata_id);
> > -               if (cpu_req_feature & tmp)
> > -                       patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> > +               if (cpu_req_feature & tmp) {
> > +                       /* do the basic patching */
> > +                       patch_text_nosync(alt->old_ptr, alt->alt_ptr,
> > +                                         alt->alt_len);
> > +
> > +                       riscv_alternative_fix_auipc_jalr(alt->old_ptr,
> > +                                                        alt->alt_len,
> > +                                                        alt->old_ptr - alt->alt_ptr);
> > +               }
> >         }
> >  }
> >  #endif
> > --
> > 2.35.1
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
