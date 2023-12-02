Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2820EC4167B
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Dec 2023 14:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FudkQOEq+g0fjHRkv6l1RaREvHvwoGTtHrvomNbjnbM=; b=oTLShHqWFmSuzH
	LaWFiBNrHFoYLoeOa7DzcEBkK32i9KBl4Wzf5t4p/gtUccpq7kNnlsxtJ8gUi/jw11G6kqIeV3K8I
	uBZ50B7mF1lO8PO8/Rx39i32nO8edq4uIwSbCm9ewJbIfDxtg39/txNCM9iD3ol6dGpw/WQKhzj/Q
	D4Sjd+FaUoquRNi+OJkQsFdnynqj7E9xD0Z/6H7jIPdxpRFz4F6zvzBgUUetp0cc1Iym/i4tvkiEh
	MZQjl1WbbQ0BfpnR8nrAGtGw+UAXUJ+fg1y0Qik0IkjKbUehjSYy3G2w/QnuU18bFS9S7gD7Yrmpx
	LROj5M+t6vzI9plUn0Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9Qmi-00Fmnv-00;
	Sat, 02 Dec 2023 14:15:56 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9Qme-00Fmm5-2l
	for linux-riscv@lists.infradead.org;
	Sat, 02 Dec 2023 14:15:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4B338CE1A9B;
	Sat,  2 Dec 2023 14:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388EDC433C9;
	Sat,  2 Dec 2023 14:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701526549;
	bh=S2+zqveKrbdhHD/E0gLVDfqMZhNfNga2QuZZLKEkKts=;
	h=From:To:Cc:Subject:Date:From;
	b=E9/n4SDNzT+7E/XzeFkmkbteR4trXt4gqLfwdTDooFabkERe72aNvNceCOKnJiIYV
	 w1q2lRB4TxZZ/zydPWbcLvVuaZ0pWcsjOrDyYZeTLao7Tu8hDxlCWHSx6OUOyt2xVF
	 mBovBn2E6dFggfIw8zzWNmgQu+ICALfWlrB8FvBpzDKy5iqXeMuFtKYNaR6sFQXjFU
	 cA8y7YjlJNL+pfYyjKZK6PITtwrbk1V4SJbB7BqdQHa0NyW8mPV4W4g5BgocoxYl8p
	 KuUDlCV+V4KOreLLQyhwwAkc7cFqoOGNxe4bo6aq77YkRcSJ/cSM48jhOAFzOweMwp
	 hGxKuRGbbxaMQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] riscv: enable lockless lockref implementation
Date: Sat,  2 Dec 2023 22:03:21 +0800
Message-Id: <20231202140323.315-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231202_061553_120939_F7739F5B 
X-CRM114-Status: UNSURE (   6.78  )
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

This series selects ARCH_USE_CMPXCHG_LOCKREF to enable the
cmpxchg-based lockless lockref implementation for riscv. Then,
implement arch_cmpxchg64_{relaxed|acquire|release}.

After patch1:
Using Linus' test case[1] on TH1520 platform, I see a 11.2% improvement.
On JH7110 platform, I see 12.0% improvement.

After patch2:
on both TH1520 and JH7110 platforms, I didn't see obvious
performance improvement with Linus' test case [1]. IMHO, this may
be related with the fence and lr.d/sc.d hw implementations. In theory,
lr/sc without fence could give performance improvement over lr/sc plus
fence, so add the code here to leave performance improvement room on
newer HW platforms.

Link: http://marc.info/?l=linux-fsdevel&m=137782380714721&w=4 [1]

Since v1:
  - only select ARCH_USE_CMPXCHG_LOCKREF if 64BIT

Jisheng Zhang (2):
  riscv: select ARCH_USE_CMPXCHG_LOCKREF
  riscv: cmpxchg: implement arch_cmpxchg64_{relaxed|acquire|release}

 arch/riscv/Kconfig               |  1 +
 arch/riscv/include/asm/cmpxchg.h | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
