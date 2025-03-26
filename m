Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F583C3600E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 22:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cA5EY02ZJ/HRjjzupb+TFGwOGehVl/QmUECHGx9zjXA=; b=Hn+4EThlkqMkBV
	hFejkQNwsvSUWbEjYCKFSrQqoBj/hNcpkCqmc2vQudLNkNUMgHafbJsg5Y4K94sCW4sArjiE6+Q/x
	6JQBatfZdQyA3qSf3g2T45zBSJWkGABNlTEgePzAz/BbmBvFTjCLFzwWn4l7Q9R41rtuYXH/fLefq
	tLm0tPOfA7jcRdou/ZkctUDLUaeOzvxtEL93ye6XrGTY5HxpvL29Iu4tOFEaz5FylTa4l/2jUMhku
	5/HpWe2mXQooEz0tIzafB2mBiCM+j9LhfEA8kZjEhgBoUYEfH97J0PUUEhgpcc5JfU82VQF9zwv/H
	n7h4/ssvLAOAxCTbdTTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txZXL-00000009joU-38St;
	Wed, 26 Mar 2025 22:47:51 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txZXI-00000009jnb-3PiA
	for linux-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 22:47:50 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22409077c06so12360965ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Mar 2025 15:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743029267; x=1743634067; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=/47LrO6Yao7UgjWnrRSDMpaACnlr6GheiCqpc5IW9sE=;
        b=zsHVaZvwx4zIZ/CYDAidCZEB9PFZyA6KfWhEt50XZewQnpZVmdtxbedlwXQ1he90YK
         uB9qGCvf0JATrb+wSR+FynuI4LSFDvOFAyPtz4IV+nRAfnd724tJsXuUZjBpVCIKBuo6
         R3iwO42nMWEdI+tg0ONTUvA7nEWEGvs1HtHLNuXrGAWOj3JGFGx9knQsCqEykmWR+UPe
         /ZiOgcLOPNSQeoGh8oBxIuPclqihe7JCNfZ6juVtXrQolFbEEHsD5BnDHoeu/9kcweFB
         wprgxN1grUmm44Xc/q6UJ1qR1GWHU6LoQbPlyTzJDgffhZUpUhk980ZeOEdcV2IqsUbY
         NWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743029267; x=1743634067;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/47LrO6Yao7UgjWnrRSDMpaACnlr6GheiCqpc5IW9sE=;
        b=k3wkYshXtPGjfyjBZTzAW4SNxVH9tYjKSp4GjmK9sqY9iEtBrJxACuyx+W8Ir9k9tu
         I2LcCF/n+IHeEVbBnbwhSJWrlf/tooG6J4VdzfYJz0uE4R9WR5iXIPpG90GN9O0xaSbY
         MF6q1nTKMZg1MDbh3H62dxqFpkLMYYSfDXuPMVyS0Ca+HzCXf2WsNcYHkKd+eR1wCdts
         glQTer7ET618zjA4LhCZ16WkUeVX4gP84xnScUCFB+wUGQahvqnfUNVgZoWNDYSoFRbf
         9WN4UNMcDoycYGSe4OV/9dMokrBdy/Go2ZBwbeBd/eNIia/WiVAA8IxrIh7DBAM3Ok3n
         lHXA==
X-Forwarded-Encrypted: i=1; AJvYcCWRx25ePtKjJ7G8zSKsEpVv3oI/DS2LR8zrmSS37Evp1RvqpMwBFLxXRmX37vjR8oUsH6wXmiYHokkTDA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8nxHsU8QN2dqzzUyE4s0P+WtFKeNXYVzRyKNPIo2hp4ZbJior
	msweM9wJb++wcn+nLvOUyyBgX2fFeW7FLpdX1QhlyI1TAH4hYZVknAvItB+8GPM=
X-Gm-Gg: ASbGncsUdupM6Mqu+64l47DXUNQIRGmONX/oM2OICy3emWpPe5BTXN/9GwVDytOgTuN
	ao7a3XxwHFVLZ5Xwp0lGuNPs+JLuvh/qf88gUp91o7n/SHvei+oIVeVqILTD6vAQ3QPefZFYH3q
	Xy0p+XeVUAY5qsDZMAmePv/qeLyQLzzsQXpz4Ek/3zw62m4GOvdti3//Hrl/tthTplb9Y/3nKpb
	6Eq/5xTByO5KU/rE51+adv+N4LB6VOXjUnDBWewLgnIgvdsd++BLe7L4iAE+BgCdllipkD83mU9
	7J1KJgg8V/wO9yOOrTn2cRgLRoRhcU+rp9SQOQF8J+g=
X-Google-Smtp-Source: AGHT+IHoNtdi2KzbOEvcgicgIhYYXb2xgIRx/bl/joO9oAFym557HaFyh1SAIOG6pi2ut8rOkGsmPw==
X-Received: by 2002:a05:6a00:3997:b0:736:5e6f:295b with SMTP id d2e1a72fcca58-73960e454cdmr1498647b3a.12.1743029267506;
        Wed, 26 Mar 2025 15:47:47 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7394abf74e0sm3565628b3a.24.2025.03.26.15.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 15:47:47 -0700 (PDT)
Subject: [PATCH] RISC-V: errata: Use medany for relocatable builds
Date: Wed, 26 Mar 2025 15:45:07 -0700
Message-ID: <20250326224506.27165-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: samuel.holland@sifive.com,         linux-riscv@lists.infradead.org,
  Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_154748_979329_ADFA9995 
X-CRM114-Status: GOOD (  12.05  )
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

We're trying to mix non-PIC/PIE objects into the otherwise-PIE
relocatable kernels, to avoid GOT/PLT references during early boot
alternative resolution (which happens before the GOT/PLT are set up).

riscv64-unknown-linux-gnu-ld: arch/riscv/errata/sifive/errata.o: relocation R_RISCV_HI20 against `tlb_flush_all_threshold' can not be used when making a shared object; recompile with -fPIC
riscv64-unknown-linux-gnu-ld: arch/riscv/errata/thead/errata.o: relocation R_RISCV_HI20 against `riscv_cbom_block_size' can not be used when making a shared object; recompile with -fPIC

Fixes: 8dc2a7e8027f ("riscv: Fix relocatable kernels with early alternatives using -fno-pie")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
I'm not 100% sure it's possible to expose this without Samuel's NOMMU
relocatable builds, see
<https://lore.kernel.org/all/mhng-517c0318-c8fb-4c4a-aa0e-0d08f8d34d78@palmer-ri-x1c9/>
---
 arch/riscv/errata/Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/errata/Makefile b/arch/riscv/errata/Makefile
index f0da9d7b39c3..bc6c77ba837d 100644
--- a/arch/riscv/errata/Makefile
+++ b/arch/riscv/errata/Makefile
@@ -1,5 +1,9 @@
 ifdef CONFIG_RELOCATABLE
-KBUILD_CFLAGS += -fno-pie
+# We can't use PIC/PIE when handling early-boot errata parsing, as the kernel
+# doesn't have a GOT setup at that point.  So instead just use medany: it's
+# usually position-independent, so it should be good enough for the errata
+# handling.
+KBUILD_CFLAGS += -fno-pie -mcmodel=medany
 endif
 
 ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
