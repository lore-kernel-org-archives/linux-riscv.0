Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6763C77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 13:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L6SXz/cT+Gb6IDcyHoBsNNCY6KeIveGQKjYqLi3Rjow=; b=0ui6nhTq8UR1Yv
	c0WmxyiCYHQH2D5mcVEVM9FHud1hJXhPQJ1t05KmRzSkrierlIVzWxRUT3DnpnTwVdwWku8pxdEz4
	9puLuMsDGnCavtgTBEI7Q7Y2LfNe9N5NbIr0d5EJsp7CCWaVaFE3Vlvytq9pSBLNNe7hPbFMmfQPK
	wP7BwA6a8xgxohjhQx6iXqjV6xAxSpz2LZTuW9HzVgeX/aTqvEz1O+pPjM2dV416ZNkKRfGZtV9D5
	7rIufDXcZWFe4iGYfOgIaPk9R6kyhNzUnPvVvG78bmAhtTTtjOEcbkqx6bL9or17VWJAtg0ftGjGU
	bM5orDx2VXO91abj2T6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdSR-00D3Eh-0B;
	Thu, 18 May 2023 13:14:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdSP-00D3DU-0T
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 13:14:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AC4B064F51;
	Thu, 18 May 2023 13:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867F1C433EF;
	Thu, 18 May 2023 13:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684415652;
	bh=MyHJegve8NZNKQPZ+1otBp4zGgUGxsJifmAO8XUsjmQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zku0hQdEV1exPT3SP1wIQ3khOpfFtF+qMJJdeGimM00UCnJ1z3lRyLxy9ZeaD2GA7
	 kvoGNPfdoFZBUI8hyocJ1TK5nCnDerh6/rWdFQpX0MMpjQSpxJ1CXOfKRYjiccD3io
	 FtdTmfxlGx/TOtpIclqH9RrchewsGAgtATU3mwpvt9agtw7b2QVRk1nG0JR14UNyJ7
	 fg2V4YuaXuF4bmFv5DoNlcrrJScjph1XlhNBoBbIU2eEZ4T3czhDyVHPfiU1uV8QjI
	 LxnVDvrIPbL1FwdEXwlde2XnhMZ4T3p3eHq766tK8/WKOHqP1rmj8aIwCynqDNeSnu
	 wpQLSaWkHWYFw==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	mark.rutland@arm.com,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	rppt@kernel.org,
	anup@brainfault.org,
	shihua@iscas.ac.cn,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	luxufan@iscas.ac.cn,
	chunyu@iscas.ac.cn,
	tsu.yubo@gmail.com,
	wefu@redhat.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	corbet@lwn.net,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH 18/22] riscv: s64ilp32: Disable KVM
Date: Thu, 18 May 2023 09:10:09 -0400
Message-Id: <20230518131013.3366406-19-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230518131013.3366406-1-guoren@kernel.org>
References: <20230518131013.3366406-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_061413_235070_53AF6A64 
X-CRM114-Status: UNSURE (   9.35  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Disable the KVM host feature for s64ilp32 first, and let's work on this
feature after the s64ilp32 main feature is merged.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <anup@brainfault.org>
---
 arch/riscv/kvm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index d5a658a047a7..a91ce7e0b754 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -20,6 +20,7 @@ if VIRTUALIZATION
 config KVM
 	tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
 	depends on RISCV_SBI && MMU
+	depends on !ARCH_RV64ILP32
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select MMU_NOTIFIER
 	select PREEMPT_NOTIFIERS
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
