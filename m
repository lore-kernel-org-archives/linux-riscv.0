Return-Path: <SRS0=HQWJ=IG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4ABC433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 07:49:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AE6865134
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 07:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AE6865134
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E/Q6WLj32C3gXk5vDyc+cJt5TZikTFePRLuQIc6hstQ=; b=Pg5kpt+AUDbenjov7HGLs2PS0
	pK7970fxBjo/npD9qC1i0FlVq4DATQhosdcTsBshR9WH7uH1vJPkRSwi3PPjCJI+lkP44T7Il1WXp
	YUo/CoslShJPGlrhGSxnaP3xo1KeQlGjcWnpZ9NVjq4QTwOSDFx77qSbSg0f4Vh3k18RSMqRxHGp9
	MU61G11xbzFfasgPq78RzP2ifqZH7vTJxJ6oFMf3E6zh46I9C9kwhtu265uM5aOnMH8GafeELZQBI
	yB9kDi57bGskpOtnFxWygxTf4HVmdHdBV9DixNHob/0/NBhXcQUJZmf3MN010T2fxzLHyZWCPV8EK
	Woi6WAfaA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJAdw-00Foq8-86; Mon, 08 Mar 2021 07:49:32 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJAdq-00Fonz-0a
 for linux-riscv@lists.infradead.org; Mon, 08 Mar 2021 07:49:28 +0000
Received: by mail-il1-x136.google.com with SMTP id g9so8009171ilc.3
 for <linux-riscv@lists.infradead.org>; Sun, 07 Mar 2021 23:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gth1gCIISQPIGjYHZ5BXNzBqWi8Mkfc8Kbu+mcOAfPE=;
 b=HfZFvF2XSNRVonufal1kc0DvF2p3Gh66nT+pbDsujddQ9p/g4kU2dSwCtpCX2/d6HL
 QlQcj/VchwYR2eeplb1yErSjR9ZwimwkyAmF7YqgoZlqi/UxkIlW1XqHMkRND6IfmdEJ
 mxCNs3S3xLYBPrhogpbQMxNnDAl63fiV7nJbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gth1gCIISQPIGjYHZ5BXNzBqWi8Mkfc8Kbu+mcOAfPE=;
 b=StaDynMj2Acjfyj19jDh1mj0j9sVZJ4mZWTXCaGQ4+L4Dg7+Enjf2bnAtb1AQaofLi
 wu5hjJTNv9LMoVGW+LepVrFgGAWtgmv7MjHvw0Hiov1FND70b7V3uXv6KlddbT+tRZRi
 pSrHKWllHWFiOMFHdVd8HdUddM3I7uq65+WC98DXi7sfhM8euZ46pjc3bkhMK5Vmnp5E
 OxUV0rrxtwRN2QY8yC5jeDtm5jwDP63eIs7Ljccm9/rkkQ5qyBY960eTLT2cEdJNOfgs
 DAduXiSVs1NwrG7PyXVceXQ70d26mBlZxcpcrpPIxsQRWTE91QZr1IJBa/Zv8Xjts38o
 w6CQ==
X-Gm-Message-State: AOAM5331M6qeaDGYDg+oSPDSxwD0vm9x5Tp+lYmJgx0dLS1hraburajC
 3+hbV3SSKnp83kn5HtXkMHZ0tDv2cW29hNmaFUpT
X-Google-Smtp-Source: ABdhPJxjAor9yYjsUhdBV/HVCCasEmP9AYPH14lOkpHfYjd6oMChV1iQqlGLualYluoFy/YUURtEudLOLn6020KRlk4=
X-Received: by 2002:a92:b50e:: with SMTP id f14mr18173718ile.77.1615189764326; 
 Sun, 07 Mar 2021 23:49:24 -0800 (PST)
MIME-Version: 1.0
References: <20210306054801.18263-1-xypron.glpk@gmx.de>
 <CAAhSdy08=ffPe+fYWX9ds4wNSMU3uzT8OENk0o93xpfZOKtYig@mail.gmail.com>
In-Reply-To: <CAAhSdy08=ffPe+fYWX9ds4wNSMU3uzT8OENk0o93xpfZOKtYig@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Sun, 7 Mar 2021 23:49:13 -0800
Message-ID: <CAOnJCUKSf7tyz+56apVOqxNgnR_eYoidYw5=M2si753t4K71UQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] RISC-V: correct enum sbi_ext_rfence_fid
To: Anup Patel <anup@brainfault.org>
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>, 
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Sean Anderson <seanga2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_074926_213507_78D101F0 
X-CRM114-Status: GOOD (  21.88  )
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

On Sat, Mar 6, 2021 at 4:12 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Sat, Mar 6, 2021 at 11:19 AM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> >
> > The constants in enum sbi_ext_rfence_fid should match the SBI
> > specification. See
> > https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.adoc#78-function-listing
> >
> > | Function Name               | FID | EID
> > | sbi_remote_fence_i          |   0 | 0x52464E43
> > | sbi_remote_sfence_vma       |   1 | 0x52464E43
> > | sbi_remote_sfence_vma_asid  |   2 | 0x52464E43
> > | sbi_remote_hfence_gvma_vmid |   3 | 0x52464E43
> > | sbi_remote_hfence_gvma      |   4 | 0x52464E43
> > | sbi_remote_hfence_vvma_asid |   5 | 0x52464E43
> > | sbi_remote_hfence_vvma      |   6 | 0x52464E43
> >
> > Fixes: ecbacc2a3efd ("RISC-V: Add SBI v0.2 extension definitions")
> > Reported-by: Sean Anderson <seanga2@gmail.com>
> > Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>
> Good catch.
>
> I guess we never saw any issues because these calls are only used by
> KVM RISC-V which is not merged yet. Further for KVM RISC-V, the HFENCE
> instruction is emulated as flush everything on FPGA, QEMU, and Spike so
> we did not notice any issue with KVM RISC-V too.
>

OpenSBI & Xvisor also define the same order as Linux kernel. The
existing order(in Linux kernel)
makes more sense w.r.to Lexicographic order as well.

Should we just fix the spec instead ?

> Looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Regards,
> Anup
>
> > ---
> >  arch/riscv/include/asm/sbi.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> > index 99895d9c3bdd..d7027411dde8 100644
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@ -51,10 +51,10 @@ enum sbi_ext_rfence_fid {
> >         SBI_EXT_RFENCE_REMOTE_FENCE_I = 0,
> >         SBI_EXT_RFENCE_REMOTE_SFENCE_VMA,
> >         SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID,
> > -       SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA,
> >         SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID,
> > -       SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA,
> > +       SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA,
> >         SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID,
> > +       SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA,
> >  };
> >
> >  enum sbi_ext_hsm_fid {
> > --
> > 2.30.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
