Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA58C6379F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 20:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RtbAUenT2S6F3L711SIsqulMS+oylwitFhpPVxqxuyE=; b=xlKVP0q+a8K+2g
	ryrVoCnj/MxWqzmL4Zaf22p/1gIGHVNuEXu3DyXpjpOkAQ9kDZKTE1AVI2YoJxAH2j81ooCWVg9Bo
	GkXvJ+3mOnYVPE3GLPYJ/arS2T8Tjf7Vdc6oYMhqpUa6R1K78ecFvtuPlCHLOSpepgviQ824bm5d6
	fg6zs4Dg9NIA7hNek8iF0VAJYYlkAoTZ41j0kPz76yt/a4y9vI+n0l96oOeeWKJdTHKaAri9I/RoC
	0A/SGuD6bSh0owPgrBlgAzxat+o8z2gNFEU1S6YJytl/l+i35aM9Ogw+shzHmL0Qf4+WFGwCPDcJz
	zLf937ouXsuBtZyjmdoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP7tr-009ody-ES; Mon, 06 Feb 2023 20:15:39 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP7tm-009oax-QV
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 20:15:36 +0000
Received: by mail-pj1-x1034.google.com with SMTP id ge21-20020a17090b0e1500b002308aac5b5eso6523257pjb.4
        for <linux-riscv@lists.infradead.org>; Mon, 06 Feb 2023 12:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggzc1GTHoLiBAu4kfMHEm/fbizYyfDbBZlVMBkPr/K4=;
        b=LJTUsmkjEjxAWc1IoFf2wxj/67dVsvTcPqb/jJBjxsyqYyVz3ScQAmEmLk7rLdnoH2
         0G+w1w7rUgLxoJG6JGeK3oBnyoikVbeT2iqgsNILC3XuFyOKGDcmP6bbCSZGhfVOECgU
         3sXnzYhBeGAERqormKcypgWG9XWhAAPUpOh4F6QyBmnObP3SI24BGHjffKmGOd2C6h6M
         nFlREjaXPwWSA4WBnjQF1PYXsDM8gl0fe+zFGdgbvHUSF0tQ9pj4/mXQRf2gDg9e6iTA
         ZA4SYFH9Hgm45V+ECqXetPqrjaeYznz677JdCHLdnP+AJ8p2xJmxcea26IMGvNKEjbXU
         86dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggzc1GTHoLiBAu4kfMHEm/fbizYyfDbBZlVMBkPr/K4=;
        b=q2ZaHmAdmBN0uFeDa6ltC1t6vf+FPJJqfj0VJZxJ2SzdoEs0Aak9CaCgSNSwW54IBc
         zpG/gwEw14P14gfZ9l2mCzfVsdYH9eiSJyhy3TPj+dV51kHbZbr3vZiU9frkkHzDiiuz
         jq+fD3qF9dPg8BbEpZX+YPuTRVTPbnDCz4byu72jM4CiUZOlIqjpqJIWNWOfj7Hd1mE9
         FWAFNc5u+RuSnvrfFzuhtLvj+kq3XoPvltqpOnFix47wFBQ+kIwh2mb8nLexRYN5Mgul
         bekJf0zAzYjvPLkf7Gkg5Z4uTdPiCUxIri4lhu/1L/JB2Q9+3u2p5EgmM+yRIy7tK07s
         tYPw==
X-Gm-Message-State: AO0yUKUA0lobgau+TWVSsNpWPknSCDOZnHIe3VgKk1ZAvM+wO9krzEX2
	hgoOYc+tDgue6soAD9JTHAiZFA==
X-Google-Smtp-Source: AK7set/bTb9lu1cNF6xPBp2fVUYIdNuGgf1zzRTNh18SIWd68l70lafUBIHe2ViUvh3qp2wqLmLP9w==
X-Received: by 2002:a17:90a:54:b0:230:acb2:e3f0 with SMTP id 20-20020a17090a005400b00230acb2e3f0mr840256pjb.33.1675714534354;
        Mon, 06 Feb 2023 12:15:34 -0800 (PST)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id k10-20020a63ab4a000000b004df4fbb9823sm6425079pgp.68.2023.02.06.12.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 12:15:33 -0800 (PST)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>,
	vineetg@rivosinc.com,
	heiko@sntech.de,
	slewis@rivosinc.com,
	Evan Green <evan@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 4/6] dt-bindings: Add RISC-V misaligned access performance
Date: Mon,  6 Feb 2023 12:14:53 -0800
Message-Id: <20230206201455.1790329-5-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230206201455.1790329-1-evan@rivosinc.com>
References: <20230206201455.1790329-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_121534_882488_2B54D0F8 
X-CRM114-Status: UNSURE (   9.67  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

This key allows device trees to specify the performance of misaligned
accesses to main memory regions from each CPU in the system.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Evan Green <evan@rivosinc.com>
---

(no changes since v1)

 Documentation/devicetree/bindings/riscv/cpus.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index c6720764e765..2c09bd6f2927 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -85,6 +85,21 @@ properties:
     $ref: "/schemas/types.yaml#/definitions/string"
     pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:_[hsxz](?:[a-z])+)*$
 
+  riscv,misaligned-access-performance:
+    description:
+      Identifies the performance of misaligned memory accesses to main memory
+      regions.  There are three flavors of unaligned access performance: "emulated"
+      means that misaligned accesses are emulated via software and thus
+      extremely slow, "slow" means that misaligned accesses are supported by
+      hardware but still slower that aligned accesses sequences, and "fast"
+      means that misaligned accesses are as fast or faster than the
+      cooresponding aligned accesses sequences.
+    $ref: "/schemas/types.yaml#/definitions/string"
+    enum:
+      - emulated
+      - slow
+      - fast
+
   # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
   timebase-frequency: false
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
