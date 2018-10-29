Return-Path: <SRS0=N0YM=NJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA993C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Oct 2018 11:04:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64E3C2080A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Oct 2018 11:04:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GuNNkh1T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sVxZHx3a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ab7KCGrX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64E3C2080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=fodd4qJlMqLMFGt4yOgSTeb7lxP3KvQ7fGmNbzr2+ns=; b=GuN
	Nkh1TJI1k8LulyXlMePYAx+6z3LAN+XhfCKytSeMRJ61IxXhW0K2Sslw5ofeSvSDY+3ng2AbTe01Q
	h8yvyL9FGe72UeFU1xhxDNxELoS+WNefBJYAUrKTBJBqcql9qe4bKSGBDZio3apKrMn5HO2TzA0GV
	8kMl61E2mAFptqcfv6zzlm4qTheKgN7mL0ZcYbQzCQ+/gLTUDczYuzvAkNYdATzhVb6r4k9NaoTA4
	xtEfgPL1xEN0vqtMaAf8vpWmaYCZA4Km0EyEvORKonCesCpylh01N08lcfYvaPjdwmP/lqMSYUAfN
	RWaUKFiWMStrJ1yurmIJYo65K6VTkNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gH5Kw-0002SX-8K; Mon, 29 Oct 2018 11:03:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gH5Ku-0002KE-9X
 for linux-riscv@bombadil.infradead.org; Mon, 29 Oct 2018 11:03:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VxaIDmDKvxD8zCA2Wo/jH/VQ0KsaOQA2tHEfNNJ/B98=; b=sVxZHx3aPBoNFe7YRk8i4iLmb
 PJtVaXPv8EnStaeKYYjp5TU4E4ESzLSL1CmYC+GZnrmvHwcQ2okeTIeUXDqOxYnUZRboZDnfppfbM
 9m4ds2ItYFQJIEe9i9joexOsT6GpJa0AfF7mfv9DiQUoeOHCEX9CEjmUHLrmFZT57R9hrZQhDCBCC
 yUPY1pNUplhVDpQlTFFKAolUronlrKSaR9Wbn6FK1X5oZ3Q0lnXTVSiyTXzEUyvzqsztYWpLGkDT1
 Ekl9LrD0PP2ZAQ8glynOqLfTsSY35LiPzbK46+xUKjaFeiA1XUI7hdkv/oEbxVtTduBpqhFgkxVFY
 HGXgX+Iuw==;
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gH56s-0004ej-VY
 for linux-riscv@lists.infradead.org; Mon, 29 Oct 2018 10:49:28 +0000
Received: by mail-wm1-x341.google.com with SMTP id a8-v6so7434531wmf.1
 for <linux-riscv@lists.infradead.org>; Mon, 29 Oct 2018 03:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=VxaIDmDKvxD8zCA2Wo/jH/VQ0KsaOQA2tHEfNNJ/B98=;
 b=ab7KCGrXY0SNzGLsTBF5QA6SsWR7BsSAeq8Q2qgfilrIpG6kG8LXidEmQCYkp6eqKv
 ZSlcqn8bDU4YSr4eP7sx0a/E/YEf4xjGQd4oEuHtkxpDnnHk2FDp+fUDn7yWnqpQ/nPY
 mJ1/WjlAsh32F0aBJjRa/tfUGkdJ+UWkzV3njgUcLEosuGQff8Qsmhfb7vK74gO3OsZl
 SYoBdidjXjzDBjCXl6BDrkzn1q60gLhjX+oIt9ohDskLTaZWDi28bp3Gfx/WN9FRD99H
 rH6jnzVL5Gvdr3M4djCnBqP5JskMccvkWMy0HwfaiZIQi3VH1G5vfN623/sydmhdxCpW
 CBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=VxaIDmDKvxD8zCA2Wo/jH/VQ0KsaOQA2tHEfNNJ/B98=;
 b=tTysby+8vHMuv7iKkVb0kqabxID5AsWX2UABD0isuHMSKVzVZjeYm63+qrfmVN5hIg
 MtJqHVgaOca8F4cJJTIpd2S1ZolmvG+1jUdT1voSTf0Es2UqPcMO7p9mL07YYlPpa70y
 zoMQq/Oa05L20HQFHbAxy2cX94azZto3M+irfyBnpq9oJk2gGeLxJwwcSgoPMhR9c1H7
 zu6pYLBcMUlPKB2rBlj17meqhHAcLfZFwt3YDO3QBVklO1QaJl25u4BDdLmSkmAIP5x2
 XWShtXWbPTXeAAaVOZN/Gv3g4i059I9+TC2uduenPfVmFY0CuIJ0dVgwTycOVxcot7XO
 6Mpw==
