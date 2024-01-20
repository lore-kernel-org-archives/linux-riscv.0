Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24A1C47258
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 21:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xniBubUlP4HGFVQQSEWhmaE8+QbIhZH0GHF3TX/FXlM=; b=4iyLoyPSt809h0
	R1l7gqmh0x9DbGW6K3USEYSnxAJPAemhx6pCuilvKnnxZIrPO11g4iidnA6gClhoSCfDPqnfr7cAD
	VnPrAfpVCTS5K1YGYnznCPD154ithZ79mcNwyL2GOFm/ZOApAbytitOheFOLETSjqtQyzlaCGRdHI
	ItxIPOMpGuws+/9qZnMNe605DK/SuTMp/fIIo3D6kYnFl5F7ISUaPpjQ6KkeT/VSojFiGlf5+a5CA
	SYct9L2Y083w0FXfRy7KJgeb2DbVlKcoyzPgRii3CVLRBekSV+tMBrDotFwvuAnr0bqhdhVeV/uVc
	huIbIy8j5dlFlqo/BLng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbd-008Oaa-1W;
	Sat, 20 Jan 2024 21:10:21 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbJ-008OFJ-0W
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 21:10:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 46A27B80937;
	Sat, 20 Jan 2024 21:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9527C433A6;
	Sat, 20 Jan 2024 21:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705784998;
	bh=QASk6X8mHI815lMQx7vHiMYhTE5lGqSmqP8w+R4JeKg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=X4V7szfQDwYJfFcOdTjrWH386mx6c46RbuwBiop3XbWj9B/KpP5P8C8NC4tcUkhbd
	 I/lEC03ex8YEwRl+POcM796TedTPPd486rqM1J3il9coj6D1bjkXgqP8MyeMFToQt3
	 KuK+9ZBmbcMOI+nwDAdOa2QAST/rOhKLSSdq0pt+Rlaf3+WMo1otM7sHV3cnzF8FD3
	 TBCYNbioirus6IFsWMtdoP0Q1G5djUXe3F7tuAkODLYG0odOSBadDHH0JuFWkfdcI9
	 mkJ1xx8/Zw8CiMbgpx4XiqUIgMD83JW+xakSUZ6xuJYDhlTJmUGFBPE0eJTxx6oH2/
	 azb2CEYi3YhAg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D9807D8C970;
	Sat, 20 Jan 2024 21:09:58 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Optimize hweight API with Zbb extension
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170578499888.24348.15332028365241008797.git-patchwork-notify@kernel.org>
Date: Sat, 20 Jan 2024 21:09:58 +0000
References: <20231112095244.4015351-1-xiao.w.wang@intel.com>
In-Reply-To: <20231112095244.4015351-1-xiao.w.wang@intel.com>
To: Xiao Wang <xiao.w.wang@intel.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, anup@brainfault.org,
 haicheng.li@intel.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_131001_472040_3E7EC5CC 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sun, 12 Nov 2023 17:52:44 +0800 you wrote:
> The Hamming Weight of a number is the total number of bits set in it, so
> the cpop/cpopw instruction from Zbb extension can be used to accelerate
> hweight() API.
> 
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---
>  arch/riscv/include/asm/arch_hweight.h | 78 +++++++++++++++++++++++++++
>  arch/riscv/include/asm/bitops.h       |  4 +-
>  2 files changed, 81 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/include/asm/arch_hweight.h

Here is the summary with links:
  - riscv: Optimize hweight API with Zbb extension
    https://git.kernel.org/riscv/c/55ca8d7aa2af

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
