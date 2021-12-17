Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A796C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 12:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CMEZDrQZr3ih7eUuDejBq+rlJ43PNkIH/gTLh2FSPP8=; b=SgntqDzxTUNO+w
	QsydIZQHgtxyAmeAWqpT88apvLuBIwnbiFlt7L1UgWDUWp24GjF/7E2NsPJkoXAQoSDvYeRwNogpG
	YED5uAdn7dbHVBKl7FH8eSJoLKlosPK+KX2uj/qajVi4cyDLfVNgUWdr90+nyVLApgYbOEsyflCiv
	P76kFnL4xKFXZvyuYufB3dAChhDnBWqyJ2815gDoCs0jXPA60vJalyCGMkyRpBnvZqMbkeFtO03xD
	bGXwGh7ts+e/kf8GIeL01pb/Tkd+fGhWRE2pGNpAAPflL2VoD4H0mTWl7zz6Ht+QRJt0mH4z1TXQe
	l91yAUsGDjRu55MZAHHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myCRU-00A9zI-Gn; Fri, 17 Dec 2021 12:34:32 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myCRD-00A9tF-FM
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 12:34:17 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
 by baptiste.telenet-ops.be with bizsmtp
 id XQaB2600Y250X3001QaBzp; Fri, 17 Dec 2021 13:34:13 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1myCR9-005Yof-79; Fri, 17 Dec 2021 13:34:11 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1myCR8-00ASKk-Ne; Fri, 17 Dec 2021 13:34:10 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Sagar Kadam <sagar.kadam@sifive.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: interrupt-controller: sifive,
 plic: Fix number of interrupts
Date: Fri, 17 Dec 2021 13:34:03 +0100
Message-Id: <3af15b09a5f05d49e2d99386f189cdb13245d40a.1639744106.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639744106.git.geert@linux-m68k.org>
References: <cover.1639744106.git.geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_043415_725658_F7B42CA8 
X-CRM114-Status: GOOD (  10.35  )
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
is 15872 interrupts, using that as the limit would be unpractical.
Hence limit it to 9 interrupts (one interrupt for a system management
core, and two interrupts per core for other cores).  This should be
sufficient for now, and the limit can always be increased when the need
arises.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Rob Herring <robh@kernel.org>
---
v3:
  - Add Acked-by,

v2:
  - Split in two patches,
  - Improve patch description and document limit rationale.
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 28b6b17fe4b26778..0c6687511457413e 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -62,6 +62,7 @@ properties:
 
   interrupts-extended:
     minItems: 1
+    maxItems: 9
     description:
       Specifies which contexts are connected to the PLIC, with "-1" specifying
       that a context is not present. Each node pointed to should be a
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
