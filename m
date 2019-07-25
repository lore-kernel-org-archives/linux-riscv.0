Return-Path: <SRS0=2iVI=VW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B47BC76194
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2019 21:25:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24005218F0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2019 21:25:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MmLtVR9w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="AWXlfRnE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24005218F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YGyPRFMpZCShCUW/mnUvCdrcveUzUCqfxNa8RgJPYZY=; b=MmLtVR9wqXlUKH
	nsbWoZ7SMGiEF3FX+hpKW7RqaZH6EGmd1ad1bvLJF4wjKvo+GsKpbVoriLikHgwjWiN2XaRqhRFRM
	QaPQMylBdbzerf0szZdJMiHZRlBfzqjOhmIGAV0eqGfVDOg0ROxUMkCikhokeEkuXJuG/Ol/t0aNo
	7EIVLeBcbil83wNGDuErJn0XgWIUy7cqFRNTOEZMnfFZ6hJmkv8xsiky4UcMpQ61MjA+WAjhu3PHR
	rUFtNFx9dBjNn9XSumTmGisopYKnQWeoOG+Pc6cdbesryf+ATk+ySpxRuxX8ezXqQA6ymugZmv3VY
	LFd0nj/zYuvX3N8NY5rw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqlF6-00074P-5q; Thu, 25 Jul 2019 21:25:40 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqlF3-0006v1-Nm
 for linux-riscv@lists.infradead.org; Thu, 25 Jul 2019 21:25:39 +0000
Received: by mail-io1-xd43.google.com with SMTP id h6so13807757iom.7
 for <linux-riscv@lists.infradead.org>; Thu, 25 Jul 2019 14:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:message-id:user-agent:mime-version;
 bh=0OE6CkyrftBD3Ku7P1YRVsn9jYbz8x68WmGWVUa6hzY=;
 b=AWXlfRnEtLM74XglQGEkne+2wpRMQ3s+jTBHVl27BvwSaVklVPQBOEl+vVl2AOmA5q
 qv9xXCge4s0vMUla2SYNdU3WfUuDpFqt6iVunAkr8kVIuSSqBhDFCulVS6VMtoNBW2nW
 a3G2ZcfFBZNVDiJHDGaVNLBfRDN7Awy4HmWGgAy3K0bwPm+wqk1zOeXXbb/TXMI5b+i0
 DnvM6BNfb/FAc68JxHuQRI2poAaDUJAcgX3JFh0zp6NFcq0rNvNxGTWgwNBKhLE/Hkyp
 MdU+cjP7xzKxethms3zDzEPZwpyPFzGC5cDQqCSu2QqadqaB+iA26yhrhCOZ+AgVap5e
 mmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :mime-version;
 bh=0OE6CkyrftBD3Ku7P1YRVsn9jYbz8x68WmGWVUa6hzY=;
 b=rbjs0vrstFq1N71mgcYN6J/r/4F+hxRE1lJmkrFspSKKdeQFmPhz8gxHMmv1mp8mnO
 +gACtRvgPFlxR5ZR7TjMEc7zpQcvOTKkbG86odBbVEKJSe5RMo/R0TI7f8KyQRrBY2dG
 XGaBHBufoGcx/SnyecYkwFg/7Xt3naneBCpTNaRUSJ2SU641KXxsb5y/hZuLm4myLsP8
 qR3ktnaeZj+PUigbxn8JWk1SNdIwwROctdzcHQgwpuiI4bruclJIkfYwtKP7ropB7xOE
 WItp2vtq1MAKFPHtCkcQUYzeE/rvE25FlfOYJXOAvs1BajgRKeTtSkyNBPzgO6Q3CIKY
 2C2Q==
X-Gm-Message-State: APjAAAVV9yjxBcJ+UI+9J/KL6yBadeL6EowBuOqZWAmXtjqJGVQacRtq
 AdlTjMbnp/+BDxZLPoUl4ryhnw==
X-Google-Smtp-Source: APXvYqyXby2GabhLGrmfNxGRSjjzbJ/o7K20JIc5pwz0S+rpYgbr6bHq19jJS94ZBSI/g1gq1f+w5w==
X-Received: by 2002:a6b:b556:: with SMTP id e83mr81812981iof.94.1564089936348; 
 Thu, 25 Jul 2019 14:25:36 -0700 (PDT)
Received: from localhost (67-0-24-96.albq.qwest.net. [67.0.24.96])
 by smtp.gmail.com with ESMTPSA id s2sm36154569ioj.8.2019.07.25.14.25.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 14:25:35 -0700 (PDT)
Date: Thu, 25 Jul 2019 14:25:34 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: bhelgaas@google.com
Subject: [PATCH] pci: Kconfig: select PCI_MSI_IRQ_DOMAIN by default on RISC-V
Message-ID: <alpine.DEB.2.21.9999.1907251422040.32766@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_142537_843589_33E5B420 
X-CRM114-Status: GOOD (  10.55  )
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
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
