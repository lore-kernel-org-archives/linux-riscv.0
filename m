Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7914CC49EA1
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 13:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H7ffJJTfnCVyC5LVFmZdIGRgEzdKeA4AVA4ZDpU6cZ8=; b=v72LG0vKC1WOI9
	Soe95meQlausrOH1LkvN0KVx/9Cp5hg/q4zIa9x9H3Vwv6GwwwJY1SxdpZyju+O+5aRF/L/4LIYoe
	b/ie/UJwa5SD5CrICmRZScdzpkM8dz9Ic1HNYaark9cZ1p73GSa7ulThHc2gY3B7L6ZCQ7hMc4naT
	yebdUusC6yTUw1wzAK/2UO3HWgbEN9oFuNJLskuHPGCTC1RdTDwDCqz1KF0/+mSKSJAEaBJnTTJHJ
	2leZzu71XKXX4q8rHH08p6XJSMa9MC3OIBbhkLiIobuR2kJzIbdaSDi8RSEcu9CK0fpyddmCefqV7
	y61iqV+ohwqbIOU7/HqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyOn-000000012pS-1vkI;
	Thu, 25 Jul 2024 13:20:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyOf-000000012iT-0Pso
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 13:20:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B840B611DB;
	Thu, 25 Jul 2024 13:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4EAFCC4AF10;
	Thu, 25 Jul 2024 13:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721913639;
	bh=vfzBgIcntLPqkhSJCyx0FFIQHgkyhzWKN7LqXMOkLP8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LioHTqQyAbtkWBjJn287USPv1Czr9b7xVzVhLXUWNZnRAEAFRu2t2zN4K4oBGGmZ0
	 evZnwPlXj2awXorBNpt/uJu+p2U6abJ3QbU+g9lzlxMApLstFezzGk7dvA+bbtHaJ6
	 2y8cMcDkuHQROLfBil+k3TNFKxIBy/AAyaipOGIRsgzKj60q0kB5r79cqaTx4d8nxO
	 bQcsvNwjvvRwru6ZkFdIJSiWImZJntUmIAWsCiLXMA3aTJo0TkoQSkqhw26IaGLwx4
	 J/c+btnP65W1qY9khcboBOiyahijXocjc58dAHoGgNKGF5M3RjCTEbTd/tKEJ4Audj
	 AK80C7Pe84MZg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 40240C8E8C6;
	Thu, 25 Jul 2024 13:20:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v6 1/3] riscv: cacheinfo: remove the useless input parameter
 (node) of ci_leaf_init()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172191363925.6240.13009091146291258074.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jul 2024 13:20:39 +0000
References: <20240617131425.7526-1-cuiyunhui@bytedance.com>
In-Reply-To: <20240617131425.7526-1-cuiyunhui@bytedance.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_062041_271133_D78A2057 
X-CRM114-Status: UNSURE (   9.01  )
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
Cc: aou@eecs.berkeley.edu, rafael@kernel.org, tiantao6@huawei.com, Jonathan.Cameron@huawei.com, linux-kernel@vger.kernel.org, jeremy.linton@arm.com, sudeep.holla@arm.com, linux-acpi@vger.kernel.org, pierre.gondois@arm.com, palmer@dabbelt.com, paul.walmsley@sifive.com, bhelgaas@google.com, james.morse@arm.com, linux-riscv@lists.infradead.org, lenb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 17 Jun 2024 21:14:23 +0800 you wrote:
> ci_leaf_init() is a declared static function. The implementation of the
> function body and the caller do not use the parameter (struct device_node
> *node) input parameter, so remove it.
> 
> Fixes: 6a24915145c9 ("Revert "riscv: Set more data to cacheinfo"")
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> Reviewed-by: Jeremy Linton <jeremy.linton@arm.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> 
> [...]

Here is the summary with links:
  - [v6,1/3] riscv: cacheinfo: remove the useless input parameter (node) of ci_leaf_init()
    https://git.kernel.org/riscv/c/0c8a84c2ab78
  - [v6,2/3] riscv: cacheinfo: initialize cacheinfo's level and type from ACPI PPTT
    https://git.kernel.org/riscv/c/604f32ea6909
  - [v6,3/3] RISC-V: Select ACPI PPTT drivers
    https://git.kernel.org/riscv/c/66381d36771e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
