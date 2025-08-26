Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653CACA0FE7
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 06:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1Wn+hiFdOoNSRirF6qoWNb7C/gQ/wTE6MRnmsh3HNz0=; b=fw+ImdKj3nyCPs
	6/Yw/glBlgRYT5iSXnfthAgG1EJLDhvpAvffM1d3XT1OyEm2jtBj282TUcd6HHIJt53ab6nGhw0i1
	WHEXSw52EuffN2bNAdNtDTFIcH/mpDZQmxJffonly2NGGBX7abuRB2eairFbBWXi27eJqdo+H2DZA
	OW0eQMb4D2XNQZXWm+E5I8k+t0lygXk2zgAE7lnbzmS+M3sTxePNjKHiqXPvuFbM9AtdL3AV41cS2
	v/7qrlmmAjr6UiT1qyDTPqljNpPEeQA4Z0Umyzl6X2IUz7uOB+kKX07Vdb8FlrO2/3lKRAC542LRR
	bzJyQLJfpIs1DZC7p5aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnWs-0000000Akx8-2NTs;
	Tue, 26 Aug 2025 06:51:38 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn3I-0000000Ag2f-1w5S
	for linux-riscv@lists.infradead.org;
	Tue, 26 Aug 2025 06:21:06 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b47174aec0eso3385276a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 25 Aug 2025 23:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756189263; x=1756794063; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MFYRl1ZFHjhZrd7h6GtCM5LUiRUxEc7ppUKwn5M/+7g=;
        b=n8FXWUYzJQNyVxLGJ3ouwe/vsg1bff7Kyjviwcb6BG7r01x6DxAdXSoEyEQGum6IEs
         V5D409XhA4voHolQWEpNxiIAInBK7VxQy8HtPHdSjdoliTUNe5W8b8Os3z5cbjXkOUF0
         uQgWHCbmwPYXeoBlbMZ14PDMRFd9XUSSh2LxCz8PstWCVayk/rH+2dsKeyTegQ9WvBI+
         4Bq5heI8qROeVa85aT0+ZkHf4Hfkl0alJbH84KW3l7cqW0zbPANMzL8st6Z5Ov7xj20A
         Lr8vP7qTh/v3vSnAIwrk9uYeViLHXSQtCkXnjocLejvHZkxLxLRE1p2e+4SgvN0LtG+z
         VPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756189263; x=1756794063;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MFYRl1ZFHjhZrd7h6GtCM5LUiRUxEc7ppUKwn5M/+7g=;
        b=jj0q/Le53xgI9w80dUSLd872HIDGuLq6rCDOzUNkQ1U8opEikXbq/A4Q5cz+9L4ALs
         LzTzLgxo6Xrc2kVmffA1IlE734Ty3n9jid/y0WKrUgk3GeoCDui8YbHavYt3FSHE2T9X
         L/hg6NviuyYTsG0ucFUpLdu2wFFeo5PdFqnPm8Xcl/DwaN0gAl+1FYspdD0SIPcN5ukj
         Q2e8DEeznVUqXs//PWL0nyUpSedFZkLGNRKoB23JqPuTjdSzU8M+Ed7zm1zVHzBskq7V
         o2UCmQRYw347vgX2IaWssNez3AwL9GBfZ0Vl8KKsg0qwDb6LUeG2dQpwMOqF9Ty6ijZA
         GZ+Q==
X-Gm-Message-State: AOJu0YwVg1n9s6wTUiYbksKYiPc1diAXy1jxHdHjs5kQx7SS8wRVc9KK
	wnmBdDjkqgu5+KkndIQk1cPcU5H1XtHh5qbtMcDMq0HlOH6yMmmxjfUb6fXb+UTwTl0On0y7j5I
	cwv/NX7PNgaNt3ZfPDL6UGnfe38QqUgPatjmM7z47coMLWODHT5o/2OE=
