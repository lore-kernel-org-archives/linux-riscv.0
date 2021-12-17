Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4867FC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 12:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OU/wZutDbdT6bjjoMWXGn8HseggV2spqjeSiKc/yfUg=; b=szYtIUTQLS7Hx8
	aIaG/5+74bdkYQ1NTHFIB3CXut3+qNrEgUv6adI4D6HHCiG1W113NWuD2usC4OKv23/EsvigLKyBP
	IPYD5ingNwrvqyRZvy4T9RxYDvL3PK6agZpCQ2GlZy6AXBF92ltj8J5uvDkdPYvi4BBjTte7l84Ml
	5A56OLEh4xDk46P7dgIzvOQjoSq83cs6LV2xS/81xQgbNivDwpq80+KAtmanNP7woJuPRKuhi4QqV
	whE4h4h6/7987wQ9kChEfHlLTCd5KcmMV+MvG5J/aPMq2iEQLHEXOb/aFscB3Ei3YMY47pEbaXK90
	7spkM9ueN9EK+7fg6lWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myCV7-00ABBN-W1; Fri, 17 Dec 2021 12:38:18 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myCV1-00AB6l-SW
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 12:38:13 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
 by baptiste.telenet-ops.be with bizsmtp
 id XQe82600R250X3001Qe9YG; Fri, 17 Dec 2021 13:38:10 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1myCUy-005Yqj-El; Fri, 17 Dec 2021 13:38:08 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1myCUx-00ASTO-Ut; Fri, 17 Dec 2021 13:38:07 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: timer: sifive,
 clint: Fix number of interrupts
Date: Fri, 17 Dec 2021 13:38:03 +0100
Message-Id: <4f409ac939e260a4657a0e6e6518ef8736527822.1639744468.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639744468.git.geert@linux-m68k.org>
References: <cover.1639744468.git.geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_043812_095643_7CF7E219 
X-CRM114-Status: GOOD (  10.02  )
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

The number of interrupts lacks an upper bound, thus assuming one,
causing properly grouped "interrupts-extended" properties to be flagged
as an error by "make dtbs_check".

Fix this by adding the missing "maxItems".  As the architectural maximum
is 4095 interrupts, using that as the limit would be unpractical.  Hence
limit it to 10 interrupts (two interrupts for a system management core,
and two interrupts per core for other cores).  This should be sufficient
for now, and the limit can always be increased when the need arises.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Rob Herring <robh@kernel.org>
---
v3:
  - Add Acked-by,

v2:
  - Split in two patches,
  - Improve patch description and document limit rationale.
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 8d5f4687add9e81e..b75fd6f982b1ecb3 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -44,6 +44,7 @@ properties:
 
   interrupts-extended:
     minItems: 1
+    maxItems: 10
 
 additionalProperties: false
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
