Return-Path: <SRS0=LlRU=HV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A250C433E6
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Feb 2021 07:15:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8D7D64E90
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Feb 2021 07:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8D7D64E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=x58vg7VYwxGOxD9VURBItI+Fv81gtSPBKOdYe6lsPME=; b=QchktaDG5HFQtP8yMdMegelk4
	KtYgSu+8s5H3z58OEfvF3tVTYRG4s0JegXZ7CL0s7a3P519jLHK9B24YLb0djL/cgbQk7QPFwyXpi
	hkQCOHeKoGemED30MXYHLQqJQvNSk8bWUb1Abra16qalhXo1B0hXxwZOCvBOWjnzhZ7imbqksAzLN
	QWlITGkVW2XzbPD7mubbSNVK2/n+ZkT41+y1xR4SW0Z5i7rlcsuaks5bJwHFrDcxxZzhTMITiHN+d
	FHlFkJE7UoumPenzfc0Be4Sy6EPnkmUSdoJHOe1Bwycs+odh5qDNcv6YAf8298IjFiD/c6/0AfBLt
	nEELMdq/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lD00o-00037z-PG; Fri, 19 Feb 2021 07:15:38 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lD00k-00036S-5J
 for linux-riscv@lists.infradead.org; Fri, 19 Feb 2021 07:15:37 +0000
Received: by mail-pj1-x102e.google.com with SMTP id d2so3608570pjs.4
 for <linux-riscv@lists.infradead.org>; Thu, 18 Feb 2021 23:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=/1rLdPCeqUhTqZCegDUBtBMImOQ0GQYhHwgJnhElF2E=;
 b=R82jBLFXeJYAoGV6oU40XONPE91gxgtHoBgi2+M6DGEGhHC6ZG1WUwGiDXMtcAsKGx
 NGeVjU2yY1M+pkq2hQDY5KB43jRCHlRQLrS6lwtk3nGflVhrVSXPeVscaVDU7zrf/8Nb
 JMFxqP1bxzohyC94qIIdulp283XXvBuODuLCtTOQXSvWYKMCmg6habQyT18+YPd+qqyq
 JK66prSo2V1iEp+Miopub8vy/bGCyPwwOwav65o5h83dv8/IoW1lOD1rFPB5QRqRMrff
 8X49+3DoUaJZzPNWbyWi2rx4rohhFHv7E24pxv+NCJWzH+yDexwzUr25Hah7UVLqDhcK
 T7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=/1rLdPCeqUhTqZCegDUBtBMImOQ0GQYhHwgJnhElF2E=;
 b=GUMascFKiyFSKVGBtqA9WN7vBqquoppaAHZahcx+DR3nmiuCzv21hVQ2Q22wMB49Dt
 YJS1RnM36cp//iPc5Xa5UskhflpBzFp6kicPNUVoJrv1urb1zScDZQ2Jrtv/cZ8TDZqS
 y1eCh0mXrDb3eZqJFxhmEiCXuxJBcVlUu3MWMrRMoFEA32Ia3UbN78DSAbMuhnLoFznT
 PGsSPwJzBDwMlzBIPBmk5ONRNfQ9RKL6zsTD+suEf1PNzGjrxeTMZ7PJivzvc/W2t7Bx
 RivcJFygT23yq73CesCutMn2N/XwVO35rC+xvW0Ydye8DzyEvsCpLj1CciVaO6Iw+AYK
 NBDg==
X-Gm-Message-State: AOAM531FRnvwWfqhHd8Tx6r/Xas+nFxkAt5QiZzpWeQLePUFsNv2Tthh
 K7z3UEPq50gYABignlJZBafeK++DyEfGGSlL
X-Google-Smtp-Source: ABdhPJz0al0nmHffH81PaXmPZbcq/K7LwwNRxnfTKlKeRBl5RpfGCqCfNO5EJmTm/5CFAcda59umwg==
X-Received: by 2002:a17:902:c948:b029:e2:e8f7:abd9 with SMTP id
 i8-20020a170902c948b02900e2e8f7abd9mr8141921pla.18.1613718930640; 
 Thu, 18 Feb 2021 23:15:30 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w145sm8220170pfc.187.2021.02.18.23.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 23:15:30 -0800 (PST)
Date: Thu, 18 Feb 2021 23:15:30 -0800 (PST)
X-Google-Original-Date: Thu, 18 Feb 2021 22:30:51 PST (-0800)
Subject: Re: [PATCH] riscv: Remove unnecessary declaration
In-Reply-To: <20210207081053.94133-1-wangkefeng.wang@huawei.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-a9da9132-89c0-4adb-bfce-e513a5dbaa93@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210219_021534_248803_B3A35E47 
X-CRM114-Status: GOOD (  17.52  )
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
Cc: Atish Patra <Atish.Patra@wdc.com>, linux-riscv@lists.infradead.org,
 wangkefeng.wang@huawei.com, Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 07 Feb 2021 00:10:53 PST (-0800), wangkefeng.wang@huawei.com wrote:
> max_low_pfn and min_low_pfn are declared in linux/memblock.h,
> and it also is included in arch/riscv/mm/init.c, drop unnecessary
> declaration.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/include/asm/page.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 64a675c5c30a..adc9d26f3d75 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -97,9 +97,6 @@ extern unsigned long pfn_base;
>  #define ARCH_PFN_OFFSET		(PAGE_OFFSET >> PAGE_SHIFT)
>  #endif /* CONFIG_MMU */
>
> -extern unsigned long max_low_pfn;
> -extern unsigned long min_low_pfn;
> -
>  #define __pa_to_va_nodebug(x)	((void *)((unsigned long) (x) + va_pa_offset))
>  #define __va_to_pa_nodebug(x)	((unsigned long)(x) - va_pa_offset)

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
