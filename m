Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5463C369A9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 16:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XKr6iiqsF/4njot5dK+jCyQWiwwO75H7G+RlT7EQxcc=; b=qL9XVR/d8toAPX
	Pmnj7rdrXefoyE7E7hzo9f29tcFThGU5JdFD4FAvnQkvWZlZAvsnpdFjjk2kSbwGRZo8uQ3XyIO57
	T0Zs5zw7G+lGkg3XNmhg1xu9AebCGkfNdc2at27SLtZ6tH/f8Ek0px1R2j/o2CFZ93CrROV9rZ7ox
	Np1uVQhmm8egovkT3UTSwOPN4+f/8bbCdCeRVQQ7fmYqSFyWa0J9h3il4o9eBAL6aUBLa7Ghw6pH/
	1inV/+0L998Qh6mnEfX3XuvFQAelnlI3oh5PiNvXHbZzUF4XBnAi+YG8L3WAyiOzFpBfWgcbV4hRy
	kvfpM9jfJc1DmFNeg0yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ugk-0000000BA7X-2NLO;
	Thu, 10 Apr 2025 16:23:38 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tmR-0000000B0Rd-0cjN
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 15:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=984; q=dns/txt;
  s=NAESA-Selector1; t=1744298727; x=1775834727;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=48tAi45I8uFpjXnUr6Whz6NO1YAMjCklEIDkcMApDYw=;
  b=TstH2Kff24fVYcAWA3eJ//LYmiGNU013OuvTvyO0JupgUL4suW3nwOoB
   dngsPUwhpXBZ/W8ge1TnBwSevSY3YdbR+7nExe14vIY4wVoqtyYTI8DYK
   p3OIwk+yjnChiLiZJbe7IptuOMq0E050G4RApEIvx44HVzMeF3+1l8TR7
   Vg3cYj4WEC9CGRWO5v+8GtC6lRsQhcC320hIYZwwNtfpC9dVYjVnJGw+8
   uY5P20CLlozFQ06GxHpASVeeYF9R79b2tpxQuxacZqySzx+pMp2TuTm54
   FW6Yn9Z9Bz2LEHxRUNFIkak/ic9Pt0zLdH6b5E1ScFeGLbkrefh4YmXUP
   Q==;
X-CSE-ConnectionGUID: IsH8aDpRRUqsca5w1+kGRw==
X-CSE-MsgGUID: zEydP1m9QB2HaMNjJexSKg==
X-IronPort-AV: E=Sophos;i="6.15,202,1739862000"; 
   d="scan'208";a="22515071"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 10 Apr 2025 09:25:22 -0600
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
Subject: [PATCH v3 01/10] dt-bindings: riscv: Add SiFive P550 CPU compatible
Date: Thu, 10 Apr 2025 20:55:10 +0530
Message-Id: <20250410152519.1358964-2-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 10 Apr 2025 15:25:19.0615 (UTC) FILETIME=[C4E470F0:01DBAA2C]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_082527_268396_A785669D 
X-CRM114-Status: UNSURE (   6.79  )
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
