Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38C2C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 21:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNF+Jedrl8D6Pa8wVsu1bxfVx7og8AW2V8hNzsztJBc=; b=jikVaBF26Vhs6qCEyCrdB9n9IT
	zQfbTXWvw0NmCSmUUTBsp7+X6BdyKEn/jsCwgwwErPMGEXGOJsF2U00D83ob3nmQBr5uq2LSPUn4s
	UfrUgHBEoFCVA7SQXvd9Fjozmrhp+Q4mS3nmu2bxgBHSVhOMF9CGjUWXeyYFpaJ/VOGeZ48CxRwQ0
	ts1OGZkGB9AX7xTOGWBcVc+B7rBx8iLZQPmIVzTYV48ECBgTUmkuJNyf62gG0HTHIipo8daMI7hKI
	jg7EQZmwuvBR/MGSaRhdKKHHEJClLIWcSa/0YtChrWVFyW1+Eqg+eh2KpYs0kYdAr5yG5/9VIANQj
	kGclf5SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxEOg-000NWr-NA; Mon, 21 Nov 2022 21:32:10 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxEOc-000NVv-FO
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 21:32:09 +0000
Received: by mail-ej1-x632.google.com with SMTP id f27so31598475eje.1
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 13:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1lA54dFaFyNqUfE0b8/0vMxmiTJ+MOXgMLS02vcEzzs=;
        b=ZPrY8JJfh1YSRekUl3Y45muYu196D80uF4cJSXXvFLufX8TPpO8WH1prrRSPLCGDwG
         Q2Iob0jy2St40Zpd7tcdWVhPfN4iy6o0cH55QpvwFYsq19swBFViCbZBmDGL9ur0xcUx
         2gtH3q03qDn3wtZlJvWfKAkLm1dsg4jynXw+3QOvELfMZqUZ4lrF5NqEZPl57BYy1nb7
         h44pRDKfrfZnrtmX2ACxn2SEy5Tn75480qYeQ1FzEmj7gnxKkwIqWyRJ6WH1MAQ2fMBp
         Rxk/aFwE6ML2yixI1SJA/m4kngD5lu4RAbZhnrpyKYp76OcjZfyY9RV4bH+C9gfpqExB
         Jfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lA54dFaFyNqUfE0b8/0vMxmiTJ+MOXgMLS02vcEzzs=;
        b=e6ImZdJO/eJHgzeIDHsbuy3xgOHARUMOk+rpDIBkGNEn8qVbeyu2XpOjggKoYldO6V
         59+aLNgSea1Xa7ir55w/aPINTEa9FidZNwF8mGCm+prNXzH76rmBB+DpZTGAbLaXJreC
         WI9w3otamOE80c3fnuEFngrcfcnfWdPS3MzOKwhhl7vS3t3i8tz3QQ/dtthy4Nwy4ORj
         7THNbPpUI0DaokWD+uNYCBpZbqU3J1k3Pb/wi9ECf7IlpyK5rpf9EQ6X/VmIFSgwI5MB
         2n3u7j3SxB+3UYOac2dJmOsQEbpcTj4cSgydiTgDxC4VkPuq+nNvVMZ+j0Z4MmxZAdPS
         v//Q==
X-Gm-Message-State: ANoB5pnFVcCvOv5Jm6Tlxq8GI0n+SCpzR/vakEA2uzVjdZRngcrXAReO
	YIjWVNEB6gr3zZNukRLDyZJM36FZa8B8QTHaM3A=
X-Google-Smtp-Source: AA0mqf5U4Qmd3m8GPKiGSrePTuX1k/hFfslplrUNcPDXcqwQhJkz4d0r8GqIWRkFENwQgbD630vvous8A68yVZDlPp8=
X-Received: by 2002:a17:906:3792:b0:7aa:97c7:2bfe with SMTP id
 n18-20020a170906379200b007aa97c72bfemr16955038ejc.196.1669066323456; Mon, 21
 Nov 2022 13:32:03 -0800 (PST)
MIME-Version: 1.0
References: <20221110164924.529386-1-heiko@sntech.de> <20221110164924.529386-6-heiko@sntech.de>
 <CA+V-a8tNjE+eeZEafnCXbXMdhEdzOXcft2UJNYbXxs0+Pag58Q@mail.gmail.com>
 <2756003.PYKUYFuaPT@diego> <CA+V-a8vSVY590SUkg81cC8Kq7FjzxdcJ5m2VG=94m0ntis7+8w@mail.gmail.com>
In-Reply-To: <CA+V-a8vSVY590SUkg81cC8Kq7FjzxdcJ5m2VG=94m0ntis7+8w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 21 Nov 2022 21:31:36 +0000
Message-ID: <CA+V-a8sqEjLKdGm67Sm5YbYUVRuntAM0Wqw_Gk+V6i9x+b1Exg@mail.gmail.com>
Subject: Re: [PATCH 5/7] RISC-V: fix auipc-jalr addresses in patched alternatives
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, 
	ajones@ventanamicro.com, emil.renner.berthing@canonical.com
Content-Type: multipart/mixed; boundary="000000000000514b9805ee01c955"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_133206_604099_2BD1C95A 
X-CRM114-Status: GOOD (  40.21  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--000000000000514b9805ee01c955
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heiko,

On Mon, Nov 21, 2022 at 3:06 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Heiko,
>
> On Mon, Nov 21, 2022 at 11:27 AM Heiko St=C3=BCbner <heiko@sntech.de> wro=
te:
> >
> > Hi,
> >
> > Am Montag, 21. November 2022, 10:50:09 CET schrieb Lad, Prabhakar:
> > > On Thu, Nov 10, 2022 at 4:50 PM Heiko Stuebner <heiko@sntech.de> wrot=
e:
> > > >
> > > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > >
> > > > Alternatives live in a different section, so addresses used by call
> > > > functions will point to wrong locations after the patch got applied=
.
> > > >
> > > > Similar to arm64, adjust the location to consider that offset.
> > > >
> > > > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > > ---
> >
> > [...]
> >
> > > I have the below assembly code which I have tested without the
> > > alternatives for the RZ/Five CMO,
> > >
> > > #define ALT_CMO_OP(_op, _start, _size, _cachesize, _dir, _ops)       =
 \
> > > asm volatile(".option push\n\t\n\t"                    \
> > >          ".option norvc\n\t"                    \
> > >          ".option norelax\n\t"                    \
> > >          "addi sp,sp,-16\n\t"                    \
> > >          "sd    s0,0(sp)\n\t"                    \
> > >          "sd    ra,8(sp)\n\t"                    \
> > >          "addi    s0,sp,16\n\t"                    \
> > >          "mv a4,%6\n\t"                        \
> > >          "mv a3,%5\n\t"                        \
> > >          "mv a2,%4\n\t"                        \
> > >          "mv a1,%3\n\t"                        \
> > >          "mv a0,%0\n\t"                        \
> > >          "call rzfive_cmo\n\t"                    \
> > >          "ld    ra,8(sp)\n\t"                    \
> > >          "ld    s0,0(sp)\n\t"                    \
> > >          "addi    sp,sp,16\n\t"                    \
> > >          ".option pop\n\t"                        \
> > >          : : "r"(_cachesize),                    \
> > >          "r"((unsigned long)(_start) & ~((_cachesize) - 1UL)),    \
> > >          "r"((unsigned long)(_start) + (_size)),            \
> > >          "r"((unsigned long) (_start)),                \
> > >          "r"((unsigned long) (_size)),                \
> > >          "r"((unsigned long) (_dir)),                \
> > >          "r"((unsigned long) (_ops))                \
> > >          : "a0", "a1", "a2", "a3", "a4", "memory")
> > >
> > > Now when integrate this with ALTERNATIVE_2() as below,
> > >
> > > #define ALT_CMO_OP(_op, _start, _size, _cachesize, _dir, _ops)       =
 \
> > > asm volatile(ALTERNATIVE_2(                        \
> > >     __nops(14),                            \
> > >     "mv a0, %1\n\t"                            \
> > >     "j 2f\n\t"                            \
> > >     "3:\n\t"                            \
> > >     "cbo." __stringify(_op) " (a0)\n\t"                \
> > >     "add a0, a0, %0\n\t"                        \
> > >     "2:\n\t"                            \
> > >     "bltu a0, %2, 3b\n\t"                        \
> > >     __nops(8), 0, CPUFEATURE_ZICBOM, CONFIG_RISCV_ISA_ZICBOM,    \
> > >     ".option push\n\t\n\t"                        \
> > >     ".option norvc\n\t"                        \
> > >     ".option norelax\n\t"                        \
> > >     "addi sp,sp,-16\n\t"                        \
> > >     "sd    s0,0(sp)\n\t"                        \
> > >     "sd    ra,8(sp)\n\t"                        \
> > >     "addi    s0,sp,16\n\t"                        \
> > >     "mv a4,%6\n\t"                            \
> > >     "mv a3,%5\n\t"                            \
> > >     "mv a2,%4\n\t"                            \
> > >     "mv a1,%3\n\t"                            \
> > >     "mv a0,%0\n\t"                            \
> > >     "call rzfive_cmo\n\t"                \
> > >     "ld    ra,8(sp)\n\t"                        \
> > >     "ld    s0,0(sp)\n\t"                        \
> > >     "addi    sp,sp,16\n\t"                        \
> > >     ".option pop\n\t"                        \
> > >     , ANDESTECH_VENDOR_ID,                        \
> > >             ERRATA_ANDESTECH_NO_IOCP, CONFIG_ERRATA_RZFIVE_CMO)    \
> > >     : : "r"(_cachesize),                        \
> > >     "r"((unsigned long)(_start) & ~((_cachesize) - 1UL)),    \
> > >     "r"((unsigned long)(_start) + (_size)),            \
> > >     "r"((unsigned long) (_start)),                \
> > >     "r"((unsigned long) (_size)),                \
> > >     "r"((unsigned long) (_dir)),                \
> > >     "r"((unsigned long) (_ops))                \
> > >     : "a0", "a1", "a2", "a3", "a4", "memory")
> > >
> > > I am seeing kernel panic with this change. Looking at the
> > > riscv_alternative_fix_auipc_jalr() implementation it assumes the rest
> > > of the alternative options are calls too. Is my understanding correct
> > > here?
> >
> > The loop walks through the instructions after the location got patched =
and
> > checks if an instruction is an auipc and the next one is a jalr and onl=
y then
> > adjusts the address accordingly.
> >
> Ok so my understanding was wrong here.
>
> > So it _should_ leave all other (non auipc+jalr) instructions alone.
> > (hopefully)
> >
> Agreed.
>
> >
> > > Do you think this is the correct approach in my case?
> >
> > It does look correct on first glance.
> >
> \o/
>
> > As I had that passing thought, are you actually calling
> >         riscv_alternative_fix_auipc_jalr()
> > from your errata/.../foo.c after doing the patching?
> >
> > I.e. with the current patchset, that function is only called from the
> > cpufeature part, but for example not from the other patching locations.
> > [and a future revision should probably change that :-) ]
> >
> >
> I have made a local copy of riscv_alternative_fix_auipc_jalr() and
> then calling it after patch_text_nosync() referring to your patch for
> str functions.
>
> > After making sure that function actually runs, the next thing you could=
 try
