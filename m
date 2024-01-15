Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A3FC3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 10:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4NRtEHWLL4EGC4BRVAwrlAuo6+3jVTfVY5iDnngWFQc=; b=OXRAEoTIWl95Sc
	gaM7K/a0ASx/ToJHNHMqHiapJWuQWuI+ZHnYka8hojUk85YGzPSHTHK2IHtFNWGib/fY8qmV1pJPn
	FV8okzPubJ1YKQPP3svDqkhyaSFzlw5f6URLOZHTDUjOJiNmHJ+Hmu7o1zx3bj0QKLszoakPq9YPI
	LaMpItGB+PjE12gY8lYIc5xA8jE5sKzVe0PdV3MNzHt/GUjhIBlJ0tHQ2Ubo1McSURaKE/tbdY8jc
	4Wb4L/iOtRfVGs665k754V6178ckRVmA9BNACUvKc57urjK0uH2509wEw3izzM2aGWHrWLytXbKPe
	JoId56HGX6X3A24sf9nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPJwE-008XXn-1O;
	Mon, 15 Jan 2024 10:11:26 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPJwB-008XVQ-0w
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 10:11:24 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-598cf18b259so611891eaf.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 02:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705313481; x=1705918281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtA1yi7bJhENd0OSwZZPO3/DRQ+e8frz78vUteV9MTU=;
        b=khVNA+jc1Cw6rOQH5jiVbRD8OpzaELx5xS093ncNoiJZdovK9wGxJ/jdOoJPXYWmYi
         0O2YxqdDZsJFHUJ0Vt4EGNmn4UtAsm8xw6jHN6JCCIddRvPZfHzbyRagi9fSlx2N7dq2
         3hrX1qWO2p9iU5qKrJC7NNgtsxkRzlE+q88HNzyFS4zFS+dXoHGdnlwp/spa2cHWtKHz
         WptRsEwNLKCbU76DPo5OqlIMv8qcghorciDtcDLJ3hwUJNoMV6r14CKSTGSpiZtMWogo
         m6NmTrjCPvK8asMtosJAvTwOeUIS4rmC8HC9af3pxY5BvW7Ou1wFjxIr6e6PAp2Y6uNX
         72Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705313481; x=1705918281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtA1yi7bJhENd0OSwZZPO3/DRQ+e8frz78vUteV9MTU=;
        b=DUFVpeXt8Qg+tsVgbddSlgFlO7xh+VGE+Xpn4Frmdcaijvu/DdMfE1SHa0oMc2w8Nk
         1kBMxLPDjk9P1dG/mZ3VSri4QZBGYqhDqCZHYVo/ov4cvYnbLQt6BZGsN7uBHNsUfpzg
         s647/jF7G2MCpl5HM+5o/auJAMhJT8jB+WgYaxzVXuxLzif1xnfqmciLXezlud4/JgAf
         Exicm2Fjf7IiMwYhtlwch9gj+fsgNbErAR/LPTi/lRSQlDK7TKzRZFNkiDg4kDs8oy2L
         hqOS6hHOpycZln3qerOmqQLa87tvUVCF8L1u+EsuqaFqQlYhCcBMFaUdeaOZk303rLhJ
         6VXg==
X-Gm-Message-State: AOJu0YwQ+H8fJQ9ekcm99/kdd9MDHSnTGGSmxG8NtA4AIUJkwoE7GOlQ
	loQnM3wVWR6iI7YJYR8lXBSwF8cezbLpr2V3rWsGb3dQ+CHWPQ==
X-Google-Smtp-Source: AGHT+IEKOzlQXK85GuUQTpMoHri2twLXfd45mzkf3PZf+G55H8FBWt+pX+2+cyIqrJVcLKFALAXomQ==
X-Received: by 2002:a05:6358:7689:b0:175:4f3e:bd4d with SMTP id e9-20020a056358768900b001754f3ebd4dmr2404643rwg.49.1705313481257;
        Mon, 15 Jan 2024 02:11:21 -0800 (PST)
Received: from localhost.localdomain ([106.51.188.200])
        by smtp.gmail.com with ESMTPSA id u5-20020aa78385000000b006d9b8572e77sm7348256pfm.120.2024.01.15.02.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 02:11:20 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 -next 3/3] ACPI: Enable ACPI_PROCESSOR for RISC-V
Date: Mon, 15 Jan 2024 15:40:56 +0530
Message-Id: <20240115101056.429471-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240115101056.429471-1-sunilvl@ventanamicro.com>
References: <20240115101056.429471-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_021123_329002_4CAE19C3 
X-CRM114-Status: GOOD (  10.11  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Pavel Machek <pavel@ucw.cz>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The ACPI processor driver is not currently enabled for RISC-V.
This is required to enable CPU related functionalities like
LPI and CPPC. Hence, enable ACPI_PROCESSOR for RISC-V.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/acpi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index f819e760ff19..9a920752171c 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -282,7 +282,7 @@ config ACPI_CPPC_LIB
 
 config ACPI_PROCESSOR
 	tristate "Processor"
-	depends on X86 || ARM64 || LOONGARCH
+	depends on X86 || ARM64 || LOONGARCH || RISCV
 	select ACPI_PROCESSOR_IDLE
 	select ACPI_CPU_FREQ_PSS if X86 || LOONGARCH
 	select THERMAL
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
