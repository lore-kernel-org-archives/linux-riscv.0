Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB1CC83F27
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jul 2025 09:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UMwNKFSX2ISHNeAY/lKhxSIywIbM5aLJZUTAqFffzp4=; b=TCa6Zf9n/8/y5Q
	bMvGonO/pBdLxxD+03cb1MVqb5BbQ5vQgY+yhgjl0QbCvqK/YERdnRyovM6ZCbpUTirU/Wun7ypde
	na+Q6mGA7qamzbKXIygwlo3oM4ObNmCzn1wv4qco5JkDboEkysiS/7gTfGqiyCYEJKOWcE1xXi89n
	vZXiq5VP3lnSVr0iihnXBD9HMw8OWcNVouHg8iY//zQrHk+gYQVjRqSmJzThtoIzz/Jj/DtXN6nQB
	WFYIwlYT84jqWlW2BiwGx9TKRbc5gD0PxFJ1QibOfQKzcKsxaujOtnjrEQBUU/btOCZa94X7Ko/3R
	Csxy09cdrTig1lgRNmVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud3eT-0000000E4ev-2uXp;
	Sat, 19 Jul 2025 09:14:41 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud3eO-0000000E4Z4-0ltv
	for linux-riscv@lists.infradead.org;
	Sat, 19 Jul 2025 09:14:37 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4bkgw12MyTzYQvFK
	for <linux-riscv@lists.infradead.org>; Sat, 19 Jul 2025 17:14:25 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 16A1D1A17F7
	for <linux-riscv@lists.infradead.org>; Sat, 19 Jul 2025 17:14:24 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with SMTP id gCh0CgCHURLuYXtopCAYAw--.54295S8;
	Sat, 19 Jul 2025 17:14:23 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH bpf-next 06/10] riscv, bpf: Add Zacas instructions
Date: Sat, 19 Jul 2025 09:17:26 +0000
Message-Id: <20250719091730.2660197-7-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250719091730.2660197-1-pulehui@huaweicloud.com>
References: <20250719091730.2660197-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgCHURLuYXtopCAYAw--.54295S8
X-Coremail-Antispam: 1UD129KBjvdXoWrZFWrXrW5Jry8tw43CFWDCFg_yoWDtwb_u3
	4Iqayaqrs8WF48Xa1DCr15JryUC395JFyrGFnagrZ0v3WFqwn2v393tF48A3y8ZF48Wryr
	Wa4DJrZ7uwsxujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbgxYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r126s
	0DM28IrcIa0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2
	WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkE
	bVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7
	AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_Wr
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
	0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x
	07jIPfQUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_021436_554108_A0885B09 
X-CRM114-Status: UNSURE (   6.30  )
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

From: Pu Lehui <pulehui@huawei.com>

Add Zacas instructions introduced by [0] to reduce code size and
improve performance of RV64 JIT.

Link: https://github.com/riscvarchive/riscv-zacas/releases/download/v1.0/riscv-zacas.pdf [0]
Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 arch/riscv/net/bpf_jit.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index 0964df48c25e..2351fba5d3e7 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -751,6 +751,17 @@ static inline u16 rvc_swsp(u32 imm8, u8 rs2)
 	return rv_css_insn(0x6, imm, rs2, 0x2);
 }
 
+/* RVZACAS instructions. */
+static inline u32 rvzacas_amocas_w(u8 rd, u8 rs2, u8 rs1, u8 aq, u8 rl)
+{
+	return rv_amo_insn(0x5, aq, rl, rs2, rs1, 2, rd, 0x2f);
+}
+
+static inline u32 rvzacas_amocas_d(u8 rd, u8 rs2, u8 rs1, u8 aq, u8 rl)
+{
+	return rv_amo_insn(0x5, aq, rl, rs2, rs1, 3, rd, 0x2f);
+}
+
 /* RVZBA instructions. */
 static inline u32 rvzba_sh2add(u8 rd, u8 rs1, u8 rs2)
 {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
