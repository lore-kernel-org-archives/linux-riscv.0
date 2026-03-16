Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D41D58B21
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 06:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lRaQhv+OkRLdOk0fP+FI6MEpGHYK8o+GoSae6Dgy/as=; b=bhzO8lVGd/g30Q
	OxLiadhRwyzSwshZ68wZDo3HGLCo38SjzCND+/HOQ43065WPJtG0gtHF0VBChYc9u3TM3OBPo9NY+
	p6eTBFKwaH7JL9JXPxhRo2xKncf6goL5JLHO5qCZtu4AArkessAo9GSLESRVOVuIT4/H1JrV5/cG9
	nNUvM3xFm6KnWZlInc5p/yM7mUZZ+wGFtRyfHbaIoxHVwo62lFbf1jsPnpmeOqIArG2ZlbAvi4SmN
	iiXrDcDeNHVfcscdK+j/aFDYk2nIKgQa7ktrFee3D+HxIkzXXvo+q/hNjsvZTNeBGMaz2cl7YSOgd
	Q5DBZ2cgM/xnWsCXXuZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w215Q-00000003NtE-3dsz;
	Mon, 16 Mar 2026 06:05:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w215M-00000003Nrq-3G9Z
	for linux-riscv@bombadil.infradead.org;
	Mon, 16 Mar 2026 06:05:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SDQYRHz1Z1t4tWIcfE0Fv7aJ0eRwhG3fEsKD60MRqLg=; b=QaeviDEsFmEjumzabKKsgziSeC
	NETPyMgsZx51pVtxeuReGnABLXHO95o0wDtvvrs9g1fZL8CSAlmLdvHxYWH9WHYgeYg0axCG0YzgT
	WwGzHTFOY4p3qrQe8iw311K/EAFmeBfl/vtHM0Hvoe1ORObnMxYDL5dZmI+/FqCzUiEuF06tVE1Nw
	RWfUwiZ4KNh9I2sgqU6+tqSYzfWbl9QL4zBdQTdVzEE6fNeUNbyW4dI3yLw49KH98KwJJt7DxXNZH
	Wvi1DYnv+/+WBCAh/vlklWd62sWSAkgQz8sOUHJNd8W+U+lR1lGTXmi7A42AZobqFOOABb3fmBt3g
	6qVCAxww==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w215J-000000065wB-2Tox
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 06:05:51 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-82990763921so3949576b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 15 Mar 2026 23:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773641146; x=1774245946; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDQYRHz1Z1t4tWIcfE0Fv7aJ0eRwhG3fEsKD60MRqLg=;
        b=ImpLaGdLDyDbpKMaWHUJEV6lmOwmcLFVYv207VBz76GpxHA7c96Q354kv9ODIMn14p
         rjiicFLXa5TI1srDHIxipGqyqFek+Da+0izQPZ6DgVT85nnWeURB+PST93qp8rfs5ghs
         KkcvYoYdEi8Tpf10k88TJJe6CouKLex/ToOwxyJmB+6DCiho1lFpj56Z0q/ExOxtax3i
         FNELyAc8GS6/kBvaiMCMGhFS3EWZlbZU4tx+7fB+Ol0m/2dvGgdwlhXsqswhomTEBOL4
         /lFAJROTQaFabbgYrbktEfA4akVA1bC3Xrz1iVFaCdlaiyKVNryK1fdXDfwIEfhK9QKJ
         pEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773641146; x=1774245946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SDQYRHz1Z1t4tWIcfE0Fv7aJ0eRwhG3fEsKD60MRqLg=;
        b=A7kIOnE81wN8tYLQ9bNKtHZqHbOHkWhUnxNuOCE/+23Vq+zhcFvhTTGnAcgppjRWD9
         nhw3gzRdl9w1v6Ym+nHxlghbUphQRbEurT5aDI0y+AtYmLzJ/9QKW6ES99bwUzOEiozh
         0epD4Q9G/K4+VToy6qGr8nABgrjMgAfgCbS0VVP5WUxv/P+n4pTmrKTMwTov9kz7JCW2
         3oyvW5Yn+KFEJ2STlth/yF/VIrRuJdIBKWADgehyIoeiI6KqjFU3f6uw+0goz1RiXzfw
         IdIijSf+Pqr1reu6s5FUpzH/hv/sjfuvqHL/QaF3h7BCPGef7ll3FYQjF2jJXIO5R3Cx
         zRXg==
