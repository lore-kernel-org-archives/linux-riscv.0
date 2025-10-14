Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600BCCCD185
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 03:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rc0Q5yLVn3Yn+txSwGVmc2rt8I4BCllaxAk1k63bJvI=; b=YbdBJaVfA3QeMO
	CqIe79gQ4QKnyUA2I9M5kQHZ5cELxs0XWaXTb38w6ZnmyQtLfhp3b02q4A/CVUgaB3zylIzU1itdL
	Q6Wg9zuRFDV2zvighDqyfGaZ3EGdGInv3nv5uVxZ2LCvDlvhXYrG/ruKkbG07JWpMN0fLUB62Jh0S
	QC+3AxQdvnb1fHTGwPAo/3zV4YhAsPY8TCVLs4xx84ELuQb8MS2zUi8XYiZz+nIJo0VLZB50iLJrm
	pXe1hFW/xnxn2FEYzxUr+Jfcz9GwPkXb6BdayRyC5H8SA9H+CIGZxVRTqiLiFVZmR6+b9IDC5Db6+
	xs1EiVwrtTRjzvXGrDyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VSd-0000000F1Ip-3Egc;
	Tue, 14 Oct 2025 03:12:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VSa-0000000F1Ff-14t7
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 03:12:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EA14243D42;
	Tue, 14 Oct 2025 03:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8DC8C116C6;
	Tue, 14 Oct 2025 03:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760411543;
	bh=cYt/1H5KZmPaIkaj1fyz9BSzaYf9P5vSg62AHRDKvwM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BWKjXaexVqj8Bcmsk5LKUhpE0It/84OYL1bN5vgzgHKCpGFdZYdQNBPm635U8xebB
	 vCxjvR52e1HVnc1onUBvEMxPRAbvtdmxMGVjy7sdvmudaMqaiynQuL+9gVZab7oqI7
	 rWnKq7PP7+w02+obUmFGtS0l10P31bofgJ9x2HtpK5kRk0qYANHuXGFHHGRCe+2pJD
	 ugbmZ4rRGUaEgeYgQIq8dtbpoNZG0eVep8u3XOYGQFTqZTRWkyB0eup6RJOYL/JUKf
	 KbGkWL2n0yeW/XC/n3Nx7uOF3FMiEDe59617UtZbHw+HObxdImwo184msr81LsJalS
	 3XhIxauylno4g==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 13 Oct 2025 20:11:57 -0700
Subject: [PATCH v3 5/8] dt-bindings: interrupt-controller: Add Tenstorrent
 Blackhole compatible
MIME-Version: 1.0
Message-Id: <20251013-tt-bh-dts-v3-5-9f058d4bbbda@oss.tenstorrent.com>
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
X-CRM114-CacheID: sfid-20251013_201224_321478_1656FE69 
X-CRM114-Status: UNSURE (   7.56  )
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

Document compatible for the PLIC in the Tenstorrent Blackhole SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Joel Stanley <jms@oss.tenstorrent.com>
Signed-off-by: Drew Fustini <dfustini@oss.tenstorrent.com>
---
 .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index f683d696909b9da302c53a64f6332f6251705c0d..9886b7d73d3c4987a5983b2578d9f17539b7fd25 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -64,6 +64,7 @@ properties:
               - spacemit,k1-plic
               - starfive,jh7100-plic
               - starfive,jh7110-plic
+              - tenstorrent,blackhole-plic
           - const: sifive,plic-1.0.0
       - items:
           - enum:

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
