Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3BCCCD18D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 03:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Db8YhVddGfmGVqSubO8c+q5qfKfbIznfjF97DYW95CE=; b=ZbrC+YPQio7+0+
	/8Ecsoom8lOaTo7syToYiqZd7GCcm9N9s73YgjUMlFrdW97JuxWIEmJk/MugXGHKml4slV32ZANJe
	6jJtk3LqJFU/b0er4r3vW/6/bvYCH4uBEQswslmB8CbYwW31LHMOkb8BlrTxC2FtT4H00XALItGE/
	1jcX5A/3fiaIUDRt+/0n3OCp+qJX/RiAGC/eEWJ7QpNF7bfWfuJ5TawYqxXD04gHovHK8BeUssO+v
	ybruUBnj73Jull7uUC4zr+GbQNbeOtWluEHqCVgYW2oQvz5CzIUPDf/DRme0zAdi4rOUxuhRT04CH
	LMxTF7z8GyddN5qEI6SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VSg-0000000F1Lk-2M27;
	Tue, 14 Oct 2025 03:12:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VSc-0000000F1Ha-1Bza
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 03:12:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F39354886D;
	Tue, 14 Oct 2025 03:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02DF7C116D0;
	Tue, 14 Oct 2025 03:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760411545;
	bh=DyOTgkiOX+xxSODVH7p8ZivJ8z1IhKgwy7RRwUpzEkc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Vf300Fh8Gn1gX/9ACvdev9mO+38QsC94iA1HEP84CSvee+tQyudUfnsNbfBbenv9C
	 1bBYfGvfjzTf5MnMm0VRlOFlo7cYYlXiDF6NDYPT8nbQbY4Ri6eeggwMy6bMrScu6N
	 FQdVVZopLsOHcqzy6sgj2RS+Jlk8eLUxrlO9ZpToTi3mpTnmKo+H8pIEReuap/Fv9a
	 w3lZ7xS5lrf7G2lyfs++8TwcZBevpd+xDL1KzS/gE0REcARrHvysZPyKqnwhbiquvD
	 auQxq2nkKkZTv12298dkDtkuGh0NIVnxzw3V54yZ21bzlSOW7XsQflg1nOPVCAV3S3
	 gK4qKbdm7rNdQ==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 13 Oct 2025 20:11:59 -0700
Subject: [PATCH v3 7/8] riscv: Kconfig.socs: Add ARCH_TENSTORRENT for
 Tenstorrent SoCs
MIME-Version: 1.0
Message-Id: <20251013-tt-bh-dts-v3-7-9f058d4bbbda@oss.tenstorrent.com>
References: <20251013-tt-bh-dts-v3-0-9f058d4bbbda@oss.tenstorrent.com>
In-Reply-To: <20251013-tt-bh-dts-v3-0-9f058d4bbbda@oss.tenstorrent.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, 
 Arnd Bergmann <arnd@arndb.de>, Joel Stanley <joel@jms.id.au>, 
 Joel Stanley <jms@oss.tenstorrent.com>, 
 Nicholas Piggin <npiggin@oss.tenstorrent.com>, 
 Michael Neuling <mikey@neuling.org>, Michael Ellerman <mpe@kernel.org>, 
 Andy Gross <agross@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Drew Fustini <dfustini@oss.tenstorrent.com>, Paul Walmsley <pjw@kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_201226_362431_0A0BF55D 
X-CRM114-Status: UNSURE (   8.28  )
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

From: Drew Fustini <dfustini@oss.tenstorrent.com>

Add Kconfig option ARCH_TENSTORRENT to enable support for SoCs like the
Blackhole.

Reviewed-by: Joel Stanley <jms@oss.tenstorrent.com>
Signed-off-by: Drew Fustini <dfustini@oss.tenstorrent.com>
---
 arch/riscv/Kconfig.socs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 848e7149e4435ad3ca138b62bc3b3c8efb594a18..0b4d408aebfa5dc441abfb8e78153acc149951f0 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -63,6 +63,14 @@ config ARCH_SUNXI
 	  This enables support for Allwinner sun20i platform hardware,
 	  including boards based on the D1 and D1s SoCs.
 
+config ARCH_TENSTORRENT
+	bool "Tenstorrent SoCs"
+	help
+	  This enables support for Tenstorrent SoC platforms.
+	  Current support is for Blackhole P100 and P150 PCIe cards.
+	  The Blackhole SoC contains four RISC-V CPU tiles each
+	  consisting of 4x SiFive X280 cores.
+
 config ARCH_THEAD
 	bool "T-HEAD RISC-V SoCs"
 	depends on MMU && !XIP_KERNEL

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
