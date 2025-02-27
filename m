Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8FAC19F2E
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 13:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j4rAckcs4wwEbhD+ZHyXg+mX0QTBn0h05XG6FOMCxUI=; b=wpxqxg21WCOXJ3
	1QQqwojNyfnGzmtTvE6ZFgE24n37IHAJj+cp2KbLh8TTiZkPR5TztsQ9J2O4eZ4Xa1CydjLCGIXLl
	XSQ6Q7v6AO+Fo3GqZUF+JlkhsVFqehKttHBY7FFKJKnFSqkVkDq45u60kqIx0TkXxY6QnOhxT3uPE
	9fRq15wLV21AN0BtAF6iyL6MXGVa/ARjhSExfhRx/+XHIFZUP2MN4cALawLCumbJKx5LJj5eRM422
	9+eipcd3jXopXb0KEOBfiHmtBB2N+/AW5f6cOFvgNjolkZM9CcUh57w3FmjDo2iyw09c53IvXCWJK
	ys/Z8LDPHhpWIaq64zSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndoi-00000007V7f-0dFE;
	Thu, 27 Feb 2025 13:20:44 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnd89-00000007O1O-0jUj
	for linux-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 12:36:46 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2fc0bd358ccso1649264a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2025 04:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740659804; x=1741264604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JeQ9SvTwKEilvSawoBKDfpL5rlVs3kDSMMrIWfL/lr8=;
        b=R0FqHaJaZfr5mLYLuiWP9GPSQrqm2jUyCDiRNaML6UIH3cydXLM0vQMYTwqVxzGOn4
         J6WgBzD2bqcmiCeXerJUvQ0rbiJlzzVvrfvQLw9wub9Ou1ACftUe34GUzMxdJvRMljxC
         hs226ajxrpoZaG/q2bggMxZF6bbvAqcnKJgpVgG45Tnk7Ka1Q0TTK3xIlCCPkEBmZ+Vd
         471LCZR+u8eOor1mtBZLYnEvNmTpQO1PtfpgYP8s2QidZFOJTsbekhMKDlsmbxPI7gPb
         NmwHCY2N22YxNmKn7hMG/MrqAoBgrSw/d+CYnovd/UcLCtgAkneQ77/v/jTlbHRuVi+x
         5srQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740659804; x=1741264604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JeQ9SvTwKEilvSawoBKDfpL5rlVs3kDSMMrIWfL/lr8=;
        b=v0ejz5Tys627NfL1Lc8/RSXmRHu5E8wU+HgtyhlIUStV68EnPiC0bnpHy9d2wHhiGz
         NVakAV8V+0SnSfTdNBEl8d4QXM7ph+f3NXu6CT3G5Ua9t2D7riYGjliwZ7tVP4WtoM0i
         sywP3HH2CeKkD+qjdgdgt4EJ9vv6DBIj7crjJTjVltBdDDgKzqO0Q4cVhIobWQ9U+kfh
         Er0qy7gggC0G7rv8/+nPxQJwJe7jOHpDdjSkVZGbWwQjmmIXxXBjEiSV0s2BXgfI0uo3
         htKI10O6Z479/oekna/QPz5sYdScO2PlmkqXrddCEBqOs6KttoXWhi062EoWkLvj1Cyj
         sufQ==
X-Gm-Message-State: AOJu0YwXFzyECKruBFmWxFkD3wDVMOsMdQw37/X+JAyobOCwca82GzZc
	3AFgM7usL2h9qvMeApwz7zaz80FOl/BXubLWhEZx74JLcOgAxH2prunSdMta6Nth54S55i7zwF+
	AatQ=
X-Gm-Gg: ASbGnctojqTQgZKYT36ZhNREljBrFKErhERorLi1Rv1D9BSmKsjcyP3mW9HcNinY8y5
	77bzZsnDOIsGbMvs9g8Hjk+F0mhxXtFk+wJouKfyoErxLzdvP9LzUiFB0GeIKrXBe0biJ/bJFpR
	PEtfC5YQahZP2N88WrH7J2CrKSd9cucnxosgwudNIXsdSQbp5WpQO1t6p38buTAodylvrga7fkD
	V3AEf2EZ016Snq2ZSL7hYieeaF7FpVaUK39eW4wfpvJ0utAfPXlQpcXOKSgvXy0txc7yJlP+oqv
	K/Ei2C3DGuI6YJbWUecIQXCNE4JTP3l0gGRB
X-Google-Smtp-Source: AGHT+IEWiqnbZ4w9mnQftgIr33jcau4DSGcKb/iqQJqvpeA7JbmmClnCCIaI0W3mRc0c/5zLfcvALg==
X-Received: by 2002:a17:90b:2dc8:b0:2fa:ba3:5457 with SMTP id 98e67ed59e1d1-2fe68ae6c4fmr20594318a91.17.1740659804130;
        Thu, 27 Feb 2025 04:36:44 -0800 (PST)
Received: from ventana-bhyve.. ([49.37.249.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5bddsm13219135ad.140.2025.02.27.04.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:36:43 -0800 (PST)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-efi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v1 01/10] riscv: Define ioremap_cache for RISC-V
Date: Thu, 27 Feb 2025 18:06:19 +0530
Message-ID: <20250227123628.2931490-2-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227123628.2931490-1-hchauhan@ventanamicro.com>
References: <20250227123628.2931490-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_043645_209334_D7A9400F 
X-CRM114-Status: UNSURE (   8.82  )
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
Cc: apatel@ventanamicro.com, cleger@rivosinc.com, tony.luck@intel.com, Himanshu Chauhan <hchauhan@ventanamicro.com>, robert.moore@intel.com, conor@kernel.org, james.morse@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, ardb@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

bert and einj drivers use ioremap_cache for mapping entries
but ioremap_cache is not defined for RISC-V.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 arch/riscv/include/asm/io.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index 1c5c641075d2..e23a4901e928 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -30,6 +30,9 @@
 #define PCI_IOBASE		((void __iomem *)PCI_IO_START)
 #endif /* CONFIG_MMU */
 
+#define ioremap_cache(addr, size)					\
+	((__force void *)ioremap_prot((addr), (size), _PAGE_KERNEL))
+
 /*
  * Emulation routines for the port-mapped IO space used by some PCI drivers.
  * These are defined as being "fully synchronous", but also "not guaranteed to
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
