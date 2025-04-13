Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4279AC3601E
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Apr 2025 22:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u3RFaKYhs92MvOxFynA0RwW+qxKvwhJgn/oVn5cpzBg=; b=Y3xukVbjQUwoY8
	1O6VCHd6lnEfAbpxCBDRK8JOvzsuVqeiRUfzfEURHqkPzAinMf2uLlPWVA7xTSpFa73lM3rBtwz2d
	70a6rrrNsGlA4rls6UTWhxvCZmxXZSoY37YnOvlaTmdkiq0O0G0tdf2UivZEiva/A052DoxFrfotW
	nFPowAK0RZafrJzIMsJXWUJaSG7JkiAtBS2bA8jy1qyauPYQpJsN92twqmuFJTEjSp9pxJhWXD2IJ
	6uACfSbS3U1aro3GE+XYl6EwWWB/rpjdLNaE+guRwp4vGWTVQPs6ZGlXcEh+AoaVfaIXnVRyk8nKX
	dYFdr789U/yXfOh6cMqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u45vk-00000000G5i-3igb;
	Sun, 13 Apr 2025 22:36:00 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u45vi-00000000G4G-157N
	for linux-riscv@lists.infradead.org;
	Sun, 13 Apr 2025 22:35:59 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6f0ad74483fso40754626d6.1
        for <linux-riscv@lists.infradead.org>; Sun, 13 Apr 2025 15:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583757; x=1745188557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43CgDCBjHo6ngYeTK6tuHPUS/Q9xbMOQmyIqAS15iLM=;
        b=EZIjx9Tdp+TkCiZrEdwPMvuzAQgO1k6ZsTzzpzWukLyKYiTISpIyZ8UE80/XI12aOW
         Xn35tMHMeDi+Mv/K+tQIestRyAwMWUr0c7wGzP75g/ptXtNIaJ7ZkVFJ9ZjoCac+15XU
         BoV7DJq0Jg/ctLISwWOxBsRebzi3l0zR1L/X/3NwWkwOTw01lQznvipUaMVX9Ypz2I1o
         gKuFHPMqJY96V5Nhk1JjZ+dB3BsgbuFoQYRGnFa/jG5kAGsLWDM3vbUV2rut+DzP9nLf
         YbI247dwut4GTNPgeJydennq1Y0kabE5SGOD8/5JwfJWdhzEzvMTKXG5TAeBQ3LG+CzT
         9X2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583757; x=1745188557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43CgDCBjHo6ngYeTK6tuHPUS/Q9xbMOQmyIqAS15iLM=;
        b=Xg5ztch5zqah32/b1lNJWJ2AqKpA1KXQIS0Q7TDibB6FQb3QdU/z/816QOdj8MzBUm
         QFb15xOtD0eMWdbaJtcIGu5jtyu87GcPBZswqFgGfwFdIoWFRmTe1JfK6lg8GbquTljp
         qZMt3cDvBVQfvKsT4xuLYORE7D3BzmA70Qx6rP+cVFxt6r3mXnMwuxxvKwtfhwtbi5Oc
         YUOuGJGLfZp3dbscD8tQZYC3VORyLOyKYBEsbdYywaCZQNzXTrFFfPJ1YjmpxGYmXXCx
         +fiWwHCf3b/v0SJQXMsMzGQnc5E+GFrATXi8F+jDDj0TpOuNcEm3H5ZreEQPoaOks7Ov
         rSDg==
X-Forwarded-Encrypted: i=1; AJvYcCWKneQx9GCeTZIGzbaxK1x2OBaUgdpSRfTvAZQwFq6LXJH2n0yi1Gmp2bm8dlU1G7yog+/v8shFUP4QHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJlqA21G73GKIRfDlLQKHjCEk6HouhT1RBmHUdODsouhYE8LGH
	sAHf+1zD7OdDY6O87qt0AcbEnmhteXi1RgZsLQ9DCXBsEzQA1LK9
X-Gm-Gg: ASbGncsPCNfe2Yko6ei1KTAXAFrqruOEnsCK9s7OTupPA4DU3o76nkLDpr0l+gIntEm
	xbw1U1PZheosde/RM8lK21001/iWOcbICOV0BxGuvMS9C3E71+wUtT5hyffBY7EqdMEpWguXCQm
	rhQ2ZYHIfYsySrE8k1d2c70q1JSbV5Bjmhg9mxbGE/+WPnFK+nOfxNQIhuLyp+cGqvrbshQm1Vg
	rdnYSBl7A2zAVKgY027BuDS1pyhh7HcYg2TYejiqS5XiGJkYpF7OZ4rky11W1aciIU4oMDa0Op/
	Ztl+ek6RzWjsXk9E
X-Google-Smtp-Source: AGHT+IHgIwU8EKIYK2PDbSSxKKuKXD1TI7k5AoqJe5OL7pKcbt7fRbaJ6CDShheZnqef2sBXIGHehw==
X-Received: by 2002:a05:6214:1ccb:b0:6ed:15ce:e33e with SMTP id 6a1803df08f44-6f230dc388bmr178446836d6.27.1744583756982;
        Sun, 13 Apr 2025 15:35:56 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0dea07f3esm70937336d6.76.2025.04.13.15.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:35:56 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 02/10] dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
Date: Mon, 14 Apr 2025 06:34:56 +0800
Message-ID: <20250413223507.46480-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413223507.46480-1-inochiama@gmail.com>
References: <20250413223507.46480-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_153558_299878_EF76602C 
X-CRM114-Status: UNSURE (   8.50  )
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

Like SG2042, SG2044 implements an enhanced ACLINT, so add necessary
compatible string for SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
index 2e92bcdeb423..4ed30efe4052 100644
--- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
+++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - sophgo,sg2042-aclint-mtimer
+          - sophgo,sg2044-aclint-mtimer
       - const: thead,c900-aclint-mtimer
 
   reg:
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
