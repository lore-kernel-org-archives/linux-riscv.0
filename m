Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB066CAC587
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 21:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l8erBQsNC2N6LxjZms6/aGjNRC/DuYQY6D2A0HoTVcA=; b=eH6QlTzVHOXKYo
	jl16s7bbdcdsG2fZj5kWfzqvPI2xXpLAcsHz+lUqDyDaCvbdm7QXn8FSCsri//+R7119/XgjWgTJC
	VKI9XR0urdaVtLGQpqaD2Y5QB5IlhZOIPH8HSw52iRqSfs0HMN2v/X/WSzj4RVLx/fdZmKCMWtBgg
	7/6ukBh7PMCeQ2H4x7Pn5EgfoRO7s8QcemAPZtcbCaDdVJ5z8w/RgqzYab5pzZuS7ebuq4kA6bpFU
	MJSc/q05oAsLDoHXhnnXsgBZWGL+kt0otq9AJG1b2fypAiPiq84Arv+yfIFs+4QFDQRDIJNscDQr/
	9hZcU0mDzifU/ajQ7mBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXpr-0000000GM79-1d0z;
	Sat, 13 Sep 2025 21:31:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXpo-0000000GM5p-3VJk
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 21:31:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E6AAE43626;
	Sat, 13 Sep 2025 21:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43705C4CEFA;
	Sat, 13 Sep 2025 21:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757799063;
	bh=rAEJCjiuy2zBASFDNgTzbAQNwNe+tJ4VWEcuHUg6TYo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NVSqRlRnfzLvA+lRv2ZK/ZG6x+tQE3cM+RkcOD1tRyE/iMU3flrKzBWsVZm7f2Xgw
	 UyN8UaVHC2q/TzdmRddkB3konWqBjFvnFt+o5319N3u1dFZO7rqb6eGsPrtjVA5YJY
	 rBkjMCzUfRY5M9Z7jP29Al0Da7WlDIde04oWf1/aVEVt3cYEFiW8nz9RHJvy3uEm0G
	 aZhp6R0UvsBEk6OFJGLk1hACIrtnLJErJhk+GPWW2A63S5K34TBMVVitBkw44sldx3
	 AiKqNik/Z4idfxgkKv4DSLVqdwM75dyRtzkntmfkZIbGd4W4/BvTJGOyvlGyqtPFZM
	 QAkGYQ8zgjZJQ==
From: Drew Fustini <fustini@kernel.org>
Date: Sat, 13 Sep 2025 14:31:00 -0700
Subject: [PATCH 1/7] dt-bindings: vendor-prefixes: Add Tenstorrent AI ULC
MIME-Version: 1.0
Message-Id: <20250913-tt-bh-dts-v1-1-ddb0d6860fe5@tenstorrent.com>
References: <20250913-tt-bh-dts-v1-0-ddb0d6860fe5@tenstorrent.com>
In-Reply-To: <20250913-tt-bh-dts-v1-0-ddb0d6860fe5@tenstorrent.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, 
 Arnd Bergmann <arnd@arndb.de>, Joel Stanley <jms@tenstorrent.com>, 
 Joel Stanley <joel@jms.id.au>, Michael Neuling <mikey@neuling.org>, 
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, 
 Andy Gross <agross@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_143104_900490_FA15284A 
X-CRM114-Status: UNSURE (   7.18  )
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

From: Drew Fustini <dfustini@tenstorrent.com>

Document vendor prefix for Tenstorrent in DT bindings.

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
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
