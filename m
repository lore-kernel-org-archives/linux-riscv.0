Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFCFC53219
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 01:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YX9dyVzkWq8fLaSj4UdEpSbNLSkWkJ+FdWjXEfzhfhA=; b=ufBLMrNr/xUdLh
	jHtf5vQReGPsd6Lcko6H3fQgqdajQPmblaNnvFDPRQ2mexQYWDyBS4YEDDZbrqaB+Uq/rJ9SIxiQp
	/3Nk4FcbuPQcWnc18QJtxyFKCSy4Q/LzcYzWVnF7z2c3E+685JE4x0HgE7XNEXRWaMrjxzF68TuQ2
	w/jG4VWCoge/USRNahzoilLhhBKbrz8EGId2D0XrZGxjwE6soubAjAEYfFjx25NHs2dDxduBT2Uym
	Ueso8Uu5RmPLh98+PoOj360wvJnUJQVGTaRJK1HtiCXqzz1HJGGsxKLCvN3ChdMZRZY8MscFK/mCT
	ycmqfnZiZoCdmr9sTqIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wot28-00000006ahS-3BeX;
	Wed, 29 Jul 2026 01:24:32 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wot27-00000006agp-01J6
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 01:24:32 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8487088510aso436711b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jul 2026 18:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785288270; x=1785893070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zTUUYZoRzWnQSYsoa3RJtC9OCCoaKFk0bW+TVIF3cnM=;
        b=Q7N9O9Ey4FsLEl+2dr2ndpxpitmWJ1qC1vwfBiVDD28Ib4dqRQO+891dL5jwsz6QxA
         fR8FmffGgnmy2Xs3ZLfsf/AhQp+xYPuWyMdF//HtneDHrNCbVR9NjhXJULzOQV9LkE1Y
         4F5101zUbHgUguQ5CqyQ9QaxW1MB3NKP61ng0cq/AyXEJkF59XyrPJ+iiOlma1z0848q
         viAkkwbUere+uuCzHF0DHF2oxNcNFOieBmukfzYXtHSO9SYJ/l2MuJsXC5P7+6vsAZat
         WzXCsEJ8y95ytvGVdnBzJ6Z7UiKk84oUrdEMIjm35iAicPZ29N3dZhsdfwT7gDoDbpp3
         e6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785288270; x=1785893070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zTUUYZoRzWnQSYsoa3RJtC9OCCoaKFk0bW+TVIF3cnM=;
        b=SObVhsR5LB/tRZ4JBXK527PCiTVXzoqy7NdmDntTu+STCc9TK44DTRmNzVR+1satgF
         wA8w4VcqTXXinu87SWWQS9dPUkHUYIAUeV8aT+PXqKmqQ/Vx/vcr6ncilXWUiZTN5VLN
         ZAVybZeG8tWEtFAUc5vL9wB8WHzuQQuvwsK93ikAvbK1E0+OAFNhwwoECx3HoJYAZEVY
         LKxKXTnVbBj4no11LQ4zxRvR27xHoluGPBRcEw4F3TDfMcqU5Tp7C8OopvYVmrtzdU84
         Ugctv1UPF23uWVcFH9+v0pNZ/tZ4h3yIXX5oO8d3rMigNrpb8mUzNF9ZLNu86MZvGdua
         tzDg==
X-Forwarded-Encrypted: i=1; AHgh+Rrfj09kaSjcSmdLg8pdhFZwcAZ1O7P82E869DJTvW2YSC/T7oqXHxGTdQqjZNhFIuzTmG/vo6HiFeufug==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvi9FCrQAYW+F/sp+i3d8Z3sq/l88sJJZXWuAB2w1DMLhPUoAT
	9uQPLd291LUK+HkFQiJ0AvBgEpIiVEw48FdjBzJQBdwnAUNkeWpyEQ54
X-Gm-Gg: AR+sD11yOYYOnmGlbRc3kVdrWhYqD4tU1cwtu/O6Jq+8KbkaH3c4ArUaSA6tEQRcnh4
	5VCpcJ3DjLvYXtWnRsJ+SybSfVQm4xuiKcbdOTwAEAVT+nzR0f+c20vQGQw6suqHvSrvSDnGw4q
	6K3z3HIarmmArxIqFSBRO9qO6PuxaH83KnnynQYbjEASTAMz3bZWXEDLpcNFjuHNST3AkjFSK/Q
	ICYhOoRCe9n9TyK/hakWQ/XI0AbidcYIJvDU8gPGzkWDRJwUw5RERjfB+K35sDzJFJ5okaek/vy
	xPy4JGPOM/InFUH92eaLBZpp3NkqcIjXKiC0h5p87/hzU/W/pfb7CWjHfqmRZOSaTkNJ1iKumll
	ygS1Og98ENIJeu2upYndupy+h4D8ri1B54DsZmva5wWTpRT+e6xd8cxXYkbm63vB4G2DJqncNb9
	9kGOy6iYy3ljNdanYnuMRZZsPdIIu6QYKhGtRmEODwpP59Iu67kIpNCrjHFTU=
X-Received: by 2002:a05:6a00:1248:b0:847:df4c:40c9 with SMTP id d2e1a72fcca58-84e9331b006mr4904021b3a.46.1785288270033;
        Tue, 28 Jul 2026 18:24:30 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e9fe20e35sm595509b3a.1.2026.07.28.18.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:24:29 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/2] riscv: dts: spacemit: Make dtschema recognize the etherent PHY correctly on K3 pico-itx board
Date: Wed, 29 Jul 2026 09:24:16 +0800
Message-ID: <20260729012418.154652-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_182431_071031_7935927B 
X-CRM114-Status: GOOD (  11.55  )
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

Since the previous commit does not change the phy node name,
the dtschema can not recognize the type of the ethernet phy,
so the following error is produced:

/arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: phy@1 (ethernet-phy-id001c.c916): $nodename:0: 'phy@1' does not match '^ethernet-phy(@[a-f0-9]+)?$'
        from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
/arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: phy@1 (ethernet-phy-id001c.c916): Unevaluated properties are not allowed ('reg', 'reset-assert-us', 're
set-deassert-us', 'reset-gpios' were unexpected)
        from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml

Change the nodename to make the dtschema can recognize the right
PHY type.

Fixes: 6d6536c880fe ("riscv: dts: spacemit: Fix phy id check for the phy on pico-itx board")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index d78416f3118e..e91a4712f2db 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -195,7 +195,7 @@ &eth0 {
 	status = "okay";
 
 	mdio {
-		phy0: phy@1 {
+		phy0: ethernet-phy@1 {
 			compatible = "ethernet-phy-id001c.c916";
 			reg = <1>;
 			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
