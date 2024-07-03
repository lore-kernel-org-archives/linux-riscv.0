Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB5BC30653
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 14:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJ+pf0tN/aoL1S4XaueER+9LoaCtTs0tCCzOZGUaGtM=; b=K235AhycsYBaW5
	WMl/G4J8R5fnZfK1xUAGgH06pC1oT6d9Q9NmJo1V7PCiBbgGReYRTgagNAYJ7uNXkyPW+DJmrCJRK
	QqETDHb0tZfnLvlphQO/sHCfRIKPbV+pzzPihQfJOXjr2vS7tfWs58lioqfVwWLyieCsLXYIb2CtI
	RKpLec50NuL0UsxJ+i2bmf6t8a/XgShk+qbp/7yH5USQiSPCFqiqrRpmQ6v5XWgvBRrAhTJ/kgEyf
	473W5sX0QfWJ/NONmQOg7UKGjggnoWajKdA/HozYYIDbCE7sumtf1zfK0S+Y/IhVmU6Ku4qYZfGkC
	cufSk0KpbuX9oALC5wVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1Ph-0000000AYk6-3bD7;
	Wed, 03 Jul 2024 14:56:53 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1Pf-0000000AYiQ-0zgR
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 14:56:52 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 03 Jul 2024 14:55:05 +0000
Subject: [PATCH v3 02/11] dt-bindings: riscv: Add SpacemiT X60 compatibles
MIME-Version: 1.0
Message-Id: <20240703-k1-01-basic-dt-v3-2-12f73b47461e@gentoo.org>
References: <20240703-k1-01-basic-dt-v3-0-12f73b47461e@gentoo.org>
In-Reply-To: <20240703-k1-01-basic-dt-v3-0-12f73b47461e@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=904; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=93gTwTFhHhqvEXaieSxNaeTfBJ+zIc4/WjCpYTUJ8uU=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmhWZ6BOWdLH/QLc/royb5wev72rML7G+Ho7uFl
 ROY8K15QEuJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZoVmel8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277aNLD/wIfqDJLqXrGyCjcv
 DIR6Gl8JStyWL4TYkpc8T/hIfXyubsyfvFb0KYM9IDwgAiituHgIFk8faTZVxi45CXxwipZCfj+
 kTJ/BquGC6ycknuig3AqjKY+UcIxE+mfQrQtez1VPqh/CVY03Cswk3a+85NpaWUUkPaq1z8JHYD
 JV2CMsf6fZAx3K5cQx0fICNU6gtHLCJFGyQwi4vzO7dqhx9WOtl0lLsKL6iaqJwqqL/Vw7iYiNj
 8boll3lynP7TFkUM3imeZJLtoviIwl8DcvMr4ffqNUvFBgcCoYRcd7EhrLrKCFSZso3n/qetVhg
 3bwdgVvEWvFFEIuG2HIn/H1YCYjHnwQ9z0EnkbDgoHW4TabapjOCctdEvi+EtOqunJ1+OOMZV02
 5oSLLpHhfgQ7A8tMAUNZOoqjEM5MzCz1ev95mhlMKbXub27pHcaBQpWggb30usubOZ5ymcnMT1h
 zmqpsp/ChcvId6BPhIkVoEKfpSsjxhxpWFwb3Sccd5DhrEKV9K6IRc2q09aw6wxWAWFmkqIio2F
 CAHuzvEIpSVMXhp+M/AWm1jJQZK/DX+7cwjzo6X3pQP4PehXOzVlU3weN/Wu8Y8UFREZCVtUWXx
 txKQLH7s39LfyBbViP9/09KYC1lQxOuiEPnzjM93OWZPapbfVIklgLSAL8REWMe2nGDw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_075651_458642_E5EB9D93 
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@outlook.com>, linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Yangyu Chen <cyy@cyyself.name>

The X60 is RISC-V CPU cores from SpacemiT and currently used in their K1
SoC.

Link: https://www.spacemit.com/en/spacemit-x60-core/
Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d87dd50f1a4b5..5ad9cb4103356 100644
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
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
