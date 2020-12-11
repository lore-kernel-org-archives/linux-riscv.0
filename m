Return-Path: <SRS0=mTxS=FP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E74E2C4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 01:43:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C4E92312A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 01:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C4E92312A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Du1lT2ZbIsk1UDmUP2JB93EnGdvobwb46d4JCURVqj4=; b=ANg7VtKnb+43cF91/LH6htWJA
	WUSStR/4rRi5lyBFiiTIu4qoCxx6seAZjvOX0aBjoe4dg2m7+5CNSrpWQ7uCrjPoYPmsBSToyzF4o
	fZiUBaHbnGrWA4tLBrLHVyYymyvUdzUb/mOvL2TyF5i5lv41fANnKBz9vPCPz6zfoi8zZ7UZ219oL
	SPuVAj5rYAFrSVFSMvFX4xFOa4DZyGHaBuk0gePULDPOIy54a2DPjgkNG9EtA5JfCywumnYPMSlBQ
	kIbDNOydvrKcrS6FEzLfBRDL2AqHEymtfUOw76g2L7sdUHWxUnQal5Ruafw9XaZ0361yEUVSkgidR
	s1ZBBcl8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knXTI-0002uJ-NR; Fri, 11 Dec 2020 01:43:48 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knXTF-0002tE-I5
 for linux-riscv@lists.infradead.org; Fri, 11 Dec 2020 01:43:46 +0000
Received: by mail-pl1-x642.google.com with SMTP id r4so3784644pls.11
 for <linux-riscv@lists.infradead.org>; Thu, 10 Dec 2020 17:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=GCLjZ4C1GhQOCfoQDAmU0AgsWNpnnX6Uk+bs7wRhSkk=;
 b=Eq7z6s0pmBOqWML/4kSzO5tEpG67NrSjldJKsWECc58SoDciyNrgG0LT2ZkN10EoqN
 gDPEbJSjerQ/Vxxb2d7yPvcxwCYTiyfBKReJ6SD8M+WwXBjJB8yXHbJg9d1zmnVExfFq
 sJyCB0vUbi8sscZ8YkAHJ6CO3znsbIHyjuficLQP0v/m8ZxRtyQGprrhzLnjKqtQm+kr
 3DNo0bT3k4rThsj76VWBXe6QgjEUk396OXgeo5sIYGj3nq+zMmUSdhO5I2iOpjV0Fhxe
 fnTbkdS/Lakl0OaIGHIWvsuztpNJAPe3j+oeBZTWCfi69844f9t7QSphpasXxIwIo9z+
 3d0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=GCLjZ4C1GhQOCfoQDAmU0AgsWNpnnX6Uk+bs7wRhSkk=;
 b=EHBRXzjbGjQceBGBbUNl7KXUGPXtIaRfkoiI0GI2g32ySWpUGWyIPw+uPXqPoTfJOP
 OaL/njMI4Q1MPqpWnH/2g89Ldr/ekNgKFLrYuM2PCXIr+Hg6yAJ/W/wacGhtA/3a2+7m
 sRU6HxhI32yBeZ6fZlEDYvZDkYRjnSFQ8MzkcJmHKurOOmKT6gfAHuoxCqiqdJERE1U7
 vWD5PJSqWYoXYII7JPMNxHb7sN9WKewjMqfbZMhzToALt0yiQBuXeVktyNcqu5jQPA7q
 9Az4OL5YZlDWjGPlUNzPmHtBiegJf8cGS2ohqcmt6wsUgeAabZaFRnC/GJwF84YCY8U5
 ss/g==
X-Gm-Message-State: AOAM531KXvWZ1ifqr1LMiHyjziDOmLZy+0++iTVJ3yvg3pnmLpmhMvjK
 u9Na7uQ7PQZ4PxgWLTZD+cpBeg==
X-Google-Smtp-Source: ABdhPJxLfgLpOmsF2YST0/Mz0YRHFS7sEKfmo6HtzZEkIP+2WrjO/yTGGz+V9Sq5awm9buMDRBsQOg==
X-Received: by 2002:a17:902:b406:b029:db:3c3:e4cd with SMTP id
 x6-20020a170902b406b02900db03c3e4cdmr8707978plr.79.1607651023712; 
 Thu, 10 Dec 2020 17:43:43 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u198sm7440053pgc.84.2020.12.10.17.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 17:43:43 -0800 (PST)
Date: Thu, 10 Dec 2020 17:43:43 -0800 (PST)
X-Google-Original-Date: Thu, 10 Dec 2020 17:42:43 PST (-0800)
Subject: Re: [PATCH] riscv: kernel: Drop unused clean rule
In-Reply-To: <20201121101519.165053-1-wangkefeng.wang@huawei.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-00aa0cea-85d0-46b8-8045-375d94442104@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_204345_618017_40F6E4C0 
X-CRM114-Status: GOOD (  15.75  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 wangkefeng.wang@huawei.com, Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 21 Nov 2020 02:15:19 PST (-0800), wangkefeng.wang@huawei.com wrote:
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/kernel/Makefile | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index fa896c5f7ccb..f6caf4d9ca15 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -56,5 +56,3 @@ obj-$(CONFIG_KGDB)		+= kgdb.o
>  obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
>
>  obj-$(CONFIG_EFI)		+= efi.o
> -
> -clean:

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
