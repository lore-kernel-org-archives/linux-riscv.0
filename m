Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D0ECCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 09:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9nYzvbXd+E2UQSdQMM4r0C0XrzlH0AHjwKstTCTgLFM=; b=lOeQrCLYJPq0qW
	RwVVLQ0Z5dEiH1zIL8JOrXOP9Y0Lg6PXx+Rd3DBBubzpaKyCfICdwPk2qvX2DZX1U6+iT5z0Vopj4
	CU9ZzjlgcvwDMIpD3jRJTjqVdtrgkMuzHqpiqIb4P3ti9NnGsawIc0lc2aT4mIK3zJW7/OCtBj7F6
	bShbNAeN8JrQumyniIO4SsedF0omn6RSZbX6l2qrXyJhAYnaMpmN1+QOrUhJH6KtoTkIbp2rnt5HW
	bQ9dcT+aRdZlqe3jmg3xG1SNf5dWbyDi8xSih0rdG54DF4VUSlW2O/JBHrVNpw6B81K48clD5qQLF
	FR+9tFRjNMatxQ6jPq6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8wQ-0000000GVs0-367D;
	Tue, 21 Oct 2025 09:46:06 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8wO-0000000GVq6-2S8a
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 09:46:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761039951; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dDLRGvoAMkowcfjxfLWZ4mq++uaRgBwkogOkMVbtU7kCjEUarkfQKfY88+7yH55hbyRVObXV6PwU2C7nt1PGNTujXwFYiXZ9Q3+xXl3WYe4rd8pfmx9r/HkYZjPmSRlFymLK7HOBgY0B2PjVy45RgzRzJvIzmfai3KZEZkB65Xk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761039951; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AH1+SqtWbfAt+P6KqNKSczwkQpAkG3TFhMGHQUWfOAk=; 
	b=QWGKPJ/Nv3EZ5TXK13rFbIb4ek5+R7ZyyITtQ3hVee91WKkOcvIXjqOUivUwa0qkN8mwkAgAt4DxcQwc5ambQ5vHW2LIkEgsW/d0EBIE9/qEDfR98x0MhapGMGnwnmVxi7zHvL/kd57DhfakEEPbMGPqvsa8mwyxf0f7UgqX/1M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761039951;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=AH1+SqtWbfAt+P6KqNKSczwkQpAkG3TFhMGHQUWfOAk=;
	b=mByfwOmNsDutV2riePCycGrncRlxYusDCRJa1xMuSiHZDMcZDe4tlb3VKto8Dycg
	9kIi2bFKruxvFaT/ZH+pw9dibYb2s7DClde39QIV3lvCAfxi0fK8QwptUm2K7n6MZRh
	oblR9DIQJ02DwbaLCObeJzWaWDdcbR9R7AUco0Vo=
Received: by mx.zohomail.com with SMTPS id 1761039949164800.4672868226596;
	Tue, 21 Oct 2025 02:45:49 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Tue, 21 Oct 2025 17:41:45 +0800
Subject: [PATCH v3 10/13] riscv: Add Anlogic SoC famly Kconfig support
MIME-Version: 1.0
Message-Id: <20251021-dr1v90-basic-dt-v3-10-5478db4f664a@pigmoral.tech>
References: <20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech>
In-Reply-To: <20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Junhui Liu <junhui.liu@pigmoral.tech>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Inochi Amaoto <inochiama@outlook.com>, 
 sophgo@lists.linux.dev, linux-serial@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761039846; l=787;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=9OdYZIcHYCn1T72Knpz+3UUuf/Imgss8DndocK825yM=;
 b=bLTQf4SKPLAwRKBHjWe/Q34iFXG0eLXcOppTb6SOYA745MZRviDD126BIdzyczBEuSMf1A3MQ
 OQzdbE5iNuiB48oQhPtHlUCgFIX/MPlDOYWdfSrbM0SpI8Ql+iCTWPT
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_024604_670458_24A6621B 
X-CRM114-Status: UNSURE (   9.04  )
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 arch/riscv/Kconfig.socs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 848e7149e4435ad3ca138b62bc3b3c8efb594a18..25f7e58cbf745a78b0e946749aa2a770dae3eb2b 100644
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
 config ARCH_ESWIN
 	bool "ESWIN SoCs"
 	help

-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
