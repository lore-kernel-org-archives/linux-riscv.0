Return-Path: <SRS0=ZKx/=K2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A25AC47080
	for <linux-riscv@archiver.kernel.org>; Mon, 31 May 2021 12:33:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 064486135A
	for <linux-riscv@archiver.kernel.org>; Mon, 31 May 2021 12:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 064486135A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V2bqDCG1ckEwVz8lPsS998SYJjK6qJ//HGiqxHFolUc=; b=G7A1njlkplKJlv
	mWb7qbaxFcmZb5xpAKap52ypHe88yHQoC4ATrGS1lQJtykDl6a3gFvj40hzC+Knqva8q0n5ZeRwKO
	JE1bON7aEZPjUbUC6BmcHJU5iz5SVuYsvcYdGLoQmWPI4w7GJdhRhultXZPkmGeeZKZbROZib12/p
	3HgFq2cGqUeGFAI7VAu8dldskjwCB71CosqbrnfiwZ8AECsCiHpY8itPmztZbrZrXIjlyuaTKuz4I
	iMQVMB8xis892QFiA8W1IVEf1hcZ0mVkZrolIpFHT4Gn8Criow0xt+tommKAUAxp8tVY+G0eE+VEl
	fC3yRwAJqz/S1o3EtHOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnh6U-00CAQZ-Hw; Mon, 31 May 2021 12:33:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnh6R-00CAOM-Hc
 for linux-riscv@lists.infradead.org; Mon, 31 May 2021 12:33:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26D386135A
 for <linux-riscv@lists.infradead.org>; Mon, 31 May 2021 12:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622464387;
 bh=0Ao6p/tCN0lLmwFOL3ikaLa3kNQR3rdJ0oGyStE28vw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ikpLtgpys9PI219jFN9/zG2VA6HBESrTqKXixKRNifYGrKNzw+9HTW4jScV6coQ9l
 GxCum1F3zUexqoinnBNB3moHoKndL0VgktA6yHCkKyvs16ocIhQvbTkiV52bD9cwPk
 8e2vHK0XgSYaL/qmV6aaaX3SyIkz/IBNV1Bhv1IzzZ0dujtoF5uvaeVpjhgYuuGX2y
 9FfRROisMpKMSVVD6ZMDZsyMQnOddUNrGAFBK8yVyMFgncEbNwEywBtFu+Y2QjBGFo
 n+shdHlioqm6XRi4/OOdEJ8o2SFjiyTcUDa5Fi883xQJJDm8GupqLNBA3M4A9bWpKB
 owiFQRPkFkxhQ==
Received: by mail-lf1-f53.google.com with SMTP id q1so16640415lfo.3
 for <linux-riscv@lists.infradead.org>; Mon, 31 May 2021 05:33:07 -0700 (PDT)
X-Gm-Message-State: AOAM531H1STDdIkYT73Hpq+f3dqLx3l7oS/BxDZIDMyfsAeSHerpmJY+
 bnmZxzdljZypq7POxIM54XaQr1nOaTaTITtFr3Q=
X-Google-Smtp-Source: ABdhPJxfkfBwOVqzBzMgxibHiDT1eCvcg1+7OdH3J/JTWXYDq1/MYIQ0oSYnpIXJuwWXjFhu1rxoF7vHe+4jY/JSOXk=
X-Received: by 2002:a19:5209:: with SMTP id m9mr3806497lfb.24.1622464385463;
 Mon, 31 May 2021 05:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <1622350408-44875-1-git-send-email-guoren@kernel.org>
 <1622350408-44875-3-git-send-email-guoren@kernel.org>
 <73bf48c1-6692-795c-ba16-b7baeb11d3b9@monstr.eu>
In-Reply-To: <73bf48c1-6692-795c-ba16-b7baeb11d3b9@monstr.eu>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 31 May 2021 20:32:53 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ6vVHYpw8WVJZqHjkm3gxNkGev9Cq+AzDcOiueSZTA6w@mail.gmail.com>
Message-ID: <CAJF2gTQ6vVHYpw8WVJZqHjkm3gxNkGev9Cq+AzDcOiueSZTA6w@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] microblaze: Cleanup unused functions
To: Michal Simek <monstr@monstr.eu>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_053307_646381_989C5FE7 
X-CRM114-Status: GOOD (  21.32  )
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

On Mon, May 31, 2021 at 8:25 PM Michal Simek <monstr@monstr.eu> wrote:
>
>
>
> On 5/30/21 6:53 AM, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > These functions haven't been used, so just remove them. The patch
> > just uses grep to verify.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Michal Simek <monstr@monstr.eu>
> > ---
> >  arch/microblaze/include/asm/page.h | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/arch/microblaze/include/asm/page.h b/arch/microblaze/include/asm/page.h
> > index bf681f2..ce55097 100644
> > --- a/arch/microblaze/include/asm/page.h
> > +++ b/arch/microblaze/include/asm/page.h
> > @@ -35,9 +35,6 @@
> >
> >  #define ARCH_SLAB_MINALIGN   L1_CACHE_BYTES
> >
> > -#define PAGE_UP(addr)        (((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
> > -#define PAGE_DOWN(addr)      ((addr)&(~((PAGE_SIZE)-1)))
> > -
> >  /*
> >   * PAGE_OFFSET -- the first address of the first page of memory. With MMU
> >   * it is set to the kernel start address (aligned on a page boundary).
> >
>
> Ah ok. you have sent v2. Will take this version instead of previous one.
No need, they are the same, Thx.

>
> Thanks,
> Michal
>
> --
> Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
> w: www.monstr.eu p: +42-0-721842854
> Maintainer of Linux kernel - Xilinx Microblaze
> Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
> U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
