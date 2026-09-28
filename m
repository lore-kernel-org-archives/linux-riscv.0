Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB1FC9832F
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 09:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=97yLqR8j0fuc4LPi1YAwOUjV3KpFVFbEpEbXRv+ORB8=; b=GO7Omb2TMYRBcG
	Mx83bi79pYF9oBjO5Le77t/K09wxAZqUUACM8vqdrhY2bQqTFZip2d9mKqGfnr/qJgeDO3/EkwtIe
	aHwHmhq5kdxq81NC5Qi7WZE/mmFuHkVHOk3kG1u2mtRCpKuQ3kUPkGKMKMiRFArydiZa6nJpZW8WI
	F7FwR2nqFpWhkMXKcuB/JU55l+O3evdyIrotMp66iVBkpQIlO/qg3YJS0E8Z4ufRTR2fr2cZ6Xlnw
	P0FxOnpgMLe+H9KXSiNdvTqH3aPOa8mm0QdJunB8e1QbzC+qeA+/tWIbPr1kkSnJFYvpwl9IrkeLr
	wTZPO/Ub2cGdTSAlvW2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7KZ-00000000BCA-3emr;
	Mon, 28 Sep 2026 09:07:27 +0000
Received: from mail-ej2-x0e.google.com ([2a00:1450:4864:34::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7KX-00000000BBS-3sxD
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 09:07:27 +0000
Received: by mail-ej2-x0e.google.com with SMTP id a640c23a62f3a-c2b4138d3deso252040366b.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 02:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790586444; x=1791191244; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rz4A9u2HwDkmyVBaHthqdE81Vhdpzal2brNiQu6Y4JM=;
        b=W1OmCVZIky4YGnn350Jbeb+xTtRo7TW+mSkmYnZmZFHHWynDBMPsea4sKI+V5JiMEJ
         DX6a6fYBsjZ71yIRw3IQjXgycM6Ns6lXPbKB7YxSPGiUHftPJOUu2WiGJcnfDxhO4EI5
         /ocKVBnqncsy8g5u7UHjRJLcZaoS5miHEILkcm2fnRt5EfXipyYb3TLudfcr7NIcCX7D
         iDWVjf/Ryad7twT9MO96vlvhseWnjoPMPTzQNXxOPKXHoNR76v5xtRgbL4EbxOon9F8n
         2fz0TMMAq7FSEjhyy4NfE9LbcZvM4wwMM4y8w6cyi3Yl1SYOQnbg1I3XkrO/6blTcqa5
         HOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790586444; x=1791191244;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rz4A9u2HwDkmyVBaHthqdE81Vhdpzal2brNiQu6Y4JM=;
        b=CIgiHPjBUQt0p+ylswETHI5L8jiojaBJM5SHoJ3xwHYHtYLPSYOlicR6rL/VzWfk5P
         O8AS07nqkDkth4sz5G2XPzHB5ETxp3EDnCrCsdwsDxNdWpxkRmX5ZEFYnR+Sifz2ZUnY
         v0zKFwN6VQpcsjU+BYOobT7Ad/hePrJ66t27PBHuskvpFfSiOxz/1p4zxxnWf0U1z4h8
         H8EdY9sVU+sPRjPo33QHLY71a3w72Fx1Yu/Ed47tduGFxFniotzQGr0hH6mHixkIiPzn
         JX1y/QehlqEywGMtK0IxwwpSQj7DlLgtSrlxMM9bQnsIBVUs6s+wX5xNzDljur6K/9qu
         ub2A==
X-Forwarded-Encrypted: i=1; AKwUvByzfK5pw7Fz8pTVebRWSQSunP3C/KQQm7n+6zzGVA3C3o9BzI7CfMRtpZay9siF20HJ6csmmeY3B8Rojg==@lists.infradead.org
X-Gm-Message-State: AFuF++m557eiXsoL+DEnx0gtYVBBtL0IY0iK8veL7cmnyBjiLfjPAsKC
	cc+OLEbWv+9040xBCMP2eI4+FvLOHQqEAmBnZOrMLiV8VujbF/ExliOq
X-Gm-Gg: AYBFou0igvp3sT6mct7A9GWdhOLakWut7Tc/PPAjTsTL5UVgJ1LWg6guBaeTKvXJ2al
	Q9SzgG/PPjy01FHtJTPuqVOw88s98tlgntR/nmI7IR74qqrdtkQuhZjc4Lf80qzokDGkvREt5sr
	9LpSHELEW4yl9R/eWtX8gSOmvLuV/qnf9qtDXcR4Fmq8KcTfSpDIvRBewZcyYjuA09URD2WhTVg
	CSL0/S7xqgTpKNPX8vzF8ZMFFE09g+yFdRH9upgSxY/YM4SSfsRroP73VkPhNAfCpraeXdQ9N1c
	sIRD5YX+e9FkxTqLBnE32Px0QaGSOMLKKdonZx6Q/YQUq0aS0+hFZLk1wTQxwvfdNdKrTKUfJiz
	XO4tY6W1bfkL+NQGo0QGuP2nqSaYggYbyVR9x/DoCevr71QcD40IU9EHp0KvIj4dNBhHTl0vdHU
	bSr8BdNwObIVEplJKblbUheisX6yTz13TzRQM=
X-Received: by 2002:a17:907:6091:b0:c16:4df6:176b with SMTP id a640c23a62f3a-c2ac23d6040mr1043044966b.20.1790586443621;
        Mon, 28 Sep 2026 02:07:23 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757ac8dsm438371866b.25.2026.09.28.02.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 02:07:23 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 28 Sep 2026 11:07:21 +0200
To: Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Ye Liu <liuye@kylinos.cn>
Subject: Re: [PATCH v4 0/2] mm/vmalloc: fix vmalloc_dump_obj VA lookup
Message-ID: <arouSec6y9oVau10@milan>
References: <20260928-vmalloc_dump_obj-v4-0-6f288a431edc@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260928-vmalloc_dump_obj-v4-0-6f288a431edc@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_020725_981120_67B9C55E 
X-CRM114-Status: GOOD (  14.47  )
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

On Mon, Sep 28, 2026 at 04:15:53PM +0800, Ye Liu wrote:
> vmalloc_dump_obj() has two bugs that cause it to miss vmalloc
> allocations.
> 
>   1. PAGE_ALIGN() rounds up, pushing last-page addresses to va_end
>      and outside the VA lookup range.
> 
>   2. The function searches only one vmap node, but allocations
>      larger than 64 KiB may span multiple vmap zones whose VA
>      is stored in a different node's rb-tree.
> 
> Patch 1 fixes the alignment, patch 2 fixes the cross-zone search.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
> Changes in v4:
> - Patch2: Simplify find_vmap_area() to return va directly.
> - Patch2: Simplify locked_vn initialization in find_vmap_area_lock().
> - Link to v3: https://lore.kernel.org/r/20260924-vmalloc_dump_obj-v3-0-5bdee3da37b3@linux.dev
> 
> Changes in v3:
> - Patch3 drop.
> - Patch2 Extract find_vmap_area_lock as a helper to simplify the code.
> - Link to v2: https://lore.kernel.org/r/20260921-vmalloc_dump_obj-v2-0-73fceb3ed1c8@linux.dev
> 
> Changes in v2:
> - Use is_vmalloc_or_module_addr() instead of is_vmalloc_addr() to
>   avoid filtering module/BPF/execmem addresses. (sashiko-bot)
> - Link to v1: https://lore.kernel.org/r/20260916-vmalloc_dump_obj-v1-0-7aa402d224df@linux.dev
> 
> ---
> Ye Liu (2):
>       mm/vmalloc: fix vmalloc_dump_obj address alignment for last-page lookups
>       mm/vmalloc: fix vmalloc_dump_obj cross-zone VA lookup
> 
Both look good to me.

Thank you.

--
Uladzislau Rezki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
