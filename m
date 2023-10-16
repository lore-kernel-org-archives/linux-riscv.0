Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC37C41513
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 16:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cX0+c+BSS5TmxFR6CN7Zo5/N705Ys4aPmv+msPR68Tc=; b=eMCdVDjoBUb3ge
	/01ILyFdb2EfgZ62/eYmk8cK9HZSor223okC6kZ43IGS0nXWbN/PzLDsn3wXxrOTZmrC+9dg7R1k7
	WV3i08dAWpREOhxAIrizoKyeYysdfJclHe+GidMa5eSSdwr2FNr5Z5J9XJfEt6J+Lvp05BdSe542R
	fkrpzA4e8Z7jGR9ASrZkJGedKxn2yrjCQ0vWSxvJUgA3CP7scIrFfrrmpCN27R43Lx8WyBdJJh0lm
	qFtUYLknnx0Wm1jJBLLsC/4QfPvaxQ9AKgCYD7ZR05OgyTMR+PD7kihf4Bxx0v/iuegbWHl9DFjHS
	6h/OHKoUcO6FjjtVhAGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsQnI-00AAz3-1g;
	Mon, 16 Oct 2023 16:50:16 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsQnD-00AAwh-2y
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 16:50:14 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-57be3d8e738so2734717eaf.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Oct 2023 09:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697475007; x=1698079807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nj4mUrtXg+jVZ5VMP/KIsH/QVzXK0fH/Er20bgBIeBo=;
        b=hilVQwlKnlD50Qyq1zsKvbhLsCzacq+QQfoYqevVUWzwiLzu7QAs2JTtANHiTHA6IY
         LEOmnpNFeqbW6qyfwI6U3scVMRo5m+vJhl1hmlRi025lLsaSoJPak2M06GNyg6ktAVK2
         9oXVIdVSNQF1uvoKEW6IM3mMNefzYocttLUxVqxshgLrcTkKQcYdlsOnvh+2d9sdlXFz
         rHyjqPWbCUgunr/xsBEwv7U8xzetWIW7YFG+pv+F2froJDhKWCiJ1CJo7c7fJPn0OAyI
         TMsvt1C1DCn3FVM2T7oQaUpp3C1KqC3nAzYbmEnQB7nnXUFc/UmrL9dvf6Ogb8E+/ve2
         6Y+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697475007; x=1698079807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nj4mUrtXg+jVZ5VMP/KIsH/QVzXK0fH/Er20bgBIeBo=;
        b=r0eKWK0i7EfyQzAmuQFc4WQXexmCMH2XCJE4DV4Wgn2QivxqXpmdLKaRfKYbtpMGWb
         ASggojOZmqxwY2iqXNvwnHQQ1sHwgGZz/oXdidE7v8+Xa+tiQfGViEODLRu/M0JXriNl
         c72e311Wo4lbBIcp3RAIwF+QHJBydAHnmS5DbqOJHu04ln7jfVHrFqGYLVGPTYn25sGX
         rbTwvZOnDgXLf2PtMNYMFJkAnS+fiw6sl3YYgeTdJgWAgITsTsbBr4dZyhl/lsTr6Det
         YiMh8nXvUZSTEacsSW1Lb2BlLptEF3JMYzWe8Fh4jZqAtKaztA7+sf6nryk8uFK1BNf/
         IEEQ==
X-Gm-Message-State: AOJu0YwjRRZKzNDAe2DVZShvVzQaUErbVOVeMsTt03bUNTUIAwiIfblo
	H8ckKUAbXxO0g5ZlDQqyZMy3SJOv391OXemaIck=
X-Google-Smtp-Source: AGHT+IG3jzS3nNrWFmdHjDweEuDLpJu81THeMvF++Va26eiZyY17KHQ5m+DK9WYdaSyS0jW1tMZGag==
X-Received: by 2002:a05:6358:9691:b0:164:8742:525 with SMTP id o17-20020a056358969100b0016487420525mr33127726rwa.17.1697475006528;
        Mon, 16 Oct 2023 09:50:06 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id t21-20020a056a0021d500b006b1e8f17b85sm111252pfj.201.2023.10.16.09.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 09:50:05 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v3 -next 0/3] RISC-V: ACPI improvements
Date: Mon, 16 Oct 2023 22:19:55 +0530
Message-Id: <20231016164958.1191529-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_095011_964457_4E0953F6 
X-CRM114-Status: GOOD (  11.93  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Ard Biesheuvel <ardb@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series is a set of patches which were originally part of RFC v1 series
[1] to add ACPI support in RISC-V interrupt controllers. Since these
patches are independent of the interrupt controllers, creating this new
series which helps to merge instead of waiting for big series.

This set of patches primarily adds support below ECR [2] which is approved
by the ASWG and adds below features.

- Get CBO block sizes from RHCT on ACPI based systems.

Additionally, the series contains a patch to improve acpi_os_ioremap().

[1] - https://lore.kernel.org/lkml/20230803175202.3173957-1-sunilvl@ventanamicro.com/
[2] - https://drive.google.com/file/d/1sKbOa8m1UZw1JkquZYe3F1zQBN1xXsaf/view?usp=sharing

Changes since v2:
	1) Modified acpi_get_cbo_block_size() not to take cpu parameter
	   but follow same pattern as DT (Feedback from Samuel and Drew)
	2) Dropped timer patch from the series since it is already
	   applied.
	3) Selected ARCH_KEEP_MEMBLOCK only if ACPI (Feedback from
	   Alex).
	4) Added RB tags received so far except RHCT patch which has
	   changed quite significantly from previous version.

Changes since RFC v1:
	1) Separated the patches from interrupt controller support series.
	2) Addressed feedback from Andy and Drew.
	3) Rebased to Palmer's for-next tree.
	4) Added RB tags received on RFC v1.


Sunil V L (3):
  RISC-V: ACPI: Enhance acpi_os_ioremap with MMIO remapping
  RISC-V: ACPI: RHCT: Add function to get CBO block sizes
  RISC-V: cacheflush: Initialize CBO variables on ACPI systems

 arch/riscv/Kconfig            |  1 +
 arch/riscv/include/asm/acpi.h |  6 +++
 arch/riscv/kernel/acpi.c      | 87 +++++++++++++++++++++++++++++++-
 arch/riscv/mm/cacheflush.c    | 25 +++++++---
 drivers/acpi/riscv/rhct.c     | 93 +++++++++++++++++++++++++++++++++++
 5 files changed, 204 insertions(+), 8 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
