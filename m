Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1120DC38142
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 08:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b1fOqbh7NB+RCNPhBp2lWb8pLEbpd87vOzgz7FdmW54=; b=Mdd0n3MEGw9h9w
	+ugg1HYSNVmttWUkBbDstf/8Jrwaushf/UfOxfuciAtMKMt6fndgpJexJN5Eix8dZXV2MFSMxzV6C
	HAHpD0yzSohBBqPJvSsPSWuzBMQ0XqDMobWjAWu19B+gxZUprJ7dw68ZECh9K8Grw4eUq68sMvpCZ
	46GZmxZoPnh1EhWH7/c1USMaX48PX9hy+od3+HnM0MV5LliH4H0dCUD6QK4rFswqc1dbrny0n6EbY
	NF9HQkbBuushkrWARFd/ZecG1f/M4doF4x38+V4AAgK9RP6x4/61E9itZyPxsONd7nYSPfyz6nCqF
	VpHlz2Ohw6Tn++iaiIag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMlrS-006fqd-I0; Tue, 31 Jan 2023 08:19:26 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMlrO-006fo2-Li
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 08:19:24 +0000
Received: by mail-wm1-x329.google.com with SMTP id q8so9711414wmo.5
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 00:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UUiUGWz3vdmMVfqN3pDTPr4s3ToqNVUTL21KmoaR0tk=;
        b=Z0UcAZl+eVWrnNncHbrK177R9cMz4F1U+QPq2jD5JfMgySeiDc/bxgmEnJoIyvSaFZ
         zNnKqdprw6h1n5r/gxqsAhrhqllnZNspIlRNcp8Q922GD3MwAL7DTSU/TXpF7xMjV0JK
         pYH87oIjrVCqYUKT5qRf1vxpghS+y/ZkwZnzr5jK5YZkMlfRS+1zL6N61SZAsUpqgeZL
         4iwvu8DPwJ4X/M1yjVFwtyVNsUe+O9CcEYCF+b/KO6qXkuXB6YX7tg0cUukS2cXZql1R
         TbQ1bUkF3ZrGrKtwZVNVnWaKv0X9BIVAQLL3L7mwF55PEPinCN5pGmfaO/91T4sL8C3M
         IxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UUiUGWz3vdmMVfqN3pDTPr4s3ToqNVUTL21KmoaR0tk=;
        b=O3byEKeo3avG663gH+MdduMcGoYJAlcYzDMc/dS4x5q/iBWmZd52Tsn0bMtweOE/eK
         I+AhhciyivGHU2WJ9kjXh9gfZ3jtZckzXZkZ8k1t5i06ndhXFUFuDUDPhN6XRC6Wvzt4
         geOxZolQ7ddSqEpY5wgvD8NiV097U8sNHySskADNskGUmgsUBMBsOfsHCYNV6a8Kl1Pd
         vm+2CGdOr+C0MQEo0L1ZBbw5GfRrEYPlNWE+KMmWGJJaJLKevim5uAop+GhEjdoMD3/n
         n+8ah/QG28izwn6w9WtyhoyMUE4A0x1iTDj9g2QHceSOHiKlB/Lc8e61sLOywhKJcG8z
         wv3A==
X-Gm-Message-State: AFqh2koghOd9iQt2D7GbW7NsOGlvAAitIR+EWQlUUXW1oD62qzt+da7O
	PO7om5D7sTSRwQJMuGOeeEjUkBz9W8zk+HDFVOTlng==
X-Google-Smtp-Source: AMrXdXtI8boFUmkUmNIjAyODsh9cKED29xKXJ+/yUQhRIasCQrsOg445qvkS2lznT9LG183QyeC/uYNcSYDj/W1zwQ0=
X-Received: by 2002:a05:600c:2e42:b0:3da:f648:9ea7 with SMTP id
 q2-20020a05600c2e4200b003daf6489ea7mr3045488wmf.27.1675153159142; Tue, 31 Jan
 2023 00:19:19 -0800 (PST)
MIME-Version: 1.0
References: <20230127091051.1465278-1-jeeheng.sia@starfivetech.com>
 <20230127091051.1465278-4-jeeheng.sia@starfivetech.com> <Y9g9XGzF/X3OwXdP@spud>
In-Reply-To: <Y9g9XGzF/X3OwXdP@spud>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 31 Jan 2023 09:19:08 +0100
Message-ID: <CAHVXubh2P5TxdMsbW2TY7NxemSFX81UuvgO9schnTEBvzuAn2Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] RISC-V: mm: Enable huge page support to
 kernel_page_present() function
To: Conor Dooley <conor@kernel.org>
Cc: Sia Jee Heng <jeeheng.sia@starfivetech.com>, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, leyfoon.tan@starfivetech.com, 
	mason.huo@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_001922_950061_7DB5E576 
X-CRM114-Status: GOOD (  19.01  )
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

Hi,

On Mon, Jan 30, 2023 at 10:57 PM Conor Dooley <conor@kernel.org> wrote:
>
> +CC Alex
>
> On Fri, Jan 27, 2023 at 05:10:50PM +0800, Sia Jee Heng wrote:
> > Currently kernel_page_present() function doesn't support huge page
> > detection causes the function to mistakenly return false to the
> > hibernation core.
>
> This sounds like a bug & should have a fixes tag, no? I assume for
> whatever commit enabled huge page support...
> We don't support set_memory, which by the looks of things is the other
> usecase for this function, so probably doesn't need backporting.

Maybe add this patch in the Fixes tag: commit 9e953cda5cdf ("riscv:
Introduce huge page support for 32/64bit kernel").

>
> Alex, does this change look good to you?

Yes, just one thing though: what about a pgd_leaf() test? Even if very
unlikely (I see x86 does not even test it), the privileged spec states
it is possible to have a 256TB page.

Thanks,

Alex

>
> > Add huge page detection to the function to solve the problem.
> >
> > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > Reviewed-by: Mason Huo <mason.huo@starfivetech.com>
> > ---
> >  arch/riscv/mm/pageattr.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> > index 86c56616e5de..792b8d10cdfc 100644
> > --- a/arch/riscv/mm/pageattr.c
> > +++ b/arch/riscv/mm/pageattr.c
> > @@ -221,14 +221,20 @@ bool kernel_page_present(struct page *page)
> >       p4d = p4d_offset(pgd, addr);
> >       if (!p4d_present(*p4d))
> >               return false;
> > +     if (p4d_leaf(*p4d))
> > +             return true;
> >
> >       pud = pud_offset(p4d, addr);
> >       if (!pud_present(*pud))
> >               return false;
> > +     if (pud_leaf(*pud))
> > +             return true;
> >
> >       pmd = pmd_offset(pud, addr);
> >       if (!pmd_present(*pmd))
> >               return false;
> > +     if (pmd_leaf(*pmd))
> > +             return true;
> >
> >       pte = pte_offset_kernel(pmd, addr);
> >       return pte_present(*pte);
> > --
> > 2.34.1
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
