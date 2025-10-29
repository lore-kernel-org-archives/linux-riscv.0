Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F145CCF9E9
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 11:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XozPmFwrf92jnu4JkG72j/IYDDGjsrLnN2Ogr57LO+o=; b=viXLHm/jc7hp/7
	JmU7fYkLUxk5l8PMBtSL2IaW2AUPzAM+BgFRFSR5+ExM3xT1Pjbk18lKr3WQW/QwovpHkZITMYB7/
	LI0qEzhm8LNggrylKXKMO6NhaPGdc64ZLzaQ4Y1BFiNGzyqvpwta3u2reOXAW01D6k0LVAszAnrWd
	y2Vu5ewK3Avsio0R7kNF2M9sOU4uNA6Muwm3N4XHxR8pC2T4KyYunPQ7rmZEKpigLPrdiKSn9gKeG
	k1giGeXoZ5y+UKhR9jjprqc12gq5EK5tk6MfHpsU3LunOyKkgEd86qlKPD8oTjHmdIunVyZGyDf4d
	4pE/m8r0ddPW+UeliptA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Kd-00000000xsR-0WTh;
	Wed, 29 Oct 2025 11:27:11 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Kb-00000000xrA-1mdH
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 11:27:10 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3402942e79cso2815162a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 04:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761737228; x=1762342028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fc2pmS4Yu1PyEFNeNlAsHoxFDYNywDlEMWQLdy1zt3o=;
        b=CvmOxhVh077YlyFsbTYcFc0cGveYOfvHgZSfmZD6QEQ5E7A41OX4BGTswrS+vLKdUH
         s7pHkGjD5kmCbvKXmBdZ5O64qzVqOp1jA3jHuaYtjMWMDhoRN5B2b7oC8MvVtqRu7Cgk
         Ei2TMeVohI+TkOxi5r1ar/bNl1OGfkfdZq0Codve5yz7Z1nE8eo4g27aCeiA2or75M+S
         98MfUF6cgz/OHWWveHiw2aj5TvDNrrrBI19dsTxRb43ruJVjvpRJWWD4GT+KBvX/vLt2
         T+Y3R+OLTr4eYsMD/EsKw/aOhu6FRWWpwYvZs95jKuKju9wyu3A5zmTtXAd9yLkCEGXw
         m2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761737228; x=1762342028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fc2pmS4Yu1PyEFNeNlAsHoxFDYNywDlEMWQLdy1zt3o=;
        b=bzWzgmGAiLJa/VSmbKOfb+8FX+CTQC4jne4KeMTzzWNvsf734jJ0b7T0yS/iBBw/VR
         1c41eYbgQ2KlzXlit+5CUTPAoM0HRUwaou6j5QB7srAQtc8qcEj5qyX60uNDI1Mx04C3
         m4USxRUPFKeYk9ixEKLyeb7nOZ8Uwo1GSXjJT+5T2+4hv4nEjJQ6VuIYk0EBeOfoeqiW
         oUji0rOx2R2HX5MyKMPBqi8Dukvi7QLMuFceQe9f9xGs647NHmwBFo5Ml724Eg5Lpw1n
         BvI3uwYlIWLo4uP8PgKbYeysvNiNmScSeI/Uks5XXanGRJnv+9NH5ThACIv4nnFrNmSj
         zRdw==
X-Gm-Message-State: AOJu0Ywz/xkibZxlKAoHj8y6Y00oTvrKrsHBNLPinlLA4O0w4AHsYxRH
	CMDMzQn5TbwuYFXi0aC4PQENZVZGFeWA0Lj4ov187XuUoQO+5Kx3zgtiDwtb88YnvOm3nTvmpdT
	lfCim+Ou2BA==
X-Gm-Gg: ASbGncvaCuoYUU5YcAJVbTzdhrdC8a9nozQlhGxC7fX4Yg8Xvs6vr3hzGFSNUg1wtAt
	RIJGn6du6/YFHnb8OkWHOO2QGBD2zQMpSc05R47PbcM58tDewZS+BebTnJaeCknENx4jiggTAGq
	wOyZa8bVT09YQo5N1bPVE46udxh1NhXJFVYKCDDd9it+k0UACV8c0uYgngDq/SmbOF6t/6L+sJu
	6YrCjcHi9Z0F/P3deeY8Kff4PFaKy1+Kn6ZtHcsOY5vAwIFK+zPzxE61r4j/CW0MR7LuD+yF6Kq
	hHydT+I2E7dw+cLozTsm/VDXszjAYfOR3FAE9klU1kdVi6noNn3zhFwmxHBGzajxPzmX81qpI5V
	XNOj+YDrCQjetYnJh7qUnFzV72JccaGVImsomfoMbhPARuuvJoSTSIemzo1bnXVHIZZl8I0Uria
	L8nEadnAkAsKuo5r5EZFJaUItmINJa
X-Google-Smtp-Source: AGHT+IGEAqFeWf0ftjlgJx4OkwPZYhleAzhblNhIB2XsxH/EACVURZv5OiId6pITaCbKSnoGThy0lA==
X-Received: by 2002:a17:90b:2811:b0:330:6f13:53fc with SMTP id 98e67ed59e1d1-3403a290f88mr2790213a91.27.1761737228426;
        Wed, 29 Oct 2025 04:27:08 -0700 (PDT)
Received: from ventana-desktop.localhost ([2405:201:d019:c0ce:f7f5:7789:48e5:c03f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7f6040sm15316918a91.16.2025.10.29.04.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:27:08 -0700 (PDT)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-efi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v2 01/10] riscv: Define ioremap_cache for RISC-V
Date: Wed, 29 Oct 2025 16:56:39 +0530
Message-ID: <20251029112649.3811657-2-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029112649.3811657-1-hchauhan@ventanamicro.com>
References: <20251029112649.3811657-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_042709_485444_AA9A17C5 
X-CRM114-Status: UNSURE (   8.04  )
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
index 09bb5f57a9d3..5550b28f38db 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -142,6 +142,9 @@ __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
 #ifdef CONFIG_MMU
 #define arch_memremap_wb(addr, size, flags)	\
 	((__force void *)ioremap_prot((addr), (size), __pgprot(_PAGE_KERNEL)))
+
+#define ioremap_cache(addr, size)					\
+	((__force void *)ioremap_prot((addr), (size), PAGE_KERNEL))
 #endif
 
 #endif /* _ASM_RISCV_IO_H */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
