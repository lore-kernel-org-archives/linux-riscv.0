Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C66C6FD1E
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 21:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vwzPDuQHeQilEc9Y25Ce5z9YRLrK3U4NrubMmTr28n8=; b=KtFW4QkZ4YDMu6
	2xMz6+sHJJHF+NjYPn5AHuqb+AjauogJsHDaNlQaD6ZZ5GD1pCwISG4hE+mwhTSQLnw3BCxcdoyEY
	gBtNLrK4i18gwhXVwP1riwoi4r3vnNLgh6GkGvM851/2fvW4SMe6c8XMna6nPphd7yOxHYKa45bCY
	vKV/PMgu0I2BKQesYMmsl253o+TCD8sM3bbdIOJSD6J9fnsDFn1IqYTmFAhjiI9CKixGge18xlWaS
	vr9dCGFukz9hMh/tCPcE+s+JIr+A61vQdsobHLEMCIXDTiiOQH8ZHe6cayvPV1ZpSFE5XEjUe4PGn
	TQOO0IxM7WmfYGr/4d/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZeQ8-002S32-Hc; Tue, 07 Mar 2023 21:00:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZeQ5-002S0K-Sn
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 21:00:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0DCBAB81A1A;
	Tue,  7 Mar 2023 21:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5137C4339B;
	Tue,  7 Mar 2023 21:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678222819;
	bh=R035qO4elolRiBgTsKLfOda7PNhEuWVK5e+ugrImQWk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=B4xv6ZfAg9QADG6doyg5GqIDRX2dnQwJgaV5FhFQqYVPdBfvqCJJPYOKADB3TTCip
	 KzGUartcrBR4hXgVvlqWM72XU4DbCM8xvFExNcZo5glTaZYZz1fm18iqhLWZiizds3
	 01ofB08pjA8yZCt4Ewfof1fT8T6IelSZ2L6eoc5VgLrArmGyzqPquLMkZc/MbTi2D/
	 ouEEIfMdCuoTCDkNoAYQT+CqJHARlCq7j/BkFmrDuLnGqBisHyKp6fJ9o3+y8j//M7
	 HtWfzobxr7d+nT8cR07YOA3bRwsBtvwg83ZN95Bsk360jGuR4mMizYjrJ4zGin148j
	 FGMuDOeJSJ/Fg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8C8C9E61B62;
	Tue,  7 Mar 2023 21:00:19 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] RISC-V: Stop emitting attributes
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167822281956.12297.16857267983914475678.git-patchwork-notify@kernel.org>
Date: Tue, 07 Mar 2023 21:00:19 +0000
References: <20230223224605.6995-1-palmer@rivosinc.com>
In-Reply-To: <20230223224605.6995-1-palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_130026_119326_44F8A39C 
X-CRM114-Status: UNSURE (   8.54  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu, 23 Feb 2023 14:46:05 -0800 you wrote:
> The RISC-V ELF attributes don't contain any useful information.  New
> toolchains ignore them, but they frequently trip up various older/mixed
> toolchains.  So just turn them off.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> Changes since v1 <20230223195112.10489-1-palmer@rivosinc.com/>:
> 
> [...]

Here is the summary with links:
  - [v2] RISC-V: Stop emitting attributes
    https://git.kernel.org/riscv/c/e18048da9bc3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
