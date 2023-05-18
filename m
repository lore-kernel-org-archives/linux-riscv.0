Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A68BC7EE23
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 15:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrDo8A7QFefMxUwsK6iMZCwAZrzGPodtGb9xdH0cT7c=; b=g6uJFS3OwSFfNF
	rdZuchjoG3z246TljU7UnQWMd1zAaa5tWVfZfqlmh1TmhpPAg3XpWGZ1vn9mjSpLhGkNBX8HmFeeL
	Z7p+Jk4hEQfPZpv/FEmkxGzjDtSnXfXtvY0TvW5jIH5uspntHO/hqOJn4rOnTmP/p4CP2f0y2W7wY
	+X6dle1Ac6pmLP/8gORiQXQlx+XlvyoIfx7ueKfbN9OI4VHqLIuCDcWf3D9Mx6ndpXK/tzyINjWS6
	aTjAz/oTp4sj5JiccdqWajCfu9nKYciaAujw1/fw8eoOXBQPNrdSaWhQS27g4UTeIMdmK01/2wwvV
	GdIMFyRQ92Reg0MNElNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzfeG-00DK8V-1X;
	Thu, 18 May 2023 15:34:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzfeE-00DK6l-2M
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 15:34:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E6C9865032;
	Thu, 18 May 2023 15:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20AA5C433A4;
	Thu, 18 May 2023 15:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684424073;
	bh=Y6wp2lfk73IXtZCQpUDT1aZp/tHzlT5TxGlvlcAf9+8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h/m23eV8ondNDJx76IqCrGW/M1lOBbTSSKI+8Qaj1xJa0C4k49BybfQx+lqsYbBc4
	 XuG9hDkEwQUA5tmQaKil6HF1zufUfRLgfLI+mTrqvxx3lwjCfcwl8YlNZf2dhwClDZ
	 +qSt6B4jNYVpIu6BLVlyZGc6qt6YJCv89xR7Vx0jRGlbAjl/Dhml4eTAJGjdmkoWCl
	 ccvN2O6FJLVwxWL4nlG1s/sBEB5zmCS5ZLxACZZITrqeQROhFLD/Qu05Kgf7WzIHhG
	 U88RYaX8cOmXWnySONDnDCzYFVPiRVoGuzOd1rnOX3wxabb3xe8IzZhkBlb981qSZh
	 7lVefs3NuQUWA==
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
Subject: [PATCH v4 09/10] MAINTAINERS: riscv: add entry for Bouffalolab SoC
Date: Thu, 18 May 2023 23:22:43 +0800
Message-Id: <20230518152244.2178-10-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230518152244.2178-1-jszhang@kernel.org>
References: <20230518152244.2178-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_083434_805101_B862A9DA 
X-CRM114-Status: UNSURE (   9.08  )
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
