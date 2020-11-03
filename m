Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_DOTEDU_SUSP,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D63C8C388F9
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 13:45:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6144F2224E
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 13:45:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aZ5ne6LK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tG8I/1z0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6144F2224E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8TsMZij0stxELmLtsD3jDKWPJvitSrAPE2Q+YbWcT20=; b=aZ5ne6LKH6zcprc/kg/+zIGt/D
	j8JK9RFap4HrQOeLKf4H0l1E2Bf5VhO6UOkKgpp6fNG6tPNjdVSIB5Tqxmtlm80MkZyc92wr1P4Kn
	gtbcozjzRqcF+b9oiv4uOpBedFlZ+Yyu/GAciO+SYtXM3YIHbDZQ41hmtNcjYb/9U1LB0VO66zopP
	nbl3jazEGJg9OKQRABxLUvvgp4VZclpodwqPUcD6dgYOBs+yDT/67d/bEsnscqR4jdCrqmmu84lA4
	B4IdCrlZ7QpP1O9Y6XD6AmFclgJ3eN13im7IwjEmCSFL/9whIE1b8+pL3iu+xmxi8H80Tff5R1P/U
	2Zz2C1Zg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZwcb-0007RV-1Z; Tue, 03 Nov 2020 13:45:13 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZwcW-0007Pw-Rz
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 13:45:09 +0000
Received: by mail-qt1-x842.google.com with SMTP id r8so11548930qtp.13
 for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2020 05:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2af8lawmvvDlOCNsCA7JIsdmqsCdB2rsVoy0htQN5ns=;
 b=tG8I/1z0TzI4q4NRqPO0rLNCTHRPlcbPUisuwZGCHkTaA7gq31V+sIhXGjEgV0/vO6
 pbNTw7LwqJ2BSRB+laFJtJlByIXmlZuy/6GU5jgLNMQiuBE8U4Tu//pUvxee4YY0nQ0c
 k1RsAaL8qgvf6GpS53ldLQwM5sFzu943PYddpW6yoLTBmPW5+fsmDiA58lO3h3YiZxKA
 1F8hhtjSQPz++5Bt4+shgsuVJGR+g/Uz2hsQEDd+OY//+xUtxXjKKJMY+Svoexxw1xC1
 y9Pb+KBXnUylNFffJknKNkJidEoXJl2Lsu31GCkZxAv5KRlR4wsY/4vmMfzf53jrb4Lg
 KfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2af8lawmvvDlOCNsCA7JIsdmqsCdB2rsVoy0htQN5ns=;
 b=GVnUVWz2B4cwSuxkk3+qYFAXgx+HQb84qgXO/lplRx6EiCtnzeF8L1LYO/H1jI3Sns
 hYRSq1vQvez1YAW2jQ+9PenusC4hBBHdORdqNvXWEyNmY7BNNBXyoOmUwWtfDzrDpcDj
 6hvn7uLxmqx1CYfOuB3TT60BZbxUuVANKAzzZrYIiJICXGON8MEMAzR2A7q5IuE9jAVV
 oKwy/lzmsET7MbkEqEitXXM4m3TUuUkxJpUc6xgKm4m1OX6mAOfRQAdY2PnEdY105ulV
 2bQxPI5k5c9WMvNG9mwgPIMafAw9+fkmQ4pv62NEjjILpaFkYmpSm/ouna9I1vt+cRhc
 uPEw==
X-Gm-Message-State: AOAM532k96tMS2LLJ2jU3V5I58htrD+OT3gbt8bEvfn4c8zj6Qb0sVPm
 QVEhwuGmLwGfTrSM//DYSkE=
X-Google-Smtp-Source: ABdhPJyVcGsn9BfmX6lMFbKU1u49HpMjynWi/XDV0GRg9SB/A1h+SY8oRaMOm+QQs2KcIwEHTdVD7w==
X-Received: by 2002:ac8:5a01:: with SMTP id n1mr19342230qta.52.1604411106177; 
 Tue, 03 Nov 2020 05:45:06 -0800 (PST)
Received: from zhuyifei1999-ThinkPad-T480.gw.illinois.edu
 ([2620:0:e00:400f::31])
 by smtp.gmail.com with ESMTPSA id a206sm7356568qkb.64.2020.11.03.05.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 05:45:05 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp 0/8] seccomp: add bitmap cache support on remaining
 arches and report cache in procfs
Date: Tue,  3 Nov 2020 07:42:56 -0600
Message-Id: <cover.1604410035.git.yifeifz2@illinois.edu>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_084509_037859_1840B565 
X-CRM114-Status: GOOD (  12.42  )
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
would be appreciated. The series applies on top of Kees's for-next/seccomp
branch.

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
 arch/powerpc/include/asm/seccomp.h | 21 +++++++++++
 arch/riscv/include/asm/seccomp.h   | 10 +++++
 arch/s390/include/asm/seccomp.h    |  9 +++++
 arch/sh/include/asm/seccomp.h      | 10 +++++
 arch/xtensa/include/asm/Kbuild     |  1 -
 arch/xtensa/include/asm/seccomp.h  | 11 ++++++
 fs/proc/base.c                     |  6 +++
 include/linux/seccomp.h            |  7 ++++
 kernel/seccomp.c                   | 59 ++++++++++++++++++++++++++++++
 14 files changed, 181 insertions(+), 3 deletions(-)
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
