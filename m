Return-Path: <SRS0=x9rf=L6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97064C07E99
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jul 2021 02:51:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 260F861466
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jul 2021 02:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 260F861466
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=dqXqw9DVDgdD7dkLv2CG/xlwry1ieZB4OcgiPG1ZVi0=; b=EQwqx/LyG4ieimRVZTqF3mf80N
	QpW+Mb91DAs5AONPdkfWVrU4ikSZ5xIGcm/32pcrxWhUIuJBmqBXHDL8C7/hdSRDSovJnxsPGAeFr
	2YViHGRw8WxhSpuhzIw2Jxk3xQbBT7tH9rfFff7LGcJZPMrIt+Ld8M4dmI0psVFXP+dT8B8VvfC5W
	bof4mLGXDmm0MrV/qtu/HHv2Pmv2DPl7THj5j6rkgjzufoAA1Xnu1fiDWZ2OX5c6ROHeuh1AJAvR9
	qjwG/0rbXDXWgLOqVosqj7LxOP7yFAHNtOje6yTuK6pXaWenvR8k2edMb+s6gSUI/WkGai4udE2GA
	e+5nWmBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0bAn-00AB3n-EI; Tue, 06 Jul 2021 02:50:57 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0bAk-00AB2m-SW
 for linux-riscv@lists.infradead.org; Tue, 06 Jul 2021 02:50:56 +0000
Received: by mail-pg1-x52b.google.com with SMTP id v7so20072933pgl.2
 for <linux-riscv@lists.infradead.org>; Mon, 05 Jul 2021 19:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=lIXqQi/VnPHzZeruihX8nLIui/MmMXv26mgdU/RgQ6M=;
 b=zZFIeq72Wp9m5jNgscZ9Bv9/G1lXEVNNwdHvYk0DF7nojW0FAE/2XWhHrUHiKciIcs
 u266cQvhJOQzJPkLZ3q+TiatY00UaxDxGF5yBHMZ5wE6FcbLIPJR/H/OTZ+Oi45+EV0B
 y4QMPrVYwp9pnzUFhq+hitiWvccthjY1iUDj22y8uNLJDIuF2bGIqEU9VGFG7dPCPRQ4
 n5ysiXl8UvIH5iQcMQZXix39x5zZXvoW7YPkMOVuwNYuNqvYtFUYXZvGmLf/KVHAGzfM
 UUXD7NYPZNQtt/aMwM4mA8KDnt99BJgzXMg9jLqqxWBvdledT01QV/ldWBA5iQ3janQt
 lQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=lIXqQi/VnPHzZeruihX8nLIui/MmMXv26mgdU/RgQ6M=;
 b=IWDTzLApMV1hmm7okSEB7iIaQu5Mhui3CM76Dqsl5wKNEnlCxu7ZkNpH61ZyngRuLD
 WlGUErpOLbf0qkpnS0+UaeQOh3eWl3x6mcE3iCBxP/gaCMNh4k0QbT5LW6XHzSL3qm/a
 g59LVVWdVrY/634+Bpn8JKkTq1keK2jVdQ2aO7vTQ04B4MhFVmWf46JOMUyJG+uSfHby
 BZpbZ6c+J9M8cann8g34uMYfkUbjZ85k8/NpZlACrfUDMndCI8DrSLg9NHGKLs/0vn3t
 SdHdxdjkOzMWmnfByWoaKSYhxiKqidyiLz4eHiCm0dm0iFuUwAT8lElOZZoTZnuCDJex
 QHiw==
X-Gm-Message-State: AOAM533aa5nqUv3ahiZc2tr2d0kfmvhkdYmriiQ4VV4px0KX5h9J5ORV
 N8Z2kHOGovGpupzltz23wIFkuA==
X-Google-Smtp-Source: ABdhPJytLcRvjhxn91dZbgaia0xwZwtD1o/tV66+LCngqTZyrWehLbrRGf9o01tWGNXQ2V2v9O0+dQ==
X-Received: by 2002:a63:582:: with SMTP id 124mr18656741pgf.299.1625539853303; 
 Mon, 05 Jul 2021 19:50:53 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q12sm16775395pgc.25.2021.07.05.19.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 19:50:52 -0700 (PDT)
Date: Mon, 05 Jul 2021 19:50:52 -0700 (PDT)
X-Google-Original-Date: Mon, 05 Jul 2021 18:41:59 PDT (-0700)
Subject: Re: [PATCH] riscv: Introduce structure that group all variables
 regarding kernel mapping
In-Reply-To: <20210617135307.1972069-1-alex@ghiti.fr>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, alex@ghiti.fr
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-25d4bee5-acf1-41f3-8ce4-272faded7946@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_195055_012874_84A2D800 
X-CRM114-Status: GOOD (  13.47  )
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

On Thu, 17 Jun 2021 06:53:07 PDT (-0700), alex@ghiti.fr wrote:
> We have a lot of variables that are used to hold kernel mapping addresses,
> offsets between physical and virtual mappings and some others used for XIP
> kernels: they are all defined at different places in mm/init.c, so group
> them into a single structure with, for some of them, more explicit and concise
> names.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  arch/riscv/include/asm/page.h      | 60 ++++++++++--------
>  arch/riscv/kernel/asm-offsets.c    |  2 +
>  arch/riscv/kernel/head.S           |  4 +-
>  arch/riscv/kernel/kexec_relocate.S |  4 +-
>  arch/riscv/kernel/machine_kexec.c  |  2 +-
>  arch/riscv/mm/init.c               | 98 +++++++++++-------------------
>  arch/riscv/mm/physaddr.c           |  2 +-
>  arch/riscv/mm/ptdump.c             |  2 +-
>  8 files changed, 78 insertions(+), 96 deletions(-)

There were some conflicts, but I've fixed them up and put it on 
for-next.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
