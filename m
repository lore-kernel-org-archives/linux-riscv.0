Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E442AEEF317
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 08:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tO68nIoS+t61DpYE1UaSOKb4IOcub3OF7klukGedq8M=; b=dCJawR6hT7Sxbq
	UAKfHT31qqJ+bsOxneyKDH2gauDlxJuao+8E/mir7qbY3WNu0uqSfUmt8a+2zyZV0g9Z8p5p+R2gV
	NuC7tDMQwJC2L9PcsEfMhlT+948vI+6mYCXACM0eNbWW98pz2wnOJ3pfMv3Pea+lTBalBmk5fR+Qc
	9BHGa03joPiH5Rv06HN7X3/NI6AfKMp+WZ/WdR/xNBdpBTi2BcNXx8fQQ1CaN3UuFO8uoO9pulovw
	YdKOcGN/Yck1NOHAhSdiAiA+xfSNinGus6ngrRJ0nyc2iPpakrlQN4G6Qn2ldqnf7b+dk1C5A4yLn
	wz6DTsW76PLTF0DnsnYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3oT-000000019nQ-3VoQ;
	Thu, 05 Mar 2026 08:12:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3oS-000000019ky-2PMY
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 08:12:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E5C0361420;
	Thu,  5 Mar 2026 08:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64A63C19425;
	Thu,  5 Mar 2026 08:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772698322;
	bh=gYM2Zj2ofG3LWdNS0SxvUK4DdqDG+3smhyDoKNXighU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fVuKZbpR/SCWli137GX2i1vqFhCVAFrCn31/b6lVfrjRBkhvqNORr7TSMUvRCiPtz
	 dvgJKvqkRSfWDTKYpsrWJoBqvVyMrUcOJCXY40zQFjuCePPtu/p8MyOE3jMyXjITEv
	 bqR5aswsyyDvPmVm9iGHwIC6UoZGYLSciOW6aYFBDk+y5KK6UC+JwYf3nZJ0QuWTUz
	 7h0navUAQ/ElIUaqyuHitZ8+cRYkeOPdalZF/tgdFgcma9icX8scYEJG/IdYC+5ZKP
	 v786cD/hh0Q6X0r1WV3RFwjafKVypMZpzv6kYdCqFqLCMVTpSRSzs4h/lYKEM1L/aZ
	 fWq8EB2t2RQBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A46EEF31D;
	Thu,  5 Mar 2026 08:12:02 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Subject: [PATCH 0/4] selftests: riscv: Fix compilation issues for v_ptrace
 and cfi
Date: Thu, 05 Mar 2026 00:11:28 -0800
Message-Id: <20260305-fix_selftests-v1-0-61b62d23500b@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALA6qWkC/x2MQQqAIBAAvxJ7TrAUg74SEWZrLUSFGxGIf2/pO
 DAzGRgTIUNfZUj4ENN5CDR1BWHzx4qKFmFodeu00VZFeifGPd7IN6tgovZo3WxCB9JcCUX4f8N
 YygelWIRYXwAAAA==
X-Change-ID: 20260304-fix_selftests-c3f0ae46b3c7
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
 Deepak Gupta <debug@rivosinc.com>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772698321; l=1099;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=gYM2Zj2ofG3LWdNS0SxvUK4DdqDG+3smhyDoKNXighU=;
 b=PbA6bULCrfF3E9C1MjDTVunh/nq3HMlB3jQAKG6i4ttiSAMfLj/Rauj0VuimmTEQnPJFN3VpG
 97DuiccqnPPBnFsyIt8UxxrkDrSyMa9qDznl0T9GHYkNCkMMkf6Zi3k
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/2026030
 with auth_id=663
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
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
Reply-To: thecharlesjenkins@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

There are a couple of compilation issues of the riscv selftests.
Coincidentally two of the issues are independent problems with not
including the header that includes the BIT() macro and the other issue
is from checkpatch incorrectly suggesting to remove non-redundant
braces.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
Charlie Jenkins (4):
      selftests: riscv: Add definition of BIT() macro
      selftests: riscv: Add braces around EXPECT_EQ()
      riscv: ptrace: Fix BIT() compilation issues
      selftests: riscv: Add license to cfi selftest

 arch/riscv/include/uapi/asm/ptrace.h                     |  1 +
 tools/testing/selftests/riscv/cfi/Makefile               |  2 ++
 tools/testing/selftests/riscv/vector/Makefile            |  2 ++
 tools/testing/selftests/riscv/vector/validate_v_ptrace.c | 16 ++++++++++------
 4 files changed, 15 insertions(+), 6 deletions(-)
---
base-commit: c107785c7e8dbabd1c18301a1c362544b5786282
change-id: 20260304-fix_selftests-c3f0ae46b3c7

Best regards,
-- 
Charlie Jenkins <thecharlesjenkins@gmail.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
