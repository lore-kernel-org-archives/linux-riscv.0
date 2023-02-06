Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7B0C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 12:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sp97s+ZthwagNVVLPcfAsfBoD7TsoQGS5lK5eF2PTXo=; b=hiVnWHP8ZM+3uU
	tpnO1qhWRRIe/cz+JFZiKJ/DVwHNp4ja8U+u56qTXJCjoRBPSUmGyNSaj1VoxZCGPYsMWC5Vh6cHi
	y/NnPKps9Y7lme7uLrm2JvNDrbAVsz3WxFVDECRYwCfj8PvT/gTCNbtadzsY+fN014/duIUIDgE96
	1BQcayf5p9bxR9Ej3dwEOAAM93d0K7WGc8DzJWMtgEjx8b+jH6RwcVwsuDBFe8Hy/R2sphmQPfVAa
	tlu9UoWCBAUjUV34SFVqA+Hq/YzDFukzM2jqDyiY8gJNcKUX1XljYZfaw4Y7ciFssuY/LoMLBVd+o
	pPaTSJLPi/v0l+HJ0usQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP0AM-008OW8-Un; Mon, 06 Feb 2023 12:00:10 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP0AJ-008OTW-2K
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 12:00:09 +0000
Received: by mail-yb1-xb31.google.com with SMTP id o187so14108229ybg.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Feb 2023 04:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8GfvSaAQkVpO0Jtecn+/pnVKhU3DzH4w27hzT0aLxZY=;
        b=CPSfhtUtimVdEA86BfrV6C8XtXzo5DvA7KJJBf4mVOzjVNFjuHGtcmUTR2oLxtNs2i
         BWo33f/7ZOZU8ZKJd3xCotzKAK8eUiuL9Xk6N4f95l/yqOQk2rpaISY57fAGOSTWuSMh
         B5NKo7ZsdA7gR7U2DPHBAm+i+6geABCeaXlhaMk2cJ9p946wzS8YZhWh69oDhG7jxc+D
         u+0H1ROdoKcSnnLWHlEmPCTbf7Uhkn5ooB8DNW5qxg0fbX8YcFVXvQgqhetdoR/eLwO4
         52cNtx1SAm7xlakFc63gIqa+NaXVxkmusBBMKULlmaotp+eG2hrB2tC/uLOvu50lBAKm
         U8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8GfvSaAQkVpO0Jtecn+/pnVKhU3DzH4w27hzT0aLxZY=;
        b=j7MdsnvmBIGcbCouis2/YFg430PIqB4SrhDKa8fYk9KjD78kdq8txm/Q07TNHniaCt
         hhD4lK21D0urUZzqkzplOYpT4+x5e3B9v0alDERU4IwIKjyaWgh9wHpB2x+0dv00MNJS
         zWTS6uyAAA6PdDSROkIjRMv4zFb6qOIN7uHnMTzwjn8qbMbv2xaTv+/B3/J5/6vzszek
         qRZOROnyrt6V6aIELa45ukuX1hn+BEm5wwOFXnJ5ThrK/+kHEtXHhCMppeKsF51Pj33A
         Vy21oDk+u+2Bh9vj+j0A6qdlrGuFLRly2VC2WaTUTDnsp/hE6+MP8KULckRXkiWV3rkC
         Uqbw==
X-Gm-Message-State: AO0yUKWZe+mp2j2nrDO8ZpunqvcFunXOK1g57+ZKGowuGHNGwuHiobV2
	k9l3jNTAg59+CPUdl81CF3aUsJljMZbdmpV2NMPRfQ==
X-Google-Smtp-Source: AK7set8QISdXX60gkcablhXn8HWEOWgtSKz43oPFHhyh52WEtm05AuNldrvDc741z9NVr1QOzivJgdw8lrcM5j35WSk=
X-Received: by 2002:a25:b293:0:b0:80b:9566:d574 with SMTP id
 k19-20020a25b293000000b0080b9566d574mr2063325ybj.83.1675684803870; Mon, 06
 Feb 2023 04:00:03 -0800 (PST)
