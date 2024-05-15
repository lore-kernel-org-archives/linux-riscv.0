Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE630C25B79
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 13:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gW8KtaTzYyT+eMkos315QMBJoBOBYf5k0WR7ONDrj1E=; b=dD8CzgnQ4hILC3
	iDq3awhpMPd036bsgeChhrs87QTHDDVFnUtk3/veW7FPWJQ3B7gcdb/3lxUVPwnJVUYILRKPhIFj6
	5yp0PUv20v2cKqbkS83MsrmITCoZzS2YJvsNsQmQSBljn/8eCPlYDCoP7VSJsLBAsqfWLwv7TWFfq
	z2SSIUghuj93RKxGBZVY//oDtj68NsEe/m7GwdLl6RbbdvMb3ZhyBj/0GJm7l/9LNAJ4RgdcEOBik
	Z6j4L6r8PmuaqDz5LV0k5VkldPA2iNccxIRc2wVv+Bik6QLb9Gp1DHPVO+lv25n9KOJOWHkSNZQ00
	RnBNighMIkPYLQwpLFng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7EsK-00000001gkE-49K0;
	Wed, 15 May 2024 13:40:56 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7EsH-00000001giC-0cCv
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 13:40:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 99EB9CE1395;
	Wed, 15 May 2024 13:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40AF0C116B1;
	Wed, 15 May 2024 13:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715780435;
	bh=H3ltUsrKOQdu0Za2sRAFpqsHbjoXich3cTJVW0+VNxk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bPDeT2Ba20TH4OKv5kpZ4Mjx40CDUAJezN25PViqjcU7QJ3at4B0CzmnmdLxlpDYE
	 yeT/yv4mz9gA7hRt0PZEADeizfw5kkSyei3Vf1JRhIDgab6O/LWNROORqZkSiELcmy
	 33+jDS2hshqM+RR7gKduD3aHQHld/2RC2CuJnS7aOhJGyksj7vVXuiYpo5Rne5HraB
	 sIVRmDGgECCPV91SanYaSvzIUaSjaJHFgAjT73vezryK9ubQ8t5CDYhxAt5hdc0yLE
	 eDhTojB8eDnrUq7U70tCOLSWzRmw9Oa//+RLh4XjhygwYsA+gdUy1v6GtTzK8Ng+gW
	 bFFx8b7g/EzEA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 38A30C4333A;
	Wed, 15 May 2024 13:40:35 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] riscv: make image compression configurable
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171578043522.14005.5445713768197740936.git-patchwork-notify@kernel.org>
Date: Wed, 15 May 2024 13:40:35 +0000
References: <20240504193446.196886-1-emil.renner.berthing@canonical.com>
In-Reply-To: <20240504193446.196886-1-emil.renner.berthing@canonical.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu, terrelln@fb.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_064053_372110_9272EB10 
X-CRM114-Status: GOOD (  10.76  )
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

On Sat,  4 May 2024 21:34:37 +0200 you wrote:
> Masahiro's patch[1] made me wonder why we're not just using KBUILD_IMAGE
> to determine which (possibly compressed) kernel image to use in 'make
> tar-pkg' like other architectures do. It turns out we're always setting
> KBUILD_IMAGE to the uncompressed Image file and then compressing it into
> the Image.gz file afterwards.
> 
> This series fixes that so the compression method is configurable and
> KBUILD_IMAGE is set to the chosen (possibly uncompressed) kernel image
> which is then used by targets like 'make install' and 'make bindeb-pkg' and
> 'make tar-pkg'.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] riscv: make image compression configurable
    https://git.kernel.org/riscv/c/c1f59d035966
  - [v2,2/2] riscv: show help string for riscv-specific targets
    https://git.kernel.org/riscv/c/5e3964ba8400

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
