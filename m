Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EE4C02198
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 01:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=maMFYiy7WruyEw4bbEqlfBvovCFehCwyFMFYUjSTqCk=; b=A5ujlMlv3VwOc0
	qhf3KBFPJ6ZZIDtGixuuiKV+Oly6ACclacZvsLGWYUmJbnyKrcNT6aoztrZ7K5I4v4g7wcyTACPvi
	redQsg4dy94voBjPStrDyXnlZLDRmN46ERG7HMNAZIvp7oaeOV8DCz6KEGAJvssH2UPVnFfvgrD3F
	zIzLY+w9Az7SEo7ZJqMm9J86OnpAUP5eoUp1cghaFm0cWZbErOPblxzJpZgNJHX68MZa0M+YkSjCu
	oKUHmBtwa6Z4fQ0NzaHkWPabZhcIrKu1OQHlrD2egAUL7JecU16ddB+WW6YmglvAYRw4d0vuxah+x
	7lnTARfmjPbYkVZWGfvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjq4d-00000002yrc-2mxv;
	Mon, 17 Feb 2025 01:37:27 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjq4c-00000002yrI-0QmU
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 01:37:27 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-220d39a5627so55363095ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 16 Feb 2025 17:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739756245; x=1740361045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uV4L5jUISNpRr6ROGYxEb4g1bNSE7HH22+hTjn/R0r8=;
        b=dW2UAspTeCze3QY8zPUgcjqqRoZx7IjDDJltHOkeuXYylcI9zQqHLUGsPgVcQ0GB8V
         1xf913LK0YeAOVgEVRTBnnQe09bc+O6tRP9MdCEXdObBUgWAmxm89NmE6qagPOtnqQ79
         4icymCetbpMMuQgbcYZijABv5R0I2K2cHr30XRV1ZomV5LXNsx38xPxuu7X7/qd+pyCT
         YA0fmtpnFm1GTdGE+BtyrRB+HBR3uLQOmS008YFVcT4ThhiOr5ZyzXctD2GYvrPz/rht
         y7nqvDhDkkD42SymFCoqMvjLfBYK4Fe80+tBR8kWky/WRNjLd6QP7mLko0UZVGQhpPXs
         9NlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739756245; x=1740361045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uV4L5jUISNpRr6ROGYxEb4g1bNSE7HH22+hTjn/R0r8=;
        b=gWKcjOaW9NvYnWei5gq2Ehgujrh17im84cD49wenLyj/zIuRYV4XRID7j5/2sEqcpj
         Ls7ohnqZ0+Tj7u7qSDYMUYnNNVJ/koYKjyTcoomH+p/1V30T30e6hMb5HRZ54xxbAjHv
         PI8edvNpYaF7Y1YrjRGze9HL0OOjM/Dep0yK42XLMcG9zzU30YF8tS6mf/3rREmj2iqw
         yhg7W8GCwczJfDKgDJmSYlpjxLhey6DTsHvcr1kQCw46uETE0yqsYtQ3bpZDUV+PlTnk
         ryfAXpx0kOyvPoGut0VYVmRQ1JN8IEIAyKRRWMlDYptVjGXrpF0joXzIgA2RXLaZdZ1i
         d0Dw==
X-Forwarded-Encrypted: i=1; AJvYcCU67loXnrCkz/cKhoIN72LG7W7hQBZr5ccnyP4NgZ/ed1xQG511rN+aPbPsvCar8w1GMN+nSJXQHbN6Tg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr10+RVloyvEP1j6L9eFFPlTkL5LBxaL2blF1J4046BrZsyQL6
	cpUX4KEnfU/zVySvoFpGU/IcLaEYT+ts3b7Lrdfh6nG5Yk/+tpn4
X-Gm-Gg: ASbGncvYKjSvJ5h4iaTqx6aOuLHCsqwEq03Xltqt0x3a0k0FC990m/Fi9+GRbgwjtYC
	Vb9uctY/r/Z3hO0IGqAF61b1FRfB62d2NeiTy1pRkAmVkP/tJmidJBsvCP+ahV8LRBVsqixlCy7
	vT96sK5PP8F9LpsSt7N1KvfB40NTQ8X0SHqlsH7Cp37eTmG9sMgLlWqSYB8tGJ1yZ87uy7IMpSC
	NRfF5BLQRGieeCG8iOr/Jvk2U8PdmMHsbZf5RXApiFztHSbVUrdLj96MotAhJ1k61xJBWDEiakQ
	suMFcHJozl4JuEj+9tLpwhO3ffDaJ44gM2ErdawW6HZSeg==
X-Google-Smtp-Source: AGHT+IEc3R7zwoSDQnuMy8iXmbawDrNUKkHjCWCg51IKpm6c13c/5MWkj3/6lYaWg28BLnY8gooisQ==
X-Received: by 2002:a17:903:2286:b0:220:fce7:d3a6 with SMTP id d9443c01a7336-2211c551bdcmr71159795ad.23.1739756244671;
        Sun, 16 Feb 2025 17:37:24 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220f8682181sm38167335ad.209.2025.02.16.17.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 17:37:24 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [RFC PATCH] riscv: Optimize gcd() performance by selecting CPU_NO_EFFICIENT_FFS
Date: Mon, 17 Feb 2025 09:37:08 +0800
Message-Id: <20250217013708.1932496-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_173726_159975_FEF91100 
X-CRM114-Status: UNSURE (   9.36  )
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

When the Zbb extension is not supported, ffs() falls back to a software
implementation instead of leveraging the hardware ctz instruction for
fast computation. In such cases, selecting CPU_NO_EFFICIENT_FFS
optimizes the efficiency of gcd().

The implementation of gcd() depends on the CPU_NO_EFFICIENT_FFS option.
With hardware support for ffs, the binary GCD algorithm is used.
Without it, the odd-even GCD algorithm is employed for better
performance.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Although selecting NO_EFFICIENT_FFS seems reasonable without ctz
instructions, this patch hasn't been tested on real hardware. We'd
greatly appreciate it if someone could help test and provide
performance numbers!

 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..2dd3699ad09b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -91,6 +91,7 @@ config RISCV
 	select CLINT_TIMER if RISCV_M_MODE
 	select CLONE_BACKWARDS
 	select COMMON_CLK
+	select CPU_NO_EFFICIENT_FFS if !RISCV_ISA_ZBB
 	select CPU_PM if CPU_IDLE || HIBERNATION || SUSPEND
 	select EDAC_SUPPORT
 	select FRAME_POINTER if PERF_EVENTS || (FUNCTION_TRACER && !DYNAMIC_FTRACE)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
