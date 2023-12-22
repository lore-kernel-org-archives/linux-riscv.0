Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BDCC41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 07:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4qZEtzStyMF0Jcfhs1ES32ykaEww9oQ7q4Fil/EN7BA=; b=DTdedIjXqc910Z
	n94OHleWAxA5Pv6/VISqyL8vR0DstNUQadR2GVoOVuEDUEBrlheTEV5E2LaPYtI7bQofcY0l6Qh1/
	77RzkDh8t3FFpzHjI7VxYngptVw6QlilkDY+8iig32IcD0Cx/s76aO71SaCZl2mAv+qdy8DG5J0er
	Sd8MeUnJmF7FUb19ZlnSG2vooQI7iWoa3UHDlpByftAiQq+0vy+17rcg/czXxqU7eB3p7zSEAEpGr
	rXMCZMo9XExjfBf+ZSzXVXIJD+oMgZNqYmHTsNw3TDPG/0y0FmMm9SuFqb7Xcs3fLF8Iq97NY1/Zo
	4fsWowEKxSvgl1AdJPwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGaF2-005DDv-12;
	Fri, 22 Dec 2023 07:46:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGaEz-005DAV-1T
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 07:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703231199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9dWOLJ/7H2GD4Bb9fMRINczeyfjJ7YRASwlhClz2V/8=;
	b=gjULgw2ERygmkaSCWZ7fwpOSzXijqvBwPgrmxOT0ZhgsuhWah0uN1KWg7yLigInYPCern+
	aC7fAbNmcDUlPl0xFez5KKBTeOifSLNDoyjHyCNFojrCz4INkM6NxDeC0aaPkZg9TdrpoP
	jvYI9npEoHtg3xmZDKAhem3mNyqHGj8=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-k4t6QOfgODi9Gxip47VZXQ-1; Fri, 22 Dec 2023 02:46:37 -0500
X-MC-Unique: k4t6QOfgODi9Gxip47VZXQ-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3bb7ab55483so1672020b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 23:46:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703231196; x=1703835996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9dWOLJ/7H2GD4Bb9fMRINczeyfjJ7YRASwlhClz2V/8=;
        b=AjSJtKfRfPVNOv0kq36/kRcfOA4ioZOxm+JUftmkh++fCA8mp7kXY7O+O8FcUbQvsf
         00PzSmscJ4Y/P87afssOG0dYTxKhFsvzSFPB14iJxCF5jBJzpTqYtYQiFK7dAl6LnuTE
         uVyJPaBApe3ljpufCvUWVHaLR7iVEKrsOfzWo1LsIPvEP4vIAhzVyNjFrnqYdZGhW5cs
         r9fhPxUjb2SzOsnTqWe+sqsfYufY1cw38aes+5MbROoG0EkZ323Nc8yV31iPjhQ8eeuB
         RW/yLPUbPgTV53m94p9PUMwaAF9OJE6wONoOUCrYkb7ZHRCnQIReN4lHy35N2WTAq9Az
         CVkg==
X-Gm-Message-State: AOJu0Yy2lWJYjofMxVDW5Wc7DB8BWl4A7TwDp7r8z9jqd9F6+uqsRoQA
	eibTBazjrQKOiPcjVS+5uyK4Z8koNCcKde+fBbRtX58nIxMU/liEzHQDJLGNgNEm6Me/nLEsysa
	GcZnW4AHfYDtmCUc/eAT1ETO/BFGBq4rqjNpv
X-Received: by 2002:a05:6808:218e:b0:3a8:7c67:7cd with SMTP id be14-20020a056808218e00b003a87c6707cdmr1261200oib.24.1703231196636;
        Thu, 21 Dec 2023 23:46:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6noE7Pu5xAXvjh6CjMsnvaqxm6CqicXC5ZlFE2NmSpCIPLtETaqNzkTmN5ZP4z5PF3/bRXQ==
X-Received: by 2002:a05:6808:218e:b0:3a8:7c67:7cd with SMTP id be14-20020a056808218e00b003a87c6707cdmr1261182oib.24.1703231196440;
        Thu, 21 Dec 2023 23:46:36 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a802:7496:88a7:1b1a:a837:bebf])
        by smtp.gmail.com with ESMTPSA id m2-20020a62f202000000b006d97eaba6cesm1527015pfh.21.2023.12.21.23.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 23:46:35 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Greg Ungerer <gerg@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC PATCH 1/4] riscv: Replace direct thread flag check with is_compat_task()
Date: Fri, 22 Dec 2023 04:46:01 -0300
Message-ID: <20231222074605.452452-2-leobras@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222074605.452452-1-leobras@redhat.com>
References: <20231222074605.452452-1-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_234641_573684_8591B997 
X-CRM114-Status: GOOD (  12.57  )
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
