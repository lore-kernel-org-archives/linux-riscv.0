Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5995CCAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 14:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FplUXZ0BrVIcac7JwyOceUseyjjHbi1o5vs4rgjC13g=; b=gljwxKHrlO7wyn
	ouilQ2R8haNQ6gW6niVICFaIInHbCFQNeIDPcIMAkhNk4nw8w36ylq7MX9sO/e/E3E034HDSegILS
	scuAyMdVadXsNendJNKIU1b6SSjmK2sowZXBO8zZsweyrElq/T9GfkG2le+RY6GSeg9rkhgJH5nBV
	fmjvpDChZCyN7iC+JsYs7KrkhNQd6VGnujHWkl+8EREO7i8Apcqrj2vcv9txHq8A8OC96sTgehfqt
	cv8jfEaHXQ21wMxToaVlGB9GjLUfAzPKcia7t3f8O36etcGpzLNbcSoy5D9NeY8PtXU32vPzESztw
	qVRStwBpzLqu9AjrH5Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hw2-0000000AjMY-0VuD;
	Mon, 22 Sep 2025 14:54:34 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hvz-0000000AjM0-36Lp
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 14:54:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758552868; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RN45ZZ4SGRe5sVd7IraZ6S8tyQq6AraGsKpx8uCJ3ZiXShgEZjQHgTbpgVCHCBgHP+t42nZ5HCCX83vLuOf3cKd3v/GkgYmjG7aL5PDske8cGdesWrtiReAkwxLataJ8nlwTVZpQXFXhfEMNUv8Os0Ovm5K4NnUFKnfSMtM/a2A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758552868; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=g5ht2Ynuy4olVC7AOTttqtZQ3VZCttE+E0h1vADll6c=; 
	b=jI7/1QD/ayp2NBJkG6G7e9UaJ8lacuYLurWhaP7Q2ncxI6PWk6WG8IDNsZKHW0+GnOC1lGF5PFLjjs/nPYCRAaJyjPKwIMso5YZiJGDIM2f7yBfxxLbN867mHYWBxRrxauUm88FvqhgMub15ZHekB1K2AZs/nfSaV9KpyCNOGbw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758552868;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=g5ht2Ynuy4olVC7AOTttqtZQ3VZCttE+E0h1vADll6c=;
	b=SIm6yQ9+ClUeq3mVjJ5Q/4P4s0j+YNAHR9XwtaiC8f82d68HsXuoCxqDS1CsoRS8
	/rF7kw0VGrd9OjFl+yBAm8a9qV1kVaCBwo84fASgYucrO/qvhwr1N5Am4r9MRBGVZxf
	GL1YeseEQB+ssIf9f5tAY1uUEmx/YUnEbUNEUb+c=
Received: by mx.zohomail.com with SMTPS id 1758552867183905.6994838386554;
	Mon, 22 Sep 2025 07:54:27 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Mon, 22 Sep 2025 22:51:47 +0800
Subject: [PATCH 1/5] clk: correct clk_div_mask() return value for width ==
 32
MIME-Version: 1.0
Message-Id: <20250922-dr1v90-cru-v1-1-e393d758de4e@pigmoral.tech>
References: <20250922-dr1v90-cru-v1-0-e393d758de4e@pigmoral.tech>
In-Reply-To: <20250922-dr1v90-cru-v1-0-e393d758de4e@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Junhui Liu <junhui.liu@pigmoral.tech>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 "fushan.zeng" <fushan.zeng@anlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758552834; l=1200;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=QTzyuKcq78b1rHf4U4+Ek5P0fIK1pBd2tg1GAgtsSh4=;
 b=1ttbEuj65evPw6Elmvdyk7dxGu6wEYUJfmGmo4S/ZNhG5vHJThOFDEMqkdCipXqGi+Pjh9RFX
 7GuI6Ihokj1AptRvH/sj+RLrmINE7j2B2rV6BC1Rjp8spSV9puPYzN6
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_075431_845750_EA86F183 
X-CRM114-Status: GOOD (  11.02  )
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
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
