Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1002BC001DE
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 13:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tCB2UAPdZ8HztyFz6hcbXsVI5l3AAyu8wsGA6hQcKNo=; b=DTAPeJmXwbz3GA
	mUkxoVjEi2Rb5H29bx62WVoG/o/s/2Siv/mb0FnEAk6YKlIdEjef+/2/WW8knqAmzcVEWOU0ttBSW
	szN1WlEF8ONa+Hw516FQsYZPOF5TzdmY8cWxqmnV0Wo+IW3BmmLh10/zDbY3UZvAkX154K2OJosIc
	pVDnKWtQ4UGbxXS2U/dIu+h00vHFUgez+CrBYkAKUX8bD3Xy/5aPVxzR6TZbA+2mKh6qlpS02pNfl
	kFNRwyI1Wws8XMfnjkcPb3f2GsW0aD9rNBjqe/PQzFJMwaF+T4Ii+PW4hkmLFCpc9KXc/b/W9jq7a
	eLuMh4fAmmWmI60liSXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKfb4-008s5R-1l;
	Sat, 15 Jul 2023 13:46:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKfb1-008s4K-22
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 13:46:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7A1F160A48;
	Sat, 15 Jul 2023 13:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4836C433C7;
	Sat, 15 Jul 2023 13:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689428760;
	bh=q3/lU563XIc7l/7Z2Yw3lHNNvfkKn0JinKWbDxKVmso=;
	h=From:To:Cc:Subject:Date:From;
	b=b2xZq4nN1CppL9khriVnqpmsiHNeJRTXTF1PuBKU9mll18/A2WgoWV7gBGwF2E2pn
	 Q8MotO6Vbs8zcKWsIq3taYPpH2csKD//dUChWHKpRw+lrNAw3cG5fH3OHzGDjMBOcr
	 OM2NC+rG6GHVzwv8Mi+oX97ca9haFZheUED4cBAQdl/4F8BGunGMxyrG7E/Z4VOod4
	 rvTeNh/5+9lJ9PA6I5aQdNJF6J1uZBuFCB8h4bzJW4pgMT04bWp+AEodm/YGJ2cTQ0
	 pltG9vbma/1ywI9Io06hGHZ7fPbes3N4YuBGrKxFuDqzrD3za6icLusMWS3qr7/Wb3
	 waUggRQIRIlZw==
From: guoren@kernel.org
To: guoren@kernel.org,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	falcon@tinylab.org,
	bjorn@kernel.org,
	conor.dooley@microchip.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	stable@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 0/2] riscv: stack: Fixup independent softirq/irq stack for CONFIG_FRAME_POINTER=n
Date: Sat, 15 Jul 2023 09:45:50 -0400
Message-Id: <20230715134552.3437933-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_064603_714642_5D48FB76 
X-CRM114-Status: UNSURE (   8.51  )
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

The independent softirq/irq stack uses s0 to save & restore sp, but s0
would be corrupted when CONFIG_FRAME_POINTER=n. So add s0 in the clobber
list to fix the problem.

<+0>:     addi    sp,sp,-32
<+2>:     sd      s0,16(sp)
<+4>:     sd      s1,8(sp)
<+6>:     sd      ra,24(sp)
<+8>:     sd      s2,0(sp)
<+10>:    mv      s0,a0		--> compiler allocate s0 for a0 when CONFIG_FRAME_POINTER=n
<+12>:    jal     ra,0xffffffff800bc0ce <irqentry_enter>
<+16>:    ld      a5,56(tp) # 0x38
<+20>:    lui     a4,0x4
<+22>:    mv      s1,a0
<+24>:    xor     a5,a5,sp
<+28>:    bgeu    a5,a4,0xffffffff800bc092 <do_irq+88>
<+32>:    auipc   s2,0x5d
<+36>:    ld      s2,1118(s2) # 0xffffffff801194b8 <irq_stack_ptr>
<+40>:    add     s2,s2,a4
<+42>:    addi    sp,sp,-8
<+44>:    sd      ra,0(sp)
<+46>:    addi    sp,sp,-8
<+48>:    sd      s0,0(sp)
<+50>:    addi    s0,sp,16	--> our code clobber the s0
<+52>:    mv      sp,s2
<+54>:    mv      a0,s0		--> a0 got wrong value for handle_riscv_irq 
<+56>:    jal     ra,0xffffffff800bbb3a <handle_riscv_irq>

Guo Ren (2):
  riscv: stack: Fixup independent irq stack for CONFIG_FRAME_POINTER=n
  riscv: stack: Fixup independent softirq stack for
    CONFIG_FRAME_POINTER=n

 arch/riscv/kernel/irq.c   | 2 +-
 arch/riscv/kernel/traps.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
