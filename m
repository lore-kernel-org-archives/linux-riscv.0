Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0475CC87FCB
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 17:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ag0xfs+VMGm8A/Z/tYhrCIaQTRuddHZtu4e6w9ryIQs=; b=YbvkoQhNcR3kXQ
	zIiNC27ERoWSU6+m8n5iRaGlQ/QveiwhKFoCtax4O7pBzWEVY+8ShFSpBoSnb2EpW/7etp/KWw/Eb
	I4fAvEUR/cjS84hdqKdNd4QPw25dURjPjW6Nee76e2jBi2mL5+q7fI0CcMZdNngr+hkLOCb5s1p5p
	eDuX5DtsphGHmzTbAztNWv/9z1Ygyrdwe77rt+YPw8OOY3JKJ6rlDU+0qaCZhAPcse3rzqU8Z+rbE
	ofUp3yub2eFDBfSIVqK/GwdGctz25p/vtjO+C5QGzrk0Xgv0anhInA4el4vCAXPmKQ0WMSOANH2Ly
	N/W7O88xTbUf43MpUYFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhnv-0000000FtMO-2U8a;
	Wed, 06 Aug 2025 17:19:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhjl-0000000FsBp-39dM
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 17:15:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F81B60203;
	Wed,  6 Aug 2025 17:15:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4EAC4CEE7;
	Wed,  6 Aug 2025 17:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754500536;
	bh=fxGXWoIzmV7fwfLiALt+GghX9DniVQ8lfeVCx87P5kw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rai60qGbLRO3cvn0H8lxYf92NtVL9N8MDFzuvtcePewnRKY3yhlUlQl5wISrSFHEi
	 5AXxe0nJe2LFkEY8rZB+3sGS0JIIbvPPgiPogQrTG5hrudlRqZEROxqdHaND+zw4Uk
	 fhrVkXE+z1XGz4eUKvqKHFv8XRpLqQRpvyF/8rQp6WbRSiR388ezdC6FMDxMXqq6d2
	 OpLj8zbPy5GdgkktykgrhLnaxwxgTUJdFbETro82C49xwfMmBew2rv+EDT2cayoE3w
	 ehBvFr7dpJQNYUkLESaiKshOTROiHpeS31apO/Fl9bF4jrfxX+IsfJantZ1Tvt6BDw
	 RU9tdRCKAw4Sw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFBD383BF63;
	Wed,  6 Aug 2025 17:15:51 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] ACPI: support BGRT table on RISC-V
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175450055074.2863135.7748247249569837976.git-patchwork-notify@kernel.org>
Date: Wed, 06 Aug 2025 17:15:50 +0000
References: <20250729131535.522205-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20250729131535.522205-1-heinrich.schuchardt@canonical.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, ryan.roberts@arm.com,
 alex@ghiti.fr, rafael@kernel.org, catalin.marinas@arm.com,
 kernel@vger.kernel.org, cuiyunhui@bytedance.com, linux-acpi@vger.kernel.org,
 akpm@linux-foundation.org, lenb@kernel.org
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Tue, 29 Jul 2025 15:15:33 +0200 you wrote:
> The BGRT table is used to display a vendor logo in the boot process.
> There is no good reason why RISC-V should not support it.
> 
> Remove the architecture constraint.
> 
> Heinrich Schuchardt (2):
>   RISC-V: ACPI: enable parsing the BGRT table
>   ACPI: support BGRT table on RISC-V
> 
> [...]

Here is the summary with links:
  - [1/2] RISC-V: ACPI: enable parsing the BGRT table
    https://git.kernel.org/riscv/c/1f768661a03e
  - [2/2] ACPI: support BGRT table on RISC-V
    https://git.kernel.org/riscv/c/bf2825bf00ad

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
