Return-Path: <SRS0=WUGv=KU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E33AC2B9F8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 09:28:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04A6A61360
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 09:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04A6A61360
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cHNsbiftDp+Xu2Kyk+cg5fH5MER5pzUwSPfQoHjB7x8=; b=tldnb3GlqGwznb
	CVy94BYGyX7AWK7aC9zJEtKeNK1pIMWiZJ2WSlnThARn55lWHDV9n/FXXQ+4hWxvMFywEFhQyckM/
	pXQiBKQ1eSZqYvJA9NffjLyHdhaZIbFCXiMCnTawlaU513bKlwGclIswZfxaXzF+PWkZEcNpTC4d3
	3ca/dj7M0OyWW07dT1DC0d0s9r/8LZqaQhR2r2PCbOxBlSHUxrZd4pYkNMsj8/j0IkNm2koB5/ygp
	Xvi/9XqsMcveatfbbDswLRdoi73ZvT7664LNsJqTZbFFbf9KKW1acQs511vHNl3qh2eUa2CJtKOfq
	yxAK5EQLQp7yAJBJvqpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llTMd-004Mtx-F3; Tue, 25 May 2021 09:28:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llTMZ-004MrA-7o
 for linux-riscv@lists.infradead.org; Tue, 25 May 2021 09:28:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 617736141D
 for <linux-riscv@lists.infradead.org>; Tue, 25 May 2021 09:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621934914;
 bh=NW/6KeimjMY0HcsoXBOHeEH9IbSnm0X7Mg03MgNiLQI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=k+XkKzp8W7RYdepnY+CdUapRNWYS46HCEdTPQBAHtzakaTPmtWxRr88Gxjg5q1XN+
 KWAOlgbOehz4JrvYaKkB8ZBUun5SXeMB7eLlFnRyV7zqzJVElsEMMu5WjjOXLe0SGH
 8/a9OKFlxdbBXV2BH1Ljb+M5fqNdYprDBrJbSCNH1wUt3c14FaVYYLm3PlP1j4fRjM
 CEYWr4F52AVqBvgHhEVxrElNarmB7EZTegX8Eyn8H2YC3ai9S/Ib3XE74bPkFEakKW
 9xkU2xGRhgdMtR5gHWpji6aPKkf5NxD/X7jCSaEPF4qf8Yyun3qtP+c6l4q0FWM6QV
 Q3MC7G/MHQG0g==
Received: by mail-lj1-f170.google.com with SMTP id e11so37172462ljn.13
 for <linux-riscv@lists.infradead.org>; Tue, 25 May 2021 02:28:34 -0700 (PDT)
X-Gm-Message-State: AOAM530VyiW77XNxmv9Xjkz7FbNYKG8oXa8PT6c10o15pMwv04P4XPIG
 9dtjrB8UxmU5o+2KEe7NepRbTK+LICcvJd7oNsY=
X-Google-Smtp-Source: ABdhPJxYhRsXM1341LnsAQgXpZGbR4SUkmSohnNp5yRbddS+2fueSoTk8EvBgt/nUUs/mFId0Z2IEFYNOCLwZ8CIeik=
X-Received: by 2002:a2e:501b:: with SMTP id e27mr19934531ljb.508.1621934912683; 
 Tue, 25 May 2021 02:28:32 -0700 (PDT)
MIME-Version: 1.0
References: <1621839068-31738-1-git-send-email-guoren@kernel.org>
 <1621839068-31738-2-git-send-email-guoren@kernel.org>
 <YKyae+8O25A8vxMS@infradead.org>
In-Reply-To: <YKyae+8O25A8vxMS@infradead.org>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 25 May 2021 17:28:21 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRA=tUid7akgVXfk6MHOd0KmJpDQEZ2m9wRfhigBDzQTw@mail.gmail.com>
Message-ID: <CAJF2gTRA=tUid7akgVXfk6MHOd0KmJpDQEZ2m9wRfhigBDzQTw@mail.gmail.com>
Subject: Re: [PATCH 2/3] riscv: Fixup PAGE_UP in asm/page.h
To: Christoph Hellwig <hch@infradead.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_022835_335106_299DD231 
X-CRM114-Status: GOOD (  14.90  )
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

On Tue, May 25, 2021 at 2:34 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, May 24, 2021 at 06:51:07AM +0000, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Current PAGE_UP implementation is wrong. PAGE_UP(0) should be
> > 0x1000, but current implementation will give out 0.
> >
> > Although the current PAGE_UP isn't used, it will soon be used in
> > tlb_flush optimization.
>
> Nak.  Please just remove the PAGE_UP/PAGE_DOWN macros just like they
> have been removed from other architectures long ago and use the
> generic DIV_ROUND_UP macro for your new code like everyone else.

This patch has been dropped because it's wrong, ref Anup's reply.

Remove PAGE_UP/DOWN is okay for me. How about:
 static inline void local_flush_tlb_range_asid(unsigned long start,
unsigned long size,
                                              unsigned long asid)
 {
-       unsigned long page_add = PAGE_DOWN(start);
-       unsigned long page_end = PAGE_UP(start + size);
+       unsigned long page_add = _ALIGN_DOWN(start, PAGE_SIZE);
+       unsigned long page_end = _ALIGN_UP(start + size, PAGE_SIZE);

_ALIGN_XXX are also defined in arch/riscv/include/asm/page.h.

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
