Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B957C61DBD
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 11:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/lscbrE86pRkosBdvh6coHMI6bKk347gA8/tj0t1YS8=; b=4oHQLPzF/+XIuE
	Cv65bKznhiM6PzwtwzMtd/949AMQ11Vi+1EySaHumm1E34TjZ9U4AoywrIjGCf/MY3P6cGiCzFVP7
	939V3JfpUXauGN0hbFoFYpm18Ct/jk7js6ioNyY0uGxCR/BeOnC7X64pc109Mp+06rsObjrXIaqpb
	37Pi2QCFdvCYK7sKXrUaITlG5Um1GFTdvA9Q9/kz7T4RkcSu/dna/KKasFXu1Y0+nrr3Zo8+smK/Q
	LwVAObBmn6NIASlzwKYeCQYu/y+72T7p9JB8CNY/VuAjmCLRTB4dmYvCmSPxG0WYmUI3gyBIETPYq
	ih29tFxnC7gqPDMih+jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCGf-00000002Ns0-3T2b;
	Wed, 26 Aug 2026 11:58:10 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCGX-00000002Npx-26lj
	for linux-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 11:58:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=qA
	ACV17824/0ISQqqSn6WdXNhbRXLtURzi1zvxcSRqs=; b=fEwyDB2hy2gi3fyXzz
	ozXl4qTkCAwb9W+8tRdSPR2B8poFfptzhSpKrvCgstXBQBfCbOgXEtCwOlwCV1Ov
	PLOnv41ZthUGc3HeewZNbRfO0+NcGv9ATVz4UW8C1tQvpsRJVjBHLfitAhSQAXb2
	v5gHTXzJruPeXH4M1JNX+9MJ0=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnD6SZ1I5qswPTQA--.55021S2;
	Wed, 26 Aug 2026 19:57:14 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: oleg@redhat.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: andybnac@gmail.com,
	debug@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH] riscv: ptrace: Zero-initialize regset buffers before copyin
Date: Wed, 26 Aug 2026 19:57:11 +0800
Message-Id: <20260826115711.86861-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wDnD6SZ1I5qswPTQA--.55021S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KryUZFW3Jr13Kw17WF4xtFb_yoW8Xw4Dpr
	ZxCaykGrW8Jr42vF4akF48urn0grn3WFWS9a4fX3WrAry5Jr4qvF9akFyqyr4fKFy8Wa4f
	ZFyq9w1FyayDX3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jU5rxUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC9BqZRWqO1JrP8gAA3l
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_045801_948056_F92E8902 
X-CRM114-Status: UNSURE (   8.04  )
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

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

user_regset_copyin() only copies `count` bytes, so a PTRACE_SETREGSET
request with a short iov_len leaves the rest of the stack buffer
uninitialized. In riscv_vr_set() that garbage is validated and copied
into the target's vstate, and in riscv_cfi_set() it can be stored as
the target's shadow stack pointer. Zero both buffers, as the get path
already does.

Fixes: 9300f0043974 ("RISC-V: Add ptrace support for vectors")
Fixes: 2af7c9cf021c ("riscv/ptrace: expose riscv CFI status and state via ptrace and in core files")
Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
 arch/riscv/kernel/ptrace.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index f336a183667e..e089dd192b13 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -230,6 +230,7 @@ static int riscv_vr_set(struct task_struct *target,
 		return -ENODATA;
 
 	/* Copy rest of the vstate except datap */
+	memset(&ptrace_vstate, 0, sizeof(ptrace_vstate));
 	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &ptrace_vstate, 0,
 				 sizeof(struct __riscv_v_regset_state));
 	if (unlikely(ret))
@@ -339,6 +340,7 @@ static int riscv_cfi_set(struct task_struct *target,
 
 	regs = task_pt_regs(target);
 
+	memset(&user_cfi, 0, sizeof(user_cfi));
 	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &user_cfi, 0, -1);
 	if (ret)
 		return ret;
-- 
2.34.1


No virus found
		Checked by Hillstone Network AntiVirus


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
