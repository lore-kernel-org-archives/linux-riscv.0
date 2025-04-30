Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69437C3ABA5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 01:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eh/FFt6ZbL3CcVvvXrMIYqnJYE9hHLLdFQGZcn/B/Sg=; b=jEXNxkTvUVmoO5
	fx/SVvBKejbPahKE9Kt6HBXUDwZHNhpQIycjwU9Wfu3itBw+jiQ+NQyJTKjsrtTNb0XAjuOY7/Gze
	dEB+99zNXQxZgHVuHk90/WtQghN0cFuzAx+yZ416ZUu36fmAsyeGqrQWTFCgTGL7tMqZuFKXhnnGQ
	/z44N7VRgfpYRArzsYFvjpIouMJtXKYPrwd4FNrDxYhfz0Ma5Aoui9CHuxuf6jDem6/4cEBQTMVUW
	WrLAJ5TlsEEyiRvX+pQ9JcODy0mEecpL65o6CMCXtJLkApFhv96oYltcsJqbvHB1CTIyqt4RR5P+y
	dy6UC5y/P5wAZV8KYT1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9wEP-0000000BRJY-2PM4;
	Wed, 30 Apr 2025 01:27:25 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9wEN-0000000BRIP-0yAA
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 01:27:24 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6e8f43c1fa0so92632776d6.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 18:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745976442; x=1746581242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFdInxkQRRqXxIK9R5g9volnP7PDwmASdVMI6EHAgag=;
        b=mCaphX5EalKoVZAuvA1fn0zSe2G/XyTXsvQrWcZHgwrHLt5C82X+GFzkxPO+oq3/z4
         hm+BXdxT8d0BmdTDzquUzE4O4AqKYwfA2M159ADjZs19B6W37iCTwN939sA/zPTb5gk3
         H7H5uJ67ZOXHJ1BfqO1lO0JoHKHx4tatbyLUC/WbPYT3ZMl/IiGstih3JbYQ040WQWXR
         AN/5dHbq6yoc0iefg2PBYCcGLAndcUXc3z7L/pnM22YbcEyIvNZ4ah/LX1xHPmHa+245
         azp8KtqM0AU6lRJY/kJcA6BWpf4s2Mnu9sSFJKz+IDeZD5ZHQ1yGm7BtWVPYvt8ZPBMK
         Y04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745976442; x=1746581242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JFdInxkQRRqXxIK9R5g9volnP7PDwmASdVMI6EHAgag=;
        b=n2zfHwKhnaRoPtXSDWEDk4XyGmc7p7qnIR27JpBzDWl7/fOAgkW/+xQs8N/IRG853p
         TxpR63s1n3MBIv86O0RbMqlH4xHZe3EjaxeqfjtKZkqFtVDPQeWVGN7jvI5vvWdXPTxc
         8F3ik3N6T3Tt3gXKSmZNRk0N4OvMGW2PfM/ZMfWwPEELGB/BvbiqwqyGvodPIf1LMjRv
         atociRiBjFA7W6196D1eoPegB/zj5MSmhfVAMylx31rmT6vaIr0vog7XrB5/g2CB0Pz2
         /0zauCwAWvarV8l9v846Tf0pV34qW648C6i5JdkBqSR0MUF8EdZMAAKq1FCwAdfR1FwI
         g7AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlFLJzaLrKjIwEjFYm3ydmwTkl8wOWXZpqaWiSpRtg0Ol9kL6azhktDrDRJ/mvT04lD2nIYqDYpUxG+w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUatID2sY5IcMYfhaV/SxO1daBsCDwW/kqLLvbIyZtrXqufSZW
	oyJv5hUELCAsmmhfPudCFH8nfJrD1bSV8IcPflhZx0tAD4AtC2ZI
X-Gm-Gg: ASbGncuuH0TK34y7BbmF1C3YkuZLO7GqISvAHunCHJmJ4jiwy040D5mFCDj03XHfTgK
	PgeSpd1FhMquvqrkqVjZYhAbfw8SW0pDrCMIv44VxyeRcbOtZVKemddGMRasqZHX9tVan9OeZ26
	ElhbaYH2Sj5pw6JBqFAX+Moi5zGzLHXrD9YaNnjcGrouiu+xSYw76FMFDB8/ogjmUy/zRAmittC
	Swef10YrLlQWeOa33eLDtGnnmpb1dl0dJPi0AZb64GbxY5EvBzKbpUJ59Ktpu4P/Mho2l/LfgvN
	qq9b0CkIZKPlraZw
X-Google-Smtp-Source: AGHT+IErHP+u9m+10UhFsdEDYpZ7RXhR8Mft3aysrMdYT3o5qiteXPfTKpshT1+zn+nRc725/C/wkw==
X-Received: by 2002:a05:6214:492:b0:6ed:19d1:212f with SMTP id 6a1803df08f44-6f4fe03b414mr18225756d6.5.1745976441775;
        Tue, 29 Apr 2025 18:27:21 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c958cbfb1bsm797310785a.44.2025.04.29.18.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 18:27:21 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 3/4] riscv: dts: sophgo: rename header file cv18xx.dtsi to cv180x.dtsi
Date: Wed, 30 Apr 2025 09:26:52 +0800
Message-ID: <20250430012654.235830-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430012654.235830-1-inochiama@gmail.com>
References: <20250430012654.235830-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_182723_268921_508106E0 
X-CRM114-Status: GOOD (  11.86  )
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

As the cv18xx.dtsi serves as a common peripheral header for all
riscv cv180x/cv181x/sg200x SoCs, it not cover the entire cv18xx
series as there is cv182x and cv183x. So rename the header file
to make it precise.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi                 | 2 +-
 arch/riscv/boot/dts/sophgo/{cv18xx.dtsi => cv180x.dtsi} | 0
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi                 | 2 +-
 arch/riscv/boot/dts/sophgo/sg2002.dtsi                  | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename arch/riscv/boot/dts/sophgo/{cv18xx.dtsi => cv180x.dtsi} (100%)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index 91bf4563e1f9..d0a627c086fb 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -5,7 +5,7 @@
 
 #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
 #include "cv180x-cpus.dtsi"
-#include "cv18xx.dtsi"
+#include "cv180x.dtsi"
 
 / {
 	compatible = "sophgo,cv1800b";
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
similarity index 100%
rename from arch/riscv/boot/dts/sophgo/cv18xx.dtsi
rename to arch/riscv/boot/dts/sophgo/cv180x.dtsi
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
index cc094b3f585f..d9580a2e1e7f 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
@@ -6,7 +6,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
 #include "cv180x-cpus.dtsi"
-#include "cv18xx.dtsi"
+#include "cv180x.dtsi"
 #include "cv181x.dtsi"
 
 / {
diff --git a/arch/riscv/boot/dts/sophgo/sg2002.dtsi b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
index 6f02de9b0982..60709df12a22 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
@@ -6,7 +6,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/pinctrl-sg2002.h>
 #include "cv180x-cpus.dtsi"
-#include "cv18xx.dtsi"
+#include "cv180x.dtsi"
 #include "cv181x.dtsi"
 
 / {
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
