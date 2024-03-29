Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E578BCD1290
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 08:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MGrLbYeyTsDVHUf6w9NV8qjnmiaATleIewSNQponOso=; b=1gDTMa89LlAhWc
	IvDurQUTJlk6F9wuBLBjCjsD2Ey9oqR7j6wCiqunngH1T9/Bjml6VddLp566B3Fc1so2UCMnmF+sg
	bPBbpojTmoyMOdncFxRzndz5srX8RCEJa+OFIpA/L5xoC04/2DycBu2kPe9TPBwKcn5a8nGMYmdoI
	a3RazGyd9x0wIVjQQ6ytDiuT0v5Y89UoEhOzXsSRs+bOSq0A33/SOKjxgqnrtiGhI/BSMFICyhM8+
	UvaUUYf8i7qHZ8DFmG4Er8hNTrqgVUX4K1GizU4LzoVgBMmop7h7yH9XwVROKjmI1f1HBc9JrIimS
	EJsrygy1l4yJ6vshISoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq7gh-0000000HKe7-3qK6;
	Fri, 29 Mar 2024 08:34:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6bq-0000000H8jX-3c1V
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Mar 2024 07:25:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=dzRar7ztYXEnRyKAelp48saozJM51jVm9Dh1Zr4pH8s=; b=R/eR0jtQBoY3zYVgj5DGyHDaMX
	ZxPV8m1ajar3nUN5/tDvw3/sOH0wwJEWCPvZ6pkSyLfVKXt2ga99Wp050UBhi44C+gRPcXoR5StaY
	HWusR47UaLAYCcfK3d4iqTeXICO6vkLof6m3TaXcrqKR3E9EAB2UfsNCEdzpC0mU8HV7VTWDtOs6v
	RVXG+BoNuzq/F4rfvhujPwIJtEvCW+3DVN13R0POAQYzC4KqQMexc3YSoKF2YH+EcQLfHOLgMijBt
	vDKta9TV+UyLQfoapMQrzywHr5c2gqonE2FVuiBAeglaz1WCFv01n58I8m7vUh1Wb7sNbFvdhVIxW
	QtIAIyoQ==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6bm-00000001Qtc-1ctN
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 07:25:05 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5d8b70b39efso1400236a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 00:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697100; x=1712301900; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzRar7ztYXEnRyKAelp48saozJM51jVm9Dh1Zr4pH8s=;
        b=bFbCCw+WQAsOyWdheB8qUqnvmFLupY5g8i50F2cYMInmi0jHOx5mqLugbYPKBNWonV
         tyolszfRGASjEsSHlXVRB96p+8T5CxsJ8G9N2XlT0LeUNWZLfjpYLT16oufxQ/vg/Xag
         +lAv0MCW4CQnWuNo8CyjDKbbNZ/xxl1u/TqqqosSRGEtj2bEw9n5/vRaL21XWHxzi4ae
         4NhrIM0/6j307QvY84/c4+VgVaRjGys/sfSj0Kzyn4LIPrJol/FxXP3xd89+g2pMQlik
         6xNPS/SKSwE+iFKM5mHK1JvaOxkkp/AcQcXef9k5xBEGwsY26E+ceyHwOE8IvmcClLB6
         kzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697100; x=1712301900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dzRar7ztYXEnRyKAelp48saozJM51jVm9Dh1Zr4pH8s=;
        b=PEli7dIXMGWuTSn903Ol4CHJj5Tbre1xkavcmtVYjupbJNG3kSKW1KvGNRzG77BFxU
         Pqb2FCHXqUqcNu8MlANCKeCBeLZ2B45pZqRFVQux2/GJ1AzHRu/oiVH3d+LiBZdT1ndP
         A2WifZwDEgcF32nLI3Y1Otl4jeeSHb1Ge3JPNQP0aRvRx2iJ2vQg2R02Q5pwhH6x9Eqp
         g6Ljt2WLHEf8EfbKGNDNHwPbAc25Ytx4x28nGWUJruEdTUMQ7fO8498Qu/+mxugaFH+r
         8bkfEQLgOS2UzO5NKfqfmi0i9gQQZQHuIsDNBlcZwBlw3fyxJ9yHrxqfyynvWlPhy2zn
         st/A==
X-Forwarded-Encrypted: i=1; AJvYcCVTAOSW9c9GEqufSB3yiVQC9JgQFTFAb3/p41UJlC9fX0XhwH44NNLRfgKSB+zYpb7nGRmXJhPRJtjYpnjS8OVDV425Q/bqdprBrcuOsavP
X-Gm-Message-State: AOJu0YwMVWuhvZmVOpsj+Ao2z+Hk5PG2bELOHPFOtkH58GmpqP2RSbsS
	uWwKzDhns7EPEd4INaIpjmi0eV2EsUEO1vqEirFJqW/bN2tr3mkKTl4Mf/aUMqE=
X-Google-Smtp-Source: AGHT+IEs8kBZu3dBChnRywCF22OnC9/Ej+znSx9gblpEFd+wsOZOeprciOlW3fwk28PpRrFgoWrM2Q==
X-Received: by 2002:a17:90a:d3c3:b0:29e:975:3500 with SMTP id d3-20020a17090ad3c300b0029e09753500mr1446912pjw.28.1711697100232;
        Fri, 29 Mar 2024 00:25:00 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:24:59 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>,
	loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v4 09/15] x86/fpu: Fix asm/fpu/types.h include guard
Date: Fri, 29 Mar 2024 00:18:24 -0700
Message-ID: <20240329072441.591471-10-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329072441.591471-1-samuel.holland@sifive.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_072502_556019_A6A74A35 
X-CRM114-Status: GOOD (  11.53  )
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

The include guard should match the filename, or it will conflict with
the newly-added asm/fpu.h.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v4:
 - New patch for v4

 arch/x86/include/asm/fpu/types.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/fpu/types.h b/arch/x86/include/asm/fpu/types.h
index ace9aa3b78a3..eb17f31b06d2 100644
--- a/arch/x86/include/asm/fpu/types.h
+++ b/arch/x86/include/asm/fpu/types.h
@@ -2,8 +2,8 @@
 /*
  * FPU data structures:
  */
-#ifndef _ASM_X86_FPU_H
-#define _ASM_X86_FPU_H
+#ifndef _ASM_X86_FPU_TYPES_H
+#define _ASM_X86_FPU_TYPES_H
 
 #include <asm/page_types.h>
 
@@ -596,4 +596,4 @@ struct fpu_state_config {
 /* FPU state configuration information */
 extern struct fpu_state_config fpu_kernel_cfg, fpu_user_cfg;
 
-#endif /* _ASM_X86_FPU_H */
+#endif /* _ASM_X86_FPU_TYPES_H */
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
