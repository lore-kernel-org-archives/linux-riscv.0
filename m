Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93F5CE7D12
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 11:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WKtgpjihJOoxXzJp2/XldWBTs9EmkHw/z1E2MUA42EA=; b=VFEHN1oB7xNiga
	o9xnTSTQuGE3QGZwtjhiZs2tvJb4aNcfNPohZFqxeTxVFkBhLETc3n10nC6j6cWEeplHahENNsEMR
	Ez5MB0Ge3JlCi4YTGJsPFg0h0ssCuE3Iuh8dhVruPLBuegbIc/Xa+n83LvV/g3qz3NrJThH0Kuyps
	AMBXzH0IElYAD9ODhoAqqzIe/yfyqR1mWhS6NxB0pzAUmB2AHOO+mOkzP03G9vOl0hpZMbpfPsDDb
	Cjod+DKxqHsSkymGnc5St/HxoAvyhMO1CTCf4s4G8t2s9MX4EkzduEwEGwYAOA7/XU3NE+rLxTtSt
	9/KJEPR+YStV9tptGDhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svbPU-00000002aUv-1TXy;
	Tue, 01 Oct 2024 11:51:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svb9s-00000002XJD-1nzy
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 11:35:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7B3D95C4D08;
	Tue,  1 Oct 2024 11:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566F5C4CECE;
	Tue,  1 Oct 2024 11:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727782511;
	bh=11ixGMiy4P5OEvKM+IS3Ql37oz30zYU1wmZDtstmxAo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iFwht7MbXQlFvMtvfhQJJmjjjbBnN1fMUwVS79nG/JzTESaSbzCZ8IV1mO97NJeVO
	 uPZwP7SuJl1E/2sJaIhNZqIm3A0/8+LBu/GOm0o+h3cYNrul8XNO/3z0WpTxPT5wgT
	 ctQxhlbiePJUmWrbj6aCaOpAQzK5b6U7uhkr0nIFoZ78/RIPzU5Mw5/x92+hwbezMT
	 rmUeeCMDpukng9rWXPITx6zfHDksBrHi2SLbWZQQMqPKukUt2i2spv4jHN1xujBOJN
	 pKLbhHiPfPn5inrvvZR6fDsU/ODN7S6/J4dSx+gK+/LtsLfrh7P3DRhKVtYnywu+bb
	 Yrkzvi6jw/vMg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADEB3380DBF7;
	Tue,  1 Oct 2024 11:35:15 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] KVM: Coalesced IO cleanup and test
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172778251450.314421.17878360494032462055.git-patchwork-notify@kernel.org>
Date: Tue, 01 Oct 2024 11:35:14 +0000
References: <20240828181446.652474-1-seanjc@google.com>
In-Reply-To: <20240828181446.652474-1-seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: linux-riscv@lists.infradead.org, pbonzini@redhat.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, ilstam@amazon.com,
 maz@kernel.org, oliver.upton@linux.dev, anup@brainfault.org, paul@xen.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_043512_558310_A8107FA1 
X-CRM114-Status: GOOD (  10.89  )
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
by Sean Christopherson <seanjc@google.com>:

On Wed, 28 Aug 2024 11:14:44 -0700 you wrote:
> Add a regression test for the bug fixed by commit 92f6d4130497 ("KVM:
> Fix coalesced_mmio_has_room() to avoid premature userspace exit"), and
> then do additional clean up on the offending KVM code.  I wrote the test
> mainly so that I was confident I actually understood Ilias' fix.
> 
> This applies on the aforementioned commit, which is sitting in
> kvm-x86/generic.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] KVM: selftests: Add a test for coalesced MMIO (and PIO on x86)
    https://git.kernel.org/riscv/c/215b3cb7a84f
  - [v2,2/2] KVM: Clean up coalesced MMIO ring full check
    https://git.kernel.org/riscv/c/e027ba1b83ad

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
