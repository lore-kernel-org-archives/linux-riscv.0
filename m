Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884D1C3DA4A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 14:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+9SKUBL0wq/1FYODEz8QGHhL75/jD+ZXlzd6dAWKt8k=; b=PbASdSMGTQkXjV
	urBtL9SYBMIRgGo2RIFP+xgumSAAtI0WreX+CgQX40DBRZUJ4tOHiWZ4j4QXHWjgQ9KcVWiX6PuFc
	ShwcHZhY7aIAryvxeJ/NCYcyJYQJOzjzJ3VN/XyksbJiOLIyXpML4nhp50O6gqG6bxcwmluBPlNFE
	85r7HZw8o/XtWMYSA2kL+nhqJA5CyirL5ZcWckgWGxPQxUHPWe5Map3vvbcNJCLswVrW3nV60bVzn
	Yijux8kal3zyxj3hlzwXD8auJRxww/oWOLB0Jlp7rZBXWxIYmZa6osoKwlTctxiYnRiFULeWIIT82
	7/ncXsiiuBWOt9wq+mrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFRi-00000007OIz-2bUt;
	Wed, 14 Aug 2024 14:57:54 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFQh-00000007O1G-3vyc
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 14:56:54 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9A3583F17F
	for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 14:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1723647405;
	bh=1wRtYUtR8UlqWuh3Z5TcGqfoeh7JMRQxw9M4F5yrv74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=HDH8LYXW55wgx40KzOd4M7PhD6PenzQoo0SQrO1IKwjbveiMuixMh27Zkicx974zd
	 DlWb0sbFAOeik2lNb9KPDKoGPMjEzRXiQdddcPWaWqEMmn0jcgyopZHUSIeKOzte4H
	 9UyUZU5thokxcQDt4lirjxHmYxDHRNeMlHscLxcOqGAtHfwzLm0LxRUA3e+UmBKNut
	 3c0hxqbRqOkUSxJDncs6ahLAapxHcihA1YCYcqdQl41qL7BZSzIEhufjKzT/odWEbh
	 aiB+NB4UfP2z6Y1+rPQZGezl+3gZLNL3Fho+sWWK2hfFrVXUtKapjIlRDxpJ1XWdy4
	 rI/VoAG1EB1Iw==
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a7a8d5ad9bcso480220166b.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 07:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723647405; x=1724252205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1wRtYUtR8UlqWuh3Z5TcGqfoeh7JMRQxw9M4F5yrv74=;
        b=YdjYc3jBieZZ8tDiaa/cmHnQDyEm8EUgYQczWdjhXZkJAm+sxEK6AuTQ9M6L6YlwJE
         aj99XxVYGVOGsSDxdW/sLqlsNMAjRB3gI1Zi+VCt0GXGXfwjvO5H9TI/KMgg7vRkj2NO
         5XGmqXmCbSonFCO0LgZD18bB/yGnjZ8x0r+UIbelz+QdKY5sFj675FLCWB3twH8Czk9/
         u6nmgGCkiNHn9d+lSlyBYJnYUqJzBb+COUtnntmpYKIuG9x1MoOd/RXI+MIniJZsxu2n
         KpYi3QNn7rGpnuHBFySrjSFQu5gEh7eBgEt9EhXVTKo9GkwBW2z+BqNKBbU8sp6Z5qbr
         pKoA==
X-Forwarded-Encrypted: i=1; AJvYcCVdr1XoF6/VypIgmu196jwHC7VtIuArkIg1OnzvoZa5weEP+6eUDoTCWdYrpBlH0MIkNF4qDwOdEMuLGgb+4cYWQmm1fbfxKtG+jnFpZhSK
X-Gm-Message-State: AOJu0YyPGPLR42B+35Y9uuQ0ZUfy7Z969Y0/jy+QWA4oT465QQIMSlHP
	thJzR8B//UrqBukvTcjY4AnawaLUWLFwM+/WyIteybzowkyC9bUNRn5v2yt3aptm/nXOHTJr9Wt
	vbRgQm2ddSUF3WqKZ/5Wz4KXgPjnbFTQKGH1kW7Qw1yc4TAoaV/AHjp7g9PqBKu00xp8XLHEAGd
	HjW8aj+g==
X-Received: by 2002:a17:907:e211:b0:a7d:edb2:21f5 with SMTP id a640c23a62f3a-a8366c30b5bmr210859266b.12.1723647404934;
        Wed, 14 Aug 2024 07:56:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQWZpAuZgbaR8dtL1ZzyQGO7tXE160bYSLtf1lpTYlgFKh4xYX7pWpwI3T11+uHl2LSysZkw==
X-Received: by 2002:a17:907:e211:b0:a7d:edb2:21f5 with SMTP id a640c23a62f3a-a8366c30b5bmr210856266b.12.1723647404030;
        Wed, 14 Aug 2024 07:56:44 -0700 (PDT)
Received: from stitch.. ([2a01:4262:1ab:c:bbf4:eba3:898f:7501])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f411bdcbsm182316866b.105.2024.08.14.07.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 07:56:43 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v1 0/9] Fix Allwinner D1 boot regression
Date: Wed, 14 Aug 2024 16:56:32 +0200
Message-ID: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_075652_400668_4EF8219C 
X-CRM114-Status: GOOD (  10.26  )
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

Hi Anup,

As described in the thread below[1] I haven't been able to boot my
boards based on the Allwinner D1 SoC since 6.9 where you converted the
SiFive PLIC driver to a platform driver.

This is clearly a regression and there haven't really been much progress
on fixing the issue since then, so here is the revert that fixes it.

If no other fix is found before 6.11 I suggest we apply this.

[1]: https://lore.kernel.org/linux-riscv/CAJM55Z9hGKo4784N3s3DhWw=nMRKZKcmvZ58x7uVBghExhoc9A@mail.gmail.com/

/Emil

Emil Renner Berthing (9):
  Revert "irqchip/sifive-plic: Chain to parent IRQ after handlers are
    ready"
  Revert "irqchip/sifive-plic: Avoid explicit cpumask allocation on
    stack"
  Revert "irqchip/sifive-plic: Improve locking safety by using
    irqsave/irqrestore"
  Revert "irqchip/sifive-plic: Parse number of interrupts and contexts
    early in plic_probe()"
  Revert "irqchip/sifive-plic: Cleanup PLIC contexts upon irqdomain
    creation failure"
  Revert "irqchip/sifive-plic: Use riscv_get_intc_hwnode() to get parent
    fwnode"
  Revert "irqchip/sifive-plic: Use devm_xyz() for managed allocation"
  Revert "irqchip/sifive-plic: Use dev_xyz() in-place of pr_xyz()"
  Revert "irqchip/sifive-plic: Convert PLIC driver into a platform
    driver"

 drivers/irqchip/irq-sifive-plic.c | 296 ++++++++++++------------------
 1 file changed, 117 insertions(+), 179 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
