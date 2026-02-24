Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F579EEC2B8
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 01:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YyXO8bGtMAC1qyLRAtUvfuOFj1AwUE5kIJTU+57p8/E=; b=eY72PsVEJ5/th0
	VVLaKjvi3VdXySsTmmWTUZbBhi6AgqUjPpsNYCJJ97BwDluCz14wqXlTJz/KWVMqSto3/BFjfH8C3
	HFOFBO+tvUHiEDgGnYiIsYW4HFp93qB/NDKn2asvEtxs8DMtmkJ1eBqqR0GmJIae2E3xFKW4Z2NPT
	6XfucHoG0MtoUi+Hf4xWtfS4mNRIfqBLLWU+6Ak7mH/a4ZdtlhgiYBtvniSVxpKBd4h/8OP2hVvH2
	lJoak/uHiu3Ndf925XGHk7oNii3ACzXE6/c3xsS9A7+D2++2AWEQO7SaR2W/ziVlF83qxZ0uJN7gy
	X/TxbZZJvG+AXCMoo6sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vugp7-00000001G68-1HCo;
	Tue, 24 Feb 2026 01:02:49 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vugp4-00000001G5J-3x9u;
	Tue, 24 Feb 2026 01:02:48 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-01 (Coremail) with SMTP id qwCowABnDmqw+Jxp5UqbCA--.12448S2;
	Tue, 24 Feb 2026 09:02:41 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: xujiakai2025@iscas.ac.cn
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	jiakaiPeanut@gmail.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [PATCH] RISC-V: KVM: Change imsic->vsfile_lock from rwlock_t to raw_spinlock_t
Date: Tue, 24 Feb 2026 01:02:40 +0000
Message-Id: <20260224010240.3985602-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260131025800.1550692-1-xujiakai2025@iscas.ac.cn>
References: <20260131025800.1550692-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowABnDmqw+Jxp5UqbCA--.12448S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUOY7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z2
	80aVCY1x0267AKxVW8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x2
	0xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17Mc
	Ij6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l
	F7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkIecxEwVAFwV
	WkMxAIw28IcxkI7VAKI48JMxAqzxv26xkF7I0En4kS14v26r1q6r43MxC20s026xCaFVCj
	c4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsG
	vfC2KfnxnUUI43ZEXa7VUbX_-DUUUUU==
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiCREICWmcbKfTbgAAsa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_170247_345058_CD762983 
X-CRM114-Status: UNSURE (   4.04  )
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

Hi all,

Just a gentle ping on the patch, sent about three weeks ago.

This fixes a "[BUG: Invalid wait context]" issue observed during
fuzz testing, where vsfile_lock is taken with irqsave in vCPU scheduling
paths that already hold scheduler locks.

Any feedback would be appreciated.

Thanks,
Jiakai


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
