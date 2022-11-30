Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA48C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 18:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UrLWOcv3hT3LAMxBYSbwWgwIRYrfbreauRzoH1OGS0w=; b=wT7CeyA18ujylm
	uZRm5fidgiJTU7vluFkBMrzRz6SrEuSnpI/Im1P38XR+XiS8AI9iv1xca/zhpi5Ji4Fvq/D39txxt
	Lf2W2/UXNqh0g79Uv38iae98KVu5T00kzRIlUWPN84ZsqeHx4wF1LAlzGNqfkife57c3j2Ib3mJdx
	0Y1JlWs09Tor48Vd+DWjtOuNfgQtAKWaETvCmfVvbpkuODVLZS3JbUQyjsXhb2K0kGlc/czcgM7bx
	eDjJsmKkVAOW/kkYklgW/CKR+VJhVbJjf5SGkObXURDarlSZTAPnbwuLfEE9Mv2J1TcKdueaP9AJ8
	zJloJ4e58tWNncHhI+RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0RTu-001OOv-Tc; Wed, 30 Nov 2022 18:06:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0RSB-001N15-0C
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 18:05:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7368BB81C88;
	Wed, 30 Nov 2022 18:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6374BC43470;
	Wed, 30 Nov 2022 18:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669831500;
	bh=mWQo9lS4Vl4LT/B9HmEw0oNidwOCObmrj3MYw/+BtYk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qZ1PKbcwPYE35dJpTRwTON1T2xwF5sTyiE8PutUJ6tl5ba6NQJH0o+MMtAuGXSyYt
	 6pwRo1ewox06sgcrs+eRFdx29f73DxGZCk37+ryArE+eI3xqWxtkD6wodyz9m1baFU
	 omYOPjiLPnHsYciz14kBmTs0KSfzRRrBdvE5+ST9zdKD1r2YVcMuzWcUAh0bpd2Fb/
	 N4wdM5x+XHXKN2hIxiSsdGdtmFZT75M3XXPe1hPqFZN/WvvAsfWlAkkpXllmvbZVRL
	 ZP7Sh4PG4BtcvMr/y6co8+kOQWaZR63tMHbwFj4CbHNXfz4qlnk71QxCSFPGYIvl2w
	 YO0t/ybUM8pAg==
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v2 2/2] dt-bindings: riscv: fix single letter canonical order
Date: Wed, 30 Nov 2022 18:04:23 +0000
Message-Id: <20221130180422.1642652-3-conor@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130180422.1642652-1-conor@kernel.org>
References: <20221130180422.1642652-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_100503_256217_8CAE08EA 
X-CRM114-Status: GOOD (  12.47  )
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

I used the wikipedia table for ordering extensions when updating the
pattern here in commit 299824e68bd0 ("dt-bindings: riscv: add new
riscv,isa strings for emulators").

Unfortunately that table did not match canonical order, as defined by
the RISC-V ISA Manual, which defines extension ordering in (what is
currently) Table 41, "Standard ISA extension names". Fix things up by
re-sorting v (vector) and adding p (packed-simd) & j (dynamic
languages). The e (reduced integer) and g (general) extensions are still
intentionally left out.

Link: https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-unpriv-pdf-from-asciidoc-15112022 # Chapter 29.5
Fixes: 299824e68bd0 ("dt-bindings: riscv: add new riscv,isa strings for emulators")
Acked-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index e80c967a4fa4..b7462ea2dbe4 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -80,7 +80,7 @@ properties:
       insensitive, letters in the riscv,isa string must be all
       lowercase to simplify parsing.
     $ref: "/schemas/types.yaml#/definitions/string"
-    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:z(?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
+    pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:z(?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
 
   # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
   timebase-frequency: false
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
