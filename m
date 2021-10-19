Return-Path: <SRS0=MdyL=PH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA302C43217
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 08:04:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0D866112D
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 08:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0D866112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yzEyP+03/i18YkwmKTuSixBzeCQ8Tjh9WoAulKAPQ8A=; b=zRytXT73HgJha6
	CrDv/shrVCpkEMGifJAp6cDYSbCcKu1MLunvtgBN7TstREweYxaoQlFxV36vPqPiojBrLHg1dwfBA
	2FSmp70BZXuSGhCKJWsqZSsq4Ag+GB0nSe2S/bijnctcky/awsEbwY1miMVep9CcoR52Krp3hoOXl
	HQ7b2pdUMohvE4AE0GYRqgaw+XTnb7cFgCLXO0XXWx7YgIBur87w7Y6xUV15XLwGFghe8tgCexFbS
	7G33WiGv0eUC9BZwVCeI0HjDVECfqToK8hL0d/i4aKqn6pvHSiLGLXRYkkddO0J+pnZBdj0S5VQ80
	m7RclH4YMJ0WoRsFQBhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mck6v-000UPU-67; Tue, 19 Oct 2021 08:04:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mck6m-000UEs-II; Tue, 19 Oct 2021 08:04:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A0BAA6139D;
 Tue, 19 Oct 2021 08:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634630667;
 bh=tec3N26Ppj3HiN6XnRgihubCdhjpDSY4LAigZu83/u8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tHUasibGDKgOMPqbVa3yy31jaz86MII3c+HeUbc0odcKyo2dDxEgew+l1F+lL5eJ3
 8zc5U3379u+Wuk0mGZ5PZx0yQlfH1aWR9N+tUhdXUP/E9cNteKdi0/5vePojp7RYtL
 RrBaeTb88qfQPqgwDZffQKL08J8Yj6JHiJdjM5cEGfYpcZz/mXFNVj4y5w/6HaZQ6p
 J8bJRq8sFEgXsVWswBlIx92EqX2W4ZdzOwyDES0Vd0S8t1RpO0mIOyD7bkqdRW08eO
 ccdLhc2Lb7x+hYEFbYSVx+7nFghOTaIjyBIyoW35P2BpUH2oifrGjxIINsRaK1u4xb
 A+x5paxMCjuJQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1mck6j-001oJR-6m; Tue, 19 Oct 2021 09:04:25 +0100
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
Subject: [PATCH v3 13/23] Documentation: update vcpu-requests.rst reference
Date: Tue, 19 Oct 2021 09:04:12 +0100
Message-Id: <1f62fdbd0dd9298a19c491447a4b415a8ef3bd69.1634630486.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1634630485.git.mchehab+huawei@kernel.org>
References: <cover.1634630485.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_010428_697955_8890F08F 
X-CRM114-Status: GOOD (  10.56  )
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
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v3 00/23] at: https://lore.kernel.org/all/cover.1634630485.git.mchehab+huawei@kernel.org/

 arch/riscv/kvm/vcpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index c44cabce7dd8..260ce0779a32 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -912,7 +912,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		 * Ensure we set mode to IN_GUEST_MODE after we disable
 		 * interrupts and before the final VCPU requests check.
 		 * See the comment in kvm_vcpu_exiting_guest_mode() and
-		 * Documentation/virtual/kvm/vcpu-requests.rst
+		 * Documentation/virt/kvm/vcpu-requests.rst
 		 */
 		vcpu->mode = IN_GUEST_MODE;
 
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
