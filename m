Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E59BC35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 15:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Tj69ApwbsTwSOduKpNFDaNvVjRk6H/0w1YKQ9ZY+txg=; b=S/XnfrqoDmMBnZ
	Y1/Yv8LeA8fTl1BPc6WMW1cpFNyhcsOyxfVcXe37lKjijWoF9qxDkcIDcY9xTImtheJ95oowctSp/
	K5KKTPCm0aPCaAP1voYQb8iTztjm5rpa69qrSCajTGdFixyOnjIO0umV7oyXrzyfDTaBCCjU5ccUN
	x1MPkQJVvRIc1S2JQHkfUHz46Ckz9Lu0UmCMqnveAP435uClum//5MCKTaOa7jWBq3UsWhfscchVE
	wwobHrUYfknZlmpk1L5dIyvbx5oxZvU+AufvlHmaP0H/N0HqpVsWgWXCrKLrKDMmHaeHQR4zsSK40
	5sR0WkEZVl/LiG8gictA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGLGT-003PRk-3A;
	Thu, 21 Dec 2023 15:47:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGLGS-003PR4-06
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 15:47:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DDF76619AC;
	Thu, 21 Dec 2023 15:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51CF0C433C8;
	Thu, 21 Dec 2023 15:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703173630;
	bh=kiqcXfXL35XMTeW6LgSFV5UBR45DHKjf0aHb7WV1Q6o=;
	h=From:To:Cc:Subject:Date:From;
	b=VrvCX2NRzdN56Vj6vo6B2owEq0363n04aNvjwwnCDzGzAwP8C+WlYYEAG/YbPxFYc
	 X9q0XurKsMmHBVFyXRtadePJJoRivLqTBgfiZGPCkiM1ByqZbFYi84FbeUlIBdd5ya
	 pIBVPuyfrZKqxUTH61mHbux0ojhnBR3oowvTfilT9EUNm6EEG7JrWrMNTYGsRXydOS
	 KJb+/QUX1wz04E5XjTEOB7bRQ9wowlmjjzxpiuFnvvTUadPEsFeXTsdXyiZVxuftOx
	 2KZry1dmY59wIrVGh1jY5rRbi1Dl8fVj+ES2RmLwjP5TXwxa/+LRRZ3EOxFIubJiLE
	 DSz5aN2+eY0Gg==
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
Subject: [PATCH V2 0/4] riscv: mm: Fixup & Optimize COMPAT code 
Date: Thu, 21 Dec 2023 10:46:57 -0500
Message-Id: <20231221154702.2267684-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_074712_131006_C185A771 
X-CRM114-Status: UNSURE (   6.06  )
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
v2:
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

 arch/riscv/include/asm/pgtable.h   | 9 ++++-----
 arch/riscv/include/asm/processor.h | 6 ++----
 2 files changed, 6 insertions(+), 9 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
