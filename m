Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8BCC4708E
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 18:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6+5tSRgKLZzkompVJWdHrl40LNAWsnYAhSgg/lrDrOs=; b=CUqHHlCZ909BZV
	ptx3mtXk5Yhy4zfkuAtP7ChluInQYTaAILOYqZMNJijTsV2tIBMsXV+RgV0MfuUzkCASNZGWRXXUk
	JypsyISmOqGHsmoirfqXst87qzEYwAdDluFJpW3XTWoAAFtxn5hGBzYpBJcVX+v/OtSZVJEODOkox
	x7x7MEtW4fB96Fsgs7V7f4U7+ZPSFgfXM33j8/9fzLnx1mz1duswiqPWiCOONLf0luCVZxAjoBCGn
	SdBaEqdMfJwmxE5h6VG3//S1CBUjQzxLd57zmf0ENqY3MPabR15Tjq4NBWL2G+Vij422KgYOtCVx5
	rBfZL2DDeAmLYhLpAiig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVAl-00DkJp-Et; Thu, 05 Jan 2023 18:41:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDEGv-00EoJI-O1; Thu, 05 Jan 2023 00:38:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 094A2618C2;
	Thu,  5 Jan 2023 00:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20BF4C433F1;
	Thu,  5 Jan 2023 00:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672879095;
	bh=Dk3fbmwrwKI+Ju1OKvba1E6k//C52GxxfEwKgJeFV/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UiOT16+5fy+ZmlY3dQ4rBYsTA89IkFc+A4RtgWUMm8g2H27yGepuXpenbS3q+7Fen
	 Yx9qedTGLeb2TG7J+JgxnX3VlWN+r1jCHZzXQ8hIWpQdqo+sEy6p5G+7gYq6TpQANG
	 JJL4jlHAbAMXa7dvcsyOZPZ+gT2k69uYrvw0pvj21ot5Jbq27mUqcSrRHbi6k+fRyM
	 7D/hGfrezAZpbakTuKPhgqM3t6uu8v1J9nihITN51oGbesCYuEBUz55kGA/kPZU+O/
	 Syr6yvA9o1/kr7cIGRB8rZnxb4fr7oWSMrPDeDY+RcF0U/cLTMQ698RB2/u4yLdAXD
	 TQtcUHdY/9e/g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id BE0335C149B; Wed,  4 Jan 2023 16:38:14 -0800 (PST)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: rcu@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	rostedt@goodmis.org,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH rcu 05/27] arch/riscv/kvm: Remove "select SRCU"
Date: Wed,  4 Jan 2023 16:37:51 -0800
Message-Id: <20230105003813.1770367-5-paulmck@kernel.org>
X-Mailer: git-send-email 2.31.1.189.g2e36527f23
In-Reply-To: <20230105003759.GA1769545@paulmck-ThinkPad-P17-Gen-1>
References: <20230105003759.GA1769545@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_163817_969623_E3380076 
X-CRM114-Status: GOOD (  12.54  )
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

Now that the SRCU Kconfig option is unconditionally selected, there is
no longer any point in selecting it.  Therefore, remove the "select SRCU"
Kconfig statements.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atishp@atishpatra.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: <kvm@vger.kernel.org>
Cc: <kvm-riscv@lists.infradead.org>
Cc: <linux-riscv@lists.infradead.org>
---
 arch/riscv/kvm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index f36a737d5f96d..6bc9b290c1283 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -27,7 +27,6 @@ config KVM
 	select KVM_XFER_TO_GUEST_WORK
 	select HAVE_KVM_VCPU_ASYNC_IOCTL
 	select HAVE_KVM_EVENTFD
-	select SRCU
 	help
 	  Support hosting virtualized guest machines.
 
-- 
2.31.1.189.g2e36527f23


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
