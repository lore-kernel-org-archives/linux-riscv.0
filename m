Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892C7C54E58
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 12:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7ZcxgJMDEcF1ZtQwhuXye85QbL0opjF40NY4HDWyWA=; b=XFzEqGPzo/ceok
	nX5OOfVVdOYj1ZpqUPM2pusTGrNSU3YyZ1UAAKEWdGdCawE5k6A4R6E0OkQQz0OadfPz6rGbu8GoB
	I8DUYtSfCRxNB2wnSczuMR/CRU/KOuJcW6fInX5vHeViOOn1uzIsPGDoHUaby1hf7SemT6r9AWiXo
	i8xyP2Le8h7YP5QciPfyBsUDpw/rDKe05Z3XosdHAjk9FCmJ2SFbXJhjfgOUTsKinehfUohEVWsIa
	lhbFYw+weDqAYbh0Mc1/dIqXCnOKjrkj4MfiCVCrF4EZOfSuHE/CccMNb6S6F/gHYAD9XtqNM6Xzv
	pfJ8jJvtJFY+pz6nMPBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro0F8-0000000AKcx-2RKE;
	Sat, 23 Mar 2024 12:12:58 +0000
Received: from out203-205-221-233.mail.qq.com ([203.205.221.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro0F5-0000000AKb5-03Of
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 12:12:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1711195967; bh=rcU9GmGkfYObnRvy+6sIXXI4nFg1KITAK23jcYZUxzQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=upNpY1qVU9E881cMsUqmNFhtpMVIzGT5sbW6liaSbvAbFCDUTz5hRpZzKYPUwolaz
	 U0LqrL11TJofbymw0ovMkhodQrp5Q7D6ZGDx9ha6nKo5ffbALzfETU/gp4f1vCFc4r
	 9ByU/kyaKswTp/c/WNcxQkO7Q7zaPyS8xgVm91Vw=
Received: from cyy-pc.lan ([240e:379:225d:8e00:b91:b2e7:7c69:8554])
	by newxmesmtplogicsvrsza7-0.qq.com (NewEsmtp) with SMTP
	id 32594C7F; Sat, 23 Mar 2024 20:12:37 +0800
X-QQ-mid: xmsmtpt1711195964t53j80xve
Message-ID: <tencent_F0BD08EE6A5F3B56E142C688870434FEF00A@qq.com>
X-QQ-XMAILINFO: NQR8mRxMnur94KfB+7w3r13yNMBf1WJ7kj32mtd7jCEliNb7/euZWq5fEPspM/
	 7TdDQRfBiBNk9WayPerDVe2Hmu/scyD0G2qiwwJjiKgfIryT91tvfSHEfpzY02Foj3/4Q1Xt2oP1
	 xPyqUfsYilHzBhwJ3iXI3rJdNfO3AybJ8f6L4nqoBokQj2esnVr4/rtc0C1kwbqXfXELl4POVOpy
	 Whfci+FqD4C0FfMK24Ngm674JLXuxd7YD8M5C0zsndswPzr+HPU7vxhI6+Mldg42t1RArrZHapqX
	 21hk4R+0cDdFNBa5tAh4LZgPVvbRw3RIiQ6HvOmP7bbEwGCst1noIA63vjX5lJE892Ac2Yrz/hta
	 FgHsIkGgEqdJO8JD/nLus+uN2HlQiLk/9ISlQS2NTw3EEN8JDGcwDZT9gf7vmdiMWD30OeSigLsA
	 a3wVS9Paf/EDjVj2MbVXQ0/P/nU6XDpQ9/fXkUBfOUYcZzshR9Xy5gLSiT3Q3uNF780qaKzxikDZ
	 26u0GyxTqZeAxr8idi9Y/pmNaKhAQlSRrjvwIEXGADSrtZ87OxMe+4KoCHWEQU7lk2ealsV1xoed
	 dYOl7eFHw8YQfC+TGQTA5Clf4sOEZexhANKhSCL1QC/Gd3XSxtHeWY4rdrxDFTk4I2pxWcg7rBLn
	 yFcumffRcVdPggT4amgdA6/QPQhBkvLH9bjbngW6HyPh/BKAVmaCkNqphIbYdZkxAQpY2dsYfWJ9
	 Pf44XsB3PrFh186BMZ7sL/mRLJrLq+bO6oaMgT1Aby2Xt3nWch8aVyF+fEBjuKEqTkHc+aGIDxnH
	 dtKqOSMN1oPs0JXs1gqOdyjsVJJZqOWdLI2fqkAazCWBXQkEVUBb8vR7WnbO3fU+0YYawyO0g2Qk
	 ZMhYxyhGA//ynLtCnC+wSFW8d3+LXejtMcyosUVjUKxem2K+r1S5EfzQ1ubnIOK/QG5AhNVYZ/h8
	 MzLp3LrrVAzvAhznNkGb50ofLv3P/24EfQEiZzIfIThSm2JC9OtnI6sSxs/PjUPLyZNYTkhXe35X
	 /NBP7bc7g32EO+0KxKI19Y48lebMDjfN1fbHdu2z1WjpmekcoGwFztLKUda2I=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-gpio@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v6 03/11] dt-bindings: timer: Add Canaan K230 CLINT
Date: Sat, 23 Mar 2024 20:12:15 +0800
X-OQ-MSGID: <20240323121223.1729328-3-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
References: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_051255_438296_02BCCC2D 
X-CRM114-Status: UNSURE (   7.09  )
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

Add compatible string for Canaan K230 CLINT.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index fced6f2d8ecb..06c67f20ad3c 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -38,6 +38,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-clint
+              - canaan,k230-clint
               - sophgo,cv1800b-clint
               - sophgo,cv1812h-clint
               - thead,th1520-clint
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
