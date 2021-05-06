Return-Path: <SRS0=VC1f=KB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83112C433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 07:21:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9D0461077
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 07:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9D0461077
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=JRdWbR4nsxv945ceT5dYtI54D+8QyGnQx7qyZoM7dlU=; b=fcbgmsvVjVT+CZyODxIYg4kU0
	fMQ+LRu72ddw97SJsvPfjbHi/LNrYtNqUOfsgaSRKr59qaW+RU8GxaXcCxQpG7Xj1jEe6bI+24QQG
	MOTHnI3eg3+zztCo6dS8E2EHWBosKBaDI7cmJQOKuTqs1tG8vHvgYZRcknA1h/rrcAi0GXjoFYuRX
	HkJehREUTu2T5ZeTFKfI56jg/pyASbEgwM7GirMphrdCgsgwQQuK2kvR2CwgAtAZuuiQRR/MmrAGt
	MtzLMmP3DwAzc0ZY6tXfRYw/RRzen8v6pw0j6BgizkLt7bW3MHYVbIEXkknsZ8Z6xD48IndOPf93C
	2abbryycw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leYJt-003TKy-97; Thu, 06 May 2021 07:21:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leYJr-003TK6-2g
 for linux-riscv@desiato.infradead.org; Thu, 06 May 2021 07:21:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=lbxT9JE2Zk0VsYZm9R/5bovS6f3gMaWpUE1yp11zmUE=; b=tfDh0heStsOJ7/JsNrxG9Auifx
 MQT1zQRAI2/HgYWd2lWerPE4YXa+mp6vZDDueFhk6TZLYtCcgPR8+jlw/7A84rfvnJ8C5SOnlxYlZ
 1XQ4Uu5Fyq1HQbn4DXB/DOCORDKGzYufpCk05hQZ/ybXvKVNzx9rTXrh4K75B6mUre2jH0A24+vQO
 aDrCxNmiA78oeZshw50n6a4Zj1+J2UhehUZpEqqtpxmlZ7uXXG1JiYLaY7uPz1aOEfQ98Im2ryPyi
 gDI/VXrwCbwRgBO1flfr0V8x69vgdRFIVAEGVjZk+dUsQ/4taOQ3TO7HgQtj4BSnwN3p0C9m/gJuJ
 4Yy9lT9Q==;
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leYJo-005f9k-Ij
 for linux-riscv@lists.infradead.org; Thu, 06 May 2021 07:21:09 +0000
Received: by mail-pg1-x535.google.com with SMTP id s22so4102552pgk.6
 for <linux-riscv@lists.infradead.org>; Thu, 06 May 2021 00:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=lbxT9JE2Zk0VsYZm9R/5bovS6f3gMaWpUE1yp11zmUE=;
 b=Rgfu2TxC+4wdMxzX+gXPdo/LNPnY1TASuOKSaupHg1sIF+v2qlg1kzdXCWIskOiVIV
 9+26gI8AHn693ycr+FVZAmV3ePWk+yYjCmhhuwd8VYEZWTFHXiJ5JBnkaNUVj6mHUi+e
 C9B7YlckwiYcDoPxVRwGAzqdcPj1tTylTdHLHoILgQv7zh1JJrul0OIjiYPBKVjJl1fa
 Yh+EW8GMFU7VeLIL+ROG2hiOOkoHu0+Ub+JaVuxbSHvlOvt9ir/anVuYdkD13qxAmQW/
 SQCp3rSBvJc5YSZj7R8YZ/ucsdAtkH6awkzK6sU/SY/Do86Oa6YYr5CXwc9ifoqSCM/O
 X2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=lbxT9JE2Zk0VsYZm9R/5bovS6f3gMaWpUE1yp11zmUE=;
 b=bZprVTXxrB6vAM7MOICx/usW9gNHTHOXCE18u1OJ1Ke8qeNkQjVs6CkNhgQJgxHMF+
 op9M/wm1uyPLJL3cqGHO3KiWEl0vKSu4NdliT+dB27PgdXMikMC0xe25S0X11Jtbdxli
 Pk4EHcCHeGZBwfmLoMqzXWnTlhomcCnzIryQbpyNS67VLo7Fbz5IABfMr1VuHVKe+9TL
 QQu0o6KJz5HxdsJ05q90eA4pNrFNsmq8ozzWVjBnvDTMF7WxXeDebA3yuSPcd2sp2YfP
 2ZeWTjFFMvouXNZdnREU0piVI+GPZ9Mp2RhOhKPZ6ARmuzMW1kpbnlMVgmJoKWqGlBLC
 Nf9w==
X-Gm-Message-State: AOAM533EFCoOPHrtU3F2CGnf0gmykKpf3p8B4CyME97nejpU6/Mre3iJ
 RMNgZRSWZSi5mVQv6dZ7kYyPbg==
X-Google-Smtp-Source: ABdhPJxI+IbNREub46SVx4m/dhNt5IU46jqy3805QxMVFQFVN6ypsSmat4roE2oFBU3yTep/kDNcgA==
X-Received: by 2002:a62:f84a:0:b029:245:17e4:bde2 with SMTP id
 c10-20020a62f84a0000b029024517e4bde2mr2970540pfm.64.1620285667383; 
 Thu, 06 May 2021 00:21:07 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id l10sm1254085pfc.125.2021.05.06.00.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 00:21:06 -0700 (PDT)
Date: Thu, 06 May 2021 00:21:06 -0700 (PDT)
X-Google-Original-Date: Thu, 06 May 2021 00:21:04 PDT (-0700)
Subject: Re: [PATCH -next 0/4] THP supprt for RISCV
In-Reply-To: <20210430082850.462609-1-sunnanyong@huawei.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, 
 wangkefeng.wang@huawei.com, sunnanyong@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: sunnanyong@huawei.com
Message-ID: <mhng-928f0261-e0ef-4cf8-954e-8cd950cc32fb@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_002108_636560_2CECD131 
X-CRM114-Status: GOOD (  13.45  )
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

Thanks.  These were too late for the current merge window.  We still 
have some stuff in flight, I'll take a look after things calm down a 
bit.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
