Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EFDCEACE6
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 16:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Af3ZoEluX9rdoWh1It02JHhsyqzMtiriorQhNVpsPY=; b=fICRJyve0z6y7k
	qmKbRLG49BM207U1YIUTsB8QIWjdy5HsvId76D3aD13QhvlRXr6eDbYtlQ93VbPkiwyNMtFRAelmb
	A5wn1Ux1iEzgQ5Fb/RUc+9vXl4JfOv3XHC7wdN8gw1fOur6yk9rtmH8BSUeIQibBn0msDU0PdsRlq
	6b8I3tNdoDkIXJ0TbYe4UdSDh8JZnvE9ynlpssPpMjdRd4lZuHN/oaBqT6e+B7IM7bSHhjmkN2LJY
	MO6LrY+t0xVgyBw7oHJTBVV9ysstg79JMhc2/avzFNlLf0cGaOzmCOe2iG6yHHidkOEihaNxlVDJI
	k4/0x3YKiuiDY0qc7mSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svfbX-00000003VNL-1XWe;
	Tue, 01 Oct 2024 16:20:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svfP6-00000003Qtd-2UDg
	for linux-riscv@bombadil.infradead.org;
	Tue, 01 Oct 2024 16:07:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OwXMBbOWCv06xRC7kuAtikxfL3CuNBKfrSTtPkKqEqk=; b=Wmg4ihqQhxFASt2v5gTobuOdKS
	tKHlwFJWhfEknjbVNSpn6Uk+VthNv/pASkYB5kZnZZBp4lAdneOXHSOXpmYCqU4cSbo+Y2VpGEQtb
	x/781L7T1bhAJ7I1Hf2i8BlxgPehMBddDsTp4dcXK+DZga0FWiCN3sD+hdOk5s9Ozn0KTtj2u1D4B
	4uezrtPl6SFfc+rwPzJAXkNsirHElCkrGASWl8qlPJO3LmQTUslrn6RjLMmIOI5bknI/SpD1rUOY9
	Gi26j0HojIq4zW84RfEdlx7sSRyDtRfB3TCS3YDYwv2ncNXXB0MWUp0MNs46R1QFtxgYXpKwm/VF1
	qhMu/aKQ==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svfP2-00000003Bxw-3nut
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 16:07:11 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-20b0b5cdb57so45641435ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 09:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727798824; x=1728403624; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OwXMBbOWCv06xRC7kuAtikxfL3CuNBKfrSTtPkKqEqk=;
        b=nD0SmnHpeU4lx2PaxWP1LgkNZ7/WAHDyUqpkv3+4LWWfCCwSk7lVIUzbfX7R1lXQaw
         WOL2vub1rWiOhFTV3QmzQGUJxIi+n+XdFKbQfXI6DqX5t/8ioxyRGpKsWpToFWwT5X85
         25bIsh/f53DJ/oha2YKvZVbpZtr6CJfRggU1AVyaIAA9/d7xjv+LocKbxP0QAW/M9sbO
         M8wz2Fo3ursRQpRLVKjAqQQp9Xx+Z2Nm+QgLbVZTqxRXo1Lf68z8ZYdV8Ku+zi15cbRo
         46Nd2R4vlaEMh/gKW5EAJpSmGfkucBq1mmlxq6a6k1AG2ZWOTaqiv+V17CGeVLXGCGEk
         aIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798824; x=1728403624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OwXMBbOWCv06xRC7kuAtikxfL3CuNBKfrSTtPkKqEqk=;
        b=e7NupdjzNOU0k9ePvb3xLgnU3EcggjTrnm6O4QmuzTb75uccGNw6RCgmy2YcXKzLii
         jzdyPcjUBbaJizmADg9nBh6lKpW2M0xIooI9QiBjaIGyJ5g5Yge4nv0E6h1guaaSPEXZ
         ZZDYyqalLpEgHyWHrY6nhe1IvUzOEDte3qiWbp0WuPTwDnroMwemH4jxaxA3xlf0bxOI
         1aoZ7eglUtLwMooFS9brcHRuwzZ8XGSwRIohua5mJSnw028aRg2cGu3RE6Iz1/QFKGUr
         E/tvrLizxqhIRsapygkiugmBk2FQLBAA4LXunZnh2YdEWdf67HQrE68RA1VIJl79t8W4
         bjLA==
