Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C58C4167D
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Nov 2023 17:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6bfkUIkpwNcGoSVeixcaX8vNMLu+JFZeZOJPb35HRBo=; b=iwUZWCybL9w1T8
	ts9XT5O1XlQL2Mll3ywUkC9pOqdLZNurJoV50rQU26TjadiC955LqT9izeTLNGjvWhv67yKglQT8W
	dRYVMJL0ZlpUbpdA1G+KBpcpKJC1IrjZbWIABBdWRjDdKH1afIAeAGZmaA+zOeMou0U5w6D7qE1XL
	jjCGfy7j6Qb+jK0Ey1GL/2+xN3blYT8iMR+Tln9Hsx6jgt1o5Cj32nWfsBDAJMwzarFRGLpwpr8+c
	kqDvpk5JDW4fAQ0QyX1MD4LMPH53k7UrWLx7sOAdNqR//yS9SOJUGwiPfoQTbN7q7QA3PPxSlHfpv
	xpZYpvR2jUokWfXARkKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0mJh-004PHc-1j;
	Wed, 08 Nov 2023 17:26:13 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0mJe-004PGO-1n
	for linux-riscv@lists.infradead.org;
	Wed, 08 Nov 2023 17:26:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 87CC1CE0DFA;
	Wed,  8 Nov 2023 17:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D3AC433C7;
	Wed,  8 Nov 2023 17:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699464366;
	bh=q1GZXP4sRw+ul4Jtvwv3+dY6DViWo2qiD2nXGTncu0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aBwvdQkBjjEAYpVllBsIU7M5WlIOmdiQjZIdDFX6qEtra8NVzjISX0k8KEDpsYEvA
	 yQ9Cqc0zNPbGx9lWDkc4DiLCCg3zHmtDSsOuEhISI3SRcKZ3mmIwSQE0Ix6qm6jzLd
	 vcbomFvpb8Tl+K9sSvbWWCPc9FCT1TA91xq7eC/5dX3kVFj0l7V1B11JgBqUjIGr1f
	 ZQt0VmB7hZLgDjYJrdiG7sUP04AUQxEdUOeE0wbE7oxQtqCYYLhrGJqFSb6kVDjkbP
	 TIHBPYSVK67agcRwjakHjg8WOuQT1pNSSZ4PI7p9LvzaWzirO4x+hh6V4Hyh/WEAt2
	 nx56PWQ2sZrAg==
Date: Thu, 9 Nov 2023 01:13:48 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] riscv: errata: thead: use riscv_nonstd_cache_ops
 for CMO
Message-ID: <ZUvBzDytyoz/Hqvk@xhacker>
References: <20231012143746.454-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231012143746.454-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_092610_788245_C17FB327 
X-CRM114-Status: GOOD (  21.57  )
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

On Thu, Oct 12, 2023 at 10:37:44PM +0800, Jisheng Zhang wrote:
> Previously, we use alternative mechanism to dynamically patch
> the CMO operations for THEAD C906/C910 during boot for performance
> reason. But as pointed out by Arnd, "there is already a significant
> cost in accessing the invalidated cache lines afterwards, which is
> likely going to be much higher than the cost of an indirect branch".
> And indeed, there's no performance difference with GMAC and EMMC per
> my test on Sipeed Lichee Pi 4A board.
> 
> Use riscv_nonstd_cache_ops for THEAD C906/C910 CMO to simplify
> the alternative code, and to acchieve Arnd's goal -- "I think
> moving the THEAD ops at the same level as all nonstandard operations
> makes sense, but I'd still leave CMO as an explicit fast path that
> avoids the indirect branch. This seems like the right thing to do both
> for readability and for platforms on which the indirect branch has a
> noticeable overhead."
> 
> To make bisect easy, I use two patches here: patch1 does the conversion
> which just mimics current CMO behavior via. riscv_nonstd_cache_ops, I
> assume no functionalities changes. patch2 uses T-HEAD PA based CMO
> instructions so that we don't need to covert PA to VA.

Hi Palmer,

I know you are busy ;) Just want to know is there any chance for this
series to be merged for v6.7?

Thanks
> 
> Hi Guo,
> 
> I didn't use wback_inv for wback as you suggested during v1 reviewing,
> this can be left as future optimizations.
> 
> Thanks
> 
> since v3:
>   - collect Reviewed-by tag
> 
> since v2:
>   - collect Reviewed-by tag (but missed them in fact)
>   - fix typo
> 
> since v1:
>   - collect Tested-by tag
>   - add patch2 to use T-HEAD PA based CMO instructions.
> 
> Jisheng Zhang (2):
>   riscv: errata: thead: use riscv_nonstd_cache_ops for CMO
>   riscv: errata: thead: use pa based instructions for CMO
> 
>  arch/riscv/Kconfig.errata            |  1 +
>  arch/riscv/errata/thead/errata.c     | 69 +++++++++++++++++++++++++++-
>  arch/riscv/include/asm/errata_list.h | 50 +++-----------------
>  3 files changed, 74 insertions(+), 46 deletions(-)
> 
> -- 
> 2.40.1
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
