Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91884EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 22:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SRb1LD0FmYOaargtuwXBoFrZKpLy6vszwqQWWTl62JA=; b=ycFGPSJ6l3wB5u
	M5XXvd0lj+YezyD06TbXPZMQPFXCjhZCfwnmiJmr0BEjirDbjQXWBRMcDPlrZKZ/0FOxn/wpG7at0
	PSt1X/X7WtsQml5s1ZJ6o9JV+ERwH3GKl8YzdlOr7xi5tlGFbh80mLRtBcx4ANSOyOLqMcWReb/fY
	mEHfI47UZDulGYsRIl9JyJFe3PBu0EhAi/rmLF8QOfPrjvRwRpdEpHnR2XuGk3f4Cc32WkWM/KvHD
	FdGCV/Eg9JYS09g/W52P229Aglfy8kAK0w5lREiWjSSukOKkeUJIPQgVJmNnfrqDo3LAdGsd7u/oT
	l5lHdJY8kzHeK0T5n10w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9vrn-00GHoU-0p;
	Thu, 15 Jun 2023 22:54:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9vrk-00GHna-0d
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 22:54:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B1C3C61AC0;
	Thu, 15 Jun 2023 22:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26B3C433CA;
	Thu, 15 Jun 2023 22:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686869695;
	bh=uOdg4scVwQQzL8UZnROnPCCRu7Nfdm5eCRa5kHL1u3w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E7dnoqhMqsNpKE8pAOzKNBWZs2o3jqvpczL4+qj/AnHRAbA+aMbrugl5xHi0SGH8p
	 3QYW/NRiH3p1pwIvE0NvC5eh8etZ52ICkyfNOYgbr8KrpW772LN1+zxnN+Eo9bA0Ga
	 Q9upHj2X2cnQhgXHBZpU5AB5u8MiwoxTXmTB7zsNL2O+hEWZW07vQdpsnWDulbEme3
	 EqlDOvJGX3X1Cf7tTaSBdH+Jet1qUPYP86nbYEMLxP1KrMutgAL3sKbgmfn4hA+sGv
	 e4yiroGQHTlUV2ClVw69H4osMbp5083FmA45b+9n2lfWrh1IobvSzbBEs3fK0+rSLs
	 Y21RKq4cMVWrA==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: riscv: cpus: switch to unevaluatedProperties: false
Date: Thu, 15 Jun 2023 23:50:15 +0100
Message-Id: <20230615-viper-stoic-1ff8efd7d51d@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230615-creamer-emu-ade0fa0bdb68@spud>
References: <20230615-creamer-emu-ade0fa0bdb68@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=729; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=u/qrBFnL9e9PAex6e6NvnAWTZV+52ZOaw3F8Q/zOFMA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCndUxdfseKvjwla7JCU5jYp+vURlY9nUq7/K9Hpfz5/1 v5sm8Z7HaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjI8ysMf4WPBhXM3/362eI7 DlOZuQsNDnz3a7r51NT3r8yktv6Xhy4x/E84uNkwqIsh666IkITAudpLDw9Ov2TN+aiVfedRdq6 MDnYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_155456_277572_4209D1AE 
X-CRM114-Status: GOOD (  10.37  )
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

From: Conor Dooley <conor.dooley@microchip.com>

To permit validation of cpu nodes, swap "additionalProperties: true"
out for "unevaluatedProperties: false".

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index e89a10d9c06b..144da86718c1 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -143,7 +143,7 @@ required:
   - riscv,isa
   - interrupt-controller
 
-additionalProperties: true
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
