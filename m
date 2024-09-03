Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D277ECD343B
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 14:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VeLEv5l1+X89A+Ju2APdjYRG7FjHcj5SdhyhoWE/vwE=; b=cQzK9mfom+yNKv
	3zbUiUgBz7B9ZXBZzEoN80soJR8hRjRfBVwxYDzjAgl4IxKtBtOOwDjRTG8c+oXFqA0hVqNJpmfdS
	luQBNZGzZc7QlA1+ntoxbU8S86MK2vJ4r+om3m+tAOlBc/P4Bo/FtMMAnKeiz9ssgFEZxm9z1CBuu
	c2iuZz/AC22bYNfMib5JjKHsBWQ2ofkhP63ApqmuAeclpO3C/9MDoBryramZh55gE8gcZ+3N/DVKy
	+HhJp+isdxEy/ljkcgcwlF/30GlCLpyAtcl+4Dg8Q7XLHr6ebnVq0bBJcZp9TVZFHDFS0s60HV0RZ
	tDW5mUBljArjxFJPd65g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slUcN-00000000c3X-3xL1;
	Tue, 03 Sep 2024 14:34:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slUYL-00000000aim-0ne5
	for linux-riscv@lists.infradead.org;
	Tue, 03 Sep 2024 14:30:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6A21D5C55F4;
	Tue,  3 Sep 2024 14:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A67C4CEC4;
	Tue,  3 Sep 2024 14:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725373839;
	bh=8hIsX3Gtu284V91gL7N6GgFB7NiLigl/6FXHMFI6wzo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cMPhAULPDWSY4mHmyASlsRi7jgsoFCb5qncdk7Jm9YyLKiP1V8Y7lViX0Z6v3UdYZ
	 3hKlLIzyD2wxeMBcwS/sM7csrpCqg2Gyjj2PTMKkz1HE52x+8QTO9oVINqw/wZ2dUO
	 K2GI7Dq8dYPFk8SxBa/XdFK/R9fQuUz2A4ORDKHr/WrikJkdbS9Am/Mrvvj1XDChZv
	 3Ox2jpueSGC5u4BsN/VgskFOuyyrur94yhgpyyREzRNvsoDIOZa9PFmdM44MBZo0T9
	 SIeZAFnHAaXTNNGkeABnF026+EK3JOBXANHgq4uXE78oPEQayzpL+KZbZR908BCG70
	 yWXz2nhHg9VtA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70EF53822D69;
	Tue,  3 Sep 2024 14:30:41 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] riscv: mm: Do not restrict mmap address based on hint
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172537383996.320952.12145351414026889643.git-patchwork-notify@kernel.org>
Date: Tue, 03 Sep 2024 14:30:39 +0000
References: <20240826-riscv_mmap-v1-0-cd8962afe47f@rivosinc.com>
In-Reply-To: <20240826-riscv_mmap-v1-0-cd8962afe47f@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, corbet@lwn.net, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, shuah@kernel.org,
 cyy@cyyself.name, rsworktech@outlook.com, alexghiti@rivosinc.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, palmer@rivosinc.com,
 linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_073041_340276_CC6A951B 
X-CRM114-Status: UNSURE (   9.13  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 26 Aug 2024 09:36:44 -0700 you wrote:
> There have been a couple of reports that using the hint address to
> restrict the address returned by mmap hint address has caused issues in
> applications. A different solution for restricting addresses returned by
> mmap is necessary to avoid breakages.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [1/3] Revert "RISC-V: mm: Document mmap changes"
    https://git.kernel.org/riscv/c/954260ff5a46
  - [2/3] riscv: selftests: Remove mmap hint address checks
    https://git.kernel.org/riscv/c/83dae72ac038
  - [3/3] riscv: mm: Do not restrict mmap address based on hint
    https://git.kernel.org/riscv/c/2116988d5372

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
