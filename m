Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4DCC4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Nov 2023 15:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JcUZVTeiH0Lg1U0AmzH2rjd3aDzHVV3PpObD7uYtRLY=; b=ZpbKFQIic26XsR
	oOxdOD0QCCg3CmdUzUqAAWERuxWZniaLudZrem0oTKPYL7z6+LyL+ZUMX0vWMsnlS6zsKNF3QU8Ho
	pjv8tlPafcL4RaZyO02XVWnBBm4IRTnX3Q91yNydPVMjip+04S2kZBs01jjdp0yE4QmF3LUK1Rr4h
	K0oRNTJDgArMFxWHPTkKT6bpplIIiFrEoWRA21HFXh0qM3IU4p9X1D7ZXVuhi2NhaOO0HP2Q817jo
	toTkX2zdfhYnZPo6+XBslmUDY/8DXdkVxe0yk9ieCUyYObefR5KhGabWXOYby05P+mHQig8oCqBln
	ywR8af12aTj/gAHpL4tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0kCQ-0049bu-1q;
	Wed, 08 Nov 2023 15:10:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0kCL-0049Vv-1w
	for linux-riscv@lists.infradead.org;
	Wed, 08 Nov 2023 15:10:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4976D6162D;
	Wed,  8 Nov 2023 15:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBCC4C433C8;
	Wed,  8 Nov 2023 15:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699456224;
	bh=XbGlPv0b5SBtEHY5S7d59XMF5q67mjyCN580ztwB5g0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=doeTyDK4syh9T3j7FPWKQIetDfn7fnuG4nN7/SG2rDekGh8OSN1jrkWo2nVi0gx67
	 hPjS/DkmIWSesyRgnDW7i+YKIM7ymlI80hlfWg8Bpl7KlXckULmzlKkKhvHpGZLQaZ
	 1H4BQ+VYLkUUoil281vfOEIEbI3YzGKR1YX1pAw2Ejjl4fSwM+7Bq8szxavREhinbk
	 2NiwyOVj1UfaARh/0oOv8TAc9DsjZPT55Uej5elzIen6JwSLXzTKt+YL3OWZQzQCOX
	 Ih4KHTdYNco32SlWUGbiS+6+OTmeDxi/cJu2g4aOb4VMVAPMRX3L9R3wyEH7JLqw/u
	 d3YVNYWslH7fw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D1522E00086;
	Wed,  8 Nov 2023 15:10:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v9 0/3] riscv: Add remaining module relocations and tests
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169945622385.21527.15015500547019936050.git-patchwork-notify@kernel.org>
Date: Wed, 08 Nov 2023 15:10:23 +0000
References: <20231101-module_relocations-v9-0-8dfa3483c400@rivosinc.com>
In-Reply-To: <20231101-module_relocations-v9-0-8dfa3483c400@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, ebiederm@xmission.com, keescook@chromium.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 schwab@linux-m68k.org, emil.renner.berthing@canonical.com,
 samuel.holland@sifive.com, nelson@rivosinc.com, kernel@esmil.dk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_071029_715131_73C54476 
X-CRM114-Status: GOOD (  12.61  )
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

On Wed, 01 Nov 2023 11:32:58 -0700 you wrote:
> A handful of module relocations were missing, this patch includes the
> remaining ones. I also wrote some test cases to ensure that module
> loading works properly. Some relocations cannot be supported in the
> kernel, these include the ones that rely on thread local storage and
> dynamic linking.
> 
> This patch also overhauls the implementation of ADD/SUB/SET/ULEB128
> relocations to handle overflow. "Overflow" is different for ULEB128
> since it is a variable-length encoding that the compiler can be expected
> to generate enough space for. Instead of overflowing, ULEB128 will
> expand into the next 8-bit segment of the location.
> 
> [...]

Here is the summary with links:
  - [v9,1/3] riscv: Avoid unaligned access when relocating modules
    https://git.kernel.org/riscv/c/8cbe0accc4a6
  - [v9,2/3] riscv: Add remaining module relocations
    https://git.kernel.org/riscv/c/8fd6c5142395
  - [v9,3/3] riscv: Add tests for riscv module loading
    https://git.kernel.org/riscv/c/af71bc194916

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
