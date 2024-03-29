Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE506CD128E
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 04:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=84gGR2ScgPXl734SULQu5lumUYCkBEpq5qpOUD9Hfjk=; b=CL08tHQLJQ1o8A
	65pcr6kgEWMClzc1Dbm36jtxBlT19qpmp+Qpwgp/dMGc/KzF0Tq3uiHvgOOEGRXqPHqGmUQaeGL7I
	LyeqgIFoMLo9jxx0T0nnpDUTuv00HR+O2frv3sd9yobFXa+PytrIVSpgKAUwgEx2W67VJxFUfnukH
	C3oc+h0GFLph17uVOIPkEEISjep+gG4wTtQzjX0MQgZqsHncukMHOeZJjCn+BveDqO2HB6nj/ylRN
	zqVqLvZ9Svx63ge4rkdol0ovhF6OcPUdAFMDC7nZrxqMoCSo+8Zff4vd5I0+GTV+xyAyFY0g8UTuV
	r9gQQqR8hOHw0ONzhAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq49U-0000000GoMl-2AZK;
	Fri, 29 Mar 2024 04:47:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq48s-0000000GnuZ-2nmJ
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Mar 2024 04:47:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Qc6tDQVZMFWZI8yrez6t0wejTQ8xJVxgJAnHf9JsPCA=; b=KpWHocaKs+yGHneaCsN1GKBxDK
	E2WVIhAI9dxMvw6DZh2MVAnYh4DTe4OhVuEvf2fa8e2qrpiUf1/ChLsFN8ekANuGGNon9l125aqhD
	8ahrl9aGj1dT7Jz+XiJmbnj8ZJr2IxUiY6vYh78XuLo/saboYaCx/AbLu+9DH85V9sFjNVwhD82fs
	NhuEKFCOXvlpKOLor/4H45xilwZzxXHgq1xGMT4gcwIuEaxsuSlmAMFJTEVB6wOX0dEfBpN9WDWTI
	kRH5H8BfcQaiW5ZZq9aDhMJQBjF2o8yf0NsQzazAAMuRlMJn21B/0pvcbiQVMx8nD6a+KUbZGn8sS
	ZQox1T5A==;
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq48o-000000080ru-2jiq
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 04:47:01 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so1148280a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 21:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687613; x=1712292413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qc6tDQVZMFWZI8yrez6t0wejTQ8xJVxgJAnHf9JsPCA=;
        b=Fg+t5z9y3NJf8o8/vSI96YNzMaP2RYHuDVuqN7hiQ4T5inKm7TgV6thP8yE3ir4qoJ
         r8wSeaGhXXoE1oqltUTfAjf445LAj8RwddB7uMftseXjmgwjfKva/mBN0gaFg/dFPApy
         PIdrkYhdjctvgNLcEH/GO0pUFv2iGC49J0vpavoiv9qFoXG7GZfqdcfvAFhgS6mKc32L
         jujpeVXjN0AnW2MaSatNHW/ZdIdLUK8f42OY7D9YSTF3EiDNK3npn40ubv4cPRvMPSEh
         +sSk2pDcMZnaEM6kLrAN+Eu8M+Cx6PFgCvMSzNuKp6HXbC/iOj5BVAYS/K2KiaxI3lpV
         esxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687613; x=1712292413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qc6tDQVZMFWZI8yrez6t0wejTQ8xJVxgJAnHf9JsPCA=;
        b=QgjQ1dqae/MyP6rRcC9m2J28mXU4Q1O5DCBOELaFl4Ml3g/y9ZwRrhX4tLA5rauDwT
         RfYBjB4GA8RLoEZ19fobpzCOylzDU94grqBqHoK22KF7PiV0KZ9rEtY2XKh/qnbp91p5
         seEbb5qDBux+QyrRi5pzbjsUnbyHDxntyt27uRkm7nRrncOIaipPZwX3rDyo/kUggGi/
         MMHhlo9APKyWXsaWXvVLa/lOLz9ZwkyA17e0+zyFDtQOkszhOhKOlNiS2ZuZENZSBNXU
         ejP4NIhP8hU80Vm9FcUtTXG5DcNSHBaSx+bLSGN0RaiRJ8E/p9P4lFUvH9FltG1cxc6b
         jZfg==
X-Forwarded-Encrypted: i=1; AJvYcCWKfGT7+BM+oauvBX9Pl+QB3gjLbfzFE746LVP1vy1ORJ5NUwKLvwoKZ01ZWQKl+GvBgktoXZgCi443AdJmFzyzoBFfJrZcYSVAC+miVoIV
X-Gm-Message-State: AOJu0Yy5SEAGpwQGXCnaT0jg/6WxWDFy6mmf5SYtmseON8IJdpe+v26c
	NWrbCtG9ASzjQvA12w6MVXXqAtvWUSqUqfApeaERKe65Ju+eAeuhpCDF+CRnxTQ=
X-Google-Smtp-Source: AGHT+IFBk57ft/Dc+APgv9AeEcPOk/3EIqo0N/RGN7QySteb+aQBmtUdNC7Hb3LMWHIl2juUfBH7Ig==
X-Received: by 2002:a05:6a21:151b:b0:1a3:dc13:9146 with SMTP id nq27-20020a056a21151b00b001a3dc139146mr1392928pzb.8.1711687613465;
        Thu, 28 Mar 2024 21:46:53 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:46:53 -0700 (PDT)
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
Subject: [PATCH v2 21/27] riscv sigcontext: adding cfi state field in sigcontext
Date: Thu, 28 Mar 2024 21:44:53 -0700
Message-Id: <20240329044459.3990638-22-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329044459.3990638-1-debug@rivosinc.com>
References: <20240329044459.3990638-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_044658_754116_57297E17 
X-CRM114-Status: UNSURE (   8.65  )
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

Shadow stack needs to be saved and restored on signal delivery and signal
return.

sigcontext embedded in ucontext is extendible. Adding cfi state in there
which can be used to save cfi state before signal delivery and restore
cfi state on sigreturn

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/sigcontext.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/sigcontext.h b/arch/riscv/include/uapi/asm/sigcontext.h
index cd4f175dc837..5ccdd94a0855 100644
--- a/arch/riscv/include/uapi/asm/sigcontext.h
+++ b/arch/riscv/include/uapi/asm/sigcontext.h
@@ -21,6 +21,10 @@ struct __sc_riscv_v_state {
 	struct __riscv_v_ext_state v_state;
 } __attribute__((aligned(16)));
 
+struct __sc_riscv_cfi_state {
+	unsigned long ss_ptr;	/* shadow stack pointer */
+	unsigned long rsvd;		/* keeping another word reserved in case we need it */
+};
 /*
  * Signal context structure
  *
@@ -29,6 +33,7 @@ struct __sc_riscv_v_state {
  */
 struct sigcontext {
 	struct user_regs_struct sc_regs;
+	struct __sc_riscv_cfi_state sc_cfi_state;
 	union {
 		union __riscv_fp_state sc_fpregs;
 		struct __riscv_extra_ext_header sc_extdesc;
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
