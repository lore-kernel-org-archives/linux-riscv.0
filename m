Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A26EC636D3
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 10:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wb8Nt8p1pSHk6HKxULn5azSqSEOnie2j0zzDEIqPqnA=; b=n4lnbUVR6v/Bge
	LT1+gcsYRCnE5gFn0GNX1GTtpUw7H+lGx5vOKfgobZQtNLi24gQj8PGqsoxs3eAVJ4snjSZU0eCIq
	sDEhrmBCBELyQLG1DQbSwRAo/uV+aKDpJldN2gOzKh0/lS938JhXL1e/BlJfoQQGW2NtYCEUSwNXY
	XFDhxMqU8YCHj+hmsPsW6tBwyr8xrp0KhzpPxiYcY+v7KSoF8fR9S12KLdI7ubHPakwXx9jU67LAm
	i9i4aDpS1A7+Mg0GBOfOuJ/WZNPg4sWXjLrxR9NeK7a89AYRBx/tcANOyXpE+yhBubD78dm/vaFyn
	VYC13SU32cUogUO/omDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNAhT-00BKok-DQ; Wed, 01 Feb 2023 10:50:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNAhQ-00BKnj-9a
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 10:50:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F064F2F4;
	Wed,  1 Feb 2023 02:51:22 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.12.10])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C84A33F882;
	Wed,  1 Feb 2023 02:50:38 -0800 (PST)
Date: Wed, 1 Feb 2023 10:50:33 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>,
	Dinh Nguyen <dinguyen@kernel.org>, openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
Message-ID: <Y9pD+TMP+/SyfeJm@FVFF77S0Q05N>
References: <Y9lz6yk113LmC9SI@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y9lz6yk113LmC9SI@ZenIV>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_025044_404534_214034F7 
X-CRM114-Status: GOOD (  10.72  )
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

On Tue, Jan 31, 2023 at 08:02:51PM +0000, Al Viro wrote:
> On x86 it had been noticed and fixed back in 2014, in 26178ec11ef3 "x86:
> mm: consolidate VM_FAULT_RETRY handling".  Some of the other architectures
> had it dealt with later - e.g. arm in 2017, the fix is 746a272e44141
> "ARM: 8692/1: mm: abort uaccess retries upon fatal signal"; xtensa -
> in 2021, the fix is 7b9acbb6aad4f "xtensa: fix uaccess-related livelock
> in do_page_fault", etc.
> 
> However, it never had been done on a bunch of architectures - the
> current mainline still has that bug on alpha, hexagon, itanic, m68k,
> microblaze, nios2, openrisc, parisc, riscv and sparc (both sparc32 and
> sparc64).  Fixes are trivial, but I've no way to test them for most
> of those architectures.

FWIW, when I fixed arm and arm64 back in 2017, I did report the issue here with
a test case (and again in 2021, with maintainers all explciitly Cc'd):

  https://lore.kernel.org/lkml/20170822102527.GA14671@leverpostej/
  https://lore.kernel.org/linux-arch/20210121123140.GD48431@C02TD0UTHF1T.local/

... so if anyone has access to those architectures, that test might be useful
for verifying the fix.

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
