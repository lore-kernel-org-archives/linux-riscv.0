Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FBDC54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g/qj/Qw5ee3DObvPJCbaCFexLwJY9ib29mxQhi5npAg=; b=kUql2endM6LX2W
	G4doUIc3Gee8/3YggBTrXqUqb23wwdnrhByN5S21ZpDVJCHbys1JiY0lxd4dNzlgf2QywZJkU4KR3
	69qyawJIEmCmlWusiH/auVxXz4M9L7k0u41ydq+D4+GGoVBGd3RTOxXoe+mAf6K8RTYpGTflnQynM
	zwBC803zDnsk2U81m3y0Qmj5O8DY6rHyIb6c75LEmrToBvTi9gabNRoq4t0sPBpw9oy5mLbCGATsN
	z3gTDC3HrdUTl8yxWgZAl9Lf5mEzjjQ8QiQAd4i6VbsIQ+kMNkqEPU93magvXuOd0cEUwY3oDUtIP
	+2sWCFFY2bHasmHQHiVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYpw-004xmS-DQ; Mon, 30 Jan 2023 18:25:00 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYnt-004wpq-8V
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:22:58 +0000
Received: by mail-pl1-x629.google.com with SMTP id r8so5684486pls.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uV9EY4GcIdMg2ei4Z2c7LvEp7Me6Q3TdFGwPQrDSIKc=;
        b=HnFGgGXu5x/MzSPNUPo2v/pKakFqmqRWg6BQwRTPrZG4sJqOl/VUF4GTP9i9fJrngn
         LxjYkozJRcGqTFtpW1ZJenp6ieACXPwwdG8MofsYgdXKJo5bGJiU0jbTysRY6DO9X+JD
         d9Zk77XxcXjHiM85uUyrqJTmc7fAHFRL1A4fD+B7GRTbo7uY2M8vLRiPTp5ZYb/dLo9T
         /SYJqVtO/2F4YdkMHCFjfdUDBtdyKQHJsdI5DwhbrCwQaIjM5lYyqZYggOVeBPbj4vo2
         dDyQwLdHBvmIGLO/TMUSRZtfcaEzTpFPU9j3uW5NE2cW9jpp5hZ1pilvVSBNhPXLL49z
         JgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uV9EY4GcIdMg2ei4Z2c7LvEp7Me6Q3TdFGwPQrDSIKc=;
        b=uZDP8XyJHxQcDrHO0nDV27uPgNF1uGIn7dSNFM3zTlxwBTvQFpGZmYJeS/yBpJzpT2
         V5Y4HMlTcLtBiyNENrQDfm43fDSQ1uF20JJX9Ex3HDknIccy2MchcJa3+xgVHSsaoPXw
         92Go7//xMfJSupSV7YeIxRWiK+GzClQEKeAC7LP+wWq+NPZJ81c368aXOjK40U+gMazO
         eLpef/Q6sriqwA5SxyqLLl789i1W2D1AW7Rj1Djn7v7157EkAWWAlFDXVY0+1WkpIIAL
         z1wVXTRnGhN7ZafoFndxMXAbqVJBWKt1Iltoy1+axY3VdaUbwWhUatllcN2xBAbQMMLM
         5JgA==
X-Gm-Message-State: AO0yUKVDrKMQNvBDet1XFC2lbTPA6mz/HbHL2wgBTb4AHGXVKS5KFh3h
	VXhOfmQGUMo/xkKEEXisZVicpQ==
X-Google-Smtp-Source: AK7set81m2sVmD0y/bGOO8qzoxXZgLQgJIi7xrMyNGd5m9OOckwQkYd5K05oM4haw3dx8ZgNydqYQw==
X-Received: by 2002:a17:90b:3805:b0:22c:4e1:93e with SMTP id mq5-20020a17090b380500b0022c04e1093emr23296691pjb.15.1675102963434;
        Mon, 30 Jan 2023 10:22:43 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:22:43 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 02/24] ACPICA: MADT: Add RISC-V INTC interrupt controller
Date: Mon, 30 Jan 2023 23:52:03 +0530
Message-Id: <20230130182225.2471414-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_102253_339223_78B5D63F 
X-CRM114-Status: GOOD (  10.98  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Robert Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, acpica-devel@lists.linuxfoundation.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The ECR to add RISC-V INTC interrupt controller is approved by
the UEFI forum and will be availabl in the next revision of
the ACPI specification.

This patch is not yet merged in ACPICA but a PR is raised.

ACPICA PR: https://github.com/acpica/acpica/pull/804
Reference: Mantis ID: 2348

Cc: Robert Moore <robert.moore@intel.com>
Cc: acpica-devel@lists.linuxfoundation.org
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 include/acpi/actbl2.h | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
index b2973dbe37ee..c432fd15db65 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -891,7 +891,8 @@ enum acpi_madt_type {
 	ACPI_MADT_TYPE_MSI_PIC = 21,
 	ACPI_MADT_TYPE_BIO_PIC = 22,
 	ACPI_MADT_TYPE_LPC_PIC = 23,
-	ACPI_MADT_TYPE_RESERVED = 24,	/* 24 to 0x7F are reserved */
+	ACPI_MADT_TYPE_RINTC = 24,
+	ACPI_MADT_TYPE_RESERVED = 25,	/* 25 to 0x7F are reserved */
 	ACPI_MADT_TYPE_OEM_RESERVED = 0x80	/* 0x80 to 0xFF are reserved for OEM use */
 };
 
@@ -1250,6 +1251,24 @@ enum acpi_madt_lpc_pic_version {
 	ACPI_MADT_LPC_PIC_VERSION_RESERVED = 2	/* 2 and greater are reserved */
 };
 
+/* 24: RISC-V INTC */
+struct acpi_madt_rintc {
+	struct acpi_subtable_header header;
+	u8 version;
+	u8 reserved;
+	u32 flags;
+	u64 hart_id;
+	u32 uid;		/* ACPI processor UID */
+};
+
+/* Values for RISC-V INTC Version field above */
+
+enum acpi_madt_rintc_version {
+	ACPI_MADT_RINTC_VERSION_NONE = 0,
+	ACPI_MADT_RINTC_VERSION_V1 = 1,
+	ACPI_MADT_RINTC_VERSION_RESERVED = 2	/* 2 and greater are reserved */
+};
+
 /* 80: OEM data */
 
 struct acpi_madt_oem_data {
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
