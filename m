Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E34DC6FD18
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 14:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BWUesrXpQ8Gi/Xyx0VXopwT6B9+Tw458zoEl+zBQQZM=; b=25mJjbxmBBGOLA
	9zrFjmsCwWzhnpktASyh45IRYxi/RGFn3w0PMFaiWpwlDw8tO1Hs+Ur09HS+6VyqJ5EAoT9XZyhGZ
	2t4X94LSDh2j5E/QM/TuQ7QqP1E1wgSCsIFD0cdOO1eT+ewewgtGqqMyRyV5a0rana3ZNp3/ZNcZR
	xhSzbsIWewH4WuHRfXzG7vx79BckYjEgXQFgMuwZFMRoEE7f3zxH4ZOA2Tm6a197evhKmL3qeJToY
	Cn6cGwq70tVjcbsRsdbk3BcZ75SjWCd68J4L/6TwFyGJkSkC4wvqBEMhrEm+1Iomic8KS3iMa0AH7
	cBjorF7yC6marYEdgKfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pomES-002Q7y-1s;
	Tue, 18 Apr 2023 14:22:56 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pomEP-002Q5Q-2m
	for linux-riscv@lists.infradead.org;
	Tue, 18 Apr 2023 14:22:55 +0000
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1pomEF-000Ub8-Ed; Tue, 18 Apr 2023 15:22:43 +0100
Received: from ben by rainbowdash with local (Exim 4.96)
	(envelope-from <ben@rainbowdash>)
	id 1pomEF-0066nU-0Q;
	Tue, 18 Apr 2023 15:22:43 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: kvm@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	ajones@ventanamicro.com,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH kvmtool 1/2] riscv: add mvendorid/marchid/mimpid to sync kvm_riscv_config
Date: Tue, 18 Apr 2023 15:22:40 +0100
Message-Id: <20230418142241.1456070-2-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230418142241.1456070-1-ben.dooks@codethink.co.uk>
References: <20230418142241.1456070-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_072253_895385_EF31B9A3 
X-CRM114-Status: GOOD (  10.14  )
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

Add the ONE_REG for the mvendorid/marchid/mimpid from the kernel
commit 6ebbdecff6ae00557a52539287b681641f4f0d33, to ensure the
struct is in sync with newer kernels for adding zicboz.

Ref: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/id=6ebbdecff6ae00557a52539287b681641f4f0d33

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 riscv/include/asm/kvm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/riscv/include/asm/kvm.h b/riscv/include/asm/kvm.h
index 8985ff2..92af6f3 100644
--- a/riscv/include/asm/kvm.h
+++ b/riscv/include/asm/kvm.h
@@ -49,6 +49,9 @@ struct kvm_sregs {
 struct kvm_riscv_config {
 	unsigned long isa;
 	unsigned long zicbom_block_size;
+	unsigned long mvendorid;
+	unsigned long marchid;
+	unsigned long mimpid;
 };
 
 /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
