Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88561C25B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 11:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O8K6mHIggkIISY3EjrYJUB6h5KmPA4/cf+aXLkhGmWg=; b=tAQakwq3uXIJz9
	NCVT0wSF7pT00qOlPEjKblc4Je1K9AFsfBF76dA/fh7gudUkjTzaKukFq0FFuEd39Rh0CAl9NRTGg
	1C8AC3YvlsdhzRqE9c4NAscadsM00UuKmPriTs0iZG5Cymi0ZiidMf9iVbekQY9VSG8pdQanlBewN
	g67Klo7GTccpxr0FJNj8a97rvkkOoMeTpyDXF2RyhwUVF63bWrkTh4+f6PnsNFBmaI83J8CRZGmD7
	SuAY35omGJ2uqWtbFmi5s11ZrN9bDUPDSS54JeMDqrDmV7gvw8Zi3zq9KKWXvqNFQJ3mUdnXdBL+c
	Va9e/3NTEth2XnwrWAVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA6OV-000000060GW-2XrY;
	Thu, 23 May 2024 11:14:00 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA6OR-000000060F9-3sua
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 11:13:57 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1f3421564d2so3142965ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 May 2024 04:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1716462834; x=1717067634; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKyIwcUjX1px2GE9S/CV6LaiV7WK04/0FO5MZQuO7/8=;
        b=X9dJ+pcNPcz1MyOPaS1NWEKsKufs7D1y/Wd+s0darkhiX+3sXtp8ML2BFwZf+nJrGy
         pHnaXMA1v9+jbeHQ/emFrKRSUhRjCz3wcyDgN+BwJPhW2E4vvsU806rR31XLyfcsVi4Y
         eT0u/AT/a9y/cCnnkCs9WFQ4yl9i6mbSawwlkcm1xGBT11qC3IVMN0feCGXWjac1F6LU
         COIZHGmbUg0sB59XZueCMcEY26TT6FdxbJD1RXqKF/wsy3ZnaKHXqTMpwZrQlm5ODJd6
         aDQhbZZCU61kSbTg9wQfra2CSnl1p3BvRpfmILLOh9sPK8gW/DzyD+Bg9RjrZeTWjRrb
         Os9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716462834; x=1717067634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKyIwcUjX1px2GE9S/CV6LaiV7WK04/0FO5MZQuO7/8=;
        b=cZtmfF2azIyvuI+dCCO+Ly5HPxggFke/dEIVTHUbjXc5ARgOAxqCCyNy4iZsRbbix7
         PJr+PzRWTddwhkVgJArZ57wSO6PTdiTdkJ+W/j7MAkEJVE2GTzc5Exvr6MTLUGqf882b
         JI88uiMJWuK2/14216Fdq303ta8rkqHB5/PP9FfPNxKs3BV0bJjNrsYKGD5yOI5yFIUy
         TuB/YBOn1atNKEiypMHKfVsXIK6WGPyyHUzb8aXnYlDyQVuLKKLwrRFXqP4i9R3QRQ4+
         6Ay146DpDl3MfX/mjIkA1+FUOSfv+IcP6UWrFzXxt+BsWH0A45vHSZB71eiK3KMfNjob
         /X1g==
X-Forwarded-Encrypted: i=1; AJvYcCVmhtgW3iuXxYYU8s4F9j2CHfZPfCSKTatfSwB3SLNFg4H1qB/DvMPHDI68YYE9pZg3pDcdJWZg3yvVDJbKuPH0Am3iUgyyKFhnVMQer+Cm
X-Gm-Message-State: AOJu0YxLk/yvU+cvjOv4Wdr7wAvjcvpJXBq7G4k7UeUaf0fNsvbIq+bT
	YZ1N9jD5XZpfBtDXzU6JdS0MelU34j9sV75R3VEdTiLUQC5CrNzTFmkajNu7C98=
X-Google-Smtp-Source: AGHT+IF28aGrHScmfXD9R1tHK/6jmVsl792vI89tw9o1F0p1t+mCK4U7dtx62wkc9E7Mq6lP3ETRug==
X-Received: by 2002:a17:903:1245:b0:1f2:fbe5:7d62 with SMTP id d9443c01a7336-1f339f602aemr23791545ad.33.1716462834501;
        Thu, 23 May 2024 04:13:54 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f2fb4ca0ebsm76399555ad.119.2024.05.23.04.13.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 May 2024 04:13:54 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: rafael@kernel.org,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	sunilvl@ventanamicro.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	bhelgaas@google.com,
	james.morse@arm.com,
	jeremy.linton@arm.com,
	Jonathan.Cameron@huawei.com,
	pierre.gondois@arm.com,
	sudeep.holla@arm.com,
	tiantao6@huawei.com
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH RESEND v5 3/3] RISC-V: Select ACPI PPTT drivers
Date: Thu, 23 May 2024 19:13:22 +0800
Message-Id: <20240523111322.19243-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20240523111322.19243-1-cuiyunhui@bytedance.com>
References: <20240523111322.19243-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_041356_056839_79BC1324 
X-CRM114-Status: UNSURE (   7.09  )
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

After adding ACPI support to populate_cache_leaves(), RISC-V can build
cacheinfo through the ACPI PPTT table, thus enabling the ACPI_PPTT
configuration.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Reviewed-by: Jeremy Linton <jeremy.linton@arm.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index f961449ca077..a9ebecd72052 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -14,6 +14,7 @@ config RISCV
 	def_bool y
 	select ACPI_GENERIC_GSI if ACPI
 	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
+	select ACPI_PPTT if ACPI
 	select ARCH_DMA_DEFAULT_COHERENT
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
