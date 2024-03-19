Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA240C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 21:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CoX5bqjstk0sdAD5+6gSm+uGVxJS5mGu5tjYL5LyQEY=; b=iJ7stJfP16hLzc
	ruNmt6LJ7Y85qbCjF6uPVbXErgFDwENxvyDm53wMFINCbeEje2D2nfa6vBb6VFNvJ7axL5b7SJTjO
	hLlVnL+hUMDlb2qc5q82pa0+R/RfJ/OYmak4fDO0JEATz/gOeIAbySjG+POZ4bgdpN0rp6Qn6TGPD
	I2Z5EpuDmdz5/8CmrxtJXkcyyycWeUT3t4hgFQOyoOdnjf6O+gqSsklKWpwxv1gOLNXLsFRAM4vmV
	EjrjscF9PkdWYNCPzJceh3o73+SjRuAEHJ3V7W86Y5UNIBVXkY7J3C90gTInvH5sUAzgzd7Y8qjzq
	hhki/q23vI/hxGzFAYgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmhUa-0000000EMkE-3Hxy;
	Tue, 19 Mar 2024 21:59:32 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmhUT-0000000EMew-2Zyq
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 21:59:27 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6e6f6d782e4so4000995b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Mar 2024 14:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710885562; x=1711490362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciVO7+10eZV72+E/ORaPRZFjospVEi/8CuyB7rGS1wk=;
        b=HFcEpbhTDIzPhffKUK2gFsLkt//X+eo5dTnQ1bDy7WkFpKXT4f6wLVbp1NTUcr+xd7
         kW3Le5ViqEq0pMguzDqmm8plzHLxMZ4FLxeld85/ig8W2MznT/nJlDpKoOnr8mCuSVaB
         LU1//TGFLFIc0tYyRn9XATwS7oNlipH3APtLaRDSZF/5Mk5kZ7WsriX2g82m++sOvpXX
         Jk4902vHJI6Fu1eElUvGJp1Pl0L0n78LGCfZRT8moBXbcf8cKLyosgp0A413TSf/NMgz
         pr4c7f1B7UPb5RVUxRNinpbz0MkilZntqtveukzveOxM/T5ZrJNmE20Y5WyXwxSENjlX
         h+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710885562; x=1711490362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ciVO7+10eZV72+E/ORaPRZFjospVEi/8CuyB7rGS1wk=;
        b=NnHBy2q8rDXAM/7MZZIfrL067bPDdoNoNAySINMfbiaP2JCwh7g7YCW9U+DWRBIJxt
         qsB/uNzanzyTtDsSDg/PLUFjShz8SWr2PuJNK8+L6fGk5ToWvRB22PTfVsaHDJx0Vp/K
         44+4t4BLjhf0gI4VL8u6jx/ZXvoCkdgA9STEVqrIUYRvVdkMaZBvvbAKGf+XSOdcQGt+
         Fuh2V6/gYLyl+MEYphElDPghY88MaUy6rr9PM9YDL4xVJVCkgVIDKjUJtvg8LEaAca5j
         GiSFIfCC0GS9akU5mqPD2A5N5DYRSFAsZgy4KXODiUX1jvAh/nXjo3zZGXOdDSaWxBTT
         khzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUODhjsXOsyYufibSW/ciZy06n5+G9as5/WBIbiAAbOj3pAJXoc5SfBldIf2FK6v1CHWnOb7o3yuB0b7/DuWyq9YjkcGsPxtPqLOGe6bTuk
X-Gm-Message-State: AOJu0YxKDnhfEBTM0djDFOZ5m//2x2c+Gt6Ek46TjhPVvU7TEN07nOzS
	1QJ5ybhG45nYxezKVfUnexMz7U4GkL6lsWoS90rPhPUiD5/cu/L4Q5lTRYE2zm8=
X-Google-Smtp-Source: AGHT+IFywIvk95HmWYC1ps8ZiAyORSpJBD5fZsHjoqcZoqHYlw5bVo0KamFA/Wgvuncr3jxrfpyfUQ==
X-Received: by 2002:a05:6a00:721c:b0:6e6:fcd4:4f44 with SMTP id lk28-20020a056a00721c00b006e6fcd44f44mr11479878pfb.16.1710885561953;
        Tue, 19 Mar 2024 14:59:21 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id z25-20020aa785d9000000b006e6c61b264bsm10273892pfn.32.2024.03.19.14.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 14:59:21 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	tech-j-ext@lists.risc-v.org,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [RFC PATCH 4/9] riscv: Define is_compat_thread()
Date: Tue, 19 Mar 2024 14:58:30 -0700
Message-ID: <20240319215915.832127-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240319215915.832127-1-samuel.holland@sifive.com>
References: <20240319215915.832127-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_145925_726838_88965E7D 
X-CRM114-Status: UNSURE (   9.51  )
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

This allows checking if some thread other than current is 32-bit.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/compat.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/compat.h b/arch/riscv/include/asm/compat.h
index 2ac955b51148..233c439c12d7 100644
--- a/arch/riscv/include/asm/compat.h
+++ b/arch/riscv/include/asm/compat.h
@@ -12,11 +12,18 @@
 #include <linux/sched/task_stack.h>
 #include <asm-generic/compat.h>
 
+#ifdef CONFIG_COMPAT
+
 static inline int is_compat_task(void)
 {
 	return test_thread_flag(TIF_32BIT);
 }
 
+static inline int is_compat_thread(struct thread_info *thread)
+{
+	return test_ti_thread_flag(thread, TIF_32BIT);
+}
+
 struct compat_user_regs_struct {
 	compat_ulong_t pc;
 	compat_ulong_t ra;
@@ -126,4 +133,13 @@ static inline void cregs_to_regs(struct compat_user_regs_struct *cregs,
 	regs->t6	= (unsigned long) cregs->t6;
 };
 
+#else
+
+static inline int is_compat_thread(struct thread_info *thread)
+{
+	return 0;
+}
+
+#endif
+
 #endif /* __ASM_COMPAT_H */
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
