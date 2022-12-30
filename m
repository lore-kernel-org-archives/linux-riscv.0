Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA644C4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Dec 2022 17:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1OBcZpe5MTdOU2qbRT20JjArW7Ym+OEn2Aq0SgMb+ds=; b=ViDuU53OmhIN1c
	gQImqq/ilbKH62tjzeR26eskGQ+BsG+QHClktHjLQHQG4zEgnJ6PF9tzS/ivoHua9y2hFjzF9I1Jo
	pADfVzydACZVAGB9qhaoZioLVbCj5YJAsfFkqUBCR5XyviQorBEnEeX5gn//2OaUethMwHMG/AVp6
	AG50cFvUQ50La6fZhFPQtNBbySCK2i10n+lHN4hDNiRPRF6W9yS9MadP0QY33XGmG8Xvhcn9OedA1
	JOiJN+pQ/6DymauGO5MzPB2uwPpiK1lysWLPEaHMESXJ2v4WFkVN+XosZau28MWzaw9hnZpuw4gHp
	mXAZ86Lrh+j/gVp0TXzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBJIL-00Bi0c-S0; Fri, 30 Dec 2022 17:35:49 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBJBJ-00BcBg-PN
	for linux-riscv@lists.infradead.org; Fri, 30 Dec 2022 17:28:35 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-46198b81e5eso305087027b3.4
        for <linux-riscv@lists.infradead.org>; Fri, 30 Dec 2022 09:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G2Y6VcRBq2XXvYnNn6INIfCSNd6mGuYL6n4tFOfibLE=;
        b=J4R3kOCa2nmQ1mcI7UP0KPzc+uR4rfqcj46l0ZlYzec7gofqlhuRV/+dwlZNp2dR9Z
         hS7tVNvzP3SqyqR3Op6ztopBjvt9JS8oDK+QUkIwH2O5pWTwX/r12eCoWF+oqsprzo3q
         Jo8ynpJl3ewcV8B5lirYViGFG47ImJIl5u2C4DIotDR8IQnxxBji7VlBZyuA4ibXXLPk
         wfmqY9phaoP1u3U5fvwK6ZBKZcpZetDTYNrx09M3wAuIEWazIGy9xIfp+PRY7A1r99Jm
         BXkujVCWkw/ksNI+hfLA+fJ6LfZywbO1ZJSz1O54Xu9rDEc8EeBbJ7LGo/c3JewY/t2U
         8iXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2Y6VcRBq2XXvYnNn6INIfCSNd6mGuYL6n4tFOfibLE=;
        b=pRBebuvp3n4xtgeE5o8qmPHRXhLwuVFvEcsDF7o3A6gwLZ50xFgfFuAsLlgEMnUMbS
         U1VRx+7dQM7sT23KiDEwlFuNeygdmwxf0CjiwjD60gP7UL5GvZkMwk43R2z5nx3qoKY8
         MHPVRI2y/yaZ9gEToOv0gjRdIl+P+tLJEIWwNvr7vo3E807BPh+RyNzHkDTRvQYowwYb
         dgqElOkxIAlySHXBIDOvkp0arjp9zX5eB+pip9FXKH2RZTfNlK44i+pcBxIVt2De27sY
         jAlcBFRnieVefAl1SpAIZde38v5e5vcnkqFXBUTAsXK09XeM3lPR8pf++m09eJLJidhA
         FObw==
X-Gm-Message-State: AFqh2koUVE/uUKrRd+zm28fZ9CrwNhZcBVqJwneiJvyh2mwgXjD13nhu
	wVWKwAVkrg2desDtozILRhS3wo64Yl5y743ww5VCOH+4+b5WJZIW
X-Google-Smtp-Source: AMrXdXuiPQBzfkTubHuQ8Tlf9KyF7Ob2NmqvYsVv8ruhV5MDMhz/8q53qrM6rj6eUjfa1McDDka9iaYVNl/nrMDnA1Y=
X-Received: by 2002:a81:1401:0:b0:3d0:c950:c581 with SMTP id
 1-20020a811401000000b003d0c950c581mr2974411ywu.304.1672421306411; Fri, 30 Dec
 2022 09:28:26 -0800 (PST)
