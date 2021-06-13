Return-Path: <SRS0=q/zc=LH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F02E0C48BCF
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jun 2021 13:08:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B517961003
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jun 2021 13:08:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B517961003
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5tQYU7aV9lYhhhS9H7R1KJsib24c9/3KFMr+MkqvXLs=; b=Ep+FPDQsQpghvN
	eosdm6NRiluoQXy6OiQsvFZhQLtQb8sTcpmLgGZCBqy4D4Lgkb4D8UmjezwcbUzZ07/wXNVcu2XvM
	ZPHcg9xTh4+P/R8wn/FQ9a9OYvrkZS+X2z5HCgxid0pK99kAW3gyd2lsn/xtUEt2h2LcZqK42syvC
	5STw7V/21qwm6tVNZOyMaVpn+POAB0fWh/+OmsFbLYKHzGC+HGwlvsVMdJRtfm9c6IAresothmuHY
	aEhMReWLel8UQJe2z3hwviCGnsfQ3rX+orPf3DitKX8KC4PCeTVkkgR/ssTVQASFZklUOg+uuQVf0
	o5WxhNvIc4rV6ZG19IPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsPqj-00AV18-4T; Sun, 13 Jun 2021 13:08:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsPqd-00AV0X-GI
 for linux-riscv@lists.infradead.org; Sun, 13 Jun 2021 13:08:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D49FC61283
 for <linux-riscv@lists.infradead.org>; Sun, 13 Jun 2021 13:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623589698;
 bh=rhmjDN/EWwLhHxJpVndxkOAP7ECgZGMhUmCiHeZzXtg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hs3AsqXv3fYAd4w2V0Hta1OHlj0khD58w4+m/tXNaM4YiyOZs7jkyMreROi8DnX56
 grZvXS7u4XWcsKJMq0u0zO3BCcrr0pWyIMKxC9Aqlv/dJHSPHVx7vr8e/JSbcePqQS
 Hq9oNHBVyqpSWtPw2+Q+LUfziddxmaWmBxQiQ2CWOatMu4UxE0ID7YApstXPd1frDh
 wHNpZxi4SXyVo4lbGNHsAajAh6yMXijkujeJBlMP4Mglf/bov8z7Xo0jyYaG+CySY4
 lD3AcZKnoDrNW2DSSrsUJUsqsfw9FQtKM0Aa6P5bOYKk4R40yIojqKZXkUrkdYxR8i
 rUhO5BATIergg==
Received: by mail-lj1-f172.google.com with SMTP id r16so16195856ljk.9
 for <linux-riscv@lists.infradead.org>; Sun, 13 Jun 2021 06:08:18 -0700 (PDT)
X-Gm-Message-State: AOAM532i7N7ddhczlnpG+0FEe3mQHNFM0pbIxm0tC5yPwgVJ08TckaRl
 rWyxX1xfmnIb4neUvf1gYrqztA+Z/KEiY2OQReA=
X-Google-Smtp-Source: ABdhPJzrOUWScEmS6w8fBw2uoLZkFYR14TWyUd5NtKDpjl9neg4QY7p5HnB7ZCVZXc0MohBZs3S6uTY4QDZ2jV/k7Z8=
X-Received: by 2002:a2e:900f:: with SMTP id h15mr10035109ljg.285.1623589697150; 
 Sun, 13 Jun 2021 06:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210606152050.636038-1-hch@lst.de>
 <mhng-fe973a87-b364-4190-96f5-194895558801@palmerdabbelt-glaptop>
In-Reply-To: <mhng-fe973a87-b364-4190-96f5-194895558801@palmerdabbelt-glaptop>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 13 Jun 2021 21:08:04 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQE-PrUU8xDo8=u+V984sW84DnPb_rW=UcAOLmh4HnDrA@mail.gmail.com>
Message-ID: <CAJF2gTQE-PrUU8xDo8=u+V984sW84DnPb_rW=UcAOLmh4HnDrA@mail.gmail.com>
Subject: Re: rebased ASID-based tlbflush
To: Palmer Dabbelt <palmerdabbelt@google.com>, liushixin2@huawei.com
Cc: Christoph Hellwig <hch@lst.de>, Anup Patel <Anup.Patel@wdc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_060819_585945_D381402F 
X-CRM114-Status: GOOD (  15.41  )
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

I've just tested your for-next, but:

 LD      .tmp_vmlinux.kallsyms1
/home/guoren/source/buildroot/thead_9xx_compat_5.10_glibc_br_defconfig/host/bin/riscv64-linux-ld:
mm/vmalloc.o: in function `.L0 ':
vmalloc.c:(.text+0x2bd2): undefined reference to `pud_clear_huge'
/home/guoren/source/buildroot/thead_9xx_compat_5.10_glibc_br_defconfig/host/bin/riscv64-linux-ld:
mm/vmalloc.o: in function `.L1225':
vmalloc.c:(.text+0x2cac): undefined reference to `pud_clear_huge'
Makefile:1191: recipe for target 'vmlinux' failed

I quick fixup with the simple patch:
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 738dc6f3530f..b1fbd575cbac 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -25,6 +25,14 @@ int pmd_clear_huge(pmd_t *pmd)
 }
 #endif

+int pud_clear_huge(pud_t *pudp)
+{
+       if (!pud_leaf(READ_ONCE(*pudp)))
+               return 0;
+       pud_clear(pudp);
+       return 1;
+}
+
 int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
 {
        pte_t *pte;

I think it's from:
commit 14512690a16537527dacf0f5cd3d2263be317f35
Author: Liu Shixin <liushixin2@huawei.com>
Date:   Sat Jun 5 13:48:37 2021 +0800

    riscv: Enable HAVE_ARCH_HUGE_VMAP for 64BIT

    This sets the HAVE_ARCH_HUGE_VMAP option. Enable pmd vmap support and
    define the required page table functions(Currently, riscv has only
    three-level page tables support for 64BIT).

    Signed-off-by: Liu Shixin <liushixin2@huawei.com>
    Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>

On Sun, Jun 13, 2021 at 8:47 AM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> On Sun, 06 Jun 2021 08:20:48 PDT (-0700), Christoph Hellwig wrote:
> > Hi all,
> >
> > this is what I think is a resonable set of patches for the ASID based
> > flushing, largely based on the work from Guo and thus attributed to him.
>
> Thanks, these are on for-next.



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
