Return-Path: <SRS0=v94U=NR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73091C4320A
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Aug 2021 15:04:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A5AB60F4C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Aug 2021 15:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A5AB60F4C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=1d3Mk/hMaXMkohHyAzFH/wkUtJ76xwBXvjZj5TgCO7A=; b=KMsTV1qO3bPW2xNdhIpKIyVqzX
	z6L7jJ4ztHICd9tkiCQLkZcWRZA1LvK4bES5FLZM3M7Dw5aunPm22RX5kDxFJXTfNV6CdEctm1zYq
	LdyKm8AjOOcliJaOqgEw7fkGiMmJjE6lBSjmBhMDL42GBZHzfoxjxY+QaA/aeE8oaoOQ23h4VFvw6
	Ri97T0K1qBCEqijY1sAe0+4XuIibtznuqpPumhlCyuALAef9LvDjlKsPuw9tiu+LYLZmb+AF1Otkj
	CVBCpv4LqPK9hlOCz+j02S185cZjrEyIxyp3LTu1cY1dsQ8ah0sagNmWzidYiPjGaVZZUH4pfv5BK
	RAO72aXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJGvV-00ARUW-EB; Thu, 26 Aug 2021 15:04:21 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJGvL-00ARS1-SZ
 for linux-riscv@lists.infradead.org; Thu, 26 Aug 2021 15:04:14 +0000
Received: by mail-pg1-x52e.google.com with SMTP id w8so3320722pgf.5
 for <linux-riscv@lists.infradead.org>; Thu, 26 Aug 2021 08:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=JJP+nPxJKAVqphBV0U7M3pCSiiD75owxGS4FYqm3izI=;
 b=l+MJTxG08ZAAwZWn3FOyG34qn8pMD1qp2qC273n9plefcBzQ5AlIH02wRx/yTvktU+
 Qwa3buYuQShXoJWKUnMtYX/MpE6LRuh+fVZeJUITUdc5QVdTQcZLqsqiq1BpXrXtto1Q
 m+jcPkPcaKB47HxEJ4B7ef35PWwMMt2jsAG9lpSF08gz89bKMJwh8E0sD42i3Tqrh7lM
 XfGNKOY8wrtAdbWMR2oYg0hurCNJ+PoAH+xHTAsLGevSOdTy6YsGPh3/y22zN54767Y3
 hdaffOGu0LHrUv0INy27vxIQhlEtWvd6GAZV7IGlLST49dUj0GJ/1Koo+NqJQOI3By5T
 UT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=JJP+nPxJKAVqphBV0U7M3pCSiiD75owxGS4FYqm3izI=;
 b=lSqyO+fKAeMqWbNZvgksO0pNpgCcdzimdI8GPbsr/e0W8JZdwWLtGIcl7c0pCYmOn0
 ldlU0jlnGgIrONoPyBxISk9JpJHvibq0pBvqcKbxg7dO/GjopHvuSq15qXGMPg8PS5XX
 S9ZAFwQq8ZPkga7ROsfwL17EFgGISKhSf/GUrkhiaR6vlBUl7oFZg7F8ifjBJtNnpLM3
 cK00CPDB4AsPG0UX4yYaOwBjcWU9WlxSYeaVASLyF/MkbnTzwOvXGGhn3t9EjFa+Yii/
 8ztrQaWgdriWoXyMZ0Vuez3ETDjlNpxTYTejo21btolVvuKjoFbzdm+8LpvwMc4I3QGo
 bdvw==
X-Gm-Message-State: AOAM531KE/Dw54URO3vU5M1QMDu6MTGTUuQhZzQ9vSpqzoh2aoQJ1uiL
 t1RyDUZDYiAQVZ9ueuYDcQaV2QqV2G6lUniF
X-Google-Smtp-Source: ABdhPJxxKZ6y5f5P9pt1kCaUiIk5aDU6TW7t3bZVuv4CM0V9Y65ZDvZGSyDAqIaCmNHmBPPmjX+Yng==
X-Received: by 2002:a65:624b:: with SMTP id q11mr3760597pgv.232.1629990250430; 
 Thu, 26 Aug 2021 08:04:10 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 66sm3417160pfu.67.2021.08.26.08.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 08:04:09 -0700 (PDT)
Date: Thu, 26 Aug 2021 08:04:09 -0700 (PDT)
X-Google-Original-Date: Thu, 26 Aug 2021 08:04:00 PDT (-0700)
Subject: Re: [PATCH] riscv: add support for hugepage migration
In-Reply-To: <20210810135105.2827214-1-chenwandun@huawei.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wangkefeng.wang@huawei.com, guohanjun@huawei.com, chenwandun@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: chenwandun@huawei.com
Message-ID: <mhng-61de2fa3-208d-4d02-8264-a8781b5bdee0@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_080412_645198_F4DD03C6 
X-CRM114-Status: GOOD (  16.41  )
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

On Tue, 10 Aug 2021 06:51:05 PDT (-0700), chenwandun@huawei.com wrote:
> Generic arch_hugetlb_migration_supported can provide appropriate
> support for hugepage migration when enable ARCH_ENABLE_HUGEPAGE_MIGRATION,
> so enable it for hugepage migration in riscv.
>
> Signed-off-by: Chen Wandun <chenwandun@huawei.com>
> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 8ce8382748d5..8bfc89589838 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -13,6 +13,7 @@ config 32BIT
>  config RISCV
>  	def_bool y
>  	select ARCH_CLOCKSOURCE_INIT
> +	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
>  	select ARCH_SUPPORTS_ATOMIC_RMW
>  	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
>  	select ARCH_STACKWALK

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
