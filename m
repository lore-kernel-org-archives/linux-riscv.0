Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E754CAC582
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 11:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9+2P9g2gMWxsnuXvs2r/kVWrihn7UNqv1RdCZoDqxRU=; b=3GzIKJqzPJvSkG
	qxuH2FqMD/+fIzXBsSMMwp4RIRzqi7y3FZES2wI2bSm9VOhf5CmxkI9jVoryUq29in5+Yc704Vdr7
	hc5srZhd1itNxX1imHgC2qhK0XGd2S5hMJMEIcpRsqKwaDqSFc0j6UZfabuQDy3MG5Ox5ve96O4KS
	MvGc9PcWgK0igBckLAmM201NmalLz3ursIXNlRn+CtXFJHPxxuqvHYNiVYt7+bnFVNHmN7qtQyeoY
	zoOwRQEz2DUfFZX1G1fr7ZdOWwktjhqOXAwG8QVp9kFSXQ4DVyNkUDwaK+2uHNOy/+UcyHlFnsLic
	HCG7NA8/tbbw0ViMBUDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux21M-00000008tuM-1C8b;
	Fri, 12 Sep 2025 11:32:52 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux21J-00000008ttp-1QVH
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 11:32:50 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b49c1c130c9so1249147a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 04:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757676768; x=1758281568; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y6Vu9krI8L/L917eJRdmIwH3Jf+YuSh9fi/gZdnGGTM=;
        b=eFlAtVNKJSTSDNSjuPjzfaZQM6SNVu7l5q/ad2nvyYnfV37Zd/Elj1gKf34QpOc7rV
         WRGe/KXJgPobyvkm1Lm5QWc4cfm1ov85t/2gVTPlH9wkP6rUs3XRoYq7UCNoSdcC6X0G
         l5ly4xkQTks05lYpMiF0q6llG2FlTRnCz8gHlvpsD4sl0Uh1Lb7c9UybhAl/DWVu1mok
         +L+K7Ogn9n+aOpemrYd4y8FMWJgnQn6bwhVsgTqSbqnlNIyKtAanMtqIOiKWvBEkKVjh
         IT2AFLnAdZas1mu+fQGuVUmaD70KDd1AJIUzONo+RzzgskdrIlzjg+LVV4usCnj+ZhiT
         MTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757676768; x=1758281568;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y6Vu9krI8L/L917eJRdmIwH3Jf+YuSh9fi/gZdnGGTM=;
        b=TPY6EzccA0hsO/w+OF6UeCgqLUYT+DyGplHhNo8gpCxIO6Z7/1MJsPvS4C+YpzPcdC
         zCZpOa/hpu/K/E16V4SjZJas+Gbj1RFWrxkN/Qr7P8eTYCdCypTFWJPHUJ0OFHP1M4oA
         vHBIpExdtDz7ijWJNio7/qT4H9a5bVCPhA/Xmmek68EVgRGwKLt7K77CqnS9THAk7V9d
         kns8dEOG0KryrdZZY4112AqOrXtLqjicUSAIjIygltEYkUnV+qVQpoDx/Hg0Syym2zeb
         l1k28SCpwyZEPuMatxphDiJeEVPWnV/aZZSTXMBhS5rtlhRppfhlx3GOB25sOHv7Ad6S
         /k+A==
X-Forwarded-Encrypted: i=1; AJvYcCU4std4tbEoyMi5esQTJfbbY3hlwJTYOsaBMfmM/TnjaEei1AshpvKocssEJo/yNe/aNm9CxH0C2t3udQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzG8DIno8Un8UcxY/SivapoC6dWp+Uf0NwQbmohntdKxO8yl2lH
	DmEp9M3hoGJScCm79aBLzmepoFD9KmLAZT+TE5jfEGzMT6vRrEqgrS1scWwOTumAFIb7KmE4nSK
	P2PnUojS9Prx04U7Rp59Xw+8wopAomawE0Uuy780P0Q==
