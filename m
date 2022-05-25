Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B35C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 15:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41dUBFB/3rAzt9k17RA2nxFwxBXybswwQCOBYJ0ME/w=; b=nkqM8v/1IGb+QX
	Et7wgamhqRB2fJM3dbQEiYC9RfFGhFjql8g7lt9MC1zTyd5Q3wsmGwXHUhe2bnyygjG/YLFOHz3UT
	L8wmW3lbu1TWIiG+FK2rxpMDNNX8qgWvwZUMRDUJ2eHpRyndjZAvXna8iiX2AbCsULqa/YmGTWoiS
	XJhhjUgGp9M5twlag2Sc1aGIF8VU78t5nvI6qr5tts63jws0EJ3bydB+OTaFQXWPjSG0ZR4wC4t6T
	bupf3+7eFBP2rE/6int6qlumY3hk73izTURfvtUNjz4W4oI9ak6h28iyKxMG7t3SnUr2zHf/BP4sx
	UecdVilohukNZQy4z+ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntsfd-00BWLh-OO; Wed, 25 May 2022 15:11:33 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntsfa-00BWJ2-D7
	for linux-riscv@lists.infradead.org; Wed, 25 May 2022 15:11:31 +0000
Received: by mail-pl1-x62d.google.com with SMTP id m1so18834656plx.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 08:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oVcwfs7LaLIcj8lD0NxblPY5TrT7/xc4rcWLu0GbH70=;
        b=coceHEo+uv0xofNyutF8KiY+u4PV6Q6q9xmbXvvXEGUoUIAew/qQzpeRkD/GbADPdv
         rMRlGpgN3VAC2YJjmyNiRZWOiFsXecrEerYxZmn+m/Y5NeGUWYcDxnh8umnlU/jvMjYd
         d8sc1IlKcPL6MFLm5Vv1tMCWqG+ZVsFgOFgt6bnci0h+K0TzBhy9UY8adMbssZYWIX/F
         ZSAMTANEQJtrQainm/5YfOp+Iq7f6c0ZsiCoAjkRJy+uDdeMt88mPVyUYJkDEf7OlZeD
         sgObM/VXLGHpbKfWbhP00sd+0gSX+i/RtUWiWU+Zfi7sBZMIOpI6/LCkdgF5Wh64Opvd
         qVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oVcwfs7LaLIcj8lD0NxblPY5TrT7/xc4rcWLu0GbH70=;
        b=QASBYf4kc38DLRRb7OdnyQQJV//9GzYXHnWGnMLppyZLE6wo/cTDqjPoKdl6WXDppn
         5V/F4tTFHWlRVUZsOkLZZ6OhI6XYjOjjgUEFpiRjGS4fVtq26cKF9Qp6p2pW3lQIvHsY
         BOlXGGERezy1Gu7ytTd+GyXwA/PVsWtI9V7rBGq5mBd49nezGrmYxBgWsbBPe5jWRvi5
         X9Pl8OhwLtYP9qDlZvrKA9kZCxNY2T99C6jh4BfJXCU0Skr59xwu19jfMGhMPckC/NUJ
         C9RZIpg2xdgmrTXbUjELS8hj/8uC8tGHlhJKeImpxFYoxwUPLauLm+OT79nkUW1dMK6Z
         5vBA==
X-Gm-Message-State: AOAM531bHfpnzaB2HPb1x+is0+ElxkZqty0IoxxcCAwJ3yD+W18T4BLg
	yqO4SoXCnE4frqeNYg8bvxVIAA==
X-Google-Smtp-Source: ABdhPJxNl6pWvjOH0gmcPXnjFKnF2aho/BIbIKdow5euUMkaXYfoVmFi2m9UhxAJyH5LYHt6hHL3Gg==
X-Received: by 2002:a17:90b:4d12:b0:1e0:44a8:4a09 with SMTP id mw18-20020a17090b4d1200b001e044a84a09mr10865887pjb.189.1653491487665;
        Wed, 25 May 2022 08:11:27 -0700 (PDT)
Received: from kerodipc.Dlink ([49.206.9.238])
        by smtp.gmail.com with ESMTPSA id q16-20020a170902eb9000b00161b50c3db4sm9383129plg.94.2022.05.25.08.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 08:11:27 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Sunil V L <sunil.vl@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 2/5] riscv: cpu_ops_spinwait: Support for 64bit hartid
Date: Wed, 25 May 2022 20:41:03 +0530
Message-Id: <20220525151106.2176147-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220525151106.2176147-1-sunilvl@ventanamicro.com>
References: <20220525151106.2176147-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_081130_487679_E55D36AF 
X-CRM114-Status: GOOD (  12.06  )
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

The hartid can be a 64bit value on RV64 platforms. This patch modifies
the hartid variable type to unsigned long so that it can hold 64bit
value on RV64 platforms.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/kernel/cpu_ops_spinwait.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpu_ops_spinwait.c b/arch/riscv/kernel/cpu_ops_spinwait.c
index 346847f6c41c..51ac07514a62 100644
--- a/arch/riscv/kernel/cpu_ops_spinwait.c
+++ b/arch/riscv/kernel/cpu_ops_spinwait.c
@@ -18,7 +18,7 @@ void *__cpu_spinwait_task_pointer[NR_CPUS] __section(".data");
 static void cpu_update_secondary_bootdata(unsigned int cpuid,
 				   struct task_struct *tidle)
 {
-	int hartid = cpuid_to_hartid_map(cpuid);
+	unsigned long hartid = cpuid_to_hartid_map(cpuid);
 
 	/*
 	 * The hartid must be less than NR_CPUS to avoid out-of-bound access
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
