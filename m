Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F600D13588
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 03:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pBXhXk9/zyKqF+hN6zXN3WxwC8RZV2eJhVrsQ7saT5o=; b=iBpuqGSUttXtRQ
	ybE9HAv5JLY1oZ4VvA5TLKAp+xa1rVyJII0rS6xnVgRyAOXCxviPVnIHTC6JIoVMUATXBW4ITbrye
	iXHYvrW1RHaYXB1CyV/Nd/IvYYIJCWOMa2W1yjbjx8v6LrelSS2Wv2EZvQE4JXGSHpxodacQVAkMj
	gdQGMqwuBroPtH7e/pq30ke+QLv7ILXcXOs2gS+ehjkZgyEf1Y9fMnloUL22CgUfDB/96bi2x5qET
	kt0AShHJ+I4Te/hfEUfiz3PDVBYiJQ/lKjAiY3+QCtMr6D9XOnFznum2DKXdKVkmXoylXOkQT8c3t
	xQC87jKeoEKxaOrlhTDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5GcQ-00000009ST3-3gja;
	Mon, 28 Oct 2024 03:40:38 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5GbW-00000009SGy-1rwT
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 03:39:43 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2e2ed2230d8so2849783a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 20:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1730086781; x=1730691581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=riHqjf4TEkSfIjrBl/2OcUP/uMFiYpg8/raWLqLOU7Y=;
        b=EbOIKPiXbBOGbWTZWHWcjTE9W+eDU9VuqQGpucAI20Hf5SaVLohLkUqTkx1cczjiAr
         0RqNCIZRLUPCJCHOU1Wxr65np/QYqnnwe4sbCccxUWCW6hUOCZBZvifIl3do+DXYZL1n
         ylLGhxySPR/+bUyE7Ux6Kedp9mHY/hWI8v33mbDD2tJrTNxKwJ2ERzwtTWVhTLcxxg0t
         8PBUr253EM4ZE3ZFVtkstv7hvp7w/GLs98897rqF/IyFPOaUdUlGlznUJGPhHjzEewd+
         8k5tEOk8+iu84QKC+pUNJzM9Dk1ho1NxcOpVXi+5+jgU+BF6s3BEZkfVsRm2Qcx1D0Sw
         7+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730086781; x=1730691581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riHqjf4TEkSfIjrBl/2OcUP/uMFiYpg8/raWLqLOU7Y=;
        b=SRSzf/DxTdxkdVKd6L7035Y1ugUi6kX1DtwRvowTt/kVK5QiRqU8BWWMu2f49KNmJ6
         Sr7lhi0mDglGra4Ylry8j0a28Qy8O4YTYsSaqKiVZphCfEAgCqjpIa1sWUYWfIE7gBPv
         CVNZq6l28xCMheo1C7NrLktEMZ725Ej4ELW9Wvi3khE9u+FzWsh2xxhYmjbXqSHiHHZR
         b5xv5R2I10UJaIb1jrumfGyEJQuuCv4asIclK/4wmaCbyy982pZj2KGsE2ryiBxn6eMF
         6b+A45l44NwGNWeJvdxDTnpWdD634+iWHSNOdqoGadItBdfVu0taq36ZMQ71qFVbGJi2
         cTwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBRIBYuwxzt+cOf+6Jy4v++rHoQ/LYWR0887m6cRhtFAZ/FREuVUfsJ2p+79b5SWDqhs2ncFHKNA2W8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvtedqoSqJ0wx+DNycSDA/8vRjgQ5joD2aYgWcYG3iA7iDfkkH
	pYfOSXXiIvAvlAwBh7W1qQWESKfNnLeEhYMvzNoGvPzfNCeCgiCgpf6izjVGJGo=
X-Google-Smtp-Source: AGHT+IFvmxoPCy/7sSomoKgH2rLyOpEyqOsKkL4VWxhavzi+tm5x5d2JksHbArO8sToXYxd+TOAmNQ==
X-Received: by 2002:a17:90a:1c16:b0:2e2:e937:7141 with SMTP id 98e67ed59e1d1-2e8f107d831mr7994236a91.20.1730086781313;
        Sun, 27 Oct 2024 20:39:41 -0700 (PDT)
Received: from hsinchu35-syssw01.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e340e544sm5961888a91.0.2024.10.27.20.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 20:39:41 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: greentime.hu@sifive.com,
	zong.li@sifive.com,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Nick Hu <nick.hu@sifive.com>,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] riscv: Add stimecmp save and restore
Date: Mon, 28 Oct 2024 11:39:25 +0800
Message-Id: <20241028033928.223218-2-nick.hu@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028033928.223218-1-nick.hu@sifive.com>
References: <20241028033928.223218-1-nick.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_203942_555388_8662B1E6 
X-CRM114-Status: GOOD (  10.49  )
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

If the HW support the SSTC extension, we should save and restore the
stimecmp register while cpu non retention suspend.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 arch/riscv/include/asm/suspend.h |  4 ++++
 arch/riscv/kernel/suspend.c      | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
index 4ffb022b097f..dc5782b5fbad 100644
--- a/arch/riscv/include/asm/suspend.h
+++ b/arch/riscv/include/asm/suspend.h
@@ -18,6 +18,10 @@ struct suspend_context {
 	unsigned long ie;
 #ifdef CONFIG_MMU
 	unsigned long satp;
+	unsigned long stimecmp;
+#if __riscv_xlen < 64
+	unsigned long stimecmph;
+#endif
 #endif
 };
 
diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index 9a8a0dc035b2..24b3f57d467f 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -30,6 +30,13 @@ void suspend_save_csrs(struct suspend_context *context)
 	 */
 
 #ifdef CONFIG_MMU
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SSTC)) {
+		context->stimecmp = csr_read(CSR_STIMECMP);
+#if __riscv_xlen < 64
+		context->stimecmph = csr_read(CSR_STIMECMPH);
+#endif
+	}
+
 	context->satp = csr_read(CSR_SATP);
 #endif
 }
@@ -43,6 +50,13 @@ void suspend_restore_csrs(struct suspend_context *context)
 	csr_write(CSR_IE, context->ie);
 
 #ifdef CONFIG_MMU
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SSTC)) {
+		csr_write(CSR_STIMECMP, context->stimecmp);
+#if __riscv_xlen < 64
+		csr_write(CSR_STIMECMPH, context->stimecmph);
+#endif
+	}
+
 	csr_write(CSR_SATP, context->satp);
 #endif
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
