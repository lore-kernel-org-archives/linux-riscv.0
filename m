Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A63C77B75
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 05:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QyD8Y0yh/CLX0VtVDG9HF9uZvE2uTPp5hGlCvd42r0E=; b=SlPuTw5xsT9GCD
	iXg1PHjFZRxRnjHB5QXc8yjvYIrZyXwLQbg4aCGi1pq8OpAjFWfBh42rN9Ou9+OxsyS3mgyE+OX2r
	cRMEFqgn/7Ot5PEl7W+opuJHCiOjjQlUbHxJbmaL6/GYwqVcs+xM+oV8mIpqXG4GxbhF911yFI+Ih
	0WFcpxJs4ErEM69+fRiLb4hCG0ElxY09Oxh4v6Eb8nLRN9LVRXBgQySwvluf2iK+GyeqoDlTG41qq
	Zk6OTdgY2/DwjgKVA/lU1iq4o70P+uvTyS2OQDnuio5bwG7ROkFPC7pibohrLU76kccM2vkazlRyM
	d+Ds8yWiuKG5CJZTosTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR82-0010rs-1i;
	Mon, 15 May 2023 05:52:14 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR7z-0010kR-2I
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 05:52:13 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-52c759b7d45so11301087a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 22:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129920; x=1686721920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+OfAZD2wx9PpRLlK5NDY7msLe+VFYQ8VG8zPNASdds=;
        b=UP3JUPsUJ1/3dUsx+9XwRd+aKn0C6kOE6fBDoUikT8FxNl+xp+gB8mahalQmb0ihgd
         Q7u+3H+YPFZonb1x69OUR6zI0rB+riv1UAWhtDwxnb2ZYjGo/KQLlaA9itLN70mdWhJ3
         7MfZAKjmm7ieCLax5AByypANHXzadlQMKgbl2Xf8ed2w1C3Jwb/FagmGdEpKAX5vxhvA
         i5CZcBU38xUHH/66RZgRzORjVVXU5fbL3+wp3DtFJhQa14LyYexnLq/OuimaF0IQwnhe
         ne3HqhdGKqD6OxKvlZZbQphR6a6h4mT305SQZbTST7GxwBLfTLQrpaM7xlGP/Ns5vVfG
         I4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129920; x=1686721920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+OfAZD2wx9PpRLlK5NDY7msLe+VFYQ8VG8zPNASdds=;
        b=Dw7MHW/MIyL8EI/JfX4gRpMGO+mrL70C+dTt7uAa7aWA33Bzo8okqUob769VY9fygN
         xvanyC1qY7f/dRoTocCG6Yf1N8Z+wJ6yhUY9oimcsoRMMaAfLpzA+Kf9iIPJakb0eoRZ
         yeHRuYnNxwn2y+LtB+7gpZzq5eASiJ2OgT9jBCp8JPaJ3n7BYu1nArN9JrVgZjZt1PIh
         nDMFyZ+ycqBtELY8p33uzjgmS2mAG6i5W0Q/N83TrKwqgzkSBECsk6ynNGc9bO4r8Hyd
         jN2kzUnzPqh9fYnE9KRrBCWlwYc3cfCyTWsu/cSKIFRZe3MrtsT8bctKzk4sB0ZDpvAF
         F0iw==
X-Gm-Message-State: AC+VfDxmMFgiz9TdrI7NaK0Ey/tZz0UMX0WPGUETMc7yv43ZTroY9JgE
	pQau4ziSLcZWVX5iaijpKmPzZA==
X-Google-Smtp-Source: ACHHUZ7raKD1UEB9BO9HO/a5fCkuFHIsdIRcdjSH1aF/He9zg5LJ4Ho9n6tLwYP0ZSkrYVhsLcVMNA==
X-Received: by 2002:a17:902:d48d:b0:1ac:8835:b89b with SMTP id c13-20020a170902d48d00b001ac8835b89bmr30050863plg.5.1684129920075;
        Sun, 14 May 2023 22:52:00 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:51:59 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V6 21/21] MAINTAINERS: Add entry for drivers/acpi/riscv
Date: Mon, 15 May 2023 11:19:28 +0530
Message-Id: <20230515054928.2079268-22-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_225211_749953_2E74ECBD 
X-CRM114-Status: UNSURE (   8.78  )
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
Cc: Weili Qian <qianweili@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tom Rix <trix@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Nick Desaulniers <ndesaulniers@google.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Herbert Xu <herbert@gondor.apana.org.au>, Thomas Gleixner <tglx@linutronix.de>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>, Nathan Chancellor <nathan@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

ACPI defines few RISC-V specific tables which need
parsing code added in drivers/acpi/riscv. Add maintainer
entries for this newly created folder.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e0ad886d3163..1b6e41691d00 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -406,6 +406,13 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/acpi/arm64
 
+ACPI FOR RISC-V (ACPI/riscv)
+M:	Sunil V L <sunilvl@ventanamicro.com>
+L:	linux-acpi@vger.kernel.org
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	drivers/acpi/riscv/
+
 ACPI PCC(Platform Communication Channel) MAILBOX DRIVER
 M:	Sudeep Holla <sudeep.holla@arm.com>
 L:	linux-acpi@vger.kernel.org
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
