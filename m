Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F24C83F15
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 20:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HMLE9XgW/854JA6GYtdcMbaqDsNKr88vCCXWiRSnN7U=; b=F6jBh68xuxyCvz
	Ty3nJLe62fP4YzEuA/f7mZgxwup7lB5YGictPECflPaNHtkOEDsLCebd4F0852Cnv6FlBCr4a6VzG
	A4u0J3HUSbZZu49HIxdJ3yq+xiJt4lHdnvHQVjcaJIKDvwcq7+/TwJU41QDwc1/sMECEC4MVuwQfi
	Y5Eo8GDM3t3h8OKQugaOYi2lnuP6w124SqkFNR+sRurBf5jAW5bE3V0gdvC3iTWEfOIGOTp+MUhSh
	ykSI2OJUUQ1x+w5V7OmBmG/ReXbFTzJT/3ObIeYIXEBI4s7kfMo8VsFO3loVUZd/s54oy9NbFkX+v
	hNgolskBt2ispbxhyEWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbRpm-00E8eu-0O;
	Wed, 30 Aug 2023 20:30:38 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbRpf-00E8bp-39
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 20:30:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5D318B82097;
	Wed, 30 Aug 2023 20:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AEADC433CB;
	Wed, 30 Aug 2023 20:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693427428;
	bh=J99XxASS8MmKe2/gO43aMZ+Un5+TXB8wEPpwOaGhpCQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=r4k6u8fm3WK2aKVWG3uAITlLCq8SU1Ei8fX9yVN2vSq3Mv3l6LkTBe4YD2auhKTHU
	 YtjEkoKcRGiHBWg43z78GDBRZDcqF9xTOWNkec80MD0j0Oixa0QEVWpoh38DC6VNjl
	 FzH7V64THeRo8cwNfGcUmV+Ijlg3lpg8SbrFCrx1ZfwD7H5E4IF0RF6IKrNGGt5mMw
	 jpe/kAie9i2uwVorQFk7mXSLVn8pqpMdewJ9hvjrK6KjUixgAeT8KuYPCiUdX76vk3
	 F4hfDl2tLLpW/Z0Y+DGq/AZJl0zT3n+oKXEbe54u2jTI/MkejD+a8wPswd0czLiw5+
	 Qmk/QZi42dx4g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7F9FCE29F3A;
	Wed, 30 Aug 2023 20:30:28 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/2] RISC-V: Probe for misaligned access speed
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169342742851.1913.116474602408550824.git-patchwork-notify@kernel.org>
Date: Wed, 30 Aug 2023 20:30:28 +0000
References: <20230818194136.4084400-1-evan@rivosinc.com>
In-Reply-To: <20230818194136.4084400-1-evan@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, palmer@rivosinc.com,
 rdunlap@infradead.org, heiko@sntech.de, linux-doc@vger.kernel.org,
 bjorn@rivosinc.com, conor.dooley@microchip.com, guoren@kernel.org,
 jszhang@kernel.org, samuel@sholland.org, jeeheng.sia@starfivetech.com,
 maz@kernel.org, masahiroy@kernel.org, greentime.hu@sifive.com,
 shosie@rivosinc.com, ajones@ventanamicro.com, aou@eecs.berkeley.edu,
 alexghiti@rivosinc.com, leyfoon.tan@starfivetech.com,
 paul.walmsley@sifive.com, apatel@ventanamicro.com, corbet@lwn.net,
 linux-kernel@vger.kernel.org, xianting.tian@linux.alibaba.com,
 David.Laight@aculab.com, palmer@dabbelt.com, andy.chiu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_133032_157084_D1696A9B 
X-CRM114-Status: GOOD (  12.46  )
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

On Fri, 18 Aug 2023 12:41:34 -0700 you wrote:
> The current setting for the hwprobe bit indicating misaligned access
> speed is controlled by a vendor-specific feature probe function. This is
> essentially a per-SoC table we have to maintain on behalf of each vendor
> going forward. Let's convert that instead to something we detect at
> runtime.
> 
> We have two assembly routines at the heart of our probe: one that
> does a bunch of word-sized accesses (without aligning its input buffer),
> and the other that does byte accesses. If we can move a larger number of
> bytes using misaligned word accesses than we can with the same amount of
> time doing byte accesses, then we can declare misaligned accesses as
> "fast".
> 
> [...]

Here is the summary with links:
  - [v4,1/2] RISC-V: Probe for unaligned access speed
    https://git.kernel.org/riscv/c/b98673c5b037
  - [v4,2/2] RISC-V: alternative: Remove feature_probe_func
    https://git.kernel.org/riscv/c/b6e3f6e009a1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
