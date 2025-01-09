Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F608E7719A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 11:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xarcnxqpr3WFRlcXWShalJoFueLAHxBofafLclHEIUM=; b=SiUSplo+gtFjsJ
	YB7iEQnrgIuexh1bjUej2esyUi4m4Hdo5F7T9vmVpCKy1eBA55kiwVfR2xYhEKkWPAA2Kk/K0HcFS
	IObP4j8OODzM0bempdJWvUq69F6czoePlzjr9ZzxPv4Ph4h1xkDkO3suakIqB+fxnmk/JT2jm4J05
	1omYrXxCQwNZ/78iTOgRMzgqSblnvsxKpS82tuLkpy2qV9HGVMgQ7mwt0n11bXx2EXtb7XqbooiCT
	+RwZ9/GBf03FpMzdo6fz5ljZtf0GjkKAjsc0Zm3NjnxbeGn/DLEr5jrajyODuHD4Y/OHyjBWEDkca
	eVM/iwILv2rY/PaPbFnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqsB-0000000BkNc-0zRo;
	Thu, 09 Jan 2025 11:38:47 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqs8-0000000BkLA-0SSc
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jan 2025 11:38:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1736422723; x=1767958723;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gOx6K0Qup/yjv9bWF675QnHjUBiz39afWgKA/I3TcGU=;
  b=Z3Ttj0Hf6KmY2TvIazGIdF7A02C6l9Kdm7ZvGtF7nDgbzvcsGKrXf1or
   bvBANY60QjyYg/2xmJ66aFxcYL6BcCv3XrcE0SMTehqb0YYBd9E04G6EA
   cwaeYD/HTfcoivWrT+DB9SJSl3Dgc2+InP//xA6JD0Dl4iHPfQlVMdYgA
   EF/bgDGDlT4Oegkf+N2SvMlEZ543hG8Kq/5tRgXhLs491plIIXDbX1uJn
   yP8+b0OajUIENrt4LPxLbWSVVn2ocYGx6PGayd6AYIo9Q5wr+xbAoVGpd
   nKqxUXcz59IlWK/k2RtOAoo+aOMW/7WM0gLD9NdYNZYSOWMeUaiP3QXL5
   w==;
X-CSE-ConnectionGUID: PazOQ6j0QqSKvsQjbqYa/Q==
X-CSE-MsgGUID: GWAk5N4LTwGBIrwo5B8Xsg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 13:38:35 +0200
X-CSE-ConnectionGUID: bPs3+xalRWeIpzEhTnORnQ==
X-CSE-MsgGUID: YngYdLxgS4uDTZkH9kX05Q==
Received: from unknown (HELO epgd022.me-corp.lan) ([10.154.54.6])
  by ces04_data.me-crop.lan with SMTP; 09 Jan 2025 13:38:34 +0200
Received: by epgd022.me-corp.lan (sSMTP sendmail emulation); Thu, 09 Jan 2025 13:38:34 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v4 1/2] dt-bindings: interrupt-controller: add risc-v,aplic hart indexes
Date: Thu,  9 Jan 2025 13:38:13 +0200
Message-ID: <20250109113814.3254448-2-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250109113814.3254448-1-vladimir.kondratiev@mobileye.com>
References: <20250109113814.3254448-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_033844_413097_B20A9FCC 
X-CRM114-Status: UNSURE (   9.90  )
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

Document optional property "riscv,hart-indexes"

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 .../bindings/interrupt-controller/riscv,aplic.yaml        | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
index 190a6499c932..bef00521d5da 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
@@ -91,6 +91,14 @@ properties:
       Firmware must configure interrupt delegation registers based on
       interrupt delegation list.
 
+  riscv,hart-indexes:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 16384
+    description:
+      A list of hart indexes that APLIC should use to address each hart
+      that is mentioned in the "interrupts-extended"
+
 dependencies:
   riscv,delegation: [ "riscv,children" ]
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
