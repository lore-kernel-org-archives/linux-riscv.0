Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DFBCCED247
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 08:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oKqTuwP1o5m4g/8GlUsSF4ZjTOXvOfa4SG9Z2wiiV/k=; b=FxQC2fsACN6RbV
	jhuJabBqWpxqZvqZBXBnasAlRyCETcWyfS8GYApLa9RpnbS62BAXzShs9AfEIwUwP9StJ79qgiyx6
	d/Di3KZiSDyGRZuNShypIpwEn/189bInl67HiABdtYSPARpDk1gHGNxIgYq+8Xr0hGIhyJdN4D57F
	drWoPwoar7oCIYfd2ryK8PnltHdul45fhlSx2J+y8m86ESuhen/snVVg44Pw+SREMOwnS9R4M9y2s
	wmhtma9UGCvKmVeGKGILpvPFL3x/5RnW0Oh2xm7V7AN4yCGp2zKKE1yXl551//gU+540fiVShmwWw
	21/b4m0E+uap8+XosXfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGr9-000000002JM-0jdD;
	Tue, 18 Nov 2025 08:14:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGr7-000000002J1-12Yw
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 08:14:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 14DB5601AB;
	Tue, 18 Nov 2025 08:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E7ACC2BCAF;
	Tue, 18 Nov 2025 08:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763453667;
	bh=LohK5hjrEeqvyO8N4DqykVVSIrsu40Dn6IU0ovtyNAU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Vixd7JAj6VTf41amWGlAWFWsCTtMHsQHx9ueriwie15gZ9bPyBjXpUKkZauMPP+p0
	 8ZfxHbeIjq1Ozxyc15WgiJRj6eLOidrQuMkVqCa39tm+KTZ1jeG57UeHs39nAnfUrQ
	 FfSbR5vKCA4xj4dLAdCI4CMxAhQl0TrWPCtZatf8mA3+WAfbERwNdO6KczRrTvsI2l
	 eUGgMBISymkmcSACNzfCe3CeC6bw/5dyOB2t1M812gIwgCySlaW8Ax/G7DpCcFPVCw
	 eZg4bo+IFbTwrhWt0whBzcXCisFDm4eNuvvNORSj4dtRG8d6h/G0bDvHcVriAdwsik
	 49P6Ndm7gCrtg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD4B3809A2D;
	Tue, 18 Nov 2025 08:13:54 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/5] riscv: Use riscv_has_extension_{likely,unlikely}
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176345363325.4032995.8761332342399435783.git-patchwork-notify@kernel.org>
Date: Tue, 18 Nov 2025 08:13:53 +0000
References: <20251020-riscv-altn-helper-wip-v4-0-ef941c87669a@iscas.ac.cn>
In-Reply-To: <20251020-riscv-altn-helper-wip-v4-0-ef941c87669a@iscas.ac.cn>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 yury.norov@gmail.com, linux@rasmusvillemoes.dk, pjw@kernel.org,
 charlie@rivosinc.com, xiao.w.wang@intel.com, christoph.muellner@vrull.eu,
 uwu@dram.page, linux-kernel@vger.kernel.org
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
by Paul Walmsley <pjw@kernel.org>:

On Mon, 20 Oct 2025 17:09:55 +0800 you wrote:
> There are about a dozen uses of asm goto in arch/riscv just to select
> between two code paths with the alternative mechanism. Convert them to
> the existing helpers riscv_has_extension_{likely,unlikely}.
> 
> In each case, I have preserved the existing code's choice of asm goto
> pattern while picking between "likely" and "unlikely", namely:
> 
> [...]

Here is the summary with links:
  - [v4,1/5] riscv: pgtable: Use riscv_has_extension_unlikely
    https://git.kernel.org/riscv/c/a4076db168ae
  - [v4,2/5] riscv: checksum: Use riscv_has_extension_likely
    https://git.kernel.org/riscv/c/343fdc9e98d8
  - [v4,3/5] riscv: hweight: Use riscv_has_extension_likely
    https://git.kernel.org/riscv/c/8211f7ec8a7f
  - [v4,4/5] riscv: bitops: Use riscv_has_extension_likely
    https://git.kernel.org/riscv/c/d78307511f7c
  - [v4,5/5] riscv: cmpxchg: Use riscv_has_extension_likely
    https://git.kernel.org/riscv/c/7b5a4f97cb45

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
