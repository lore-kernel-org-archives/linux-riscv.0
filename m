Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406A6ECD9BB
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 02:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OCq86IgcjMqO8XrNOKxv8NbyI9a0Hi2iTWeW8kHclac=; b=INoEKsgOCNiF1S
	mBSxufGKBiO14WjoIHk4KO8Kg+bvb8cNDbr1nK+kqrtHqdqvA6h7rPAgikFu2XN+CqBzHfxI7xIvV
	VGX3e73t+ZNTNM4zNVaSmUKy9DIk0d4JPR9DiEv51fJ6v+m0Igsd0MMGr6Acw4GldMmDtkyAxpKT1
	hcKC3Rf0LpoG4YfyZfYcaCSPNyMDqN763J2NHjRSLhwZOvnHvz+Z9hRGATvTfQxU3poDLvmLAp4i6
	Ey9kCAmSQLRUL71eaqNp6RUd4Z9HO5PEX2VGDV81WeOQufL0jpFEL1DzAPUVi6N8K93bFDqNwzSld
	j3yV5jpGoAtyFjK9+HxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voBe8-0000000Alb7-1SxN;
	Fri, 06 Feb 2026 02:32:36 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voBe6-0000000AlaZ-2DqG
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 02:32:35 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3530e7b3dc2so1334558a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 18:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770345153; x=1770949953; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ZvkXVSIOYFCtEBxE0jhzmf26iD9qAK0/wl2dxGNFLk=;
        b=Z2uKOhpYcxxARUa3R91dzaZaJ5FkesyimHAUMmZYibd3PHGkoOQVyhX9u8WANZq7Yb
         fQ/FrAO1BIdN0/2S0c4cYtamyoyzMTugwiQnXGzdKc6xDDxe20W66+lSrqfJnE8kLEoh
         TkObfxo3Q2rn3/elXSsNgPf3ybH9MbM+tWyV8hoPhi7NorLJamz3F5cGjaH39Px59f/B
         fZXO7PxTtIMDLXx+Rr5GRXfnQ/Og9I1inpVYwPcon8eJL9EJIdzyX1J0sfisZCo4aVPq
         kj4P/xz4VA/TaNDeIkIFke0cUzl/cU8bEdgPElJDrhyaom1JRPfsiZU2hSkpnKfzY0dn
         oKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770345153; x=1770949953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2ZvkXVSIOYFCtEBxE0jhzmf26iD9qAK0/wl2dxGNFLk=;
        b=MLxcWvqzw75757n9gT+Kb2l8bv7lSSUG+1vFow74h+oe9heJv0BSAHCWkVddEUBQyX
         sasP0mk6zEnzxdbCW8g3yGuy/Nz2kYRNj21aud4uKJrlTFNyrGJwEr5DaeC8FsydwYF1
         Jdj0Nqg3Eb9lirg62sw7LVZUPmzcCYqDhzvvc+VgscYg4DizfKX7p7HzGYhVOai9FDNN
         4lwbkGWJQI29Xn2URMcSC4UDgtJHyCVLU46KJw3JGQmYlMme2kHvbvXkgi849VSI+Avf
         wdJ/l8rBvpHLIvh12Cxu+GF5h3GzGYafsyYzowyZB5XN6y/CQvBFBsbfv6r/YX96pb+u
         PLqg==
X-Forwarded-Encrypted: i=1; AJvYcCWrV77K5WdcnJcI/dJMKVDeIkyeGz9pD6N43akvxgcthBxe5XXstFbIfU5gt2gi6gua8xpili9OrAWb/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbHCW1MYRzAY/5EBng+x1yaBZlXh3BgShZWJmf/iHZvMagkNxq
	LNAtA7X3L3pXutUvnC7If1csAU2NLuu4hcjcdkB9STnOEihJLQeYu2pae7VzRkFJhn4liPZcPHh
	bRBchEsLF3g==
X-Gm-Gg: AZuq6aL2oyeCWtJqdM/VPUpkppBEQ7QXdt08K2tbyo62lnWXwvy1XXjkVNmdKhou4DM
	tcXrPWHjS/mf5PjCQoENjWuokG2040m59utJNYzUlq9WoB84oUOkLNe9zUaMaHyM68VI5z4djcy
	ZJSvbWlDyiKpdOeBm4ZIrVyCoo/64MXtsGTXxD80x8ivz1oK3bltA7YjkwzEoewxDQ0v9FPDFrv
	OT9dFAujnj+1KF8wyxTb/JZPPZ13JurU35zd54Qo2qCoNyzK5kDv/KXSuAZRWs527zQH2x86WwN
	uVmMO7EGpJiFR83OGWLaqLKojvQyVQbXOa/FpTNhDmbbTsMAABIUWaE3PxE+sU1FFbzT6buTp0Z
	+SLulTF1TU/i+MoOtFpGfPuTnddnpN2caymXhPS2H2BDFDZCc9k0l4YAHRS71R2mo6K5vGldSsu
	p22/nXvrsPNfltmb5V9X+P4AhbzRMAVp033qTH9PMIQuHosX9tf1pfXM/NEghkoxU+8eeNeG2OK
	rJMrWllU3gdgY1RnSw=
