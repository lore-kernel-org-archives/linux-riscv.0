Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04348CAC594
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 21:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ziy+AJXxzNKzm/H7lPaUeXuNU7WMoRag0Wr2Qs85sRY=; b=fE08Brdi4OqMpL
	ASRDoaPAcpVjAZ4Kwtj61WSPswpkAWtKK4xeZrXweCkbKhzWoV0JXxuJvtjk+rxZFRfKIlzufptWz
	Azg4SG5s9TNIy3w8CFeRxrmNfbhfyUp+dM/P3mVB8jSnGLNctPk8PnXspb5yJgg80IYa8uqrmP4Kj
	Ff7jYAEvpi4cvN3Ysr5DFJ7Jv58itXRRLxg6xCUpORCkYVckCbOzqQo4ji86ejxXy/Yif+b1g4ldn
	xQosI8Ext+6YVUo9hE856NvrLt5cswPevQEs10ghR6CpU6dPU20hvDCaSpUECfRYuvqRksfaoUaCn
	0rWZzTceRFXGGZMfeKtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXpu-0000000GM9N-1ASj;
	Sat, 13 Sep 2025 21:31:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXpq-0000000GM6Z-16IH
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 21:31:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EA2114512B;
	Sat, 13 Sep 2025 21:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ADDDC4CEFA;
	Sat, 13 Sep 2025 21:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757799065;
	bh=KWeVzBb2k7TISyEOWMEPtUUbf6En7nS4bmjdkluUFOo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LkBw5ZPOz2Mjr4ispAEQ2XM17AuZf2AhRSngYzmp4DwRso3D2XsgIEfodRIUbubTT
	 a07qCAvwkJoNybyy7C8zguGhCXSzD/TOzVa0Eb+SHwjw4E/qPLCd44X4eIB5OUtTIk
	 S6/MajvD9FJtWfd/LVDuCYjfOG9vgUtuQagPdrcD7YNecESGeFX2UeOHXGhKSzOoeM
	 slkludN0tEGGpdsr2XKbMvIo1Au0u5VL2qIu863gaosgluf4HmYuIFuQEYmplXAV+p
	 0aPUNJaJD2878chpcd9bCBl2mRAm4R1kMUuYrfl4T1+FBdqiEjdSVoChNpNi+2wkES
	 12ebWe64VhZQQ==
From: Drew Fustini <fustini@kernel.org>
Date: Sat, 13 Sep 2025 14:31:03 -0700
Subject: [PATCH 4/7] dt-bindings: timers: Add Tenstorrent Blackhole
 compatible
MIME-Version: 1.0
Message-Id: <20250913-tt-bh-dts-v1-4-ddb0d6860fe5@tenstorrent.com>
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
X-CRM114-CacheID: sfid-20250913_143106_325738_BE43889A 
X-CRM114-Status: UNSURE (   7.04  )
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

Document clint compatible for the Tenstorrent Blackhole A0 SoC.

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index d85a1a088b35dabc0aa202475b926302705c4cf1..198146c59de0c95a2ffa052c8d4d7aa3f91f8e92 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -36,6 +36,7 @@ properties:
               - starfive,jh7100-clint   # StarFive JH7100
               - starfive,jh7110-clint   # StarFive JH7110
               - starfive,jh8100-clint   # StarFive JH8100
+              - tenstorrent,blackhole-a0-clint # Tenstorrent Blackhole
           - const: sifive,clint0        # SiFive CLINT v0 IP block
       - items:
           - {}

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
