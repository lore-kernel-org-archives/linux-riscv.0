Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9D9C4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Apr 2024 22:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQGMTV4jWAfFAymAnjl33X0itVBwtAwP5WawKtQzP6Q=; b=X7LTBd9rlozMIA
	kjZ/GLO5BrCQ5OXQ8TWZ1NSMp2OrfeCszVgKfhdY5Ye1btjqzPwA68mQejYdmvgSHgQdrJMHGxzfZ
	NWzbGqlYzs3ezFK2OU8U+q6g9k76+R/9VyQUY1FJmzeO4rMq4KI6xWtS4J7Z6XI7j6zb/DQxTr+Zf
	oHhQGdcAsnLC4JjFLFqZboM7dt7OIji4vrJyYZKfL67SJuXj9xvsdL96vB02e72gILMPlNLa22xgh
	/3gkJEzvIT9M9bHHcFKO694ZPdVawGJPVp/d3+UkcQPpOdMqADXaKcae9t1WZRux06c3cl6icnc+U
	Z0VplG32CiqKohycbm2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1CZd-00000000nlw-0Lgr;
	Sun, 28 Apr 2024 22:00:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1CZY-00000000niq-3Grm
	for linux-riscv@lists.infradead.org;
	Sun, 28 Apr 2024 22:00:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 341CE60BAA;
	Sun, 28 Apr 2024 22:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3285C4AF19;
	Sun, 28 Apr 2024 22:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714341634;
	bh=EWNgKDcuM8qhXi6R5O9suAUlCk52QhzDL58YgOELfUU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eQXi3i91aFyaGqoT/ZUdD4q6ZoCVdjv6wnJeOYr+FWzF+cIl2S+IQg2+XJOXuzfU3
	 M9X/f/kKs5ZavZDsQsJyMiV+W5wnMaS+h7PiGo8ImFH74GGFp1+O3SPdDQTMH7sTgx
	 2TZ6E32JcFwqw6P0o9W6n3FFazMKJC/dJEPUyfBHecn72onXYJKVJezPSDNRKw2IPA
	 QlwVFn3Eg3zYklt7Qc3/0ZL41IuwqAls4YxGyiI8+3/50UwCsX97ea4J0Y14NgkYWL
	 iXsPxauNlrFHjQStyNbK89kX+oYO/R/RyW0TE/Cajz3azYxjLHCMzMaBVnBQ0mjEFi
	 fTZJoPdEmjFOw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C18DCC4361B;
	Sun, 28 Apr 2024 22:00:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] Minor cleanup of pgtable_l{4,5}_enabled
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171434163478.22130.15340003456801994230.git-patchwork-notify@kernel.org>
Date: Sun, 28 Apr 2024 22:00:34 +0000
References: <20240320064712.442579-1-dawei.li@shingroup.cn>
In-Reply-To: <20240320064712.442579-1-dawei.li@shingroup.cn>
To: Dawei Li <dawei.li@shingroup.cn>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alexghiti@rivosinc.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_150036_887947_98BC88E9 
X-CRM114-Status: UNSURE (   7.99  )
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

On Wed, 20 Mar 2024 14:47:10 +0800 you wrote:
> Hi,
> 
> This is a trivial series of minor cleanup of pgtable_l{4,5}_enabled.
> 
> Change since v1:
> - Split into 2 patches, as suggested by Alex.
> - Add Reviewed-by from Alex.
> 
> [...]

Here is the summary with links:
  - [1/2] riscv: Remove redundant CONFIG_64BIT from pgtable_l{4,5}_enabled
    https://git.kernel.org/riscv/c/3a0dc44899d4
  - [2/2] riscv: Annotate pgtable_l{4,5}_enabled with __ro_after_init
    https://git.kernel.org/riscv/c/7a04dd8fd75b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
