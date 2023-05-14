Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24E7C77B7F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 May 2023 17:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CMGqztx/FmSQFz1LvI6ae7B0ZY5fWFh7c0Zh3/VGuZA=; b=0rk8nIJa8hr2Rj
	6MVi4ZhrttOdqG8VxUBt6cW4CTmpsObyUE7QhhFAtGLqsW7/7tusdwI1xNBelnlhCIZWUt62HRLt2
	SSeCgEk7SFlUT89Ul/s6vB4npHgxA4vQ9u4ogHxGm8T5mWATR0ox1efrTbkwwhmrGOP+IGxkFCG/E
	eCHiwmZXVfq6ZeTI/awyihkNHX0q42AdgXuX2hSopwBLYTvEFZNxPglui9Q9fVt+liujbYb3v1VAt
	ysDGfIaj863F2LFXNaOfdqBlQNShBF/KmPGSevEyKpqobmcahpc8AE+Mu8vVvjU31iNF8af0xqkzd
	JelsM1LzV1h2gQ1Dc//w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyFCr-00HYmJ-07;
	Sun, 14 May 2023 17:08:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyFCn-00HYlR-2v
	for linux-riscv@lists.infradead.org;
	Sun, 14 May 2023 17:08:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 75EEB61898;
	Sun, 14 May 2023 17:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D69C433A0;
	Sun, 14 May 2023 17:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684084101;
	bh=mtrxumyq0ZRmNVTAnw5KH+BUNijjTRh/kWJxJPGHbDU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fvXP+Y7I3i3ihYdVkNewCBLQsD/O0zHS0lGhnogvEMO8oiDFPpC6/t+lxpjKhzHPW
	 oH70PSK2jM0zLINBqMLjX/u9btWauAIQ7HNe1V37K+2vR7GMdAP5BcvcMiF8LmKhTv
	 V4Ar+Z1o6kkaGQWnr9Z1pooXcsYN4aN05qxjGQSDc3jGpRvOG/+xkg2n3uZPFgFaH7
	 EcrSkkp4qR6O3IvHVjGiqRYujd5+AaZ4mC9cA8rzmtAAFHyIJnY4flWI1DFZvKy9IH
	 YsO0dXae8EjHf3WQmssR5WKI8zcsrnI9ScUQsMRva+IjkHnOoeWcM/Z+byHqX06atA
	 e3WEbiCuvbw3Q==
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
Cc: Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 05/10] riscv: add the Bouffalolab SoC family Kconfig option
Date: Mon, 15 May 2023 00:56:46 +0800
Message-Id: <20230514165651.2199-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230514165651.2199-1-jszhang@kernel.org>
References: <20230514165651.2199-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_100821_982993_21FF6BD2 
X-CRM114-Status: UNSURE (   9.64  )
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