X-Gm-Message-State: AGRZ1gJWQJ1ubCr78QztmRx9O/PTdEFaueQiq/Xw0yF7V4heis4yXNsM
 UeNiLl2tAuF+x3Au0HtPYCU=
X-Google-Smtp-Source: AJdET5ffCOZUi1i7jn75YGuW7Ap+v1xwv6E7UlC8mMt2ckkjWo402h3XC0g7E/6xXYo4IcdClLFq6w==
X-Received: by 2002:a1c:770a:: with SMTP id
 t10-v6mr1732171wmi.149.1540810155060; 
 Mon, 29 Oct 2018 03:49:15 -0700 (PDT)
Received: from localhost.localdomain (ip-76.net-89-3-178.rev.numericable.fr.
 [89.3.178.76])
 by smtp.gmail.com with ESMTPSA id l70-v6sm36360609wma.0.2018.10.29.03.49.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Oct 2018 03:49:14 -0700 (PDT)
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-audit@redhat.com
Subject: [PATCH 0/2] riscv: add audit support
Date: Mon, 29 Oct 2018 11:48:52 +0100
Message-Id: <20181029104854.17432-1-david.abdurachmanov@gmail.com>
X-Mailer: git-send-email 2.17.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181029_104927_157429_A0739893 
X-CRM114-Status: GOOD (  11.44  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: David Abdurachmanov <david.abdurachmanov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181029104852.gprDFTngsKXZR7TAaon-tEVOxn3sEI8tjHwt3MRSg3I@z>

This patchset adds system call audit support on riscv (riscv32 &
riscv64).

The pachset was prepared on top of v4.19 tag.

audit-userspace changes were submitted. See:
https://github.com/linux-audit/audit-userspace/pull/73

Tested the following manually:
- auditctl (checked several different example rules from internet)
- aulast
- aulastlog
- ausearch
- ausyscall
- aureport
- autrace (compared some syscalls to strace: order and return 
  value/input arguments seem to be correct)
- /proc/self/loginuid (required by DNF [package manager])

I looked into audit-testsuite and with some adjustments results are:

Failed 4/14 test programs. 19/88 subtests failed.

The failing tests were due to missing CONFIG_IP_NF_MANGLE, 'id -Z' not 
printing categories (don't know why), not having loadable kernel module
support enablled and syscall_socketcall not being relevant for new arches.

audit-testsuite with adjustments:
https://github.com/davidlt/audit-testsuite/tree/riscv64

Depends on:
[PATCH 1/2] Move EM_RISCV into elf-em.h
http://lists.infradead.org/pipermail/linux-riscv/2018-October/001885.html

This should solve DNF issues in Fedora 29/RISCV.

David Abdurachmanov (2):
  riscv: add audit support
  riscv: audit: add audit hook in do_syscall_trace_enter/exit()

 arch/riscv/Kconfig                   |  1 +
 arch/riscv/include/asm/ptrace.h      |  5 +++++
 arch/riscv/include/asm/syscall.h     | 10 ++++++++++
 arch/riscv/include/asm/thread_info.h |  6 ++++++
 arch/riscv/kernel/entry.S            |  4 ++--
 arch/riscv/kernel/ptrace.c           |  5 +++++
 include/uapi/linux/audit.h           |  2 ++
 7 files changed, 31 insertions(+), 2 deletions(-)

-- 
2.17.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
