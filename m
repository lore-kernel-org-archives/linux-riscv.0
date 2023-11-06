Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE71C41535
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 15:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ELbQSzKKtqUHTRO9UkG1kpVWzQy2jVnNFuw0N88VEE=; b=qSdF3euDFt6Vnd
	KQBpTChNvx5L2Bl7bTfIVWlLGws8v9lEdXoZsbtuSAOL8Xku9w4ZPZJg96AuRAwOXCUi7BC8EGV4P
	Ti9rw+R4CbDzWDjpDULGGkbKFVYwL30y8Pb8MhS1NZZeqOhJjVl6naYzWR5uDhoLXbvsioAqOz4QR
	2ZDtu/KgI8eF9q3QlFj4eqnL85L/wxNXeUlI+LnLHj3CQYnkcIUXjOVk2m7yp3IG/E/UuqrthxCzZ
	Fd/Pf6IvB/AE1urtobtOQ4XVFh2IiGubc9PIULbwa3HAnvkJTwRgy4EAE1gXZMD7ekf4Z7J9k/j3F
	rX4gTORKmmVBfks+HMPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r015e-00GvdI-0J;
	Mon, 06 Nov 2023 15:00:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r015a-00Gvan-1g
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 15:00:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CB15560F8C;
	Mon,  6 Nov 2023 15:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3BAE8C433CD;
	Mon,  6 Nov 2023 15:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699282829;
	bh=peZY9vSBSFS+886zmL37gCP8MxGJChhA03rKB6LCEB4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qBhTiM8+9gJCXB0dEvVGmPLGjM8eZGhjtTsrGKdQOLMPdO4kvQRcxYBKNVEKNwOne
	 80xrFEOTgIxf5qQjVM/ttXtcCCdtGpMdxteh7NORBuz1ETDWG8rMXShZuk2GDSWYef
	 l9f2wonlOp3Jpbn3l2AR9H8m0rSq0kcMHMUiEVak8OLalsvP/u3kSmWFuNm3uXzhgz
	 JD2AT8jKqz0UyyWqqPTEv85teuL1c6kMM4bXuKm+VYvOiLND4682jbWh1ec5bqSF3x
	 Dmqqy4fY1SzC8HEqLG7Co/uUBqFY1o6361m+l9CqUTAJop3gtXHk/iUkPu9ftnnbO3
	 32rOl0iX95+fg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 220C2E00099;
	Mon,  6 Nov 2023 15:00:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v6] riscv: add userland instruction dump to RISC-V splats
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169928282913.16503.13862568711524021522.git-patchwork-notify@kernel.org>
Date: Mon, 06 Nov 2023 15:00:29 +0000
References: <20230912021349.28302-1-cuiyunhui@bytedance.com>
In-Reply-To: <20230912021349.28302-1-cuiyunhui@bytedance.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, guoren@kernel.org,
 bjorn@rivosinc.com, conor.dooley@microchip.com, jszhang@kernel.org,
 andy.chiu@sifive.com, dave.hansen@linux.intel.com, elver@google.com,
 glider@google.com, cyphar@cyphar.com, kirill.shutemov@linux.intel.com,
 keescook@chromium.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_070030_610396_9167DF0C 
X-CRM114-Status: UNSURE (   8.47  )
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

On Tue, 12 Sep 2023 10:13:49 +0800 you wrote:
> Add userland instruction dump and rename dump_kernel_instr()
> to dump_instr().
> 
> An example:
> [    0.822439] Freeing unused kernel image (initmem) memory: 6916K
> [    0.823817] Run /init as init process
> [    0.839411] init[1]: unhandled signal 4 code 0x1 at 0x000000000005be18 in bb[10000+5fb000]
> [    0.840751] CPU: 0 PID: 1 Comm: init Not tainted 5.14.0-rc4-00049-gbd644290aa72-dirty #187
> [    0.841373] Hardware name:  , BIOS
> [    0.841743] epc : 000000000005be18 ra : 0000000000079e74 sp : 0000003fffcafda0
> [    0.842271]  gp : ffffffff816e9dc8 tp : 0000000000000000 t0 : 0000000000000000
> [    0.842947]  t1 : 0000003fffc9fdf0 t2 : 0000000000000000 s0 : 0000000000000000
> [    0.843434]  s1 : 0000000000000000 a0 : 0000003fffca0190 a1 : 0000003fffcafe18
> [    0.843891]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : 0000000000000000
> [    0.844357]  a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000000000000
> [    0.844803]  s2 : 0000000000000000 s3 : 0000000000000000 s4 : 0000000000000000
> [    0.845253]  s5 : 0000000000000000 s6 : 0000000000000000 s7 : 0000000000000000
> [    0.845722]  s8 : 0000000000000000 s9 : 0000000000000000 s10: 0000000000000000
> [    0.846180]  s11: 0000000000d144e0 t3 : 0000000000000000 t4 : 0000000000000000
> [    0.846616]  t5 : 0000000000000000 t6 : 0000000000000000
> [    0.847204] status: 0000000200000020 badaddr: 00000000f0028053 cause: 0000000000000002
> [    0.848219] Code: f06f ff5f 3823 fa11 0113 fb01 2e23 0201 0293 0000 (8053) f002
> [    0.851016] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004
> 
> [...]

Here is the summary with links:
  - [v6] riscv: add userland instruction dump to RISC-V splats
    https://git.kernel.org/riscv/c/b8a03a634129

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
