Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E86C87FCA
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 13:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lMh7jDGj7mLXziaGmFfM8jqh+MJkaM/mg2VVmYNAbe8=; b=ol8HxaQ4a16Oa9
	FlCecqleEn3c3vuxoWjXvyj7M+2iYFyNmSNuJ2WgQkGDrZkOv/mdu5d1xo6afRz8lxsnyEeEQb0kf
	xnxQsh7zZJZrS+Sp+GZCFLxQCEblxrQmQ25XbyVaMYcagQIVXO3PXkk8FpraQiw8BM0YrhAXVzQxK
	RQtUvc9f2zzPClhvuKdJnzpbjvRw2mDesH7ds2evgG1QfV2Ij5HEL0XbYT6HcoSKwEr6tTIKNa/FJ
	tGZpw/h8D2l+gSd6oOoF+LpDQ4EaW222bZD79hkXJALLmfGHOdG3Eq14WDue44PbnN/WGI9YKqQwC
	ngg1j/OzwGXp67O0IT6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugkDT-0000000GnOL-08dx;
	Tue, 29 Jul 2025 13:18:03 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugkBa-0000000GnEL-2ey3
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 13:16:07 +0000
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 43D3B3FCEE
	for <linux-riscv@lists.infradead.org>; Tue, 29 Jul 2025 13:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1753794949;
	bh=8mHLBuTzC98LIzgNpd9Kf1f74WAo1lI4NdQKyG/FFBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=doXRXmb71EiVOPLPG/qU+djR45uvivnmqxiGgnvA/kS9jH8ZYBiebAhEaAlA3xBQ4
	 gRTgXKV/2lvKqDoLIO20pUAl8ZKTcILHrlqPjmVVeyH5wQx4SN+oKDPeq3Vkvu2SxY
	 JSw3pjoW7vdkq0ShTebgpFyRhDEyMydgTFTwY0GeSUGl/YWMY1e0rqSveItMTYCqGA
	 kC8iByAEDggo5a8lgB+eYetmBr5YCaWcd/amla4woJYqO3yLwFARxXuNrqXizDJhHF
	 6v+H/6SGcCX3UDup96/UAzVjhdiI0EAg/fg5KeuyEzdMnqp9QR+9J0ovhBPPMv4Yrh
	 f/3UJ7yu/t0LQ==
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4560a30a793so19052425e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Jul 2025 06:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753794943; x=1754399743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mHLBuTzC98LIzgNpd9Kf1f74WAo1lI4NdQKyG/FFBE=;
        b=N7jcS5POrjEUd9bQ+iXB6jZUBDNqsrF8bBjW/RfE1WO/twjYIlCyw5ZmsMtkYiRiLs
         GSeakH1yPOStMaosKzllVKPRNaU4SKuPLafOn2grZ/vquT1Lsn5uOXRONvi7XyIQnrG/
         IDCzOTftwLdeN/+QqtH6ZWLJnk+cGxegIzZz2UvgoLxzdKh/etSWoxS2V0jEACYYzjTJ
         qMyoV6Kw6Aatwd3Dt+n8ZTs8sgWHVje/y8qOSZ1MILb9ehABSqavSNwV9p+zKIVlF2+R
         pSGyMcYqX+PbZfiV86OUTcDV8wlbvKmuVgB5ZXeL5Momr0G4W9jMaCqYeZTGNqNDHqE+
         Nb+A==
X-Forwarded-Encrypted: i=1; AJvYcCXDBavjBz5LuzmuhibfRWb8QkILpn52AHy8Ja8EYvXuzk87VQrpwiX6IfgYnuEhJskQX+fPbZbOvtZ0NA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTJV1ilXFZGrrOcQztTOqA4HB6t8mZAesExLj5asjvhkkUbKSK
	pUB+llx2aYmUZ3kNnP/pt1M4pEx6yiM99mbgHkGKLmMACRLvA6xFjcjfD2K0ACHe+RrBp49vnwY
	Oudv28pTeX0olFFMhdxmPbqr+ZojSCdqLYq6M1yf0rJPTE4nVdb1W8j1T49qrhZTxD6SyZIOLQC
	qebQlT5kiw5w==
X-Gm-Gg: ASbGncuUG0gth2bDNOgPsn3Y298I48Pfz12LK2+XOz4mN9RVM02LPJ7G0Kk0JIeNGAC
	I2+yl5HnOaTm+KQPSGfDz+hq0yTOXyVJ2ZJDVuV/44rgmgjOVoHEqdw4Omwjyum0S5RKQqfq5b9
	fsXVCAIqhhbSBjX4u3fzP/oMeG1gr6V+uX50O69gQly17cEKl/E3tXPt+8uWfrM67hA/ZV/ogKW
	23ukfXCxY/CO4Qg0VeIZDOksfsCWfMK40P+ksRY8eEOYG2eoOfBF3weHGuABySyqDJRotKEXS+9
	n9XNiqJNq+Foej8GB4j3PZ7Z1huqOnzpnJGJz9sQ4ahIosMPXHSr0uNky4qdU5yeFFpS3kzqVYx
	TAbmZxle58sYPOGXIM9d/Zeb23W4obQ==
X-Received: by 2002:a05:600c:358d:b0:456:19be:5e8 with SMTP id 5b1f17b1804b1-458827c18a4mr74278665e9.20.1753794943019;
        Tue, 29 Jul 2025 06:15:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFEgKXSP/cqBIEsBU5ORHg/b6zfhpLYR1Wb0W3l+PyFvCX+IqPWXeYXBbojnUcAC31L/JA5g==
X-Received: by 2002:a05:600c:358d:b0:456:19be:5e8 with SMTP id 5b1f17b1804b1-458827c18a4mr74278385e9.20.1753794942609;
        Tue, 29 Jul 2025 06:15:42 -0700 (PDT)
Received: from workstation5 (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778eb9bdfsm12024338f8f.20.2025.07.29.06.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 06:15:42 -0700 (PDT)
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 2/2] ACPI: support BGRT table on RISC-V
Date: Tue, 29 Jul 2025 15:15:35 +0200
Message-ID: <20250729131535.522205-3-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250729131535.522205-1-heinrich.schuchardt@canonical.com>
References: <20250729131535.522205-1-heinrich.schuchardt@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_061606_797668_2BBE3760 
X-CRM114-Status: GOOD (  13.17  )
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
Cc: Ryan Roberts <ryan.roberts@arm.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, kernel@vger.kernel.org, Yunhui Cui <cuiyunhui@bytedance.com>, linux-acpi@vger.kernel.org, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The BGRT table is used to display a vendor logo in the boot process.
There is no good reason why RISC-V should not support it.

Remove the architecture constraint.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 drivers/acpi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index 7bc40c2735ac0..2b83c91bb1a78 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -460,7 +460,7 @@ config ACPI_HED
 
 config ACPI_BGRT
 	bool "Boottime Graphics Resource Table support"
-	depends on EFI && (X86 || ARM64 || LOONGARCH)
+	depends on EFI
 	help
 	  This driver adds support for exposing the ACPI Boottime Graphics
 	  Resource Table, which allows the operating system to obtain
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
