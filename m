Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118FEC761A6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 18:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8FtPNEkTPbBX5i6jNuMfJ03k5FYm1eof8VredoY3Ric=; b=nzOpHZ876NW0Yk
	8uf0R0pMdbnK4t1JO1sX3MxeNcsryVef9XBhcXHNIcJHBfxC/SdFU7oLQRgE5cRnD9OKdp3AUG2yK
	dfTP8pNqgy5KJ08bfHYIR834JI9EsHYdm3kaK8A56Ok2bmWsA89MwkU0wC2hG7CIgSqoSl6V6df7a
	YIoKKru/1GYije1KxRBXzBfji4F0riEzYJygFbUZFixhNEkkQNjaw6eLuKmCfI/CvBT3JFAPxF2fD
	5+vaa4NAp+c6k1yHRUqnSKaGx5gr2GlJNsaCThtehqjDBcuTzyHvm9lsOBL2enECblKJTOuOf85s5
	2wJL0D0BCNBj+B6Zq45g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjl0o-002Rqg-07;
	Tue, 04 Apr 2023 18:04:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjl0h-002Rnx-2h
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 18:04:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1934263821;
	Tue,  4 Apr 2023 18:03:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FCD6C4339B;
	Tue,  4 Apr 2023 18:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680631438;
	bh=NEdwIWZOJschJ8QF5b2zp8sC703r6EvbHbPixlx4z38=;
	h=From:To:Cc:Subject:Date:From;
	b=O6l53MPt/ujh70GigbHt1SNot+coAvvC28j4hWiJfd2z4pG2T6zpnG5gXx9a6dDoB
	 VbLOFovn3848wzUP++tWeiDndLgR5GtYFdcOB6wDFcPphhzOUnyZPSbz5CKHFMzjCF
	 W6xdY/fBbpvE4gr1c3f53r/d1d8hKAoJ2xp+6Rkx41y+/2yqOrRydZtUD67yAJpOpz
	 gBqTSxIWDorSb01oefoB4Pxoa859nxnTfSu4tK2CFn3ylFjaqEVFpoGslM1kPRINJV
	 lWr7AW+LrGpPV1xCZnQcj34d2lm+fqbdHBxwZHwTF4NcbcWh12ux3duj8hrVmjAArL
	 PHmwQyqQjbGOw==
From: Conor Dooley <conor@kernel.org>
To: Atish Patra <atishp@rivosinc.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: perf: riscv,pmu: fix property dependencies
Date: Tue,  4 Apr 2023 19:03:22 +0100
Message-Id: <20230404-tractor-confusing-8852e552539a@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1646; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=2hS1x6j8jxB5WORv7alUwm+GQaMbRtWF7Ns9mZYqnSE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCk6aanvotZJXJBkODU58cYl5fsH1bI/a0W/kD24xkvrk vmmSXuYOkpZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRf5MZ/se6VF4Jvs6T6/xq ueoGk8RFzs/Do3JevPm4fZZZpaH2nAmMDHcdDs6Mm2RsYm394pqo+861Dzf6chc/+/P6yLPtz76 qBLACAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_110359_932991_1C1B297A 
X-CRM114-Status: GOOD (  12.33  )
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

Seemingly I mis-implemented the dependencies here. The OpenSBI docs only
point out that the "riscv,event-to-mhpmcounters property is mandatory if
riscv,event-to-mhpmevent is present". It never claims that
riscv,event-to-mhpmcounters requires riscv,event-to-mhpmevent.

Drop the dependency of riscv,event-to-mhpmcounters on
riscv,event-to-mhpmevent.

Fixes: 7e38085d9c59 ("dt-bindings: riscv: add SBI PMU event mappings")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---

Atish, I'm not 100% on this one but I noticed it while doing dt-validate
on a dump of the qemu virt machine which doesn't use the
event-to-mhpmevent property.

CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Atish Patra <atishp@rivosinc.com>
CC: Andrew Jones <ajones@ventanamicro.com>
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/perf/riscv,pmu.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/perf/riscv,pmu.yaml b/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
index a55a4d047d3f..c8448de2f2a0 100644
--- a/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
+++ b/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
@@ -91,7 +91,6 @@ properties:
 
 dependencies:
   "riscv,event-to-mhpmevent": [ "riscv,event-to-mhpmcounters" ]
-  "riscv,event-to-mhpmcounters": [ "riscv,event-to-mhpmevent" ]
 
 required:
   - compatible
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
