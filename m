Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CAECCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 09:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mqiV1TkXvfFzfi5xdebXMhWhgitwkRz7KOOYHgC54o0=; b=pwUuvF3rgLlk0y
	W9djzH9KTane90RTCa1cEoshPkglmLee6kcT1Tba1C/ek4TTa8ukrNqGDAOs8u6lo/EXvxRCKgXSJ
	RJ+Pso7waAVAXsMlXzXCWKxbYjvWU3IOVYpwK4dYQAUD27I3ikMMzdtCPL6rhSdOTlsAoSwssYolM
	8MJ/dvQLDS48MH8JClNqFMwNelRljRaYpXQtIJvnp2mYkYAM1du7cDTr467uNQxt+4VFZsIv/T0T/
	edE/Ujr1+2RjSpfG9f4EzkTQ8Hscw/QVvzMAjapHIOTL4KGjDHWD81V4uvh0/ZQiN/jLwHlIGncT9
	u/s90XRDaADh7SZ/f7Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8v9-0000000GV0b-1sgt;
	Tue, 21 Oct 2025 09:44:47 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8v6-0000000GUy5-2ZXs
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 09:44:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761039870; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Vu2EroZx+U4M9als3zki2ilNg7IjIrJd4QXLMKFLG/tdxRUpdDw6Gcf9d4Ujw+6Nhl+apRS2SdroWj7msHWkPdkbOldFKUylL87gCNkAHKNnUGxKdtSFnpaBw8oUlXJS03Qe5cAuwSGjBhl0wQnR4VrrjabGDdpg6KKGFJivrjM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761039870; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=X2RB1MOzDJYq7HOuXpbYEF3Z0He4yh7CP3RvCfB9KFw=; 
	b=Ew2TyWEDnCfwgwwNaoam0sQMcmBc8FceBzqZqH11zLJ97NQvis83nOqP76RLz4Sdis7M//CCboGEyvmHo6fPcvex8cs/VHVDVWpobTjC9JesGNffOiXNhUgLfN3BBWqpV9vpid3i8IAETSxTWZ8sVFWBS5sG2t3gNOm36b7P01A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761039870;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=X2RB1MOzDJYq7HOuXpbYEF3Z0He4yh7CP3RvCfB9KFw=;
	b=dG9ShK6afqqp6rulMKPMuBFUX0mYZdQMs9+JrxV2Hd7q5IERqENcOe6PRbiMLDKd
	zE95vcU0e7RmCgBPBHyAspvNaFZrbOpanXaLuR0/lbSXkqZ3ClUYqXYOxqTRxahdKFi
	s9kpiXF35ElG5h7aq1dg+275N/jspGpz/kUIgbS8=
Received: by mx.zohomail.com with SMTPS id 1761039868294901.6443000727567;
	Tue, 21 Oct 2025 02:44:28 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Tue, 21 Oct 2025 17:41:36 +0800
Subject: [PATCH v3 01/13] dt-bindings: vendor-prefixes: Add Anlogic,
 Milianke and Nuclei
MIME-Version: 1.0
Message-Id: <20251021-dr1v90-basic-dt-v3-1-5478db4f664a@pigmoral.tech>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761039846; l=1665;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=J5gb3vtEtk+0yzNS9oiuJYgT4VyJA8UIx1lslZgyVZQ=;
 b=6dtYkjBO3x0HtMSCOPEtd/TpQX/1W+w3dFfUXHktakjndM8I/yE95lJqxH0lBkmH/5cIWPRNZ
 xzaoxHwR5FTA0ylhhI8IxTKD5LpZn2LyJsBFZ1del3rLLq2KQmoRZh9
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_024445_024228_CBD21936 
X-CRM114-Status: UNSURE (   7.43  )
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

Add vendor prefixes for "anlogic", "milianke" and "nuclei". These are
required for describing the Milianke MLKPAI-FS01 board with DR1V90 SoC
from Anlogic, which uses a processor core designed by Nuclei.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f1d1882009ba9e80127bae0151af157879fe3070..23e74b96bfb78cff5cf5fc7e48de81092b81b9da 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -132,6 +132,8 @@ patternProperties:
     description: Anbernic
   "^andestech,.*":
     description: Andes Technology Corporation
+  "^anlogic,.*":
+    description: Shanghai Anlogic Infotech Co., Ltd.
   "^anvo,.*":
     description: Anvo-Systems Dresden GmbH
   "^aoly,.*":
@@ -1023,6 +1025,8 @@ patternProperties:
     description: MikroElektronika d.o.o.
   "^mikrotik,.*":
     description: MikroTik
+  "^milianke,.*":
+    description: Changzhou Milianke Electronic Technology Co., Ltd
   "^milkv,.*":
     description: MilkV Technology Co., Ltd
   "^miniand,.*":
@@ -1140,6 +1144,8 @@ patternProperties:
     description: Novatek
   "^novtech,.*":
     description: NovTech, Inc.
+  "^nuclei,.*":
+    description: Nuclei System Technology
   "^numonyx,.*":
     description: Numonyx (deprecated, use micron)
     deprecated: true

-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
