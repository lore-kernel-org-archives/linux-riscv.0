Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E87CCA470
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Oct 2025 21:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VooVbjPOaPv25UBfCVglAbTZHus5zbJ3r7Oyieh00UQ=; b=TDmfPzi7FhAOmU
	rrpCVwKVJvN2B4lRPvDP7C/7McL4bpeRJOAbnPS+Aor1/8z8u8FD02O/PQV0MGKop79U4oTiHzlGg
	mt92dGhm7eF7NA9GJdy6LGQjI/dMOcRP0DGV0rZzOh/R3LdSQzlUQQ7LhHEKKXWSWdqLKIwKFo9nk
	ERYenVFSCiLmrFd5Ax7ZhI7Wm9ECDVqSejteC7jUAJLVaX7FiyO6m4z9OamtRJqhsj463wBRewyCr
	AMwULSq47vcCX6rqBez/9c/gp9O4CdUVL3d0XgzcOiWAwZ4zWqcheGrAwLa0VBns2rmsiSiNsKl9W
	Cvcy/RWjFc+lKExsGzSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5seY-00000000pf1-3lEb;
	Mon, 06 Oct 2025 21:21:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5seW-00000000pcq-1JaL
	for linux-riscv@lists.infradead.org;
	Mon, 06 Oct 2025 21:21:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 864D545E7D;
	Mon,  6 Oct 2025 21:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C60C4CEFE;
	Mon,  6 Oct 2025 21:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759785711;
	bh=wjU6tcWnObWPbleqN1qlUZVOyplmFW9B7lV7vL64Ejc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rzp7LcxfsD/ZSDpToywVAsH34/G8AoZ6ySNhcAedqJDxcWI4LuBs22YLFWrBkGLfI
	 8SfiCLA+Y+DguVrX9uRCHswokpgyJSjht6zeq8MdHoP2UD3mQL7ss6BvjFXd8n64iQ
	 G3eEkEXko3XAXlB/BDahmjpOpa7DBehV/3J1YtvPLhrGFlAlboKl1msijjgDqH58gK
	 PdbWGXGJ+N6cNdfRtGVznQZDPX6vc/oyaZvNFaxrvaDw4CKwZXM1PP/FYVsdiy7MQb
	 W7a/Dd02nnWH018O9LNavE3OKbzaeaia0kTZTRdrIeNya7eXdFCyZbWy5D78GaLyr5
	 liEb2OsZ1xonw==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 06 Oct 2025 14:21:41 -0700
Subject: [PATCH v2 1/8] dt-bindings: vendor-prefixes: Add Tenstorrent AI
 ULC
MIME-Version: 1.0
Message-Id: <20251006-tt-bh-dts-v2-1-ed90dc4b3e22@oss.tenstorrent.com>
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
X-CRM114-CacheID: sfid-20251006_142152_376249_55BC9DD0 
X-CRM114-Status: UNSURE (   7.57  )
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

Document vendor prefix for Tenstorrent in DT bindings.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Drew Fustini <dfustini@oss.tenstorrent.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9ec8947dfcad2fa53b2dca2ca06a63710771a600..8bbc0ebdfb9eb5864f2797251a8d144e2eea9a92 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1547,6 +1547,8 @@ patternProperties:
     description: Teltonika Networks
   "^tempo,.*":
     description: Tempo Semiconductor
+  "^tenstorrent,.*":
+    description: Tenstorrent AI ULC
   "^terasic,.*":
     description: Terasic Inc.
   "^tesla,.*":

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
