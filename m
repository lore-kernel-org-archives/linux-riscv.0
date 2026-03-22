Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A0DD58CA9
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Mar 2026 20:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=erC86Dj55k/3hyBoIchFvmeHQiB/qMY39n/GAQdgABk=; b=rUalkEjPjAiQwA
	ZCx+fM1oaQZktvpAXiHQVboxIlV6Kl1kEb4PJSYC6jHRXRsJiPqmNWXL55/1726JTQpfLHzrjs9El
	3fJpxIe8sAxNb5UmLGuB35tSkfzsduWiDlWogDgAIVipiEji2wUp4WsQ0ONIYO2M8XRxqYE78PlML
	DqptZZLt3ZMOWxiUw9yGSSTeVCYJ9l6H1gsUlUjmrGx6C+VBF0gu/bqA37Yz13JJGXv0TR3U9811A
	omhrFFa5GCiPqkuA5lAJqX8mvnvqsGzJVRxQ7IpnKTzTiVGEiR+Ug2mUzsGQ+Aw9UQ6LnUrz/0XIt
	ljquZtMrBXDs9ApBlYWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4PV2-0000000FdyR-3BJ2;
	Sun, 22 Mar 2026 20:34:16 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4PUz-0000000Fdvk-26fG
	for linux-riscv@lists.infradead.org;
	Sun, 22 Mar 2026 20:34:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=mkmin+8R4y9Bt/u7qbGdhBTJiWo5NovMdSsDVKb9cOU=; b=ibKSkx3e8/KCDizysi1x6SaJaX
	cUqVcopPZITy1XEWpGQLCNCUC+En+sv7CueSvNM54yHgwRdPmJ3YvBfDvhZvUVox7C/sB2wRXpCqp
	bKUYmrMcl0o5C2Rb/mWpbhVozC93cVl9r0OkoHU8f3HVlj9FOyGr6e4/Ufcsc1zBnmLzsRZm5Y424
	+WEtFJUufqi+oACjEoAMbd8KvuUXDevxqsqRmhpd3M7s7vz4f4SdUuOjxd+FX5tr0n4yp9Llqt616
	l51JwNM73km5inJMFLeuigmD+1kiUwSjbbV9qME8uKJGRP6g0NFqfn4AoIngkpm7rI/fDON+dXTGX
	00dERMrQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w4PUx-0000000Aseb-2Ja8;
	Sun, 22 Mar 2026 21:34:11 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 3/6] riscv: dts: spacemit: add i2c aliases on Milk-V Jupiter
Date: Sun, 22 Mar 2026 21:28:34 +0100
Message-ID: <20260322203356.2206927-4-aurelien@aurel32.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260322203356.2206927-1-aurelien@aurel32.net>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_133413_556775_1D9AC5DB 
X-CRM114-Status: UNSURE (   8.47  )
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

Add i2c aliases for i2c2 and i2c8 on Milk-V Jupiter. This is useful to
keep a stable number for the /dev entries after loading the i2c-dev
module.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index bd48208a370cf..836311c3f035c 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -15,6 +15,8 @@ aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
 		serial0 = &uart0;
+		i2c2 = &i2c2;
+		i2c8 = &i2c8;
 	};
 
 	chosen {
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
