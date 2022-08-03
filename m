Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2A5C19F2A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Aug 2022 18:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dYYESR7qId3n2ot1ksbqvWcxOUDoHCtDXU1LWakBUjI=; b=j8/IuW4p/PZ7wm
	iIzKJk1t460v8Ysed8YSon/Yao28EXUgMhoDyb0I/cR63g341n0ZxDMjYvXF9P81+Vu3VzOZ5n3mt
	+jWksQjXi2+BNmIPfBmyNdFDs41eXOtsW3U8h5R85cmB1vSLeSTCUbxiB5VhXJCp2Z2PvbpXdtG4c
	MiUAry31a8UBXN1Hdp6yXElcAcc3SXhCv/YRivG/O+AEgHb/+RI/Ggg8RxAKPnVv59f8ZAZLbCece
	xUols/2eQuVRAbxfC20cn5MCgGP5bCYnn73P2UyvQygmGZxL2HqRG7mj6ue4ViYgwtg66YirpxHFt
	QYrspF56eRojzCakNC6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJJW8-008c5s-HN; Wed, 03 Aug 2022 18:54:52 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJJW1-008c0L-F4
	for linux-riscv@lists.infradead.org; Wed, 03 Aug 2022 18:54:49 +0000
Received: by mail-wm1-x32b.google.com with SMTP id ay36-20020a05600c1e2400b003a4e30d7995so1347044wmb.5
        for <linux-riscv@lists.infradead.org>; Wed, 03 Aug 2022 11:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=2lJBh4Ldu3F8w5c1LMKvoZtYAyOssPreAlBa9+g7iEA=;
        b=dom732Z2/wWmOB2Oe7aUPh3+FN7DKbGHI5cMnWl6l/6P88jZVqd8ezgNsFTQkK5Mmo
         YGhRQprYqaRuE5AEn6sfByJd/GLBmAUq+A4V2A5Ohvphx5ICHDn1FfuneIa1McshBZRg
         8yApp60TaeeKKEg0yABjRv5ZIlPGfocQqGHMCpU0guEW5v0ZfQqAqgRSowblkDyeDZ5V
         4pBwsMADhMXlkHlP1ONCww9nyvZaG4zuiYV8xl6c5uqxhig8SSbZ00unbf3h5r/1pSsS
         gt4bn/a01WXUeXy1IxUa0bXxzOVHwDm7IdXnsGRlohOfAt+nULdNCACHbw8dcAKYsxoe
         Cs+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=2lJBh4Ldu3F8w5c1LMKvoZtYAyOssPreAlBa9+g7iEA=;
        b=CaDPACesvnTAlD8AP+Cal1dlmj9lvw9/pZZ0j61HCvy3hOHIrljqNfjLWPVQMqJmpc
         nuc2Yj786NCNiW3KSoHteFXOOfKaZYWQMo7MKGEXkiDNW0l6Q2r9/2uSaAAguZkNzby0
         MBjw+rJ02lFkVQuXpCzsIuV+0+OKNzZgLCOb3PwK5nInQp32nBi2dHJL194EGvZO/qLB
         OH9ZJLm9ATgnUmyLN9wwyDddqukUhLhMS473o5Kn/8xAWsbL6Gaje0Rk8VmAWI24d3KU
         GByE/uEMc70NsaUDESh2MpzGTpOmS2S6Ie6hGU+9nID5sGRZ4fMAtsb05Bgn7G6PJ+k5
         1vCw==
X-Gm-Message-State: ACgBeo0PBRa6FhjElpi4rqlhsJ36I6mMjQkJXB+nEBZkNJOWVXTfolpL
	xXG3mC5JQrYbRVIJkUgxvhDoTg==
X-Google-Smtp-Source: AA6agR4rpp5noOjscreSCj+sQNOg/JpEG73E1SLU1E2Xa96eqCLevZ7d0xfZ5wfMiISECAsS5loO+Q==
X-Received: by 2002:a05:600c:4a13:b0:3a5:835:c680 with SMTP id c19-20020a05600c4a1300b003a50835c680mr19729wmp.101.1659552882921;
        Wed, 03 Aug 2022 11:54:42 -0700 (PDT)
Received: from henark71.. ([93.107.66.220])
        by smtp.gmail.com with ESMTPSA id l23-20020a05600c1d1700b003a2f6367049sm3545072wms.48.2022.08.03.11.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 11:54:42 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atul Khare <atulkhare@rivosinc.com>,
	Sagar Kadam <sagar.kadam@sifive.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: riscv: fix SiFive l2-cache's cache-sets
Date: Wed,  3 Aug 2022 19:54:00 +0100
Message-Id: <20220803185359.942928-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_115447_588578_BA697733 
X-CRM114-Status: GOOD (  14.69  )
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

Fix device tree schema validation error messages for the SiFive
Unmatched: ' cache-sets:0:0: 1024 was expected'.

The existing bindings allow for just 1024 cache-sets but the fu740 on
Unmatched the has 2048 cache-sets. The ISA itself permits any arbitrary
power of two, however this is not supported by dt-schema. The RTL for
the IP, to which the number of cache-sets is a tunable parameter, has
been released publicly so speculatively adding a small number of
"reasonable" values seems unwise also.

Instead, as the binding only supports two distinct controllers: add 2048
and explicitly lock it to the fu740's l2 cache while limiting 1024 to
the l2 cache on the fu540.

Fixes: af951c3a113b ("dt-bindings: riscv: Update l2 cache DT documentation to add support for SiFive FU740")
Reported-by: Atul Khare <atulkhare@rivosinc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I split this off from the existing series as there is no dependancy
between this cache change and the gpio patch. The prior series can
be found at:
https://lore.kernel.org/all/20220726170725.3245278-2-mail@conchuod.ie/
---
 .../devicetree/bindings/riscv/sifive-l2-cache.yaml          | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
index e2d330bd4608..69cdab18d629 100644
--- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
+++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
@@ -46,7 +46,7 @@ properties:
     const: 2
 
   cache-sets:
-    const: 1024
+    enum: [1024, 2048]
 
   cache-size:
     const: 2097152
@@ -84,6 +84,8 @@ then:
       description: |
         Must contain entries for DirError, DataError and DataFail signals.
       maxItems: 3
+    cache-sets:
+      const: 1024
 
 else:
   properties:
@@ -91,6 +93,8 @@ else:
       description: |
         Must contain entries for DirError, DataError, DataFail, DirFail signals.
       minItems: 4
+    cache-sets:
+      const: 2048
 
 additionalProperties: false
 
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
