Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C596EC48285
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 11:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/rqNrA8vhwgFSTT/Wyyqbmev/TvzE5OdP+yaRxO34lI=; b=shptSIX34+inNE
	LDU6/e+FXmcHtS/wb8VdW78PzE6M9NN33va49C1GETNVTA5zRgG0otCUFnOeYYDKfjym0U4aDtYDu
	7y3Csb71kJmIRk0Jm8+l5MUhAdytOu6Qb7hMpR7RjAJKtMzPj2m0T8T+hLBK3BgESVnZsgqvU7poU
	PWevd2r4Id+4hVUbQ+oxN0k5iWDsmqEAtPQW7VyHJZfvQSqC8GqziM1pxLPW9SuZVAQseVZUJzH6t
	4tlvj6/MuAtE/bJ6oQr5/f2dj8sL20kHtO6Z0qdctHz1WFUTmlqYmUev4BOQC+EC5732Mw3UP3WBx
	lWIKCsCEL7KOu0hVxVlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUmhz-0000000GZZl-0WFo;
	Tue, 30 Jan 2024 11:55:19 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUmhw-0000000GZYr-1txh
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 11:55:17 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-33afcfc40e2so210301f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 03:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706615711; x=1707220511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=96xTLiCr7psVkkYjzXmoBovLDjznb7PjBA5px/xb+ds=;
        b=wya//feJleU5V9uyDEcLrddhnbiG4JQPKOIwm8Qo5DPfbm+gabC5qBng/vtMUN6U8c
         yeQmZ8WKmssAGxOk5w5tJD2+xBYA0SV7lieMtb+/OLDC7Z3cP2oCDWv5hZsml2fE2G7G
         fgBdEqYIGpOomfacTOb+F5aXEXOjgnbwE/HpVsIU2KAuaWc2e9+jjYEv7UPTWK89PHa5
         CdoJpXC9xPtRESj54GNzwxtkBk4ppMF0zCGKftMCKCY+mbz6nluCqKI1cPXxLi+X7kgT
         atJRoQUTpGSpCIk73dtvCUFkD3xtvKDZLmFDltxTq/pJWKMLbI9vB3+/Gbh4Foaa+Oz8
         9S0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706615711; x=1707220511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=96xTLiCr7psVkkYjzXmoBovLDjznb7PjBA5px/xb+ds=;
        b=WQyX628SG3D4fKc8OPJucObpaZrW+p02m4bwTrG1CEs+MHbmsTuuQQoAs/q9wjSocK
         K6tGAfpVFmr8SEf3elVWIVBfCSX8I1sFTlnxTqAzqN9n2kBUPfN9UyiWu0BZuS4I6Eoe
         43RoJcxSZ7yd5r1jzs2U4nVNzLM2WY9CF/f4fTDgSELWtuYLRkQF8J/bWqjvkO3pCfqH
         GVD6WD9r9ggjlEIlOTP9KJSaM618WGjJJM2VNXFf9fS4cTL7wBckWlhk3rxB/IcSgzqu
         yFqObogjkG0E8OTWHYiZEwbwegXR11UEOmVnH0OIjv4wCb6BlPu4HGwQPX3PsmkJOYDX
         9Gmg==
X-Gm-Message-State: AOJu0YxLh/ZP4nAz4+Rf9HXVRg7rgpbBQYuNkARbaBCazumD396Zy90O
	PYs69fPaHHEnAT4A1zTh72JRl3ieQU/Ug+eVNxGtoq5DJa7YdbxtWF3PqEXDAcM=
X-Google-Smtp-Source: AGHT+IE88dSxF2s7rFZw1Sosf/6KlrIQmsVVf4dV1I57Dj+3ljlOoH1xXX4Lm+DFI884EUF261e+YQ==
X-Received: by 2002:a5d:4a83:0:b0:33a:e403:dd91 with SMTP id o3-20020a5d4a83000000b0033ae403dd91mr6962974wrq.21.1706615710690;
        Tue, 30 Jan 2024 03:55:10 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id s18-20020a5d69d2000000b003393457afc2sm10502841wrw.95.2024.01.30.03.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 03:55:10 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH -fixes] riscv: Fix arch_tlbbatch_flush() by clearing the batch cpumask
Date: Tue, 30 Jan 2024 12:55:08 +0100
Message-Id: <20240130115508.105386-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_035516_510063_9E4A6150 
X-CRM114-Status: UNSURE (   7.78  )
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

We must clear the cpumask once we have flushed the batch, otherwise cpus
get accumulated and we end sending IPIs to more cpus than needed.

Fixes: 54d7431af73e ("riscv: Add support for BATCHED_UNMAP_TLB_FLUSH")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/tlbflush.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 99c3e037f127..c8efc3f87a0f 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -240,4 +240,5 @@ void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 {
 	__flush_tlb_range(NULL, &batch->cpumask,
 			  0, FLUSH_TLB_MAX_SIZE, PAGE_SIZE);
+	cpumask_clear(&batch->cpumask);
 }
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
