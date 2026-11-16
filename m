Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F39B606A31C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 09:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f2qb9+FO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=B7+EF4uh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:References:From:In-Reply-To:
	Mime-Version:Message-Id:To:Cc:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TcCqqLPMHsHVL6KZKiaFOuTH729I1vHwVFJO318HOcE=; b=f2qb9+FOVy+4hv3cjwKpIas2RN
	4ap3KgWd2QemHOUhtJgvHRuIXRZJsEcx5vQAmZyF1nLR8T33RFty9GuSTO+nZyyPepnD+M7eWqSHf
	xvQkmSaPxpqC/l7O8uvHOQqcQtw4oQd6uuWLJEkutIDi7M1G1Na7d1WTeON2YNoQ7N51pEOzNCIGn
	sRjciq6AgwORQlgfEbaHubsFjBz+eJ7EYoSk4GbkTeX72yAGWxtPrfdv4gbtge3TZgM70OxCu775w
	zRdgQpxM0+44BekPEXuQYp2CTLkF/m5WrGqgj2wGMlbp/DMPvtSHJBgXC+UZG3luQKbk94FNYIYRe
	cv2OLfFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsZC-00000001hBX-0R7p;
	Mon, 16 Nov 2026 08:59:58 +0000
Received: from va-2-27.ptr.blmpb.com ([209.127.231.27])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsZ8-00000001hAL-3iYQ
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 08:59:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794819582;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=wDWEXwe8AW1hlFGCAnSTPGrmDVIAcZLcqbjkcavMCf8=;
 b=B7+EF4uhicyPQGXKSpOFBopY+i2Ck6ckB/nrzI6Hef6mmJYZxxltXDMgOh8rp8uuWQcrWK
 ykF6ftasPWSl2vM6tVV/4fhrFkAgJWSaSIGqswau1L8zu0nyiVS4Q+7jGv6doQX2MLDU8R
 loYn966+DVEMsNwPW8JxIo+a4nKrc3GnCZkpgxKFXAadB9tHqyY+3bPgFrOsy0jwrjZ/Zf
 7m3gx5gsDdyzgjiHBxfJRpmYdDCD6YLixUwO8x5POjFzK/aXva4jeFdoGYe3SNM5YJ6L1y
 OB5tUDkdg4vD3PTqWoUNtJe4tyB6rdA4Xu837WJJJlKMWRrDZXrKqdaFJGs1ig==
Subject: [PATCH 3/5] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add rfkill node for Bluetooth
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([218.17.141.187]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 16:59:39 +0800
X-Mailer: git-send-email 2.43.0
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Message-Id: <20261116085930.951304-1-sandie.cao@deepcomputing.io>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26afac5fc+edbb60+lists.infradead.org+sandie.cao@deepcomputing.io>
In-Reply-To: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
References: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
Date: Mon, 16 Nov 2026 16:59:30 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_005955_481297_57D655DA 
X-CRM114-Status: UNSURE (   5.73  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expose the Bluetooth enable signal of the FML13V05 as an rfkill-gpio
device so the Bluetooth driver or userspace can toggle it, following
the K3 Pico-ITX board.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index f84225cda1e9..8c12fd01227b 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -37,6 +37,13 @@ rfkill-pcie-wlan {
 		radio-type = "wlan";
 		shutdown-gpios = <&gpio K3_GPIO(35) GPIO_ACTIVE_HIGH>;
 	};
+
+	rfkill-usb-bt {
+		compatible = "rfkill-gpio";
+		label = "rfkill-usb-bt";
+		radio-type = "bluetooth";
+		shutdown-gpios = <&gpio K3_GPIO(30) GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &i2c8 {
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
