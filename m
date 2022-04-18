Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF21C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Apr 2022 03:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bGDiXOCT9Fd7HCvjgnpeS8aLzJYtIUmQvVxOM8wb06M=; b=BKWqdJOzplBCTJ
	LhgHvpKEsiHTRcFGpAgasKNFLrqDervkmMSbDkLeqSPgLAuwPGWZNx2INw8wazjvgdHqK2EmKwu96
	P3HArHhJqKWaAVeRjwoQLZnHycViXy+pLnslABta6zAT0Nij0Rk4S+bgnQ5LEFfQVsff89C1fygnQ
	OFzHKJ+yo09JiwoM3cabcn+ALXizeCmajq6QlErlbJ86zKx18Qz4WHxusbXvkfviVOLt3lKvM2XZ9
	viQ3wvcolKbwLLyTPWjw8MZ76ZdqHRc9Qwf6SeU0VUFCDTvOfV0d4swq01zAmOuCCr12CIml6NwMg
	MVniu7dvO094NQn1/uvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngISQ-00FU0y-OH; Mon, 18 Apr 2022 03:53:46 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngISN-00FTyt-9r
 for linux-riscv@lists.infradead.org; Mon, 18 Apr 2022 03:53:45 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KhY203xDLzgYv6;
 Mon, 18 Apr 2022 11:53:28 +0800 (CST)
Received: from dggpemm500019.china.huawei.com (7.185.36.180) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 18 Apr 2022 11:53:26 +0800
Received: from k04.huawei.com (10.67.174.115) by
 dggpemm500019.china.huawei.com (7.185.36.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 18 Apr 2022 11:53:26 +0800
From: Pu Lehui <pulehui@huawei.com>
To: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: <andrii@kernel.org>, <ast@kernel.org>, <daniel@iogearbox.net>,
 <kafai@fb.com>, <songliubraving@fb.com>, <yhs@fb.com>,
 <john.fastabend@gmail.com>, <kpsingh@kernel.org>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <pulehui@huawei.com>
Subject: [PATCH bpf-next] libbpf: Support riscv USDT argument parsing logic
Date: Mon, 18 Apr 2022 12:22:22 +0800
Message-ID: <20220418042222.2464199-1-pulehui@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.115]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500019.china.huawei.com (7.185.36.180)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_205343_714128_E1D0AB9B 
X-CRM114-Status: GOOD (  11.65  )
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

Add riscv-specific USDT argument specification parsing logic.
riscv USDT argument format is shown below:
- Memory dereference case:
  "size@off(reg)", e.g. "-8@-88(s0)"
- Constant value case:
  "size@val", e.g. "4@5"
- Register read case:
  "size@reg", e.g. "-8@a1"

s8 will be marked as poison while it's a reg of riscv, we need
to alias it in advance.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 tools/lib/bpf/usdt.c | 107 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/tools/lib/bpf/usdt.c b/tools/lib/bpf/usdt.c
index 934c25301ac1..b8af409cc763 100644
--- a/tools/lib/bpf/usdt.c
+++ b/tools/lib/bpf/usdt.c
@@ -10,6 +10,11 @@
 #include <linux/ptrace.h>
 #include <linux/kernel.h>
 
+/* s8 will be marked as poison while it's a reg of riscv */
+#if defined(__riscv)
+#define rv_s8 s8
+#endif
+
 #include "bpf.h"
 #include "libbpf.h"
 #include "libbpf_common.h"
@@ -1400,6 +1405,108 @@ static int parse_usdt_arg(const char *arg_str, int arg_num, struct usdt_arg_spec
 	return len;
 }
 
