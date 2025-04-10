Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253FFC369AA
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 16:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gT/ONPx0R4TIIKY4pvxG8eLUnFQc8rFtJuI0aRO1j6A=; b=Esdo/uRI9Pf2QK
	czh5t87G4LiltwG+6eMgHIG0MGTQ81O4a5aFxkE67l4kjBm8Y1KGB41W6tO9JxEAIHtZt7U0Lhle0
	A0Z8Em6dglBSeIJ6fBFzNz7YZ8bwE8/zWhQ7iu39CLs1FAkvph4uTnKCRbOxUS9qVo9IGgltsKWcZ
	kNhWy308OKlKnSIAU8O0vAKq7UZlDbOLs9VwJIK1XBa9nm4jx3Bi4PMiE+KsYmH2OiD/Eum14pikj
	YL9a6kM3hJbL8IYI3loWerGIVIKrGvHqPqqTqyRakbrrw0APY5WFa0wAMPe4dSqd3Te8JxWtY1hiu
	m9C4h29BZQOhRuIaD1nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ugl-0000000BA8O-3Wrf;
	Thu, 10 Apr 2025 16:23:39 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tmS-0000000B0RB-0QX6
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 15:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=1173; q=dns/txt;
  s=NAESA-Selector1; t=1744298728; x=1775834728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Wx6xepkcAiuz7G3josSOL45f+4BRjUJ/PxSWGlM+gtY=;
  b=TiHgHzSbzQFS0MTkbCAfJ6Z8QwGUAAf+NyK6zWSVyuKbAX8zHQxEuhy+
   BA4AckHAoG0XcInbu+M1tAGi7hRxkjNRba82EcY2hPsBaZ+SKcsKi6cEb
   a9Au5/zcCgHqNzhz4HYq2XKHrW9WwzAnY1XH95Oey/hzt6wtCnBXYlkFy
   7fAh4M0hxVj5edt5KKViFzmrxaZTmzD+ax20nsF2514b3uiSyGpCC2Rsq
   qYGossxHUnJQEuA1SznLVVzu8ehCw1Pnt6kdfj2TtPXkBJP6DTc8s1GQA
   eJ6Zlk7L6RhnrYtHYPrHtRK9AnaAaZRnQLl3BhW7pXbFeqi/E/CddlmVK
   A==;
X-CSE-ConnectionGUID: GYOEZZuBQBuiZybKA54CtQ==
X-CSE-MsgGUID: /9VxrZieR0GmExHkjLTE5g==
X-IronPort-AV: E=Sophos;i="6.15,202,1739862000"; 
   d="scan'208";a="22515079"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 10 Apr 2025 09:25:24 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Thu, 10 Apr 2025 20:55:19 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/10] dt-bindings: vendor-prefixes: add eswin
Date: Thu, 10 Apr 2025 20:55:12 +0530
Message-Id: <20250410152519.1358964-4-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 10 Apr 2025 15:25:19.0726 (UTC) FILETIME=[C4F560E0:01DBAA2C]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_082528_207227_81060795 
X-CRM114-Status: UNSURE (   7.43  )
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

Add new vendor string to dt bindings.
This new vendor string is used by
- ESWIN EIC770X SoC
- HiFive Premier P550 board which uses EIC7700 SoC.

Link: https://www.eswin.com/en/
Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 411fd65e0bde..ce881d9c96a4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -494,6 +494,8 @@ patternProperties:
     description: Espressif Systems Co. Ltd.
   "^est,.*":
     description: ESTeem Wireless Modems
+  "^eswin,.*":
+    description: Beijing ESWIN Technology Group Co. Ltd.
   "^ettus,.*":
     description: NI Ettus Research
   "^eukrea,.*":
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
