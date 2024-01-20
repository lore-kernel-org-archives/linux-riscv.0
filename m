Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FB2C47DD9
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 22:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ePOSTHR9w49HsUnIed6up/cd89KlTL1WnUEk/wwzk/Y=; b=dM0Cb2IHYgLDYY
	WsPGQHStImIIQQzTsCnSLLxGAvYJAiw6hY5yi5s9BIKnbG5NL8Z6IOsZex3t91Hqv3sxU4Jinb3di
	mfWL5O2GYtBVdqz+lwZvkyrZrrDLT9Ye7Hj2djmQq+6b9u2UuMrwLkyscZXYXVT41fpATjj62HILu
	2q9YKT3KU8wEEbgI7d/WO1na/KFp3vBOZSQ6m5tIQyn/3QKB6vfTEqOTORhQ2LuVn0tp1bS+qBw1p
	m3lM4GrTbSYzlyzlbCY7BBmzR0Gr3BSpDMTGrK4saHSIH/Zi2Z4zerbhuJRfiJwGPOV67ZExKLRhO
	dNsO9NIUmmJTXJ0B6z0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRJdu-008VIm-22;
	Sat, 20 Jan 2024 22:16:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbF-008OCq-0w
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 21:09:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 009B5B80937;
	Sat, 20 Jan 2024 21:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3DCEC433C7;
	Sat, 20 Jan 2024 21:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705784995;
	bh=76xbVIXKVqYfEqwY7yDUy2z34YtqsMOfXaiKMr2CblM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=C0518Ghq3hLjoNbFjrLBtjIke3NBfUfZ9GLWsgVrTwvKcrFfE9JOb1kRxhaQBwFHI
	 7SIJNVRICmNlIC9niMIjS8EiEtXKsBXiUwj9K6fkAHyQqJU+JW/jKdlalKpJwA3eRG
	 8hGSYBxE2/dPybOovOilg0emmnET2Asw8/USQBwFFyfGefjGLedazQrYggDN2/yZds
	 eQJtYNO8a3tN7CrRnLACwfCKm3gqDtxJlC3Yrwn3ucFSL3ORG82EdtDJ77nEYqj1TB
	 drqk2H+qc81JJOvTH8zhs4BIFRNu/kr/E2LA1oJyZ9c2NfdTD3PlXwNQ52obzbgPv3
	 V8i/ldlx8RByg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 91A34D8C96C;
	Sat, 20 Jan 2024 21:09:55 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/3] RISC-V: Disable DWARF5 with known broken LLVM
 versions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170578499559.24348.17111438888014376412.git-patchwork-notify@kernel.org>
Date: Sat, 20 Jan 2024 21:09:55 +0000
References: <20231205-riscv-restrict-dwarf5-llvm-v2-0-aedf00a382ac@kernel.org>
In-Reply-To: <20231205-riscv-restrict-dwarf5-llvm-v2-0-aedf00a382ac@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor@kernel.org,
 maskray@google.com, ndesaulniers@google.com, llvm@lists.linux.dev,
 patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_130957_472325_C1E72C6F 
X-CRM114-Status: UNSURE (   7.63  )
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

On Tue, 05 Dec 2023 16:53:49 -0700 you wrote:
> Hi all,
> 
> This series disables DWARF5 for LLVM versions where it is known to be
> broken due to linker relaxation:
> 
> https://github.com/llvm/llvm-project/commit/bbc0f99f3bc96f1db16f649fc21dd18e5b0918f6
> 
> [...]

Here is the summary with links:
  - [v2,1/3] riscv: Hoist linker relaxation disabling logic into Kconfig
    https://git.kernel.org/riscv/c/55b71d2ce133
  - [v2,2/3] riscv: Restrict DWARF5 when building with LLVM to known working versions
    https://git.kernel.org/riscv/c/ae84ff9a14a5
  - [v2,3/3] lib/Kconfig.debug: Update AS_HAS_NON_CONST_LEB128 comment and name
    https://git.kernel.org/riscv/c/a4426641f00c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
