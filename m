Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C26C27C53
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2024 17:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PMOHdLr8ZMkZh/vbWasV5qiwkR/4nqcmrh3hkTu5dRU=; b=JybGWYqwennMiZ
	ldEijxdUmRl6TGcO+KnKil09wS9VGQxwqgXh2Pmr0/AadobpgL51ybEvDLt7AsgIKLRAHpkSWhfkj
	C9UGXr9d2FwR8jGfNoXk7ANM8nJlKh6UvmxTayEEmpgmXBksGti/m+bl+oQU2wtli2SExXPmZBzQD
	6JtS2KLRfwK86EQpUwIRUAdoVmH2uXh/FBgu2ySkdNWnITGhVGynE+i3O1WNnj+xdMnSeUWRYn2MK
	qtX11T9uSZ6Z7l9MHOU7qA3XAWha8YIO8NowyF/rWmwEx3wpQmGla2hjTPtrhY+h1y+MiPoYPJ8ui
	4lDZ98K0YqmLB+H032Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItZJ-00000007y3o-29jC;
	Sun, 16 Jun 2024 17:21:29 +0000
Received: from out162-62-57-49.mail.qq.com ([162.62.57.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItZA-00000007xto-0dc7
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jun 2024 17:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1718558473; bh=r+q+AS8zVNgaO5tjAABF3jjVaLE+56ZLraN0N9jAFsc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J3Q/40lY6wRmWhrgDfDC7ab0pqQebHp4lGfJsatfnjXuymfJ4xiLS0fmp//mdcmxb
	 CSReHEJN4n3bW8HhBgAAryGoPdOlXZ/dlvYHQ5DMZoKpT2aJ/CUN+MqEX/ntPrOkM0
	 joqtjVZGdti2uWj9AQEWurS6t7ZnSjNDGHcHk32Q=
Received: from cyy-pc.lan ([240e:379:2260:ed00:cd33:e8cf:d8f9:bed3])
	by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
	id 5452D659; Mon, 17 Jun 2024 01:21:05 +0800
X-QQ-mid: xmsmtpt1718558469tvh711cnd
Message-ID: <tencent_D3577BC67116D732862BE4A7B187EF4ED005@qq.com>
X-QQ-XMAILINFO: MFWpArBVhhGTvYuSpRDZ+TOs9ZidMP4HTE29pb1RTzNe4ftOZ44i/dKoQURc49
	 lp32wJdjjAcS+P00s4XeQDmzVhuwbMvAh+M2CTDGBlj8FPftYbUbLc6j+tbxQMyYKzYQfnONNK0P
	 HrEN9VoKfvjKrrJHMYJzXd5DWuBsVcw43zMp7EspUesriYk3PFzTU9lpPKcj/A3I0hMdqWZWc34h
	 G47p6mDORN40tJVfe+Vz2xlkFppyd+iFr0It3zDr4AEY9oJishCn9TZNCgft7TAwYDaUtMd2RNnk
	 2tTMEQqRSvmmtA4NND2iKvteZsMHkFHW6HGqgvH3x+F7iTxGaz8cipzRNGoVteNkdq7VoeuI6hJy
	 v2Wre3Se2UAPOiZYxDbafbKNSlkKR09u5jiKmOjs/FgmCdH9owftTYLXAnsWG0dm8PWzKmpeyzw1
	 izuYfMKXk7J7ZlhYfMN9pd1bGMMz2US5O4AAAmFT/8Czi6PaCHJIWIrpr+VVrtH6nLwwBQ+sSQ/0
	 2zZ7Sfkc8u3HIX1T0u8vRFEZe3I43CXZTXJlYvwVjox5Ej3c31Q4hv7rH++n2uJaA1RUrugcl2kC
	 W/HU6RRufYU84HnL4+YlhJP2CiUhsTawiUkeVR+oWqGQ2Z6L5qrNUxBT58Ba2WCsicKCfWOID04P
	 KkcXyNjYLu67aiKDG+sDj+cuYiCMN7brQLIrwZMExg539/d4VXpomaN2hhrrnMHx1ZFIltPhKS5L
	 DGZck9cRRoTbZSRoepWJVVAzhGAdgtAZzTeQHXHEHIgq3TbkmfoMhkQPqF6Axd3nu8fkq48Czgw6
	 ywLCCAlpsLiwE8nsH/qpFI8lqc+BLBA19dC12RkMiohmjuEHUhDTkzZUJ0+g3k4F8w2/AU+h/imc
	 Gq2gqsqMvJuWFQtKGB1pReYho9kF8OBhx/69zgrpLwkJpOL9qcZguWs5w6gVhvewQA9sd7BnvVWi
	 5mXlcyc+hregkJ/x5xKEvqab8C9jVbg//f81U+B91uUPo+ohoTNGGhdChZHqc3diWZVzHpf3nPu3
	 aBgXVbaMP3jdHT2r1pxyWjK1JZ6hs2ayASvUnjS2+p4iEMGkU5e+VPeIXgz7M=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup.patel@wdc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v1 3/9] dt-bindings: riscv: add SpacemiT K1 bindings
Date: Mon, 17 Jun 2024 01:20:48 +0800
X-OQ-MSGID: <20240616172054.3074948-3-cyy@cyyself.name>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_102120_918624_BC361AD2 
X-CRM114-Status: UNSURE (   9.30  )
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

Add DT binding documentation for the SpacemiT K1 Soc[1] and the Banana
Pi BPi-F3 board[2] which used it.

[1] https://www.spacemit.com/en/spacemit-key-stone-2/
[2] https://docs.banana-pi.org/en/BPI-F3/BananaPi_BPI-F3

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 .../devicetree/bindings/riscv/spacemit.yaml   | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/spacemit.yaml

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
new file mode 100644
index 000000000000..3b151fd02473
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/spacemit.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT SoC-based boards
+
+description:
+  SpacemiT SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - bananapi,bpi-f3
+          - const: spacemit,k1
+
+additionalProperties: true
+
+...
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
