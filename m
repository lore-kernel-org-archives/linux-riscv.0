Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36533C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 16:17:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 009D320828
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 16:17:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GMZPhaf5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="fkz8R3nF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 009D320828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=untYKrqDvWbnYslrYxR8tEc4QI8ni32IbGQ6PgL2mmE=; b=GMZPhaf5e+UjAg
	u5Ur08peBPKzqssmI/Ut9G2hB2IkEZTasWziAWsLmWZ91qzJk9I5AQcd9hoPJreRbQpZUWkSC1ob/
	DlHoJIyGplLZ/64ygYApA/PcCHa1ujnp5pxgbmKjj4k15k/0o4LYFCGBTBPJUH9LDJjtTQjCy97HS
	DgnrovT6KHFamv+ET2Fp971HPws3pRkQnBRobakLxt+tfr0ZfVVPcVk/ysUs3+8PHE9nW2cwXw3tG
	38hMv+4KhdJg9/xdtVyYutowMM1XDnqXM8/MSSCOvErQnhAhXTlYoP4RNHz4FibUvJlD9CS8Genl6
	Ttrsmhu1Tlv/7UHiKSxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8SHl-0004J3-En; Mon, 25 Mar 2019 16:17:17 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8SHh-0004I6-Hh
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 16:17:16 +0000
Received: by mail-wr1-x444.google.com with SMTP id k17so2920658wrx.10
 for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2019 09:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3OCmxubdP2nbG77xoMJhNUuIbCr81ZRpBEz8MY/sedY=;
 b=fkz8R3nFiYXZ5FV4x8L6CwBRZiNK8Ot9sdcN3g3MzXMsrPlZd6PcjbRzgnuY8kE1OS
 /hcJIEHKEgY9ZGCE5NpAcJgGfKVo30avcrBhBypPlOzFiCEHFfzYRVFOYN5OLQhQEkap
 d4wvo8GhNDJAqEpGyCgoWgsAnxiNMRFUd9b3icZYilCh7AtAJp/wo2s1nzDABq7nsXkw
 ls/MGbksqpmCHJynL2YuEhTz/cro1i3+X0KW/STI7EKiwi9S5WB/tCM3VpVATZJiDQA/
 DQjDvsn8L9TRXZYE/vQAyer+MrGJ0F5Ybs7kJjqBmZfmrD8Fx4tw2Uu6prviXMZww1sK
 /g2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3OCmxubdP2nbG77xoMJhNUuIbCr81ZRpBEz8MY/sedY=;
 b=FIq5M4Xcvhm+HHepBi4owEjV5VJEGqIOfazwd1mnoCtB9zOk5e+c6bU6ZeuHnEDSZE
 CbDoZ/Zwq3b3EC0ETaaPxYqP5+/FrQTT1nn5hKG6wv485gsTLThGoKUQMAUzDSqXW2kb
 pjCwuWuXaBJVRdnY0mGCtvhr+Sf7C4UD86lr2y6Wr2ZFBV3cL63/CYpGX05mHer7rLKe
 DQ7drW1MNOC1CyxvRj37roj8s478rLFcdYZgksohymH6N4GcgZWISEs6uUbkU6TMlLDi
 MV5zh66oanCV/VVj1i0zKyKYMFYI4JyJ//YGNJrqouKM7Gclvp3FGCH6PcK1DQx6p2sO
 sH4w==
X-Gm-Message-State: APjAAAXj3+T2SWXWhYlZLHA9qbwffk6ahHU8v1R4Ytv3neoot1VbuLv0
 2jxUn3SHGn1m0zzVHeRPuWgmA9f3Q+Xv2oCvv/z0Qw==
X-Google-Smtp-Source: APXvYqzhEAzIBWMezXF/NqdzgaUTCmVD/3dJHiiLysFJvH4kjjrJP9VcS0tC0D2ucluHcBvt1nHIe+mZawWQxH6PsfI=
X-Received: by 2002:a05:6000:120c:: with SMTP id
 e12mr2653855wrx.187.1553530630082; 
 Mon, 25 Mar 2019 09:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190325092234.5451-1-anup.patel@wdc.com>
 <20190325092234.5451-5-anup.patel@wdc.com>
 <20190325113935.GD27843@infradead.org>
 <CAAhSdy2dds7pp8=XX+zbKbMoWbgjPxP6r4aMZJeHyqHV2MP4CQ@mail.gmail.com>
 <20190325145919.GB14826@infradead.org>
In-Reply-To: <20190325145919.GB14826@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 25 Mar 2019 21:46:59 +0530
Message-ID: <CAAhSdy2je-_=AHPawbV-8cUR0P7WvqDZ5wNdEmDVQkR-a88Eog@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] RISC-V: Allow booting kernel from any 4KB aligned
 address
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_091713_769181_541743F7 
X-CRM114-Status: GOOD (  19.94  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 25, 2019 at 8:29 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Mar 25, 2019 at 06:18:45PM +0530, Anup Patel wrote:
> > We trying to addresses following issues in current code:
> > 1. The current setup_vm() maps all possible kernel virtual addresses (128GB
> > on 64bit system and 1GB on 32bit system). The amount RAM present on
> > real systems might be much less so we should not have kernel mappings for
> > non-existent RAM. Of course, we don't know amount of RAM available in
> > setup_vm() so we have to split page table setup in two parts and do minimal
> > required mapping in setup_vm().
>
> Why do you even care about kernel mappings for non-existant ram.

We care because there will always be some buggy kernel driver/code going
out-of-bound and accessing non-existent RAM. If we by default map all
possible kernel virtual address then behaviour of buggy accesses will be
unpredictable.

Further, I think we should also make .text and .rodata sections of kernel
as read-only. This will protect kernel code and rodata.

Above things add more debugablity to kernel and also help us catch bugs
faster.

>
> > 2. NOMMU kernel requires a swapper_pg_dir with identity mapping (VA == PA)
>
> Bullshit.  nommu per defintion does not have page tables, and thus

Yes, I know but we did see a kernel crash in-absence of kernel page table
with identity mappings.

>
> > 3. For both NOMMU with tiny memory and MMU with tiny memory, the current
> > setup_vm() is not allowing us to place kernel on non-2M (or non-4M) aligned
> > addressed there by causing memory below kernel to be wasted.
>
> As mentioned a few times - nommu per defintion does not have page
> tables, and in my uptodate nommu port none of this code is even compiled
> in.  If someone still compiles that code in some codebase that is just
> a bug that needs to be fixed.
>
> For MMU with tiny memory is is a theoretical case, but I still haven't
> seen a good rationale why we'd care for that case.

Lot of RISC-V systems being built today target resource constraint
use-cases (such as IoT or embedded) where more RAM is more
cost and more power.

It is very useful to have Linux RISC-V run on just few MBs (if possible).

>
> > 4. For MMU based kernel, the current setup_vm() is hard-wired for fixed 2M
> > mapping size. It will require more changes if we want to do 1G mappings.
>
> And why do we care?  Even if we come up with a good reason for 1G
> mappings we'd better find a way to select it at run time and not require
> a gazillion of options to select how to map the kernel.

1G mappings will give better performance compared 2M mappings.

This will be very useful for performance hungry system with lot of RAM.

This patch selects 1G or 2M mapping at runtime based on load address
alignment.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
