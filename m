Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE610EE49A4
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 00:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cScwCAr1akqoEsH+wHiCNAvT+3hMLZwet5+dK5nkTDI=; b=oDVsd820UPFfGQ
	8LQqUrNPuQCVEVQci8s393Dq37jZRomIlDTEZIJfRxK+dqG8la4vLesfEQdZKMIkmJyf6SbgOPdKW
	K4UFmfZlryKjadcBH2938i5Ke9x163YoDQQwLnubTbGAVGfyq8HScgmqKn+lLKCH8F8MrhbMDb62P
	r7yXW7GIvulk41Xae2gjdQdxrAgnl64HxwFrAwIcazfExXwenY1zhrugUqzZsTBvDNTAkpGFFctpu
	c7jYeObT3XpNqeSApFfcafsDM6zB1GcxmBoBHD8hj0CE1zaQZuIEV183iwIqUCt9zTzaQhkm0kzrc
	8cmZOcOuWNGblsgKwRlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgDsZ-004Ltw-2s;
	Wed, 13 Sep 2023 00:37:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgDsO-004Lqg-1S;
	Wed, 13 Sep 2023 00:37:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id ED8CFCE1FCA;
	Wed, 13 Sep 2023 00:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 473AAC433C8;
	Wed, 13 Sep 2023 00:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694565420;
	bh=srKgiw1+9R9KRwICqMzY0SIrsPWn+g9Gu8eRObYiO7Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XDotN6mnkIxk5BwwtRJbhhYAc9wXZIDfi/y2pnldNwKoihG/Gny7S5Yn76/EDmxbg
	 uwTooNoLcpFn+yCSO0YhGxIIkFJ1VoeMJVjgp1LbEGfcszktHmKAQx+fBHzMig6hI8
	 ZRx46heOvgfjoUQS49Dqmlq41ANeV+/c6N6VYXx/fZXO5r1+xnl/fVzQ+8yFkaWPw1
	 Q1U7JIyo5NSXUKkkd1xC2AzU784NYjg2rGtgbgE/OsEzNIJndsaulI15fqdTkV6M1A
	 rM7OdYdPYFOGZLdQhu3tAVFLPZGUC/3E2cavirNdzcppdNtrtJJxnfFsLuiIDO5sOj
	 Apa7qgZBGvaeQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2D3E8C04DD9;
	Wed, 13 Sep 2023 00:37:00 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH V1 0/3] riscv: kexec: cleanup and fixups
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169456542018.30716.13506539771908013747.git-patchwork-notify@kernel.org>
Date: Wed, 13 Sep 2023 00:37:00 +0000
References: <20230907103304.590739-1-songshuaishuai@tinylab.org>
In-Reply-To: <20230907103304.590739-1-songshuaishuai@tinylab.org>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 lihuafei1@huawei.com, petr.tesarik.ext@huawei.com, duwe@suse.de,
 ribalda@chromium.org, akpm@linux-foundation.org, keescook@chromium.org,
 hi@alyssa.is, heiko@sntech.de, lizhengyu3@huawei.com, alexghiti@rivosinc.com,
 schwab@suse.de, linux-kernel@vger.kernel.org, kexec@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_173704_656966_B5D5FB6D 
X-CRM114-Status: GOOD (  10.68  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu,  7 Sep 2023 18:33:01 +0800 you wrote:
> Hi,
> 
> I had posted 2 patches [1][2] for riscv/kexec, but there was no "effective"
> response to them until now, so I merged them in this series with the 3rd fixup.
> 
> Anyway, this series contains a cleanup for riscv_kexec_relocate() and two fixups
> for KEXEC_FILE and had passed the basic kexec test in my 64bit Qemu-virt.
> 
> [...]

Here is the summary with links:
  - [V1,1/3] riscv: kexec: Cleanup riscv_kexec_relocate
    (no matching commit)
  - [V1,2/3] riscv: kexec: Align the kexeced kernel entry
    https://git.kernel.org/riscv/c/1bfb2b618d52
  - [V1,3/3] riscv: kexec: Remove -fPIE for PURGATORY_CFLAGS
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
