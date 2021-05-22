Return-Path: <SRS0=Qta6=KR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF4CC2B9F2
	for <linux-riscv@archiver.kernel.org>; Sat, 22 May 2021 18:55:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A229F61177
	for <linux-riscv@archiver.kernel.org>; Sat, 22 May 2021 18:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A229F61177
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Ql3M6DjiqWe+FgLSbDWbVVuRglY5F/45rC0eHNKFEFY=; b=ODAo48Wd3MwMKKrshlWwv35UKw
	7AxQ5GNEzaIUAx8WwJ0Z8wxfzTenNPaYB42SFzZab8WgnhF9kPSbxkxhPEUJ3TygUSUYQHqmGZBWU
	X0AY/xAm17wAVACgYzrgjaYS7I3MZ0vqz2lu/CW9njoXOzysg9LMIrk62ATotgXhnftRi3R3P664M
	k5H2qQVTqGml//2kLWsYtL+rGKQxXY6gMP2T9DOX9u925+ewQd42flEkyA3/Jxp2LYMionB/4KSbH
	fwfoz9Frliggauz9PRidQRu6/tm/OidPaCySdyo3WdxriPFSjoH/j/PQdlmrQFl1DQtX12aIhF4EY
	sCt1+GqQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkWmd-002xQs-S6; Sat, 22 May 2021 18:55:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkWmc-002xQX-59
 for linux-riscv@desiato.infradead.org; Sat, 22 May 2021 18:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=PBEBzpg9msOXPzTQKT/dWbcjcMFg/plF1XqgYuF1BOc=; b=xKJhLrhRtkurNi0b6rg5ubA6nl
 mE/0hISVXHiKWuqldH1f0WcjVmQuSLwD3l6f1151DLyAIgJak3q82H7jWKp2/4YHEEqHXAP0H+99l
 KPwL1IpmOFnAgcJO7oJotDVnxyO+itw082ZG0SJ3H/dtRvPOsuhHOLCJe/FLI9AfoA3LL1ktdIsO+
 mF1W3ASRbrrDyqpYd1jvl2MrIhtQch0CjAU23ZOZW7WgME6Eqjbta5KMUe7hdA6YnKusRGaVzVtoE
 4DclG1Oz5bb3WQ18OCm6MLuSLxmssrRyMC6Np7Qe8i9SrLg5HwjZIiB+q95B04ZH9OFAVleJ/CCgH
 wNVnFiBw==;
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkWmZ-000B79-3P
 for linux-riscv@lists.infradead.org; Sat, 22 May 2021 18:55:32 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 6so16930208pgk.5
 for <linux-riscv@lists.infradead.org>; Sat, 22 May 2021 11:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=PBEBzpg9msOXPzTQKT/dWbcjcMFg/plF1XqgYuF1BOc=;
 b=H0wH0sw5Be4k9+rZ2ZWodtQqyg56PZldBBHiY9jCZI+mi5EoBmMQkYj1qwQZ42DSCt
 BnjLQywzvqxJ5JTwRvq3YsMOfgiClxuDjkGm2LRvrsuD9XIPWrusRTmOoGK2YQcdKqNE
 JX3AasWFhNzNnPmQ04gwnpMR8wB7MHWjpODsT0diTdBGyA3f2KLQPGLmh2DVrLnvH49j
 P1MaDdZS+tzHRXdi28fnrkz7KmXSSr8G4jbhFm8++WIEIhV12piXBJ5rIvLnQ3DWFSPv
 YdFY/LAQ3Q7FGfmYpjEzHdiezLmivLRCNxh+ytfhsFG7OIguQitK5O5b6nMHfv6SsDDi
 TEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=PBEBzpg9msOXPzTQKT/dWbcjcMFg/plF1XqgYuF1BOc=;
 b=b7c5ksccN9l1uKDIQjlYin7SLjXVnZOnWAS7DQRLrjqbwU1A2Y2HqY1LPSFtWjWnvV
 A8bEyPvzMtW9q4+H5Nu2R1xZuNqt+J4x1hfGSXmCdn3QipwX3fVxykJvSvInEVqLvgl0
 b2P9Q5drxDUNnVuoqZxphX4BB4DAfX+NvC93oi/YWMAI7dqXucN+yRnR44mF3kntjFvT
 VjXkcTIRw+KvR5X9sYmiphNbbyzW4DfnA+FHiz1o5C3gaSLLO/PBF21Ulu0AMnMa78wy
 WVJiz038MF+/Agfs6PzyWPjyULw+TcKVCk+8X+Nbk37G5U1dRT+E317AIMbLmne7XH/d
 9Yvg==
X-Gm-Message-State: AOAM533WVHLXWG6kTB9V9aZCoJhmvFmRB2x2Q1NuUIPxX6YJZeuKd5JC
 b0O6NxWkg1oTLne+xLuHHpPGxw==
X-Google-Smtp-Source: ABdhPJxwsckoqLAMui+4s8m4Rsm4xsMVudaNEfHg9xqCJTNnI2KZT3sqvL9+rF8K60wLc3JI08wtNg==
X-Received: by 2002:a05:6a00:216a:b029:2df:3461:4ac3 with SMTP id
 r10-20020a056a00216ab02902df34614ac3mr16175729pff.80.1621709729922; 
 Sat, 22 May 2021 11:55:29 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u22sm6929252pfl.118.2021.05.22.11.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 May 2021 11:55:28 -0700 (PDT)
Date: Sat, 22 May 2021 11:55:28 -0700 (PDT)
X-Google-Original-Date: Sat, 22 May 2021 11:55:26 PDT (-0700)
Subject: Re: [PATCH -next 0/4] THP supprt for RISCV
In-Reply-To: <20210430082850.462609-1-sunnanyong@huawei.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, 
 wangkefeng.wang@huawei.com, sunnanyong@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: sunnanyong@huawei.com
Message-ID: <mhng-a43b7855-77db-4be1-a3fd-8e2b59abe5be@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210522_115531_223714_69ED2684 
X-CRM114-Status: GOOD (  11.53  )
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

On Fri, 30 Apr 2021 01:28:46 PDT (-0700), sunnanyong@huawei.com wrote:
> This series brings transparent huge pages to RISCV on 64-bit.
>
> I have tested these testcases of vm selftest under qemu-riscv64:
> khugepaged
> split_huge_page_test
> transhuge-stress
>
> Nanyong Sun (4):
>   riscv: mm: add _PAGE_LEAF macro
>   riscv: mm: make pmd_bad() check leaf condition
>   riscv: mm: add param stride for __sbi_tlb_flush_range
>   riscv: mm: add THP support on 64-bit
>
>  arch/riscv/Kconfig                    |   1 +
>  arch/riscv/include/asm/pgtable-64.h   |   3 +-
>  arch/riscv/include/asm/pgtable-bits.h |   5 +
>  arch/riscv/include/asm/pgtable.h      | 164 +++++++++++++++++++++++++-
>  arch/riscv/mm/tlbflush.c              |  17 ++-
>  5 files changed, 178 insertions(+), 12 deletions(-)

Thanks, these are on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
