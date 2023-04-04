Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9E5C761A6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 18:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WTN2AaZYDLiIIo3r/WPU1W76kMBB3kTaLF1tt2vY8bU=; b=dw4MRKrExrER9W
	NNrr1lYdEkxi9JrTVAzHQJ1RpGbH0R0r3Ot28g0s0xX0jxb2q2BTUDgpkoQF3norv7QKV/4wA3jvo
	tc+n28AEUBEDt+DG1Otjrz972B+5/LlclsZrgpw7bxtnlEaJh9nFJSOSpf/DEHFxOMb8qF+bLmUXI
	A90++pqVEcx4dSFLMhaf9gt3lD+GIQDehV6dGwtfuuzV2Du4gJLegYoK350K38M/+zyM4MJvPDjAc
	27MDXGU5meyaRxt29Zh0Yk8B7aMHnmQ1fwNpcAuY3u2RQp5f/U/vUnAqfh6Q44e+/ohLOIPL0tLh9
	RcX1Ybs/E6L/plYUeGGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlJQ-002Uol-1l;
	Tue, 04 Apr 2023 18:23:20 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlJN-002UkP-1E
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 18:23:19 +0000
Received: by mail-pl1-x62f.google.com with SMTP id ix20so32163512plb.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 11:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxjRnY50ljGzDkjFJKwpbgFpDq6dD9KEN8bTRX7WND0=;
        b=DUjOausdvzFTVQlcC6m84GARZK5LmEhMht8gMLun6u8d/vhvQDQIhEE8PuNQKXP186
         0Sq8iIVodsU0Skgpet6N/Mb9uhXlJU2cQ0UAC8Odwjor6m+ubsGRHF1SKMN62ZIITSOx
         uKaCINtsM5qD+zb0+Ky44kERjcb2URa2HHFJVdN98U7df7b7TcXae/mpr60N9hSJEzcD
         bs0/UMMtuOougT+/ob1sPci2eYBARU1ovpXTnZh/fljveDgKCvU976b1VpvUFAqUS58A
         9a9W/4mKqFePf8VXn8kULaTt3TpsK/9yvMRoFqRBN/oG2lQ4z1BrZAk5fSXHuRGiqbrJ
         K/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bxjRnY50ljGzDkjFJKwpbgFpDq6dD9KEN8bTRX7WND0=;
        b=ARPu9n3eFSYl3SSll2SQ4iNsx7WhVslsdwhb64xOut2LEEZxPOSyQzBrb5neIiYnkf
         Hi7wTiPZS5apxEqujCJkDuXTbVPyLDDU8YpYxE4Wqqk0fF2y7LTWp/jr2UUrDOcVpm8m
         SSe6ZqBV/OkkAqerrZGpNwUOVs0G/pNmGsK5sW2cEucamJXHUdUrCiI1laDDgqRzoNjC
         U2saWiM+I7cLJUU9keBcdhdSxuTwkFA/KKyV0tYMt7ur4hCsAJSmF+u43ru5w5yuPuJO
         kIZYeNToneCwqNp/hcA7qNazzr7dIj5a8y/lfKtF+gk0KsgPArnzeUpsdzxj66tpIyfl
         CEYg==
X-Gm-Message-State: AAQBX9eIhzn/qdEw9NMIivsfZxVJZSL5DSxASE816Wr0V9B4xTBxX67t
	uu2bUimdTfy8s/putGNhSvY2Tg==
X-Google-Smtp-Source: AKy350bkfJy3/J/N4hFHpsA/SCejSzTneUJgG9jMyZsK97P+mZ2vHjDGEOqM8+xhJPDrUVdhideASg==
X-Received: by 2002:a05:6a20:4da3:b0:d9:a38d:3ec7 with SMTP id gj35-20020a056a204da300b000d9a38d3ec7mr36588pzb.29.1680632595264;
        Tue, 04 Apr 2023 11:23:15 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:23:14 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V4 21/23] MAINTAINERS: Add entry for drivers/acpi/riscv
Date: Tue,  4 Apr 2023 23:50:35 +0530
Message-Id: <20230404182037.863533-22-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404182037.863533-1-sunilvl@ventanamicro.com>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_112317_419109_542516B0 
X-CRM114-Status: UNSURE (   9.40  )
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
Cc: Weili Qian <qianweili@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>, Herbert Xu <herbert@gondor.apana.org.au>, Tom Rix <trix@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Nick Desaulniers <ndesaulniers@google.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>, Len Brown <lenb@kernel.org>
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
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90abe83c02f3..903a52027309 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -406,6 +406,14 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/acpi/arm64
 
+ACPI FOR RISC-V (ACPI/riscv)
+M:	Sunil V L <sunilvl@ventanamicro.com>
+L:	linux-acpi@vger.kernel.org
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	arch/riscv/kernel/acpi.c
+F:	drivers/acpi/riscv
+
 ACPI SERIAL MULTI INSTANTIATE DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
