Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4FACCD187
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 01:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W45u7QpHhyy+a0b0CbOXm4kpw8ndc/21c5NsYJwGlhk=; b=mAr96b3LwEdFZW
	uN1J/nP4yT2CoBdiOH9nOMdRG1hX6T8UUvQ1AwbFfRQEQzrCDA9DPOJQBuG3pdXiWt0DwI0ZzoJB/
	e73dH4vh0ITl8W8+R7iKAn2dXvqiSMnk/1BlJMiEgZs2cxNVrLousH3mKAa4OjL9gKJklcMMPVfzH
	6jZPcPDGiEfNUH6tkvSOSZrtefQUcfUVYHi8Gp0zG+XHUm5rpIJQcg/Rj4XAHzoyASeY0jZi6aeDE
	yont04/slcCGCOZsrJ2RrUY8XqwUcls3EKXbkrOtnOeN2j2XpGhr8ybZi9jYKG3rBnUNYGc1+qrAd
	auOJEVvGexeupAg2yaKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fvi-00000004zDs-0AKU;
	Thu, 09 Oct 2025 01:58:54 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fvf-00000004zB8-2TlT
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 01:58:52 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so426882b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 Oct 2025 18:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759975131; x=1760579931; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MxHL3qUwy+t0aO6eARfxrO+qA5Rm8YXQr0n5njGXfs=;
        b=Xvfydjfpy8cziVzDOZFhPABB2L6Olzu+RiERN89DtsYZ8R+JIQvebG+aVf3/9l5blb
         pnUwt8o4urISkEIcAUR2sYg9MUXbDO16RIqgbTInk0P/6qySJEjzh9rYakTIEm7eirtS
         rFzsk5n0IQf9MYhA6WmjjG9prRRJkj/mNbPG+PYH9iAD0Cwjjt4Z2yz4sBSSP8UThepA
         3lSJyyULM5GDdWjF6fFqqWKw5KLyW0s3OiWcOs+cFJhbxA0MYuEGI6B+/4VSyHXyGimu
         x4YN2KIxk06KZClpveZMCqVdvDV4wEmqhllYaKCMWqP/UZmWCeiDfqh4mMxIiN/IQsHM
         9C7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759975131; x=1760579931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MxHL3qUwy+t0aO6eARfxrO+qA5Rm8YXQr0n5njGXfs=;
        b=fRw3JAsXN9OSBC39Vg7b/2x/8JKkVRdxGXvgJJRbNrjb/mFLZOWpFGMoRYDCxbsSLV
         EF+zNLg16HXDAfFmRkvekXwkxFcXuTH9pYXeXB8sLVpEYG4GKyxvhqTmD7DI03QHKRTj
         aogTaqAFVWC2MzRveLA4sHgLwLgPvuyZGSzGs9UvXYfLBsgLc5XE8ViPixNuBJqmk/Ta
         lmhmP3eV3krZOdwfXST7g/coV4QH/xwKt1lOoNniH0lGWl7a8ulnNv2iYcxwfYeq181k
         CiwNRw52FREjZoH12pJ8C0aKTNkasFEjRDqYUMRYfTFi0oznBB9QwHhRjQflLIvZFtt0
         ggcA==
X-Forwarded-Encrypted: i=1; AJvYcCXiTgiuAz0W2IioiIojM/kJS8fT/lcbfnuFrnoaHim89XB3Y1bDhHHYbuttpyiIOoBaQB3MFtN4yoxbBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhOpE6nNdIfKoQBQa64hVhm9Z1+IM+ENjCxtrMWeIWeNNqZ0sz
	ZuDQF63+CaNL9XoKIUagDPbhAML7YZsgze1NS85tZDOPUhfvvDADBlMYP+JL4UTTTdk=
X-Gm-Gg: ASbGncuwFh6F2TG0izXr8QH4+0JXlXZAZ4KOEYFWlnubtLd/z4kwBUjn6Ke52Sd+GBR
	Z6VtIaSwvBhDYxUWohrGjn/+1Ht4gqltjfCsrm3Y7ij3p+rEvsV+p6E63zfqTfc8x/D/SJY52UQ
	ns/lNqQ3HGYOGoYFmWAPiZ+SEPQWrXD1fo7X/iKaWW5uYwSN5uKPwQyyWeUC2WCRM4NX/LXW0TJ
	2AXjSEzaBfOd4/Jk7iOCBvnNpE0Pqns8AOQniTxCZ7sPBsLhPhO4sIVfFGW14OaZqYEg4br/Sne
	VAIZSh15rhrJdxC/fls4DX5FAQqGI1+kMegVfx+Bt2oZt0ld0lnjw54sccujJPUCMZWVTt/cnRP
	gWhkeh3vYW4yUehEBhNDHgl8AKsKvWWSh/jXi3ahE4eUPF7N88Z5c0hSUOvcI0SqBmfF5
X-Google-Smtp-Source: AGHT+IFWANPjuzJhuuxubYaVO2GJhHx+Uq0HfBlhgHOgbCi5OPe5NLGhSbpBSxbnLiNpsX7PUf8iug==
X-Received: by 2002:a17:902:d592:b0:240:48f4:40f7 with SMTP id d9443c01a7336-290273edf23mr67433045ad.39.1759975130859;
        Wed, 08 Oct 2025 18:58:50 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de53f9sm11033585ad.14.2025.10.08.18.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 18:58:50 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Conor Dooley <conor@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 08/18] riscv: mm: Simplify set_p4d() and set_pgd()
Date: Wed,  8 Oct 2025 18:57:44 -0700
Message-ID: <20251009015839.3460231-9-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251009015839.3460231-1-samuel.holland@sifive.com>
References: <20251009015839.3460231-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_185851_647238_1A28CAE4 
X-CRM114-Status: GOOD (  11.70  )
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

RISC-V uses the same page table entry format and has the same atomicity
requirements at all page table levels, so these setter functions use the
same underlying implementation at all levels. Checking the translation
mode to pick between two identical branches only serves to make these
functions less efficient.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 arch/riscv/include/asm/pgtable-64.h | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 1018d22169013..7eb23c24310f9 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -273,10 +273,7 @@ static inline unsigned long _pmd_pfn(pmd_t pmd)
 
 static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
 {
-	if (pgtable_l4_enabled)
-		WRITE_ONCE(*p4dp, p4d);
-	else
-		set_pud((pud_t *)p4dp, (pud_t){ p4d_val(p4d) });
+	WRITE_ONCE(*p4dp, p4d);
 }
 
 static inline int p4d_none(p4d_t p4d)
@@ -340,10 +337,7 @@ pud_t *pud_offset(p4d_t *p4d, unsigned long address);
 
 static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
 {
-	if (pgtable_l5_enabled)
-		WRITE_ONCE(*pgdp, pgd);
-	else
-		set_p4d((p4d_t *)pgdp, (p4d_t){ pgd_val(pgd) });
+	WRITE_ONCE(*pgdp, pgd);
 }
 
 static inline int pgd_none(pgd_t pgd)
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
