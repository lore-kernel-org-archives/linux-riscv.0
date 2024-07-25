Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A65CC3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 13:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2MkY8k9TJcaZHJWjtQjIsUPrpAiRpDPNdlv2koff/DU=; b=ceEoYVjWN/By5m
	F9Laz9nWFkEeMA+uVWLXGhdnh24I3BpNbRHQwZzjw5dk7AN4Vt+6tJVuZh8W/UGcKmmnpqQLOINlM
	Z40LTYdSrw3Rr2yN1d7EK4nswWLjETojDgF8B+Mjf07wYmZzwpKUMmY2rVTiAzkLRs/z8CYiW47sE
	g3Le+qtfJn9XCVe6bHzlgAC+DcS6TK87YfZzo+Wn/s/G7lgY/cUdIg6dcV+nGiEzfGT+VYya2Ckb/
	pX8acaY/jUZSh1eIaVSMLx2AK6Yc1PHrFauGCU4LHqTxvtzc4fDVzq0KdHhq0i+3WGPkyw2ug3ngD
	C6qxIRzK90JqsLtV1alg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyOl-000000012o4-1TSx;
	Thu, 25 Jul 2024 13:20:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyOe-000000012iq-4Aul
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 13:20:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 163896140B;
	Thu, 25 Jul 2024 13:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B511C4AF12;
	Thu, 25 Jul 2024 13:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721913639;
	bh=VU016AbJh5L3ZwL7kApcuoKicYHOtsSYeeuPsrXTct4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=siZHhB8fFv/POj2NExEStNEaE5qOfcNIwFWu1U3nv7iaTOrI3JWkKOErwLgTIZMt5
	 TtXSLL/q/csMTLoavFLERs4L+FjXjMv+CTvPFxSvtrsZm8BIUdvmM7pGOejtt3WcRD
	 SystoXljQGVtVhWm0iUcuANBf+n0GKpAh+3sVGGvQjYY/itUZNI6oHTGKpeu85P2tv
	 7z9ZQ8/I23tWOCqg4EgBSgo+X7u1vqLKVVJvb3tw7PTggJj3Y+DpXtj/0p4ZY07zhU
	 QOveMB0tsNWtmUjku2JOV06vjTyXsDRP6Hq+ixdR+/TI8m7D7J0uLtkVcazzYeRkMN
	 V2P/+gsZz9vyQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 523ACC4332D;
	Thu, 25 Jul 2024 13:20:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: Extend sv39 linear mapping max size to 128G
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172191363932.6240.15191198914787494944.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jul 2024 13:20:39 +0000
References: <20240630110550.1731929-1-stuart.menefy@codasip.com>
In-Reply-To: <20240630110550.1731929-1-stuart.menefy@codasip.com>
To: Stuart Menefy <stuart.menefy@codasip.com>
Cc: linux-riscv@lists.infradead.org, alexghiti@rivosinc.com, corbet@lwn.net,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_062041_125990_780E88C1 
X-CRM114-Status: GOOD (  10.49  )
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

On Sun, 30 Jun 2024 12:05:49 +0100 you wrote:
> This harmonizes all virtual addressing modes which can now all map
> (PGDIR_SIZE * PTRS_PER_PGD) / 4 of physical memory.
> 
> The RISCV implementation of KASAN requires that the boundary between
> shallow mappings are aligned on an 8G boundary. In this case we need
> VMALLOC_START to be 8G aligned. So although we only need to move the
> start of the linear mapping down by 4GiB to allow 128GiB to be mapped,
> we actually move it down by 8GiB (creating a 4GiB hole between the
> linear mapping and KASAN shadow space) to maintain the alignment
> requirement.
> 
> [...]

Here is the summary with links:
  - [v2] riscv: Extend sv39 linear mapping max size to 128G
    https://git.kernel.org/riscv/c/30c3ce044a70

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