X-Gm-Message-State: AOJu0YxyuEXrW6h4wtlAZzSQzJmqdo0ScRyvT5FQbzTRsEFtS+fYX/Y2
	3uvG9fE1x994lwRbYCwqQtTr7kUvSUMSDf1Dc2tNvjZLQfUkilf0unIwYhy/6Q==
X-Gm-Gg: ATEYQzw+oOLfFepcVwqpKPvQccw+pHG5Jv/zWA6YTTSqDj/NA/UvcM45A9Dg2Lc95/D
	LzZXfOixGZI1oAgOTim9gGOmFQ/XgP/y+wPdIrtuxs7mj/Ywm89SMNM7o5DoqUDwZ8v5fVL6mkX
	nCbiVZ0TvY00xjxYO5aERNOSkOo6UWz1ruvDTP5ca3V6RVDFKP6842uuxPWFgzyVcRRd1xA7nKE
	Kgit9gJT/OwhWPwIivSkfedTK32y5WucIX1xe9VSAHLtg73fWzAnv5wfYkBFXY53A2ahdhevgVW
	empeRLzj8T5X9hasHy+ZA+Hk554C2hk132dZ5UN4YYupivGklmbuy//I1iEPXpYzBbNCxCUs3Tm
	u2cSYphhSSH8b+9uQCQBN3bWY58uAsQXwCoGzfHs1nh3ZCN7d3RC8FV0ZWAqsc5Nz3q1FOtxFlP
	zxLTWLeK9OHmxNFonqHcaCp8WS
X-Received: by 2002:a05:6a00:a90:b0:824:a5f4:fc3c with SMTP id d2e1a72fcca58-82a19842906mr11729345b3a.19.1773641146216;
        Sun, 15 Mar 2026 23:05:46 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07393098sm12525226b3a.62.2026.03.15.23.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 23:05:44 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: linux-riscv@lists.infradead.org,
	samuel.holland@sifive.com,
	david@redhat.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	gaohan@iscas.ac.cn,
	me@ziyao.cc
Cc: lizhi2@eswincomputing.com,
	hal.feng@starfivetech.com,
	marcel@ziswiler.com,
	conor@kernel.org,
	kernel@esmil.dk,
	devicetree@vger.kernel.org
Subject: [RFC PATCH v2 2/3] riscv: errata: sifive: support auipc/load pair in patched alternatives
Date: Sun, 15 Mar 2026 23:03:27 -0700
Message-Id: <20260316060328.1173634-3-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260316060328.1173634-1-ganboing@gmail.com>
References: <20260316060328.1173634-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_060549_885548_E5F481E4 
X-CRM114-Status: UNSURE (   9.90  )
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

Enhance the errata/sifive patching function to support auipc/load
insn pair by fixing the offsets in immediate, just like in function
`riscv_cpufeature_patch_func`. Refer to commit 27c653c06505
("RISC-V: fix auipc-jalr addresses in patched alternatives")

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 arch/riscv/errata/sifive/errata.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
index d0c61f86cba33..f26c997e04e59 100644
--- a/arch/riscv/errata/sifive/errata.c
+++ b/arch/riscv/errata/sifive/errata.c
@@ -80,6 +80,7 @@ void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 			      unsigned int stage)
 {
 	struct alt_entry *alt;
+	void *oldptr, *altptr;
 	u32 cpu_req_errata;
 	u32 tmp;
 
@@ -100,9 +101,12 @@ void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 
 		tmp = (1U << alt->patch_id);
 		if (cpu_req_errata & tmp) {
+			oldptr = ALT_OLD_PTR(alt);
+			altptr = ALT_ALT_PTR(alt);
+
 			mutex_lock(&text_mutex);
-			patch_text_nosync(ALT_OLD_PTR(alt), ALT_ALT_PTR(alt),
-					  alt->alt_len);
+			patch_text_nosync(oldptr, altptr, alt->alt_len);
+			riscv_alternative_fix_offsets(oldptr, alt->alt_len, oldptr - altptr);
 			mutex_unlock(&text_mutex);
 		}
 	}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
