Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF63C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 21 May 2022 14:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=izAhrXDkYyanDvGelJB5LupWgYGRa6j4042GSmhSIPI=; b=RoYxnk8aRSgL3D
	k06Nw6LJSz8yeazx7fw/+ioSwIpgDLC9U/xXkV7MpBa3NGugnpAGiBaT+u5jtR8t2NullM1rNKdHg
	oU8ZhYxPyPIszIY6j8JoQ9vjCuuxjYkdn/fGxQ3/9sNsVI4O9Cr/iDaaamFhz5uSxKRwxqf73FkOh
	TImOjYWhoPKFmeahDswiLZUJhyjFNFX25QEz15XKKsg7kD6OFPJMgmSihmBT33THhlbI9vTITCn4h
	lZFtptLV1ZwfppoYK2TZkUAcR2HufbQh/mj3cPDLgpV0C9Az7DOef8cY/1n0AxP0VEMPQnZzeiDDM
	44tioXWFZgYfnCKYJKog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsQKS-00Gneb-SR; Sat, 21 May 2022 14:43:40 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsQKQ-00Gndj-78
 for linux-riscv@lists.infradead.org; Sat, 21 May 2022 14:43:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D1935B80683;
 Sat, 21 May 2022 14:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C66C385A5;
 Sat, 21 May 2022 14:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653144214;
 bh=kp04KzMieJ18XnexXdu5LUhR570BkXGpoAN8ftuQXLE=;
 h=From:To:Cc:Subject:Date:From;
 b=hxUufeXed/8BibFRMvPVuPNVWZhCW0hg/ec2BAnCRLe8rg/v+CydDZ3sNuJwTNMe8
 TrW1+88mkRmWmjFCnkzddmXjx5XJxp6xI1rYIfu1VkzJ6KAP5zYjK6vbH/bS1MHgKL
 uQ++qTMc8bIQ9O1mssvGQPMpLP9fJ0opWXJ9eWxutBE2wYs3SPA5CUKoIKTGW1B3b9
 aryukQDd1malgAT7jOC5fFvcz+lktKplPzTSGLgXgDwYT6h3m5RS34vmvl5+fsHloV
 msJojy5klTTRAz6C7BPR9NifW5tfkKh1Qzj/niVVWlHNGmGqDSGa/N8pc2xNM75ixo
 vdRPd67ynivRw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com
Subject: [PATCH v4 0/2] use static key to optimize pgtable_l4_enabled
Date: Sat, 21 May 2022 22:34:54 +0800
Message-Id: <20220521143456.2759-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220521_074338_475935_C472F2D4 
X-CRM114-Status: GOOD (  11.64  )
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

The pgtable_l4|[l5]_enabled check sits at hot code path, performance
is impacted a lot. Since pgtable_l4|[l5]_enabled isn't changed after
boot, so static key can be used to solve the performance issue[1].

An unified way static key was introduced in [2], but it only targets
riscv isa extension. We dunno whether SV48 and SV57 will be considered
as isa extension, so the unified solution isn't used for
pgtable_l4[l5]_enabled now.

patch1 fixes a NULL pointer deference if static key is used a bit earlier.
patch2 uses the static key to optimize pgtable_l4|[l5]_enabled.

[1] http://lists.infradead.org/pipermail/linux-riscv/2021-December/011164.html
[2] https://lore.kernel.org/linux-riscv/20220517184453.3558-1-jszhang@kernel.org/T/#t

Since v3:
 - fix W=1 call to undeclared function 'static_branch_likely' error

Since v2:
 - move the W=1 warning fix to a separate patch
 - move the unified way to use static key to a new patch series.

Since v1:
 - Add a W=1 warning fix
 - Fix W=1 error
 - Based on v5.18-rcN, since SV57 support is added, so convert
   pgtable_l5_enabled as well.



Jisheng Zhang (2):
  riscv: move sbi_init() earlier before jump_label_init()
  riscv: turn pgtable_l4|[l5]_enabled to static key for RV64

 arch/riscv/include/asm/pgalloc.h    | 16 ++++----
 arch/riscv/include/asm/pgtable-32.h |  3 ++
 arch/riscv/include/asm/pgtable-64.h | 60 ++++++++++++++++++---------
 arch/riscv/include/asm/pgtable.h    |  5 +--
 arch/riscv/kernel/cpu.c             |  4 +-
 arch/riscv/kernel/setup.c           |  2 +-
 arch/riscv/mm/init.c                | 64 ++++++++++++++++++-----------
 arch/riscv/mm/kasan_init.c          | 16 ++++----
 8 files changed, 104 insertions(+), 66 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
