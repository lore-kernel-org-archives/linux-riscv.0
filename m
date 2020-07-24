Return-Path: <SRS0=jwAp=BD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE27C433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2020 08:15:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 322A320748
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2020 08:15:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MmLDLkX8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 322A320748
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EfL1JtKH6bG7Ze9aw2ih7wqC414HyTW6ImkwGRThGVk=; b=MmLDLkX8JFqwpirsHJZTFHDux
	BkRHJsJ2O3N2DvvL/0E6NjGVTSz+chE9gr9FZkfv5OD5a47E4s+xeRoWHh9NvMpxj2IXQLX5COLfJ
	uEVfygqhXiqbgvTnhvfuhbbqARS+k7PrwbXfZmyilP/ucrOcn15ilMRVeUzNkYoMcVpGOnjwD5pCL
	rf9PkPcaI9IpIMktFE2EJcRRYohuS4j1BxSg7/Wj7ODyTf/a+u0DiuTZ6Q0unYH3tNEd36ghICiIT
	+ktKnsIor5EoXkTP1M9KNJhPlzph/lFnwd5P/fkAjQ2YvcF8kOhCsAqQswMy2nz78NXUrBtzjJdEI
	LnQQ1dOaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jysqy-00057Y-RK; Fri, 24 Jul 2020 08:14:52 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jysqw-00056I-4s
 for linux-riscv@lists.infradead.org; Fri, 24 Jul 2020 08:14:51 +0000
