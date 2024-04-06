Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D2AC67861
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Apr 2024 17:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7ZcxgJMDEcF1ZtQwhuXye85QbL0opjF40NY4HDWyWA=; b=2e4vpSek+ROxo6
	F6yTLKuorBv2z3ZekO1ceYdAtyYGRHVq+/V7eyPBGgQgnYHf6amG7fhng6gGSUzsq0GyaPj8adas3
	atSQW6tabcfRBAakmkwKzaZOC8VDgn+BftwxcLpCEEME+92lizwzygHctFTMkyLXkFhVmhC4kcjZc
	BXEFmgSyM6NVEf7OIEUTnhNBZ6zUwTReLoV/caHHPxv72IDMFyzFA0IQYkf+l5G8/Lwg2ZlOzSEoq
	OH+mtJ3UYjYhERAVorCT5uo83Dnkx8thHszeRhK8KfBLgwgut/mYwwackNESG6RSusPoKy7uWEfIK
	h7Cct4P8+9KDenx1wQMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtA35-0000000AlEC-2Jmm;
	Sat, 06 Apr 2024 17:41:51 +0000
Received: from out162-62-57-210.mail.qq.com ([162.62.57.210])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtA31-0000000AlBd-3R8a
	for linux-riscv@lists.infradead.org;
	Sat, 06 Apr 2024 17:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1712425292; bh=rcU9GmGkfYObnRvy+6sIXXI4nFg1KITAK23jcYZUxzQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=plRvRvZ9KDvgX63ucSRvEnR2foSV8jfFCyDmmcBbFcynQynBCLVr/slJyIIUYYxhk
	 3+Doswj/hPUOe2GLeoa/PYSlg9qaoB5ITWQxaNn2h/UjitxLC5IgNrn4+uvv9uEEe/
	 n88D0gHMs2NNm+3jacK2/uF8hDaHwxisAKGMT780=
Received: from cyy-pc.lan ([240e:379:225a:6d00:f878:7a6f:5832:7f4d])
	by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
	id A56026E1; Sun, 07 Apr 2024 01:41:22 +0800
X-QQ-mid: xmsmtpt1712425289tanbkg6hz
Message-ID: <tencent_30EB8248DAB38EC6B8C5310C21E08D217C08@qq.com>
X-QQ-XMAILINFO: MB5+LsFw85NoaOVyhodLMB48CQJ3P1twEygEY9BZjQnqBJMaHqLb4knc5uw3ED
	 +GrAS3e1JQQH61eKkbP13RfI3LUisjnWFSnwxJGzsVoYOpj5LB/UoV7/jKUQkG4Y0MTo8hKEAQzo
	 LnY+eb6+6iKVG542cOwzs+ezhLswCP1z0hjGK5CbT1gmleVXVaQIyYpmfnGFrGS5ecF46WAZ2xWu
	 rUu43ZCSxURBiAnu5KVU28A3RzvP8l2T14QXZF/BoQEw4gyLWfMesjYIl4uUV2q8W79fUIrlHAmU
	 xiet7JUV84HfsjijNtFxdnie8RymcRJkVQ4233b3t5JMJHLmfU+bCo8YZObfLtfC86GSnd+YHLfD
	 wHanFS2gHlO9tpwvwBmqbSIuRsuEWoIz5ddc3Tqf+RnM8m55g2fYRiDS6Q+z9qFYzWu0vsCqkqqN
	 DEIo4qb+9/5zEJwBlwi3ZzrhGbLnsUDjku1lPFPB1WB57hwOgYpFsGWxK/3dORE4ZLboZGvzg6Ii
	 2/D9RPy5z3Dkz1FSx9+0Xufvsi6GNtmmXJ+gyhqnvidnyheqbEVxZpyWQTIfWGI2YBVwndKlb0z5
	 jBGfmESbm+UqdjSrJ7twH62YGnLY2k1LETfF8CY5xq05k2HwqbKaOIT+SIkL514oSFnDyZxJ4IfC
	 TLstxrYTLdSdY2M8X7D9XAJ8nSCqFD3WDx9XbTELsCMy0t9OUrd63S/zQDF4isUVe7edNf701DN/
	 SQsXMNS4XTpHMCDiuqoOSdDg/Vyuz1AoXnEJKQzZ6BM5rexVZ67teCRD8sSAyusdtZU6wgZzsDnF
	 dN3MMpvLZ2YAkP55JrldC6jwnZhrprv/qyiZKfglOKGn337Zkkt+maA5jeHJtBI/go9Olq7NSK2x
	 NrRx1V0s05PJyFv3fg77oQJU3UPupZQRLEtt30CbPojVWSlfG54REIqY/Lt0LpIO7vUXAevo/PZy
	 9WCTgJ+gV9s9rOvM/SvetaZvXae4nkjvVWjJl6xkgNVJGpRcV4vQ+zZvoNQaoG1q6DR27L+CDQpn
	 p9oa3Hh0OFIlbVTdYfWYW80Js7fms/OSIT3k/W83w143NQazuT
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v7 3/6] dt-bindings: timer: Add Canaan K230 CLINT
Date: Sun,  7 Apr 2024 01:41:13 +0800
X-OQ-MSGID: <20240406174116.2945552-3-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_F6392EE11AC6A485C43406F1BD09C268DB0A@qq.com>
References: <tencent_F6392EE11AC6A485C43406F1BD09C268DB0A@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240406_104148_535193_9775E3DB 
X-CRM114-Status: UNSURE (   6.50  )
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
