Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD13C0219E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 20:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q9qkzKsYDwROP0gsq8WnWm/7dIGk720AEL3lnwUPsDE=; b=DXHuOEzOEycyHH
	RhWmnE1PbTk4knfDpzkPu4V6LMUAndePmdUMtonwNqjfbaA918iSRTBJtenQ0/vQytrFfJJ2E4dDZ
	tAnKsZiQJDeS7cmISMTrilkDGhDhqh7BxhC51kpO7iYRJtC18fdmWHeh+4vkAKFmlEwlRvVnHPalZ
	2UN9UInsS1hUyXzZxUhLQZNgNSSQIRWTlKJ0PBXD+5gLWAd9ytNfhLA3AhyVAJh2nY15w3sx5BZY/
	Dr/+ZkSQhGfKW3jhnDET1Zyzi63oChA4qR8MIoIwKKoV7ZURC0dw7dJ394oYTOXEbVoHyTs6l9Iwm
	5NWGAjnI+38Zmmn9S6JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thaMi-00000001JXj-1gL4;
	Mon, 10 Feb 2025 20:26:48 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaMe-00000001JVR-3Hly
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 20:26:46 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21f7f03d856so35322235ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 12:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739219204; x=1739824004; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ADFXc53D/cc0VutYfr8tgUjvI5cmEZUhOUtSZhfaHM=;
        b=SMcP7UjD2QYwWMxlGy7fAHfnV1/oJ7J4NI1X5vP3lD1ck6RqE87WoIjjCpD8rFQ5dY
         0uTV/l3OxIJzubGUv68auR0nwB5fq899ltv4ZvIjc+c75FwaMIdhSNEr565YDWD3UQPD
         fq0o2bj34qMKnrWP4o1xDNqf5r/NwvAQoVxeV9Z2jkdLEB0oN5cRP7T5zGshe2zknkTk
         YA16JVhuT8olPJrU9p84NXuV0L7op4kiIQR4cByqgxpkfRPCVeF55mn3AOjUYn0IMYPx
         IW3JhDSnGNMozKusG5I8aLA/jBxKojGL/EM5OF08yTTWfsj8x7lz0rtnTdvlXZ+1iLk0
         VQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219204; x=1739824004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ADFXc53D/cc0VutYfr8tgUjvI5cmEZUhOUtSZhfaHM=;
        b=EHLZ7tE+EtTz03EX29tiCjrxKn1x9qni6jY6iKsakg2/75Gqs0JD9TBrobVsxAAkz4
         J+RrLq0ENyq1xMzf9dpC9egHgno173vm/AzBEleISYA3WN4eqeKSN59UlPa6geaBsgot
         Gwrm8uIrPLCSVDtNV5vDvggOEALR3hgJrCSQJUrOyzbIMB5+Z1a+rPf4S95YyQKAhtCu
         jTIfyOLkDagGO7bHypU3V6WsWOi4F9Ey5a06hYCuj6x8PQS/plnRT6bXWaXlFSHqeeJw
         GYO/G+MSlYwdmFYiXDdxiIKiGC2oosfSIU5AIdVTQsqfwRsElVujdedoeg+251SnBgNU
         mYCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbWGHIXdMsdRoRIFYz+VIZjzQ16ms3MiLbTBwaLsyu/Bjzz/DE38+b3UpAG6cs36PzDWP31jrIUZIicA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj4APMcFVzplvQfu+Ag+3xoLktShW1jUQjTjiCdeRYBcZts9Q5
	v4o83QL71bq4CcualqVrO6N7aR4hOnRrtZubn6EYV3Z8b7xiC6/W9lWNwO/zR1M=
X-Gm-Gg: ASbGnctVwgGYuv0MR9ricFs6/KU4s+KCsSliafdOkBgfIxqANkTUhtiPRnwXF4vTKGL
	P2XPSudBqPde9GymDhvbmjIsykNgLux5lZLrFf79n7yyL5yH5/V6UEh3GluUjLTwpvl64uYaJZa
	/2334x38vzoMpZCDjlH38Vh1mYRbJ65eKEjObYAb/VfBEZT/hoz+XnfXAFHWIT41Engg16E5cxL
	Iz2BrNuyYVQ//DYoqhj3KOVU/xHthX9uGuEndm94efP1dvXAQEVxoJsR8Z8uXO50LDhdwfDZovX
	7TvF4rhnHMVp0F03/rSKRgeGpg==
X-Google-Smtp-Source: AGHT+IFznxG4IUsH1vtGUm0FvXVBvTHvmf0eQhdxQZjLsHpvXLSfCmOiU5USFlGIslppLz4th5AW+A==
X-Received: by 2002:a17:902:f114:b0:21f:75c:f7d3 with SMTP id d9443c01a7336-21f4e798104mr179051845ad.38.1739219204274;
        Mon, 10 Feb 2025 12:26:44 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm83711555ad.168.2025.02.10.12.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:26:43 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Feb 2025 12:26:34 -0800
Subject: [PATCH v10 01/27] mm: VM_SHADOW_STACK definition for riscv
MIME-Version: 1.0
Message-Id: <20250210-v5_user_cfi_series-v10-1-163dcfa31c60@rivosinc.com>
References: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
In-Reply-To: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
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
X-CRM114-CacheID: sfid-20250210_122644_826601_46DA7C78 
X-CRM114-Status: GOOD (  10.03  )
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

VM_HIGH_ARCH_5 is used for riscv

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7b1068ddcbb7..1ef231cbc8fe 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -378,6 +378,13 @@ extern unsigned int kobjsize(const void *objp);
 # define VM_SHADOW_STACK	VM_HIGH_ARCH_6
 #endif
 
+#if defined(CONFIG_RISCV_USER_CFI)
+/*
+ * Following x86 and picking up the same bitpos.
+ */
+# define VM_SHADOW_STACK	VM_HIGH_ARCH_5
+#endif
+
 #ifndef VM_SHADOW_STACK
 # define VM_SHADOW_STACK	VM_NONE
 #endif

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
