Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E887CE7D10
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 11:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PGJpc3lJnunejLFgYms1yVRmZmWP1LRa1L/0/5j8kKw=; b=ec64L9GXkMcVyu
	Pge81qOl1O1Lu0kfhPuZqUPT/YLkOdMt8y6V9Rs8y2QD8aMhkfsRWZg974v/ekeAXHjoxlSid6+AC
	d26EV0JUYKM0c9yHmMVEQNPw9nrcHz1bqugFlYPrdIK0QAwZunmApo42g6+jRlaoehc616OkVFf5T
	HDMfeYCjNkjlLTHNjYhXOBAwn1D6T7elzJ5h7glQsbLNYhmCPmLiczT4lGMabnBqAFRaj2noxr83W
	umkrn6Ff+COka5QzMn2jWkKwdV629t1mNMAs1DXXtIN5F/4ZNuvftj4c5K9RWhSf4y5d6irekKKlM
	Nbc3svHefYcJnO8jAqhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svbPV-00000002aVv-2lKc;
	Tue, 01 Oct 2024 11:51:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svb9t-00000002XJe-29Wb;
	Tue, 01 Oct 2024 11:35:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B84BA5C4D92;
	Tue,  1 Oct 2024 11:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 992EAC4CED4;
	Tue,  1 Oct 2024 11:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727782512;
	bh=pBM/wRL+lfqLhqTemX0sqxKvvLKDtdNuxSbpmzXLsPo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=os0je07SN2Twab2iTA8ds5jr5JW69ruk1XqE3xb887+DUhf0QhosCpCTIvz2a5+TK
	 Ppw83M5V7LN7ldTX3hdVnSbmVQ5lU6mpfyexuwL+RARDfnO3u4btb6l7EDgFMD2aJ5
	 4tI1ECVeFf4dcugk3dcrFa5EnYLtPuYlTxiEQ+n9kBdtvSFAqVNPyFJu7oNhV3zIie
	 j6gm9qzNsy4z8phLxWGFRq3Q+TMYPSJfxipRmEWoMZDeWukP8fs4lB2S3YGAs4XIO1
	 Doxoc2jxb3CvAHA6e1pDj6RBg88fMwtHzDgwOwBawIBoy9Q43He/7u9et/aTvHXxft
	 8ehcGc3P0bn0g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB832380DBF7;
	Tue,  1 Oct 2024 11:35:16 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] Fixes for KVM PMU trap/emulation
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172778251574.314421.15171056255748157228.git-patchwork-notify@kernel.org>
Date: Tue, 01 Oct 2024 11:35:15 +0000
References: <20240816-kvm_pmu_fixes-v1-0-cdfce386dd93@rivosinc.com>
In-Reply-To: <20240816-kvm_pmu_fixes-v1-0-cdfce386dd93@rivosinc.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org,
 atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, ajones@ventanamicro.com, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_043513_660583_C748AEA6 
X-CRM114-Status: UNSURE (   9.38  )
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

This series was applied to riscv/linux.git (fixes)
by Anup Patel <anup@brainfault.org>:

On Fri, 16 Aug 2024 00:08:07 -0700 you wrote:
> This series contains two small fixes to improve the KVM PMU trap/emulation
> code. The issue can be observed if SBI PMU is disabled or forced the kvm
> to use hpmcounter31.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
> Atish Patra (2):
>       RISC-V: KVM: Allow legacy PMU access from guest
>       RISC-V: KVM: Fix to allow hpmcounter31 from the guest
> 
> [...]

Here is the summary with links:
  - [1/2] RISC-V: KVM: Allow legacy PMU access from guest
    https://git.kernel.org/riscv/c/7d1ffc8b087e
  - [2/2] RISC-V: KVM: Fix to allow hpmcounter31 from the guest
    https://git.kernel.org/riscv/c/5aa09297a3dc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