MIME-Version: 1.0
References: <Y6S1/kROC0p5CboA@curiosity> <CA+V-a8u0qUF81RUTF9+4T4F1GxW3=4P7RMTTjjsaMq4MiiQSMQ@mail.gmail.com>
 <Y6TIywUWZ3nrPeon@curiosity> <CA+V-a8tMQ-RaaXD5209HxT77VoiOanvjdbFCPsdWpDYswuY+ZQ@mail.gmail.com>
 <Y6TYNBgqgWuxhhHJ@curiosity> <CA+V-a8tDi79M8cS7rVoby3sopQ4AwXXcNggfHYXW-W2wtEgQ4g@mail.gmail.com>
 <Y6Xjwg1dDYnwRbni@curiosity> <CA+V-a8uwmwriyoSZ1ftVQ1L1_uTL3k=VSs7Cid7++XEshq1RsQ@mail.gmail.com>
 <Y6bm8KIsHhFq1RFR@curiosity> <CA+V-a8scDWmqqAXp1hOUYFcn-4Zaj3MBqeQs7QZy5WBwyXPjxQ@mail.gmail.com>
 <Y68XeN4zJdmMP8NC@curiosity>
In-Reply-To: <Y68XeN4zJdmMP8NC@curiosity>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 30 Dec 2022 17:28:00 +0000
Message-ID: <CA+V-a8vx8yxnaqDumvy_EwNBBgi03QCAu6Gw+t8DNQpWKgcsew@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] riscv: mm: notify remote harts about mmu cache updates
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>, 
	Alexandre Ghiti <alexandre.ghiti@canonical.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Conor Dooley <Conor.Dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_092833_905995_E3142510 
X-CRM114-Status: GOOD (  43.38  )
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

Hi Sergey,

