Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6FAC44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 07:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Subject:To:Cc:Message-Id:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jS6mSxQ1taE3jGeog9B5+SFmQR86O3JPXdzTvp0rei8=; b=qRs/8uiMp3AsWv
	DVEVbTcllOB7zNgg9iMpqssDvhuXYhUqiMtzCSb30j1K+o4X3tGxBWNaQDanhtBm/NSOiUI80ZWv7
	qf23xVQRTkcCD/AOW6IRiQxIzLyZ4e7Q+Gh18gnZyJHIsDIAXIelRRuTBS2AqxIR/hXdi6gKUk1eX
	38kNidqN+6u6zhZq9O4o8D3sb/ciozs9vWkrE55J6EkiUzdGJKI8hXLT5SvdVX/oNR46bjnVsOEn7
	qRrbGVF4R5XYuzQ8S17s10K8ZQBhzr1o4sOTEynyVOdc/vlWTfeccSpG/0Jlw0VaBzwmN/VbRI6JL
	QbnihtOpvRkGEePz3QBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipDf-00000006aPB-2OwQ;
	Thu, 22 Jan 2026 07:35:07 +0000
Received: from sg-1-40.ptr.blmpb.com ([118.26.132.40])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipDc-00000006aNq-0cVp
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 07:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=picoheart-com.20200927.dkim.feishu.cn; t=1769067292;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=4/OBCIJE/VhfTNxo9r56MT8A/UZqxjI8m594zPId+d8=;
 b=yPkUDbBQmg4A5gG4g1Of+/pcuhKu2t2xyKH8lNWoVZ/A+Au/1y9PRwTShSejjxOc9pplcN
 FX+sPlvEBQs6vig+93B4mv04gXRo5TWm7dBX0cKGmyi5mJ+IqMlbEUA00Jxne+DrEDMPLu
 L4PvRfcJf2L8x0olq0XxKASVV5qJ+35H29hs/+hl04GBY2IgOfXkv026T6XcwgqvNnuXM1
 t/jugebA4yIF6PSlZYwU7DySJIYYNklVYKfkCmfUBcs0cEd1hISacz5cBcy4yCW+EBszKc
 szYgHVybpemNu1FunMucN3wQTvhNg6V9pmnGrnSy32FV4aGNiktDGef+xHVVbw==
From: "Yicong Yang" <yang.yicong@picoheart.com>
Date: Thu, 22 Jan 2026 15:34:44 +0800
Message-Id: <20260122073446.45628-1-yang.yicong@picoheart.com>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
Cc: <akpm@linux-foundation.org>, <apatel@ventanamicro.com>, <pjw@kernel.org>, 
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, 
	<geshijian@picoheart.com>, <weidong.wd@picoheart.com>, 
	<yang.yicong@picoheart.com>, <linux-acpi@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
To: <rafael@kernel.org>, <lenb@kernel.org>, <tglx@kernel.org>, 
	<gregkh@linuxfoundation.org>, <dakr@kernel.org>
Subject: [PATCH 0/2] Ensure some device initialization before init task
Received: from G9WYR9K0VW ([58.250.122.114]) by smtp.feishu.cn with ESMTPS; Thu, 22 Jan 2026 15:34:49 +0800
X-Mailer: git-send-email 2.50.1
X-Lms-Return-Path: <lba+26971d31a+5fde07+lists.infradead.org+yang.yicong@picoheart.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_233504_622318_F1E941DD 
X-CRM114-Status: UNSURE (   6.22  )
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

Fix two issues that may cause devices initialization finished
after entering init task.

Patch 1 ensure the device object scanning by acpi_scan_clear_dep_fn()
is finished before entering init task. Otherwise if some key devices
like console or root device are not ready when entering init task,
the system will panic (no available console) or enter rescure shell
(no root device). It's more possible on RISCV since these devices
are scan and created by acpi_scan_clear_dep_fn() and we've observed
this.

Patch 2 fix a theoretical issue that the console initialization is
still in process by the time we open the console. Since we call
console_on_rootfs() before async_synchronize_full(), there's no
guaranteed for the order.

Thanks Thomas for the discussion to debug these two issues [1].

[1] https://lore.kernel.org/linux-riscv/20260114063730.78009-1-yang.yicong@picoheart.com/

Yicong Yang (2):
  ACPI: scan: Use async schedule function for acpi_scan_clear_dep_fn
  init: Move console_on_rootfs after async_synchronize_full

 drivers/acpi/scan.c | 35 ++++++++++++++++-------------------
 init/main.c         |  4 ++--
 2 files changed, 18 insertions(+), 21 deletions(-)

-- 
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
