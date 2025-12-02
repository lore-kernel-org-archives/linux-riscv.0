Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E811ECFD2F6
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Dec 2025 06:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gAw5NCiFIZX4yrZ1YPk5Z31pANJcLjIT7NfTFqbUUxo=; b=KV4L6bYqpQtvoD
	3UUoUpHY3TAoZFallEirwvQPNQt6/udqW5KNshIeSvD5D9NksfXs8E7RYwfWjIx0GbAHbM9MwosoH
	iSjEV/+afNoIXsYCWouxD71h6r4kPDY0GdLhvC8RMdQxJI7Ewv2tU6HVOSW6rfR0E15wVolkMZV9V
	ru08uWrTVq8l3glYHh2c+ubx4etx3YXn09yIzcMOPY7IC5lro+wjMo6KJaIgDRbWj1bT7u/MfYpzj
	IU1jqpWrbHwIuxZgqPzYp4uWPDfiGIyU0O1CfuIEtXoZ2BEqrBuZpDQW1hMtcO6eZ6rd4L5Xb3C7t
	jZY89ePaYxm/kDTeiNGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQJS2-00000004sNl-0FNG;
	Tue, 02 Dec 2025 06:01:26 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQJRz-00000004sN5-2uDW
	for linux-riscv@lists.infradead.org;
	Tue, 02 Dec 2025 06:01:25 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3436d6ca17bso4873680a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 01 Dec 2025 22:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1764655282; x=1765260082; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JUwV8Nhy+uTExeuD3LgiYQa5mdRnDsvQ01V5t8mXAjU=;
        b=XIrQjFGse53pHKXH7NJyyCAccQUHBX0W2krr0wH4I+tk7HH+IzYLQphiSGpFQNR1Rd
         LGUu1+bCaaYaFSFzbIK7R/QzIm9dVZDcRwdIWnaccJYOwGIqLJceQ5hcu5wUEBqVNF3y
         2zEs7OsPxpTOXqM4zSAuWApj0bz/WW7PE0R4/B7NvWdvibR7TEEkX1E448G8ZFedliSa
         ukr7rcUAqsBzV26fqAX7d7f71TARQLlJRCPSchvtRZRVSlHs+vUt7uaiQiTpSOEmsyNq
         Fn62MXaOqZzYut/9KCjZJzs1b+ybxpsVCPUmws399bDJzsk/FumGqSVT2b6mcF1x1J3u
         wQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764655282; x=1765260082;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUwV8Nhy+uTExeuD3LgiYQa5mdRnDsvQ01V5t8mXAjU=;
        b=o4chDv7eiZIBWiO4hKZQMkF0IUbjY0edWwgu2MdBiA5KRh8koRykyUh4XboC26Va4h
         /aZfVkHTMUHGeFEDwKX9U5tHt+jjmyp/lam4oPwtxwatgS+l1o9TnBRspKqkZfaUVhJz
         wuiVyWpFBonk37b0rKHPvZ0Ra7jP4XvcVOp3N54aMbzKt4/QwWgEk2Rg38GtdXS4RLEl
         hCsEKErGOX+ZfaWo8EvK07wXAfwCaPAgXZThI6oeV4wc3ZsdNjby3BEsHQHuupzLq7T8
         7j1BtesotQ/OtUt1jFbqNatv6gAzRbO1cdcYHSFb0th9+9PexozmaulX3ckOJAGJrpHg
         kBYA==
X-Gm-Message-State: AOJu0Yw3Db84Rd4tUz0Dbmr8w5EwnRZwC15YP7/cEPNuMeCe0lKzXRTa
	mNsMutuhdgayWbO6iMcJyrGkxW8i6m5Tl5E5+tSqy/vzV3XYxenWFtrIu45fam+Ywtg=
X-Gm-Gg: ASbGncutO1mdLLmaEsejwVr+X0JwDY+DFLyD0csj7ni3g8Sef88RZBNbV53Rk1IqJ4h
	gOPkm7Q1Hlzhpw66sMw3ydxk3qtj7m1DBjyKFZmdTzpOnHvkj3axZToalnak4SeJbHSYJy83odi
	UzTubPZBT6lmndEJfJM1QjOCGclC82c7m0SCW3NlaA2l/6DVGv+qaqFXZ9BeIJ9SXL6uJV2/W1j
	4UU/HuSz9EQEIxbq1OzvqPmwW6PXmtOwsA4V3hCkzrBKXp00S7SmDbPp5wlSldmkxN6f/kC79Ox
	cw8ofz0jXdviFTslQfUbWXqUqPi1VCMbdlbUXV4HiIeSAdVFpHFb4hX9S4Vj+VEUij8CWjQ/qpT
	qk+uL7LlSr9A7zcFq1e1kvdBz6gqrWwinPqi2sDEw88ASLZp7aS5bzuf/GTKB6U21f+PW0UZpBu
	ZCZK5oqTQd