On Fri, Dec 30, 2022 at 4:53 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> Hi Prabhakar,
>
> > Hi Sergey,
> >
> > On Sat, Dec 24, 2022 at 11:48 AM Sergey Matyukevich <geomatsi@gmail.com> wrote:
> > >
<snip>
> > > > > > > > > Thanks for the script and config. Could you please also share the
> > > > > > > > > following information:
> > > > > > > > > - how many cores your system has
> > > > > > > > The Renesas RZ/Five SoC has a single Andes AX45MP core.
> > > > > > > >
> > > > > > > > > - does your system support ASID
> > > > > > > > >
> > > > > > > > With a quick look at [0] It does support ASID, unless there is a way
> > > > > > > > to disable it.
> > > > > > > >
> > > > > > > > [0] http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
> > > > > > >
> > > > > > > So you have a single-core system, but your kernel configuration enables
> > > > > > > CONFIG_SMP. Additional 'deferred TLB flush' logic is dropped at build
> > > > > > > time if CONFIG_SMP is disabled. On the other hand, system should not
> > > > > > > fail that way even if SMP is enabled.
> > > > > > >
> > > > > > I enabled CONFIG_SMP while doing some testing of PMA code and indeed
> > > > > > enabling this config should not introduce a failure.
> > > > > >
> > > > > > > Let me double-check if anything can go wrong if cpumasks may have only
> > > > > > > a single cpu. Another suspect is a change in update_mmu_cache: probably
> > > > > > > making it asid-specific (and thus more granular) was a bad idea.
> > > > > > >
> > > > > > Thanks.
> > > > > >
> > > > > > BTW I tested the patch [0] which you pointed out and that fixes the
> > > > > > issues seen earlier.
> > > > > >
> > > > > > [0] https://patchwork.kernel.org/project/linux-riscv/patch/20221111075902.798571-1-guoren@kernel.org/
> > > > >
> > > > > All looks good with cpumasks in the single-core case. So deferred TLB
> > > > > flush logic is not even executed in your case. So the root cause
> > > > > should be in update_mmu_cache change.
> > > > >
> > > > > May I ask you to repeat the original emmc test on your platform from
> > > > > for-next (i.e. with [0] and without [1]) with the following partial revert:
> > > > >
> > > > > : diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > > > > : index ec6fb83349ce..92ec2d9d7273 100644
> > > > > : --- a/arch/riscv/include/asm/pgtable.h
> > > > > : +++ b/arch/riscv/include/asm/pgtable.h
> > > > > : @@ -415,7 +415,7 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
> > > > > :        * Relying on flush_tlb_fix_spurious_fault would suffice, but
> > > > > :        * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
> > > > > :        */
> > > > > : -     flush_tlb_page(vma, address);
> > > > > : +     local_flush_tlb_page(address);
> > > > > :  }
> > > > > :
> > > > > :  static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
> > > > >
> > > > I tested your above proposed changes and I am no longer seeing an
> > > > issue on my platform.
> > >
> > > Great. I will send a fixup after I double-check on several other
> > > hardware platforms. Thanks for testing !
> > >
> > Actuall, I did hit an issue now with your proposed changes with bonnie++ again!
> >
> > [ 1873.355279] EXT4-fs (sda1): mounted filesystem
> > 050ad3b9-b571-4b4c-9500-db56feed01ab with ordered data mode. Quota
> > mode: disabled.
> > Using uid:0, gid:0.
> > Writing with putc()...done
> > Writing intelligently...done
> > Rewriting...done
> > Reading with getc()...[ 2682.180114] sd-resolve[126]: unhandled signal
> > 11 code 0x1 at 0x0000000000000000 in libc-2.28.so[3fbe503000+ff000]
> > [ 2682.190552] CPU: 0 PID: 126 Comm: sd-resolve Not tainted
> > 6.2.0-rc1-00111-g7bcd7d932cf6 #189
> > [ 2682.198917] Hardware name: Renesas SMARC EVK based on r9a07g043f01 (DT)
> > [ 2682.205536] epc : 0000003fbe568004 ra : 0000003fbe569440 sp :
> > 0000003fbe417b10
> > [ 2682.212770]  gp : 0000002ab8d18b88 tp : 0000003fbe41e810 t0 :
> > 0000000000000022
> > [ 2682.219987]  t1 : 0000003fbdbf1e4c t2 : 0000003fbe417290 s0 :
> > 00000000000000e0
> > [ 2682.227219]  s1 : 0000000000000000 a0 : 0000000000000000 a1 :
> > 8080808080808080
> > [ 2682.234433]  a2 : 0000003fb80019f0 a3 : 0000003fbe41e8f0 a4 :
> > 0000000000000008
> > [ 2682.241648]  a5 : 0000000000000000 a6 : fefefefefefefeff a7 :
> > 0000000000000039
> > [ 2682.248863]  s2 : 0000003fbe417b37 s3 : 0000003fbe417e48 s4 :
> > 0000000000000001
> > [ 2682.256082]  s5 : 0000003fbe417eb0 s6 : 00000000000000e0 s7 :
> > 0000003fbdbf2f2a
> > [ 2682.263297]  s8 : ffffffffffffffff s9 : fffffffffffffffd s10:
> > ffffffffffffffff
> > [ 2682.270511]  s11: fffffffffffffffe t3 : 0000000000000000 t4 :
> > 000000077ce2ea37
> > [ 2682.277733]  t5 : 000000000000003f t6 : 0000000000000000
> > [ 2682.283046] status: 0000000200004020 badaddr: 0000000000000000
> > cause: 000000000000000d
> > [ 2682.441183] audit: type=1701 audit(1671222620.403:17):
> > auid=4294967295 uid=995 gid=994 ses=4294967295 pid=124
> > comm="sd-resolve" exe="/lib/systemd/systemd-timesyncd" sig=11 res=1
> > done
> > Reading intelligently...done
> >
> > Let me know if you want me to share my branch.
>
> Hmmm... I assume you hit the issue after you applied suggested partial
> revert for the update_mmu_cache function. If so, then your issue is not
> related to the the remaining part (deferred local_flush_tlb_all_asid)
> of the commit 4bd1d80efb5a. This is because that flush is not executed
> on a single-core system, even if CONFIG_SMP is enabled.
>
Yes this issue was seen after the partial revert [0] as per your suggestion.

> Could you please run your tests for a while on your branch with reverted
> commit 4bd1d80efb5a ("riscv: mm: notify remote harts about mmu cache
> updates"). It looks like the change in the function update_mmu_cache
> from the commit 4bd1d80efb5a increases the probability of crash, but
> there is also something else in the new kernel that bites your system.
>
Sure, I'll re-run the tests with the complete revert of 4bd1d80efb5a
and check the status of it.

> Yes, could you please share your branch. I will take a look and run
> some tests on different boards that I have at hand.
>
Sure, I have pushed a branch [1] for you to have a look.

[0] https://github.com/prabhakarlad/linux/commit/58f0c079b2f839e635a77ded5505de5b7de05dbc
[1] https://github.com/prabhakarlad/linux/commits/rzfive-cmo-bisect

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
