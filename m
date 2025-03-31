Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E286C28B20
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Mar 2025 02:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q3wq7Q+ZhZD40dEqwyiJYO1pJlvFVUuhehkyW08B9bs=; b=u/aBxXpLCKIKYM
	x3/CESEDQsDpr8NLMK51OSUfuGYEtqPtxZ3wjzrkm30RTMgvzxL5TmaYxF7BGMJqti83W1rcSjLYp
	Vi8rT3uQPvPDWNmhWL32XXu3PFavSLgm7D3Ev7BJNXqPvlcfsyCQwkKxQtXwAPJy71BaQsxIKhla2
	QzP0gvYJwVEkEfpnvl+A041DMqF9r5kxVJJryNQU4Pj9aujtXdCRbq/kZw3dq/lzTcFEas13izjlL
	VRqVX8pcQkTWFFAG5vlIAJ4LFgNnEd8dOXPuEcCqalCaW1z3ZLIZ+RWxrnTvQ3UCRoXwTiSfeWu2f
	7y6jXSGEGkdsDIu4Bigw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz4T2-0000000Gtw4-00AV;
	Mon, 31 Mar 2025 02:01:36 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz4Sz-0000000Gtuz-0opv
	for linux-riscv@lists.infradead.org;
	Mon, 31 Mar 2025 02:01:34 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3fea0363284so2300352b6e.1
        for <linux-riscv@lists.infradead.org>; Sun, 30 Mar 2025 19:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743386492; x=1743991292; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d2JS6EGqc0l3PzKtje4HJKFvA62a4rcCqEYUHac+00A=;
        b=ZicIpAi4NiI3es8Yv0DTnijqZADRvmu1coYZvsi2VZxDz6DowQjrYb4kWZlo/jPWkf
         MTgZAPWD7t0f9m4T4pjkm6aqul2Kd7xpbAvmMSWhdlzfeakGw607osertNhLbQkvOL1/
         GKiC+iqPhhRgYDZOw2LhHPF1a2Tcxen5npYOJJvcu/7F9/xRpnFkk6xAOIYvJYmnhSSr
         CxcOTXBt8Myq6BNNzeSATdNmf+Io+Umwo3vcj+GlScIWYRyG6TscgOS2xFOQsHUkca2O
         6NxH7EnCXqRlcvfRwUzd+L3t6IxDusOiTZ65YwXNvlbHOooqIWx9G7jgCyHj8hfpY8jZ
         XCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743386492; x=1743991292;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d2JS6EGqc0l3PzKtje4HJKFvA62a4rcCqEYUHac+00A=;
        b=MbS8gCt5C9pkylYZlYc9upr3FoaywbY9RwdkvLNhSMBndXOPcLIAEMeUg769/zVKq7
         PlwON35ai2x3X9qlYuIdBxJPoiKQZ0TRcwJnNYLF7NNiCxgAe6vckC77JDLcRoiPVGT3
         Owuoz2pBJZHWHuAqs5zvTp04TQdJQ3hroKEWhnToVsSkN0AOFVDtDHCNRt9l37otOcUo
         ewwTgFqy9PoYr7Y2XHcqI0DOb3cqifEXDl+JY600eh6T9Ki9BzO83cyVMLyi29xCRD4n
         DvU8CakudzRZru44a0CmXjErLwFbtICIAfCsKUNNdgCzPlub/slebm7N0LGo8U/iXJXX
         WALA==
X-Forwarded-Encrypted: i=1; AJvYcCXYwjKsTmEfLYy9XGg9n6bdj08c7Le+Ob6gAezU2hPDV+wBL87w7uLvKWPm6a+H8jDcVPFi2kUAJnJmjA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0UzC5DyEjsCkuR52ndbg7gaz55BbDAE/dVbqHyAVyNYn3t8Ui
	aD74/83pFvna1eiBQZYEDTbEWuy9csGfma0E2jD0SCtqPRVLUd0gmieSkAFJ4mm9ujkdRMPZwUX
	cbwa/1YGNRSjy92oRTM53ZprO0iY=
X-Gm-Gg: ASbGncvBSckxXMEt99X6jNN2H6/0WkL5QhtDGmSfr6VlOlmLn1qeWVmYICStJfWRu25
	4sEfP0ROtvyhCK8bF5DH+v7rP/Q2VrpqnhEJgqS9UyMQL7SLfwbVgdebOQgcWUB67v/JVB3vWGJ
	Rv5TrvMG4uCgLtZGEOEEbxuvHiiihsVhi6IMMhp3QYJr0iyIW+hbmFjA==