> > is to have both the "original" code and the patch be identical, i.e.
> > replace the cbo* part with your code as well and then just output the
> > instructions via printk to check what the addresses do in both.
> >
> > After riscv_alternative_fix_auipc_jalr() ran then both code variants
> > should be identical when using the same code in both areas.
> >
> So I have added debug prints to match the instructions as below after
> and before patching:
>
> static void riscv_alternative_print_inst(unsigned int *alt_ptr,
>                      unsigned int len)
> {
>     int num_instr =3D len / sizeof(u32);
>     int i;
>
>     for (i =3D 0; i < num_instr; i++)
>         pr_err("%s instruction: 0x%x\n", __func__, *(alt_ptr + i));
>
> }
>
> void __init_or_module andes_errata_patch_func(struct alt_entry *begin,
> struct alt_entry *end,
>                           unsigned long archid, unsigned long impid,
>                           unsigned int stage)
> {
> ....
>     if (cpu_req_errata & tmp) {
>         pr_err("stage: %x -> %px--> %x %x %x\n", stage, alt, tmp,
> cpu_req_errata, alt->errata_id);
>         pr_err("old:%ps alt:%ps len:%lx\n", alt->old_ptr,
> alt->alt_ptr, alt->alt_len);
>         pr_err("Print old start\n");
>         riscv_alternative_print_inst(alt->old_ptr, alt->alt_len);
>         pr_err("Print old end\n");
>         patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
>
>         riscv_alternative_fix_auipc_jalr(alt->old_ptr, alt->alt_len,
>                         alt->old_ptr - alt->alt_ptr);
>         pr_err("Print patch start\n");
>         riscv_alternative_print_inst(alt->alt_ptr, alt->alt_len);
>         pr_err("Print patch end\n");
>     }
> .....
> }
>
> Below is the log:
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] Print new old end
> [    0.000000] riscv_alternative_fix_auipc_jalr num instruction: 14
> [    0.000000] Print patch start
> [    0.000000] riscv_alternative_print_inst instruction: 0xff010113
> [    0.000000] riscv_alternative_print_inst instruction: 0x813023
> [    0.000000] riscv_alternative_print_inst instruction: 0x113423
> [    0.000000] riscv_alternative_print_inst instruction: 0x1010413
> [    0.000000] riscv_alternative_print_inst instruction: 0xf0713
> [    0.000000] riscv_alternative_print_inst instruction: 0x78693
> [    0.000000] riscv_alternative_print_inst instruction: 0x88613
> [    0.000000] riscv_alternative_print_inst instruction: 0x80593
> [    0.000000] riscv_alternative_print_inst instruction: 0xe0513
> [    0.000000] riscv_alternative_print_inst instruction: 0x97
> [    0.000000] riscv_alternative_print_inst instruction: 0xcba080e7
> [    0.000000] riscv_alternative_print_inst instruction: 0x813083
> [    0.000000] riscv_alternative_print_inst instruction: 0x13403
> [    0.000000] riscv_alternative_print_inst instruction: 0x1010113
> [    0.000000] Print patch end
> [    0.000000] stage: 0 -> ffffffff80a2492c--> 1 1 0
> [    0.000000] old:arch_sync_dma_for_device
> alt:riscv_noncoherent_supported len:38
> [    0.000000] Print  old start
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x970013
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> This in=
struction doesn't look correct it
> should be 0x13?
> [    0.000000] Print  old end
> [    0.000000] riscv_alternative_fix_auipc_jalr num instruction: 14
> [    0.000000] Print patch start
> [    0.000000] riscv_alternative_print_inst instruction: 0xff010113
> [    0.000000] riscv_alternative_print_inst instruction: 0x813023
> [    0.000000] riscv_alternative_print_inst instruction: 0x113423
> [    0.000000] riscv_alternative_print_inst instruction: 0x1010413
> [    0.000000] riscv_alternative_print_inst instruction: 0x78713
> [    0.000000] riscv_alternative_print_inst instruction: 0x78693
> [    0.000000] riscv_alternative_print_inst instruction: 0x88613
> [    0.000000] riscv_alternative_print_inst instruction: 0x80593
> [    0.000000] riscv_alternative_print_inst instruction: 0xe0513
> [    0.000000] riscv_alternative_print_inst instruction: 0x97
> [    0.000000] riscv_alternative_print_inst instruction: 0xc82080e7
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> This instru=
ction doesn't look correct comparing
> to objdump output this should be 000080e7 or does it require the
> offset too?
> [    0.000000] riscv_alternative_print_inst instruction: 0x813083
> [    0.000000] riscv_alternative_print_inst instruction: 0x13403
> [    0.000000] riscv_alternative_print_inst instruction: 0x1010113
> [    0.000000] Print patch end
> [    0.000000] stage: 0 -> ffffffff80a24950--> 1 1 0
> [    0.000000] old:arch_sync_dma_for_cpu alt:riscv_noncoherent_supported =
len:38
> [    0.000000] Print old start
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x97
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> This instru=
ction doesn't look correct it should
> be 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0xeee080e7
>       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> This =
instruction doesn't look correct it
> should be 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] Print old end
> [    0.000000] riscv_alternative_fix_auipc_jalr num instruction: 14
> [    0.000000] Print patch start
> [    0.000000] riscv_alternative_print_inst instruction: 0xff010113
> [    0.000000] riscv_alternative_print_inst instruction: 0x813023
> [    0.000000] riscv_alternative_print_inst instruction: 0x113423
> [    0.000000] riscv_alternative_print_inst instruction: 0x1010413
> [    0.000000] riscv_alternative_print_inst instruction: 0xf0713
> [    0.000000] riscv_alternative_print_inst instruction: 0x80693
> [    0.000000] riscv_alternative_print_inst instruction: 0x88613
> [    0.000000] riscv_alternative_print_inst instruction: 0x78593
> [    0.000000] riscv_alternative_print_inst instruction: 0xe0513
> [    0.000000] riscv_alternative_print_inst instruction: 0x97
> [    0.000000] riscv_alternative_print_inst instruction: 0xc4a080e7
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> This instru=
ction doesn't look correct comparing
> to objdump output this should be 000080e7 or does it require the
> offset too?
> [    0.000000] riscv_alternative_print_inst instruction: 0x813083
> [    0.000000] riscv_alternative_print_inst instruction: 0x13403
> [    0.000000] riscv_alternative_print_inst instruction: 0x1010113
> [    0.000000] Print patch end
> [    0.000000] stage: 0 -> ffffffff80a24974--> 1 1 0
> [    0.000000] old:arch_dma_prep_coherent alt:riscv_noncoherent_supported=
 len:38
> [    0.000000] Print old start
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x970013
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> This instru=
ction doesn't look correct it should
> be 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x80e70000
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> This instru=
ction doesn't look correct it should
> be 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0xe720
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> This instru=
ction doesn't look correct it should
> be 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] riscv_alternative_print_inst instruction: 0x13
> [    0.000000] Print old end
> [    0.000000] riscv_alternative_fix_auipc_jalr num instruction: 14
> [    0.000000] Print patch start
> [    0.000000] riscv_alternative_print_inst instruction: 0xff010113
> [    0.000000] riscv_alternative_print_inst instruction: 0x813023
> [    0.000000] riscv_alternative_print_inst instruction: 0x113423
> [    0.000000] riscv_alternative_print_inst instruction: 0x1010413
> [    0.000000] riscv_alternative_print_inst instruction: 0xf0713
> [    0.000000] riscv_alternative_print_inst instruction: 0xe8693
> [    0.000000] riscv_alternative_print_inst instruction: 0x88613
> [    0.000000] riscv_alternative_print_inst instruction: 0x78593
> [    0.000000] riscv_alternative_print_inst instruction: 0x30513
> [    0.000000] riscv_alternative_print_inst instruction: 0x97
> [    0.000000] riscv_alternative_print_inst instruction: 0xc12080e7
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> This instru=
ction doesn't look correct comparing
> to objdump output this should be 000080e7 + offset?
> [    0.000000] riscv_alternative_print_inst instruction: 0x813083
> [    0.000000] riscv_alternative_print_inst instruction: 0x13403
> [    0.000000] riscv_alternative_print_inst instruction: 0x1010113
> [    0.000000] Print patch end
>
> Here is the output from objdump of the file (dma-noncoherent.o):
>
> 000000000000032e <.L888^B1>:
>  32e:    ff010113              addi    sp,sp,-16
>  332:    00813023              sd    s0,0(sp)
>  336:    00113423              sd    ra,8(sp)
>  33a:    01010413              addi    s0,sp,16
>  33e:    000f0713              mv    a4,t5
>  342:    00078693              mv    a3,a5
>  346:    00088613              mv    a2,a7
>  34a:    00080593              mv    a1,a6
>  34e:    000e0513              mv    a0,t3
>  352:    00000097              auipc    ra,0x0
>  356:    000080e7              jalr    ra # 352 <.L888^B1+0x24>
>  35a:    00813083              ld    ra,8(sp)
>  35e:    00013403              ld    s0,0(sp)
>  362:    01010113              addi    sp,sp,16
>
> 0000000000000366 <.L888^B2>:
>  366:    ff010113              addi    sp,sp,-16
>  36a:    00813023              sd    s0,0(sp)
>  36e:    00113423              sd    ra,8(sp)
>  372:    01010413              addi    s0,sp,16
>  376:    00078713              mv    a4,a5
>  37a:    00078693              mv    a3,a5
>  37e:    00088613              mv    a2,a7
>  382:    00080593              mv    a1,a6
>  386:    000e0513              mv    a0,t3
>  38a:    00000097              auipc    ra,0x0
>  38e:    000080e7              jalr    ra # 38a <.L888^B2+0x24>
>  392:    00813083              ld    ra,8(sp)
>  396:    00013403              ld    s0,0(sp)
>  39a:    01010113              addi    sp,sp,16
>
> 000000000000039e <.L888^B3>:
>  39e:    ff010113              addi    sp,sp,-16
>  3a2:    00813023              sd    s0,0(sp)
>  3a6:    00113423              sd    ra,8(sp)
>  3aa:    01010413              addi    s0,sp,16
>  3ae:    000f0713              mv    a4,t5
>  3b2:    00080693              mv    a3,a6
>  3b6:    00088613              mv    a2,a7
>  3ba:    00078593              mv    a1,a5
>  3be:    000e0513              mv    a0,t3
>  3c2:    00000097              auipc    ra,0x0
>  3c6:    000080e7              jalr    ra # 3c2 <.L888^B3+0x24>
>  3ca:    00813083              ld    ra,8(sp)
>  3ce:    00013403              ld    s0,0(sp)
>  3d2:    01010113              addi    sp,sp,16
>
> 00000000000003d6 <.L888^B4>:
>  3d6:    ff010113              addi    sp,sp,-16
>  3da:    00813023              sd    s0,0(sp)
>  3de:    00113423              sd    ra,8(sp)
>  3e2:    01010413              addi    s0,sp,16
>  3e6:    000f0713              mv    a4,t5
>  3ea:    000e8693              mv    a3,t4
>  3ee:    00088613              mv    a2,a7
>  3f2:    00078593              mv    a1,a5
>  3f6:    00030513              mv    a0,t1
>  3fa:    00000097              auipc    ra,0x0
>  3fe:    000080e7              jalr    ra # 3fa <.L888^B4+0x24>
>  402:    00813083              ld    ra,8(sp)
>  406:    00013403              ld    s0,0(sp)
>  40a:    01010113              addi    sp,sp,16
>
> Disassembly of section __ksymtab_strings:
>
> Any pointers what could be happening?
>

Some more information,

- If I drop the riscv_alternative_fix_auipc_jalr() call after
patch_text_nosync() and then print the alt->old_ptr instructions
before patching I can see the instructions as 0x13 (nop) which is
correct.

- if I call riscv_alternative_fix_auipc_jalr() call after
patch_text_nosync() and then print the alt->old_ptr instructions
before patching I dont see 0x13 (nop) consistently for old
instructions.

- If I replace the nop's in the old instructions with my assembly code
of rz/five cmo and then just use patch_text_nosync() I can see the
correct actual instruction being printed apart from jalr (is some sort
of offset added to it as I see last 4 bits match?) and then is
replaced correctly by the same alt instructions apart from the jalr
(log [0]).

- If I replace the nop's in the old instructions with my assembly code
of rz/five cmo and then use patch_text_nosync() and
riscv_alternative_fix_auipc_jalr() I can see the actual old
instructions differs a bit and again the jalr instruction differs too
in the patched code (log [1]).

[0] https://paste.debian.net/1261412/
[1] https://paste.debian.net/1261413/

