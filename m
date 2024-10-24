Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961D6CE8E9A
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 18:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CHDB1S4a+hJzyd+rcKCwfr5y4oLRjSDBg3w9jYskgyo=; b=Mb/KvKLjopZaAn
	wQbZiB3eD6r/SPyDqF4bSQcvNQfTiM3mfTiRSjnTutN9FHxfG0uPV8fTOYg3gpQVzoqU23YvJEfMF
	FXh2dBPVZeBRNe2cZRM8Oe9wf54dWSDGAFuhyROZarcgT1jSVJumTua7Tllel6L/78Tjy9ORR6zug
	0AMXy0MgaaMOeFdJNJoiYXPHZz9X7Sh+p3A1h+WGzfohNjpqokIlKSH7wd91psxoFXiw2IhfqDWSK
	B7kqe7mBg2Z0Y+xC9ykDJTNUXA0bllhNh8NFVuq8vfcJExLFDHrEWCVH04lWKbvU82pYZAIEyggvS
	91sCA110I8xfgcIP5U7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t42BQ-00000001Oq7-1Lqt;
	Thu, 24 Oct 2024 18:03:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41yh-00000001LXm-2Sz5
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 17:50:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1C2CE5C53B7;
	Thu, 24 Oct 2024 17:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CE8C4CEC7;
	Thu, 24 Oct 2024 17:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729792230;
	bh=+pour6+YaY4SzcGtmHKUEsoWqxLHnGev4U90Wz9GqWk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jt0no7hu3EJee0+p6oplwAw0WkGxRbl2JJTr4Ew8EqfROaafkBkgNThAn/EyJotU+
	 9fl7RnmrM8Gcd3sBHHUjjKMU4wFtXhVAv6TnyMVnaMxjVus9h3rAIRyXcAPuV6kGHz
	 3bo1dRPwQ8bS4c7WyKL8h/zkh+5nC3qReYjgJ0jYJcrw2rUEpZ3+29xes5x3hXxSuJ
	 fgSwqyOcq2ig3NkhpNxbF4r9usyGUii3CO3mZGT4yQH/fGXj5j2iRNhegvuKgLjX0K
	 /VTZv1UEq04pt2Lg4slJgGb4AID7RX/sKRzEONnWq/4segO/p5k8t7AvLj8VGrJj+d
	 8L3bbTcPTHp1Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F8A380DBDC;
	Thu, 24 Oct 2024 17:50:38 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v9 0/6] RISC-V: Detect and report speed of unaligned vector
 accesses
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172979223702.2327357.3480935063596875410.git-patchwork-notify@kernel.org>
Date: Thu, 24 Oct 2024 17:50:37 +0000
References: <20240820152424.1973078-1-jesse@rivosinc.com>
In-Reply-To: <20240820152424.1973078-1-jesse@rivosinc.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, corbet@lwn.net, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, cleger@rivosinc.com, evan@rivosinc.com,
 ajones@ventanamicro.com, charlie@rivosinc.com, xiao.w.wang@intel.com,
 andy.chiu@sifive.com, ebiggers@google.com, greentime.hu@sifive.com,
 bjorn@rivosinc.com, heiko@sntech.de, costa.shul@redhat.com,
 akpm@linux-foundation.org, bhe@redhat.com, apatel@ventanamicro.com,
 zong.li@sifive.com, samitolvanen@google.com, ben.dooks@codethink.co.uk,
 alexghiti@rivosinc.com, gustavoars@kernel.org, erick.archer@gmx.com,
 j.granados@samsung.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_105031_696681_C31BDE1E 
X-CRM114-Status: UNSURE (   9.42  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 20 Aug 2024 11:24:18 -0400 you wrote:
> Adds support for detecting and reporting the speed of unaligned vector
> accesses on RISC-V CPUs. Adds vec_misaligned_speed key to the hwprobe
> adds Zicclsm to cpufeature and fixes the check for scalar unaligned
> emulated all CPUs. The vec_misaligned_speed key keeps the same format
> as the scalar unaligned access speed key.
> 
> This set does not emulate unaligned vector accesses on CPUs that do not
> support them. Only reports if userspace can run them and speed of
> unaligned vector accesses if supported.
> 
> [...]

Here is the summary with links:
  - [v9,1/6] RISC-V: Check scalar unaligned access on all CPUs
    https://git.kernel.org/riscv/c/8d20a739f17a
  - [v9,2/6] RISC-V: Scalar unaligned access emulated on hotplug CPUs
    https://git.kernel.org/riscv/c/9c528b5f7927
  - [v9,3/6] RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
    https://git.kernel.org/riscv/c/c05a62c92516
  - [v9,4/6] RISC-V: Detect unaligned vector accesses supported
    (no matching commit)
  - [v9,5/6] RISC-V: Report vector unaligned access speed hwprobe
    https://git.kernel.org/riscv/c/e7c9d66e313b
  - [v9,6/6] RISC-V: hwprobe: Document unaligned vector perf key
    https://git.kernel.org/riscv/c/40e09ebd791f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
