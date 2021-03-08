Return-Path: <SRS0=HQWJ=IG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D24D2C433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 08:04:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0775764DF3
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 08:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0775764DF3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jU1bYn/oU7eaDfmDgrNbXtbFc+65ot/iLWLeyy4UmtE=; b=LyaALPmsFP2Uo05OycjZz3MuI
	7cHLym74O77JdfIU3MoKFgDRJpqQdlFQ0qKDCHeHpgd1Gz096CpVk/6cliMjX27Mnzkkj9DcD3lGz
	SElPmKaGT8uZqJJ/m5v9nXgPEfh7xwy+xedoFjkNokmQpSzoQROlRyUGcT06V7HSCaPbMChJJlpip
	64a1r4rfZw0mH8Ztw//KXD7hAR5zq7E9Ejf1hHSeC4hlJ0jzqUfFqowIWhRVFfI8/WyG/n/Poum/X
	o3bONuqea7H0fpGIAdbLbKZd/TxZeoI90YxlFqiJyZOKGQk2LQs1f0SS67KehU3ulrCyONt583nEp
	M4qihfeYA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJAs7-00Frkn-St; Mon, 08 Mar 2021 08:04:12 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJArq-00FrfO-Lb
 for linux-riscv@lists.infradead.org; Mon, 08 Mar 2021 08:03:59 +0000
Received: by mail-il1-x130.google.com with SMTP id e2so8072344ilu.0
 for <linux-riscv@lists.infradead.org>; Mon, 08 Mar 2021 00:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=35KjzI8H1oyETbm3EJBElOyyMkIyjKEhTf5PaBQsSuc=;
 b=N440It6ZjtVHQoZ0CL+Skb7nhMpnbFvAXTNuFhabhdfJ6oi6sNGZh1UBsx2X4Lfx/s
 h73OpZMkI74nnbntL7In8jM9f2ba8jGZt3vUiF7ZmwQHyemFf5FIwzI6XWrXq6jvcxSo
 y9UtMF+emMvGtGG246bTOyq+xAIENGVbUmGFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=35KjzI8H1oyETbm3EJBElOyyMkIyjKEhTf5PaBQsSuc=;
 b=kADB8XvUZYBFutvwDOdY1lJJoO9Ev4h/T7ZvF4DyDNeg3r8i6Gh5mnv3/4QQECcRMx
 PolXrRFGs89gU8dIQ30r/3jahI6llMLYVQt7/KAfdfS4wKSsPkr5dWtyQsClK9+Rcg3M
 jX7Z9STPwsgnxfkDqCgXvFhxkI6LVFYRGSA8pceVc41qXIAlLOGbf4nNM+86aoKZUcuW
 ts2vq3VLhd9opAQYpwt8jnr5EQWiVma1cQ+5sXu20udrZYv3Jz6GDRk0JzzwZb86EWul
 JrdDGq6PnczHnYccM3Lz3TYBhBN3gwLDoeL/6Pgg3QxjMNubimlXsK5UkpfEuTxC/Ddj
 ohLQ==
X-Gm-Message-State: AOAM532+PIgXRLrOF5dT3KDwGXqb2uxLWttLyeOSAOqoGOC/DJrFjZN9
 dz7rOvQAA2Ae/WhHFVG/cwMn47+0OpnWDVPR6Of0
X-Google-Smtp-Source: ABdhPJyWpeO8xW7/Io1AOnJjSnmTXn9rSBGoNREMgoCgZXrtTCvVBdNLrTJboM9G2FxkyI6+OfF2FEHsPleeKbk2ySk=
X-Received: by 2002:a05:6e02:1a68:: with SMTP id
 w8mr18952717ilv.147.1615190633454; 
 Mon, 08 Mar 2021 00:03:53 -0800 (PST)
MIME-Version: 1.0
References: <20210306054801.18263-1-xypron.glpk@gmx.de>
 <CAAhSdy08=ffPe+fYWX9ds4wNSMU3uzT8OENk0o93xpfZOKtYig@mail.gmail.com>
 <CAOnJCUKSf7tyz+56apVOqxNgnR_eYoidYw5=M2si753t4K71UQ@mail.gmail.com>
In-Reply-To: <CAOnJCUKSf7tyz+56apVOqxNgnR_eYoidYw5=M2si753t4K71UQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 8 Mar 2021 00:03:42 -0800
Message-ID: <CAOnJCU+NKwFdkg3X75opcDK1WHwcaK-MczyJhKCuECf5ydp9rg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210308_080355_016329_B265097C 
X-CRM114-Status: GOOD (  26.28  )
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

On Sun, Mar 7, 2021 at 11:49 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Sat, Mar 6, 2021 at 4:12 AM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Sat, Mar 6, 2021 at 11:19 AM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> > >
> > > The constants in enum sbi_ext_rfence_fid should match the SBI
> > > specification. See
> > > https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.adoc#78-function-listing
> > >
> > > | Function Name               | FID | EID
> > > | sbi_remote_fence_i          |   0 | 0x52464E43
> > > | sbi_remote_sfence_vma       |   1 | 0x52464E43
> > > | sbi_remote_sfence_vma_asid  |   2 | 0x52464E43
> > > | sbi_remote_hfence_gvma_vmid |   3 | 0x52464E43
> > > | sbi_remote_hfence_gvma      |   4 | 0x52464E43
> > > | sbi_remote_hfence_vvma_asid |   5 | 0x52464E43
> > > | sbi_remote_hfence_vvma      |   6 | 0x52464E43
> > >
> > > Fixes: ecbacc2a3efd ("RISC-V: Add SBI v0.2 extension definitions")
> > > Reported-by: Sean Anderson <seanga2@gmail.com>
> > > Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> >
> > Good catch.
> >
> > I guess we never saw any issues because these calls are only used by
> > KVM RISC-V which is not merged yet. Further for KVM RISC-V, the HFENCE
> > instruction is emulated as flush everything on FPGA, QEMU, and Spike so
> > we did not notice any issue with KVM RISC-V too.
> >
>
> OpenSBI & Xvisor also define the same order as Linux kernel. The
> existing order(in Linux kernel)
> makes more sense w.r.to Lexicographic order as well.
>
> Should we just fix the spec instead ?
>

We do need to notify RustSBI & Diosix authors about this change in
case we decide to do so.
However, RustSBI added rfence support a few weeks back only [1]. I
could not find any rfence reference in Diosix.
Thus, the impact should be very minimal if the spec is fixed.

[1] https://github.com/luojia65/rustsbi/commit/6e06b4e8e96e05b69157dd5477d433cc932c8a64
> > Looks good to me.
> >
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> >
> > Regards,
> > Anup
> >
> > > ---
> > >  arch/riscv/include/asm/sbi.h | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> > > index 99895d9c3bdd..d7027411dde8 100644
> > > --- a/arch/riscv/include/asm/sbi.h
> > > +++ b/arch/riscv/include/asm/sbi.h
> > > @@ -51,10 +51,10 @@ enum sbi_ext_rfence_fid {
> > >         SBI_EXT_RFENCE_REMOTE_FENCE_I = 0,
> > >         SBI_EXT_RFENCE_REMOTE_SFENCE_VMA,
> > >         SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID,
> > > -       SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA,
> > >         SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID,
> > > -       SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA,
> > > +       SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA,
> > >         SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID,
> > > +       SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA,
> > >  };
> > >
> > >  enum sbi_ext_hsm_fid {
> > > --
> > > 2.30.1
> > >
> > >
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
>
>
> --
> Regards,
> Atish



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
