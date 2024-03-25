Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EEBC54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 04:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wx+cseNWkSEtmK15Co/bgXZDr5754vAJKuT1+GLykBw=; b=X0+1QTIe7m0huF
	spa6xnQx3s4qkkfsoR1hfLwTU0DDL0CSDgNZdqVkn4CjNg/MKWpYlft8bCGjahFRlQhDUymixloUW
	gn1+xutupNJ0dmSpiSaqcSaHQgENHMtZUpDiy507/QyY0kM+LPqWhF6RZGztGINOLM0Wrv3HSUj6+
	um3wxpFVrPo6yHS5oLT2NLLqNDIwfSn32RVB2uPzhiALNGS7TIRyBxstSXAPcmxhtda9aS8I6ITNN
	iR3x6I3dlqUiFLF4ZO/mjDXB1bOwAQRNnRVPLTSUVkRz7t0EKafL0FWZAjocbigwBVnyeGQ0OVsK7
	CrCFwuI+duRhpbHRnGQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rocAR-0000000FE7q-0XWc;
	Mon, 25 Mar 2024 04:42:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rocAO-0000000FE4J-0dP7
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 04:42:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EE84960C67;
	Mon, 25 Mar 2024 04:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92948C43394;
	Mon, 25 Mar 2024 04:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711341754;
	bh=983c2mSpRtzHZd3RX0FbvmlLGvQpO2bWYGuEJVdPXiM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DhmNMN2tF/acZiHHFVovBVnZwiaO1oB814vBKArondxj3E1Byyz1qqTWxsohjhYg6
	 +gI7iq0jLQCxC9L57FIwH5krZFrHzIQMVBnYaoXC4vKu59wvi0mNYTQJvad+gSMoAp
	 5aO1xde4w9zblgHpuzrJ7ndoEMK/drH1yiaqc5EZnMC0J0Zxf3FrYFIGQQ/KYzW8sM
	 y7ugrQNZYbu3t0noHgiLkMX8Ie1VIkarzj05tC/ONvktMIOf9+Ru2uSf9InpLcX7IS
	 0qts8mBqdqFKCakLJw0lmbLK39TOQHEOzIalOU4A/6VUzfyJEreK9Ue9aPfxudRl5h
	 M4d8b/4W3VvWg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 857A0D2D0E0;
	Mon, 25 Mar 2024 04:42:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/4] riscv: sophgo: add reset support for SG2042
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171134175454.18749.13038964057011467100.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 04:42:34 +0000
References: <cover.1706577450.git.unicorn_wang@outlook.com>
In-Reply-To: <cover.1706577450.git.unicorn_wang@outlook.com>
To: Chen Wang <unicornxw@gmail.com>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 chao.wei@sophgo.com, conor@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, p.zabel@pengutronix.de,
 robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, guoren@kernel.org,
 jszhang@kernel.org, inochiama@outlook.com, unicorn_wang@outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_214236_260257_235ADF6A 
X-CRM114-Status: UNSURE (   8.24  )
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

This series was applied to riscv/linux.git (fixes)
by Inochi Amaoto <inochiama@outlook.com>:

On Tue, 30 Jan 2024 09:49:08 +0800 you wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> This series adds reset controller support for Sophgo SG2042 using
> reset-simple driver.
> 
> Thanks,
> Chen
> 
> [...]

Here is the summary with links:
  - [v3,1/4] dt-bindings: reset: sophgo: support SG2042
    (no matching commit)
  - [v3,2/4] reset: simple: add support for Sophgo SG2042
    (no matching commit)
  - [v3,3/4] riscv: dts: add reset generator for Sophgo SG2042 SoC
    https://git.kernel.org/riscv/c/1ce7587e507e
  - [v3,4/4] riscv: dts: add resets property for uart node
    https://git.kernel.org/riscv/c/08573ba006ab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
