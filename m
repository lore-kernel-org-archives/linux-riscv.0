Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994FAC7EE25
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 15:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CMGqztx/FmSQFz1LvI6ae7B0ZY5fWFh7c0Zh3/VGuZA=; b=dyGeB7B5Jr/mpC
	Ld5k2u9QeUl265lG367ygj6fcftA8prJfLRBTNkycUsP7BT/XjfzPfLBh0lJbgaxF+7wPtSqbrqlG
	uebnwXA2rKh+rxDhyVjzWR/6XBWNihE6nBDW8WsNacMr8t7U/WPZI2Hbd5pBDxljcuF6DLzkmjo9d
	fGDD/jelv1TP1noyG+YKGOmGe9k7QE2+Q9Mf1vv4VDYzFg4jRp3bLnjTFo9HUzWy3RmiAQVcoTh+/
	rzs3UkerPRpA+IjkqUbSf3rkcB0RGN17gns9XQOYFvUmbuUh1yt8hfBBicAyITDy1zpQKKXP/+mrZ
	M5N7iY8QyHqfiXDqkZbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzfdz-00DJwB-2U;
	Thu, 18 May 2023 15:34:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzfdx-00DJub-0L
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 15:34:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A3A7A65032;
	Thu, 18 May 2023 15:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96ECAC433A1;
	Thu, 18 May 2023 15:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684424056;
	bh=mtrxumyq0ZRmNVTAnw5KH+BUNijjTRh/kWJxJPGHbDU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SGbIB8w46x8K+bS/h1IrsArBKnSUDQbJusl259FltuEAMHQqWk3iv737Cdkla9WfR
	 Y+5uxpZ02rQObZCuaFvWsEIiinWanCxu6jg/3qHNmGFoo5Z1x0h5lD4WeK690TkIla
	 LncuBttq0p4NHcU2Qhdsbkb54XtzwUONOw2RtkU1MH9/12vAkY5lOZi/3i4OV+Rr/J
	 Sy31Qa+4U1sa8gUSvbBYGwVjh43c88H8+MX8SuN/KkMa9aLTAu6L0AxiOblcs8eT9w
	 Az6U5RvDBNn8sozrIWJwkPb70SXVvfDtjyFGVV/z2kZlIOffPPrufHk6WS4Q/th5E1
	 9QO4d4mtc/I6g==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v4 05/10] riscv: add the Bouffalolab SoC family Kconfig option
Date: Thu, 18 May 2023 23:22:39 +0800
Message-Id: <20230518152244.2178-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230518152244.2178-1-jszhang@kernel.org>
References: <20230518152244.2178-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_083417_187346_E7FD7FF4 
X-CRM114-Status: UNSURE (   9.98  )
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

The Bouffalolab bl808 SoC contains three riscv CPUs, namely M0, D0 and
LP. The D0 is 64bit RISC-V GC compatible, so can run linux.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/Kconfig.socs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 1cf69f958f10..33220b5144bb 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -1,5 +1,10 @@
 menu "SoC selection"
 
+config ARCH_BOUFFALOLAB
+	bool "Bouffalolab SoCs"
+	help
+	  This enables support for Bouffalolab SoC platforms.
+
 config ARCH_MICROCHIP_POLARFIRE
 	def_bool SOC_MICROCHIP_POLARFIRE
 
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
