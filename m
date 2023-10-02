Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F35FE784BC
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 15:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fcj0Sfg9A7gsw26zqhcK/FLFmMfLdLxfKSo3iq7rfzE=; b=X0TAer9HR/rumz
	jowamkIzxAldHBwHnXPftGchrvXml/+JGSXfWTdcWvWgplTFjr4nfgVpZHRC9IKYXI2bpYEEQztzD
	LkffQ4DFhgZeCCKTWXfgV+HB7dHh4aOjmf5TVkRaIVgC/3ac/TU9khASMHq7eX5khJl+HaJVZc/X7
	+LWFU/1CiUWL3o+9853GzhOGTIBz1hyUn5E3bLXj552FNWj3RBSxFSiCFwpjt/j9VG+n4uVADB8+p
	MlDd/yGlvTQlsfS1vVczkuCWrd4X2GdEh49K3mEMh/2DIETJKUvqzyjy5OcNild8HOy/kebQ7RNgH
	xXEJGACZkM9jGlIc/IHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnKbG-00CxP3-1i;
	Mon, 02 Oct 2023 15:12:46 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnKbD-00CxMv-0C
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 15:12:45 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-405524e6769so19690365e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 08:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696259560; x=1696864360; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAROWeuegt9axYlR2gFhUBC1uOuBg0VWiNfGep/WqRA=;
        b=J776GQp+e/V0wf9/i7wYfqA1CChkQuLk34z80x6R5tXWtMgTfmgcx88Y2Z2vPqvFPd
         Hkh7sHY+474OuCTl8YA6LaerN2Y4KCHJMnk/dDqcp/ysYbLJM882PhGbUg1EH9vrIeRz
         ziXAWcmyr1GkkPZDWyEmO+qiQ/x7ddgDitckpvNxUexSvmlA2f+4GKlLNSp/9UxbTdNC
         NK3u128mS0Ar+/DgSfAMbO56/Y8mtbkrXvR7q7e5ncyCT0laWRPu0IjtZ8KUbWP3vrfk
         Z/yN97gEEeqP3acHh8xQ/fw+8Es8Z7B44P1d80oJxeFEhQQ15sDGTNkGmsMxrECjMuYu
         7VqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696259560; x=1696864360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAROWeuegt9axYlR2gFhUBC1uOuBg0VWiNfGep/WqRA=;
        b=wipOR9qR1P8uYUHNVTbCmz9zStQMy4uuSCHoPUSeyGjG/pozOrUUsUlFJtvkHpIb+O
         cq4p1mYOTzlqjjnqLKyO1uI9XIeMONDOgiNKRtwv7lJcA6pmqrGJg2jKv3ENb5QOTF+W
         E90AgQN5B17y8woG/E2xc23DX9QC85SOQ8nk9iQ8dQGLow11XEwy2GGOPsyf8ojP9Oh0
         qm0D5WGVAt8UGkzNr4l+Ysi9+pbivQFLcEpSUnfe4cka7Oqdu2DpTmduyf3E6NmW1QcV
         cyi6RtHtHGvl5KuTnmjxMOi2mENI9BHUkpBVowIxmKH8dgG7CaqkGZxifcxR3cdXRrTl
         +1jA==
X-Gm-Message-State: AOJu0YwZrT/RAyeCA/vGuiC+dOyRKzn9nsLuAffcIP7N4Cvqj8EHwonQ
	DrcP9CAXd2gN/RWhsgOESJO3eg==
X-Google-Smtp-Source: AGHT+IEp4TyiMTncEFWIJawksGoamhltIe4ZJc8GCSTvwz3nHyivxU99XVIdB916hW0jM9qw6ka5vg==
X-Received: by 2002:a05:600c:5022:b0:405:3f06:d2ef with SMTP id n34-20020a05600c502200b004053f06d2efmr9800701wmr.4.1696259560252;
        Mon, 02 Oct 2023 08:12:40 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id l5-20020a7bc445000000b003fbe791a0e8sm7507939wmi.0.2023.10.02.08.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 08:12:39 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Ryan Roberts <ryan.roberts@arm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 2/5] mm: Introduce pudp/p4dp/pgdp_get() functions
Date: Mon,  2 Oct 2023 17:10:28 +0200
Message-Id: <20231002151031.110551-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002151031.110551-1-alexghiti@rivosinc.com>
References: <20231002151031.110551-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_081243_120418_AE4C7CE2 
X-CRM114-Status: UNSURE (   7.84  )
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

Instead of directly dereferencing page tables entries, which can cause
issues (see commit 20a004e7b017 ("arm64: mm: Use READ_ONCE/WRITE_ONCE when
accessing page tables"), let's introduce new functions to get the
pud/p4d/pgd entries (the pte and pmd versions already exist).

Those new functions will be used in subsequent commits by the riscv
architecture.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 include/linux/pgtable.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 1fba072b3dac..4ce68bcc201d 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -284,6 +284,27 @@ static inline pmd_t pmdp_get(pmd_t *pmdp)
 }
 #endif
 
+#ifndef pudp_get
+static inline pud_t pudp_get(pud_t *pudp)
+{
+	return READ_ONCE(*pudp);
+}
+#endif
+
+#ifndef p4dp_get
+static inline p4d_t p4dp_get(p4d_t *p4dp)
+{
+	return READ_ONCE(*p4dp);
+}
+#endif
+
+#ifndef pgdp_get
+static inline pgd_t pgdp_get(pgd_t *pgdp)
+{
+	return READ_ONCE(*pgdp);
+}
+#endif
+
 #ifndef __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
 static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
 					    unsigned long address,
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
