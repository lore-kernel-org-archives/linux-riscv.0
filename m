Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DC2C6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 04:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=72ioLnXSE75ITYxIiXRvOBS5/WFt8aP2SSWh00uj1N8=; b=yFYqks5YyW/o7a
	mN+pExobSHXCY7bkS1lwZwQQvfwwgAhrE8sVJQ8Wwrcy0CGZphjxznR0DNTkWgWtXy+ODhadqbGGQ
	zeFEW1tmCGkMlbxwzaVXdNvxIPWjRP6r5eAsJB0yRNiawUllaY4l4jkaHI3ieaVJ9kiIQ45kVDb6k
	9IJCind4GMObGGZgcvFJ2edS2R2w+Sf8RzgmPt/cF0UeXUfIioSF0Xc3vUkIcWYODwgFumoLYMxqp
	keQmxza2U7lDNGqQZf5PINaL51B70qLnlLmJnejFJRF6FB5+De9st0qZdy8BPf4IyushvU4GgA1k2
	gOPoQb3tLnGcFOzc6WFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq48u-0000000GnwY-3nIU;
	Fri, 29 Mar 2024 04:47:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq48n-0000000GnqW-3fDT
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Mar 2024 04:46:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+jzaUmiaVJT+7AndpgdFUVtlaA8dH1VTGpl1Yp0ZHRo=; b=Vdq3QVWWx12QSa0ueuriuTEvVs
	doxk8j00BHmjbT9wOREzFGIobNJSe15sx1j8jIaxDzvjyZdJ0ZbtE/sTLjfyfu+GL8p/u609eADyu
	XKTTXJBLGOrXb8KxdWMk3REbxFzv0O7Iyos61PrO0Bm6KR/gw3QxgLbCc6cKNGdg7x47LPe6XFtRD
	FQftjn+D7hwq30BiA2rG6kS2I8GpQkcpGoHh0EoY4tBsruK+yeVSpVqCEWuEO2X9KiFxTXoD7Ub+a
	RY2n4Y/PeN4kFs1V2v7yRegb6FzVQpAjaPgojKAOz8QgRTyLitYR0AleDnsgYW3XU1Xe9PwnNlxM8
	nwdEHk0g==;
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq48j-00000001MYk-3hwt
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 04:46:56 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6e6b22af648so2012849b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 21:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687606; x=1712292406; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jzaUmiaVJT+7AndpgdFUVtlaA8dH1VTGpl1Yp0ZHRo=;
        b=1MMNmKbV28viBr01qk2A84jCA8JAth1BpJaZ+uFmp/S/6XiglD8tRjemgjMUCzqX8b
         jcOWufB17SfrZPmxf/PDIwbVU6M53COYAvDw9gRExEHdFnC/DwFFLV/tISc3UQPeHwJk
         u0CW2QdhkWb/wJFVaZ6cm7ruGd5ZOUW2is3FRcV6cDbdGlI6PvOJDKJoZqFyhhux5rHX
         lhSRw6abhe9hB3K9lhOTf32zgQoWrUomaWZP3jfVhVnzqmGtNzAJOF/lKswad6spAgjJ
         jraO1ZiYImE5SSGtNQFV+ZnPYx2d06npE9Ta2rWbC4GG4aL6aP1Lp5CWV6nLKv99Aqw5
         mQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687606; x=1712292406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+jzaUmiaVJT+7AndpgdFUVtlaA8dH1VTGpl1Yp0ZHRo=;
        b=VK/4ivBpmbYc+LDC5f6m0odU1JEXRrG2i/7hRC862+yd+mm/qaD27v2q+Buo5AQGwz
         8+AFCXWtu9llsXQoFaSkagn8XpFnhFejYYNBJgtAD/N0/CSWpoksMBh4dcfGcH4v8hc9
         6+Hwmlnd11n6e/x3JDphBVot2vxA16ZbnZFBX1EN1sC6x7DFwns96XtJI6uMvBjBtCA/
         ovuDEQ+WMfjuYsRTVmKteSeBAEbEELwG3basA/XMOzO3a/9ocXvk1uQyjBrPEBKJ5LQ3
         rCyo2fgOWKTQj+s70qGxKXC1eBoi4mt7wTIJ95Xb7eApcrs8VwoDpddJeWOlVBCJ6hRZ
         ME6w==
X-Forwarded-Encrypted: i=1; AJvYcCVBO9I1T/P2NzYkIPIXXiQNwRVR0Ec1EYMvJmeUj4VDedv0WNWcK5qADVwyEyTZ8BF6Wwh45TFlTBCew8uofom40juCf68SVg9E9pMJyI8c
X-Gm-Message-State: AOJu0YyE2q5p4++uuGyHQUleR2+M158+TJYbJ9cjXsJZGkPTHxvI6NnP
	ZwTnCvjiZZ29bJKwhnRWKaxrhLJ5/ak+Jv85pdgOr+1rYgZ67Bwrzel4V1/nZJk=
X-Google-Smtp-Source: AGHT+IFw+iNT/fZ7ZDIngivJRJR8RkOVDCFWMSifsiSz96HEhcDTVYzJoolJ7eKeIz36X1Q6OzEzmg==
X-Received: by 2002:a05:6a20:8414:b0:1a5:6c7a:a60b with SMTP id c20-20020a056a20841400b001a56c7aa60bmr1845203pzd.11.1711687606505;
        Thu, 28 Mar 2024 21:46:46 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:46:46 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: corbet@lwn.net,
	tech-j-ext@lists.risc-v.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v2 19/27] riscv/kernel: update __show_regs to print shadow stack register
Date: Thu, 28 Mar 2024 21:44:51 -0700
Message-Id: <20240329044459.3990638-20-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329044459.3990638-1-debug@rivosinc.com>
References: <20240329044459.3990638-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_044654_219865_350EEA1C 
X-CRM114-Status: UNSURE (   8.62  )
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

Updating __show_regs to print captured shadow stack pointer as well.
On tasks where shadow stack is disabled, it'll simply print 0.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 105ceb8880c1..97c812753c9c 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -89,8 +89,8 @@ void __show_regs(struct pt_regs *regs)
 		regs->s8, regs->s9, regs->s10);
 	pr_cont(" s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
 		regs->s11, regs->t3, regs->t4);
-	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT "\n",
-		regs->t5, regs->t6);
+	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT " ssp : " REG_FMT "\n",
+		regs->t5, regs->t6, get_active_shstk(current));
 
 	pr_cont("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
 		regs->status, regs->badaddr, regs->cause);
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
