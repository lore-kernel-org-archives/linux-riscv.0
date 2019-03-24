Return-Path: <SRS0=PVrh=R3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E685C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 01:42:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5516521741
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 01:42:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q5gkD/uf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="nUa3VCuJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5516521741
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mZhAU8Nnyuaajeiem9Lky8fbOjQW94BuPvT8xabHXkQ=; b=Q5gkD/ufTRmo/q
	MmmsDXOFbQT5iJUCWSh7vHjp4aM5TFXmy19Gy1R3JNuzUkKcxyeItwA2IuFVvhgwQMY8Wl2uzB1E4
	zt2lZcSroCH4N0mcneVUXGKgnmn7HHe62AJNU/gV62NSp6XmWpGM/hVCwHK1GZaEk/IjwFXd2RKIn
	4CMJ7eNM7esFVQUM8R7zSRVVdnUi6PdvaJoXT/EMQiCD19yMGN5L1EnVDnWW9StRVeXRekgI9IJAi
	xu3+PMRXH0Oi/OWa08M0/NhYeQTI1G5kH3npmcrLDmiKU3c0zcaS8ENVyFoUq7JW1pRfUgpR446+Q
	yC7QoOLFa8SFBgpH8NBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7s9Z-0006aD-JJ; Sun, 24 Mar 2019 01:42:25 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7s9W-0006Zt-NN
 for linux-riscv@lists.infradead.org; Sun, 24 Mar 2019 01:42:24 +0000
Received: by mail-wr1-x444.google.com with SMTP id g12so6274796wrm.5
 for <linux-riscv@lists.infradead.org>; Sat, 23 Mar 2019 18:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UMg+TQmTlxKeoT7PuONEKN/g7xAo1ZHDq7zN933W/gY=;
 b=nUa3VCuJCCRh/ADAt/wn0tnl3Q2/eEgFm4ZzYhkOT+0qSt/OissIP/nmxTutkLWNyA
 mF5nHHr0sbCkA+/347ukoeTUDAtJM3gf179Kp34n0mgHKatL/yaw7OgQiqhSy7A0FhQv
 r9duSLOgJCf0jIcOJxRReJBewkaj1xrB1CQ58coOHnowLstKStHasw3dORUGvFvNhTgU
 Vqzn+/lZVOcgsN1Vk1q9h7y6sJFyG8BIADJ8Uy9HZz7BY9B9zNCXfWnkqHf4d08PxYXH
 2dzBrLHqC9PJ4toy4H/8yBXAIKkRLluPEaX8AErN2Ojq4KK66He7UZX0OOZ4Vw3Y738q
 2gAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UMg+TQmTlxKeoT7PuONEKN/g7xAo1ZHDq7zN933W/gY=;
 b=e8eOFolP7iOay9UZzTxHt/+y2Zx8q3fSB5NPzjxXpi0Eo/Q8Vs4CgYz1KK70NQqQ+s
 ZprKfZrvavRm0Q1bavwshaqVqKvOtlqBdVddbOGgJPIB8wIoI7dW0aceCsb6r13A2CFc
 fzZKYYQD83YKeYOmjgAjK98+mSphA0+5dW+IBMB8sVhuGTDlQRepgDJntnMTisNVqum2
 pxZcRxpGX32+DxHof+Apw0pMrlrsfaIo974aqu4SEe1au9g6kqQb6Y+laeRtbNy70ptN
 FZek4RwSjg2E92SzOlZeKsaIaMW+SobBCvLyM7+02ye7yp93oAVXSwY/kwV7zWwQqoWj
 Dl2Q==
X-Gm-Message-State: APjAAAW3U0/OjB1FcW1bcP5umOj7TAeVD3ihAOlTXedO5MMKTgd8ySBP
 p8eHuNFyalsqbmPmVRtKML6pmmnwLPR5WMTOrNbEMw==
X-Google-Smtp-Source: APXvYqywTGzD5g9Cx//yO6hIjcv7B+g0fzNApAtiBtfbps2xPM98YI8PqaTjuW+72NMXwoIcJFe6QSvokvjWvkAh554=
X-Received: by 2002:adf:fe03:: with SMTP id n3mr6743681wrr.59.1553391739110;
 Sat, 23 Mar 2019 18:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy0mUboGJH_GJbsGFBwcukjttVQcTGfzwkaMFQb9ZVY4Mg@mail.gmail.com>
 <20190322104209.GB24367@rapoport-lnx> <20190322132556.GB19263@infradead.org>
 <CAAhSdy1VS8-3npcZUzjicnKGsjHcc6WH3Co6Hx2=GvttoatWcA@mail.gmail.com>
 <20190322134043.GA18818@infradead.org>
 <CAAhSdy2qbU1uhnVQvh0C_FOoKDy-Y0ZTUryAKD97xAXXGQSdCA@mail.gmail.com>
 <20190323172153.GA9085@infradead.org>
In-Reply-To: <20190323172153.GA9085@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 24 Mar 2019 07:12:07 +0530
Message-ID: <CAAhSdy07GsHXpG9MJZ4aiB5uG7D+9RA+17Nb1MrWdFg9ee6rUA@mail.gmail.com>
Subject: Re: 32bit kernel is broken for Linux-5.1-rc1 due to GCC cmodel=medlow
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190323_184222_901817_607D4F8B 
X-CRM114-Status: GOOD (  14.15  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Anup Patel <anup.patel@wdc.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Mar 23, 2019 at 10:51 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Fri, Mar 22, 2019 at 07:15:37PM +0530, Anup Patel wrote:
> > >
> > > I am not saying the revert is the final solution.  I'm just saying
> > > that 5.1-rc is not the place we should be doing the major surgery.
> > > Revert fox 5.1, fix for real for 5.2+.
> >
> > If we revert for time being then even fixmap support has to be
> > reverted.
> >
> > The patch only updates access to kernel symbols via __load_pa()
> > and __load_va(). There is no functional change as such. The patch
> > is tested on QEMU/virt 64bit, QEMU/virt 32bit, and SiFive Unleashed.
>
> Just curios - if you just move setup_vm and dependencies into a new
> file that is compiled with -mcmodel=medany, just like setup.c,
> what issues would we still have that require explicitly passing the
> load address?

There are four cases here:
1. 64bit with cmodel=medany (default for 64bit system)
2. 64bit with cmodel=medlow
3. 32bit with cmodel=medany
4. 32bit with cmodel=medlow (default for 32bit system)

I had tried using cmodel=medany as default for both 64bit and 32bit system
and it works fine because there is no issue with cmodel=medany but it is a very
crude fix and things break again if someone explicitly selects cmodel=medlow
using kconfig.

The patch for using __load_va()/__load_pa() accessor in setup_vm()
solves the problem for all four cases above.

If you still think the patch is too big as rcX fix then alternate approach is:
1. For Linux-5.1-rcX, we use cmodel=medany by default for both 32bit
and 64bit RISC-V (I can send a patch for this immediately)
2. Consider __load_va()/__load_pa() patch for Linux-5.2

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
