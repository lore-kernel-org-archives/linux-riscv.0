Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8498C77B60
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 10:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2hnLjZM37UQXXAJYxWlANEro0gKo1N5hAK9eJMjoi8I=; b=0zm6dFqq72LkUT
	vqj5BIusAq+ZIVkFTJSBtsflafuXGFFDjtBnvGcyMoeq6fgbME+MbfyTMpNml8CsmNgFYMRdi6k/o
	8/4ZatIKT9Vd21bPC8RqF/8ss3zD++Mak/06pTouC4oA0UjNg7UEBwDoupllzgKgp5RptUhvtvbhB
	IdVBlNlIJEK/FcXvRX15eb5Lb1DWxKeCDixGPKkkaA46VZ1U1JdE8ZTDFjXFYwtEoS8n2nBgUEq/+
	gc7ur4N0b3fBdoMffs9k8Q6bFHo8T3wu3ZXO9basX9pxG2PmHtiNpQD0jrWzNMYmtW4/HBs9/qeTA
	tFt59+dGwNzW2fX1o0lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prcdV-003cbw-2W;
	Wed, 26 Apr 2023 10:44:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prcdS-003cWx-2Y
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 10:44:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1682505870; x=1714041870;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ricgD7/YwtaexpP9atX1g+908o4ZNkj1Y0ZHbO2s7NE=;
  b=dN/eyRMobWARl/FHIm/g81HhPKksO12IV/4fEjU4D0fRqRB3KXG4ZCx6
   Zz6QsNq3hbgedpYfx2ND63X34Yg1DwboB4Oh2EUNFxiH158E1Z1ObWXwt
   vWPxOwAVDo2Zyx0ioTWYDHL2U1S5azas1DYsff1RG4L2uvBu/sw7Ff2W7
   R3ZOmN/0Jkv2hHv8zT1g/OjY+CLlNU/9RolVYHgMppfj1SIDW5Ybmo0oj
   bQ6nCUzLL5E6d4XykjmtPTLjY5tNs5KJux17GqBFRXwHVk2hS7JWdUpHC
   Bk9pRzzoF68QSgJd5I4XQS4fGYpfP7oIw1VWqjrPe9FNlb4/VvUtG8L5i
   w==;
X-IronPort-AV: E=Sophos;i="5.99,227,1677567600"; 
   d="scan'208";a="210769068"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Apr 2023 03:44:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 26 Apr 2023 03:44:12 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Wed, 26 Apr 2023 03:44:10 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Wende Tan <twd2.me@gmail.com>, Soha Jin
	<soha@lohu.info>, Hongren Zheng <i@zenithal.me>, Yangyu Chen
	<cyy@cyyself.name>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v1 2/2] dt-bindings: riscv: drop invalid comment about riscv,isa lower-case reasoning
Date: Wed, 26 Apr 2023 11:43:25 +0100
Message-ID: <20230426-payphone-nautical-7098d15035c8@wendy>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230426-satin-avenging-086d4e79a8dd@wendy>
References: <20230426-satin-avenging-086d4e79a8dd@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1297; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=ricgD7/YwtaexpP9atX1g+908o4ZNkj1Y0ZHbO2s7NE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmeDF4i0xfUB5xcpnq1YOr0vTkrkoV5J3Tu9HpXIPt0duv/ Oe/cO0pZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCR0gBGhp3s0vMK0icwpV0o28tlqf 5rXWTdZc5EqZnaL1V1bmzeFMLI8Pjrz71vbNtiNxUK/Q/X+Wwefa04+sVbqZuZoXmBy14a8wIA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_034430_834281_5231038B 
X-CRM114-Status: GOOD (  11.23  )
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

"Ease of parsing" may have been the initial argument for keeping this
string in lower-case, but parsers may have been written that expect
lower-case only.
For example, the one in released kernels currently does not behave
correctly for multi-letter extensions that begin with a capital letter.
Allowing upper-case here brings about no benefit but would break
compatibility between new devicetrees and older kernels.

Drop the comment to avoid confusing people.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index f24cf9601c6e..9e273a3264e3 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -86,7 +86,7 @@ properties:
 
       While the isa strings in ISA specification are case
       insensitive, letters in the riscv,isa string must be all
-      lowercase to simplify parsing.
+      lowercase.
     $ref: "/schemas/types.yaml#/definitions/string"
     pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
