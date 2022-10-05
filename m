Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A20C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 02:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHiozU0N94N4nZstsVWLyVqiI//RawdpWghgfsBzdis=; b=RPELPs+/IN01iN
	W13Ya76+cK03QbjgQEuWSGG/Xl0IzWeDDcpAF9R/LFPasvOVeDloT+301sFJ0iURQojgYJrmq5fC0
	mYRWwIRfWYhQ8k4l1rrAYJ/61dsVJkYaeajj5X8vFPyYU84EyB5+iUBGmhOl9YBPlByyEYrsXjg1F
	tN/Nik2rgLBwd3uBLLDWNU9c3ivnSQlPjztUmnHkVL8VGCJaIwnENKNtX2ubP6dFMef/2yz42p1P9
	FtYiGIj00DUtgD1kzvU2CSsthKs5id4v5l8B9ICW0vl1DcQBeqZxtCrAZMCfbQCFalzntXeP9hzcG
	MH3XekO57LOg4iES8qCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofu19-00C1Wy-JY; Wed, 05 Oct 2022 02:20:15 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofu16-00C1Wc-Sd
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 02:20:14 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id n186so10709125vsc.9
        for <linux-riscv@lists.infradead.org>; Tue, 04 Oct 2022 19:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=7YhJILkPdF1rs3gTPMB66dOMeDGdUKnSuDcjosHDwHM=;
        b=NQ2HSnnhyNHZKU65OVDnPAlcAl0VOiWBfVHf18IW3s2NTWnBWCSXi7JCTY02V1EKmZ
         W5W4glVa+g4HifUjg3962KPJA9QU2m7cczJeMhrk4TdDzj2Ie0O7/su23ITHMEQ+WcLt
         enA2HbScCbiM81lIrBOqUhwQ7tU53U7cZnLgQWNQz/RKHJrwVaMLjvl2+oEkYRY03/U5
         wi31YIufdWADwPLARAGexHlgaPZWa+4vUVHSYm6nP0brTSqojzzno2yrkThEs5Lqeeh/
         CmXqtbbEcOxo6uuN6m/uj/M1kBAocnH8nl7Mj/wlOwT+oGxFCwtB1jxGRh8dxh/kDfOi
         7XZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=7YhJILkPdF1rs3gTPMB66dOMeDGdUKnSuDcjosHDwHM=;
        b=w9iz9gJN7fkK8PFCbxha0z/w/5f8NikT0IndPeQs1I4y9jg5Gii4Th4MmB+wS7QLfQ
         FX0gehqKTmeF2LTYV7wKsLsNl3nUFLtnQhppYlvRBM1gsWtE24oMamDYpc66e43vgqAR
         mBnSkGcjPrnNQ2Sb1V/3H7Rggl+xDNhhjrymrCTHR/BzHmzPoefoVBX8QvRQ4T8vnoxg
         Ls6Vwf9xrmzTbZ5Q/RLZXFGudxdu50DPcgCIdlgSgKTq2yHwdywp5glNUAAo1bSc7Q9x
         nw/i9dsw44naYRNCEOpz/2LJ+qsleUCQP9noMaWqixTf9Gg4Tt6vrJ7pK9r9F05wJLnF
         ctQA==
X-Gm-Message-State: ACrzQf3OfY8Fxrg0N1EseMszmBnFYzqy4FwPkc/F067BzVDnVyUhnvYm
	nNvAqY3mieBy08594vwTJL8o0G3F09Rucbsnqic=
X-Google-Smtp-Source: AMsMyM46HGMnYHX9QyCDHjGsaX1PQWqUqZF5PSSi3MZ7vRUBRgtkrmR1VbmXCkeVBUetVx9BJt8naZPRFVDR6/R59cM=
X-Received: by 2002:a67:fd04:0:b0:3a6:d796:2291 with SMTP id
 f4-20020a67fd04000000b003a6d7962291mr363116vsr.64.1664936410064; Tue, 04 Oct
 2022 19:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220512205545.992288-1-twd2.me@gmail.com> <mhng-e9b5bd39-0929-487c-a761-6a3ff508d969@palmer-ri-x1c9>
In-Reply-To: <mhng-e9b5bd39-0929-487c-a761-6a3ff508d969@palmer-ri-x1c9>
From: Wende Tan <twd2.me@gmail.com>
Date: Wed, 5 Oct 2022 10:19:56 +0800
Message-ID: <CAJzt7PV0n8ybwVgMOAjsDTVardRBN6PCrZuW_4u6fTV-qPkaEQ@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: build: Allow LTO to be selected
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, nathan@kernel.org, 
	ndesaulniers@google.com, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_192012_946942_2EFD8501 
X-CRM114-Status: GOOD (  18.14  )
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

Never mind. Thanks for your reply!

But I find Nick's Tested-by tag is missing?
 https://lore.kernel.org/all/CAKwvOdmJ26h4L=3+42xeWG0_mZmZXkye=+mNWgFOHbo59ZVz1w@mail.gmail.com/

On Wed, 5 Oct 2022 at 09:57, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> > Allow LTO to be selected for RISC-V, only when LLD >= 14, since there is an
> > issue [1] in prior LLD versions that prevents LLD to generate proper
> > machine code for RISC-V when writing `nop`s.
> >
> > I have tested enabling LTO for `defconfig`. The LLD took ~2m21s and ~3GiB
> > on our Intel Xeon Gold 6140 server and produced an 18MiB Image. The image
> > can boot to shell using an archriscv rootfs on QEMU.
> >
> > I have also tested it for `allyesconfig` without COMPILE_TEST, FTRACE,
> > KASAN, and GCOV. The LLD took ~7h03m and ~335GiB on the server,
> > successfully producing a 1.7GiB Image. Unfortunately, we cannot boot this
> > image because the `create_kernel_page_table()` -> `alloc_pmd_early()` ->
> > `BUG_ON()` logic limits the image to be < 1GiB. Maybe we can fix it in a
> > separate patch further.
> >
> > [1] https://github.com/llvm/llvm-project/issues/50505, resolved by LLVM
> >     commit e63455d5e0e5 ("[MC] Use local MCSubtargetInfo in writeNops")
> >
> > Tested-by: Wende Tan <twd2.me@gmail.com>
> > Signed-off-by: Wende Tan <twd2.me@gmail.com>
>
> Sorry for missing this, the v2 never made it to my inbox.  Not sure
> exactly what happened, but an off-list ping made it through.  I've put
> this on for-next, I don't have any way to test it because I don't have
> clang setup yet.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
