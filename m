Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D340C48BE5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 19:44:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 311D06137D
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 19:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 311D06137D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=we692A/Q6Hq9xRA8TWeTzqx+H5D4DilTJBgibiofkQA=; b=xxFsGRWcvt+LVN
	QbKnExbR5+Pd4BJElXSsKSEfqoFyIPzBufBeXYqoLdevdDDHVHImEkbHIlhfXaQARLVqrF2EXPecK
	hB6/HbS8xivarCZ8gTCcwZnbkKjW/qwSHg4H3E9JhWHvnJ4LAv6HGTtl4rKIHTYyUBfIesYuwDc6U
	/lKiTm3gq8kWwerjDudYYdLrRbFZJxg2r5tph45nFZ/IQvxMYR1bGWI/Aw6BrPBka97+fOLbzkLEB
	J7J0srsJiZwennYSrDUjIP+dYMzgheaRiC74uOAyHDs97sROY6AUiM6G20J8Z7vqDUR01OYKK07YJ
	4Z/4phBcVWaU+SHCkV/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltEyO-002XoU-FC; Tue, 15 Jun 2021 19:43:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltAtN-000vfP-9J
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 15:22:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E99261603
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jun 2021 15:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623770536;
 bh=AlychXsQ4hV7NKyEaOrryZmPJ/EpyWLjLul0kxJ1qUk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jakd3AROF1ft7Nubuv6Do2pnZ0wDwy+DtxSoSQ//npL8QSrfl9DH16/41nNGJW1EZ
 87zC6Bnnn5X7Cq7eq+hT4WKXEE/6FiTPh/XW9RGp3bucdX2fsdRVUguoLfXSFACDLG
 jdmjmMi4i4CU5RhUbKXj4WhlztnDWjV0294REWWnYagvK1QY0Q+2tkecEDcmPrVkjw
 skHQ18G6kWkV6oJOEIlU1KUPpmfRMcIF7/FB3P5veMfihCRqpGszAbDbA54XT9uU4b
 dcloYehXPSCcm+X0AFWHDkg1rYZX9cya7llllnzDiQNq+YO7A170ol0KepB7++odoi
 J7r9bVg92G0lQ==
Received: by mail-lj1-f176.google.com with SMTP id n17so25653865ljg.2
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jun 2021 08:22:16 -0700 (PDT)
X-Gm-Message-State: AOAM533MvBGeymTb46lah/pqPhjA6cgAnk57bMCnyAxcrDpYaHXgWkBK
 2TA+qa4oAVd7bLf4Q9CTm8wRYzdO5cBBFX6Sde4=
X-Google-Smtp-Source: ABdhPJxDkjnoC70VbtRkDFevqvJDMI92fdrBnHFZEd6KAPontdSIiKKJ8Fo3I5VxjsZWS1szpxODGiSidWGF6rFfDEw=
X-Received: by 2002:a05:651c:211d:: with SMTP id
 a29mr112343ljq.115.1623770534833; 
 Tue, 15 Jun 2021 08:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <a06ebb56-2fd7-d8f8-866e-ea235f52696b@huawei.com>
 <mhng-0e961c64-341d-4a36-863f-1eec0778a0eb@palmerdabbelt-glaptop>
In-Reply-To: <mhng-0e961c64-341d-4a36-863f-1eec0778a0eb@palmerdabbelt-glaptop>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 15 Jun 2021 23:22:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS5_6rXFUdTh4KhFLdUxPwbNq2D5aMpCRVQtkTCyBFVCA@mail.gmail.com>
Message-ID: <CAJF2gTS5_6rXFUdTh4KhFLdUxPwbNq2D5aMpCRVQtkTCyBFVCA@mail.gmail.com>
Subject: Re: rebased ASID-based tlbflush
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: liushixin2@huawei.com, Christoph Hellwig <hch@lst.de>,
 Anup Patel <Anup.Patel@wdc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_082217_428140_B340A636 
X-CRM114-Status: GOOD (  28.36  )
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

On Tue, Jun 15, 2021 at 11:10 PM Palmer Dabbelt
<palmerdabbelt@google.com> wrote:
>
> On Tue, 15 Jun 2021 04:20:44 PDT (-0700), liushixin2@huawei.com wrote:
> > On 2021/6/13 21:08, Guo Ren wrote:
> >> I've just tested your for-next, but:
> >>
> >>  LD      .tmp_vmlinux.kallsyms1
> >> /home/guoren/source/buildroot/thead_9xx_compat_5.10_glibc_br_defconfig/host/bin/riscv64-linux-ld:
> >> mm/vmalloc.o: in function `.L0 ':
> >> vmalloc.c:(.text+0x2bd2): undefined reference to `pud_clear_huge'
> >> /home/guoren/source/buildroot/thead_9xx_compat_5.10_glibc_br_defconfig/host/bin/riscv64-linux-ld:
> >> mm/vmalloc.o: in function `.L1225':
> >> vmalloc.c:(.text+0x2cac): undefined reference to `pud_clear_huge'
> >> Makefile:1191: recipe for target 'vmlinux' failed
> >>
> >> I quick fixup with the simple patch:
> >> diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
> >> index 738dc6f3530f..b1fbd575cbac 100644
> >> --- a/arch/riscv/mm/pgtable.c
> >> +++ b/arch/riscv/mm/pgtable.c
> >> @@ -25,6 +25,14 @@ int pmd_clear_huge(pmd_t *pmd)
> >>  }
> >>  #endif
> >>
> >> +int pud_clear_huge(pud_t *pudp)
> >> +{
> >> +       if (!pud_leaf(READ_ONCE(*pudp)))
> >> +               return 0;
> >> +       pud_clear(pudp);
> >> +       return 1;
> >> +}
> >> +
> >>  int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
> >>  {
> >>         pte_t *pte;
> >>
> >> I think it's from:
> >> commit 14512690a16537527dacf0f5cd3d2263be317f35
> >> Author: Liu Shixin <liushixin2@huawei.com>
> >> Date:   Sat Jun 5 13:48:37 2021 +0800
> >>
> >>     riscv: Enable HAVE_ARCH_HUGE_VMAP for 64BIT
> >>
> >>     This sets the HAVE_ARCH_HUGE_VMAP option. Enable pmd vmap support and
> >>     define the required page table functions(Currently, riscv has only
> >>     three-level page tables support for 64BIT).
> >>
> >>     Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> >>     Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > This commit is based on linux-next. pud_clear_huge() have been defined in pre-commit
> > ("mm/pgtable: add stubs for {pmd/pub}_{set/clear}_huge") which is not on for-next.
> > The code is different and thus an error is reported here.
> > Should I rebase the patch on for-next and resend it?
>
> I can't find that commit anywhere, can you send a series with the
> dependencies?
https://lore.kernel.org/lkml/5ac5976419350e8e048d463a64cae449eb3ba4b0.1620795204.git.christophe.leroy@csgroup.eu/

>
> I've removed the HUGE_VMAP patch from for-next.
I've rebased my work on that patch, so hope the HUGE_VMAP patch will back soon.

>
> >
> > thanks,
> >> On Sun, Jun 13, 2021 at 8:47 AM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
> >>> On Sun, 06 Jun 2021 08:20:48 PDT (-0700), Christoph Hellwig wrote:
> >>>> Hi all,
> >>>>
> >>>> this is what I think is a resonable set of patches for the ASID based
> >>>> flushing, largely based on the work from Guo and thus attributed to him.
> >>> Thanks, these are on for-next.
> >>
> >>



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
