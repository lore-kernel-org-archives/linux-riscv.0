Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EB2E7717D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 22:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A91RP/rEFYV04VNdffUWK2zN18XgV20xQIIVJsiRY2c=; b=rGQMBr7iLJGyAK
	krjSLmEuctRnvmycJXIxw42NlvRi7hsafzU9yHn5y8ViOhS3jTiVg8b9JKdTHiztfko/sdK2DyDi0
	yfPbX4cB4A1gkBPbe1R6xTOj4JPzC11nX7l+mSxE29LxOO8OZ3BrmeQgFxuR7FD0PsNdeIyTqK3l3
	l6eMTzlDSxcZ3cZl/N2BdPpxAybahaCb9+M/M7X/KGTVeH0qsth6Xo8e/+hBw4mIZIXbMx6kYiz5/
	VWXwA+DeCy2H7a7n3islug+Xv84Ew5zRuBttjp1zI/YPVR6MFSTXUpWoC9St4GKIt78qOaZV+L4Wc
	wrG6O5VDO+WQY4unZH5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVN6-0000000GNP3-2zBm;
	Wed, 11 Dec 2024 22:39:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVGG-0000000GKmz-28WH
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 22:32:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7EF625C67A9;
	Wed, 11 Dec 2024 22:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1FF0C4CED2;
	Wed, 11 Dec 2024 22:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956371;
	bh=OFUDKl/zfGVkDxLHgqMZHOS0MzDnMONqvySriFeHPp0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VFPfpZPnfMb8GpVKtoWEoUUOzp46P1OPdg2x3WnquEHa70Gm3KUoK3prDBBttmgri
	 POJnlOPmjIPs0A0b7GMzlLSc9xoozFz/4bRTqKL7Be87NYzNneldg3Pbv67rfRs0iE
	 eD/CKd61Gho2+txPMmKMXVX4DcU97PYobMKMFMmwueAoLCN4dFZ+cBDVBJqGoRcbs9
	 zgQyRWgbrTkVEweHThpu4P1212B4wj7dXE1X0MrYPUakdt0wkUB6Caepi+n1DawbpY
	 n/9S7iLtZh2j+OfsVyFSH2V9OpgagDSWavgZNy2SqJ0+5JRApbdkWDavyJxQTC0Nyy
	 rm93Me0cAP7lA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADDA380A965;
	Wed, 11 Dec 2024 22:33:08 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [RESEND PATCH] mm: Move set_pxd_safe() helpers from generic to
 platform
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395638752.1729195.1601200589696534900.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:33:07 +0000
References: <20241003044842.246016-1-anshuman.khandual@arm.com>
In-Reply-To: <20241003044842.246016-1-anshuman.khandual@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
 akpm@linux-foundation.org, paul.walmsley@sifive.com,
 dave.hansen@linux.intel.com, palmer@dabbelt.com, tglx@linutronix.de,
 david@redhat.com, ryan.roberts@arm.com, x86@kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143252_588931_D8E7BBD3 
X-CRM114-Status: GOOD (  10.36  )
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

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Thu,  3 Oct 2024 10:18:42 +0530 you wrote:
> set_pxd_safe() helpers that serve a specific purpose for both x86 and riscv
> platforms, do not need to be in the common memory code. Otherwise they just
> unnecessarily make the common API more complicated. This moves the helpers
> from common code to platform instead.
> 
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: x86@kernel.org
> Cc: linux-mm@kvack.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> 
> [...]

Here is the summary with links:
  - [RESEND] mm: Move set_pxd_safe() helpers from generic to platform
    https://git.kernel.org/riscv/c/d7d65b103901

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
