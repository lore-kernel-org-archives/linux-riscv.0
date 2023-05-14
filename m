Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8F3C7EE23
	for <linux-riscv@archiver.kernel.org>; Sun, 14 May 2023 17:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrDo8A7QFefMxUwsK6iMZCwAZrzGPodtGb9xdH0cT7c=; b=PJOFBDzAVH8cHi
	3vwX7f++KtTuK7Y3F5TClW7Fe72dzXVabiIW3SRT3ftU950mI5HNJHOEmybzO1TKiAWoI8lwucjtr
	nAA9btyoBSQxibzHnhypwfUvdJKZ2q1JinL1vCAiOwPd2he4Zx+mI5kSY24fiq6eWO6BJNQAwN+NZ
	MLnjZiUzKhSOL62sf9CSxISkWyOwuKxQbKDrQq2lAVcCdv/cslegILjtdG2nrV/gTFLF/OyHpl4VI
	+Wn4aI4i9lF+8Hhv4/Kyg5MaN7rJXFudiF1w0GfO3lIWHC4S6vauE2SB+0YJ3WfoURVmLxsMwwNKT
	WejhOMZhdY3vYVhUkBOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyFD4-00HYu0-28;
	Sun, 14 May 2023 17:08:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyFD2-00HYsR-2b
	for linux-riscv@lists.infradead.org;
	Sun, 14 May 2023 17:08:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 613CA61937;
	Sun, 14 May 2023 17:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D42C43442;
	Sun, 14 May 2023 17:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684084116;
	bh=Y6wp2lfk73IXtZCQpUDT1aZp/tHzlT5TxGlvlcAf9+8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FEocH1HnkFFZiRo8KrZfdAd4+8Xfac2zWY3mdb6PcFPqWZo8LfaK7cFADFxARuE2z
	 /RKaWc723VdOoVaaKBvFAYG+Zst0IzLp1bWbr8J7aTMlD/qahvwAXsORMXrW9HtUfc
	 z+lt9FkL1CoT1GmEsuY0Z7APXWzobAbK+9MvUkDhsKXh3UZYGm2YntAjevY3cBD1UY
	 XBOrsVNLhTTRJthNoljcLqpiN1+eLF0DTwU1B9SLq8CX/hhdduOtm8u1r6Xgtp9Z9j
	 7FvcsUdRKw5LMju2U1bZ0KUiHTs34ytfXsSO/zDIgbobAU3wlgKXRd3lkmWf9I3yuO
	 NfzTXeX6xqi2w==
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
Subject: [PATCH v3 09/10] MAINTAINERS: riscv: add entry for Bouffalolab SoC
Date: Mon, 15 May 2023 00:56:50 +0800
Message-Id: <20230514165651.2199-10-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230514165651.2199-1-jszhang@kernel.org>
References: <20230514165651.2199-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_100836_887343_10FE1DD0 
X-CRM114-Status: UNSURE (   8.74  )
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

Add Jisheng Zhang as Bouffalolab SoC maintainer.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e0ad886d3163..0ae136f2656f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18115,6 +18115,13 @@ F:	arch/riscv/
 N:	riscv
 K:	riscv
 
+RISC-V BOUFFALOLAB SOC SUPPORT
+M:	Jisheng Zhang <jszhang@kernel.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	arch/riscv/boot/dts/bouffalolab/
+F:	drivers/tty/serial/bflb_uart.c
+
 RISC-V MICROCHIP FPGA SUPPORT
 M:	Conor Dooley <conor.dooley@microchip.com>
 M:	Daire McNamara <daire.mcnamara@microchip.com>
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
