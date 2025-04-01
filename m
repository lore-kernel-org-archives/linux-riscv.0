Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38793C36010
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Apr 2025 14:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HS5LFl/XhTeOL+w3ZpF9JDx8ADi+ZG3VoHeDggSoyoA=; b=wPIqR/IZdimjJt
	sYf9gWpkPOFj2H2PfxgV2ygrBg7Gjry5XrSXcDDwvbOlFuP0ub9zhqhdzN53bFj15B2bmg0jU0pdl
	Hd1uLIOqb0PVfQlKVR2rynjcy3UtjvqpdI2Y772wIAnrLn+acgli68Z2ATLL0ghiepOLLMhzL/tRk
	kik8PhuODP6XzwGiC8DhqmT1YCJTYNs8x1Zb0MHuKX8aliZcXUwQdAp6HBIsbLve9vEcn90x4jioT
	Kic7hytID01W/olLZQakDASNLx38q2/OSybJHvyeQLG52s8khp59B15LVcApFyDs555BnXzBmfDp8
	q2UGIFKgaInKKO8g38mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzcJX-00000003YBr-0THe;
	Tue, 01 Apr 2025 14:10:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzcJU-00000003YAX-1b2H
	for linux-riscv@lists.infradead.org;
	Tue, 01 Apr 2025 14:10:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9802B5C3FCD;
	Tue,  1 Apr 2025 14:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E85C4CEE4;
	Tue,  1 Apr 2025 14:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743516598;
	bh=t4ERt79E1MKZVCOHESPXrWSpOLzU2ctlJAkZUDmfa28=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hqDS994r9kCSuabYQox5+Z2L/OVBL82B1F+BkcOOzXa0tGwnEyZWyYOyBks0mSbs1
	 DBBlxOyRfW3OnRQ8qwxcH8jn5qTvIGYOsOApcEf0V8pY0wV9yWDq0piT+i9AYtP71I
	 PZJIPWiHaqCdrI2p7keBnxpxEk4Lete3whbtS5L43CalXmwJImHF8oj8+pqg4iKH2G
	 NIZ4cIq4PLbZT62viCxmg2kKJWTO2PAZRhMt3ERiTFM15sT9oXcTEVZv+16ORcyCTy
	 FFP/yrGVgaLY94ZfQtuFAwwZuekBK/ar6jg6nxmuLN3ioniYXeNh8tF8d977jQyvD8
	 O/IuWwqW9sIFQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34926380AA7A;
	Tue,  1 Apr 2025 14:10:36 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH FOR-NEXT] riscv: Add norvc after .option arch in runtime
 const
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174351663474.777137.11029884560691390580.git-patchwork-notify@kernel.org>
Date: Tue, 01 Apr 2025 14:10:34 +0000
References: <20250331-fix_runtime_const_norvc-v1-1-89bc62687ab8@rivosinc.com>
In-Reply-To: <20250331-fix_runtime_const_norvc-v1-1-89bc62687ab8@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 klarasmodin@gmail.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_071000_463533_CCE5C64B 
X-CRM114-Status: UNSURE (   6.82  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 31 Mar 2025 11:45:24 -0700 you wrote:
> .option arch clobbers .option norvc. Prevent gas from emitting
> compressed instructions in the runtime const alternative blocks by
> setting .option norvc after .option arch. This issue starts appearing on
> gcc 15, which adds zca to the march.
> 
> Reported by: Klara Modin <klarasmodin@gmail.com>
> 
> [...]

Here is the summary with links:
  - [FOR-NEXT] riscv: Add norvc after .option arch in runtime const
    https://git.kernel.org/riscv/c/95c18b7ccdd1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
