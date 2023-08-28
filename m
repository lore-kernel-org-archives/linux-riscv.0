Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6777AC71153
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 04:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pE8V+FygjJFe2f6mg/zYLvONYlOqM05m+dWTlZrX/EU=; b=cPvXfAeo7biCkn
	XtvIC2+pSQI4f8gLe4K79giUGvfZYx3dftsMiPyhJZoMsich1ChiEgZulFzOgvMlKoFgzonx1g1AK
	dwM0WENxNDz4ivwNAQFZwR93DGRJyuqz+AnPDereO9F6hMBVVGm9Q7XB6oUPcBW5wr7VuAmU2mB/J
	z5P/fSxqYKqK1Bysh/BN1ykTWoigqvUQavUNroAYZnElzsaorwgIeV6Uq2q+8oMldQw2m9BQDTzcE
	QxJ8V27D+DJ55WvkFt3V5DOlsnesoN27ABCXxkrjQVXY15cBHZWfbksz+vwphgYpP6WhVTO54qM1+
	V+0y962M/zeK3FouIUfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaU3z-008qpz-0m;
	Mon, 28 Aug 2023 04:41:19 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaU3v-008qoT-2Z
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 04:41:17 +0000
X-QQ-mid: bizesmtp78t1693197620tdj5elbh
Received: from wangjiexun-virtual-machine.loca ( [120.225.34.249])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 28 Aug 2023 12:40:17 +0800 (CST)
X-QQ-SSF: 01200000000000001000000A0000000
X-QQ-FEAT: znfcQSa1hKYDxmkXgnl9lrc8jm7ncjAYCvItBCS+bXKY++nEN9itQfpOM0KLH
	Oqr4Gg/mQj1qE4+umRvFwq6/LH8K3ysz5/vuSYTxFWjafMILTFvoP1vMsKqTSUJwY++Z9fI
	V+nQTh5qrHw2E2qIqik81duYSAF6Y46S4o/S4lb+ubZ34C56RBuIW6f9yY3paBw37SBvM2d
	MPas2/XycMRbK0qKwVULKjTSl0Xvl0x4qM6jvU04Vye23X9pBkqpy4LHTTSQwcA3ibY4b8d
	JgcuIAbF1pwh80gFwTPzkwDwK3VH07fUtjFz4u0NQ/FiKx+tc6Di2ylR1K8u+GIaqh53atJ
	LybILy8fHzRNHZgcbvCjB0yg9r2fxClx3ebmEh+
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1038203160215464499
From: Jiexun Wang <wangjiexun@tinylab.org>
To: dfustini@baylibre.com
Cc: adrian.hunter@intel.com,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	guoren@kernel.org,
	jkridner@beagleboard.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robertcnelson@beagleboard.org,
	robh+dt@kernel.org,
	ulf.hansson@linaro.org,
	wefu@redhat.com
Subject: Re: [PATCH RFC v2 0/4] RISC-V: Add basic eMMC support for BeagleV Ahead
Date: Mon, 28 Aug 2023 12:40:16 +0800
Message-Id: <20230828044016.109515-1-wangjiexun@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724-th1520-emmc-v2-0-132ed2e2171e@baylibre.com>
References: <20230724-th1520-emmc-v2-0-132ed2e2171e@baylibre.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_214116_182135_1EE96D9E 
X-CRM114-Status: UNSURE (   6.31  )
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
I tested the patch on my LicheePi 4A board.
It can successfully boot with eMMC, but when I use the eMMC more frequently - for instance:

$ while true; do /bin/dd if=/dev/zero of=bigfile bs=1024000 count=1024; done &

I encounter the following error:

sbi_trap_error: hart1: illegal instruction handler failed (error -2)
sbi_trap_error: hart1: mcause=0x0000000000000002 mtval=0x0000000060e2de4f
sbi_trap_error: hart1: mepc=0x000000000001897c mstatus=0x0000000a00001820
sbi_trap_error: hart1: ra=0x00000000000170f8 sp=0x000000000004adc8
sbi_trap_error: hart1: gp=0xffffffff8136ea90 tp=0xffffffd900228000
sbi_trap_error: hart1: s0=0x0000000000000000 s1=0x000000000004ae08
sbi_trap_error: hart1: a0=0x000000003f9aa9bc a1=0x0000000000000004
sbi_trap_error: hart1: a2=0x0000000000000000 a3=0x0000000000000000
sbi_trap_error: hart1: a4=0x0000000000042248 a5=0x00000000000170e5
sbi_trap_error: hart1: a6=0x0000000000000000 a7=0x0000000054494d45
sbi_trap_error: hart1: s2=0x000000000004aee8 s3=0x0000000000000000
sbi_trap_error: hart1: s4=0x000000000004ae08 s5=0x0000000000000000
sbi_trap_error: hart1: s6=0xffffffff813aa240 s7=0x0000000000000080
sbi_trap_error: hart1: s8=0xffffffff80a1b5f0 s9=0x0000000000000000
sbi_trap_error: hart1: s10=0xffffffd9fef5d380 s11=0xffffffff81290a80
sbi_trap_error: hart1: t0=0x0000000a00000820 t1=0x0000000000000000
sbi_trap_error: hart1: t2=0xffffffff80c00318 t3=0x0000000000000001
sbi_trap_error: hart1: t4=0x0000000000000330 t5=0x0000000000000001
sbi_trap_error: hart1: t6=0x0000000000040000

My kernel version is v6.5-rc3.
My OpenSBI version is 1.3.
I tried to use other versions of OpenSBI, yet the problem persists. 
Is there a possibility of any underlying bug? Your insights into this would be greatly appreciated.

Thanks,
Jiexun Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
