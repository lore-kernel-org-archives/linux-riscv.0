Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589D3C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2024 10:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ygTyJTz6WxI/cCT3TiwhmNkruIxadZ9wFLY8zItJPL8=; b=nB2fB1X7uW8jjk
	eUSbyVGCpwAoig8cwG8uM6IBJtvU5z6HfTxQ+3yKrtOmc5PxdZKUhr8TH/e8Z6VDqKhywS0d+06SW
	d/Wfe6eAml52LS7oIOKnbREIUPQcA2vEmSdsS/t8bnkzAiVi/Zm7Vwpmcc371Q1S3RH8+VlxCgpmN
	2/Ft/Wdey/Rg4uBM5TuW7dfITmS/XM1e4fKy2t4ANy4rP3AWEr8u6guc/7k177uc1lcr8mvuj9MRc
	CDUOfHb0eQ+4hQI9kWfyoODR5aJi8u+aJWFgiArYOJ9eC+kPXN4PqGQcpjP7jMPOa9228i4puVJGf
	WOzjWdszi56KNuYOZeew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSDOI-0000000HGHY-08IZ;
	Fri, 12 Jul 2024 10:20:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSDOE-0000000HGFz-0oqQ
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jul 2024 10:20:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CEE4961E8C;
	Fri, 12 Jul 2024 10:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 844FBC4AF07;
	Fri, 12 Jul 2024 10:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720779632;
	bh=saXSXc7EtV5Q2Yrc557rIZq81TgZK3+FXyLIFKgsj6M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HprjVqNKWKBnZEqhy9YZNpR8SxioY9YsM0R/jhRIH+Y2VBO4L3qw4NIRbj4rIh/DV
	 i0nWF6kaTkK1AU4pLuiwo8Ad3XiaKG/9qKBIVFOoV08s0pFhEezrE6jcqm4et/jC1J
	 N3yIidI0F5ncopxbLfcZqMiOtoVkfdXeFvPEhoKVaSpw5/JvJvo/5HgSp0BkMryUyO
	 swlFycGc4fVcuTeQX9LDrOqO0f/bB6vuLwsiFOp6qti3Wr2Epk8WKWEdOMuAA12agF
	 MGmimgGkwfaZiOq5eOsbk/ZE8pDDH3kpd8KiBYvuRGu7TMfamDS79z1j2u0CI7HppG
	 Tdxa7gzffkF/Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 78381C433E9;
	Fri, 12 Jul 2024 10:20:32 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5] riscv: Optimize crc32 with Zbc extension
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172077963248.4770.592373890802161820.git-patchwork-notify@kernel.org>
Date: Fri, 12 Jul 2024 10:20:32 +0000
References: <20240621054707.1847548-1-xiao.w.wang@intel.com>
In-Reply-To: <20240621054707.1847548-1-xiao.w.wang@intel.com>
To: Wang@ci.codeaurora.org, Xiao W <xiao.w.wang@intel.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, charlie@rivosinc.com,
 andy.chiu@sifive.com, conor.dooley@microchip.com, greentime.hu@sifive.com,
 ajones@ventanamicro.com, heiko@sntech.de, david.laight@aculab.com,
 haicheng.li@intel.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_032034_320300_454E382C 
X-CRM114-Status: UNSURE (   9.37  )
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

On Fri, 21 Jun 2024 13:47:07 +0800 you wrote:
> As suggested by the B-ext spec, the Zbc (carry-less multiplication)
> instructions can be used to accelerate CRC calculations. Currently, the
> crc32 is the most widely used crc function inside kernel, so this patch
> focuses on the optimization of just the crc32 APIs.
> 
> Compared with the current table-lookup based optimization, Zbc based
> optimization can also achieve large stride during CRC calculation loop,
> meantime, it avoids the memory access latency of the table-lookup based
> implementation and it reduces memory footprint.
> 
> [...]

Here is the summary with links:
  - [v5] riscv: Optimize crc32 with Zbc extension
    https://git.kernel.org/riscv/c/a43fe27d6503

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
