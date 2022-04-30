Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823A7C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Apr 2022 13:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TQJiBp9EQ0aoZLHBsJt9RFmWCnDPLJREs+FmytnVNxY=; b=e3rndr8TO22kRJ
	Mkbb/gwtEXkEWo/yFM0zaVSWYEflypeHsKLS6rJ0OVl8j7QVFQ7i9m9FR3u9yzxQq008MU0UU6ZDA
	NYZ+MiKp440H9TYCzMdUns/EG1+lw5MW1jjpHfHcsh/JAgELJqnxwEbI12WSlK0AYEVSzg8IyqEGj
	Ok8K87pcnbnbKJx5cyFCqHa0F4AJGFYTw4vSJLBniJITRXi3gc05o+0jZCekW6+wkZyRNLDNZChmC
	JPbJraIHm3lCuj8VGk1McbvJQ95M+1xobxkC8CSO/QbQHrMbAKT9F4NOu080+K3ve9bsj7yukXut4
	DtGxXdMvQsRTAFI5kxOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkmuH-00EJPA-PA; Sat, 30 Apr 2022 13:13:05 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkmuA-00EJLV-O2
 for linux-riscv@lists.infradead.org; Sat, 30 Apr 2022 13:13:00 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 a14-20020a7bc1ce000000b00393fb52a386so7806206wmj.1
 for <linux-riscv@lists.infradead.org>; Sat, 30 Apr 2022 06:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X01Xnve0qqr6OIc5S2nNdJzpIGzcmZy0c42E2H5TnFA=;
 b=0BDgOPux36pkiBKZ1Awo5enlCPyaYpWLmekPEnzNCVxB2COH9QPxWkacPNxgRb/CmC
 idlXYFLT19/YaJnVREMNOdAvOsVBBiNCdraRObIy2OjNC1xH/SKUgN+Zd6FGaPrJGOcp
 /OiJMBOE5PUYwX9QqWXnS9GKXFh/gm8mazu4tHKKzV82gKwPDIErXFcsfsWLy3tA2plI
 VtPWLgwiSQ0Hro1hrlHoRBEvfX4CZ5iZcpcPWWO1ZYkoisjrlqvcwcUn0R/OLwx+sfS+
 dro6uUwVJ4agBlQMjvgRs+k+LB7V9rRj+Asi/9qhWx/z/OxrGWwl2FtShOcp0ATpY3nH
 +4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X01Xnve0qqr6OIc5S2nNdJzpIGzcmZy0c42E2H5TnFA=;
 b=ExmLjJ2mabOf2o8aIoCy5YZyvejmrcQ/hlI3TlDIRKBbFmRJ7TR5R1AXQGjbcwCAt+
 6+18UN69tPWp9DxSzy/R1PhhdOf7yOKznPTBb1jqF0HVZH2IjqTVgxgqZcJBQmvF0ldE
 SxH0bsFv43SiFKLT9rNN2KSG7J0ehm9sPpsLop2/93rWkYLuhxZJe8I7AFMSyXj4lG/Q
 yOnfFrE5Lzmec3QOe+LX/8s9xsD9HgRjmTgtZ/s1hKiXc5SwNzyLKN45aQZ3DYFaCTq5
 JVirCaIDCL/4qqIP6j4Ra/rNG0TZll2Ekh0SqMG3uzjIrmrRDLdW+svwJccg3IoCrM/K
 iXAQ==
X-Gm-Message-State: AOAM532yOnvksyyNU77IkZNKbLWdQ+AvPKVlfzGn68NHlUTyvw9Q8FJa
 I+OYZBOd5SRej1zB/RPWb8sSDA==
X-Google-Smtp-Source: ABdhPJxEFPS4yI2UKBPZYVYHHGUEADdn/oo4ZI7S0StmG9hSxuFz1e5YOjLmg07b+nO4hMsKZnHO7g==
X-Received: by 2002:a05:600c:a44:b0:38e:3ce3:3148 with SMTP id
 c4-20020a05600c0a4400b0038e3ce33148mr3542227wmq.26.1651324377553; 
 Sat, 30 Apr 2022 06:12:57 -0700 (PDT)
Received: from henark71.. ([109.77.36.132]) by smtp.gmail.com with ESMTPSA id
 p9-20020adfa209000000b0020c5253d8ebsm2004439wra.55.2022.04.30.06.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:12:57 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: krzk+dt@kernel.org,
	palmer@dabbelt.com,
	robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Conor Dooley <mail@conchuod.ie>
Subject: [PATCH v2 4/8] dt-bindings: riscv: microchip: document icicle
 reference design
Date: Sat, 30 Apr 2022 14:09:19 +0100
Message-Id: <20220430130922.3504268-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220430130922.3504268-1-mail@conchuod.ie>
References: <20220430130922.3504268-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_061258_837007_E1ABE0C5 
X-CRM114-Status: UNSURE (   8.63  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add a compatible for the icicle kit's reference design. This represents
the FPGA fabric's contents & is versioned to denote which release of the
reference design it applies to.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <mail@conchuod.ie>
---
 .../devicetree/bindings/riscv/microchip.yaml          | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index 3f981e897126..c9d8fcc7a69e 100644
--- a/Documentation/devicetree/bindings/riscv/microchip.yaml
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -17,10 +17,13 @@ properties:
   $nodename:
     const: '/'
   compatible:
-    items:
-      - enum:
-          - microchip,mpfs-icicle-kit
-      - const: microchip,mpfs
+    oneOf:
+      - items:
+          - enum:
+              - microchip,mpfs-icicle-kit
+          - const: microchip,mpfs
+      - items:
+          - const: microchip,mpfs-icicle-reference-rtlv2203
 
 additionalProperties: true
 
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
