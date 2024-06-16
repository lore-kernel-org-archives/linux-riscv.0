Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAC4C27C53
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2024 17:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T9Euy8u4rG1f7XYgNwBlROVBUaw8rrsWEl98aVxTkm8=; b=UVKcF12iKzJZJq
	0XGQv4XemYdY4VB558nSHG+4gxLWBRA2LUekM51j2NdSRpZCnSUput6/07z6VS+XiawbeJl8TI4h3
	mZXKRP+MbZJv/sD+6fBoaFY/Qc8i/scQW6fidcpPlKJCo5Wq9lJ84CEAPbmKJxYpIDeVm0omkLQCx
	TbCnfBveQE4T2gUVydF6ExO/zS+ZE+ekcBOAp/AmxVVgaRvPLztGRUD3mYIsnuTPD1q2TdmspjJUi
	Py+sxUodbtn3cy40AOOh/vPo1kTndVbB2KkeETBOfqwba2TeacH/8UipvpQG3M6Jwam++L2PILjLS
	XKgBQCv2wYhvsllpxaHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItZ8-00000007xv5-1KtX;
	Sun, 16 Jun 2024 17:21:18 +0000
Received: from out203-205-221-155.mail.qq.com ([203.205.221.155])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItZ3-00000007xrC-2WHm
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jun 2024 17:21:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1718558470; bh=ceOFvkqQuF3BJBqg7HHuf2dRny50kltfLRyQrgbV5Jk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hwCv2avquEdaRvbANtDMgwr4yR/6LCfpP94zlfwxGBhohIy8yfpWgCClG8sqbcsZR
	 xG1mUEr9BY3AmF9EgAQ5Kz1Uq26T94x3nA8/uLYknX+guNk9ks0oVvjedN+FNaABax
	 OJEYPfaL4wn7b/wmTQOkV6KysRt2X2W+sQrNEQSY=
Received: from cyy-pc.lan ([240e:379:2260:ed00:cd33:e8cf:d8f9:bed3])
	by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
	id 5452D659; Mon, 17 Jun 2024 01:21:05 +0800
X-QQ-mid: xmsmtpt1718558468tjw4ij1kg
Message-ID: <tencent_947689E304AE5A4C7A48682311DF8920B106@qq.com>
X-QQ-XMAILINFO: OKkKo7I1HxIeYsRDFAmm8SNIGgiuA3hspYtdkw9KJ2qpXlFjjasdXsdLmm6jdw
	 7yZH96i2B+zl8HYU5ArYhmY9X8f5uqPhq8AvPl0ZhdVEoHRrW782bG1ktVuaLwhIVzxw5J6kWqf1
	 HwSVYGE8RkY37yYhCbu8f7Ts6Fi/xvQSZ6XcnuPtLZ479UpvZVdmnlPT8N+TOU1p1OMe6kiOMH9Q
	 nZQqOOVIXxtwxcieAbp1J5Codyp44S2o5q42SJKDE6MrtuKTjqslBzdeYsK+UHTk82vbpN63UlpP
	 SO7So5P1OtvNcjJRyzFr5quXszph9bKkbum3vErCJInC+QvmPMzjAHZNDGKp8IICrfJBVm4kOAfX
	 VzI/vvApkXmgmixDXEGaL5WlkKaVnV2ovu37sCxfoxclaRS2hMGlK7npKLJIF1p7Pw5MuogERWz5
	 104DfLQrjqwwyYcSs2oR7m3UQ/FJA5nWTmqSUwvcjANSdP8gg4HgLm4fpSftzFvAsbn3Q4U89tEu
	 Z4G/7hI3ExXZnQGBrOWzkgv/0ytot5QNkyWCc43k2WQHQvXdHsd07hEoE7SlJoLyw2AStsdvqWxC
	 VLTPgR7UpNVuhO742Y6TNjltqwpK7l0dISX0Hausxkz7tsLzBpk1Y5+qyyOBHeT1PUlLY6GkGOoe
	 NVCUaES04CO9x8fekVlPeqLBfcrtNMWxYc9ylmFwdbDMVEhvo33cbpe2M3E0PzRsf3J4PwK8cQYh
	 z9vP//zBYvoCMjeQqAAlePXKPgW0oINy21J3QOgE4cUJ5i/XHRMktnsKpg/8X8sem5ui9WaTQqrI
	 7EFZlUfgpL8OYI30VRU2Rud8apbsclePYfgQrTtJqXjyb7iObxwHHX8MPKHSD6B2B/720/tUiaHu
	 hhcYW8Rrz3clx9WJutVKgKRzYVFz2eVpOEdbCzoooxDL9k3Rq7TgJMQGTDD8+b9vFGvcyUqPp6UG
	 u5Rxe4SPv3aVw7N/ORRLksGgAAaV6zWjvw0LDHbeViwe08AhLU43gPPpB9qEuqiEi+rOYrrdmPEW
	 UcuJQjh5dxumLtJBpyKoswi1xna/GIaiaTWlr5qw==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
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
Subject: [PATCH v1 2/9] dt-bindings: riscv: Add SpacemiT X60 compatibles
Date: Mon, 17 Jun 2024 01:20:47 +0800
X-OQ-MSGID: <20240616172054.3074948-2-cyy@cyyself.name>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_102114_061127_6FD18C9B 
X-CRM114-Status: UNSURE (   6.87  )
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

The X60 is RISC-V CPU cores from SpacemiT and currently used in their K1
SoC.

Link: https://www.spacemit.com/en/spacemit-x60-core/

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d87dd50f1a4b..5ad9cb410335 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -46,6 +46,7 @@ properties:
               - sifive,u7
               - sifive,u74
               - sifive,u74-mc
+              - spacemit,x60
               - thead,c906
               - thead,c910
               - thead,c920
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
