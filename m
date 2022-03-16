Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5FEC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Mar 2022 21:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s3Inp+n8dUqrluxtkH5Z+J3S8MzkFcr4dA2zuEOJkTY=; b=wPYKtOwpda+F+M
	0Jc8lMeKNaV4G3sLfg4bRaC0iLJLw54rF7EfLjIe9q/LubFsPnPx+VN/veoMZdvRt2g/tcfm6C7QX
	e82sIrmdumMLIWdZteWZfKSuR96ZUlYSSOBKM0NbKIFt86NjbZV2iDqJp2U4MplHmJ4A3VbyKOAD0
	Q0jU52BOjanseDTjq2Gyhj2u+rNoFVKBnvJUjFFisw0khDyRDjX+4TozCDP8LM4a47z5jEapjrXqT
	XEgaXvBoRq23rf0l8ZPTO6FhUARyvaBPdlmtijC4SJNmNtTjA0yXMOWruFWXsfMcykxh5apV+/CtW
	DtlsY2BhcS1xTpcmkzCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUauN-00EKHN-V7; Wed, 16 Mar 2022 21:10:15 +0000
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUauL-00EKFl-5v; Wed, 16 Mar 2022 21:10:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=date:from:to:subject:message-id:mime-version;
 bh=zDUoc12E1CnZ/3w5Qjf2PFSbrPcn+lZ9qe+uf7WtJfs=;
 b=fjKtB75K+emp1EJAT1vmsPHGS3sTCXKs38scE1bNRbWftbPPrB+ph6pi
 KuU/fDlNl5GyITPw3OvxOJ8oPeCCWIg+pMolFEl+a3V5NPwdqeO6ffe9i
 FAiGMqAyRt46vzG5pO1S160RWKBxoX4H5DRDCWsZeccLUp1CgvW70siqX U=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,187,1643670000"; d="scan'208";a="26539020"
Received: from 203.107.68.85.rev.sfr.net (HELO hadrien) ([85.68.107.203])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 22:10:07 +0100
Date: Wed, 16 Mar 2022 22:10:06 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
 linux-riscv@lists.infradead.org, anup@brainfault.org
Subject: question about arch/riscv/kvm/mmu.c
Message-ID: <alpine.DEB.2.22.394.2203162205550.3177@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_141013_538901_FD7778E1 
X-CRM114-Status: UNSURE (   5.00  )
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

Hello,

The function kvm_riscv_stage2_map contains the code:

mmu_seq = kvm->mmu_notifier_seq;

I noticed that in every other place in the kernel where the
mmu_notifier_seq field is read, there is a read barrier after it.  Is
there some reason why it is not necessary here?

thanks,
julia

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
