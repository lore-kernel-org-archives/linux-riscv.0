Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3EFCCF2E4
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2026 12:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:MIME-Version:Subject:Cc:To:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p+LbHVxRlPn48Eu+VXWC/fSwdehYj+Gv+yG+2QnBhxY=; b=QWFWwDq9VeMm4l
	vO57dXCW4RpM4BwkAw8w+qmNb96MRvtT1yt38bLn6Jf1+qAQenbRABNq1jw5vhXWUs40DuxYK8LU0
	KlaEqhIvvRbnV0+VW4a5n0ODZuYCkxbjgFw5qIhs1H6RaI3UgrEGghASUt8AYl4MHyrLlSOtpUc7+
	3bP9slWertNEYXPv5mE6Dpmnbk5K0P04oQKdUXB4F66qEJOKwlg9a4vBcRQMOeZIEvuCl/jtBk118
	3dCe4QT30HdbhxJylv+z82osyYcCwtV4wlqXk1dbUBipeTNyk45BVnL8MyxwDsm57bl1Iy8FYQKKB
	OKu2cr0KnmEskh8/Sijw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImiu-00000007QAL-3vXV;
	Mon, 19 Oct 2026 12:44:16 +0000
Received: from mail-m93187.xmail.ntesmail.com ([103.126.93.187])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImir-00000007Q8H-3tz5
	for linux-riscv@lists.infradead.org;
	Mon, 19 Oct 2026 12:44:16 +0000
Message-ID: <ACoATQBWLMQm6IW3xmgPIqp1.1.1792413844984.Hmail.252270051@hdu.edu.cn>
To: pjw@kernel.org, samuel.holland@sifive.com, vkoul@kernel.org, 
	Frank.Li@kernel.org
Cc: linux-riscv@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: =?UTF-8?B?ZG1hZW5naW5lOiBzZi1wZG1hOiBwb3NzaWJsZSBVQUYgYmV0d2VlbiBlcnJvciB0YXNrbGV0IGFuZCBjaGFubmVsIHJlc291cmNlIHJlbGVhc2U=?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com web
X-Originating-IP: 183.157.177.89
MIME-Version: 1.0
Received: from 252270051@hdu.edu.cn( [183.157.177.89] ) by ajax-webmail ( [127.0.0.1] ) ; Mon, 19 Oct 2026 20:44:04 +0800 (GMT+08:00)
From: LI xiao <lixiao0@hdu.edu.cn>
Date: Mon, 19 Oct 2026 20:44:04 +0800 (GMT+08:00)
X-HM-Tid: 0aa1542b2cacd458kusya666c29ac170
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHhgeVklKTRpOGEkYGUhNH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0hVSk5MVUpMTFVDQllXWRYaDxIVHRRZQVlPS0hVSk
	tISkxDSlVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=iar6xD0MeefcJmhuJt+71CQnPls657Btt9FCJe3JsTuFY1Mz2xBGKz1xZSTBpfg7wy5Bqg511jA6IWKqkWIIQBtPUsLJWahaaA3Zlcb5Nctrm5y8qsUw80/zRcdBuQ1bT59ervkgKTgD15qrbYA14fTFuDVvDnGgMqn9EnH2+y0=; s=default; c=relaxed/relaxed; d=hdu.edu.cn; v=1;
	bh=uid7unXvFpXIwc//7PPu9CZ/okIyOjRVbz31UgiFRGI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_054414_237177_F987AB8A 
X-CRM114-Status: UNSURE (   6.07  )
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

Hello,

I noticed a possible UAF in the SiFive FU540 PDMA driver.

In sf_pdma_err_isr(), the error interrupt schedules chan->err_tasklet. In sf_pdma_errbh_tasklet(), chan->desc is copied to a local variable before chan->lock is acquired. The failure path may subsequently access desc->async_tx through this pointer.

Meanwhile, sf_pdma_free_chan_resources() frees chan->desc while holding chan->vchan.lock. These paths do not appear to use a common lock to protect the descriptor's lifetime.

The driver does not set device_synchronize. Since dmaengine_synchronize() only invokes the provider's device_synchronize callback when it is present, the synchronization performed before sf_pdma_free_chan_resources() does not appear to wait for this driver's error tasklet to finish.

A possible interleaving is:

sf_pdma_err_isr() schedules chan->err_tasklet.

sf_pdma_errbh_tasklet() caches chan->desc in a local variable.

Channel resource release frees chan->desc.

The error tasklet accesses desc->async_tx through the cached pointer.



I reviewed the Linux v7.3 source at commit c03c1a14507dfaf8b856c2608f9ac216021fc222.

The relevant locations are:

drivers/dma/sf-pdma/sf-pdma.c: sf_pdma_err_isr()

drivers/dma/sf-pdma/sf-pdma.c: sf_pdma_errbh_tasklet()

drivers/dma/sf-pdma/sf-pdma.c: sf_pdma_free_chan_resources()

To check the consequence of this pointer-lifetime interleaving, I used a small out-of-tree synthetic reproducer on an x86_64 QEMU guest running a KASAN-enabled kernel built from the same mainline commit. The QEMU machine was q35 with 2 vCPUs and 4 GiB RAM.

The reproducer forces the pointer-capture/free/access ordering and triggers a slab-use-after-free report. However, the QEMU guest did not provide a modeled SiFive PDMA device, so this is not yet a reproduction through the actual sf-pdma driver and hardware path.

The relevant KASAN output was:

[    5.921218] BUG: KASAN: slab-use-after-free in repro_err_tasklet+0xee/0xf0 [sf_pdma_race_repro]
[    5.924452] Read of size 8 at addr ffff8881008edcc0 by task ksoftirqd/1/23
[    5.929455] repro_err_tasklet+0xee/0xf0 [sf_pdma_race_repro]
[    5.929566] tasklet_action_common+0x1fc/0x780
[    5.931347] Allocated by task 77:
[    5.932184] sf_pdma_race_repro_init+0xf7/0xff0 [sf_pdma_race_repro]
[    5.932525] Freed by task 78:
[    5.932619] kfree+0x127/0x3b0
[    5.932637] repro_release_channel+0x2c/0x90 [sf_pdma_race_repro]

Could you please confirm whether this is a valid race in the driver.

Thank you,
LI Xiao
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
