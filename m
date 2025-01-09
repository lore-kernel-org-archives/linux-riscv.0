Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38AA9E77197
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 19:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oyJr+OC+tca5MUwiFTs8nsyWNsLzaNH/vB5XauoMGW4=; b=0WE+OkrTboKiGN
	pSuQk4y/ewRoHTm8mxTgZFm6Z+9NACC2UrFH4On6BlKzggzsrqFLsHLMrOShKry3wWgvdDJMNE5wA
	DC1Snxe+Hbw13tsUyz/vRWAalRCFNSgD42cyCgs04JQnWaGJE7NH6cLI/bQheyV+Es/sLmV0ezeWF
	JvDqoA3Re2twhAD4+YjQIr/1gWn4P6GrafcNUupQcr/7PUtevMBqhwrj/u4FWuRZs1K10ETI/VwUM
	SvkyDkl1IYaN5ogwPUn9BhyMxLmxbCL0KHobBU6G338IfqqIwd7hW5BpRE0OrEsoeTGZH+hf3/kkp
	r8vZ4cl5GxHNgcshgvfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVyPR-0000000D87u-2PwG;
	Thu, 09 Jan 2025 19:41:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVyOE-0000000D7tM-36hj
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jan 2025 19:40:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5DCC4A42616;
	Thu,  9 Jan 2025 19:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F84C4CEE1;
	Thu,  9 Jan 2025 19:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736451621;
	bh=XqjSog8RAzpbGe8ofP1xutDuavH7WHqQwghnzd6J0H4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GOePwsB/0XCB2GYwI4KDuZ8rZ9IMXDWiDYhfCN6z00wYxkeCIHxSETk3qvNmjsRGu
	 boF6vAacKeRcOIlnpew/szbWNAyjgqYtyp7bsYpMyAfg8nThFAy690i7H5NG75Lb10
	 EwUNMWm2+rnwANkpnbYOmS+v4jCzQu/9hDuyOcjBSGALNw6PdmXemKFN7SV/lKjpJt
	 2G1xQZZIrMKHLrk2CMFFzVfeOsVoiiOJSfO2yI/wXSVDS2RefjVerYSg0ZxiwVabho
	 +fqvy8r5v5G8MC9gh9ovX5NF/VW5fu++IvO5EMjM1pQyzbFgmbN6tGIIBazvLp1f8g
	 sc6yMPmR8+AXg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE105380A97F;
	Thu,  9 Jan 2025 19:40:44 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] selftest: fix riscv/vector tests
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173645164323.1490121.6057718076513912259.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jan 2025 19:40:43 +0000
References: <20241220091730.28006-1-yongxuan.wang@sifive.com>
In-Reply-To: <20241220091730.28006-1-yongxuan.wang@sifive.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, greentime.hu@sifive.com,
 vincent.chen@sifive.com, andybnac@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_114022_839751_A72044A2 
X-CRM114-Status: UNSURE (   7.61  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 20 Dec 2024 17:17:25 +0800 you wrote:
> Add test counts and pass message to remove warning of riscv/vector tests.
> 
> Yong-Xuan Wang (2):
>   tools: selftests: riscv: Add pass message for v_initval_nolibc
>   tools: selftests: riscv: Add test count for vstate_prctl
> 
>  tools/testing/selftests/riscv/vector/v_initval_nolibc.c | 4 ++++
>  tools/testing/selftests/riscv/vector/vstate_prctl.c     | 2 ++
>  2 files changed, 6 insertions(+)

Here is the summary with links:
  - [1/2] tools: selftests: riscv: Add pass message for v_initval_nolibc
    https://git.kernel.org/riscv/c/503465d4dc40
  - [2/2] tools: selftests: riscv: Add test count for vstate_prctl
    https://git.kernel.org/riscv/c/ebdc22c51ace

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
