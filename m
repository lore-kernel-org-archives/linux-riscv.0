Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966D6C7EE2A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 15:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9I2szBUMjtJh2/nMndo0+7PjDJZ/L6MRWFjMVKLbvRM=; b=ayo0asRXOZED9w
	cJEr7cmJ0ZweZ0ilzBa+R4KmW+qyc2dif6vF2/0qrBtm5u9thCJ499qKtiA3d9YfB9MSPVV+weFM3
	hyHiLrXc6ME6bom2CpvKSwKsr4Jbtd3j3gJ6zho/jA0Hyv2mOC7O+IiRT36yP7X2BCHxrz7w1TVM0
	PcJnGIK77Twa1aKQ7m9LbwKwBraG1sdmyUEIYmq6fP8homvubu2bmrAArAis5Gi1KRHPbwJ3DPFJy
	sDVXadlw5lW75C2yr/LCM0cPaqRvPB84KIw87mHSFmOWGgVKuzf28z5CPDP1TOasSdqeXV7/fXkzv
	in4tK7YGQPQL3REOExAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzfdo-00DJqv-2c;
	Thu, 18 May 2023 15:34:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzfdl-00DJq6-2B
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 15:34:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 375CE65031;
	Thu, 18 May 2023 15:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D11CC4331E;
	Thu, 18 May 2023 15:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684424044;
	bh=KhFw35m2V23D8HN1ygBHKhI3EF8W0NOzCuztPIKnTsA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eA5EP9a1EX/AL2Rh89oknsf07RsvGhH0fkq99Wh0HqheV9G2opvXh8AM1iH+9Hk0t
	 5cxAavTGlnMBVhWpZ1xdTQq2+RzQoeFcOF6K4D8e55+z6KxUsNdH9r1zIyC7arsXZz
	 xADm/rl5Yt96RPBn0sHDazRCrtRqHuUQNHMRtxLCqq5Zzlgcwy91f3f1DOjKeTH5XZ
	 VJDmoiMdlon5zkAcRRhzW29xrKUYtCXe+Pk0o3emqgHlldE7oFRVNgL2C+kA+FQ8zb
	 Rewx5sL4c3kLfMHVl/1jlJK/6Uf3J1fPqvz/jUJfCkXZIjLdatRL7PcfyBM7LmrGTP
	 m8B7xxb1Fetlg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 02/10] dt-bindings: interrupt-controller: Add bouffalolab bl808 plic
Date: Thu, 18 May 2023 23:22:36 +0800
Message-Id: <20230518152244.2178-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230518152244.2178-1-jszhang@kernel.org>
References: <20230518152244.2178-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_083405_755975_095A343B 
X-CRM114-Status: UNSURE (   9.39  )
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

Add compatible string for bouffalolab bl808 plic.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index f75736a061af..3f9439b0c163 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -65,6 +65,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-plic
+              - bouffalolab,bl808-plic
           - const: thead,c900-plic
       - items:
           - const: sifive,plic-1.0.0
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
