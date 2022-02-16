Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B740C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 05:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6j9vClbpyD9gQmgGpMGIYZ4XICbxnwekFFCCWI3e6+Y=; b=ZO4fQMQmNsId+l
	1uNZrrCeB32aBeDNQcsBiXGWwbRK3MgdHc7H+4VWE1KBxQoE5ftZA02mqwkFvLLO1RoShkG+i1qHr
	vlW+djJRb6nWUmkQJZGZVCC4ngGkgNR+KkHJ7jd+JeyGPM55dYi7ERa1o135PZvR5KaP/SD19PuBA
	rruqfg8S2ET3T8W/yuvSqHiEZWMdWTHhV8nEXIBdHgOsrDc7BA8M25MhRbPZAqeUUbF5BNGTqEmik
	HlTm5ogIdUaG6c859IGF3sss5TuyWq38r+Dss18tOVuXSYqFbU3cbvyb5533z2XkH/9BLILju9q5t
	Qtv8Wr1OsOoQLrU82j9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKCl7-005aBp-ON; Wed, 16 Feb 2022 05:21:45 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKCl4-005aBQ-Kz
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 05:21:44 +0000
Received: by mail-pj1-x102d.google.com with SMTP id b8so1446702pjb.4
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 21:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z0J8uT/MlG3w0v7/uc2AXa/I1ciUjnfuTE3jIsdWuBE=;
 b=JJpel9mFC6bgnnn5zrLI5AMAFKC+fFMq/rDnPHY6Uk+sFVnXDwtCF4Afqxirozx+JP
 N6GFFvIyePOq6lbDh1rOUS/zRD1ghlUuus9GvKYNy7DQ5i47A1G2J0R+top/bmbvQrZv
 +uftVneozuqWDMWmoZS3iqCISZcUMVMrttiWyPeWehICh3GoumGKs6bfleotEd9bHR9f
 r85jIuOojUPYN2PVrQ93VwL+aC7/NkNhYnjsKiqY4wyWzqaVg/4JP4Lt8BFkaAbE7ruP
 9OG9QHnEqX1wxFBGmD9odkCJBYJOcIRzPNrNP6NTGcAjZzLAQwFMyS5w8RdOE5a49K75
 ueNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z0J8uT/MlG3w0v7/uc2AXa/I1ciUjnfuTE3jIsdWuBE=;
 b=0dKO1ma9oCvPpvAR0iXW7L7JaJqHVXlH8BwAMUIhYv0tidhUGRlHP56kzZh6p0pu3w
 AoOs4w5K9DCJ/BG8kVYtdp0zR8bg5ZAMSZsi+y2YdUKqdQ9aF7MDl81lqpDVSeGBGnbW
 /EvAhb35c5MzopZPXWmK8potkhHvlR9Sztb3YRn7M/KOF+qJ0V6gCj+zg4xlA4cZs+aO
 bt+L5vTB2zb6izlsAmXPE1A6V9ZAjpcLmg6al1QiTmL35FKkWMFH6MYvYSEczB9SxRyX
 jrw1iE8rS6bDhPquiKc+3gx8sxHGXpWfIEXVKe60e4OEdKS+QGXFAbB2rLFlEWM6Tag6
 F2hw==
X-Gm-Message-State: AOAM531EA3shIX+jeFEAcAK6ob0edECGqTe7Z/kSl2FbrpZAjbQhftpn
 Vlxv+61/iSpWG8gY++mSxDcXIA==
X-Google-Smtp-Source: ABdhPJxxMXyYDDnx9KBGWahCQZUQtvcrz4/zlpVXzpbkNu3KzRnrTuSLbz1zppfd8SdoW4QfqY4puw==
X-Received: by 2002:a17:90b:4a4f:b0:1b8:7240:1a47 with SMTP id
 lb15-20020a17090b4a4f00b001b872401a47mr8442350pjb.84.1644988901155; 
 Tue, 15 Feb 2022 21:21:41 -0800 (PST)
Received: from localhost.localdomain ([117.248.109.221])
 by smtp.gmail.com with ESMTPSA id ot12sm10775259pjb.22.2022.02.15.21.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 21:21:40 -0800 (PST)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	paul.walmsley@sifive.com
Cc: anup@brainfault.org, atishp@rivosinc.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [RFC PATCH 0/2] Risc-V Svinval support
Date: Wed, 16 Feb 2022 10:51:08 +0530
Message-Id: <20220216052110.1053665-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_212142_708362_7BC046B2 
X-CRM114-Status: UNSURE (   9.57  )
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

This patch adds support for the Svinval extension version 1.0 as defined in the
Risc V Privileged specification. It depends on and needs to be applied on the
following patchsets from Atish and Anup respectively:

https://patchwork.kernel.org/project/linux-riscv/list/?series=613234
https://patchwork.kernel.org/project/linux-riscv/list/?series=609361

The feature was tested with qemu from latest staging branch with following
additional patch:
https://lists.nongnu.org/archive/html/qemu-riscv/2022-02/msg00100.html 

Mayuresh Chitale (2):
  riscv: enum for svinval extension
  riscv: mm: use svinval instructions instead of sfence.vma

 arch/riscv/include/asm/hwcap.h    |  1 +
 arch/riscv/include/asm/tlbflush.h | 14 +++++++
 arch/riscv/kernel/cpu.c           |  1 +
 arch/riscv/kernel/setup.c         |  1 +
 arch/riscv/mm/Makefile            |  1 +
 arch/riscv/mm/tlb.S               | 53 +++++++++++++++++++++++
 arch/riscv/mm/tlbflush.c          | 70 ++++++++++++++++++++++++++++---
 7 files changed, 135 insertions(+), 6 deletions(-)
 create mode 100644 arch/riscv/mm/tlb.S

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
