Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C22EFCBBB
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 06:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l9QqS3Db0if3xzSqh7i48y3KzdVLXQJ/KFgKYbXLsnE=; b=x4bRGl9lhSrkvu
	MU780lPoE4137WQdFoAjzGu6eRjzVTY5mC5xPP/d63DjysvntVz7QYdbwe12Jy9326g96ZlFBo/C9
	CDb1CTUAN/hcFxAT6Y3ui+/xLdUlPgLsOO0ZfPLcrjTXncDd4xxZ1J56wXpNq56cDCHYUzKNz6i0K
	20lQUdB0kzdz1x8pAxyKq402NIirpl3/aFFUsuSE8L5DwtxLLD6XIy1//4GNNtak53SjkXUGTGEnH
	HtETF2Jbjwzsrvo4PpRfeDpCWBeeYFjvSynQr3iTXdjaLyGTxh9+GZHRChrI0H+7Htio36q7N1Gfg
	RsJLRSGMceg/49cjKm7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w21WG-00000003Q1f-2Rky;
	Mon, 16 Mar 2026 06:33:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w21WE-00000003Q0Y-09Oy
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 06:33:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9503043E54;
	Mon, 16 Mar 2026 06:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69CB3C19425;
	Mon, 16 Mar 2026 06:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773642815;
	bh=Shl9i7Neut1yNC/BlWUbV5D2c6yZxtq+foRFkgLFmDM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SHexgPnaZaRYoTeuFrmM+U6H9RGJ6KJTHznnK1F3KSpFqg/wHA3DNUvo7CWECSlPp
	 x3xIbbvKAVoi/gNM+n41eM/0icycYH2/cQhlMacuqpfJ1xEZVQ4SJQcseMNtdHYxm4
	 XTn0VfHF1bbMa4WihMzC+CUEYYXiGlgwoem/O7zNm1D4fVB1+Iwnz2MPLwJxLgSsqG
	 r4DFRketLPVvvUT5yUpNEAqQpGtWA8fTyGpuirSMaV5ZoxnXCCykXSTikS8b1FSNef
	 pSHALXe0sY3v8uEIfVop88LAzXuy5ud3K49ZasqIhcS/Qj/E8adGRmTwIow07ncs63
	 D8f++fv8/IpJQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533BCEFCBBD;
	Mon, 16 Mar 2026 06:33:35 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Mon, 16 Mar 2026 14:33:22 +0800
Subject: [PATCH v2 1/2] dt-bindings: serial: update bindings of ultrarisc
 dp1000 uart
MIME-Version: 1.0
Message-Id: <20260316-ultrarisc-serial-v2-1-6ab3e7fa891c@ultrarisc.com>
References: <20260316-ultrarisc-serial-v2-0-6ab3e7fa891c@ultrarisc.com>
In-Reply-To: <20260316-ultrarisc-serial-v2-0-6ab3e7fa891c@ultrarisc.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>, Yao Zi <me@ziyao.cc>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773642814; l=830;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=jeAzNqfdfA35qeisKPZc2pOi87g/Zrhmu+g6GMmMbgw=;
 b=21UIh673o/8ZBIrk9WQvOzWy5rDlgKN+9PWKeDlBEnyynB2e84xnm6/RpcozinoFCvkcsVQKl
 VXF0KQqFk1UCubU68eRC6OJ3+3QNQB9HA2mZJ6rPWp0HVUcrV9B82ml
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260309 with
 auth_id=682
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_233338_152627_2C59AB3C 
X-CRM114-Status: UNSURE (   7.33  )
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
Reply-To: wangjia@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Jia Wang <wangjia@ultrarisc.com>

Add DP1000 UART compatible information

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Reviewed-by: Yao Zi <me@ziyao.cc>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 6efe43089a74..0040ed28e35b 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -78,6 +78,8 @@ properties:
               - starfive,jh7100-uart
               - starfive,jh7110-uart
           - const: snps,dw-apb-uart
+      - items:
+          - const: ultrarisc,dp1000-uart
       - const: snps,dw-apb-uart
 
   reg:

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