X-Forwarded-Encrypted: i=1; AJvYcCVzpS4di/avDV4W7n1DSLrn/KyK7icz5i0LVPG1vYSTjdLTAuh4GfpcTPEyJcY1PxJ5C0s5ntfzr8mXTA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpd/h/S/OFrmS5mP9VQkWD/xUBdrVvefB+hEtA73lO8dVRufBw
	U9F7PZifXLHYGCB8iO2PgBKcIVS/Lfdy/A6feO2ykUT4S7un+GaxIf3aYVT6Gl4=
X-Google-Smtp-Source: AGHT+IHz3lo2CWK5+xlTScPaDZKtUmo8trno2Ltv0riHEvGYwt0AENfouR5jnL074g0esmpKOm5AYw==
X-Received: by 2002:a17:90b:154:b0:2d8:e6d8:14c8 with SMTP id 98e67ed59e1d1-2e1853e1474mr122588a91.15.1727798824224;
        Tue, 01 Oct 2024 09:07:04 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d7d47sm13843973a91.28.2024.10.01.09.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:07:03 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 01 Oct 2024 09:06:07 -0700
Subject: [PATCH 02/33] mm: helper `is_shadow_stack_vma` to check shadow
 stack vma
MIME-Version: 1.0
Message-Id: <20241001-v5_user_cfi_series-v1-2-3ba65b6e550f@rivosinc.com>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
In-Reply-To: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
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
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_170709_081694_1B496218 
X-CRM114-Status: GOOD (  14.19  )
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

VM_SHADOW_STACK (alias to VM_HIGH_ARCH_5) is used to encode shadow stack
VMA on three architectures (x86 shadow stack, arm GCS and RISC-V shadow
stack). In case architecture doesn't implement shadow stack, it's VM_NONE
Introducing a helper `is_shadow_stack_vma` to determine shadow stack vma
or not.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 mm/gup.c |  2 +-
 mm/vma.h | 10 +++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index a82890b46a36..8e6e14179f6c 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1282,7 +1282,7 @@ static int check_vma_flags(struct vm_area_struct *vma, unsigned long gup_flags)
 		    !writable_file_mapping_allowed(vma, gup_flags))
 			return -EFAULT;
 
-		if (!(vm_flags & VM_WRITE) || (vm_flags & VM_SHADOW_STACK)) {
+		if (!(vm_flags & VM_WRITE) || is_shadow_stack_vma(vm_flags)) {
 			if (!(gup_flags & FOLL_FORCE))
 				return -EFAULT;
 			/* hugetlb does not support FOLL_FORCE|FOLL_WRITE. */
diff --git a/mm/vma.h b/mm/vma.h
index 819f994cf727..0f238dc37231 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -357,7 +357,7 @@ static inline struct vm_area_struct *vma_prev_limit(struct vma_iterator *vmi,
 }
 
 /*
- * These three helpers classifies VMAs for virtual memory accounting.
+ * These four helpers classifies VMAs for virtual memory accounting.
  */
 
 /*
@@ -368,6 +368,11 @@ static inline bool is_exec_mapping(vm_flags_t flags)
 	return (flags & (VM_EXEC | VM_WRITE | VM_STACK)) == VM_EXEC;
 }
 
+static inline bool is_shadow_stack_vma(vm_flags_t vm_flags)
+{
+	return !!(vm_flags & VM_SHADOW_STACK);
+}
+
 /*
  * Stack area (including shadow stacks)
  *
@@ -376,7 +381,7 @@ static inline bool is_exec_mapping(vm_flags_t flags)
  */
 static inline bool is_stack_mapping(vm_flags_t flags)
 {
-	return ((flags & VM_STACK) == VM_STACK) || (flags & VM_SHADOW_STACK);
+	return ((flags & VM_STACK) == VM_STACK) || is_shadow_stack_vma(flags);
 }
 
 /*
@@ -387,7 +392,6 @@ static inline bool is_data_mapping(vm_flags_t flags)
 	return (flags & (VM_WRITE | VM_SHARED | VM_STACK)) == VM_WRITE;
 }
 
-
 static inline void vma_iter_config(struct vma_iterator *vmi,
 		unsigned long index, unsigned long last)
 {

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
