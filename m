Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3878BC19F2E
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 13:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E12Pn0cEB7o/5I7nUbyjJpCo3Cok0qLg37N0vPW+tdc=; b=mhEkZAC7JaTzq6
	9n2uVeb5mmWFPxlJ0OD+KNsertkzsXUQIG5PFGthV0CqBW0VgF23Q5Y5KzDyr69hBXv38+Dy9Gn0X
	ePfJ/mcOLnD0owkS9DaZnScYyoV4oOLxVgs6urwYpb7MJCErPJZzGwdjt3ijXbg616Ivlg5mJ3acw
	jlbW/1uACE9BaOSIU1TwVSdTgLaFKlc9qZWRGV4f+KKjldvMKoc+R9x9jkSqmyLLcZVkpXAG3+HgF
	yOXSFc+5zOLo6IT665vA3+zJ1zQMfCKceGlTGoMj1P6LRmMceMDaLUPUxD3FlEjAer+oxbCcmXlOZ
	DkaxDBu7815h0jxYb1Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndon-00000007VCG-2gPj;
	Thu, 27 Feb 2025 13:20:49 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnd8o-00000007ODE-26wr
	for linux-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 12:37:27 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2234e4b079cso13081745ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2025 04:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740659845; x=1741264645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcOi1q1j+KD4L6iG3zLb6+WxKLL1t6DJV3NbpeiJXTU=;
        b=IPBU9pC2E7Ty3uPOV1j9X+KWo/BTu7OcQ+lZRLVZZhp6N1auRrL1Mf7Y5pcEknpbAY
         UjE9xlisx+pP8eRdQYJH4T+3upNDa9n6eZr8rb8TngGs2079YXsVrMEvcZ0ZxghIy8Zo
         o8EQnjtjg1of2GSH7TCJmUL5cvJqP/YObtQoIMLmutoLjm8igUfWUZAUfqv5t8d19xG/
         tgGPauj0wVTDc+E49D3S2eVTK2EDQRrPuxt4fmIqJyKyBRi8ulkJB2kn6bdPU22U0ET5
         71SFlpdmezeZXbxxeW/us49ZA+HZve7vucDKWrS3B2uMKUzCiEQE3kALARd0eg/zJ+ly
         HNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740659845; x=1741264645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcOi1q1j+KD4L6iG3zLb6+WxKLL1t6DJV3NbpeiJXTU=;
        b=VoBevAxt4h3g7qYchzzK5slDoDyKgIMHf0ZMP8hA5+xnRfz4X7JRSinY4hY24iCX2J
         4+vwFAruKA/+T2tKg3Tz07TGez/OQYislluDPnQhFVkLVlRQDEHLdMurUj6ahUhNgIJC
         tjzFheur2B89jAfduyX5MwzRj9qQKx1k5hWFi6t/5N1pZEgbD6maXOsPQXvzmUxLY/2f
         o52h7oWIKfhhJEoso08j6szs9/c7broU0smh7HpE0pDDu6ZMy8+EQa2PYgNZn3tCV8Wo
         +baNj7DaB/cv/c925Jr0TNhSzA50bNLhJmAMCokgjUv2KQaqXQjF2UwUO0xx7+TwWur/
         x8sQ==
X-Gm-Message-State: AOJu0YzKptL9iKaQpN5OOToU0+CQr3zDZLRpdMbtYOIkJsdmqqG+7km7
	yZZ2BRZorDiVd6eqJ1DmiQNhdkXDcB1B8uuVejbLzlKLJDJCQ9TkRTh7q8JnU12mTevLuMAoubB
	MAaE=
X-Gm-Gg: ASbGnctHHvynu3kDnuKRoNERG2TA4sXoqxBky7gFaxRXBroxcrXrTzYUdxnntu9iMeB
	wubUeycctNjQ7M8iL4aZe/a68tnp1/Of4x6LzvhtbH9MnYE1MlGNf0kEUmLg1yS1HklQjNbQsg5
	lxEe1zKMRprD8KkE74JjRxJwKq0Kw8NmB569adn1oak38QHPPobtjAFo3GJTeitGzfJBnlHUaEl
	1Q47w5IJsbLvfOVlRYNPC+VU5fmmae/FGvqHH/gi23kL7ZuRE9P5MoQMVITJTY6MG5rvf0Otxuq
	sr2A9Xkl+IafAgC6ZyCfJwXYgC2NWW51//cv
X-Google-Smtp-Source: AGHT+IFpHziUTuaJEINi+EgHoRKrGPAz4AsnUhhSqo24MLZ7IPH1ipJJRVjiescHNO1qawzm+Z45XQ==
X-Received: by 2002:a17:903:1c6:b0:223:4a10:311b with SMTP id d9443c01a7336-2234a1033camr48544315ad.1.1740659845617;
        Thu, 27 Feb 2025 04:37:25 -0800 (PST)
Received: from ventana-bhyve.. ([49.37.249.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5bddsm13219135ad.140.2025.02.27.04.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:37:24 -0800 (PST)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-efi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v1 09/10] riscv: Add config option to enable APEI SSE handler
Date: Thu, 27 Feb 2025 18:06:27 +0530
Message-ID: <20250227123628.2931490-10-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227123628.2931490-1-hchauhan@ventanamicro.com>
References: <20250227123628.2931490-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_043726_538060_A3AC35FD 
X-CRM114-Status: UNSURE (   7.69  )
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

APEI SSE handlers can be enabled/disabled with this config
option. When enabled, the SSE registration is done for GHES
entries having notification type set to SSE. When disabled,
registration function return not supported error.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 drivers/acpi/apei/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/acpi/apei/Kconfig b/drivers/acpi/apei/Kconfig
index 3cfe7e7475f2..be1eaba9b093 100644
--- a/drivers/acpi/apei/Kconfig
+++ b/drivers/acpi/apei/Kconfig
@@ -45,6 +45,11 @@ config ACPI_APEI_SEA
 	depends on ARM64 && ACPI_APEI_GHES
 	default y
 
+config ACPI_APEI_SSE
+	bool
+	depends on RISCV && RISCV_SSE && ACPI_APEI_GHES
+	default y
+
 config ACPI_APEI_MEMORY_FAILURE
 	bool "APEI memory error recovering support"
 	depends on ACPI_APEI && MEMORY_FAILURE
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