X-Google-Smtp-Source: AGHT+IEDvXe7HwnGwLwjiy+4fuZLsmwRNi3krK2hUgdHdgCuiVGfi6aF8U0D/NavXTDzbNfwytZcWQ==
X-Received: by 2002:a17:90b:224e:b0:33e:2d0f:479b with SMTP id 98e67ed59e1d1-34733e4683cmr39441903a91.6.1764655282010;
        Mon, 01 Dec 2025 22:01:22 -0800 (PST)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a547483sm19083810a91.4.2025.12.01.22.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 22:01:21 -0800 (PST)
From: Nick Hu <nick.hu@sifive.com>
Subject: [PATCH v3 0/2] riscv-imsic/aplic: Preserve IMSIC and APLIC states
 during suspend
Date: Tue, 02 Dec 2025 14:07:39 +0800
Message-Id: <20251202-preserve-aplic-imsic-v3-0-1844fbf1fe92@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACuCLmkC/z2MywrCMBBFf6XM2glJSurgyv8oLtJ0agftg0SLU
 PrvDi7cXDhwz9mhcBYucKl2yLxJkWVWqE8VpDHOd0bplcFbH5xzhGtmVTbGuD4loUxF13rqui7
 0jvoIquppkM8v296Uh7xM+Bozx3/Mkm0s+bNvDFEd0OEs6WHG97XIIBubtExwHF8aG4VUoQAAA
 A==
X-Change-ID: 20251118-preserve-aplic-imsic-028bbb5d18da
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>, Cyan Yang <cyan.yang@sifive.com>, 
 Nutty Liu <liujingqi@lanxincomputing.com>, Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_220123_751753_04B451F3 
X-CRM114-Status: GOOD (  10.15  )
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

Since the APLIC and IMSIC may be reset when the platform enters a deep
sleep state, it is necessary to implement save and restore functions
to ensure their states are correctly preserved and restored.

Chagnes in V3:
- Refine the commit messages and comments
- Rename "imsic_restore()" to "imsic_hw_states_init()"
- Rename "aplic_direct_restore()" to "aplic_direct_restore_states()"
- Rename "aplic_add()" to "aplic_pm_add()"
- Rename "aplic_remove()" to "aplic_pm_remove()"
- Rename "aplic_save()" to "aplic_save_states()"
- Rename "aplic_restore()" to "aplic_restore_states()"
- Use "struct aplic_saved_regs" and "struct aplic_src_ctrl" to preserve
  the APLIC states

Changes in V2:
- Address the compile error from kernel test robot when
  CONFIG_RISCV_M_MODE is enabled.
- Rename "imsic_notifier_block" to "imsic_pm_notifier_block"
- Reanme "aplic_notifier" to "aplic_pm_notifier"
- Make aplic_add() as static and directly call it from aplic_setup_priv().
- Rename "list" as "head" and make it first variable in "struct aplic_priv"

Nick Hu (2):
  irqchip/riscv-imsic: Restore the IMSIC registers
  irqchip/riscv-aplic: Save and restore APLIC registers

 drivers/irqchip/irq-riscv-aplic-direct.c |  11 ++
 drivers/irqchip/irq-riscv-aplic-main.c   | 158 ++++++++++++++++++++++-
 drivers/irqchip/irq-riscv-aplic-main.h   |  11 ++
 drivers/irqchip/irq-riscv-imsic-early.c  |  41 ++++--
 4 files changed, 212 insertions(+), 9 deletions(-)

--
2.17.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

---
Nick Hu (2):
      irqchip/riscv-imsic: Add a CPU pm notifier to restore the IMSIC on exit
      irqchip/riscv-aplic: Preserve APLIC states across suspend/resume

 drivers/irqchip/irq-riscv-aplic-direct.c |  10 ++
 drivers/irqchip/irq-riscv-aplic-main.c   | 166 ++++++++++++++++++++++++++++++-
 drivers/irqchip/irq-riscv-aplic-main.h   |  19 ++++
 drivers/irqchip/irq-riscv-imsic-early.c  |  39 ++++++--
 4 files changed, 225 insertions(+), 9 deletions(-)
---
base-commit: 1b5dd29869b1e63f7e5c37d7552e2dcf22de3c26
change-id: 20251118-preserve-aplic-imsic-028bbb5d18da

Best regards,
-- 
Nick Hu <nick.hu@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
