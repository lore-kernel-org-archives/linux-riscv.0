Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C758ECD1284
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Apr 2024 17:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cfXAcabfZlKVKjrPxhvy258YNXoddtXPGIU83RRam4M=; b=rkT8/fcxh0EaE6
	Lcrev/qSnEs4BQP81L93vXRbfNvlD7kEMFrqj0qV7myqVozC5/cVoLSKHP7uuw7GzE0+EfGPtdvQY
	Mak1VRdRjiL22R06KE1l+WpGBHrCtLp1VTmi8o+5VyAKxkvfU5vHxE+uCBoqbFnpqaWyjE7UN0vNC
	RHhjLn0AFnIsv28dJem2lVeZggGxIWBbws23/WDnFTfABRN+UIgKKnJeoYLcT3UTaRv26QeI/e2yb
	a0XV0uOa+lJ/Uf34KrQOqwlG/zlRO/TVAYcCCFjlrg+GNvaMDRCs8EHFK/jAM4llRQsqgF5GHh5iG
	ow75P+11swViq9tEK4Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtA2q-0000000Al9R-1QTo;
	Sat, 06 Apr 2024 17:41:36 +0000
Received: from out203-205-251-73.mail.qq.com ([203.205.251.73])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtA2m-0000000Al7t-2VDu
	for linux-riscv@lists.infradead.org;
	Sat, 06 Apr 2024 17:41:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1712425290; bh=kvuS7K0wl30nwl4M5zznAdLvDfFhfeZr9JFWkFZyoG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=szzTPkjRpm6spg+BqKRUtm+mV2UmVruvy5z0813Aq4ejp7Yr/QS5czxPWQVkfUEzR
	 R8jKdaUJ1V5pl08asVhiUWfM17PUxWE2qKfTtA8rAzfRpJBCmMWsp6onw3z/pds3qL
	 8ECBMjberFAMZBQIcWbgg1pIff9c4amHyqAXEDvk=
Received: from cyy-pc.lan ([240e:379:225a:6d00:f878:7a6f:5832:7f4d])
	by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
	id A56026E1; Sun, 07 Apr 2024 01:41:22 +0800
X-QQ-mid: xmsmtpt1712425287toocbwouv
Message-ID: <tencent_6CEE215C8DAC7C0D82A9DA688E16B8453108@qq.com>
X-QQ-XMAILINFO: N7h1OCCDntujGRTedFeKpQyqeYhskNI1hu06uZeunloZZjDYx8K23TRlbt3B/D
	 WTaYrhL9CAjCiT2UMA2L+giDT0nMuRE063sNYhcHVI3H2CHqJQCLP2sqT4xHrluLK2ywkmpunQvg
	 SlWhS/6guj8VoDQYj1b6JnLZCHDERvv315IPxf78yjHvO4jaK8JW0iSloAuHM5kDptV8doUsWDjY
	 +0cP7FEPC0EtOpPsXPs5pOpF/RJbnTjLdAL1F3LLMS0pEnRwtCtRwz8Uwcn5QQ1HSdTe+dYLxT6u
	 2+2ha78VCZ1aSJpfLntIz8g91CUiOyRB4KCFFzdct/L4hz3XikFaltNH4h/dPj0VNc6N+hpc/uuj
	 CUA70rA4ZytKLJ+MLH2VszTqZdB5rCX7kP2aOdK3Cw+2oWDCn6HdXa/RSMUIqqb04bxhV4XxAl54
	 GKD9fgGdFp5Ns+Ur8GfzBB67jMeYZcd8QTJ4VWt3Z0FfpnzctnImoCxk/hsN+y8r9mgqHkiKd1IP
	 368ySoMGoFIYUAvXv/5VzHNcjZPr0NrAku2F7sbb5cvYSOAyBd0dOTU16bnW7tpuZy7wjCuxIsUJ
	 SJj/VUwtBAyKQWg0ro7QxrFObRJCXoj1j7etLalvb+ujOmwxRZ8nHsyPJz4/xqeXaWBbhMaEKHps
	 lGkFc833VHjm/hIwT97wdCopqjDo87d8HOIyWlnxB5RXO+PU/tzzeKMJj6fcbZGisWAW5R9Wyyg4
	 F/K+MGbs7yxAmCNW7thLkmu2tivXk0XiBhRl/4WyXZ+DDxEdXng11RWu25S3r9QkYBsp4W964W6+
	 nBo3NtoQwIlNZINerpqWWN1xFPnI3EYrX5vybaxvmbZvP9L7vSCxjo8DfcQ9fjco2nErZZuPbNVO
	 BNHND2X7AhyoUFEcWW3obI9JyiTWqaB9fLmCj+CYnmklC0bym8/bL8UFS/WELt5BG29CNdgq7Bd2
	 P4dog4UOF09+9fLnkEyb7ukPZHSZtXSTRgoAIoNLn/C0O1+cPTQshmWGD5RLyONeswRWmtEGe4Dp
	 gZEjXRY/YMEHzNWfUL
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
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
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v7 2/6] dt-bindings: add Canaan K230 boards compatible strings
Date: Sun,  7 Apr 2024 01:41:12 +0800
X-OQ-MSGID: <20240406174116.2945552-2-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_F6392EE11AC6A485C43406F1BD09C268DB0A@qq.com>
References: <tencent_F6392EE11AC6A485C43406F1BD09C268DB0A@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240406_104133_401671_5B00519C 
X-CRM114-Status: UNSURE (   8.94  )
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

Since K230 was released, K210 is no longer the only SoC in the Kendryte
series, so remove the K210 string from the description. Also, add two
boards based on k230 to compatible strings to allow them to be used in the
dt.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 Documentation/devicetree/bindings/riscv/canaan.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/canaan.yaml b/Documentation/devicetree/bindings/riscv/canaan.yaml
index 41fd11f70a49..f9854ff43ac6 100644
--- a/Documentation/devicetree/bindings/riscv/canaan.yaml
+++ b/Documentation/devicetree/bindings/riscv/canaan.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Damien Le Moal <dlemoal@kernel.org>
 
 description:
-  Canaan Kendryte K210 SoC-based boards
+  Canaan Kendryte SoC-based boards
 
 properties:
   $nodename:
@@ -42,6 +42,12 @@ properties:
       - items:
           - const: canaan,kendryte-k210
 
+      - items:
+          - enum:
+              - canaan,canmv-k230
+              - canaan,k230-usip-lp3-evb
+          - const: canaan,kendryte-k230
+
 additionalProperties: true
 
 ...
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
