Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC317C021A0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 19:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3x1aLr5HmRS7HEnOuUfB1rNLt7+KlV9glUgJcrYYsBM=; b=pqifn7hvIviTKX
	Wmolj77i9IDxtGOg/gcH/A3sXY5y4tzd728i8EK7qFL2vcZpU5uIp1ZygxNqoWvw83V3SASaoeFQT
	pDLnG3aErnbg5+zoZl3ANV/yct4miPsvPF0jzactrdxU3GdZsuFw+45IrvSheL28OLuUMbB++VtNw
	RWBD83/QrBt/dNxITrhqKfm2CqOXE9zyz88HJvdCcA/o0c9jKVELe1/oQRZrbQdsfuw3RtmlNhnU/
	rM82M2B2Gfn/438JnPYQIrp5BqZsvq9LTulM/aneABjimir0jZWZzIt8EBnzY/azf68D4AO1IQKHX
	Bfvm0q92Ltg9xlHoGNaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiezw-0000000CQ8z-26Jd;
	Thu, 13 Feb 2025 19:35:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidyT-0000000CFEG-1aEl
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 18:30:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 48DA45C542D;
	Thu, 13 Feb 2025 18:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B3B8C4CED1;
	Thu, 13 Feb 2025 18:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739471408;
	bh=eliJd8h1lECYk4Z6oPRqZIozGBbWvzE5WksoyaLXPQE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=u13pkGZ9sO8RN6VpwsM22N2TecZo5CodhvUbxThp54NQLdc8/8Xzno7fu4pIFDWO7
	 eDuIHRU0T/CoZIU7l+GxPBiiE5Kz9yGd1qzSOXx1hb0nHh5MdV0nQUSo/AwyzyoIdx
	 nT5ob7G6lmFlxiXjZGU2i9dai+EkVidt4DXS9oGCV6TEwPTiU90BAZTVr5BsrlhVdN
	 VrFrK4/aDhwnAXmHyfZW2I15ZHlrhv3Pim5yOk9q0haOPg7u5yE2xj/VoQHR/Pj7ff
	 DiHEiVE1lPD1MDSJaGKwATH4wOJHOxJx0jrdsOn5C58mitPITfn+VkGc0/kJv0JpMD
	 vBsBuZa166rnA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EC8C3380CEEF;
	Thu, 13 Feb 2025 18:30:38 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] MAINTAINERS: Add myself as a riscv reviewer
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173947143775.1330575.11190275171918774171.git-patchwork-notify@kernel.org>
Date: Thu, 13 Feb 2025 18:30:37 +0000
References: <20241212131134.288819-1-alexghiti@rivosinc.com>
In-Reply-To: <20241212131134.288819-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_103009_470640_69D4B7B9 
X-CRM114-Status: UNSURE (   8.00  )
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

On Thu, 12 Dec 2024 14:11:34 +0100 you wrote:
> The goal is for me to get a kernel.org account and then send pull requests
> in order to relieve some pressure from Palmer and make our workflow
> smoother.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - MAINTAINERS: Add myself as a riscv reviewer
    https://git.kernel.org/riscv/c/967154646b7c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
