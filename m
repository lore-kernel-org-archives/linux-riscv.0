Return-Path: <SRS0=fNze=QQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 436CFC169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  9 Feb 2019 03:30:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4B612177B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  9 Feb 2019 03:30:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h/rdtCJI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="FWRAMMVY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4B612177B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIJPnsy0tX6IXfZmXkZ3ZPkgM0zpHLzDAxYpsYGRiyM=; b=h/rdtCJIngff4t
	cHIiUCgA9CHPGfojdqzYiQhsqAXeFX03AyV7n78F4/QwXSpDfsEJzY1AoMz5B/h9npQ+DGTL4pYoI
	cB61cuofd4WNHAHMTncx1lg0n0jp4/gDrpxxxfKPU/HyVwsRMKhp2Io0/WdwuEj14TR0tZUoRKApM
	wDgQE5k4DmOfJlCTNlwYKO8wXyJboFvtr/hu5TT526j+1XWAuyLOtVgsZ9VwVGIKY5xDh4crjqC/N
	rhnlAfpdAZMYc6OBhiOnbduhUOoTETHDucha1M/fqjjC6n220XmAXProepXTFfUa6YLUsc0f5f3ZK
	gqOkraB026lWE64YROYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsJLp-0001K9-OL; Sat, 09 Feb 2019 03:30:45 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsJLm-0001Je-GE
 for linux-riscv@lists.infradead.org; Sat, 09 Feb 2019 03:30:44 +0000
Received: by mail-wm1-x341.google.com with SMTP id z5so6723701wmf.0
 for <linux-riscv@lists.infradead.org>; Fri, 08 Feb 2019 19:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZJbDoMq3A/2Y6Zl+qPImkvVtGPZYvG7/dV2jYrsl7O4=;
 b=FWRAMMVY32kJaTXrDgYfN/y36PAoriXTSmuGC8fnswRo/wUw+r/U1q52o62sihqGT8
 1pPDICdcO6CXjDg8jC5d3YdQTIopcm3AB2+bvuvgWlpELAQZ/uKEXdiZJ6aHE5OfwZSL
 diJRNtuiOhInXvtTWuSpcrP2cgZhwY+e+uGu6I41s1fmAv5u2TKyGi60RXAYmKJByF+1
 +9TCGEl/5KANp3eyopZ1kXFfplv1mAAV62WqJumbBBWnkwORo2WTzGNn0yl8/eHgINPa
 CAxzA+H09+/rFbYclKrtVEh+g4ld2b2HSHUWyHVrjVKrZ+IXFW81Vf6E831YE7X1o8s3
 t4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZJbDoMq3A/2Y6Zl+qPImkvVtGPZYvG7/dV2jYrsl7O4=;
 b=DDwvrPmnPucVNaIrZVyIvgO/oBLigA9nVaKlpJgDg/Wq7m/H+teryzGA0slZAxiMlV
 izCDXdqjaB30rJ46ojSxJjpZU/xg9xn6qPZ0VJNAW4eUqSA2JzHXxd6Towwoe0NWqcHr
 s7j9+wLnaTIsL9NLEkXXGZBKxSJr9C/1IIo0pYjDebqPcDLaCCys3VUiamdcilsIAzxI
 nIDWAxhJIYIjS86cAWCKkdHXkC8L9WpuwbvMuVbhvwpG5wWCfQKxh0AIHG6SXPIF/kEc
 JSaCuLNkYe0fhUCGGZT+iNHBwM5CQ5zstp3Ifpx6KUIQg94/P8u03kmPt/5z9vbJQcAx
 tgYg==
X-Gm-Message-State: AHQUAuZiA/A0h9FZqJzuck/AETt2s00WjZlfjR47plxm0HTyHCHlyoin
 rkXJf4CiFhp5A8NvECrJ2A92eUJrItmPANpEOAg1qwE4
X-Google-Smtp-Source: AHgI3IbCXkZpvm/ZFTNaXU7u1Qqwfoh2iuUbpUGCFY6OnHtXBSak97+AyicgrvXgApfNnJ11cuhQgMvgE6ONsFFp5B0=
X-Received: by 2002:a7b:cf12:: with SMTP id l18mr1158341wmg.21.1549683039121; 
 Fri, 08 Feb 2019 19:30:39 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy3im4i0PJvKqDAfq2iDFvTA2O3ZsxjM6wSgdnFUU1eVcw@mail.gmail.com>
 <mhng-487587c1-cd66-40f3-86fc-aa2f034f5028@palmer-si-x1c4>
In-Reply-To: <mhng-487587c1-cd66-40f3-86fc-aa2f034f5028@palmer-si-x1c4>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 9 Feb 2019 09:00:27 +0530
Message-ID: <CAAhSdy2pBp10bp_jvCnApGYZa4Y2779ELrvH2DgcP4TRiKUzwg@mail.gmail.com>
Subject: Re: kernel after 5.0-rc2 may not boot using BBL
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_193042_682215_E3AF9599 
X-CRM114-Status: GOOD (  17.00  )
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
Cc: Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, Anup Patel <Anup.Patel@wdc.com>,
 Andreas Schwab <schwab@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Feb 8, 2019 at 10:59 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Fri, 08 Feb 2019 01:17:00 PST (-0800), anup@brainfault.org wrote:
> > On Fri, Feb 8, 2019 at 2:43 PM Christoph Hellwig <hch@infradead.org> wrote:
> >>
> >> On Fri, Feb 08, 2019 at 02:32:51PM +0530, Anup Patel wrote:
> >> > It is a bug in BBL because it is not keeping sufficient gap between
> >> > Linux kernel end and DTB. The change pointed by Atish actually
> >> > reduced flat kernel binary size by almost 1MB.
> >>
> >> And that is all great.  But it breaks peoples few existing RISC-V
> >> setups, which is the best way to frustate every single of the few
> >> users out there.  And that is best way to lose any interested in this
> >> already hard to use mess.
> >
> > There is no issue if you are building Linux RISC-V defconfig.
> >
> > The issue starts manifesting only if you more drivers enabled.
> > Again, with growing kernel not everyone will see this issue because
> > it will only show-up only when gap between payload_end and next
> > 2MB aligned address is not sufficient to cover BSS section.
>
> I agree with Christoph here: we should revert the commit.  There are various
> versions of BBL floating around that are a big headache to update, and since
> all the patch in question does is reduce the flat image size it's not worth
> breaking existing setups.
>
> I also don't like the proposed fix, as that just statically sizes a 16MiB BSS.
> While that's fairly large, it is in essence just kicking the can down the road.
> The kernel on my laptop has a 7MiB BSS, and it's just an arbitrary smattering
> of the drivers I happen to use.  I'm not sure what the right long-term solution
> is here.  I kind of want to say "just use an ELF", as someone has already sat
> down and figured out how to put everything into a file that's required to make
> a binary run.  I feel like doing anything else here is really just going to
> involve re-inventing the wheel.

IMHO, best solution would be to use mature open-source bootloader as
payload (i.e. U-Boot or similar) and always boot Linux from bootloader. Using
Linux as BBL/OpenSBI payload can still continue to exist but it can be more
of a developer usage.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