X-Gm-Gg: ASbGncsvE6RRLR5AlYP3AAFBd0cfkwzopmLYZzh/yFNY/oDQ5zULjnCD5HIUbGO8lKk
	xVqWsZdOD9Zeyvfbnpal9p8iFHyBrw5pCrYqt6oYsmSrkpwlE1PdyhtmmqlC+98o47Dcsm3ttio
	/S/4X1VK4DIQoFtxYnLCjwiIzJ3Sp5+rZui6i1z/abysBv7sbuohS7tTcJ9WgtH1n0GX9Z65K4M
	MAuoTlF+r38YOrPqQZhzocRDidXx+OOYyl50qY=
X-Google-Smtp-Source: AGHT+IEaOAsyEwvYZhL6gwxls7OPv3CjgiN4RcC1NbjL3gx6dd9cjdG1OkopmuigZ7xW+OLJUx5JyXWtdmH6vWAFnIU=
X-Received: by 2002:a17:902:d585:b0:246:b41a:bb90 with SMTP id
 d9443c01a7336-246b41ac045mr106384895ad.2.1756189262339; Mon, 25 Aug 2025
 23:21:02 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 26 Aug 2025 11:50:50 +0530
X-Gm-Features: Ac12FXxpo9Z2nstlPDzyogezkDDH4eyaoMNNWqxf1iMYZc7Yw19lKOYzdQTyf50
Message-ID: <CA+G9fYs2Wp33dq0jeuWqU+67z3VzP2LyHBXSD+SecqqG2OiJfw@mail.gmail.com>
Subject: next-20250825: riscv: pgtable.h:951:40: error: incompatible type for
 argument 2 of 'page_table_check_pud_clear'
To: linux-riscv <linux-riscv@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_232104_599984_95568872 
X-CRM114-Status: UNSURE (   5.27  )
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

The following build warnings / errors are noticed with riscv defconfig with
clang-20 and gcc-13 toolchains.

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Build regression: next-20250825 riscv pgtable.h:951:40: error:
incompatible type for argument 2 of 'page_table_check_pud_clear'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

riscv:
  build:
    * gcc-13-lkftconfig-rcutorture
    * gcc-13-lkftconfig
    * gcc-13-allyesconfig
    * clang-20-lkftconfig
    * gcc-13-lkftconfig-libgpiod

## Build log
In file included from include/linux/pgtable.h:6,
                 from include/linux/mm.h:31,
                 from arch/riscv/kernel/asm-offsets.c:8:
arch/riscv/include/asm/pgtable.h: In function 'pudp_huge_get_and_clear':
arch/riscv/include/asm/pgtable.h:951:40: error: incompatible type for
argument 2 of 'page_table_check_pud_clear'
  951 |         page_table_check_pud_clear(mm, address, pud);
      |                                        ^~~~~~~
      |                                        |
      |                                        long unsigned int
In file included from arch/riscv/include/asm/pgtable.h:139:
include/linux/page_table_check.h:125:75: note: expected 'pud_t' but
argument is of type 'long unsigned int'
  125 | static inline void page_table_check_pud_clear(struct mm_struct
*mm, pud_t pud)
      |
     ~~~~~~^~~
arch/riscv/include/asm/pgtable.h:951:9: error: too many arguments to
function 'page_table_check_pud_clear'
  951 |         page_table_check_pud_clear(mm, address, pud);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/page_table_check.h:125:20: note: declared here
  125 | static inline void page_table_check_pud_clear(struct mm_struct
*mm, pud_t pud)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
make[3]: *** [scripts/Makefile.build:182:
arch/riscv/kernel/asm-offsets.s] Error 1

## Source
* Kernel version: 6.17.0-rc3-next-20250825
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: next-20250825
* Git commit: 6c68f4c0a147c025ae0b25fab688c7c47964a02f
* Architectures: riscv
* Toolchains: clang-20 gcc-12
* Kconfigs: defconfig+lkftconfig

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29652465/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250825/build/gcc-13-lkftconfig/
* Build error details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250825/log-parser-build-gcc/gcc-compiler-arch_riscv_include_asm_pgtable_h-error-too-many-arguments-to-function-page_table_check_pud_clear/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/31lrb0XugzFZYDePlPNpSIVTzeB
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/31lrb0XugzFZYDePlPNpSIVTzeB/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/31lrb0XugzFZYDePlPNpSIVTzeB/config

--
Linaro LKFT
https://lkft.linaro.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
