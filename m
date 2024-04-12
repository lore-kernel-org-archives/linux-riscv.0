Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E132C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 04:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IfU3reQq3DSTelOgYd8YGU+h2tFShdUSP5CP7DHup68=; b=SI5e7H2HYZtRWn
	rM90bOGCLFTIWx09nB2STXYPa8W1dJxLdsynhQYDBXANk5CpS5lJ74+kw6XxNLZvs7GxZEsnlA4wD
	k91P76fZHrlfe8F/ND5pe3Y3LKErWuEJ0IcL2lg/tv+lwGYixFgcPP7ffE0EjVNS88VIPRsrYGZMQ
	0hy9j7m77rN6SG/DmF6pyYv1H65GzyU5cPaOEhoyxIadfk9GTcho4yAWCXEMpdve1RrQKOxvpyHCY
	7FeCjBO2kYSIIIsbiK+CG6KiF/Nk/69sMmuJ14GI3cgFIsFbxCS3CahGwjS3pOclXga7NCO9FRaBX
	I/V6kpqcXWxOcvG3vn4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv8Ik-0000000FCFY-3gMt;
	Fri, 12 Apr 2024 04:14:10 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv8GU-0000000FAIw-1ZWQ
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 04:11:54 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6ece8991654so529851b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 21:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712895109; x=1713499909; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZMPIuwt6cMnmpNq4lu1wiuX0ZLQRNI3Tbplv0ws9fgg=;
        b=WzN+RcGeQZLZq3hzWWX0MXDQDS9DFGbolkX6RBDKukKQmbudHfNqAzKvC8P/TgZm1b
         TWNJ81zuhXIePeWcewTV+ZB+71VqB0TQTLkbgadAIqQ2jjWBpERVmn/xg16FsxKNlwaq
         6WbONtEC+dY8ZTXL036p5Cr0mel92yNHfNOwtSkFYZuOG7Cj22LkUdpg/ED93gEZ96XQ
         zUKglOFumccTjxyQetsrKcm1AVfwDqVDM/iE9gnE0ClBSscZwsO8rOFCVaagvfG1WwkQ
         GXjsomug4yEu0AOVncb83/KIulguVVUAOeS5cGChYYZosbiFlyItr6pM0A+EkAEaDDe1
         cJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712895109; x=1713499909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMPIuwt6cMnmpNq4lu1wiuX0ZLQRNI3Tbplv0ws9fgg=;
        b=IsKwt+8AETFRb78dZ5eFQQgk8MHzG3LYieDLpTq4Gcoxb7w1MTD2SS8rDzBxPgFSnf
         t8iBJQvCSUElInWvWZSa4s0lX8y34btE6iphDo7VfWj+Ulz24adA5pC/IqaAJTEQdbnd
         Tp4D78B2BKVTZ3tLyFRLNUGmBO3TCcPCeTRdR7m/zQNJDNLHFKLgSQU7GVSqHxPdwjLB
         r8W0NAsoulMN3U9kaT7ZmZTxUwRGybecUg14oQityP24I7gHDkNJQWAuGl2RXep6nKwF
         M4viV8IllD28YtnIcyb6QNyNQjyx5qSptKW5TQetnshgITdGFj7KfwScJxtUdoYZmm4I
         46sA==
X-Gm-Message-State: AOJu0Yx/MMVU3TjmNJMC6jDWXRl+NZQjKvpy84bL9CBUt1JqwC1MLOJG
	0eG06VvnzwK5q7Q5Gjo3IYUahf1tfVmsjw6ddJzE1sas6R+tv+yW/PfIgoTGw1g=
X-Google-Smtp-Source: AGHT+IFCzy27N8mqtHUrUbUr0RUPxfjDtDbiINOHTo2v+uHwsCX7URxkFsS+GECfOE3fQY7tSLC35A==
X-Received: by 2002:a05:6a00:3d0f:b0:6ea:b073:c10c with SMTP id lo15-20020a056a003d0f00b006eab073c10cmr1638560pfb.6.1712895109632;
        Thu, 11 Apr 2024 21:11:49 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ka13-20020a056a00938d00b006e57247f4e5sm1949712pfb.8.2024.04.11.21.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:11:48 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 11 Apr 2024 21:11:15 -0700
Subject: [PATCH 09/19] riscv: uaccess: Add alternative for xtheadvector
 uaccess
MIME-Version: 1.0
Message-Id: <20240411-dev-charlie-support_thead_vector_6_9-v1-9-4af9815ec746@rivosinc.com>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712895091; l=855;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=AjSOqPvk8pDaNRWNo6bJjXE2EKHaQE5Z9yM7TIyqWv4=;
 b=rLdA0uDN/4SuDsKaNkE1B/5EQ3+8RUn38NFVGd7zgF1hdVuMZ9rnFvU8oAtWxXhpoFvN3XcS2
 AwLpS2uv0ZdD7oPmFrJym2AWAe7fYoEjhePpIuQeP49tGq9DoLHJSQU
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_211150_792087_DC759F9D 
X-CRM114-Status: UNSURE (   7.84  )
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

At this time, use the fallback uaccess routines rather than customizing
the vectorized uaccess routines to be compatible with xtheadvector.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/lib/uaccess.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index bc22c078aba8..74bd75b673d7 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -15,6 +15,7 @@
 SYM_FUNC_START(__asm_copy_to_user)
 #ifdef CONFIG_RISCV_ISA_V
 	ALTERNATIVE("j fallback_scalar_usercopy", "nop", 0, RISCV_ISA_EXT_v, CONFIG_RISCV_ISA_V)
+	ALTERNATIVE("nop", "j fallback_scalar_usercopy", 0, RISCV_ISA_VENDOR_EXT_XTHEADVECTOR, CONFIG_RISCV_ISA_V)
 	REG_L	t0, riscv_v_usercopy_threshold
 	bltu	a2, t0, fallback_scalar_usercopy
 	tail enter_vector_usercopy

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
