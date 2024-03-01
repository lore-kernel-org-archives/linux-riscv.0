Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6D7C5475B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 09:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QpoXggGPCNGkaHToKIRy641oTggyPxRCBB1k6FrX4qQ=; b=w/ZOs1BeeOuR/9
	l+o6QDjcV2uHr3wRSHcl6pZWlIMf1eeiR5bhyi/uhMkiCyE/o6vVDe1ZQLef5zJd2diYufkSE8g7u
	ByagMXmqChik6cPODEBW4wKlmFNEGmyDgYBnsExBmQhkjt76NL9H5AFkyOnemBS0nhlnJ0TK0eoJ1
	KbM+/GGIPomnHEJZuAaZ0MNURr33/bincbCU/WR6TWYZ5yHg9YFEx4GbY/0SofjWV+4Sap8mM1ByB
	9MBvj+Gc1pVq6EpkwDL6PZBrSLvbBFpahKtnlhmrBMdcwDuqVr9WBZz7iNfytdoWx7LvXtYqXgkJk
	TFEsaGMGV0v8TFmhLCVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfz16-0000000H5tp-0TFu;
	Fri, 01 Mar 2024 09:17:20 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfz12-0000000H5sA-3Z1L
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 09:17:18 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-412c3f4c6b9so5408255e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 01 Mar 2024 01:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709284634; x=1709889434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=celeezlUFfnCgdabriQL+vY9x87nEUlib9jbsT9nzg0=;
        b=3bJaS0ryaL9sbB9ktQti0IYObfKb0u5BFSdgqq4ilx+WQDz7DslhrfnFAkRnCwR2Yg
         PRWOqE4+WccSUBvVj3+metU2BlVcQu1QtvI9VTcq/JDyvaENZkiYBW6Cy2CWJyB+red0
         ygHXlG3KCQCuFMau++ecDfJewDpnbcaqsFSuBzUT7bQ1DW1BK4/5ZsJLLiMq7n3oFGZU
         X6hnY3eJHYlPZStQ1OE8khZIAJM2EO8ApDV6pdVs2L5uGk3ACwHUcEywhKpu4i0ebJfb
         +7g0hBIXg3O2Ay6J3YUf7FrVk3fpznZ0Qoqnhh6o9Cn+eo+eV5HiCPzzajkEvzkzf4fU
         qYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709284634; x=1709889434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=celeezlUFfnCgdabriQL+vY9x87nEUlib9jbsT9nzg0=;
        b=L5HUUYNTMcjCsndYY7Vgi59QYZ4mQ1WcF7kMMCQei53wBsDM1vfxphfBPZT0CeM9Ow
         X9CnZ4sDUCkXuAWfT5Wgmjgz4AHsT7gQMCbKO//Xvee0iT2H+Y3ru3oKHmCjuuO7rKNe
         F7+NQXXmS0+n3qmhBc7bnbKEn8Nsi6rWth765fU9ns4TE+pjqRYuuKbIs/l8OJH7LcXH
         TJdRbOvgTbUOo0CH4ovB8cA8ufHtiShFxMDZ2FdfGflxZa0cPPsjYI2gjLqTA6ECAMpT
         FZ3m2SFj8jc2MJ/6Hb4IhTOZ49yGRnmX9ppZbTYfhzi1BAPjtSMaJS9EQWJPaDRpVo1Q
         mWzg==
X-Forwarded-Encrypted: i=1; AJvYcCWzPc3Fy7wRIlxTIJ0oiX8EkADt8U0wOkKixwrAZvsbtd9g9TPoq0iZmZ3dTX214K8dogz21lnhyCEGzggazGMQh+9b1jAF8y1pyI2AnzYc
X-Gm-Message-State: AOJu0Yw391qigd48lkdHiU5aLCl+ECf2eJHnNjnq6sXbTl21kuG28dox
	zmNo9Ma5OCjNWFXdanzqfH7q0UKY59CL+yuyPxLrLZc+w+ka3Xhh1FfnWjwkLFU=
X-Google-Smtp-Source: AGHT+IFB0pFFxU/+IPg3Lb+DpLxmFSKXoGv4IrPSAZpcxiUzICaAY8iLg+9vVvkiiGxUNIP5Ue4QKg==
X-Received: by 2002:a05:600c:3b26:b0:412:c810:fd18 with SMTP id m38-20020a05600c3b2600b00412c810fd18mr995837wms.18.1709284634158;
        Fri, 01 Mar 2024 01:17:14 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id l33-20020a05600c1d2100b00412ca88537dsm358022wms.0.2024.03.01.01.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 01:17:13 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 2/9] riscv: Safely remove huge_pte_offset() when manipulating NAPOT ptes
Date: Fri,  1 Mar 2024 10:14:48 +0100
Message-Id: <20240301091455.246686-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240301091455.246686-1-alexghiti@rivosinc.com>
References: <20240301091455.246686-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_011716_933840_B894E31C 
X-CRM114-Status: UNSURE (   8.80  )
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

The pte_t pointer is expected to point to the first entry of the NAPOT
mapping so no need to use huge_pte_offset(), similarly to what is done
in arm64.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/hugetlbpage.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 3d84fbc5c572..2477d20c1497 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -274,7 +274,6 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 		return ptep_set_access_flags(vma, addr, ptep, pte, dirty);
 
 	pte_num = arch_contpte_get_num_contig(ptep, 0, &pgsize);
-	ptep = huge_pte_offset(mm, addr, pte_num * pgsize);
 
 	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
 
@@ -319,10 +318,8 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 	}
 
 	pte_num = arch_contpte_get_num_contig(ptep, 0, &pgsize);
-	ptep = huge_pte_offset(mm, addr, pte_num * pgsize);
 
 	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
-
 	orig_pte = pte_wrprotect(orig_pte);
 
 	set_ptes(mm, addr, ptep, orig_pte, pte_num);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
