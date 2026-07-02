Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E47C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 15:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fu51ccGKwF3LXbkHS5RvkCx6KPvdrwkK0FI/lhrZ3O4=; b=muV9Uri65MHimb
	05NUB22zts/uKCkOfT+zzxH0lxN4dn9ZDji65OPhhlX/DnYFsXp72693uS6Ub1kyqbJWRuUgNNaaP
	A9aRr0gntJ0YGjsiFh8yYde6GKlpwIQzJxYWNkueG0ue6HA/AGQbq53ceUjnjL49/zpAFjTQ5jTD+
	F/Z1GLgBblG2wfAfzpVNk4bwcDwrPxd7uYQOouhZcGfs5ENEjJFcLA36Krx+cYJjdo/T2sf9FRbSb
	Nhzb3pLdf5rY5Y2suQm/EKjM5KPZ6rATV+fJrgDdHYG3xtdSm1ZGZpuuaighF6CKnDzEkFImjuY7T
	R4pVlevd8ZvfgG7V8dFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJ5B-00000004ld1-2Pvl;
	Thu, 02 Jul 2026 15:12:05 +0000
Received: from mail-oa2-x00.google.com ([2607:f8b0:4864:30::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJ58-00000004lcW-23fH
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 15:12:03 +0000
Received: by mail-oa2-x00.google.com with SMTP id 586e51a60fabf-44a8a4a2888so535507fac.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jul 2026 08:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783005122; x=1783609922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9ly6ZTzLYLZx8yS4TUkxxmSHINnr8BKtUdkBSO+x1w=;
        b=LQOMnqKjkvxfDCG9iIZdx8IP7N9uUt0HDok4tSGY1fAaTlRzYQDtmQ/UvgTEZbhnic
         1n3O6ca3/iKQFh22vN7/Aq1gzrQVU7JGxNWR2qVK20zBqwnK2NLY78cFB3Gf6JVTz+95
         35QBZqAOFeh/PUg4hv8zMnoIAqrjQY6X87XUNdPw8nWQ11tWhJ2sK7R457yAjOchYQ9D
         X4AMPLZ3OBBG7rL6+G5cDWu7bgUHamWm9DPrHQD9Oh34hqF388My+XKwTfCSUuwh8RDW
         juglIGDMj26qk0qh2L6uYLXiF/dzo+ojRuYxF1H8xvemYDqhFR7Z59x8bPfamcvn7GOu
         JDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783005122; x=1783609922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P9ly6ZTzLYLZx8yS4TUkxxmSHINnr8BKtUdkBSO+x1w=;
        b=VgmwxfskBuHE/d1PsSIWHh60AWtJ7WXsCQVenWMOXuYFK+CJwZdoVnlelASa8zKLED
         v2sxnaO2vyCcrJF3EY3Ci/Sn409hJbhcQFTEZ5sMQ2s8aHOEycjLbBRjPwcGK62ZYFB8
         yC4M6l4OGljOrK4jCcDfzsCk2p94rUtEx3lJYf+L7aTeQ1MJ/kaUWrWEx3TZ+QIuRtnv
         mmqHyKmJQxXxpc8NWby+gNXOx0a4xtpivbduxu3ROAdRFKwHOeI2Y9eVi0gx+dbgjpMi
         g0nX0OP/JEcV8zkrA4rH+SdDsw/PX791hAMzc+rMv5YswRzjh4E8e+dMhTd3El32hWcy
         LLoA==
X-Forwarded-Encrypted: i=1; AHgh+Rrby6FM+bTb3kwUAOBemD6oFHE4gN3ha4OAOaRcOVcJQYV9kaNxapSW6wRZMqTX9vylwoUSxB7jW8oSlA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/ddw3joHH8KcwXF2T85EZHQemdoNwvLiS+WBRB8trtmr2KgYD
	9utV3HrgWp7IgT0inTAdak5wjkOBE/ryIt8sdbW9tld1hf9OFHAA8lTk
X-Gm-Gg: AfdE7cnylAbTAZ+BkxGoNOidF+zWVxj8GsnT1uf+LCkT34+amriHvYJsX/ciZwBhx8T
	LPTsQufioGb3KHUZIEX2S9Vi9aGw1STc2RxsoeKG4DYEaA6W/9g6djwB+SC/tmjeqd113RqaJev
	r7zEbOwPX7sXQJsvFSO2K+lb2FW8m1v4WqjpKpYh8FEerW0FTx3CxIOPzp1v018VlZU6Eyp/dyU
	3NbeD5LultjX1TyjZMqCv5/SI3m5PySgVNHd4haln6bl0Z3o5JBYaEwaJ+PKf0wV/r9CUccuKzH
	GEedTrPdzMcigai97Ggo/9EflHaCxiPDYwCfOhtxB8m5zOYVsBj7gardawxJREcyIuzANuiAGUY
	bPWFf6h2JzNHRPVwAlCynnGzxFGjct3n10QoU/UbCV5D8c4pWJruAm/hg8+1xMSyK8jT5eKSFMV
	dn0UAktE1KVT8AP4wITtGvrfS3ii/m8PE5omDTkm3Oe/adiywz5CHLRLo=
X-Received: by 2002:a05:6870:7055:20b0:43d:31dc:a6e2 with SMTP id 586e51a60fabf-44cad5682a5mr3142542fac.24.1783005121718;
        Thu, 02 Jul 2026 08:12:01 -0700 (PDT)
Received: from ubuntu24.. (dsl092-249-254.sfo4.dsl.speakeasy.net. [66.92.249.254])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cbec9a113sm3094561fac.9.2026.07.02.08.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 08:12:01 -0700 (PDT)
From: Xing Loong <xing.xl.loong@gmail.com>
To: Jens Wiklander <jenswi@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xing Loong <xing.xl.loong@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add mbedtee
Date: Thu,  2 Jul 2026 23:11:13 +0800
Message-ID: <20260702151115.544016-2-xing.xl.loong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702151115.544016-1-xing.xl.loong@gmail.com>
References: <20260701132514.186953-1-xing.xl.loong@gmail.com>
 <20260702151115.544016-1-xing.xl.loong@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_081202_526708_FAD65C95 
X-CRM114-Status: UNSURE (   7.80  )
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
