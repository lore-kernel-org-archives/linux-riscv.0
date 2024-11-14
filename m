Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86776D68B36
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 16:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KvBGJR5fycL12D2M320EM1Ty5TEAv7N9T8v0ArpL6nM=; b=P5+j1QS3EpgA/Y
	yOU3e7xmYbK2Xf7Hx8H/pzCkxKBfw7GqJg3axpGH8F/oUuBPp7kFdw5yZEOEjpSjzwD62aPKdyUUW
	I43bEcFNs/ptoGTPT002o7U4ew2L72PHiZawdN15OD3v+Y07iWRdw0WcVXzUW2QA4hndL2wu+R4aF
	shpU0NlEicUUFVAMlLQc1gpRKtRzQYfvOqFykBHrZgO0uHNRFZ2HnlLXdpEuPPXgHIdY4MZ9SlieG
	79IP9KkiG8BUetwbplxx/BrEr/59tq5sZphoC4nMOY9HzirZfpbuKUOZteA68GJ+uWuerP6d5X5nm
	XvqXG75hq/hycjPUdZ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYa-000000004tb-0eSX;
	Thu, 14 Nov 2024 16:18:56 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYX-000000004pK-1eO9
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 16:18:54 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539e8607c2aso849834e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Nov 2024 08:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1731601131; x=1732205931; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgkdpOYsLIOn0iKAKl5fgt6eXL8Mzl+XIucJ8fWc9TA=;
        b=HMk4PUosQnNRSmgX82JVY7cDKQtXa0/z4ZNqrK/iYyLV7q3xp44EkzDh5DgUpe7cL0
         r7fr4yCTFZUXJXHN8ZhMuvWCvwgWLlpUlt5EfACyBaBZDd2L2NrC+xBcIRT21uA3sMjb
         qutlGpfeMA4HeVbrNfXzRzXGFQjBm/p1pzfarq+UsdpC1+L1sg0ZVF44hn7dd9qBoi7/
         Seh9v3pOW5K7/ZfbCfCiP/M7eeMSr4MMsGzuh60Qcl4+xQqoX2xDrAa3FFFoUjzYi5lQ
         LbUBvtjDFWbrum2qGz/n5cMroo6lgoV0ZUMJip2FNl4pUD7phutmjQSOvt2gWvnJsrry
         B6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731601131; x=1732205931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EgkdpOYsLIOn0iKAKl5fgt6eXL8Mzl+XIucJ8fWc9TA=;
        b=PPXpfKEqdRZB62Rhgi64L3/msXMKmpBq4n5/SvaOst5NhNQ4ic6WbZcKPgGimiBGKb
         ggGQ3gWdAYw7B3UGAgW7+Ie+ecvVgMGyASub5UXr0uQ+JAck+GRsLTTgOXpjUkDWdA+L
         n0BEbU7AmQ1LsJEfnpXhPl7GcMTxaDy4E3+Lj6dRaLNK2C3unHN/e6ySkyQpcZpUiud3
         G+ojX+idwhQddOTKujxL+3vB1fBWlaUu4Jr5W9KonwhutFz9GXWvtuPpPbKyUr9t68xF
         VEuYtBt2TDnbVS3iWJH/XmkDcs3bP5gazJNtSFsv4nFI/Vl7oP2y99yc3bvN6u5Nf+e5
         krWA==
X-Forwarded-Encrypted: i=1; AJvYcCXL378QoDrG+C2cN8seQHHuv5lcRKN1g6SC2q5P47Wl9LdvOO2/GfADjmA1U5g7Qt8sqqySmeDhvr8HyA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9eKhy1zNaluePJMEoufXzBIgsrkp4Ma5VncRyPLDY9Lm7XfU5
	fzuhoavhyzsny10EmzJuu3hu7ZmAYY9mdXiB5GhKaphGGmKuJNJIotepkxkpo9Q=
X-Google-Smtp-Source: AGHT+IFd0CnkIMN5l0Pz4D+G0QBgRZi3KYTDXcb5xA9gQJqvW8wTertCqu9+xj4IWnW1G55hIkNGVw==
X-Received: by 2002:a05:6512:3ca5:b0:539:f607:1d2b with SMTP id 2adb3069b0e04-53d862b45e5mr14144215e87.7.1731601131046;
        Thu, 14 Nov 2024 08:18:51 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dac1f409sm24906005e9.37.2024.11.14.08.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 08:18:50 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: tjeznach@rivosinc.com,
	zong.li@sifive.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [RFC PATCH 03/15] irqchip/riscv-imsic: Add support for DOMAIN_BUS_MSI_REMAP
Date: Thu, 14 Nov 2024 17:18:48 +0100
Message-ID: <20241114161845.502027-20-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114161845.502027-17-ajones@ventanamicro.com>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_081853_446600_416F332B 
X-CRM114-Status: UNSURE (   9.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Unlike a child of an MSI NEXUS domain, a child of an MSI_REMAP domain
will not invoke init_dev_msi_info() with 'domain' equal to
'msi_parent_domain'. This is because the MSI_REMAP domain implements
init_dev_msi_info() with msi_parent_init_dev_msi_info(), which makes
'domain' point to the NEXUS (IMSIC) domain, while keeping
'msi_parent_domain' pointing to itself. The rest of the IMSIC
init_dev_msi_info() implementation works for MSI_REMAP domains,
though, so there's nothing to do to add support except accept the
token.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 5d7c30ad8855..6a7d7fefda6a 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -246,6 +246,8 @@ static bool imsic_init_dev_msi_info(struct device *dev,
 	case DOMAIN_BUS_NEXUS:
 		if (WARN_ON_ONCE(domain != real_parent))
 			return false;
+		fallthrough;
+	case DOMAIN_BUS_MSI_REMAP:
 #ifdef CONFIG_SMP
 		info->chip->irq_set_affinity = irq_chip_set_affinity_parent;
 #endif
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
