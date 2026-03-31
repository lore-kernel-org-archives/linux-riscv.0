Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81AFFF60C0
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 03:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:References:To:In-Reply-To:
	Mime-Version:Message-Id:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iZVhyVXTPAalIsbUJCcgs5StsKmXXUKvPZQTufzgW2I=; b=f31nGSCAneNvQJ
	UYmIhZU28HdKJ40fu/Subc1gtnguP9d6PorFrgiQuo2u1JUMPpDNPo37efCEzARZzDX+vnZF2VmF4
	pV6Asuofs0YFvwJpdfnVjeydO9jUCXcYyq/kaVJuv0W/Tz/mgpKLOydOs5sJ/Nqg3DJ+IrBFuscb1
	A/tbeLz6HrSU+GA9/CrW7m/f3czoFVwS1GKOxDsicmfBww+hdTgUcB6WCwD7z1kDIl0eG9Vfqoi69
	11TdEkRnjuBhcCnU1d/t8KTihTfMQ4pdHNCfP4zMjX015MMxJ87yop4u1r1+vrrr+diJXjUNdn7j1
	HTJqjhCVsnQvnltcxfxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Q8I-0000000CFX1-1lHJ;
	Tue, 31 Mar 2026 03:51:14 +0000
Received: from sg-3-41.ptr.tlmpb.com ([101.45.255.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Q8C-0000000CFWg-4B1U
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 03:51:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1774928756;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=8ZrGJtuUZUqfsJ/vLx0Y6+SpVnJ2IBWTOzQzaZB9Dm0=;
 b=R5fjyXGGdW5kOIffatPfw3VxatUWlKXgItoC58HBj7/fjaqPogxluulpDO80YOcRQ2i8yG
 17vWL8Uqxi4/cp6o/mQe/sfIUy3Wm0dxIBtr7/vLiSkZy0vMvDJIiyGMphbQ2+mVHaX+k6
 e/f11wjLA1eUHAkf+l0b+0ys1wpwC7QJP/6lY+4ZHSpWybrM4/Z/zvxG1Gqv8CQWC+sv+/
 NL4jFA9whJ10rPYQzSlAaDhiOnB9BkPKycvug6Rgwk9z1OntQVXbn3qNM/2aFb6/kgcJfl
 V2u87EJH49MJjyP+joJxUetxRTEEP2LfzFdfqyfM3VSxBAoUNbGsfkdq9e6VUw==
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Date: Tue, 31 Mar 2026 11:45:39 +0800
Message-Id: <20260331034539.67167-1-sandie.cao@deepcomputing.io>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+269cb4372+791dd9+lists.infradead.org+sandie.cao@deepcomputing.io>
In-Reply-To: <20260331034423.67142-1-sandie.cao@deepcomputing.io>
To: "Conor Dooley" <conor+dt@kernel.org>
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([121.34.226.213]) by smtp.feishu.cn with ESMTPS; Tue, 31 Mar 2026 11:45:53 +0800
Cc: "Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Yixun Lan" <dlan@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"sandiecao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v1 1/2] dt-bindings: riscv: spacemit: add deepcomputing,fml13v05
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_205111_155076_CE0A0686 
X-CRM114-Status: UNSURE (   4.09  )
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

From: sandiecao <sandie.cao@deepcomputing.io>

Document the compatible string for the Deepcomputing fml13v05.
It's based on the SpacemiT K3 RISC-V SoC and is designed for the Framework
Laptop 13 Chassis, which has (Framework) SKU FRANHQ0001.

Signed-off-by: sandiecao <sandie.cao@deepcomputing.io>
Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
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
