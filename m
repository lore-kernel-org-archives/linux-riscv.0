Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4464AC71155
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jun 2025 12:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XKr6iiqsF/4njot5dK+jCyQWiwwO75H7G+RlT7EQxcc=; b=MvGryPWt2eqesT
	SG0njROj2BeYP4aqyKcfiRycTkmKPIq05aA5YjaBOEJ5vKXuu4yP4zg93nt6+CmbAESAYXYvhFePC
	FUzp2II5la59vn8t6gGP4+jQEw3cYxxzgvH+Z99BYV2L2dVV+FuO9iyVlObq9jXQUiRaR+6m7bL45
	A7rBesKhpYiVVpCdPDTF1NBH1bedjz2PWvLS6a/C15xI0iFpYE8liezEYFshm8/bTGzR6bRXInwPP
	0nEo3OS/Vv4sUnz5A7ET5Z6GjO2VO5sp77GWtLlq3vx1pJJcVVam31c7yTvZzMN8Qua2LEssipfOu
	+gpih33Xsh/wqTxzr4/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8nX-00000004L46-1b4l;
	Mon, 16 Jun 2025 12:18:47 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7vx-00000004Baz-12VJ
	for linux-riscv@lists.infradead.org;
	Mon, 16 Jun 2025 11:23:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=984; q=dns/txt;
  s=NAESA-Selector1; t=1750073005; x=1781609005;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=48tAi45I8uFpjXnUr6Whz6NO1YAMjCklEIDkcMApDYw=;
  b=MqV5Yr5+AwYbiTOsEO6W5DQ7sN/36dlQDhC0Ghsfp8j5+9fXXr8epg7Q
   zAeTatuF1OxFlxfQNLAME984Z8x1JsdFfnpxNyATPyTaIr96Nuu8Vb5DB
   YwsqYfosNNXeRcJiloTGHMjUjQ2Px446k5jX9f115NG+ocsliayfZ/CK3
   5O7BwpAtfvioAZK55YsIc3ptE3Xp0uymJlh0rlCwkBitRZpFVgJT4mQKa
   g1TufSvGZVwTSyKzPILr+3ZcU2830NKmvMzW86WN8HZJW1kELF+aylr21
   ObnmAdn0NTh+Suc9sHSb6OqFbcUZ1JzHf5zTITeAYbJNGoc+QDSetIIo6
   w==;
X-CSE-ConnectionGUID: 7XjyxlTSQ8G0+C5maKRv5Q==
X-CSE-MsgGUID: 5HKYSArfQjmS4WlfP818lg==
X-IronPort-AV: E=Sophos;i="6.16,241,1744092000"; 
   d="scan'208";a="26863649"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 16 Jun 2025 05:23:18 -0600
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
Subject: [PATCH v4 1/7] dt-bindings: riscv: Add SiFive P550 CPU compatible
Date: Mon, 16 Jun 2025 16:53:10 +0530
Message-Id: <20250616112316.3833343-2-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250616112316.3833343-1-pinkesh.vaghela@einfochips.com>
References: <20250616112316.3833343-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 16 Jun 2025 11:23:16.0421 (UTC) FILETIME=[0E122750:01DBDEB1]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_042325_347961_ACFCE6DF 
X-CRM114-Status: UNSURE (   7.35  )
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

From: Darshan Prajapati <darshan.prajapati@einfochips.com>

Update Documentation for supporting SiFive P550 based CPU

Signed-off-by: Darshan Prajapati <darshan.prajapati@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 2c72f148a74b..3ee7468001f6 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -51,6 +51,7 @@ properties:
               - sifive,e5
               - sifive,e7
               - sifive,e71
+              - sifive,p550
               - sifive,rocket0
               - sifive,s7
               - sifive,u5
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
