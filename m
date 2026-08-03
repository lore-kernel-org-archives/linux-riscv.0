Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861DBC55182
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 16:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tkNJkR7h0kAq0Nxr4jKOklj5z3diHfHctomp8eoT48o=; b=lPXQOZCFy17nPV
	175bMewNF21h4LnZyVjjnJEJ71G2bSUN4U8BfWTY35p6iwCP5Akv+cKcPhWzHLTM5bskDp8hmqoIX
	S7qpcYiq/7ZeaBcLZ67FWeW0lRvLGmMYqklvaLQScxncs9QCeKbbf/+WCziOXzST+KlIlxtYZBhBR
	jzfF7TKGWe6HIR+eAZhgXHbdDM2JAmQVNf2EpnqeoUY+v7zyC/8+xe7a+2BeAjN9GYkm2oJSPLa1W
	MO/0jWLRS/fmaOkwxnpXv+1UVerguHc8dDw2nJwKgOoffyM4rcSiodGUlRzIu2adFCWQ0nPtEGds7
	J31mIevHfyyKyXmvKOLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvcg-000000005uv-3Fef;
	Mon, 03 Aug 2026 16:34:42 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvce-000000005u2-3Ajf
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 16:34:41 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cbe64a0afabso6615a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2026 09:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785774880; x=1786379680; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ipT5exq6LUV0S+KzcId/vjoUA8Xp4TlUp/KpBpmvGT4=;
        b=sxdIV4zMtjCjTNL9Fk13nnwT/mzrtj1Uy3EfcvkDBJ8LgWWhgiJx1TaCLqva0efDi/
         8LBC+07appn/NngU/lyWY1C0tsVPwC2PhievOPupPAqPydGpeVRhmHTEVz5Q8lln1sZ+
         tYhLRt+mmFeyvdYhzh1MIPHuAweisie6HqHJOL70078oe05554YOQITqljzPdPpVzNgc
         VdDqDTFMSbHWZkPbYgVzrqHWsshutze6rPORkCvhxt7CMqHsgJOV9fKyu9Cu40441SG/
         o+nqdOXOJ3d6SNhg1s60J8PNkyYJYcqkdvuQh4aMRD6dLAKdTSyxIzMBzvc3Sif/BUHI
         9CnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785774880; x=1786379680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipT5exq6LUV0S+KzcId/vjoUA8Xp4TlUp/KpBpmvGT4=;
        b=kxELrNe94kZrYdfABRE6wTvX6lBuDAw1Hs8Y9XT5k+VWbmZHK917lzEpnJa3SN7DGs
         JPiCNPpow9TPKkT0Sh9r6eyMmu1lEWU5SAQI0PLlFuWHvINvyXuBQVVoprFXjzUZA7yW
         f32LvGlfPRalQsqIhkYwTctTk6lh6kL0ZFCghvWXzLVIuWXRLslq1DD34sfYT2WyNiqV
         fp4AGdnXnHj2md0xhwOj8P4A5SYmHNbF9lSlA3x4jKqxOwEL6HmDbvTsgPTwy4zpWdkw
         ozwPPYW2QG2lFGZf629R6kmtrwk6tF2CYcfGIcAO5jtqNJyzLCcidivqUn0yXwTCkwAc
         fmlA==
X-Forwarded-Encrypted: i=1; AHgh+RpJFXGuEm56U2oZp5w1korAjQQKmQ0sK54eKzMspkmkeWDnvpHp6aRfT4vliarUMWDiTmErn9XX7Fj+BQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcqXYzhzYFfEMj/I+wz92Xr5UxdudU2DkH8hMZOcKlFv9K5/wO
	CrqkHVEzn2soavRv/PAThdoBiyJP9u6NS+Ul0KvCDKzgevv+qBUWN5Na
X-Gm-Gg: AR+sD10ZVOaaZyLMVCANIp4T6TqTln5ERkm90fv5/qrVUwA0d+vRsk4nqW+qkzdKyC+
	jBH3Q9DMCvTH0Oc7/1KNFU3uHfjCsd99WXzxAemiWuiRO6v7D+1RSwF+tTs0vpPGe/nxn2Ob1XY
	S8TZVWEPRW1Um81z+fL12DX7s86hK92pmbv/Rru1ElOMR71dJH3hnFgnBkBAvTdfSeGr6J3Gdoy
	eWQ3qpfIlw/7e0JGWWsahQHLF/I9j6/lO9MAI3iC/PvavDh/KfJbcnbDu2s4I5hu7sWfJixILn2
	bNDVeHcpQZLPbHrX2Y8LK29QiTEIcb3on9/+JKw7C+P+I036Ur886AGtFue7Z2ezAef55XVkZXU
	yjiVPaBhpJgl4L3pgcUR7HlOvm+x3AVH+6eaWkUh9lawy2vOvtl3rnr89cq2XBOitzsZ//IiSmq
	qDn9uzP8KAWwRN8zhWrKkpHUcIVz3kGsScgk0YfK8R8lIPhqQiSI/MjWMDCwGma8GOW7njCE8vh
	ROWvCYgMh77aOzK0+CvL6qwbdmZ0tyJdciKDkNEyYelHGUXcqA2jw5VtqaDrGrrqyNZlijuQrCW
	9PXoBQPuulMu5iJzFaMckJQ=
X-Received: by 2002:a17:903:1aa3:b0:2cf:ca85:57e2 with SMTP id d9443c01a7336-2d05219bb79mr145306785ad.1.1785774879604;
        Mon, 03 Aug 2026 09:34:39 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae99af1sm41180545ad.33.2026.08.03.09.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:34:38 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: chen.wang@linux.dev,
	inochiama@gmail.com
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] riscv: dts: sophgo: cv180x: Fix internal ephy node name
Date: Tue,  4 Aug 2026 00:34:24 +0800
Message-ID: <20260803163427.74445-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_093440_792504_1FB3B16B 
X-CRM114-Status: GOOD (  11.44  )
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
