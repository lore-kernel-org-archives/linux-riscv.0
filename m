Return-Path: <SRS0=WUGv=KU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B95C2B9F8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 10:33:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24E9B61181
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 10:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24E9B61181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h3ftDclI9KrLA5jHqdVzAY/ST7JVjTsunIficCzb20M=; b=u4JaAcPgRPRg8T
	+hQ9w7tHk5MwcjQd3o38JOTupryNjJmH5a7/mMQ6WDnpboB22NQlRGCm+fwB2XnNNlRoHrLQKpLxO
	6CVdOOaf15wXy0Zfg4g3kI+URFc/biyzlj6pn+NM3WCrxBvmNU0UZdBLROYBcKIMZdnn2rqR7oE//
	3rLtLoORWtJT1AmaSgiSrAxCpahJMJZbfuQdvjGpZg+/uK6VkeaXCAEHrttB40EJQQ3DvkzyrNTzu
	aPLa9EUI6Ji6R34UknGhGjml44j6dYSjDQm5ETSxDUiSeBZEhIilb6RxAreXDszknE5Ac4dt07+Jn
	EMOmpiQ2Dbj8dE8nJgWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llUNW-004ZnW-2D; Tue, 25 May 2021 10:33:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llUNT-004ZmC-2y
 for linux-riscv@lists.infradead.org; Tue, 25 May 2021 10:33:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D279A6135F;
 Tue, 25 May 2021 10:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621938814;
 bh=Ko9OW2xC/ai6cW5nxuzYSepYUMdmcDhImMaQHNUt4GU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u4RVyL+7FSjZtsX7r9rxHtTCssZ+FSunKqJIhJTzaw8YlvWznlde3vYlfZbIpF60m
 yQgFbMSALJNlefBsKkLBKrzgThn/6zIZcqK4MbbsPwRok5/2bSGiEt+IwKBlJk9fe0
 CeUrgp0qwWudZozH9zxIpl24wuAJ449j9aEzd5ZGLSqYjZQuwgFl4yGNc0Rf9fS0mn
 XMs9GjkBQjMYHJLlrG8URw36vTGYy3Kl1SDfM1dRj/G0p9LPGlFeXQkZQGkQhDZJOL
 nzMwdabh+bzX1ZruB+J2ISA2Y6nt32ZI4AFKzptaMitsiVSzduIGXGXsSC/fxJ75jy
 tSKHsaVQvjVdg==
Date: Tue, 25 May 2021 13:33:26 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Nanyong Sun <sunnanyong@huawei.com>
Subject: Re: [PATCH -next] riscv: TRANSPARENT_HUGEPAGE: depends on MMU
Message-ID: <YKzSdtoaeL9mfokF@kernel.org>
References: <20210525001302.27779-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210525001302.27779-1-rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_033335_218575_5601CE96 
X-CRM114-Status: GOOD (  18.59  )
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

On Mon, May 24, 2021 at 05:13:02PM -0700, Randy Dunlap wrote:
> Fix a Kconfig warning and many build errors:
> 
> WARNING: unmet direct dependencies detected for COMPACTION
>   Depends on [n]: MMU [=n]
>   Selected by [y]:
>   - TRANSPARENT_HUGEPAGE [=y] && HAVE_ARCH_TRANSPARENT_HUGEPAGE [=y]
> 
> and the subseqent thousands of build errors and warnings.
> 
> Fixes: e88b333142e4 ("riscv: mm: add THP support on 64-bit")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Nanyong Sun <sunnanyong@huawei.com>

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
> I really think that mm/Kconfig should have "depends on MMU" for
> TRANSPARENT_HUGEPAGE, but commit 15626062f4a9 from 2012
> ("thp, x86: introduce HAVE_ARCH_TRANSPARENT_HUGEPAGE") thought
> differently. I.e., mm/Kconfig should be protecting all arches
> against this Kconfig problem.

We could 

diff --git a/mm/Kconfig b/mm/Kconfig
index 02d44e3420f5..85bc8bf32e7b 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -403,7 +403,7 @@ config NOMMU_INITIAL_TRIM_EXCESS
 
 config TRANSPARENT_HUGEPAGE
 	bool "Transparent Hugepage Support"
-	depends on HAVE_ARCH_TRANSPARENT_HUGEPAGE
+	depends on MMU && HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select COMPACTION
 	select XARRAY_MULTI
 	help

but in a sense HAVE_ARCH_TRANSPARENT_HUGEPAGE should imply that MMU is
selected :)

>  arch/riscv/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20210524.orig/arch/riscv/Kconfig
> +++ linux-next-20210524/arch/riscv/Kconfig
> @@ -106,7 +106,7 @@ config RISCV
>  	select SYSCTL_EXCEPTION_TRACE
>  	select THREAD_INFO_IN_TASK
>  	select UACCESS_MEMCPY if !MMU
> -	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT
> +	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
>  
>  config ARCH_MMAP_RND_BITS_MIN
>  	default 18 if 64BIT
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
