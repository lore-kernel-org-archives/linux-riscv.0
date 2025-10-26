Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF1DCCD1A5
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Oct 2025 14:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BTAHGMdxkLT5kd/Y81k4kXljOGNQmlwQ+xSQ+BHLp2o=; b=ZYuM3+qQ2qJFEW
	OE7ToSLmeww857BQ8BJzc6ekVo1nFWYaPJ8kw9AmbKIcI5B2uvHjeSeq8Xmn1ha1TdsQko14RIiR5
	VaejXiaguDiv6rKm852sEnXVZK680C/ZDLaChLsdNA4rjzqTC/XzIGBkzrelQ8bnadpx1LcXWmoTT
	7/mm8/kRtNelvt1zQsXdqBPRKW/Y5faMlY1QluC0F8RbLj32O/2Tg5a8OkVuDigpHKEQ2oX06GhZI
	tI6qFUnHQo65H901hKaJc1SQGA+vya0fqDOxiJRu669qU64QQ5K5ytQ7H7hkPozQDUm656GPEL8yF
	VeGp0SdPbeUwLJYMkqKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD1RS-0000000COfu-3g4r;
	Sun, 26 Oct 2025 14:09:54 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD1RQ-0000000COeN-1z2h
	for linux-riscv@lists.infradead.org;
	Sun, 26 Oct 2025 14:09:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761487778; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=R7/Kio8AJVFFc2Ptav57+hb7JjqIWmsd/L0aWLyqewkQWwQyBxKGMHrhSdZL61Tykwx3UF6VLACMY8z7ViKFcoMCd0SyLzEKI8+KK7TABzcM79Oujk8LwqcRV+Nrb/wdmGGplBBt4jcovgGK2aCCdq8FxJcBv0eE4Afzv96lX/k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761487778; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=E8yjXuWAHvV6vcYuCnK/LIsovNlBw6mNZGJWIQfRA78=; 
	b=g7PLEKTo9FX42oVf4Bad/5l6Fyjq1DGOoarJopZnYpiu0WB414Y8FLiI59NRVY6xZBqvLCs+E0LMuzEhUy9riZrKnlP/SryeaB/qiLiy8q4GgsoJ6dgyBIHsIBe2ewmHZfOLEZ7RM5tAuy52XMiSzpbmb1nXr1bvMzXjSTcRklo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761487778;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=E8yjXuWAHvV6vcYuCnK/LIsovNlBw6mNZGJWIQfRA78=;
	b=D+qD3KtuoNKTgEapPV2y9k7kcfpPoSVcCIawMCbnDqFj99FMrKhPmKq65ZAntz9n
	/ElWZWOT00NH2iBhMVWdHbiGKTEr+e/lPxsDN61i6XemFshC/kYxX7SP/RuDElXzxOv
	hYtYyajzwlYPGmSxDSNQ1+l/BbI7bUAg+yJRzFyg=
Received: by mx.zohomail.com with SMTPS id 1761487774155471.7747200896756;
	Sun, 26 Oct 2025 07:09:34 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sun, 26 Oct 2025 22:00:41 +0800
Subject: [PATCH v2 1/6] clk: correct clk_div_mask() return value for width
 == 32
MIME-Version: 1.0
Message-Id: <20251026-dr1v90-cru-v2-1-43b67acd6ddd@pigmoral.tech>
References: <20251026-dr1v90-cru-v2-0-43b67acd6ddd@pigmoral.tech>
In-Reply-To: <20251026-dr1v90-cru-v2-0-43b67acd6ddd@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761487753; l=1263;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=7/UVqIqnf4eo/7LUhhfYZZ+DfTO8tqTc+Wv8YNWh/fY=;
 b=E0loCwSup45u/X35105lYlPt15ypmWkBsyZ64zyYwXF+DX2IqzAw5836O0FlGLydzLauHjEYL
 3TGT28m2L0HAuxgCi3+QHokXq5VcgOzaJ7l396Y4CexBxFE73kQRuJa
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_070952_586948_0899379B 
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

The macro clk_div_mask() currently wraps to zero when width is 32 due to
1 << 32 being undefined behavior. This leads to incorrect mask generation
and prevents correct retrieval of register field values for 32-bit-wide
dividers.

Although it is unlikely to exhaust all U32_MAX div, some clock IPs may rely
on a 32-bit val entry in their div_table to match a div, so providing a
full 32-bit mask is necessary.

Fix this by casting 1 to long, ensuring proper behavior for valid widths up
to 32.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 include/linux/clk-provider.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 630705a47129453c241f1b1755f2c2f2a7ed8f77..a651ccaf1b44ff905c2bd4b9a7043f9e2169d27f 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -720,7 +720,7 @@ struct clk_divider {
 	spinlock_t	*lock;
 };
 
-#define clk_div_mask(width)	((1 << (width)) - 1)
+#define clk_div_mask(width)	((1L << (width)) - 1)
 #define to_clk_divider(_hw) container_of(_hw, struct clk_divider, hw)
 
 #define CLK_DIVIDER_ONE_BASED		BIT(0)

-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
