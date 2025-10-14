Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA38CCCD190
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 03:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8SmlAUsCjjtARU0UWL3CyV4zwOz3iGqmq72i2zyxNLI=; b=pjIyncc/nGaG2I
	kP5wljZ94ID/3pV8IyyhrXg5cTuSbaij2nMB//IkhaXUaIAt5LFsuCZm9XvVVDxY+XP5QPAUiE/Bc
	9DtpJFKK8op6U0rS0ndmU+eVyQiS+HFCgI6jGgKyfYVpLLAyn0+kZ25k3BJUIu1bQfX1gEtX7TAkC
	Xw+yF7KOjn6gXCJnDu3uMFir3TKRw/KmPuhKUkRHmrDqsw02E+B63BIARc9+JM5uwI3wRYuGFkqcx
	szugnl5xLl5iwYzNKlJWaEawAw5+A5Dia72edy+avQ99jp2iQd0Ciel9sXOowYyC2IjUROCJuEZ9C
	ehOFSozRYkMoWcWBNiVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VSb-0000000F1H8-1kzG;
	Tue, 14 Oct 2025 03:12:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VSZ-0000000F1Er-1ULQ
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 03:12:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DFD1A48749;
	Tue, 14 Oct 2025 03:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0FE1C4CEE7;
	Tue, 14 Oct 2025 03:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760411542;
	bh=j9X472dW2iFwpfv+A20bQZEA0DzSW/GeyjVodG/znv4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FBSMJhPF4vCsfUMw2aLk4D33i8Emf8p2R3njahEelGM9lmjKgWXjWqcZ0qZxL6wMH
	 DjFHwDiSqYS6EyxyaL8HTQnJTyT4j3S6B35LLXOrP9qsgvEyIUBdEp6kH0Nerae392
	 mCdU2KV4yGYz5N4KPriQfKMpyp+ga3Ung+QKLiGQc5Q63v8inO5LbjjUH9M/AB0nR+
	 FlP1yPVXcFauS6SfcgJDoGJsicAPdtqKlT0xMJQ8Rbben/ZrQbZegUiNN9wag4Yb2g
	 i9ZG3jWac2X+2kWbjHPp0OpOiML3O88PPsuQn1jKNarr6tpwCyl01nz/mId80Olrdq
	 t/shfZbMLcZZQ==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 13 Oct 2025 20:11:56 -0700
Subject: [PATCH v3 4/8] dt-bindings: timers: Add Tenstorrent Blackhole
 compatible
MIME-Version: 1.0
Message-Id: <20251013-tt-bh-dts-v3-4-9f058d4bbbda@oss.tenstorrent.com>
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
X-CRM114-CacheID: sfid-20251013_201223_439603_100092A6 
X-CRM114-Status: UNSURE (   7.19  )
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

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Joel Stanley <jms@oss.tenstorrent.com>
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
