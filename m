Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B30C43327
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 13:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fu51ccGKwF3LXbkHS5RvkCx6KPvdrwkK0FI/lhrZ3O4=; b=BwaxNXZ433QoIy
	2vlbr66l6vpyLfFpVXI3WG2TItgksJAsP3Nv6/f5g8ir/sTD99+T298zwt8H3pAiE0CWh3eKwgTVk
	zXH9ZIsxzszYiqQPVJKn6HleG3HhpKCGpNI8ZTCi9UiM7J2JE7WSvuqtkHi+nUAwHqEQl30KkCtfn
	qkeAORQgNmOHf9nfRobgr5hK7lPCVKr8Ef8lyZGfcu8IHBzuP8ct97H2Oc6+IPa9g/ycrITSI1EOu
	dKP8EkdRHh6QYlqVlf4u+1t3P+mlWFwHe5NOecSevPUwrqhWgJiazDjmZEoJAnfNPQZrncSbtcYE7
	PHFvIAQjdxR8GT73nrSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuwu-00000002Auu-2V6R;
	Wed, 01 Jul 2026 13:25:56 +0000
Received: from mail-oo2-x05.google.com ([2607:f8b0:4864:31::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuwr-00000002Au5-48fw
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 13:25:55 +0000
Received: by mail-oo2-x05.google.com with SMTP id 006d021491bc7-6a308908f2bso54851eaf.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2026 06:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782912353; x=1783517153; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9ly6ZTzLYLZx8yS4TUkxxmSHINnr8BKtUdkBSO+x1w=;
        b=pHigbd7/AgZkffFtxy5jUBkP2wVBXYukPMLuc8+hu4os39AHg6UafoVi5LcZbCEPjx
         lZSywYtdRBZkVfTNOiEchz+q0G3dpSIS0O22d4iBwNUY10uynV986/wVcTDNJS/78ohV
         YaL6PR3/leH9rrfCqtdTtXROpIf/gzVPY0wDm775Z3ryr5RbwSOsj3iBIU905vVZXgPJ
         fki6mh83+vr2rp6TdaO3fFe6e0qb2VI68GNVUf8pIVtnIIn9f355pZC0z5V80Bbj0g/j
         JlxIyPXdolnwgtf74+zHG33TJClHrXq5CQbZz9kOFMO9DAeXYSYQ6kiBC7nZ2/PBHpgj
         kSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782912353; x=1783517153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P9ly6ZTzLYLZx8yS4TUkxxmSHINnr8BKtUdkBSO+x1w=;
        b=pVZOxtple6r5VPADz6aiRl8oQwnZs1vbqxJ2JXg0cJyNx4uFEn+3GbAzT8770O4svA
         hEr37812+OPmCFOka5xpeHyVvPaZiOwvW4wKhwWy64kJVh6aW+MZI+2ui7YGInZ9VDCK
         1tCHTCP18kz1MPuPMZawsZnEkdUOzGVgM+5YRrD/CEUCwP3yxDY6B5ET4v5zQo54UWDW
         bkmpT61+5dj9BH+Oo+hs+YhiDpiNR9o5FZLv4XYdMvt1/S/lzeT1R3MTb6uNDGGHvyNG
         DXoBBZoA/yGxeH3t2xYsECjiA2Pjc8ZsmPid3Cfgks32zK48zbyXxf31YoPEaHPGZTf5
         yr2w==
X-Forwarded-Encrypted: i=1; AFNElJ9L3D2bFXgqBGUlCL2cweoM+QeCRBKkWsZ+9elwKdTxDJsGPfv3YP2tS0zuS63wpJ+e1o4yRg06Q/6GjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwqXeL0rWCq0z0nBJnzqateM5nwAhbSiVsu4Sa7Dn4Bkw9coQ7w
	YpOE0Yz25/8qJxZyFIfdZ933OJW4OSwLkUzhWkLnJx/fGRnU7kBsaEYwM1vKKbUCpMW7HVoy
X-Gm-Gg: AfdE7cltj7LjjqImU7uks0U7pEb5pCByX3Nus/WHelIo5RlcxjPcHtZfM0E1WExECAa
	2lc7selNELm17O2M1rz3ser6VjLh7uzk59m/uSOhjegc/Y5vTa2mmDRdhT25JGTbbtrnaBAM2yL
	3F3QYHasURh2WzKUR2aa7wHOwiNt5CikUdBUbxN54OzunhmRO2HiM2RE/69PZNttng0b+GLTq28
	+vk62tGwro9v8RBCYe1SpfQyVpkyE+FOp8MsIBCwJs7o/KkGOiZiHn8tfFX5kkyG4SPiiOY0eyD
	UObXH/rIv7F1kUVpJkRloK4XG9Vb6a8SyAtm5+h7iMXBiR9r9Wr8KW3ODvHftk5YLJn+y20Mqng
	piml85G/7HUuvM2GB/WKFUA3SVIx8Q0+t0lXQUm2RKDp16OtO7KW2hdn4SY9FKZed0tG0VGA6Ey
	nmvs6Y/nGJ1Oi00tffQXpV3JMqaYJjL8gnolstMtIFS2DBVXKCivwpYmNmcj86pnzYpQ==
X-Received: by 2002:a05:6820:4b09:b0:6a1:5756:10d3 with SMTP id 006d021491bc7-6a30d79e230mr365118eaf.22.1782912352999;
        Wed, 01 Jul 2026 06:25:52 -0700 (PDT)
Received: from ubuntu24.. (dsl092-249-254.sfo4.dsl.speakeasy.net. [66.92.249.254])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ec34f898sm4938144a34.27.2026.07.01.06.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:25:52 -0700 (PDT)
From: Xing Loong <xing.xl.loong@gmail.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xing Loong <xing.xl.loong@gmail.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add mbedtee
Date: Wed,  1 Jul 2026 21:25:12 +0800
Message-ID: <20260701132514.186953-2-xing.xl.loong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701132514.186953-1-xing.xl.loong@gmail.com>
References: <20260701132514.186953-1-xing.xl.loong@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_062554_028642_33EA00E1 
X-CRM114-Status: UNSURE (   8.08  )
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

Register the "mbedtee" vendor prefix for the MbedTEE Trusted
Execution Environment project (https://github.com/mbedtee).

Signed-off-by: Xing Loong <xing.xl.loong@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d6..fd032a3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1011,6 +1011,8 @@ patternProperties:
     description: Maxtor Corporation
   "^mayqueen,.*":
     description: Mayqueen Technologies Ltd.
+  "^mbedtee,.*":
+    description: MbedTEE Trusted Execution Environment project
   "^mbvl,.*":
     description: Mobiveil Inc.
   "^mcube,.*":
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
