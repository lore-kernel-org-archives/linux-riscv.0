Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AA2C0015E
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jul 2023 13:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z6HtqmXPrkyWCgAids4trnq9s2TpnBEJk8fesCZkaBg=; b=LkRrfYoP+GWzMI
	Q5D+j2sFTR2TVVpTp0z2zWFiognR7Um354WXT5511TTPqoQUaeVT3UFUVod86y9kiR51KxfriTObL
	IBxLJ/DeJTYQsr2DVu2x1avStXS+oYQ8j0gz8UAj/dEohNN0i4Waq++p8RFEKZ4D6v9QItYLMr7ws
	uUKgqn8dQknPnkCJWeiF0yb++GiYTW7/+6DT2DGthBRkwMowwL+kfaNhVf9Gd/mQwoc9UmgiJiqGu
	/2Z8+97s9P22vngELUgyqyx+7u21e3Yvvl9nVAYTyfbtv+5J17lXWQIlaux15VzoKU02cbiwYuLeD
	b2iheH406NPJLVDTn6TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFaob-0064mH-1R;
	Sat, 01 Jul 2023 13:39:05 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFaoV-0064iR-0t;
	Sat, 01 Jul 2023 13:39:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688218739; x=1719754739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r/aRBwjLRDnUy2X8CTuWO0qSvTCCqephwitvcdu1Lbs=;
  b=d6aHMvNdwUkVnbUzCGlNBoBchyy+qg7gewPC/AZgJJMON+5XBu+plb1s
   wT0wLNaBBHrlSZmuSIAvu9KjQFyxwS4n3k5INtvZHUtPOOLbhXOcW8b+T
   W7DW8MMqqsrc8AJB6TxJuixBPZSOvtAiUJd4hxrqXBEk8YVlwEz8/pvaK
   VH+yrCTQBohnO6Nl3VN5McQo9OG0gLOrqzhrd6WcnUu0Gqt+B/c5IOZMW
   224lRpObfgaF1DRTqFs2OkyHDiz2hi4tEtNcntzLw8VFOuhjKzWcaiV8+
   9o3yCBFkTrKZS5GVOW+NXpQ5P76a6rbmPWWvKJUZ8zBu12OLBKsDk0sP7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="342926241"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="342926241"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2023 06:38:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="747694085"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="747694085"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2023 06:38:51 -0700
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
	David Matlack <dmatlack@google.com>,
	Vipin Sharma <vipinsh@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH v5 08/13] KVM: arm64: selftests: Move reject_set check logic to a function
Date: Sat,  1 Jul 2023 21:42:56 +0800
Message-Id: <f5ef26e862260efdf1c809d0eee46ee1c8b457f2.1688010022.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688010022.git.haibo1.xu@intel.com>
References: <cover.1688010022.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230701_063859_340786_911E4712 
X-CRM114-Status: GOOD (  10.80  )
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

No functional changes. Just move the reject_set check logic to a
function so we can check for specific errno for specific register.
This is a preparation for support reject_set in riscv.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
---
 tools/testing/selftests/kvm/aarch64/get-reg-list.c | 5 +++++
 tools/testing/selftests/kvm/get-reg-list.c         | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/aarch64/get-reg-list.c b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
index aaf035c969ec..4aa58f1aebe3 100644
--- a/tools/testing/selftests/kvm/aarch64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
@@ -27,6 +27,11 @@ bool filter_reg(__u64 reg)
 	return false;
 }
 
+bool check_reject_set(int err)
+{
+	return err == EPERM;
+}
+
 #define REG_MASK (KVM_REG_ARCH_MASK | KVM_REG_SIZE_MASK | KVM_REG_ARM_COPROC_MASK)
 
 #define CORE_REGS_XX_NR_WORDS	2
diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
index f6ad7991a812..79e198968860 100644
--- a/tools/testing/selftests/kvm/get-reg-list.c
+++ b/tools/testing/selftests/kvm/get-reg-list.c
@@ -98,6 +98,11 @@ void __weak print_reg(const char *prefix, __u64 id)
 	printf("\t0x%llx,\n", id);
 }
 
+bool __weak check_reject_set(int err)
+{
+	return true;
+}
+
 #ifdef __aarch64__
 static void prepare_vcpu_init(struct vcpu_reg_list *c, struct kvm_vcpu_init *init)
 {
@@ -216,7 +221,7 @@ static void run_test(struct vcpu_reg_list *c)
 			if (s->rejects_set && find_reg(s->rejects_set, s->rejects_set_n, reg.id)) {
 				reject_reg = true;
 				ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
-				if (ret != -1 || errno != EPERM) {
+				if (ret != -1 || !check_reject_set(errno)) {
 					printf("%s: Failed to reject (ret=%d, errno=%d) ", config_name(c), ret, errno);
 					print_reg(config_name(c), reg.id);
 					putchar('\n');
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
