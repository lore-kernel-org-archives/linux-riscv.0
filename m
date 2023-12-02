Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408B1C4167B
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Dec 2023 11:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RRzthtxVoDn3iBxc5oczHVg3oo4J/bYEzsd9LKnnsCU=; b=GFA1Np4Ej9x6+t
	ip76kwMtJya3eaT8btHk77RuEve2ZD/eNSgl5Yh+fSRKzeuomcQHra7i0wo0i1uoSgVsoSZH+CC5Y
	9I8QcCSzGczGAHkCCAKL9CHTa5oHv4Q7P9JwCejKoc5t3DAlGmEitV/AIuZOA/zwBICdjPHEh9wpt
	NJN92Cq+geo0oB7b2yeRZhyXYKzxjiXP/d6hZg3di5TX5mEWfXF5yaN2UgVI1eUglXtobHBt+iHhf
	HGgNgqcCLUWZly+qtNQXWOLK/fUi5K8MarpunS3C8h17dPY8Vbj/2zRtlknEgrE9edmMr5vQun+mA
	PoxNIXv30HA0VITNPR4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9OMa-00FdXo-01;
	Sat, 02 Dec 2023 11:40:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9OMW-00FdXQ-0y
	for linux-riscv@lists.infradead.org;
	Sat, 02 Dec 2023 11:40:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8DD7DCE0B2C;
	Sat,  2 Dec 2023 11:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2E4CC433C9;
	Sat,  2 Dec 2023 11:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701517241;
	bh=DaUNBnJudQtx/0ecN0kp9sHu1Y4tp3r/amh8XiErTXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XxP7NmO7pW5CZG2wIqTdiWAbz/p7Cb69Elg+6qaP8cxRpDnbg7ygo36gqVDhTE1K/
	 9ky2d7U5rmERCih5gsM/OV7/Euy7yG9zru8jDb1Wo8AaCAmx16YQ8OWUrgYiZbRZU2
	 j3+lowrobiVTpvQ2b6+uTV66aCyeHH+QBwj9f/5P350NydZGYMw+Zqj8RrAblu9VK9
	 5QbS1cVL3ev75+j1EMolBAA/CKFvjCSTTpRLmXILv7TSu/sdW4GQJdCU2fgWr+hTQd
	 frwOzSl7jv2TwAURI820vGSlC+0FQ9hxApvrrEHa/s+BsP9WMC1YSfh+TShW4XOF4M
	 ZdQ7qFC8qFLAw==
Date: Sat, 2 Dec 2023 19:28:10 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] riscv: enable EFFICIENT_UNALIGNED_ACCESS and
 DCACHE_WORD_ACCESS
Message-ID: <ZWsUyjEx1fmXQEfW@xhacker>
References: <20231202111822.3569-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231202111822.3569-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231202_034044_524729_199B434F 
X-CRM114-Status: GOOD (  20.79  )
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

On Sat, Dec 02, 2023 at 07:18:20PM +0800, Jisheng Zhang wrote:
> Some riscv implementations such as T-HEAD's C906, C908, C910 and C920
> supports efficient unaligned access, for performance reason we want
> to enable HAVE_EFFICIENT_UNALIGNED_ACCESS on these platforms. To
> avoid performance regressions on other non efficient unaligned access
> platforms, HAVE_EFFICIENT_UNALIGNED_ACCESS can't be globaly selected.
> 
> To solve this problem, runtime code patching based on the detected
> speed is a good solution. But that's not easy, it involves lots of
> work to modify vairous subsystems such as net, mm, lib and so on.
> This can be done step by step.

Adding something as below here can make the series more clear:
So let's take an easier solution: add support to efficient unaligned
access and hide the support under NONPORTABLE.

> 
> patch1 introduces RISCV_EFFICIENT_UNALIGNED_ACCESS which depends on
> NONPORTABLE, if users know during config time that the kernel will be
> only run on those efficient unaligned access hw platforms, they can
> enable it. Obviously, generic unified kernel Image should enable it.

typo: s/should/shouldn't

> 
> patch2 adds support DCACHE_WORD_ACCESS when MMU and
> RISCV_EFFICIENT_UNALIGNED_ACCESS.
> 
> Below test program and step shows how much performance can be improved:
> 
>  $ cat tt.c
>  #include <sys/types.h>
>  #include <sys/stat.h>
>  #include <unistd.h>
> 
>  #define ITERATIONS 1000000
> 
>  #define PATH "123456781234567812345678123456781"
> 
>  int main(void)
>  {
>          unsigned long i;
>          struct stat buf;
> 
>          for (i = 0; i < ITERATIONS; i++)
>                  stat(PATH, &buf);
> 
>          return 0;
>  }
> 
>  $ gcc -O2 tt.c
>  $ touch 123456781234567812345678123456781
>  $ time ./a.out
> 
> Per my test on T-HEAD C910 platforms, the above test performance is
> improved by about 7.5%.
> 
> 
> Jisheng Zhang (2):
>   riscv: introduce RISCV_EFFICIENT_UNALIGNED_ACCESS
>   riscv: select DCACHE_WORD_ACCESS for efficient unaligned access HW
> 
>  arch/riscv/Kconfig                      | 13 +++++++++++
>  arch/riscv/include/asm/asm-extable.h    | 15 ++++++++++++
>  arch/riscv/include/asm/word-at-a-time.h | 23 ++++++++++++++++++
>  arch/riscv/mm/extable.c                 | 31 +++++++++++++++++++++++++
>  4 files changed, 82 insertions(+)
> 
> -- 
> 2.42.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
