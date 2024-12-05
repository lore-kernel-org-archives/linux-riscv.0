Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED7EE77178
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 10:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YVRWtYPn+O5EuIIzyp/dQBF7T+nLs6Kcsi3VFQ/9J7E=; b=WcsW2v7F62pKT7
	XEru7AkLaAnvwNJI4n7MDTKMlAqzCeFG4Hmd51X7QSfeYnseP/bjAKrxmX6/GnCoXoJ7LgyKyzkKJ
	Yz2ZqIrYbPqMe0uj5aXzsNtz/fjcJ8rq22iySi5lJIS5WDO55C/UIPaG/psEPgResl17YQq3Zejct
	VD6MqraoSfE7rmek7Kd2fzBoBya3DcrcDk3FkZWp/+g60+8Wf3LuaG0TtaI8N15Amw0sy1Icjw0yW
	NMTNWaGB8YZZBs1ObSwHOnvSQN4JrbURyAUEPK0H/n7APeUTqLjo6snAhsm6U/lORVnwDsXY+42K/
	UVmnr2yMcmRO1CMspDbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Lo-0000000FaPX-2qlS;
	Thu, 05 Dec 2024 10:44:52 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9FA-0000000FY5v-0K1J
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 10:38:01 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7fc41b4c78bso490104a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 02:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733395079; x=1733999879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qR1jHqy2cDl06AgpV8oSKqeRVPpykz0hiLJxVMX/VM=;
        b=X6pApK3iCm1bCMhRnGzLX7zyFWoOUrBIqsR2A4wjWDPZ4AGeUK9h8pWs1WIWRe2PSi
         ugoO+QLn0w8y61L16aHPdOwY/ks3h6kkRCuCEieduZXysQf8LpmjWnbG3LaiM9hhhbpI
         hmp8J+aEwJ7M6WC4hQGlIbTTLZteuqzhNOPIj4gRzAWQZjM2lkRrU9tcsKjg182hjF5j
         z3O6rDKz2vQ76p7EiF+158x6tAEIBVdqTfy4AviVpNzqW+Ger5dhiKiaZ0UVxC6K4cdj
         9/TVKJ8+fl0OFYv7w35NfmQm/VoSJI9wbPlRI9c/A4ShmbX13nb8/Bd+ubC3fv8K2QIw
         esgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395079; x=1733999879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qR1jHqy2cDl06AgpV8oSKqeRVPpykz0hiLJxVMX/VM=;
        b=QxG++onNug8IQCyO6DPECQvZt1m0z8YiQE+BU8wROTQjQoYdKhSt/kbn4nco9NgA6p
         kXj0346S0KSp1StEMWoPg0j2+n/mq7Rziip/bUVdo5CDNtgEGYYOnJluHjPO2DAIGwoB
         Vj0oFQBgKMGsZrr/yrX7QGq09qsVl9o2hTqUYBetbJhGgT7MF4Grnv/lEOj4bmPJB/9n
         jKYfEv2h1NQ61MbCxcvRCsE25GTPnztsRRzax8EDDdYLO417yhzuLStUSifTo9Pq9BNm
         /fOoklqpDNsO9Q77b4TqKsaOtKcyOT5Y1gbP87x+ozTFihXGPLZ0LLO8DK+K+L8wP6iB
         n0rw==
X-Forwarded-Encrypted: i=1; AJvYcCXR5hKhr8klwJ3NqZ15rrjIKEjdbek06McclJcQClOclA0g9p5Sxrp6hl94kaMRg/0jDFtyfU/QvtvBDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBAHFi6/Jg0DlfeddOnodNkQOjHS5/N+qE7XZ9t7zhFerXzAPj
	tXDP6uNeEBtB9xuwXdVkzUvlZMvs462+QQstCpam6QhimpAvPOOGVyFxZeeD4c265L16itx1zwY
	ZW8c=
X-Gm-Gg: ASbGncvqggGbtkeKqt47b5dmZUOcjHOc/S+1Opwej32kxV/WVhhCTMV8OQ6IWg0Inrf
	Z8baoyiR7ANbHO6bkbNJBuhNnP/vuK5v3yf1waubVckl47EBXvsRtUzVbft+NoV7Jbs0DFvSFCf
	S9zm+JWunZNceuhLT08cZEWWLinz1y0uu/5666uitEVZQfBkyMr9KxbzkgOhPYGca5d2TLtrXZ3
	73gcafKkK3D+lwNLdFmv1q+/i5qtrh/3miTMYskVSt/iV0wYGkVLjgSMBD/CwKMQaJrV6DWssla
	47JbGuJmkx5dZx/GAjDo6dwm3qbocEvI
