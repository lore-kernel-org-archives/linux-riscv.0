Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26D4C678D4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 13:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ukpVF2nGE4fH/c6yJb2/g6du+s39efLRGHRN6ruHfAk=; b=uSBPIZkwR8Wy4F
	OXI0Tn9QWueOunmqcyuyleJBGlZCxCccL6NVtZPte435oZxsgbnGUk35ERpkJGsIVdVsGTZswYLIk
	5jkqYpTFn5wC/BkSsLaJB2GPnythcjblCxBzeYBq4F27VgW1ZCPd8nGOFQcUEaD2yZzIoHXOIghSU
	dUM1CFaslPkW+qPp61nAa5IrjOv+pKoFiS0wynybmIPS5EIZENvP/y3LSZq+FPhA3LIBeFI00FUfj
	tU8PEpYmapjczRLwq+MzqrDPbcEGMiB+4SPbVHfNFoFh8RC66+qX24Ce5nZqO/tApTUtUemJFcfZG
	bil3dSbBOtkX/Dm1mPdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5cP-006U8V-3z; Fri, 03 Mar 2023 13:38:41 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5cM-006U4r-32
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 13:38:39 +0000
Received: by mail-pj1-x1031.google.com with SMTP id m20-20020a17090ab79400b00239d8e182efso6127102pjr.5
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 05:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Vlvg0s0GLD+Fr0ivx6kMGA1aXXCTSFKFG2h3P4PYF0=;
        b=Up6SyZ8rT8M8ni48IMxDyPF+Hgb8oBuSqgMDGJrD4x6pwG6iviepQAxi9JbuZZydIR
         iNaEoSycbMWfquSUfogtNZp7HQTo4CThDHMDF8qqvrM0tVSoknv22AsNcVFfU6n96azK
         xoZKCygMjcMpTxV7mFwI+DwABI9dDz86Q0YL3zW7JGfKOhzwnAsQoNaT6qGk6DqYYOoa
         u7O7x9muku6Skfd90mzYa9fHaN8tsvzUbqCq5xIurvN8KAFWSPWgccbFUYObmPEeM2iO
         7z8y7LgqZk8ZRtG7DagduiziOuC/5hT9UoAmVoE89ultB+1qoCc4dLgyAIsonYSedk8x
         XOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Vlvg0s0GLD+Fr0ivx6kMGA1aXXCTSFKFG2h3P4PYF0=;
        b=lDLP9N94gEZeMEwIwXzLpquLVjk6yjBqE4GlmKDsXrVnA6gGHZhbYHb/JqlnX2tRMa
         R28bSDOKpNlCAqMhx2qyyRtSyvEi0fsxJIrSp7dyDWi6PgMtZ1KGYy4rKl0exdWW4nmK
         HCBB+5ztzSf8RDk4Kolc668yFnXMdnZrU3Mt9KSCTgFgfvVR/P4ntH/lc5bgkSXLw8Ey
         JnksZeb2S9OrA+iCFZZzz9PCmB77lCqAQDDOiL20LXhJ/L+eOKcOWudfYu8pk82acbLv
         i3MBi7y6L9aXYhDt1PQaGwuFe/DLQHypYZ3Yohdguu/hSKgI7eB91nzZxCPtTaNAmUGm
         dMqQ==
X-Gm-Message-State: AO0yUKV/nMGeReIuxxImoX9oAbbWYxoxJ9ZkSmtWmPPhttzrxDLUUN9L
	OHWFStN2ktxRpeJL37ud1j2iYhjLi4hk5ybN
X-Google-Smtp-Source: AK7set96j6WJuUX/PTqb4gzc3U+7TJ6w7lLE7JxLO1itapAAlq/QR+Pp4g55TEo8ujxOweeMcThtuQ==
X-Received: by 2002:a17:903:110f:b0:19c:fc7b:69a4 with SMTP id n15-20020a170903110f00b0019cfc7b69a4mr1994559plh.65.1677850711284;
        Fri, 03 Mar 2023 05:38:31 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:38:31 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH V3 20/20] MAINTAINERS: Add entry for drivers/acpi/riscv
Date: Fri,  3 Mar 2023 19:06:47 +0530
Message-Id: <20230303133647.845095-21-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303133647.845095-1-sunilvl@ventanamicro.com>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_053838_168941_5B3BEACA 
X-CRM114-Status: UNSURE (   8.55  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Jonathan Corbet <corbet@lwn.net>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@rivosinc.com>, 'Conor Dooley ' <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
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
index b0db911207ba..c299f88cb212 100644
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
