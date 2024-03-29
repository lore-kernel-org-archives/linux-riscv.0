Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13C1CD1288
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 05:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NCYS5M4Wh7T9ybSFBXMNQjGHIkVS+gPN3f2s9Smxa9M=; b=v64yzFzShzNpZd
	HqKSviSNZg6NZSVypWQSFbbejuA6o72yg/UceiDmEhcbgmaSPSzhPleiJHXx4wuT0oJt455Jh6AiF
	aTDxj3Cz2bAPEGjv70gwvhZRMlLyw2y7rfqk8HWPF2TSaAM9k0or8aKWKMzhLyA0Q/djMW9T28w8g
	NNm0Xj8ocDQQpfwWJIt2oJdInyGEd8hEQ4qL8l2Jhhfhd2vhY5P2fJDc6A9Dh50tbRjSGXzTYr01O
	rTj9QssRJOUJqNXUlYU1bSgrtHrUs2/FcA9xbIA3GPlvZbxWBX4FTe/km/dYYS0JFIOB2iMZR4cPd
	XsF5AftzUmHISmBKb0+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq56u-0000000Gwel-0n8q;
	Fri, 29 Mar 2024 05:49:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq48A-0000000GnSf-1W8H
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Mar 2024 04:46:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=T4DMhRzx46RlnO0Cr4Xo2ac2UzARWIzMLM1MQTYcvtg=; b=AIU+NJ45be4n61n91qOYfT8+9+
	YL5MYFVFnhsXUXOVnxRBtpy27JfsIqkDFsjycnvigra+yA4ozaADZpNbGjSCwQGG6OdcoL7FfvEDn
	FXeJ9XD1tSomOs9c8wzlUUEXV+tjWTVVx9ZV7xTP5I6QMN8ahIJTeyq8pKUK1tByBbfM2G+lNn5Hu
	+YO2idBpBzJD5Inqx7qIYnkwEYZGxLplRwcXt5m6p271CPUkcNb8uyk14Gz6HmUvKCYYmseQp0ras
	L7YmCCn0y92LyRXVLrNFq2oIeXa/a4KRFqQjVVMqv29G4W/mTN+kIjocYV1MnNRwiE2izVlZE8OBx
	2G8r5kSA==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq486-00000001MM3-0lvi
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 04:46:16 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6ea9a605ca7so1248164b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 21:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687570; x=1712292370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4DMhRzx46RlnO0Cr4Xo2ac2UzARWIzMLM1MQTYcvtg=;
        b=dIkWY/DZ92A73oDenc90/62keIRMKm5uVfhHpGEB/dsqKZqinVAV3ikNC8P1aEND60
         //R6d5bR5MalRw+wViVa9MVyD65qX1LqC14bDGmosAxHGEMXrsVtq9koD67ium11697Q
         Gdyt3U29IckvHaVqgNbVg+cwD2kX3k1JfNDRjqWQLHzbu85wTfkYXttw7h5Q2QuQXwPp
         6NnXxjSfiFTUPfiBvxwLApVmFCZQkgF6uAMg2ViM8PPBT1bFEb0OfQMkCWGN5ouWnE1E
         f4M3b3F7bwCrTqkJp1d52fdcSVa/qlkD0zos04hVSMg5vvQA5OZMqGDw3ZXf6op22mEV
         Xqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687570; x=1712292370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4DMhRzx46RlnO0Cr4Xo2ac2UzARWIzMLM1MQTYcvtg=;
        b=uorhVYIONMoa1MIcGfrXduDRPvvblMIjQ8zQuXJDkjGak6g8Nivl5D9Sz218gaAe4J
         TH5og9Ic2iOlYvMU1xeOBMMTwPy5A/egVtGqs1lIbugTii3unIkf825Kwiqxo4TVpUGF
         pBOKft18+PhUbsucAZpTz2LS2Dg/terVX01rhXKNcF0yCP+c4FV/dKMyX/jpa5Qkqe88
         22+ibZBcnX2it/euu7QKdTGuMCGYe+89Sg2wDbbQkmVkRp1KY0LaMXzWZ9td5bFfxC2A
         HGFMgzgdXqjViUyNcobbdG6gOd2BO4LlrgqFDFDLKHkMrbUCqAj6XE0OGqkrjKm5addd
         ERLw==
X-Forwarded-Encrypted: i=1; AJvYcCVnHxFSp30BXAkjzDsFXmCtWijbr8aFE0X2RoaqNmPcA2zA3J5QInaGJ6cbFg5PbB0gLdqmWhJZ/G0qSphA6lMq6qkBkxEzuMPVJRV4mDlF
X-Gm-Message-State: AOJu0Yx+BtM9Z7XWZ1j6mtGt/35kSESNIqLn4j8A9RAmjWA4DE8V4fU6
	Oun0etnpRgGrIGKx772c7hk+kAlkXF6U2F9IsB0q3QT0A8KBrVshWZbHDdwBx4Y=
X-Google-Smtp-Source: AGHT+IHO8nERPTyOdDNYqVk3BGsMD1zsiX2YsaTJD0v0/gtzyZaZ9G+70tI4pNq8Z6R8uDRiI7Pabw==
X-Received: by 2002:a05:6a00:4b49:b0:6ea:b606:6548 with SMTP id kr9-20020a056a004b4900b006eab6066548mr1848385pfb.7.1711687570371;
        Thu, 28 Mar 2024 21:46:10 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:46:09 -0700 (PDT)
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
Subject: [PATCH v2 07/27] mm: Define VM_SHADOW_STACK for RISC-V
Date: Thu, 28 Mar 2024 21:44:39 -0700
Message-Id: <20240329044459.3990638-8-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329044459.3990638-1-debug@rivosinc.com>
References: <20240329044459.3990638-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_044614_396794_05E9914A 
X-CRM114-Status: GOOD (  10.26  )
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

VM_SHADOW_STACK is defined by x86 as vm flag to mark a shadow stack vma.

x86 uses VM_HIGH_ARCH_5 bit but that limits shadow stack vma to 64bit only.
arm64 follows same path
https://lore.kernel.org/lkml/20231009-arm64-gcs-v6-12-78e55deaa4dd@kernel.org/#r

To keep things simple, RISC-V follows the same.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index f5a97dec5169..225af437ecba 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -352,7 +352,25 @@ extern unsigned int kobjsize(const void *objp);
  * for more details on the guard size.
  */
 # define VM_SHADOW_STACK	VM_HIGH_ARCH_5
-#else
+#endif
+
+#ifdef CONFIG_RISCV_USER_CFI
+/*
+ * On RISC-V pte encodings for shadow stack is R=0, W=1, X=0 and thus RISCV
+ * choosing to use similar mechanism on vm_flags where VM_WRITE only means
+ * VM_SHADOW_STACK. RISCV as well doesn't support VM_SHADOW_STACK to be set
+ * with VM_SHARED.
+ */
+#define VM_SHADOW_STACK	VM_HIGH_ARCH_5
+
+static inline bool arch_is_shadow_stack(vm_flags_t vm_flags)
+{
+	return (vm_flags & VM_SHADOW_STACK);
+}
+
+#endif
+
+#ifndef VM_SHADOW_STACK
 # define VM_SHADOW_STACK	VM_NONE
 #endif
 
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
