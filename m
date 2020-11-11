Return-Path: <SRS0=0ydX=ER=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0471C5517A
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 13:34:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C115206D9
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 13:34:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QXjwKPNC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJSxGfIb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C115206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iiZHLJ3KXW3pQf+QIvqnw0oSp94KP4J8a5a3Vx3Ctbk=; b=QXjwKPNCQWVJlX2P71b0YLRdsA
	WWIke6t7iLfBibw7W2kQQ+CphoRvA/ZQD/7UtTm6aqX3ZRdfiMDL67cddQuKFdi2KgqN2cZ3AIF1x
	GRV7YoPs9rYFKmFywx4NhBp97hHPXymNs8MibJpXe3wK/fuvPZ2cYdpjBeNZc4eZkMuXXt68oTofz
	de0+wNLNL44aBL/qTD95nSArgUT/utjrc3dmRzfbgeD7IuOCL9hR58Oy/cErJvrPgqkD8sqOc59de
	gO95iqMysnN9B40P4FogKfToeV1AZGo+MHHpcQ1D8paockNn/5HG7aqFULPuiL0sIbcpDRNWYAmcu
	wpKQ2+Aw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcqGh-00072x-Hz; Wed, 11 Nov 2020 13:34:35 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcqGe-000728-Ms
 for linux-riscv@lists.infradead.org; Wed, 11 Nov 2020 13:34:33 +0000
Received: by mail-qt1-x843.google.com with SMTP id f93so1219874qtb.10
 for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2020 05:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ADY2JmYxE9Xly9S24Z1LRnTUA3RyY71p6BFzajWHuao=;
 b=YJSxGfIbb1UUIY/29x8l4T1Jgc/yvQs31iNrz+gq8lShwrVPuHybhNR6GJR2b7ujTh
 QXkNda2M3eSKkjAcLLD3C+040OUac/TeqxIQ4kKWh1L61WubktOhPd4WOSZc7To8b+sR
 jcvHPDdLofNDeZQFZI6zTyzwiTZI58E4j7EHZSBLV1AVXppIZtxsLNOxs1YSHzxtaIyi
 /8HpFYA+y+MUg78ZtzBB1bfvaT8TL/NlfNctAizFSHUGW5eGeI6PDGrklFXYAAJQKgEB
 E8onifEyVUdSHl7UZUr5Lsm3j3fv9Fv5friHKntdo5FtOXwpCVL7DFWbsNCOMCfZLyYf
 O7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ADY2JmYxE9Xly9S24Z1LRnTUA3RyY71p6BFzajWHuao=;
 b=TXVFz7ybxo+9XN4Q+x2iRgL3lKNdoV85b949iH9eHvBbsGSICIcbT4OxKvssVy2wut
 eDqVuiIf392e5ltU64uZGBu3/yR/snT9TJ5aRBSyorY0yMjqLYQPK5cSG5So8A6VdRrO
 Tvd3mjMey2D0/RuwTBufEn3jgXLBk7ukhQHSDA3mZGqndlPGs3/6nYSo4tMFNej7vsiN
 gJ1q7f4WsEjLbkv1tHpHWNXvc9Okq0WoaCrFHaq0zWLNdgydcmToVokEfhHmhQLgSufn
 BhBbLDTTBG/PKL9eg1SI8C9o4GAc9g9qj2Cs+gCFCvYwWvuetuOQ7xIsqft7ngcUxr3D
 Radw==
X-Gm-Message-State: AOAM531os5xSuaoS/JRh+xj8UPBD1wKVoO8PS67W7wMaadCm3/EL7YmC
 5RU6h3H6Zpo6CLWAFO9KE3k=
X-Google-Smtp-Source: ABdhPJzHUfo2j/Nsf18vB+1vJm4vfXG7t/Ethu+Cj5/ykTWucn6CwriV6xUlfxlPz1n756bgw31C9g==
X-Received: by 2002:ac8:130d:: with SMTP id e13mr23000296qtj.3.1605101669342; 
 Wed, 11 Nov 2020 05:34:29 -0800 (PST)
