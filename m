Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA83C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 22:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHccFU6qRmknwtpZMCT6/e1IrgK0mDciB4KTLy4gmvw=; b=Qc2bTsPIm1rLE3
	7l8q0qwTIOXFCDU1Ll82jjKUajNSMf9Z1rTKwllyeg2f5QcaJPugKcd+3jx8nOlInkbKoIAmIMjN8
	44zy3PMFK1HQWcNABWyN58FMwYpYaJoZa4FAnmLcJEKOl2SMYfn1h5WMDhiM5g6RKT5YsH/tWJUrz
	KFNSTdX3yp1pBPM2trhWIwRl3IfZ3xnIoR0vYrxAZo7Mc28qJip7P8LUkzH0iMcgrAmh63jkzjUYq
	Xxq4ap9euIV5jmxgqtkNNe0b8gGxdUgYsxSvNQF6Q/cWSt1pFkovWJhsNCI810TQYkkW7K2Ykmakx
	EfOMzr3ORG8S3hgpEBAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3lPp-00Bikf-7O; Fri, 09 Dec 2022 22:00:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3lPm-00Bij7-9h
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 22:00:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CA59A62359;
	Fri,  9 Dec 2022 22:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BD99C433EF;
	Fri,  9 Dec 2022 22:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670623216;
	bh=bP2lQNjJ8BFsWpuSnHB6vWQfpr4uHJu7gA5wCHQ8/WM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fQozgtC6TTLHGTHnvQdF+X3ilqq7twxyQhSkjIx4bCSK4SxJLBAI7iILTxoca2o99
	 9xVB9SzKF0q4SWqUrWffRD1A40oI5XmV5GaozfmmIlzBiK0/coc+YOwm5EIIjPxgWP
	 Sq385J3+YqGV7kFxkFRpOgUQfd/W2+f7CoufIHW+Ki2bu70W/zzMwAKhsFb0iCcCJ6
	 B9g2np+JzilqEE/KcNiJUyJAl44kGdBgOfeQSP/Z8u8M1gcA0Ot032rnXujqM+Sru6
	 dX/rjn+IL70qmWAFEKt2Ld0kIZNH2jYaxwPN/x5vWEORObOJF0ldjFynh+E0bCBmkM
	 wfgMsnG+0wJEA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 113BBE1B4D9;
	Fri,  9 Dec 2022 22:00:16 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH RESEND v1] riscv: mm: call best_map_size many times during
 linear-mapping
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167062321606.20606.12182083440436811475.git-patchwork-notify@kernel.org>
Date: Fri, 09 Dec 2022 22:00:16 +0000
References: <20221128023643.329091-1-panqinglin2020@iscas.ac.cn>
In-Reply-To: <20221128023643.329091-1-panqinglin2020@iscas.ac.cn>
To: Qinglin Pan <panqinglin2020@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 ajones@ventanamicro.com, alexghiti@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_140018_419085_7A3A9A74 
X-CRM114-Status: UNSURE (   8.64  )
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

On Mon, 28 Nov 2022 10:36:43 +0800 you wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> Modify the best_map_size function to give map_size many times instead
> of only once, so a memory region can be mapped by both PMD_SIZE and
> PAGE_SIZE.
> 
> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [RESEND,v1] riscv: mm: call best_map_size many times during linear-mapping
    https://git.kernel.org/riscv/c/6ff8ca3f93d3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
