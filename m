Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A08CFB519B
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 05:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:Mime-Version:
	Message-Id:Subject:Date:From:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bGH1ijzOMEd3pyZNz5lY1y9hnMXit1wNi6wscp918mo=; b=xuV64WOIwYjtxN
	KXUTI8VG5G56K7pABDS9GDlY+WLHdMgLKiIoSG697H0Rl7kRZAJLDYEQ3LTkOoDGCWnlO5dfqvrEE
	8Qmv6b8JwS4xJVbyw+6t9/JJoxXrndYupdUwGeUjUDCLtxndjlP8jUvW5fyx1aOEu+OIEn4IQqCty
	7f3x3Ry2y+rS6xAZHuGcz+sbbvmz/ouTos2Y38RNZ6r6zHuXOJOeiYRwenRzuVD1DgJICGO48en7Q
	nEF8zQEDq+wg3LZJiDC5vHWcZxGWN4tCSnAZa5yAII4CKgjwni5/REHjKbCXF7U8C0mOt4UTgAo/T
	TYTrFO8SIOeGXBc5QCIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9zRN-00000005xOY-3W6f;
	Tue, 07 Apr 2026 05:57:33 +0000
Received: from va-2-30.ptr.blmpb.com ([209.127.231.30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9zRL-00000005xO4-1qgE
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 05:57:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1775541446;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=pbcWRNal8Au0QhSjQPOsXBbyLTIaEzxxGdM+7rilYnY=;
 b=SQ14HydWFFTJFuAcQBsXRnDe0fzbvMV65urDlVcAHsL3WGqfl/Zr3uObBSswpp7BjBk9kl
 7UdJViigM0t9trPKTZ658yJWpoMmf1RyvIBqfN/mMA1dSFfiZA37BXEnuTewNsFamXOibD
 klSX2wGxaK46DHXWwqB9+FPQkLbUPe31EM5u51u3oT3j6EXIaqORKeIobKb/BBDHHrgFiz
 A83fSTjSMhesZWP4sHrQU2OH0NPw+DSUiG/79PirfWDpxtwMa8KOEHQJjQ4g9032F4lH7I
 5T+q6I44kkHvZyXSjP6oS2mgo0fiZnX3uwMhQ90tYoStgTAhwuDq1fo7juewuw==
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Date: Tue,  7 Apr 2026 13:57:07 +0800
X-Mailer: git-send-email 2.43.0
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Subject: [PATCH v3 1/2] dt-bindings: riscv: spacemit: add deepcomputing,fml13v05
Message-Id: <20260407055707.1202730-1-sandie.cao@deepcomputing.io>
Mime-Version: 1.0
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([218.17.141.187]) by smtp.feishu.cn with ESMTPS; Tue, 07 Apr 2026 13:57:23 +0800
X-Lms-Return-Path: <lba+269d49cc4+07863d+lists.infradead.org+sandie.cao@deepcomputing.io>
Cc: "Conor Dooley" <conor+dt@kernel.org>, 
	"Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
In-Reply-To: <20260407055557.1202713-1-sandie.cao@deepcomputing.io>
References: <20260407055557.1202713-1-sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_225731_588364_D776FB05 
X-CRM114-Status: UNSURE (   4.48  )
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

Document the compatible string for the Deepcomputing fml13v05.
It's based on the SpacemiT K3 RISC-V SoC and is designed for the Framework
Laptop 13 Chassis, which has (Framework) SKU FRANHQ0001.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index b958b94a924d..af8030242bdc 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -29,6 +29,7 @@ properties:
           - const: spacemit,k1
       - items:
           - enum:
+              - deepcomputing,fml13v05
               - spacemit,k3-pico-itx
           - const: spacemit,k3
 
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
