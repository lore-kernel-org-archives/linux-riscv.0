Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64568C61D97
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hoNKq+hsW1StNWgHjpFr+TdyjaYtGqXLXUFMrVPRhQ0=; b=AkoiskT/2SyqhC
	bFfrzl0lIc8W4crzoxBSuntb8tUOuqjsn1B3CEh1jeu0yf8xHTUqUEEmLpRRUiRdgqDUpov/4A78Y
	FEsobfg0U792oHovqZ/NPB1d0RFiHROrL1heK8QP668E8XnCbV136qm72MzLWIEabudMhoTd6vhfw
	5wW04anWUruC2iJbaoKS8N57Lr3S5EdO9DzfSJXJdoD9GyZcFlsIpvW/xE5OGM2RNKWC5fyBaE0t8
	pVE14Rz+Eviyi729EZE+5k1X4RlXlMeBFZJGu18X4RkGOShK79EYaznOiA+0ERzp9XSktLgwxswZg
	u1CDByiqGbAmj9Hhw2vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYqY-004yCy-8y; Mon, 30 Jan 2023 18:25:38 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYoH-004x0P-HW
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:23:19 +0000
Received: by mail-pj1-x102f.google.com with SMTP id o13so11888536pjg.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Civb8WSgZLaGjy3GsEK+VfCJoO5XDczMEZxaUDDoy9s=;
        b=PSgeKdehYrE+PafjRwikFSIdgqSVP/6Dwf+FS0bio9ay+kO8Iq/DP55UzLxJ/0teml
         mvq507l+RrqXXtGjCegq0g7TLBJjmbSWhdM5dgwY0v649xk++pdojRYRpi6srgODCEX8
         Uo9mPJiNfw2KG4leBHKApLZ0vCIAGbEaAh8W/xor1x+Q+a1Lfuh10l47pj75siTlDsbn
         eb7CTrsgaQM3o3V7ixmkkhz+3jXqGMGxOBTq3bjtqGeqQ2LRHByk7Bu5QeGzR6FsK4b9
         YFzRilzo9k2a2ZEB3Su60FmyHlwt8/pzExTf+irfPULv2+5xGuGMe/aasN/pJ2aP1S95
         itrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Civb8WSgZLaGjy3GsEK+VfCJoO5XDczMEZxaUDDoy9s=;
        b=DkQGJZx2d0H8Qy1w/yeHdZSi6AZ3VoJTq0VZ1ZHO1FfmKWKkjT/mmx0cMQhFBFVVdz
         NzLpWUzSfHL3gdE2snmJAakW2yJ6gWisKrPTo/iAhLLwSgaNYvZipB7ZxCGLbY8LDRhp
         fiRr4PHeAuOIU9aVNiMi0WdEpBHpZ9nAG6uV6mjWm9xvzJe/39r1frEpFx+LPAVuiBa/
         keimp8avzTnohUVgIghhEq4P5G/ZM7ttUgJFOWt00qMo34fYf4eBV8ww4kk1dq13OJOh
         5Ogcuc1ikCabX42bz4IWmAw1Nvb32mN2RYd3svP8MPMByoJgIio/R1ReMmLGGInSU/hl
         HJdQ==
X-Gm-Message-State: AO0yUKUXrxnFdAAL/V5qxGCbgxtD+wVffNvnUJ1tjMjXHw7l7OV/t+HY
	J461up9psVr4SHeYnTW6Trj8dQ==
X-Google-Smtp-Source: AK7set9oTDzJ0fET5I+XJ+M/whs8igubsgt819w38WChwLx4JRHaYMGFAZJAVm6ZNdmVCQgnm72BVg==
X-Received: by 2002:a17:90b:3e81:b0:22c:b70d:45fb with SMTP id rj1-20020a17090b3e8100b0022cb70d45fbmr3191564pjb.23.1675102995734;
        Mon, 30 Jan 2023 10:23:15 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:23:15 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 09/24] ACPI: OSL: Make should_use_kmap() 0 for RISC-V.
Date: Mon, 30 Jan 2023 23:52:10 +0530
Message-Id: <20230130182225.2471414-10-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_102317_635541_9CD354B7 
X-CRM114-Status: UNSURE (   9.09  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Without this, if the tables are larger than 4K,
acpi_map() will fail.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/osl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/osl.c b/drivers/acpi/osl.c
index 3269a888fb7a..f725813d0cce 100644
--- a/drivers/acpi/osl.c
+++ b/drivers/acpi/osl.c
@@ -276,7 +276,7 @@ acpi_map_lookup_virt(void __iomem *virt, acpi_size size)
 	return NULL;
 }
 
-#if defined(CONFIG_IA64) || defined(CONFIG_ARM64)
+#if defined(CONFIG_IA64) || defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
 /* ioremap will take care of cache attributes */
 #define should_use_kmap(pfn)   0
 #else
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
