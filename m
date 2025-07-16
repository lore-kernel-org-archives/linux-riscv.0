Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA976C83F1B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 20:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CEeMo9wK469COHFqsD9ypmjbuwbMMAFN4o9Hm4BX5Lg=; b=r0EsuDr03TgkDe
	qssw2AiBEq8Q2rT6TiYBHF3czt3dmaCYjeosZsjPlUDAB+aXlLnHYJdPSKtJz6Iyk5SQDLNNRWerG
	xpxTs0ZBhDzuhoYwokVslB3MKFM7ukIucobIfSFnqIeS0UuO36xg2y5VGRA2sl6+O3QYRQMj0grh8
	k7Fn7n7f7lTZ/q5wP0YmLNosnbEFiRitMS/G0IQjzuDFA5vnJ3yrj0wroL6Lp3xddoPOHL8+phLuZ
	KP4kpo6m4Iu2RLTepRgf1U/GzWw6orI0cLpwoVreukIH1Vj2lQS1Nxwv0MITWfZgE7g4GCUeHyLfd
	xLmuaP+xfMH3j5j4bJbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc9Dd-00000008eX2-3rZH;
	Wed, 16 Jul 2025 20:59:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc8I8-00000008YxY-3sXA
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 19:59:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 30125A575FD;
	Wed, 16 Jul 2025 19:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA57BC4CEE7;
	Wed, 16 Jul 2025 19:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752695987;
	bh=Qon3/JcrgcY707eTNDRNZp6SK/UyyLEnsHTNMdoXAgo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TaTedlCNJd5gRZa4PoSkQqTIF/m80DrjDrbhcFv2BA1Wj4inrgv+nb0EWEIEwyZwx
	 ljnJFFWGQ2M8zCHsYhvPwE/9DXi3sIvqdyi28YPnKWBHFr319FRqYHd4ChKQ7LwQOP
	 RJdVbUnvIZ6Trl6XvGpi4JvZZN4j0Beu/AVyPzJw+mvPgH2ZY7LsAtuHB4puRKMA25
	 CYxVcpw1HOQvuFQW4dSC7MsY/Hsm08gcHJ3syrjT2cQ5cYOStbEoYHhxxia7dhjtCv
	 4nK+ev/BIP7ql2+PIoSLTKD+PgfEs/qOJA2+GeW3AmNBes3nrsMUOkDyQs+7MqLcV2
	 sxd+ATEH/BRBA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4BFAA383BA3A;
	Wed, 16 Jul 2025 20:00:09 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: ftrace: Properly acquire text_mutex to fix a
 race condition
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175269600801.1308944.13355512366921305547.git-patchwork-notify@kernel.org>
Date: Wed, 16 Jul 2025 20:00:08 +0000
References: <20250711-alex-fixes-v2-1-d85a5438da6c@rivosinc.com>
In-Reply-To: <20250711-alex-fixes-v2-1-d85a5438da6c@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, rostedt@goodmis.org, mhiramat@kernel.org,
 mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, rabenda.cn@gmail.com,
 wangruikang@iscas.ac.cn, ziyao@disroot.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_125949_035040_9237C2CF 
X-CRM114-Status: UNSURE (   8.20  )
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@dabbelt.com>:

On Fri, 11 Jul 2025 07:38:38 +0000 you wrote:
> As reported by lockdep, some patching was done without acquiring
> text_mutex, so there could be a race when mapping the page to patch
> since we use the same fixmap entry.
> 
> Reported-by: Han Gao <rabenda.cn@gmail.com>
> Reported-by: Vivian Wang <wangruikang@iscas.ac.cn>
> Reported-by: Yao Zi <ziyao@disroot.org>
> Closes: https://lore.kernel.org/linux-riscv/aGODMpq7TGINddzM@pie.lan/
> Tested-by: Yao Zi <ziyao@disroot.org>
> Tested-by: Han Gao <rabenda.cn@gmail.com>
> Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [v2] riscv: ftrace: Properly acquire text_mutex to fix a race condition
    https://git.kernel.org/riscv/c/e3f16d63d54e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
