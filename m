Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7354DC433E3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 09:31:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CD512070A
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 09:31:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lQzqha5I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="yY/akW2D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CD512070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A1NRlT0F3iIbhWZvsr+jPDJAe0mTwjbeg4Msju1kJS8=; b=lQzqha5IQ1E+5d7CDF6NpEwr3
	okb9J67WuGq4uSNR+iJxnOEWbKdBJq7kMlzeOYJxkF+sLFXR6dutgR/3x6AymyHSMac63LS9LV4wg
	5CPD+4l3TGG/ygOExQmi3R9vi/DfGKcgNEa/NRhjocXkDTC+t7xlqMgjkkphMfN1XHXFZOxFl+7A4
	DgaQpGSJhVCpmsNZwrDgRKQN/CE+8X4+ai8+3KTSYMvN936F7X29cCfrdl6UrSjLfYg907YUt2Im0
	M8lmLuKZjthwMLLyk0XzovjY9HPxmfTo24lf0hSB9vspPWTIvHjurmd2ha7GCcaeqjnafLTDryfEF
	HH4dM0yhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxobz-0008WO-Vy; Tue, 21 Jul 2020 09:31:00 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxobx-0008UY-4G
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 09:30:58 +0000
Received: by mail-wr1-x441.google.com with SMTP id 88so10207700wrh.3
 for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2020 02:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R+EF85aNDdODINrCfjjd0Lfuv95jSgpJvxBVPXo7UEI=;
 b=yY/akW2D9+GrY1oKN3c5+dEliD4OkQM7F6PBHq+jxAt2+MgNVNgHxD8r/+H4hPWZp7
 C6QNv/0wFMcXxVoU3TCemQtIbqkOS+zrtNK1Y3W9/SUy1XdL4jbRdKft5mJ77z/BPakH
 TRk7m1nXqDlBfEq2paJClFRCVqFNLQp9Q5w6FvRmxQfD/BsJ8NskgIwBqJSC5msTA4Xp
 /dPdMrboPhqh06qZbYrGbe/LnpvGSNTJlrfRctFCk5uVc/hp7RpbjH7DcmtUpXQaiP6I
 Zghs3hCBJZfGnwUBK0nuRl6+I9AoSqXtCQRveCQ8KX9MH8VTc+oRbDCFJBxzrXW1ETJW
 qg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R+EF85aNDdODINrCfjjd0Lfuv95jSgpJvxBVPXo7UEI=;
 b=ivnT0ZtylTPTtXnx/932Ga1QRTTDLh00HeJNvHvHsGwHTb9FOUkqQXjYprovb9416S
 8f0l+eeE/JcOFC5oPozyFMyqVIN12kZoN0ljow8bHPJcsBcKeO2efcdz33gbWy08XwSd
 oJYcKe7iUa/dvMV4nkoCoGlHtB3TujwbvmEqOyVJiVDLd/QAUW4TEKGlLPXQaFVGC4+s
 ZwStkunEqiDd91ts+zF2hMkGu6aVd9ep3CRI70M5Bxi2czayT5lpNmTvAfZuVQfDPV/x
 Xj8nEuyWnd9erc006tRmXc7qmDwq8+pf4bFy9Ykd9O/4iFjO0tt/6DhbZBXAbUbCrtb/
 7UMA==
X-Gm-Message-State: AOAM533dz7nd06Xo22WBb2xHLwXf6ZFX+klcPdhIR+WBXR+8DrWh/ZsM
 KbwHdRe+oj21Tnhd794SCJApvohn3f+tpGB1zarMNQ==