X-Received: by 2002:a17:90b:4e88:b0:34c:2db6:57d5 with SMTP id 98e67ed59e1d1-354b3ac0385mr944309a91.0.1770345153341;
        Thu, 05 Feb 2026 18:32:33 -0800 (PST)
Received: from [127.0.1.1] (61-221-120-110.hinet-ip.hinet.net. [61.221.120.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b64a8a9esm158419a91.1.2026.02.05.18.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 18:32:33 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 06 Feb 2026 10:32:03 +0800
Subject: [PATCH v4 2/3] regulator: spacemit-p1: Update supply names
MIME-Version: 1.0
Message-Id: <20260206-spacemit-p1-v4-2-8f695d93811e@riscstar.com>
References: <20260206-spacemit-p1-v4-0-8f695d93811e@riscstar.com>
In-Reply-To: <20260206-spacemit-p1-v4-0-8f695d93811e@riscstar.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_183234_576719_9967E10D 
X-CRM114-Status: GOOD (  11.16  )
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

Update supply names to match the P1 PMIC's actual hardware pinout where
each buck has an individual VIN pin (vin1-vin6) and LDO groups have
dedicated input pins (aldoin, dldoin1, dldoin2).

This is an ABI change from the original "vin" and "buck5" supplies.
The P1/PMIC regulator has no consumers in the DTS tree yet. For the two
K1 boards in-tree (BPI-F3 and Jupiter), power settings come from
boot firmware, so a probe failure has minimal impact.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: No change.
v3: No code change.
    Update the commit message to state ABI change explicitly.
v2: No change.
---
 drivers/regulator/spacemit-p1.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/spacemit-p1.c b/drivers/regulator/spacemit-p1.c
index 2b585ba01a93d0ce163c33e14c8022a506bdce11..57e6e00a73fa416fd6e557eb5bcada7dc69df444 100644
--- a/drivers/regulator/spacemit-p1.c
+++ b/drivers/regulator/spacemit-p1.c
@@ -87,13 +87,16 @@ static const struct linear_range p1_ldo_ranges[] = {
 	}
 
 #define P1_BUCK_DESC(_n) \
-	P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 255, p1_buck_ranges)
+	P1_REG_DESC(BUCK, buck, _n, "vin" #_n, 0x47, BUCK_MASK, 255, p1_buck_ranges)
 
 #define P1_ALDO_DESC(_n) \
-	P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 128, p1_ldo_ranges)
+	P1_REG_DESC(ALDO, aldo, _n, "aldoin", 0x5b, LDO_MASK, 128, p1_ldo_ranges)
 
-#define P1_DLDO_DESC(_n) \
-	P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 128, p1_ldo_ranges)
+#define P1_DLDO1_DESC(_n) \
+	P1_REG_DESC(DLDO, dldo, _n, "dldoin1", 0x67, LDO_MASK, 128, p1_ldo_ranges)
+
+#define P1_DLDO2_DESC(_n) \
+	P1_REG_DESC(DLDO, dldo, _n, "dldoin2", 0x67, LDO_MASK, 128, p1_ldo_ranges)
 
 static const struct regulator_desc p1_regulator_desc[] = {
 	P1_BUCK_DESC(1),
@@ -108,13 +111,13 @@ static const struct regulator_desc p1_regulator_desc[] = {
 	P1_ALDO_DESC(3),
 	P1_ALDO_DESC(4),
 
-	P1_DLDO_DESC(1),
-	P1_DLDO_DESC(2),
-	P1_DLDO_DESC(3),
-	P1_DLDO_DESC(4),
-	P1_DLDO_DESC(5),
-	P1_DLDO_DESC(6),
-	P1_DLDO_DESC(7),
+	P1_DLDO1_DESC(1),
+	P1_DLDO1_DESC(2),
+	P1_DLDO1_DESC(3),
+	P1_DLDO1_DESC(4),
+	P1_DLDO2_DESC(5),
+	P1_DLDO2_DESC(6),
+	P1_DLDO2_DESC(7),
 };
 
 static int p1_regulator_probe(struct platform_device *pdev)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
