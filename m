Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15625EEA853
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 00:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sKLM5SwPvQijCT23ybheD/LD8XEqcgWSxxn6m/p1rcg=; b=MaSuQiptHYfZIq
	vucDYZ0JdV9z9BmoS2R0eXwEF/kvmNUwuQdbR6LkHfSTscxZ4NZzUCCdZnWTYMkjfaF5wyLgWTbBp
	/U9XlEoHAk2NoCxZNWKyDJFC8DMRIlGLVgiJIc1BXPDxijVh8YQRs8H+NmK1Cg/DQ3ByeqsIuhMvv
	/CXxPTusJEynXYDB0xXvwdLwbQ20gDBYmjd2JrwC9GwYKemDFhqsj4/WYhK4iIwAR0WGbb8SPRp2t
	LgVLiGdQRE6THyUSLpzlVbvFmOy9bBaP48NpGx54xEbmHDfAqNvOZK62q5UTHvRkYBvQ4/MZB985k
	gqLt/0S8dPpKHDzSin0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqh8H-00000002n9M-2Pdq;
	Fri, 13 Feb 2026 00:34:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqh8G-00000002n9G-0lrB
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 00:34:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4493560018;
	Fri, 13 Feb 2026 00:34:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D413C4CEF7;
	Fri, 13 Feb 2026 00:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770942843;
	bh=b02J84ZDm/mvQQL0gYw8sAXPPl6ARimM8FJDFIIMhJE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pJAuRH6wYxE+aUos01e0VtF2nlAvNajbbA3+RaG/FnIE9cMZ45VEIYZvg17hLQT4Q
	 vjOH/qfHXmI1G8ixpiWP006JCwFSCmm8uw5oj39jEsMC+0sxQpE/UgQhTFgmm6Kqz9
	 Xe6pYNRO9+9jFswMs+xqrxLcHuUT+ypxsf3G+km/5ZbzvD2LQDC3Tqe9heOgcpt23+
	 MuEiQZ4d1NM80MCa+dB6cwNAM429psbv3IMz6vlJ6mGt2l7Xk+3Fq93TkOixvOzUgJ
	 Mk0//LhvYT8ldCz8FKgyAEL0bWWQvdR8jXf7cRUBI1fMWZoG0+hEbOnaIJvVAqUIOK
	 v883q6aTFkSgg==
Date: Thu, 12 Feb 2026 17:34:00 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    shuah@kernel.org
Subject: Re: [PATCH v2 0/2] riscv: Introduce support for hardware
 break/watchpoints
In-Reply-To: <20260106082021.2680658-1-himanshu.chauhan@oss.qualcomm.com>
Message-ID: <e0e40e14-e4f4-c3b3-4ebd-200052b529aa@kernel.org>
References: <20260106082021.2680658-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
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

Hi Himanshu,

On Tue, 6 Jan 2026, Himanshu Chauhan wrote:

> This patchset adds support of hardware breakpoints and watchpoints in RISC-V
> architecture. The framework is built on top of perf subsystem and SBI debug
> trigger extension.
> 
> Currently following features are not supported and are in works:
>  - Ptrace support
>  - Single stepping
>  - Virtualization of debug triggers
> 
> The SBI debug trigger extension proposal can be found in Chapter-19 of SBI specification:
> https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0/riscv-sbi.pdf
> 
> The Sdtrig ISA is part of RISC-V debug specification which can be found at:
> https://github.com/riscv/riscv-debug-spec

Can you fix the checkpatch issues with this series?  Please use --strict.

In the meantime, I'll add it as an experimental branch, until those get 
sorted out.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
