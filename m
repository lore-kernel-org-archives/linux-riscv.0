Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494C1CD98DA
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 12:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b4CZH2jaVpcnd2MdiT3VI6OWY67qYu5hjfjzwevSV+I=; b=d0nItJ9JMo6Scd
	l5PgLWct97cKs993sQt7ha/nlpFXvlEeetJYGrLQaGJuuSSW7MMy7s/5EF0I4JNsmcQVENWLC1ay3
	BrUA1iG7c+LAR5ieg2eQzO6ZmqUSa0AXAuOl+pvUhDNxc/d9bica/az4tSN1uydiOD+n3OjvoAcUR
	Oy9Jka6C2fcy0h+YbF/a+c7AO3zvEX5fekha0uMeUqUcxI13NBqgOzNvU4EMU4UZoVI6iXDKV3wnE
	PGRVGq3CQFz6x7QH+07obqg5s37PgzPHgQjgNtkeZqGATrmjbbMn5iObF2gd9qHJITiU1cJvLcNFz
	jU0s0ZDOAxGta7JOUPWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Ii-0000000E9tF-3pCi;
	Mon, 15 Jun 2026 12:20:24 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Ig-0000000E9rs-3u7t
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 12:20:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=908; q=dns/txt;
  s=NAESA-Selector1; t=1781526023; x=1813062023;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5/2A2ZLlbiY9nslJ7nQB+Yn+IkxiipPp1ULDmEpmnRE=;
  b=rUGIptComomOPDEK0Q4BCeq1wk9poEQl0Jq+GPZuk2KTmsKNpzhQTQEK
   VERPRNH14yQXH5XdHVjfD3eiZu9UXrNsJLVwEdnLSsx6PydgTAB3lzVxC
   hRupsm6fdFrBeDzAvEsXr4WBpCJrjbuJQ/CtwrbR4lW5tvduK9rca1EJW
   Ym9ZA5QDYDjf9TFZ8FhljEuLELlw7Q9TjuZLJLKP9wVOeWhW+NcXV43ot
   ezVx04Wiv0tNfYRVkBDhQfsoI4coAg4cU+nkF3/yLgPWuFtj8EQBfvDkd
   aGKmutH7Mr0nY43GM0iIWTjKrLj3qWnWkNKQuwTc4GPSVXV3DAUP8zFFh
   g==;
X-CSE-ConnectionGUID: HRmWUttISSalw4ff1zKvHg==
X-CSE-MsgGUID: wsWZvc9cTvW0gcmKUZk3Xw==
X-IronPort-AV: E=Sophos;i="6.24,206,1774332000"; 
   d="scan'208";a="55984198"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 15 Jun 2026 06:20:19 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.20348.1);
	 Mon, 15 Jun 2026 17:50:16 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>
Cc: Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: [PATCH 1/7] riscv: dts: eswin: add reset generator for EIC7700 SoC
Date: Mon, 15 Jun 2026 17:50:10 +0530
Message-Id: <20260615122016.1110206-2-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
References: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 15 Jun 2026 12:20:16.0851 (UTC) FILETIME=[532B5A30:01DCFCC1]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_052023_025783_D3700665 
X-CRM114-Status: UNSURE (   7.66  )
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

Add reset generator node for EIC7700 SoC

Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
---
 arch/riscv/boot/dts/eswin/eic7700.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
index c3ed93008bca..430a210f01e6 100644
--- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
+++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
@@ -4,6 +4,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/reset/eswin,eic7700-reset.h>
 
 / {
 	#address-cells = <2>;
@@ -341,5 +342,11 @@ gpioD: gpio-port@3 {
 				#gpio-cells = <2>;
 			};
 		};
+
+		reset: reset-controller@51828300 {
+			compatible = "eswin,eic7700-reset";
+			reg = <0x0 0x51828300 0x0 0x200>;
+			#reset-cells = <1>;
+		};
 	};
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
