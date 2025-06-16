Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E1AC7115C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jun 2025 12:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vvo+W7dkLcrpOuxIc5bsTQp9krF8DMqRUgJrELWW1+k=; b=hs09S+deDVn2W1
	1CEZwL9iRQkoIhkEghKNHFhKn+WfX2myZBYwQYC/sB47U/LVdv5scy/X71wRlUNuMR5H6unwK8tD3
	06oNKZV/OZQMPlO3YkZlgvwrCF9k7oha+27pzBaWbF8iqxxi52BivjuPaaWFQPv5+HiJpBmaYeD6T
	rNJ9wEih82ovve0SB6FnUTpLVxXrHFY6m+ET/tot1YprLMNQKujsSKpxmV0SDlaYqnTTDPy4YrLiC
	MkHW9hzdv3CJINcq+dcxv/a8hIf+HKLrZH5Sb2YscZwm6kUqA+/pocH+aBfzdN7lTt6IWV6lz12FO
	qFd8tdNwYJ5IsdNbbH+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8na-00000004L6F-1Izx;
	Mon, 16 Jun 2025 12:18:50 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7vy-00000004Baz-2FvW
	for linux-riscv@lists.infradead.org;
	Mon, 16 Jun 2025 11:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=1173; q=dns/txt;
  s=NAESA-Selector1; t=1750073007; x=1781609007;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=28J+fyT9lX5TecGCCbT96HUMwY1IUJIWz/FmodfdxZs=;
  b=ON1J6BzV0hrQCfd+mVlCM4oOhTrcSfodDWfvazFtZblfgNtDttpOdzzh
   LowDAZucjwgZmvWd782zFx+nWQeqzYq2LybLel1SDE3Cp3WSt+H9gizhn
   epmyM8z3KK2IG45hSgK3Eo6n8Y03gAR6SakiZ2BMDtsiDF1mZaqxlLwnt
   8phh8jCfFWVxm7lN+5KQIMYhd1gho0CPOyMjTR0vsMvBn2kFOo1iUkIMN
   DOJ/OZKjWYJwSiHJwHgil2iv8JceXE6TtMgnAk0Ea5Sir08J9/ba2nXnw
   hjsjEKv1YKCNwsKq/8TgO7I8VBMXmV9YoEAlOijEIMveySad0YknCwzQH
   Q==;
X-CSE-ConnectionGUID: zFsg+F3fS5qAPPOXYLnn7w==
X-CSE-MsgGUID: cBUNmWcbRC6OL6o8xXuxBA==
X-IronPort-AV: E=Sophos;i="6.16,241,1744092000"; 
   d="scan'208";a="26863662"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 16 Jun 2025 05:23:21 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Mon, 16 Jun 2025 16:53:16 +0530
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
Subject: [PATCH v4 3/7] dt-bindings: vendor-prefixes: add eswin
Date: Mon, 16 Jun 2025 16:53:12 +0530
Message-Id: <20250616112316.3833343-4-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250616112316.3833343-1-pinkesh.vaghela@einfochips.com>
References: <20250616112316.3833343-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 16 Jun 2025 11:23:16.0546 (UTC) FILETIME=[0E253A20:01DBDEB1]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_042326_677886_39B524E3 
X-CRM114-Status: UNSURE (   7.99  )
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
index 5d2a7a8d3ac6..f19a1de2a76d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -498,6 +498,8 @@ patternProperties:
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
