Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAD0C71148
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 11:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eipI2HY51zs8Wct1yCT3RiSatqL0qe7gW3FkQb2hlfM=; b=irOzZQdEB3hgAK
	5nzs4tURugk4jiWPQDn8P9OqSK7+RUuyh08Ea3qopsVkQ/cdW2Mhct4fghAM3bSLj/lZUV4fOJl15
	Y0+3GvP+bqNRWgwMVsbzFI+iLL5WU+Rk++Vrv7xTdQbOTZqA6EdArWFuTuDWfVRrbNqSHlipM4dxA
	JaTb66oi7Wx+VzJuvtX1kYAFF3IRcdKYlS5oesNgfooZltD9wflwcypGCKKvvdejfZQm+x5qft+hs
	jc3BNX6PKsZJSWJ/dCFHOt1cE+VJ2QZdC/SQspDz0X7V6+xlTUsV/rUdy9d6aNqiSwTsLQV/nXfx3
	d45e80h7CsP1vpCLIdAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2cD-0000000GAV4-1WRq;
	Fri, 13 Jun 2025 11:30:33 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyMl-0000000FXRg-02BD
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 06:58:20 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b2fb8226e1cso2843107a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 23:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749797898; x=1750402698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPp46eZSp7JL4MdOWPUs+dW6gfTxSrmGdnYXz+FMAYQ=;
        b=Fg7F88hlgQTX7480gcqGKFB0cwzcul6ElaZuwEaJpPjHY43ssGtkV92RVManonQpDl
         A7on6F/lAcK3+7Aky592hljyNVH8CPP8UB4IsCnK5Pl0xEC+PYWr60Z3IHYomiUJZblC
         qiI+8+MBupv9xqAE/f5kmFXTovGjTQSj1oB2POS7OMgjtJp4P35Ft7QjqaXVyXMl+nVw
         eh2rTT9gzCvhrl4Qp69HF0onO4cqgzvOy89Y1H/CEcYfkIPTLlvqHYAEBCShQHf00ivw
         1ebnwR+J9qYEkp0f38KbmalauTSuWaLUzqksFWhvJ+8qKYplTCUSM9Pq0fUnzADH99Sk
         kb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749797898; x=1750402698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vPp46eZSp7JL4MdOWPUs+dW6gfTxSrmGdnYXz+FMAYQ=;
        b=YQDVmx7BXB3aL4h+x+cdCkwjZxIpYyl7O6ybndG7KCOpAV+fo2SDsr4Ok3HmjsFjRC
         rB9nJsdlyCym4HHwUTotLK07QVNQi2SjdrCRmYdFymlJxXD33VlNoDz2eHMrLUKKCsII
         mCus69KXwhSgECqsZ9L9tiPc+Sb2BfJ70Dh/SHoGhlTezkF8oG+jhHfLCEgz3gv3Svqx
         wDscgFPzk7C72VbO8coLP2I0cX9geCCfvWGvGKJLe+sAytFNQ/tYW+psjypjbiO523IK
         VYetNOLbi6e7k7iPMrS8LywTJeYvYooqx3YYH/82ZYnQXAP+i112o+eUMf4p4qBGxVjQ
         OCrg==
X-Forwarded-Encrypted: i=1; AJvYcCVrER6l6+Rv2JInzgMwY8nRZYcnBZi/micG2kw8s5YgkhKVtOkwASb3UKV69n3FcRN/cd+gAlALlLYwrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxHkVHWg2oRus+Wqi0nPPv+WRX2xPkI0k9aGf5xzUU2LutYppY
	Yhktt1Oy9dtp9CKAHF2Mr78Oa5qkFMXNJY+FiQlg4VU4tTQClbAgWkB9zgdfey1g2sE=
X-Gm-Gg: ASbGncupJahgMj9F6Ii/qchwNs67veWjjhEvgL18abO6U9tUYMOpNlvovQT9hsldjNI
	ijEWd9wfGGXz0WJuDg0LjNaFB3JpId59C7XVZ70zDgSqFTmqI9oiQD67ghc/mPuoM1MgsJHRGYC
	TaH92KC7Ws1JDL6lbq/Hj4wujEKqzhmnrnUmW+BweXHdSkuj3oKFExNNUq7SIkzJ6pB0MQ8D2GQ
	zR44UDnapfsp96yjvBaTE2YmwY4kbPuLUHGJ6XqyIBY0+GMrNKYj0dv5xtTAlf00FasPgaP2yxz
	WLpMAEp3Rj825frKE98VDiGIEVarI1Bj8UsXF4m1rcQnxH6GpGc4NFgiLYMcIvFNkl9MINT6JJp
	AQFhDbuzMGyHWl//6BdM=
X-Google-Smtp-Source: AGHT+IHlesOh77cakTH2YhHv43j8zOza0rZEzGZ+37qo1i6wlvyL7TrOfPOjUkpSesJgnyG08PjCmA==
X-Received: by 2002:a17:90b:1256:b0:311:abba:53b6 with SMTP id 98e67ed59e1d1-313dc25631cmr1682026a91.14.1749797897914;
        Thu, 12 Jun 2025 23:58:17 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49b7fsm2653022a91.24.2025.06.12.23.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 23:58:17 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 05/12] RISC-V: KVM: Don't flush TLB when PTE is unchanged
Date: Fri, 13 Jun 2025 12:27:36 +0530
Message-ID: <20250613065743.737102-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613065743.737102-1-apatel@ventanamicro.com>
References: <20250613065743.737102-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_235819_046128_BEA68056 
X-CRM114-Status: GOOD (  11.37  )
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

The gstage_set_pte() and gstage_op_pte() should flush TLB only when
a leaf PTE changes so that unnecessary TLB flushes can be avoided.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/mmu.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 1087ea74567b..29f1bd853a66 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -167,9 +167,11 @@ static int gstage_set_pte(struct kvm *kvm, u32 level,
 		ptep = &next_ptep[gstage_pte_index(addr, current_level)];
 	}
 
-	set_pte(ptep, *new_pte);
-	if (gstage_pte_leaf(ptep))
-		gstage_remote_tlb_flush(kvm, current_level, addr);
+	if (pte_val(*ptep) != pte_val(*new_pte)) {
+		set_pte(ptep, *new_pte);
+		if (gstage_pte_leaf(ptep))
+			gstage_remote_tlb_flush(kvm, current_level, addr);
+	}
 
 	return 0;
 }
@@ -229,7 +231,7 @@ static void gstage_op_pte(struct kvm *kvm, gpa_t addr,
 			  pte_t *ptep, u32 ptep_level, enum gstage_op op)
 {
 	int i, ret;
-	pte_t *next_ptep;
+	pte_t old_pte, *next_ptep;
 	u32 next_ptep_level;
 	unsigned long next_page_size, page_size;
 
@@ -258,11 +260,13 @@ static void gstage_op_pte(struct kvm *kvm, gpa_t addr,
 		if (op == GSTAGE_OP_CLEAR)
 			put_page(virt_to_page(next_ptep));
 	} else {
+		old_pte = *ptep;
 		if (op == GSTAGE_OP_CLEAR)
 			set_pte(ptep, __pte(0));
 		else if (op == GSTAGE_OP_WP)
 			set_pte(ptep, __pte(pte_val(ptep_get(ptep)) & ~_PAGE_WRITE));
-		gstage_remote_tlb_flush(kvm, ptep_level, addr);
+		if (pte_val(*ptep) != pte_val(old_pte))
+			gstage_remote_tlb_flush(kvm, ptep_level, addr);
 	}
 }
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
