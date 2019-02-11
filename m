Return-Path: <SRS0=4uv/=QS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D006C282D7
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 04:38:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEA0320855
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 04:38:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M0OVgtQd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mac.com header.i=@mac.com header.b="rGMei3q7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEA0320855
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mac.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=bZogTyYKGRMM/rkrOW8rdf/eD8OIvjMTnFC4wdwgnfo=; b=M0O
	VgtQdc/mrwFVfqGmsFwem8nRhMetRHeiFSF7d6GLFPwFd/d2xpKrs2hSDCoklBkKM7EE8QfssSv8n
	xHCvGP5HNPCF9lnrc+01RY/cRb0G0hAURJD/mFzjM2Qs+qRZ5MYFm2D3bBTCiv6QXedKGAPWccyDx
	h0mOWeO1E8y1sXeSI/RxtW0otACVYmaUqJocCJZVtYNmIlhXgNuVKxMYpOFpz7zhlTfAMKtahex3+
	Kh2+rN/8/q8TSHoYDjDWoYmqKw1KyD2y8gX+P+kFwnU+MdcdLBKWnBE5aTcDbU6z2cqeNgV98aZB3
	90QZtxFGvRg53dP0njlq2D+HlS3akXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gt3Mv-00016T-Hj; Mon, 11 Feb 2019 04:38:57 +0000
Received: from mr85p00im-hyfv06011401.me.com ([17.58.23.191])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gt3Mp-00014G-PD
 for linux-riscv@lists.infradead.org; Mon, 11 Feb 2019 04:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=04042017;
 t=1549859927; bh=4PeZSES5DnOzXKxHpMPCm6sy5ZTlQmk+9r2NMINk14o=;
 h=From:To:Subject:Date:Message-Id;
 b=rGMei3q7EDXANo4Obn30Oo7K627eFEm+Ct8eLj5f07t9KTZbglViX63nPYU5PafCQ
 tKMRbvusH8sj1cK5eTWh8RY8GUcvtRwvr+MjAytTuLrP3hsYUQzptUN95i6fyUv4Xb
 xWiw21ED1AE+u+mXwO9/wPLwf6/CAcvnCfJLbfKC5rdONkUMWQkDifavjaYcnoruYh
 MCpSiSFpO6hgRf6JzjrJQrkZvNdMQiUbQ9BsTsux8StFffXVhdp4jd49D73tuaUpR3
 N6JOdDMCM7AfyVwbPPFzasjZkCXq0dp04P5l58/IdOzaPPD5p7zTwYEsMmCkqnUUQS
 UqLBsygroIkAA==
Received: from localhost.localdomain (125-237-34-254-fibre.sparkbb.co.nz
 [125.237.34.254])
 by mr85p00im-hyfv06011401.me.com (Postfix) with ESMTPSA id 483A7D20097;
 Mon, 11 Feb 2019 04:38:46 +0000 (UTC)
From: Michael Clark <michaeljclark@mac.com>
To: Linux RISC-V <linux-riscv@lists.infradead.org>
Subject: [PATCH 0/3] RISC-V: use generic spinlock and rwlock
Date: Mon, 11 Feb 2019 17:38:26 +1300
Message-Id: <20190211043829.30096-1-michaeljclark@mac.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-11_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=612 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1812120000 definitions=main-1902110035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190210_203851_846182_B5BF30EC 
X-CRM114-Status: GOOD (  13.35  )
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
Cc: RISC-V Patches <patches@groups.riscv.org>,
 Linux MIPS <linux-mips@linux-mips.org>, Michael Clark <michaeljclark@mac.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Use fair spinlocks and rwlocks on RISC-V.

Investigated use of ticket spinlocks for RISC-V so that we have fair
spinlocks under contention. After making generic changes, found that
queue spinlocks require atomic operations on small words (RISC-V only
supports LR/SC on 32-bit or 64-bit words); so this series borrows
support for small word atomics from the MIPS port, updates the RISC-V
port to use the generic spinlocks and rwlocks, and finally fixes a bug
found during visual inspection of the MIPS small word atomics support. 

The queue spinlocks and rwlocks are in asm-generic, so this series 
reduces platform specific code in the RISC-V port, besides adding small
word atomics support, which expands generic support for atomics and is
presumably useful elsewhere.

The patch series has been tested successfully with SMP in RISC-V QEMU
using the riscv-linux-4.20 branch: https://github.com/riscv/riscv-linux
and applies cleanly to torvalds/master.

Note: acquire or release semantics are passed through to the underlying
cmpxchg implementation for the minimum atomic operation word size (32b).
The aligned larger word load used to fetch and mask the previous value
of the word surrounding the small word for the atomic operation, is
performed relaxed before the larger word atomic cmpxchg operation. One
assumes the MIPS code has been battle tested however the RISC-V Linux
memory model has additional ordering constraints for acquire/release.

_relaxed_: the aligned large word load is relaxed, so this is okay.

_acquire_: the aligned large word load is encompassed by "fence r,rw"
acquire barrier _following_ the compare and swap operation, thus is
correctly before the acquire barrier, and locally is a syntactic
dependency for the compare and swap operation thus is correctly ordered.

_release_: the aligned large word load occurs before the "fence rw,w"
_preceeding_ the compare and swap, thus it is technically a load
before write barrier, and the fence implies additional ordering of
the load before the compare and swap. This adds additional ordering
for the first loop iteration. It is a load, and a depdendent load and
thus does not require any additional ordering. In this case, ordering
could be relaxed by performed the aligned large word load after the
barrier preceeding the compare and swap, however, this would require a
special variant of the cmpxchg asm. The operation is not invalid, rather
the release fence adds additional explicit ordering for the aligned
large word load that is technically not required. This may show up as
an additional LR/SC loop iteration under contention due to non optimal
fence placement.

QEMU on x86 is not representative of real hardware and is likely more
tolerant than weakly ordered hardware. Further testing is advised,
ideally on real hardware or an agressive OoO simulator that has been
verified against the RISC-V Memory Model.

Michael Clark (3):
  RISC-V: implement xchg_small and cmpxchg_small for char and short
  RISC-V: convert custom spinlock/rwlock to generic qspinlock/qrwlock
  MIPS: fix truncation in __cmpxchg_small for short values

 arch/mips/kernel/cmpxchg.c              |   2 +-
 arch/riscv/Kconfig                      |   2 +
 arch/riscv/include/asm/cmpxchg.h        |  54 +++++++++
 arch/riscv/include/asm/mcs_spinlock.h   |   7 ++
 arch/riscv/include/asm/qrwlock.h        |   8 ++
 arch/riscv/include/asm/qspinlock.h      |   8 ++
 arch/riscv/include/asm/spinlock.h       | 141 +-----------------------
 arch/riscv/include/asm/spinlock_types.h |  33 +-----
 arch/riscv/kernel/Makefile              |   1 +
 arch/riscv/kernel/cmpxchg.c             | 118 ++++++++++++++++++++
 10 files changed, 206 insertions(+), 168 deletions(-)
 create mode 100644 arch/riscv/include/asm/mcs_spinlock.h
 create mode 100644 arch/riscv/include/asm/qrwlock.h
 create mode 100644 arch/riscv/include/asm/qspinlock.h
 create mode 100644 arch/riscv/kernel/cmpxchg.c

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
