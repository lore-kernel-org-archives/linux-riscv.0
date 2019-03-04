Return-Path: <SRS0=iqkr=RH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C790C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2019 08:27:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 562D920823
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2019 08:27:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="syo1ITbh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="drq0BKo+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 562D920823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TOZvaQ7ZJyXwvfYhFTjVJiBHUWGtPlf25t0Sflt7Fsw=; b=syo1ITbhjB7qx8
	MeJ5Qx9H4qauGhnnzzjjiS/MA9CNWIl1dFVaavH92lOSrhBPpCI+yiqmgbyTOFPO5JiAQ2us5Kheb
	+vmw+PXi54ZsbEesphEjSATafCGeIlUvzK83wdtlKhPs27HEC9MEemW+Sv9AzoEdQwvcWkmCsSk3F
	qm/Jt9RgC3uVMe3/ZkbaFP0rbFd3Y9Bm9LM4uwnHUC0vJsDbXt3c8bZmkaT5ccKlbA10Z8yGvyAkC
	cNPoZa70EyVF06Ik3CvSWBQWNrw3GlYbziGaYVBGvyKC4SZOEY8VpvFrRydbIXBjB85FQlenetymV
	3ENLfpl5EJZr+khP3QeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0iwr-0008Eg-Le; Mon, 04 Mar 2019 08:27:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0iwo-0008EF-7r
 for linux-riscv@lists.infradead.org; Mon, 04 Mar 2019 08:27:43 +0000
Received: from localhost (5356596B.cm-6-7b.dynamic.ziggo.nl [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E31020823;
 Mon,  4 Mar 2019 08:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1551688060;
 bh=1SwplH6VUws6P5E0c+remyQ9+KqB2xc+5OF72RAyawU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=drq0BKo+ePH8jhq0cz3s8xhLVR3AdsMrmw3tKYdIwNvNpiH/uvS7wWlgIQuhSO69a
 uWML5RINm7EuhBLZtthpDTqKKj6DQcT4+RD8/ObybtOcu7D/Wy22ZIrSJ7LOAi/PjR
 mLAwp/MeGkYpKyLkclGXSmOJPKcROUSEZNp22Opw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4.14 50/52] MIPS: fix truncation in __cmpxchg_small for short
 values
Date: Mon,  4 Mar 2019 09:22:48 +0100
Message-Id: <20190304081619.964223194@linuxfoundation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190304081617.159014799@linuxfoundation.org>
References: <20190304081617.159014799@linuxfoundation.org>
User-Agent: quilt/0.65
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_002742_308788_B0C5EECC 
X-CRM114-Status: GOOD (  11.28  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Linux MIPS <linux-mips@linux-mips.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Michael Clark <michaeljclark@mac.com>, Paul Burton <paul.burton@mips.com>,
 RISC-V Patches <patches@groups.riscv.org>,
 Linux RISC-V <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

4.14-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Michael Clark <michaeljclark@mac.com>

commit 94ee12b507db8b5876e31c9d6c9d84f556a4b49f upstream.

__cmpxchg_small erroneously uses u8 for load comparison which can
be either char or short. This patch changes the local variable to
u32 which is sufficiently sized, as the loaded value is already
masked and shifted appropriately. Using an integer size avoids
any unnecessary canonicalization from use of non native widths.

This patch is part of a series that adapts the MIPS small word
atomics code for xchg and cmpxchg on short and char to RISC-V.

Cc: RISC-V Patches <patches@groups.riscv.org>
Cc: Linux RISC-V <linux-riscv@lists.infradead.org>
Cc: Linux MIPS <linux-mips@linux-mips.org>
Signed-off-by: Michael Clark <michaeljclark@mac.com>
[paul.burton@mips.com:
  - Fix varialble typo per Jonas Gorski.
  - Consolidate load variable with other declarations.]
Signed-off-by: Paul Burton <paul.burton@mips.com>
Fixes: 3ba7f44d2b19 ("MIPS: cmpxchg: Implement 1 byte & 2 byte cmpxchg()")
Cc: stable@vger.kernel.org # v4.13+
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 arch/mips/kernel/cmpxchg.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/arch/mips/kernel/cmpxchg.c
+++ b/arch/mips/kernel/cmpxchg.c
@@ -54,10 +54,9 @@ unsigned long __xchg_small(volatile void
 unsigned long __cmpxchg_small(volatile void *ptr, unsigned long old,
 			      unsigned long new, unsigned int size)
 {
-	u32 mask, old32, new32, load32;
+	u32 mask, old32, new32, load32, load;
 	volatile u32 *ptr32;
 	unsigned int shift;
-	u8 load;
 
 	/* Check that ptr is naturally aligned */
 	WARN_ON((unsigned long)ptr & (size - 1));



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
