Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD332C6FD1D
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 00:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jRlNsb+GkM1M3CEsQfqtxvX9edPA9PzGP6mNbhNXFDE=; b=pE7xED8yAw12va
	fIpOqoBaNaWoW29V2E6hoZaOLAfW2TE34asXXL4BODulitZ0URp8zcqrD/9ZpG0N2ROSYxHYMgd5b
	428qu9ypN75Bf6JRkVxbkWlUwUzWJ4pxTclcZMGNiA4qbb2O3aHsxMcOviuDH6axwKkRXM60TzbXW
	qnTLpOkVJx/j2OLdRoF/mD8a8jKYuZxqqa+u1ZEW/IES5tmdruw6a+M5OK8QMqrcs4EhmuLNzvSkv
	pNTO01Bds0SDSLXQ0u561hkabKBM4lJ+o0aMI4dOHRUL8s/CGESEakc2LMODe1HuICoAuZ29+6p0r
	aapLfNY+LUjmpgPb9Dmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi2yF-005TXv-2n;
	Fri, 31 Mar 2023 00:50:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi2yB-005TWw-33
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 00:50:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6DF1162280;
	Fri, 31 Mar 2023 00:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5D58C4339B;
	Fri, 31 Mar 2023 00:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680223817;
	bh=5R/8vqj7X/4FXlzrWJR/6Vkxkbq4c9el6EjT8HnT6/I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WMZWFHNBGy7Pq8jwg/1U6n36kRBEeNw3F61mPelbSHNxQf41e16ToJ3GWrL0H/ClE
	 vTM13U8hNuRIZdBXYin1eGZ6mU0VBy+9R1bCKg0R+y7oEKv8sKV2r5Xj/MJSRJ5HJO
	 NQSU1fip5CTBkkL2B8+bKAuClRnNvD48HsGQ8n9Yv1YZdO922zqYAVRG+fFfs3+vEA
	 Dxle5vhzF/fpI5j2L+aAErHKE+zgLK+ryHByHWXRRnl01jBI98k6a9dW2OpZfd4zp1
	 /TswbOwFCpUd+FyjjFk+zfnHoOlgEWSknxEbo8iKHeH6t4HveWSl3oqjgMyKXNeSDV
	 CvR4sC4JN6OQw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A6761E49FA7;
	Fri, 31 Mar 2023 00:50:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1] RISC-V: convert new selectors of RISCV_ALTERNATIVE to
 dependencies
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <168022381767.20027.13723928750136260683.git-patchwork-notify@kernel.org>
Date: Fri, 31 Mar 2023 00:50:17 +0000
References: <20230324121240.3594777-1-conor.dooley@microchip.com>
In-Reply-To: <20230324121240.3594777-1-conor.dooley@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, conor@kernel.org,
 ajones@ventanamicro.com, Jason@zx2c4.com, apatel@ventanamicro.com,
 heiko.stuebner@vrull.eu, jszhang@kernel.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_175020_035977_B3500189 
X-CRM114-Status: UNSURE (   9.09  )
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

On Fri, 24 Mar 2023 12:12:41 +0000 you wrote:
> for-next contains two additional extensions that select
> RISCV_ALTERNATIVE. RISCV_ALTERNATIVE no longer needs to be selected by
> individual config options as it is now selected for !XIP_KERNEL builds
> by the top level RISCV option.
> These extensions rely on the alternative framework, so convert the
> "select"s to "depends on"s instead.
> 
> [...]

Here is the summary with links:
  - [v1] RISC-V: convert new selectors of RISCV_ALTERNATIVE to dependencies
    https://git.kernel.org/riscv/c/d34a6b715a23

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
