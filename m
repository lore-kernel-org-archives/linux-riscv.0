Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740C2EDEC73
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 15:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SJKqmlo82wDKFrZMoUIdmlTSJh2SjTYmfIrmpGmNVtM=; b=n7VtalCfWBXXm/
	bFmPgkl68lS/tOI4EpQjBDshhrWvcqVxnNXUY5y0kv7LheuRk4BCivM7Usjsagz5cCWE4MpyEPgPK
	oj2sAH8aVXpzMGXfLE1Zu6uehy9/IXDP1O+pPPeNo5+xpKJ+tsHi9Mhero9R24uE6rBRyUtWwPALv
	3fISPuW2tx8TiDCDrAW8Gp95SthTo3e2PZ/lCAi/WfSPYySu1iz855kk4l/W6Hr+Nvs6u4d/YJTN1
	USwNrrvIrAj359JXS6cPjtbAN6x3gTVKQdDEsdvRgFSMzVouf860cB8immBnxiAojH6Gh0E5R1Wzw
	is4/ToCFDpe72xFE7lXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgRsc-006Eqt-0W;
	Wed, 13 Sep 2023 15:34:14 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgRsV-006Elh-0T
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 15:34:09 +0000
Received: from mail02.huawei.com (unknown [172.30.67.143])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Rm4HK073Sz4f3lDL
	for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 23:33:49 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP2 (Coremail) with SMTP id Syh0CgAXIAVd1gFltNV8AQ--.25893S6;
	Wed, 13 Sep 2023 23:33:50 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [PATCH bpf-next 4/6] riscv, bpf: Add necessary Zbb instructions
Date: Wed, 13 Sep 2023 23:34:11 +0800
Message-Id: <20230913153413.1446068-5-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230913153413.1446068-1-pulehui@huaweicloud.com>
References: <20230913153413.1446068-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: Syh0CgAXIAVd1gFltNV8AQ--.25893S6
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw1rAFy3WF4rWrWfuFW8Crg_yoW8Wr4xpa
	n8GrWrAa4vqFyfGryftr48Xr4YvFs5Ww13Jr4293yDJa17WrZIk3s5Kw17tFn8Gry8Cr9x
	WFZ8KF4rCa18AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr
	0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUA
	rcfUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_083407_630376_D0BA4D3D 
X-CRM114-Status: UNSURE (   7.52  )
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

Add necessary Zbb instructions introduced by [0] to reduce code size and
improve performance of RV64 JIT. At the same time, a helper is added to
check whether the CPU supports Zbb instructions.

[0] https://github.com/riscv/riscv-bitmanip/releases/download/1.0.0/bitmanip-1.0.0-38-g865e7a7.pdf

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 arch/riscv/net/bpf_jit.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index 8e0ef4d08..7ee59d1f6 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -18,6 +18,11 @@ static inline bool rvc_enabled(void)
 	return IS_ENABLED(CONFIG_RISCV_ISA_C);
 }
 
+static inline bool rvzbb_enabled(void)
+{
+	return IS_ENABLED(CONFIG_RISCV_ISA_ZBB);
+}
+
 enum {
 	RV_REG_ZERO =	0,	/* The constant value 0 */
 	RV_REG_RA =	1,	/* Return address */
@@ -727,6 +732,27 @@ static inline u16 rvc_swsp(u32 imm8, u8 rs2)
 	return rv_css_insn(0x6, imm, rs2, 0x2);
 }
 
+/* RVZBB instrutions. */
+static inline u32 rvzbb_sextb(u8 rd, u8 rs1)
+{
+       return rv_i_insn(0x604, rs1, 1, rd, 0x13);
+}
+
+static inline u32 rvzbb_sexth(u8 rd, u8 rs1)
+{
+       return rv_i_insn(0x605, rs1, 1, rd, 0x13);
+}
+
+static inline u32 rvzbb_zexth(u8 rd, u8 rs)
+{
+       return rv_i_insn(0x80, rs, 4, rd, __riscv_xlen == 64 ? 0x3b : 0x33);
+}
+
+static inline u32 rvzbb_rev8(u8 rd, u8 rs)
+{
+       return rv_i_insn(__riscv_xlen == 64 ? 0x6b8 : 0x698, rs, 5, rd, 0x13);
+}
+
 /*
  * RV64-only instructions.
  *
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
