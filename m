Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87D0CD11DD
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 12:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W82Cj38OmzPqDpetKcV9bENAhJftZpwLGN9dxKUMRws=; b=41Fcv4cKZnojQb
	uwVNCmuaYqEenyp+QzW26IVzH23ARq5btRuV78Cq/sApaoxz0dhYEBr8rvR7jozoYjZ8UA3X3+ikP
	1DrNNwVn3t5OE806/GXutgOWZkKIlCFwh9/kYjSNeyojvCBbpwuLB07ngmQ9jfrSZ5P6CkNOLviEp
	SbL55+MpXzmtsg/AN5M2sTQkfF7kQ8z8Cu5QltFoLHyr0i1taKlZiYB8Bc9ZCKR5VNnCl4NinqKyl
	jsqw94DiRsvwggVoezAT2lIGg8xtMclXrkOfCO/4kxvkdrLh3g+DGXFOQhmGo9CYcIu4wmLaFu3rI
	io+n5fuykb0wqWqHOgFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro0FB-0000000AKeb-2CWb;
	Sat, 23 Mar 2024 12:13:01 +0000
Received: from out203-205-221-221.mail.qq.com ([203.205.221.221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro0F6-0000000AKb6-2ViC
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 12:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1711195962; bh=GtPTI8Yys2Opga/0sm4OTBYHCoOZG/cPKGGmNpGSVMY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d7a0vtx+YFst6K5J4oakR5Lv7q5OUjaQFSsPtt4J0C9ki4JHAA+FtIW+bEAG+qkjx
	 OQwS4t19DljgI2zTLuqvk9jvt1f6hcrTTOkyeLAPoSCRQr0s3CgD2cGAAsvzdIQpVd
	 kj6IElAGQfXzD383uQiOiMJYWXHOEBKf4mnNw0g0=
Received: from cyy-pc.lan ([240e:379:225d:8e00:b91:b2e7:7c69:8554])
	by newxmesmtplogicsvrsza7-0.qq.com (NewEsmtp) with SMTP
	id 32594C7F; Sat, 23 Mar 2024 20:12:37 +0800
X-QQ-mid: xmsmtpt1711195957telpxi4j1
Message-ID: <tencent_7B2FC4BB51846F57B042FBDD710DF7306605@qq.com>
X-QQ-XMAILINFO: MmpliBmRb3iCDSzsEAV2QCRQjRAFk9o+8r9VM5Zg5peC8KBDAe+tCwfmZFuFs3
	 87mjOAZQ3JWiRJZuNzVyBHTZW1AvYFLpr3X4rBcZHJWGRvkfTYELoIH1xgHhnfxZaik2cQpnYTYI
	 h0GCf4o71ynN1usGBQncedropdAUfM3bpUiAqRIGbmVwyIEs9TUqw3ntmq6qEY/he29XKcpTXoTx
	 kx0V1AyxX4eu5o/v2mD+OrtNXjgXg+b0acKFZuZ7Vpdg990NT+Qx5CSX8XVPhcrmRtulwk2xov0N
	 E6MSuRc5ftBB542NefvPqhbxOyjg17N8RELxE8PudXbyYzVr4niRul17KFLT8zX6zIzfmfbAUBRo
	 WDca6iiyZzxPGcs8AnbhCOQPKJPLGi4FKPQ7EI5fCy0tIR4oC6krBumeAJ8I7GRzTJNwQKtWa7rS
	 gpwCHoSlfZrvyA4Fj+UBJt57Nn2LcR2vP9JT5qjMsg06LSUA21xjX/Q4A1KWHLCfuSdaVy3EL0Xn
	 lZTaI5DRjy74neDRw2nM+PycPmy3MnaS42sfdrDoQeyS5tsBeUnUgVNDr1DKL5ok8Csu5vntkvuG
	 I1IrTfO6OPoy9buA8Yd4z89YgT5yOvZxqMpoqtgrYdbaDykOIRczdu5yQQRUglj5KRqEUhLkEu3A
	 MDiRJ2IoQTAHKZv3IlSzEXUTPZoesnawQQlelDmsjRbHprA8baXz+vPGA20A2znf80XL65Conmnu
	 LarJRSjVfndi5X518LGk5C8PcPNTkHJgniD0JMQ9CiYlL18tKsL5Z6d2VL46l+jpLXHdcK9Xk19H
	 e0V+nAPi/598WfDVpw9qgGQClPSRRo9nCLrmp6gp9wyKmA6NIKeZEu+Ah0tHaZmd+gSgwI2pSWKI
	 djFNfAzNssZK0JaSi0c1Pyd+zpUNdMp9ZMBsRa7FmkdIqiOIGc8FOZEJHWA+KvzdZewLBW5ZN4xZ
	 s8XzeHPuKCRdjo3mHBkQre8IVOmW4w9FLh7v/4vXUy1y/ED7mg9v7jTCr7Kg3CEmwmG/9M1I3fsH
	 su2u152ZYCjkVsRJddiuCDpuWzwZY=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-gpio@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 01/11] dt-bindings: riscv: Add T-HEAD C908 compatible
Date: Sat, 23 Mar 2024 20:12:13 +0800
X-OQ-MSGID: <20240323121223.1729328-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
References: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_051257_048163_1FC57E13 
X-CRM114-Status: UNSURE (   7.27  )
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

The thead,c908 is a RISC-V CPU core from T-HEAD Semiconductor which used
in Canaan Kendryte K230 SoC.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index b252c3966b8b..02f939449e54 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -47,6 +47,7 @@ properties:
               - sifive,u74
               - sifive,u74-mc
               - thead,c906
+              - thead,c908
               - thead,c910
               - thead,c920
           - const: riscv
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
