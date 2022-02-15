Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26EBC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 09:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zLing6t1Y47eVR27+xPvMrghiNB9+C/a1a0/W2YbVek=; b=YiPHr+nlivbdI4
	PfAQOumt/bi+w96BrYk8UlzrB0IxR+hmMUA/fgEeHTVK9HT9T2q42wE8fFeF6NlSq9RQ/1iDkwASR
	uKxSTzrB8ml2LpTFhZRTDsVKgMLsqVyUjO129K4a3wTuZPneEPOxZlpzxs/8uiAkG0BudRX31EkMo
	CLDgQGlVwfYvpBawWVlH+JrN0lusPxlh93sUzW/jKFTzk5VHNnW2WWAV/VCT7H5IP1ExjTM3lUUDv
	3K7l12nQibcbo2exEyrjxn5bxIxhPw4NknDBrQFO5sR7z6ne/ZA7AdlhmFsYCS7jWpNRT9gHpFxfB
	ZQA61cNVxwOekdVK7hCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJtjb-001srU-9z; Tue, 15 Feb 2022 09:02:55 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJtjN-001shp-Kz
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 09:02:48 +0000
Received: by mail-qt1-x836.google.com with SMTP id o3so17932674qtm.12
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 01:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hRHHCDwWs7pktn1e2TaButK3zinNjCuetMty1a6rgb4=;
 b=7B7t6he5vZWDqwC+Ob5M+euG08lerFIoCfMiLtDOqQ2llS4N7CH8tfcYn/KoBtv7rq
 E1nyUU1YJk68c1oAremArUd9AH0uqeCR7dp/29ak2YIBJl/QSXe/xtBn0NqyPDdZ9k7W
 45JdN4FAhBHtOAIqm7j/s97C8948+pHvC6Djz+YAgPYpzuA+y/VkpthppYNN14E/tlCk
 Y93QFQJ/1US9wHDPQTDcZamZDqz+RlDCVmbwMbBgZrkHdTixO1BEOCclLFc5u6tbMV1A
 1spsxllWmT7bU5arlXiRYWvH1e3qQWiSXrHqmhXBYOHHlwJB9+b4at8Z3bijZwd7w/L4
 5vPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hRHHCDwWs7pktn1e2TaButK3zinNjCuetMty1a6rgb4=;
 b=XPRQ/CUYGlzn1P516V7eDyWy5a9ciDMDV0VkfF/0pVqDBL55KSWDGy5t2bpn9hINDh
 ciqVgY50tt/p4tKyY9ERcYxhM3R54BVe2PkUBnSmaNmffknZb/IuBMBtM07EqBqKCmbF
 wp5SIvzLzm/wWp8gIwfLksRDl9d0ux7oVe312KCtIoPD4cRKG1ULe33WiUhni8zb6/mB
 S4B4+nzZdP4582rjEzFfjHNqQKAn/pz5uN8ri92T2PA1im8fC9WpZ6I2Gyn0SAwzF1/M
 KU741vccRvYZkqx4W7CwG3NJLEOj88G/wimxwH5dBEYlv6hkkE9VIbSVbhN+Wm4pZgtB
 pLLA==
X-Gm-Message-State: AOAM530yBeCr8VflOhHvKwY4QSyyEEeGY+kl2Ce8PMIo3CV9AWbTCtQJ
 VyJp9eFdUYmMCNl6QUuPXSXbJg==
X-Google-Smtp-Source: ABdhPJx5N9RQt5omXNMZk0pqvVK8FnSoi+atkRQddYY2Oh8yjRKofmbcY6IK0gC4u9lfv6gg2X9Y0w==
X-Received: by 2002:a05:622a:1ba6:: with SMTP id
 bp38mr1972295qtb.259.1644915760250; 
 Tue, 15 Feb 2022 01:02:40 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id w4sm17711158qko.123.2022.02.15.01.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:02:39 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 5/6] RISC-V: Do no continue isa string parsing without
 correct XLEN
Date: Tue, 15 Feb 2022 01:02:10 -0800
Message-Id: <20220215090211.911366-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220215090211.911366-1-atishp@rivosinc.com>
References: <20220215090211.911366-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_010241_719778_FA6FEBED 
X-CRM114-Status: GOOD (  10.84  )
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

The isa string should begin with either rv64 or rv32. Otherwise, it is
an incorrect isa string. Currently, the string parsing continues even if
it doesnot begin with current XLEN.

Fix this by checking if it found "rv64" or "rv32" in the beginning.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/cpufeature.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index af9a57ad3d4e..0c818035ec92 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -84,6 +84,7 @@ void __init riscv_fill_hwcap(void)
 	for_each_of_cpu_node(node) {
 		unsigned long this_hwcap = 0;
 		uint64_t this_isa = 0;
+		const char *temp;
 
 		if (riscv_of_processor_hartid(node) < 0)
 			continue;
@@ -93,6 +94,7 @@ void __init riscv_fill_hwcap(void)
 			continue;
 		}
 
+		temp = isa;
 #if IS_ENABLED(CONFIG_32BIT)
 		if (!strncmp(isa, "rv32", 4))
 			isa += 4;
@@ -100,6 +102,9 @@ void __init riscv_fill_hwcap(void)
 		if (!strncmp(isa, "rv64", 4))
 			isa += 4;
 #endif
+		/* The riscv,isa DT property must start with rv64 or rv32 */
+		if (temp == isa)
+			continue;
 		for (; *isa; ++isa) {
 			const char *ext = isa++;
 			const char *ext_end = isa;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
