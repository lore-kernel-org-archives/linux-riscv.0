Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70464C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Nov 2021 16:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pr2DmNdyz1rGOtT1eHpeOxbpyo7WRKQzPvOWhlYO7ZM=; b=nzzIQxxB2dFf8z
	nw7TMlemidSQw9OCEySZvujPvO6QeW9aSZFYapae0cOz/IMQG/IAWZzsQY7Edn0fq+t0lj1xjyaOI
	MVWF5Q013DruLxOQbHxqXW/vatGxOxCazdbwz02nc6JRac63SbyIqKqOb8CQoxF8AE71T4l2blS3N
	Iftk6RyTdiNsuIpBGHsr+UYtNpKfTr1nsVBv9AHjRZwf/3w3yUnSaPf4szSIwrWHomr2S/8dEexZV
	y4J5ZVIO/yDMM/Wc33rgbTLnJcoMEcX9pHQkj4YMFiWgKufr4fGxi3lxj5eCLL3VFepUp2CRK8WNH
	VGKtHouMFSXFqZgUJ6BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrMpO-00G9YY-20; Sun, 28 Nov 2021 16:14:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrMpL-00G9Xl-Lh; Sun, 28 Nov 2021 16:14:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9086360FE7;
 Sun, 28 Nov 2021 16:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC91C004E1;
 Sun, 28 Nov 2021 16:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638116094;
 bh=vHDplKEDLCK/kpKCYkZg98w+XWHX6aiLaK0i/C/Hktg=;
 h=From:To:Cc:Subject:Date:From;
 b=Gpq7AS8WI+lWVCKh3ewefnBYpCMWnrfBjubh8AiL4nnzXPD5Dcrt7Ha3F8WVnvYc0
 dAJ5ra6jNsGnMaWXQvOmehg6Vf/QRnFXwEVg7GG/Uu6G3DW2EJwSykdjHLs6Plg0w0
 YoJ0bU5vsqpLF5gi4LtSb0pZa28gtuXtVpQBN+hkOdcvuX8CmpO/XAqq9EhMbzmdup
 sS+ktGwp5qO86A3uR/eNyTDTm/6ko6fy6kCSv0c0SoG/Rv4dqvueuL1F2UP4apl3b5
 +tJ7qLdP41CKoCukhosiZNApfNyHI7C0U+oxgmSdXZY1nmlnH8vCIC3yeFGntuuZ9r
 2F+8M/UTvFnOQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm-riscv@lists.infradead.org
Subject: [PATCH 0/5] riscv: misc clean up
Date: Mon, 29 Nov 2021 00:07:36 +0800
Message-Id: <20211128160741.2122-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_081455_794099_38AD06F8 
X-CRM114-Status: UNSURE (   8.06  )
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

This series is a misc clean up: clean up useless LoCs, or make some
functions static, or mark function pointer as __initdata, or remove
one function().

Jisheng Zhang (5):
  riscv: remove cpu_stop()
  riscv: head: make secondary_start_common() static
  riscv: kvm: make kvm_riscv_vcpu_fp_clean() static
  riscv: errata: alternative: mark vendor_patch_func __initdata
  riscv: head: remove useless __PAGE_ALIGNED_BSS and .balign

 arch/riscv/errata/alternative.c | 3 ++-
 arch/riscv/include/asm/smp.h    | 2 --
 arch/riscv/kernel/cpu-hotplug.c | 8 +-------
 arch/riscv/kernel/head.S        | 9 ++-------
 arch/riscv/kvm/vcpu_fp.c        | 2 +-
 5 files changed, 6 insertions(+), 18 deletions(-)

-- 
2.34.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
