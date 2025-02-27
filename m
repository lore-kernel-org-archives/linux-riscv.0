Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E64C19F32
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 13:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mKs0BXcEydyZeozHRAhNyPNbGlxivFXzK1hauPmtqco=; b=UnkE7HCzX4F9M7
	iQwo0LotcCg+v5WFHsVzBWWcRJCHgqD9gKFzV8X3AbR1lXa6RYoMPSTI+J9jg1oJKnk9CAKzo/R77
	aHJ/wl41bHdG5CHhwrVZ7YQG2osi8bwzr2ox8l8h/qvJGhqicQcmly43QK6LwwHjY805bCnfN7R9x
	WZ1sZbh2Rfwxuij9Vj9JFLPhPrVepz3tKlqZoeqxONgj8DnsdMAAqZl4Tm/f8nC1rcrQtlHRLofIU
	HnkhM8jko4vdtsREn3TNl+/jgKv04ioiKmz9KP+ZrVnyR6hNGaOacI/+EKU7iZ4kj37UEzk8GuFdt
	vr8kYkmYDh85+PYX5X5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndoj-00000007V8W-21LZ;
	Thu, 27 Feb 2025 13:20:45 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnd8J-00000007O2k-1gZr
	for linux-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 12:36:56 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-223594b3c6dso7029695ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2025 04:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740659814; x=1741264614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9tq9UU0quHGMxFhwTeHcsfn2hmcgfg1pwu61qXDOW4=;
        b=a0UkG7LFEluM6Qa4WF1zkUxNKS5tTCfBX+wWBC8iSxKVxUKEGuconG1M+osHPBQfaR
         TxMENYkEMzC4Q4PTVyiS/quHPImsEYIXHJTg950w4cMUm9pXK4hzQEr5hjbx5E3q9MBz
         dEmupBPUiP724rxZZL8vYu9NmKChqGcUWq9H27T3yVslAmwZzPQ/+xgQIQfScvz0D5pZ
         g43QPhXtlmlRkUnt2cLdYKV3HaNAoemF/xGKhhAdglAndH/cTyLwlJfyl9qCuTAg2C/x
         ExtGPUL59eR/k7V3FDFOHfFJCnbQBvFh1/DfCc6AT7zvummzTUhWRK5kbvjgjElYGfyq
         ijww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740659814; x=1741264614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9tq9UU0quHGMxFhwTeHcsfn2hmcgfg1pwu61qXDOW4=;
        b=HGRb/2p4H/ROn/c55JAnBlmEH1du5G/YXXFFuSoEo/E9uzIaXqqumOOSLdX0/7I1fO
         +zgmkUPnDXTPrg9lzFO9TZ1xTESuSpcJxtKjWUKx6/uLRpXIdE6v4TuhX/aOezIPS2YU
         yUb5m5xLkmQKhjlgG4fLHWuD3yL4ArMxLD2PHafJEeKyVsJZ/W3LZ3fdsN6xceApGJSA
         Iabv65iEPvjjRHJ/1gw2a5oEsdIsEYJiwTKz12xitaDgxHhIlW3mvki4gNXkndTxDPn6
         BoO9qUh2vfTJVz3JwfEN1TmhwRUmKba455Gl+eh8KF34cyex2+ZArCs3eDV14iZbb9qF
         3WLg==
X-Gm-Message-State: AOJu0YyiXqVKIqpzqjKBBP2JbxMRSXh2Ph9WUKzZGbtm2NIVHhVcWKUU
	4NglnpXiLW18c7WEayK2VsEAYWoR4QLbLrahNOB1UgBhTfy7SyN80+KRQ25trCGSB/FSVD8f7yt
	mN7A=
X-Gm-Gg: ASbGncuuf9PmWBErcqdCbPrSmXwETGrGv7wJZogC+uno69GYIuiCSeVjQ3Vn8XoC+iy
	/zuEiDDxE5ZarZNwUoIiQuZKm0rA3UKpAconoMiDlHJmCeAuaLWLOxyX34Lmq1A1Tl/TE9nMeda
	ONlu4bdijcWYpesfnK8EUOhg+mpUAuHsK2697AkGYxbfv5aauEYg6frk8i1SGMwYMDl9LXj8Xis
	R+x7zRp0ch2ZXxYhiclG3blvaHszcJVcTFGv2YjjDksrM2Ou1QkEVXik+5DtzRq6uqAiSa+lhDn
	rVGuQ7GyUIDXMdiQUS3mN2MF04g1vfE4ishV
X-Google-Smtp-Source: AGHT+IHVfqxszUaYFM69ostPnakgkazkeqpkl6j+lHgInhnZ+gtwN2tclnkImUVqCbY1mWtl7iGV3Q==
X-Received: by 2002:a17:903:22c2:b0:21f:55e:ed71 with SMTP id d9443c01a7336-22307b45598mr186650025ad.5.1740659814323;
        Thu, 27 Feb 2025 04:36:54 -0800 (PST)
Received: from ventana-bhyve.. ([49.37.249.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5bddsm13219135ad.140.2025.02.27.04.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:36:54 -0800 (PST)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-efi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v1 03/10] acpi: Introduce SSE in HEST notification types
Date: Thu, 27 Feb 2025 18:06:21 +0530
Message-ID: <20250227123628.2931490-4-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227123628.2931490-1-hchauhan@ventanamicro.com>
References: <20250227123628.2931490-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_043655_444770_B5673C67 
X-CRM114-Status: GOOD (  10.43  )
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

Introduce a new HEST notification type for RISC-V SSE events.
The GHES entry's notification structure contains the notification
to be used for a given error source. For error sources delivering
events over SSE, it should contain the new SSE notification type.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 include/acpi/actbl1.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/acpi/actbl1.h b/include/acpi/actbl1.h
index 387fc821703a..df577bf25423 100644
--- a/include/acpi/actbl1.h
+++ b/include/acpi/actbl1.h
@@ -1515,7 +1515,8 @@ enum acpi_hest_notify_types {
 	ACPI_HEST_NOTIFY_SEI = 9,	/* ACPI 6.1 */
 	ACPI_HEST_NOTIFY_GSIV = 10,	/* ACPI 6.1 */
 	ACPI_HEST_NOTIFY_SOFTWARE_DELEGATED = 11,	/* ACPI 6.2 */
-	ACPI_HEST_NOTIFY_RESERVED = 12	/* 12 and greater are reserved */
+	ACPI_HEST_NOTIFY_SSE = 12, /* RISCV SSE */
+	ACPI_HEST_NOTIFY_RESERVED = 13	/* 13 and greater are reserved */
 };
 
 /* Values for config_write_enable bitfield above */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
