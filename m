Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1794AC47DAF
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 14:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rUDLSC6F5kpKO0ApXsGi/9+d0Qxzd6cBsbDcqcwnb6Q=; b=FctZAVy3A5x5mr
	ktNTYfrG0ZNrqpmPDnqilWsVpW8fbQ/Xs8igx+fWJUeIr02r4mkFHAl9ZlI2nwbpwg5uW7pcgV+zn
	hWwABZpHgwNvzn/ebR8bIuBsZTgUy6tIJuSZDvAsrJSbkZT0WiyVT8/97+5q7BdQbfNzumzqhxCSS
	yYGjKm+7d5+uToD2JXsOw3iS7LdVFFo4QHS3OnjwwQkxwP121BUbmhKTwt1QTCom/qtz+OI8ItIq5
	uhhNKOheBA6N8WSzRnXptgtd26YBNAQ6MIyEv3s+ywvoz3HCvKQ9pVRAzQLfkoYuH7ohK40QyExqH
	HwqzEhG/TF5J58UhtJTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwOQ-000KNn-0k;
	Thu, 11 Jan 2024 14:50:50 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNwOG-000KGu-18
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 14:50:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 11E5AB81EDB;
	Thu, 11 Jan 2024 14:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4AE1C433A6;
	Thu, 11 Jan 2024 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704984637;
	bh=QEltCOghjDHZcleTwVJs57Hiqfo45501vMQF9TdPbNw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XggMf5a8thlS8ZWv5KV1lrlRp922G8wC7o8T6DeasRsCajZZMOepavAmdDIc7PmSA
	 bRQWtvSmHBmqOMSPaXXuIk4+mm+GGUA01qbWkQQRjsqaFYxe9uKKfQY9G4UdeJlxOF
	 YHRaBFv0YGDS2hiHBr5/2nIxoUrRq9ci/rGMB2YudM2s8UGY6fd55Z2ie9HYbJVy7M
	 PpHbYUbpJ+WvuNWs2tW849GsXLO+1ckKdiU1CTyxw6e3P0KcZXE5Z8ms0voVi7VAfx
	 4Dscqip2NmNI3XlCvlQ9YHF88GvMsdauT2lFbBgmapiropnrw8oq7kmUP7AjX283ej
	 c3MlnTSkW9GHw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A8BEBD8C97A;
	Thu, 11 Jan 2024 14:50:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] Fix XIP boot and make XIP testable in QEMU
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170498463768.20080.204922306048177003.git-patchwork-notify@kernel.org>
Date: Thu, 11 Jan 2024 14:50:37 +0000
References: <20231212130116.848530-1-haxel@fzi.de>
In-Reply-To: <20231212130116.848530-1-haxel@fzi.de>
To: Frederik Haxel <haxel@fzi.de>
Cc: linux-riscv@lists.infradead.org, vitaly.wool@konsulko.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 greentime.hu@sifive.com, andy.chiu@sifive.com, heiko@sntech.de,
 conor.dooley@microchip.com, cleger@rivosinc.com, samitolvanen@google.com,
 masahiroy@kernel.org, guoren@kernel.org, namcaov@gmail.com,
 alexghiti@rivosinc.com, akpm@linux-foundation.org, anup@brainfault.org,
 bhe@redhat.com, chenjiahao16@huawei.com, bjorn@rivosinc.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_065040_520683_EC6A3C9C 
X-CRM114-Status: GOOD (  10.23  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 12 Dec 2023 14:01:11 +0100 you wrote:
> XIP boot seems to be broken for some time now. A likely reason why no one
> seems to have noticed this is that XIP is more difficult to test, as it is
> currently not easily testable with QEMU.
> 
> These patches fix the XIP boot and allow an XIP build without BUILTIN_DTB,
> which in turn makes it easier to test an image with the QEMU virt machine.
> 
> [...]

Here is the summary with links:
  - [1/3] riscv: Make XIP bootable again
    https://git.kernel.org/riscv/c/66f1e6809397
  - [2/3] riscv: Fixed wrong register in XIP_FIXUP_FLASH_OFFSET macro
    https://git.kernel.org/riscv/c/5daa37264102
  - [3/3] riscv: Allow disabling of BUILTIN_DTB for XIP
    https://git.kernel.org/riscv/c/6c4a2f6329f0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
