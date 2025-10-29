Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2959CCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 11:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Xt6E/AFcgykTfwqa+3WO5IMffcDH94jHScW28onnbc=; b=NPZXX+um7jpiRT
	2T5P76WP1TW5Xb3YI/owAZqs12I+xrpJY7jQOfZnoZ9OUtKvJLmqg7REgwI2rbjBMrDrYmelr+Cp2
	+J5ozCDvnPi8WQFQl3pVPCAupBI8VXOJ+rFb+Nx0/ZF+bL80KSrH7Rw5Q77bw/VlHyBrAjDtX4T5t
	WogIdr136hfYRL58dvKoG0CmX3MAeifDyeNdlEYuZS/5kPKCRwZmXN0Z+Gn3JvR85r9peNHeEYB2+
	L0Qh9FPoJSwTsCZvbEVT/tEHYbiWd61H+rDYodYk4Q4e12So9QnDIT4Ooc4EFDZPlteP/nu2psf4V
	mgtkdrdyWSw2ttDDPvkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Kt-00000000y1F-0CjE;
	Wed, 29 Oct 2025 11:27:27 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Kq-00000000xzK-3TcC
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 11:27:26 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-33ff5149ae8so3340723a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 04:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761737244; x=1762342044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVrGZiCOO3VoWU6as4Ya4YNojK7gFL/5DgKPuB9HXfo=;
        b=GQlE5KESMYlHMngQn8Zb/KXsgoYNznyDl1yaQkzdE9loNbJcrJp+tj2bUUfVaRJpIF
         hwb4nKs6oephttJyd0XplN4TyIFeVJC7s69kbdq9pS0ybqUDK15gez6XZ2LFtFeOZdv0
         kaNo70gtdCspzurbM/h3FKzjto5h1n2y4Vu7eoA+2mmMVz2lszjaqd39nAvnG23POE2l
         o20JoF8IhP6Zmjq2loksKX/Tt4YXO+gR/B0wNdDlp8qVb9DeTnvelDsjbvCtV3eU9j+n
         wjowxE0km7ENQ5pGLUctdem/tC3LAjU09Rmi5pHtQ/NS3uVsbn+6M8S7YYsS6I7mnnb0
         cPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761737244; x=1762342044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eVrGZiCOO3VoWU6as4Ya4YNojK7gFL/5DgKPuB9HXfo=;
        b=sppmIByHuTrI0T3vZl7IeuxSClPMdQgQH5WeD0CIBGewn7g1qMQS9KEpaUXgH0SPqi
         Jsh45CNndNRTuZPrziVSUBmufYQ0/9Vz7LV8eOW2AiF7AifF6OwYsetQ1B1dJASxarbk
         X6BpfCmq0S3lkdN0Jat6ZDvMC8q2LlPl9zOlVA9tRZdE0qR5jVcdD8msw7Gpmoxw7blQ
         SiXjxlgXypS88Ulk2tT93ly1HCTChEZVor+1hVNfI+CWwAolHOXCUSRi+n0qXqNL3Bd1
         ZxIXgjVBvSwm0LEg4NI8iJGikkeizo/d3Uy0u/FOuS8PKNCalGEEo6Wfa+7Fl1eG1U5/
         TB/g==
X-Gm-Message-State: AOJu0Yz/m+pHNvNyE6Kw3uR10pqftxmJWmVQVy5v7XvmD6vdU4yyATjx
	g9aH0sgn1WObioNoQJuAOKE890u2mLIZU/6PNvQcYBWU1uAiv1TF2altdvo8EygqpPwg1jnrVzl
	qvDBhH/slSw==
X-Gm-Gg: ASbGncuqijJgxbqiMOzmitfDpegbcqOGK/XKxc3EkC9vtwgfs8J7nypLCxN2w58jLQo
	DPyiONMnxgavRTzkaK6I2b9SuX6mM70cJiJ2GzO+HMTvEoeu3xMGsAGbSEDcJOsT2HstrhhXTyD
	uDsQ7BYpnXiJVA3p2US/tDt9Wa6ykaSuAOgL/hR7knl4bAMJZTuift9nHnFh7BCbH5hzQAkr4Tr
	SLpOkeO33TILIU9NZwTSfSxI5PCojfD5wKGhkABfXceJcNbFQYCSm4z2GV7JO839wTwo9fdjWeX
	XquunRyhaQvR7vOZ01SXvpN++8BfsuxbUXv3ofRbKYYvz1EqwzZH4n1ZbD/d8JCTA3X6GlDdZQZ
	YjJ8zVp0OoqSdgb/Zu+tW9idD08GcL2wEdY65sCyDmDr5X2b+cejrLVNTieHldD9FjZEvZ/w7C0
	zj2P2z/c3ska+GGotMKor9oBjfeHHL
X-Google-Smtp-Source: AGHT+IEs0ZClHYQ32GXBT6VvX4hdE/vTZzW0dkqblsfwRDrg9bIgaJQ8u6BnX6Q+OdRAzRPJ5EziSQ==
X-Received: by 2002:a17:90b:4d0b:b0:33d:a0fd:257b with SMTP id 98e67ed59e1d1-3403a2fe511mr2861483a91.36.1761737243889;
        Wed, 29 Oct 2025 04:27:23 -0700 (PDT)
Received: from ventana-desktop.localhost ([2405:201:d019:c0ce:f7f5:7789:48e5:c03f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7f6040sm15316918a91.16.2025.10.29.04.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:27:23 -0700 (PDT)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-efi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v2 04/10] riscv: Add fixmap indices for GHES IRQ and SSE contexts
Date: Wed, 29 Oct 2025 16:56:42 +0530
Message-ID: <20251029112649.3811657-5-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029112649.3811657-1-hchauhan@ventanamicro.com>
References: <20251029112649.3811657-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_042724_867984_13D0A6EA 
X-CRM114-Status: UNSURE (   8.60  )
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
Cc: apatel@ventanamicro.com, cleger@rivosinc.com, tony.luck@intel.com, Himanshu Chauhan <hchauhan@ventanamicro.com>, robert.moore@intel.com, conor@kernel.org, james.morse@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, ardb@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

GHES error handling requires fixmap entries for IRQ notifications.
Add fixmap indices for IRQ, SSE Low and High priority notifications.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 arch/riscv/include/asm/fixmap.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
index 0a55099bb734..e874fd952286 100644
--- a/arch/riscv/include/asm/fixmap.h
+++ b/arch/riscv/include/asm/fixmap.h
@@ -38,6 +38,14 @@ enum fixed_addresses {
 	FIX_TEXT_POKE0,
 	FIX_EARLYCON_MEM_BASE,
 
+#ifdef CONFIG_ACPI_APEI_GHES
+	/* Used for GHES mapping from assorted contexts */
+	FIX_APEI_GHES_IRQ,
+#ifdef CONFIG_RISCV_SBI_SSE
+	FIX_APEI_GHES_SSE_LOW_PRIORITY,
+	FIX_APEI_GHES_SSE_HIGH_PRIORITY,
+#endif /* CONFIG_RISCV_SBI_SSE */
+#endif /* CONFIG_ACPI_APEI_GHES */
 	__end_of_permanent_fixed_addresses,
 	/*
 	 * Temporary boot-time mappings, used by early_ioremap(),
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
