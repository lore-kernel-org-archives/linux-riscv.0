Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02170C30659
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 17:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wuFt+klvn1v4Tm5VG9Isj150ggNLwebvP6tZANowUJU=; b=kAokiIOAfgj+5J
	HSRI9J7hDMEeK+5rPqVVVcsHGeaGk6PX91DJ6A7JYzPo3SPoMe7Uz1xkGdNS01VOyBGyaKhjwG9l0
	BQrcaKIF6kqJzPgXttWx8r5uwfl3UmdjZ6C7x25Zn5/jIJPrKjJBhzUphydS6p+TwNYfOg0dVRAAT
	3jBWaICVfaD+I2QCW5G5Ek835uhcIZNN60B9W+Nrz4cI/EGieN4lfEOCLmVjya4pI2HuO2LJrqk/p
	Y+xxlG3G5x+C2Md1p6CwGP1S/nJqdVGJGP9MPwTpAf6Flu8AgZv1S3VUQyIhFjfPCZPAs2KWbvwPG
	mvCSXLlD+OQTwDnmiPGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMtGz-0000000BIP8-1pae;
	Thu, 27 Jun 2024 17:51:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMtGs-0000000BIIu-49BY
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 17:51:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8E89A61F8B;
	Thu, 27 Jun 2024 17:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E10DC4AF0F;
	Thu, 27 Jun 2024 17:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719510656;
	bh=sCGQGQxJiBD5/Y8j6GuCFc7vlBp1iI+va/SqoCObG/I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SblkWJY/ll1wu4pm/Mdyb4YsRxxavO/+xBrudwei8G9ZmSTYZrZMSVtT6B9SRe9cv
	 yyLYvCwWAaQD765wteS336iFD6Cc+NPEhKhkUWf9BUE5Lz5K+lLeMrmMoLZS2giQUz
	 d4QRtt4VNE++NQNKPl2iozQAKYkSc/9yuR2XT9oVywMPS3XuAwK3NvX5bqdaVVeM0M
	 unakWCsygbEMqhAzQ67t40e5D5B3a4m/lA5/cUD8dmtKJf1DaN+XSG4EP3bkRyNFnv
	 omqoBNlJ22BHBnzPT7wPEu0x+XoRVzO2SrgRxWMuf+e9tcR5HvLsk1xtAhNtSvO+ge
	 ej03X6atPJcdg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 86C7DC4333E;
	Thu, 27 Jun 2024 17:50:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: dmi: Add SMBIOS/DMI support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171951065654.6762.8929081734470449376.git-patchwork-notify@kernel.org>
Date: Thu, 27 Jun 2024 17:50:56 +0000
References: <20240318020916.1299190-1-haibo1.xu@intel.com>
In-Reply-To: <20240318020916.1299190-1-haibo1.xu@intel.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-efi@vger.kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com, xiaobo55x@gmail.com, ardb@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_105059_294241_DA635807 
X-CRM114-Status: UNSURE (   9.26  )
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

On Mon, 18 Mar 2024 10:09:16 +0800 you wrote:
> Enable the dmi driver for riscv which would allow access the
> SMBIOS info through some userspace file(/sys/firmware/dmi/*).
> 
> The change was based on that of arm64 and has been verified
> by dmidecode tool.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> 
> [...]

Here is the summary with links:
  - [v2] riscv: dmi: Add SMBIOS/DMI support
    https://git.kernel.org/riscv/c/d6ecd188937f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
