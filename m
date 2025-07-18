Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B12C83F17
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jul 2025 21:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YLc7uvVodsWjEgb7PzcdYVpcx0WjGdO6YOUGganW6Kg=; b=ZsPCzPTyTFvclN
	u5E01mlINL0NoLCW6trbMjSom8Gpv8mtP9CuzUgn+9UDu229MnOQHpic4psaaao4+Wkzw1lPL+fLQ
	9DM8pf7Z23o34UwlCUvQLT09Cj02KjQYnrLRK3TOqCEAS61F9YNqR7DI99OCQgDnV2dLynjGu6+8y
	1nKAedIZddH9ki3/rlRy2tXmXwc7+FOgK92c02vGPaBF+YnH/xpqnQCbHVnGxkq7sXM5z4OK8ws1n
	m+Ewz6/Eu8KcSKoHwNoTgssyAFq2HNwaRaW8fzAKRmXF53IjbTRX1iPvZgf+xJyg1W+g47bveDXwg
	lRFtIhMz1m6nplDFgAdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uct1q-0000000DVLI-2Nuu;
	Fri, 18 Jul 2025 21:54:06 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uct1o-0000000DVKz-2H35
	for linux-riscv@lists.infradead.org;
	Fri, 18 Jul 2025 21:54:05 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso2394518b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 18 Jul 2025 14:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1752875643; x=1753480443; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txX+SyRfmCFSSLg3W+gric1BD8iWpGSCKSxHmCCGNpw=;
        b=rPwfzwfNiv0LiYNXoXv46a4ocPMzhT7YVM/4TuWbMF8zDXkjh53k6EtYFsmaH2R6rw
         mH7fu8spN/o72+iI2dP5dc9v0Ab9umrXHSx8YwrIjxMD8qjT/AnWj5v4qXLyrtmQol8M
         tO5cYpJI2qHfOmCA411PuZ6WUUkVaygloGWnJXWP0o8QB0t1oi5+fBp+53d8E6KGsgOF
         Tq1ckqDN66f08YzuvKFZxA0MtE/VSn4nbz7OuGfxfXWoBGLWxnZDGGVm9n9yB4PoacQU
         0vUh9eQWxN2muZjs97k2WJhWuiAX4bqCu6e1BWHkfv8skgM+lLxnJmdM0AtplE0n7aXp
         HdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752875643; x=1753480443;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txX+SyRfmCFSSLg3W+gric1BD8iWpGSCKSxHmCCGNpw=;
        b=kawW13GlM6whlzrCQzXtDZJWOeECb4g4GNd4l7a5y77fWq3aWRBh4aRlyDur/PY4VT
         XdjK6V5zoNH71POUFDpQxU4MWp89ePAfo7uzQzhtC5i8mzFDqp9Ap3ivpEwC37A3dR73
         tgMrJSwZEBKfv3OjhfUl8NTZndvahAYIV56ssYfav+FTAWe3foeDO5Zne/z6LZ9DMJT0
         pdpz0Odw4qPervCdicPLax2Vc1FpSkeXw3upg1LnDEar3oMfLk2fwXR9/P3RZutqP261
         +WNexq7DqyFxE6y3j7lZJknOwzMWS8786OMlfyI/+4dH1VV86khGiMo+IvUuRoO6SbJL
         Svzg==
X-Gm-Message-State: AOJu0YzsTmRUf51Gql9v8fIYsCCKue2guwWFRiky+zPUCWoSFWyHHstU
	WpT3Q3TPlKtWN4kOcXOfyISR1aDNHyhrkZcOe0Lb5uuhPCrCYucLKWrH6gM5WBQgJJrcYr2UJbh
	V4jYOTAo=
X-Gm-Gg: ASbGnctlUqKBxsxTdJpHzivz2GgI9Ys7wzuzE85bKy86VuNL89rml4JaqFSFtkEtjEh
	CUxW0Ko6nVYNq/cMYHWzCy8awOfC2UnncQWElWwFNYo4QB4jrdTtCPR7mo5nOnCASdDUU0AMMMZ
	6D3BkPeXlSn3dAnSeAVLGseY5mTIr32FYF+Xx+6HaEV0mlaIPhuVb3DGWApjhTqCimCbiSaP8iT
	P5IdjEIAT0zvdcNoJoyNy4s1sKN3BGkuuepQs5kXYy20hLoNLazE4/eeXN8kncRgreTvGrYeE5J
	hEWvIGIxYcx8okml+VyCwNEQGC/BgefbUTFit6n1ZyxL3FiPuXIBKWhp+KtwQWau/RaePL94cmm
	omyhk2Oa7Q7n+8WDH/TaN
X-Google-Smtp-Source: AGHT+IFFawVVhTyoZ/7fjVvRJBlkJqtmErTQujTleFZieZ8o0dIxe/nJwq0SfRo071nzfs5Q0sGKbg==
X-Received: by 2002:a05:6a21:104:b0:21a:bdd2:c2f7 with SMTP id adf61e73a8af0-23814268895mr19400274637.29.1752875643033;
        Fri, 18 Jul 2025 14:54:03 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:b02a])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b3f2ff61fe7sm1411708a12.37.2025.07.18.14.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 14:54:02 -0700 (PDT)
Date: Fri, 18 Jul 2025 14:54:02 -0700 (PDT)
X-Google-Original-Date: Fri, 18 Jul 2025 14:53:54 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.16-rc7
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-AC007570-958E-4BDE-A86F-44681C9AC10E@palmerdabbelt-mac>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_145404_820927_F53A6477 
X-CRM114-Status: UNSURE (   9.06  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 347e9f5043c89695b01e66b3ed111755afcf1911:

  Linux 6.16-rc6 (2025-07-13 14:25:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.16-rc7

for you to fetch changes up to b65ca21835ed615907ba231a60db80a2605b94dc:

  riscv: uaccess: Fix -Wuninitialized and -Wshadow in __put_user_nocheck (2025-07-16 10:29:39 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.16-rc7

* Three fixes for unnecessary spew: an ACPI CPPC boot-time debug
  message, the link-time warnings for R_RISCV_NONE in binaries, and some
  compile-time warnings in __put_user_nocheck.
* A fix for a race during text patching.
* Interrupts are no longer disabled during exception handling.
* A fix for a missing sign extension in the misaligned load handler.
* A fix to avoid static ftrace being selected in Kconfig, as we have
  moved to dynamic ftrace.

----------------------------------------------------------------
Alexandre Ghiti (3):
      riscv: Stop considering R_RISCV_NONE as bad relocations
      riscv: ftrace: Properly acquire text_mutex to fix a race condition
      riscv: Stop supporting static ftrace

Andreas Schwab (1):
      riscv: traps_misaligned: properly sign extend value in misaligned load handler

Nam Cao (1):
      riscv: Enable interrupt during exception handling

Nathan Chancellor (1):
      riscv: uaccess: Fix -Wuninitialized and -Wshadow in __put_user_nocheck

Sunil V L (1):
      ACPI: RISC-V: Remove unnecessary CPPC debug message

 arch/riscv/Kconfig                   |  3 ++-
 arch/riscv/include/asm/uaccess.h     |  4 ++--
 arch/riscv/kernel/ftrace.c           | 18 ++++++++++++++----
 arch/riscv/kernel/traps.c            | 10 ++++++----
 arch/riscv/kernel/traps_misaligned.c |  2 +-
 arch/riscv/tools/relocs_check.sh     |  4 +++-
 drivers/acpi/riscv/cppc.c            |  2 --
 7 files changed, 28 insertions(+), 15 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
