Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D1BC54E41
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 06:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SpBl10GLuNu1Se/5CcXYU6WZ4WUqrFowbu/3vKztO6c=; b=kLpmCPdbuVrXTt
	fkEU5VZXg9R68QmYTO6/YBKaoztS0rA2yOs+cR8P7/t/tTaEvsTZJ/92dxsmob+gH7LcKQq9WShR6
	nYwrfnfJqCpu48bAu6nYk6eK3FZcb0JvBdJKz5oksgncT5GD+fIExc5nAmGn+vvpxxtToGPaIE3rk
	7WMqq3MIVpAQfmTMetPIRACE+ARhUIF1MiNKKp+ujh+HLVML/G05g70DhnA6Ed/yoXaMLNda408eS
	GUrzHjmyTeYzKdmo0Ql4wtGf3bAzuL8CCPEQl7IAOlydn+tqVc4B8/js70vKKhqpmqWBqENpVyTkI
	vbillUbmhB69UvxHmvaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfDrP-00000008EJS-118N;
	Wed, 28 Feb 2024 06:56:11 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfDrK-00000008EHu-1b66
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 06:56:07 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3bbb4806f67so3878905b6e.3
        for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 22:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709103365; x=1709708165; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJgAIcTGryvmtjsnjR7QyAZRnNOgxphdJs6wyGDboLY=;
        b=D5AV3nnWQfsiFIYqJmKoQB/923AiDig9FbxyqiwUV9bNM/zjQsHkN+Wsm5Ss/b6Gn7
         mCVwc1zeEBzX8E1JbYmkLpvJoJeLw0FdGnTb4AUtRzED6TIvusBiG4d9L0a1602H6jQz
         jxzpd2L6X6RnpZDM7H+YHd0Ai/pCv6mvsbeZBHJWT3ChUPDiV+TLlEoBRY4rjbM7dM78
         gQnwdS6gk89ajbYNZb8K6WBx0Z7ZSt5HL5+aBWW3PFxZ1aozfCd0Fk6U8YE7ot0+2Mn8
         bNUSN7FS+OxlLiIcmOfVyllQGDr+Q54vfspBNzC24tBbrcE1ftNHQYq3s1VbCB1/AHyR
         OuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709103365; x=1709708165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJgAIcTGryvmtjsnjR7QyAZRnNOgxphdJs6wyGDboLY=;
        b=xE9VJkoMA6PiCrMOR7XGn2JR0vZtG50MtMmh+/7qtnSmqW7/A1JKdCeD7e6mCjff+X
         sWh4pbhm85ZU+3+2MC8IUmJPylxTAPXjRuRImetHUqDsbylEOvDkC+0oyPmvZFcHppxa
         P/Idbs6/Jp/bHEQVV4nICC6rASgL94GoLVUHnYbJpBRTF+z97BwUYSVRu07sIqc4W0ul
         PhArGBnr1YwDNDvgJZUz3sqdrmXJOQWZiB36cV73ImZadL9o30nX4K7J4VDcc7Daw6/Z
         jdKGEL6DsyPQbthyvqDok2KApuof1IGEOBfkFLWuf3km1cx6Bvqtpf1jfLwNfrBuui7K
         2/vw==
X-Forwarded-Encrypted: i=1; AJvYcCVt5Xxxwl0vwJH5Tx3+9yd65tE2MVicuz51Xhr/ueCV9Gw4+YJqo4/yKaT0aDAdw6usURJcUamPZuRjddvC4tja38zXvWtD91/mHQmBoE0M
X-Gm-Message-State: AOJu0YwXhVAAtOjkm1Gw5Ctz4EWTLHNOHEgnrbXJTCHmkTU3frRyN7FP
	9pMhzTfMw5IByzYx7dIDALJ6Al0W6Zho39SPfCshyg5ENc8JobR1YOqjAAp6guk=
X-Google-Smtp-Source: AGHT+IGGx/vnvLhHJPPq3FzMaf0ciOqylHEHVZRNqVVM/N13/blIW1fdU1Wt/S2raD6d/d9mTPu+ag==
X-Received: by 2002:a05:6808:ec1:b0:3c0:4477:deab with SMTP id q1-20020a0568080ec100b003c04477deabmr4903802oiv.51.1709103365507;
        Tue, 27 Feb 2024 22:56:05 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id e12-20020a62aa0c000000b006e5590729aasm1010112pff.89.2024.02.27.22.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 22:56:05 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Stefan O'Rear <sorear@fastmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	stable@vger.kernel.org
Subject: [PATCH -fixes v4 3/3] riscv: Save/restore envcfg CSR during CPU suspend
Date: Tue, 27 Feb 2024 22:55:35 -0800
Message-ID: <20240228065559.3434837-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240228065559.3434837-1-samuel.holland@sifive.com>
References: <20240228065559.3434837-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_225606_442053_25856CDD 
X-CRM114-Status: GOOD (  10.82  )
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

The value of the [ms]envcfg CSR is lost when entering a nonretentive
idle state, so the CSR must be rewritten when resuming the CPU.

Cc: <stable@vger.kernel.org> # v6.7+
Fixes: 43c16d51a19b ("RISC-V: Enable cbo.zero in usermode")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v4:
 - Check for Xlinuxenvcfg instead of Zicboz

Changes in v3:
 - Check for Zicboz instead of the privileged ISA version

Changes in v2:
 - Check for privileged ISA v1.12 instead of the specific CSR
 - Use riscv_has_extension_likely() instead of new ALTERNATIVE()s

 arch/riscv/include/asm/suspend.h | 1 +
 arch/riscv/kernel/suspend.c      | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
index 02f87867389a..491296a335d0 100644
--- a/arch/riscv/include/asm/suspend.h
+++ b/arch/riscv/include/asm/suspend.h
@@ -14,6 +14,7 @@ struct suspend_context {
 	struct pt_regs regs;
 	/* Saved and restored by high-level functions */
 	unsigned long scratch;
+	unsigned long envcfg;
 	unsigned long tvec;
 	unsigned long ie;
 #ifdef CONFIG_MMU
diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index 239509367e42..299795341e8a 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -15,6 +15,8 @@
 void suspend_save_csrs(struct suspend_context *context)
 {
 	context->scratch = csr_read(CSR_SCRATCH);
+	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_XLINUXENVCFG))
+		context->envcfg = csr_read(CSR_ENVCFG);
 	context->tvec = csr_read(CSR_TVEC);
 	context->ie = csr_read(CSR_IE);
 
@@ -36,6 +38,8 @@ void suspend_save_csrs(struct suspend_context *context)
 void suspend_restore_csrs(struct suspend_context *context)
 {
 	csr_write(CSR_SCRATCH, context->scratch);
+	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_XLINUXENVCFG))
+		csr_write(CSR_ENVCFG, context->envcfg);
 	csr_write(CSR_TVEC, context->tvec);
 	csr_write(CSR_IE, context->ie);
 
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
