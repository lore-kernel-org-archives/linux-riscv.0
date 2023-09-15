Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5495EE6425
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 07:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kY3aQTC9zrH+osCAY10JtPBA9uYrBZyswdHZOLZpivg=; b=DnEznK3D4iRuph
	L3LbDEw5+cuFfUYTgJWYWAR0muamsqRAZpumLNUs6V6S42vhtBSAFaVo+kugWsTC61A0amMt0N890
	vl28bfskBsefwaf/8GcDr5B77uC8MF2Zlss1OuzgIPP7fC+OVnfIwkOAUpZV7REnQ6UQ7XkraO2zA
	0R9L7VEpaLhbKEhZGFljQoT1ZbfU31xVfOJeaNWwR9Bq9dEe7qmdRn/MBRYQKx1jHyzfAkCMAm3eX
	lVeoF3Ii9+1p2iJeyi599J8c52k3KWHgZUcibqBEnmu20y8KALSi3Id0dNbD5vgNRsOK0IZfYDYkj
	R9F7GtgveQ0smGyQm9JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3B9-00A1Bd-1V;
	Fri, 15 Sep 2023 07:23:51 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3B5-00A1AS-2x
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 07:23:49 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-68fe39555a0so1641227b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 00:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694762624; x=1695367424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i5DdN2I9qJnXX8fUomCodux5qyyadXgZyIqOEcUZz9g=;
        b=BETKAcxQHLao5ofXSdZh+urDLV4c58PLBrp5XB44GCLkEStfkc0uLMEQY5dVQDsy6w
         qPAlY84E8rQfrdfMPRkMtnzTck4ESc7mwCIoWJY0cSNeDVjuKTTGaa74L3O8mBLG3sTI
         w4f+8Y5eyCiLv1Hr0CpooR0jr9r71k/YqzIORGkY9HQxgEd8KvF8F3I402NzMtfefKD/
         X1lHkQg3YZOHuGs3rutQE8+ilMc+OeVz/itkybanGqzDxJY1WLUjIbeLA/3KsQ3VKwuU
         YI8zU8/NnbN7yiYYVc+cqpHx0ReMsjjwOdZex/uuDcMg57NnqTEnJI/3D63IK37jq7Tz
         5sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694762624; x=1695367424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5DdN2I9qJnXX8fUomCodux5qyyadXgZyIqOEcUZz9g=;
        b=gQ8XIF47q/wV0ws1bwcllZt2KOzcyB1j49fq3D6FrOiesjS2yvbR5LqV3kK1HyKhio
         KhycJM3JwK/3DLF6SfFLsS7aL/9puA2SdM5wlQC71ExpDQC19siOQQGlmAlPMLjgCuGJ
         2PVOmXiVdzTviPbbOpY5AM648OnsQzucorhCmqhQYJ12e8U0i5wscPDj0hPfCGOWqWy6
         yvZPYzu+YGtgyqtAPiMZcksjLwzD270/n84yBDFUzpbbfyRXLi7MvGqhoijldoLi+24I
         kGXhEjn/fzrRTT7XjVhGFeDDOIGZHAHA1sAE2F8l9HDVOQ4SQCia6q4FR7BYt6f8iDpb
         pMGg==
X-Gm-Message-State: AOJu0YwQhC32ag8XFnm6Nz5VHpx6PtZYtwkRq1nVgvg39ZAs8DM9npjj
	MjTLttJNmyptX9+V+Y/98qQbnr/bCvqteg==
X-Google-Smtp-Source: AGHT+IHU/Iq9TuJy2Xn7NgZhqVwjAOkxxb1R/8UU167fw9+wSqRSNrFOKa8keUomAiOjbu+XfSshGA==
X-Received: by 2002:a05:6a00:2d21:b0:68c:3f2:6000 with SMTP id fa33-20020a056a002d2100b0068c03f26000mr1149644pfb.6.1694762623573;
        Fri, 15 Sep 2023 00:23:43 -0700 (PDT)
Received: from localhost.localdomain ([222.95.63.58])
        by smtp.gmail.com with ESMTPSA id e23-20020a62ee17000000b006889081281bsm2338738pfi.138.2023.09.15.00.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 00:23:43 -0700 (PDT)
From: Wang Chen <unicornxw@gmail.com>
X-Google-Original-From: Wang Chen <wangchen20@iscas.ac.cn>
To: linux-riscv@lists.infradead.org,
	conor@kernel.org,
	aou@eecs.berkeley.edu,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jszhang@kernel.org,
	guoren@kernel.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	Wang Chen <wangchen20@iscas.ac.cn>
Subject: [PATCH 04/12] dt-bindings: riscv: Add T-HEAD C920 compatibles
Date: Fri, 15 Sep 2023 15:23:33 +0800
Message-Id: <20230915072333.117991-1-wangchen20@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_002347_959641_697EEE6A 
X-CRM114-Status: UNSURE (   8.14  )
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

The C920 is RISC-V CPU cores from T-HEAD Semiconductor.
Notably, the C920 core is used in the SOPHGO SG2042 SoC.

Signed-off-by: Wang Chen <wangchen20@iscas.ac.cn>
Signed-off-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 38c0b5213736..185a0191bad6 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -47,6 +47,7 @@ properties:
               - sifive,u74-mc
               - thead,c906
               - thead,c910
+              - thead,c920
           - const: riscv
       - items:
           - enum:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
