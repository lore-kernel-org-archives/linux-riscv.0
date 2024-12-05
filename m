Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB8FE77173
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 10:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wEBTppFczb4UjCaFNYwoejfKFUZZmnewfTtY6Bi1vgI=; b=FB23QjpaePU96n
	J2rwUD4xAALe0k3+xkHw/7QGgY+iMn8wVakYFQ2u3VCM1Jq/NNw5adgqoMW2vKqq368WBgEHx8yx6
	cT4ZhKW6VgWtBLcTvNcBreLIECHM8BLd4/G61RITvitCbvEYCivCfBddqwde9KF7MBckBEuCAeHA7
	NovpIEPTwg/fckWJNoVCW2unTvo5x05NCS9dJGckW2kCxaDoaugfmiqEWyhfL3ExtZ/Ij8OlX8Uzh
	6pt12cSNF+YwdK/zzF1ZH2qmodLcQ8arvArtiu73WdXJHx0MNB6ECax+7+Q6XScvmkyLQ9ROI9+Ph
	Ct9Wikncr2Mk+TRLJ91Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Lq-0000000FaQu-1fGT;
	Thu, 05 Dec 2024 10:44:54 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9FI-0000000FY8Q-1NI6
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 10:38:09 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-71d41932d32so398834a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 02:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733395087; x=1733999887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cw560nhmcCgMtoVMwQuAveKPR5/TXRAfvCK89A67aqo=;
        b=Ide1+Jy8jWNoOb0gJpo54CFdQKtXkvyVYyqc3i6vqZi82ZB9DtlIzzrXU0F85xcYcu
         m1AcLd2aBDmZTY0wNvj3qNH0Onw38VfbxCgavyZ8AQLEHPUGhI6gmZBxP6a1mgQU9DTn
         WYFv8zWOjowPbI2RRhgVXIjo7ShqJl45GaM9tmsj1R5qQ9GigWA/uL0Hk2IarNsz5yCI
         jFJPRt3n0Ctxl7r7k4cmGNLt6Xk3869Zh8fv3pSGcx2LhnVHOcls6cdfGGxBS/k051ll
         fdncAZNUchDj6GO3xsER7HnB9rCCGhNTZlL3ZlrbcNzOSRyzNIfnsxIlrmnfB9UjWRgW
         jA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395087; x=1733999887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cw560nhmcCgMtoVMwQuAveKPR5/TXRAfvCK89A67aqo=;
        b=dzRefiDJqtH81JVj8pSwdLeeB5tNQvAtr0br3iFRJSg/HuAhN14jFVeBztSPLOKZNk
         VZoiMZEUPmyH9qKUpjk5arPVwySWl9wOOcG67qzB8xy9KWZSbxeylsUqA/zgkX/0xGyu
         YfwYMSi2gmTdirAo3XytWsimGrNzufNamxHBQMEEd5223U3+aJGG9/Zr8eQSDbcvtuiB
         ZWb6ZW4BurNQ1MAn2yMG04Dd3c5tgAXbbOAccHh1bseK4ra6Ee8bCVg3Ip01tPEbbJyP
         9Hjq1ftXch4mS7n5cfvnEwXDZaGsIvap59o0Akw22DlN7kRTJOu4Ue39Mn7ytLrtYQiP
         q52A==
X-Forwarded-Encrypted: i=1; AJvYcCW9PlXObrriFcDa/JicpjoVpnvy/cxHw7xBYKJchxy1UShzI2gD7FIs5ehX2h5v2pqGSzDgqoe9KJkCaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzQwgRdzvKryK0eaURhqY1lPfeS1NGUaUvOz4FzCRCHzyrOlk1
	CVHvI2U5BIBpAcL9dJ/VTIjFj9touifWkNV0QN5aKhpQkkNh8xJR5Yx2hKMmy1Q=
X-Gm-Gg: ASbGncvU+AXMajZcP1oleGdFVRpZHFteecdJ17a8zh5NbQFyqD7jG5xMcpww6aRLD4t
	7fAQzzvHo0On/5pAasbkyEcdGFFEZT/QSxV/tR9CtPClwXNs+rqXSVbONDB5aWB3pCm+Jl+OW/x
	blRu/fJoUzWVFgUlGsuYw+hA39P0P88wWczUdgu/WXG96+SuSy4/P0X7Bre8h7mp3sckgrqBc/l
	CChNkUjM2qkb/CZvmh1ciAE5lNRiiFKnXFdLUtARttRzdsM6FQmqKcDWU2OazirpQtEqE+L+abO
	d1tIMveVJ2VfwsHgsonYgubnfv13Ao8m
X-Google-Smtp-Source: AGHT+IFgLX/MNdvVLEUe2bcmja2NfdcbWMv5BT39DW17XBNTzPIKVvGRlTw6+0l7AjGg6yRiky8Jng==
X-Received: by 2002:a05:6830:6016:b0:71d:54fb:da56 with SMTP id 46e09a7af769-71dad5f33bbmr12858019a34.2.1733395087266;
        Thu, 05 Dec 2024 02:38:07 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156f048csm886826a12.39.2024.12.05.02.38.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Dec 2024 02:38:07 -0800 (PST)
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
Subject: [RFC PATCH v2 07/21] riscv: mm: Reimplement page table entry get function
Date: Thu,  5 Dec 2024 18:37:15 +0800
Message-Id: <20241205103729.14798-8-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241205103729.14798-1-luxu.kernel@bytedance.com>
References: <20241205103729.14798-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023808_363922_B9214FB8 
X-CRM114-Status: UNSURE (   5.94  )
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

This commit reimplements ptep_get/pmdp_get/... functions. As pte
structures now contains multiple mapping entries, we can not use
READ_ONCE to fetch its value. Instead, we use traditional dereference
way.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index d3da8aee213c..ba4a083b7210 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -704,6 +704,36 @@ static inline void set_pte(pte_t *ptep, pte_t pteval)
 	WRITE_ONCE(*ptep, pteval);
 }
 
+static inline pte_t ptep_get(pte_t *ptep)
+{
+	return *ptep;
+}
+#define ptep_get	ptep_get
+
+static inline pmd_t pmdp_get(pmd_t *pmdp)
+{
+	return *pmdp;
+}
+#define pmdp_get	pmdp_get
+
+static inline pud_t pudp_get(pud_t *pudp)
+{
+	return *pudp;
+}
+#define pudp_get	pudp_get
+
+static inline p4d_t p4dp_get(p4d_t *p4dp)
+{
+	return *p4dp;
+}
+#define p4dp_get	p4dp_get
+
+static inline pgd_t pgdp_get(pgd_t *pgdp)
+{
+	return *pgdp;
+}
+#define pgdp_get	pgdp_get
+
 void flush_icache_pte(struct mm_struct *mm, pte_t pte);
 
 static inline void __set_pte_at(struct mm_struct *mm, pte_t *ptep, pte_t pteval)
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
