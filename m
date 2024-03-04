Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04545C5478C
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 11:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qtp0Z5rrPEFeziEaSAl85u8IavEZY3FsnENbADk2m3Y=; b=eEq1/04TXHnUWL
	Sm7qTvsLNi3bgzicy2mTKVoSqWVuCyWYTn8ldBd9vqXfL0pO28tb8nfLQz6urNxF27fY7oJ9KC5HZ
	0H8EkNmrO+aF5xxAAamKUPfvAk+YxbADtUsxfsXbc65mZzFhvSLDGBqzjZF8847LReNBOT5kxZpDG
	Liem8a61CDmEQzM2WrTV0rGuuwR8RxQ5DuJHfgcwPK91ow4lmBcD7oAIPOOnGydwAZPsmIAsJ9yUv
	bTGYKDqU86uJUPDBasDkWCcCaThglGMqhU/JmZ1EBOgd6GX4Ym9Ihb6M65teppVVlQEnP4K7aVZY1
	giHgSCVlgcSCSct19KsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh634-00000008j0C-1IDw;
	Mon, 04 Mar 2024 10:59:58 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh62y-00000008izU-2jPD
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 10:59:57 +0000
Date: Mon, 4 Mar 2024 11:59:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1709549988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=bJAczLXjA5qnADN9h7hX105sDv8kQ1JSUZwi6qoU15o=;
	b=sz6hKABRt57mIiWwyViSNtb8++S2DkPP/S1D+knADJCErHSjaVSGxZYU253cW3b/LvrI/8
	gQoFoGfopUzhXJ5yniLzpeVgviQKy0ZjaYrcc3t5Cy3JHntXI3HxEDGS+UIU++0PurRsIi
	plRr485SeQlhuUO1zEsJmDDp7tQV8LKhePf6WAtmM5x4Qud7OXsesZFyarxs2m9edIPo2V
	QvBwlpXA+i5KhTXulM755DftHZ9d0WTAdq/W6r739E6uVwc3QDJODxnFGQ7ZsPEdIxe8eZ
	slOB1wyf1MThGpQyWUsMIV/Dv+cJ6hbDL0AsSpSfdKKWRWUCSet0aNXikzzKkw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1709549988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=bJAczLXjA5qnADN9h7hX105sDv8kQ1JSUZwi6qoU15o=;
	b=U/BaWreY8ysvTentpMECQbXLEHOGcbk3Ct8IievDgxYgw3YQyD7dEjEVLXQaW4Xr5gi25p
	Rz3a1CRqwG7EIWBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [RFC] Inconsistent sifive,fu540-c000-uart binding.
Message-ID: <20240304105947.SJcVAdr1@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_025952_854801_379EBA9B 
X-CRM114-Status: UNSURE (   4.13  )
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

| $ git grep fu540-c000-uart
| Documentation/devicetree/bindings/serial/sifive-serial.yaml:          - sifive,fu540-c000-uart
| Documentation/devicetree/bindings/serial/sifive-serial.yaml:        compatible = "sifive,fu540-c000-uart", "sifive,uart0";
| Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt:"sifive,fu540-c000-uart".  This way, if SoC-specific
| Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt:    compatible = "sifive,fu540-c000-uart", "sifive,uart0";
| arch/riscv/boot/dts/sifive/fu540-c000.dtsi:                     compatible = "sifive,fu540-c000-uart", "sifive,uart0";
| arch/riscv/boot/dts/sifive/fu540-c000.dtsi:                     compatible = "sifive,fu540-c000-uart", "sifive,uart0";
| drivers/tty/serial/sifive.c:OF_EARLYCON_DECLARE(sifive, "sifive,fu540-c000-uart0",
| drivers/tty/serial/sifive.c:    { .compatible = "sifive,fu540-c000-uart0" },

note that the driver has a trailing 0 in the binding while the yaml
description and the DT part does not.
The 'sifive,uart' has a trailing 0 where the 0 denotes the version UART
IP.

Was this also intended for the fu540-c000-uart binding? Should the 0 be
added everywhere or removed from the driver?

Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
