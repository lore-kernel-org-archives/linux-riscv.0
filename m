Return-Path: <SRS0=IRtM=JI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE7DCC433B4
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Apr 2021 21:43:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C46E610C8
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Apr 2021 21:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C46E610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=GH2u5boROkMk6W+CV6oVHVwsaKuV5kz4MDd0u+z0Rk4=; b=KhhD7V7g3+UjGwOoQRkGhIFx3
	AWYRyseUw95Y95TN9Sw6aib8ulvhHzWXenhTfsM1915gsA9CnMrf5/mb2xsC1E1u3fczB4c+E/fRN
	3HRDEqYjb+YjNNlenA9JQCCc64ZEoqujZjhiYV/+SItB2rCCH/TUtM8j1PNSqwPO4qJKxwAO8+cuX
	W2AAcDPn2vwnIK175h1hNSxwr9u2gb1bFk/RVSNi8e61OHeMeMcCL1tYPvJkURND8HVEbCPlY7L8A
	zBN8ize5O9cgLGkR4D6oL9P9pWgBBe2hihXqBeuxUzhoN+VFwjctCL8lGFkIf/vV/8IMvLPPhBKyk
	HSp07yZ/A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVhr2-0059rr-Hc; Sun, 11 Apr 2021 21:42:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVhqz-0059rd-NV
 for linux-riscv@desiato.infradead.org; Sun, 11 Apr 2021 21:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=1dCDEuUqm+Loakms1/OAzWu6hpeIwGJsiXPVeDc4F7w=; b=eKAJSz+EEEqH8WsZ+XW8FhrGOX
 yAaIniUHqXGfq5uZeis99yJSZ0n7fqcILQE4FCsZBNqfHxJB52qgNOqMPNZw0RtlVP2MO9ivh7Sgt
 eYSktPrRX6Yvk4dbJMEuRmTNtrbiOzkxppkMTWQ8ZZ1u6iyzI5WxNkoPRBIKwLANgW8tbhV22lpFa
 d1hfmsWHksVbUPoZpq1yO4e9JJtteEfolaGWw7gKABphb6gEGIVHWPcTm7oAYcvt8YBhyQd9BcshO
 b/wsEUxFEXU3nN9NrVkbAqtmVny+UKMPzRWAK9MmceHLShWsbyTdkvq/naC4l3xlaMNmJsEZzc8HK
 0/90RcGg==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVhqx-005kvo-3N
 for linux-riscv@lists.infradead.org; Sun, 11 Apr 2021 21:42:48 +0000
Received: by mail-pf1-x436.google.com with SMTP id s11so7914953pfm.1
 for <linux-riscv@lists.infradead.org>; Sun, 11 Apr 2021 14:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=1dCDEuUqm+Loakms1/OAzWu6hpeIwGJsiXPVeDc4F7w=;
 b=obfiklTArIopBInnQ2Z0kZVRoKd5siJtzCrqZSRW9+co8lOYj+les5YtOZ55Kp+kOy
 zUXD7wyOOpxnrUDv2SJLuujqM5FViL1iltqKBv7mo/a8b74rf84ToePG31W55HF8QDeA
 atZKPuzh0h7PlTI8xC2Fs9et7Q+fw/ulPKwDORXsySIlavBwej74nB9Say0FMMsbSozz
 oZOSeCrenj9UeoF/ri7Q1+KoxRRYhwmkoU2tAtOIsEvAl6i1oRFLg1mYRC0/DW+F77/g
 URRO+drFGvT7dFWkuvrGOej3fTCHsSAYLD5noRZUfyu1E9mtAvdb5Uzhstokg92ZgH92
 OYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=1dCDEuUqm+Loakms1/OAzWu6hpeIwGJsiXPVeDc4F7w=;
 b=LqOjx3+Uk7gVj+9euazja5IgvYR+c7bfVhN7dK7bybKNh5cp55b+6rFc5pPdQN/Zhx
 8f/WaSbqsVBYBO5fSSir5i1DLXpV8KeJhLZWhmR18CqMINcYEv8fWTDAwUS6M+zN5n6m
 qA78lj8F29f4xQUfSKw/51PXU6/CRBmZzW2x+d8H72kDsh3o/XNAl9Ur4EjgkL4TNa7f
 OqNXXH9XwvCI6zUbieEVMsZktYdbXY0ANTt3O748aTsy8EbO+qG0KGZfsfHmdoFIoYW1
 mS2MgvmT9CR2h8pWOFjccVkYf0ix72Un6dIghcZ9HJapba01f9wzIX7BOcSI0tPnHHji
 DmrQ==
X-Gm-Message-State: AOAM533ZmKHcNh7EU5OJafdiGA4Dc2wCzwRtunz+aho1JaIjWalE/mVQ
 dNUrpF9aQesF5OMSI2nGOHDog4UqNNTtag==
X-Google-Smtp-Source: ABdhPJx8wA/PWknqDhTHB95nl6l9bx1eA/kSHPBe2jabziSDnJJ1qWyrL+wjyjzaqTBizQIi+PyaoQ==
X-Received: by 2002:a63:164a:: with SMTP id 10mr10876037pgw.186.1618177366084; 
 Sun, 11 Apr 2021 14:42:46 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u20sm7443283pfn.7.2021.04.11.14.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 14:42:45 -0700 (PDT)
Date: Sun, 11 Apr 2021 14:42:45 -0700 (PDT)
X-Google-Original-Date: Sun, 11 Apr 2021 14:42:27 PDT (-0700)
Subject: Re: [PATCH] riscv: Fix spelling mistake "SPARSEMEM" to "SPARSMEM"
In-Reply-To: <20210329031307.153285-1-wangkefeng.wang@huawei.com>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Atish Patra <Atish.Patra@wdc.com>, wangkefeng.wang@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-367bd95d-2b46-42d0-b2c3-9f2d5f050867@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_144247_159550_802DFCB4 
X-CRM114-Status: GOOD (  16.14  )
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

On Sun, 28 Mar 2021 20:13:07 PDT (-0700), wangkefeng.wang@huawei.com wrote:
> There is a spelling mistake when SPARSEMEM Kconfig copy.
>
> Fixes: a5406a7ff56e ("riscv: Correct SPARSEMEM configuration")
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 87d7b52f278f..7541e44cbb22 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -153,7 +153,7 @@ config ARCH_FLATMEM_ENABLE
>  config ARCH_SPARSEMEM_ENABLE
>  	def_bool y
>  	depends on MMU
> -	select SPARSEMEM_STATIC if 32BIT && SPARSMEM
> +	select SPARSEMEM_STATIC if 32BIT && SPARSEMEM
>  	select SPARSEMEM_VMEMMAP_ENABLE if 64BIT
>
>  config ARCH_SELECT_MEMORY_MODEL

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
