Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B2CC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 03:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QDTyzKUMYgq0HyvymhD07Mi0MvLp2Y3ck4Aw+YQsltg=; b=xdk4JQ/kKUrU+2
	puvc/rRALmpu8m6UK0CRMQbT2J1XO34W6EYcKjWKLmnOnwjBLYNlyG63/3ysnGc10UJkL2/Nc6swu
	+BO1xxDMwBIIHr+YR1BGBw07Edsmvarn9VHoI9aAo7JaXYrNJoRuSKKgFiTeZZXVyn0GJb0gkVBpE
	MxrnLrox2IC1U/Jk/isPkLVJS3Zyv8/yU0v+BIfYOBCOKzXNh8ZzHU0CTLs+zGeMSnE8zPwzl7Xz3
	Q5QZw/H4swe19XLstS8O0T5F7sMXzdp+MEYJZXFkGpFUK/6ni73/G9fN3lZWsUk0oiln8O2ghgrDr
	kdBOQoxyyJYp1gXDh/vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwZHl-0000000Acsw-3Zl9;
	Tue, 16 Apr 2024 03:15:05 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwZHj-0000000AcpZ-0krJ
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 03:15:04 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-23335730db1so2295808fac.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 20:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1713237300; x=1713842100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hheiXqV+1wPbN2r8XTJ5OPePJHFHtIdLdr/kVMTR0TE=;
        b=IAmrM/nJNeLEx8LSc93xV8LnLckhzURtO1tleZXVP85s1E7rpFfJy8nkFpBQHFEk5p
         9eUMTCSf5XJsI9ln+AnrMwG7EJb2lr9x0JzwMuJgkiawfZ1Ie/o2bzusRGEwceHSiw61
         oT50alLIhIvYYJquCyApGX1qASPZlq0896hpCpSl6PYGk37a3bP7SJzgGGmzPFWhfpTk
         8qmnftlTm2KoWDNJWtW7dmkuVA6nZuiipRWc3aIkLYQmpfnC62/DDDeSj7Cj9QxtsETf
         8znBACNbZYNFIWX4vDbn3Ce2eX/zqbSgPAuMQshwMS9JdlQmPBvaZD1L4+2XuJegL1yd
         7+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713237300; x=1713842100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hheiXqV+1wPbN2r8XTJ5OPePJHFHtIdLdr/kVMTR0TE=;
        b=aSliTQZq/z8BVhM2x9yQL7OTVWzu+6YrZHWfI6y5xb9/HaiObjipA6xoRj5rWbba60
         TQIbgRc4kbzIsgbi1TC1fV7iW+8jRI93vHq+TQIlWgaQJ8uclaIETPRAB9Qr2QjkwD0y
         pI1XcjBqMfCePoYrLBzM6gGuF0QtK9Y21X2OpN7IRPIxgTUIx07UOn8RtY+rvr5HiZQT
         BWwFgydG9lx999qlQCGnTIKJhDTzqsXJFByHTQ0fMcOWARfafwobLe1eiEwlDrPGQ039
         BtdKnZOI+ACsWoh9Dpq7HVM9wG5No+T+HFrV0MpOdlSe2y2epn/8+MZNsq18+BsK4Jom
         bfwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaMnCpkzaQPbm2fEjoewlujnRfqL3FmIqR+28rNM7bPBzdSfkQZyoyDhJQf/GeCxodWM4RlSg7/aImYiEz/ZSAcHcH2ZnDhwoYiQn8MvBc
X-Gm-Message-State: AOJu0YwBAJP1G1+WIh1/QcttNneqgY5Rp6qBhBcFQ+12dj2pW3jkxr0L
	efnxvxG/DXvflHD3qrZuQYQWbQ7ClBgXHEndN3RaqUWSRbygxK7O8xfP8nR3qes=
X-Google-Smtp-Source: AGHT+IGHqrx1cBNmqnGC6ynZDle54CpzgsuaxouCGoQwD7AV+L407iMBlKY6fL1a8Ib2gQlJQspleg==
X-Received: by 2002:a05:6871:553:b0:22e:a970:a2ba with SMTP id t19-20020a056871055300b0022ea970a2bamr13356803oal.8.1713237300386;
        Mon, 15 Apr 2024 20:15:00 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id d20-20020aa78694000000b006e6adfb8897sm7907983pfo.156.2024.04.15.20.14.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 15 Apr 2024 20:15:00 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: rafael@kernel.org,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	bhelgaas@google.com,
	james.morse@arm.com,
	jhugo@codeaurora.org,
	jeremy.linton@arm.com,
	john.garry@huawei.com,
	Jonathan.Cameron@huawei.com,
	pierre.gondois@arm.com,
	sudeep.holla@arm.com,
	tiantao6@huawei.com
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v3 3/3] RISC-V: Select ACPI PPTT drivers
Date: Tue, 16 Apr 2024 11:14:38 +0800
Message-Id: <20240416031438.7637-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20240416031438.7637-1-cuiyunhui@bytedance.com>
References: <20240416031438.7637-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_201503_440707_F2CBCE4D 
X-CRM114-Status: UNSURE (   7.37  )
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
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6d64888134ba..5d73fcaf9136 100644
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
