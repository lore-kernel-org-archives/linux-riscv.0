Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76082C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 13:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J9bHixIwomCMTudemzdMcjPyIqsh/4mbZ949b+DhasU=; b=s1GqZEYj6/DjvM
	ShSOftEIcf6Bfwb4oj3uSmFgOj4tkfM5RChvzIr+hNC0phSFQEIddSeaRbfzX760KDOUKeWXzHfSl
	g1+d3M6BDQV+qD90P6UtwOvRVDgObxRP4L9pPZ8kMlUK2INTSqKGE/MHwrtoBU4+VOP72l6LhGUNl
	5TsHsNLDNCiJ7zEoZDBUAK32BPHV6HRVYNi9EtUhjxof5JEx9zigfjMgERRiY/9eZUoBjZgyg6Za6
	fgTWvCdDg43Y7h38TS8l9LxrC+6Eabyonqrb4Fce5yTh+w9LYwtbH5JK6bM+Jn7SUNH5e7maBozV8
	3vcZqZ0y0mA0VtijXg6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxr8g-005wd9-EI; Thu, 16 Dec 2021 13:49:42 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxr0j-005swD-Nn
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 13:41:31 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
 by baptiste.telenet-ops.be with bizsmtp
 id X1hT26006250X30011hTeg; Thu, 16 Dec 2021 14:41:27 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxr0g-005QFd-Jk; Thu, 16 Dec 2021 14:41:26 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxr0g-009y1T-4P; Thu, 16 Dec 2021 14:41:26 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Sagar Kadam <sagar.kadam@sifive.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 1/2] dt-bindings: interrupt-controller: sifive,
 plic: Fix number of interrupts
Date: Thu, 16 Dec 2021 14:41:21 +0100
Message-Id: <41942eec41ccdf9831648c600d149af5e5f652a2.1639661878.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639661878.git.geert@linux-m68k.org>
References: <cover.1639661878.git.geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_054129_968747_7D664AF5 
X-CRM114-Status: GOOD (  10.63  )
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
---
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