+#elif defined(__riscv)
+
+static int calc_pt_regs_off(const char *reg_name)
+{
+	static struct {
+		const char *name;
+		size_t pt_regs_off;
+	} reg_map[] = {
+		{ "ra", offsetof(struct user_regs_struct, ra) },
+		{ "sp", offsetof(struct user_regs_struct, sp) },
+		{ "gp", offsetof(struct user_regs_struct, gp) },
+		{ "tp", offsetof(struct user_regs_struct, tp) },
+		{ "t0", offsetof(struct user_regs_struct, t0) },
+		{ "t1", offsetof(struct user_regs_struct, t1) },
+		{ "t2", offsetof(struct user_regs_struct, t2) },
+		{ "s0", offsetof(struct user_regs_struct, s0) },
+		{ "s1", offsetof(struct user_regs_struct, s1) },
+		{ "a0", offsetof(struct user_regs_struct, a0) },
+		{ "a1", offsetof(struct user_regs_struct, a1) },
+		{ "a2", offsetof(struct user_regs_struct, a2) },
+		{ "a3", offsetof(struct user_regs_struct, a3) },
+		{ "a4", offsetof(struct user_regs_struct, a4) },
+		{ "a5", offsetof(struct user_regs_struct, a5) },
+		{ "a6", offsetof(struct user_regs_struct, a6) },
+		{ "a7", offsetof(struct user_regs_struct, a7) },
+		{ "s2", offsetof(struct user_regs_struct, s2) },
+		{ "s3", offsetof(struct user_regs_struct, s3) },
+		{ "s4", offsetof(struct user_regs_struct, s4) },
+		{ "s5", offsetof(struct user_regs_struct, s5) },
+		{ "s6", offsetof(struct user_regs_struct, s6) },
+		{ "s7", offsetof(struct user_regs_struct, s7) },
+		{ "s8", offsetof(struct user_regs_struct, rv_s8) },
+		{ "s9", offsetof(struct user_regs_struct, s9) },
+		{ "s10", offsetof(struct user_regs_struct, s10) },
+		{ "s11", offsetof(struct user_regs_struct, s11) },
+		{ "t3", offsetof(struct user_regs_struct, t3) },
+		{ "t4", offsetof(struct user_regs_struct, t4) },
+		{ "t5", offsetof(struct user_regs_struct, t5) },
+		{ "t6", offsetof(struct user_regs_struct, t6) },
+	};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(reg_map); i++) {
+		if (strcmp(reg_name, reg_map[i].name) == 0)
+			return reg_map[i].pt_regs_off;
+	}
+
+	pr_warn("usdt: unrecognized register '%s'\n", reg_name);
+	return -ENOENT;
+}
+
+static int parse_usdt_arg(const char *arg_str, int arg_num, struct usdt_arg_spec *arg)
+{
+	char *reg_name = NULL;
+	int arg_sz, len, reg_off;
+	long off;
+
+	if (sscanf(arg_str, " %d @ %ld ( %m[a-z0-9] ) %n", &arg_sz, &off, &reg_name, &len) == 3) {
+		/* Memory dereference case, e.g., -8@-88(s0) */
+		arg->arg_type = USDT_ARG_REG_DEREF;
+		arg->val_off = off;
+		reg_off = calc_pt_regs_off(reg_name);
+		free(reg_name);
+		if (reg_off < 0)
+			return reg_off;
+		arg->reg_off = reg_off;
+	} else if (sscanf(arg_str, " %d @ %ld %n", &arg_sz, &off, &len) == 2) {
+		/* Constant value case, e.g., 4@5 */
+		arg->arg_type = USDT_ARG_CONST;
+		arg->val_off = off;
+		arg->reg_off = 0;
+	} else if (sscanf(arg_str, " %d @ %m[a-z0-9] %n", &arg_sz, &reg_name, &len) == 2) {
+		/* Register read case, e.g., -8@a1 */
+		arg->arg_type = USDT_ARG_REG;
+		arg->val_off = 0;
+		reg_off = calc_pt_regs_off(reg_name);
+		free(reg_name);
+		if (reg_off < 0)
+			return reg_off;
+		arg->reg_off = reg_off;
+	} else {
+		pr_warn("usdt: unrecognized arg #%d spec '%s'\n", arg_num, arg_str);
+		return -EINVAL;
+	}
+
+	arg->arg_signed = arg_sz < 0;
+	if (arg_sz < 0)
+		arg_sz = -arg_sz;
+
+	switch (arg_sz) {
+	case 1: case 2: case 4: case 8:
+		arg->arg_bitshift = 64 - arg_sz * 8;
+		break;
+	default:
+		pr_warn("usdt: unsupported arg #%d (spec '%s') size: %d\n",
+			arg_num, arg_str, arg_sz);
+		return -EINVAL;
+	}
+
+	return len;
+}
+
 #else
 
 static int parse_usdt_arg(const char *arg_str, int arg_num, struct usdt_arg_spec *arg)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
