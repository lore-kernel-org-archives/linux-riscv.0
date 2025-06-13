Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FFBC71135
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 06:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZYGR6yB1sS2otDOpSFWy1N6GXsKX2qrMDJ2nxGdSzQ=; b=ZLnrzGaUBNXhj6
	4QOrsZqHUIKHyM58rD3xeE3uTnOkgbdOnkSzKnCCWTNlwXnf2Qnb6m+vBYlTyS64moscKWuqoquuE
	FvT5WlqNfCSN5aoSGLeeQ2/IOCO+OHdV3fGeyAU3+ycHqPhx2F7AVPBe6Obuwybmv7IU/GmwbaJeh
	u4SzW5gPq9ptSb69H6Nm+MNfwJ5A6vQPHJdIfvETcvMQlGw45l1fvfxtHBKrgAb3f+e0UHubh65fd
	FXGevYYSU+T4hVPZGV+TlmPOARvYjg23c+Fx26VAVb5fY+h3s246JZl2cM5ETvG3YQdoP4YSCOJT8
	cnCFYbU8573X5qMdmPFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyMU-0000000FXFn-1UPS;
	Fri, 13 Jun 2025 06:58:02 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyMS-0000000FXEB-0gl9
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 06:58:01 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-311d5fdf1f0so1818824a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 23:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749797879; x=1750402679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymMx2/Jj5SWc9oh0oJCNF6LPBe8+NWhSuF7K3lIaf9M=;
        b=N9m4m7ZLyrBUAvZ3+0u2ShdRDcvXl9o1VD3dhW9Wg459lMbcLMhJqwK9fx71Ii6q07
         /jU1bZqjod85Jgu6BWZ6HgHyw0Hyw34qkexGoKMQgIy1WcmfFiDPmpbLMbMvAN3Qpfbl
         cngsuAaJ6CUexP8mQwkcd+y9fcEFysTky3XKIHQZDj/PaxAmDCbwzKA/vJ7JY3l7Ov+s
         OEo4MIUu/EuTHKKxTHAS2Aed8ONr59d/j//YLns3CI+syWDpwLHBPGDDszBsYGg48J/E
         GQ1ojTw0A9zG5yjK4mbLPt6hN9Hkgdw3dhJvxI81IOa3wQ5sUAL50dt1Vn8iHFoCRhuI
         GuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749797879; x=1750402679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymMx2/Jj5SWc9oh0oJCNF6LPBe8+NWhSuF7K3lIaf9M=;
        b=j5JmjqBRoeNL4qgItlEa/0+4C8spNN8mUsAREOSm75lNyfPhKuIL1MVQ6BYnyUJczR
         Mc8Cdm60Ed0VAhOPjp7izIupP44mehJQWGeZ5yoV8dCGkSBYMSBJV3aA3ClwketciXfP
         acMIPxinfjxsOjKAW/mv8s99qkTlX6WjFDfzbneF2cJ05KytmLQ/ebingAA27JhcNv+s
         1oe8I/P4gnaAeh+af9ATNCuXDW7fhPQXRHJxo3hhgZcQO/AAxYtsmnrEEcRVpfafBQpl
         OKcKfkPrW/l6VjxCFd50WjOQIPYvktVtw2lFzcmfyElsqbkbfoniTI57p8fFl/4PLvEn
         6hlw==
X-Forwarded-Encrypted: i=1; AJvYcCXqYKlzRFEqMENodtiAN/EFm5fA7gZxyxFH6+PvgJzOANWa9JwAst2qgQL4f3kP7ryrqF7tiHr3BuKXcw==@lists.infradead.org
X-Gm-Message-State: AOJu0YywMZM50JYW99G2ggF13V3JhGkYlOwRFcOHB9q9a7tzd1aTTv+Z
	9p8aNOa5RCMa+pFu0eqkz4+dbkftz4e4Lv1AvKUkeM5BHbPaJ8hAj4YnFssR65RhvyU=
X-Gm-Gg: ASbGncvx2qlecapWHiuxpsszkv6KzeEtWgx0pWQ08qRgqlZlc9tRCUlZXf36j3TawKy
	NJVkvACSooTE6zfSERRCGfvCzYIzUrFz0Ra/JBJ/5eB2SsLHlfcv70/sXcqVcONyV6VcJHGFxeJ
	HILpP1WiT3EW2m/mD34fD4OeTPwv/a5IYvK8rz7aArqhMt85pWWsQ9oVuNNqwowZV7KO11kHJbT
	4u+BMxHd7UgLreKkZOnCqHmml2g9NGX4Yh1Jqz0whHA3r3UJdtmER2D7lhSoJ4sQc/fMesTft7Q
	Lyv2xeO9BsYEXKmPzhgO3hHrXxFHeWXZxS2h5nVDjdbk+/K/lLM+kI0Nx4ItCkaLMbb/GnH41j7
	5fIA9nKDxPXVmTbEa7t0=
X-Google-Smtp-Source: AGHT+IFbsRijVxYSu1XTO+0N6i4HTy+vctiYUi4v1qHZj513C6U95CzPutsxwPcR26VA49ZdTmRG4g==
X-Received: by 2002:a17:90b:1a88:b0:311:b0ec:135f with SMTP id 98e67ed59e1d1-313d9eeab31mr3207474a91.30.1749797879252;
        Thu, 12 Jun 2025 23:57:59 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49b7fsm2653022a91.24.2025.06.12.23.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 23:57:58 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 01/12] RISC-V: KVM: Check kvm_riscv_vcpu_alloc_vector_context() return value
Date: Fri, 13 Jun 2025 12:27:32 +0530
Message-ID: <20250613065743.737102-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613065743.737102-1-apatel@ventanamicro.com>
References: <20250613065743.737102-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_235800_202534_B1D30926 
X-CRM114-Status: UNSURE (   9.98  )
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

The kvm_riscv_vcpu_alloc_vector_context() does return an error code
upon failure so don't ignore this in kvm_arch_vcpu_create().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 303aa0a8a5a1..b467dc1f4c7f 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -148,8 +148,9 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 
 	spin_lock_init(&vcpu->arch.reset_state.lock);
 
-	if (kvm_riscv_vcpu_alloc_vector_context(vcpu))
-		return -ENOMEM;
+	rc = kvm_riscv_vcpu_alloc_vector_context(vcpu);
+	if (rc)
+		return rc;
 
 	/* Setup VCPU timer */
 	kvm_riscv_vcpu_timer_init(vcpu);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
