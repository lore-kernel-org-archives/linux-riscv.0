Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EABC43217
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 17:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0vv6aA9gvPx9582DX2q1FG6Vkxi6YQGTdAjLiJQ9JbE=; b=Z6hOt4xeSYSK8y
	Jg6uL1+nCCZGwt5uFa2ZGoHypjAXyXmXV7B7jpd94Rgb5Jc1weJFoGr0jUS1MNyPS8f/bl1FOpmHG
	SU2cWF6MPL3ToMbnSMm1b8+BJauUgwMh1BfcW4ohZzqfZsB57VA54Z/4zFE8LBay2gtDeKhDda1Ay
	LT+MEySpOqoQl1HhhMZsoDWFKPQ0fnJbTeGJliEmoOMH4jml4AqlKsI5PSj9NVkEXxKVI4NTOjt5d
	jzU603H7NClgrXrqOy4m+rGAZrF8BcZbsih+wTaSzSnvYKB/XXrSsrN4tTVt5wJSAQUYKwXDVDBeq
	AjYM8sFJ6UGbZNRUIWOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrNFG-003C2G-8E; Wed, 18 May 2022 17:13:58 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrNF5-003BzK-1I; Wed, 18 May 2022 17:13:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 28AB8B8200E;
 Wed, 18 May 2022 17:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C66C385A9;
 Wed, 18 May 2022 17:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1652894023;
 bh=9tQumf5hmMksHJMd0ddXQO4pdkF9lxtXV2d4XMaXLMg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=1oFQORUH8huv1XWXl2XhwSl42RUHMTVMSUF7MmvBgM1HLhRrMGez+Fyr6OoiM2x+s
 jnKUKKp268ix7GKNohFVUZ0gACXAWGr0IQXMoQV2FPJw+yFPDX/v3BNy3B6zB0dgBH
 uhYm1Jy8z93pfIewz5emoCFiPAMatvkJ7i8n8VIw=
Date: Wed, 18 May 2022 10:13:42 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Tong Tiangen <tongtiangen@huawei.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Palmer Dabbelt <palmerdabbelt@google.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 wangkefeng.wang@huawei.com, Guohanjun <guohanjun@huawei.com>, Xie XiuQi
 <xiexiuqi@huawei.com>, linux-mm@kvack.org
Subject: Re: [PATCH -next 2/2] arm64/mm: fix page table check compile error
 for CONFIG_PGTABLE_LEVELS=2
Message-Id: <20220518101342.b1b17ab43331f31df33780ae@linux-foundation.org>
In-Reply-To: <YoUetqxz7Q38RLAu@arm.com>
References: <20220517074548.2227779-1-tongtiangen@huawei.com>
 <20220517074548.2227779-3-tongtiangen@huawei.com>
 <YoUetqxz7Q38RLAu@arm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_101347_274200_256D74C3 
X-CRM114-Status: GOOD (  16.29  )
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

On Wed, 18 May 2022 17:28:38 +0100 Catalin Marinas <catalin.marinas@arm.com> wrote:

> On Tue, May 17, 2022 at 07:45:48AM +0000, Tong Tiangen wrote:
> > If CONFIG_PGTABLE_LEVELS=2 and CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=y,
> > then we trigger a compile error:
> > 
> >   error: implicit declaration of function 'pte_user_accessible_page'
> > 
> > Move the definition of page table check helper out of branch
> > CONFIG_PGTABLE_LEVELS > 2
> > 
> > Fixes: daf214c14dbe ("arm64/mm: enable ARCH_SUPPORTS_PAGE_TABLE_CHECK")
> > Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> 
> I'd drop the fixes tag here since the patch is queued in the mm tree and
> AFAIK that one doesn't have stable git commit ids.

MM tree is at git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm

Commit ID's are stable if a commit is in the mm-hotfixes-stable,
mm-stable or mm-nonmm-stable branch.

Commit ID's are unstable if a commit is still in the
mm-hotfixes-unstable, mm-unstable or mm-unnonmm-stable.

I move patches from -unstable to -stable after they're considered ready
for it.  The delay is very variable, depends on how things are coming
along with that patch(set).



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