X-Google-Smtp-Source: AGHT+IGCia+4Ex6NvLyvevMc9mKF3cPJmD6OJrIk6RNzqydwS1bAInXnp9yrCAsUBCFXOqxYOjoiJeXm5cnsG4w2QTI=
X-Received: by 2002:a05:6808:144c:b0:3f6:a929:c41f with SMTP id
 5614622812f47-3ff0ed03b7emr3895364b6e.16.1743386491794; Sun, 30 Mar 2025
 19:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20241113095833.1805746-1-zhangchunyan@iscas.ac.cn> <deb70c8d-aef9-49df-819c-53007a9ad699@ghiti.fr>
In-Reply-To: <deb70c8d-aef9-49df-819c-53007a9ad699@ghiti.fr>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Mon, 31 Mar 2025 10:00:56 +0800
X-Gm-Features: AQ5f1Jprv1mywV8jNuO9bqjz7phUTCJf-fZc6-R1RW6Kyq__r4IrV8nRfXiW904
Message-ID: <CAAfSe-tbuFudwJZTzVoYExvGyMm1w6KxybczYbGHBxS2zVkywQ@mail.gmail.com>
Subject: Re: [PATCH V5 0/3] riscv: mm: Add soft-dirty and uffd-wp support
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_190133_239057_9B327F2C 
X-CRM114-Status: GOOD (  26.59  )
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

Hi Alex,

On Sun, 30 Mar 2025 at 21:51, Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> Hi Chunyan,
>
> On 13/11/2024 10:58, Chunyan Zhang wrote:
> > This patchset adds soft dirty and userfaultfd write protect tracking
> > support for RISC-V.
> >
> > As described in the patches, we are trying to utilize only one free PTE
> > bit(9) to support three kernel features (devmap, soft-dirty, uffd-wp).
> > Users cannot have them supported at the same time (have to select
> > one when building the kernel).
> >
> > This patchset has been tested with:
> > 1) The kselftest mm suite in which soft-dirty, madv_populate,
> > test_unmerge_uffd_wp, and uffd-unit-tests run and pass, and no regressions
> > are observed in any of the other tests.
> >
> > 2) CRIU:
> > - 'criu check --feature mem_dirty_track' returns supported;
> > - incremental_dumps[1] and simple_loop [2] dump and restores work fine;
> > - zdtm test suite can run under host mode.
> >
> > This patchset applies on top of v6.12-rc7.
> >
> > V5:
> > - Fixed typos and corrected some words in Kconfig and commit message;
> > - Removed pte_wrprotect() from pte_swp_mkuffd_wp(), this is a copy-paste error;
> > - Added Alex's Reviewed-by tag in patch 2.
> >
> > V4:
> > - Added bit(4) descriptions into "Format of swap PTE".
> >
> > V3:
> > - Fixed the issue reported by kernel test irobot <lkp@intel.com>.
> >
> > V1 -> V2:
> > - Add uffd-wp supported;
> > - Make soft-dirty uffd-wp and devmap mutually exclusive which all use the same PTE bit;
> > - Add test results of CRIU in the cover-letter.
> >
> > [1] https://www.criu.org/Incremental_dumps
> > [2] https://asciinema.org/a/232445
> >
> > Chunyan Zhang (3):
> >    riscv: mm: Prepare for reusing PTE RSW bit(9)
> >    riscv: mm: Add soft-dirty page tracking support
> >    riscv: mm: Add uffd write-protect support
> >
> >   arch/riscv/Kconfig                    |  34 ++++++-
> >   arch/riscv/include/asm/pgtable-64.h   |   2 +-
> >   arch/riscv/include/asm/pgtable-bits.h |  31 ++++++
> >   arch/riscv/include/asm/pgtable.h      | 133 +++++++++++++++++++++++++-
> >   4 files changed, 197 insertions(+), 3 deletions(-)
>
>
> As mentioned by Deepak, there is a new proposed extension Svrsw60t59b
> which will free 2 more bits. It would help if you can come up with a new
> version of this patchset using this new extension, would you mind

Sure, I will cook up a new patchset using Svrsw60t59b, and will submit
the new patchset after v6.15-rc1 is released.

> working on this? If not possible, let's discuss how I can help.

No worries, and thanks for the reminder, I didn't notice this new
extension supported in the kernel.

Thanks,
Chunyan

>
> Thanks,
>
> Alex
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
