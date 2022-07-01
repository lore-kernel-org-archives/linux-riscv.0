Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DC7C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 12:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G3kKUEvgYGiAwVI6qSb90KaA4ZmazT4qacNnc2tL6ac=; b=OC6rPvLBGWvNfx
	QX8RwAKBya3WG0bDQSCxjqjR9fC6WSWWLlc8TpXjr5TdNjRAFrfzSxK0k8l5fIykwBNxq/6rVzbhE
	R8KUk2wEhlA4GKN54lNPuta/tQ1Y9Bvhw+VjG79FyGzL1jWHqj3jXtYFgBJq59d2qrTOIejLmoNti
	vaBGf4l6oYF9DfaQpZZ2/D+NW5niRBsS32mx2L7viHGIJ6VwolCGFv09zyfu3A62mS46mDUQsdINo
	p2VrtUWdu8AajR5mVvrhKJ6/phtQ2rW/suJn+AZcVG1+uCPVFcHnvlhjDFgT1zjFgc/hlrS3VcZ5P
	RmL9bJoCytFTw+wgTi9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7FRS-004g8I-Pm; Fri, 01 Jul 2022 12:08:10 +0000
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7FNs-004bIf-My
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 12:04:35 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R841e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046060;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0VI2LUmc_1656677062;
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VI2LUmc_1656677062)
          by smtp.aliyun-inc.com;
          Fri, 01 Jul 2022 20:04:23 +0800
From: Xianting Tian <xianting.tian@linux.alibaba.com>
To: palmer@dabbelt.com
Cc: guoren@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 0/3] RISC-V: three fixup and cleanups
Date: Fri,  1 Jul 2022 20:04:19 +0800
Message-Id: <20220701120422.228154-1-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_050428_990060_745A547F 
X-CRM114-Status: UNSURE (   1.76  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer and experts,
These 3 patches are some obviously fixup and cleanups, please have a look, thanks.

Xianting Tian (2):
    RISC-V: use __smp_processor_id() instead of smp_processor_id()    
    RISC-V: Fixup fast call of crash_kexec()

Guo Ren (1):
    riscv: atomic: Clean up unnecessary acquire and release definitions


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
