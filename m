Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB08BCCD1BF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESq0YI9b3eAqQDMQ0ZeNFej9yCXWdV3wUwjdEwZebtM=; b=jZdAqTIWJeeuuI
	ZsoTGptc7KAPD+xSC06i3ms9ac5YwcL7s7F0qlg97Dm67IO54SfPeK3xLVaxiDNUZiO4dKKud8x8q
	f0/e5hJwYI55+GRk2ftdwyKWJaKZb7kBNd3/EmYWZYCHYFo2Pokzmkx6EJxX44mcuRXXJX+Z9Bpqp
	IGO/f4xs8FkxVw3XNz7zqgQ9x5RCRKlF9lejEsD4hfGjbNmTqfYvwpUzsi7qjtof9nstSwxc2YTmB
	MKwBfGYT7trWxf1f97Fvs4ULQ66TNmLPWbG2oig1CxnljoPdgL0bUk77YfT+Bi4POiu+nNNtVJlbH
	Q1dMkHfUz+6+tlKJh/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNGc-0000000AL6D-0t60;
	Fri, 24 Oct 2025 19:16:02 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNGY-0000000AL46-1XPt
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 19:15:59 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-430c97cbe0eso23372415ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 12:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761333357; x=1761938157; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0sSxMmpgJlm+DBHdJiFvMNmeUcFKdKvsAUrpyjqesM=;
        b=FbLadtsYecHBMTA+T9wWNCmh0JVn68+2YRppQ2/vH+5dPwwdw6wKvmheMr3blZou5U
         Ht+zx1bRm7baTZd5M8D8qE14K0IZaWRx3TvYcQfrdaqbabcb9NC7ZzTW3Rv4/TDASyxx
         4r+rU8NQOyGftQemO6u5TyPY+/k2iesJZFVXfpDps+Qnhuhc/qO61RE/RaP9VrgNWK0z
         Yg6VkpCt0xU7z+y/2rrrwnaMoxYYGeg6yge1IrEcMp1EtsKeU/DZctQjI57zD5MxIrJf
         DuWxgzo8z4TpHjUH7aiyNBbo4kz8O7cRiI+yhAH2wLwwu3V+a8yM2M4KIUBTFFjM9rHQ
         lvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333357; x=1761938157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0sSxMmpgJlm+DBHdJiFvMNmeUcFKdKvsAUrpyjqesM=;
        b=Drtze2U801mbXm1/Tg+ErM4gUi/MTAYWik44h/SJAVogNYMdrmEVse5yJswZQW3lfj
         0CUwkNmveGkKvgjyOYhOjMA1pn5VXJ69ZgxA3yNT7937Uo04KuhJmw7xYZBswmLJ45MB
         kFHEwutTBSEwuqGbgOmIadyrhapG/zZKYGBBMzbl2WXRRVbUDM/bcnu/rXElup0epKTn
         lyHlOmXO5xnR/nSHk4btmwUan+wILfmuLCy2QHZAAEgFm1QvyRSD7ZQYMAWMx7uZ4sXW
         HMRVH1/lYUG5pj4sAfpATgFsbPYacLgMRgLA83i5W4YuLDEb7btx95afsEmg8qtpSSaY
         K85w==
X-Forwarded-Encrypted: i=1; AJvYcCXUV4LxzG9G4SzivhkvyjDGjztjjZy5oGZEyNdcTfbIZ3zsqU1zrn3rPMBcg3eOYZmhM1oXqEXHByWFCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuY62/NdZS8HXVmWm+9j4hoT+BVgYyVF2dbKFK8F6GgJaw82Ds
	LvPCYPZX2syepUACZIV4xkAFSRUJFPYlwQJ3Mw3hm6l7BB1opG6hoUVQ4t5/CWFdz2Q=
X-Gm-Gg: ASbGncsjdKqSYGXQk1BNuSQP1DiVxE58dNADcp7oiFk+WW9Ya5C6YC3Bk1/kwevUBMl
	s8+Epay0tYZImiLnBFn5h8hAEwVmanwvlG6XuxoewgN4CC8KHHyyPCuu8l9bhCmZvvyJn0gymMj
	ZUoDZR9DuTf1GLeMyhpLxyzFmixEtPVP4nJFhQrFN8ML8hbErsRU0F0mY/McJJaMIHdi2EhGy/z
	bFQR2i19NEA+lMHIqyQ3O1FPpHUH/U2fLeAmn4fAIgqR4z8jmxq8vF78zARkrMY/gEP56vOzj17
	ndT01ZQhHaSamdHDJVff/hDVECvXGkGf8f4PTFFFBIqdlIPnVBb5HTZ1srr6WurJa9PBB2Q8QFm
	97+mfxDLu8bFaKnfHhKm0ScZq3+ilFVjmOjzwGuWxGTw+SHFGCq7gYuwnAfndgSlWpuhI0Exfdk
	2Ic/CgKOfK12q9MDmD3JCz5MhMAlMRKBh8jRMvc+ftFjmPwDBOtFMUPg==
X-Google-Smtp-Source: AGHT+IHFcHZhfeKTHaIT8TeTse7w8bjG9Loy1iIsFUAysOy7saMHPhRTlKWgTzZuCkFXEhYPt8zLNQ==
X-Received: by 2002:a05:6e02:2590:b0:430:9f96:23c7 with SMTP id e9e14a558f8ab-431dc13b52bmr101093185ab.4.1761333357439;
        Fri, 24 Oct 2025 12:15:57 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fdb7c7sm2427824173.44.2025.10.24.12.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 12:15:57 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	han.xu@nxp.com,
	broonie@kernel.org
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/9] dt-bindings: spi: fsl-qspi: add optional resets
Date: Fri, 24 Oct 2025 14:15:42 -0500
Message-ID: <20251024191550.194946-3-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251024191550.194946-1-elder@riscstar.com>
References: <20251024191550.194946-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_121558_407132_9A9BF263 
X-CRM114-Status: UNSURE (   6.54  )
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

Allow two resets to be defined to support the SpacemiT K1 SoC QSPI IP.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - The reset property conditional is now under allOf

 .../devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
index 5e6aff1bc2ed3..46e5db25fb107 100644
--- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
@@ -11,6 +11,15 @@ maintainers:
 
 allOf:
   - $ref: spi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: spacemit,k1-qspi
+    then:
+      properties:
+        resets: false
 
 properties:
   compatible:
@@ -55,6 +64,11 @@ properties:
       - const: qspi_en
       - const: qspi
 
+  resets:
+    items:
+      - description: SoC QSPI reset
+      - description: SoC QSPI bus reset
+
 required:
   - compatible
   - reg
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
