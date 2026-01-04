Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB72C2A062
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jan 2026 14:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bivX9Jb1qlKtomNSr/KfTDg7fzSsfdFh2EyM+XRGDgo=; b=ejcnNVpsczSnIy
	Cn6RZOmB8vrTVSW9HGbS1Oubp1L+DW3QCIIIYa4YSj4Zh6tAYbzglz/kNDawdmigeTmOoEqa3aRt1
	UKegWJhuxNW1OmXjZJupMm6bBFhUlOvLGAxgnbXd/CC38y8loEGRMmYl7DXPrpDcoJxgk/e91QZ9b
	Tte5xNW0b21730PWFhoejfviwuaep/Gh0wPS0zdW0DspzDt/e/MZCbgW835QnEkoObms6Jqla/kV8
	JjqKCf3lbjF4NRmB42BfRhSQyx0dYDyqXhTsN4J+ujxwftgKdlKcquu0eI8uFAZ0/EgN4mZNiP7vO
	hMwOdhBBFy7xofePMjwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcOem-0000000AHBo-0NfH;
	Sun, 04 Jan 2026 14:00:32 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcOea-0000000AH88-0RgJ
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jan 2026 14:00:22 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2a0ac29fca1so110622275ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 04 Jan 2026 06:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767535219; x=1768140019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqmQmaFNmFjEy7S54wIHblwNMJ9e6UGwg3T65EY/Hjg=;
        b=R1F9Dt1ZIba1aMyqIjHpg5404elEP1VCH1DOvv181pgPUwak90QvVNpPJqqN0AtiWC
         fJ+TZ84vftwAi9awZwlm5sCbn7Gw9hCgRhgM3M//azaqVgO4XpsbAH8yNRBqXDjUtFbp
         KpOXaFuJFMkInYa7K+PgAM/Sf1YAhp5nnAjhSEauObudMXxb+OL3PQ1OYin0ziEmDuSB
         vAE0XPxPpoHUtmslejkY4RaDe+2hHCWMDqFLM6S8fDrwTDjrJCk/kgiQlOakmH+pMeZ9
         lf0ISGXsmhWOX1BUkfn8OruEBuQuM64600lfPetIBo1Lns1TBsdmwuoK8SDDlpuQmvv6
         iF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767535219; x=1768140019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qqmQmaFNmFjEy7S54wIHblwNMJ9e6UGwg3T65EY/Hjg=;
        b=EsO6mnjeKbWMYnHAcdyUWkTfLs89SsmYGXTzBL3PEHCXP6cFlNYYF9xgJyk9WrFkew
         oWkp3ulyb9X7dLgbHDHtwmdawVOAyialh/hqo/NKzyBATfZdDmiX2HmkHF9i6jj351pk
         yPjfJyb/ff5zaK17Ek66f/Joa2gYk2S16ArVmFno7WUlRZk5cgWi8zmzdmtBTHiOhsZf
         vnwH6uv1Jg+2EjaIZXr5dfvXO096w+OSVXoz+ZH5Pq2ttvYEByJLH7ft+U2wDt78fgsp
         THAeTQizLC+q+ylxLLn3bmEdwxiAcKpPyP52Y1OEJxc83F5BAjxYV6EKU4kuMjtjSF80
         BRHw==
X-Forwarded-Encrypted: i=1; AJvYcCVk2D6t2f9loleAXUDr55l301myMMxc1eN8L0FUr3c7FyeJR+Kah2rQaLQEKxnsLovkBR+oVJnXMgeaDw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgu3wUK2Fo6c3EYly+SWa3WZ8Ve5veKh4+HhVFe28bf6XP/CYU
	pJOdRqTSNeN3rU3R/btx0b7T7JQn2cM+KYNF6q01XMFgW0CRx5CQqMFC
