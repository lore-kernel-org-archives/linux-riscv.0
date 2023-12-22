Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9E3C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 11:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EALuQATyS80hr/uCeCT13M+2Hg7nbHZ6yI01KRFedmM=; b=CWBv0qNn5DMCUl
	ArnLNMgIr6sqSVTHWfN1TIS6h4Sau//U2U5D3Kfvp5rBIeFcfh4nUI13s1Bp+MOcI7+/zLKQEpVgQ
	rPlMtwBMQ4hfrN2RUMG3g4PFymJFx87HayYl1sIaxN+FwLWU56j4bg63g8mDOBku4UKv1VdXovpqD
	P8hH5hcez8ammjGv/NFnRt+Su3puHTXhEiXYaVtv6UExmVzot1EyHeCxgUPj/j4m5O3KBGaS1Gj4I
	SBHUQavZRFhwf2qk+Q/3RNSZeDjCgiPpyoCFykWI0NUTa8Wa7EO+Wy83ukXxKOvoxJC+f1ty8o3LI
	ji9ibTNS0fLIxbgB8U4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGe9U-005sDK-19;
	Fri, 22 Dec 2023 11:57:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGe9R-005sCf-0L
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 11:57:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4FD6ACE1DD5;
	Fri, 22 Dec 2023 11:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D50EEC433C8;
	Fri, 22 Dec 2023 11:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246230;
	bh=5kuuzvzsTLj+b569PmL/dnbV7dULNml61yAjeVKDzIQ=;
	h=From:To:Cc:Subject:Date:From;
	b=hgCgP9HkXEwZHkP1Pup6spJ03f0E19AJjTl5UpglvdkcM6BudaR5a++14mPhrrPab
	 bk6qY6HzJK8JOg5GwVC06aXwEs2fZ25n95/SGPU1unTT7pmrV55NsPiJKHu+P3Nxrs
	 bqgyvBQw0nB8YE2jBMRJhowZsHX81LYW8b+wFt6ekZZk1f+YAlJ+XftF73RydTD3zc
	 FcOGamCgjiFglkfTQkT/NopwYvyv2iw0ixFlejMTDAD8uo9KuJgbNegmBVlxQuwIIT
	 ne/rCC5KPrwdcaQR3junEXDD41vUxKRJXMHUGWZzHVNe5mmHN37P5jT3MJlZN9j59d
	 0DbttuZ/gAIqw==
From: guoren@kernel.org
To: linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alexghiti@rivosinc.com,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	guoren@kernel.org,
	david@redhat.com,
	panqinglin2020@iscas.ac.cn,
	rick.p.edgecombe@intel.com,
	willy@infradead.org,
	bjorn@rivosinc.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	leobras@redhat.com
Cc: linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V3 0/4] riscv: mm: Fixup & Optimize COMPAT code
Date: Fri, 22 Dec 2023 06:56:59 -0500
Message-Id: <20231222115703.2404036-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_035713_320242_AC7196C0 
X-CRM114-Status: UNSURE (   7.24  )
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

From: Guo Ren <guoren@linux.alibaba.com>

When the task is in COMPAT mode, the TASK_SIZE should be 2GB, so
STACK_TOP_MAX and arch_get_mmap_end must be limited to 2 GB. This series
fixes the problem made by commit: add2cc6b6515 ("RISC-V: mm: Restrict
address space for sv39,sv48,sv57") and optimizes the related coding
convention of TASK_SIZE.

Changelog:
v3:
 - Remove wrong modification of arch_get_mmap_end
 - Remove is_compat_task optimization
 - Update comment log

v2:
https://lore.kernel.org/linux-riscv/20231221154702.2267684-1-guoren@kernel.org/
 - Separate rename from fixup
 - Add STACK_TOP_MAX fixup for compat
 - Add Cleanup & rename patches

v1:
https://lore.kernel.org/linux-riscv/20231219111701.1886903-1-guoren@kernel.org/

Guo Ren (4):
  riscv: mm: Fixup compat mode boot failure
  riscv: mm: Fixup compat arch_get_mmap_end
  riscv: mm: Remove unused TASK_SIZE_MIN
  riscv: mm: Optimize TASK_SIZE definition

 arch/riscv/include/asm/pgtable.h   | 7 +++----
 arch/riscv/include/asm/processor.h | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
