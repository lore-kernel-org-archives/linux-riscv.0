Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE4BC32773
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 16:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p4CY8szM5SJEuQcWRUCLlfinyKGjOBoM+hZmUIna/60=; b=P1zykAVOR78hE0
	HTfiYSKQnuaqOF27d5CIHH7OPMZPlTf/3YU7lbksAS1cpuWuw2VbSpdFEzX55yHNIwsVjdDvnFD1m
	53ZXD5I6PRfdcTn0TGMyje6o7175A8L62n2Pxgcn8Xkafm4bx2+6MoFBCmkijitkNQRMFol61rk+x
	n+sTtBZK7WAaXTC7qrc04Z80RYym9FbB25ZRrrSiMXOGfsb0r8kmV+WlHqA+c0WD5XryMMdx/6qKK
	kItwoBUSYYGYLTiC4Kt9zGPEU/Qom5R1qL8WyePL+p/7ld5ctagTSWOkIbpoeLjR2joCoqYG0UwGT
	Xw8TCYN1WuuOLT/Pt0NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP4e6-00AGYF-Cs; Fri, 19 Aug 2022 16:14:54 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP4e1-00AGTE-UG
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 16:14:51 +0000
Received: by mail-lj1-x22f.google.com with SMTP id v4so5001346ljg.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 09:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=tvaOIKhIqDrlMVEW0M57lH2FbWGy6GB7UifbcgzXwMA=;
        b=BWPL5Gwxnd6uvirT5L872kNYJ1/RVqqzVTOuvVl0byaKKDwxiC85rh1yDoAgy+gao5
         3fM/PAfiyWkXCZVyxHqUcfFbmhYPy/yalvQXBwkN6niIQt9NlbZRxmLDaknpSV7WxZes
         6W3rLratY55z6g5aDDOzcW0j5qKK9dzHqN2oGuJv3bQksoxpeK3oULTkk5e+yXmagh9X
         nMs1GVU8IZy7n3jOC3CR2Y3daqHQw0MDKcxNM3x0oSYiUpgXF/Ky55KZBTxEtmW/oDqN
         bjQez5aoT2e/EmPFMBB4vkRrqfUUAc9ie3ITUwuIxLOQ5IYE2RFzLLj4WHvjdfBiYrXQ
         UFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=tvaOIKhIqDrlMVEW0M57lH2FbWGy6GB7UifbcgzXwMA=;
        b=cg+jvr2+cC0iaWDKeoIZkz48XAakkaF1Rfbv6JUPeGChyl+e6dYOF7rJI8VOC6cFow
         Y+vl5inhTJECFOy4sCqFXRzZjduGRmebOf5II8GQwXuuSzivV2hJh4FuaHv45+XNiBwu
         AMglMf4wQe0FhVKAw34YaFv3fU90FQFnn6ytA4jNTMuYkjBQsqcr4MyXZNsd9DAvxpME
         JrVDejv3UV440rfsGvt58M55LKF8lIiYzzRC73gyPbm4E7uZIm84gWDIjMplwchZCykT
         CHst7v9NYNjCi0GvU7reyqhWi4RRUSSrpEub+oPe35KlGxutf/fmvENR7/1LCHSGIJJP
         7Gng==
X-Gm-Message-State: ACgBeo2KoZpI0uM6az1u7KJd5noc6sw4jB3HlGmNSe4lURSXDipqViot
	Li8EtXGVla4ty0grWS1fAEKumkVJBoU0SipN6gcSvg==
X-Google-Smtp-Source: AA6agR7ylA+ldzRezYJ/9dHzw0N0PaVrNlEsvgrtMNftGoI69PPeTWIjFPy22UT8Csh8mEMNSX9bxxcZo6h9BeNxHCU=
X-Received: by 2002:a05:651c:b20:b0:25f:e9c7:ac9e with SMTP id
 b32-20020a05651c0b2000b0025fe9c7ac9emr2229509ljr.266.1660925685170; Fri, 19
 Aug 2022 09:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220814141237.493457-1-mail@conchuod.ie> <mhng-49e49c17-7241-45f8-bea3-17188bd1d0fa@palmer-ri-x1c9>
