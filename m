Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A5EEE4993
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 14:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2i4HW9VDpbqqpqk71VRZi9nLUChC7OHsHe2GwFpZ07s=; b=s0jUQF4+SD5k0D
	QQ01q/evxMs8OjhCk76n9EJGFwcFUoPD+8BBuN83ge0L1+UxwFBKbZ0rPoT5120EKhYfevttxKd2m
	sJTszjIQ44Zam4aHSmqFTcH+DVc13SZvSKNLSTETITLMx7zHHA91kzNPFEu2v7YOzlTSmrc/3Nz8V
	CHa1oGaE+au6LFl4NtlPj5sfJMoNf2E0o0iaL9bxxKmrJIWwvh+rgZPbm8cd7VdB2nIDONoDcV3rc
	J1+3p9FKKm7mMF4/+UXStSfg2xC2k8wCr7Jm7yiqBoKjGRc9jvRx2P5q0i0MpMfzfNh59PifIeSGs
	6mWc3OcINGErjAfh55nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY6M6-00EEPN-2U;
	Mon, 21 Aug 2023 14:58:10 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY6M4-00EEOx-2y
	for linux-riscv@lists.infradead.org;
	Mon, 21 Aug 2023 14:58:10 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fe2d152f62so5206403e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 21 Aug 2023 07:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692629887; x=1693234687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0wE2zt8g0Wv4wfv5ccirt3Iy9YTM6OrFQ7AyCGM9Z/Y=;
        b=YBcoIel9aZ8B/LEazKHjIiabsYhQ2D7m+4XXSme4K3zuoKEhJziS8KL9rEZlQz6Arm
         vICnq3zyZgkq5D5M8ZcVvdQjmB3qUouHOgGeID8Swu5yAAttFz03p1vXQnYkT1vNprWk
         seTTdXdBZHK++JTMFf2WW8LPu0zKnKzcvxy0I1eEHc//J+HI+DXPodPpQer7AENambQQ
         t6I5mF3Dy0ieG0wNnED9++WTcDawGSiz6eX1XEZEt7lKnjZPxX/V8Z7DsmP5KaBmxBoa
         yY20xKJFKIFqmv69fhvO+JG8gttb3PIgmhxZx9oKCG+sRTfNZkFD8Fg9nw2SXMqumyaY
         5N+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692629887; x=1693234687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wE2zt8g0Wv4wfv5ccirt3Iy9YTM6OrFQ7AyCGM9Z/Y=;
        b=CD9LWA4eEsq4M5QsUTEsyA92yZyIJgvANiiaUqG2EutvYFen6S6vfe5wiBQIL1fDvd
         NK4vROfRSZrZmjsSUbPTMnXyWvAEAZDP7mvaU8ZQiK1K6burREp/dYiuCirIzjYcq+i6
         FCfmBt3kcU43YVAZ36FJr9gvzAmm746OsrvvgfZFDtIpUrKUJXlNZXHrV9GNMDNpHquz
         fewspmoiFJaPNf/2vQU+LHHXN5JDMDiNg4sbD0dxlKbBwWkFqvqRHuj6kWUDUwW9nxip
         /I2NaeWI6BaCYU2GTPUk7QcqvcIkt+abdDSIRkc20nnP3df06aFToAKmwdnK8bzNpuy2
         R8jw==
X-Gm-Message-State: AOJu0Yy3n/J2IAPvpH1wB+gfDQj6YOSFjKQS0IBMMMb7T3Z28K44yxEw
	XHL4GV3AzO+73gFNfVLgm3c=
X-Google-Smtp-Source: AGHT+IFn/3AuiAPJOg2Gh449w9l0VkWH1IUJilqxS4AsvZfnegj9xx/6B6xmlLTEWEEk3krz52yNyg==
X-Received: by 2002:a05:6512:ad3:b0:4f7:6966:36fb with SMTP id n19-20020a0565120ad300b004f7696636fbmr5234936lfu.12.1692629886700;
        Mon, 21 Aug 2023 07:58:06 -0700 (PDT)
Received: from nam-dell (wlan-246006.nbw.tue.nl. [131.155.246.6])
        by smtp.gmail.com with ESMTPSA id s16-20020a1709067b9000b009932337747esm6617540ejo.86.2023.08.21.07.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 07:58:06 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcaov@gmail.com>
Subject: [PATCH v2] riscv: put interrupt entries into .irqentry.text
Date: Mon, 21 Aug 2023 16:57:09 +0200
Message-Id: <20230821145708.21270-1-namcaov@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_075808_963189_04DFBDD9 
X-CRM114-Status: UNSURE (   8.19  )
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

The interrupt entries are expected to be in the .irqentry.text section.
For example, for kprobes to work properly, exception code cannot be
probed; this is ensured by blacklisting addresses in the .irqentry.text
section.

Fixes: 7db91e57a0ac ("RISC-V: Task implementation")
Signed-off-by: Nam Cao <namcaov@gmail.com>
---
v2: add fix tag

 arch/riscv/kernel/entry.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 143a2bb3e697..d7dd9030df3f 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -14,6 +14,8 @@
 #include <asm/asm-offsets.h>
 #include <asm/errata_list.h>
 
+	.section .irqentry.text, "ax"
+
 SYM_CODE_START(handle_exception)
 	/*
 	 * If coming from userspace, preserve the user thread pointer and load
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
