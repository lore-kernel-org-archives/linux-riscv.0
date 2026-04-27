Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42644FF8861
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 07:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tagkiqGkuyYsIaiNAQ9UnWBn3xXjIoQdER1TZQb5ZGM=; b=ayxoui9mF9E/AB
	ybPML5AHJP/ru7iTlUA7Cz1mg2+PS33zx2d2YPTiO21AV8P1G7ctN3sYJgEfirSzJv5FNJ1//xILC
	yF1SYuDCYAO+cEJ2QPqyKlKmgrfBHcpthr58adnILHRN/YR0iAckSY1+WsnXuFxmbIKS4DVCeOa4W
	Noo0WzcGHoSMmPjwIn2lSz5VTqK9bDoegUVPHEUbwdt3INmhFtHWf4nnqdj8TdbNjAzqmRya/Zg8n
	9Q+DzYxgxBM0jmPHInqzaN3uOKujVQ/tZFO1bThZPCRfeVipi1BWgfkErmWcbOoFIaCJE8UqOsrSb
	QDESRcXD0xushac69RcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGh3-0000000GPHb-2YhK;
	Mon, 27 Apr 2026 07:47:49 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGh0-0000000GPHD-3lJR
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 07:47:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=EvtGSF4+wsB8KaQy8UyMm/3mcw9fJX9JJ
	8pi18BcI7E=; b=QSGDGYYaRiHmCN8zw1WSsbVZsnaS0KY7MtGrPnBcFKsaoX7tf
	v9snGXsubST88eb7Nv+JrS/1N1j8MMcAVaROVLlPX1/whY27t8zrAWiQtu4YFuUS
	cUosZ/MJOwA+4xQY7UWr428HaWLHnd0txEI0TRdDru9u+QGj2/RoMjurl4=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDXEEKtEe9pyQEDAA--.1555S2;
	Mon, 27 Apr 2026 15:35:09 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/4] serial: 8250_dw: Add support for UltraRISC
 DP1000 UART
From: Jia Wang <wangjia@ultrarisc.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jia Wang <wangjia@ultrarisc.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <aes-qdaT_9wMbTsm@ashevche-desk.local>
References: <20260424-ultrarisc-serial-v4-0-1765a0b4c4a0@ultrarisc.com>
 <aes-qdaT_9wMbTsm@ashevche-desk.local>
Date: Mon, 27 Apr 2026 15:34:25 +0800
Message-Id: <177727526561.1796253.1521989195994870860.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777275265; l=913;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=QAvhRvLzQHH69MBDbCVJ9pxPR7o4fCwYz7Zw68Wk37w=;
 b=YBzyVlQUsNsDsDyB4p35jeCaLPKWRKxVOw8/EEhQ80bDajJ2pecorsuLUqnIlXggxui0r0XUr
 I4LKHkQ8rXCBdMT67ezw9mJ/Kj0y+kY/TiTUq7YIseDmQDrE2dg+vAt
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwDXEEKtEe9pyQEDAA--.1555S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKw43XF4xtw1DXryxGFWfZrb_yoWfGFb_ur
	yrCr9a9FWkAFs8Za98JrW5CFsIka1UXw1UJryDWrsFkr13A3Z5WayjkwnIv340yayrGF1j
	kFy5Xw48CrZI9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAKEWnti78ACwAKsr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_004747_449152_A5EEDA30 
X-CRM114-Status: GOOD (  17.19  )
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

On 2026-04-24 12:58 +0300, Andy Shevchenko wrote:
> On Fri, Apr 24, 2026 at 01:39:27PM +0800, Jia Wang wrote:
> > This patch series adds support for the UltraRISC DP1000 UART controller.
> > 
> > The series includes four patches. The first two are preparatory cleanups;
> > the last two add the DP1000 compatible and fixed CPR handling.
> > 
> > The patches have been tested on an UltraRISC DP1000 development board with
> > Linux v7.0-rc7, verifying basic UART functionality.
> 
> Now it looks good to me, thanks!
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> (except DT bindings, not an expert, no tag)
>

Thanks for the review, Andy. I need to rework patches 1, 2 and 4, so
I won't add your Reviewed-by tag yet. Could you please have another
look at the updated patches in v5?
 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
>

Best Regards,
Jia Wang
 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
