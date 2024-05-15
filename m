Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A5EC25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 07:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MXSNFKWxeJQ4oyI8MQbnV0Hi+CIHNkUUH2AlwkEEPNs=; b=T7tdIiqFuwlTG4
	ltIo9OpHKAhS1RrVVg5ss1v1QRX4YWtsflSANz+CUzDTEQB+8gbFLCTJ+TYnXKKvsalcxNrigbkKF
	p0YcCItbd9GdO7SjPehs+g/e1mTItMo93t+CWwt6cXKN8U1NvtXMxor5SCRWUzEZx3rwimjfDlLg7
	i+A/uOw0sAw0w96Ibqd4s5moHflN6rxEzEchQOx9wAe6m7uQFyJFhcKL6AJd2ugQhlC+vyvFBi+V6
	bKHA5KCWNuwne0xaSJp9tTGLfvve6t8iU/WCXOSbWecwO9bcNkCE+AhPlGkyHfsBbsckdwgXxPLk8
	kzAoa7kdWFnlOzEcmUzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s79F1-00000000oGT-3Zti;
	Wed, 15 May 2024 07:39:59 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s79Ew-00000000oF7-3LY8
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 07:39:58 +0000
Date: Wed, 15 May 2024 09:39:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1715758792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0mk9oc6DES1RAS2h7quf07H1P5S+bDmfrogk/iErpU4=;
	b=foaKI6IM5Xwm9ZUGZuaCITCkR/q/NCFdyim4nGlyEX0OPDr6sHSjZK3ucwmd6L1NosZTYj
	2oLGZfUsyGLkFHsNwhd5rUMi8Y57qVQVotlcuT+VkuLGfsUiqZ45Lbkhb4K5rLHFNvUCh1
	wlitQS1/9RLhLkWHB37bBxiybQy+NFDssrLh/jq3S0L4tUTrG3HpveOZ0HDxgTDhw1fDO1
	UO8WcjcsZC/DHUD9FwpUnVjwVIBvhcSDjyzJXlI2HD5GtMVE9A7GEhmvczw3zBeRnNQH1B
	OUdRt7gxm0uc28n3RJmRMtN2Jq8BVyotcfnM+lcJQMWk2UagW/AQ/Hj/1Tj8NQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1715758792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0mk9oc6DES1RAS2h7quf07H1P5S+bDmfrogk/iErpU4=;
	b=xXNGajDr+Xr0xqNRVyHIIoN1Nn4grCsCaNVO0gjxipKBlAOvGt/B8LYAnwpdIFmkoaNzhF
	RTa8/aKddsbswlDw==
From: Nam Cao <namcao@linutronix.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH 0/2] riscv: fix debug_pagealloc
Message-ID: <20240515073947.J1Hzlsm5@linutronix.de>
References: <cover.1715750938.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1715750938.git.namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_003954_998958_CB1DC05E 
X-CRM114-Status: UNSURE (   9.70  )
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

Forgot to Cc the original author.
+Cc: Zong Li <zong.li@sifive.com>

On Wed, May 15, 2024 at 07:50:38AM +0200, Nam Cao wrote:
> The debug_pagealloc feature is not functional on RISCV. With this feature
> enabled (CONFIG_DEBUG_PAGEALLOC=y and debug_pagealloc=on), kernel crashes
> early during boot.
> 
> QEMU command that can reproduce this problem:
>    qemu-system-riscv64 -machine virt \
>    -kernel Image \
>    -append "console=ttyS0 root=/dev/vda debug_pagealloc=on" \
>    -nographic \
>    -drive "file=root.img,format=raw,id=hd0" \
>    -device virtio-blk-device,drive=hd0 \
>    -m 4G \
> 
> This series makes debug_pagealloc functional.
> 
> Nam Cao (2):
>   riscv: force PAGE_SIZE linear mapping if debug_pagealloc is enabled
>   riscv: rewrite __kernel_map_pages() to fix sleeping in invalid context
> 
>  arch/riscv/mm/init.c     |  3 +++
>  arch/riscv/mm/pageattr.c | 28 ++++++++++++++++++++++------
>  2 files changed, 25 insertions(+), 6 deletions(-)
> 
> -- 
> 2.39.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
