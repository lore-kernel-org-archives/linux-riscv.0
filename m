Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4489C7EE2E
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 14:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mmdVZFE4puCE0CglDdf4i5jl/Se5z+QxJdPxu3eSSMQ=; b=B0gb+kjuQTMpw9
	bpvnW6kkuGz7liNc6wK/cyEQbthZxGHMNOWq+7eC7eENwkz4ZMhwnH/yYXApSR79Ejbey5mN5uOaa
	YhQzLC0x5tw40MD3a9g5T89l+ADV5QADvDdB+QEXIF09ndA0pE55If8V1tAPNvhBN5iXlGSXbBjDR
	3eQdRy88YVy4zxOusfC2vtHQMA9w9wzx7fue0kQ8ofpnvKk32o3TnvNfDapLnylrOlOCOt357eL/6
	SejIUlVlm5ahq9a05W2rVYaVcfyYdspbtnMVQzuP+5WUwDThZCT8ialaK3FXAf10uLiQqQxhvg2Jb
	Vyxx6SGc3VW8bSCtFCgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7clq-00DCUH-2p;
	Fri, 09 Jun 2023 14:07:18 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7clk-00DCN3-09
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jun 2023 14:07:14 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-51480d3e161so2756479a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jun 2023 07:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686319629; x=1688911629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ooPHVjG0smBJcw3UZ0KiwpKSUQFuZSPhg2UdcvnKsUM=;
        b=yaW7mP9M6MFBEQrrcQ8LchzKkkHtq4Gg21y/eYGBsY9PDRtToucGH6n16zU9pTKB2q
         4jRxao4fuN1JAsNRirGAB27RWhZmxrKBpgE8H7dYvnic7dqPHDcGWFEI/P6/V4dhDn3l
         /Grh1+iqooa2wnedgxI3IL+kieRQDHusBkXUQI1jv5Y3/op7+R/VpJfRXIrygv00I7q/
         aklNBncQ1NR1jcxKeLY3gZavuKLKzw6nenoDwusds+ku3VkLZ9PGAAHt7bmo6ssghatn
         J1kFL3GyDWbTEdA58TuYMEaJ4MAdMd1HFV1cP15Q1KLjCwTCBSxyP8kkktpx5adN7qGz
         gLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686319629; x=1688911629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ooPHVjG0smBJcw3UZ0KiwpKSUQFuZSPhg2UdcvnKsUM=;
        b=QWkJMFfbQmXWOiE4JOIiSwBs00WaTv0/WXwdIL13xQ4r/6wB/IyVnzn2U7zCrba4ax
         733XjryY0XNfXu+4CkgVzh46XD4/PSa778QOsxBUdCPPE9putCDguQag/g8HF2MpdyBh
         TF4bKrzOmWLKVRruewEhi/ZyYDzaB3S1+DYA47K3/pA+uknVazKf7IwqvyaoNIxsuRTs
         YKaGiDflxqIxBCdfQsb66nfbX0lhxXUzVOGKEr5/lRqv2wU4Fxgj2ZoLcR71gjLE/MAr
         QdrN8I602wIbm1utkDqAu/ywsizHdlq3Crk7ykjliSnkh874osC+c5NTVNMwq++IEmk8
         5lRw==
X-Gm-Message-State: AC+VfDw7jEpW8Do6yWv6GmuxJul2lt6FZl9ofPJUEwuhsrojqVnNR/zb
	hB1a1kzFCGtHcFVw9fsShYxWTA==
X-Google-Smtp-Source: ACHHUZ7cWdRLrozxuKakAhxWOXUJREEAfp+XHJuUgpuWZm53+OttM9O6RQiSXAY9ny2k5+749IfDWQ==
X-Received: by 2002:aa7:ce12:0:b0:514:8e4a:2d71 with SMTP id d18-20020aa7ce12000000b005148e4a2d71mr1134762edv.26.1686319628915;
        Fri, 09 Jun 2023 07:07:08 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id a13-20020a50e70d000000b005149c3fa632sm1806120edn.13.2023.06.09.07.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 07:07:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: riscv: cpus: drop unneeded quotes
Date: Fri,  9 Jun 2023 16:07:06 +0200
Message-Id: <20230609140706.64623-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_070712_095912_758037A4 
X-CRM114-Status: UNSURE (   9.40  )
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

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index db5253a2a74a..8a56473cdd5a 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -61,7 +61,7 @@ properties:
       hart.  These values originate from the RISC-V Privileged
       Specification document, available from
       https://riscv.org/specifications/
-    $ref: "/schemas/types.yaml#/definitions/string"
+    $ref: /schemas/types.yaml#/definitions/string
     enum:
       - riscv,sv32
       - riscv,sv39
@@ -95,7 +95,7 @@ properties:
       While the isa strings in ISA specification are case
       insensitive, letters in the riscv,isa string must be all
       lowercase.
-    $ref: "/schemas/types.yaml#/definitions/string"
+    $ref: /schemas/types.yaml#/definitions/string
     pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
 
   # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
@@ -120,7 +120,7 @@ properties:
       - interrupt-controller
 
   cpu-idle-states:
-    $ref: '/schemas/types.yaml#/definitions/phandle-array'
+    $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
       maxItems: 1
     description: |
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
