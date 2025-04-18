Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3BFC369CA
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 05:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rm50iKFecgYpGESmO8ttcPjqCd6xalO2hHCIUY2yico=; b=jotIwR3FEp1J4o
	XnegHWSQBZIUcKx2pbOjV0f5Z2B+WAMCqZBnCSO1t6bo3P2j/28doQTqxIHMS8uch2XinsBL6/aC7
	ormQxa6bp1QEPf1vB46lSBHwd+YRtsL9h9w/9xO6pwLhepuX7y54CqIiwekUm/kvxWNvSUx20S3iC
	vmru40dMgB/Bv0mCE71l5ZtfbTdgG71dbu5gysImPXGtcUNZenCbR2jmOQRGmUJRG7NaEPsV35jB3
	01LviNEAfbxnZLiP31az+tqB+90uX1FHfxAxa4xzKqI0KmjfkPTUcgtyNJF04hTp5aqx6+fyb42wF
	P8hbNi17hhMPMNQnnQ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5eMu-0000000F9Rn-14Sn;
	Fri, 18 Apr 2025 05:34:28 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5eMr-0000000F9Oq-2YeF
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 05:34:26 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-736bfa487c3so1389053b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 22:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954465; x=1745559265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQs7uzZ6Onwkx41wDcc5ghYmXoSRb5gM/5WF7cFYuB0=;
        b=grwvP4HWtOJt0+jVyDcvnyATHjq+7weAJqWxG5xoOu6X30ecNwgKTz2+FV0w/MEW9v
         Jl+k2Yxp/VO1DCHm0mpsMwwIgB6bXv8197Qb4UwR9z7Gs0Hz6y9I8TiE7G03d/sLQVW1
         Cr+NPE+DWIr2IeRrlAAENU+1cnt2mYbOaH9BgqB0eIXnRy4PmDLnbPpvTqhgWfOMlbwh
         OIC41He5SxJlm8i++xhpbDQV6NJ0nj5HKEytSt0Nuph94ZJI4S3tH7NO/3dUvLqWKe80
         iAu+5rVZ7JRP71ay7EtJL9tgK5OgBsszdlHwucVeOpvHtMN9oKN3Uepy45T5k6wnOE5A
         eoPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954465; x=1745559265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQs7uzZ6Onwkx41wDcc5ghYmXoSRb5gM/5WF7cFYuB0=;
        b=ggpTiPCcf45bJpbvMx5AYz+r/h9bILyOngclwrz/utpBJfQkAJygc6UNu6tj7vMvfr
         qoUDHQYgdHGzdogAYXsrrBXhHo3I9G9GowIhIARbNHOvhourfLr+Q9IPkRotmn5iHGB+
         61dPfzkjrxa3L7v6wbPDkE4gxb9krg+doDuXUlnoxjt+VmcUw9gbTaLI1prgjAuD5tQX
         mMiKsEU1VfWGwsC/vzB5iE9I/SlyO/DtepgBiQdZj569ES+bG/Pr9sp8S7P/fLfxhrnK
         +VteoXMDFoOBSkODgAZQc01k4rJcBHBWe6jo8qKJUuA6S46lPE+HEbb9+i3yk0g+LF4t
         jrkg==
X-Forwarded-Encrypted: i=1; AJvYcCXANQMsjqYJ2FR/ft5PX04dmHgvWXb2+mdWWKa1hT1hJNIdGp5LTOErC0Xl3FM6tgsPO8dgsCdZ1BOSMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbf15UzTtII2vCG7Ijoq79qZIa5HekpfJl1qQdqspx0L0hq9tQ
	qIzDuATpnO+Pp6+ryNQRak0wZfvJp+G3asbG2kS78/Fq+Qyd8IllB1Vq9cSto3s=
X-Gm-Gg: ASbGnctbSEiEcOk6Vh+QNX3jYOTZgO5hA+4JXh88ENkSxhxJiMvzlUdxsgibuys+RWs
	z3+R09OD5uE3TD5QkSN2TzsIVz1jzQJGL1adUUlXSi11E7/BA/n77dU+h5tQTdB5h0rXB+gmOgR
	wuV5LIqo2P1Ch8kjJ+kn/Ijx1m5sNX8zBMMKF4Ue0GGVWQNNHjAwU/ETzXZ5ZlZK+RilyuDgvlK
	XPmocR4tLTVh+p1lQW88gEPciLyNu+1Z3k3WYY95KNbpSOuregjeaq+0TOYRkWzaUby5vP5q19S
	9zsrhD4r9vh0AIrkyVE9aBHHPXUDTHvCpbOuGBASmld4v2jDlHey/QZNGA8cTC7UCY8uK/cQhXs
	8
X-Google-Smtp-Source: AGHT+IF2DvMayvvtqWjev5K9y4IkVU3547WcTSfffFPt6RiuPH7JdExs6M3EHo0S62GLsq0ai7FbqQ==
X-Received: by 2002:a05:6a00:3a18:b0:736:62a8:e52d with SMTP id d2e1a72fcca58-73dc14c7d0dmr1797266b3a.12.1744954464653;
        Thu, 17 Apr 2025 22:34:24 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:24 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH 05/12] dt-bindings: riscv: Add xsfvfnrclipxfqf ISA extension description
Date: Fri, 18 Apr 2025 13:32:32 +0800
Message-Id: <20250418053239.4351-6-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418053239.4351-1-cyan.yang@sifive.com>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_223425_645363_E959E63C 
X-CRM114-Status: UNSURE (   6.53  )
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

Add "xsfvfnrclipxfqf" ISA extension which is provided by SiFive for
FP32-to-int8 ranged clip instructions support.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index d36e7c68d69a..be203df29eb8 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -675,6 +675,12 @@ properties:
             See more details in
             https://www.sifive.com/document-file/sifive-int8-matrix-multiplication-extensions-specification
 
+        - const: xsfvfnrclipxfqf
+          description:
+            SiFive FP32-to-int8 Ranged Clip Instructions Extensions Specification.
+            See more details in
+            https://www.sifive.com/document-file/fp32-to-int8-ranged-clip-instructions
+
         # T-HEAD
         - const: xtheadvector
           description:
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
