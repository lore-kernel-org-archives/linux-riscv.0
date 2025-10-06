Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29CACCD184
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Oct 2025 21:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4cWgLFuEIz1+Zrzta6djX2KkmWy3HTqT50NdkkGliP0=; b=OsfInKsdfDcWFq
	yETle1q3FPl22CZHWCz8nQ8o2KCzY0q/44eFGKfpPoHhv8uEL81OgmAR3xZfeUgFm+9gHBfwQMw1R
	+r64wFq3gt3cQfAXe3Zix1y64rs3AfWm3kS0cbXZEm6aBOfbTIcexh9FC8WZh3QIKwO1CSpH5YTGg
	xaNl8Oc9uSwxyYaHtBPcKiyQS+nBl81CkPEyebrPXs+BkeeN8DQ7WsLhaIRWax0tK7WoJpb11XOpj
	VLCllO0RaF+qTHcecvD2eSwnZh9L+qIR3VoWv04iECDpo1eh9CbqLySCWI2GkWIjyiYjgaOSI1OE7
	nmr9hbZS5XEfGVCjtxJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5seb-00000000pi6-441k;
	Mon, 06 Oct 2025 21:21:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5seY-00000000pec-2YcH
	for linux-riscv@lists.infradead.org;
	Mon, 06 Oct 2025 21:21:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FDB945E98;
	Mon,  6 Oct 2025 21:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CFF8C4CEF9;
	Mon,  6 Oct 2025 21:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759785714;
	bh=gNYHshhPBkImsXhFnyujnboGbeZdrhN0P9KOe+5Jyoo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Dk+2ogom/We9ws2EhoF0IVBKqHawSW2TzCmIOf45bhuE4NKjyHhtjJbRyvaOJVBLp
	 DIpWF1HJlJKpEdHe7kas2LGVU5hgOWbMJe+uFLkQ1Zy449LaU+JNrEpJUb8FoI/WnU
	 u1eS8eixwpBqN7F8t9JWVL05igOPJzaDNUVAV8wAgjhOXfyhGVE+6krlLTii8+PaSe
	 QG0N6Lj/+LB6otH9uf3LWPvXA+6XdVXhdqyTERxG7UUvwu9+4k25OlbdNmHpkorFlM
	 xTazwdieTjzqKdbEt9eWec01jeTD2KrDnYqtCmtZCTh3jT4bZOr2JnbvzI1Ec5iPA+
	 Z4i4VoVj0EABw==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 06 Oct 2025 14:21:44 -0700
Subject: [PATCH v2 4/8] dt-bindings: timers: Add Tenstorrent Blackhole
 compatible
MIME-Version: 1.0
Message-Id: <20251006-tt-bh-dts-v2-4-ed90dc4b3e22@oss.tenstorrent.com>
References: <20251006-tt-bh-dts-v2-0-ed90dc4b3e22@oss.tenstorrent.com>
In-Reply-To: <20251006-tt-bh-dts-v2-0-ed90dc4b3e22@oss.tenstorrent.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, 
 Arnd Bergmann <arnd@arndb.de>, Joel Stanley <jms@oss.tenstorrent.com>, 
 Joel Stanley <joel@jms.id.au>, Michael Neuling <mikey@neuling.org>, 
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, 
 Andy Gross <agross@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@tenstorrent.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Drew Fustini <dfustini@oss.tenstorrent.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_142154_682214_6653E2FC 
X-CRM114-Status: UNSURE (   7.53  )
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

From: Drew Fustini <dfustini@oss.tenstorrent.com>

Document clint compatible for the Tenstorrent Blackhole SoC.

Signed-off-by: Drew Fustini <dfustini@oss.tenstorrent.com>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index d85a1a088b35dabc0aa202475b926302705c4cf1..0d3b8dc362ba7e8d0ca6d0cea692ceddc5e1f89e 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -36,6 +36,7 @@ properties:
               - starfive,jh7100-clint   # StarFive JH7100
               - starfive,jh7110-clint   # StarFive JH7110
               - starfive,jh8100-clint   # StarFive JH8100
+              - tenstorrent,blackhole-clint # Tenstorrent Blackhole
           - const: sifive,clint0        # SiFive CLINT v0 IP block
       - items:
           - {}

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
