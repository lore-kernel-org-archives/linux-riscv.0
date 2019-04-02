Return-Path: <SRS0=a8/2=SE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0DC5C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2019 09:30:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0CE32082C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2019 09:30:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q/vMKPXM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="ayT/ztXl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0CE32082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4c1uWc9v0MGm6UES3KBDd2XAH+hCXKH7RSmbvbRBiOo=; b=q/vMKPXM2ykMxV
	8YZZD/6d7NczEpsB9iwb+Aryk3qR+3sAZHlfCKjKYVXzqWi3QSLyhKJ1J3fV2OHWY+6SyG9AYXYoN
	IIFmeWKTBVGfYQWa2zvt+CFCBI1X5iO68unI0Rvmn6a3tYkCEHMW/Zx/RANkDaDMKgdYlY7hqlR29
	5sHzB3kUFZowIlYG0VQvbJOh8CnrmA/emnN6GvAtmaj8fFKe32ghNbN+2A0/4kPokIhcVRofosbWs
	DVJqqgOIkho8EIt/9Y3bYaohPryxeGnlDALe3FRrTeKE6sGsXz/O4Cl6m2pIrpbTZaFYTlTtC0gOq
	kltO+ZVz0XC2FUwBD+sQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBFkJ-0007Pw-HQ; Tue, 02 Apr 2019 09:30:19 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBFkG-0007Ox-8n
 for linux-riscv@lists.infradead.org; Tue, 02 Apr 2019 09:30:17 +0000
Received: by mail-wr1-x442.google.com with SMTP id t17so2638938wrw.13
 for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2019 02:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Oc09Dl5VnJwNMkzVxQL/s8VkqouE05vipzjBnfAum/g=;
 b=ayT/ztXlSmBKMpQwSMaxTN51wM33NPCBOSG+5gtD8y3PoCRK4M019isdENEEynH6ME
 jzoqV7Tu7vSudN/XKBPR8YaW7YupqNZwf2xdu3NphyA0CALKBvqaP1BaXSyjosYSu0xb
 QvUEyiwL5H4xIATAACmbSBqVP/M02oeH12eCd4ZV258cJKLaXJyvOyKOHJHIrWRtRW/t
 GEmRzVt5hwDafwcaZ3oB0B2vpKaHUq6sKkAP+sypceJS9SpKx9nHFNJlxkaqWX4ACxJT
 Urm56miRVpONQzXa+vBpttnZl64Ul+Qr6oIaIoujxsS/HXyQlEt5narvzTZgzG+tvlUq
 QISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oc09Dl5VnJwNMkzVxQL/s8VkqouE05vipzjBnfAum/g=;
 b=n3+D3SnDrCtVIip1mmOgApq7hFKRfpuX1k0SjnDErWmegOZcWITC+bQVyT+hx8Os0d
 LkY0xGwOGKVrxCQwlRhb7bXk1tIFnYTgEky+BgXjC7pUPW9s/qKjcCiRBtTdCMkyhFYL
 3Yqts/heKqUmQ8T227cC3p/zi7ybSieCnFSfHnIcuVQhDJCnpn1wpn6zEourm2wIk0A2
 LFgkxoh9tbwkugI+VlN/rOSegsVtCDwpKHQKk2sSvQYJs7Xa609mx3IYRWhS8Y5InSSf
 ndikp1AemeBzyaollMGruTsfqP61kNIDL03fcb6gHu4xQCZIricD5P9KR8WGn3pROxhw
 y8Bw==
X-Gm-Message-State: APjAAAWWqrvimnXmD0nDiGKFbLVrKV2DnjpyjtKDGZNQgeOgcwQNCu93
 UIkcmriE0PHWkYoU7Rd//y1ausksS9ANXp1TN9B5LQ==
X-Google-Smtp-Source: APXvYqyFWTZHBcs2XIO+GnPstQbUDpk0E07Pkxe2eCsN9M1fUoaDiiVuB5MoMgVHoOMU7SlmTTwRtGT9Q7PTcOO9WCA=
X-Received: by 2002:adf:f80d:: with SMTP id s13mr42907151wrp.38.1554197414056; 
 Tue, 02 Apr 2019 02:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190402055902.14017-1-anup.patel@wdc.com>
 <20190402083456.GA2153@rapoport-lnx>
In-Reply-To: <20190402083456.GA2153@rapoport-lnx>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 2 Apr 2019 15:00:02 +0530
Message-ID: <CAAhSdy1ZFW1zAqc-7904SOse-tWKOmpY3dCHb5Xe6U6KNno_JQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Fix Maximum Physical Memory 2GiB option for 64bit
 systems
To: Mike Rapoport <rppt@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_023016_311713_F9B40673 
X-CRM114-Status: GOOD (  19.75  )
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
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Apr 2, 2019 at 2:05 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> On Tue, Apr 02, 2019 at 06:02:38AM +0000, Anup Patel wrote:
> > The Maximum Physical Memory 2GiB option for 64bit systems is currently
> > broken because kernel hangs at boot-time when this option is enabled
> > and the underlying system has more than 2GiB memory.
> >
> > This issue can be easily reproduced on SiFive Unleashed board where
> > we have 8GiB of memory.
> >
> > This patch fixes above issue by reserving unusable memory region in
> > setup_bootmem().
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  arch/riscv/mm/init.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index 5fd8c922e1c2..6b063f20a9d0 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -121,6 +121,14 @@ void __init setup_bootmem(void)
> >                        */
> >                       memblock_reserve(reg->base, vmlinux_end - reg->base);
> >                       mem_size = min(reg->size, (phys_addr_t)-PAGE_OFFSET);
> > +
> > +                     /*
> > +                      * Reserve from the end of usable area to the end of
> > +                      * region
> > +                      */
> > +                     if ((reg->base + mem_size) < end)
> > +                             memblock_reserve(reg->base + mem_size,
> > +                                              end - reg->base - mem_size);
>
> The memory above MAXPHYSMEM should not be reserved. It should be either
> removed from memblock with memblock_remove or not added at the first place.
>
> Frankly, I fail to understand the logic behind setting PAGE_OFFSET to
> MAXPHYSMEM and then using PAGE_OFFSET as the limit for accessible physical
> memory. Still, as it is there, you can set MAX_MEMBLOCK_ADDR=PAGE_OFFSET in
> arch/riscv/include/page.h and then early_init_dt_add_memory_arch() will
> simply ignore the memory above PAGE_OFFSET.

Little explanation about current code ...

The current code, assumes PAGE_OFFSET to have value such that
upper-bits are 1s lower bits are 0s.
For example,
0xc0000000 (32bit),
0xffffffff80000000 (64bit), and
0xffffffe000000000 (64bit)

For above PAGE_OFFSET values, -PAGE_OFFSET is size of virtual
address space and maximum supported physical memory is also
-PAGE_OFFSET hence MAXPHYMEM is tied with -PAGE_OFFSET.

If we try to force some arbitrary PAGE_OFFSET then things break.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
