Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C64C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 08:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zdiGvhjgMce3lmxAaGa1xhw1+FOaLB23fQ9zie4AzHw=; b=VZEDfOg1RFzzA1
	TKZhx5wpL0JBUbfkoKvxoxvazsqx4OycmWt0v7vExiQZbfL7oX2ZLzjUr3/MWxnNcpX1YQGKrqb6e
	ujDnnbIxrEbu3pRuvys/LZRXl6i8h8IEF6R+RrR/oCegsHHSAwSLNfiKHlhATBtOlFcNPcONrA8Ry
	G0GzG2wHypu+UQ0rbg9e5+QWnVyyrUr1yLycxqHz4v3xPqLsfKbkWfjjWuWzVcnPUkb9SEH8YbXtk
	I3GNezhtPfLQpRR3zULvqxdEb5Ih3NkGgITfd+uHt9YL9UqzZ/hgu/8IBuMk8vqTnZDV5DN+vUhS7
	iN/ZDtpCe3Bz/wVvhqnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDMOi-00BrWq-Nw; Mon, 18 Jul 2022 08:46:36 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDMOg-00BrUi-6x
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 08:46:35 +0000
Received: by mail-pj1-x1030.google.com with SMTP id a15so11170377pjs.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Jul 2022 01:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y957zCpGlniV/Si1gB7hyzzV3GqFvEOSGpTrCkRJ3N4=;
        b=TS8oWTsNuIKrdwz7CdqkNr+Kyt2Fkt1mCq4Ny+Vw68yXzZfoO6nk5PfGIF2Vslrs9Q
         EYzquS26tAqK23AjcRIws+7QPlLihZjNPF472zGRnEorq852UPp1qrL1WzeXhy5VU7/j
         7JZxDDdj/8qS2cZBVMmkrUpIJUTd6SXj5fEWvo1MXFfovv6aivByO5jqhq7Jr0RHw5w9
         qL13T/B01oDW0cpgjGtu+2p/4Y3Y+P7R5LCBTlnU8RuSEOppyblLrsuvMD3XtiNarh0B
         rRhKoA+ktuLOw4zwOCrhtwCxXMis2U5gYd0IaJBSll6lFTdH/O1pPkNhiyvDOI3aewKl
         EVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y957zCpGlniV/Si1gB7hyzzV3GqFvEOSGpTrCkRJ3N4=;
        b=3BDqr+sWtdvJugTgIz+q0KvmtLGyuhURKs0RFn1tBiShHdxNcYzuIaUNrwF1kxsjEx
         1qf6RGAtEGq2LBh+SZLNj4xSeecpfQ9Gu1h5cGXQqObQtpeMRpIItS4OMVNJh6bqWf47
         VyawerHa907UbHHPgLd72AuG8hjKnzWvuiDuV8fkSt7hKbtm+RmggMfbkSKd1CA+F4lJ
         Z8MqTSPWlxczELhrgdf6sx0ttkiAYVE2gKOLRdng8EUbyIMfXGXjWaJB1p0pQv9rveIB
         x11pCvp1ISzC4bnIyeG0R8zug+/4JgMIy7VMw5pHSVkZx6ju69Mlqn/wKxDYOl7jVcRu
         W99A==
X-Gm-Message-State: AJIora8eAhVvmqcDfSv9QFTBHfmMVYefmxL75lbHU8k9+gWHna41I0wK
	n5ako1xPdVFXVmiJ0YH0RzHqkg==
X-Google-Smtp-Source: AGRyM1v0lb2Qi2Gd06NKDrEvEWrU5c3+56Zc1hPsUTR+a7AE9/OC+/MnWmQuOOiqrIueE72+pTFq7Q==
X-Received: by 2002:a17:90b:4b50:b0:1f0:5643:fa5c with SMTP id mi16-20020a17090b4b5000b001f05643fa5cmr38855624pjb.131.1658133991458;
        Mon, 18 Jul 2022 01:46:31 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([122.171.37.148])
        by smtp.gmail.com with ESMTPSA id t6-20020a635f06000000b0040dffa7e3d7sm7556487pgb.16.2022.07.18.01.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 01:46:30 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] cpuidle: riscv-sbi: Fix CPU_PM_CPU_IDLE_ENTER_xyz() macro usage
Date: Mon, 18 Jul 2022 14:15:53 +0530
Message-Id: <20220718084553.2056169-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_014634_269582_53ACEBAB 
X-CRM114-Status: UNSURE (   9.72  )
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

Currently, we are using CPU_PM_CPU_IDLE_ENTER_PARAM() for all SBI HSM
suspend types so retentive suspend types are also treated non-retentive
and kernel will do redundant additional work for these states.

The BIT[31] of SBI HSM suspend types allows us to differentiate between
retentive and non-retentive suspend types so we should use this BIT
to call appropriate CPU_PM_CPU_IDLE_ENTER_xyz() macro.

Fixes: 6abf32f1d9c5 ("cpuidle: Add RISC-V SBI CPU idle driver")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/cpuidle/cpuidle-riscv-sbi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index 1151e5e2ba82..33c92fec4365 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -97,8 +97,13 @@ static int sbi_cpuidle_enter_state(struct cpuidle_device *dev,
 				   struct cpuidle_driver *drv, int idx)
 {
 	u32 *states = __this_cpu_read(sbi_cpuidle_data.states);
+	u32 state = states[idx];
 
-	return CPU_PM_CPU_IDLE_ENTER_PARAM(sbi_suspend, idx, states[idx]);
+	if (state & SBI_HSM_SUSP_NON_RET_BIT)
+		return CPU_PM_CPU_IDLE_ENTER_PARAM(sbi_suspend, idx, state);
+	else
+		return CPU_PM_CPU_IDLE_ENTER_RETENTION_PARAM(sbi_suspend,
+							     idx, state);
 }
 
 static int __sbi_enter_domain_idle_state(struct cpuidle_device *dev,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
