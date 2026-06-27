Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46B0C43458
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2026 12:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=xcWChKvkW5xO66ysx2958M6Xm6ZOPmPNQ674I7LDbp0=; b=C+1
	dq4beSFLdjyMpLHrmA87JTyn3PpRHIDXlHbjfwWUCMrumqqEtmFRBa4cUTC56CueDtgEzg8BTa312
	2b7dpv6vH+/ed2C3aAChDbK0jdxtYcsninahb/d96LsH0oCYLMLjFZIbS0tPUhL/Z8RNfnsLgCqff
	MuyAGuNxv+bJcf/sUgSiWXBIUqBWoYMiQpvRmvzKTP2FHhb+5zyjFiz+BAgz61RAf0EWNCs6YTWy7
	A37MkE/0YdJh07HMswPJH8doAfLgx5jSPqaIPtvaXI4slsKJ2gJEKWczMeC5J7IeZsOP3B/rzC+oW
	jqXS1NQ5TvenT03f9WE9mGB0CyZRUQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdScp-0000000CTwm-2WK1;
	Sat, 27 Jun 2026 12:59:11 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdScl-0000000CTwD-2hvO
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jun 2026 12:59:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:MIME-Version:Content-Type:
	Message-Id:Date; bh=uI0eebU7NJ7bS+LZ0KUCV+yfYh/fCs3zjjsunIv9GFU=;
	b=bZBmixQyWC9oZjIxhfCyF+qZW8lxaIFzl2RyhGDvZzwOsn4wsV4NLs7IbLZTXG
	XnXT6CkXs0pM+rfjh38IhOMx41hs6vaUJUTDrLk8qZn0mCYCcyua3vTqAdcKW484
	7JyFLMFKU8nwBxkPF8FH6aWBAsB4QdLw8wdjUnLAhzOig=
Received: from [127.0.1.1] (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wCnEPn_yD9qyiyfGA--.14384S2;
	Sat, 27 Jun 2026 20:58:39 +0800 (CST)
From: Xiaofeng Yuan <xiaofengmian@163.com>
To: namcao@linutronix.de
Cc: charlie@rivosinc.com, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: kprobes: Add test case for c.jal instruction simulation
In-Reply-To: <20260627115051.3235783-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CM-TRANSID: _____wCnEPn_yD9qyiyfGA--.14384S2
Message-Id: <6A3FC8FF.1BF932.00001@m16.mail.163.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RXR6zDUUUU
X-Originating-IP: [39.172.233.103]
Date: Sat, 27 Jun 2026 20:58:39 +0800 (CST)
X-CM-SenderInfo: p0ld0w5hqjzxldq6il2tof0z/xtbC5R-b3mo-yP+MigAA3b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_055909_330601_22FF1272 
X-CRM114-Status: UNSURE (   6.11  )
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

Hi Nam,

Thanks for the test case. Since c.jal is RV32-only, I haven't been able
to run it on real hardware. I tried running the full kprobes KUNIT test
suite under QEMU riscv32, but the test appears to hang before
completing -- even without the c.jal test case included.

I suspect this may be a QEMU emulation speed issue or a pre-existing
limitation of the test framework in an emulated environment.

Did you run this test on real hardware or in QEMU? If QEMU, any tips
on how to get it to complete?

Best regards,
Xiaofeng


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
