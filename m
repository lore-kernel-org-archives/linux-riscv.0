Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE93CD98E0
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 23:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R4JgEnU8H9yLATmiuJoAbd/SKHCq7kZG2j34qO+h9Nc=; b=cM52iaukYaScPf
	Oaf8ikDdpw1DdOMJat+g/BPd2SVgbG+zmLuAP6vKSZtNon8tmbtRHNYwO/VnDcdVp8BPi/pioIZ/C
	EZ+E0IWyBnGPrXS8ew6htIhUaiKuYFTEl9+BjJYOmqnlAtEM2SERMypO/gFm9i8erFyVn0JVagtDI
	hioGN6FD37mszGAwu06KJ9TIiV/Koi6sirgtpr4a1E39RFMjlViy0FHN7N8rVTO/cI5efTBa1rAC6
	7Hwf4WJtV1P/CksJkGNng6cOu/o1ahQqAuv5QjULzIfJmkNJ6hXc1WaCDweXuplq0HvAWuMGpZKgK
	vz528h3tezaw53NBwF9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGjV-0000000EwNs-1auV;
	Mon, 15 Jun 2026 23:28:45 +0000
Received: from out-174.mta1.migadu.com ([2001:41d0:203:375::ae])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGjQ-0000000EwNE-3Dut
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 23:28:43 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781566115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4xr3tBk+BcbA0Ah+NVqqu2m6gD+J6uNNVuR2VL7WtzI=;
	b=ISP+HsIXpQlsmofH36Ugigwu7YMla5aN6h9djLvy+3PewRaTGPwX1SLAO5LIN80oC5DqfL
	ypMeNdRxv2pa0al8G2cGwjBTeu8iZQNvxdUBH8Jd2um+fIQGe48AgTjGFMiEL55FWE5+NN
	P8rpR0rYGX7GMaMybJhSkG8/4KP3cZ4=
From: Atish Patra <atish.patra@linux.dev>
Subject: [PATCH 0/2] riscv: Use EFI runtime services for poweroff and
 restart
Date: Mon, 15 Jun 2026 16:28:20 -0700
Message-Id: <20260615-efi_reset_shutdown-v1-0-9414edcbbab0@meta.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJSKMGoC/x2MWwqAIBAAryL7naD2sq4SEVFb7o+G2wuiuyd9D
 szMA4yRkKEVD0Q8iSn4BDoTMLnRryhpTgxGmUpVupS40BCRcR/YHfscLi/rxqhCjTZftIUUbjF
 J9z/t+vf9AIeN/SRkAAAA
To: Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Atish Patra <atish.patra@linux.dev>
Cc: linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Atish Patra <atishp@meta.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_162841_452306_86F52837 
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

Today RISC-V always uses the SBI SRST extension for both poweroff and restart,
even when UEFI runtime services are available. This series makes RISC-V prefer
EFI runtime services for both paths when available. The reset via EFI is
required for EFI capsule updates and also documented as a preferred method
in BRS 1.0 spec (e.g. URT_030)[1] 

Behavior on SBI-only (non-EFI) systems is unchanged.

Tested under QEMU 'virt' with EDK2/UEFI firmware exposing runtime
ResetSystem().

[1] https://docs.riscv.org/reference/brs/uefi.html#uefi

Signed-off-by: Atish Patra <atishp@meta.com>
---
Atish Patra (2):
      riscv: efi: Power off via EFI runtime services when available
      riscv: Restart via EFI runtime services when available

 arch/riscv/kernel/efi.c   | 5 +++++
 arch/riscv/kernel/reset.c | 7 +++++++
 2 files changed, 12 insertions(+)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260615-efi_reset_shutdown-792040a83f18

Best regards,
-- 
Atish Patra <atishp@meta.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
