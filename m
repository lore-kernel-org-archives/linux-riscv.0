Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B399FCCA479
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 20:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g2K5hXHDh+nmjPiC/SEwntIP91aJ3YuJJWlb4myAci0=; b=2zmIW/l2RfGH4r
	KJF7y2UxxwW2dOgOhVdm8LVQKKseKlQAvDMLSI68Aq6F3JB9YKU0TLMdZjSEfKdaUgmINTv0Ygbc7
	wOe85QAhN31L2tWHmxhiRGnpIqW05RwxrxaBwK+bCxtGVJm/BKVpX/3MBmF+upT1uQxgOnIEhv9jj
	AfSdhDq1/aUdmENmgvCtQWW0SgzUroFTCI/j+nGnxnRuALa8JvsH71t6mKYdtpu0xKaBvPjPoPWcX
	2mtCoMevm8zVtAwU6yIjfRYUFduU7frtobyU/OOh9/dx2B9RgAuPeq5bBHpLJNy2I4SohgxLguPH4
	kdcHHI/BRJWNXB7FlOXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7NC6-006n6s-2O; Fri, 01 Jul 2022 20:24:50 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7NBz-006n4p-SV
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 20:24:46 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 375EA5C00BF;
	Fri,  1 Jul 2022 16:24:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 01 Jul 2022 16:24:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1656707082; x=1656793482; bh=HboBnnGwsEoiC8NAxh0dVnMqp
	uKutI8lGKz3TQGSFLI=; b=k9ksBvakLlYMVAjErf3dl4XypI6LLGNfO+LN5yt9y
	tqvPzD3XhqyJm7gB59iVNu95lowvRR3QxyeRZ5i2u7qfb//4n+ZDxhff17o4veMb
	Z5ui+e3MwOBeWSoNL7tK7Snuah0gpM+23RPWdecVhAhyCM0f33QXfuKwnNEgsvTf
	VSjDEKhfBqcnOus7rlJyKq4ZfkjOt3D1Z1tYO7focxnV8LI6aB5mm2eG2q4NhVFp
	aOYokSHUjlQQal6Wg4dpKFtorrh5CXmbHMbS6OR1Xida2jkgp5IlrBTAolljtozI
	1+IDzN42WA1uzw5L8NjH9Y7+uKoGZS/bMSKizuj/kKmUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1656707082; x=1656793482; bh=HboBnnGwsEoiC8NAxh0dVnMqpuKutI8lGKz
	3TQGSFLI=; b=giPdzMO1rdvb8yk7Sz0sHDxYAacy57sAV2/zFoeIyHLp2G4QO/g
	hU+ogTKLgPsrZEAWd53wRqF8ULqVYraypu6SdbTWrMzvUG3xtKXlXJymsVi4I1/b
	2ITehHsfRg54ybYB0YBiTSFYw5PIzB1QXULvpuZLivfDHYhysIZPY/cKoEtQNRaP
	q3JPEg2t3Nb8UCRGdJtOhwj1J4/xQWQllTCHggDr1nhS2h/7Xdgrl3BZPHYbfumg
	/qRx5JETwvhK0HLiLvwLc4k9r8vF/yov0GDDmH9IPlVXrezajS4hvtDqC65F8yhT
	Cd4vK4BIMki0gupVf6p6F+a+kVliCjMNohg==
X-ME-Sender: <xms:Cli_Yted2qOUB6WQiSzN5eNIK0rcP_8wkKzMpajvIWubsuknKGN15g>
    <xme:Cli_YrN6Dmrg5tZlzIfDpz4-vy-ZiD1TRIemNZDhnDfCcGjCsW5EyG1jwNfwomLZH
    NTF6BGQJgjwnXCx6A>
X-ME-Received: <xmr:Cli_Ymhoy3gIEfYv5Vm6El2llbdINK4rCbIE_z2WFZctFco1TBg19s8qft76CMTdfMbfTrJeQ_WsJqTiT9k_YakFpkDirsmtL39wp18NdeoKf3UocOAjbMDPcaI_dFFhSH2_LQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehfedgudegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeekheffteehtdetfffgfeetteejvdefleeuvedufffguedtjedvheel
    vddvfffhveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
    ugdrohhrgh
X-ME-Proxy: <xmx:Cli_Ym9QLOPQg12WaXzINQIGzBQnmMDhLASx2PzzwLno2HCuND8nWg>
    <xmx:Cli_Ypu9uS4EKYyUmJ3yP6fIKiB7vbh-elvuxk7rTtNJgYz-gBCdKg>
    <xmx:Cli_YlGZOXtK7oO7_X0x8NY051ljM6xXQxSnUgs7KG9wWjkt4UOrqA>
    <xmx:Cli_YtgmlyBb51ZZCZbL7NBbp7MDbMV2DmyJBjHxfXg0eHpPYeS0Nw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Jul 2022 16:24:41 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/2] irqchip: RISC-V PLIC cleanup and optimization
Date: Fri,  1 Jul 2022 15:24:38 -0500
Message-Id: <20220701202440.59059-1-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_132444_030756_30314643 
X-CRM114-Status: UNSURE (   9.22  )
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

This series removes the spinlocks and cpumask operations from the PLIC
driver's hot path. As far as I know, using the priority to mask
interrupts is an intended usage and will work on all existing
implementations. See [1] for more discussion.

This series depends on my other series[2] making the IRQ affinity mask
behavior more consistent between uniprocessor and SMP configurations.
(The Allwinner D1 is a uniprocessor SoC containing a PLIC.)

A further optimization is to take advantage of the fact that multiple
IRQs can be claimed at once. This allows removing the mask operations
for oneshot IRQs -- i.e. the combination of IRQCHIP_ONESHOT_SAFE and
IRQCHIP_EOI_THREADED, which is not currently supported. I will send
this as a separate series, since it makes more invasive changes to the
generic IRQ code.

[1]: https://lore.kernel.org/lkml/2b063917-17c8-0add-fadf-5aa42532fbbf@sholland.org/
[2]: https://lore.kernel.org/lkml/20220701200056.46555-1-samuel@sholland.org/

Changes in v3:
 - Rebased on top of irqchip-next
 - Split affinity series and PLIC series

Samuel Holland (2):
  irqchip/sifive-plic: Make better use of the effective affinity mask
  irqchip/sifive-plic: Separate the enable and mask operations

 drivers/irqchip/Kconfig           |  1 +
 drivers/irqchip/irq-sifive-plic.c | 64 ++++++++++++++++---------------
 2 files changed, 35 insertions(+), 30 deletions(-)

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
