Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7D1C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 12:11:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E32F961B39
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 12:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E32F961B39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTAXIPMEjYfxFObkPR10rYcN1b/KneswywiY0YB4qsc=; b=IhL1EEIFxltdJD
	tv4/2W2CmnO5+ho4FF56zXVNI+UYUgq+RnJWnUp4zplQuHjQD/8D9xfgJqJeWoGYDHrn8G3Y7JM9/
	T9Y4lg1fJw9wTyfla+UQFSMzJiJVkwjnOx1iUJ+nMRTe8MHjCiYCaxfjwLMBhj/Gl2EK3LSzgaC0a
	Z7DzFAnZJIFJgcoARAPCYptreZIjHvyUHdkxm/2xS35AO9yb6+hV9EoZ66QbT/+vy6ov/B9Aaat8O
	S16zpGXPBbT4HSM3RIdAGt4AXsUh2JU/Y4Vk7LtDZz6Rdoju6PE4uncoJQgJdxLsJBNXJrfBauQAy
	86ZqnxBGRr1oBerI2DsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmxJD-001gf8-MS; Tue, 16 Nov 2021 12:11:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmxJ9-001gbD-AM; Tue, 16 Nov 2021 12:11:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF40261B39;
 Tue, 16 Nov 2021 12:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637064686;
 bh=n19PeZU2LLuo2IYYfWPaoxt6iBWjGOzxM2A7Hzh8IFY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ug6fs3RRoPZhimt0+m9Po/TJeUUSn/FpTkvaEMogRWZ7DB6UE0v3nl3Xsf6+iesp9
 2uG7+JtqFBv9x69AQL1MrMTd2NhopHcS/uySnwaT5v2ZaizPqb6y8drYKfkjssTSPV
 5sBFhf38UBtvkX/eMRVKWvhDL9DS/KN2PI6qcEOXOHTAqtEP9TRmtKtt1al5TenRyG
 6Y82rUwwo4fVZ4EXlEBoF+2cTmASqALH2KUQ6cCkQ0gl7Wg3+n1IEDT2selgFgZ0Io
 helbnK4wO1IXd0IZeAO9rQCHwDxnADhWyZ+PtO3DhErPDsfVYkFu7Sk1b71UMrhz6D
 vjtDm8BEW25wg==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1mmxJ6-00A9LX-CG; Tue, 16 Nov 2021 12:11:24 +0000
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 3/4] Documentation: update vcpu-requests.rst reference
Date: Tue, 16 Nov 2021 12:11:22 +0000
Message-Id: <32b3693314f3914f10a42dea97ad6e06292fcd4a.1637064577.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637064577.git.mchehab+huawei@kernel.org>
References: <cover.1637064577.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_041127_461000_68AE7F66 
X-CRM114-Status: GOOD (  10.35  )
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

Changeset 2f5947dfcaec ("Documentation: move Documentation/virtual to Documentation/virt")
renamed: Documentation/virtual/kvm/vcpu-requests.rst
to: Documentation/virt/kvm/vcpu-requests.rst.

Update its cross-reference accordingly.

Fixes: 2f5947dfcaec ("Documentation: move Documentation/virtual to Documentation/virt")
Reviewed-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/4] at: https://lore.kernel.org/all/cover.1637064577.git.mchehab+huawei@kernel.org/

 arch/riscv/kvm/vcpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index e3d3aed46184..fb84619df012 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -740,7 +740,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		 * Ensure we set mode to IN_GUEST_MODE after we disable
 		 * interrupts and before the final VCPU requests check.
 		 * See the comment in kvm_vcpu_exiting_guest_mode() and
-		 * Documentation/virtual/kvm/vcpu-requests.rst
+		 * Documentation/virt/kvm/vcpu-requests.rst
 		 */
 		vcpu->mode = IN_GUEST_MODE;
 
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
