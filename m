Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C0FCD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pnG3DEG8uA/tannbvGfpr3qjrZ9CUm6HW2yoVgLXugI=; b=v0kvi82BeC9pJV
	HP5tl+hBJm+xmorq0FWvv98dX/aTa0YfuQ0X2ofUkksolilizgwwEXYaKxpa9eU8uyA6cr4/p75LU
	xZnuBpUdztv9Zp/XdVWlWiAgiNIJu3cuv3l9IZILhJP6wDc1sWGu0OMZDItqoH+b/5z1ZZT/2MBiM
	Ce/gSHd7n9FLICVaPve6AE2Gt6lSuuQh2NbDOjCbD8RMiZKSyO45FiJmWpIDuXhvHr9o3XnjgFz5i
	KNiDYqH6esUr8G23xQEjSENLBVf94rx2FSHMARlW4RvAm3ed40KUpUmM9LANvrfvNXW+0CMGRemNo
	X0ESJ+ZjcDDD6AFOVziQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAF4-00000000ZlA-3khf;
	Wed, 03 Apr 2024 23:42:06 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAEr-00000000ZWh-0rg4
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:41:56 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5cddc5455aeso353437a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187711; x=1712792511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABpeeFCkULjAH2+wvqdO28185Mvpk++2Yk/j/QF7GJ0=;
        b=jUHpaXBHE1cGeOWysVwFDrWI9CfszSU1jfohzPzjU/giPExIslPA0Ns4A1+LN8xFuF
         aOqSLEnZsWCegqdgxUNMUdFKitzQxRiUkVnIr0YrHH7rWElNLWX4iLDDhe7UjB25Rz5D
         jOUF5HcZaYlH0NU3c7TUwQscnJI9nVITGeoSdpAG/jASy/BmEOTpcW7/ERoXP7/OgKbD
         7KDxSugG26+bOcCmh/e+4IoxOLMy/wX4tYPEHip0/0XGoH1tbJaerZCugZlZGHyXhpqm
         bG5yeePqzLJgCVWjOYfdZrWSxoaLmr2+anGW5QcUr842g/19HU6qOlbb7fzwqZeS4XsA
         aing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187711; x=1712792511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ABpeeFCkULjAH2+wvqdO28185Mvpk++2Yk/j/QF7GJ0=;
        b=UkLHI80PkaNZjwuK8lfPbnli0A3YViGysbqu6YFq7ZIcRFQvsRowhun+T+nk3KkVy3
         46Pyy8fSqgtjLg6m+fTVuzppxCvJy0JttIsj/Ax8NGr4MF8ktS5n7nDeulcC1KI4xQkK
         Bp/WELlUXDCRAxuJV9kD4OYAglZWq024EoNYws3hc2akRH+AegXoWpEcPZ+3i9qq5ycV
         3bo06Ns2K4GSfTtaqRkzeeeYabPkZkpwh/uEil1TqKBm4XieYtLcqaDsssCBMTX8zplN
         O/iClnJs+rFGgNqK6uvgMvolpGBwd2n/sm0lbPD00uCfFIJ2k+PsSMYAOEePw0o30kfO
         aWHA==
X-Forwarded-Encrypted: i=1; AJvYcCVfF6w+SR1mz1pPzelouwdAOk4iGM8ztAQCKxcLGqHzBc3keSZR39m/n0kEkXp2bUQ47374MWPwoNucnpQmT6uUH2QCMAh9zgCwgmHO0du5
X-Gm-Message-State: AOJu0YzJ0jSE4IGBCtP+0PrhgwZ9chTukGz6Lp4oVh4pTzAX6THrNpIv
	ckiV3wAmyJ2mnqDCqeYhjQjlD//jS6tvJ5sb+/aPFeo8VRyMs0mAxnQOc0nlbxY=
X-Google-Smtp-Source: AGHT+IEuPdJ9+VZyZuaG1MlOsTEyLTpxiJH28qDOFi58HVozeCfEc+yN58hPfTIqNV3cM5o/KXJ7iw==
X-Received: by 2002:a05:6a21:339e:b0:1a6:f8cf:1e23 with SMTP id yy30-20020a056a21339e00b001a6f8cf1e23mr1102834pzb.41.1712187711360;
        Wed, 03 Apr 2024 16:41:51 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:41:50 -0700 (PDT)
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
	conor@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	corbet@lwn.net,
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
Subject: [PATCH v3 08/29] mm: Define VM_SHADOW_STACK for RISC-V
Date: Wed,  3 Apr 2024 16:34:56 -0700
Message-ID: <20240403234054.2020347-9-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403234054.2020347-1-debug@rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_164153_481855_3CDD1A8A 
X-CRM114-Status: GOOD (  11.45  )
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
arm64 follows same path (see links)

To keep things simple, RISC-V follows the same.
This patch adds `ss` for shadow stack in process maps.

Links:
https://lore.kernel.org/lkml/20231009-arm64-gcs-v6-12-78e55deaa4dd@kernel.org/#r

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 fs/proc/task_mmu.c |  3 +++
 include/linux/mm.h | 11 ++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 3f78ebbb795f..d9d63eb74f0d 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -702,6 +702,9 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
 #ifdef CONFIG_X86_USER_SHADOW_STACK
 		[ilog2(VM_SHADOW_STACK)] = "ss",
+#endif
+#ifdef CONFIG_RISCV_USER_CFI
+		[ilog2(VM_SHADOW_STACK)] = "ss",
 #endif
 	};
 	size_t i;
diff --git a/include/linux/mm.h b/include/linux/mm.h
index f5a97dec5169..64109f6c70f5 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -352,7 +352,16 @@ extern unsigned int kobjsize(const void *objp);
  * for more details on the guard size.
  */
 # define VM_SHADOW_STACK	VM_HIGH_ARCH_5
-#else
+#endif
+
+#ifdef CONFIG_RISCV_USER_CFI
+/*
+ * RISC-V is going along with using VM_HIGH_ARCH_5 bit position for shadow stack
+ */
+#define VM_SHADOW_STACK	VM_HIGH_ARCH_5
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
