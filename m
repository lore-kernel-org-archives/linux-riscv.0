Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3F2EE4993
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 15:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=36OnmgGRIqfrBc+xsyzjz0pO56nP7wtLsUhv/L0NXOk=; b=qY+smYIWip/3Qx
	aq3NlkkFHiKsrMhcMHtzwiZ7j/sfBtVuhZpvinRV03u9SYzmrjzQfMQo7bbwKrH7dBl/9uD0NZHZZ
	9BZOvBGz+Do/CYy5nttfSJK9kLZOA7sgKq6zBmGvc0KhA7mVZUlWP1pBwrt3SiqM83bbxjlQzAw0w
	vtVSEvBLruzaLbzLxF0GkcF1J+NwGwnN+3SR5nziTHz9PDT7vixvrGGfdBYkY/74eFDDcaxwdOl+h
	y+z8xWnvN/8ChrvFLudbAsl6VKdkfSv5/GRxC7AmVhda4My5y4vCR6aKq1oFzGQBVkhOjn5TVOszs
	gwZPg1OieqJkKpDkqG/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYpRq-000ucE-07;
	Wed, 23 Aug 2023 15:07:06 +0000
Received: from [45.249.212.56] (helo=dggsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYpRl-000uYa-22
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 15:07:04 +0000
Received: from mail02.huawei.com (unknown [172.30.67.169])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4RW8gp0ltFz4f3l7R
	for <linux-riscv@lists.infradead.org>; Wed, 23 Aug 2023 23:06:46 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with SMTP id gCh0CgAn_qCIIOZksUWeBQ--.39856S5;
	Wed, 23 Aug 2023 23:06:49 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: linux-riscv@lists.infradead.org,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Xu Kuohai <xukuohai@huawei.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [PATCH bpf-next 3/7] riscv, bpf: Support sign-extension mov insns
Date: Wed, 23 Aug 2023 23:10:55 +0000
Message-Id: <20230823231059.3363698-4-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230823231059.3363698-1-pulehui@huaweicloud.com>
References: <20230823231059.3363698-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgAn_qCIIOZksUWeBQ--.39856S5
X-Coremail-Antispam: 1UD129KBjvdXoWrtFW7tF1rtw13uFW8WFW7Jwb_yoWftFg_Cr
	n7GayxWw45GFs5Aa4DAr4fArykCws5KF1kXFyv9ryq9rs8Wr1rJryktFyxu34xur1FkFZ5
	Zr95J3ySyw42qjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbQ8FF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M280x2IEY4vEnII2IxkI6r1a6r45M28IrcIa0xkI8V
	A2jI8067AKxVWUWwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28C
	jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI
	8IcVCY1x0267AKxVWxJr0_GcWl84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2
	jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4
	CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvj
	eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I
	1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjTRMq2MDUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_080701_933881_AC5E2F4A 
X-CRM114-Status: UNSURE (   6.65  )
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

Add support sign-extension mov instructions for RV64.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 arch/riscv/net/bpf_jit_comp64.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index fd36cb17101a..d1497182cacf 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -1047,7 +1047,19 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 			emit_zext_32(rd, ctx);
 			break;
 		}
-		emit_mv(rd, rs, ctx);
+		switch (insn->off) {
+		case 0:
+			emit_mv(rd, rs, ctx);
+			break;
+		case 8:
+		case 16:
+			emit_slli(rs, rs, 64 - insn->off, ctx);
+			emit_srai(rd, rs, 64 - insn->off, ctx);
+			break;
+		case 32:
+			emit_addiw(rd, rs, 0, ctx);
+			break;
+		}
 		if (!is64 && !aux->verifier_zext)
 			emit_zext_32(rd, ctx);
 		break;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
