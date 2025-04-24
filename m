Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924CEC369CB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 01:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NOFbV+D1WM2cFSdgzA+VFLoKceO9jJdCRJwtRmnMBfY=; b=yUi9M16j41vAWc
	FcO8z9IG8c2cCI/8tPQm2r4AzMMnVEb/EXfmZAsYJEYg2cYue1UHf+DpW2WEbSvJfRcymdPcfQoau
	AB9Ow2tYa1VgqBizqGccmDt/YpP9Md/gF44xSIxlgemwHb77nT0bBKs9pYKc3KrBRBSikFYxNWQAv
	Yl+1w9CCH87LSmkn/xRg/uWHbmdkIDZ6yMbW4SD9Q1wEC8BP1OpmXeDDrPoi/FbwjkTDCL8P/5Ras
	GRLsrw0NsYT463phwQu66PAiIh7Zl6OQ/3ZBcz6VXsM8axaSPIVhP2KzJIshJsMRjQTdH/jAZJX8p
	9LYF/41WAtq0Q2kGzNMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7lKz-0000000CW0T-2Isn;
	Thu, 24 Apr 2025 01:25:13 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7lKu-0000000CVyh-04hm
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 01:25:12 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-736ab1c43c4so382576b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 23 Apr 2025 18:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745457907; x=1746062707; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvD2JS9X5Qd8+7z6kHFhYE/eJ+K8DjqF4BtDR2kwdgg=;
        b=KVXm5vEtGWNQQZUFQpqI/O8B7Bwv/a23UDgoNkTJhh+T1kSLOzT1GeVA6OnmHkJDgM
         PZsxqyaIw+A3Wm3xsixGzFvOfG/Cy2JTstSWmCt0DsrJPjFaYvBWy+HuDLoDu/nqjA3g
         0vmhGGRSY8P4C6xOMgZDA/Z3T65WLIdSNmDZeo8jIB8CV7OmOy8ultcJdD2IQle0jYN6
         rXqWRy8NMo39OxVGP3MGPqcQpjlmhRLkl0w9JtuWh0k8rN6e6MbrVe4GrjYQMtp0tZOZ
         F4+nW3zStsDU5kvOJic+GO0MRpCOoadUEQyi/kK2IL9wJj+8V325G1wgrBs6z096SIE2
         TYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745457907; x=1746062707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvD2JS9X5Qd8+7z6kHFhYE/eJ+K8DjqF4BtDR2kwdgg=;
        b=Peg4biKij09jA2tQ7+Q29hn2XbDmCCPSrGs+WhAVaJ2pUYfXFpd7kDrgqyqZOxJbEJ
         TFYhYTpORk+QdVuoUbdnbVErV1kgcL8KDL2fLNGKbS8+OKt/eh0KYxZXTrc6aIWPKNcI
         nBYA8OOB7zAirgFq62cJWmNU1H0spSz3LdzIKfoGDie85LGm9K+Fr7qm4cb14YbMAZnY
         dUzZ+0XipHL735JhMFVCgphMMRT4Ze5QtnXPI0t8rc1RyaKQArf9R6yd4Cs1IR/I6QJW
         9B8xQ7OhEosTpXneSuyZEn9ntnM9GX2X6rJA/7lEgI1UGfuUCBRYScUYgYGjOVe/qfSI
         /dvg==
X-Forwarded-Encrypted: i=1; AJvYcCWnZeKRUy+6xfPWX0yaCN6k/9y0b1aJDihMgblViXHNK2TF0n6FYxGFoeYd0jwGu+lgwn4fDj5BW4lNuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFn4JGeuqnMMnMT2U7mTSvJqgoyrLy5T+R5Emhkr8JkW7siKKq
	vxei/4WJdR++Vab08BCW4uC5tUeT8WkFCE86Ygm4VafxCs37/x0t
X-Gm-Gg: ASbGncvuERyufNxU6mjx6MsRzR7Xrk6BgvqF32uNxBUBDPQ2dlf28yaknrLgqfSWz3m
	Fni/CkJ5NW+oTUp6+Rsbw58HAx6AUzHQHWxt+54afuZZYM4YMN0CVza1/RyoAVXVTSyx3LQ5ivc
	oP1XkXf1vbySEmgK4kTM7b4AlY/sPGoDUQGzEOLKaFb16UWxpYsl72O2qswI3VqSJ4+Xy6DoScd
	OObV6/gZdbi/wuK625+69n2Anh6YeLiNuaLzBWmkqVRy9xc9f5S8ecjfVUEO++4pxKjFAQgkTAZ
	OGvNoQKA/EBvwqYalNRv6gBMf/GJezE=
X-Google-Smtp-Source: AGHT+IFz2drTt6QGmwxnYsh9wLssCL62JZqszhXN41V07+NUcllcYb/Qxu2Szo0lKTrVh+hW53QcFA==
X-Received: by 2002:a05:6a00:35c7:b0:736:5545:5b84 with SMTP id d2e1a72fcca58-73e243c5fe5mr1286649b3a.3.1745457907000;
        Wed, 23 Apr 2025 18:25:07 -0700 (PDT)
Received: from cu.. ([111.34.70.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a8cdsm231049b3a.115.2025.04.23.18.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 18:25:06 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 1/3] dt-bindings: pwm: sophgo: add pwm controller for SG2044
Date: Thu, 24 Apr 2025 09:23:26 +0800
Message-ID: <20250424012335.6246-2-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424012335.6246-1-looong.bin@gmail.com>
References: <20250424012335.6246-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_182508_055768_AB411A92 
X-CRM114-Status: UNSURE (   8.72  )
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

Add compatible string for PWM controller on SG2044.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
---
 Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
index bbb6326d47d7..e0e91aa237ec 100644
--- a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
@@ -17,7 +17,9 @@ allOf:

 properties:
   compatible:
-    const: sophgo,sg2042-pwm
+    enum:
+      - sophgo,sg2042-pwm
+      - sophgo,sg2044-pwm

   reg:
     maxItems: 1
--
2.49.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
