Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F46CAC5A7
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 12:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gey51lEzsAKaRGw4LUD1y/unC1lIivD8kWOK6Is1Jjo=; b=JOCB4mkB3yRJPP
	ONyBvvS3ZesN0CtZtIvygArdaTDUMZFVh+bMjr6P8RJ9vh5BYZ49/AKETToiHP4KEhSN/PAZmSqs8
	qaPWpZNKvZx8xJ2unkiI+nxMjAVQNvqr3pGdzwOsb/qUt5mJ1M+8mSZyImhlwvYNzyggAaURqF4pS
	NLGfiXygWbopBLU2bVgU+v7IVeLAQAXLN6JCGsiMbWiIq4hHuWme/J2PAPhCfMnadFLXqXFeMjL2a
	vw7SPNhypXk/CdfM33NQ8HtsKW1j0Pax/85o/5x0Tls0icFViR1Tsq7s4+gb9jzam8HE87UbuFcUP
	Aax5OfdEe9uLy9/rTuOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0g4P-0000000AO3D-1kNY;
	Mon, 22 Sep 2025 12:55:05 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0g4M-0000000AO19-2ncc
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 12:55:04 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758545698; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a7Pw2U8LKj/9G8q4teWsNgV6SPSFSdAiz8DXuxZ2FyrX4bTYiu+ElSygDAQ2L/pCN0oHsejIFaWqli5P/jL2zCRylTMTROpmU3xfwa9BDb/8EVJfSvXFiacfyLRlEuitwrz0YCL5KK10Z9ccmXoY509FuL5s1Oo5QdBceqPH7RY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758545698; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FbOLEW/EcCLP6dBCcpzVgADz1ZqyMz4Fw7/Be5J1D64=; 
	b=WgnLQjg/og6aPXT74FGC0vXfvmFL4jR9m+jq1ZXDVPGEdon5KBOkS9+oLduVTRfeyo8eu6s+DPRmyT8wE84X7u7sxbIPawlZEeVJpB+cc7Rqb9nLlgQLicVoDY7K8S6IkmOTonmFRMaN0Z39bihnjEatNjLPY1odTe4MFhQ0uV0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758545698;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=FbOLEW/EcCLP6dBCcpzVgADz1ZqyMz4Fw7/Be5J1D64=;
	b=UIjM1hzxYAs+CjO+7FDRlg5wt6eSmPtGP3YAawyQ1+ku9FktBXy/3b7MjXq7uPEM
	NZpKFGmUk1C9ZHKyGsJRd2Lxg5PS7QXDYgtOeMSory+dBrYP/dXR3Y+GVUaWe/pa8FU
	YcpWn5YHqZ5nK1MtepNKeoh9JUKjgCimxwZP1Yjs=
Received: by mx.zohomail.com with SMTPS id 1758545697043323.7993928359582;
	Mon, 22 Sep 2025 05:54:57 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Mon, 22 Sep 2025 20:46:37 +0800
Subject: [PATCH v2 07/11] riscv: Add Anlogic SoC famly Kconfig support
MIME-Version: 1.0
Message-Id: <20250922-dr1v90-basic-dt-v2-7-64d28500cb37@pigmoral.tech>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758545232; l=749;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=w5ZIPq5ThjyGEwIRg/zVHH8FHcTm00gGBFVKYiZts7w=;
 b=vY8tNb/qTUqOguwgBNQ9iWLAEtJ/gQlxPza89mMWGUgkPW0vmrfIbYzj9CrMok7NWWPg8vQtG
 cg/wvYlTE3uD2D2h1pdFY3ZMs6KrcomeQGZ8LH58RALBe+tWYBvtG5b
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_055502_795422_A6ECE7DE 
X-CRM114-Status: UNSURE (   9.14  )
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
index 61ceae0aa27a6fa3a91da6a46becfd96da99fd09..c1c0681f4364647477c50518725d9323922ff270 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -7,6 +7,11 @@ config ARCH_ANDES
 	help
 	  This enables support for Andes SoC platform hardware.
 
+config ARCH_ANLOGIC
+	bool "Anlogic SoCs"
+	help
+	  This enables support for Anlogic SoC platform hardware.
+
 config ARCH_MICROCHIP_POLARFIRE
 	def_bool ARCH_MICROCHIP
 

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
