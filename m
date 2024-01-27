Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EF9C47DA9
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 16:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rxo55x2DDpXdOmHJO5jd8PntgZNXluQnh4c+hIQQbR0=; b=i+aGZFvVt41nT3
	p2/tf2aZX7vEDYQn7p+lYDwX0FNy7GstB4OwmFuQxeIoYwAp4fEmQ/OHQoNQAt+X7LkaTiPqg3LJT
	X4jEtlQ6dmfeQSn3E2C/KAMP3bIgTMmPWBO0ckh7yHqXrQEvSoj6zf71tgnoZ79tZ/3v5Mw4d6U6/
	V2NBtFYCpWp4XQ1nDNnafZo9pnOV6f8ugTquU+rP9eTfZ6TwODLB+jic557y1FMiddJ86GywrxygF
	FcZk/b4eftChzLIkm3lOBPwIr/qeKkoUq4Xb4WSU0bKDK1TFfa3kmzMjLJK0aZdYAtGDRezo9E0hL
	MjE/NYyFq/fM8EsiBZzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlOI-00000007kAO-4BL2;
	Sat, 27 Jan 2024 16:18:47 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlO2-00000007jyi-0DZv
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 16:18:31 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d730b6943bso7060295ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 27 Jan 2024 08:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706372309; x=1706977109; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gio4VcisYA6evHi9fLFTB/NsIADoYywgfT0MwGlZzIc=;
        b=F9g31rv5o5jD9/TYzz/ez3zAeeZ+LIaoKWSO4hYk7TiokKvTWvWdf7kwXLzFY7gNAy
         MPg5nfMLLpReu0b8kDbetAVfoTrqwZV0ANpnB2hV1SPxMglidlcJhbZO5NivZ9mLP9xF
         eqPN8taouLW5IBRLUHuk8YYBFJl95Mjibe3cAJAhX/bF4vRm/Mq1o4BTrdpW1sb6/+Yq
         Yk/KvUb7XttD11I+v59G520Hh2TOcyXFE7Jv71FMYOb9Xir0i4jsb6v3N3cqEKwdExHz
         a0ue2y2dfrmIn+WvVBDnwrFUYPrrsN45pWIh6rDM2cXAGJNtdeBSSjzW1Ey2NZvH3rJE
         1WXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706372309; x=1706977109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gio4VcisYA6evHi9fLFTB/NsIADoYywgfT0MwGlZzIc=;
        b=adOfKskZ/NK8OCPog2U4zT1/+commPoBTv7eM+vsucrWDteBiYLGnNHHTis7Cabq3T
         KYyzrxDMuiKQJuBhrINJWz35mHnJ0aKaWm2cUNeE32iu3nn1evaomb88Ky92Sb6kDt+h
         EyFQOAYe0e3dtJXil2gYH32WQrgyxAs6L+WFQ1F9nh5cJ/IPgEhCEaitYFEHqjGJ+MhO
         MXfTQTKLlyAduQG7GDUBwcr9siz2zRnh+L+KCOiNKxcRmdSuzZ9NBiL35klW5640E8gZ
         HvMLMCWqe2E6JVKdPJKuEbGPOflmFQ0tTjb1mcfzxqW8EuYGWtdwOm/HbTSiGZ2ioeDi
         A7sA==
X-Gm-Message-State: AOJu0YwYtem2tQnrTjAJmBaOaCDMQnBuQoxlpc00m5y7VBXIh2DY7kRU
	gbOK/PvmN9T/WUNIDmmWIugfaFdm85p43viDS/2Hw25n02EQaqokZSsv2dIY7P4=
X-Google-Smtp-Source: AGHT+IED/6ZIyLe42SYcWyw5qvmxNb89PVkJ7Cc0/TjAs0f65nBH0WO/WCelT/RErST/4ZIoCKlTJA==
X-Received: by 2002:a17:903:1c3:b0:1d4:326c:1c89 with SMTP id e3-20020a17090301c300b001d4326c1c89mr1195988plh.10.1706372308671;
        Sat, 27 Jan 2024 08:18:28 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.17])
        by smtp.gmail.com with ESMTPSA id d11-20020a17090ac24b00b00290f8c708d0sm5091620pjx.57.2024.01.27.08.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 08:18:28 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v12 02/25] genirq/irqdomain: Remove the param count restriction from select()
Date: Sat, 27 Jan 2024 21:47:30 +0530
Message-Id: <20240127161753.114685-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240127161753.114685-1-apatel@ventanamicro.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_081830_130677_F5501082 
X-CRM114-Status: GOOD (  12.79  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Thomas Gleixner <tglx@linutronix.de>

Now that the GIC-v3 callback can handle invocation with a fwspec parameter
count of 0 lift the restriction in the core code and invoke select()
unconditionally when the domain provides it.

Preparatory change for per device MSI domains.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 kernel/irq/irqdomain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 0bdef4fe925b..8fee37918195 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -448,7 +448,7 @@ struct irq_domain *irq_find_matching_fwspec(struct irq_fwspec *fwspec,
 	 */
 	mutex_lock(&irq_domain_mutex);
 	list_for_each_entry(h, &irq_domain_list, link) {
-		if (h->ops->select && fwspec->param_count)
+		if (h->ops->select)
 			rc = h->ops->select(h, fwspec, bus_token);
 		else if (h->ops->match)
 			rc = h->ops->match(h, to_of_node(fwnode), bus_token);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
