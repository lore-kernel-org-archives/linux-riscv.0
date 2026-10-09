Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2075CA601E
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 20:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lhss/eDKqQL7tB1pRd4BPZofEkYCDQXWvRUY2CsV3/I=; b=BkCWB5He2Wo/fV
	9FABbVfgm6rDrUkhes+0C6SVjA6xBKxcOHW4RtyaO4SomzW0sW0lad+k2m0EzQ3jFFhIZ5OPcdp0m
	44PllCX4CBcQamwiB7sYvgKG2mUH/WNdORYX00XFE8XKZ1dyklG/uvsFNmkuqADPIx4jhkuRCkZvk
	3oevtQiGoFzKa533dMPZMm7cesNfMAIf5aH5LJS/uyQ4V9bXKCtTod6yhF6tT50ECugnL01DsJQMC
	6bMRHW3ffzxHmJ26c1gkVkZ6TlApe8FWBFWhVytL/6FzVqWG0ZdsAOY0QkZKJQN1++brqsunoVTD6
	KQu1gJ1n0trGsXDwgb6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFGux-000000078lt-0Z41;
	Fri, 09 Oct 2026 20:10:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFGuw-000000078ln-1AP4
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 20:10:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ACB3343B6B;
	Fri,  9 Oct 2026 20:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 823791F000FF;
	Fri,  9 Oct 2026 20:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791576609;
	bh=yAtT7Kz/cfBbECexhY2+7vMzFYjycFt1jV6uHWCe2qk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=KuW/M6N/Jv+w8fSTI5MzC+c9uyJsMxvbGXsObHMBwAHcv9THa/zJNw6bKJbAShw+b
	 vo4r+Bin+QhP33tm/lxugoPH+tlrxXLdYq2PXG7LEpA8Rm9PbrObKEo3J/22umLOmX
	 J6pW9AV0n+1Rxc3sdTw6eUmSMMhezq88f+/bVbtCbHU/q8rg1HMrSuZtly5bTfvCrJ
	 pzuTkS+Nrg7nULbEPCcKpx2psI1+uWR2olv7EEwBAOUR5dHGgbiJfCwi+Dye3uNTnl
	 3VNLX/ZtnUsgaetwYGolyY055wcRD0nTv6z49gmPJl4Lm2lABU1cDz45QS71EshN6x
	 G/tZjYSKsz6Tg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7742D392627A;
	Fri,  9 Oct 2026 20:10:09 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v8 00/11] riscv: hwprobe: Expose RVA23U64 base behavior
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179157660809.984023.2184718764665109991.git-patchwork-notify@kernel.org>
Date: Fri, 09 Oct 2026 20:10:08 +0000
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
In-Reply-To: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
To: Guodong Xu <guodong.xu@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, corbet@lwn.net,
 skhan@linuxfoundation.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlan@kernel.org, chen.wang@linux.dev,
 inochiama@gmail.com, rdunlap@infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, conor@kernel.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, sophgo@lists.linux.dev,
 linux-kselftest@vger.kernel.org, tchiu@tenstorrent.com, fweimer@redhat.com,
 bergner@oss.tenstorrent.com, zihong.plct@isrc.iscas.ac.cn,
 mark.hsj@gmail.com, aurelien@aurel32.net, andrew.jones@oss.qualcomm.com,
 conor.dooley@microchip.com, qingwei.hu@bytedance.com
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
by Paul Walmsley <pjw@kernel.org>:

On Sun, 20 Sep 2026 03:18:20 -0400 you wrote:
> This series builds on Andrew Jones's earlier RFC [1]. It lets userspace
> check for RVA23U64 conformance in one call, instead of walking hwprobe +
> prctl across every mandatory extension.
> 
> The series adds a small framework that resolves profile-class bases (IMA
> and RVA23U64) from the kernel's ISA extension bitmap at init time, and
> surfaces the result through both /proc/cpuinfo and hwprobe. Later patches
> can add RVA23S64, and backward RVA22 / RVA20 detection, to
> riscv_set_isa_bases() without changes to the surrounding code.
> 
> [...]

Here is the summary with links:
  - [v8,01/11] riscv: Add B to hwcap and hwprobe
    https://git.kernel.org/riscv/c/fbab8abaac8f
  - [v8,02/11] dt-bindings: riscv: Require block-size for Zicbom, Zicbop, and Zicboz
    https://git.kernel.org/riscv/c/40623184c6f0
  - [v8,03/11] dt-bindings: riscv: Add Zic64b extension description
    https://git.kernel.org/riscv/c/3776fb1a1b6c
  - [v8,04/11] riscv: Add Zic64b to cpufeature and hwprobe
    https://git.kernel.org/riscv/c/7493567982b0
  - [v8,05/11] riscv: dts: spacemit: k3: Add Zic64b ISA extension
    https://git.kernel.org/riscv/c/7c4752c60f99
  - [v8,06/11] riscv: dts: spacemit: k1: Add Zic64b ISA extension
    https://git.kernel.org/riscv/c/1fc72ff0d3fc
  - [v8,07/11] riscv: dts: sophgo: sg2044: Add Zic64b ISA extension
    https://git.kernel.org/riscv/c/ca0c312bdf6a
  - [v8,08/11] riscv: Add a getter for user PMLEN support
    https://git.kernel.org/riscv/c/55458c7347a3
  - [v8,09/11] riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection
    (no matching commit)
  - [v8,10/11] riscv: cpu: Output isa bases lines in cpuinfo
    (no matching commit)
  - [v8,11/11] riscv: hwprobe: Introduce rva23u64 base behavior
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
