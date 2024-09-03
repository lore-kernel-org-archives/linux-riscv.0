Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26780CD343A
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 14:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c6RJZcSpQ5BZW+SMN0ElFmYc2isn06qN8KJ16nH1Bos=; b=vsdpOSMZK7igiq
	kv/kfDb9PhGUCmEkHd+108er5jtJztTFc9yVC+xMFSO6RICN0Sgl5/aZmwu9T8zBdMx6zd5tsNj10
	SP/bLUeszxIkdouS6sEP0D6Wgq/vn33G8v/7/ww0T8X+/yod9MJDQl6l26qz01awwMMTs8PZC8dVK
	BZfBXELXM+7mNq1AXjURsFlnxSNGdOWhLET4LBbVQDsP6yy2ZfSDVgsNA+539BPzzcm8WUjx9AaHN
	LyXsuYW3uzMXIQDZP8S3eUZ6QPnyKmR1VhoicnR79tUo4ZUMFd4MQ1OOVbq3sLqOyrkWOuZOy08XT
	osVLXCFIyGv7xbZRwB1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slUcP-00000000c4R-1RUx;
	Tue, 03 Sep 2024 14:34:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slUYN-00000000ajj-143F
	for linux-riscv@lists.infradead.org;
	Tue, 03 Sep 2024 14:30:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 05FD0A43713;
	Tue,  3 Sep 2024 14:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2EFAC4CEC7;
	Tue,  3 Sep 2024 14:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725373842;
	bh=wrzvstu/DVvPe126O5wbylKc3BmtEGTZ9Vu4W4NBnf0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=djQpSUit+bIb2uQLuyHb8vLwJI5gmjKQTgv57YB7l0ZdlcenMhD2DLReE9bRmfJZU
	 OiCWn6rBAb1HRiMCe+iIfnt4OTh+O7t/6Olu4IEsXgQQxtliFIIbpovhBzJzhHrw9K
	 JZKngt5klqP2xAM0JWIIJw8lhTAbhDO3ZSS9diXYwCL/FbKyuir6p6t2Nk0bNLL+h5
	 Q0qkU5UxQTOhg/1ehrZG4Fwfponi24VByF3yWDlpPZCDP55FWcioALl70lOHe7radQ
	 hcrMCohwe42HfUx6JESBIMLYp0b/lgiHipBqHjkWx+VfEhj8/6TZW2YEL08paXtQEU
	 ZtmzwwiNm4RIw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEA33822D69;
	Tue,  3 Sep 2024 14:30:43 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/3] RISC-V: mm: do not treat hint addr on mmap as the
 upper bound to search
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172537384274.320952.7351958259552393532.git-patchwork-notify@kernel.org>
Date: Tue, 03 Sep 2024 14:30:42 +0000
References: <tencent_108260B43689E30AAE5D0C7C085AA31ADF06@qq.com>
In-Reply-To: <tencent_108260B43689E30AAE5D0C7C085AA31ADF06@qq.com>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, charlie@rivosinc.com, corbet@lwn.net,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 shuah@kernel.org, rsworktech@outlook.com, alexghiti@rivosinc.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, palmer@rivosinc.com,
 linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_073043_381639_ED7234AB 
X-CRM114-Status: GOOD (  12.67  )
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

On Tue, 27 Aug 2024 16:05:15 +0800 you wrote:
> Previous patch series[1][2] changes a mmap behavior that treats the hint
> address as the upper bound of the mmap address range. The motivation of the
> previous patch series is that some user space software may assume 48-bit
> address space and use higher bits to encode some information, which may
> collide with large virtual address space mmap may return. However, to make
> sv48 by default, we don't need to change the meaning of the hint address on
> mmap as the upper bound of the mmap address range. This behavior breaks
> some user space software like Chromium that gets ENOMEM error when the hint
> address + size is not big enough, as specified in [3].
> 
> [...]

Here is the summary with links:
  - [v3,1/3] riscv: selftests: Remove mmap hint address checks
    https://git.kernel.org/riscv/c/83dae72ac038
  - [v3,2/3] RISC-V: mm: not use hint addr as upper bound
    (no matching commit)
  - [v3,3/3] Documentation: riscv: correct sv57 kernel behavior
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