Received: from mail-qt1-f173.google.com ([209.85.160.173]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MnaY1-1ki9sx1MDl-00jXa1 for <linux-riscv@lists.infradead.org>; Fri, 24
 Jul 2020 10:14:46 +0200
Received: by mail-qt1-f173.google.com with SMTP id d27so6332330qtg.4
 for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2020 01:14:43 -0700 (PDT)
X-Gm-Message-State: AOAM533UpgZ2QW68xAHaacf2kkkV7vYoFhIYiuKlNvSkgDM0mEXu+xwe
 pFUqfnbyRAOCFAcr8FyPexTcko9zgqLuUDaZTuM=
X-Google-Smtp-Source: ABdhPJygisjtG0/T5RZOpGU5w2vxR1Ybi3XIk/oHG1gnkzduo22/qOY0PE84/zvIhSqmrnDmSiaO0gHwgOoBfMX/5hA=
X-Received: by 2002:ac8:7587:: with SMTP id s7mr8295990qtq.304.1595578483047; 
 Fri, 24 Jul 2020 01:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-831c4073-aefa-4aa0-a583-6a17f9aff9b7@palmerdabbelt-glaptop1>
 <d7e3cbb7-c12a-bce2-f1db-c336d15f74bd@ghiti.fr>
 <7cb2285e-68ba-6827-5e61-e33a4b65ac03@ghiti.fr>
 <54af168083aee9dbda1b531227521a26b77ba2c8.camel@kernel.crashing.org>
 <cade70e2-0179-2650-41c5-036679aaf30c@ghiti.fr>
 <418d5f3d3f42bbc79c5cf30e18ec89edfe2dbd26.camel@kernel.crashing.org>
In-Reply-To: <418d5f3d3f42bbc79c5cf30e18ec89edfe2dbd26.camel@kernel.crashing.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 24 Jul 2020 10:14:26 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3dap8tDQVf3B9DdjQm0A_QtCwv3+tW6AUxC1Xq_VoL=A@mail.gmail.com>
Message-ID: <CAK8P3a3dap8tDQVf3B9DdjQm0A_QtCwv3+tW6AUxC1Xq_VoL=A@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
X-Provags-ID: V03:K1:GUrsHSmy5FSOW7iMQiEtqQZY0KkqCXUiq8uRbQI7VJs1bIkZ1Oa
 s12T0G4t+qyEW9ueWjugSxXvdYWxGmaHqAOp2e5nWjC6hvLwH6THgyWThVl59VTGTU0yb4P
 x+1Nq+tqUuZEBQbFXPI7nheLTxklvNOS2UE7+aNBTgmd6gvoqaQ4pVoIxoqXoQgbPXdQlYl
 JpHnqtdBrSf0HQriwQPuw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yRzaeGobxfA=:qxw2/9UbNRMCvdpUel/+za
 lpp/jNPM/lW+HyAFiwoshGnBSy4/nLN6LmX7vp+ujrxwzpRRz1o0ffRS0IOHFXVuOnSaqnuU1
 p4oohx/738a+mERqPu9jzyJ8BKDKyUr4PtmCO9jZkbS7YgURCNt1wlniM+9EPALYK9YqXk5H1
 vys9jLqB/Kw71goLQR2JDquR8UocMJHTeC9321iMo/F1xgqRvmgBO2nSPtQavGJMFNEeyiTN1
 nviAVWzYg+ZDhccve2BhsHWT6oTsrWq2KoG+gSyEPqZaGm2pcjXAq0vGw2WEitPRgIkuWPzo/
 ffCkCfFkK2bYjHmZmMB7FkPxvIJ/XRUErh5yv7BkfOOaoFoqTsFwRy3VdxZ/S71Cc+7kAM3uC
 89aAEV3gBYETvbwTQZEzMn9v5f/sh5EFIUXlrGMxIdMEe6n6+v3l+bZ0evg8g4VJKzVGnhNUw
 /8cQstHus+GXOOeGqtOgQHu/Yfd0u6ZOyWdvpNvqKLon2P8FwBlvyVllGxmnlhKQ1VHlWzEwP
 5QrFsZbbRjOALM38ucjVHJUQE0mOK0VfC0lebP5+ADzlza3a+K9WA6qN9PsilblZVSmZuuGrh
 yEc6w2T8Utzhub7GoEt9eANE+QxWNPFU9H3W98lwpA9CvIyWainB9jmI3vvMBW9vtDbK81GAa
 MLUVfEZoF3EERzO/3sXgMVZ0eACorCNRoPQ0uttg+G3egYHnHgmD6N1LR5hnxu+UnTG6aKoDH
 SGQgPfPm5xAbzxWJTe8EK/5gFsueIAiCOAUqRTc6so2Gv4Z9ux5iZJ8rm6VlSFXp0OAQ5nfMc
 DFCrchhPII+Fj4AxHjaP7duSMPHVM2Nes/3oSaJM88yKtJHi+aKYI/IJcBJMqS8x3a2U2rojD
 WKNF6S8oc5x5WOj2K4sroc5I9R6dxlIzvnmIuiPrNucw+ATMyNqgkUNDvY1MidzZPYtsyA3Qz
 pezXUpsYz+dqSfQja9K4TMHV+48n4ySYjsGzDqdkFUASiOSCO+qvB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_041450_428280_CA825788 
X-CRM114-Status: GOOD (  18.38  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alex Ghiti <alex@ghiti.fr>,
 Atish Patra <Atish.Patra@wdc.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 24, 2020 at 12:34 AM Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Thu, 2020-07-23 at 01:21 -0400, Alex Ghiti wrote:
> > > works fine with huge pages, what is your problem there ? You rely on
> > > punching small-page size holes in there ?
> > >
> >
> > ARCH_HAS_STRICT_KERNEL_RWX prevents the use of a hugepage for the kernel
> > mapping in the direct mapping as it sets different permissions to
> > different part of the kernel (data, text..etc).
>
> Ah ok, that can be solved in a couple of ways...
>
> One is to use the linker script to ensure those sections are linked
> HUGE_PAGE_SIZE appart and moved appropriately by early boot code. One
> is to selectively degrade just those huge pages.
>
> I'm not familiar with the RiscV MMU (I should probably go have a look)
> but if it's a classic radix tree with huge pages at PUD/PMD level, then
> you could just degrade the one(s) that cross those boundaries.

That would work, but if the system can otherwise use 1GB-sized pages,
that might mean degrading the first gigabyte into a mix of 2MB pages
and 4KB pages.

If the kernel is in vmalloc space and vmap is able to use 2MB pages
for contiguous chunks of the mapping, you get a somewhat better
TLB usage.

However, this also means that a writable mapping exists in the
linear mapping for any executable part of the kernel (.text in
both vmlinux and modules). Do we have that on other architectures
as well, or is this something that ought to be prevented with
STRICT_KERNEL_RWX/STRICT_MODULE_RWX?

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
