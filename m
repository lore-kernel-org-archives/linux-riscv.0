Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C88C47258
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 22:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XtwSEooR8KlcTydajey9u35IzDKO68LSzJ2R0HwTrUQ=; b=jjKAAztdKMw6Ti
	mrMWHP08zPr1bXn4SFxk6XUFPvs/irFlx9joYEw/OwYmYX7XOtg5YgvpYIQ/NWhWypz7NMUx95Mi4
	KnhVzV6ie78eaKiOhbQ9cRD8Mqv9HFQfPQrVna+lge51F5eI8hsCz6zEFDmvJQasuDueuCcCWBuiC
	5dQAAgi6cBinfnMIc4MIjNn3gWKgM6VomPtjjMy4KeWuE8n7CAFhHOKoMUwS7ofOGfowDGC4up/FD
	DgZ+IYwWMHwWk9TcHhkUwpv7aaVB19ED9hyvvzmdYf4eO2xG4v2GY+fSImaSW2U8SiDQd1KhICYKG
	LJYI9c+wDIoMoJoCvAqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRJdw-008VJ7-0T;
	Sat, 20 Jan 2024 22:16:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbF-008ODI-39;
	Sat, 20 Jan 2024 21:09:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 9656DB801B8;
	Sat, 20 Jan 2024 21:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46711C43601;
	Sat, 20 Jan 2024 21:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705784996;
	bh=M7g5eRyDPxCySbVq6qDMpJN6lmzZYx8poGv+sF2twdY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KbmoeAq7o7z84/lro+jEKm1k97jjrEPcVrACcDrYuLRy9Kepw5VBWZrC2wJxF6fuH
	 PW7SfU7Frq6lq7u1MDRxrasoF4gu1E1+tGwyHKlfb23T8CvY27FhMBUVLdIQURQjZm
	 TME1+Nh7DgfUkJdAsotvo6Ifk0SKEU6aBcd3MR33o1jGwt+90HguzQ/40bkIov21X2
	 if9wnzOWEZ8tvlAmKNrcP/dSqnu9Cxx5gHjMTGQiQ42QM79wr3k0Gy1ev8sOroM4MG
	 iq0uAD6C40c1E84s5qKqFoqo2AtGwThoOMyFSclSGQthE4LlXigIyHTYu1T8IvDXPE
	 lyUifJs78Drdg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 363D3D8C970;
	Sat, 20 Jan 2024 21:09:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv, kexec: fix the ifdeffery for AFLAGS_kexec_relocate.o
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170578499621.24348.1106516858388911395.git-patchwork-notify@kernel.org>
Date: Sat, 20 Jan 2024 21:09:56 +0000
References: <20231201062538.27240-1-bhe@redhat.com>
In-Reply-To: <20231201062538.27240-1-bhe@redhat.com>
To: Baoquan He <bhe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kexec@lists.infradead.org, mick@ics.forth.gr, changbin.du@intel.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_130958_180068_796F2FB7 
X-CRM114-Status: UNSURE (   9.46  )
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
by Andrew Morton <akpm@linux-foundation.org>:

On Fri,  1 Dec 2023 14:25:38 +0800 you wrote:
> This was introduced in commit fba8a8674f68 ("RISC-V: Add kexec
> support").
> 
> It should work on CONFIG_KEXEC_CORE, but not CONFIG_KEXEC only, since
> we could set CONFIG_KEXEC_FILE=y and CONFIG_KEXEC=N, or only set
> CONFIG_CRASH_DUMP=y and disable both CONFIG_KEXEC and CONFIG_KEXEC_FILE.
> In these cases, the AFLAGS won't take effect with the current ifdeffery
> for AFLAGS_kexec_relocate.o.
> 
> [...]

Here is the summary with links:
  - riscv, kexec: fix the ifdeffery for AFLAGS_kexec_relocate.o
    https://git.kernel.org/riscv/c/d53a154cdc54

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
