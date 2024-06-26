Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD6CC3064D
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 06:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FYqqnkmyI2BGiOR9cDMisXcHxglnsrsJ0zljLxokyS8=; b=Mml99uomi/Sh2j
	M+nvNtMkGMTiH4iF5c9+b3H8fsJAmv5z0LNWFTjyAuS7xR8vW+GD5ytN3bhJNk32GPT+4FWcT1svj
	g6JBAZbG8b4VzCGsPEum54LX3reVJXTv/uHXj9VDP2aPintpNm06Q+RTQsfpa3yKbLGiwxl5T0FL4
	wIIy6qrPY/srPcbKW6sSDTU2w+dHwwn472ONuG+sxE+8IYSKwRE+KeYkbyzS2P/8q9Ie4DydN+ZoW
	6+HUE0VedyduWrXobZBl5Y+je1Xg2V88IIuD8Q20EOKS+AOLlcfbp5iOHjbf94+QUxUuwhwj9crV6
	8qH8DhRc87XcXPoY1vww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMMDB-00000005bjQ-0GsT;
	Wed, 26 Jun 2024 06:32:57 +0000
Received: from mail.valinux.co.jp ([210.128.90.3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMMD8-00000005bii-17Zn
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 06:32:55 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.valinux.co.jp (Postfix) with ESMTP id 95113A9CE9;
	Wed, 26 Jun 2024 15:32:49 +0900 (JST)
X-Virus-Scanned: Debian amavisd-new at valinux.co.jp
Received: from mail.valinux.co.jp ([127.0.0.1])
	by localhost (mail.valinux.co.jp [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hjmXiI6aXZXQ; Wed, 26 Jun 2024 15:32:49 +0900 (JST)
Received: from DESKTOP-NBGHJ1C.local.valinux.co.jp (vagw.valinux.co.jp [210.128.90.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.valinux.co.jp (Postfix) with ESMTPSA id 72F68A9CB9;
	Wed, 26 Jun 2024 15:32:49 +0900 (JST)
From: takakura@valinux.co.jp
To: songshuaishuai@tinylab.org,
	alex@ghiti.fr,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com
Cc: aou@eecs.berkeley.edu,
	bhe@redhat.com,
	guoren@kernel.org,
	xianting.tian@linux.alibaba.com,
	akpm@linux-foundation.org,
	takakura@valinux.co.jp,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [V2,-fixes] riscv: kexec: Avoid deadlock in kexec crash path
Date: Wed, 26 Jun 2024 15:32:20 +0900
Message-Id: <20240626063220.91754-1-takakura@valinux.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240626023316.539971-1-songshuaishuai@tinylab.org>
References: <20240626023316.539971-1-songshuaishuai@tinylab.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_233254_433418_D31CEB23 
X-CRM114-Status: UNSURE (   7.80  )
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

On Wed, 26 June 2024, Song Shuai wrote:
>If the kexec crash code is called in the interrupt context, the
>machine_kexec_mask_interrupts() function will trigger a deadlock while
>trying to acquire the irqdesc spinlock and then deactivate irqchip in
>irq_set_irqchip_state() function.
>
>Unlike arm64, riscv only requires irq_eoi handler to complete EOI and
>keeping irq_set_irqchip_state() will only leave this possible deadlock
>without any use. So we simply remove it.
>
>Link: https://lore.kernel.org/linux-riscv/20231208111015.173237-1-songshuaishuai@tinylab.org/
>Fixes: b17d19a5314a ("riscv: kexec: Fixup irq controller broken in kexec crash path")
>Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
>---
>Changes since V1:
>https://lore.kernel.org/linux-riscv/20231208111015.173237-1-songshuaishuai@tinylab.org/
>- update the commit log as @Ryo elaborated 
>- rebase on Linux 6.10-rc3

Reviewed-by: Ryo Takakura <takakura@valinux.co.jp>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