In-Reply-To: <mhng-49e49c17-7241-45f8-bea3-17188bd1d0fa@palmer-ri-x1c9>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 19 Aug 2022 21:44:32 +0530
Message-ID: <CAK9=C2UGJgu0eXHARkvftf+xbqnTaK2k9Jbz_4WVS8PQpgtaWg@mail.gmail.com>
Subject: Re: [PATCH 0/4] misc warning cleanup in arch/risc-v
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: mail@conchuod.ie, anup@brainfault.org, atishp@atishpatra.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	conor.dooley@microchip.com, guoren@kernel.org, vincent.chen@sifive.com, 
	xianting.tian@linux.alibaba.com, heiko@sntech.de, wangkefeng.wang@huawei.com, 
	tongtiangen@huawei.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_091450_079029_D7A9502F 
X-CRM114-Status: GOOD (  29.72  )
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

On Fri, Aug 19, 2022 at 4:32 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Sun, 14 Aug 2022 07:12:34 PDT (-0700), mail@conchuod.ie wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > Hey all,
> > Couple fixes here for most of what's left of the {sparse,} warnings in
> > arch/riscv that are still in need of patches. Ben has sent patches
> > for the VDSO issue already (although they seem to need rework).
> >
> > VDSO aside, With this patchset applied, we are left with:
> > - cpuinfo_ops missing prototype: this likely needs to go into an
> >   asm-generic header & I'll send a separate patch for that.
> > - Complaints about an error in mm/init.c:
> >   "error inarch/riscv/mm/init.c:819:2: error: "setup_vm() is <trunc>
> >   I think this can be ignored.
> > - 600+ -Woverride-init warnings for syscall table setup where
> >   overriding seems to be the whole point of the macro.
> > - Warnings about imported kvm core code.
> > - Flexible array member warnings that look like common KVM code
> >   patterns
> > - An unexpected unlock in kvm_riscv_check_vcpu_requests that was added
> >   intentionally:
> >   https://lore.kernel.org/all/20220710151105.687193-1-apatel@ventanamicro.com/
> >   Is it worth looking into whether that's a false positive or not?
> >
> > Thanks,
> > Conor.
> >
> > Conor Dooley (4):
> >   riscv: kvm: vcpu_timer: fix unused variable warnings
> >   riscv: kvm: move extern sbi_ext declarations to a header
> >   riscv: signal: fix missing prototype warning
> >   riscv: traps: add missing prototype
> >
> >  arch/riscv/include/asm/kvm_vcpu_sbi.h | 12 ++++++++++++
> >  arch/riscv/include/asm/signal.h       | 12 ++++++++++++
> >  arch/riscv/include/asm/thread_info.h  |  2 ++
> >  arch/riscv/kernel/signal.c            |  1 +
> >  arch/riscv/kernel/traps.c             |  3 ++-
> >  arch/riscv/kvm/vcpu_sbi.c             | 12 +-----------
> >  arch/riscv/kvm/vcpu_timer.c           |  4 ----
> >  7 files changed, 30 insertions(+), 16 deletions(-)
> >  create mode 100644 arch/riscv/include/asm/signal.h
>
> These generally look good to me.  Anup handles the KVM bits so I'll let
> him chime in there, but
>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> on all of them.
>
> Happy to do some sort of shared tag thing, but it looks like these are
> all independent enough that it'd be easier to just split them up.  I've
> put the non-KVM bits over at palmer/riscv-variable_fixes_without_kvm, if
> you guys are all OK splitting this up then I'll go take those onto
> riscv/fixes.  I'll wait a bit for folks to get a chance to look, so it
> won't be for tomorrow morning.

Thanks Palmer. I have queued the KVM fixes (first two patches).

Regards,
Anup

>
> Thanks!
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
