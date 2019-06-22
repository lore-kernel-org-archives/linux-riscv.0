Return-Path: <SRS0=kz8/=UV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A0BFC43613
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 22 Jun 2019 04:14:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9DF920843
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 22 Jun 2019 04:14:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pnRqxaDZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="DlB6oG9V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9DF920843
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tfDiRl1sr4I5BQ5UO6tbe5QWy2D4Vc68qIcCyRXfTfk=; b=pnRqxaDZADBbpz
	l/mSQGc9QTrpXDldoJDfg1BbFCocXogJSzivtPQvd4NQmgJqR8OF6+hls3XWz+6cjcNnpIVqI/Soy
	o2SLC5ToKYi/miwVfytrjpsFo7xcp6OqJ0olZmXkevLsHiEnyD+zO9g0zVxH5yvJ2EUH5DpLczy/O
	XSIKGPtBKRWuF1n46ljDSIx2ebaqNL0kY5pPWTPy6iG5MYI6Fno1xpN7irYox0i2ceTtPlFxBUn23
	2W2OmO8nqhc/aBBDo0ud4/BC3WKXso+s9nRuWgrlHfPP255r1ssDxBbXv9YGx74Z2U8Oc2S2yLvz9
	LdiV2ip9QB9oLnZtTVCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1heXPr-0004JK-Rh; Sat, 22 Jun 2019 04:14:15 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heXPp-0004IS-3f
 for linux-riscv@lists.infradead.org; Sat, 22 Jun 2019 04:14:14 +0000
Received: by mail-wr1-x444.google.com with SMTP id n9so8412000wru.0
 for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2019 21:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UnNxgzz45jXanekL0G0iIwxvOLwF76KDyFR4BupDUBg=;
 b=DlB6oG9VvsR/BRBZyLkN0QQkvG07sO3eJyod1fWS76wH/Nf6Zijqk/4rKrboH9aoCR
 G1d+knbtufM28yqt/GYYFu4qEU0JsCmEPgTMV7W356ufFI2/G/xKexgOv8fG+9baXvN5
 6bdblZ/bBKtztU58TxVfw7aMaSxN+9Tg/rSuwEvkG4tkqYE6BAqyZjN8r8L/wrscBvmF
 Kez0b3Ghd4SYlU0YX70osvFUAMVm9Fd9k0XUGkdWwYmyXBewi9CHE+7j6rwSZrKNJSNo
 8Plt41Zx/TSsXGmBtiQlo+f9tDDnB7EUUDBtzdnD/rs5uekSljtr7TmSKfTIHbnU6nJD
 KPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UnNxgzz45jXanekL0G0iIwxvOLwF76KDyFR4BupDUBg=;
 b=CqkALdUmnUvc8RsFkt4bjp3mJzrycAIZLnMs6EfOnuSrWer3Xb+Bk5OF9bMFjZ+xIw
 iyWWapjEv1CeJ06P3xWGsd0Epwto9hoHTHG037orswIeAB8B57PMNyN8+XKVXvd27RY8
 DjZJYno7ihmaup4RbF03dJRdKoM+q9hZRpbG4S1GJV1bC3mA19KkimTjsUqAxIq8CpGN
 jTPN9DJ9pSO1w93MHXNLnZsx29vxO2Y3IflglhFLf38ixrm7JjXQa73qkzihBdZU7shK
 wO2TDUQ+basGQjBMUr4X3lWAqu0vSjqCvkAI9gSlqe+4r8JKeCF8BHBYUwt5nh5j7wvr
 9vIw==
X-Gm-Message-State: APjAAAUfXRsLwY4J/yh3vJZywK2Xa46ofH8KtPZHIp1nHNKi079UZKF3
 SJvfiJNtKG2ZweLgOVcI/qLsy6yWDe33jiI6qPBmlw==
X-Google-Smtp-Source: APXvYqy0qSomvM2VPYwdsUAVUeJBcXv6du3aogDq0+nUAilpRabqDlQDj48Qg/rdCcKjlnkDYzPn4J3C99rC7PZysAM=
X-Received: by 2002:a5d:5448:: with SMTP id w8mr65875480wrv.180.1561176846303; 
 Fri, 21 Jun 2019 21:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190607060049.29257-1-anup.patel@wdc.com>
In-Reply-To: <20190607060049.29257-1-anup.patel@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 22 Jun 2019 09:43:54 +0530
Message-ID: <CAAhSdy16-6RfHop3iRJkdKxUm3KBXn6MF+v8jp3zH0VxYnNE_w@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Two-stagged initial page table setup
To: Anup Patel <Anup.Patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190621_211413_289935_2E6141F6 
X-CRM114-Status: GOOD (  12.43  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jun 7, 2019 at 11:31 AM Anup Patel <Anup.Patel@wdc.com> wrote:
>
> This patchset implements two-stagged initial page table setup using fixmap
> to avoid mapping non-existent RAM and also reduce high_memory consumed by
> initial page tables.
>
> The patchset is based on Linux-5.2-rc3 and tested on SiFive Unleashed board
> and QEMU virt machine.
>
> These patches can be found in riscv_setup_vm_v5 branch of
> https//github.com/avpatel/linux.git
>
> Changes since v4:
> - Added dtb_early_va which points to DTB for early parsing
>
> Changes since v3:
> - Changed patch series subject.
> - Dropped PATCH1 because it's already merged
> - Dropped PATCH3 because trampoline page table handles a corner case
>   for 32bit systems where load address range overlaps kernel virtual
>   address range
> - Revamped PATCH for 4K aligned booting into two-stagged initial page
>   table setup
>
> Changes since v2:
> - Dropped PATCH2 because we have separate fix for Linux-5.1-rcX
> - Moved PATCH5 to PATCH2
> - Moved PATCH4 to PATCH3
> - The "Booting kernel from any 4KB aligned address" is now PATCH4
>
> Changes since v1:
> - Add kconfig option BOOT_PAGE_ALIGNED to enable 4KB aligned booting
> - Improved initial page table setup code to select best/biggest
>   possible mapping size based on load address alignment
> - Added PATCH4 to remove redundant trampoline page table
> - Added PATCH5 to fix memory reservation in setup_bootmem()
>
> Anup Patel (2):
>   RISC-V: Fix memory reservation in setup_bootmem()
>   RISC-V: Setup initial page tables in two stages
>
>  arch/riscv/include/asm/fixmap.h     |   5 +
>  arch/riscv/include/asm/pgtable-64.h |   5 +
>  arch/riscv/include/asm/pgtable.h    |   8 +
>  arch/riscv/kernel/head.S            |  17 +-
>  arch/riscv/kernel/setup.c           |   6 +-
>  arch/riscv/mm/init.c                | 331 ++++++++++++++++++++++------
>  6 files changed, 292 insertions(+), 80 deletions(-)
>
> --
> 2.17.1

Hi All,

Any comments on this series?

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
