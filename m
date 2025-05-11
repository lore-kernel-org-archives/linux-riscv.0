Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC82C3ABCB
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 14:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xrTC4KIBk3fBBaNjqYK6u7O1HlIVyE5chws5hgA30Zs=; b=JbFGI9t+uiKlAq
	AKeg3CayBejI4R9jvS88xUczaxsk8vsGZoLAehtX9H0EqVhF77uzFkkZ0CnGLKk/dCLmSdNad4Zrj
	DN6TwPSIqRw9S+QTtnl1aB7BJj2Ij0oEiI+QvqJ5Xjr0KzPTHfIIH4w+BGJNEDc21a3lj9hyp/H+f
	McEIj1s/cHQtTV/d+Y0AxJghbx3q7h+qvZt3L9MiZoBxduXDBEM89it6r1mYsQGskmhMfiXM9/MIQ
	YcHXlyHaJL17fGVrQoP7p3uyN/0rm3QjfT3K7kflENFj9rYdlEGoCoNjr/2QpR83iKfsxV8Hh51TB
	H1wCok7MSHTwn5Ps5ZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE7z0-00000007OvH-3tdu;
	Sun, 11 May 2025 14:48:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6wy-00000007IQx-0rk9
	for linux-riscv@bombadil.infradead.org;
	Sun, 11 May 2025 13:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=L1ncfjwU8x+M93RwaeMxt+NygYvFIPfXleFyJrSEwNk=; b=CcxBzRcquXlbPCHNp9kl6J777/
	Sch1CUvKPNRd7cGc/OV1Rc66N+knSfNZvkMf4B3UyybzDhKlfwzC1R8ydYQgsNoZyhfSVxDd71qIo
	MUVuLaaBZvPywMlRn3bDOWzAvwJOj27RrzEpmQSNVLEB5o5XHjco3iwxB8k0/qCf8gKId6KEiSTHV
	oW9Id3x2mcyDqpbw1fHB6WMWoFyG3d7Xx8w7h97sU4yyyqMihXRoctAwb9vQmdG8SWX81LXlWUmgG
	5t/yyZmK4EqnOpuZSJLiRR5x7x8rPvEACFfjZ/z3khqQu53E807Aldh86OP+D3vDfaVAk439Zs63L
	Zf/FOEJg==;
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uE6ws-0000000Gc1b-3mK8
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 13:42:37 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b2325c56ebdso2576852a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 06:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970949; x=1747575749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1ncfjwU8x+M93RwaeMxt+NygYvFIPfXleFyJrSEwNk=;
        b=VQwkCoODXstOkpShX/fa+QFwC0KYXvblZpNoC+F2ysBgx0aeVOCYHECdpKas8o2quY
         kiVkQh+zN8nSU8QfURoSZW3rbYZQgcOsjnPeA2jlW22/VsqvRMuhqYbj+WRhv0PllFke
         APGwwgW1HGkVAj8vqimtUQDcZpmZMhljTvtAqlC79AB+bxVm0f6OjGYDtXi74Mz+F7Ad
         KzIXRI91+LIO6xbgLPXjduALAcHh52h4xnHQN0A9eZGak5W7bDtoX3R2rWH+AXActXL6
         aXx2jXjUrnGyLbk+Nad78lwGYKsDYJSiQBe1K1ZOxjSjZxck7ekJSQ46UtNzgB5Zfe02
         F3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970949; x=1747575749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1ncfjwU8x+M93RwaeMxt+NygYvFIPfXleFyJrSEwNk=;
        b=Iv+TzjTlHxEmjea1Z4/IVxgLRqUT3tz+5QpGmQR/geE5BnS2kC/CfpANIrk2wI1y0x
         VhopgeggFl0zck3mwaMeLHWI/XwV7L/kf1k2UNdflOij0/dLVzyNn/+QVnDSHlTBQ7wa
         s5T4DOrl6kZ/ThRlZbCwRzzEj/VvpkDwn8JfjIMR2Gp70ER2suIMpi5dNTpPqdjzsCXO
         eZdoKfL07b/G19bAyc0GOqlQdNFFslTnC8WvSJ2ydlh5cDqQnpy5whuDyUX2WyQPNSPF
         UqlOA5A868u99EH5D4KCkpjQbroJpnp8p406YbaTsNBtP3w/1K2yepjnVGKxMqt9UxQm
         k8fA==
