Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F01CAC59A
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 02:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pntto6+uuF5QX5wjiyd7yzH40JM11G8hf5SFnvjZUfw=; b=s3lej699FnHWoS
	ravYBNtuwCK3Zv1v7fhmueezoYX5aH0A2rjPNyShcF9rlw+GDS8ufmYOobR7MGMlyVbUozi1MVOLu
	9AbG17pE4KGQCz5WDe58G1Qq80porrDLUh2u159muzn93PARZOrTclodij9DzYT+6ucbAQs8mEYvv
	TFYEa1m9INhaNeKY+TEWIKOtvVKOzWGBtSpTI8fTliZVCtJXG0XXqfQTGP0SYWzBW+ISLeUjaozvH
	jyq7DvJLDmtni8fADFviLnp2GZHQe7rLQ4ZQlV+CBN4kDQG4vo6aeu5K8R3T1CPY0Z7piPARpO0At
	cR4ACKYqjwu97MBuBzdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyi5h-00000009zPi-0D2U;
	Wed, 17 Sep 2025 02:40:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyi5d-00000009zO7-36wg
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 02:40:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6138844CF6;
	Wed, 17 Sep 2025 02:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A204C4CEEB;
	Wed, 17 Sep 2025 02:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758076812;
	bh=/S2HMi3usPSz32wfGIPF+rTLYNKndealNpX9ovOTxRM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OTo0eG04e9twFTepVCTYzVobxe+EIJigaScEgmbcQrfCSl44NK6jgQvJrqWyq46bq
	 UU7PHRQI7K2R8k/ltzQGTEhl1cp4VAN3sgMphvR3Iowy2mudXgw+DUxOb1YSSNCNVy
	 Q/HA8sVuG4lmN2gjW1SRwVhpkQ3cnYAxd+g4qGFSZByMlfh72pVBfnTE4h/fF+1MjE
	 E1tt0zKjSSVoY2z5zj0ypYribQAEWoFpjfhU8d3a3C1dLLbsygz7oTa23UUO8GhG7x
	 DEQ9df136oEN+iAjROowKLFnubG5BVoRYyqhuRYZYU+E2BAB7lHvFChY3gN7Ekc2bg
	 gYiYlQiByDWXw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D2639D0C1A;
	Wed, 17 Sep 2025 02:40:14 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] Fix riscv sparse warnings
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175807681324.1444719.6787626572646476134.git-patchwork-notify@kernel.org>
Date: Wed, 17 Sep 2025 02:40:13 +0000
References: <20250903-dev-alex-sparse_warnings_v1-v1-0-7e6350beb700@rivosinc.com>
In-Reply-To: <20250903-dev-alex-sparse_warnings_v1-v1-0-7e6350beb700@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, lkp@intel.com, viro@zeniv.linux.org.uk,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, cyrilbur@tenstorrent.com, jszhang@kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_194013_809946_A61804C7 
X-CRM114-Status: UNSURE (   7.82  )
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
by Paul Walmsley <pjw@kernel.org>:

On Wed, 03 Sep 2025 18:53:07 +0000 you wrote:
> This series simply fixes 2 recently introduced sparse warnings.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
> Alexandre Ghiti (2):
>       riscv: Fix sparse warning in __get_user_error()
>       riscv: Fix sparse warning about different address spaces
> 
> [...]

Here is the summary with links:
  - [1/2] riscv: Fix sparse warning in __get_user_error()
    https://git.kernel.org/riscv/c/fef7ded169ed
  - [2/2] riscv: Fix sparse warning about different address spaces
    https://git.kernel.org/riscv/c/a03ee11b8f85

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
