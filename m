Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818FEC25B0F
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 07:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LL19fjKuxQ3k0hZIp5rqGhzifElH6G6hxICg1FcFIT8=; b=2uxuAXopNiEKcs
	6mFKw6Yr9pALVJM/hIbiaeTRJyc8DLALDP0a+q1D5a5qQ38uIl5GO9+jEHpJgVcVHTizLvV892FPh
	VabqA7UgvXpkmTayD71UI3HuhKpM2O0SllSC1MJODa9ZI+xCWQVq7Zsn45dEoPy9b2m84no/IAa+U
	glWB6zapwimHi5swy16uDitoE2K+cgjaUf3c+1V3kz7Z0mAVX2oBl3oKdWP9b11jhLypSW+cGEtwO
	ZlIO/6bp4zHjaMnFYo+nQbW9f9IzOQVgx1etUZJeU1ydKR9+dZO3VMO7IbxXk7AJ5mQxidagpzvVd
	baf7lkmnQf7saKev9CWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxIU-00C9ZG-9f; Mon, 08 Aug 2022 07:35:34 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxIR-00C9WB-Lb
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 07:35:33 +0000
Received: from [167.98.27.226] (helo=[10.35.5.6])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1oKxIL-0029jq-14; Mon, 08 Aug 2022 08:35:25 +0100
Message-ID: <76d4f1d3-e72e-ef2e-12d0-f241fe680717@codethink.co.uk>
Date: Mon, 8 Aug 2022 08:35:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [GIT PULL] RISC-V Patches for the 5.20 Merge Window, Part 1
Content-Language: en-GB
To: Palmer Dabbelt <palmer@rivosinc.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <mhng-1cbba637-6dd2-456a-859b-9d3f8be6bab7@palmer-mbp2014>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <mhng-1cbba637-6dd2-456a-859b-9d3f8be6bab7@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_003531_786742_FDCDBF89 
X-CRM114-Status: GOOD (  12.34  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 06/08/2022 00:36, Palmer Dabbelt wrote:
> The following changes since commit 924cbb8cbe3460ea192e6243017ceb0ceb255b1b:
> 
>    riscv: Improve description for RISCV_ISA_SVPBMT Kconfig symbol (2022-06-16 15:47:39 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.20-mw0
> 
> for you to fetch changes up to ba6cfef057e1c594c456627aad81c2343fdb5d13:
> 
>    riscv: enable Docker requirements in defconfig (2022-07-22 13:43:28 -0700)
> 
> ----------------------------------------------------------------
> RISC-V Patches for the 5.20 Merge Window, Part 1
> 
> * Enabling the FPU is now a static_key.
> * Improvements to the Svpbmt support.
> * CPU topology bindings for a handful of systems.
> * Support for systems with 64-bit hart IDs.
> * Many settings have been enabled in the defconfig, including both
>    support for the StarFive systems and many of the Docker requirements.
> 
> There are also a handful of cleanups and improvements, like usual.
> 

Hi, are some of mine and Connor's fixes planned for part2?


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
