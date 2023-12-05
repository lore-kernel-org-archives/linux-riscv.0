Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADF0C46CA3
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 02:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dn0vP44Kk7NJCmQs7L/W8KXmgO6yCLpHwB+ctnaQIHM=; b=kQrTBG2BtM31ii
	ADjN6doGMwI8mQblVnV6/WVufs2lLr1nTQygwKiRTvXbb6jOsTmCup/X3MEe49Ug8V2q8+gq2CkuG
	LXGL1pTFPzpEQrm/99CG3i2MQIyQ416mxReqOJsqPFBA+aM8KvifSY5X8fEuI7xGaHcl99ElkRYAW
	7fvY0jh63XttMoPGRjmPWjFOSp2CpWsRtlVIEELz6h5P5RrQEjDlb5VNn6Fv6shvrLhojKnbUHlXW
	qPWQmNprB6x4aqKBOE/TDHW4HNx4LHLekjdIBwQinYpT4G7xKURIogb7MHrj5wu3umLQYHpfhyU1P
	UJsYSWAJLWoWPvLKcTuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rALPP-0063w8-10;
	Tue, 05 Dec 2023 02:43:39 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rALPL-0063sH-0D
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 02:43:36 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-58d521f12ebso3534022eaf.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 18:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701744211; x=1702349011; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+doFZUOdGHfe3e+JV/h+u6c2KRCECetYvlqoS/1QVjk=;
        b=mnQUwYB0boex+KuIUwIjdsNA2roygNiOgBql04KZm4F5w2kg/jiEhVPNaxSitxSMkT
         Y7w3CynwQ3MNGVJ9KZNUayCe5DqZmguUx7kxID8WDuWAYsUWzNwYElR4GxSIzAKsQ8Qh
         vh6DQRyQ76KxpFas77QQrEn5xXoZgidbUQxNZzmC5wbU+GKBfjIjSApxWO/+mcxvpJe7
         BXfqzDu4QfXm5Ru1LacZwq8DPDx5PP8cfZvHCk3tXuKHp1fkImM20mzJbwz86mZnKe4M
         lMScUoD9vVJqNRz28xAvnpdA1NtHQG5iU/27yZn7QFec1obfg0gCKiGYppzL/uRrnWh3
         ZGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701744211; x=1702349011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+doFZUOdGHfe3e+JV/h+u6c2KRCECetYvlqoS/1QVjk=;
        b=QCakQhKSvl3wYETvXl6aWmrXJbtAOwW7+2bCUlF8MazQODGTUQcvENHMQOtFoAwXTb
         yK6/pE63KBKA55XjpEd36ba0M2f0/xmzREkhnIPeYlk2Fu+lqLj7JmsE5hF2meUmIQEq
         Uqprg/Y3W0ZLcPsT2WunecL1DuGw2vygGQTIGihE2t1s0bOeZuHCnbH8nCP7oYYIKlf0
         r5Oyc9awCUML75TlwCr/KHgcX/Ty5Z/2J9XohvjNd1clmr9UtksgYP8dkfDqKBSRD/3H
         dLcLqWIc8+lSUi6lWYnkU4+AJg3c3Nvqfpg6b8j9d1GZQ87HjWZK9XopM0tHQ+npPJps
         IEGg==
X-Gm-Message-State: AOJu0YybFFCZ3oG5vNFDvnJvp9v/altmUiVxio30wWZ/7v089LcXEotx
	SZy6EaRM8rd5FFm1baDyXsp2Og==
X-Google-Smtp-Source: AGHT+IESa+uIMlhGJ8omMCACn4oXC680NqScC0tWffrPykeRZIe5TFUQYcAdM2FafioZUI/dBXwO1w==
X-Received: by 2002:a05:6820:2a09:b0:58e:1c48:1ee0 with SMTP id dr9-20020a0568202a0900b0058e1c481ee0mr3283907oob.18.1701744211227;
        Mon, 04 Dec 2023 18:43:31 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z17-20020a9d62d1000000b006b9848f8aa7sm2157655otk.45.2023.12.04.18.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 18:43:30 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC 1/9] RISC-V: Fix the typo in Scountovf CSR name
Date: Mon,  4 Dec 2023 18:43:02 -0800
Message-Id: <20231205024310.1593100-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205024310.1593100-1-atishp@rivosinc.com>
References: <20231205024310.1593100-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_184335_323200_99BA2342 
X-CRM114-Status: GOOD (  10.47  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The counter overflow CSR name is "scountovf" not "sscountovf".

Fix the csr name.

Fixes: 4905ec2fb7e6 ("RISC-V: Add sscofpmf extension support")

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h         | 2 +-
 arch/riscv/include/asm/errata_list.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 306a19a5509c..88cdc8a3e654 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -281,7 +281,7 @@
 #define CSR_HPMCOUNTER30H	0xc9e
 #define CSR_HPMCOUNTER31H	0xc9f
 
-#define CSR_SSCOUNTOVF		0xda0
+#define CSR_SCOUNTOVF		0xda0
 
 #define CSR_SSTATUS		0x100
 #define CSR_SIE			0x104
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 83ed25e43553..7026fba12eeb 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -152,7 +152,7 @@ asm volatile(ALTERNATIVE_2(						\
 
 #define ALT_SBI_PMU_OVERFLOW(__ovl)					\
 asm volatile(ALTERNATIVE(						\
-	"csrr %0, " __stringify(CSR_SSCOUNTOVF),			\
+	"csrr %0, " __stringify(CSR_SCOUNTOVF),				\
 	"csrr %0, " __stringify(THEAD_C9XX_CSR_SCOUNTEROF),		\
 		THEAD_VENDOR_ID, ERRATA_THEAD_PMU,			\
 		CONFIG_ERRATA_THEAD_PMU)				\
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
