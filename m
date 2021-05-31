Return-Path: <SRS0=ZKx/=K2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4DA0C47080
	for <linux-riscv@archiver.kernel.org>; Mon, 31 May 2021 12:20:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7432C6103E
	for <linux-riscv@archiver.kernel.org>; Mon, 31 May 2021 12:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7432C6103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U8ZYdeTqvkIUafi76R8l1guygXPN0VAaxgtofkFokM4=; b=3E/HOS6/S3gCTy
	Z0ujAQM7qTTuU+JNDC7WEQ5+rL9dfwoheXl4x4NSWV7hnUsOFcaTtRg5ASmH8I5fdHCaSopmZ8dqt
	ft7Fu6Pxp2T1xrNM/OcKSb1T6bqB9OSbg8KZa4np0xcRVDs6YCcOg6iu43lkwEYSiZscWpR/K9ih0
	Yw5Xx6/BIw3arPI1eKVr2ixeI7Bhi403MIvTjgFUx12HFSemNOvG2rW48NpdGquKqPqRgCb+S22sG
	F/pnLDT8ggwc77y/1LUhJA8RUznmFO42GNCJN2KdT2QhZicNZDnH1FFzZzvZO6FQt29BnjYKeQLmy
	tySQdlUaMz8RRDHN5IuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnguW-00C8B4-V7; Mon, 31 May 2021 12:20:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnguU-00C897-9v
 for linux-riscv@lists.infradead.org; Mon, 31 May 2021 12:20:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F89861374
 for <linux-riscv@lists.infradead.org>; Mon, 31 May 2021 12:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622463645;
 bh=Gv8FIYmeqMDJOTDXgyQdyOGAwgOhxU1Bft/3S63ev/U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LIrvAoqfkN1K2eyb6iQNPpp0M0V0008b+jty/0d4NbU9p/eXzuUMTPvpmOOxW2VOV
 eHt2gdjGUXu6qrX8vZlATRzIg5wvCJpbHMHKbWOFqvTQCEscAAFKR+gB+lr7D0zQFJ
 eEQZuI1EKTHpQXBRMfmQFLyPvh28yFM7LPrRV6+NAQdoplNXqoJ8uJhKtFH4xrwIZJ
 iJwwbcdv9XUjQKxivXKbeqUlPLw9YMbdOts1Qc+xjyTLGOioZvmVtPBHRSSEZjp25A
 mQYDjxpWIYdpN/oaFW9XPf9RM3Oxtdc+rGQG8He4tlPHPx2Vg4wECp0+f2fayR0VIm
 vtudJO3fG8hNw==
Received: by mail-lf1-f53.google.com with SMTP id q7so16574619lfr.6
 for <linux-riscv@lists.infradead.org>; Mon, 31 May 2021 05:20:45 -0700 (PDT)
X-Gm-Message-State: AOAM533IMsVekHEvGSWpz/ora0gLj4uv2x8zUMe80eNeQr8i09vCaZ8o
 SEahpc5XBOQyDMFI6eDlmmdlHvGKLruQcmwv/W8=
X-Google-Smtp-Source: ABdhPJyFueMXhrZ6j6LIAaHblvrdO4uem3DqJOQMzoQ2ZdLNHJ3ha7iWTvss38IAeL7E3PsB/WXGsAmUI6WPXCMR6lY=
X-Received: by 2002:a05:6512:218d:: with SMTP id
 b13mr9389933lft.346.1622463643822; 
 Mon, 31 May 2021 05:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <1622393366-46079-1-git-send-email-guoren@kernel.org>
 <1622393366-46079-3-git-send-email-guoren@kernel.org>
 <20210531061742.GB824@lst.de>
In-Reply-To: <20210531061742.GB824@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 31 May 2021 20:20:32 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ3pG-EoDnqonEcMyKzdXPkf5s7qcyLSm9x79RiETCWkg@mail.gmail.com>
Message-ID: <CAJF2gTQ3pG-EoDnqonEcMyKzdXPkf5s7qcyLSm9x79RiETCWkg@mail.gmail.com>
Subject: Re: [PATCH V5 2/3] riscv: Add ASID-based tlbflushing methods
To: Christoph Hellwig <hch@lst.de>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_052046_384265_A93564AB 
X-CRM114-Status: GOOD (  14.36  )
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

On Mon, May 31, 2021 at 2:17 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Sun, May 30, 2021 at 04:49:25PM +0000, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Implement optimized version of the tlb flushing routines for systems
> > using ASIDs. These are behind the use_asid_allocator static branch to
> > not affect existing systems not using ASIDs.
>
> I still think the code duplication and exposing of new code in a global
> header here is a bad idea and would suggest the version I sent instead.
Your idea is in the third patch, and I also add you with
Co-developed-by. Please have a look:

https://lore.kernel.org/linux-riscv/1622393366-46079-4-git-send-email-guoren@kernel.org/T/#u

[PATCH V5 3/3] riscv: tlbflush: Optimize coding convention


--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
