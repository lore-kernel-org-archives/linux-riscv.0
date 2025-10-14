Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7578CCD18D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 03:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U7bM9teD6qj3A8UExXc4S5kTyF3OosmoNbwObp4qfO0=; b=bGJg267U4laV9C
	UqSC/ghhUFQQNvdgHSPlnhW2SoWQikqXFZ8hqp0+lqas6K9HVc+8FCyL2PbqY1o8xrAmJ2T3BqygQ
	NfVP4qa5B+u2I7UQXW1Ia/ibgfk1gRd/+m+kmz+VNqjDuB19irZQnQSnnQj44TdnaIIbLnccP1WKg
	m69aSzPW9EWlHIMeMPe4djtJvWSJvbH+7kM9pf5RXS/TgNKnI4zSPygcJeYhnzTlmNEHfQWba1sfs
	Bh5Sk7pne1wIiQmfvN5K/9nSrI06ZNOj+UyqoBkJXKNUrlPqE9gvzPUxuF3srXbBRHkMyn1G32BVN
	0AY37fxS1rXcY/RSHraw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VSb-0000000F1GP-0PHG;
	Tue, 14 Oct 2025 03:12:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VSZ-0000000F1Eb-0ejy
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 03:12:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D59FF45C1F;
	Tue, 14 Oct 2025 03:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9398C19422;
	Tue, 14 Oct 2025 03:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760411541;
	bh=Wl8ZTHg5stOwe+WQ7WFdplzC0h58N4FuSj3zEehF9Xg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qkbHR7kTwiXYWvQ/fqj9y5/T2xFH11ApqwV3le2acP+rBlVlsz6yhj3XtmZ2BqTVY
	 inL5VcNcNrveffFMR0sYm32gZgr+MW9TtSilPvPoS++y5WlRM0caIxQD0y0ndeAVtL
	 muBruj/y6CEVxVgAXwu4ZHGommIVioG0YkJTmlKjO+C9gV910eoZ4vv8tY2FGSD+KA
	 L2Pe/RtUuJOURIWlaE5vXfPDIlU4pcelXSprDdhNvd+7CyZyQJw/er8QRzTd7NvjMQ
	 PPHO5dp1f5HJHbtQawmcz7CpNAirurNb5hspUPmYXkEzHMmiiG2e2s/IAG5g5NnJEh
	 zD0skIu+s1RIQ==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 13 Oct 2025 20:11:55 -0700
Subject: [PATCH v3 3/8] dt-bindings: riscv: cpus: Add SiFive X280
 compatible
MIME-Version: 1.0
Message-Id: <20251013-tt-bh-dts-v3-3-9f058d4bbbda@oss.tenstorrent.com>
References: <20251013-tt-bh-dts-v3-0-9f058d4bbbda@oss.tenstorrent.com>
In-Reply-To: <20251013-tt-bh-dts-v3-0-9f058d4bbbda@oss.tenstorrent.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, 
 Arnd Bergmann <arnd@arndb.de>, Joel Stanley <joel@jms.id.au>, 
 Joel Stanley <jms@oss.tenstorrent.com>, 
 Nicholas Piggin <npiggin@oss.tenstorrent.com>, 
 Michael Neuling <mikey@neuling.org>, Michael Ellerman <mpe@kernel.org>, 
 Andy Gross <agross@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Drew Fustini <dfustini@oss.tenstorrent.com>, Paul Walmsley <pjw@kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_201223_219821_07D19839 
X-CRM114-Status: UNSURE (   7.44  )
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

Document compatible for the SiFive X280 RISC-V core.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Joel Stanley <jms@oss.tenstorrent.com>
Signed-off-by: Drew Fustini <dfustini@oss.tenstorrent.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 153d0dac57fb39d39219e138792f4cb831cb88dc..afb8533f6a081bd9b91e13e30185f99ec2d5dc3b 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -70,6 +70,7 @@ properties:
           - enum:
               - sifive,e51
               - sifive,u54-mc
+              - sifive,x280
           - const: sifive,rocket0
           - const: riscv
       - const: riscv    # Simulator only

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
