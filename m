Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4381EE6427
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 07:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=40yUJL98/XQ3fPKMm4SG1fghm5micxxoAkP2m01Wur8=; b=Cc13f0XrQu7Lm/
	wmmBNjN9QYnaSg7WKdpJCznTXZwZxjjFBo5WxRIndjI1r448jLvRTveNuJxD1kARw6Zt1uWpHoUG0
	m0ZUcRw0XUfiCl/aRh7kHRzdP7ToLEzHn6ejJu2YKt8A+l0+uUKLbWW7M89AUET2E1VS2gaALl9at
	2epvxsWvU1FDUm73GxA9Pu1w1/vLsUWVMMXmyJdZyDBD2qMNo2FKPYG6aK8k2A80+3RFecUWWvuNU
	dja4nYqhLLrXR65Y9mvW2lqLoPjVoh35S9JWdtohzpLcsTscJWwtwsROL5SrlHHNRqGzEcUGCD/uS
	5L66e+pZbwVWsViVV3xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh2yj-009zkY-1t;
	Fri, 15 Sep 2023 07:11:01 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh2yh-009zk3-0Y
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 07:11:00 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1c397ed8681so15330795ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 00:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694761857; x=1695366657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qQmq9ukAgL6NI2NMuw97RcY8w9KjAc8eVRWmfFz2hDw=;
        b=MyMLOyBUI/ZOxJ0AstKNt3S7z/HTljr0M4awmjPbnvn9nZKz9cJDKwVTXeK8JGaZIM
         rVCIAuwbl9sp3U2qVCLkY8wE4nXnJyipPh+FSuUx8+6+5KV9e0e8VXOJZLxNC4XxwH5D
         NkM0eRZyJGXgdVyhjQ0mu8I1E6ReRVQxOrQfGHlg29ov6jSS6RnD1Mo4hKuGLM5CcRcg
         SYaL9X5/ZWsaDbas6YWcXFS/e3tIMR7ow0SeMzsW8Q0wDtMlK1fUcaNadxmfUx+6kfWr
         TfqV6oGF6JZxsVjwxSEVKMaLYfC9NTtIjGTB4onIcl+WVKKwBCYZww70BQ1jK8bd+zrs
         JLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694761857; x=1695366657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQmq9ukAgL6NI2NMuw97RcY8w9KjAc8eVRWmfFz2hDw=;
        b=ILtjbp37DUWi4P5pClgBZdKx+CrBOgSJ6peGC65fNGtB01Cf+CyRMqu0KJARO7BXn6
         iSEqSVrewL6CjEqaobIfQBiQyGlKh6BM0hTkB4Rsa5/oZUs2IkYMMFKGSm5HglXpfyl3
         hAx9x6NqRlvdlzAitCryANdP/L7TZQAVHoo9rDP55422exaDCuPVh72Rv62AZrhWzlQI
         Ng1Rb7DW/cckf3aHl59LFXfLjPT+fSuYMPg+cfa5TIMJ/nIEOINXOGdlLGdZA3qfdSYn
         YzslVsbT+REtSMc+iaDvXnuiYLo8y4c2H66yOjhp95Sa+hZRH7HJhk2gjUrIZwa+9vP0
         c6Sw==
X-Gm-Message-State: AOJu0Yzt9cMJuoRaa7RtqD/QNeayxOMbK3JG90ENhT0XzJHbKdwfZVhL
	a6F+NOo8FymdJsl516OfiwaLcTooheCBIdWV
X-Google-Smtp-Source: AGHT+IF3DJKc1rTypHdvtMUd/6ki1y/rSqs2TXtFWiq1JzuCqZ1o5VF+3dtVHRWFnjxmHBgSmPXI5Q==
X-Received: by 2002:a17:902:c941:b0:1c3:ea2a:9058 with SMTP id i1-20020a170902c94100b001c3ea2a9058mr786561pla.65.1694761857415;
        Fri, 15 Sep 2023 00:10:57 -0700 (PDT)
Received: from localhost.localdomain ([222.95.63.58])
        by smtp.gmail.com with ESMTPSA id a15-20020a170902eccf00b001c0c79b386esm2749955plh.95.2023.09.15.00.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 00:10:57 -0700 (PDT)
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
Subject: [PATCH 01/12] riscv: Add SOPHGO SOC family Kconfig support
Date: Fri, 15 Sep 2023 15:10:05 +0800
Message-Id: <20230915071005.117575-1-wangchen20@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_001059_212574_48622434 
X-CRM114-Status: UNSURE (   8.48  )
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

From: "xiaoguang.xing" <xiaoguang.xing@sophgo.com>

The first SoC in the SOPHGO series is SG2042, which contains 64 RISC-V
cores.

Signed-off-by: xiaoguang.xing <xiaoguang.xing@sophgo.com>
Signed-off-by: Wang Chen <wangchen20@iscas.ac.cn>
---
 arch/riscv/Kconfig.socs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 6833d01e2e70..fc7b5e6c7def 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -110,4 +110,14 @@ config SOC_CANAAN_K210_DTB_SOURCE
 
 endif # ARCH_CANAAN
 
+config ARCH_SOPHGO
+	bool "Sophgo SoCs"
+	select SIFIVE_PLIC
+	help
+	  This enables support for Sophgo SoC platform hardware.
+	  SOPHGO is committed to become a provider of universal
+	  computing power, focusing on the development and
+	  promotion of computing power products such as AI and
+	  RISC-V CPU.
+
 endmenu # "SoC selection"
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
