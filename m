Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D1EC636CC
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 18:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tbhV8uuPPAywdygotuYtkSqBdiYeuofu/RnmhU8JBtc=; b=jA2MP+Cz1a2HRs
	rWvYdXg0MqXZK47mDvPmIHO98RHqDiimCa+km0xGSVhAh6+N/0KLt/Bm6UUfPtgI/5+s2+H+5YcZO
	A9E3I93m7wDwOiQXVirgfinELDOQ0HWIdxfFzULSNZ6wSjNEr79pN4pwOm/8jSzeNsGMqx2al74jW
	yfSSvkIotXpEjM5IVEy0jaX22FN43dK1oekKytYQgT/UjHLLFKAMy8OOWOeaYmIj6gqBGtla/JksT
	KB5TQPeYiON2lNRVjCcPgiOfeAAEVgOS702cv68os+XZnPy+b16D4+unlGhvjvDMQB4Jeka+CuUAV
	cFM1Ij8WvkwVcTOIJ1sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSiuh-00BV63-4A; Thu, 16 Feb 2023 18:23:23 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSitp-00BUTc-7a
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 18:22:30 +0000
Received: by mail-pj1-x102e.google.com with SMTP id d13-20020a17090ad3cd00b0023127b2d602so2979546pjw.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 10:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6uh9i4Yg2UK+dtGNl63Dd2v2b9w/htIfSHYIG3sIgo=;
        b=mVXuI8tX22NJDu6yVW/g1R+u+kgg7UXHeVhfNyF0TbYKOj0ZLb3xWMXyv+ME0Gy0rG
         tVCkdPYlWPmzvGBICTXFxxMRlSS8pK/B2pxXGD9Sc36/petkDWVVq6qQSlCJSPy1sEg4
         6AEhM/RTUff4Vh1y1IE6JfJ8iJDn39isEDMJI5giDQ4EWkEQRw9J6xFOwqvn4VmXNGM+
         Ws+txz0rVy1NiDnjoPhdWs8J1x1YM1/HGFFOzizB5CJuJMkMuD6f2JS8IUgzj1T42PEs
         u7s3Js0bFqORE8smkyQu+P363zbCeyeYdVQRhTHs9bfJBw+/SiFAtZAR2SXhVgOjav4v
         YBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6uh9i4Yg2UK+dtGNl63Dd2v2b9w/htIfSHYIG3sIgo=;
        b=hT1VZ8oiUV/PIu5yZ4BSLMjeefRA9sOQQtEWw7y9r/y4IY/QSLJTcYHoaWWqXB6bA2
         THgeFd9c2dtWsoQxOtaSfj5icOP/aeHoNCYAU+kLRDMA5X5Pc8e1wFIEpw8HUnP3DTMY
         1ZHz+TDrGYQLUO2Qsd/91A/e7ZtEqjBkc7qL1mvssGqLSPkVh7UlgeD5/kRoafWMxKBa
         DKY4k0OJ6ArY1Br1bg+/YpbfOjqGfWpjfJHXMO/LO685MXHpnSyII5VfbKnz0KOhyhu8
         B+top3xxUEZhJtNKEhp6548O2ufS2fhyJinEzg6dGWmex9YvEjLg9sRCMAciYH/b+vgd
         s6pA==
X-Gm-Message-State: AO0yUKVCYrRPmRmnH883wIklyEodxXSF9NQ3Ts25UhKJzTC7PWB//nt8
	ydQX9fNbVNLz0S9p1HYoa4fQ4A==
X-Google-Smtp-Source: AK7set8osOOcu+B/NPunBtlVAq9P8M092Oegw2Ys2UWMJiWbFSK/cFchK4srmj2/JHgMb6lllccJdQ==
X-Received: by 2002:a17:902:e88d:b0:199:15bb:8316 with SMTP id w13-20020a170902e88d00b0019915bb8316mr8101008plg.68.1676571748298;
        Thu, 16 Feb 2023 10:22:28 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:22:27 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH V2 20/21] MAINTAINERS: Add entry for drivers/acpi/riscv
Date: Thu, 16 Feb 2023 23:50:42 +0530
Message-Id: <20230216182043.1946553-21-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_102229_348867_4742D04F 
X-CRM114-Status: UNSURE (   7.66  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
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
index 39ff1a717625..d47212194457 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -450,6 +450,13 @@ S:	Orphan
 F:	drivers/platform/x86/wmi.c
 F:	include/uapi/linux/wmi.h
 
+ACPI FOR RISC-V (ACPI/riscv)
+M:	Sunil V L <sunilvl@ventanamicro.com>
+L:	linux-acpi@vger.kernel.org
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	drivers/acpi/riscv
+
 ACRN HYPERVISOR SERVICE MODULE
 M:	Fei Li <fei1.li@intel.com>
 L:	acrn-dev@lists.projectacrn.org (subscribers-only)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
