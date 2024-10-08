Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64206CF0429
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 22:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C3MK3WgiyFXNa4TTkCJb+BHIbVq4ftExJR7utKL6EEw=; b=rzNG4Q53izrwLF
	j7YvaHPNmUzf7GcNvlPBefoiBI33T8J19gdA0TU9JxRwavaZmqd5G8qOxcBObl6LRwnPQJPe/iCWQ
	LT0/QD7h6kkZoD0th+msyXRiZ/W7uoCgvae+qRkZNPSkep9r9fux0IEYMqg58CWIjjc3XlcI7bodX
	NWTeSnsPdanhQziaDJbJxXEKl+gt8Yu1vq+zEpJ2fjWwlM2c15qbQQ9v6JD35phZOJx9DRaVy/P3a
	coBvSKJeX6cExWKjkXFHVJScaIlKidnO1cjErPLV53YyTCt7jekJuE1NJth7IIS0P4qtoOZwqYG8G
	Cp2WPYNbSUgtk7pxAd2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syIq2-00000007IBp-0Z5r;
	Tue, 08 Oct 2024 22:37:54 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIpy-00000007I8K-3I0k
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 22:37:52 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-71e1a715c72so554394b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 15:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728427070; x=1729031870; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcb1JUl7nxyzCR2L+K51gN2ROJJ8XrFInAPZeivTlr8=;
        b=OBVIPmxMAVtt8I/NJVQwolMlBykRWRPjn3nvzlSULhR/BDdo2RVztYN+G6mwZN9iek
         gb4DsYzT9SjTBdIClMS5bTF0ZGYGzynieXviXHSB1HajAjOmWXx/flbMJ/ClgVuyvHf4
         DmHKJztb/K6IqrPyjSWQz4RsAe0/stQBQCuMbKq2LRhpIragRXaxQwm0oEr2Ec8iJthy
         LPKdpk/VYDKmJAyZE3wBI2RfUsUI4Md6p9SCR/RvBSVGtLWRFU/2Nn/KpX6CUEy6q/oF
         VrYXrY5nznCGiIqbJSIhAsNkVJNwDkKPR4IdQNUMX69Z8cigWV4BvrCSCvIaS8YxsTUH
         iPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728427070; x=1729031870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcb1JUl7nxyzCR2L+K51gN2ROJJ8XrFInAPZeivTlr8=;
        b=tiDkc0uEpFlFTFH6OSTbH5bN0NAcaFbC7Lj5O27vIqq983dhzKd3aDHQMDTnyJT9qG
         gP5eVhqbTCDA4Dycg3cGWcQFvF5sd/s8yascU54TwBzstRrJKft8luQtXvibTLrZvCVE
         LoEuroeHsiXSnt+EiFBAur0rBtErODINa2Si8SPNA2PyVG64oFYadLJLwoklMXueeGNw
         pROcWd1xEdKpiSkYiSNIEMMYv+89uRlo8uv6rBEplD/xuVESkHquzG5QI5z09krbmyZC
         RPYm5zadSg4/GgUBGP2bFQKoDgHqREP+pdUjmGw8seJY/mfA0pOyfXN6yLriVELTianS
         jgmw==
X-Forwarded-Encrypted: i=1; AJvYcCWI91Dz2fnZQZWnQq2ma4P9Oq7hjwbdKvxs4K+Imj/PTF/UbbsSup7uo1/HYaY6seOwTKNKBbQBmqFhVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTcKfAeXOEN6F2Qste3qER5yG+PN4dKbQpLPaOk84I6Q5ju9jG
	xGeaaRRj/+EiPKUb3ekUdgJ6+8LEczHiX7HmCNxCNUr+jC7bk8tYwlAweQCuwjU=
X-Google-Smtp-Source: AGHT+IE5CiqwVffKftT0HA19xNjp1IZD35v50IRAA/ePwNS8IKwtnn3GofL/f9wWS1jXg+8c2GVgUA==
X-Received: by 2002:a05:6a00:a8c:b0:71e:210:be12 with SMTP id d2e1a72fcca58-71e1dbb87bdmr617949b3a.21.1728427069795;
        Tue, 08 Oct 2024 15:37:49 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccc4b2sm6591270b3a.45.2024.10.08.15.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 15:37:49 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 08 Oct 2024 15:36:43 -0700
Subject: [PATCH v6 01/33] mm: Introduce ARCH_HAS_USER_SHADOW_STACK
MIME-Version: 1.0
Message-Id: <20241008-v5_user_cfi_series-v6-1-60d9fe073f37@rivosinc.com>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
In-Reply-To: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>, 
 David Hildenbrand <david@redhat.com>, 
 Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_153750_913723_3C705386 
X-CRM114-Status: GOOD (  15.00  )
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

From: Mark Brown <broonie@kernel.org>

Since multiple architectures have support for shadow stacks and we need to
select support for this feature in several places in the generic code
provide a generic config option that the architectures can select.

Suggested-by: David Hildenbrand <david@redhat.com>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
---
 arch/x86/Kconfig   | 1 +
 fs/proc/task_mmu.c | 2 +-
 include/linux/mm.h | 2 +-
 mm/Kconfig         | 6 ++++++
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 2852fcd82cbd..8ccae77d40f7 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1954,6 +1954,7 @@ config X86_USER_SHADOW_STACK
 	depends on AS_WRUSS
 	depends on X86_64
 	select ARCH_USES_HIGH_VMA_FLAGS
+	select ARCH_HAS_USER_SHADOW_STACK
 	select X86_CET
 	help
 	  Shadow stack protection is a hardware feature that detects function
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 72f14fd59c2d..23f875e78eae 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -971,7 +971,7 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 #ifdef CONFIG_HAVE_ARCH_USERFAULTFD_MINOR
 		[ilog2(VM_UFFD_MINOR)]	= "ui",
 #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
-#ifdef CONFIG_X86_USER_SHADOW_STACK
+#ifdef CONFIG_ARCH_HAS_USER_SHADOW_STACK
 		[ilog2(VM_SHADOW_STACK)] = "ss",
 #endif
 #if defined(CONFIG_64BIT) || defined(CONFIG_PPC32)
diff --git a/include/linux/mm.h b/include/linux/mm.h
index ecf63d2b0582..57533b9cae95 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -354,7 +354,7 @@ extern unsigned int kobjsize(const void *objp);
 #endif
 #endif /* CONFIG_ARCH_HAS_PKEYS */
 
-#ifdef CONFIG_X86_USER_SHADOW_STACK
+#ifdef CONFIG_ARCH_HAS_USER_SHADOW_STACK
 /*
  * VM_SHADOW_STACK should not be set with VM_SHARED because of lack of
  * support core mm.
diff --git a/mm/Kconfig b/mm/Kconfig
index 4c9f5ea13271..4b2a1ef9a161 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1296,6 +1296,12 @@ config NUMA_EMU
 	  into virtual nodes when booted with "numa=fake=N", where N is the
 	  number of nodes. This is only useful for debugging.
 
+config ARCH_HAS_USER_SHADOW_STACK
+	bool
+	help
+	  The architecture has hardware support for userspace shadow call
+          stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
+
 source "mm/damon/Kconfig"
 
 endmenu

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
