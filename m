Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366EEC0218F
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Feb 2025 02:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bXkPUkWoFzRp64a89IHiOWRI7g5jxdvZTP+ZW2li8ks=; b=OGWktXDIgeQ+hp
	COCagANi/MTgm4BQ6Z6gv8Z3TiDfh79u6orF/OYx7phdkzuqLT/Zf6ouQ8+dtBKqdcIWwW3Wn7DvE
	Lg8E5e6BMC+Zcq2bT/a/VedcJVyKxwjnCYEvozpImjMyOkgq9/ohqCcy2LtQ5VTK1p3fEfVD7Hkz4
	1fQINKCDPH7kg6sZ5SLxnxFqFOH5ris4UAK1hopAZnNYW8+sVE1MnrqX7PbTMkIJTWG5eHnJBtBqk
	qVEpUvqFWdf78fFYgpkDZN5OglWXPBN3W7dzB9eUaqGkEk+q1KNqOFfW1+PBcV6Y1UHapOpRjOn9J
	JotLekhSXrDWAX8QW0pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1te2nr-0000000BmKD-13Ly;
	Sat, 01 Feb 2025 02:00:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1te2no-0000000BmJj-2cSv
	for linux-riscv@lists.infradead.org;
	Sat, 01 Feb 2025 02:00:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 923F9A425DB;
	Sat,  1 Feb 2025 01:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5CB2C4CED1;
	Sat,  1 Feb 2025 02:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738375205;
	bh=8+Yvu1B31Io7bxwbYSLyo4BE+K1XATyXjhCXbIokbfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p0qpKd/ggNIzFPyMp+Jh3tXcsvoN2bsrJd6GxeYsFs7mggC8kj3bxFlDb75IfCVBa
	 turmrAwp+ufe4V4E5142iXLiOtL7AiW42n+5dMfPMKqJTXsO34JK+Du+4TEsCB9SJg
	 ahATOUL6Yq99GXtlNC4b1LJ6onk0hKclSzle5DF58NuVyzjfJvYV83wC5oO/1sB1PO
	 Albc0EDVuMQrcXaXCL3F42wNJyoDlkGvWppP6IE1/h/GdSY/BOrSzkurFOv6DmMPLc
	 lnQrxqZxiUqWoUGfkvl93PYFWxK5OPCp3HNHtQCFwEw2JXkJIaLbPIaMWBQzdR34aZ
	 VR8Gy7ZeLWE1A==
Date: Fri, 31 Jan 2025 18:00:03 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V Patches for the 6.14 Merge Window, Part 1
Message-ID: <20250201020003.GA77370@sol.localdomain>
References: <mhng-5051a418-807c-4539-91b2-255492eae79f@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-5051a418-807c-4539-91b2-255492eae79f@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_180008_729131_4FD0C2F4 
X-CRM114-Status: GOOD (  12.04  )
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

On Fri, Jan 31, 2025 at 12:08:40PM -0800, Palmer Dabbelt wrote:
> The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:
> 
>   Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.14-mw1
> 
> for you to fetch changes up to 101971298be2aa4706c8602bd81066a0f6f2ced5:
> 
>   riscv: add a warning when physical memory address overflows (2025-01-29 18:36:09 -0800)
> 
> ----------------------------------------------------------------
> RISC-V Patches for the 6.14 Merge Window, Part 1
> 
> * The PH1520 pinctrl and dwmac drivers are enabeled in defconfig.
> * A redundant AQRL barrier has been removed from the futex cmpxchg
>   implementation.
> * Support for the T-Head vector extensions, which includes exposing
>   these extensions to userspace on systems that implement them.
> * Some more page table information is now printed on die() and systems
>   that cause PA overflows.

FYI this pull request added a 90KB ELF binary at
scripts/selinux/genheaders/genheaders in the following commit:

    commit 101971298be2aa4706c8602bd81066a0f6f2ced5 (riscv/for-next)
    Author: Yunhui Cui <cuiyunhui@bytedance.com>
    Date:   Wed Aug 14 14:26:25 2024 +0800

        riscv: add a warning when physical memory address overflows

Presumably a mistake, or else something a lot more interesting.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
