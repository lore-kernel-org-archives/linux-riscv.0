Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62231C87FC5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jul 2025 16:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fTyUbTzu3UU7MbqnMSlKSqWBjegA9SJpIir9/NlTLQY=; b=vbbrgnkCbMta08
	lRL1eH4WEZTKXkXsjKulKpG/lVZxOVvI/qjxtMRJptK814bCADAaSrWh/yf2ol8y4WOFCRPkKVBpD
	6f51k97hMt+Ob+9tXOaGyUaFSUAk5vUdTeg+MFc4SKZSHEnRD6/KyRTeyEV5BWFHGERkn1BBR2Dm2
	cghnJHAgIzQP9328o+J3gDBw8vqVwML3VhrFDtZ6ojreWdGu+c9HjdE9PI9FFLbXEOPvnydLkVcVX
	nxcFh0wMLc2qCQVF2S0OKOckS+zeUQlEfx1q76O+XoC+PmRKUqIDIAcIypAxFAovBlHBNf1ouFJJ/
	zWqsHWIyww9Jn0JreUcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtnf-00000000FJD-2Thd;
	Mon, 21 Jul 2025 16:55:39 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udsnk-000000007Qo-38Rj
	for linux-riscv@lists.infradead.org;
	Mon, 21 Jul 2025 15:51:41 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753113095; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mdvWwIw25FD7VTsdooUy2PJ6JjpxIYPtaNDfz5eI/7CraQ427IFq28JGKUWmpf6UTX991kxHEE48fjyb1sFA9Eb62l26NaBu02g4iBUZZ3ynizXQVfJmODtbVWuObo+YqfKesp/Nou1qod/nH47RL3dVYEEU/H5EsajNBU8g8h8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753113095; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MZSme2xCYcHlYZmmmfdK0RwgnVuK1UCE0SVbPsBt7wM=; 
	b=ILpGFrvpRgaZVl58s/2HkzF1WpIexKt5OzBZaJNEm9DvbgLkc7oqAe+VuYOXGZ5plN11oMFRjhgAUTuuPz0WaRBczCDavDfkIJgy4YvF3u31KflC5Km+Aq44//jrtrACBTDcp/EFPzGH9xR579KBwHiZsL3Cgf115eVRtqkiIMc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753113095;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=MZSme2xCYcHlYZmmmfdK0RwgnVuK1UCE0SVbPsBt7wM=;
	b=PlIhDOIisnUYzfELlRCtYqMev8C1UkARdlAFDtM1HP4uJUg+sTYXxQCz0ccQzrY4
	jig5oQz3Wm2FGgvXsHbu8iGZGqos2lla7RORM1IUfs1lYeRfwAr0dG8jtqCRfcG4Bp0
	N5WIVpuZXA4XjMrLJNFOw59NhrH5WeGfJ4jLqjMw=
Received: by mx.zohomail.com with SMTPS id 1753113093482427.7986940150852;
	Mon, 21 Jul 2025 08:51:33 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Mon, 21 Jul 2025 23:46:13 +0800
Subject: [PATCH RFC 07/10] riscv: Add Anlogic SoC famly Kconfig support
MIME-Version: 1.0
Message-Id: <20250721-dr1v90-basic-dt-v1-7-5740c5199c47@pigmoral.tech>
References: <20250721-dr1v90-basic-dt-v1-0-5740c5199c47@pigmoral.tech>
In-Reply-To: <20250721-dr1v90-basic-dt-v1-0-5740c5199c47@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753112991; l=686;
 i=junhui.liu@pigmoral.tech; s=20250507; h=from:subject:message-id;
 bh=5RJvdFahYn0aTS3p9kyYeDfBO9Zba0w9s1rIN6SsJQY=;
 b=YWvTPuFLVy6WFbhfask4jsiNIGBl8Ede00rtbuet91Or3vHG/tcpOu3yAFAtpO5rd0tcqdjhH
 JqGPy5oOVkCAuWJ8KYRJUJ2TVwkq9QZDbJ+W6svV0mhN7E7Q/1HYixb
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=d3i4H2mg9LUn4SQemoLAjLRQy0nTcyknIv6zgKMwiBA=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_085140_847436_D834AA79 
X-CRM114-Status: UNSURE (   9.00  )
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

The first SoC in the Anlogic series is DR1V90, which contains a RISC-V
core from Nuclei.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 arch/riscv/Kconfig.socs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index a9c3d2f6debca1469f4a912b3414711eb709baab..de163cdddcda1c08e7c9e98716eaf043d4c4555a 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -1,5 +1,10 @@
 menu "SoC selection"
 
+config ARCH_ANLOGIC
+	bool "Anlogic SoCs"
+	help
+		This enables support for Anlogic SoC platform hardware.
+
 config ARCH_MICROCHIP_POLARFIRE
 	def_bool ARCH_MICROCHIP
 

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
