Return-Path: <SRS0=hCbr=KS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08215C4707F
	for <linux-riscv@archiver.kernel.org>; Sun, 23 May 2021 02:04:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76D74610A6
	for <linux-riscv@archiver.kernel.org>; Sun, 23 May 2021 02:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76D74610A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=0Px5UOEFtDUQr0ZK315JZQ2XZleSgC1KcyuY3jrvQFw=; b=jlzYXBOjwWMU9HUeO2UXsERoj+
	uFRfsPkucmtdkpw63DiBKlfHaIjVFQirtuXGQ/FeWWwzR8bG3FZGHoqX5VhtQBxiQ35RvI2GwBfQ6
	ehQhoUp2fYlz46EfKbVXl8/s1HWhpFkv2nOVQMvOjdtWZn/20FGo9UavIrtiO0uJCw73Q0o3LFGEn
	8TANant2hhGjSAh+IA3KVVcptHbGfLHNJ/YmHTKPlJfpMwMutimbyL1wg+rqaVbZCKWKWJJxjYhly
	VWp7nDj2jiF2DAzXCAF2tKQjoCsp3XwSzuz+Hd/8mQYZ8cfgaXbVPRCoOgpCfklSZxwhfH+MmwEvA
	HNFcwFaQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkdTT-003W0M-4x; Sun, 23 May 2021 02:04:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkdTR-003W06-PN
 for linux-riscv@desiato.infradead.org; Sun, 23 May 2021 02:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=mUbO565hf5uxk6ROeLW4fGwEI0mXowXZYPE3OuwhyXo=; b=hum0ZkGTG79Iw637CgdSArgSBR
 FcKfix74r364cT/IzaUO5qa60nynnG2oAeGjccRVgF7z45PEGbHEL9J4xaewhJIyZFEpHg9P+IN86
 GYv8SbTiLj1Zm1rHq7YvvdVvjrGPtk9rLoNDDQdcrp2QfcaZkPuRDoFF3qtzNX90WeaANMQ5MikG4
 tyc6UrQ57N8C+Gu5WCIouOPfknPQ57HXb9hk53oRXuc5W8/7YJZ79WACBCZtKstp/qxrqtRklQ+j4
 5x8b7CBSoJas/Q8I2MOWl2VBEhloBmp+mCXOXuNws9Bc84c2BLLbImiqGQeHJ/0xY49C04B50JKya
 B+y48gWg==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkdTP-000HDo-6h
 for linux-riscv@lists.infradead.org; Sun, 23 May 2021 02:04:12 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso9176604pjb.5
 for <linux-riscv@lists.infradead.org>; Sat, 22 May 2021 19:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=mUbO565hf5uxk6ROeLW4fGwEI0mXowXZYPE3OuwhyXo=;
 b=MvnsjT4rH2/VYW1fh1/Ar/6sWPUsRuEP4ur5isAnaGZhGwLUehtZFQINKPMQkTjWXw
 RD+yMwWktzzR/6XriPLOqtbFbQQa5KumuMgDptBD2kdtudohOWBW/x/vjZGIhbhjXzxq
 UKWxzcrvXMKVWNsXUt6hmtow0ZQJYeZpPRH12N3jWqW/Yw11/RP7xDKLEd/mxKK4BXt0
 c2xNZlHt+n80mWRB/wGPzqOC/N1TgACTLYtqItGICNsr90fDYWkFy79TQ8qErwL0gfB8
 dpW66ZmKOAHuFPaujDYZNbhpA4w9DUPkWuwEYVPLYqbCmMywoA5TmVE2f1QRonrf3NQb
 HfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=mUbO565hf5uxk6ROeLW4fGwEI0mXowXZYPE3OuwhyXo=;
 b=gfxrL6p0nG57gshJzBZEtqxOz03ZRtirGYjXaoh2YbNDWHsTVKnRPHi7bPHXTOVm58
 rdiroDyXxKcCZZTAtnKzxMUKTjjH7Kd09PwEM9NSf+E5toQBVbV6lxCL8K5a1lnZiAi0
 79QsiBk/1lztFyYlxyEohrRpWQsfWWNMvf4jcHeAZJqyifbVpAiKB8JAVx4Z+pux4JUu
 tNEwwZbpi3PnUkXI5sYtWtNkcbvl1Pi8bSaLpY+YFqiKCsqHoouagR/cescHTt0tkxOP
 ltBxpHnubPptSJj+BUe/7O6kpr9PnBhbNpp/IDVpJo+S5WvXx2u7tVjQcBxrAN4TBfWt
 FpmQ==
X-Gm-Message-State: AOAM5318XLl3BshAcOajaFgGF5jXf0yPaXg5FsWJo004rRSgClSB4j8m
 FiZvPhpJVlMhwSVxLw5m9y2LcQ==
X-Google-Smtp-Source: ABdhPJzhWCQ480vMXxtMykQQVFX1GkdT3DsG2KEaFC7hlHjoYCXWm0x5/N57FORybBy3ElUYCG0oMw==
X-Received: by 2002:a17:902:8bc3:b029:e9:9639:be21 with SMTP id
 r3-20020a1709028bc3b02900e99639be21mr18894966plo.59.1621735447899; 
 Sat, 22 May 2021 19:04:07 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w123sm7322419pfw.151.2021.05.22.19.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 May 2021 19:04:07 -0700 (PDT)
Date: Sat, 22 May 2021 19:04:07 -0700 (PDT)
X-Google-Original-Date: Sat, 22 May 2021 19:03:59 PDT (-0700)
Subject: Re: [PATCH] riscv: mm: Remove setup_zero_page()
In-Reply-To: <20210507221959.2db29936@xhacker>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang3@mail.ustc.edu.cn
Message-ID: <mhng-7bd87d93-ae3b-4c4e-bd75-388d583a0c0e@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210522_190411_361372_75754241 
X-CRM114-Status: GOOD (  21.94  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 07 May 2021 07:19:59 PDT (-0700), jszhang3@mail.ustc.edu.cn wrote:
> The empty_zero_page sits at .bss..page_aligned section, so will be
> cleared to zero during clearing bss, we don't need to clear it again.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
>
> Hi Palmer,
>
> This patch was one of v3 series of "riscv: improve self-protection"
> and acked by Anup. I checked Linus tree this tonight, it seems the v2 or
> v1 was merged, this patch is missing, so I rebased and sent out this patch.
> If it's late for linux-5.13, then I can rebase again once linux-5.13-rc1
> is released.
>
> Thanks in advance
>
>  arch/riscv/mm/init.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index dfb5e4f7a670..4a68b029e3d2 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -67,11 +67,6 @@ static void __init zone_sizes_init(void)
>  	free_area_init(max_zone_pfns);
>  }
>
> -static void __init setup_zero_page(void)
> -{
> -	memset((void *)empty_zero_page, 0, PAGE_SIZE);
> -}
> -
>  #if defined(CONFIG_MMU) && defined(CONFIG_DEBUG_VM)
>  static inline void print_mlk(char *name, unsigned long b, unsigned long t)
>  {
> @@ -862,7 +857,6 @@ RESERVEDMEM_OF_DECLARE(elfcorehdr, "linux,elfcorehdr", elfcore_hdr_setup);
>  void __init paging_init(void)
>  {
>  	setup_vm_final();
> -	setup_zero_page();
>  }
>
>  void __init misc_mem_init(void)

Sorry, I missed this one.  It's on for-next now.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
