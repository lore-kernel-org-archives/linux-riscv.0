Return-Path: <SRS0=83+V=KP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F36C433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 20 May 2021 01:46:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAB6C6023C
	for <linux-riscv@archiver.kernel.org>; Thu, 20 May 2021 01:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAB6C6023C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4uiyq972jRcftR8iMDmo0sYMDd/jkgJ/eb0dF3143jQ=; b=levU80paVM9L6IvdXPgzDtkwj
	CXao3StcJ5VdF89vI1BLJA7PmSy9YDFByrlmA+uI7l/DrM6JT/k6vGTudnFb6LYbZT6lfJGwyq1K/
	m7+l0NMcPAlc9uqpIF6LW0UjLoLYSBINIxYefNgCr6gRtWs+kpw1CiH/nkO/6/6Du1YWKeZT8F3VY
	t8XjsZNEHkmUbpZ5tqtNqKtc3xo8uiVApI1qUZrugppiYfMs8xKMgQLA9KJx2INDp5Uuiiezcis/L
	IPTGswDOqhasJLHRGZcmULFD/LsbHtNI9UzJz8j56+JCm5pLeM8BzMkKAiWvU2F9QVq1uMB3iYGu9
	Jg+EEqlXw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljXlG-005aYP-7P; Thu, 20 May 2021 01:46:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljXlC-005aXR-71
 for linux-riscv@desiato.infradead.org; Thu, 20 May 2021 01:46:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=QJsGilplrwMlqLgepJaF4OE9m+gYKBA0OcREQAUaXK0=; b=qKHKRY3evAaTLQ2ylf335GnDSh
 WdF2NdM9I86BrKBPUYKwwwfiXkz82p/pYphGXqULh8akTeI0nchV6bnYg+7o7fISAxfR+pUXuGcDg
 ENeCJr9akxnxuglGkBp5N0toSnuPdMtZ2DrAW5JMoYSpGUaq8NC4MB58pOPw/zoyOfJewm9lOKxh2
 h9Pmj56GQhSxrGbv7ICCCAIpOeZnGmrHVORVgfGX2wYXftX9ZIRtpCEwcPOwLAs9yko1A3BfsUzwT
 zArKzKsJHKVzShe4FKEtKwJiwe+YAZ1aUHY4cbRKsNHFayvDZV3wgxyDw7Tyh83nkekPcz5U7iwSS
 ep7Pu3DA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljXl9-00FsxH-Eg
 for linux-riscv@lists.infradead.org; Thu, 20 May 2021 01:46:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0506D611AD
 for <linux-riscv@lists.infradead.org>; Thu, 20 May 2021 01:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621475159;
 bh=QVDdQASuS8d9nfiPodUILwkkCeDcq435J2Gdpya1/ks=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aph4t/OpytN2td2rihSkPJpvAJmj3uRO97MpUkypnltNuu65Hws5hw0roDgsvXnoe
 C1rB8CAqcXJeDT4LXV44wliD6TUvEB5QZKJhEo0nKPvqU2Yg75uf/qKgwz66wnE+83
 V8Oenk4Kv29uKcK56VKcJAN0cxw4AfW2JNBjtM8DCYH2Wr3nQEHgHQBPB0A4Wl1IHP
 A4B6iKVTsPD6rAhRBh02GZ3LYknkrvap1HdQLSa81EH8egwbdYSLzcObSKu2bHhIyM
 NW3kdhC4/S8F4G1/xtDqCPZVVcyLr/Gd3YI+TWCkMfNpQwHe4EdeZ/tywUm+dXO9Za
 OJ6M2+obNBfPQ==
Received: by mail-lf1-f48.google.com with SMTP id i22so21838163lfl.10
 for <linux-riscv@lists.infradead.org>; Wed, 19 May 2021 18:45:58 -0700 (PDT)
