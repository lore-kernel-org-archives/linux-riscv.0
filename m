Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7D3C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 01:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yI9z+bKgBncWT16BGBaiRJIW/RzeCHlG7VgwWye1wNA=; b=p0jzNqb8UX1aF6
	LxApi49TVko/27ZnNDNmXg+DOrkqHzFWLyXQAFRRiMLKkKPttnkrQgFAOMikO3Z2uzpJJ83N25iPJ
	h1d7aE/yzi69knQpGkvUF8KeOW0A5TXfCLNY3A9E2DB310de2MvQLN6qolt3WCMd5DzBjQZcEYwmO
	80kiGDuAHZv/MkDRIpXb6ZeMdC6VHkqrpbtzN/M5Ct8RcImlgU8vHHJsFsTuhaxZOOPdbEX8Pbu6j
	yQl+ube042XbqMQ5KKgEpUg10osfcct6qMGiaasj5TICD6yenay8IaDJjheuLzAEGH1WWsiDmxmnN
	AUms46Ih29v/gY1IugNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntg6D-009dle-Bo; Wed, 25 May 2022 01:46:09 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntg6A-009djU-8N
 for linux-riscv@lists.infradead.org; Wed, 25 May 2022 01:46:07 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L7DQl73cfzjX5W;
 Wed, 25 May 2022 09:45:03 +0800 (CST)
Received: from huawei.com (10.67.174.53) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 25 May
 2022 09:46:02 +0800
From: Liao Chang <liaochang1@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
 <mhiramat@kernel.org>, <rostedt@goodmis.org>, <peterz@infradead.org>,
 <naveen.n.rao@linux.vnet.ibm.com>, <jszhang@kernel.org>, <guoren@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] riscv/kprobe: reclaim insn_slot on kprobe unregistration
Date: Wed, 25 May 2022 09:44:24 +0800
Message-ID: <20220525014424.20717-1-liaochang1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.53]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_184606_506596_46602DB3 
X-CRM114-Status: UNSURE (   7.23  )
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

On kprobe registration kernel allocate one insn_slot for new kprobe,
but it forget to reclaim the insn_slot on unregistration, leading to a
potential leakage.

Reported-by: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Signed-off-by: Liao Chang <liaochang1@huawei.com>
---
v2:
  Add Reported-by tag

 arch/riscv/kernel/probes/kprobes.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index e6e950b7cf32..f12eb1fbb52c 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -110,6 +110,10 @@ void __kprobes arch_disarm_kprobe(struct kprobe *p)
 
 void __kprobes arch_remove_kprobe(struct kprobe *p)
 {
+	if (p->ainsn.api.insn) {
+		free_insn_slot(p->ainsn.api.insn, 0);
+		p->ainsn.api.insn = NULL;
+	}
 }
 
 static void __kprobes save_previous_kprobe(struct kprobe_ctlblk *kcb)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