Attached is the objump of dma-noncoherent.o for reference.

Note, if I replace the old/orignal instruction to my asm code for
rz/five cmo and replace the errata id's to deadbeef the code works OK.

Cheers,
Prabhakar

--000000000000514b9805ee01c955
Content-Type: application/octet-stream; name="dma-noncoherent.objdump"
Content-Disposition: attachment; filename="dma-noncoherent.objdump"
Content-Transfer-Encoding: base64
Content-ID: <f_laradzq60>
X-Attachment-Id: f_laradzq60

CmRtYS1ub25jb2hlcmVudC5vOiAgICAgZmlsZSBmb3JtYXQgZWxmNjQtbGl0dGxlcmlzY3YKCgpE
aXNhc3NlbWJseSBvZiBzZWN0aW9uIC50ZXh0OgoKMDAwMDAwMDAwMDAwMDAwMCA8Y2FjaGVfZG9f
bm9wPjoKICAgMDoJMTE0MSAgICAgICAgICAgICAgICAJYy5hZGRpCXNwLC0xNgogICAyOgllNDIy
ICAgICAgICAgICAgICAgIAljLnNkc3AJczAsOChzcCkKICAgNDoJMDgwMCAgICAgICAgICAgICAg
ICAJYy5hZGRpNHNwbglzMCxzcCwxNgogICA2Ogk2NDIyICAgICAgICAgICAgICAgIAljLmxkc3AJ
czAsOChzcCkKICAgODoJMDE0MSAgICAgICAgICAgICAgICAJYy5hZGRpCXNwLDE2CiAgIGE6CTgw
ODIgICAgICAgICAgICAgICAgCWMuanIJcmEKCjAwMDAwMDAwMDAwMDAwMGMgPHRlc3RjYWxsX3Zp
YV9hc21fY2FjaGU+OgogICBjOgk0Nzg5ICAgICAgICAgICAgICAgIAljLmxpCWE1LDIKICAgZToJ
MDRmNzA0NjMgICAgICAgICAgCWJlcQlhNCxhNSw1NiA8LkwxMj4KICAxMjoJMTE0MSAgICAgICAg
ICAgICAgICAJYy5hZGRpCXNwLC0xNgogIDE0OgllMDIyICAgICAgICAgICAgICAgIAljLnNkc3AJ
czAsMChzcCkKICAxNjoJZTQwNiAgICAgICAgICAgICAgICAJYy5zZHNwCXJhLDgoc3ApCiAgMTg6
CTA4MDAgICAgICAgICAgICAgICAgCWMuYWRkaTRzcG4JczAsc3AsMTYKICAxYToJODUyZSAgICAg
ICAgICAgICAgICAJYy5tdglhMCxhMQogIDFjOgljNzE5ICAgICAgICAgICAgICAgIAljLmJlcXoJ
YTQsMmEgPC5MMTY+CiAgMWU6CTlhZjUgICAgICAgICAgICAgICAgCWMuYW5kaQlhMywtMwogIDIw
OgljYTkxICAgICAgICAgICAgICAgIAljLmJlcXoJYTMsMzQgPC5MMTU+CgowMDAwMDAwMDAwMDAw
MDIyIDwuTDY+OgogIDIyOgk2MGEyICAgICAgICAgICAgICAgIAljLmxkc3AJcmEsOChzcCkKICAy
NDoJNjQwMiAgICAgICAgICAgICAgICAJYy5sZHNwCXMwLDAoc3ApCiAgMjY6CTAxNDEgICAgICAg
ICAgICAgICAgCWMuYWRkaQlzcCwxNgogIDI4Ogk4MDgyICAgICAgICAgICAgICAgIAljLmpyCXJh
CgowMDAwMDAwMDAwMDAwMDJhIDwuTDE2PjoKICAyYToJNDcwNSAgICAgICAgICAgICAgICAJYy5s
aQlhNCwxCiAgMmM6CTAwZDc1ZDYzICAgICAgICAgIAliZ2UJYTQsYTMsNDYgPC5MMTc+CiAgMzA6
CWZlZjY5OWUzICAgICAgICAgIAlibmUJYTMsYTUsMjIgPC5MNj4KCjAwMDAwMDAwMDAwMDAwMzQg
PC5MMTU+OgogIDM0Ogk4NWIyICAgICAgICAgICAgICAgIAljLm12CWExLGEyCiAgMzY6CTAwMDAw
MDk3ICAgICAgICAgIAlhdWlwYwlyYSwweDAKICAzYToJMDAwMDgwZTcgICAgICAgICAgCWphbHIJ
cmEgIyAzNiA8LkwxNSsweDI+CiAgM2U6CTYwYTIgICAgICAgICAgICAgICAgCWMubGRzcAlyYSw4
KHNwKQogIDQwOgk2NDAyICAgICAgICAgICAgICAgIAljLmxkc3AJczAsMChzcCkKICA0MjoJMDE0
MSAgICAgICAgICAgICAgICAJYy5hZGRpCXNwLDE2CiAgNDQ6CTgwODIgICAgICAgICAgICAgICAg
CWMuanIJcmEKCjAwMDAwMDAwMDAwMDAwNDYgPC5MMTc+OgogIDQ2OglmYzA2Y2VlMyAgICAgICAg
ICAJYmx0eglhMywyMiA8Lkw2PgogIDRhOgk4NWIyICAgICAgICAgICAgICAgIAljLm12CWExLGEy
CiAgNGM6CTAwMDAwMDk3ICAgICAgICAgIAlhdWlwYwlyYSwweDAKICA1MDoJMDAwMDgwZTcgICAg
ICAgICAgCWphbHIJcmEgIyA0YyA8LkwxNysweDY+CiAgNTQ6CWI3ZjkgICAgICAgICAgICAgICAg
CWMuagkyMiA8Lkw2PgoKMDAwMDAwMDAwMDAwMDA1NiA8LkwxMj46CiAgNTY6CTgwODIgICAgICAg
ICAgICAgICAgCWMuanIJcmEKCjAwMDAwMDAwMDAwMDAwNTggPGFyY2hfc3luY19kbWFfZm9yX2Rl
dmljZT46CiAgNTg6CTExNDEgICAgICAgICAgICAgICAgCWMuYWRkaQlzcCwtMTYKICA1YToJZTQy
MiAgICAgICAgICAgICAgICAJYy5zZHNwCXMwLDgoc3ApCiAgNWM6CTA4MDAgICAgICAgICAgICAg
ICAgCWMuYWRkaTRzcG4JczAsc3AsMTYKICA1ZToJMDAwMDA4MTcgICAgICAgICAgCWF1aXBjCWE2
LDB4MAogIDYyOgkwMDA4MzgwMyAgICAgICAgICAJbGQJYTYsMChhNikgIyA1ZSA8YXJjaF9zeW5j
X2RtYV9mb3JfZGV2aWNlKzB4Nj4KICA2NjoJODdiMiAgICAgICAgICAgICAgICAJYy5tdglhNSxh
MgogIDY4Ogk4OGFlICAgICAgICAgICAgICAgIAljLm12CWE3LGExCiAgNmE6CTk4MmEgICAgICAg
ICAgICAgICAgCWMuYWRkCWE2LGEwCiAgNmM6CWM2M2QgICAgICAgICAgICAgICAgCWMuYmVxeglh
MixkYSA8LkwxOT4KICA2ZToJZmZmNjA3MWIgICAgICAgICAgCWFkZGl3CWE0LGEyLC0xCiAgNzI6
CTQ2ODUgICAgICAgICAgICAgICAgCWMubGkJYTMsMQogIDc0OgkwNmU2ZTA2MyAgICAgICAgICAJ
Ymx0dQlhMyxhNCxkNCA8LkwxOD4KICA3ODoJMDAwMDBlMTcgICAgICAgICAgCWF1aXBjCXQzLDB4
MAogIDdjOgkwMDBlMmUwMyAgICAgICAgICAJbHcJdDMsMCh0MykgIyA3OCA8YXJjaF9zeW5jX2Rt
YV9mb3JfZGV2aWNlKzB4MjA+CiAgODA6CTAyMGUxMzEzICAgICAgICAgIAlzbGxpCXQxLHQzLDB4
MjAKICA4NDoJMDIwMzUzMTMgICAgICAgICAgCXNybGkJdDEsdDEsMHgyMAogIDg4OgkwMjA2MTc5
MyAgICAgICAgICAJc2xsaQlhNSxhMiwweDIwCiAgOGM6CTQwNjAwMzMzICAgICAgICAgIAluZWcJ
dDEsdDEKICA5MDoJMDEwMzczMzMgICAgICAgICAgCWFuZAl0MSx0MSxhNgogIDk0OgkwMTA1OGVi
MyAgICAgICAgICAJYWRkCXQ0LGExLGE2CiAgOTg6CTkzODEgICAgICAgICAgICAgICAgCWMuc3Js
aQlhNSwweDIwCiAgOWE6CTRmMDEgICAgICAgICAgICAgICAgCWMubGkJdDUsMAoKMDAwMDAwMDAw
MDAwMDA5YyA8Lkw4ODZeQjE+OgogIDljOglmZjAxMDExMyAgICAgICAgICAJYWRkaQlzcCxzcCwt
MTYKICBhMDoJMDA4MTMwMjMgICAgICAgICAgCXNkCXMwLDAoc3ApCiAgYTQ6CTAwMTEzNDIzICAg
ICAgICAgIAlzZAlyYSw4KHNwKQogIGE4OgkwMTAxMDQxMyAgICAgICAgICAJYWRkaQlzMCxzcCwx
NgogIGFjOgkwMDBmMDcxMyAgICAgICAgICAJbXYJYTQsdDUKICBiMDoJMDAwNzg2OTMgICAgICAg
ICAgCW12CWEzLGE1CiAgYjQ6CTAwMDg4NjEzICAgICAgICAgIAltdglhMixhNwogIGI4OgkwMDA4
MDU5MyAgICAgICAgICAJbXYJYTEsYTYKICBiYzoJMDAwZTA1MTMgICAgICAgICAgCW12CWEwLHQz
CiAgYzA6CTAwMDAwMDk3ICAgICAgICAgIAlhdWlwYwlyYSwweDAKICBjNDoJMDAwMDgwZTcgICAg
ICAgICAgCWphbHIJcmEgIyBjMCA8Lkw4ODZeQjErMHgyND4KICBjODoJMDA4MTMwODMgICAgICAg
ICAgCWxkCXJhLDgoc3ApCiAgY2M6CTAwMDEzNDAzICAgICAgICAgIAlsZAlzMCwwKHNwKQogIGQw
OgkwMTAxMDExMyAgICAgICAgICAJYWRkaQlzcCxzcCwxNgoKMDAwMDAwMDAwMDAwMDBkNCA8Lkwx
OD46CiAgZDQ6CTY0MjIgICAgICAgICAgICAgICAgCWMubGRzcAlzMCw4KHNwKQogIGQ2OgkwMTQx
ICAgICAgICAgICAgICAgIAljLmFkZGkJc3AsMTYKICBkODoJODA4MiAgICAgICAgICAgICAgICAJ
Yy5qcglyYQoKMDAwMDAwMDAwMDAwMDBkYSA8LkwxOT46CiAgZGE6CTAwMDAwZTE3ICAgICAgICAg
IAlhdWlwYwl0MywweDAKICBkZToJMDAwZTJlMDMgICAgICAgICAgCWx3CXQzLDAodDMpICMgZGEg
PC5MMTk+CiAgZTI6CTAyMGUxMzEzICAgICAgICAgIAlzbGxpCXQxLHQzLDB4MjAKICBlNjoJMDIw
MzUzMTMgICAgICAgICAgCXNybGkJdDEsdDEsMHgyMAogIGVhOgk0MDYwMDMzMyAgICAgICAgICAJ
bmVnCXQxLHQxCiAgZWU6CTAxMDM3MzMzICAgICAgICAgIAlhbmQJdDEsdDEsYTYKICBmMjoJMDEw
NThlYjMgICAgICAgICAgCWFkZAl0NCxhMSxhNgoKMDAwMDAwMDAwMDAwMDBmNiA8Lkw4ODZeQjI+
OgogIGY2OglmZjAxMDExMyAgICAgICAgICAJYWRkaQlzcCxzcCwtMTYKICBmYToJMDA4MTMwMjMg
ICAgICAgICAgCXNkCXMwLDAoc3ApCiAgZmU6CTAwMTEzNDIzICAgICAgICAgIAlzZAlyYSw4KHNw
KQogMTAyOgkwMTAxMDQxMyAgICAgICAgICAJYWRkaQlzMCxzcCwxNgogMTA2OgkwMDA3ODcxMyAg
ICAgICAgICAJbXYJYTQsYTUKIDEwYToJMDAwNzg2OTMgICAgICAgICAgCW12CWEzLGE1CiAxMGU6
CTAwMDg4NjEzICAgICAgICAgIAltdglhMixhNwogMTEyOgkwMDA4MDU5MyAgICAgICAgICAJbXYJ
YTEsYTYKIDExNjoJMDAwZTA1MTMgICAgICAgICAgCW12CWEwLHQzCiAxMWE6CTAwMDAwMDk3ICAg
ICAgICAgIAlhdWlwYwlyYSwweDAKIDExZToJMDAwMDgwZTcgICAgICAgICAgCWphbHIJcmEgIyAx
MWEgPC5MODg2XkIyKzB4MjQ+CiAxMjI6CTAwODEzMDgzICAgICAgICAgIAlsZAlyYSw4KHNwKQog
MTI2OgkwMDAxMzQwMyAgICAgICAgICAJbGQJczAsMChzcCkKIDEyYToJMDEwMTAxMTMgICAgICAg
ICAgCWFkZGkJc3Asc3AsMTYKIDEyZToJNjQyMiAgICAgICAgICAgICAgICAJYy5sZHNwCXMwLDgo
c3ApCiAxMzA6CTAxNDEgICAgICAgICAgICAgICAgCWMuYWRkaQlzcCwxNgogMTMyOgk4MDgyICAg
ICAgICAgICAgICAgIAljLmpyCXJhCgowMDAwMDAwMDAwMDAwMTM0IDxhcmNoX3N5bmNfZG1hX2Zv
cl9jcHU+OgogMTM0OgkxMTQxICAgICAgICAgICAgICAgIAljLmFkZGkJc3AsLTE2CiAxMzY6CWU0
MjIgICAgICAgICAgICAgICAgCWMuc2RzcAlzMCw4KHNwKQogMTM4OgkwODAwICAgICAgICAgICAg
ICAgIAljLmFkZGk0c3BuCXMwLHNwLDE2CiAxM2E6CWZmZDY3NzkzICAgICAgICAgIAlhbmRpCWE1
LGEyLC0zCiAxM2U6CWU3YjUgICAgICAgICAgICAgICAgCWMuYm5leglhNSwxYWEgPC5MMjI+CiAx
NDA6CTAwMDAwZTE3ICAgICAgICAgIAlhdWlwYwl0MywweDAKIDE0NDoJMDAwZTJlMDMgICAgICAg
ICAgCWx3CXQzLDAodDMpICMgMTQwIDxhcmNoX3N5bmNfZG1hX2Zvcl9jcHUrMHhjPgogMTQ4Ogkw
MjBlMTMxMyAgICAgICAgICAJc2xsaQl0MSx0MywweDIwCiAxNGM6CTAwMDAwNzk3ICAgICAgICAg
IAlhdWlwYwlhNSwweDAKIDE1MDoJMDAwN2I3ODMgICAgICAgICAgCWxkCWE1LDAoYTUpICMgMTRj
IDxhcmNoX3N5bmNfZG1hX2Zvcl9jcHUrMHgxOD4KIDE1NDoJMDIwMzUzMTMgICAgICAgICAgCXNy
bGkJdDEsdDEsMHgyMAogMTU4Ogk5N2FhICAgICAgICAgICAgICAgIAljLmFkZAlhNSxhMAogMTVh
OgkwMjA2MTgxMyAgICAgICAgICAJc2xsaQlhNixhMiwweDIwCiAxNWU6CTQwNjAwMzMzICAgICAg
ICAgIAluZWcJdDEsdDEKIDE2MjoJODhhZSAgICAgICAgICAgICAgICAJYy5tdglhNyxhMQogMTY0
OgkwMGYzNzMzMyAgICAgICAgICAJYW5kCXQxLHQxLGE1CiAxNjg6CTAwZjU4ZWIzICAgICAgICAg
IAlhZGQJdDQsYTEsYTUKIDE2YzoJMDIwODU4MTMgICAgICAgICAgCXNybGkJYTYsYTYsMHgyMAog
MTcwOgk0ZjA1ICAgICAgICAgICAgICAgIAljLmxpCXQ1LDEKCjAwMDAwMDAwMDAwMDAxNzIgPC5M
ODg2XkIzPjoKIDE3MjoJZmYwMTAxMTMgICAgICAgICAgCWFkZGkJc3Asc3AsLTE2CiAxNzY6CTAw
ODEzMDIzICAgICAgICAgIAlzZAlzMCwwKHNwKQogMTdhOgkwMDExMzQyMyAgICAgICAgICAJc2QJ
cmEsOChzcCkKIDE3ZToJMDEwMTA0MTMgICAgICAgICAgCWFkZGkJczAsc3AsMTYKIDE4MjoJMDAw
ZjA3MTMgICAgICAgICAgCW12CWE0LHQ1CiAxODY6CTAwMDgwNjkzICAgICAgICAgIAltdglhMyxh
NgogMThhOgkwMDA4ODYxMyAgICAgICAgICAJbXYJYTIsYTcKIDE4ZToJMDAwNzg1OTMgICAgICAg
ICAgCW12CWExLGE1CiAxOTI6CTAwMGUwNTEzICAgICAgICAgIAltdglhMCx0MwogMTk2OgkwMDAw
MDA5NyAgICAgICAgICAJYXVpcGMJcmEsMHgwCiAxOWE6CTAwMDA4MGU3ICAgICAgICAgIAlqYWxy
CXJhICMgMTk2IDwuTDg4Nl5CMysweDI0PgogMTllOgkwMDgxMzA4MyAgICAgICAgICAJbGQJcmEs
OChzcCkKIDFhMjoJMDAwMTM0MDMgICAgICAgICAgCWxkCXMwLDAoc3ApCiAxYTY6CTAxMDEwMTEz
ICAgICAgICAgIAlhZGRpCXNwLHNwLDE2CgowMDAwMDAwMDAwMDAwMWFhIDwuTDIyPjoKIDFhYToJ
NjQyMiAgICAgICAgICAgICAgICAJYy5sZHNwCXMwLDgoc3ApCiAxYWM6CTAxNDEgICAgICAgICAg
ICAgICAgCWMuYWRkaQlzcCwxNgogMWFlOgk4MDgyICAgICAgICAgICAgICAgIAljLmpyCXJhCgow
MDAwMDAwMDAwMDAwMWIwIDxhcmNoX2RtYV9wcmVwX2NvaGVyZW50PjoKIDFiMDoJMTE0MSAgICAg
ICAgICAgICAgICAJYy5hZGRpCXNwLC0xNgogMWIyOgllNDIyICAgICAgICAgICAgICAgIAljLnNk
c3AJczAsOChzcCkKIDFiNDoJMDgwMCAgICAgICAgICAgICAgICAJYy5hZGRpNHNwbglzMCxzcCwx
NgogMWI2OgkwMDAwMDc5NyAgICAgICAgICAJYXVpcGMJYTUsMHgwCiAxYmE6CTAwMDdiNzgzICAg
ICAgICAgIAlsZAlhNSwwKGE1KSAjIDFiNiA8YXJjaF9kbWFfcHJlcF9jb2hlcmVudCsweDY+CiAx
YmU6CTQwZjUwN2IzICAgICAgICAgIAlzdWIJYTUsYTAsYTUKIDFjMjoJMDAwMDAzMTcgICAgICAg
ICAgCWF1aXBjCXQxLDB4MAogMWM2OgkwMDAzMjMwMyAgICAgICAgICAJbHcJdDEsMCh0MSkgIyAx
YzIgPGFyY2hfZG1hX3ByZXBfY29oZXJlbnQrMHgxMj4KIDFjYToJMDAwMDA1MTcgICAgICAgICAg
CWF1aXBjCWEwLDB4MAogMWNlOgkwMDA1MzUwMyAgICAgICAgICAJbGQJYTAsMChhMCkgIyAxY2Eg
PGFyY2hfZG1hX3ByZXBfY29oZXJlbnQrMHgxYT4KIDFkMjoJODc5OSAgICAgICAgICAgICAgICAJ
Yy5zcmFpCWE1LDB4NgogMWQ0Ogk5N2FhICAgICAgICAgICAgICAgIAljLmFkZAlhNSxhMAogMWQ2
OgkwMjAzMTgxMyAgICAgICAgICAJc2xsaQlhNix0MSwweDIwCiAxZGE6CTAwMDAwNzE3ICAgICAg
ICAgIAlhdWlwYwlhNCwweDAKIDFkZToJMDAwNzM3MDMgICAgICAgICAgCWxkCWE0LDAoYTQpICMg
MWRhIDxhcmNoX2RtYV9wcmVwX2NvaGVyZW50KzB4MmE+CiAxZTI6CTA3YjIgICAgICAgICAgICAg
ICAgCWMuc2xsaQlhNSwweGMKIDFlNDoJMDIwODU4MTMgICAgICAgICAgCXNybGkJYTYsYTYsMHgy
MAogMWU4Ogk5N2JhICAgICAgICAgICAgICAgIAljLmFkZAlhNSxhNAogMWVhOgk0MTAwMDgzMyAg
ICAgICAgICAJbmVnCWE2LGE2CiAxZWU6CTg4YWUgICAgICAgICAgICAgICAgCWMubXYJYTcsYTEK
IDFmMDoJMDBmODc4MzMgICAgICAgICAgCWFuZAlhNixhNixhNQogMWY0OgkwMGY1OGUzMyAgICAg
ICAgICAJYWRkCXQzLGExLGE1CiAxZjg6CTRlODEgICAgICAgICAgICAgICAgCWMubGkJdDQsMAog
MWZhOgk0ZjA5ICAgICAgICAgICAgICAgIAljLmxpCXQ1LDIKCjAwMDAwMDAwMDAwMDAxZmMgPC5M
ODg2XkI0PjoKIDFmYzoJZmYwMTAxMTMgICAgICAgICAgCWFkZGkJc3Asc3AsLTE2CiAyMDA6CTAw
ODEzMDIzICAgICAgICAgIAlzZAlzMCwwKHNwKQogMjA0OgkwMDExMzQyMyAgICAgICAgICAJc2QJ
cmEsOChzcCkKIDIwODoJMDEwMTA0MTMgICAgICAgICAgCWFkZGkJczAsc3AsMTYKIDIwYzoJMDAw
ZjA3MTMgICAgICAgICAgCW12CWE0LHQ1CiAyMTA6CTAwMGU4NjkzICAgICAgICAgIAltdglhMyx0
NAogMjE0OgkwMDA4ODYxMyAgICAgICAgICAJbXYJYTIsYTcKIDIxODoJMDAwNzg1OTMgICAgICAg
ICAgCW12CWExLGE1CiAyMWM6CTAwMDMwNTEzICAgICAgICAgIAltdglhMCx0MQogMjIwOgkwMDAw
MDA5NyAgICAgICAgICAJYXVpcGMJcmEsMHgwCiAyMjQ6CTAwMDA4MGU3ICAgICAgICAgIAlqYWxy
CXJhICMgMjIwIDwuTDg4Nl5CNCsweDI0PgogMjI4OgkwMDgxMzA4MyAgICAgICAgICAJbGQJcmEs
OChzcCkKIDIyYzoJMDAwMTM0MDMgICAgICAgICAgCWxkCXMwLDAoc3ApCiAyMzA6CTAxMDEwMTEz
ICAgICAgICAgIAlhZGRpCXNwLHNwLDE2CiAyMzQ6CTY0MjIgICAgICAgICAgICAgICAgCWMubGRz
cAlzMCw4KHNwKQogMjM2OgkwMTQxICAgICAgICAgICAgICAgIAljLmFkZGkJc3AsMTYKIDIzODoJ
ODA4MiAgICAgICAgICAgICAgICAJYy5qcglyYQoKMDAwMDAwMDAwMDAwMDIzYSA8YXJjaF9zZXR1
cF9kbWFfb3BzPjoKIDIzYToJNzE3OSAgICAgICAgICAgICAgICAJYy5hZGRpMTZzcAlzcCwtNDgK
IDIzYzoJZjAyMiAgICAgICAgICAgICAgICAJYy5zZHNwCXMwLDMyKHNwKQogMjNlOgllYzI2ICAg
ICAgICAgICAgICAgIAljLnNkc3AJczEsMjQoc3ApCiAyNDA6CWU4NGEgICAgICAgICAgICAgICAg
CWMuc2RzcAlzMiwxNihzcCkKIDI0MjoJZjQwNiAgICAgICAgICAgICAgICAJYy5zZHNwCXJhLDQw
KHNwKQogMjQ0OgllNDRlICAgICAgICAgICAgICAgIAljLnNkc3AJczMsOChzcCkKIDI0NjoJMTgw
MCAgICAgICAgICAgICAgICAJYy5hZGRpNHNwbglzMCxzcCw0OAogMjQ4Ogk4NGJhICAgICAgICAg
ICAgICAgIAljLm12CXMxLGE0CiAyNGE6CTg5MmEgICAgICAgICAgICAgICAgCWMubXYJczIsYTAK
IDI0YzoJZTMzMSAgICAgICAgICAgICAgICAJYy5ibmV6CWE0LDI5MCA8LkwyOT4KIDI0ZToJMDAw
MDA5OTcgICAgICAgICAgCWF1aXBjCXMzLDB4MAogMjUyOgkwMDA5ODk5MyAgICAgICAgICAJbXYJ
czMsczMKIDI1NjoJMDAwOWE3MDMgICAgICAgICAgCWx3CWE0LDAoczMpICMgMjRlIDxhcmNoX3Nl
dHVwX2RtYV9vcHMrMHgxND4KIDI1YToJMDQwMDA3OTMgICAgICAgICAgCWxpCWE1LDY0CiAyNWU6
CTA0ZTdlOTYzICAgICAgICAgIAlibHR1CWE1LGE0LDJiMCA8LkwzNT4KCjAwMDAwMDAwMDAwMDAy
NjIgPC5MMzA+OgogMjYyOgkwMDAwMDc5NyAgICAgICAgICAJYXVpcGMJYTUsMHgwCiAyNjY6CTAw
MDdjNzgzICAgICAgICAgIAlsYnUJYTUsMChhNSkgIyAyNjIgPC5MMzA+CiAyNmE6CWUzOWQgICAg
ICAgICAgICAgICAgCWMuYm5leglhNSwyOTAgPC5MMjk+CiAyNmM6CTg1NGEgICAgICAgICAgICAg
ICAgCWMubXYJYTAsczIKIDI2ZToJMDAwMDAwOTcgICAgICAgICAgCWF1aXBjCXJhLDB4MAogMjcy
OgkwMDAwODBlNyAgICAgICAgICAJamFscglyYSAjIDI2ZSA8LkwzMCsweGM+CiAyNzY6CTA1MDkz
NjAzICAgICAgICAgIAlsZAlhMiw4MChzMikKIDI3YToJYzIyZCAgICAgICAgICAgICAgICAJYy5i
ZXF6CWEyLDJkYyA8LkwzNj4KCjAwMDAwMDAwMDAwMDAyN2MgPC5MMzM+OgogMjdjOgk4NWFhICAg
ICAgICAgICAgICAgIAljLm12CWExLGEwCiAyN2U6CTAwMDAwNTE3ICAgICAgICAgIAlhdWlwYwlh
MCwweDAKIDI4MjoJMDAwNTA1MTMgICAgICAgICAgCW12CWEwLGEwCiAyODY6CTAwMDAwMDk3ICAg
ICAgICAgIAlhdWlwYwlyYSwweDAKIDI4YToJMDAwMDgwZTcgICAgICAgICAgCWphbHIJcmEgIyAy
ODYgPC5MMzMrMHhhPgoKMDAwMDAwMDAwMDAwMDI4ZSA8LkwxXkIxPjoKIDI4ZToJOTAwMiAgICAg
ICAgICAgICAgICAJYy5lYnJlYWsKCjAwMDAwMDAwMDAwMDAyOTAgPC5MMjk+OgogMjkwOgkyZWM5
NDc4MyAgICAgICAgICAJbGJ1CWE1LDc0OChzMikKIDI5NDoJODg4NSAgICAgICAgICAgICAgICAJ
Yy5hbmRpCXMxLDEKIDI5NjoJMDQ5NiAgICAgICAgICAgICAgICAJYy5zbGxpCXMxLDB4NQogMjk4
OglmZGY3Zjc5MyAgICAgICAgICAJYW5kaQlhNSxhNSwtMzMKIDI5YzoJOGNkZCAgICAgICAgICAg
ICAgICAJYy5vcglzMSxhNQogMjllOgkyZTk5MDYyMyAgICAgICAgICAJc2IJczEsNzQ4KHMyKQog
MmEyOgk3MGEyICAgICAgICAgICAgICAgIAljLmxkc3AJcmEsNDAoc3ApCiAyYTQ6CTc0MDIgICAg
ICAgICAgICAgICAgCWMubGRzcAlzMCwzMihzcCkKIDJhNjoJNjRlMiAgICAgICAgICAgICAgICAJ
Yy5sZHNwCXMxLDI0KHNwKQogMmE4Ogk2OTQyICAgICAgICAgICAgICAgIAljLmxkc3AJczIsMTYo
c3ApCiAyYWE6CTY5YTIgICAgICAgICAgICAgICAgCWMubGRzcAlzMyw4KHNwKQogMmFjOgk2MTQ1
ICAgICAgICAgICAgICAgIAljLmFkZGkxNnNwCXNwLDQ4CiAyYWU6CTgwODIgICAgICAgICAgICAg
ICAgCWMuanIJcmEKCjAwMDAwMDAwMDAwMDAyYjAgPC5MMzU+OgogMmIwOgkwMDAwMDA5NyAgICAg
ICAgICAJYXVpcGMJcmEsMHgwCiAyYjQ6CTAwMDA4MGU3ICAgICAgICAgIAlqYWxyCXJhICMgMmIw
IDwuTDM1PgogMmI4OgkwNTA5MzYwMyAgICAgICAgICAJbGQJYTIsODAoczIpCiAyYmM6CWMyMWQg
ICAgICAgICAgICAgICAgCWMuYmVxeglhMiwyZTIgPC5MMzc+CgowMDAwMDAwMDAwMDAwMmJlIDwu
TDMxPjoKIDJiZToJMDAwOWE3MDMgICAgICAgICAgCWx3CWE0LDAoczMpCiAyYzI6CTg1YWEgICAg
ICAgICAgICAgICAgCWMubXYJYTEsYTAKIDJjNDoJMDQwMDA2OTMgICAgICAgICAgCWxpCWEzLDY0
CiAyYzg6CTAwMDAwNTE3ICAgICAgICAgIAlhdWlwYwlhMCwweDAKIDJjYzoJMDAwNTA1MTMgICAg
ICAgICAgCW12CWEwLGEwCiAyZDA6CTAwMDAwMDk3ICAgICAgICAgIAlhdWlwYwlyYSwweDAKIDJk
NDoJMDAwMDgwZTcgICAgICAgICAgCWphbHIJcmEgIyAyZDAgPC5MMzErMHgxMj4KCjAwMDAwMDAw
MDAwMDAyZDggPC5MMV5CMj46CiAyZDg6CTkwMDIgICAgICAgICAgICAgICAgCWMuZWJyZWFrCiAy
ZGE6CWI3NjEgICAgICAgICAgICAgICAgCWMuagkyNjIgPC5MMzA+CgowMDAwMDAwMDAwMDAwMmRj
IDwuTDM2PjoKIDJkYzoJMDAwOTM2MDMgICAgICAgICAgCWxkCWEyLDAoczIpCiAyZTA6CWJmNzEg
ICAgICAgICAgICAgICAgCWMuagkyN2MgPC5MMzM+CgowMDAwMDAwMDAwMDAwMmUyIDwuTDM3PjoK
IDJlMjoJMDAwOTM2MDMgICAgICAgICAgCWxkCWEyLDAoczIpCiAyZTY6CWJmZTEgICAgICAgICAg
ICAgICAgCWMuagkyYmUgPC5MMzE+CgowMDAwMDAwMDAwMDAwMmU4IDxyaXNjdl9ub25jb2hlcmVu
dF9zdXBwb3J0ZWQ+OgogMmU4OgkwMDAwMDc5NyAgICAgICAgICAJYXVpcGMJYTUsMHgwCiAyZWM6
CTAwMDdhNzgzICAgICAgICAgIAlsdwlhNSwwKGE1KSAjIDJlOCA8cmlzY3Zfbm9uY29oZXJlbnRf
c3VwcG9ydGVkPgogMmYwOgljNzk5ICAgICAgICAgICAgICAgIAljLmJlcXoJYTUsMmZlIDwuTDQ0
PgogMmYyOgk0Nzg1ICAgICAgICAgICAgICAgIAljLmxpCWE1LDEKIDJmNDoJMDAwMDA3MTcgICAg
ICAgICAgCWF1aXBjCWE0LDB4MAogMmY4OgkwMGY3MDAyMyAgICAgICAgICAJc2IJYTUsMChhNCkg
IyAyZjQgPHJpc2N2X25vbmNvaGVyZW50X3N1cHBvcnRlZCsweGM+CiAyZmM6CTgwODIgICAgICAg
ICAgICAgICAgCWMuanIJcmEKCjAwMDAwMDAwMDAwMDAyZmUgPC5MNDQ+OgogMmZlOgkxMTQxICAg
ICAgICAgICAgICAgIAljLmFkZGkJc3AsLTE2CiAzMDA6CWU0MDYgICAgICAgICAgICAgICAgCWMu
c2RzcAlyYSw4KHNwKQogMzAyOgllMDIyICAgICAgICAgICAgICAgIAljLnNkc3AJczAsMChzcCkK
IDMwNDoJMDgwMCAgICAgICAgICAgICAgICAJYy5hZGRpNHNwbglzMCxzcCwxNgogMzA2OgkwMDAw
MDUxNyAgICAgICAgICAJYXVpcGMJYTAsMHgwCiAzMGE6CTAwMDUwNTEzICAgICAgICAgIAltdglh
MCxhMAogMzBlOgkwMDAwMDA5NyAgICAgICAgICAJYXVpcGMJcmEsMHgwCiAzMTI6CTAwMDA4MGU3
ICAgICAgICAgIAlqYWxyCXJhICMgMzBlIDwuTDQ0KzB4MTA+CgowMDAwMDAwMDAwMDAwMzE2IDwu
TDFeQjM+OgogMzE2Ogk5MDAyICAgICAgICAgICAgICAgIAljLmVicmVhawogMzE4Ogk2MGEyICAg
ICAgICAgICAgICAgIAljLmxkc3AJcmEsOChzcCkKIDMxYToJNjQwMiAgICAgICAgICAgICAgICAJ
Yy5sZHNwCXMwLDAoc3ApCiAzMWM6CTQ3ODUgICAgICAgICAgICAgICAgCWMubGkJYTUsMQogMzFl
OgkwMDAwMDcxNyAgICAgICAgICAJYXVpcGMJYTQsMHgwCiAzMjI6CTAwZjcwMDIzICAgICAgICAg
IAlzYglhNSwwKGE0KSAjIDMxZSA8LkwxXkIzKzB4OD4KIDMyNjoJMDE0MSAgICAgICAgICAgICAg
ICAJYy5hZGRpCXNwLDE2CiAzMjg6CTgwODIgICAgICAgICAgICAgICAgCWMuanIJcmEKCjAwMDAw
MDAwMDAwMDAzMmEgPC5MODg4XkIxPjoKIDMyYToJZmYwMTAxMTMgICAgICAgICAgCWFkZGkJc3As
c3AsLTE2CiAzMmU6CTAwODEzMDIzICAgICAgICAgIAlzZAlzMCwwKHNwKQogMzMyOgkwMDExMzQy
MyAgICAgICAgICAJc2QJcmEsOChzcCkKIDMzNjoJMDEwMTA0MTMgICAgICAgICAgCWFkZGkJczAs
c3AsMTYKIDMzYToJMDAwZjA3MTMgICAgICAgICAgCW12CWE0LHQ1CiAzM2U6CTAwMDc4NjkzICAg
ICAgICAgIAltdglhMyxhNQogMzQyOgkwMDA4ODYxMyAgICAgICAgICAJbXYJYTIsYTcKIDM0NjoJ
MDAwODA1OTMgICAgICAgICAgCW12CWExLGE2CiAzNGE6CTAwMGUwNTEzICAgICAgICAgIAltdglh
MCx0MwogMzRlOgkwMDAwMDA5NyAgICAgICAgICAJYXVpcGMJcmEsMHgwCiAzNTI6CTAwMDA4MGU3
ICAgICAgICAgIAlqYWxyCXJhICMgMzRlIDwuTDg4OF5CMSsweDI0PgogMzU2OgkwMDgxMzA4MyAg
ICAgICAgICAJbGQJcmEsOChzcCkKIDM1YToJMDAwMTM0MDMgICAgICAgICAgCWxkCXMwLDAoc3Ap
CiAzNWU6CTAxMDEwMTEzICAgICAgICAgIAlhZGRpCXNwLHNwLDE2CgowMDAwMDAwMDAwMDAwMzYy
IDwuTDg4OF5CMj46CiAzNjI6CWZmMDEwMTEzICAgICAgICAgIAlhZGRpCXNwLHNwLC0xNgogMzY2
OgkwMDgxMzAyMyAgICAgICAgICAJc2QJczAsMChzcCkKIDM2YToJMDAxMTM0MjMgICAgICAgICAg
CXNkCXJhLDgoc3ApCiAzNmU6CTAxMDEwNDEzICAgICAgICAgIAlhZGRpCXMwLHNwLDE2CiAzNzI6
CTAwMDc4NzEzICAgICAgICAgIAltdglhNCxhNQogMzc2OgkwMDA3ODY5MyAgICAgICAgICAJbXYJ
YTMsYTUKIDM3YToJMDAwODg2MTMgICAgICAgICAgCW12CWEyLGE3CiAzN2U6CTAwMDgwNTkzICAg
ICAgICAgIAltdglhMSxhNgogMzgyOgkwMDBlMDUxMyAgICAgICAgICAJbXYJYTAsdDMKIDM4NjoJ
MDAwMDAwOTcgICAgICAgICAgCWF1aXBjCXJhLDB4MAogMzhhOgkwMDAwODBlNyAgICAgICAgICAJ
amFscglyYSAjIDM4NiA8Lkw4ODheQjIrMHgyND4KIDM4ZToJMDA4MTMwODMgICAgICAgICAgCWxk
CXJhLDgoc3ApCiAzOTI6CTAwMDEzNDAzICAgICAgICAgIAlsZAlzMCwwKHNwKQogMzk2OgkwMTAx
MDExMyAgICAgICAgICAJYWRkaQlzcCxzcCwxNgoKMDAwMDAwMDAwMDAwMDM5YSA8Lkw4ODheQjM+
OgogMzlhOglmZjAxMDExMyAgICAgICAgICAJYWRkaQlzcCxzcCwtMTYKIDM5ZToJMDA4MTMwMjMg
ICAgICAgICAgCXNkCXMwLDAoc3ApCiAzYTI6CTAwMTEzNDIzICAgICAgICAgIAlzZAlyYSw4KHNw
KQogM2E2OgkwMTAxMDQxMyAgICAgICAgICAJYWRkaQlzMCxzcCwxNgogM2FhOgkwMDBmMDcxMyAg
ICAgICAgICAJbXYJYTQsdDUKIDNhZToJMDAwODA2OTMgICAgICAgICAgCW12CWEzLGE2CiAzYjI6
CTAwMDg4NjEzICAgICAgICAgIAltdglhMixhNwogM2I2OgkwMDA3ODU5MyAgICAgICAgICAJbXYJ
YTEsYTUKIDNiYToJMDAwZTA1MTMgICAgICAgICAgCW12CWEwLHQzCiAzYmU6CTAwMDAwMDk3ICAg
ICAgICAgIAlhdWlwYwlyYSwweDAKIDNjMjoJMDAwMDgwZTcgICAgICAgICAgCWphbHIJcmEgIyAz
YmUgPC5MODg4XkIzKzB4MjQ+CiAzYzY6CTAwODEzMDgzICAgICAgICAgIAlsZAlyYSw4KHNwKQog
M2NhOgkwMDAxMzQwMyAgICAgICAgICAJbGQJczAsMChzcCkKIDNjZToJMDEwMTAxMTMgICAgICAg
ICAgCWFkZGkJc3Asc3AsMTYKCjAwMDAwMDAwMDAwMDAzZDIgPC5MODg4XkI0PjoKIDNkMjoJZmYw
MTAxMTMgICAgICAgICAgCWFkZGkJc3Asc3AsLTE2CiAzZDY6CTAwODEzMDIzICAgICAgICAgIAlz
ZAlzMCwwKHNwKQogM2RhOgkwMDExMzQyMyAgICAgICAgICAJc2QJcmEsOChzcCkKIDNkZToJMDEw
MTA0MTMgICAgICAgICAgCWFkZGkJczAsc3AsMTYKIDNlMjoJMDAwZjA3MTMgICAgICAgICAgCW12
CWE0LHQ1CiAzZTY6CTAwMGU4NjkzICAgICAgICAgIAltdglhMyx0NAogM2VhOgkwMDA4ODYxMyAg
ICAgICAgICAJbXYJYTIsYTcKIDNlZToJMDAwNzg1OTMgICAgICAgICAgCW12CWExLGE1CiAzZjI6
CTAwMDMwNTEzICAgICAgICAgIAltdglhMCx0MQogM2Y2OgkwMDAwMDA5NyAgICAgICAgICAJYXVp
cGMJcmEsMHgwCiAzZmE6CTAwMDA4MGU3ICAgICAgICAgIAlqYWxyCXJhICMgM2Y2IDwuTDg4OF5C
NCsweDI0PgogM2ZlOgkwMDgxMzA4MyAgICAgICAgICAJbGQJcmEsOChzcCkKIDQwMjoJMDAwMTM0
MDMgICAgICAgICAgCWxkCXMwLDAoc3ApCiA0MDY6CTAxMDEwMTEzICAgICAgICAgIAlhZGRpCXNw
LHNwLDE2CgpEaXNhc3NlbWJseSBvZiBzZWN0aW9uIF9fa3N5bXRhYl9zdHJpbmdzOgoKMDAwMDAw
MDAwMDAwMDAwMCA8X19rc3RydGFiX3Rlc3RjYWxsX3ZpYV9hc21fY2FjaGU+OgogICAwOgk2NTc0
ICAgICAgICAgICAgICAgIAljLmxkCWEzLDIwMChhMCkKICAgMjoJNjE2Mzc0NzMgICAgICAgICAg
CWNzcnJjaQlzMCwweDYxNiw2CiAgIDY6CTZjNmMgICAgICAgICAgICAgICAgCWMubGQJYTEsMjE2
KHMwKQogICA4Ogk3NjVmIDYxNjkgNjE1ZiAgICAgIAkweDYxNWY2MTY5NzY1ZgogICBlOgk2MzVm
NmQ3MyAgICAgICAgICAJY3NycnNpCXMxMCwweDYzNSwzMAogIDEyOgk2MzYxICAgICAgICAgICAg
ICAgIAljLmx1aQl0MSwweDE4CiAgMTQ6CTY1NjggICAgICAgICAgICAgICAgCWMubGQJYTAsMjAw
KGEwKQoJLi4uCgowMDAwMDAwMDAwMDAwMDE3IDxfX2tzdHJ0YWJuc190ZXN0Y2FsbF92aWFfYXNt
X2NhY2hlPjoKCS4uLgoKMDAwMDAwMDAwMDAwMDAxOCA8X19rc3RydGFiX2NhY2hlX2RvX25vcD46
CiAgMTg6CTY4NjM2MTYzICAgICAgICAgIAlibHR1CXQxLHQxLDY5YSA8Lkw4ODleQjQrMHgyOTA+
CiAgMWM6CTVmNjUgICAgICAgICAgICAgICAgCWMubGkJdDUsLTcKICAxZToJNmY2NCAgICAgICAg
ICAgICAgICAJYy5sZAlzMSwyMTYoYTQpCiAgMjA6CTZlNWYgNzA2ZiAgICAgICAJMHg3MDZmNmU1
ZgoKMDAwMDAwMDAwMDAwMDAyNSA8X19rc3RydGFibnNfY2FjaGVfZG9fbm9wPjoKCS4uLgoKMDAw
MDAwMDAwMDAwMDAyNiA8X19rc3RydGFiX2NhY2hlX2RvX3ppY2JvbT46CiAgMjY6CTY4NjM2MTYz
ICAgICAgICAgIAlibHR1CXQxLHQxLDZhOCA8Lkw4ODleQjQrMHgyOWU+CiAgMmE6CTVmNjUgICAg
ICAgICAgICAgICAgCWMubGkJdDUsLTcKICAyYzoJNmY2NCAgICAgICAgICAgICAgICAJYy5sZAlz
MSwyMTYoYTQpCiAgMmU6CTdhNWYgNjM2OSA2ZjYyICAgICAgCTB4NmY2MjYzNjk3YTVmCiAgMzQ6
CTAwNmQgICAgICAgICAgICAgICAgCWMubm9wCTI3CgowMDAwMDAwMDAwMDAwMDM2IDxfX2tzdHJ0
YWJuc19jYWNoZV9kb196aWNib20+OgoJLi4uCgpEaXNhc3NlbWJseSBvZiBzZWN0aW9uIC5yb2Rh
dGEuc3RyMS44OgoKMDAwMDAwMDAwMDAwMDAwMCA8LkxDMD46CiAgIDA6CTMzMDEgICAgICAgICAg
ICAgICAgCWMuYWRkaXcJdDEsLTMyCiAgIDI6CTczMjUgICAgICAgICAgICAgICAgCWMubHVpCXQx
LDB4ZmZmZTkKICAgNDoJNjMyMCAgICAgICAgICAgICAgICAJYy5sZAlzMCw2NChhNCkKICAgNjoJ
NzM2MSAgICAgICAgICAgICAgICAJYy5sdWkJdDEsMHhmZmZmOAogICA4OgkyNTNkICAgICAgICAg
ICAgICAgIAljLmFkZGl3CWEwLDE1CiAgIGE6CTIwNzUgICAgICAgICAgICAgICAgCWMuamFsCWI2
IDwuTEMzKzB4MmU+CiAgIGM6CTYxNzYgICAgICAgICAgICAgICAgCWMubGRzcAlzcCwzNDQoc3Ap
CiAgIGU6CTY0NjQgICAgICAgICAgICAgICAgCWMubGQJczEsMjAwKHMwKQogIDEwOgkzZDcyICAg
ICAgICAgICAgICAgIAljLmZsZHNwCWZzMTAsMzEyKHNwKQogIDEyOgk3MDI1ICAgICAgICAgICAg
ICAgIAljLmx1aQl6ZXJvLDB4ZmZmZTkKICAxNDoJNzMyMCAgICAgICAgICAgICAgICAJYy5sZAlz
MCw5NihhNCkKICAxNjoJN2E2OSAgICAgICAgICAgICAgICAJYy5sdWkJczQsMHhmZmZmYQogIDE4
OgkzYTY1ICAgICAgICAgICAgICAgIAljLmFkZGl3CXM0LC03CiAgMWE6CTZjMjUgICAgICAgICAg
ICAgICAgCWMubHVpCXM4LDB4OQogIDFjOgkwYTc4ICAgICAgICAgICAgICAgIAljLmFkZGk0c3Bu
CWE0LHNwLDI4NAoJLi4uCgowMDAwMDAwMDAwMDAwMDIwIDwuTEMxPjoKICAyMDoJNzMyNSAgICAg
ICAgICAgICAgICAJYy5sdWkJdDEsMHhmZmZlOQogIDIyOgkyNTIwICAgICAgICAgICAgICAgIAlj
LmZsZAlmczAsNzIoYTApCiAgMjQ6CTQxMjAzYTczICAgICAgICAgIAljc3JyYwlzNCwweDQxMix6
ZXJvCiAgMjg6CTQzNTIgICAgICAgICAgICAgICAgCWMubHdzcAl0MSwyMChzcCkKICAyYToJNWY0
OCAgICAgICAgICAgICAgICAJYy5sdwlhMCw2MChhNCkKICAyYzoJNGQ0NCAgICAgICAgICAgICAg
ICAJYy5sdwlzMSwyOChhMCkKICAyZToJNWY0MSAgICAgICAgICAgICAgICAJYy5saQl0NSwtMTYK
ICAzMDoJNDk0ZCAgICAgICAgICAgICAgICAJYy5saQlzMiwxOQogIDMyOgk0MTRlICAgICAgICAg
ICAgICAgIAljLmx3c3AJc3AsMjA4KHNwKQogIDM0Ogk0OTRjICAgICAgICAgICAgICAgIAljLmx3
CWExLDIwKGEwKQogIDM2Ogk3MzIwNGU0NyAgICAgICAgICAJZm1zdWIuZAlmdDgsZnQwLGZzMixm
YTQscm1tCiAgM2E6CTYxNmQgICAgICAgICAgICAgICAgCWMuYWRkaTE2c3AJc3AsMjQwCiAgM2M6
CTZjNmMgICAgICAgICAgICAgICAgCWMubGQJYTEsMjE2KHMwKQogIDNlOgk3MjY1ICAgICAgICAg
ICAgICAgIAljLmx1aQl0cCwweGZmZmY5CiAgNDA6CTc0MjAgICAgICAgICAgICAgICAgCWMubGQJ
czAsMTA0KHMwKQogIDQyOgk2MTY4ICAgICAgICAgICAgICAgIAljLmxkCWEwLDE5MihhMCkKICA0
NDoJMjA2ZSAgICAgICAgICAgICAgICAJYy5mbGRzcAlmdDAsMjE2KHNwKQogIDQ2Ogk2OTcyICAg
ICAgICAgICAgICAgIAljLmxkc3AJczIsMjgwKHNwKQogIDQ4OgkyYzc2NjM3MyAgICAgICAgICAJ
Y3NycnNpCXQxLDB4MmM3LDEyCiAgNGM6CTZkNmY2MjYzICAgICAgICAgIAlibHR1CXQ1LHM2LDcx
MCA8Lkw4ODleQjQrMHgzMDY+CiAgNTA6CTYyMmQgICAgICAgICAgICAgICAgCWMubHVpCXRwLDB4
YgogIDUyOgk2ZjZjICAgICAgICAgICAgICAgIAljLmxkCWExLDIxNihhNCkKICA1NDoJNzMyZDZi
NjMgICAgICAgICAgCWJsdHUJczEwLHMyLDc4YSA8Lkw4ODleQjQrMHgzODA+CiAgNTg6CTdhNjkg
ICAgICAgICAgICAgICAgCWMubHVpCXM0LDB4ZmZmZmEKICA1YToJMjA2NSAgICAgICAgICAgICAg
ICAJYy5qYWwJMTAyIDwuTEM0KzB4MzI+CiAgNWM6CTI1MjggICAgICAgICAgICAgICAgCWMuZmxk
CWZhMCw3MihhMCkKICA1ZToJMjA2NCAgICAgICAgICAgICAgICAJYy5mbGQJZnMxLDE5MihzMCkK
ICA2MDoJMjAzYyAgICAgICAgICAgICAgICAJYy5mbGQJZmE1LDY0KHMwKQogIDYyOgk2NDI1ICAg
ICAgICAgICAgICAgIAljLmx1aQlzMCwweDkKICA2NDoJMDAyOSAgICAgICAgICAgICAgICAJYy5u
b3AJMTAKCS4uLgoKMDAwMDAwMDAwMDAwMDA2OCA8LkxDMj46CiAgNjg6CTcyNjEgICAgICAgICAg
ICAgICAgCWMubHVpCXRwLDB4ZmZmZjgKICA2YToJNzIyZjY4NjMgICAgICAgICAgCWJsdHUJdDUs
c3AsNzlhIDwuTDg4OV5CNCsweDM5MD4KICA2ZToJNzM2OSAgICAgICAgICAgICAgICAJYy5sdWkJ
dDEsMHhmZmZmYQogIDcwOgk2ZDJmNzY2MyAgICAgICAgICAJYmdldQl0NSxzMiw3M2MgPC5MODg5
XkI0KzB4MzMyPgogIDc0OgkyZjZkICAgICAgICAgICAgICAgIAljLmFkZGl3CXQ1LDI3CiAgNzY6
CTZkNjQgICAgICAgICAgICAgICAgCWMubGQJczEsMjE2KGEwKQogIDc4OgkyZDYxICAgICAgICAg
ICAgICAgIAljLmFkZGl3CXMxMCwyNAogIDdhOgk2ZjZlICAgICAgICAgICAgICAgIAljLmxkc3AJ
dDUsMjE2KHNwKQogIDdjOgk2MzZlICAgICAgICAgICAgICAgIAljLmxkc3AJdDEsMjE2KHNwKQog
IDdlOgk3MjY1Njg2ZiAgICAgICAgICAJamFsCWE2LDU2N2E0IDwuTDg4OV5CNCsweDU2MzlhPgog
IDgyOgk2ZTY1ICAgICAgICAgICAgICAgIAljLmx1aQl0MywweDE5CiAgODQ6CTJlNzQgICAgICAg
ICAgICAgICAgCWMuZmxkCWZhMywyMTYoYTIpCiAgODY6CSAgICAgICAgICAJYmVxCWEwLHMyLDdh
NiA8Lkw4ODleQjQrMHgzOWM+CgowMDAwMDAwMDAwMDAwMDg4IDwuTEMzPjoKICA4ODoJNzMyNSAg
ICAgICAgICAgICAgICAJYy5sdWkJdDEsMHhmZmZlOQogIDhhOgkyNTIwICAgICAgICAgICAgICAg
IAljLmZsZAlmczAsNzIoYTApCiAgOGM6CTY0MjAzYTczICAgICAgICAgIAljc3JyYwlzNCwweDY0
Mix6ZXJvCiAgOTA6CTc2NjUgICAgICAgICAgICAgICAgCWMubHVpCWEyLDB4ZmZmZjkKICA5MjoJ
NjM2OSAgICAgICAgICAgICAgICAJYy5sdWkJdDEsMHgxYQogIDk0OgkyMDY1ICAgICAgICAgICAg
ICAgIAljLmphbAkxM2MgPGFyY2hfc3luY19kbWFfZm9yX2NwdSsweDg+CiAgOTY6CTZmNmUgICAg
ICAgICAgICAgICAgCWMubGRzcAl0NSwyMTYoc3ApCiAgOTg6CTJkNmUgICAgICAgICAgICAgICAg
CWMuZmxkc3AJZnMxMCwyMTYoc3ApCiAgOWE6CTY1Njg2ZjYzICAgICAgICAgIAlibHR1CWE2LHM2
LDZmOCA8Lkw4ODleQjQrMHgyZWU+CiAgOWU6CTY1NzIgICAgICAgICAgICAgICAgCWMubGRzcAlh
MCwyODAoc3ApCiAgYTA6CTc0NmUgICAgICAgICAgICAgICAgCWMubGRzcAlzMCwyNDgoc3ApCiAg
YTI6CTYyMjAgICAgICAgICAgICAgICAgCWMubGQJczAsNjQoYTIpCiAgYTQ6CTc0NzUgICAgICAg
ICAgICAgICAgCWMubHVpCXMwLDB4ZmZmZmQKICBhNjoJNmUyMCAgICAgICAgICAgICAgICAJYy5s
ZAlzMCw4OChhMikKICBhODoJNmY2ZTIwNmYgICAgICAgICAgCWoJZTI3OWUgPC5MODg5XkI0KzB4
ZTIzOTQ+CiAgYWM6CTJkNmUgICAgICAgICAgICAgICAgCWMuZmxkc3AJZnMxMCwyMTYoc3ApCiAg
YWU6CTY1Njg2ZjYzICAgICAgICAgIAlibHR1CWE2LHM2LDcwYyA8Lkw4ODleQjQrMHgzMDI+CiAg
YjI6CTY1NzIgICAgICAgICAgICAgICAgCWMubGRzcAlhMCwyODAoc3ApCiAgYjQ6CTc0NmUgICAg
ICAgICAgICAgICAgCWMubGRzcAlzMCwyNDgoc3ApCiAgYjY6CTZmMjAgICAgICAgICAgICAgICAg
CWMubGQJczAsODgoYTQpCiAgYjg6CTY1NzAgICAgICAgICAgICAgICAgCWMubGQJYTIsMjAwKGEw
KQogIGJhOgk2MTcyICAgICAgICAgICAgICAgIAljLmxkc3AJc3AsMjgwKHNwKQogIGJjOgk2OTc0
ICAgICAgICAgICAgICAgIAljLmxkCWEzLDIwOChhMCkKICBiZToJMjA3MzZlNmYgICAgICAgICAg
CWphbAl0MywzNmFjNCA8Lkw4ODleQjQrMHgzNjZiYT4KICBjMjoJNzA3MDc1NzMgICAgICAgICAg
CWNzcnJjaQlhMCwweDcwNywwCiAgYzY6CTY1NzQ3MjZmICAgICAgICAgIAlqYWwJdHAsNDdmMWMg
PC5MODg5XkI0KzB4NDdiMTI+CiAgY2E6CTAwNjQgICAgICAgICAgICAgICAgCWMuYWRkaTRzcG4J
czEsc3AsMTIKICBjYzoJMDAwMCAgICAgICAgICAgICAgICAJdW5pbXAKCS4uLgoKMDAwMDAwMDAw
MDAwMDBkMCA8LkxDND46CiAgZDA6CTZmNGUgICAgICAgICAgICAgICAgCWMubGRzcAl0NSwyMDgo
c3ApCiAgZDI6CTJkNmUgICAgICAgICAgICAgICAgCWMuZmxkc3AJZnMxMCwyMTYoc3ApCiAgZDQ6
CTY1Njg2ZjYzICAgICAgICAgIAlibHR1CWE2LHM2LDczMiA8Lkw4ODleQjQrMHgzMjg+CiAgZDg6
CTY1NzIgICAgICAgICAgICAgICAgCWMubGRzcAlhMCwyODAoc3ApCiAgZGE6CTc0NmUgICAgICAg
ICAgICAgICAgCWMubGRzcAlzMCwyNDgoc3ApCiAgZGM6CTQ0MjAgICAgICAgICAgICAgICAgCWMu
bHcJczAsNzIoczApCiAgZGU6CTQxNGQgICAgICAgICAgICAgICAgCWMubGkJc3AsMTkKICBlMDoJ
NzMyMCAgICAgICAgICAgICAgICAJYy5sZAlzMCw5NihhNCkKICBlMjoJNzA3NSAgICAgICAgICAg
ICAgICAJYy5sdWkJemVybywweGZmZmZkCiAgZTQ6CTZmNzAgICAgICAgICAgICAgICAgCWMubGQJ
YTIsMjE2KGE0KQogIGU2Ogk3NDcyICAgICAgICAgICAgICAgIAljLmxkc3AJczAsMzEyKHNwKQog
IGU4Ogk2NTIwICAgICAgICAgICAgICAgIAljLmxkCXMwLDcyKGEwKQogIGVhOgk2MTZlICAgICAg
ICAgICAgICAgIAljLmxkc3AJc3AsMjE2KHNwKQogIGVjOgk2YzYyICAgICAgICAgICAgICAgIAlj
Lmxkc3AJczgsMjQoc3ApCiAgZWU6CTY0NjUgICAgICAgICAgICAgICAgCWMubHVpCXMwLDB4MTkK
ICBmMDoJNzcyMCAgICAgICAgICAgICAgICAJYy5sZAlzMCwxMDQoYTQpCiAgZjI6CTc0NjkgICAg
ICAgICAgICAgICAgCWMubHVpCXMwLDB4ZmZmZmEKICBmNDoJNmY2OCAgICAgICAgICAgICAgICAJ
Yy5sZAlhMCwyMTYoYTQpCiAgZjY6CTc0NzUgICAgICAgICAgICAgICAgCWMubHVpCXMwLDB4ZmZm
ZmQKICBmODoJNjEyMCAgICAgICAgICAgICAgICAJYy5sZAlzMCw2NChhMCkKICBmYToJNjIyMCAg
ICAgICAgICAgICAgICAJYy5sZAlzMCw2NChhMikKICBmYzoJNmY2YyAgICAgICAgICAgICAgICAJ
Yy5sZAlhMSwyMTYoYTQpCiAgZmU6CTczMjA2YjYzICAgICAgICAgIAlibHR1CXplcm8sczIsODM0
IDwuTDg4OV5CNCsweDQyYT4KIDEwMjoJN2E2OSAgICAgICAgICAgICAgICAJYy5sdWkJczQsMHhm
ZmZmYQogMTA0OgkwYTY1ICAgICAgICAgICAgICAgIAljLmFkZGkJczQsMjUKCS4uLgoKRGlzYXNz
ZW1ibHkgb2Ygc2VjdGlvbiAudGV4dC51bmxpa2VseToKCjAwMDAwMDAwMDAwMDAwMDAgPGNhY2hl
X2RvX3ppY2JvbT46CiAgIDA6CTExNDEgICAgICAgICAgICAgICAgCWMuYWRkaQlzcCwtMTYKICAg
MjoJZTAyMiAgICAgICAgICAgICAgICAJYy5zZHNwCXMwLDAoc3ApCiAgIDQ6CWU0MDYgICAgICAg
ICAgICAgICAgCWMuc2RzcAlyYSw4KHNwKQogICA2OgkwODAwICAgICAgICAgICAgICAgIAljLmFk
ZGk0c3BuCXMwLHNwLDE2CiAgIDg6CTg2YWUgICAgICAgICAgICAgICAgCWMubXYJYTMsYTEKICAg
YToJODczMiAgICAgICAgICAgICAgICAJYy5tdglhNCxhMgogICBjOgkwMDAwMDU5NyAgICAgICAg
ICAJYXVpcGMJYTEsMHgwCiAgMTA6CTAwMDU4NTkzICAgICAgICAgIAltdglhMSxhMQogIDE0Ogk4
NjJhICAgICAgICAgICAgICAgIAljLm12CWEyLGEwCiAgMTY6CTAwMDAwNTE3ICAgICAgICAgIAlh
dWlwYwlhMCwweDAKICAxYToJMDAwNTA1MTMgICAgICAgICAgCW12CWEwLGEwCiAgMWU6CTAwMDAw
MDk3ICAgICAgICAgIAlhdWlwYwlyYSwweDAKICAyMjoJMDAwMDgwZTcgICAgICAgICAgCWphbHIJ
cmEgIyAxZSA8Y2FjaGVfZG9femljYm9tKzB4MWU+CiAgMjY6CTYwYTIgICAgICAgICAgICAgICAg
CWMubGRzcAlyYSw4KHNwKQogIDI4Ogk2NDAyICAgICAgICAgICAgICAgIAljLmxkc3AJczAsMChz
cCkKICAyYToJMDE0MSAgICAgICAgICAgICAgICAJYy5hZGRpCXNwLDE2CiAgMmM6CTgwODIgICAg
ICAgICAgICAgICAgCWMuanIJcmEKCkRpc2Fzc2VtYmx5IG9mIHNlY3Rpb24gLmFsdGVybmF0aXZl
OgoKMDAwMDAwMDAwMDAwMDAwMCA8LmFsdGVybmF0aXZlPjoKCS4uLgogIDEwOgkwMzFlICAgICAg
ICAgICAgICAgIAljLnNsbGkJdDEsMHg3CgkuLi4KICAzMjoJMDAwMCAgICAgICAgICAgICAgICAJ
dW5pbXAKICAzNDoJMDMxZSAgICAgICAgICAgICAgICAJYy5zbGxpCXQxLDB4NwoJLi4uCiAgNTY6
CTAwMDAgICAgICAgICAgICAgICAgCXVuaW1wCiAgNTg6CTAzMWUgICAgICAgICAgICAgICAgCWMu
c2xsaQl0MSwweDcKCS4uLgogIDdhOgkwMDAwICAgICAgICAgICAgICAgIAl1bmltcAogIDdjOgkw
MzFlICAgICAgICAgICAgICAgIAljLnNsbGkJdDEsMHg3CgkuLi4KCkRpc2Fzc2VtYmx5IG9mIHNl
Y3Rpb24gX19idWdfdGFibGU6CgowMDAwMDAwMDAwMDAwMDAwIDxfX2J1Z190YWJsZT46CgkuLi4K
ICAgODoJMDBkOSAgICAgICAgICAgICAgICAJYy5hZGRpCXJhLDIyCiAgIGE6CTAyMDkgICAgICAg
ICAgICAgICAgCWMuYWRkaQl0cCwyCgkuLi4KICAxNDoJMDIwOTAwZDMgICAgICAgICAgCWZhZGQu
ZAlmdDEsZnMyLGZ0MCxybmUKCS4uLgogIDIwOgkwMGUyICAgICAgICAgICAgICAgIAljLnNsbGkJ
cmEsMHgxOAogIDIyOgkwOTA5ICAgICAgICAgICAgICAgIAljLmFkZGkJczIsMgoKRGlzYXNzZW1i
bHkgb2Ygc2VjdGlvbiAucm9kYXRhOgoKMDAwMDAwMDAwMDAwMDAwMCA8X19mdW5jX18uMzY4ODY+
OgogICAwOgk2ODYzNjE2MyAgICAgICAgICAJYmx0dQl0MSx0MSw2ODIgPC5MODg5XkI0KzB4Mjc4
PgogICA0Ogk1ZjY1ICAgICAgICAgICAgICAgIAljLmxpCXQ1LC03CiAgIDY6CTZmNjQgICAgICAg
ICAgICAgICAgCWMubGQJczEsMjE2KGE0KQogICA4Ogk3YTVmIDYzNjkgNmY2MiAgICAgIAkweDZm
NjI2MzY5N2E1ZgogICBlOgkwMDZkICAgICAgICAgICAgICAgIAljLm5vcAkyNwoKRGlzYXNzZW1i
bHkgb2Ygc2VjdGlvbiAuc2JzczoKCjAwMDAwMDAwMDAwMDAwMDAgPG5vbmNvaGVyZW50X3N1cHBv
cnRlZD46CgkuLi4KCkRpc2Fzc2VtYmx5IG9mIHNlY3Rpb24gX19fa3N5bXRhYitjYWNoZV9kb19u
b3A6CgowMDAwMDAwMDAwMDAwMDAwIDxfX2tzeW10YWJfY2FjaGVfZG9fbm9wPjoKCS4uLgoKRGlz
YXNzZW1ibHkgb2Ygc2VjdGlvbiBfX19rc3ltdGFiK2NhY2hlX2RvX3ppY2JvbToKCjAwMDAwMDAw
MDAwMDAwMDAgPF9fa3N5bXRhYl9jYWNoZV9kb196aWNib20+OgoJLi4uCgpEaXNhc3NlbWJseSBv
ZiBzZWN0aW9uIF9fX2tzeW10YWIrdGVzdGNhbGxfdmlhX2FzbV9jYWNoZToKCjAwMDAwMDAwMDAw
MDAwMDAgPF9fa3N5bXRhYl90ZXN0Y2FsbF92aWFfYXNtX2NhY2hlPjoKCS4uLgoKRGlzYXNzZW1i
bHkgb2Ygc2VjdGlvbiAuY29tbWVudDoKCjAwMDAwMDAwMDAwMDAwMDAgPC5jb21tZW50PjoKICAg
MDoJNDcwMCAgICAgICAgICAgICAgICAJYy5sdwlzMCw4KGE0KQogICAyOgkyMDNhNDM0MyAgICAg
ICAgICAJZm1hZGQucwlmdDYsZnM0LGZ0MyxmdDQscm1tCiAgIDY6CTU1MjggICAgICAgICAgICAg
ICAgCWMubHcJYTAsMTA0KGEwKQogICA4Ogk3NTYyICAgICAgICAgICAgICAgIAljLmxkc3AJYTAs
NTYoc3ApCiAgIGE6CTc0NmUgICAgICAgICAgICAgICAgCWMubGRzcAlzMCwyNDgoc3ApCiAgIGM6
CTIwNzUgICAgICAgICAgICAgICAgCWMuamFsCWI4IDwuTDg4Nl5CMSsweDFjPgogICBlOgkyZTM5
ICAgICAgICAgICAgICAgIAljLmFkZGl3CXQzLDE0CiAgMTA6CTJlMzQgICAgICAgICAgICAgICAg
CWMuZmxkCWZhMyw4OChhMikKICAxMjoJMmQzMCAgICAgICAgICAgICAgICAJYy5mbGQJZmEyLDg4
KGEwKQogIDE0Ogk3NTMxICAgICAgICAgICAgICAgIAljLmx1aQlhMCwweGZmZmVjCiAgMTY6CTc1
NjIgICAgICAgICAgICAgICAgCWMubGRzcAlhMCw1NihzcCkKICAxODoJNzQ2ZSAgICAgICAgICAg
ICAgICAJYy5sZHNwCXMwLDI0OChzcCkKICAxYToJMzE3NSAgICAgICAgICAgICAgICAJYy5hZGRp
dwlzcCwtMwogIDFjOgkzMjdlICAgICAgICAgICAgICAgIAljLmZsZHNwCWZ0NCw1MDQoc3ApCiAg
MWU6CTJlMzAgICAgICAgICAgICAgICAgCWMuZmxkCWZhMiw4OChhMikKICAyMDoJMzQzMCAgICAg
ICAgICAgICAgICAJYy5mbGQJZmEyLDEwNChzMCkKICAyMjoJMjAyOSAgICAgICAgICAgICAgICAJ
Yy5qYWwJMmMgPC5MMTYrMHgyPgogIDI0OgkyZTM5ICAgICAgICAgICAgICAgIAljLmFkZGl3CXQz
LDE0CiAgMjY6CTJlMzQgICAgICAgICAgICAgICAgCWMuZmxkCWZhMyw4OChhMikKICAyODoJMDAz
MCAgICAgICAgICAgICAgICAJYy5hZGRpNHNwbglhMixzcCw4Cg==
--000000000000514b9805ee01c955
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--000000000000514b9805ee01c955--

