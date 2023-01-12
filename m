Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6CEC54EBD
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 14:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SjCN/Ply8bmJrsQCeVAlqZYI4/zNM/8aO9MxbbFjPrc=; b=STv0ALAPBiabno
	IQh3um1Z4KF5d7X4VHb1Oqb2R+b+UMqPHdOJkW3f1yJ/GFgoog9COVge3UNWLIrG450Wccz1QcUoN
	TajO2PDZ+hVU1FKNzLoI1pyG6RJ4eZQ3M+mVJcDBMMADwIA3CDHyP0aLl17jU5Us2U/zt7y80FN5K
	nVN05A12irlqtRz/AomvuOiL0vF9SofVno603b/yNJkRLIi84Mei6UvcARHEUmZpF0H/pVqvnKUxX
	bT+ryTf/I+eFLUQrJYMOePxRn2e3nFnjiV1XC4+ce3trO84D2zV1a5A3gDLacyvaGEME0NTMz/23P
	BihRd+2OqA9EM68JbeiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFyBT-00FHiO-3g; Thu, 12 Jan 2023 14:03:59 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFyB8-00FHaC-LT
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 14:03:40 +0000
Received: by mail-pl1-x631.google.com with SMTP id v23so15404326plo.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jan 2023 06:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjWQ9F0LaanvIi9SVaFlkrqw0WGzFdxUF931tj4YTWo=;
        b=T+9X/H4J/G3JlwF9psZ/cWzPV07niIG+bOZMhVU214/rAQWZSLhMuBw5PuaNrOyaiV
         oqNriOfX2cRc1DkYlgZq4HYRQbTaH5XagEPPtJ3krBvxRJEhA3JCjlUbuB7DUnDXQUuI
         7MyPPjJ/vUwaVOW+hGCKlfcUqEFjFT5g2Dly6RCyg51Sgpc+d2G/Xa4t6nP/Aqtd7J98
         Xt5v20IOdlplskt/PUCFRCi4wP2INn335nSmKdFV8gLZ5tJMMFu4xdEUnaVpHAzhcSo4
         ZThl76vGl/Um6/ilm2ElYvHQOegLNry4OHmaaLOO5h6UcJgxFxVS7+wyL8gGR+kuUSCl
         Y7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wjWQ9F0LaanvIi9SVaFlkrqw0WGzFdxUF931tj4YTWo=;
        b=pMYFTk2ZfB9CuxywwqIOn8k8RwdX6giPV6zI++oem0ykrD+f2jEt3JnBAnjDBIRzdN
         9e3VbvTwrtnme9Ar4tKnJK3qtgcpmJPGZ2Zqt8Mzo9kzeGSoO45CVIwYuwbi26qTmsV2
         4FzlINQHfAxQ2Tiwep+A7szVA3lCadxmdDzsNp9uj+Z/ExH+2/7YQrX8mCCPzbM1hxqU
         8JLUAlGAne9x90GzPTTfMnLw25GWN8RODYounKaADNobogU2q60P4j/PtnGge/lEkWeF
         L+bVWD2sspB1jryLc2OSK/rXytTbv3kIxzxOtnj03nOV2cxxEKgWyznnSH1hhO2TURCf
         GxxA==
X-Gm-Message-State: AFqh2kq29QcOWmhnMdXr+pIvs4n9RWxnfo1lKOHlvASAzMXos0BlDhR0
	ryRJB73PNyWQ5KH6NTZ5eKswHX7QlVm8Dk0A
X-Google-Smtp-Source: AMrXdXscgqqsMnhBi0KMkEXRBk0fS7yh3irzNgU/w6MnzE3yQhSAfPlAdtp/WbKEGvyg5x1cv+sNYg==
X-Received: by 2002:a17:902:ba12:b0:194:4016:11ac with SMTP id j18-20020a170902ba1200b00194401611acmr10522106pls.30.1673532213046;
        Thu, 12 Jan 2023 06:03:33 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902cecb00b001925016e34bsm12351455plg.79.2023.01.12.06.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 06:03:32 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/7] RISC-V: Detect AIA CSRs from ISA string
Date: Thu, 12 Jan 2023 19:32:59 +0530
Message-Id: <20230112140304.1830648-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112140304.1830648-1-apatel@ventanamicro.com>
References: <20230112140304.1830648-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_060338_746642_3995D165 
X-CRM114-Status: UNSURE (   8.89  )
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

We have two extension names for AIA ISA support: Smaia (M-mode AIA CSRs)
and Ssaia (S-mode AIA CSRs).

We extend the ISA string parsing to detect Smaia and Ssaia extensions.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/hwcap.h | 8 ++++++++
 arch/riscv/kernel/cpu.c        | 2 ++
 arch/riscv/kernel/cpufeature.c | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 86328e3acb02..c649e85ed7bb 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -59,10 +59,18 @@ enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_ZIHINTPAUSE,
 	RISCV_ISA_EXT_SSTC,
 	RISCV_ISA_EXT_SVINVAL,
+	RISCV_ISA_EXT_SSAIA,
+	RISCV_ISA_EXT_SMAIA,
 	RISCV_ISA_EXT_ID_MAX
 };
 static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
 
+#ifdef CONFIG_RISCV_M_MODE
+#define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
+#else
+#define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
+#endif
+
 /*
  * This enum represents the logical ID for each RISC-V ISA extension static
  * keys. We can use static key to optimize code path if some ISA extensions
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 1b9a5a66e55a..a215ec929160 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -162,6 +162,8 @@ arch_initcall(riscv_cpuinfo_init);
  *    extensions by an underscore.
  */
 static struct riscv_isa_ext_data isa_ext_arr[] = {
+	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 93e45560af30..3c5b51f519d5 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -228,6 +228,8 @@ void __init riscv_fill_hwcap(void)
 				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
 				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
 				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
+				SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
+				SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
 			}
 #undef SET_ISA_EXT_MAP
 		}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
