Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F353ECD5BB6
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 12:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MFdmpsYfDWCVRCUMXZoiyVJO4skKFZqquqT0lXRQee8=; b=whBLk8jLAT/wyy
	iqLHTc2rX2cOGOLc0ziVOqa6vaMJjol74b9oUO0LIufG94eZB/04mXNKrEG6TBXRKy6mI+g12BxPS
	zTfkkHpKTr8Xq0rXZkf0wZx3WthZ+H37gAemwESaIiLOD2W8pPoqsU1pP/vx1SUl3rNvB3Brc+QTl
	oB0zsiK1Ab9ZDPOOFLCgDA7z4M0cyUoF0EY03Q3aHaostvV6NJzP0sPnMT6aZjBnRDc4n62emzJcv
	UVIeziRj5nxFn65yDnzN7+W5i+GrC1+uzeNI5EVIK99FD4Qzq9jQynYNOG6cZMveEWQuZkh4+9v9p
	E5GeGvFYAgH5nnpcz3ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smBJt-00000008FEe-21Et;
	Thu, 05 Sep 2024 12:10:37 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smBJq-00000008FCt-1pWz
	for linux-riscv@lists.infradead.org;
	Thu, 05 Sep 2024 12:10:35 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5dfb53d4b13so395924eaf.2
        for <linux-riscv@lists.infradead.org>; Thu, 05 Sep 2024 05:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725538233; x=1726143033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9RwhX/0NxaxgXVwmXW6hND45TWsNukqVDswt5JLO8uU=;
        b=C53ZcQqy2+t6Bumjo/TCn3zClxsUtDzPOHrEC0WZoXX2Id7yPAAisGhalcwB/wuoZh
         BAxglPC/eJWZmT0O3DLypeFfzZy4wt5wm7nwgy2+PvOSEmJkJrwJKVrTJbFw/rHr1ndy
         iZHqJoiO3PHHDWYjoSqjg2m5KZATm/g2q+p05tcA3tC54f9H+/RyKtLdiDdNgmeliMIG
         Qh8hiPghJ+uhIBAmGB65+Dc0/lEsTIe+fGUX2j00miqy6F9kbA44Yh1W1Lfhl4kqcwic
         OFMLQbz2TMC6kScvN7CierOaaH4Dh7+vQIWiw4C22HB9nAU4clf2H/nV7stysrs9hR2J
         Xqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725538233; x=1726143033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RwhX/0NxaxgXVwmXW6hND45TWsNukqVDswt5JLO8uU=;
        b=Zi6q4VU6Y655KQgneI0BBmAczXr+MGKlSe+8ewBiXDc2bKWZSp8KjayE/8KrF9AJlz
         EKra8in3pv3jzmMEZhRRP3NX1iEesnTVp/13n0+D84FK4wmy5mUl3UwTuVQxt8B8Ne2v
         LR5qWq+8nBGQze5JOd5tiwsFxnJwvM2Lqs/PObYN1HiDJVjZRw/Gten5bMwWl6wIQrqe
         WCFyrojjIm4fOD9wiW+5oIUP+EWJFzn4qlueRgAIKVAtAjpWiY2VGgZHmyQzcGLD+Bt1
         zO7pJZooDyFRGTr1ZZT7Xn/vurZtV4A8XXcw0KNqudaYNGaTIm9fqgKWT1ife6ShgIQJ
         3tSg==
X-Forwarded-Encrypted: i=1; AJvYcCXuKpVWXs5257/f0Zt41Msl/uCOaXj8EXBXGQDNi8iwjsa75oKUoYeaWVYgREt4pTfzHQAw4QWqcbJpgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOo1cdxqCBUVdEKrBXnR9Q5ErsX2kI6YKID7kMXpxG4t/1mj2t
	I5YdPvJwqge21lVkTXZnQMBIo78m2r8lJ3456P5JQF34zo7hgcgm
X-Google-Smtp-Source: AGHT+IGxtEkwnH6QBvHzbe/QGSRFYjVvranECxxZCASniIhEomIoOolLxioXFT8Y1BEE0sPlOwdT1A==
X-Received: by 2002:a05:6871:8c15:b0:277:d7f1:db53 with SMTP id 586e51a60fabf-277d7f1ded8mr12689185fac.17.1725538232564;
        Thu, 05 Sep 2024 05:10:32 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-277abb62c95sm3977069fac.23.2024.09.05.05.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 05:10:32 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com
Subject: [PATCH 1/2] dt-bindings: pwm: sophgo: add bindings for sg2042
Date: Thu,  5 Sep 2024 20:10:25 +0800
Message-Id: <6e5fb37472b916cb9d9abfbe3bea702d8d0d9737.1725536870.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725536870.git.unicorn_wang@outlook.com>
References: <cover.1725536870.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_051034_569155_14BFA244 
X-CRM114-Status: GOOD (  12.25  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add binding document for sophgo,sg2042-pwm.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../bindings/pwm/sophgo,sg2042-pwm.yaml       | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
new file mode 100644
index 000000000000..10212694dd41
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/sophgo,sg2042-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 PWM controller
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+description: |
+  This controller contains 4 channels which can generate PWM waveforms.
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    const: sophgo,sg2042-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: apb
+
+  "#pwm-cells":
+    # See pwm.yaml in this directory for a description of the cells format.
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    pwm@7f006000 {
+        compatible = "sophgo,sg2042-pwm";
+        reg = <0x7f006000 0x1000>;
+        #pwm-cells = <2>;
+        clocks = <&clock 67>;
+        clock-names = "apb";
+    };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
