Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAEBC83F14
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 13:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9Hl7AE7YOavfHo6omjqcSYmJc6v0Xq6ur0d03K9a64=; b=RkSDcvuMYRMMmv
	9p6BBgkd547i1rBD9iQ7ZR5iveAdQ1jYpK4eFqxfjgKnldYslU5r42zbEc36Et/yisHurROI2pHqh
	8nOI9lr0Edw+NCwAuTtuAXy1NrKN6IEHZT7CUBZ988yeOj8u4DtYsPINiFt/4xxdDa5L9jbxAiwT7
	CSbps7W8bq38rq+gzhL7BPbzFfKzs40XVRipo6wB3inQf8Y+Mf2xEFEbxwcuRXwqTPVW01ocHwOHk
	+cwKrNQl06TpralA1/eVMY3ZBVu7pduyFf6ZeNQHLDNfcwu1NZgcEnbuocEAzzTjP7cjyiXVlhRGE
	dQ/VQp+crmAwCpZgo5Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL7f-00DXXp-2c;
	Wed, 30 Aug 2023 13:20:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL7c-00DXUZ-0m
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 13:20:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BC37061FB7;
	Wed, 30 Aug 2023 13:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C46CC433CD;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693401634;
	bh=jLz1YYGHzcPF4bqPX3YGwB9P8fGgq5w35e2LcaUAALw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oildnxhOx+pk99S2flDq2SUTE6640rBDJ5ktVb2QUKCISWMt1hZiAV4RKO7t8IIs0
	 INzLOApUdbHFGpRyz0R1EguyJo3tawL3IpTIcrj2i3Q1UHwmLON3o50pRxbmevR6VX
	 CRXaXBAPOQmBX61GqDIj3Bevv625A67TG8rBCfEEGIK/9G/CvouCKJEZrxQqU8InVQ
	 s/q9c4XZqm/OfkdAVmL2HeHavxv72M2vGHDa1ybFwiRGX6IxaAB0RZ4pzwB7DX9qRn
	 xDLtmQs/65xH7UKuStqSt+chUHcNVWLMpkjyZ6G6Rg3nKH0kT3MqqHV5SNBF+05qu3
	 gTqf8tEY9gD0g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7C8CEE4509F;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/2] riscv: Reduce ARCH_KMALLOC_MINALIGN to 8
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169340163450.19859.9050440300788859353.git-patchwork-notify@kernel.org>
Date: Wed, 30 Aug 2023 13:20:34 +0000
References: <20230718152214.2907-1-jszhang@kernel.org>
In-Reply-To: <20230718152214.2907-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_062036_320889_75154359 
X-CRM114-Status: UNSURE (   8.69  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 18 Jul 2023 23:22:12 +0800 you wrote:
> Currently, riscv defines ARCH_DMA_MINALIGN as L1_CACHE_BYTES, I.E
> 64Bytes, if CONFIG_RISCV_DMA_NONCOHERENT=y. To support unified kernel
> Image, usually we have to enable CONFIG_RISCV_DMA_NONCOHERENT, thus
> it brings some bad effects to coherent platforms:
> 
> Firstly, it wastes memory, kmalloc-96, kmalloc-32, kmalloc-16 and
> kmalloc-8 slab caches don't exist any more, they are replaced with
> either kmalloc-128 or kmalloc-64.
> 
> [...]

Here is the summary with links:
  - [v3,1/2] riscv: allow kmalloc() caches aligned to the smallest value
    https://git.kernel.org/riscv/c/2926715163cf
  - [v3,2/2] riscv: enable DMA_BOUNCE_UNALIGNED_KMALLOC for !dma_coherent
    https://git.kernel.org/riscv/c/f51f7a0fc2f4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
