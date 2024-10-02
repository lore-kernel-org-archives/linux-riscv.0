Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C989CF6D3B
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 16:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mrRUFUkFCAnkJb2upE5JQIksn9a47vxW7NKSKB6ElTQ=; b=yRm0rN0rsSKlfV
	gyqe09KWWuzTIA2iW2SmzHfh309Ku3mXzTA4dxV7sHQ0I0ZTeB10BCLGjg4QMxgM/+ZDV3h07rkg0
	wYJc7w6pM1anTy9krI/kWJXbNLIh2v70mHVYNfshCAcm7wC1E+ScYgjFGUGJEDq3F43HTDcj34RVY
	KKbTPONpgOWfkLAILVNbSK06M6olMAxAwT932CzDe/ykfq2ZOGXsKe0+XZnqtJjqSANTDeDSl+nx9
	FDSV85LMUQintyfxko8HZswFm+6oFAuAux6c71UlqHs61tFPTeNRss1IbBti3x72HEqriNTI9bgjx
	mI7XJ0I60jqXx4bj2P/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw1xV-00000006spd-1Yax;
	Wed, 02 Oct 2024 16:12:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw1xS-00000006snt-0kIS
	for linux-riscv@lists.infradead.org;
	Wed, 02 Oct 2024 16:12:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7B9475C4CF7;
	Wed,  2 Oct 2024 16:12:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C027CC4CECD;
	Wed,  2 Oct 2024 16:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727885529;
	bh=A0ybPXTauo3eopVMr548or5pJojT5HcHFGdg3+1LGss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cgeSlCGztSM2uY6msbBtrEbcKNdXBO4Qi8QZ2WOB/c0rzr/lDnjQqylxrP0Ac1ftd
	 KFsaVKFqbqNeMen4CUQc8zXtF7S+jh+9K3zODUYj15WUlHyVbPa3dUaq851W85i7mG
	 XbYyTB9FPI7jnrkWyAd+CTZpLb0oweQhDkBGx9mVi0oDHeR91Vq3cKtxxSJ8lNVYBE
	 2eqA+ba9UkdS/dq0hO9fr5MkDyaiLF09OxQ7Khvs6ptJpC+mhyUiXTjkkxlaNIY+yt
	 o9ub8hu+QPnYXKllYSBy+G/TIRRJm2HCpAHJMX6DnzzEW8Hh4n6jNSSdRskjuYOz5U
	 U34RzHRe4YrNw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC v1 3/5] dt-bindings: riscv: d requires f
Date: Wed,  2 Oct 2024 17:10:56 +0100
Message-ID: <20241002-deliverer-recite-2c5a05f50721@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002-defeat-pavestone-73d712895f0b@spud>
References: <20241002-defeat-pavestone-73d712895f0b@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1090; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=9IUjV4XrSlnqf+oDMep1HvXRpMwxZk7xWRthmNV0yIU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGl/Cya8DbpyT2Vp46G40F+7LI+IKCaqCn3+2rrLkun79 3NVux9ZdJSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiD/8w/DO1tlndwuS5gKf5 4P2Fqv657TOuPryf+6bvVubye8zSqgoM/5Nk/QruvvfMEf9qnsrseOLjD/s0ebfKjTdmB2RznXk pywgA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_091210_302308_75BEA141 
X-CRM114-Status: UNSURE (   7.55  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Per the specifications, the d extension for double-precision floating
point operations depends on the f extension for single-precious floating
point. Add that requirement to the bindings. This differs from the
Linux implementation, where single-precious only is not supported.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a06dbc6b49289..779f5cfab806e 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -564,6 +564,12 @@ properties:
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
     allOf:
+      - if:
+          contains:
+            const: d
+        then:
+          contains:
+            const: f
       # Zcb depends on Zca
       - if:
           contains:
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
