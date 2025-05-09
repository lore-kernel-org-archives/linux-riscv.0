Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8609C3ABC9
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 20:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zt1tpIzripA2QtiAisHZZp/0ksOAoTCVcZ9xY5Gir6w=; b=M7yTxJTQap+I8z
	H9pLPRNaOQ3rSwpEROhmWg8tfNl20ymikQqjSmRs6KSjNO/0h8cs7608V2GCUUxBo9Gevdkgw4lSO
	cKPipbk0ZUpOw9oWcvToKgGljJZp9Jq/tQB6T436o2NxNLOypy2buvX3q1HAO7DR0t+hevj1jJfce
	D/G3aOq6p3gDxAGdSOfRt5WgSrl/EpMSMArdMae17vbj1S7Yp+gt133JwwG0G0F7FocCcYM8ZTr6C
	f+ydZcVoldJstPn0miDlibx3ELxSfyFMWdKoS6lprbbwmsC79sfePFQHsZJWyAgB7T6x/FZt2bfH/
	AYTlZ2+8gAiJx0Fl5EoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUIA-00000004nGb-1bQ1;
	Fri, 09 May 2025 20:25:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRXt-00000004RLi-00V8
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 17:30:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 38820A4CC8E;
	Fri,  9 May 2025 17:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B86C4CEE9;
	Fri,  9 May 2025 17:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746811799;
	bh=cPhjasTwI2UlEzhggO3BfP5IeHfjz55rUCtySA1MPZs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=S1Vzq6pkJKMtybevOYaVo+IXvGH9iHyt73kURGEzn0tBT7dMlc+WGknIq8ZFywpB/
	 qXYXmoq0TCaXPzQq6itNVVd3AYUhdZ6RcydeNgRW8raQp/uH/ImxtqUEThp3T6OZPF
	 3y7ixjn93OgRSmT+QpjQ+pqm9PUFm9evikv6r+mv7q/PXaXOaWYY/n8OqfXWUOvCSO
	 BRu/6hQTYrWgPOFizXnYvp4jceTcFUn7uVqOZISdsMcKbaIi/b9clf5uH7Eg4O/I8D
	 RakzsEDIsD7jxW8jgm3Pa7u9Pnb25q19Sfs0Bi4DK/0cgElUkTRjXgeAERyfw+D9M2
	 MEdKkuCHPBnOw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E4D380DBCB;
	Fri,  9 May 2025 17:30:38 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] Drop explicit --hash-style= setting for new
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174681183698.3697320.7074504502229425253.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 17:30:36 +0000
References: <20250224112042.60282-1-xry111@xry111.site>
In-Reply-To: <20250224112042.60282-1-xry111@xry111.site>
To: Xi Ruoyao <xry111@xry111.site>
Cc: linux-riscv@lists.infradead.org, guoren@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, palmer@dabbelt.com, i@maskray.me, yangtiezhu@loongson.cn,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_103001_110722_C8776C49 
X-CRM114-Status: UNSURE (   9.60  )
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

On Mon, 24 Feb 2025 19:20:39 +0800 you wrote:
> For riscv, csky, and LoongArch, GNU hash had already become the de-facto
> standard when they borned, so there's no Glibc/Musl releases for them
> without GNU hash support, and the traditional SysV hash is just wasting
> space for them.
> 
> Remove those settings and follow the distro toolchain default, which is
> likely --hash-style=gnu.  In the past it could break vDSO self tests,
> but now the issue has been addressed by commit
> e0746bde6f82 ("selftests/vDSO: support DT_GNU_HASH").
> 
> [...]

Here is the summary with links:
  - [1/3] riscv: vDSO: Remove --hash-style=both
    https://git.kernel.org/riscv/c/2940954c1ac5
  - [2/3] csky: vDSO: Remove --hash-style=both
    (no matching commit)
  - [3/3] LoongArch: vDSO: Remove --hash-style=sysv
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
