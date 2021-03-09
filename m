Return-Path: <SRS0=trcm=IH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7F0C433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Mar 2021 19:29:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C34CE64F45
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Mar 2021 19:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C34CE64F45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+iquwuARMgwcRVm558P5ftLC3F+Lw1uG/lqYi1Mk1zI=; b=fIr6nhGSMj3FP8XnRW2sZjifm
	Iqscrhlz6OIpsnpM5g6sts7vfywZDNs8Oq8dIPq2OOrEK+yG2vfCiZPU9bHSq3X5Wh/dgt9vmNWF1
	P35CuzhlfdC+s3/UIpiK4wOp6NFjKltRGoXbmyHmMcS2VrArEEpiSWBFWwLkYQsPqJGo1TKOG2Mmd
	7EG9qcU5Aoerjw1mIH3z/yaLpu7fARXwKAJUuF083iQYOz2o4IpK1vZ1ZSONvTAktea7yrJ18DVoq
	ZesA5pO/cDsg+c/2vKquVNExgxehqP/oEiIk/dJ+s9/tMoqYJYR83t7ZIyL0O701JJas3teagLUEN
	1PB6bzUjQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJi2J-005J4D-DG; Tue, 09 Mar 2021 19:28:55 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJi2F-005J3v-K0
 for linux-riscv@lists.infradead.org; Tue, 09 Mar 2021 19:28:53 +0000
Received: by mail-io1-xd2a.google.com with SMTP id n14so15230241iog.3
 for <linux-riscv@lists.infradead.org>; Tue, 09 Mar 2021 11:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nRYlUnr4w7NdPjwA3KubW4AmoT2UPgChOLUTL/VtfPk=;
 b=mDWExY0WeRXBWotEc5uhp04JfsILSL83l5gzcO5ozwbdx+tNRC2Laxeiuq3wXWniPp
 ZLay7OdgkMkNqiTs7pwLT4+NmtICkqcCnYGjjRFtZwyZvdMfhdYMGze2N3oGbYdt4qlN
 TpJMQoyTTaMZpyleyudvwlHN0EcxA819hFLEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nRYlUnr4w7NdPjwA3KubW4AmoT2UPgChOLUTL/VtfPk=;
 b=G23xoU1aJgsVR+VRLDTYNeWReTEeAEo7BWSRQ7c8OEKgX8MZlPM66NgvJVaVTsZDYh
 lwLZmNna0HZFf4SMcqSq9NkWt3uJtENMb9Qi179vRunkn/xLLdP1HcSsdAgrrkbAClpC
 4v6ODJF+vccoUvTuFRxubpGXtG6R79kPjfAD0Oweclz46pN7tILKo0HzW2KmGxlrM7mf
 R0BuAMzC7C6n7homUTFEkCJN+tP3nTh9CQE3nTgDjBPyf40e8ij8l+qElSJJ4mNpyW4c
 sXMn0XexX+TDv23amSI5iFo6xpUNb1ixAcFsZ1bR9WWezhP0TddrOFyqSTG9BP4mM/+5
 GX0A==
X-Gm-Message-State: AOAM5326+ud/Jl5NlzGCRXg41ZTimETysGhOL+n93mZ+3TJBvmRX2FbX
 ie+T9i8fDLl8TRkL5FMS8TsLhzCFZI8T/3SSPbe/
X-Google-Smtp-Source: ABdhPJwIBdQakNebnCSBhk098vcMEWn4jLnzAAmDr517Q+l5TiLHXWdQ/qgox1OAsDHx/ECJ9CC4xacN27xLm298AZQ=
X-Received: by 2002:a6b:3c1a:: with SMTP id k26mr24050777iob.113.1615318130243; 
 Tue, 09 Mar 2021 11:28:50 -0800 (PST)
MIME-Version: 1.0
References: <20210306054801.18263-1-xypron.glpk@gmx.de>
 <CAAhSdy08=ffPe+fYWX9ds4wNSMU3uzT8OENk0o93xpfZOKtYig@mail.gmail.com>
 <CAOnJCUKSf7tyz+56apVOqxNgnR_eYoidYw5=M2si753t4K71UQ@mail.gmail.com>
 <CAAhSdy0BK9-cG=rQNadbkzDWdXJgpiJ1QEywTgpBxr0NVa7cVQ@mail.gmail.com>
