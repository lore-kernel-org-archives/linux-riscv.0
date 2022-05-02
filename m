Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C64C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  2 May 2022 12:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g+Lc6J41I0wfDff2aZ95snl+DH+8dGqLs6K0VPXV+Cw=; b=2WEhAVJw6YQLw3
	c8dJwZVE1GJShh0gD+rdLY0r2DQRdThqiqsNbgLos9+9dAT3opauqKm2sjv93kwso1YgKMJm8uogI
	If855ymeaNFZnOYRPsIn27I7ekIfpXVa2Ltoh0SMnzbJltqPk84fIDyGBowUPsXvND4BcdEJd7gRY
	OwC/aBvIEIEE+KMMzUfr3W2jdGrdU361wEEYUg7X3rv/e3VnzYRrBQqIgqGzpXGCgczHKPwxzkNqW
	ETKzRtRMhChcQGEjwJ8x+j0vCxneV9mWNc6jeJMjTZewbfBsRowoh2XoPB866kq6EAjFPtf51oZYe
	eKlWAm1muvGT+8NbVm6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlVVW-001Ax6-22; Mon, 02 May 2022 12:50:30 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlVVQ-001AvM-4Y
 for linux-riscv@lists.infradead.org; Mon, 02 May 2022 12:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651495823; x=1683031823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3hywuZKJ2+h6iyUSgSnjiO0CWFPSIGhHCXXTjq3TsWQ=;
 b=PX1Z2sMMmjhYoFNj8R7NwkwJ2lUJIg4ndH6nu18sG38BORYmWEZqW32G
 lcDtvwITFcQLEdgkdR0p4j/jogrDMfToU5B7fI6q6isyMfIF1+mh1Ba2o
 f8DvDqgIO2yRkUiZnRXQ/Hhif87rvigC2iYXz0YbN8MBsHvmh6HDdtXGb
 CO4wPwlPUEfHlf0E5Q/t63N9+md+NS5dzDCAFZV9Q4p8bHfwDgHKN1lEs
 3zv4Nc6YAkpNd3Ywv9F1bgOWLf7mHa5SMIdYMfiKi9DkkxC4DvRcdWmys
 oaRfsNrFPb4sZt5MAkHLTV/M9ZocZrwv8ZXz+J/ngb7F8MsVXWL6fOh+D g==;
X-IronPort-AV: E=Sophos;i="5.91,192,1647273600"; d="scan'208";a="303547580"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 May 2022 20:50:23 +0800
IronPort-SDR: RNQb+wPaeoq3aA7KC2wGluAb8jaUP58W56qHQc3a1Dj6LKhRAomX+uiUv1mT22cehMY2gv6TYl
 5YEA00MW2yNdX1Fnykst/OB0ykQd2zBs5HEPsKCB3Y4Bg+mecI4IYSSoZ22WkgnFGsmlQLBxku
 w6gg+joZpN/BIlGy2xGkrgy7wVU3ygQKbxPokLUsBf+U4C4T+gyHuHs5mfE8WNauKPqp5WPH+P
 PwmXhY2D6pUKsa5sPTG+dxRzaGeMW6UX5MRCbQtCgauJvyok9hR0nOoDGl5fuWSzwNdUPcZEOh
 3yF4lphCdEA4M5T5zfOr/an+
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2022 05:20:28 -0700
IronPort-SDR: NGc8pX35onRnUiPC1RF4OqvdV9kCyibcwxkCLT0JZtFJIqpNakN7D1j/o4tX7M7fM+tkRkxQ5s
 b++Vx7FYlkkQF4rCFVG4kRLizdlLIivki1Wbup7ubNkSXlJAvPyXlcnHBhTaU7KWAHUuWBxU7x
 17RrAtCJTWCtQBV8A8ED86mxvlWnGQwxqVOzBUMk3rkzFTLa3iS3e/9uy/DTsNabRjnnMYMGdn
 2Wf70cqhR1/iFTDbJ1xbh2rNYIGTKal9L7Xw6DHe5bwgnZ6gYsY7ZzSltpfnKmWnNepqbuqNu4
 BCk=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.lan) ([10.225.164.66])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 May 2022 05:50:22 -0700
From: Niklas Cassel <niklas.cassel@wdc.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: riscv: Add mmu-type riscv,sv57
Date: Mon,  2 May 2022 14:50:13 +0200
Message-Id: <20220502125015.1345312-2-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502125015.1345312-1-niklas.cassel@wdc.com>
References: <20220502125015.1345312-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_055024_271138_3D04602A 
X-CRM114-Status: UNSURE (   9.64  )
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

sv57 is defined in the RISC-V Privileged Specification document.

Additionally, commit 011f09d12052 ("riscv: mm: Set sv57 on defaultly")
changed the default MMU mode to sv57, if supported by current hardware.

Add riscv,sv57 to the list of valid mmu-type values.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d632ac76532e..3100fa233ca4 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -61,6 +61,7 @@ properties:
       - riscv,sv32
       - riscv,sv39
       - riscv,sv48
+      - riscv,sv57
       - riscv,none
 
   riscv,isa:
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
