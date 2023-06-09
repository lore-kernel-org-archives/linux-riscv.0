Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039ACC7EE29
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 02:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VkXZbhdTZtamoPrJbj90u3qTpgf8uEJQt7bMK+3aLDw=; b=VxeU7uFKK4bRpw
	KsBykclTyJC71rvN1a1dtA8M7dFkMaiIQRVpMgDBxsapqapYkD5axXXuqA1Ei562qdbB71l7USppn
	MibLAhQc8dUsLbaZXUTo36O9kXPhrhJ7NrLyycbvjWxDBtkRDvleOfJXhKc6kOaEfsUf9z1Wkuq0B
	ApIt0fb7vZKFMCZLvHBFzYfO26zZBzJE+8fpTNAVE5yeHjfvy3L1MNU8BVtWNwv7Vr2uGANsa+ms5
	uk1zev+sJEQLC/Kbxm/bTYn/YaTtYXX1V06w7Xba1umgrr07fhJ2k6uajIxFWlIZ+/eTEX3OxnQ8S
	Zx70DAafZ56CT3ncsHWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7RWV-00BGUR-25;
	Fri, 09 Jun 2023 02:06:43 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7RWS-00BGRM-0p;
	Fri, 09 Jun 2023 02:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686276400; x=1717812400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SG9GcgXHxEAjLOgy9zCFtnTjBIS7anAQ+78nBSk9tVQ=;
  b=inPqQoIV1rpmKNlV0xO/MoGkRapQuj6po04vdqDuC15lDxhYCLYrDRRM
   ZcIV+YzxYEuP7/IDTnjcjLWr/vIUweQwuBPggt4slyGmi0bzYIcf8IYqN
   icEwWROdSYjlNmLdZ+qsfSERzK1qR635NC9AOUj1+eU2LAvRk77IWuuIU
   yA/hMzMlFWNqwZyVldmcDwISkqXsqpH7P0ZE0Y6xavjLZEoYyHRWXUSoB
   c1m1pSCHTRPPL3uko1Ng3yVBGiZrnTVyn7JBdDm5qPJt3N9RtiME5Y9AD
   5JTewXxtuXDLmH7MjEEWbaUbQYrFhUOfobMafLB3OgCRTUGJsdRpCi0Ff
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="359975219"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="359975219"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 19:06:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="713334571"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="713334571"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 19:06:33 -0700
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
	Ben Gardon <bgardon@google.com>,
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
Subject: [PATCH v3 02/10] KVM: arm64: selftests: Drop SVE cap check in print_reg
Date: Fri,  9 Jun 2023 10:12:10 +0800
Message-Id: <0b69ae670aee3a1e2264ffde8b4873286b9a2151.1686275310.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686275310.git.haibo1.xu@intel.com>
References: <cover.1686275310.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_190640_337966_A9F6B62C 
X-CRM114-Status: UNSURE (   9.88  )
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

From: Andrew Jones <ajones@ventanamicro.com>

The check doesn't prove much anyway, as the reg lists could be
messed up too. Just drop the check to simplify making print_reg
more independent.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
---
 .../testing/selftests/kvm/aarch64/get-reg-list.c  | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/aarch64/get-reg-list.c b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
index c152523a5ed4..915272c342f9 100644
--- a/tools/testing/selftests/kvm/aarch64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
@@ -100,16 +100,6 @@ static const char *config_name(struct vcpu_config *c)
 	return c->name;
 }
 
-static bool has_cap(struct vcpu_config *c, long capability)
-{
-	struct reg_sublist *s;
-
-	for_each_sublist(c, s)
-		if (s->capability == capability)
-			return true;
-	return false;
-}
-
 static bool filter_reg(__u64 reg)
 {
 	/*
@@ -287,10 +277,7 @@ static void print_reg(struct vcpu_config *c, __u64 id)
 		printf("\tKVM_REG_ARM_FW_FEAT_BMAP_REG(%lld),\n", id & 0xffff);
 		break;
 	case KVM_REG_ARM64_SVE:
-		if (has_cap(c, KVM_CAP_ARM_SVE))
-			printf("\t%s,\n", sve_id_to_str(c, id));
-		else
-			TEST_FAIL("%s: KVM_REG_ARM64_SVE is an unexpected coproc type in reg id: 0x%llx", config_name(c), id);
+		printf("\t%s,\n", sve_id_to_str(c, id));
 		break;
 	default:
 		TEST_FAIL("%s: Unexpected coproc type: 0x%llx in reg id: 0x%llx",
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
