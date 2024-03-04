Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51663C54E41
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 21:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DIuvi6s53yPIXEO8GPa2zde+aLQ10yv7bhHmPc/ZxGw=; b=TJsBQ+05EDuiWZ
	h2mhLpWlff2Vq8aF1ZiEpIjbYThZTGAbLTt+Cqm9degSN+MtN/n28Q7C8W1AteggnC6zSJGUNbAYP
	jm9HOJyqB3Wl2XaUAMRaTK2vd6jv/GBIIuWvj/sXiyvkl7Y076cRzcSVvBDyBEZwBERUS3v0XH1UQ
	Gr/1NtlemISnn2AmJhF0yqL4Snla0/7Tv7H0UgOugWUneP7BdqqZbjFzSRVtMgSDilfn8hS+7ohS2
	uJ1bWmXZ7Ca+8FUvy30vT/5WG1yVADHiG6t1E/RAcH5rqg+0zsiBxreFgHgSLtxsfVNY23J7Yd/dG
	F9zSm1z4/96rM0ZQktUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhFWA-0000000Ahq5-3Wqk;
	Mon, 04 Mar 2024 21:06:38 +0000
Received: from out203-205-221-245.mail.qq.com ([203.205.221.245])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhFW5-0000000Ahkq-0SXV
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 21:06:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709586390; bh=yn1cIjHa9vkof6V1goAAhCCMm4gF0ibpVzJy1HW4a8Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XSrv4dQXBOC2xL5+Wa99iLC++GfdIxdUAy9+UjLIolP8MvHy2kOPDRi04dhTAAsA1
	 m+LUmV7FDtRUcx3Wp4Cmty290Af2BPpfJJugQkLBi6rLCv1GDBlaMKndtq/y/dO9NB
	 hePX8/iIL5m0O6neWtxHJAym02S+mVu7IxAVW6Es=
Received: from cyy-pc.lan ([240e:379:2240:e500:994d:62ab:74a6:932b])
	by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
	id 1953A8D2; Tue, 05 Mar 2024 05:06:21 +0800
X-QQ-mid: xmsmtpt1709586387taroak3wd
Message-ID: <tencent_919C60B8F6882311AE464C66C86223041F06@qq.com>
X-QQ-XMAILINFO: OVnuYaVQwYrz3Qs08LMvf9PIYBjThuYCGem3KXxKB57Qnaqq3pWtrNTX0zj5jv
	 qck1u+VHEuIBqQNefXcq0v8sWAGOfSFjEadtD4EdSk0aZAk4z08YOdekgs16li0wyn7sdjwmvXL7
	 0wLI4jK6PQJMszFFKvA1p2AULMNO9BWDprEiVdCcL2BjCvDEfNhS0LU4EL2//bKixMzOZ3zWQKPE
	 Fcv39oyYu1vsgeYJ6ck4gxgr/2DaEWE1cyxzolJ1yfDWzS23H72gCBHKV5NlTVLBJjH0UKZvvVhx
	 hG9LCOZVYNh5c0KOTYAxpQ+GiHggTNMJ+D3d1nfR9k08LBjVCopcxicxg762qTmkUOeTNzaEnZFG
	 lV8dAYqPcwF5K18xHrKN4LSvWhmEhnCYGgHcP8Ubc6jkVIGQNg22zVKsS7amICuTZ+wD2ZoDVFqU
	 JPiW7/SoJWo2TvFJLeSaZUWa5UQucAgOMZ3D/WI/bgd3XkNR8hJ0Tv57epUtpbpq94Y9inqqOkB0
	 3XNOYc1k0cS8BGraC7STc/OuDfK4d2amieaTD6WMguTFeb1op6VAIVItKivBP+b6cKCeJIGAaiYN
	 KGXHAXbgkoRPNrxBFLfqLeQrc5x7utsRGyaR4ZeephyoHrzNCpisJRFWn4grwkDVsaaX+A80KzPE
	 AuJfwJuXFtiDuOYDGseEyb3D2EhoWlMwTHME1Pc46z/g0mHGDrQusGnDqdJK+Zr0M9cf73fZ28G7
	 ED0IDX31R7EaRp19VOzBWQodmw9OJKzXwRZ5K9iGm0UNKXRqeKaY8zKPVfRvGAsHGG1Qwz3GLHlo
	 Rwz6GVwTtvNYUr7cfSflF5A/q/5hEw8L9e53UhqK6qQW3IkHS3K6o8d+7qwYK/GkbkqofOqQ/Ur0
	 TzbZlDfwzxKRiTu0ws542sw0xAfMV45omo6PGHKai7L5aorCdWNgdEsA4TKBfCqQroyPjJdxWWNq
	 QChhY27yi9CnYJR2KfJ0gcA9jkiaG00n+ahhPmUUlOaQv1Fd+Ul+a7yoz4rqhEKowixgo/3hzO1Z
	 Tn6/R+xWZmglfpOyg6NJEcu06AdoUvcZ/3O5kKzTgP7QYIFIpfxskXgBfaLW1CWp00h2NTGg==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 2/7] dt-bindings: add Canaan K230 boards compatible strings
Date: Tue,  5 Mar 2024 05:05:56 +0800
X-OQ-MSGID: <20240304210601.777883-2-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com>
References: <tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_130633_694932_96841FBE 
X-CRM114-Status: GOOD (  10.05  )
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
---
 Documentation/devicetree/bindings/riscv/canaan.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/canaan.yaml b/Documentation/devicetree/bindings/riscv/canaan.yaml
index 41fd11f70a49..12a78bc95992 100644
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
+              - canaan,k230-usip-lp3-evb
+              - canaan,canmv-k230
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
