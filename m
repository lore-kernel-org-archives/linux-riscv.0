Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3522C27C53
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2024 17:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qG1Ii86tafIxVDRFl3RyrzKIfwkGNbqncCE1lULWfA0=; b=MSBKIhrcAGsxhi
	RzhTd4cDwea8AqX8+qHpkong26G8KwSqmQDux6BUKgns7mD3OFRkfWT1fPFznCIjA/kC/dNdw5I5m
	JljHr3DH68ohMeV9nVQTY953SC+L2NrD10O50t6ZGIYKf2e/v8HtQAO/RiRisw2F8SohoPm/09XT/
	tHVxd+5q+uG7APxrCfyd1dXXrdEmncNAcsBuuY404ckTw51bRGMgAEXjDy6ERw6wZMlH+cAxja+fY
	zpHDDsjHcKNVWgnmzmtIyOtxu5DFc7DXhjaDYb/hjISa4pE2zaDPz5Q8gaszIN1BjF1LS9Oq0wnGF
	RiWUVSPz5CQmhaIjpyGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItZG-00000007y0p-0QJi;
	Sun, 16 Jun 2024 17:21:26 +0000
Received: from out203-205-221-240.mail.qq.com ([203.205.221.240])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItZB-00000007xvq-1T1V
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jun 2024 17:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1718558473; bh=h/Z20p48DwZNDsPa9mj4N+VQ+bYpq+oeTefGgtOFXe0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=xykLnlL0jWrga/A98t+1PB0gzWKBylzPqOV2TSX0wW4+Q1c5U+gbKW1fzRMyKw0yO
	 U0t7NqgII8BnmwG3auCHYaeHuKvMm3p+ir9lajh8IfGhg8KX2hw0mMKqF2X1J1JGlh
	 JSEvklVAMCKEA372a042Qm/djX1IzM0FjFgvkMjI=
Received: from cyy-pc.lan ([240e:379:2260:ed00:cd33:e8cf:d8f9:bed3])
	by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
	id 5452D659; Mon, 17 Jun 2024 01:21:05 +0800
X-QQ-mid: xmsmtpt1718558471t1v0fym5a
Message-ID: <tencent_2A51312A21F88DDB7C7D82A2DA8E8EE7B808@qq.com>
X-QQ-XMAILINFO: N7h1OCCDntujnNRNhosd+oxF8Tfn/AXML0ORtRxyI7ZEAXUfM26vh8ag8gCooh
	 rWa6l1LjZrVbdg/fCX2UsQIeUtAQNCVklDR3tjflLhf1pRXgMo8r7uFeVwHj5XYOS0t9ZVe0/CXl
	 0tDMZ+35M2HsT1aVGzKfT/OCdwo0sgmDmZ3S7WbgiVaZ1pbp5Ny2OHHUungOjhj6B8OoiUciPoz6
	 GxgRw4wn/JxB900WbKCFQsnMp+eRLBTchRSX1xnsDlhVw9ifu6436mP9/SjJO1w0lct4yd9KwfN7
	 SRySjU4E139y3Ba6sgoA+yaoU29sqliO+lU2+6p0Er7RMevoQaLBDvWNDsA/43h5hgXhz7rWld+o
	 YcYrUpLt7qzInthHD7KyOsBC5273ltwWA16781GrU1+haXF24jMxFjRAAjOuJ1iza0r12SR4jMBo
	 BDtDIohbYRDKLDj/dbbnNbjbwesJO8hTwOVKemOzMh3ivPo61eT5rZwt3vXztth+BJM8HmmMe5Ql
	 jLsEcky/pBZ2MWFfvaVs2jzGyRh5ocjvPgwalDB0XKKJ1lm6ohB5cjcB+OioskmNmAOzhCvcZ37p
	 TIZA86YGb2axLzHmKLCuOtij9TIo/EEwBEn5h6V1kvR6kQbzVmJSzhiLmuscL0pYLT1Zx26kUjgD
	 rNjYnMUu2yvp1sKZ62xOl119HhbwrpI6paKK5/iPT2eDJe1DYnWCPYCNDJ9Yoog9U5QnTB4fklYJ
	 E/9bLZtQUWxqvntGIAeayKlNmkyLLJH1ZdHgG9d0IzolqW23WTUKcqYHPSJOda04P6idFo9IRjM4
	 n+NHKG0G7A11MgAYAG5EcdQ1ieEfRnfIu/6eMzRLhbwVom/dXGU5LnTe8Xu28T1Lo6LQFuBYjxSM
	 Tx+gycwKmjPu/aCjes1TecKROjaJfv3xOdygX1L5DUqrlk8YVpnRVaTyd2cuD6RClcRzoFHA7Qnb
	 yMjAzT1c+OPQ7p6BwB/4LlJSkKZX6hm5abO9t4fn8fk7Ln1eLu42GdWVOo2syyz5lAUZZlmYrWoy
	 MY14PVZUJzsrDtyb4o1C4SFSaF2ZcCWJytbYnxPQ==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
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
Subject: [PATCH v1 4/9] dt-bindings: timer: Add SpacemiT K1 CLINT
Date: Mon, 17 Jun 2024 01:20:49 +0800
X-OQ-MSGID: <20240616172054.3074948-4-cyy@cyyself.name>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_102121_736895_5088BF70 
X-CRM114-Status: UNSURE (   8.16  )
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

Add compatible string for SpacemiT K1 CLINT.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index fced6f2d8ecb..860cf6a96b31 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -43,7 +43,9 @@ properties:
               - thead,th1520-clint
           - const: thead,c900-clint
       - items:
-          - const: sifive,clint0
+          - enum:
+              - sifive,clint0
+              - spacemit,k1-clint
           - const: riscv,clint0
         deprecated: true
         description: For the QEMU virt machine only
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