MIME-Version: 1.0
References: <20230125142056.18356-1-andy.chiu@sifive.com> <20230125142056.18356-11-andy.chiu@sifive.com>
 <Y9MIr2iR5rzlIGKQ@spud>
In-Reply-To: <Y9MIr2iR5rzlIGKQ@spud>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 6 Feb 2023 20:00:00 +0800
Message-ID: <CABgGipW_3tBbc3G91dqiAZCGeN-PbUvLS3n=bU0nWz0rRX9T8Q@mail.gmail.com>
Subject: Re: [PATCH -next v13 10/19] riscv: Allocate user's vector context in
 the first-use trap
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org, 
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Vincent Chen <vincent.chen@sifive.com>, Guo Ren <guoren@kernel.org>, 
	Li Zhengyu <lizhengyu3@huawei.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Changbin Du <changbin.du@intel.com>, Richard Henderson <richard.henderson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_040007_125353_765647F2 
X-CRM114-Status: GOOD (  46.24  )
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

On Fri, Jan 27, 2023 at 7:11 AM Conor Dooley <conor@kernel.org> wrote:
> > +
> > +/* parts of opcode for RVV */
> > +#define OPCODE_VECTOR                0x57
> > +#define LSFP_WIDTH_RVV_8     0
> > +#define LSFP_WIDTH_RVV_16    5
> > +#define LSFP_WIDTH_RVV_32    6
> > +#define LSFP_WIDTH_RVV_64    7
>
> All of this needs a prefix though, not the almost-postfix you've added.
> IOW, move the RVV to the start.
Thanks for the note. Changing to RVV_VL_VS_WIDTH_*
>
> > +
> > +/* parts of opcode for RVF, RVD and RVQ */
> > +#define LSFP_WIDTH_OFF               12
> > +#define LSFP_WIDTH_MASK              GENMASK(3, 0)
>
> These all get an RVG_ prefix, no? Or does the Q prevent that? Either
> way, they do need a prefix.
>
> > +#define LSFP_WIDTH_FP_W              2
> > +#define LSFP_WIDTH_FP_D              3
> > +#define LSFP_WIDTH_FP_Q              4
>
> LSFP isn't something that has hits in the spec, which is annoying for
> cross checking IMO. If it were me, I'd likely do something like
> RVG_FLW_FSW_WIDTH since then it is abundantly clear what this is the
> width of.
Ok, s/LSFP_WIDTH_/RVFDQ_FL_FS_WIDTH_/
>
> > +#define OPCODE_LOADFP                0x07
> > +#define OPCODE_STOREFP               0x27
>
> Same comment about prefix here. I'd be tempted to make these names match
> the spec too, but it is clear enough to me what this are at the moment.
>
These will be changed to RVFDQ_OPCODE_{FL|FS} In the next revision.
> > +#define EXTRACT_LOAD_STORE_FP_WIDTH(x) \
> > +#define EXTRACT_SYSTEM_CSR(x) \
>
> Prefixes again here please!
Adding RVG prefix and changing to RVFDQ_EXRACT_FL_FS_WIDTH
> > +     if (opcode == OPCODE_VECTOR) {
> > +             return true;
> > +     }
>
>        if (opcode == OPCODE_LOADFP || opcode == OPCODE_STOREFP) {
> The above returns, so there's no need for the else
>
> > +             u32 width = EXTRACT_LOAD_STORE_FP_WIDTH(insn_buf);
> > +
> > +             if (width == LSFP_WIDTH_RVV_8 || width == LSFP_WIDTH_RVV_16 ||
> > +                 width == LSFP_WIDTH_RVV_32 || width == LSFP_WIDTH_RVV_64)
> > +                     return true;
>
> I suppose you could also add else return false, thereby dropping the
> else in the line below too, but that's a matter of preference :)
>
> > +     } else if (opcode == RVG_OPCODE_SYSTEM) {
> > +             u32 csr = EXTRACT_SYSTEM_CSR(insn_buf);
> > +
> > +             if ((csr >= CSR_VSTART && csr <= CSR_VCSR) ||
> > +                 (csr >= CSR_VL && csr <= CSR_VLENB))
> > +                     return true;
> > +     }
> > +     return false;
> > +}
Changing it to a switch statement for better structuring.
> I would like Heiko to take a look at this function!
> I know we have the RISCV_INSN_FUNCS stuff that got newly added, but that's
> for single, named instructions. I'm just curious if there may be a neater
> way to go about doing this. AFAICT, the widths are all in funct3 - but it
> is a shame that 0b100 is Q and 0 is vector, as the macro works for matches
> and we can't use the upper bit for that.
> There's prob something you could do with XORing and XNORing bits, but at
> that point it'd not be adding any clarity at all & it'd not be a
> RISCV_INSN_FUNCS anymore!
> The actual opcode checks probably could be extracted though, but would
> love to know what Heiko thinks, even if that is "leave it as is".
I've checked the RISCV_INSN_FUNCS part recently. It seems good to
match a single type of instruction, such as vector with OP-V opcode.
However, I did not find an easy way of matching whole instructions
introduced by RVV, which includes CSR operations on multiple CSRs and
load/store with different widths. Yes, it would be great if we could
distinguish VL and VS out by the upper bit of the width. Or even
better if we could match CSR numbers for Vector this way. But I didn't
find it.
>
> > +
> > +int rvv_thread_zalloc(void)
>
> riscv_v_... and so on down the file
>
> > +{
> > +     void *datap;
> > +
> > +     datap = kzalloc(riscv_vsize, GFP_KERNEL);
> > +     if (!datap)
> > +             return -ENOMEM;
> > +     current->thread.vstate.datap = datap;
> > +     memset(&current->thread.vstate, 0, offsetof(struct __riscv_v_state,
> > +                                                 datap));
> > +     return 0;
> > +}
> > +
> > +bool rvv_first_use_handler(struct pt_regs *regs)
> > +{
> > +     __user u32 *epc = (u32 *)regs->epc;
> > +     u32 tval = (u32)regs->badaddr;
>
> I'm dumb, what's the t here? This variable holds an instruction, right?
> Why not call it `insn` so it conveys some meaning?
tval is the trap value register. I think it is the same as badaddr but
you're right. `insn` has a better meaning here.
>
> > +     /* If V has been enabled then it is not the first-use trap */
> > +     if (vstate_query(regs))
> > +             return false;
> > +     /* Get the instruction */
> > +     if (!tval) {
> > +             if (__get_user(tval, epc))
> > +                     return false;
> > +     }
> > +     /* Filter out non-V instructions */
> > +     if (!insn_is_vector(tval))
> > +             return false;
> > +     /* Sanity check. datap should be null by the time of the first-use trap */
> > +     WARN_ON(current->thread.vstate.datap);
>
> Is a WARN_ON sufficient here? If on the first use trap, it's non-null
> should we return false and trigger the trap error too?
If we'd run into this warning message then there is a bug in kernel
space. For example, if we did not properly free and clear the datap
pointer. Or if we allocated datap somewhere else and did not set VS
accordingly. Normally, current user space programs would not expect to
run into this point, so I guess returning false here is not
meaningful. This warning message is intended for kernel debugging
only. Or, should we just strip out this check?
>
> > +     /*
> > +      * Now we sure that this is a V instruction. And it executes in the
> > +      * context where VS has been off. So, try to allocate the user's V
> > +      * context and resume execution.
> > +      */
> > +     if (rvv_thread_zalloc()) {
> > +             force_sig(SIGKILL);
> > +             return true;
> > +     }
> > +     vstate_on(regs);
> > +     return true;
>
> Otherwise this looks sane to me!
>
> Thanks,
> Conor.
>
Thanks,
Andy.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
