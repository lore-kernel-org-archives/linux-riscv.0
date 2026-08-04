Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6225AC55ABA
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 10:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iNI9X3vCIiWAwGyQadiwejN8lbplRzbNe663tvACu5Y=; b=Lzd3QyDkCeFFkv
	cfb1f+STNYPdux55GIYhy5drCdNvAId3lvtixIOGCj7y/2YqxU9gRdM2OqoiLjRbVTWQBjPACQmuQ
	RIlWJWjvJDfc1Lrbu/I743y3G9WviqBEqioVJW8g7lRo7/gcQcnku9BHdjDBkO/O/ONe3rJAMe0EN
	pL/cD2Wmn7auZvL5Mmh6zHv1h0ueexuOqYr74r9v2qoMNp4E4es+X0iz9dKq4nobVHmuw9cYl0O18
	vY2mTntM/1wTAewK0zUmyCF36wKvx1JjxuBR/jAw8WmrjCkDcqKbobQIk7XnWTL4iD8DBflmkoudF
	/Mxk34ZZSDkrW0zksBng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCdX-00000001a9S-3wPZ;
	Tue, 04 Aug 2026 10:44:43 +0000
Received: from naesa03.arrow.com ([216.150.161.23])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCdU-00000001a36-3d98
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 10:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=1013; q=dns/txt;
  s=NAESA-Selector1; t=1785840280; x=1817376280;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RFCB65wa4dZGmLVFZqs+LWJsSkVireZtnJei79QMCq4=;
  b=F4iP1o9rkBcyHpt06xz3ifeWPuKusK2p7S0yn1sxdrHry/eeBGZ6junr
   Z0nc1zkqo/Q6e05gU5RspJMccQVurls+kzIxa3+YrugJeKqGA00I43Vrf
   bf2HYjWAcZ/g8Ajpjv+Zunz3o1iL0jnTqYj/o4KDgB+E+Vt3Me6fgYbI+
   XNVOyJvcGArrl3UuUzlBX5ZplT1SUCBn318EIlZxtWJd+L7ccpmZVhIYj
   7Q98LwCZxI9T2KAkHPE9whem53jK72lTXTfUORr6kcbFbYbOWLRjqn9g+
   uBkZWfpXGGwx6z6WMIr/39fXb73LgzIoO0hXBIAIodXwd+igXKLIaAGBb
   g==;
X-CSE-ConnectionGUID: aWJGWDg3Twa51NoJb+xMKg==
X-CSE-MsgGUID: lFFPgAm9TgqMEoSF8/Ek7g==
X-IronPort-AV: E=Sophos;i="6.25,204,1779170400"; 
   d="scan'208";a="119081816"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa03out.arrow.com with ESMTP; 04 Aug 2026 04:44:40 -0600
Received: from AHMCPU1888.localdomain ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.20348.1);
	 Tue, 4 Aug 2026 16:14:31 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>
Cc: Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: [PATCH v3 6/8] dt-bindings: i2c: dw: add ESWIN EIC7700 SoC I2C controller
Date: Tue,  4 Aug 2026 16:14:29 +0530
Message-Id: <20260804104431.1391839-7-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260804104431.1391839-1-pinkesh.vaghela@einfochips.com>
References: <20260804104431.1391839-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 04 Aug 2026 10:44:31.0806 (UTC) FILETIME=[3B828DE0:01DD23FE]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_034440_960744_7A2B6557 
X-CRM114-Status: UNSURE (   5.90  )
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

From: Pritesh Patel <pritesh.patel@einfochips.com>

Add compatible string for the DesignWare-based I2C controllers present
in ESWIN EIC7700 SoC.

Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
---
 Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index 467bdcbb8538..ea3d4d4c299f 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -40,6 +40,7 @@ properties:
           - const: snps,designware-i2c
       - items:
           - enum:
+              - eswin,eic7700-i2c
               - mobileye,eyeq6lplus-i2c
               - mscc,ocelot-i2c
               - sophgo,sg2044-i2c
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
