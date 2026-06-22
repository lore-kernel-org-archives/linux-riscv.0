Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A731CD98F2
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 12:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ZaRWbbX0TiJ6vcTBlLPZddok3BpXHAXddlEar3HMBg=; b=GhHSElW5iRwjeO
	zsMZuIXE1y4z2fvbm4Li15qbnLohHZ9I4LePe17F0NZxqgGtTn01R5iV9TBBhSFT5v3yJVb2xrnrR
	hYECQs7nAfm4MCyKIMV6x8afbj0cSPXvtEyz5bk+0VMHUieuLWX0KSlO3JY6GOJgGZw6vshwEQIHX
	VRchK2IjNYR1OZ3/RvYxnndr4uh2Hv5XnK2NM+c1QjhIXmDK15/VA+GI80XqgtjNhRuRc/INBhS+I
	Yib16s3HFAICnV+ThXzT71SXfbADTRSeL/3qV3KR1vgzXUwLL5n0qCCQNXwXOVmKTMIU/N3HMsv3N
	Zq+6KqedQnRaHIyFYrjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbdbW-00000004xLF-0lTr;
	Mon, 22 Jun 2026 12:18:18 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbdbR-00000004xKu-3wP5
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 12:18:16 +0000
Received: from fric.. (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowABXrtH5JzlqIsitFA--.58233S2;
	Mon, 22 Jun 2026 20:18:01 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: namcao@linutronix.de
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	dev.mbstr@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	xujiakai2025@iscas.ac.cn,
	zhangchunyan@iscas.ac.cn
Subject: Re: [PATCH v2] riscv: stacktrace: fix stack-out-of-bounds in walk_stackframe()
Date: Mon, 22 Jun 2026 12:18:01 +0000
Message-Id: <20260622121801.430564-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87zf0q504f.fsf@yellow.woof>
References: <87zf0q504f.fsf@yellow.woof>
MIME-Version: 1.0
X-CM-TRANSID: zQCowABXrtH5JzlqIsitFA--.58233S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYN7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aV
	CY1x0267AKxVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv
	0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z2
	80aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I2
	1c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI7VAKI4
	8JMxAqzxv26xkF7I0En4kS14v26r1q6r43MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E
	5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtV
	W8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY
	1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
	0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7V
	U1jg43UUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiCRAGCWo5I0wPnAAAs5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_051814_702356_8FFF913D 
X-CRM114-Status: UNSURE (   7.98  )
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

Thanks for the review!

> I am concerned when CONFIG_IRQ_STACKS=y and we are on the irq stack,
> wouldn't this "high" be the wrong one?
> 
> I haven't validated it, we probably need something like
> 
> if (on_thread_stack()) {
> 	if (!task)
>         	task = current;
> 	high = (unsigned long)task_pt_regs(task);
> } else {
> 	high = per_cpu(irq_stack_ptr, smp_processor_id()) + IRQ_STACK_SIZE/sizeof(ulong);
> }

I agree with you. Let's see if anyone else has suggestions. 
If not, I will send a v3 patch in a few days.

Regards,
Jiakai


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
