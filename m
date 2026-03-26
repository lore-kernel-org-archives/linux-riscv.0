Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F82106F2EA
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 08:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=djSpMnKy0AHzcEw/H/0OG3zxNsntJSHo3O0iRuUgi3o=; b=nVVuanL/2eZGdK
	jeJhQxv9TuDh7Z3fCVMi3AKPwKRIMVsI4OJThsaOzDUUjDopciJz9im1wSFOvZroZreQxcM6m95J5
	KHwt0CwLmK/7KYJ56C/5xaz7nGDso+qapTUYu3/Le363yXR2k8ngEbI+h11TauI2vvccgVNzfuq01
	iIdU7r8WvsN+bKD63AyG3vWOiz4dTHEQ2KVSOlj/lMIsKvZSJ7paKTtN7y8b0G+rEeV0Xpq3xrWQ1
	rsfDGQ5ClKU2VNfWI6qIUSxo4ncMtUNWCGGWLPgQ/jM4PgN8ziNOaQrBAKS9J3+Lz6+igwTy6u6RV
	nL/JSyw/1rGCCveNxHow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fvO-000000050lx-17b1;
	Thu, 26 Mar 2026 08:18:42 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fvL-000000050hZ-3I71
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 08:18:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774513088;
	bh=s2oQFoR0c+QLUYmpARQQP1qguleDXuKVE28NtoCcXFM=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=TeCtfCe4Wqb/a5UuLUfHM2T2+GOt+pOfHyKp9CS5hLyWodZ2mYmxQB8D16X5vBZu/
	 m5RCc+xSX/QyjgfoUyAihUT0/g08yuKOoHnvVtH/n9bMBtn+w1Ics57hMA4SWaBiXf
	 aPlJAyOqoW7hmzgEqoBMUuyfphmYpkXe8uAolcn0=
X-QQ-mid: esmtpgz13t1774513086t91d86235
X-QQ-Originating-IP: WElT2ry7tB8lLshZYv4GJO/uXGJxUAxREOVWudDvM1E=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 26 Mar 2026 16:18:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5813357295309933169
EX-QQ-RecipientCnt: 20
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 26 Mar 2026 16:17:17 +0800
Subject: [PATCH v2 2/7] dt-bindings: dmaengine: Add SpacemiT K3 DMA
 compatible string
MIME-Version: 1.0
Message-Id: <20260326-k3-pdma-v2-2-ca94ca7bb595@linux.spacemit.com>
References: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
In-Reply-To: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Guodong Xu <guodong@riscstar.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-clk@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774513072; l=782;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=vS8ZACtafXuUdon1LCamqQGUmKVZBsmItTUIR/tecmg=;
 b=rZ789pdyPNreWYgyYMj3Ulx6Thkc9cK9AJwqZ8/NSDypf/6iqa3XNSMQxqi/NgvKGq3oXLt6I
 u3K7i7aX6DZARoYYvklMbYEx7O6n6Cu+BVZwc5vgZAMd6pwl3BrABPm
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Ngwq0BL9nhqbgpgdtno6pkEZ4mtKvzfy1dngFJc7HTbDDbslCYBDzb/m
	pFZerPR5CXiwixm2SX49UWu1De9cJVh2Dp8uG2pd9VhyVPN7BXpEGGH9ZJ0vD7S0y04eLBF
	FQBU9QQymrZRLmpwxs/DsbTWRZpZ8z5ti/GUfp9xvfpR1p1Np0gg23qqLV2BS18zdnsEUB5
	4nJCX5G7FlU2bkX8KSch/q2o6eimqy/iKVgfdOygP0vfzrMRsZL8cziU3+Ft/4dlee+ETiw
	Sj8A70o+oG9EBHlcy1Nr6z0vo9V430vU9cRqEwecVWgeKflqLCZhzmwaonU6cVReRRcs4UG
	oEahoSd+Vpcbz+HuFNo6O/ZnnybsKknVBRSrXyVAM+sSuD49TOh7mR0gVwu6ZaLklpLcPpJ
	EFBme2G4olHZfosWJBljPslMMjxF9CntRtlyoNAdjpTghq1CudICpBLWNxzf0tQAguTVt4/
	3TtygpJ+2Me/gqe1C5xBQ7jGwFdq4cHocKeFzDm0q1RLAi7+pHwOA5X8vg560FyX5TDL+dj
	KTDDTRH3i8at+SU5oTxvP0pX2yr6yyNnIkti6DSJmC63JhM1VreTq14KE5nFxbWQzqbi0Hk
	4ZxcGzZ64hRPQK1Rs4CMqvTJ/9VBv/JwkVwemhw0/Cik8tc97czkSrQmJooPGfnyESq8KRh
	kqlTKWN2Vs4nE554X1opRRLjCPhIfG5hECwBQXF+4rZKtCvoACwu036EbMdB04CgLpuL2+T
	mKq4C2btMAjSOYtFLNrkfQ7SjAYeSnY2XTkKkAMqXcxV7kBvFGcHX9NB9g3vK9OWRxo2TTW
	PzGQmXDRp+YsPnD4b0J8gJSrerJ9T7EgQ899Fc11hQacRABcDsBtRqD+KWVHYVKxuP5yxwo
	9rdPWv/3EGep8B4t6NR4MMYD1B1pT+Z7QNanou9lbKXWE43M4clFc1b0nCcS2+r9BuGQ01b
	zQtzt3HkeshuC04yRvLf1Fs/yvD6bksVfqjb27Z3n0g/2tzbWPqsIvLZtVsZ12qkjXlUUez
	w5ehpBHpp7ksdAQOqRqHCat8F3If1JDMzj9uzoKHBFhXVrnIphgYJO2MBMHubHOpzf4NWWi
	PVO/5TeEqwBV8Ly4Vs8ti4=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_011840_405538_A85DF70F 
X-CRM114-Status: UNSURE (   7.75  )
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

From: Guodong Xu <guodong@riscstar.com>

Add k3 compatible string.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
index ec06235baf5c..62ce6d81526b 100644
--- a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
+++ b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: spacemit,k1-pdma
+    enum:
+      - spacemit,k1-pdma
+      - spacemit,k3-pdma
 
   reg:
     maxItems: 1

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
