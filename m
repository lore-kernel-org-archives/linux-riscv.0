Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E0DCAC597
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 20:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ETD0mKhMHwBbd8bInYZPi0NQJinnhXGNocDpoLValGs=; b=PBVyzC5RFoRw7f
	0NFv9+nA7AK3JCly71yuW1ii12dUCt0Iioqwa9iPCgDBVDZCBjIk1PJePFSEiluVMgNMK1CaBLpmI
	81dY99sWEnx00hTg5oN8Wbmh/FEWLfGzHE7gZp6Vg2/tNGKaNiMn3i6spV/bVHEKikzmisqsm9iWz
	Voe+zGRAfQ8HrPvTtr86KO4fcbi+kFOzhrg3TkQzjIE4YeDxsPD39CuGpv85tbqj4DUbKdxp1+N6k
	3cxmLwW2S65JB/Gak3NmqozkEUHuJOHBS6JzYDXrxKvVM1OZTbOIbtwy+1gunPnl0YKf7yTU0AVMv
	AjmDy4CAz/VepZbTXxvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLVI-000000018HQ-3dPW;
	Thu, 18 Sep 2025 20:45:20 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLVG-000000018GZ-1SHJ
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 20:45:19 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-77ddfe29cccso575838b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Sep 2025 13:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758228317; x=1758833117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XovHlZK1pH9N9kTTwIVt2nXIuLc61uTIHy4WvXRZJw=;
        b=FPkrVlNugiuV1X0VJNoqZAPRhb9zzO6ZM9sP0CzgmYAY9NmSEO8dMcIhFuVp9fTtzw
         Lja81sOeIvPEDeXTsoIEPoPMTHHJp6v4bmBDGyxvV39YL+Hb5uy+cWxpoN8o3g8ANyMD
         tvzGvCWxWyMDJK+8aMwwMTxifVh4Qfi+Z4frgSXkHKrp+q21ue/9ZtNQ04xOnuB9ptYn
         PBHqwaZn/5c1F20AL/7KPQTagpOlQbJxm0+oc5xrt4xq+x0kmhaSw/S8JDsIXwVKuWrx
         4uF07KN7SJxzjovHg5C3rKRfMH9wKkD19N0IPbC0FgebYfaeuTLo9okHduT5YqgyPmtn
         oGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758228317; x=1758833117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1XovHlZK1pH9N9kTTwIVt2nXIuLc61uTIHy4WvXRZJw=;
        b=pn9MfH8ZbA2zPYfpRCH3tVbvsRP4s0KRWOsgSMv3veNOMf/60JcaruUcjOG74jm/Tt
         QJpJqB6BJZuWEnKFb9ozJ1U9keHdmiXZaL1OsS3VE7QD20X0ysoPdA1mYmpg0MbNpa3I
         Yx6j2QunpJ2TmeIMfW6ww0gZirh6c9NyYts9EDFVdQq9ZW/MnQDfkoYN8G7khcLQXFn3
         gIhhRvj5d9u4tcGXECgNIopOg7QwUUm7ewED2XybnHawPaTYVszL7zQb3BMY4PTalezb
         QwjV9h+HaHtiLGAuPMCSa9Z7ALCcXJ+KjVRhqnhOEwB89RuOidT01/FDZZwlYMU5z5Qj
         5Glg==
X-Gm-Message-State: AOJu0YwWRWTsDH5GSjJzQPUVdteOt+To+ogYy9Mga4O9s/CP/0FgpikV
	bfQBV4jrRrH3sqC2lfcrwNWjerJ/Eg8BYq4ny42CMaLANkbVcgkyPLJl
X-Gm-Gg: ASbGncsTYcIyZ73BoUyVa2UjT7hm36Hd0LQxSCZDEHKRL+TWa1YhNIc4w8zdM60X4Fa
	Cjvwn/e1ZlkvtdU7SmxkLthk8FWH/+lAKOfMdXyguABxAR8Ym9P1ydMu+rlUgawTjfNp4EZ6W/S
	SYJw30lkJ5E7NhhhFI5UtpZcANZy2BOpJObXExG67I0Sz0w3eJLd/KBKp08pCmPSVxX/q0+q1A8
	MWpdaH0Sjey03u9nV/HDwRcBi1sYbgjhz4oOJPlb8TRfG6zj2zpdHHSZgnn8Pylhu2QmMKUSK0c
	tBsJ72gHjNNdCWPN5KANV9bAjDLpvimrK/rfeZwMSLj1sMU9WhQ/oC5b/mk+9dKc9Mo+79FsUPA
	WC7I17JVtuRBIFbcZq3LOAKY+iZF6Dy0g73w4KyoAZqfPzXWGCKI=
X-Google-Smtp-Source: AGHT+IEj3b4BXwmrsRFa4LZOkX3gZIr52lRGH/WszcqWvRFISeo4WKiVHEB/Cjg8hGWzvaKJHkXTGA==
X-Received: by 2002:a05:6a21:6d95:b0:251:e4b4:7a37 with SMTP id adf61e73a8af0-2925ca2491emr1394921637.19.1758228317173;
        Thu, 18 Sep 2025 13:45:17 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff35aff2sm3178181a12.1.2025.09.18.13.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 13:45:16 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] riscv: dts: thead: add xtheadvector to the th1520 devicetree
Date: Fri, 19 Sep 2025 04:44:47 +0800
Message-ID: <1ff3fb07b24fb375fcf9d3067aa50583f47c35fe.1758228055.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1758228055.git.rabenda.cn@gmail.com>
References: <cover.1758228055.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_134518_392683_7FC76927 
X-CRM114-Status: GOOD (  11.26  )
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

The th1520 support xtheadvector [1] so it can be included in the
devicetree. Also include vlenb for the cpu. And set vlenb=16 [2].

This can be tested by passing the "mitigations=off" kernel parameter.

Link: https://lore.kernel.org/linux-riscv/20241113-xtheadvector-v11-4-236c22791ef9@rivosinc.com/ [1]
Link: https://lore.kernel.org/linux-riscv/aCO44SAoS2kIP61r@ghost/ [2]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 42724bf7e90e..59d1927764a6 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -25,7 +25,8 @@ c910_0: cpu@0 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <0>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -49,7 +50,8 @@ c910_1: cpu@1 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <1>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -73,7 +75,8 @@ c910_2: cpu@2 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <2>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -97,7 +100,8 @@ c910_3: cpu@3 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			thead,vlenb = <16>;
 			reg = <3>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
