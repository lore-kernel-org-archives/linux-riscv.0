Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0156ECDE015
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=03i8H61lSbb/Hox4Hbf5vvl9B1bi4izWIEnNPHy9vbo=; b=muM5kC79hXNMhs
	Li1x2rCIjF5AaTkDiCCZruvIwTxfsvV9rR1E5fcg20NujVTKKQLPwoQmSNG0OI7k2p86nFm24Y6X0
	KLAjVU6I5PM+kaG7ML13G9Fnc1Pmr0aDoZXQs4VmJbLE96FksmQpYFzvGmazuMnnJLIgcan7mmIgK
	Dk+sMYkLwSD8s0AbAzWmtO3tnink+LMNpWEdev0icWTmi9unp7Wz12LveosX3Jo7lJAPmJZ7oXI4y
	QXOmRGmQR2C79RQ3C5KE3Wol6Ze0DdIAVfl6GFWV29JaN+mUcm3pvCeoC4qkhszKJig2PQKnaqjxH
	3fWGQYMhfsWAcfk7DIPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oL-0000000An70-2XnL;
	Fri, 26 Jun 2026 08:21:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oG-0000000An1V-2abE;
	Fri, 26 Jun 2026 08:21:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EC36B6020F;
	Fri, 26 Jun 2026 08:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F631F000E9;
	Fri, 26 Jun 2026 08:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462071;
	bh=iV8Y1qpbWig8yFM44HizyDZ9SD78GLMuCnUipxKToIg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=VRNylShyN+OO0dqReJbUBK5qFI1f6x5ouAiqFCYrkYYUy8b1gMx/LM0S+wdPJVGQF
	 jJ/q0NoPAVrPkfBKALquiLSi66MRTNQPndo+znqjmDQLg1xvBKHoopICntwZGcuu8X
	 ikLcRHzizfC+yRm+bZ7OqmquLsXsx3wcYGymB8+hC4hw6j6FB7rvlCxdjjIDW9i03i
	 E/eIBYBNSh2a2AMpC34HSlEWm0jMor1n5uqlth3PC9c/0gDQf2WRm6QHi6eYZoWMYY
	 DrTngTHNnd66HVz+Vov38qbQvIoPF2E9rhyCjS5TazDwiUUoPzl699cy+/S32kavM1
	 FKdrOosJGm0+w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0C0B39389E8;
	Fri, 26 Jun 2026 08:20:59 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 01/18] raid6: turn the userspace test harness into a kunit
 test
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246205852.3816447.1024923704586855592.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:20:58 +0000
References: <20260518051804.462141-2-hch@lst.de>
In-Reply-To: <20260518051804.462141-2-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 herbert@gondor.apana.org.au, dan.j.williams@intel.com, clm@fb.com,
 dsterba@suse.com, arnd@arndb.de, song@kernel.org, yukuai@fnnas.com,
 linan122@huawei.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-raid@vger.kernel.org
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

Hello:

This series was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Mon, 18 May 2026 07:17:44 +0200 you wrote:
> Currently the raid6 code can be compiled as userspace code to run the
> test suite.  Convert that to be a kunit case with minimal changes to
> avoid mutating global state so that we can drop this requirement.
> 
> Note that this is not a good kunit test case yet and will need a lot more
> work, but that is deferred until the raid6 code is moved to it's new
> place, which is easier if the userspace makefile doesn't need adjustments
> for the new location first.
> 
> [...]

Here is the summary with links:
  - [01/18] raid6: turn the userspace test harness into a kunit test
    https://git.kernel.org/riscv/c/c4697486fc23
  - [02/18] raid6: remove __KERNEL__ ifdefs
    https://git.kernel.org/riscv/c/3d6beb659ddf
  - [03/18] raid6: move to lib/raid/
    https://git.kernel.org/riscv/c/3626738bc714
  - [04/18] raid6: remove unused defines in pq.h
    https://git.kernel.org/riscv/c/06d2a66fb7c0
  - [05/18] raid6: remove raid6_get_zero_page
    https://git.kernel.org/riscv/c/885d31423183
  - [06/18] raid6: use named initializers for struct raid6_calls
    https://git.kernel.org/riscv/c/7e91f76a9668
  - [07/18] raid6: improve the public interface
    https://git.kernel.org/riscv/c/35472bc6f31b
  - [08/18] raid6: warn when using less than four devices
    https://git.kernel.org/riscv/c/2790045a62eb
  - [09/18] raid6: hide internals
    (no matching commit)
  - [10/18] raid6: rework registration of optimized algorithms
    (no matching commit)
  - [11/18] raid6: use static_call for gen_syndrom and xor_syndrom
    https://git.kernel.org/riscv/c/10f4b8e2a164
  - [12/18] raid6: use static_call for raid6_recov_2data and raid6_recov_datap
    https://git.kernel.org/riscv/c/dd83de0341da
  - [13/18] raid6: update top of file comments
    https://git.kernel.org/riscv/c/30bf04bd13a5
  - [14/18] raid6_kunit: use KUNIT_CASE_PARAM
    https://git.kernel.org/riscv/c/2175395f76c3
  - [15/18] raid6_kunit: dynamically allocate data buffers using vmalloc
    https://git.kernel.org/riscv/c/d67c25712fe3
  - [16/18] raid6_kunit: cleanup dataptr handling
    https://git.kernel.org/riscv/c/562bcbfcb99b
  - [17/18] raid6_kunit: randomize parameters and increase limits
    https://git.kernel.org/riscv/c/fa0c812c0aa5
  - [18/18] raid6_kunit: randomize buffer alignment
    https://git.kernel.org/riscv/c/8cf0a6c4bb9e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
