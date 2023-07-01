Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D976EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jul 2023 13:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mvuXzOrInHJHvz5gtBGXbG+sQZDM21vz3Fzuak57xg4=; b=2igGBm5FuGfqHu
	8bDJPu0TQDSkKaldALu8ObwPhu0kBPRLxxNZaZweuq9r0lVvLJFxoKCe3qHdJvXhfIUhny8H1mVyp
	0ss5DzB0LQLyVPu+1MSqG/VAArlyt1WLFzRpEgHYB9v1GwnephsAXhoGCwXNTahzr3rdowKlwP+gp
	t5eUwdQLrO5K+ReHaGHNfq5SXadbHdBUZodmSmCu2G+VAEyb9BPO3A5u82z+7c/FFjGKaIpx91zzt
	MuobDoeMpNHkK8FefqLiVqEIXAW2tyuX5fQy2mVIPfKihC241DOTmHBImXUjg3ZFHUxkPn+4XmsMw
	hooNtW2UZEu42L5nfHUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFap1-00651o-1x;
	Sat, 01 Jul 2023 13:39:31 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFaoy-0064zb-0K;
	Sat, 01 Jul 2023 13:39:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688218768; x=1719754768;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I+7CmZbE8smFi2s/kidYxguksFY8+4Lb0ZPsMAWD3Cc=;
  b=G4KSBKS9PfmTlFQjUQQkp7aVMpEbwrB84eIst5Yxdc4z468p6gPregE+
   u8ChAcQnVWWQBhSdCPA5e1QVweumUk431wcl2kF8SiymAwTFRrCBDdeEm
   ++SRwzC0ahdSQVObatk2Vjq//iiIlF0U2SPKIJxUbwpS/Qp/Xt0x1Wf51
   gjdlT2hArAZbmr/IUbW3qUZub6to3/hdSfRF2XgxUiunJfk6+cal3zR/O
   dEwWhByCjWmAZNa0AOGhdyxaKUK+Slz9Ej+frEmw9KWD62Y2SvZRerLpl
   zluVtOlprJYP5Gxi0LDIRSrV9afdd7ZD4sNUL38p7jY4+ziek7OiuC4Ep
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="342926279"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="342926279"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2023 06:39:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="747694214"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="747694214"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2023 06:39:20 -0700
From: Haibo Xu <haibo1.xu@intel.com>
To: 
Cc: xiaobo55x@gmail.com,
	haibo1.xu@intel.com,
	ajones@ventanamicro.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	seanjc@google.com,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ricardo Koller <ricarkol@google.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Vipin Sharma <vipinsh@google.com>,
	David Matlack <dmatlack@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH v5 10/13] KVM: selftests: Only do get/set tests on present blessed list
Date: Sat,  1 Jul 2023 21:42:58 +0800
Message-Id: <f44c3aa46971d524319c6340f9ce1b00c0182fd2.1688010022.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688010022.git.haibo1.xu@intel.com>
References: <cover.1688010022.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230701_063928_147162_0B0C7350 
X-CRM114-Status: GOOD (  14.75  )
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

Only do the get/set tests on present and blessed registers
since we don't know the capabilities of any new ones.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/kvm/get-reg-list.c | 29 ++++++++++++++--------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
index c61090806007..74fb6f6fdd09 100644
--- a/tools/testing/selftests/kvm/get-reg-list.c
+++ b/tools/testing/selftests/kvm/get-reg-list.c
@@ -49,6 +49,10 @@ extern int vcpu_configs_n;
 	for_each_reg_filtered(i)						\
 		if (!find_reg(blessed_reg, blessed_n, reg_list->reg[i]))
 
+#define for_each_present_blessed_reg(i)			\
+	for ((i) = 0; (i) < blessed_n; ++(i))		\
+		if (find_reg(reg_list->reg, reg_list->n, blessed_reg[i]))
+
 static const char *config_name(struct vcpu_reg_list *c)
 {
 	struct vcpu_reg_sublist *s;
@@ -177,6 +181,16 @@ static void run_test(struct vcpu_reg_list *c)
 		return;
 	}
 
+	for_each_sublist(c, s)
+		blessed_n += s->regs_n;
+	blessed_reg = calloc(blessed_n, sizeof(__u64));
+
+	n = 0;
+	for_each_sublist(c, s) {
+		for (i = 0; i < s->regs_n; ++i)
+			blessed_reg[n++] = s->regs[i];
+	}
+
 	/*
 	 * We only test that we can get the register and then write back the
 	 * same value. Some registers may allow other values to be written
@@ -186,8 +200,11 @@ static void run_test(struct vcpu_reg_list *c)
 	 * be written need to have the other values tested, then we should
 	 * create a new set of tests for those in a new independent test
 	 * executable.
+	 *
+	 * Only do the get/set tests on present, blessed list registers,
+	 * since we don't know the capabilities of any new registers.
 	 */
-	for_each_reg(i) {
+	for_each_present_blessed_reg(i) {
 		uint8_t addr[2048 / 8];
 		struct kvm_one_reg reg = {
 			.id = reg_list->reg[i],
@@ -230,16 +247,6 @@ static void run_test(struct vcpu_reg_list *c)
 		}
 	}
 
-	for_each_sublist(c, s)
-		blessed_n += s->regs_n;
-	blessed_reg = calloc(blessed_n, sizeof(__u64));
-
-	n = 0;
-	for_each_sublist(c, s) {
-		for (i = 0; i < s->regs_n; ++i)
-			blessed_reg[n++] = s->regs[i];
-	}
-
 	for_each_new_reg(i)
 		++new_regs;
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
