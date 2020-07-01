Return-Path: <SRS0=OTun=AM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6BB1C433E1
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 18:27:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACDC3207F5
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 18:27:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LCclDhZM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="jjKFRh3r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACDC3207F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=xTCpzlkHIyAGNVKq/Bb8MBrYKKngKD7ZHoebwDgGUzg=; b=LCclDhZM5uF9YM+rbbjbrPMbC
	/KyW7j4PE9YfJ6S45Rw6DtRecaN1plcJ93egjYhB7rqBi7j9CogycZBkA3T3eU7u8cut4YoWoaaWD
	hYYt5GJeOiliflt/HPZ8ONvb0vd527RY6kiaLbmNxSxLdQzklOy1cXBvKeUN+yQdEZ8wEJbthbvLC
	I82dd07O0hxyaNqyp0nzCBNvSGL6l79jrWDHhO2wQ/4N9xpVQ/SrOvLM+kFgaL9sf6XgioXweoVtk
	2P6OtHUtA5j8o7xmIoWeg+b3e9SQ99qBZZSkOsWB712c/ALLkI2o/JvQuuAzbv46RRYMsbHN5nPVN
	YuYSJX/GA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqhRw-00076W-8i; Wed, 01 Jul 2020 18:27:12 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqhRt-00075U-02
 for linux-riscv@lists.infradead.org; Wed, 01 Jul 2020 18:27:10 +0000
Received: by mail-pj1-x1041.google.com with SMTP id k5so1808296pjg.3
 for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2020 11:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=lIUNzVPnioZl/AqoHl3eq70Hw9UQE3Nc2HbKNBJUL7U=;
 b=jjKFRh3rCSMe5Ernh8X1hh3XwXGjTd18yroTM+IuS+jGSXD+Z4E5efmLgsjyT6vej0
 K/fwI/Olcd/+KUlcZiFnok4+DPg/DQYNm04hdj73QaT5YcYdSDhbLJIyj2UPcj8+1BaK
 FeWa82tsMkqtkGszgcmyx5Vb4O9o8qynZlNwWYWrQ0plqa8nGlhTL48MrNilly6tAWMh
 XzoDgLvk0/rgzxRkEoQ2wuOokz4CdwxdMsf+PMpy5IJffVvy6Gs7dq86SuKAf/gVdrUe
 zji1+5oATjRPfQlLeG5zDZAMqqm/3zZ1OtJcQ9bBWM7SMu+94FI9F3uKxC5aI+0DoJhL
 df5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=lIUNzVPnioZl/AqoHl3eq70Hw9UQE3Nc2HbKNBJUL7U=;
 b=sglrGeO0Re+zvtXDi2FeZeBWH+6SioYAtjvyJkQ0NM2nn5iL4BXniLao/ALh2iHQR7
 N1Ti17sKkOsjPVPXiKUFb8dQVT0R9B60+DDd6/ANaclHXD25b6q7zdsSvVat/YbUunyv
 M3ENUBHuMxTkhoe8Qqoq/I8cPBP8H6eisT6Gk0LLjxsj9q6ui+mxOfx4mB8SyGYUe/dH
 25FpZBboFmSOHrEm6NmjRSzI3wT+Fx/CCxFkAbldsjxLJS3ZeUDhKB7kiNWNIfgghEYa
 BmFQvVgF+HMFFfKx1nbA4TBZgXRRTN2rmZ1XfCF5TYuL9lO6mYO4vVyH2YZ9Iw993LFg
 xgkA==
X-Gm-Message-State: AOAM530zapmRLZOeh8T1/vzjPpwLbBANhOtLhTXTGF5gsCt+coZB4uLo
 pgwTTWdVoIfai6/ZQmCoV6f5oA==
X-Google-Smtp-Source: ABdhPJyFfQAa5QgzZHfkovvqXlxMpv0rsewX4ULfOSp+6f5E7OZtcjzKl8qJmaMscnmS2+3IlVaKcQ==
X-Received: by 2002:a17:90a:3770:: with SMTP id
 u103mr31440910pjb.102.1593628024972; 
 Wed, 01 Jul 2020 11:27:04 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 2sm6629531pfa.110.2020.07.01.11.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 11:27:03 -0700 (PDT)
