Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30D3CD4F54
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 04:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xpMJEMb9EIhJtz0nSHZeEEceN1DMhaeScbTvpx7ueXE=; b=atStWH5b/XsQCL
	Z8s96bkatVFxCoBCs3cefp6hQv7hLVS1RaLJ6MwXzjiwCPPCTImtSWx3JAvn93Ie/saPlXvr27yZU
	Khsj7qfBXkj3wTeF/UaQUrkN4qozB3bMhf1nEfLmBg6ZOGd7GoR1bFaMxmRtvjsMFOTSAAYECgvSa
	79z4XWFB5uQG+ypUnHqOgVBKbQ1atukCQmtepKb4AIG1fo7Du7z4ekRyNv++Hv+9jEUu5efCZgAcF
	4od/+84PY2uOL3xu2Xq/fNF997W/4u1N/BeT8kCIUfw88rgGKTWyLE0gYasiarvOdoKfjh4XlgQKi
	I/k0KoQg0b2JIsFB3xmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBrW-0000000053t-3zzp;
	Tue, 19 May 2026 04:15:22 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBrS-0000000050D-0cN6
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 04:15:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=q92OjoForvj8MezGB26uKy2lPZ5V2E2aoUdpVR5SCfs=; b=DICVQVIR50AeqPnQXMAV/1pqoy
	CgaxOumlMpGqrMIfvabXugeS5wCtFTvPglfgo9ROPQkSqTD/4roJOkoDIm8+NUmDB0sFJhGFJJ2A9
	aQxos0r8bbghSnJZedM91aqnJ+Fry5kWLRcmfJcJESr290o7rzr1ryAt6kGHCspQJFyfHwqbG21s0
	vEyJl5MX6cTfCAJd3E27ukVWD5pd6rdZsHBPoaPlqPEPXrWPb12AQKODCsm+anWDDZQ+RYGQVMtx9
	3+YMq8o0yuIvoNN8sd4XTs77Var/pcyQk4D/s5imUxpcy91xLrr3r4JhAN5s2K7X+p9mJfK6+7w+B
	FjoXj+lQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wPBrH-000000032lg-0QAR;
	Tue, 19 May 2026 06:15:07 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Javier Martinez Canillas <javierm@redhat.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v2 1/5] riscv: dts: spacemit: set console baud rate on Milk-V Jupiter
Date: Tue, 19 May 2026 06:12:35 +0200
Message-ID: <20260519041458.3287843-2-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519041458.3287843-1-aurelien@aurel32.net>
References: <20260519041458.3287843-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_211518_185793_4536C068 
X-CRM114-Status: GOOD (  10.34  )
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

Because the default console's baud rate is not set, defconfig kernels do
not have any serial output on this platform. Set the baud rate to
115200, matching what is used by U-Boot etc on this platform.

See-also: 24c12ca43b12c ("dts: spacemit: set console baud rate on bpif3")
Fixes: 5b90a3d6092d9 ("riscv: dts: spacemit: Add Milk-V Jupiter board device tree")
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

v2: no changes

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 95c35154da96d..9b1dfddf2bac5 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -21,7 +21,7 @@ aliases {
 	};
 
 	chosen {
-		stdout-path = "serial0";
+		stdout-path = "serial0:115200n8";
 	};
 
 	leds {
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