X-Google-Smtp-Source: AGHT+IEUKSwiJ64FZ3Pe2Otsaz2xFzyoQCTrZnVdkwgamPJ8aR60BE+SnfSU6DdJI6PGfNndTdnNkA==
X-Received: by 2002:a05:6a21:99a2:b0:1db:e358:48a8 with SMTP id adf61e73a8af0-1e1653b91d0mr15785669637.10.1733395079129;
        Thu, 05 Dec 2024 02:37:59 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156f048csm886826a12.39.2024.12.05.02.37.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Dec 2024 02:37:58 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	punit.agrawal@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH v2 05/21] riscv: mm: Reimplement conversion functions between page table entry
Date: Thu,  5 Dec 2024 18:37:13 +0800
Message-Id: <20241205103729.14798-6-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241205103729.14798-1-luxu.kernel@bytedance.com>
References: <20241205103729.14798-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023800_112200_054076D7 
X-CRM114-Status: UNSURE (   7.70  )
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

Some code will convert high level pte into low level pte to reuse pte
functions. For example, pmd_dirty() will convert pmd struct into pte
struct to check whether it is dirty using pte_dirty(). As pte struct at
different level has different constructor now, we can not apply pte
constructor during conversion. Thus, this commit converts ptes by directly
converting structure type.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 81 ++++++++++++++++++++++++++++++--
 1 file changed, 76 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 1d5f533edbd5..f7b51c52b815 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -309,6 +309,50 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 	return (unsigned long)pfn_to_virt(__page_val_to_pfn(pmd_val(pmd)));
 }
 
+#ifdef CONFIG_RISCV_USE_SW_PAGE
+
+static inline pte_t pmd_pte(pmd_t pmd)
+{
+	return (pte_t)pmd;
+}
+
+static inline pte_t pud_pte(pud_t pud)
+{
+	return (pte_t)pud;
+}
+
+static inline pte_t p4d_pte(p4d_t p4d)
+{
+	return (pte_t)p4d;
+}
+
+static inline pte_t pgd_pte(pgd_t pgd)
+{
+	return (pte_t)pgd;
+}
+
+static inline pmd_t pte_pmd(pte_t pte)
+{
+	return (pmd_t)pte;
+}
+
+static inline pud_t pte_pud(pte_t pte)
+{
+	return (pud_t)pte;
+}
+
+static inline p4d_t pte_p4d(pte_t pte)
+{
+	return (p4d_t)pte;
+}
+
+static inline pgd_t pte_pgd(pte_t pte)
+{
+	return (pgd_t)pte;
+}
+
+#else /* CONFIG_RISCV_USE_SW_PAGE */
+
 static inline pte_t pmd_pte(pmd_t pmd)
 {
 	return __pte(pmd_val(pmd));
@@ -319,6 +363,38 @@ static inline pte_t pud_pte(pud_t pud)
 	return __pte(pud_val(pud));
 }
 
+static inline pte_t p4d_pte(p4d_t p4d)
+{
+	return __pte(p4d_val(p4d));
+}
+
+static inline pte_t pgd_pte(pgd_t pgd)
+{
+	return __pte(pgd_val(pgd));
+}
+
+static inline pmd_t pte_pmd(pte_t pte)
+{
+	return __pmd(pte_val(pte));
+}
+
+static inline pud_t pte_pud(pte_t pte)
+{
+	return __pud(pte_val(pte));
+}
+
+static inline p4d_t pte_p4d(pte_t pte)
+{
+	return __p4d(pte_val(pte));
+}
+
+static inline pgd_t pte_pgd(pte_t pte)
+{
+	return __pgd(pte_val(pte));
+}
+
+#endif /* CONFIG_RISCV_USE_SW_PAGE */
+
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
 #include <asm/cpufeature.h>
 
@@ -728,11 +804,6 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
 /*
  * THP functions
  */
-static inline pmd_t pte_pmd(pte_t pte)
-{
-	return __pmd(pte_val(pte));
-}
-
 static inline pmd_t pmd_mkhuge(pmd_t pmd)
 {
 	return pmd;
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
