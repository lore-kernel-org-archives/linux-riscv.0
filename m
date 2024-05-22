Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B34C25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 23:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eKmxyIrLGnalIMYpBbvUtpEEjMFmgF6Kc1EpPToCEQo=; b=d9Ff+ka5gPmRG4
	WAgGvFrDR984hHmKsaYjQvdXlJC7feyADN/3PSTukP4fdkoTsjAei5LOEpmgkpIMrUHzOu0yVTDYl
	0TMz5L13GGNgOFItbPqnM1j4PbQuBUnUOkdklegxe18ZKENPKJRPxwEB2Sbjdl6LNpjEgyoTIt2md
	IpY7WuVcwJbDWwS2LE55IZc7u8nRQpEgceJNHXDLI79uztP2XJdlIJXH0l+7nr6bAO+4cxhDDs2My
	WxNkFymil74cFePlAsPikmvOdK4YOI/Of5MV8kdkefAI2NVHAN9dgFft4fNDNrSBJaF3Qp0uK2pdz
	Q3+zI8BFlVZPH8JP8OAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vkf-00000004Va7-38mo;
	Wed, 22 May 2024 23:52:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vkN-00000004VN3-0cxx
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 23:51:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 91C3FCE137E;
	Wed, 22 May 2024 23:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC5CCC4AF07;
	Wed, 22 May 2024 23:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716421907;
	bh=ioi6hVc2nEfWRbNZ3lg5Z200sbO2gZVHrpry3fbgHJk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BELPVch4tSn7j38Q2vYR5hdVashLpRM9ExSHZwKcvf+4TrFUXuGVQQA3u7OS8dL98
	 cdroRK3JWQ2fBJQVqW75Xh0O5ouemy0W/xE0UFGLTri+QYoq6qfkOMA7ittCLgNDVN
	 Q3owqXjqHykWiXEIffm6vqHHZzd5jhafjeODEk+uuC7HCAd+RwkJZn7i7E7T0LCGZa
	 3WCgMob95z7L2h1HdT8xzNmpeSjzdvx9x/FhEvzqbarfReRyq+2g0hD2myMV8tNY4K
	 aHsDOqkNvqSwrS7d+wQLm2CnFZynaCXg6UwJO6mDW09ELVBtriIZhmrRSIEuAqHE31
	 zxujMedqGoANw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 94D65C43638;
	Wed, 22 May 2024 23:51:47 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/2] riscv: Extension parsing fixes
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171642190760.9409.9505694012625639228.git-patchwork-notify@kernel.org>
Date: Wed, 22 May 2024 23:51:47 +0000
References: <20240502-cpufeature_fixes-v4-0-b3d1a088722d@rivosinc.com>
In-Reply-To: <20240502-cpufeature_fixes-v4-0-b3d1a088722d@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, guoren@kernel.org,
 conor@kernel.org, conor.dooley@microchip.com, cleger@rivosinc.com,
 evan@rivosinc.com, palmer@rivosinc.com, linux-kernel@vger.kernel.org,
 alexghiti@rivosinc.com, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_165151_518320_BCA82547 
X-CRM114-Status: GOOD (  10.51  )
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

On Thu, 02 May 2024 21:50:49 -0700 you wrote:
> This series contains two minor fixes for the extension parsing in
> cpufeature.c.
> 
> Some T-Head boards without vector 1.0 support report "v" in the isa
> string in their DT which will cause the kernel to run vector code. The
> code to blacklist "v" from these boards was doing so by using
> riscv_cached_mvendorid() which has not been populated at the time of
> extension parsing. This fix instead greedily reads the mvendorid CSR of
> the boot hart to determine if the cpu is from T-Head.
> 
> [...]

Here is the summary with links:
  - [v4,1/2] riscv: cpufeature: Fix thead vector hwcap removal
    https://git.kernel.org/riscv/c/e482eab4d1eb
  - [v4,2/2] riscv: cpufeature: Fix extension subset checking
    https://git.kernel.org/riscv/c/e67e98ee8952

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