X-Forwarded-Encrypted: i=1; AJvYcCXN/kz8SqPrBZP6Vn7xWwM0PkZqPXd+UQXQDGAlde/b1l+Wz2crOTi3b6SksqUgD9gNzebtjUmwZYkm3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNy4ZH1bcX8YQkXS8iHBhkuGhY1+stRMu8JWP8XpVRDzg4xB/O
	Ejpq2Y1ABS+VtVYB7bH5WuXYMQS0ibXjFWlPj6hIcHuUS36YyeykKUqkuu/DiEua9NdtqtpXDmG
	R
X-Gm-Gg: ASbGncsBCqeibzypimFh06t1rKTB+PCxFyeBCR0fIWFoeXpUSlIH86R6rmyaFLPfG17
	0Af+zVFFOU/BqIDnoWOa1ZiHOEu7+HJKvZZL8t+tgB8oPZNV8En5CiQAXUoMcv2Hg2bJKt3CmjS
	QDDy8y5pl+VIjVDmIe7sNLWz5k3rTOepPDghWqFtR+fZjg7AjHPRcS57bqBneEf+8QMyv0YuYKK
	URkP80oiMk/PW0rR2+Uhe+8AMU+Gn77G/GaBg7cZ4cOMbFsgho0iN5muddo9t2dAl/srEhWHQl+
	pirqlW9vuSJkv/9ZXz8sotDbi68tZhE/QTZ4BBV/BUxG0Pyb1blCwLvz3bII1dd27UKAbtTHSvZ
	+7g7N0VbsAzCGNA==
X-Google-Smtp-Source: AGHT+IEe5MoHmRn7VMhcjZzc/oDhZp6CpsUXB5Vc9hjV0uT28JPcfqXvqK8cpfVDg2JO3fpzBT16Ng==
X-Received: by 2002:a17:902:e949:b0:215:94eb:adb6 with SMTP id d9443c01a7336-22fc8e99d25mr152020315ad.40.1746970949344;
        Sun, 11 May 2025 06:42:29 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:42:28 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [PATCH v3 17/23] ACPI: RISC-V: Create interrupt controller list in sorted order
Date: Sun, 11 May 2025 19:09:33 +0530
Message-ID: <20250511133939.801777-18-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_144235_163996_9B9318B1 
X-CRM114-Status: GOOD (  12.71  )
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
Cc: devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Sunil V L <sunilvl@ventanamicro.com>

Currently, the interrupt controller list is created without any order.
Create the list sorted with the GSI base of the interrupt controllers.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/riscv/irq.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index cced960c2aef..95b4d7574ce3 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -115,7 +115,7 @@ struct fwnode_handle *riscv_acpi_get_gsi_domain_id(u32 gsi)
 static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr_idcs,
 					       u32 id, u32 type)
 {
-	struct riscv_ext_intc_list *ext_intc_element;
+	struct riscv_ext_intc_list *ext_intc_element, *node;
 
 	ext_intc_element = kzalloc(sizeof(*ext_intc_element), GFP_KERNEL);
 	if (!ext_intc_element)
@@ -125,7 +125,17 @@ static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr
 	ext_intc_element->nr_irqs = nr_irqs;
 	ext_intc_element->nr_idcs = nr_idcs;
 	ext_intc_element->id = id;
-	list_add_tail(&ext_intc_element->list, &ext_intc_list);
+	if (list_empty(&ext_intc_list)) {
+		list_add(&ext_intc_element->list, &ext_intc_list);
+		return 0;
+	}
+
+	list_for_each_entry(node, &ext_intc_list, list) {
+		if (node->gsi_base < ext_intc_element->gsi_base)
+			break;
+	}
+
+	__list_add(&ext_intc_element->list, node->list.prev, &node->list);
 	return 0;
 }
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
