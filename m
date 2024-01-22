Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC05BC47DAF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 09:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=433/QLqYB/lmII2AIYSXe6ebcAMSmYJjs4NW0WrOv8k=; b=y/QvrhPQ62o9Px
	BRryPdVnn/vlVe8Qdnd/EUblxqk2wQv2y1VaJhmQy1kcGgUtnkREWPC7VUlGDocScrOGhDXB5Fffs
	QvtQzdr+B0wy8F65247ANChzQWhcAvqeIQyH/DICcyTAuqOaygZNYKN9bE2Q+xGwfRo9DUo6pgxwt
	2m/J0rVWIB0EIczdRtjzm9Wh86k7RyJs/uKoL05y/iliId+9VF+DVZL03uO7GVsajmNp0aAfufPQw
	qG4JdmryX67YWhBGiDhrDN3CZxWHFa/m6rLHIiz62K1EE2tLeHx7yyqmQkupDVFjJ6HubAvIqBue3
	JL5oMvf64h8sGP95Hj0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRqsB-00BL7w-1n;
	Mon, 22 Jan 2024 09:45:43 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRqs3-00BL2p-00;
	Mon, 22 Jan 2024 09:45:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705916735; x=1737452735;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g6et7PUrB+XhJnaLfQ/iOAuZuiRzqn2XXWA27POxfk8=;
  b=OWtCcFRyA4z33E+17VO/aowhgs7uofLFmQK0pHkFCOP4g1qnt8TnDy7V
   gvQ+fmo8zkM560iAOsHrSrwL4ERUMPKD55IBJnZR/vZolYaki4z95zZgW
   Zzj58nwotyTs1qKqpq8TwCnbTZbSvrv7+cn1KtiSLWRO9vqxHkwsL5DwB
   uLgKTWlvI8CQeGEDMeymFJgehmumbzcvZprwYGkm0DoZw5panHciHeyb+
   bWs39rsAPP+eKIxGNdmvLgBZfVBkSILlOoSyISmEtrGpGxhVi5HlqIw2C
   gKwzwkH3GUUIJCqMqIedbWeYUVhzle9mNMTJcNY7RhDJqIrqcWk+epm2D
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="22641575"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="22641575"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 01:45:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="778535319"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="778535319"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 01:45:25 -0800
From: Haibo Xu <haibo1.xu@intel.com>
To: 
Cc: xiaobo55x@gmail.com,
	ajones@ventanamicro.com,
	Haibo Xu <haibo1.xu@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	wchen <waylingii@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Samuel Holland <samuel@sholland.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Minda Chen <minda.chen@starfivetech.com>,
	Sean Christopherson <seanjc@google.com>,
	Peter Xu <peterx@redhat.com>,
	Like Xu <likexu@tencent.com>,
	Vipin Sharma <vipinsh@google.com>,
	Aaron Lewis <aaronlewis@google.com>,
	Thomas Huth <thuth@redhat.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v5 02/12] KVM: arm64: selftests: Data type cleanup for arch_timer test
Date: Mon, 22 Jan 2024 17:58:32 +0800
Message-Id: <173c9b64c4c43cd585f6b177a7d434dcedc905fa.1705916069.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705916069.git.haibo1.xu@intel.com>
References: <cover.1705916069.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_014535_049873_F3E6C45C 
X-CRM114-Status: UNSURE (   9.30  )
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

Change signed type to unsigned in test_args struct which
only make sense for unsigned value.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
---
 tools/testing/selftests/kvm/aarch64/arch_timer.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/aarch64/arch_timer.c b/tools/testing/selftests/kvm/aarch64/arch_timer.c
index 274b8465b42a..3260fefcc1b3 100644
--- a/tools/testing/selftests/kvm/aarch64/arch_timer.c
+++ b/tools/testing/selftests/kvm/aarch64/arch_timer.c
@@ -42,10 +42,10 @@
 #define TIMER_TEST_MIGRATION_FREQ_MS	2
 
 struct test_args {
-	int nr_vcpus;
-	int nr_iter;
-	int timer_period_ms;
-	int migration_freq_ms;
+	uint32_t nr_vcpus;
+	uint32_t nr_iter;
+	uint32_t timer_period_ms;
+	uint32_t migration_freq_ms;
 	struct kvm_arm_counter_offset offset;
 };
 
@@ -57,7 +57,7 @@ static struct test_args test_args = {
 	.offset = { .reserved = 1 },
 };
 
-#define msecs_to_usecs(msec)		((msec) * 1000LL)
+#define msecs_to_usecs(msec)		((msec) * 1000ULL)
 
 #define GICD_BASE_GPA			0x8000000ULL
 #define GICR_BASE_GPA			0x80A0000ULL
@@ -72,7 +72,7 @@ enum guest_stage {
 
 /* Shared variables between host and guest */
 struct test_vcpu_shared_data {
-	int nr_iter;
+	uint32_t nr_iter;
 	enum guest_stage guest_stage;
 	uint64_t xcnt;
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
