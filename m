Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47FFCA0EE4
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 13:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7JN/NHue7BlU+qOQCPpBgGSEcpbBXmZ9oV3foOFhyEo=; b=UOf0QjbUpIiipR
	HzWd1QNpXqlGdXM7kU0SRX7NEwvAZzZ3zjYZQB4A+09fGdPF25tBnv/xvZTiN4gwGhs8LOxEuiFTm
	T6+CdIqcegjpfXOWKfN38R0gXRjwNVHx+W78TOIxuYCnmjBeB1WHrIpz7ZXtPIA1h8I+uxrvZOsGK
	zvuhqlsHQcywlLbM0ryZIWse1g7SIf4ahPQtRzpoANrHdriN6vy9wrhA0ChGyNUDhEf2u1/VyXaZN
	8EYk4hJTW+ZQZmE5UQyDhxvr4vTd/QOuIAisFWc164pmxFqjlv1ByGxCyU5rPUqC2e0yjiKaTLskJ
	MUi2mS9ueFNBP5mGuC1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXul-0000000H2Fs-2YIW;
	Thu, 14 Aug 2025 13:22:43 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umWjL-0000000GoJj-30Ms
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 12:06:53 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-32326e20aadso1103801a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 05:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1755173210; x=1755778010; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uVJEHbwUiQHMVs0nBo4suasLYxYlbOfnqJ9z6JjAl18=;
        b=D7kdYw05yDSYiCu51jOkGFLk3FrMbRN2RzRxKa0wxKZuX5ipDjeqy/gu0BAcquhD44
         E3z2GMWANkj48zxdGjkykdm6jNf2voDXH/xgOGxBAqMMDejEHiDGO9kRr9goMotiIzKl
         ASf3WA6jA865PwITnYg2NiJqpaOAYIu7/8Qet65hG7yBT0N+3SM4VP71KTwEim58Medf
         TLhKP9T2E9krRjmd4q8sb57NhFoYSUKFoBixPe0y1JiX6JqEC1LdM8wLwShz4CxhioXR
         wmV0Ip6NIqsnYeixuINjgTOVCauVRcJRhFwyhKedFeaPMVwtMSqLnZQuSNDwASQ8uSdb
         NmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755173210; x=1755778010;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uVJEHbwUiQHMVs0nBo4suasLYxYlbOfnqJ9z6JjAl18=;
        b=B6ibhk7gNhzSvyomNyF62yqdeuv3rqlIciLdA5vQdmnI8N/u8Z3h8lElcnNui/0dul
         TdnsR5ew8vlT74Byao8LEfmot3hiRKTXGcR5FAFAgsWulJiqD3KL+UWRSbwfUVR5Ino2
         YWLcQyARGsnU2cJsiFgUGzdfyXjlqyLUBlB264l9NAnTHbNv11doDP/fqpRDgVkNwD5K
         TG8Vme6Y65bpV7lEF8C6dmSXWQ/m5/5W9kcX9TcFwsWSv43B2oRtJgschUmCrokgdO7G
         zOMlph55+q82MediYCY73rrtqzB9ArrgFskK/MiRLbVPo0iUAWt36WOJUhtpdfqVJSg1
         KMhA==
X-Gm-Message-State: AOJu0YxBw4X978j5xzba8WHm8+U0utcfaRQvK8VHnO0LKPNHddkiY9FX
	HHWSxFtrWDVy0ouWxPNLWAW5atDVQMUE5jOakarSkYsQk3kU4ad3b+uOrvhueFmogD4=
X-Gm-Gg: ASbGncvL2b4LYp9LiUBZyEgcqsKCQYW/aAXyxFHlA8Ql6nvDUTig0Y4o/R9yLC782hu
	P9mUx7bS+TFXglT+4LaTqBFA5+3LTPXQg5jxUWogrcCoOaAoxR27oJoVUobdDuZjvgv3At30k1D
	lz0iERuzoEN7gZm63F4fMxb5Jzl2jEzwhJh2Y8RqWzM8DL33aJE4w6a48MV5UDu4DjTTDHtz6vt
	sTmT4PrL8/IQxFtunKVDSrKobY49LYHIROG85whF12c1qrB7dp/WC8PgBPeSndSlBpqxlYQ2m+t
	+/EpDRN7TmNDkvMDr6KlitJIQocZHWhKNRrt+ptFYLTZSAzqjKu1KTsb7DraxrLxaXHJ9MVdX+0
	3Wbgemc6QasNDYUIJlUPfJtRwtCzY8OF9WZcOW29ikgX2AjRoaHC9meHCDssZNwNYqzi3rg==
