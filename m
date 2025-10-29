Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329D3CCF9F0
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 16:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2xg6XqsC487JpycZV2TcyGdlTh1TTJyX9canIeyiNEA=; b=h4l8PGYMfJhdgG
	LxGuJRRAxBmWSJUPV7RKf94hId9aVwCN6yfGwolx30+SrJLObDsv0ywLIpWP9RkMbvpC5fVI0x3eV
	PysOM1dtEX9a5PcJbmZluAM/8657HrevI9/qzX2zUiUYsF5r1QFGWXTnOIra4iI4d/u7uzj/aawRX
	X1mbiQ7uFZ39tOxgu7MuF3LvUnds+em5kO5LV27M9Ut71Ifys7ROdEwg9BUsAppvgN6nB5AC8i4X+
	bVA72m3TkzL9toKUERJWZeioeVlXrLqU0w+6mwzvNJNua0GGWmrFHYzwyA5ePDG0V6TzMtkGksKSp
	IqLP0OhcsIPMWRw9rx7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE97T-000000021SE-3w5F;
	Wed, 29 Oct 2025 16:33:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE97Q-000000021Pz-3yXR
	for linux-riscv@bombadil.infradead.org;
	Wed, 29 Oct 2025 16:33:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oOtQpkg6YutdjljN7zgxOA0UqmJOiKsRIM6+iFOdM9w=; b=pv50RDclHF7qpF0tBuvgsf7G9m
	mIDWgCXtp/wfJFQBEctV0xmgZQBAylM3kgyGFUBnKpo17G1MMxGsFSGFXTSe0/rV1fGYNpVsKHdAO
	XtSqLLwMeYAVLEXKrqdVw6MEWlOfnEMitzTPfC1US6ad09RwM55qpIw86dOWAOGZ2gYj5Fwjvw4P7
	m/M8nJp1ZJyMwUWU5bDT4o/KSNf1qdgzQILyv6AvF0YMKkVH9+/teSMziDjLqt/j3bSbWjZAs+8iv
	lw2cMxMeBH3u8DKI/V2GAmz9k0ybmGGpd/E/vTioNcy8v8h/bt938zqEp1nwSqFgoMdhOJKcnwxzq
	Dgd+mIlQ==;
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Fe-00000007JcM-2ixb
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 15:38:20 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b6d53684cfdso16397466b.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 09:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755628; x=1762360428; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOtQpkg6YutdjljN7zgxOA0UqmJOiKsRIM6+iFOdM9w=;
        b=Or8rZ/0TQ5tHcn57Sr1feDQh+8wDDcAmGwNAF8J7bMwafptChrFThGigziJWYCd2Py
         2SaCqbR8lCwmFydRolndezjPtl3mxWBDL4OVrS17USagc4R8wVH3CZms7ZTj0bdgCvCT
         5dp//4OvxenSoLo1iYllafqUXxp2SywFzVYXQfcjhoz31X2DLMQhRxDaLNrAss1IVlcD
         915+cSjr02do64PUmphf70r+HJR9C4DfkTDxv3Q8QwAaHfU8jYQlLHi/p8GWkqn0q3bi
         7AJqoLiFcTbsZ/Z15XzzwQItx2GxROFIq/7UU+xO+v2nQj8dFaii0HQYkbz3BtKh+XEf
         06Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755628; x=1762360428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOtQpkg6YutdjljN7zgxOA0UqmJOiKsRIM6+iFOdM9w=;
        b=JdMYuANKwa13WFuca92hj/juVd5y8wKo76wucA2xDMHoYlsMxleYniPhDtqC/HzsWl
         7t6Wgahru1ANw1rqmjqOK6vfBoCn9aXaNqRVfbZGTOUKctRp6XzsswcqJ4dwF+JrxZXU
         09HFDP19ZRv2r3xsPatoAkDBFfUEav/0hBC3Go5QxLMnp1c7rkxWHHIQtUxravD7u0l7
         fhZRsvV4ban8+Fxysh8HyE9aeQDn6qntSniDyvx6yBkD8vpyvnYqdvIbbW7P6v+YN0pe
         n0PQWkLPcW7jobkvKAk+e+djnIR3eAQMJUixSEIDtXsL3LIjMy0u4jLdjdnUU5ijD98f
         Pc9A==
X-Forwarded-Encrypted: i=1; AJvYcCUlNemFpQ5duX1lGQXY7H6EycQ+ElL9+NAxR9sBuMPNhBHYevJlt9mwnvtIm09edG3rpW2554YRzBpBzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTsWcLznxDwwxzUn3fSrbyPydLcbo05vPesMlNDmQ7dklGXMsg
	+LXeb3QeaB3OC4TD05f7/9mr/puTNW8/vj1Y0qC3OkAj7+DIucB//ryN
