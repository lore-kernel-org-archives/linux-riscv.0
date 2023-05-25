Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BF2C7EE2E
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 07:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S5kvV1idBBnjM/oTpW/2ut/aioQY0sm9S6BJBVET3Kg=; b=mRXffYkqQlPz2/
	hKe1TtknBFRv76KC0eChi+jTfX199O9fg2irgN7d0f6hX70r5h2wdaTBEEuiqnr5aGmNc8mrigrNJ
	NklBzQwM1ftJfhTqAoNn/fYRMsr+Rl34GcwXIPEDLKs0UpoeLhLtsByMOhco/f/wx0EB1JJ7z9NmP
	k20UVS58P6gaTPmXQWXFJ42rXhmdGNfUclgqXVu+0G5Vn8/0EF4jnY8MeL/xnICGQz0qehYiLFkPe
	nOPwZ9AO7ix7fp59owVh85RAUVDyzNlhBGRqyFmQgs+9c3G7Qs/870h6vjr+DDR+9ToP9ou7cIkye
	4orpLEVLhD9gPuV3F9Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q25Wj-00Fpln-0t;
	Thu, 25 May 2023 07:36:49 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q25Vh-00Fon9-1H;
	Thu, 25 May 2023 07:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685000145; x=1716536145;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+u1HJaFTXrPVFD+3NbnmJ/AGWJcDm8pIPpTYzo4Zo5U=;
  b=BIK65ABeBfrWYzIxnMhJvWEBo/F65bidumH0kI+94wCRONdSt8nea9/G
   sOfTt4evJvhYM/h3RCfCaopFrAEJ+rkfiQTU2esoLFOIgQ1VZkklRFwK9
   KQdAcjitYZJprFXx1LD+6Qi4f4abCkACc1/pK7f7d5CHfANLNGbYCRx+N
   OkO6hYIoFfN9YgSdJY/hPIHCG1tL7I8InywC+B0Yrbttj5CYyBDOClgCF
   E7TlYTDzzeeoorp380L/LRu5Fy9+ih4ZBOKP9ZkF5fns6P+PWdRO4K7B0
   Jm9Rp1b4ZnYlPds0WIbq4jv2M0Q3/6GXErXj71FY58Ca1begnidY4S0G/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="343285752"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="343285752"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 00:34:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="769776197"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="769776197"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 00:34:48 -0700
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
	David Matlack <dmatlack@google.com>,
	Ben Gardon <bgardon@google.com>,
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
Subject: [PATCH v2 10/11] KVM: riscv: selftests: Skip some registers set operation
Date: Thu, 25 May 2023 15:38:34 +0800
Message-Id: <a10cd1ff57e07e408d08eca7e6a4557217ca0af3.1684999824.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684999824.git.haibo1.xu@intel.com>
References: <cover.1684999824.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_003545_546721_A7CF861D 
X-CRM114-Status: GOOD (  13.42  )
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

Set operation on some riscv registers(mostly pesudo ones) was not
supported and should be skipped in the get-reg-list test. Just
reuse the rejects_set utilities to handle it in riscv.

Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
---
 tools/testing/selftests/kvm/get-reg-list.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
index f1fc113e9719..ebd6b580b33b 100644
--- a/tools/testing/selftests/kvm/get-reg-list.c
+++ b/tools/testing/selftests/kvm/get-reg-list.c
@@ -211,16 +211,22 @@ static void run_test(struct vcpu_reg_list *c)
 			++failed_get;
 		}
 
-		/* rejects_set registers are rejected after KVM_ARM_VCPU_FINALIZE */
+		/*
+		 * rejects_set registers are rejected after KVM_ARM_VCPU_FINALIZE on aarch64,
+		 * or registers that should skip set operation on riscv.
+		 */
 		for_each_sublist(c, s) {
 			if (s->rejects_set && find_reg(s->rejects_set, s->rejects_set_n, reg.id)) {
 				reject_reg = true;
-				ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
-				if (ret != -1 || errno != EPERM) {
-					printf("%s: Failed to reject (ret=%d, errno=%d) ", config_name(c), ret, errno);
-					print_reg(config_name(c), reg.id);
-					putchar('\n');
-					++failed_reject;
+				if ((reg.id & KVM_REG_ARCH_MASK) == KVM_REG_ARM64) {
+					ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
+					if (ret != -1 || errno != EPERM) {
+						printf("%s: Failed to reject (ret=%d, errno=%d) ",
+								config_name(c), ret, errno);
+						print_reg(config_name(c), reg.id);
+						putchar('\n');
+						++failed_reject;
+					}
 				}
 				break;
 			}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
