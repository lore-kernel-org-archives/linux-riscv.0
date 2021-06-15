Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B105C48BE5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 15:37:59 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE9FF6148E
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 15:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE9FF6148E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qp110asNDIvQoLsa2jZxmjkn1BHlGl7ClUSJxG4F2qM=; b=PTeuzzLMUXE2Kp
	noCQOlo3WZA1XHqPVi2GZzILaf4qoZ2snP9N4Zd7mj0cdzDji9318FDNK/ectrWZ6/A5FLNhL5df2
	1YXD9xiiS3/wPPllA08hRMiqgGB36Zj7EZJaqSg1K1EXmg9Z301qTHcB0CFVhVqJaNQRSHCktz8+c
	yDbk8s3j/a55YeTUk27BqinbxXxMRXyo9m/dBiH+NNa5/1bTtyeeBEQf5taI+vNQOTVy/FLzV16oI
	4co+qU0ENWfTMt8icfccpsyigPhd0W6ZG57pdhFNVeSl2j904ypCBK4jrK8XhmZPwenPK4rdnqGDj
	MVJLEaT41Kz15Zf8a9HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltB7Q-0011Md-Nk; Tue, 15 Jun 2021 15:36:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9I7-000DEY-9U
 for linux-riscv@bombadil.infradead.org; Tue, 15 Jun 2021 13:39:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=NfP0O9xqxAK4b0kkHjQ16XJ4NZNrc5SZulHjGNpuqAw=; b=UfTKImH4dGQ7v3fo3S3iAy1ewr
 94RUttV+Fj/2tpg5S9QAFaDWmRLE3iJpMDhbMFT1vWzOuP+ptDINwmD+U9GTai1iOUlwNnwZL9CRu
 A5HOTrRBvhIMMP4T9kH4bTGOaJD3sC0O9W1fexs0w7IfJ0jZmBd/pO/i6fmSsvMKH2ey1TweLSUqH
 brouJ3MpA2xSdBmFQrXNqKtb0JGyZVCGrWoSV6jm508Ooq3NxJ3HS3JprtHSM8n5Mk/KLpQI5CvVr
 RTBWN3p/tfqnmdZLQUdnP315kodbK4jU7ElUpEU6e0VUdfq9AgN1iCwWn6JHBBIHKp+WuUFweIKGd
 qceoEcLw==;
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt5N7-007dih-55
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 09:28:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E83316143E
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jun 2021 09:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623749320;
 bh=j5S6FfkLlDjYfSjyx+hqYrqgXmhxauWUu0zvHyqD00k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=a3KhUZlHloUuEb42snthxC1h+pJDOlnHi4MWxz/lgwZ17fOZVYJQHYIxl/roiHKnx
 i1HWHDotfuPDtd2w7T0yAaaMFKUH89b3Z/e6rXVJ441KfI+GHtCmljbYFhO+YRfOwX
 r+NOcgcG1vXMCYCJ6KZrCUKvSY6IcM2EmBXWUtKCGl/TRYnWZ9ta83SdB1hzOeE+GT
 uHmwgfh4kYvx5DdAA/YmGp0VSzsLQL7SGmG1UKVHbnOgLox7m/4/4eSH0AZ9tBQPRz
 7MjjryBFnUdzRNu7dQoUgvHjb5fziEH/oG1u0MjVBINp2njjb09eVJOmCQ5D8bAipA
 q8aXQxOuXGrWw==
Received: by mail-lf1-f47.google.com with SMTP id v22so25934500lfa.3
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jun 2021 02:28:40 -0700 (PDT)
X-Gm-Message-State: AOAM53197kChaCbjsJjzDHKYat0knmrfv8kfPnEWdqhcGmXdSaMSJ5p0
 6Yjn/6vF40bE7zUUd8a/rzl44Wt57pZ5XXjKtAE=
X-Google-Smtp-Source: ABdhPJzNz1ykPpmEfVQJ9wH1ea7bPl9WQPbFKW5ePg0Hnp7r2VMDIEQIjgiBB4veo+d3GAXdlMX6TxF51nDUbucH0sk=
X-Received: by 2002:a05:6512:3d13:: with SMTP id
 d19mr14982734lfv.41.1623749319009; 
 Tue, 15 Jun 2021 02:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <1623693067-53886-1-git-send-email-guoren@kernel.org>
 <1623693067-53886-3-git-send-email-guoren@kernel.org>
 <CAAhSdy2NTw2fHmCztXHXi+FExC12qHH0nziO7wuHOp+Ufk08KA@mail.gmail.com>
In-Reply-To: <CAAhSdy2NTw2fHmCztXHXi+FExC12qHH0nziO7wuHOp+Ufk08KA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 15 Jun 2021 17:28:27 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT8BFyCNP4OtAaQLDYCPH+v5w5o3u02g9pQbBaE=kA_mw@mail.gmail.com>
Message-ID: <CAJF2gTT8BFyCNP4OtAaQLDYCPH+v5w5o3u02g9pQbBaE=kA_mw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/2] riscv: pgtable: Add "PBMT" extension supported
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, 
 Drew Fustini <drew@beagleboard.org>, liush <liush@allwinnertech.com>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, wefu@redhat.com, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
 Christoph Hellwig <hch@lst.de>, Daniel Lustig <dlustig@nvidia.com>,
 Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 Xinhaoqu <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>, 
 Nick Kossifidis <mick@ics.forth.gr>, Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_102844_316028_4EBBD682 
X-CRM114-Status: GOOD (  22.33  )
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

On Tue, Jun 15, 2021 at 12:11 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Jun 14, 2021 at 11:22 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > "PBMT" - Page-Based Memory Types (see Link for detail), current it
> > has defined 3 memory types [62:61] in PTE:
> >  - WB 00 "Cacheable 'main memory'"
> >  - NC 01 "Noncacheable 'main memory'"
> >  - IO 11 "Non-cacheable non-idempotent 'I/O'"
> >
> > The patch not only implements the current PBMT extension but also
> > considers future scalability. It uses 3 words of image header to
> > store 8 memory types' values plus a mask value. That means there
> > are still 5 memory types reserved for future scalability.
>
> This is the worst work-around to the Linux RISC-V patch acceptance
> policy.
>
> Passing PTE attributes in the Linux Image header means boot-loaders
> will have to update the image header before jumping to Linux kernel.
> Basically, this is changing the Linux boot-process by adding platform
> specific image header updation step.
>
> Further, this patch is doing too many things in one-go. I needs to be
> broken down into smaller fine-grained patches.
Next time, I'll separate it into below patches:
 - riscv: pgtable: Fixup _PAGE_CHG_MASK usage
 - riscv: pgtable: Add "PBMT" extension supported
 - riscv: pgtable: Add vendor custom "PBMT" definitions interface
How?

>
> I totally disapprove of this patch in it's current shape since the
> Linux boot-protocol should not have any platform specific part.
I think you mean we shouldn't modify the uImage header.

How about parsing dtb before setup_vm (It's a very early stage before
mmu enabled)?  eg:
        cpus {
                ...
                rv64-pbmt-extension;
                rv64-pbmt-custom-remapping = <[mask] [type0] [type1] [type2]>;

>
> Also, please don't CC RVI mailing list for Linux patches because
> the people can post to RVI mailing list only by joining it.
Okay, I'll remove the RVI mailing list. If I needed to, I would send a
notification email to RVI separately.

--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