X-Gm-Message-State: AOAM533mr9cf5zAYzV0KdeH5q8c/7t1p8JvysUlNx/MnTMC+mjZJPwZs
 Yet2ZeM6kmniuQkrpW7fv4wzmrt5IXl3yy2vjvk=
X-Google-Smtp-Source: ABdhPJxvtxM93jgsgXbzFfEJugjs4lSYYrFCIibVxmW1z4FBvYEZG3re1CeFqZabsg3qTIpZ9JXvpLiBbrRPU2sVGHY=
X-Received: by 2002:a19:ccc:: with SMTP id 195mr1668868lfm.24.1621475157363;
 Wed, 19 May 2021 18:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
 <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
 <20210519064435.GA3076809@x1> <20210519065352.GA31590@lst.de>
In-Reply-To: <20210519065352.GA31590@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 20 May 2021 09:45:45 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR4FXRbp7oky-ypdVJba6btFHpp-+dPyJStRaQX_-5rzg@mail.gmail.com>
Message-ID: <CAJF2gTR4FXRbp7oky-ypdVJba6btFHpp-+dPyJStRaQX_-5rzg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
To: Christoph Hellwig <hch@lst.de>
Cc: Drew Fustini <drew@beagleboard.org>, Anup Patel <anup.patel@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, wefu@redhat.com,
 lazyparser@gmail.com, linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, 
 Benjamin Koch <snowball@c3pb.de>, Matteo Croce <mcroce@linux.microsoft.com>, 
 Wei Fu <tekkamanninja@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_184559_550955_92D43E25 
X-CRM114-Status: GOOD (  28.69  )
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

On Wed, May 19, 2021 at 2:53 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, May 18, 2021 at 11:44:35PM -0700, Drew Fustini wrote:
> > This patch series looks like it might be useful for the StarFive JH7100
> > [1] [2] too as it has peripherals on a non-coherent interconnect. GMAC,
> > USB and SDIO require that the L2 cache must be manually flushed after
> > DMA operations if the data is intended to be shared with U74 cores [2].
>
> Not too much, given that the SiFive lineage CPUs have an uncached
> window, that is a totally different way to allocate uncached memory.
It's a very big MIPS smell. What's the attribute of the uncached
window? (uncached + strong-order/ uncached + weak, most vendors still
use AXI interconnect, how to deal with a bufferable attribute?) In
fact, customers' drivers use different ways to deal with DMA memory in
non-coherent SOC. Most riscv SOC vendors are from ARM, so giving them
the same way in DMA memory is a smart choice. So using PTE attributes
is more suitable.

See: https://github.com/riscv/virtual-memory/blob/main/specs/611-virtual-memory-diff.pdf
4.4.1
The draft supports custom attribute bits in PTE.

Although I do not agree with uncached windows, this patchset does not
conflict with SiFive uncached windows.

>
> > There is the RISC-V Cache Management Operation, or CMO, task group [3]
> > but I am not sure if that can help the SoC's that have already been
> > fabbed like the the D1 and the JH7100.
>
> It does, because unimplemented instructions trap into M-mode, where they
> can be emulated.
>
> Or to summarize things.  Non-coherent DMA (and not coherent as title in
> this series) requires two things:
>
>  1) allocating chunks of memory that is marked as not cachable
>  2) instructions to invalidate and/or writeback cache lines
Maybe sbi_ecall (dma_sync) is enough and let the vendor deal with it
in opensbi. From a hardware view, CMO instruction only could deal with
one cache line, then CMO-trap is not a good idea.

>
> none of which currently exists in RISV-V.  Hacking vendor specific
> cruft into the kernel doesn't scale, as shown perfectly by this
> series which requires to hard code vendor-specific non-standardized
> extensions in a kernel that makes it specific to that implementation.
>
> What we need to do is to standardize a way to do this properly, and then
> after that figure out a way to quirk in non-compliant implementations
> in a way that does not harm the general kernel.


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
