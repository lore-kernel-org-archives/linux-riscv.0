Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859EFC4829A
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 03:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ZQ5QRoPNWSVZlfQT65msIMARQN8Y1A1rYhoXA0VJCE=; b=0G+ZlTeFcNWhFh
	IIKZT0kfmxXBBsNVyWUFH0rNaQTY8CTyYKBQP7YDtxrUJ+8L5+k6Quseyy2GysQcHs+ljJYp0mJU4
	CNQYyTpnpUyGb7GBbFa4zX2wOlQwrmON+MIORu/LGEoMqVTk6GDafK8OAOg7krvIqI1j2PRrAiivB
	cDLiZHZ9kRHOpsK6KhYDPVIdDyV150/RfaqD7P6JXnZUKZTqtgHeFyDoatZo07ziVJlbsP4yBSZa/
	munHlAYAMCgSfVENlTpUWsIGIeCxw9Sq03BQBa11HNJTGXA6ol8BBNEqxaNUGyv0XedozwYdGGjBu
	30XAOu5CbvUxhwniN0qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZjcJ-00000007rNB-19fV;
	Tue, 13 Feb 2024 03:37:55 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZjcF-00000007rLL-1tnJ
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 03:37:52 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3be9e11ee59so1944521b6e.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Feb 2024 19:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707795470; x=1708400270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xt5jr7Ps3GScSgM4o7qnaO9gd+HMLeMAVDsngYj3hEM=;
        b=bpyzuejKkJDY2DvumxPWLYBo9xGEPg7HAnuQ4ZGjmTXFyeXCUo4nbMf3McIAxo0he/
         niUipnC+HP5UaAYOZw3SsJJ9pnBoeNPT0BWdXnDHB689Tquru1tgdM887yK/5gOOa3sT
         bNboTKY6QrhfZrRxmScdm4ao1nH2I3m4IyIqRBr4IQciNaIPZcz5+wQPWDSGL6DXFyBW
         bUZEAElpRhg7MRb5xphMAIiaROesUOodFO3KEkL8vbDRAJzjHicjTHUbg7Cb7HUjbHOa
         y9582wrpVCtcSu54NgqaXV/OPC4MkSkQDiXn6+T67/Pa8MkpvqJQHQGcuZtnTmDM7fCM
         kzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707795470; x=1708400270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xt5jr7Ps3GScSgM4o7qnaO9gd+HMLeMAVDsngYj3hEM=;
        b=hwxFjk5snWJqZQe9jiaAFq42sv5FdQtjA0hwLgXmZUlxEXH/YNGa3fZX0EbO/SKG0l
         L1F/DltWm26jwlQ4ibFeS4I0pimev8VDifccoCQg6mCo1DCuYFUtCVO8cRUbCt+mm895
         YvXKNTu4s2dV7qGfu0kvLjJv2SPujuIkHc8lHOVJjTqDGPVMXwwf5a5g5TJJGlqeCDYl
         EBU7qTTN7k3En5AqcBDyhLApr+HQp7a49VHtb8L/ssMVlujqLDUh/c4e6fxEePcyBdwl
         b5wQQBS04uHZneqcc837S7SZOBmzx08TmpjEVpkQBc9P8Y5lDWBRh8vVu8rvk3FQ/jqG
         tEwg==
X-Forwarded-Encrypted: i=1; AJvYcCVapGTbf84vW1qVWSXcGk7F1N1q0mYZ9q1g4sUye4aTiKNiA5I9nQ1rfz9Lv0sGWxyeLteseQ4iV/RKLnuO6AXQlOv7s93nIrDjGVoqrcnN
X-Gm-Message-State: AOJu0Yy1icOUt0JXHFUTmlaYJauSgWdh+77X+M88VnOMqy3GxXMCTSLq
	/Npr0FjByvwxbg/JV+YFhHkPE+1ot54KPZ+sPBjKLYkEjWYx3AqzRAJhOxebMRY=
X-Google-Smtp-Source: AGHT+IFxDqSZbCOTRS1NHVNzCKhxZQyImRcw90Jz8SlHs0SSV2MQ75bbrukIBm2CKyA3KzugicZ3nw==
X-Received: by 2002:a05:6808:318e:b0:3c0:3e26:5259 with SMTP id cd14-20020a056808318e00b003c03e265259mr3613268oib.55.1707795470293;
        Mon, 12 Feb 2024 19:37:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1Rc/sB1dWFTQwmx8p2iRKVv5LgWrJCCSeKr8P6rkMbd1uH7JfQSG1Hh74JOY/jKeiuxbEy02WDs3e/g0A9q30Q69s839YsJVcUxX+VSSGNa6J9l4dlN7oNmWZViRGWfRPnJ4HGTtAfEOZMIknw36bZj+YL2HlkbpMT607pb4e7y6zq/Em6Inl3R1cLd8ht02GMlwLAyCC8dUbcCwwaoAhdKHd9WN0x4go0e/Cp4Rmx44os1Oj
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id v11-20020a056a00148b00b006e0334e3dd9sm6188633pfu.76.2024.02.12.19.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 19:37:49 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan O'Rear <sorear@fastmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	stable@vger.kernel.org
Subject: [PATCH -fixes v2 4/4] riscv: Save/restore envcfg CSR during CPU suspend
Date: Mon, 12 Feb 2024 19:37:35 -0800
Message-ID: <20240213033744.4069020-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213033744.4069020-1-samuel.holland@sifive.com>
References: <20240213033744.4069020-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_193751_548252_D7951B0D 
X-CRM114-Status: GOOD (  10.32  )
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

The value of the [ms]envcfg CSR is lost when entering a nonretentive
idle state, so the CSR must be rewritten when resuming the CPU.

Cc: <stable@vger.kernel.org> # v6.7+
Fixes: 43c16d51a19b ("RISC-V: Enable cbo.zero in usermode")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Check for privileged ISA v1.12 instead of the specific CSR
 - Use riscv_has_extension_likely() instead of new ALTERNATIVE()s

 arch/riscv/include/asm/suspend.h | 1 +
 arch/riscv/kernel/suspend.c      | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
index 02f87867389a..491296a335d0 100644
--- a/arch/riscv/include/asm/suspend.h
+++ b/arch/riscv/include/asm/suspend.h
@@ -14,6 +14,7 @@ struct suspend_context {
 	struct pt_regs regs;
 	/* Saved and restored by high-level functions */
 	unsigned long scratch;
+	unsigned long envcfg;
 	unsigned long tvec;
 	unsigned long ie;
 #ifdef CONFIG_MMU
diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index 239509367e42..be03615486ed 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -15,6 +15,8 @@
 void suspend_save_csrs(struct suspend_context *context)
 {
 	context->scratch = csr_read(CSR_SCRATCH);
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_Sx1p12))
+		context->envcfg = csr_read(CSR_ENVCFG);
 	context->tvec = csr_read(CSR_TVEC);
 	context->ie = csr_read(CSR_IE);
 
@@ -36,6 +38,8 @@ void suspend_save_csrs(struct suspend_context *context)
 void suspend_restore_csrs(struct suspend_context *context)
 {
 	csr_write(CSR_SCRATCH, context->scratch);
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_Sx1p12))
+		csr_write(CSR_ENVCFG, context->envcfg);
 	csr_write(CSR_TVEC, context->tvec);
 	csr_write(CSR_IE, context->ie);
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
