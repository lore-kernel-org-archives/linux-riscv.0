Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E400C54798
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 12:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nvJxV3YmhpCzMNWbX/McCmQuQId+Qcmg3/A0MbARfNI=; b=NmLdFMfoyguC8p
	vaazWvVDIX9F9xfPE4uSbXUlXTa85ky4PkpHfAKtLHDwqqzAen9TWbZj4jlhN70qBbSOgT1fZ+s0e
	KRBuAKB1mqUjB2kwt8ntxJ0Pwb3m0S9N4cZ8BTjov+HgQchgYGkY2iYyc3SvvbgZ0SDq9Cg3/5ZMP
	WfHsnHdKas5Spgqlza+PYg/gTiIF4vbl4eA/R9fhs+FFo5dnY9NXeIjuPvCYwk+X44YKsAK4yYFP3
	nOrtyevZ7J8UBr7VpYU1zQQDDq6lmjyPqrGqbTjyHve43o/svwBnghkqquoLAe77x5bSTI1pUpCV9
	pv+pzNhFWG3r3AZPapEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rffGf-0000000DSkY-01O3;
	Thu, 29 Feb 2024 12:12:05 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rffGb-0000000DSje-35BR
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 12:12:03 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-412af1c91f3so6094995e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 04:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709208720; x=1709813520; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQF1yLtoiSlCctJ+RE39C/7ki1uh9viRU9s1V0y1lKc=;
        b=hVTH7KalZEFVtVimMmgfeUdFqw37j3o7RfnplsrrwvUwkXSgbe/l8wyYSK4KXq7nyC
         N8R5rTHQrUHZjmsx49bZIEixCODOFDn80GBDo2M8XOFOUdOjKIuwZ8BpVkd/yURprBaT
         q4DYF3G7NWgdjmSdzgDozM7YsoUQaThkh/3dRpaSyoSPpNE95OHziaOCPGtaU6ADMe1+
         Ay9uGaWdKxCNUOQWAxFurSo0mliGUAMeVmlWZBTuPwRLsApc/KysxNDf+01unUWc6HlD
         fYWLiYHMXbn4EtC2j3uHklCAKz7gym2bhyri8bZ5Yn9EzLCs4n5JftMUovVY6EJ8TktJ
         Vq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709208720; x=1709813520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQF1yLtoiSlCctJ+RE39C/7ki1uh9viRU9s1V0y1lKc=;
        b=eJFAfEgS2xT6rm/P2W6wycit4omxLXx1z0rfWMW1rZsqTccIuZLhIxD93QWxUbO5Rl
         +NVY6TYBikBzuAa3wI8N+l1jEptOoPA0NCzPPf6fr/m4W5y/uuWCy8jmjX7G/8PK2rpQ
         6gLV9Xv7ekerSNIRvE9Tj+k4Krf9wHlO3MoRe3WZ7FMV3M4M/HoU4V0kvF3yk9BUDruy
         mYvr9GeB33t5AJ9JHQhoOrgxJQ2+2e04at1ddI4KqMlsuUBQjqNyBwq0Pql48FyLuc2A
         6nYekGmKaegt1EBH2NQJgDaX1AtyuICk2MFJEkZOPq1zqW7KTlHftP8MJGu7jsOSqykD
         7jdw==
X-Forwarded-Encrypted: i=1; AJvYcCUe5xhjRhr8cqjGMEsCQi8MTfr4BaSpALVv5KPTy5f/RxvQ/hIwKEkILvvQ1XlKZ680OdxSxDiMPFe4rXClM3nIRhJshwStnXPZIJFyep7P
X-Gm-Message-State: AOJu0YxPNVMfbTVTcKRn9CiMhGLrJXmc9a2tYmsxQG+fR7lMMyrGm6gK
	6XJamZjxftBRKZG5rgIsPXTeKVKSTprdW/wk3glTTef0nQxxi1+k5dwdu2fEXh4=
X-Google-Smtp-Source: AGHT+IHfRGAEIEth4r9z2kyk2vnllBD0U8y+Yoxb/4kYE6ynYOIB5eFJyLQx9/3aYLh47mInURi5ig==
X-Received: by 2002:a05:600c:4ecd:b0:412:bca4:f23d with SMTP id g13-20020a05600c4ecd00b00412bca4f23dmr1340384wmq.29.1709208719846;
        Thu, 29 Feb 2024 04:11:59 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id k40-20020a05600c1ca800b00412b643b5a3sm1922750wms.11.2024.02.29.04.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 04:11:59 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrea Parri <andrea@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH v3 1/2] riscv: Remove superfluous smp_mb()
Date: Thu, 29 Feb 2024 13:10:55 +0100
Message-Id: <20240229121056.203419-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240229121056.203419-1-alexghiti@rivosinc.com>
References: <20240229121056.203419-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_041201_798078_4B97D4BE 
X-CRM114-Status: UNSURE (   9.29  )
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

This memory barrier is not needed and not documented so simply remove
it.

Suggested-by: Andrea Parri <andrea@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrea Parri <parri.andrea@gmail.com>
---
 arch/riscv/kernel/patch.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 37e87fdcf6a0..0b5c16dfe3f4 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -239,7 +239,6 @@ static int patch_text_cb(void *data)
 	} else {
 		while (atomic_read(&patch->cpu_count) <= num_online_cpus())
 			cpu_relax();
-		smp_mb();
 	}
 
 	return ret;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
