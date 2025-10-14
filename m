Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A17CCD185
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 03:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ETDjVLiT0cPzd+qdTZfSKXGV+EgM/cDa0zC5KNLQ5FE=; b=GWYwS7LSJqFd3W
	2TJwL6y2w/qqnw1QchTvNssrV8xH81td6r6rEK/4odXSKjHq3Bap5PRweAUxl8voEAMpVr7bwOEse
	xqGgQ6wrv3jaqRcLtmuXtxpu8M8u8Ou8Z7Kh2ViR5XkvXkiZEw50rEE/lVaZXQUkQ2hzPy3eCqsuT
	xuR/cEUda5KWWIOxehxtxGM8D+P9jj1/1sCwr9KGJb/iQQDhZnyjlaaKVUPB5iROIMmxir1/jwZIF
	6XJaT27WvKoPFqGrdrGyerNEkGUEOtpdrwajG1JRBqfnPJkcyqJDQ6djK49fTV7ykwb8apRO94jAe
	KIvkIaQbFdBl/OPRq0CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VSY-0000000F1Ej-2CaM;
	Tue, 14 Oct 2025 03:12:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VSW-0000000F1EO-38Wt
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 03:12:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1548E6214D;
	Tue, 14 Oct 2025 03:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA5B6C4AF0B;
	Tue, 14 Oct 2025 03:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760411539;
	bh=Qxx7Nu/jiOa5nZTb2hgXdJjolteFiTKWPAx4vNdsclM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O2jdChqk8evemkiSOkmk55bFFAlQdcsvqKM2OoAlYIGGHt7+FluSCyMg8HXMAn3Dh
	 giW0Olnan5P+IhT/mXSZSpUx5vMbnx0A++HcDceVZ8QrOc2/WiuGCiMumJnvStBAbT
	 kqF7Tu3MtSRTPkUDDOwu30UHlBLsENDD0jZhsfXjvLh0mUKE763hBTyw6zEmn6DHwA
	 ELaefHd8p913R83C6KHAtk5tqr3NgbjLaQ3TzxeRze5hPyhNijbTdQHcckC1nnlKa9
	 ZxPARUdj54IJYBNr4M4n2dZQX+lXn/VR1e31MOkLpSGv2pP1nTHojL84/0l1/EZ9p+
	 IFBPS4KadQrIg==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 13 Oct 2025 20:11:53 -0700
Subject: [PATCH v3 1/8] dt-bindings: vendor-prefixes: Add Tenstorrent AI
 ULC
MIME-Version: 1.0
Message-Id: <20251013-tt-bh-dts-v3-1-9f058d4bbbda@oss.tenstorrent.com>
References: <20251013-tt-bh-dts-v3-0-9f058d4bbbda@oss.tenstorrent.com>
In-Reply-To: <20251013-tt-bh-dts-v3-0-9f058d4bbbda@oss.tenstorrent.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, 
 Arnd Bergmann <arnd@arndb.de>, Joel Stanley <joel@jms.id.au>, 
 Joel Stanley <jms@oss.tenstorrent.com>, 
 Nicholas Piggin <npiggin@oss.tenstorrent.com>, 
 Michael Neuling <mikey@neuling.org>, Michael Ellerman <mpe@kernel.org>, 
 Andy Gross <agross@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Drew Fustini <dfustini@oss.tenstorrent.com>, Paul Walmsley <pjw@kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.14.2
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

From: Drew Fustini <dfustini@oss.tenstorrent.com>

Document vendor prefix for Tenstorrent in DT bindings.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Joel Stanley <jms@oss.tenstorrent.com>
Signed-off-by: Drew Fustini <dfustini@oss.tenstorrent.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f1d1882009ba9e80127bae0151af157879fe3070..21921be22207683a9c1e2248d0de63dcde867648 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1610,6 +1610,8 @@ patternProperties:
     description: Tempo Semiconductor
   "^tenda,.*":
     description: Shenzhen Tenda Technology Co., Ltd.
+  "^tenstorrent,.*":
+    description: Tenstorrent AI ULC
   "^terasic,.*":
     description: Terasic Inc.
   "^tesla,.*":

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
