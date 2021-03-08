Return-Path: <SRS0=HQWJ=IG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCF3C433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 10:55:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3BB4650BB
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 10:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3BB4650BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wUT5UXNujuvztSCPieopYDmBDJM+d6nEy6omvFWEDtw=; b=BXVys+MJMsAJv1zruLTiLj674
	C/PIqwjktlTgQLbC2U85mHgOaYES4rXKSSi5uhdLXD4aE7qSyw2BJJorlnA3bZPsx4qtuqWGEnKo2
	OXKBUWFNvESYjR8IjN2gXkQNTo6o+ik9adMxU8WNZ3vE0NzcBl+v3Ug1FhFpWqKqMrJ8NDBKogzEC
	mmSvFzkFT4hC+AvhfWdwxMxtmPJWOzlRThJXtCtGDVlrpdIuRI3meLESFrkaYwYraFxkVbfoPpIOI
	bcCB1nM6D5JA0M4laeOCdtW48BYGP+07qH4xxwZDGrm6hPsExeVGGoTxnBY7pAnmrJgMaNZerabD3
	e3HRV3Hdg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJDXl-00GZEP-AS; Mon, 08 Mar 2021 10:55:21 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJDXc-00GZAQ-FG
 for linux-riscv@lists.infradead.org; Mon, 08 Mar 2021 10:55:16 +0000
Received: by mail-wr1-x435.google.com with SMTP id l11so7534255wrp.7
 for <linux-riscv@lists.infradead.org>; Mon, 08 Mar 2021 02:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zDjtQNZmAQRPgQIJYVRtA4TD1wRJeRY/dIfm2pzVt5g=;
 b=TSg+/m/5UJGeJ9QQlUITU26UTedPS5x8JOFoSSBWAHRXgDJ7pYCIHhPRe2W5FnvzyF
 q1Dib0oqd1htD8PjdT9JjI5ZcsgeBtbxZqeCRHOfcb9PFw9IY1SAc7NNHAvCgUsq9JPP
 gUluhBJCV6iaBSFN6BCdx1ZXRoOL1X5E43wLU/G3PtaByAW5Xy7MUf4iHBb53XZHVoD0
 bV9cdkJY9gERa3yDgr+stdLQFNJ2kTVWC09m+c8xgqRwyomAONNoTlznS180sj2TK6V1
 6pHvK3xMjVfZ1PcWAF5bP81dgxmjy2ppGJ0FC1PGbMP7Xcn5EGPLw0TxdXEEJSFQF+PG
 jVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zDjtQNZmAQRPgQIJYVRtA4TD1wRJeRY/dIfm2pzVt5g=;
 b=GQnYoYmr8e0ion7vScF6F2L3XzOb+xFdxqhemPjk10+Y2DPaSGzVvntJm4nUSfnH9y
 kdK4iL4ybPGaHpQEBVk4TBRHCfHahu7VZ8Ta/kdJ6Z1hQCQ4KLy5+opFSBhHbgWHZKLk
 E95zjmOmEnVbAXDn9BCU3EXE4gRAXp/IPT6CLGlNL9C33xQLAhxuLmnuB6DswdFWEdN+
 eiHMJ3rrQzlu6HEjQx0Uy3OBzh24c6GnWubUFfECadGAKMkK4zRehebFsf/o3y5jnpMi
 50ooOdX72DxHxxkkJuD7+t8zV7SiC+5MjkNDj5HIikV+DbXlu4S5Xsw8oEtVkxbBJFos
 48BA==
X-Gm-Message-State: AOAM533PAUq1lw+0dFlXl1BU0HTtjFBz6B3yTNwjMXGqaVLG404ClfgH
 Lys9zUMJ2lX7BZONAxDvbAruUKCoB8PRoksmP86Whg==
X-Google-Smtp-Source: ABdhPJygCB3fUFIehXjPU8MeAgxahflyzP+92sMDWJ6zTyOenQjK7gp6Cc16xo7AGfaG4zK3TMJqmTo0XiPAZpxoBnQ=
X-Received: by 2002:adf:d236:: with SMTP id k22mr22289991wrh.144.1615200911703; 
 Mon, 08 Mar 2021 02:55:11 -0800 (PST)
MIME-Version: 1.0
References: <20210306054801.18263-1-xypron.glpk@gmx.de>
 <CAAhSdy08=ffPe+fYWX9ds4wNSMU3uzT8OENk0o93xpfZOKtYig@mail.gmail.com>
 <CAOnJCUKSf7tyz+56apVOqxNgnR_eYoidYw5=M2si753t4K71UQ@mail.gmail.com>
In-Reply-To: <CAOnJCUKSf7tyz+56apVOqxNgnR_eYoidYw5=M2si753t4K71UQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 8 Mar 2021 16:25:00 +0530
Message-ID: <CAAhSdy0BK9-cG=rQNadbkzDWdXJgpiJ1QEywTgpBxr0NVa7cVQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] RISC-V: correct enum sbi_ext_rfence_fid
To: Atish Patra <atishp@atishpatra.org>
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>, 
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Sean Anderson <seanga2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_105514_013973_2F670A0B 
X-CRM114-Status: GOOD (  25.11  )
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

On Mon, Mar 8, 2021 at 1:19 PM Atish Patra <atishp@atishpatra.org> wrote:
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

I would not recommend that because RFENCE is part of the released SBI v0.2 spec.

We have to be more careful in software to follow the spec correctly.

Regards,
Anup

>
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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
