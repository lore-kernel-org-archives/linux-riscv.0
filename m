Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70339C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 23:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MwUEUoKMyyDAp4SszDam8hmYPfEFyTfGxG5yQda/b58=; b=NrvBzThaH/e7gL
	NYvG+ea1c1GwPv/nlBDRZh6I9gomLrsua4FEt30wE//B5N7rCAdgriB0A1c1/CKOzyzm6phBBRbf5
	Uue2ibwWqOTDkK9ZyfZWFLVoqpeWZ8LycA82vJ02H6iVO/UqOns8eq5BtLZKiRSuH/eire23vVxpu
	BjI+uXg9durmZbVu7VJ6TbaXeFh6zNzO93qy8jRtFeoJG5HajUVun5UAzONAVJgzzeyuTIlhI/DRV
	jBIHi0H6mVliPI/qtuE2cDc5v/HKlqPSPfgYXekHfDNAtv2GvNcjHwd8dWL1DJ6V8eXxmvKcImzpu
	SmEPE9JFs9Hi+R+MsnLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNjC4-00HQQa-NY; Thu, 02 Feb 2023 23:40:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNjC2-00HQOt-Bs
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 23:40:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0C67761D1D;
	Thu,  2 Feb 2023 23:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67266C433D2;
	Thu,  2 Feb 2023 23:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675381235;
	bh=X9bDIdd9G4XOAEuj0SCj0ZErX/3XP2gdcDvXhK28+bQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KtSrfD6io6ixkbo+0TXQPMrMQ+j0uodNUDq7CW4bECzckfuM3eylDqiRYuCnsVFsw
	 LLAMeGd7yIgGTa1NE05l3JiG+we096dz2Bfpjxsb+JKK1LBkN6cEOYM/cVQOd6BhdJ
	 7FHiusrIqOZUnUM1DzvXvihTBQdLnoszjEVTiyy5zh0u3jM8NSaC5AA8kjaxvlWeyT
	 tDXPR6rIPn/v1oufPFKpLRGVasbjWk/R0RsJYUgpaVc8v4wc2dKxGFJxR3/DrbADka
	 XvWoDPI+ntQnf03f/t4lQd2vxkGT3ps5NjgbWu5t57PVmmsVWvtsU9ctYyXOGn/Ipw
	 p0IIoPGEbn0nQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 475C6E5250B;
	Thu,  2 Feb 2023 23:40:35 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/2] Zbb string optimizations
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167538123528.14322.17027514117516056741.git-patchwork-notify@kernel.org>
Date: Thu, 02 Feb 2023 23:40:35 +0000
References: <20230113212301.3534711-1-heiko@sntech.de>
In-Reply-To: <20230113212301.3534711-1-heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu,
 ajones@ventanamicro.com, jszhang@kernel.org, heiko.stuebner@vrull.eu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_154038_457170_01FB5604 
X-CRM114-Status: GOOD (  12.71  )
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

On Fri, 13 Jan 2023 22:22:59 +0100 you wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> This series still tries to allow optimized string functions for specific
> extensions. The last approach of using an inline base function to hold
> the alternative calls did cause some issues in a number of places
> 
> So instead of that we're now just using an alternative j at the beginning
> of the generic function to jump to a separate place inside the function
> itself.
> 
> [...]

Here is the summary with links:
  - [v5,1/2] RISC-V: add infrastructure to allow different str* implementations
    https://git.kernel.org/riscv/c/56e0790c7f9e
  - [v5,2/2] RISC-V: add zbb support to string functions
    https://git.kernel.org/riscv/c/b6fcdb191e36

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
