Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E93CC48BEB
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 08:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5pXuubz4TWqjJOyBNkZTQm35VJkJkYAHzYaTIo4EySI=; b=0xAY7R27x8v0GD
	3yerf7dkHrvsU+Axh2IVxI3XNBmxXbtUTwCR7kG29hMotpaA8weRMwYR8awYDTwdpXWADopVO+MFG
	t4OpLEFPFUobnI8m09azM4O50QUS4PqMqGl/TdpLFMH2phiukqmtEkvOvDI+k+QqU/n9JUC6FuyHH
	kWFj0MuUmBc6C25GBWskVaV/md/oHE51tvX0RQy0mV9NgPrspOFenmtWR8KPbY3U/KPVEb2FBBfTK
	GvRYvKUGcUv6/zFNNuEXII6CXxsY+2JfmyG+X3mJHm/3beChGx3EyafO2FY+a8m8QUXAL36jrm14q
	JUuLcWaMvJhbK3fzuHRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd4e4-000000044d0-40Sh;
	Thu, 22 Feb 2024 08:41:32 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd4do-000000044PU-4B96;
	Thu, 22 Feb 2024 08:41:20 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 41M8eDoD074546;
	Thu, 22 Feb 2024 16:40:13 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 22 Feb 2024
 16:40:09 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <acme@kernel.org>, <adrian.hunter@intel.com>, <ajones@ventanamicro.com>,
        <alexander.shishkin@linux.intel.com>, <andre.przywara@arm.com>,
        <anup@brainfault.org>, <aou@eecs.berkeley.edu>,
        <atishp@atishpatra.org>, <conor+dt@kernel.org>,
        <conor.dooley@microchip.com>, <conor@kernel.org>,
        <devicetree@vger.kernel.org>, <evan@rivosinc.com>,
        <geert+renesas@glider.be>, <guoren@kernel.org>, <heiko@sntech.de>,
        <irogers@google.com>, <jernej.skrabec@gmail.com>, <jolsa@kernel.org>,
        <jszhang@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-perf-users@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-sunxi@lists.linux.dev>, <locus84@andestech.com>,
        <magnus.damm@gmail.com>, <mark.rutland@arm.com>, <mingo@redhat.com>,
        <n.shubin@yadro.com>, <namhyung@kernel.org>, <palmer@dabbelt.com>,
        <paul.walmsley@sifive.com>, <peterlin@andestech.com>,
        <peterz@infradead.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <rdunlap@infradead.org>, <robh+dt@kernel.org>, <samuel@sholland.org>,
        <sunilvl@ventanamicro.com>, <tglx@linutronix.de>,
        <tim609@andestech.com>, <uwu@icenowy.me>, <wens@csie.org>,
        <will@kernel.org>, <inochiama@outlook.com>, <unicorn_wang@outlook.com>,
        <wefu@redhat.com>
Subject: [PATCH v9 04/10] dt-bindings: riscv: Add Andes interrupt controller compatible string
Date: Thu, 22 Feb 2024 16:39:40 +0800
Message-ID: <20240222083946.3977135-5-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222083946.3977135-1-peterlin@andestech.com>
References: <20240222083946.3977135-1-peterlin@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 41M8eDoD074546
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_004117_370355_7CBFB1CF 
X-CRM114-Status: UNSURE (   8.24  )
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

Add "andestech,cpu-intc" compatible string to indicate that
Andes specific local interrupt is supported on the core,
e.g. AX45MP cores have 3 types of non-standard local interrupt
which can be handled in supervisor mode:

- Slave port ECC error interrupt
- Bus write transaction error interrupt
- Performance monitor overflow interrupt

These interrupts are enabled/disabled via a custom register
SLIE instead of the standard interrupt enable register SIE.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Changes v1 -> v2:
  - New patch
Changes v2 -> v3:
  - Updated commit message
  - Fixed possible compatibles for Andes INTC
Changes v3 -> v4:
  - Add const entry instead of enum (Suggested by Conor)
Changes v4 -> v5:
  - Include Conor's Acked-by
  - Include Prabhakar's Reviewed-by
Changes v5 -> v6:
  - No change
Changes v6 -> v7:
  - No change
Changes v7 -> v8:
  - No change
Changes v8 -> v9:
  - No change
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 9d8670c00e3b..6ccd75cbbc59 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -106,7 +106,11 @@ properties:
         const: 1
 
       compatible:
-        const: riscv,cpu-intc
+        oneOf:
+          - items:
+              - const: andestech,cpu-intc
+              - const: riscv,cpu-intc
+          - const: riscv,cpu-intc
 
       interrupt-controller: true
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
