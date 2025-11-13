Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC47CD4F37
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 01:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=27JQ1oD9pmAZ15pJkAM1STyLkTJGq19jGH1qEAcvGF4=; b=YSjHuqOF5PpIu8
	pzx1wGQsRkCeWtL9vueD60kmabr1M+E945pC3bz++RFH2/IkW3NLYgpWtdIlRbyMztyE1Dx4+Z5nE
	V+B+UuOLij81AUBz5aRcX0MBRIT9msGDXh9YVpac+S7f78Rf3nfm/QwVVeeai/AMG/i+MeRmPnK1L
	KHZszXgWAyJo+cAoWIgezTA/Cu4+eNT5hgK9zUc433jSCbjfR0SuvJw1MR+r2P5R+UEBuTJSjsloy
	6QUy0/GA4p3uz8FyFK19++1iMJu3TSrKpxwbEbdLP5NYaadDK0DZVEt2HNHVme7fHBeIVTX5+8dQA
	uVwp6baWXCs/JKa60HSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQp-00000009jwM-0eF5;
	Thu, 13 Nov 2025 01:47:28 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQm-00000009jtJ-0mE0
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 01:47:25 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7ade456b6abso200980b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Nov 2025 17:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1762998443; x=1763603243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3tvwsP9vvABxxjFo83LMGwuoc9gJFKDbkPSolQxDxUQ=;
        b=QHiGD86clVhwlHbwHWQt9Xtod203cTCYccSiMtNx1xR3lc8aOiotyeK9W8C6KOBw8K
         qyRxmQx1Z2j9jDldZXdudq2SYHGMigCLsnfoOjwDYFRuf6v8nwyDDzpCDsCrQMRqL8nA
         LhH1jFpun/Mkv27pKkQlOTxnyDxfJ0T8YyKPatZ7oP1NIIo1sTZwgn5gFIBXm0Xmc09b
         l1bd+nPS6zyDweq3VT95j/7x68TRxUT3qZ9ubMhQfoxX/sfcgUY3j31o0CqJCW4+UkQB
         DHBIzmY2eCEsLyR9S+pzsJa98rv/i/E4XhYc6iIbzXjxoxC7EaEe5ftLatNrfy8Uhvvq
         K5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762998443; x=1763603243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3tvwsP9vvABxxjFo83LMGwuoc9gJFKDbkPSolQxDxUQ=;
        b=aIFKH2QomP6MHuGxt9w2WRH6hAmFD9oUvLM8KUfbZrieQ9vAf62r8PB53Ni3UfjUTy
         lm31QTNWUhk2z2AhDEvCZYlxXPTrGIwMZ9s9gPJv8I7Y/aew40ayi2M3oNWgjTTwxBbG
         VHLkBQ+Ap8hpnaZWzds92yD6BI6lcQlozb08m6gjyba/eEUbNOZWcvSbUVZNjpP8LX00
         da3wNJU+AqQc9zmI/VI7Sib1Q+cqb4ih+JJk5hG0ETWuFpWRDOHapKPxTQqLdR4UuxfU
         SaeKNkY4lm+F9C2ohEl+lu0Tkz0YebUhpaXRIq8ps5fJOQS4fSROmqpabVg0h3/yoz1k
         kvCA==
X-Forwarded-Encrypted: i=1; AJvYcCXxv7bFlEYKUamC92vADH23BFjBUfL1ueXuoS9fq0Vhfz0pRYR4VJu1J3SuJ/sWtqd1W4xFvdHZYFdUAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZwYAOe7qZOXJdCKGXruyUduZhKaYNUAQxznki9H0KQt8gotjp
	pr/CbpNkMpsIkfk9EPN/39kQQR92sj5SFermG1V6g8PO6kdpQn4EmdP4ed6mCwuvLzE=
X-Gm-Gg: ASbGncutS77ttM7AV0KbtOJ/eHI1Hntqq3p3ujcYLBOHyv6IQenS0sUIxwywwwcER0O
	Fn7GTjTC0lln0m6I1b9QWH+QfKOdCQV8vGh9skP75vJIHkwjZyvaiHO/wbEQblg2F4S8Ag33Kct
	qeL9wQVge26zO6dsNsYsFWMEhuHUJ1GAGnwoIK6agh9yT3sn/i8GfWk1NdbQ19abk8q8BYcA9b8
	z6uyOhX6ER1675GvjbamLrBGB15N7tuLvLEcEkFREPcjjftahDiKDjfNcskvRfV08/2BqtJIGjQ
	hCYCroWQbxB+1gsgtkMfFLicE0A6voBcJD5IATNa+K472iWHajFe0OQvUXH/PQevT7QOuOHaMWz
	uhjJgsObDv6B6Gc93NUYMXodho3i5pHuGgS9KlFTLR11qhhfSOsQxc5vRS0hec5h1YYj16UqzZl
	LBvUZ2Y7iADMzTr6Fph90ZPg==
X-Google-Smtp-Source: AGHT+IEzjGNl3Wyy3hzWqL7on4A+1Kg8RojXA788MVa4vlvrwXnh7VKjWrR3/ZaKHRkhd2fy7O+m8w==
X-Received: by 2002:a17:902:d4c8:b0:297:f8d9:aae9 with SMTP id d9443c01a7336-2984edde647mr68226655ad.51.1762998443331;
        Wed, 12 Nov 2025 17:47:23 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2ccae8sm4986485ad.98.2025.11.12.17.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 17:47:23 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Cc: devicetree@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Conor Dooley <conor@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 16/22] riscv: alternative: Add an ALTERNATIVE_3 macro
