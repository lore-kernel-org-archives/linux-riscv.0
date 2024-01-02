Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B37C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 22:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n4FUUJWMeQ50MhgT9WfVWFZlC3MyJ9tf2sNwhOkJThc=; b=xwdTaqHSb0Ovtq
	8l3AR7qyqFvyfLEll9Y9VZTdrub62yPZCepgkxCc/5Ztk26qyjh2UEnaRmgYre9JDdp1CzWrz/jGt
	J4I/jwiD0priZZWJYG+ZpX/ECl+hJvuz5y0ZvwjcrnPue48tFLNsW4ccaVt3qoGZNXqXdzFavnrE0
	tCKJYNJleuLdq63XoT3mPPJsJgkOBMUb7ddhm8p1Ui83lWyhfDh29q4C6DQGtp3MzWUfJGKFNx5r/
	kyyjicj/shFea5k0c6DuXMLN+8cT8685Q7PSDF5dgScpHuOaKHA/H1z6pNNddEi/5D/zlIITOCOSK
	Kc4Xa1BmZGOOsbDgp3kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKmpd-0098Xl-0i;
	Tue, 02 Jan 2024 22:01:53 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKmpY-0098Tg-2S
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 22:01:50 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-28c0565df34so3429737a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jan 2024 14:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704232907; x=1704837707; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8uQuAx5HbeGrqX4Ip/qQY7nv6lrxw4qacCJFbpKbko=;
        b=HNDASZSE0Sbn4BoMGTwmDKDz+XMSsxDzbaa6wpuAB1KP+SJ1y7a3+lcHwTtVmonZ26
         D7QOgFJcldWWxNNSTuxxmQozcxRG3YvLFaLnWy5Hn70FsolNIMd9qR+PATiz8fMvgq7f
         jaqsyJQhyRezN3hTQKyC7lmJ/e21CORmc6ONiK6TPZuoFsu3OZBumhrG968vJQ5oErE+
         GuQEE7sLgM7CUinSuNI1373s+K9FW9iLMq9CguAdEnBwdrjPbxRx5RKJYayDhGzrQOew
         QG9Ztv4dvNUQPeMUOEZL2n50fCkGpRppZcgYRHZC081Jwgxot5UkFgUNdcNNPy40vhEP
         4ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704232907; x=1704837707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8uQuAx5HbeGrqX4Ip/qQY7nv6lrxw4qacCJFbpKbko=;
        b=LlXZn1tHQvs/c43+VdZSAoTid8CgQ8+++/kZH2Vkdq4gNXCEYWFDl2qoxMjxzMTvg9
         2jj3JfmV9yMI5CrN1KlckL5T/hHoBN9iQQHa42T4NoNqPRPDka65VekMCy8tODRsjsxq
         RM3y0YyowS14JX9EqYUKi4VQby6AoqUgg7iR5IIfoynQkM6ISBXndfhTgYsUx/Ryycvi
         gw02WNMRO/pVZ48RsTgRs8F63yQX9V42K5Kl/8cZWmxn1Zt11nBXF4bH1dCMDiuizhq0
         kKBefHcPYAFyhUtd9alb+wqoFBHC7CzCaM5mbYbUfCRvcVnftLxjkdJqOAE/lNlYxMch
         AgGw==
X-Gm-Message-State: AOJu0Yx+suCJ+fXPRMRgq/BZDKF6tv5PDYkHG+NfGyD7lvduXzy3NMt2
	gvFEskpUCWw9xFz3n3rFS9Ekc1PTa9PiRA==
X-Google-Smtp-Source: AGHT+IEU78MnSVmG+tTKoY5SsP+KmgJHfZS8cB0cAVh744mS+tR8J0bWreXJl70FWHY5n2NbigpZXg==
X-Received: by 2002:a17:90b:33cc:b0:28a:f2cc:e008 with SMTP id lk12-20020a17090b33cc00b0028af2cce008mr6619129pjb.54.1704232907387;
        Tue, 02 Jan 2024 14:01:47 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id r59-20020a17090a43c100b0028ce507cd7dsm101724pjg.55.2024.01.02.14.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 14:01:47 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v4 10/12] riscv: mm: Make asid_bits a local variable
Date: Tue,  2 Jan 2024 14:00:47 -0800
Message-ID: <20240102220134.3229156-11-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240102220134.3229156-1-samuel.holland@sifive.com>
References: <20240102220134.3229156-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_140148_796778_92F5CC1E 
X-CRM114-Status: UNSURE (   9.30  )
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

This variable is only used inside asids_init().

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/riscv/mm/context.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index b5170ac1b742..43a8bc2d5af4 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -20,7 +20,6 @@
 
 DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
 
-static unsigned long asid_bits;
 static unsigned long num_asids;
 
 static atomic_long_t current_version;
@@ -226,7 +225,7 @@ static inline void set_mm(struct mm_struct *prev,
 
 static int __init asids_init(void)
 {
-	unsigned long old;
+	unsigned long asid_bits, old;
 
 	/* Figure-out number of ASID bits in HW */
 	old = csr_read(CSR_SATP);
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
