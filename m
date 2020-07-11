Return-Path: <SRS0=q1JI=AW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD822C433E4
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2020 20:24:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97E8820725
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2020 20:24:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K5934NkD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="om7388ZR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97E8820725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:Subject:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GbGK8rmRdNjib5LwtR7YPCNo/jtCHHFhTh1F6PDRyk0=; b=K5934NkDu1q9OY+6mda6an4Qi/
	/L1PHvwGGnIBQh0iSYW4fFngqXYepKvNOi+Q3LDsVxQywEHEsOOsTyk/WwhOuyMpeFoTFC5yM8hPD
	DkkYY72XI8lCptaHEuoLESk91NbdtVNm4M3BwzgVS6n510ITu6c+PqojRpGJAV9ll3GJAHz/9kdzl
	57ZTz9RuwqB9SGQO+ljKqoAGff64bDsNLQgxGsRdKWP3xQtZoEUYx25gYxzKhVsL3+Z967hjLz6av
	3vyp7j/Oz7h7ds8btpf2BoF6Y0rthsBoQxs5v61yJveQ/9fp60iDVgMUKDM1yULJsh0wH9uzjQxmj
	EzDW1RNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juM2a-00073V-Ps; Sat, 11 Jul 2020 20:24:08 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juM2X-000736-Eg
 for linux-riscv@lists.infradead.org; Sat, 11 Jul 2020 20:24:07 +0000
Received: by mail-pg1-x543.google.com with SMTP id t6so4106667pgq.1
 for <linux-riscv@lists.infradead.org>; Sat, 11 Jul 2020 13:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=paG/UTKUPg8LNNMM5UIfbQX1NT/A+O79kxOkghupz2c=;
 b=om7388ZRsX8MUL1apUipxboeW7eErLSG8gOfHTWrT6hzYJwAVJTbGU/WgJsN7byyz+
 RhilSMP2KIoFZM5+qoCt7Hk/OSxDXHQyWzdzjyHrda8QUttUcv0PAN318Bx4mLQyTTW5
 6UylyNpcmxq4ifBr+5iQY8y/+PtLN8eRJ/gFlA+OHJN/q4Mvqp+wvfKz6G5FNmgnXwSr
 FBpQtowAX9ueYC4ZnpXt+SEfgX7baxkARbD8LQ5PqDVvzZaIDb4jtKlGkq8F282g6945
 33gSUHGB/ZuAR36qv3uFKqjzYyOWvtOkHedEehET6iZC9m1sZ0WGTARVtVwWWa/g0FG1
 lebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=paG/UTKUPg8LNNMM5UIfbQX1NT/A+O79kxOkghupz2c=;
 b=HTK7Gkmlw5IMrus8CE/uea/XdHWbQtKCtBT5e5/qiFcX1B9pY4Z30UzeuKEG/crwoS
 JT3/b+dzuaYAoghttKMa97jF+xI/3n0jnOuFBJ1Sb+ecx/Jn46G6gUsQomMhH9Uc7iH3
 lvWqIQv/18J75IdAifhSokTb382BUNAagzkHYu6OTlNfuI2yyUO3zNH6hMCJ99uioChS
 6W7csXgikqkFE+MT01gKe3q26/Imefcr7PSCKfq7TEFyqU55xNOb3y2RaIi67QxapgZ7
 fe/j7AXmvqkvPrHSLp7JggYbMPbyh2VLIZLVYL/f0j1bOnUI5llCsOAW1IQCMuGdSyYl
 Kmkw==
X-Gm-Message-State: AOAM533i1zQp77xuj+YwFT5mj5+fFXhXaW5kr/gmR3NnfbghmqXYBlVo
 qv64uxk4Oj9kY8toE8FdK+AwOXbPrPk=
X-Google-Smtp-Source: ABdhPJxlIjk8lduBkdIXyv51+7bw5E4xwnJISJhykecgIyxhu0I7/UfrP/Cx3jA+e1ElRTlQMtNP6g==
X-Received: by 2002:a63:310f:: with SMTP id x15mr64432364pgx.221.1594499041744; 
 Sat, 11 Jul 2020 13:24:01 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id g18sm9668435pfi.141.2020.07.11.13.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jul 2020 13:24:01 -0700 (PDT)
Date: Sat, 11 Jul 2020 13:24:01 -0700 (PDT)
X-Google-Original-Date: Sat, 11 Jul 2020 13:23:48 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.8-rc5 (ideally)
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-f8b65a3e-17ea-448d-be82-0d1c42c0bf37@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200711_162405_573016_A57B6089 
X-CRM114-Status: GOOD (  10.47  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit dcb7fd82c75ee2d6e6f9d8cc71c52519ed52e258:

  Linux 5.8-rc4 (2020-07-05 16:20:22 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.8-rc5

for you to fetch changes up to 70ee5731a40b1f07f151e52c3c4ed27d70d4f9fe:

  riscv: Avoid kgdb.h including gdb_xml.h to solve unused-const-variable warning (2020-07-09 20:12:28 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.8-rc5 (ideally)

I have a few KGDB-related fixes that I'd like to target for 5.8-rc5.  They're
mostly fixes for build warnings, but there's also:

* Support for the qSupported and qXfer packets, which are necessary to pass
  around GDB XML information which we need for the RISC-V GDB port to fully
  function.
* Users can now select STRICT_KERNEL_RWX instead of forcing it on.

I know it's a bit late for rc5, as these are not critical it's not a big deal
if they don't make it in.

----------------------------------------------------------------
Vincent Chen (5):
      kgdb: enable arch to support XML packet.
      riscv: enable the Kconfig prompt of STRICT_KERNEL_RWX
      riscv: Fix "no previous prototype" compile warning in kgdb.c file
      kgdb: Move the extern declaration kgdb_has_hit_break() to generic kgdb.h
      riscv: Avoid kgdb.h including gdb_xml.h to solve unused-const-variable warning

 arch/riscv/Kconfig               |  2 ++
 arch/riscv/include/asm/gdb_xml.h |  3 +--
 arch/riscv/include/asm/kgdb.h    |  5 +++--
 arch/riscv/kernel/kgdb.c         | 10 +++++-----
 include/linux/kgdb.h             | 12 ++++++++++++
 kernel/debug/gdbstub.c           | 13 +++++++++++++
 lib/Kconfig.kgdb                 |  5 +++++
 7 files changed, 41 insertions(+), 9 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
