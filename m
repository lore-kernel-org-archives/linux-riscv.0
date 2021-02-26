Return-Path: <SRS0=eKgb=H4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE22DC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Feb 2021 19:13:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E8AB64EF0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Feb 2021 19:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E8AB64EF0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lG6LCkpJndUSmcZDArzJ2PptcRHKvdiK0VoyQcYRPPM=; b=Jr3zWVzR1y7aEPVEDjgnTh4/C
	Vl3bIFQU/mhrizXWavsprcmRGuDB+UsvYtzJ+CA+oT2K9eJS2TtJ7Mx4Y868ZNzYLLdOy1HmwyIAO
	3Bo55vtygmf9C6CZLIj22Ij2ZsPftGJoAFSyJQ9qgQ36aMyUPwHNEl1Y9ynt5eCSFozuQc4+PNU7D
	E9SSZQBE1RrEb1AZwzuHVXMeHcS//cQxplFp/X/7aYe5jT7Atp4caL0IZqNTbvMnPFBAKhgvO97CC
	CizVHqOT3rUc6lv6w4RcFYpiw67gYOf1+tx42hplQBPAkltDF1lcVH1DFiYQECYwy4tnWN253j6Hf
	T60Yd+Svw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFiYY-0007Jq-GT; Fri, 26 Feb 2021 19:13:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFiYW-0007J2-1P
 for linux-riscv@lists.infradead.org; Fri, 26 Feb 2021 19:13:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B30C564E21;
 Fri, 26 Feb 2021 19:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1614366817;
 bh=Kfr0cv3tqktInH3qWJssH76pM9diuI7WbIFKMCvEcpY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VRn6HV9VKGXpux2I3XsqXD4ceCl8favZEBnQiEOsdeJJZFDI2Uw35b2D0PYUG3vqF
 BVr/WHIcvcaaVKR6zWyRm6KzIauPaXKLB+ChW/gXKxgDw+XFcnaMJSsheEEbmWnErg
 BdTAnUySyfN9zCf6IcRao30Q4AzeeebSxwhyMLcg=
Date: Fri, 26 Feb 2021 11:13:36 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 d01f2f7e35573049673b71e18be7abfe3f80323f
Message-Id: <20210226111336.91a89c0f5230eae69196f71e@linux-foundation.org>
In-Reply-To: <6039178e.nIA6K0eHFcbkwcNB%lkp@intel.com>
References: <6039178e.nIA6K0eHFcbkwcNB%lkp@intel.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_141340_287045_81881792 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 26 Feb 2021 23:45:18 +0800 kernel test robot <lkp@intel.com> wrote:

> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> branch HEAD: d01f2f7e35573049673b71e18be7abfe3f80323f  Add linux-next specific files for 20210226
> 
> ...
>
> page_alloc.c:(.text+0xe028): undefined reference to `node_reclaim_distance'
> riscv32-linux-ld: page_alloc.c:(.text+0xe02c): undefined reference to `node_reclaim_distance'
> 
> ...
>
> |-- riscv-randconfig-p001-20210226
> |   |-- page_alloc.c:(.text):undefined-reference-to-node_reclaim_distance
> |   `-- riscv32-linux-ld:page_alloc.c:(.text):undefined-reference-to-node_reclaim_distance

I assume the riscv randconfig managed to create a .config with
CONFIG_NUMA=n, CONFIG_SMP=y.  Configuration doesn't make a lot of
sense, unless someone has a single-CPU machine with cpuless nodes...

Could the riscv maintainers please test and merge this?

--- a/arch/riscv/Kconfig~a
+++ a/arch/riscv/Kconfig
@@ -314,6 +314,7 @@ endchoice
 # Common NUMA Features
 config NUMA
 	bool "NUMA Memory Allocation and Scheduler Support"
+	depends on SMP
 	select GENERIC_ARCH_NUMA
 	select OF_NUMA
 	select ARCH_SUPPORTS_NUMA_BALANCING
_



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
