Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CB0C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 06:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v99Ym9m11vnBvLUN0n7xJwnxVYFwbhutz/5ArYQKtfo=; b=ULK/FpO8HoFdhZ
	4PMkkVCCg8pjNU7AdsrTF03qzDruvgVhvsy4jp4JmIkazryWsj14XKGbkgWTtt58eojFCNj6KWT0a
	Sx9yK1OLIzGfp6+QR1kbhl/+01QbP5ShfeX8bL4dJ67RLDgqnAYuiCOWgU4hxAlA0RyHYNptArNfX
	Z+XhGUNB9SB3iKQYLuDyZtGnnEGivRFrdEQFRAY76X3maNhjQNqyzefRtQ0CiGY8iaGywVhT3PBNg
	tL68wq5q3t91tupF3xHd6T12puMP8ZW4wyaC5OFBs83be4uQN2enuFcfsKcVTM1ArWYH8KbMUHazr
	6Hj0Ci7EaBu9DxoIUP7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rStFH-006lNg-0g;
	Thu, 25 Jan 2024 06:29:51 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rStFE-006lHn-1i
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 06:29:50 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-595d24ad466so3914553eaf.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 22:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706164186; x=1706768986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJDL1aQMYsZ6x2hXclmWD0oGcQ0Z9qLhCUiJhXHD6LQ=;
        b=ei/Of1Nur7Vzr8lX3+SkKnsivkSUvVxc1o9q/h7G5SPvgnEXl66ltWQipBjb3zqcph
         ceMPveKNgADf79FudbutZycsV5nP8kITstHClhN23yepXzsY5WwW1R/PLPv1ZbERyjBd
         IXAQupjVgSLBjAswBwJ4etDbN7dczSslrBkM/Hne+ZVAxcZpXNlgSWoAGb6KUrjm3fdH
         WIpvXcyeJ7JCpWVLhSJ1bTodMSv9geh2W/UgKox52MxtBFNSkkcNZFmKvWsvVmpSdeGa
         eSZ9pCNydOLfRGBzCRB3S2/G5mstrmL1CH+ETWY6JcM57wtIEMsY7ej+XkqduIwlpqhs
         30Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706164186; x=1706768986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJDL1aQMYsZ6x2hXclmWD0oGcQ0Z9qLhCUiJhXHD6LQ=;
        b=BZ+7FhmCN/0l+brnPPBY2Y+8HOS8HRR/xrNA37BbfvMja0zvGM0aFXGglXA3S31X4e
         mkFS1oj/OcTVYDQpfzmPDbT8ekuawmL47r0SOuH8aCCJwqNhRKZtJKUzeeruwxsksdyW
         Oaju9nzrQ/ZLWVDFMKaOC4W+jkWpdUsmPNzIzeNyqVKd9n0hMW1jLKrjtxj5AT6o5zqz
         oEotmKBSR7cusT0jogqtC8HB3alPKOZ7DzrBSHA1x/SDa+S1BZ6EJnkKJRqGJzNtgIR9
         py5TJJSBsal0WHiIoW2MmK5Y1vDaAQWJFZzVfwVD+KZ1XTx0/lOG1x389LPID4zj7AI3
         /odA==
X-Gm-Message-State: AOJu0YyrdXsEq7gTrBsDEITwa47DLk1T8K+t10G9vZVulE//bk1k70vP
	St1AlXIvedFSsjJnMHfqHSI/0Z6qoX+rbvbP51lHpTmfHIcP9jIdjdIdoZ3IfC8=
X-Google-Smtp-Source: AGHT+IESxe3nC4p6ceWk0Q/8i6vycGlmQHt1EYp+hk+MoL237ObbhpMDmBWtgjNemeeNm1tg7bXXoQ==
X-Received: by 2002:a05:6358:6f17:b0:173:33e:ec22 with SMTP id r23-20020a0563586f1700b00173033eec22mr487238rwn.22.1706164185725;
        Wed, 24 Jan 2024 22:29:45 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id t19-20020a056a00139300b006dd870b51b8sm3201139pfg.126.2024.01.24.22.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 22:29:45 -0800 (PST)
From: debug@rivosinc.com
To: rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com
Cc: corbet@lwn.net,
	aou@eecs.berkeley.edu,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	waylingii@gmail.com,
	greentime.hu@sifive.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	shikemeng@huaweicloud.com,
	david@redhat.com,
	charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn,
	willy@infradead.org,
	vincent.chen@sifive.com,
	andy.chiu@sifive.com,
	gerg@kernel.org,
	jeeheng.sia@starfivetech.com,
	mason.huo@starfivetech.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	ruscur@russell.cc,
	bgray@linux.ibm.com,
	alx@kernel.org,
	baruch@tkos.co.il,
	zhangqing@loongson.cn,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	joey.gouly@arm.com,
	shr@devkernel.io,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH v1 13/28] riscv mmu: teach pte_mkwrite to manufacture shadow stack PTEs
Date: Wed, 24 Jan 2024 22:21:38 -0800
Message-ID: <20240125062739.1339782-14-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125062739.1339782-1-debug@rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_222948_603390_ED03AE95 
X-CRM114-Status: UNSURE (   9.42  )
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

From: Deepak Gupta <debug@rivosinc.com>

pte_mkwrite creates PTEs with WRITE encodings for underlying arch. Underlying
arch can have two types of writeable mappings. One that can be written using
regular store instructions. Another one that can only be written using specialized
store instructions (like shadow stack stores). pte_mkwrite can select write PTE
encoding based on VMA range.

On riscv, presence of only VM_WRITE in vma->vm_flags means it's a shadow stack.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>

rebase with a30f0ca0fa31cdb2ac3d24b7b5be9e3ae75f4175

Implementation of pte_mkwrite and pmd_mkwrite on riscv

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h |  7 +++++++
 arch/riscv/mm/pgtable.c          | 21 +++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 7ed00b4cc73d..9477108e727d 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -403,6 +403,10 @@ static inline pte_t pte_wrprotect(pte_t pte)
 
 /* static inline pte_t pte_mkread(pte_t pte) */
 
+struct vm_area_struct;
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma);
+#define pte_mkwrite pte_mkwrite
+
 static inline pte_t pte_mkwrite_novma(pte_t pte)
 {
 	return __pte(pte_val(pte) | _PAGE_WRITE);
@@ -706,6 +710,9 @@ static inline pmd_t pmd_mkyoung(pmd_t pmd)
 	return pte_pmd(pte_mkyoung(pmd_pte(pmd)));
 }
 
+pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma);
+#define pmd_mkwrite pmd_mkwrite
+
 static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 {
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index fef4e7328e49..9b1845f93ea1 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -101,3 +101,24 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
 	return pmd;
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma)
+{
+	if (arch_is_shadow_stack(vma->vm_flags))
+		return pte_mkwrite_shstk(pte);
+
+	pte = pte_mkwrite_novma(pte);
+
+	return pte;
+}
+
+pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma)
+{
+	if (arch_is_shadow_stack(vma->vm_flags))
+		return pmd_mkwrite_shstk(pmd);
+
+	pmd = pmd_mkwrite_novma(pmd);
+
+	return pmd;
+}
+
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