Date: Wed, 12 Nov 2025 17:45:29 -0800
Message-ID: <20251113014656.2605447-17-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251113014656.2605447-1-samuel.holland@sifive.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_174724_233369_CAAC8325 
X-CRM114-Status: GOOD (  12.82  )
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

ALT_FIXUP_MT() is already using ALTERNATIVE_2(), but it needs to be
extended to handle a fourth case. Add ALTERNATIVE_3(), which extends
ALTERNATIVE_2() with another block of new content.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - Fix erroneously-escaped newline in assembly ALTERNATIVE_CFG_3 macro

 arch/riscv/include/asm/alternative-macros.h | 45 ++++++++++++++++++---
 1 file changed, 40 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 9619bd5c8eba..e8bf384da5c2 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -50,8 +50,17 @@
 	ALT_NEW_CONTENT \vendor_id_2, \patch_id_2, \enable_2, "\new_c_2"
 .endm
 
+.macro ALTERNATIVE_CFG_3 old_c, new_c_1, vendor_id_1, patch_id_1, enable_1,	\
+				new_c_2, vendor_id_2, patch_id_2, enable_2,	\
+				new_c_3, vendor_id_3, patch_id_3, enable_3
+	ALTERNATIVE_CFG_2 "\old_c", "\new_c_1", \vendor_id_1, \patch_id_1, \enable_1 \
+				    "\new_c_2", \vendor_id_2, \patch_id_2, \enable_2
+	ALT_NEW_CONTENT \vendor_id_3, \patch_id_3, \enable_3, "\new_c_3"
+.endm
+
 #define __ALTERNATIVE_CFG(...)		ALTERNATIVE_CFG __VA_ARGS__
 #define __ALTERNATIVE_CFG_2(...)	ALTERNATIVE_CFG_2 __VA_ARGS__
+#define __ALTERNATIVE_CFG_3(...)	ALTERNATIVE_CFG_3 __VA_ARGS__
 
 #else /* !__ASSEMBLER__ */
 
@@ -98,6 +107,13 @@
 	__ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, patch_id_1, enable_1)	\
 	ALT_NEW_CONTENT(vendor_id_2, patch_id_2, enable_2, new_c_2)
 
+#define __ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, patch_id_1, enable_1,	\
+				   new_c_2, vendor_id_2, patch_id_2, enable_2,	\
+				   new_c_3, vendor_id_3, patch_id_3, enable_3)	\
+	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, enable_1,	\
+				   new_c_2, vendor_id_2, patch_id_2, enable_2)	\
+	ALT_NEW_CONTENT(vendor_id_3, patch_id_3, enable_3, new_c_3)
+
 #endif /* __ASSEMBLER__ */
 
 #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, patch_id, CONFIG_k)	\
@@ -108,6 +124,13 @@
 	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),	\
 				   new_c_2, vendor_id_2, patch_id_2, IS_ENABLED(CONFIG_k_2))
 
+#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, patch_id_1, CONFIG_k_1,		\
+				  new_c_2, vendor_id_2, patch_id_2, CONFIG_k_2,		\
+				  new_c_3, vendor_id_3, patch_id_3, CONFIG_k_3)		\
+	__ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),	\
+				   new_c_2, vendor_id_2, patch_id_2, IS_ENABLED(CONFIG_k_2),	\
+				   new_c_3, vendor_id_3, patch_id_3, IS_ENABLED(CONFIG_k_3))
+
 #else /* CONFIG_RISCV_ALTERNATIVE */
 #ifdef __ASSEMBLER__
 
@@ -118,11 +141,17 @@
 #define __ALTERNATIVE_CFG(old_c, ...)		ALTERNATIVE_CFG old_c
 #define __ALTERNATIVE_CFG_2(old_c, ...)		ALTERNATIVE_CFG old_c
 
+#define _ALTERNATIVE_CFG_3(old_c, ...)	\
+	ALTERNATIVE_CFG old_c
+
 #else /* !__ASSEMBLER__ */
 
 #define __ALTERNATIVE_CFG(old_c, ...)		old_c "\n"
 #define __ALTERNATIVE_CFG_2(old_c, ...)		old_c "\n"
 
+#define _ALTERNATIVE_CFG_3(old_c, ...)	\
+	__ALTERNATIVE_CFG(old_c)
+
 #endif /* __ASSEMBLER__ */
 
 #define _ALTERNATIVE_CFG(old_c, ...)		__ALTERNATIVE_CFG(old_c)
@@ -147,15 +176,21 @@
 	_ALTERNATIVE_CFG(old_content, new_content, vendor_id, patch_id, CONFIG_k)
 
 /*
- * A vendor wants to replace an old_content, but another vendor has used
- * ALTERNATIVE() to patch its customized content at the same location. In
- * this case, this vendor can create a new macro ALTERNATIVE_2() based
- * on the following sample code and then replace ALTERNATIVE() with
- * ALTERNATIVE_2() to append its customized content.
+ * Variant of ALTERNATIVE() that supports two sets of replacement content.
  */
 #define ALTERNATIVE_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,		\
 				   new_content_2, vendor_id_2, patch_id_2, CONFIG_k_2)		\
 	_ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,	\
 					new_content_2, vendor_id_2, patch_id_2, CONFIG_k_2)
 
+/*
+ * Variant of ALTERNATIVE() that supports three sets of replacement content.
+ */
+#define ALTERNATIVE_3(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,		\
+				   new_content_2, vendor_id_2, patch_id_2, CONFIG_k_2,		\
+				   new_content_3, vendor_id_3, patch_id_3, CONFIG_k_3)		\
+	_ALTERNATIVE_CFG_3(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,	\
+					new_content_2, vendor_id_2, patch_id_2, CONFIG_k_2,	\
+					new_content_3, vendor_id_3, patch_id_3, CONFIG_k_3)
+
 #endif
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