X-Gm-Gg: ASbGncu30oMlRKvCVXz1xIZCrQpjs7qgF9kB+gAjLMhBgdHTEj1NOxXMcxBXwnT4jll
	/ZqGXgMsHA/jRX1NS6+95eq++et9QA4XcJkeK6IwZgWO9YvzErdtEV72Gg4TJ+FIjGbDrbIWqEw
	cesdlk91e9iGVM6jskyrG88XF/wiRFv/u3ZpTO0jgBucaFpV32GsZ0q6PJZpL8FhfQFItYzB8hH
	CV1UxY5ShVddufxV1+fkIOLSZNWKUyAQrx6eBGQzkFBAXAqJr5LHan2U3Mzz7/N11PH9aifM+px
	95VINjg=
X-Google-Smtp-Source: AGHT+IF1n0wZVljtgQdO4YjkTkuDA16K7j3EGrt+LavVV05cNjZjVMw0mRnQJqWQrvbyjkw61l+wH9wnd6eTRWsTKWg=
X-Received: by 2002:a17:902:c40d:b0:251:a3b3:1580 with SMTP id
 d9443c01a7336-25d24cac4eemr35190575ad.6.1757676768437; Fri, 12 Sep 2025
 04:32:48 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 12 Sep 2025 17:02:36 +0530
X-Gm-Features: AS18NWCRkwK2BEtW0uxWjqehT8uEFjWUmULflZWeqoftij31KvQE0_RmSXQs-jg
Message-ID: <CA+G9fYvQekqNdZpOeibBf0DZNjqR+ZGHRw1yHq6uh0OROZ9sRw@mail.gmail.com>
Subject: next-20250912: riscv: s390: mm/kasan/shadow.c 'kasan_populate_vmalloc_pte'
 pgtable.h:247:41: error: statement with no effect [-Werror=unused-value]
To: kasan-dev <kasan-dev@googlegroups.com>, linux-mm <linux-mm@kvack.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390@vger.kernel.org, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_043249_394067_FE97AA83 
X-CRM114-Status: UNSURE (   5.19  )
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

The following build warnings / errors noticed on the riscv and s390
with allyesconfig build on the Linux next-20250912 tag.

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Build regression: next-20250912 mm/kasan/shadow.c
'kasan_populate_vmalloc_pte' pgtable.h error statement with no effect
[-Werror=unused-value]

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

$ git log --oneline next-20250911..next-20250912 --  mm/kasan/shadow.c
  aed53ec0b797a mm: introduce local state for lazy_mmu sections
  307f2dc9b308e kasan: introduce ARCH_DEFER_KASAN and unify static key
across modes

## Test log
In file included from include/linux/kasan.h:37,
                 from mm/kasan/shadow.c:14:
mm/kasan/shadow.c: In function 'kasan_populate_vmalloc_pte':
include/linux/pgtable.h:247:41: error: statement with no effect
[-Werror=unused-value]
  247 | #define arch_enter_lazy_mmu_mode()      (LAZY_MMU_DEFAULT)
      |                                         ^
mm/kasan/shadow.c:322:9: note: in expansion of macro 'arch_enter_lazy_mmu_mode'
  322 |         arch_enter_lazy_mmu_mode();
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
mm/kasan/shadow.c: In function 'kasan_depopulate_vmalloc_pte':
include/linux/pgtable.h:247:41: error: statement with no effect
[-Werror=unused-value]
  247 | #define arch_enter_lazy_mmu_mode()      (LAZY_MMU_DEFAULT)
      |                                         ^
mm/kasan/shadow.c:497:9: note: in expansion of macro 'arch_enter_lazy_mmu_mode'
  497 |         arch_enter_lazy_mmu_mode();
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

## Source
* Kernel version: 6.17.0-rc5
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: 6.17.0-rc5-next-20250912
* Git commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
* Architectures: riscv, s390
* Toolchains: gcc (Debian 13.3.0-16) 13.3.0
* Kconfigs: allyesconfig

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29863344/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250912/log-parser-build-gcc/gcc-compiler-include_linux_pgtable_h-error-statement-with-no-effect/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/32aTGVWBLzkF7PsIq9FBtLK3T4W
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/32aTGVWBLzkF7PsIq9FBtLK3T4W/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/32aTGVWBLzkF7PsIq9FBtLK3T4W/config

## Steps to reproduce
 $ tuxmake --runtime podman --target-arch riscv --toolchain gcc-13
--kconfig allyesconfig


--
Linaro LKFT

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