Date: Wed, 01 Jul 2020 11:27:03 -0700 (PDT)
X-Google-Original-Date: Wed, 01 Jul 2020 11:26:57 PDT (-0700)
Subject: Re: [PATCH v2 0/8] Introduce sv48 support
In-Reply-To: <20200603081104.14004-1-alex@ghiti.fr>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-718df9bf-f140-4343-80a1-402f89c0c5ba@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_142709_048794_36693DF2 
X-CRM114-Status: GOOD (  25.06  )
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
Cc: alex@ghiti.fr, anup@brainfault.org, linux-kernel@vger.kernel.org,
 zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 03 Jun 2020 01:10:56 PDT (-0700), alex@ghiti.fr wrote:
> This patchset implements sv48 support at runtime. The kernel will try to
> boot with 4-level page table and will fallback to 3-level if the HW does not
> support it.
>
> The biggest advantage is that we only have one kernel for 64bit, which
> is way easier to maintain.
>
> Folding the 4th level into a 3-level page table has almost no cost at
> runtime. But as mentioned Palmer, the relocatable code generated is less
> performant.
>
> At the moment, there is no way to build a 3-level page table non-relocatable
> 64bit kernel. We agreed that distributions will use this runtime configuration
> anyway, but Palmer proposed to introduce a new Kconfig, which I will do later
> as sv48 support was asked for 5.8.

Sorry I wasn't clear last time, but this still has the same fundamental issue:
it forces 64-bit kernels to be relocatable, which imposes a performance
penalty.  We don't have any hardware that can actually take advantage of sv48,
so I don't want to take anything that penalizes what people are actually using
in order to add a feature people can't use.

I'd be OK taking this if sv48 support simply depended on a relocatable kernel,
as then users who want the faster kernel could still build one.  I don't want
to take something that forces all 64-bit kernels to be relocatable.

> Finally, the user can now ask for sv39 explicitly by using the device-tree
> which will reduce memory footprint and reduce the number of memory accesses
> in case of TLB miss.
>
> Changes in v2:
>   * Move variable declarations to pgtable.h in patch 5/7 as suggested by Anup
>   * Restore mmu-type properties in patch 6 as suggested by Anup
>   * Fix unused variable in patch 5 that was used in patch 6
>   * Fix SPARSEMEM build (patch 2 was modified so I dropped the Reviewed-by)
>   * Applied various Reviewed-by
>
> Alexandre Ghiti (8):
>   riscv: Get rid of compile time logic with MAX_EARLY_MAPPING_SIZE
>   riscv: Allow to dynamically define VA_BITS
>   riscv: Simplify MAXPHYSMEM config
>   riscv: Prepare ptdump for vm layout dynamic addresses
>   riscv: Implement sv48 support
>   riscv: Allow user to downgrade to sv39 when hw supports sv48
>   riscv: Use pgtable_l4_enabled to output mmu type in cpuinfo
>   riscv: Explicit comment about user virtual address space size
>
>  arch/riscv/Kconfig                  |  34 ++---
>  arch/riscv/include/asm/csr.h        |   3 +-
>  arch/riscv/include/asm/fixmap.h     |   1 +
>  arch/riscv/include/asm/page.h       |  15 +++
>  arch/riscv/include/asm/pgalloc.h    |  36 ++++++
>  arch/riscv/include/asm/pgtable-64.h |  97 +++++++++++++-
>  arch/riscv/include/asm/pgtable.h    |  31 ++++-
>  arch/riscv/include/asm/sparsemem.h  |   6 +-
>  arch/riscv/kernel/cpu.c             |  23 ++--
>  arch/riscv/kernel/head.S            |   3 +-
>  arch/riscv/mm/context.c             |   2 +-
>  arch/riscv/mm/init.c                | 194 ++++++++++++++++++++++++----
>  arch/riscv/mm/ptdump.c              |  49 +++++--
>  13 files changed, 412 insertions(+), 82 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
