Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95DBC54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 14:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+h0ioN6U919+MKlQ1aQW0lOKgL83l6aaPBAfQclCLY=; b=fZ47yF5KP4JJ9B
	Q24R1ONLtvj0xHR3XSs56XO6txXqZZ4BoGYy9k5rYHkyFqLg41efr3Fq45MvtlLmBQ/EdzOmbjCdt
	uIVJx2n8mg4lPy6z8QSPxyUhD9xYYuT17Yb6uUZZRMFTPSiqtflCToBIUyQYV+jGiZgrU43QAxpXZ
	h9lsXZeQfLfXx8EsweRiWOkzeFNQ1V9AtShmEdqtI6OiVzrr74p9+QjtRQI4ciBUfm/TjdqVjL3E5
	ttUGwbrmnp2m5dHkIPTBOe5YJuIEg7Iu7ryc7GpN9FbsFKsCvW67OA94hbt3pftrrlE5n0B5P/7fO
	HTXrMscak5ao4OlSmSfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUQo-00000009X2x-3nrd;
	Wed, 27 Mar 2024 14:39:10 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUQi-00000009Wyp-3Hwp
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 14:39:06 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6e8f51d0bf0so5490203b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 07:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711550343; x=1712155143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0AzSaRQJwXSxwx5iiJ6zneJA3nuf+fSMhHCiVSrF4A=;
        b=RNCS7mkZ2z9hMqUGii7WGcJhDgyhfhswsSn/FvOCMfLV1UvApkuBd79Oy0OfWKGteP
         vfxjWiJ7G1ejomPvfdDOvJCQuXoBfn0qTROAW78il0gnq2VD6aT5Zr28kQ94ZggHFO6H
         2s0yiFkml4S/mAFPmKVWAVnWhb8MHbhSaL8G33FLP10R/GoXsgM4GQvz+awRbyCuLdnO
         WB5pq0ClxACgy0kUQfe1XDaFxvsVM2ZfLv+t6QOdSUv/oEcHdOrgd0V0JVYuyKjdMNed
         sy9DsSxTg84OVb9PF0HCg6zr+NoNHuBOxfybqA6z2q0DFkbJpqdzTyM8wwvkuHEuvCi1
         k/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711550343; x=1712155143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0AzSaRQJwXSxwx5iiJ6zneJA3nuf+fSMhHCiVSrF4A=;
        b=skSiYeWxM7s2FikD9+IRF2hNOcqBtfNQEspVNLTMZAN5EVbKe2mwkyct694NjA+Mdp
         2M7dgd5YVzNmTLCaEkHQHH3VoSo9C9W1jJV1WkwibjuNuY4U4OiBF3LGo1b7H4nHDmjz
         Rlgh6mK0D3zAQmuz9gaMRKGMNpn4W/hEw+EiRntr6WArFNWYBGCgHH/qQfCKnhj5p9Kz
         Y0MIvlV4qCdU1ta/ZTBzZqOclcPZKFx4uVVLJg4n3QwGRv0IKhp9NnT91wCgTZoURRH/
         AFOE1d3xOJYmECWS1qY0HSjm+KE2x3s00iymwwzAHn9SEuyyEJmhEmhmr3pPvhLVmK7D
         keHA==
X-Forwarded-Encrypted: i=1; AJvYcCXuTT4+yTcUMxKYqAb4xhQJHq4y5zTRfUbYWgByHsr19N+pdH0ySEOQTq/utshof+sn3He4qq/HjmXfgjwhwzkpPfGtsqRDlZDRSrg6dxA1
X-Gm-Message-State: AOJu0Yx+11UlRHC9aQiWpEMr+GyVa0mtmcRdyDlK3gRtn38cGyNukoFV
	SyM10Ij5PI7O7GrVD6fPIYvXD+zGCj9IBg219MsAMO4bnIP11DpFvtTXlhYOJeBX058ipMH6FAc
	a
X-Google-Smtp-Source: AGHT+IH/ebSalRWt2uTxjzZEtKHpuAG0RFfwjmBKe4uABF7Y0blk/sGKnudKr8LhvhR4OolR2BiRpQ==
X-Received: by 2002:a05:6a00:1a94:b0:6ea:b222:3932 with SMTP id e20-20020a056a001a9400b006eab2223932mr9719pfv.9.1711550342737;
        Wed, 27 Mar 2024 07:39:02 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id kt1-20020a056a004ba100b006ea98271e43sm7915574pfb.144.2024.03.27.07.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 07:39:02 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	David Laight <David.Laight@ACULAB.COM>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 2/2] riscv: Define TASK_SIZE_MAX for __access_ok()
Date: Wed, 27 Mar 2024 07:38:13 -0700
Message-ID: <20240327143858.711792-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327143858.711792-1-samuel.holland@sifive.com>
References: <20240327143858.711792-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_073904_891917_32A4997E 
X-CRM114-Status: GOOD (  12.50  )
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

TASK_SIZE_MAX should be set to a constant value, at least the largest
valid userspace address under any runtime configuration. This optimizes
the check in __access_ok(), which no longer needs to compute the runtime
value of TASK_SIZE. The check does not need to be exact, as long as it
accepts all valid userspace addresses and rejects all valid kernel
addresses; well-behaved programs will never fail the access_ok() check.

For RISC-V, which requires all virtual addresses to be sign extended,
the optimal choice is LONG_MAX because it simplifies the limit
comparison to a sign bit test.

This removes about half of the references to pgtable_l[45]_enabled.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Set TASK_SIZE_MAX to LONG_MAX to optimize the comparison
 - Reword the commit message

 arch/riscv/include/asm/pgtable.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index f5cc8bcc7f8d..762a85551764 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -870,6 +870,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
  */
 #ifdef CONFIG_64BIT
 #define TASK_SIZE_64	(PGDIR_SIZE * PTRS_PER_PGD / 2)
+#define TASK_SIZE_MAX	LONG_MAX
 
 #ifdef CONFIG_COMPAT
 #define TASK_SIZE_32	(_AC(0x80000000, UL) - PAGE_SIZE)
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
