Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBE0C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Nov 2022 13:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dbyd9x/O9U+Fkpw0GuGnUXoifkLixAj+rT4EPCeYA4I=; b=hvclC/RFmJOlV1
	XyR3ced27fJW4fvt4dzOh/2M8SEec5y10FetNGfrjiM5YVzD+xI0lFuo3Wn26B4+tlBATszTcZr/A
	tyzhY6U6I9jwhKHEN0ogAJc+3gO/qCVrpysMfGq5uxMn2XrW6LYUN+gEkmdiJ77Ll0mcGB+yKF7a8
	Y6TrQF6t75Dr3nlau/mOBuxiURBzZb9bzPsh7r07jrG+u8vHE65Nd7zq70RSeV18Er2UB529sckjy
	pg2OtFOmhCorJjTDf4QNlbcQPaR7d/DaBGiKMi1V4jhqArdS+9Yxjr46dVD/sVV3JX/OSOt/oFq7o
	u0QmjQHhPIwDq4QZg0/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozHoL-00BPyW-3v; Sun, 27 Nov 2022 13:35:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozHoI-00BPvP-2z
	for linux-riscv@lists.infradead.org; Sun, 27 Nov 2022 13:35:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6FA1A60DD8;
	Sun, 27 Nov 2022 13:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C76EC4314A;
	Sun, 27 Nov 2022 13:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669556104;
	bh=g4LJwNon3ikj0mDiKpgNdJBJC8dWgZ0tmK3s2vZCTD8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jpO2M682vQ59NWqkX6C/C8bebtVTVE9tMN7m3DVqfwTJEMUHe76Q450KRtW9+EEDP
	 kp+JkF6gVBYtcBV/2OGtkNDp8Qd6fCNAdzzWbNPMreWCx7VebuoKTX2ytVyOh/M3JZ
	 w7brGzjj12WY1QBlV0HgY6GY129KZMbRbxmDT90I8SMB93tsVMarDW8J38Uoj2w19G
	 6OqlrcgPf8gzKQsNMrh3wZdTSfoYDPU1JxX6JmtnS1A54XxzPKPYKPG9UGm8K+TomB
	 29umEFMPipo6Tk89TitsHdQ6L8uQKxcx2makqRG93Ug4Y2vig1z5wjwYWFPv0fdMp5
	 axkzfNI+P6CGQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v2 8/9] MAINTAINERS: riscv: add entry for Bouffalolab SoC
Date: Sun, 27 Nov 2022 21:24:47 +0800
Message-Id: <20221127132448.4034-9-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221127132448.4034-1-jszhang@kernel.org>
References: <20221127132448.4034-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_053506_221983_BA6ACE86 
X-CRM114-Status: UNSURE (   8.59  )
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

Add Jisheng Zhang as Bouffalolab SoC maintainer.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 00ff4a2949b8..a6b04249853c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17729,6 +17729,15 @@ F:	arch/riscv/
 N:	riscv
 K:	riscv
 
+RISC-V BOUFFALOLAB SOC SUPPORT
+M:	Jisheng Zhang <jszhang@kernel.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/riscv/bouffalolab.yaml
+F:	Documentation/devicetree/bindings/serial/bouffalolab,uart.yaml
+F:	arch/riscv/boot/dts/bouffalolab/
+F:	drivers/tty/serial/bflb_uart.c
+
 RISC-V MICROCHIP FPGA SUPPORT
 M:	Conor Dooley <conor.dooley@microchip.com>
 M:	Daire McNamara <daire.mcnamara@microchip.com>
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