In-Reply-To: <CAAhSdy0BK9-cG=rQNadbkzDWdXJgpiJ1QEywTgpBxr0NVa7cVQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 9 Mar 2021 11:28:39 -0800
Message-ID: <CAOnJCULZFHPPXhL5ZyH9qNfb5BgUHos1PU2q6Khb7uT=N-7a3w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210309_192851_870233_C1379085 
X-CRM114-Status: GOOD (  26.49  )
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

On Mon, Mar 8, 2021 at 2:55 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Mar 8, 2021 at 1:19 PM Atish Patra <atishp@atishpatra.org> wrote:
> >
> > On Sat, Mar 6, 2021 at 4:12 AM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Sat, Mar 6, 2021 at 11:19 AM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> > > >
> > > > The constants in enum sbi_ext_rfence_fid should match the SBI
> > > > specification. See
> > > > https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.adoc#78-function-listing
> > > >
> > > > | Function Name               | FID | EID
> > > > | sbi_remote_fence_i          |   0 | 0x52464E43
> > > > | sbi_remote_sfence_vma       |   1 | 0x52464E43
> > > > | sbi_remote_sfence_vma_asid  |   2 | 0x52464E43
> > > > | sbi_remote_hfence_gvma_vmid |   3 | 0x52464E43
> > > > | sbi_remote_hfence_gvma      |   4 | 0x52464E43
> > > > | sbi_remote_hfence_vvma_asid |   5 | 0x52464E43
> > > > | sbi_remote_hfence_vvma      |   6 | 0x52464E43
> > > >
> > > > Fixes: ecbacc2a3efd ("RISC-V: Add SBI v0.2 extension definitions")
> > > > Reported-by: Sean Anderson <seanga2@gmail.com>
> > > > Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> > >

Reviewed-by: Atish Patra <atish.patra@wdc.com>

> > > Good catch.
> > >
> > > I guess we never saw any issues because these calls are only used by
> > > KVM RISC-V which is not merged yet. Further for KVM RISC-V, the HFENCE
> > > instruction is emulated as flush everything on FPGA, QEMU, and Spike so
> > > we did not notice any issue with KVM RISC-V too.
> > >
> >
> > OpenSBI & Xvisor also define the same order as Linux kernel. The
> > existing order(in Linux kernel)
> > makes more sense w.r.to Lexicographic order as well.
> >
> > Should we just fix the spec instead ?
>
> I would not recommend that because RFENCE is part of the released SBI v0.2 spec.
>

Fair enough.

> We have to be more careful in software to follow the spec correctly.
>

Agreed. Apologies for the slip up.

> Regards,
> Anup
>
> >
> > > Looks good to me.
> > >
> > > Reviewed-by: Anup Patel <anup@brainfault.org>
> > >
> > > Regards,
> > > Anup
> > >
> > > > ---
> > > >  arch/riscv/include/asm/sbi.h | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> > > > index 99895d9c3bdd..d7027411dde8 100644
> > > > --- a/arch/riscv/include/asm/sbi.h
> > > > +++ b/arch/riscv/include/asm/sbi.h
> > > > @@ -51,10 +51,10 @@ enum sbi_ext_rfence_fid {
> > > >         SBI_EXT_RFENCE_REMOTE_FENCE_I = 0,
> > > >         SBI_EXT_RFENCE_REMOTE_SFENCE_VMA,
> > > >         SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID,
> > > > -       SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA,
> > > >         SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID,
> > > > -       SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA,
> > > > +       SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA,
> > > >         SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID,
> > > > +       SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA,
> > > >  };
> > > >
> > > >  enum sbi_ext_hsm_fid {
> > > > --
> > > > 2.30.1
> > > >
> > > >
> > > > _______________________________________________
> > > > linux-riscv mailing list
> > > > linux-riscv@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> > >
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> >
> >
> >
> > --
> > Regards,
> > Atish



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
