Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC4DCD1283
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 05:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BkKbD7uyguiv9Udh71kQeAal9UeZETM6mm7YQYhCjy0=; b=44LyX4yeo414gS
	JikI9zH10H3s7PQIW9qdSgjXXnOJ4WlBEpVDAHJFntfPeyq6ffw/r+NpoHnBvzGKL6iEDMTO7V1PM
	LRIRY6lAzSPMWoazV/a9kVCuSo9RDsd3yJJF9ZKHu6p1bZO2lvgpU9DTcrabuwO5h5y2O4UgwQfzv
	arJnT/fpIL7pl2MZZkuttgqisF1bRjzgumvK9/ZEqDVNGenecPw9AAkf0+t5XtkaRllVn5KC03K9+
	q6r+nfPQWSItpQaPLv3LoAJRHdZztQ5iFy8cPHiwzZ9ucRy7R58RkdbEzFzpCPj20/U40oYJpWnRz
	jXE4mFNaf24u59UixYKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq56v-0000000Gwep-0Lvm;
	Fri, 29 Mar 2024 05:49:05 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq48D-0000000GnUi-1ID8
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 04:46:23 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3c3d7e7402dso1225032b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 21:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687579; x=1712292379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1ajd+NFF25bzcoUpj6TOVq3gYUXEAPUF2iej3ctG8E=;
        b=oW0up7Wrs0CILUJE80GwI+KRTINfbM2b3/7Z8sVD77imbK4FzZ7l6hEZtIjOlPBhKn
         hcTRTj0zD+08Sn5ah2rQb+lC24weod+NGvpsoAD8gXIBXnrhbBcAE7a2PV8RZIBGP+yZ
         I6fLILbZfGfPiL+eqr83tz8Dry5xstvoj2++h364DIudVPYjKSPNFhGed1QAgu9edwpB
         Fs6kn5LCfArhPMiIgg7y++Y66GYz2DXppKWzfmvhDy+0v5BkIQf6R7lUudq3X75wdazK
         uQ4vvs50AFP35B7frBICWeexyGh9MMvmofnwUv8WoIh/AKY17qoqQ76IHvqjUa4bpViH
         RdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687579; x=1712292379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1ajd+NFF25bzcoUpj6TOVq3gYUXEAPUF2iej3ctG8E=;
        b=LGA5BRuPsxnTlbRXizdRmTX4zorLvTwT7cypfPAuxykmMzA7ziYyzl59MUV7PlkGv0
         mFvVU8sG22xNWCLlFIleb5Ygbda/e4wwPJZhWO0pIInO70FHIhZTIXwybhovgyymK70n
         vfPZc7Eg9jQ5GK7tq1iagdny0gU/SKY2TQRB4RTO4I7AS/FooOoIuiViaOBf/1+NmLQZ
         SvSNDs37z1REoVe2kcKe9jIUK/nBkuXtrsS6JettKo+l9lNhRG0SnQCz65YjB3NOXF69
         Rmwcdu6nSAfXBvdhfIMAdIGmIIMRY2GiOmXJCryw2aTNAL0VEhWaoz/B5/h1P+8kfsmG
         pGKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUatsQVR3NUYHpTiVZALmWw8bJBWv0uSUhh4+zR2BKtIZ7qM1BuH7L9IInjr8QF+Qmyk6biVCoZQ2fF3thywC+M6IsM1LzZy8zHm11Oxy//
X-Gm-Message-State: AOJu0Yw7zkow0hqU66kUomIJ9nzstPcFZe1SVxCSFdlcE9t0m5TdgiAr
	sSNITFyUgNSSyR3R757zukjk3BUpPqzuudBec8OGCx5MNJx277U77npmYn0HO0E=
X-Google-Smtp-Source: AGHT+IH3K7i4PAKAFUMOdgNrbbbhpm+48RguclKkN/rSLzo7SW0Yi7+dWUtv4WvqoPHa2AHkl7gVfA==
X-Received: by 2002:a05:6808:2126:b0:3c3:ed9f:7e65 with SMTP id r38-20020a056808212600b003c3ed9f7e65mr1522250oiw.21.1711687579203;
        Thu, 28 Mar 2024 21:46:19 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:46:18 -0700 (PDT)
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
Subject: [PATCH v2 10/27] riscv mm: manufacture shadow stack pte
Date: Thu, 28 Mar 2024 21:44:42 -0700
Message-Id: <20240329044459.3990638-11-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329044459.3990638-1-debug@rivosinc.com>
References: <20240329044459.3990638-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_214621_487153_4FB7CF26 
X-CRM114-Status: UNSURE (   7.70  )
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

This patch implements creating shadow stack pte (on riscv). Creating
shadow stack PTE on riscv means that clearing RWX and then setting W=1.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 4d5983bc6766..6362407f1e83 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -408,6 +408,12 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_WRITE);
 }
 
+static inline pte_t pte_mkwrite_shstk(pte_t pte)
+{
+	/* shadow stack on risc-v is XWR = 010. Clear everything and only set _PAGE_WRITE */
+	return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 /* static inline pte_t pte_mkexec(pte_t pte) */
 
 static inline pte_t pte_mkdirty(pte_t pte)
@@ -693,6 +699,12 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
 }
 
+static inline pmd_t pmd_mkwrite_shstk(pmd_t pte)
+{
+	/* shadow stack on risc-v is XWR = 010. Clear everything and only set _PAGE_WRITE */
+	return __pmd((pmd_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 static inline pmd_t pmd_wrprotect(pmd_t pmd)
 {
 	return pte_pmd(pte_wrprotect(pmd_pte(pmd)));
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
