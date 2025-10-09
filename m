Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7A7CCA470
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 08:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jHZVuLJpiRrsxk5GxmKSvmajYML/vOkYMoO5yZAFKlA=; b=X9o1w0GjY2KRq5
	bcKzJqARg3vp1YaLcPNL1U0prfN6mUghpBI+DxGGmGz6UxpG2xsbvt47RPHJWKC26ckYBp89lv/kx
	3xnjwxDd7V6+elS+l0EGyUPWJbQJG56ia7Y7PH85i15rP68kGIWI/RsWRj+IemueR5c14q+BJ81K2
	czDDWh3lDI42vgZHuNeg6M7XCriA+LngSAfdR1bTLniQskOG2uDQCEMxpeCPnViUJfSKuch6Yt0wQ
	+oELNS3vSPMoZpiadaUghxkJpHYjAILuub4GlZ2is3krRZl39cb0McXAO0UU3tS2qwjde74VSrkGe
	qQWHNyKruj0aPHh1qtIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lu1-00000005VK4-0Uyu;
	Thu, 09 Oct 2025 08:21:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lty-00000005VIi-39gf
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 08:21:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759998089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=69ME3BFXEVp+2f1cKazmVJlzdaHKV1pAL9MxTHMgn2Q=;
	b=ghcSf7S6B66nRclNlhXcF+m1J/U3KEIzW1cgCZnkXCnM45/KjI6NHbFZmnRdw5KXaUuEkr
	pl0Cj0QMvfO04+MDhNe2SQIb0BcupKgSkQhQmfly/Otb2tgkyneW6EMni1ftPyFDC1iuN3
	X6JaAEkuFj+0Kd2Edgfnd30yQzPcSAA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-gBUAycs0PP22hKAsmR4f9w-1; Thu, 09 Oct 2025 04:21:28 -0400
X-MC-Unique: gBUAycs0PP22hKAsmR4f9w-1
X-Mimecast-MFC-AGG-ID: gBUAycs0PP22hKAsmR4f9w_1759998087
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b3d73e1ed87so82844366b.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Oct 2025 01:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759998087; x=1760602887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=69ME3BFXEVp+2f1cKazmVJlzdaHKV1pAL9MxTHMgn2Q=;
        b=e+mCZoIBnnsUM5WcA6k8hsXSwOZslxXm1+thtGMIdZgScGRZbBloJrweno+FUPOC6B
         SlHtMwsKi+vaPHN6YAUhz2IvzOUlhLp5gXPQjtP7rBdqTo22b5xP8ltTidH2wlbrNkGn
         q/CJpxVHORx25UTTr6oxA9UnydoPwIh2JBfORZ86Y9k8gz4m0TVglxgghQcG2FmeyQ0y
         EehQ1tFOE0obnVI0vDZjW6g+GKm4Ye5qPoqzXpEMhq/nIdshxXJh8bW3NR9m87HKPLzp
         6QsPbxRhn83vDk2JzMNQPzdD1+WckF4LDoOy8tM3liLWKORp7+SZx0u99QxtHkjzLq2y
         lhyQ==
X-Gm-Message-State: AOJu0YzTI/p6cbsvIgcfwcOuW79SoSMA46fvJzWb6dX9P8wXdfi9l7B5
	Y8BFWEAOIeM5fRHaWcAkxq8QVoDKhPKdz4R/wYgLn5J3JuPw3xWDDWM5DToaw+c76bR8RPxVFqN
	MT9QIESI9j6dFA5TccB3/DlOO1h6/yUf764m9Gft+E5MiWweRROE7+aALoOpIARrqzyNSkg==
X-Gm-Gg: ASbGncvGoddzAH7OCW/AJyXVUdJLtKqULhF2CRAheKtUzFF7x2TWYV8nTEgUL2HqSy8
	bRvopBc27cpLF5Ix9CDiqQ22dvsTo7OKwhsek9sSsw5GSD3/ruaRrB6rjRXMuqpskh5kfyu0isw
	LqhghcvzS2fzd9VUlwUraO4mGs1HhW4Ofmqj+wEr/D/BzsPI7+KyTEk2kpo9hSCo33PGyhGOq6Q
	psmCNpQYmVH4J4KsEVa4bn1gSqAiALfs0ZRBESLUpusTDhggLdwIa7+kzBwMTPf3Lzx0hlFNVYD
	PqKZAYU53YuIToqsmcCGLHm99UDfmmrADs7dul/OWI+IwpuKi9oG
X-Received: by 2002:a17:907:a4c4:b0:b2a:657:e733 with SMTP id a640c23a62f3a-b4f429f034cmr1151761466b.15.1759998087383;
        Thu, 09 Oct 2025 01:21:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVjMgqntPb0Ku3WrCmKlIFeEE9zkajxUeW2OCAErcWYVR5IHLUb+ylRoCc+fH0u/EYTD7qaQ==
X-Received: by 2002:a17:907:a4c4:b0:b2a:657:e733 with SMTP id a640c23a62f3a-b4f429f034cmr1151758366b.15.1759998086937;
        Thu, 09 Oct 2025 01:21:26 -0700 (PDT)
Received: from holism.redhat.com ([148.252.9.235])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869b4e27dsm1832988266b.70.2025.10.09.01.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 01:21:26 -0700 (PDT)
From: Lucas Zampieri <lzampier@redhat.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	Lucas Zampieri <lzampier@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add UltraRISC
Date: Thu,  9 Oct 2025 09:20:11 +0100
Message-ID: <20251009082013.1331361-2-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009082013.1331361-1-lzampier@redhat.com>
References: <20251009082013.1331361-1-lzampier@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nOZjY9xAI0nPGt_QMQLAhfPmu_aVsPc-KP56IQV4Hjg_1759998087
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_012130_861120_9EBA1680 
X-CRM114-Status: UNSURE (   7.78  )
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

Add vendor prefix for UltraRISC Technology Co., Ltd.

Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 123456789abc..234567890def 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1642,6 +1642,8 @@ patternProperties:
     description: Universal Scientific Industrial Co., Ltd.
   "^usr,.*":
     description: U.S. Robotics Corporation
+  "^ultrarisc,.*":
+    description: UltraRISC Technology Co., Ltd.
   "^ultratronik,.*":
     description: Ultratronik GmbH
   "^utoo,.*":
--
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
