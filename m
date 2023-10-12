Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29B6CDB483
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 20:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UjWlvPmfBepH+KgFeuVrcU/+lS5vBoIvcfIrXi9aVKc=; b=lQjijGmEUCkXtP
	g8Vvm4sy+lNshX/Bmwa0+/v1FEoCrJb8hm5PrUAX8X1pMAYEEQAVhQobGFnkEwwJbXf8tKviXFqzn
	PZzAgy7L1Yxb/v/S7PgzV8BuYx95YjaNEM4vQsvsxb3L0MAnVeCx5ZR7YahTj43Pg90g8WuRj4fvB
	sigI5wHwx3NBhpDATzDQzWnd6EcD+9yQR4f/tRhPIG6W3ZkZBETILbYXiPHUkMkL48ZPL/zxNBkFw
	D3L+2xk6IiqlALCDqrGJMCNNqZBoLoWbToe3EU9BnC4CRt5PLJskO22G8RMwGTnxQx8B9IPxjZOrO
	oH86ytLi+HX5wVUY6iCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qr2Tv-001oVC-1a;
	Thu, 12 Oct 2023 20:40:31 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qr2Tr-001oTE-1N
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 20:40:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D9DABB82390;
	Thu, 12 Oct 2023 20:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30413C433CA;
	Thu, 12 Oct 2023 20:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697143225;
	bh=RJYjlHao0cVFQqQVSXf8FCtMqfCMn4CflRRAPd8qbNw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=p5fq5XIR7FD+n0KR4vUu+03TZqi9TccSEbUY4oC80uaAmHoBiLDiJxjwXYXi9V3xn
	 A3J7TLVkV/eUkkqk9mYdRAewxcv8zCz4IkGYrW4wvFAUj9v6c7YA7Pvyqgi0pec0Jd
	 1lW19WOUkrV2ndC1OrWS0DGHkDyrPMWqVjpJbkfRz/4ZDM2hFooxLbtSw0/kY6kWpp
	 MyD5sOFYWoSJGlBG15th4Nzbs8cLxTK+leP9WxNU/bPTdDKT+lHMQVM+2tBiLkJfvV
	 nXPIkhOUGVqo5/REKH/4FQjcEgZ1It3v78Azbzl1wCpmGQ9nkrIoPp7AvvculG5ASt
	 ETVxO/OT1GvGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 13BDDC595C4;
	Thu, 12 Oct 2023 20:40:25 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -next v2] riscv: kdump: fix crashkernel reserving problem on
 RISC-V
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169714322507.23371.6628705957236576989.git-patchwork-notify@kernel.org>
Date: Thu, 12 Oct 2023 20:40:25 +0000
References: <20230925024333.730964-1-chenjiahao16@huawei.com>
In-Reply-To: <20230925024333.730964-1-chenjiahao16@huawei.com>
To: Chen Jiahao <chenjiahao16@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_134027_743187_53425C40 
X-CRM114-Status: UNSURE (   8.88  )
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
Cc: robh@kernel.org, aou@eecs.berkeley.edu, zephray@outlook.com, alexghiti@rivosinc.com, bhe@redhat.com, thunder.leizhen@huawei.com, bjorn@rivosinc.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, palmer@dabbelt.com, jszhang@kernel.org, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, akpm@linux-foundation.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 25 Sep 2023 10:43:33 +0800 you wrote:
> When testing on risc-v QEMU environment with "crashkernel="
> parameter enabled, a problem occurred with the following
> message:
> 
> [    0.000000] crashkernel low memory reserved: 0xf8000000 - 0x100000000 (128 MB)
> [    0.000000] crashkernel reserved: 0x0000000177e00000 - 0x0000000277e00000 (4096 MB)
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] WARNING: CPU: 0 PID: 0 at kernel/resource.c:779 __insert_resource+0x8e/0xd0
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.6.0-rc2-next-20230920 #1
> [    0.000000] Hardware name: riscv-virtio,qemu (DT)
> [    0.000000] epc : __insert_resource+0x8e/0xd0
> [    0.000000]  ra : insert_resource+0x28/0x4e
> [    0.000000] epc : ffffffff80017344 ra : ffffffff8001742e sp : ffffffff81203db0
> [    0.000000]  gp : ffffffff812ece98 tp : ffffffff8120dac0 t0 : ff600001f7ff2b00
> [    0.000000]  t1 : 0000000000000000 t2 : 3428203030303030 s0 : ffffffff81203dc0
> [    0.000000]  s1 : ffffffff81211e18 a0 : ffffffff81211e18 a1 : ffffffff81289380
> [    0.000000]  a2 : 0000000277dfffff a3 : 0000000177e00000 a4 : 0000000177e00000
> [    0.000000]  a5 : ffffffff81289380 a6 : 0000000277dfffff a7 : 0000000000000078
> [    0.000000]  s2 : ffffffff81289380 s3 : ffffffff80a0bac8 s4 : ff600001f7ff2880
> [    0.000000]  s5 : 0000000000000280 s6 : 8000000a00006800 s7 : 000000000000007f
> [    0.000000]  s8 : 0000000080017038 s9 : 0000000080038ea0 s10: 0000000000000000
> [    0.000000]  s11: 0000000000000000 t3 : ffffffff80a0bc00 t4 : ffffffff80a0bc00
> [    0.000000]  t5 : ffffffff80a0bbd0 t6 : ffffffff80a0bc00
> [    0.000000] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
> [    0.000000] [<ffffffff80017344>] __insert_resource+0x8e/0xd0
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] Failed to add a Crash kernel resource at 177e00000
> 
> [...]

Here is the summary with links:
  - [-next,v2] riscv: kdump: fix crashkernel reserving problem on RISC-V
    https://git.kernel.org/riscv/c/1d6cd2146c2b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
