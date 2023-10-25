Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7F6C0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C7UnhUoUAOpSEzRNauCtvv02HAgBOz4kS0CTfYrSdP0=; b=GUhgXhsCBvNukc
	nQ4yx0hbhQ0eke4lSQCbgjca+4dVr0g5JzoK/0B09wL0GiRYZ2sTp/o36DGeP1tvxjx9V5qe/ZWQy
	+wsa99zbTZE1VpfM0xkkpktPnR4z5vIDcIFH6bY5Leh+pqKqAbBUs81K+FTKKJlv8h1xAX8Nq7Mvu
	0hqgCizxp9SVenSAxYAgB2mZKWIds0yRrrd3+Pgqzj8OGxpubOgJEZUFDxISOvnOelOv6nQCStCL0
	9fi9rE1wtqFZq5uZEtYA45s38xHwhIdK5V5CTVbJn6YbVVWRPQIjkyv0YtSgqk5iJ0qdbhgCBnBTz
	XHxGXxhVlW0gN6cM6OLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkR4-00D2xh-0r;
	Wed, 25 Oct 2023 20:25:02 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkQn-00D2jG-2U
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 20:24:47 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-577fff1cae6so96829a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 13:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698265483; x=1698870283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmA5kOKekb5h3Uw1k+e0LhCWijGnTH8utnJ5szxpch8=;
        b=Yjc4OzVvmyBXhuGn5ijt30oS0vhR3dNeyoexA9Yd7YbwjZPJYmgPzaOYsE3sTUiICP
         1XMAQz7vvd1Gq3C1VePem2IT5mvPVWkTlXdgDpTiMb/bPQXvwi2ew1zOFf1bLOFaTayi
         T5KZD5ZZIwCis6PXFGJWrIaj4HWICETj5TMQSb/W+9FLWL+DY3xG4C+1OCxt7mDVpxxa
         e+YgHqBgD9OCuxBi3YwYYY7TPGZcPc1WQXc25drzUANzyhNNMaiqdoAkXc3aNbjIuQcN
         PMW2XaJ7tHf8606j6RnmbvvxUzyXwVZ3FEwhNgVWdlzYZAKFyanTz2sN9uR5/0gWjb1K
         JJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698265483; x=1698870283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GmA5kOKekb5h3Uw1k+e0LhCWijGnTH8utnJ5szxpch8=;
        b=a/K6NfJgFF6MJaTbPBxblh9CXXyWw9a17Lp/y+un+yWZVr3TQOBAKFny/5MWZVkjq6
         asOsnA1m175S/29phVa7gAEhwQEqs9P6caGeGPQxRlTA8YCs6kfMCLgcRFHj+NCG+Afa
         /Lw9KN5wqFQqGerTgxyaGb/b3RLmpCHQKYH9FbJNUGmk3F+8oaPU/vDe2VE2OBs1UQXj
         uQO8g3vpoQLriYB3ZKaJ/oR7YJj7pVbU4q9VhD92Jz44WNSDHNAV9iNvhzHVU9ZS42jx
         1BMmlmSfELlrDLclQExJDcyszoS6SY/oSbuyDqlkAx76CCjmCjfrIJndHLCzblTTjDOq
         0Q4w==
X-Gm-Message-State: AOJu0YwX2C2UAeX91c37gZNRD0ztudTMgZqJQ1qFwqbBpd996Hh7Kfmb
	WmUBpCNi5yeoC/YJe9Hd5sfaAw==
X-Google-Smtp-Source: AGHT+IEWaGrpkEpDFbneFUdLQrgY3wxCJPmh6tSJaEBSJOipB/ao+CEA+asAJLO3X3etojz+m4Eg/g==
X-Received: by 2002:a05:6a21:999c:b0:17a:f4b6:bf89 with SMTP id ve28-20020a056a21999c00b0017af4b6bf89mr713082pzb.31.1698265483317;
        Wed, 25 Oct 2023 13:24:43 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b006b84ed9371esm10079590pfo.177.2023.10.25.13.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 13:24:42 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [RFC PATCH v2 06/21] RISC-V: Kconfig: Select deferred GSI probe for ACPI systems
Date: Thu, 26 Oct 2023 01:53:29 +0530
Message-Id: <20231025202344.581132-7-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025202344.581132-1-sunilvl@ventanamicro.com>
References: <20231025202344.581132-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_132445_817197_C8EFED01 
X-CRM114-Status: UNSURE (   9.39  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, Jiri Slaby <jirislaby@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On RISC-V platforms, apart from root interrupt controllers (which
provide local interrupts and IPI), other interrupt controllers in the
hierarchy are probed late. Enable this select this CONFIG option for
RISC-V platforms so that device drivers which connect to deferred
interrupt controllers can take appropriate action.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 8c105a151e12..b62441aefa6a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -12,6 +12,7 @@ config 32BIT
 
 config RISCV
 	def_bool y
+	select ARCH_ACPI_DEFERRED_GSI if ACPI
 	select ACPI_GENERIC_GSI if ACPI
 	select ACPI_MCFG if (ACPI && PCI)
 	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
