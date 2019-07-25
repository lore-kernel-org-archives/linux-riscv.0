Return-Path: <SRS0=2iVI=VW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9742DC76190
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2019 21:28:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AD82218F0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2019 21:28:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tmcR/Bdq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="EOZ/BMGI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AD82218F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OAgjMLFjupSg/mgFa5YTdOmBFkk9De9pAHJ3FRLgLcI=; b=tmcR/Bdqum4RKs
	zQv+EQfVWzkdKimOpjfy8J11dJ6OG+0XUV4CB8PKvoccZveGXntIJZK+qggmD1Wz7kFVLfJhalE47
	+0co+mpXQUhBXIQzmdW4Bbq5Y0K0ogzhiXBMk7vQ1xGLqFNrMdyeCXtj9MrlNncs/qDp3anA1rTMx
	mWZFJkKLeL9gy/EkH2+IJz21//L0F/LRL9FPm4PXYjhlDXOtDSDtdU2Cgae5WAGPNXZWtDY86OfBY
	4KOBNZk4+tF1rWDBdx7QoQrLI33OLFnE1vLFdOKm9jQinknZ09ZUvHVZkDf2nGL3e633mndODrmAV
	wmtlywobKD5bllt7vxkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqlHd-0003vE-V2; Thu, 25 Jul 2019 21:28:17 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqlHV-0003ie-Qb
 for linux-riscv@lists.infradead.org; Thu, 25 Jul 2019 21:28:16 +0000
Received: by mail-io1-xd41.google.com with SMTP id f4so100410781ioh.6
 for <linux-riscv@lists.infradead.org>; Thu, 25 Jul 2019 14:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:message-id:user-agent:mime-version;
 bh=3RH1zSlyd07j64FiG6c56vosTfF67VZPnHTjO5XPI6w=;
 b=EOZ/BMGIWOdAj5Vnd3MYOVEz3cefj8pjrEdXl5iPoQCB2A7GPF+woWHVnm8k9xigez
 g3xjAsmtfn7Z95N8JtEYM19jcXGgmOmAF/TMVLY81K++RkiZhRJxxw6z/Zi6cj0P2crZ
 6jbUWGZ0OGzThcxAVxOLtSlRgAOUkMhWP5n8DdY7wDDGBMVTmsrv3aXCP8nX2TpQFMFO
 t+6JzAzXDmpSUtQMjbRfX9qtceI7QH1nY00yBmhS5Avtu1VLBBkKzAkphHjSLBDzmiyR
 R/+U6LN++pbSDZBytpZoLkKkmY9FfQNPqxVckN+KnwzUnC5NqJeLQsrxYS4y9Tp+TRrB
 1fVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :mime-version;
 bh=3RH1zSlyd07j64FiG6c56vosTfF67VZPnHTjO5XPI6w=;
 b=W9vVFL0QdQg/nvAigdLuRK8fkAH3C+OF/97lALc1tTwlbnmG6vT95S9cMlYiuhKUUx
 YkmVNAITT+8TVMa5gCFPGt7opEf7fwjm9jKqmVGkOGlIJq3MK0RydfZNWHI4Gzo6rEst
 MgLe1slHnlkwv4mduAF4tdxWJUT8tL0LONPHjAKU1F0MZX5HMP4pmnpACDCBC6CXkmLh
 uPwrsD56AzXoC6kkeWsKIhz6hjvIZpJLcX04X4rNDXTj86jOxDc/Lu/G6US82gpcJpsR
 IVvqaj3uEmTcv79BhoAqmiUW/9EhxbF2slV22MglWHY+TbN8AzaJ98BweodMPotp2aUu
 9u9g==
X-Gm-Message-State: APjAAAXEW+DlZ12Akhsjiy70IS1rik2QEALZu2wI75AHiDcoHR1qcwRB
 SpfwzRKjisG70S+qkKuJWyaAnQ==
X-Google-Smtp-Source: APXvYqwcgbG8zch7ZKO4A5O8SJtdUcK7Nhlw2/y/EAEaxhmIHdnGrBKmHWDCbVWOWssqVb37HE40xg==
X-Received: by 2002:a5d:8c81:: with SMTP id g1mr18868186ion.239.1564090088618; 
 Thu, 25 Jul 2019 14:28:08 -0700 (PDT)
Received: from localhost (67-0-24-96.albq.qwest.net. [67.0.24.96])
 by smtp.gmail.com with ESMTPSA id t14sm41996376ioi.60.2019.07.25.14.28.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 14:28:08 -0700 (PDT)
Date: Thu, 25 Jul 2019 14:28:07 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: bhelgaas@google.com
Subject: [PATCH v2] pci: Kconfig: select PCI_MSI_IRQ_DOMAIN by default on
 RISC-V
Message-ID: <alpine.DEB.2.21.9999.1907251426450.32766@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_142811_018310_D90AD1EF 
X-CRM114-Status: GOOD (  10.24  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, wesley@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Wesley Terpstra <wesley@sifive.com>

This is part of adding support for RISC-V systems with PCIe host 
controllers that support message-signaled interrupts.

Signed-off-by: Wesley Terpstra <wesley@sifive.com>
[paul.walmsley@sifive.com: wrote patch description; split this
 patch from the arch/riscv patch]
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
---
 drivers/pci/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
index 2ab92409210a..beb3408a0272 100644
--- a/drivers/pci/Kconfig
+++ b/drivers/pci/Kconfig
@@ -52,7 +52,7 @@ config PCI_MSI
 	   If you don't know what to do here, say Y.
 
 config PCI_MSI_IRQ_DOMAIN
-	def_bool ARC || ARM || ARM64 || X86
+	def_bool ARC || ARM || ARM64 || X86 || RISCV
 	depends on PCI_MSI
 	select GENERIC_MSI_IRQ_DOMAIN
 
-- 
2.22.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