X-Google-Smtp-Source: ABdhPJyEHJcpxpIsrSRwyhLOvolFk/1JMt5qF29yZtthuuwIDXna9yG5CaRZAoAVzWcNKbHQE3jBtSCRybazpe/ZsxU=
X-Received: by 2002:adf:de12:: with SMTP id b18mr27796440wrm.390.1595323854198; 
 Tue, 21 Jul 2020 02:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200716234104.29049-1-atish.patra@wdc.com>
 <20200716234104.29049-2-atish.patra@wdc.com>
 <CAK8P3a2EesjQAs-YGrCO=cYfUVWFQ3CbJfVXJx3qZjCS_XW+wA@mail.gmail.com>
 <CAOnJCUKF-tfN-fHyRcjyAMnYVzQqp=_CLa2F4TQNO7jA4infoQ@mail.gmail.com>
 <CAK8P3a3iUdoOZrORz+aeXYiO35Lp8snrCkxSUPAY6Fh2EinaOw@mail.gmail.com>
 <CAOnJCUL2X9mK41iHLCg1_rtj7JS4p41hqXfmd=hyxK=2t5QQog@mail.gmail.com>
 <CAK8P3a3e3SBtTocpkCybKRjkBJG26G-8YdiroJbZLZYq9f0yfw@mail.gmail.com>
 <CAMj1kXH53V3Vu8Lq4yzSCn5ZSxn65KiVbt91PUPhkBRO6vuRSQ@mail.gmail.com>
In-Reply-To: <CAMj1kXH53V3Vu8Lq4yzSCn5ZSxn65KiVbt91PUPhkBRO6vuRSQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 21 Jul 2020 15:00:41 +0530
Message-ID: <CAAhSdy3XYYaDTC293C9pQRHMz99XGoXr1HDcGv8Zi=9Mto0BHg@mail.gmail.com>
Subject: Re: [RFT PATCH v3 1/9] RISC-V: Move DT mapping outof fixmap
To: Ard Biesheuvel <ardb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_053057_222917_B8EDEEF6 
X-CRM114-Status: GOOD (  21.12  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-efi <linux-efi@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Zong Li <zong.li@sifive.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Mike Rapoport <rppt@linux.ibm.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 21, 2020 at 2:32 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Tue, 21 Jul 2020 at 11:57, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Tue, Jul 21, 2020 at 6:18 AM Atish Patra <atishp@atishpatra.org> wrote:
> > > On Sat, Jul 18, 2020 at 2:24 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > On Sat, Jul 18, 2020 at 3:05 AM Atish Patra <atishp@atishpatra.org> wrote:
> > > > > That's what the original code was doing. A fixmap entry was added to
> > > > > map the original fdt
> > > > > location to a virtual so that parse_dtb can be operated on a virtual
> > > > > address. But we can't map
> > > > > both FDT & early ioremap within a single PMD region( 2MB ). That's why
> > > > > we removed the DT
> > > > > mapping from the fixmap to .bss section. The other alternate option is
> > > > > to increase the fixmap space to 4MB which seems more fragile.
> > > >
> > > > Could the original location just be part of the regular linear mapping of all
> > > > RAM?
> > >
> > > No. Because we don't map the entire RAM until setup_vm_final().
> > > We need to parse DT before setup_vm_final() to get the memblocks and
> > > reserved memory regions.
> >
> > Ok, I see how you create a direct mapping for the kernel image, plus
> > the fixmap for the dtb in setup_vm(), and how moving the dtb into the
> > kernel image simplifies that.
> >
> > I'm still wondering why you can't do the same kind of PGD mapping
> > for the dtb that you do for the vmlinux, creating linear page table
> > entries exactly for the location that holds the dtb, from dtb_pa to
> > dtb_pa+((struct fdt_header*)dtb_pa)->totalsize.
> >
>
> On arm64, we limit the size of the DT to 2MB, and reserve a pair of
> PMD entries adjacent to the fixmap so we can map it r/o statically
> using huge pages without using fixmap/early_ioremap slots. (Using a
> pair of PMD entries allows the DT to appear at any alignment in
> memory, given that PMD entries cover 2 MB each on 4k pages kernels)

The arch/riscv is common for both RV32 and RV64. On RV32, we don't
have PMD due to only two-levels in the page table.

Although, I like the idea of two consecutive PMD mappings which are not
part of FIXMAP. The RISC-V early page table is totally different from the
final init_mm page table. I think we can do two consecutive PGD mappings
in the early page table at lower addresses (quite below PAGE_OFFSET). I
will play-around with this idea.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
