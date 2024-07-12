Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052C8C3DA4D
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2024 10:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rcR8Y9KFkBrVAjy02jvfjAzqXrxty0Xxm9lhZhrkNww=; b=raVu7W5L2Ys16s
	MxxmfvdFGIEgdGOpQtSUr4wYbDjuBa7mu1DiyPIpqIou3TBHYafZjWCgfajUQbCNM+BYF1+5vqUfQ
	PM4oVJsyrMJrnhrGdcbhEsF+h+RabQHMkGZGctebXLCOIPLEBmufW552UEt8ZTDmc1+i6eA5mdzIK
	6OWxluskdLGPmV/UuDX8fpMrFRikgoyklCNoKNzN8H3c0ffsiYPiMOTm4YixKdHAI/cdjBjh7GIRL
	PNU2bx4KhIYZ1BkYC+mX+tHolhqePlfnQiGoyCA1H9IsaCukXzXjY/pSE0J3P91tSoJRVl7WmDh1w
	KotjvSFhRI3qD2LIjeXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSDOL-0000000HGJP-2gm8;
	Fri, 12 Jul 2024 10:20:41 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSDOF-0000000HGG4-0aiE
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jul 2024 10:20:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5C9E9CE1A35;
	Fri, 12 Jul 2024 10:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3984C4AF0B;
	Fri, 12 Jul 2024 10:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720779632;
	bh=VVoIxpcBpsu5DTyIieNUadbasv+xGN5WhTLbUa6mR/c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HuCJckfV+Y2YomYDLLyNFm4QYZDL+JVt6WlrvWFNYv6yVHh+6d8bHsc2cHao9BEVH
	 7+E5qsJrddW46aPiQAOXRfzEHH1QqtIIybderNU55GqK6rQJTon8+Zx/clW7BIkc1m
	 b5VBcEAyekiCYDfxuO662s8FQXmWEecRNfBw9b63v2EiczLsNSsrsaatrWkwY3RWFZ
	 AXhm4TZtuLKSkDy/3obgSBFF/UuPVIfScVJggzpu3/xoTWaV450mdXkWhUppfUQJfF
	 SrWD0hBQ7HXir7SIl28OHO2epJ8m/fkNAZEV20EujfQPjAF/A1C7Gu0JV6flCEimTN
	 j/JbUo4xYZn+Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 90E99C43468;
	Fri, 12 Jul 2024 10:20:32 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5] riscv: hwprobe: export highest virtual userspace address
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172077963258.4770.205626830375405089.git-patchwork-notify@kernel.org>
Date: Fri, 12 Jul 2024 10:20:32 +0000
References: <20240410144558.1104006-1-cleger@rivosinc.com>
In-Reply-To: <20240410144558.1104006-1-cleger@rivosinc.com>
To: =?utf-8?b?Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPg==?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, corbet@lwn.net, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rehn@rivosinc.com, charlie@rivosinc.com,
 sorear@fastmail.com, jrtc27@jrtc27.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_032035_527160_2FB5C1CA 
X-CRM114-Status: GOOD (  10.84  )
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

On Wed, 10 Apr 2024 16:45:57 +0200 you wrote:
> Some userspace applications (OpenJDK for instance) uses the free MSBs
> in pointers to insert additional information for their own logic and
> need to get this information from somewhere. Currently they rely on
> parsing /proc/cpuinfo "mmu=svxx" string to obtain the current value of
> virtual address usable bits [1]. Since this reflect the raw supported
> MMU mode, it might differ from the logical one used internally which is
> why arch_get_mmap_end() is used. Exporting the highest mmapable address
> through hwprobe will allow a more stable interface to be used. For that
> purpose, add a new hwprobe key named
> RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS which will export the highest
> userspace virtual address.
> 
> [...]

Here is the summary with links:
  - [v5] riscv: hwprobe: export highest virtual userspace address
    https://git.kernel.org/riscv/c/c9b8cd139c1d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
