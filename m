Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14918C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  6 May 2022 14:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kElDRchJtCFKwgL84knJHjr0+gjArcSmOuseGEwP7y8=; b=ewZSR/qmQRTVn2
	EGijeU0iBnVwzOtq1/yvkR0bdHJJ2mJB/gSuk/thEOgeQDnSgFAhGBcpT+QGLKs5YejtqJ+U9Cv9d
	curpWwpCDQPteLIyKve/E9leM83xtu/dZRFFAZhqEe8lfcjEmr+V9oNFmRJSW7wOzJ5Kz2ZKK6Nb6
	NBsEQMGb6sd/ALkcFRF6bSFM1S9AFZI6WgYI+//OcWorUMFqyDJGwIoVR2C2u1EXvQIk+NL0omRmY
	qQM6NCi8Gu/YOAnQ39gVsUvApPLekRbt/rfUs2Kzgf1lj7RYneWXA7BF4qYPqNhSiqWjn1tJDdTAA
	+EVZNnab/VUjd+b4RrwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmzBs-003rKV-0f; Fri, 06 May 2022 14:44:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmzBM-003r8a-NV; Fri, 06 May 2022 14:43:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6AD926216E;
 Fri,  6 May 2022 14:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C16C385A8;
 Fri,  6 May 2022 14:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651848224;
 bh=/+E4zkAHTg5lrUX9NnLf09jIMb1ixSmWqAap21j4v/g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PNjBYjv6PWJuNxmM1HV1vyAMCzN+ZuknCdI/kJ26bPjErTPEivW+fs806ClyOvW/p
 B6QSQnyXxRkwWiDuX+873mfQNZAS/g4U9kdMSWn1PgDFhEjPaCsIX/KwyQTe4T92hP
 bo2dWL9s+pOCMXLKse40IX2ep124N5vhMmNo+ecQ0mXZIOAjTNPnNp1jWIgUus2ZYG
 +w/XJVgMUfBowHGPdKpg+J+bBh0KkJ2xv801kmK22p7U1kX1qDyf4tA6TWD4BzdI/Y
 Y7nHYINGTRMSSvBH/nmnNoj9n2kwqnve7L3LlWjvzE9eMwGmenVT0urMa1fDbB2bX5
 X3sHmWQCASzYg==
From: Will Deacon <will@kernel.org>
To: Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-riscv@lists.infradead.org
Cc: catalin.marinas@arm.com, kernel-team@android.com,
 Will Deacon <will@kernel.org>, anup@brainfault.org,
 kernel test robot <lkp@intel.com>, atishp@atishpatra.org,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-arm-kernel@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 mark.rutland@arm.com
Subject: Re: [PATCH] perf: RISC-V: Remove non-kernel-doc ** comments
Date: Fri,  6 May 2022 15:43:30 +0100
Message-Id: <165184132370.732903.14576685532828749182.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220322220147.11407-1-palmer@rivosinc.com>
References: <20220322220147.11407-1-palmer@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_074348_859785_DA4BF774 
X-CRM114-Status: UNSURE (   8.90  )
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

On Tue, 22 Mar 2022 15:01:47 -0700, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> This will presumably trip up some tools that try to parse the comments
> as kernel doc when they're not.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 4905ec2fb7e6 ("RISC-V: Add sscofpmf extension support")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] perf: RISC-V: Remove non-kernel-doc ** comments
      https://git.kernel.org/will/c/c7a9dcea8e98

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
