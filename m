Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CF3CA5FE6
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 08:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u7VSSuCpNQZh1qQFeL+77YRX908Ls6r7VSeTOxjdajs=; b=M10hdr3KXWUFux
	m5uTDXiXYw2zQesxXcHX1MbV8AJcYCVrxeE1HWTZNRiaWvUXVV+UwY3Wx0nYnFlvMfqQZg4PssZYj
	qHv8itz6y+zExEYvZPiEudsE2YQ7VPYNC0rq292XCzi3D4nk0IYLUogcRcalQAje7VAq1/IBWTdd2
	LfqG4QiA2QMLMGcFmq3hy6OAYxxx/ca1eYesQbD7CEwqTElQfoQfcr3w6Zax4Miy3f8s3lwIwHME7
	ChWnQzrOLZ49uqVUJWEM8Md6EvMe3vBOAVhVSBTP4/iA3aabsXH+FIaQyadiwWrHs0axbBbkq4ryu
	nHihOn1qtxorR5p0TfzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvOQ-0000000DD6w-2wMY;
	Sat, 03 Oct 2026 08:46:54 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvOM-0000000DD5u-0BDZ
	for linux-riscv@lists.infradead.org;
	Sat, 03 Oct 2026 08:46:52 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc4e4979c55so51123a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 03 Oct 2026 01:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791017209; x=1791622009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DxxheazlFCgAiD+d31s/AiAJsZYYLo8W1wj/LuSYOIM=;
        b=Jk5CSf6WNKRr/6A0Mvn45PI7ePWRCN3NeR8mYIbzPZUtYaY8vbaXDiWYOJYrQZfU0r
         yDPlLbnQ/TCnry5KgzBSW1bikfAeZWplJvZDMJx9t4o8yw75NEEHu8IvyyVQYZJ2dxu9
         JCWlFUckMKsIXAtxF74JceFlcBl8iS/carl0ZTGg+t9qwaQzwp2CVI51Mw2SeO8UHAoF
         wGFka524DYWKueW7rQrKRzZwcDs0WEgmQKvR95UktUcw3UiM1Ovp2pdd4tybNOr+oM40
         TlVeH/eJHM+9qvEvHdNE4B2Lx/EXteWDr/JV4o+0rdHTNrM8FUe+5iPGxzZZ2cqcN1cQ
         wM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791017209; x=1791622009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DxxheazlFCgAiD+d31s/AiAJsZYYLo8W1wj/LuSYOIM=;
        b=xFrGAzfiMhk3n7MJaI8bbSTJlo5zb0YZlE3n9CQfbv/C9/zp7+tP3KDJhdk2BXxI6Y
         lYFAmNrjzYqcn3Rkq8d0pH0v9JfUioHbw7LJDVFnpUwShTbujTy/bbFKuyRtJfYhBhFt
         3TynbwTjWxM3HZjD1kheV07ChVH+8n5E+6jxrsKO8PcJjDpKrTIHteKSGEMmic4MsKwH
         Vd4098b2o451NA7fXfeuF1o3dtfGOAwpBYD9z9o+zOvgpkwNPN6qRGRC/uSP1sqjhpTH
         hhNujwri+R6uyhiwx9OzZ05/ShA52+0MJ9OgIl44vJTBGQqFN0BaWS74OQLL71oH7bil
         in+g==
X-Forwarded-Encrypted: i=1; AKwUvBx2b5zlBzf3j0Vdx5bp8FO7Izvi3kIQtLcZGAFInCWPNofgkHZ+hdYzW+yDeXKrW2U4kN/5J0bbp5/GhQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKYnRHI3PsjDqTRezVZCauKV4mEKoVhDGipUFz9TF2/MI63QNqo
	VZCh8x1JG+dn/Ptu1GMgiItxES55ZINaeEMDlgwhMM2dwH3i1QpVShOZ
X-Gm-Gg: AYBFou2+YZLiZf9RDdbQB/0f6yZ5JZkaAkxBNIRVxZcKXBRSRbDlGn48dem+ZexRRb8
	scFdnBJr+fBITvSv9JzNqqWkl9gkgdf4GXw+C5YJssAly++vQV4l0nUsIKPTbD1O6p4w7wHSzMO
	epwoD6o5/q8M3twMRVKRAjDXay20njHGtXmxPAVkapPByz13Cwf8ZzTHpJ4bZNoUI4USwhLU3hF
	NO/YLbdHuqmvu2aKLymOyGu5vNrEjX59rAdR6+3FW21kgveS8DTFbb+9pELj9J+kj2cg6fv8rsR
	wBZ0cPlMocgAZTDKghMi1UNWHD2DFqlBRMobfqHvAQ8NgyYbpEQYoNQbGcrUI3fZQGZtN2FFnNh
	qMuz0FbrGI7+amv0Mm10+oryex61t4SMMT5yBIvSLi1Ej9nrpLZowMp+CFcsNGaO1joNyzo8aZL
	HfySAl0B5Q0GwmYrIVxt6kQNBdiiYSwNuTKARD7c2nN5pGQMmEDHDri5WS/+DcEF/++3EFzBl2B
	PLVAFwiwqr0DEuH9MbfwjUdWKbL7K8j03RmdrpZ1QmP4JYlRth1hxAvLeDpxu+bxXSn+Z4C
X-Received: by 2002:a17:90b:4b83:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3a6e1d201ddmr6386816a91.4.1791017209449;
        Sat, 03 Oct 2026 01:46:49 -0700 (PDT)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4664ebsm2208033a91.7.2026.10.03.01.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 01:46:48 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Hiago De Franco <hfranco@baylibre.com>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Joshua Milas <josh.milas@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 2/2] riscv: dts: sophgo: cv180x: Fix internal ephy node name
Date: Sat,  3 Oct 2026 16:46:26 +0800
Message-ID: <20261003084627.353899-3-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261003084627.353899-1-chenyou910331@gmail.com>
References: <20261003084627.353899-1-chenyou910331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_014650_089898_67CF5C0D 
X-CRM114-Status: GOOD (  11.58  )
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

The internal EPHY node is named "phy@0" while its reg property is <1>.
The unit-address should match the first entry of the reg property, but
this is not checked by dtc for MDIO buses. The kernel confirms the PHY
is indeed at address 1:

  eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY]

Rename the node to ethernet-phy@1, which also follows the common naming
convention for ethernet PHY nodes.

Fixes: ba1abacc57cb ("riscv: dts: sophgo: Add mdio multiplexer device for cv18xx")

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index ec3bf305274a..cf672cc6b935 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -71,7 +71,7 @@ internal_mdio: mdio@0 {
 				#size-cells = <0>;
 				reg = <0>;
 
-				internal_ephy: phy@0 {
+				internal_ephy: phy@1 {
 					compatible = "ethernet-phy-ieee802.3-c22";
 					reg = <1>;
 				};
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
