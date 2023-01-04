Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A2AC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 18:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D6bTCDxLKLtM6vFHCajR9nKdTA+Q2bxRMxT4A2RsR2Y=; b=vpuEjDa3MMFdMv
	A19jnwcwPfz1KK/MU5f3ehzMl/Gh4H4+Na1NArbWsqWDkkYu+pW1h0R62QwUtF/aGoqDAk0km8kfH
	VoWx1QjOw5pMRlEgNIDZKood1WgFVdHkLps9wRvBOJBRWxS413qdPsmdvzLJ2E7ufh/Dj8UxrrQ3X
	kvCm3UvdvFMD8jkhBmcZfyzMpBoBiyMyrwX/dCZVo9WyTqc6FFlZ32cALgkyZ252SMj3y5hm9H4Bb
	QUQyjBIi5WDnWkcstK4o0kYd4pu1dvFeA8n9kP8ncpNr3AoJ8gQL25G4Plj2JKv+Ih5D/ISE+PfCj
	MD6vytr1hCcXWxgcykiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD89I-00AqMp-OH; Wed, 04 Jan 2023 18:06:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD89E-00AqKh-A5
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 18:05:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 9CD4CCE185D;
	Wed,  4 Jan 2023 18:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AEE2C433EF;
	Wed,  4 Jan 2023 18:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672855551;
	bh=7hi84JBUzFJsCseSml62aqokn8J6yG6QNrOsogIOB7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VN0/UaFFVZqOMHF3674yqncE3YyRqpXDi5c4Zhr48kmPb5BzW1m0UyuTiRIPHTwJg
	 6ohuZFHYCy0Uz7JEkrOAPmJp6q3t2prjNBbnCCfNlUrPifBiZX/pgi8euV7gQdOoHP
	 u2v2FU+cSLVuTKpaCiiBL0znJ/bqgcFgJPj811JgYfwkqFLv0/noGd2P054fbFSkum
	 27soQ27+YV2HwVuhOTPDmw4Uyao4A8MUh0qiDqJFteLKnA99okpwEfjT/aMBXpvWka
	 G0/T0SrhpxzhLwOVaXNTAqDb8xn/dI3ZL3EJewf+ZPwTJfM1E7q1aRvADplGsGgBvl
	 /27kkR1aysMtw==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <siyanteng@loongson.cn>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v1 2/2] dt-bindings: riscv: add a capacity-dmips-mhz cpu property
Date: Wed,  4 Jan 2023 18:05:14 +0000
Message-Id: <20230104180513.1379453-3-conor@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230104180513.1379453-1-conor@kernel.org>
References: <20230104180513.1379453-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1179; i=conor.dooley@microchip.com; h=from:subject; bh=o07jjdwBTatvOwh4zgdAJ4rsKJozF7vor3izbX7Vg94=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMlb91/MCL97v/HRZP+ZQQoTbpy8ObPJZKryPqsFBjsulS4U ZU1Y21HKwiDGwSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJ3H/D8FdGeDLTxqseKd6GMz+vn2 dw6/qlJwmcR85k5/KW588P13jA8Fc6rkupS13k7O3cN8f+q/6375qlbHJd6PmVowdZAyzu/uECAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_100558_199614_3754C9A7 
X-CRM114-Status: GOOD (  10.28  )
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

Since commit 03f11f03dbfe ("RISC-V: Parse cpu topology during boot.")
RISC-V has used the generic arch topology code, which provides for
disparate CPU capacities. We never defined a binding to acquire this
information from the DT though, so document the one already used by the
generic arch topology code: "capacity-dmips-mhz".

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index c6720764e765..2480c2460759 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -114,6 +114,12 @@ properties:
       List of phandles to idle state nodes supported
       by this hart (see ./idle-states.yaml).
 
+  capacity-dmips-mhz:
+    description:
+      u32 value representing CPU capacity (see ../cpu/cpu-capacity.txt) in
+      DMIPS/MHz, relative to highest capacity-dmips-mhz
+      in the system.
+
 required:
   - riscv,isa
   - interrupt-controller
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
