Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C730D11195
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 20:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9bS57Pw7EP35z0ZkVVVEX8l9ZmXRDF/UU1Q+Bk0yHs=; b=1y27lbxTCnhqfr
	WWWGvNKCVTojjUBNkIxr7Rtxm9PEBqe8+R9zFZnxS0a0aKwYYLhZ4Fu02aMaJXoBdrL+hmPhP0+38
	9JmdCKaahvgQuYsO2Od2I4DXDmfiXSvBLiddhEAC88hPdIIldze8kk2FT9p3KL5TNJG0JqmsgaGf7
	yp4ZrBJt9xeOV3L/8miW6XFJD+cU1DnL3yyDssrr4jpOAznM2eWpG1aQUpEil2h3Yb2EW/A4ArOpV
	h6SN/Uy09YgZOaUzLsY2oT3bF1E+1heC5ifxO+sWOdgUm9i1aGPCpL+gijkLPxF49MXcwxFLbbtpT
	M+LYP18o0UyiCidn5gMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOLqi-0000000FbVL-2Wca;
	Wed, 26 Nov 2025 20:10:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOLqg-0000000FbUo-0iKT
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 20:10:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 23275416FA;
	Wed, 26 Nov 2025 20:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0266C4CEF7;
	Wed, 26 Nov 2025 20:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764187845;
	bh=O79vJEW0JNUjjEmcp9mPoOtEh9R1PBBKspIf3jskmH4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KOe2xYto0LGThvoF3gfxHz00GOBDdDq0QF7PXl2Q+7aZHbkM9WDfW+ZV2KCgtlwTP
	 +PHAvJAHfQO4f51cdcy3sVdlvXdLjUysoYtm8/BK4MUBGvBxVDQ+DVb2bRU0VZt/bR
	 SbaLbBCQKiaKje88US2MfXBDwJUQfZ7Q5V0li5aUYtTpE462wWMtubGj3Vf0Nkawu3
	 Y5lMsGPg0ePNJx5e7xm1v6INNKKzM7k9epm6byIW99OeJCZOpAJH1S8AHJCTkMVhUJ
	 KG6/d6PDkl8fEXZ/eDT+qMGwFa/YQaOFnrRUrvULiLMacvZiz3I9cr2qzFSUygNK03
	 hKMXd5JM9s3Bw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE98380CEF4;
	Wed, 26 Nov 2025 20:10:07 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv/atomic.h : use RISCV_FULL_BARRIER in _arch_atomic*
 function.
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176418780676.1826898.4604023104927550893.git-patchwork-notify@kernel.org>
Date: Wed, 26 Nov 2025 20:10:06 +0000
References: <20251120095831.64211-1-min_halo@163.com>
In-Reply-To: <20251120095831.64211-1-min_halo@163.com>
To: Zongmin Zhou <min_halo@163.com>
Cc: linux-riscv@lists.infradead.org, will@kernel.org, peterz@infradead.org,
 boqun.feng@gmail.com, mark.rutland@arm.com, gary@garyguo.net, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, zhouzongmin@kylinos.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_121046_233027_0BBDED99 
X-CRM114-Status: UNSURE (   8.16  )
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
by Paul Walmsley <pjw@kernel.org>:

On Thu, 20 Nov 2025 17:58:31 +0800 you wrote:
> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> Replace the same code with the pre-defined macro
> RISCV_FULL_BARRIER to simplify the code.
> 
> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> [...]

Here is the summary with links:
  - riscv/atomic.h : use RISCV_FULL_BARRIER in _arch_atomic* function.
    https://git.kernel.org/riscv/c/c0fe46b64f12

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
