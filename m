Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D22C46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 16:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SUyoIsEFMRAofmKLqe/d5/puBmNrVTrQaLAbAfPJVPY=; b=Ef8yEwviIcY8Eb
	CtA5bxCOzEqggZiyGtMs4ntOeCAAchXFFcE0D1w65AGNC1puhsBmBJWjGnh3wyaLbYyJZt51FKzLE
	prWTadVnOkkL+sw+ZjCebVIqobSa/2XPLkZGRxmtVqUMOEf8VICoxjPU1lj4m5nFDGmMSvwUUxxQw
	hIniI3zg0cOO5orG7UNXT3WhJa0/HZF1ovazcfrSIWrXqJB7tb49EAc13WwirXX4zJMD10eZlusw5
	5KaiQiQyK3+J1mxpPjoKP8GK1cE5laS9xldeTjlv9XNUUsRQEI2AG0/ZNFT70gcX4LDeAheD0kBX5
	Djntd4n8HgnbgRd3oIbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlOT-00000007kIh-1YL3;
	Sat, 27 Jan 2024 16:18:57 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlO7-00000007k2B-3Q8o
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 16:18:37 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1d7881b1843so13255345ad.3
        for <linux-riscv@lists.infradead.org>; Sat, 27 Jan 2024 08:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706372314; x=1706977114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhYUMfVc19qKu3HnThUsAONLPR7ur4VXlw7AfNK85R4=;
        b=HFLsgRdaTqmSYwYJP3xR5IYY+G6749zW0wpMdw1wOe/UmFSg5X/BdmlGV65abIw2bL
         m0LOtO+bPHPl3JOu0AHD8kv+QAYdIMjv3RICaKNCQKuVOVQWLz8tzYdD03k3/Mn58fy2
         jb6V+KB4R2hVAadaiOjIkBsUhRK41NxxAL4Ds9F5uGFRz4hRpLplzLO4GpNlJ/5IhaHI
         N1nVgQgJvt64Ra2y1nUPBvguVhKjSTsLREZNZF6PS92/2h8nAwveRCAcbsUj3xxTXnGd
         7vMwf8ChCtvB654H8mU47tQWO0TkHgH04N1iV+7Uz7RLkDBuF8b7aDh0BVEdfnZ17bt3
         xSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706372314; x=1706977114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhYUMfVc19qKu3HnThUsAONLPR7ur4VXlw7AfNK85R4=;
        b=mitYSun19gGAYfJiC4xRve8EXfKF6d5ep/zmmOcPR9vQ++1+gDmDp4mMXxJoIHZJvM
         m8PuhPzTNNmcHW3AVr8E2zZAl69hQ9JP75oe08W9cBlAv4Vuh33vus1IfJC21N3Kn7Mk
         bDXIYIjXuRVnjhzghOWoNjX1lu/5S6DWZqvd1cbWjzCm5Y5FPS0SjWNCckRqmWEIvTxU
         GLuFFLElaJEbewUTsArWSbfiFT+Pdu5w1ClKdKcOSPsXM6oJNlOQzh3P1KIMwQlf4vgK
         1d47gKSmIH/Qz9i7Nhy014AwPQZK8tWfc2ksJev3k9nEt2wKhkJp7k1QdYVX9kdF8MGn
         Unuw==
X-Gm-Message-State: AOJu0Yx1h9Ku+8b1wFHhZnbX5glDLUmZk+J5cPoTHWM5PoxotG9+aUEm
	nzpxFSQfLWwERsAWFcloLaa9UVz8SxruNm/PLqmZ4XN7hZ93Xd6FL0W9vsivzos=
X-Google-Smtp-Source: AGHT+IHtY0P//woqQufFCQxfwqYt9nRAYpMpLB6XG5TxI8TAX8TT9FgCwM/axEzX7TjcSLauiPb5WA==
X-Received: by 2002:a17:902:d4cf:b0:1d7:8237:f770 with SMTP id o15-20020a170902d4cf00b001d78237f770mr2153923plg.17.1706372314502;
        Sat, 27 Jan 2024 08:18:34 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.17])
        by smtp.gmail.com with ESMTPSA id d11-20020a17090ac24b00b00290f8c708d0sm5091620pjx.57.2024.01.27.08.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 08:18:34 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v12 03/25] genirq/msi: Extend msi_parent_ops
Date: Sat, 27 Jan 2024 21:47:31 +0530
Message-Id: <20240127161753.114685-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240127161753.114685-1-apatel@ventanamicro.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_081835_906865_83A24F35 
X-CRM114-Status: GOOD (  11.03  )
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

Supporting per device MSI domains on ARM64, RISC-V and the zoo of
interrupt mechanisms needs a bit more information than what the
initial x86 implementation provides.

Add the following fields:

  - required_flags: 	The flags which a parent domain requires to be set
  - bus_select_token:	The bus token of the parent domain for select()
  - bus_select_mask:	A bitmask of supported child domain bus types

This allows to provide library functions which can be shared between
various interrupt chip implementations and avoids replicating mostly
similar code all over the place.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/msi.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/msi.h b/include/linux/msi.h
index ddace8c34dcf..d5d1513ef4d6 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -572,6 +572,11 @@ enum {
  * struct msi_parent_ops - MSI parent domain callbacks and configuration info
  *
  * @supported_flags:	Required: The supported MSI flags of the parent domain
+ * @required_flags:	Optional: The required MSI flags of the parent MSI domain
+ * @bus_select_token:	Optional: The bus token of the real parent domain for
+ *			irq_domain::select()
+ * @bus_select_mask:	Optional: A mask of supported BUS_DOMAINs for
+ *			irq_domain::select()
  * @prefix:		Optional: Prefix for the domain and chip name
  * @init_dev_msi_info:	Required: Callback for MSI parent domains to setup parent
  *			domain specific domain flags, domain ops and interrupt chip
@@ -579,6 +584,9 @@ enum {
  */
 struct msi_parent_ops {
 	u32		supported_flags;
+	u32		required_flags;
+	u32		bus_select_token;
+	u32		bus_select_mask;
 	const char	*prefix;
 	bool		(*init_dev_msi_info)(struct device *dev, struct irq_domain *domain,
 					     struct irq_domain *msi_parent_domain,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