Received: from localhost.localdomain
 (host-173-230-99-154.tnkngak.clients.pavlovmedia.com. [173.230.99.154])
 by smtp.gmail.com with ESMTPSA id r190sm1997814qkf.101.2020.11.11.05.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 05:34:28 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp v2 0/8] seccomp: add bitmap cache support on remaining
 arches and report cache in procfs
Date: Wed, 11 Nov 2020 07:33:46 -0600
Message-Id: <cover.1605101222.git.yifeifz2@illinois.edu>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_083432_805070_1C728508 
X-CRM114-Status: GOOD (  13.49  )
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
Cc: linux-sh@vger.kernel.org, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Hubertus Franke <frankeh@us.ibm.com>, Jack Chen <jianyan2@illinois.edu>,
 linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, YiFei Zhu <yifeifz2@illinois.edu>,
 linux-csky@vger.kernel.org, Tianyin Xu <tyxu@illinois.edu>,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, Valentin Rothberg <vrothber@redhat.com>,
 Aleksa Sarai <cyphar@cyphar.com>, Josep Torrellas <torrella@illinois.edu>,
 Will Drewry <wad@chromium.org>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
 Dimitrios Skarlatos <dskarlat@cs.cmu.edu>,
 David Laight <David.Laight@aculab.com>,
 Giuseppe Scrivano <gscrivan@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Tycho Andersen <tycho@tycho.pizza>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: YiFei Zhu <yifeifz2@illinois.edu>

This patch series enables bitmap cache for the remaining arches with
SECCOMP_FILTER, other than MIPS.

I was unable to find any of the arches having subarch-specific NR_syscalls
macros, so generic NR_syscalls is used. SH's syscall_get_arch seems to
only have the 32-bit subarch implementation. I'm not sure if this is
expected.

This series has not been tested; I have not built all the cross compilers
necessary to build test, let alone run the kernel or benchmark the
performance, so help on making sure the bitmap cache works as expected
(selftests/seccomp/{seccomp_benchmark,seccomp_bpf}) would be appreciated.
The series applies on top of Kees's for-next/seccomp branch.

v1 -> v2:
* ppc, sh: s/__SECCOMP_ARCH_LE_BIT/__SECCOMP_ARCH_LE/
* ppc: add "le" suffix to arch name when the arch is little endian.
* ppc: add explanation of why __LITTLE_ENDIAN__ is used to commit message.

YiFei Zhu (8):
  csky: Enable seccomp architecture tracking
  parisc: Enable seccomp architecture tracking
  powerpc: Enable seccomp architecture tracking
  riscv: Enable seccomp architecture tracking
  s390: Enable seccomp architecture tracking
  sh: Enable seccomp architecture tracking
  xtensa: Enable seccomp architecture tracking
  seccomp/cache: Report cache data through /proc/pid/seccomp_cache

 arch/Kconfig                       | 15 ++++++++
 arch/csky/include/asm/Kbuild       |  1 -
 arch/csky/include/asm/seccomp.h    | 11 ++++++
 arch/parisc/include/asm/Kbuild     |  1 -
 arch/parisc/include/asm/seccomp.h  | 22 +++++++++++
 arch/powerpc/include/asm/seccomp.h | 23 ++++++++++++
 arch/riscv/include/asm/seccomp.h   | 10 +++++
 arch/s390/include/asm/seccomp.h    |  9 +++++
 arch/sh/include/asm/seccomp.h      | 10 +++++
 arch/xtensa/include/asm/Kbuild     |  1 -
 arch/xtensa/include/asm/seccomp.h  | 11 ++++++
 fs/proc/base.c                     |  6 +++
 include/linux/seccomp.h            |  7 ++++
 kernel/seccomp.c                   | 59 ++++++++++++++++++++++++++++++
 14 files changed, 183 insertions(+), 3 deletions(-)
 create mode 100644 arch/csky/include/asm/seccomp.h
 create mode 100644 arch/parisc/include/asm/seccomp.h
 create mode 100644 arch/xtensa/include/asm/seccomp.h


base-commit: 38c37e8fd3d2590c4234d8cfbc22158362f0eb04
--
2.29.2

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
