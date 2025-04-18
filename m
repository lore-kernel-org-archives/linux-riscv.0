Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72B9C369CF
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 05:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WKO02VROpzEKNaGkUp6BJv2D5PMIlbyJyfF6NgG/rVU=; b=G+M9HbJBQQUv2A
	D2ZxU2iZtU4uWi5l7CtCcwqlP8h5MWiYNQt4O601CVKfkfGLl/ZguHf126Euipwb/8bQYH3Aw4iW7
	XI0ujUQt4rIr6BMlDgWrZu1xUTMNeEiDcJQkcO/GjOeAD/OmA2nuRO2xjIp48PwIhhlB7FQpApkmL
	xHs6uiZ22+Vv7S3leWBgEvtdLFUp3PJXfko2mn83Alk2SpCIdV0rMKQHEEwLIBx7SRT0nJw2WNNij
	pa0tnygJEuUtSOPfFyljmHra0XoSE5bkuTWpNh2CcnBjcdTt2I2FOxBcBqUho6SSo5ujvzaFqMS1I
	Vu/5X4tbnnjyFx458i2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5eMg-0000000F9IP-3NOe;
	Fri, 18 Apr 2025 05:34:14 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5eMd-0000000F9HI-3Jme
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 05:34:13 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7376e311086so2079779b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 22:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954451; x=1745559251; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/1Q/grKIHBXXJrclQRt4Hnq6m7fwFMEX/d1aTuTzzM=;
        b=MHOLeLwmSmjZRorgHWW60ClX53vzMZrRU6fX1KThi9PhN0ma9kXsA3D02uvC1ThHln
         CiDzx3x1Lh0wKBicBGKbBn+C843Tf7kvyr+dojHJNJzrPJvr9DlUptTK8Ik3tQR1TW5B
         4xNgZSg36BGFoDXQ5KaP9PkAS8UVKGzrchYJi97q9pjd/jtyWYBgrKOewF4edb8KoSHi
         FWP+qd6wYbPJcJAdV0eqdEOykLNOaBDJsfLZMSDIQpDBBg9F+QUzRbpCMTEoZlEZOxuu
         h6+c4+SA1lJOhZHsdS4C9cd+XVDNv1fn76CfdRJLHWX+MayuRv/W99EKfxpOY0f/rgRC
         zQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954451; x=1745559251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/1Q/grKIHBXXJrclQRt4Hnq6m7fwFMEX/d1aTuTzzM=;
        b=XsW+Jau4IxIM16Qvmr0k15Zw1qlDnyoyu+vKhdH1yAwSjS1F3kjGXoR24aTtDPmY7G
         +NcrpMOW4UrzrvGX6LAu/YrYsYollwS5VUG92gycBz+Otbj4uiOOWgJREt5vJQ+zr8hR
         nBE+h1XwcLV2F8Q67qxZkO3WACugE/YWvIAEyMzKkfm4BoSrAe4TerHt/BNDxv6N0+9m
         aQXO0GG+2Lio+ZcOWuZyJE6TLO+KGiCwWzLdgjCvXZ3qr6bRAvdPH4YBeUbkE+Ucs44B
         1GNyKdUQXlG1ANXf70Hs5rm2Q1hFZnIXw/XUcH2euTUXfLaFSWvwb6kJb3PvyYPwzT68
         X9+w==
X-Forwarded-Encrypted: i=1; AJvYcCU/25Wavi0kWvuOshYaJz7BfACjqINO1X+8QMiVfVwaE8b+Exe9lTlbGiwpRuKrCf7pYOI/rVBv8VN8qg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0p6sK0QBeuNa7APmSjeU8MsS5NDxcgKyJRBiqqYk9xYnIsugm
	5sHgaFVtsk3sOsw+o+1MwBV73PZvR+SuU/4slRfg28tIVinJuwmS1I2TKCfC9BY=
X-Gm-Gg: ASbGncvS2SbTvLSzMVJL4Ledx8QDxTIuCbsKQlD4Csk/E46R40UWF93vrU8UFtejUWk
	uXKLy4kgtswMrN4ot/zxUPTv3FybhMUYgxyLvMAwkaA8jUDiJwniN+P2yHk3KHusoPyTfnnybVR
	QO727q6CA8+s0QpZg4ed3mURGmrStHvak0kKQJNVpwnmQyMHwOqqR1kAzLuBnaVfrVqhveT6JHc
	2A1446E6Bc9eXhYEDuWGilS/h/6tmfxpe9Yel09Fr+YrKJ8L2qw24kt8slW8mau1GssvdDA/ivA
	9j/p1rcE1fCXMxvXErT3DKtQ5hGI6a5XZbIliNnCvt6B2cQ3ki8ar/th8ap8EtHS3WaE+m1afKr
	+
X-Google-Smtp-Source: AGHT+IGMRejlAoVBLGVcqScGqmbNq0551GAav/cav6iV405yVX72VUMx1OuS9YTxF9TkwljSuS7HEg==
X-Received: by 2002:a05:6a00:39a7:b0:736:73ad:365b with SMTP id d2e1a72fcca58-73dc14cca6bmr2149155b3a.14.1744954450904;
        Thu, 17 Apr 2025 22:34:10 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:08 -0700 (PDT)
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
Subject: [PATCH 01/12] dt-bindings: riscv: Add xsfvqmaccdod and xsfvqmaccqoq ISA extension description
Date: Fri, 18 Apr 2025 13:32:28 +0800
Message-Id: <20250418053239.4351-2-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418053239.4351-1-cyan.yang@sifive.com>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_223411_831921_4D0AA371 
X-CRM114-Status: UNSURE (   6.83  )
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

Add "xsfvqmaccdod" and "xsfvqmaccqoq" ISA extensions which are provided by
SiFive for int8 matrix multiplication instructions support.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 .../devicetree/bindings/riscv/extensions.yaml       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index bcab59e0cc2e..d36e7c68d69a 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -662,6 +662,19 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # SiFive
+        - const: xsfvqmaccdod
+          description:
+            SiFive Int8 Matrix Multiplication Extensions Specification.
+            See more details in
+            https://www.sifive.com/document-file/sifive-int8-matrix-multiplication-extensions-specification
+
+        - const: xsfvqmaccqoq
+          description:
+            SiFive Int8 Matrix Multiplication Extensions Specification.
+            See more details in
+            https://www.sifive.com/document-file/sifive-int8-matrix-multiplication-extensions-specification
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