X-Gm-Gg: AY/fxX488QhA6kDsd+KTAFOqFLFhbAo77+tI+wD3W0bLwF9BHQtfv9ohVz2olpne8Lg
	/OnONglL8P2pGQ0psU/L61ebOs115HB//97xIg/SKdtPu/1C6tw9ZIGqflSezQ1bol2J9D1kQF2
	rJ/m+5QYjngjYpV4aQ3yXEOWD7ssdisd+daBc6773oqs9ZtZ+0R9bpYc4IBzqN0f53wmVxNE0d+
	GZeq8ov+cPV4zmqjUJ6NnLeuzTtEU3a87BzH4o17uaULj2ksGdXRMG+TxQ/kdPSjlO1QZVuoC5x
	XJHsjqacb4QZn3ArUXv0gl8rTaISj9AfBPYd2nLTu/Buw6qwz8ArcrdSnbmokUK3n7HvUqp8ZTl
	dGoeMnQiSfihcxIj1jnDqiFdx7Q7mmVs3rBkTB08J8jPLv05KCxJWI5LP+AWTXHyb87LWX/Ft09
	iIsCEUITLWfz8/i6PNI8cbmdK/yH5ru2X2h3tohRKeNhKDI2y1xQIqpNhDhOuBh8QE
X-Google-Smtp-Source: AGHT+IFF0zPQhAdEGQIhG511RClUe4pVQFBGTYZnIh7qDrj28ymiDIGxnpivMIor8szJu6tv6fbZ2A==
X-Received: by 2002:a17:902:f546:b0:2a0:c84f:412c with SMTP id d9443c01a7336-2a2f2a3be72mr478366475ad.57.1767535219101;
        Sun, 04 Jan 2026 06:00:19 -0800 (PST)
Received: from localhost.localdomain (g163-131-201-140.scn-net.ne.jp. [163.131.201.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb25sm432327535ad.56.2026.01.04.06.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 06:00:18 -0800 (PST)
From: Naohiko Shimizu <naohiko.shimizu@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	atish.patra@linux.dev,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	nick.hu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Naohiko Shimizu <naohiko.shimizu@gmail.com>
Subject: [PATCH v3 3/3] riscv: suspend: Fix stimecmp update hazard on RV32
Date: Sun,  4 Jan 2026 22:59:38 +0900
Message-Id: <20260104135938.524-4-naohiko.shimizu@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260104135938.524-1-naohiko.shimizu@gmail.com>
References: <20260104135938.524-1-naohiko.shimizu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_060020_139067_C7A4078A 
X-CRM114-Status: GOOD (  11.18  )
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

On RV32, updating the 64-bit stimecmp (or vstimecmp) CSR requires two
separate 32-bit writes. A race condition exists if the timer triggers
during these two writes.

The RISC-V Privileged Specification (e.g., Section 3.2.1 for mtimecmp)
recommends a specific 3-step sequence to avoid spurious interrupts
when updating 64-bit comparison registers on 32-bit systems:

1. Set the low-order bits (stimecmp) to all ones (ULONG_MAX).
2. Set the high-order bits (stimecmph) to the desired value.
3. Set the low-order bits (stimecmp) to the desired value.

Current implementation writes the LSB first without ensuring a future
value, which may lead to a transient state where the 64-bit comparison
is incorrectly evaluated as "expired" by the hardware. This results in
spurious timer interrupts.

This patch adopts the spec-recommended 3-step sequence to ensure the
intermediate 64-bit state is never smaller than the current time.

Fixes: ffef54ad4110 ("riscv: Add stimecmp save and restore")
Signed-off-by: Naohiko Shimizu <naohiko.shimizu@gmail.com>
---
 arch/riscv/kernel/suspend.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index 24b3f57d467f..aff93090c4ef 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -51,10 +51,11 @@ void suspend_restore_csrs(struct suspend_context *context)
 
 #ifdef CONFIG_MMU
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SSTC)) {
-		csr_write(CSR_STIMECMP, context->stimecmp);
 #if __riscv_xlen < 64
+		csr_write(CSR_STIMECMP, ULONG_MAX);
 		csr_write(CSR_STIMECMPH, context->stimecmph);
 #endif
+		csr_write(CSR_STIMECMP, context->stimecmp);
 	}
 
 	csr_write(CSR_SATP, context->satp);
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
