Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B88FCA0EE9
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 06:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qPaxIAVSVOeu9TpLbxSNXu4c2F/bzilgUAPlvygqjEs=; b=wqqNsRTMxCyJ/P
	RwB0s1c9dNL6+kdKWGi1pLZ2QoPspUM6QV3a+6n5rOe/IFT63ahXi+3ePCXmBVkJzMsqcvIDr+vFZ
	e6wKY0sJcsbSOB0l7Nr5Y1LKzUqEcJPy50g0WbNXx6g9/t2+i8KbzBrk7zoX9wZfSdxRqemKAZwcD
	M8nMNKD1LIy0MqjZ0Ot2glzrFGMw4SS02AT/qKCPH0mdv7CCpw22LuqNMLJ3jFFU4VSaRkRReFUu0
	HKzYalAT725PRh7WhrFin7tYviGpjb4txtchbBs/f+VpFTO5JIUHogSMa5BeEjIztrWGu+YKKEBB6
	vc/oQ0nAKawpp+OEfpFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unt83-00000006c9w-3cge;
	Mon, 18 Aug 2025 06:13:59 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unt81-00000006c9e-3ZaR
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 06:13:59 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b471754bf05so3345379a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 23:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755497637; x=1756102437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=54zgbX/WMcHZzAbOVIMrJlmBqSRmerCMVkdFx96aiII=;
        b=aYhEatqZETWTIzI3EKd6NrufrkapHM+RXoek/4W0DVlYRm836yqyoLroVGHsHMKjXg
         BRAiI9ZdYgMRFAfqNxrHhDSa/ArSA+/tu+BO7P1G6DLs4ZihINVeRhEzeH8Wf51Ft4MC
         vKDVMYyfRuo/3GhRUiut6XMR9iUYI/GT/JNjfrxXiOVbMJLc+G1Zorocb85tuseY7hDA
         RyaOFBjromFdKxtdKH16Xlh4mVfeURUXR2NHI/u4QLzKA7iLU7mk528mDOSMUt69itef
         o8/qfezdt/5dGIII7sd9ZOV/yMpvMyIGdSp2OGL9ger+CXCgVyUvBfuyLVSZjFZJiUUk
         JhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755497637; x=1756102437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54zgbX/WMcHZzAbOVIMrJlmBqSRmerCMVkdFx96aiII=;
        b=eas+S7kWXIOr8MKagv+gjcU1NMZA5IxFkUWNzoFKfO83+TN+zGeEqqUNZTGZ3KoCCJ
         eMtjWPx91bA/rUDXya+UqSSOf43YCo3vTZ8HdLov6oYioClYni2Bq1k7IxC0CKDyccwX
         xaOYmHH2M+gjfZ7l0f2u72oIcuOtqoyZBMpzLImh4e+thaNGOUuW8k4A6Gfo9FmeOMba
         GJIpfIqd7xAkOJhl5peuD3gZfX1GtecrxLBdWQncleZsSPaR1fS2EB0nLlwadZrXizUl
         +r1AFkpqhm9JBoxzauMFE3539xDg59Z65nBWAVDab4u0Aws4lUznAQfjazGAXMqngIXd
         80cg==
X-Gm-Message-State: AOJu0YxBIWRxrOH1q9fg8Vzg7LXRXGlTm93USzuiJHKpd8YRBxTCjgp0
	2Pr84fbqhQNuWNmW456FnUd+RMwsaFyxQOE1bikSr/LocunPFxW7JaQqcg8iUkXo/4XGaxXVjqh
	m+NfyIEJjQDbhqrypzn9qjWZIPI57Nlb40XYcWvAPM4Hut5Vdyg5SdpXFj9IXS9+HHOjJnm362X
	BqpPdixZv01cERc7c2qgvl4+tlJU1d7QuuARl75sixmx4l54Z9hQgO
X-Gm-Gg: ASbGncsK+Ed5Hm97ezdwou0MHUcXhVmcLEgZOjkGCPjnIBQgeKUMljN+Rmjcl285uly
	vh/ugGEsG7+NZss0TmAP+CzwIT+dVh8qPYno4oZq/7j2SqBduX7WBGag44yz4Lp8w05cVzY5paI
	bilhpNpIttbJVvAtgbiHic9A6gwxNdGLFFnecpm6Gx9Jz2iGo/W+BsxK7vAWbUV8zeN97ugdE69
	+zyjyiv0PfgmmQMT3cb9xZ6puMJkECmSw1LWFs1JGy6SGAmpO1gn2Brt5kxpJfTELp20HFiqjTX
	ngV351Xfp+IPfMrdkibaZDjl0Bd3X88CVPtKn66CwOw3AIU/BvjuG5UpGAbq79UZZkGfQCxjdfm
	hlFRIuimaoap5IEaqga86ep0DUUsM2yuS6BTb/1sSBV8fLA==
X-Google-Smtp-Source: AGHT+IEiGxZNwinxMU12VXgR7X7sSauGmv0Knv7Np+BR+2ifgnv25wb6pNaTViqzn6C0MD6NHKzNow==
X-Received: by 2002:a17:903:186:b0:240:3ed3:13e7 with SMTP id d9443c01a7336-2446d9699aamr135509425ad.42.1755497636426;
        Sun, 17 Aug 2025 23:13:56 -0700 (PDT)
Received: from hsinchu01.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446ca9ef6dsm69751075ad.10.2025.08.17.23.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 23:13:56 -0700 (PDT)
From: Jimmy Ho <jimmy.ho@sifive.com>
To: linux-riscv@lists.infradead.org
Cc: Jimmy Ho <jimmy.ho@sifive.com>
Subject: [PATCH] sifive: fix using wrong load type
Date: Mon, 18 Aug 2025 14:13:36 +0800
Message-ID: <20250818061336.30173-1-jimmy.ho@sifive.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_231357_906014_18EF716D 
X-CRM114-Status: UNSURE (   9.06  )
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

thread_info.cpu field is 32 bits wide,
but is accessed using an XLEN-bit load, which might be 64bit load, fix it

Signed-off-by: Jimmy Ho <jimmy.ho@sifive.com>
---
 arch/riscv/kernel/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 3a0ec6fd5956..ed493cd3dc35 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -46,7 +46,7 @@
 	 * a0 = &new_vmalloc[BIT_WORD(cpu)]
 	 * a1 = BIT_MASK(cpu)
 	 */
-	REG_L 	a2, TASK_TI_CPU(tp)
+	lw a2, TASK_TI_CPU(tp)
 	/*
 	 * Compute the new_vmalloc element position:
 	 * (cpu / 64) * 8 = (cpu >> 6) << 3
-- 
2.39.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
