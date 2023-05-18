Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5631CC7EE2A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 18:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gfo2Fd/QE0SX2rkfg0SnxWgQedMPVncRJQWsqNyC2wM=; b=Ktj6KJdT9+IK4Z
	uf8EzDuxyxHd16UO+PMOLexC0yxzW334h54Bv3Eaoym1UkYkLU5g470wPtIZm+BKuGooYolJKdINF
	Xl21izcbYcXGNZOG1F13HJJrrCpWIYZ9gQx3govXK+n0oFMbN+/t8hovJIHuKTP54LNUczAK7E+6O
	Wx06hLSoNpKn7eLF5/A0pvFNeJJqGmZ3ke0Rt5GyDztcGYn2NWuBhZh4BPlRd8/LiHf1vsFTyVPT4
	juKrby3HKMsHN1ZcMwFeznkVy+8D7I6l10hrsPmuDdgu9BNXN0FEXacBA9DJZpdLix/DJassq+rq4
	GDZOFM8+QLxqIRIlLTFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzio6-00DssJ-06;
	Thu, 18 May 2023 18:56:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzio4-00DsrS-03
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 18:56:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8D1F661017;
	Thu, 18 May 2023 18:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371ABC433A1;
	Thu, 18 May 2023 18:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684436215;
	bh=hH6Or+D9CJEmJbCMZBOXhGK6nn9vuBMRv9LnXKOB0J4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qLyl0D4TopzJyU9z00h+qUgzbvSNep9xMKXs82tfn2tXobCqsXKxFun0hWCXKKrhi
	 2Y5YBJez9Iy550P/WzkKhFWjRzuD0CVk16r1eeG9+odRnAsKUJk01JdR3EdedXAMU9
	 d36D2huVwKnUyJwx4bG5FWdfEcNnHM4zGBwbFkMuAu13QYHNDKThVG2kPvL3xq9wNg
	 FtFoCZftuQ55acPYFUfjcjynVMBJ1f/g3BYPBgmK/EZ0ypIkai4uxt10EE3LqHC2wl
	 t9nh4q7/ZE0TQ0lgu8RVDA+4ndCAbYzakt9Zz4zqh37fHXrOYuDghWLNL+s5eyWijr
	 wSFfn/LWmPsSw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v2 1/9] dt-bindings: interrupt-controller: Add T-HEAD's TH1520 PLIC
Date: Fri, 19 May 2023 02:45:33 +0800
Message-Id: <20230518184541.2627-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230518184541.2627-1-jszhang@kernel.org>
References: <20230518184541.2627-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_115656_096522_42AC176C 
X-CRM114-Status: UNSURE (   9.62  )
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
Cc: devicetree@vger.kernel.org, Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Wei Fu <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add compatible string for T-HEAD TH1520 plic.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index f75736a061af..0fa9b862e4a5 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -65,6 +65,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-plic
+              - thead,th1520-plic
           - const: thead,c900-plic
       - items:
           - const: sifive,plic-1.0.0
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
