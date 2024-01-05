Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0DEC3DA6E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 21:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/hxyjjKGShBp1aqpe6zgKoJdg48EGr7tnNIPOERG0M=; b=dM2Hd3mbpff9La
	txmlqG/MlHtlzCLNtYt+6A3Rz7flzy72YXaWFLGRZz6/+gip189bhv1vTH/J7WSj1tIDxtw6k39jv
	e8b7GWHjGbz/Ko3xjp5XhHwSdnoXLpLgBPvMe0DlNzYNA/JaSfGAo/yJEEZgx60Zf3F+GNgsaaJN3
	e5FsKCQIfb70pciSv4inEbyBXcBwvlPfuFbMlyc6OgYpkGCFmsfeIolZW4WGQ5FOlZEY7o0CREQVs
	9mcCJIaQUaRfMongILW/stxLeL82457nXMko4/FpZepIa4Na1DDryLXB/zuPYORKgg7886RpZqfgc
	lDK7kLVMPuziDZRGHtfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLs5L-000Iwe-22;
	Fri, 05 Jan 2024 21:50:35 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLs5G-000Ith-09
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jan 2024 21:50:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7990DB81D17;
	Fri,  5 Jan 2024 21:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4E79C433CA;
	Fri,  5 Jan 2024 21:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704491427;
	bh=TbP2ZiKWNQumHFHTZE3CH6DZOuJ/7CINRHp6fTS6928=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sLLQHEZYyfz+Z9ZaAbStkoUPxk7s0nTs8Jz6auG/Dj5S/m96kPcB13Wm3UJIcjFuI
	 9PuK4e2ysWlYh73h3ryG0mq//DpqvHRc/GVTggwRF4xd07rFSeHQnt64IxstT49Zw7
	 Xd0LWRFFBuEaEsLUaulQ+Lor/7XiCo+f/VeQcR+/k9JSBOBHVhNJ6hAKB7wENmLoLi
	 gDp5G+EgLYwAzb95EYL1J56kMl0c0BtdbhjNdgj32xsA78NLrtDkI6Df1ApkdE227P
	 U53T2ZNhvrb8tE4kLDbJ96Xk8XcR7ws0m/nSwV9AJBNUXjuwBFxZkl/7wkGL3gEVlH
	 H2wI3d3h5sT+A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B007DC41606;
	Fri,  5 Jan 2024 21:50:27 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Select ARCH_WANTS_NO_INSTR
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170449142771.26226.4393775934262321528.git-patchwork-notify@kernel.org>
Date: Fri, 05 Jan 2024 21:50:27 +0000
References: <20231123142223.1787-1-jszhang@kernel.org>
In-Reply-To: <20231123142223.1787-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, nathan@kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_135030_218812_684B6FAE 
X-CRM114-Status: UNSURE (   8.85  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu, 23 Nov 2023 22:22:23 +0800 you wrote:
> As said in the help of ARCH_WANTS_NO_INSTR entry in arch/Kconfig:
> "An architecture should select this if the noinstr macro is being used on
> functions to denote that the toolchain should avoid instrumenting such
> functions and is required for correctness."
> 
> Select ARCH_WANTS_NO_INSTR for correctness.
> 
> [...]

Here is the summary with links:
  - riscv: Select ARCH_WANTS_NO_INSTR
    https://git.kernel.org/riscv/c/5a2cf779e677

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
