Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C482D62609
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 09:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p90CaRXe8yXC9NV8lgDNJ/n6Ng9Tr4qSK1FGhaAaaM4=; b=TafpXynDnWltXS
	6y28J5gyxrcqi0GnxBjQ+u9sy5ZyXcTM4kQWTeYnN8Erb1vbv4eTIfz0Ktu+hGwk+QgNHhBFdAv6Y
	c0tTuPTMECl87eoo1WO+4htHF4e78JqbcRFfUC+j0QkBWrB6e45Ks2x/4bjKSWxC4RfIO2Z0hL9eW
	RHCcxUbjJq+7tsFWt8tuxWJB3yFfLIboCaQ272ZqcUvEElA2uNnSvJzjcv+dtfY3x7wa2vmWOfpiB
	jHmMO82ahXqJkwWC5kRX4L2pYFOXiK8i3jTtRUchZhZLx/esT3/bKFHwRAAsObeKPM+OHo4eXrMAE
	tSWrpXtP++DTXWYYPwyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vir8z-00000006kal-1oHz;
	Thu, 22 Jan 2026 09:38:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vir8x-00000006kZp-0RhJ
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 09:38:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E6B0442FB;
	Thu, 22 Jan 2026 09:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD08C116C6;
	Thu, 22 Jan 2026 09:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769074701;
	bh=nIbfvMqfmW7motctlbXKsHjUbk2WDNR6Ijbzum4nZr8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RuBT1inlCDKEoDCXtVTycCjBg9EyPc7dfuUP3vr2b0h4504BcHeigee+0M2EGcBQJ
	 FbrxawD1ZuSFBtsALd7xVzgH5MhuDSl2t3+1u/gdDiY78roMtR+poZ2kEnogVG6JjW
	 5m7ZbwyAz5kMQGcDiZNk58/ucEhUVzjZfp10QuNboaIUuwSWKVVFHsZAJc/VgRT17S
	 7eoMeqvfBe/MNrrx+9bacL+yaKLHfwLHExRVdMhsIOClNg+qK8Kp4fh+CQLiUTJ3K3
	 MllVYq3t7YrDMJzCAwBUnwexhOdyIBo/z1c+Di/yeLAcd1QVn9IaGb9TxVREKW/pDU
	 IPE+Sa6dFqOCg==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 22 Jan 2026 17:37:30 +0800
Subject: [PATCH v2 1/2] dt-bindings: mmc: spacemit,sdhci: add support for
 K3 SoC
MIME-Version: 1.0
Message-Id: <20260122-07-k3-mmc-v2-1-3c3ffef25e94@kernel.org>
References: <20260122-07-k3-mmc-v2-0-3c3ffef25e94@kernel.org>
In-Reply-To: <20260122-07-k3-mmc-v2-0-3c3ffef25e94@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Yixun Lan <dlan@kernel.org>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=907; i=dlan@kernel.org;
 h=from:subject:message-id; bh=nIbfvMqfmW7motctlbXKsHjUbk2WDNR6Ijbzum4nZr8=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpcfABMFEcQ6SMwIPAsrBITyzzDT9BT1q6hl3xg
 BABADt0FEGJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaXHwARsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0I/Q//R8uM84F5AkvgGtmgwKi6mj37Sp7s4/D7JvEdumTp33fcTjODG99Ae
 44CY4vxINtFXu2MdZ/SuJWnRdCcYCi+zIbXskCwk480R05V/4zJw8K9i8G0BpiNbbNJKO1E+o6s
 wZnHyTGI2GQdnOVDQa/ES7LT1vN7W+bLfCKNoMRN1aZ0Eh+LObNLQomqvzeTP/9q47l+JFZeiOh
 dRrWs8LEyofP0FiuVP3xz5MTh8rldgU5m/DiugwRlbo7QBOYSg5rEIxiLizkUTxN9naDe+XUJm/
 KEswC1AmLNlftxGekaIPWCVwqfi1i8xJCkLNt2Bzre/ntz0C2BfqEx4Cbi6QTXKXTQKSCEo5lcI
 fdgD1mt/U8LkkyZjuG+O2WtA5ZCGyeLkoeoJXObPHENhH3rRLCCtnPIZqiM7iCs1FITlsEOt/QF
 St7kWg19YEieScb95vu7A27ck55uGekwGoUsvAAVQWOVrLdvE/olqhbPSig+CoFEHz5tZNq5nTH
 xCS7WnE7+9IoP5aX5wibwC5VOvoEmZ20GLG06yNrZiqh5Lafr1CtZtvv2l4HGT8bBsxAmFwzd/i
 tHaB6FJ3x1eC7XP2IxZViCphxoWSZL/YAWruVkNrwqrKu8kNEgcJzB1EM9zdIzUE5/R5cs/c5G4
 Xwn/4ojVTan2NAiUy4asdoWvzERa74=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_013823_170361_E33AE7DB 
X-CRM114-Status: UNSURE (   8.46  )
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

The SDHCI controller found on SpacemiT K3 SoC share the same IP with
K1 generation, while fixed the broken 64BIT DMA issue. Introduce a
compatible string to enable support for it.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
index de4e9efeb666..9a055d963a7f 100644
--- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: spacemit,k1-sdhci
+    enum:
+      - spacemit,k1-sdhci
+      - spacemit,k3-sdhci
 
   reg:
     maxItems: 1

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
