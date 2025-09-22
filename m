Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB04CAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 13:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ue3RWoV1Ll3VSrAupzmAjqA2Puhs2xqvP2Su7KMeQHc=; b=vwE3izLLNGxOaQ
	PHzPL2VpfHnHPyH39sPuMLIvOLI0eJVEpBYPXlSLMf1ocJAVim5FduyP5aphwJ470umftypoRe6W2
	Po60JwZ6e6ZBJ1Eaip5SHaBq2YhiY4gGgaIbxl3J7JZTvlmLjr0U7UOlOwhU3xuVSM6NYt3kaqNtB
	4NNPn9ejMFk8oMKy+7kaX8FjlRZij7Scc2Jmf1zndrKGB5rXWjp31Wr2yODR4qIm2ldCOydmqXt64
	hmeODDNFKJp3uxt8lKNXDUEgClj3Ae5867Fd3sJW++n4ZQgH6e2K0U3h4CgC0OnEmsh5F2zUjCIBg
	7HkDJzc1h2hfuCcWxEeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gAW-0000000AP7U-3RSC;
	Mon, 22 Sep 2025 13:01:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gAV-0000000AP73-1ImR
	for linux-riscv@bombadil.infradead.org;
	Mon, 22 Sep 2025 13:01:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=cMfs34T5Vja4v7ftmJgnF2ValILJIvUnI6GgN9qZHtE=; b=hvMsLfO3lmGUQWE8TxbVhTUe6d
	0BKP564fv+8a/0dE1SboJyzOiaN8sw7UXDxbwl76U9nD6wfes7km+jbYgrgiXeeN6G+BR5p5ehcnj
	Rzzd3YPlkXPU7p1lmwDgnyWns3OuEwhJiyQp4aP6oBWt/xtOOJL9yTTmICv8cE5wFncr985jXvhkO
	QYkvHNQZUIoC+jT3tQxKWMad1HRR7TFPyWrsdNX22ZhXynNr7TNdfFISbFppbfJcbA36e2eL0KMkr
	He1RVL8pSOxyzwuQzidzrRlcrr7NYlJnoyngt/ZtLC9NO50wXW9cmSkfZWF0GFIkyw6uZ9h9EoEg7
	IM1MT5TA==;
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gAR-00000008Hln-1os2
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 13:01:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758546062; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ICouqmTvyKcy/ch0AWJ3uHBxtEcG20RfMqSI81uN2AtkBACvQrUSc2a+WtMXMwcNNpr6y5YBoKYKBPH936ghZsh16ZMvG3hjENWqwRNFOx3HDoq3txSTlx8pOGyQbRzRztMJRkPdjfhEL7OryJUwQ6XoG6l3um7OvIN48DD5Sas=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758546062; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cMfs34T5Vja4v7ftmJgnF2ValILJIvUnI6GgN9qZHtE=; 
	b=B2RYMpNAhW13eJyVh3ywSK0/bPRuicSuAwJCe9XzIOD81KbiwPkMTRRhfA+KOotrKwy/d/+LVO2d506w4YgMe/wKjjjz3r0GS1q2w5enB0QNcBs9mW+hLn4S2jZ3GmUmwQNSZ8W3GQwPBwzoYYgfRTPxbztDdfBSFu3qmt8OJ1s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758546062;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=cMfs34T5Vja4v7ftmJgnF2ValILJIvUnI6GgN9qZHtE=;
	b=gRRw9l79CdKc1/g1du5p7nu3gyabRqPZtq43MdgQfd3ek9c7a7INwnLE2OIQlL7h
	uVrW+PzwdzpW7v4mptm9hZMNpUijo5NK9TYx1X0aMgQ0AKRpK8dzhwAHQLHE8lj1RCj
	sg/ngVcbJ7TgLWfNaTy25QTw7xLnMnbVjee2tDq0=
Received: by mx.zohomail.com with SMTPS id 1758546059371192.16620849433718;
	Mon, 22 Sep 2025 06:00:59 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Mon, 22 Sep 2025 20:46:41 +0800
Subject: [PATCH v2 11/11] MAINTAINERS: Setup support for Anlogic DR1V90 SoC
 tree
MIME-Version: 1.0
Message-Id: <20250922-dr1v90-basic-dt-v2-11-64d28500cb37@pigmoral.tech>
References: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
In-Reply-To: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Junhui Liu <junhui.liu@pigmoral.tech>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758545232; l=1069;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=5FXdFyIr2fRFf+Ae1txoKmwxWECY148pHNFz1j152tE=;
 b=IKikTb5co2cwNgrDLxDroyXreMVTXAoHZa+CQqra3scT3SaZzrdaZa1Q1MeY0mcQp56V9YJ9N
 EfVgRbMK/4CBSfh0ZHiW5jirdnKVjs3bog/WzarlnDoxYotD+QM6oEj
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_140120_034965_4D0F57BE 
X-CRM114-Status: UNSURE (   7.96  )
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

Add myself as the maintainer of the Anlogic DR1V90 SoC tree, including
the corresponding DTS and DT bindings paths for Anlogic RISC-V-based
SoCs.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 520fb4e379a3954ff9b163bfdfda857e5c5b99d4..44b4b4f7e53c5904f6b9076f9542866292d33fce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21681,6 +21681,15 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
 F:	Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
 F:	drivers/iommu/riscv/
 
+RISC-V ANLOGIC DR1V90 SoC SUPPORT
+M:	Junhui Liu <junhui.liu@pigmoral.tech>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+T:	git https://github.com/pigmoral/linux-dr1v90
+F:	Documentation/devicetree/bindings/riscv/anlogic.yaml
+F:	arch/riscv/boot/dts/anlogic/
+N:	dr1v90
+
 RISC-V MICROCHIP FPGA SUPPORT
 M:	Conor Dooley <conor.dooley@microchip.com>
 M:	Daire McNamara <daire.mcnamara@microchip.com>

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