X-Google-Smtp-Source: AGHT+IFEAHkPnfRIgoDwjDPEfLaXInGcoKVU6vuvYGC8vXWNCk2KB5smgVfxup0qNj0vfsNR8sfSYA==
X-Received: by 2002:a17:90b:3d8c:b0:31e:7410:a4d7 with SMTP id 98e67ed59e1d1-32327accc9bmr5541078a91.33.1755173210426;
        Thu, 14 Aug 2025 05:06:50 -0700 (PDT)
Received: from alexghiti.eu.rivosinc.com (alexghiti.eu.rivosinc.com. [141.95.202.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3232f8c8e4bsm923478a91.2.2025.08.14.05.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 05:06:50 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 14 Aug 2025 12:06:14 +0000
Subject: [PATCH] riscv: Use an atomic xchg in pudp_huge_get_and_clear()
MIME-Version: 1.0
Message-Id: <20250814-dev-alex-thp_pud_xchg-v1-1-b4704dfae206@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIADXRnWgC/x3MQQqAIBBA0avErBvI1KiuEhGhUw5EiVYI0d2Tl
 m/x/wORAlOEvngg0M2Rjz1DlAUYN+8rIdtsqKtaV61QaOnGeaOEp/OTv+yUjFuxFVoaKaTtVAO
 59YEWTv93GN/3A4nQqbBnAAAA
X-Change-ID: 20250814-dev-alex-thp_pud_xchg-8153c313d946
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1490;
 i=alexghiti@rivosinc.com; h=from:subject:message-id;
 bh=wiB//OFp2BrFQuwN6BZWO5CNv4TW0Uuh2XVDxdHzt2g=;
 b=owGbwMvMwCGWYr9pz6TW912Mp9WSGDLmXvT/2sjZzsLpbla9zt1RuuD5t94w2cMrAiYbPNs49
 c9vRsYXHaUsDGIcDLJiiiwK5gldLfZn62f/ufQeZg4rE8gQBi5OAZjIyyMM//1mHIl5e/635P6/
 pQ/FNQKfHZd/Ja4ac2j/y6McX6b1rhFkZJhk8vpp7+FXXZc0rvpcrXQS7NPLM3TaFGYw/3j4Sov
 1HpwA
X-Developer-Key: i=alexghiti@rivosinc.com; a=openpgp;
 fpr=DC049C97114ED82152FE79A783E4BA75438E93E3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_050651_856920_27265C26 
X-CRM114-Status: UNSURE (   7.96  )
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

Make sure we return the right pud value and not a value that could
have been overwritten in between by a different core.

Fixes: c3cc2a4a3a23 ("riscv: Add support for PUD THP")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
Note that this will conflict with
https://lore.kernel.org/linux-riscv/20250625063753.77511-1-ajd@linux.ibm.com/
if applied after 6.17.
---
 arch/riscv/include/asm/pgtable.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 91697fbf1f9013005800f713797e4b6b1fc8d312..e69346307e78608dd98d8b7a77b7063c333448ee 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -942,6 +942,17 @@ static inline int pudp_test_and_clear_young(struct vm_area_struct *vma,
 	return ptep_test_and_clear_young(vma, address, (pte_t *)pudp);
 }
 
+#define __HAVE_ARCH_PUDP_HUGE_GET_AND_CLEAR
+static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
+					    unsigned long address, pud_t *pudp)
+{
+	pud_t pud = __pud(atomic_long_xchg((atomic_long_t *)pudp, 0));
+
+	page_table_check_pud_clear(mm, pud);
+
+	return pud;
+}
+
 static inline int pud_young(pud_t pud)
 {
 	return pte_young(pud_pte(pud));

---
base-commit: 62950c35a515743739e3d863eac25c20a5bd1613
change-id: 20250814-dev-alex-thp_pud_xchg-8153c313d946

Best regards,
-- 
Alexandre Ghiti <alexghiti@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
