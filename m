Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9B5C54EAA
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 12:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=okFE8Th9ooUKRq2DYqr3sjecbuT1QrCo2hBoTlhtZeI=; b=BaY3UQgmyiRtj9
	yY0aw+w3LrVBGi2AL0wY2UUOn4bX5ooc9uAu5nJi/USdLPfDTLZhwF437iIjFlePkeW2g1sTwfFVg
	wlWCwurwHEFhOmyS9iPptWGK9zmSnEAQSCA+Q03VTgfuqLGazjVocIIukNFh28kWP5VK9QbxyiK8Z
	Mew2hma44rcAqD2UFPIBJpDQJbP9UUpd4+dFUmEQzsPl98t9PhHFclyBTF9QdRzXtDD6MdVrfPy83
	6gM9ZXG+M37+2KeCK0Kn/Nd6W+hJGAPuxUZaf8LrOalLBiFFaNOvt6n30pHDp57XYcyK9jHLpqh3k
	mU9sty7iMqcT272WyA8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOGS-00Ekqf-8A; Fri, 27 Jan 2023 12:55:32 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLNMA-00EKch-Sc
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 11:57:25 +0000
Received: by mail-wr1-x42e.google.com with SMTP id b7so4768939wrt.3
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 03:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AG2NHqPq2MDUFCXcsloiAHsEM2LV6SLFKyhZBS19eCI=;
        b=kncF5BzrGRAn4X6Gg3sdk0WdGgBCURzjftSUf83iGmrpia3GG3kcnjqfSg0kNq8q1W
         VH5Uq5kyYbnSJiKz6sWZxg/Kfz324t9nNc47PKEQfijXq3dFIVIupxz/7Vr0Jngh0diz
         XYyrTTi+W0t/nJ3gazNOyUm0E2cO3sVJ0MvS15fUx8+8HWyo4V0pMCqMI7by2WdM6kso
         xDd1eky4D64pAWVIdklNV2bHQN2Q3O+iJqfgwiDUUFsDIjBhJzUSEWvzaqdR1+90eNPx
         rNegK/+zwUxmGO+uKWAkBiM8g9XBBWszhpeJRy7lFU7JA1Kp3TvcPPuj5zQXkiTDgJ3y
         pH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AG2NHqPq2MDUFCXcsloiAHsEM2LV6SLFKyhZBS19eCI=;
        b=ndHdQqZuBXVHDXsxSDyFazP2cLYI2cLz/dBUApo2ssUJhbXWLyOkIMDpk8sfi0uUel
         tT7nKiNo05GonkBuINQoIEBWAVvKopiGU5c+wIbR8Ar4xCmwMtp954+Qgc3fTcQutnBh
         Tmw4B02T03CArHxuAXzX3QDYqSGUqdb+Dd7UYXPbFBTF+bp+/++j1UPm99X3aUJclvPw
         Odg/go4EkdjQx6UGw9y9jqGesBmpmq6/BjE+aq5TVgN3j3FuH4GcNyJCMyZFuRlvAYvk
         9qDv9JPn6RJiVEsPNlaumus3OuFD0ofhDA0HanpHzqjDbyhiZOeLbnpphT455MY/tGHT
         KrHg==
X-Gm-Message-State: AFqh2kqzBC7BelymmA3A6FfZKyfMpZI39O+zkkajk4lEqMglmOCJoL8q
	4NYAzAwKbYwjF0JW1eBEwYp2Ri29ZsoUmPyI
X-Google-Smtp-Source: AMrXdXvCpk1WdOvws9od3CJ2gO4rgLLAVMW+bO35wHLbTEMIt47NsTK6FfDOkHfepTZ8st/WHB3E7g==
X-Received: by 2002:a5d:5a85:0:b0:2bd:f5df:2689 with SMTP id bp5-20020a5d5a85000000b002bdf5df2689mr37641627wrb.47.1674820641209;
        Fri, 27 Jan 2023 03:57:21 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id h1-20020adfe981000000b002bfb02153d1sm4570262wrm.45.2023.01.27.03.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 03:57:20 -0800 (PST)
Date: Fri, 27 Jan 2023 12:57:14 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: guoren@kernel.org
Cc: tongtiangen@huawei.com, alexandre.ghiti@canonical.com,
	muchun.song@linux.dev, palmer@rivosinc.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH -next V2] riscv: mm: hugetlb: Enable
 ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
Message-ID: <20230127115714.467ymd5cpvi5h2ey@orel>
References: <20230127050421.1920048-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230127050421.1920048-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_035722_992941_6520E8F2 
X-CRM114-Status: GOOD (  20.41  )
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

On Fri, Jan 27, 2023 at 12:04:21AM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Add HVO support for RISC-V; see commit 6be24bed9da3 ("mm: hugetlb:
> introduce a new config HUGETLB_PAGE_FREE_VMEMMAP").

I found Documentation/mm/vmemmap_dedup.rst even more enlightening
about HVO than the commit message of 6be24bed9da3.

> This patch is
> similar to commit 1e63ac088f20 ("arm64: mm: hugetlb: enable
> HUGETLB_PAGE_FREE_VMEMMAP for arm64"), and riscv's motivation is the
> same as arm64. The current riscv was ready to enable HVO after fixup,
> ref commit d33deda095d3 ("riscv/mm: hugepage's PG_dcache_clean flag
> is only set in head page").
> 
> The HugeTLB VmemmapvOptimization (HVO) defaults to off in Kconfig.
> 
> Here is the riscv test log:
> cat /proc/sys/vm/hugetlb_optimize_vmemmap
> echo 8 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
> mount -t hugetlbfs none test/ -o pagesize=2048k
> <Try some simple hugetlb test in test dir, no problem found.>
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Link: https://lore.kernel.org/linux-riscv/1F5AF29D-708A-483B-A29F-CAEE6F554866@linux.dev/
> Acked-by: Muchun Song <songmuchun@bytedance.com>
> ---
> Changelog:
> V2:
>  - Optimize the commit log
>  - Remove riscv page compound_head fixup which has been merged.
>  - Rebase on riscv for-next (20230127)
>  - Add HVO author's acked-by
> 
> V1:
> https://lore.kernel.org/linux-riscv/20221023133205.3493564-1-guoren@kernel.org/
> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e2b656043abf..949974a38a41 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -46,6 +46,7 @@ config RISCV
>  	select ARCH_WANT_FRAME_POINTERS
>  	select ARCH_WANT_GENERAL_HUGETLB
>  	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
> +	select ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
>  	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
>  	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
>  	select BUILDTIME_TABLE_SORT if MMU
> -- 
> 2.36.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