X-Gm-Gg: ASbGncsAseVgsroEpPTcfJMJvKLmhr0J8z6fYQLA1CqYCO0/xamBB3JijZ9RBdiwKPt
	imZqgJ3eNaoTNUSIPND22eAkneJG/sayvrYB4BoOWAxpQDkJ6Bec23eDlnlU7qkdRh0aUQlG4gj
	BcaoCaYTAsHKiitH+IqxkFO+b9tKiv5ebp2RwWdjkzv4bukAzfs6oCMbNXqyEDeA1gUsCrphHev
	N8pkjzkxSuyEN9AsLCDQtWhzzGE4Rpn07EVoZzTQiZQG7cM86dFw2oqt1Gv0q3vlPG2MHj+hf1i
	ZrGCsDjz0crBjbR7EAdb+qbNYJRrif2d96MvcatwxXctgIYYTwyZ0iCZMdPr6bqtsD+3wZio6SR
	/fF/hjpubdCHxkfcdydJ5coO2Yc7vE6RpyNe8M1R9hksgnXG3pGi7kbCJ9lq+kpwp5iXKbygNWJ
	8OasZ1rhFbzEthQu1cEE6nGM/1xX8JJfKYhuO0VpRgBKqBjA4x9vX4NQ==
X-Google-Smtp-Source: AGHT+IFucoSpcC/sMHQ4BHPU2Sj/4WR5SsWuPVRxpOY+Rb83Lsjw7eIU5fItk/Z3WAxH0T7dO6D6kQ==
X-Received: by 2002:a17:906:ee81:b0:b6d:7e01:cbc5 with SMTP id a640c23a62f3a-b703d55289bmr367879066b.53.1761755627345;
        Wed, 29 Oct 2025 09:33:47 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6d853e5138sm1485764866b.44.2025.10.29.09.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:46 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/7] MIPS: PCI: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:31 +0100
Message-ID: <20251029163336.2785270-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029163336.2785270-1-thierry.reding@gmail.com>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_153818_854886_BB8761C2 
X-CRM114-Status: GOOD (  15.95  )
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

From: Thierry Reding <treding@nvidia.com>

Pass the driver-specific data via the syscore struct and use it in the
syscore ops.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- adjust for API changes and update commit message

Changes in v2:
- remove unused global variable

 arch/mips/pci/pci-alchemy.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/arch/mips/pci/pci-alchemy.c b/arch/mips/pci/pci-alchemy.c
index 6bfee0f71803..f73bf60bd069 100644
--- a/arch/mips/pci/pci-alchemy.c
+++ b/arch/mips/pci/pci-alchemy.c
@@ -33,6 +33,7 @@
 
 struct alchemy_pci_context {
 	struct pci_controller alchemy_pci_ctrl; /* leave as first member! */
+	struct syscore syscore;
 	void __iomem *regs;			/* ctrl base */
 	/* tools for wired entry for config space access */
 	unsigned long last_elo0;
@@ -46,12 +47,6 @@ struct alchemy_pci_context {
 	int (*board_pci_idsel)(unsigned int devsel, int assert);
 };
 
-/* for syscore_ops. There's only one PCI controller on Alchemy chips, so this
- * should suffice for now.
- */
-static struct alchemy_pci_context *__alchemy_pci_ctx;
-
-
 /* IO/MEM resources for PCI. Keep the memres in sync with fixup_bigphys_addr
  * in arch/mips/alchemy/common/setup.c
  */
@@ -306,9 +301,7 @@ static int alchemy_pci_def_idsel(unsigned int devsel, int assert)
 /* save PCI controller register contents. */
 static int alchemy_pci_suspend(void *data)
 {
-	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
-	if (!ctx)
-		return 0;
+	struct alchemy_pci_context *ctx = data;
 
 	ctx->pm[0]  = __raw_readl(ctx->regs + PCI_REG_CMEM);
 	ctx->pm[1]  = __raw_readl(ctx->regs + PCI_REG_CONFIG) & 0x0009ffff;
@@ -328,9 +321,7 @@ static int alchemy_pci_suspend(void *data)
 
 static void alchemy_pci_resume(void *data)
 {
-	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
-	if (!ctx)
-		return;
+	struct alchemy_pci_context *ctx = data;
 
 	__raw_writel(ctx->pm[0],  ctx->regs + PCI_REG_CMEM);
 	__raw_writel(ctx->pm[2],  ctx->regs + PCI_REG_B2BMASK_CCH);
@@ -359,10 +350,6 @@ static const struct syscore_ops alchemy_pci_syscore_ops = {
 	.resume = alchemy_pci_resume,
 };
 
-static struct syscore alchemy_pci_syscore = {
-	.ops = &alchemy_pci_syscore_ops,
-};
-
 static int alchemy_pci_probe(struct platform_device *pdev)
 {
 	struct alchemy_pci_platdata *pd = pdev->dev.platform_data;
@@ -480,9 +467,10 @@ static int alchemy_pci_probe(struct platform_device *pdev)
 	__raw_writel(val, ctx->regs + PCI_REG_CONFIG);
 	wmb();
 
-	__alchemy_pci_ctx = ctx;
 	platform_set_drvdata(pdev, ctx);
-	register_syscore(&alchemy_pci_syscore);
+	ctx->syscore.ops = &alchemy_pci_syscore_ops;
+	ctx->syscore.data = ctx;
+	register_syscore(&ctx->syscore);
 	register_pci_controller(&ctx->alchemy_pci_ctrl);
 
 	dev_info(&pdev->dev, "PCI controller at %ld MHz\n",
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
