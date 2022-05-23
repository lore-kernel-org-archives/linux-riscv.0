Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748C8C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 23 May 2022 08:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Rl+PJT7R+A82wKz32o4LSQk/a+dTD+71NglcbWFMcR8=; b=IKu9LMrBYO77st
	DT09WmJ4oYgi2QYuEvuhcCESH+c4cbjsIVtaL3LLZ6C7D1xxLTGRjPGVrSyWicUJfK6Ut8I0QSer7
	LOYMEOq9K5Xp30vxqPkrqGguIuFr3gvRVTQ0MgoJq2DDGy08L+aKh7Qmq2QXvUhjfVhUIP0KjuZ1I
	+vwbSC5/rq4B4jRdubtC1Ey5rXXr/mARBodU837qcDfhLlTODsOsA1zERSPG0/8UHilGFrpjMCbj5
	IeBV5CkVewONYGMKAdGJGhZnc0SzC6naUfvv4ZlCqZ5YK7MLjDPvjFncLgA7BbClEejx8bcJzLLv9
	0Fh2SRhQSOlymIcS59Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt3Mt-002Pcr-IH; Mon, 23 May 2022 08:24:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2td-002CKb-Gb
 for linux-riscv@bombadil.infradead.org; Mon, 23 May 2022 07:54:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
 Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=vvsmHUzluvEvQBof5D87XgRf+T6x1OltD2M2UVNj7M0=; b=e8uYaKHpllyrUJDQUHJysFsDY5
 gPDsyCxM/GnEtLLt71R6/4YkbLKMWHBO2sWWlAOf6+pntNhhmalj3PIhzg7wSeRT/EtwmlUB1K6dv
 MAGVM/MtISvpI+uRpC2ohNu84pAUrKUFvtfoUujI+60Fh4RC91eMGjCIs+zjSk0T3Vxft0L3L8GLn
 WWCa/Ttzi2iX6ACyuTkfUpkSalsSCGm3O+gajmvJIREkm1whjgwr3Y1S8EzkXg1Qy7A0uqKhV+9bM
 a/Exdxx93Jwqdut+jLZHnp3Z2+24YplW+gtbHCoeb02uxRvfycCW4h56lD3QpmTtYvkz1c7X+OdOG
 POJROLCA==;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsxGS-000kG9-D1
 for linux-riscv@lists.infradead.org; Mon, 23 May 2022 01:53:48 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L60dQ1VpczQk9Y;
 Mon, 23 May 2022 09:50:02 +0800 (CST)
Received: from huawei.com (10.67.174.53) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 23 May
 2022 09:53:00 +0800
From: Liao Chang <liaochang1@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
 <mhiramat@kernel.org>, <rostedt@goodmis.org>, <peterz@infradead.org>,
 <jszhang@kernel.org>, <liaochang1@huawei.com>,
 <naveen.n.rao@linux.vnet.ibm.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] riscv/kprobe: reclaim insn_slot on kprobe unregistration
Date: Mon, 23 May 2022 09:51:24 +0800
Message-ID: <20220523015124.98743-1-liaochang1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.53]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_025345_192429_B8F7B743 
X-CRM114-Status: UNSURE (   7.14  )
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

This bug reported by Chen Guokai <chenguokai17@mails.ucas.ac.cn>.

Signed-off-by: Liao Chang <liaochang1@huawei.com>
---
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
