Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A8DCC6B1A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 07:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hYP6Z9cwSMaxzSD8Q5INoeCr28YiSbBgu1ov+G9373o=; b=tgZ4XV75zALw9D
	XmFvok4ogjuxAA82QLtB4L3WCxP//+ZbzQmzIew/xlBJ0n2jt6xBIzwCan2b2lQ4MUOFhBpFKjoKL
	guRZ4FjOSmrkISJoYL4slngAFtiCx04DvUsp62HltKeL/EwF1nTf30IKZjKW8VwwyIaDYEsCbxwOJ
	HJlYaqP65bVoE1g279ajP0n6Kd1y4QJD4uxHPFgnSD9NWGmrdymw9KUB4Am+lkB9gk58TJld7BQHt
	e4mYj6WH1swUZe+o5CPM+mh8NeBKulm4VNLDgPZWYOEIe7kSnokyblxK/oakS0Z5OVmqB752ENF2j
	GS6GWvyle88BdYIz8GXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtgg-0000000EnMk-2B4X;
	Wed, 14 Oct 2026 07:46:10 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtge-0000000EnLt-1Xjk
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 07:46:09 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3a7cfe8f761so3564463a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 00:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791963967; x=1792568767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MGyxds2cOQE9gU+h+bijFEd7tAx/jconp/HVBGACCc=;
        b=hklVRNgRHyQiTvNzRoYoBu+X18LRzzcQtFQfSXkwlAfyff1E90kCHEzsh6unp6/tSX
         USzTpAhOXu85reuLFVawhJyAouUxGOpYu/ef6M7Wxf78lQXYbcgyXUodrTg9PmLGXKUL
         T8zonTThWAMcgfNHu9YzOtrpOycLYvSnVY1j9WANlpRMjUNt8RbkSg2ryLLf0bhpqxtj
         fNJu8c7n6aYVg1ZMmn1Q6zklFYF0704LTVOVz6cc0/BsWKhfk9Rm8HP13O8mIV8kbFvM
         fJ3G3Ss7cneSRgSex6mIvXdxlsGk/UN3v2HdaGxSNXMDmsmY69MwKHjZIziTfIRMTcsl
         0yAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963967; x=1792568767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1MGyxds2cOQE9gU+h+bijFEd7tAx/jconp/HVBGACCc=;
        b=GgsIyY8KG70pvlx5tMW1FSaW8OBd5Dh8m2ixMe0HSpxhmOgjBMMxfV7B+Jn3u2SeAb
         NFwodmw5yg3D9X7Xyuv9CmdMkiAzgAIZZY+zSlrnXZCkU4Vkux7/OStVae8o1jAdX/YC
         R2Wu2yvoWV8fXI8epCGXzr1hcuPgIjXMjb0Rq4zpotmaQv7gSRaLgPUWUHBs9lajgRAj
         hPTsGSzapF0QX8d/nqriyiuARMV/PkDRRL5i2meVOQGxVBAMFlBYxKxPQ1GvlsbAZ6gC
         7Qu7g3G8Nv5h2fa+cH6rDp4C1i3dXcvnfSLbbuoeO2YbgmPK2kMPmZ7lfN5dfmGBbGew
         yr8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxh/OnRtE/tOH5o7TrwVFEGcxwyAb57MTebDyseG3k0Nj9oXT6TQuJvS5Kd4C92Ph6g3n6UOS2nzNKR9w==@lists.infradead.org
X-Gm-Message-State: AFq9FYKy0AsNTQu8E7hr7etvjn05mHLollX/qbIIugfiETi9p+tNn/c5
	GAS83/NqnCRPySy9rEpjRM+iXsam3seYZvdH9Vi5WVM7Q8O69FnWdUsN
X-Gm-Gg: AYBFou2iOx43flCmINZ2bUqWRlAnATkXePsP+lZt3U9GfQjMPYet3KaB01Mi8zC5hKs
	WF4I1NBbPsYdsu7K1oEIq5HncgV81G2rmkFg+5HRaN0cBxxbX8YuNWAKhN/Qgy1MJBSASFkdld1
	VvTJT1EjIK/It4qYD2l7Y33IXhI043zrmQJBMewKDDr2cE1oxzVLi05fQNDY/37TZxLGOoAyACP
	oirI1KvIcjS6hKG4YgoU5zrWsG8JsWNhBg8/nAxT0OOPEZ5AmuIGBPFkdBfil5wK2mVIcR3RLEj
	V2eppfuo1ACAP/3cJRnQW3qNoSqiYHQ3/jewjBtj/HPl+HE3zMd/gTFz8EzFEbZ992v3I6u2hgI
	GJThjkMthl4doWfAO1Sb16lvQZkOiHK3C6jjBvzreQu5b0BGXatrN7egZgOIvOGlm6FKsBB5yCQ
	OnknaO7WJrvOAEV+gU3tXS4UT8MiCCB2auyzpS3HrYBu4INF8xi2D0gZQCU1eoc2BxWi82
X-Received: by 2002:a17:90b:4008:b0:3ab:3767:65d1 with SMTP id 98e67ed59e1d1-3ab3767b8ffmr7741852a91.22.1791963967512;
        Wed, 14 Oct 2026 00:46:07 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f1fb257sm3293530a91.0.2026.10.14.00.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:46:06 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 3/3] riscv: dts: sophgo: sg2044: Add eFUSE device
Date: Wed, 14 Oct 2026 15:45:15 +0800
Message-ID: <20261014074516.240247-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014074516.240247-1-inochiama@gmail.com>
References: <20261014074516.240247-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_004608_414905_9D314E94 
X-CRM114-Status: UNSURE (   9.95  )
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

Add eFUSE controller node for SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  4 ++++
 arch/riscv/boot/dts/sophgo/sg2044.dtsi               | 12 ++++++++++++
 drivers/nvmem/sophgo-efuse.c                         |  1 +
 3 files changed, 17 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
index fed3d9a384a0..1b506972d465 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
@@ -36,6 +36,10 @@ &emmc {
 	status = "okay";
 };
 
+&efuse0 {
+	status = "okay";
+};
+
 &gmac0 {
 	phy-handle = <&phy0>;
 	phy-mode = "rgmii-id";
diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index 320c4d1d08e6..9577aae08f7f 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -408,6 +408,18 @@ sd: mmc@703000b000 {
 			status = "disabled";
 		};
 
+		efuse0: efuse@7040000000 {
+			compatible = "sophgo,sg2044-efuse";
+			reg = <0x70 0x40000000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&clk CLK_GATE_EFUSE>,
+				 <&clk CLK_GATE_APB_EFUSE>;
+			clock-names = "core", "apb";
+			resets = <&rst RST_EFUSE0>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@7040005000 {
 			compatible = "sophgo,sg2044-i2c", "snps,designware-i2c";
 			reg = <0x70 0x40005000 0x0 0x1000>;
diff --git a/drivers/nvmem/sophgo-efuse.c b/drivers/nvmem/sophgo-efuse.c
index 5f90adaf8e4f..568d17b88ff6 100644
--- a/drivers/nvmem/sophgo-efuse.c
+++ b/drivers/nvmem/sophgo-efuse.c
@@ -14,6 +14,7 @@
 #include <linux/mutex.h>
 #include <linux/nvmem-provider.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #define SG2044_EFUSE_CONTENT_SIZE		0x400
 
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
