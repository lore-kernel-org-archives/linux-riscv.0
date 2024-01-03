Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7001CC47077
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 16:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4qZEtzStyMF0Jcfhs1ES32ykaEww9oQ7q4Fil/EN7BA=; b=Y7Q+VooIOHvpHS
	iPJqYNnl6CecOWeFAmpoxd0ugo9m5BiBTtU/XN1oVgAvUkC7Ao/I6Jh+ZWtjU9g3sev1hHgm+e+kl
	OcKvvOHC6xDptz9ypsvVHiV/Xx87V3Imncn115ipHc4ca49AAdJgF7JcPnbjfl82uFrLRMY0StOCi
	yIeV6wLdpLXcIZWsqICJ+zxabzldNcg/LCjk/qzRa/AuidrAwmGOWYe5H98b/0dL02jS/1ywRdG9y
	xwuupAJf7c7DH2ANBxazYkYMS1yn7BGrozmzydiJBy3i/hdEt44whbga4NmfbgnzfS5K7mBngMp2z
	6xFuWxzM690DusTPBrZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL3g6-00BK7C-0T;
	Wed, 03 Jan 2024 16:01:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL3g3-00BK5F-1z
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 16:01:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704297666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9dWOLJ/7H2GD4Bb9fMRINczeyfjJ7YRASwlhClz2V/8=;
	b=Dd8pxjqmajlmxQvI0nN1Du/DQzf5sOpVWL9BMXPoYf/2ABBFzOVTx+uKh230YDh0Rc0CGB
	rbtkSchaGuuxkjtGerXuCcOsfggndl3rBhPTI1MC0omfcuOQBiRRa3qjleVjqnFMIvdu8G
	buWCgO79jsgwM4HJwZRE7hzFKBURLK4=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-THPq1-6wOR2NFHzyhqYT5Q-1; Wed, 03 Jan 2024 11:01:05 -0500
X-MC-Unique: THPq1-6wOR2NFHzyhqYT5Q-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-28b88d79b87so6302510a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 08:01:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704297664; x=1704902464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9dWOLJ/7H2GD4Bb9fMRINczeyfjJ7YRASwlhClz2V/8=;
        b=qQpjctPJNTplv0u6CmHm8PhWmxs/cFaw+4fQvSs0TFPSit0HdxfT86GfCrH1psEvXB
         hWFtcWGBvBQp5DPEEIVrHj9lsIkDpINo4B6wAW47RuPG6z/0VVaX7XZY2VL2GqMusB38
         cr4olRIrGe81tIOhTeCExhk1m5oJkZq6xNXDcqHXSjumE8w3yP07Cnu6IY2TyTCdA6s6
         HPDJClpUbJL9pIq0RSkrjb3ElPh2IlcLs3usE2yj2A1Z6lY13AMNZ+V9RhnAJv+bgecl
         YNfbERphyqm38mt9S7Nc48INKH1ts3nCPjdW5QvXlS8wyCBOkV9K7B9AWu6UTG3LHzbO
         hPjA==
X-Gm-Message-State: AOJu0Yzg+Kr/4yj1cvud0UpGMrga+IwipFLy33BkiYoCSkyDl4XJg7bM
	Wx58ewQVN0oj9xbBUBE39zWrWgUQ3t2SfEZO68xJOJZEDeuiKV3J1Hc2ITgy5sCXh5Trawuanuu
	2p4gg8VMWSJt10XZK1FpV6055Z00Sxnpp1QdD
X-Received: by 2002:a17:90a:cc18:b0:28b:157c:e48d with SMTP id b24-20020a17090acc1800b0028b157ce48dmr6484882pju.78.1704297664219;
        Wed, 03 Jan 2024 08:01:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuVYYxexaKDE814y1fhNTdPHZYP8ZdcRM5q6bVvyRs+hK/lDTBPjjZPxt/iJQ3BUyAPZfgHQ==
X-Received: by 2002:a17:90a:cc18:b0:28b:157c:e48d with SMTP id b24-20020a17090acc1800b0028b157ce48dmr6484861pju.78.1704297663874;
        Wed, 03 Jan 2024 08:01:03 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7ec:911:6911:ca60:846:eb46])
        by smtp.gmail.com with ESMTPSA id qc8-20020a17090b288800b0028b1fce7c01sm1922253pjb.37.2024.01.03.08.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 08:01:03 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Andy Chiu <andy.chiu@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Greg Ungerer <gerg@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Greentime Hu <greentime.hu@sifive.com>,
	Baoquan He <bhe@redhat.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v1 2/5] riscv: Replace direct thread flag check with is_compat_task()
Date: Wed,  3 Jan 2024 13:00:20 -0300
Message-ID: <20240103160024.70305-4-leobras@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103160024.70305-2-leobras@redhat.com>
References: <20240103160024.70305-2-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_080107_847711_4CD38E1A 
X-CRM114-Status: GOOD (  12.77  )
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

There is some code that detects compat mode into a task by checking the
flag directly, and other code that check using the helper is_compat_task().

Since the helper already exists, use it instead of checking the flags
directly.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 arch/riscv/include/asm/elf.h     | 2 +-
 arch/riscv/include/asm/pgtable.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index 06c236bfab53b..59a08367fddd7 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -54,7 +54,7 @@ extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
 
 #ifdef CONFIG_64BIT
 #ifdef CONFIG_COMPAT
-#define STACK_RND_MASK		(test_thread_flag(TIF_32BIT) ? \
+#define STACK_RND_MASK		(is_compat_task() ? \
 				 0x7ff >> (PAGE_SHIFT - 12) : \
 				 0x3ffff >> (PAGE_SHIFT - 12))
 #else
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index ab00235b018f8..1d472b31e0cfe 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -882,7 +882,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 
 #ifdef CONFIG_COMPAT
 #define TASK_SIZE_32	(_AC(0x80000000, UL) - PAGE_SIZE)
-#define TASK_SIZE	(test_thread_flag(TIF_32BIT) ? \
+#define TASK_SIZE	(is_compat_task() ? \
 			 TASK_SIZE_32 : TASK_SIZE_64)
 #else
 #define TASK_SIZE	TASK_SIZE_64
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
