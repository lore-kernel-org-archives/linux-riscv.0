Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7F3C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 13:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5x5s6hWB0T9M0RM5OXZelmXAXuDbFBfg45+PGAIYrL8=; b=ZfsVFiVRvY8iKg
	CvrL7RwgIGVV1YWw0Xh5d8U0tzwW3rmsXCmFd0DELs0Bh1AxF+uDmKBJBkmyKWiPyeIT8a6jeeX8f
	QhrvN/p6l156XP4Wg7OwWRCFVS8s4pJzdd8zUMOPfyR4k7kfW9UqwFAnneOK4kBVhfoX4cfDEND4d
	EXzh+pj3fUXXlIv20IAFaP6Cok/8ung83f7RGYp4i9vXEiFoH4OXwnkabtmiG7Et2O3p/+CQIrCgn
	Li7eW7kdzXGpGLedgoQdnHcxZWnfJLMegbCu4ICo17q1AZ6K8tZ3j7U/irH6bMi3a8K+tB36r69TR
	sAz4kEyjVwzU5L3+VKvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2P5-00BkKo-0D;
	Tue, 12 Dec 2023 13:02:27 +0000
Received: from fzi-msx-e-01.fzi.de ([141.21.8.251])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2Oz-00BkHq-21
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 13:02:24 +0000
From: Frederik Haxel <haxel@fzi.de>
To: 
CC: Vitaly Wool <vitaly.wool@konsulko.com>, Frederik Haxel <haxel@fzi.de>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Greentime Hu
	<greentime.hu@sifive.com>, Andy Chiu <andy.chiu@sifive.com>, Heiko Stuebner
	<heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>, Sami Tolvanen
	<samitolvanen@google.com>, Masahiro Yamada <masahiroy@kernel.org>, Guo Ren
	<guoren@kernel.org>, Nam Cao <namcaov@gmail.com>, Alexandre Ghiti
	<alexghiti@rivosinc.com>, Andrew Morton <akpm@linux-foundation.org>, "Anup
 Patel" <anup@brainfault.org>, Baoquan He <bhe@redhat.com>, Chen Jiahao
	<chenjiahao16@huawei.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=
	<bjorn@rivosinc.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] Fix XIP boot and make XIP testable in QEMU
Date: Tue, 12 Dec 2023 14:01:11 +0100
Message-ID: <20231212130116.848530-1-haxel@fzi.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [141.21.46.139]
X-ClientProxiedBy: fzi-msx-05.fzi.de (2001:67c:2acc:8:141:21:17:45) To
 fzi-msx-05.fzi.de (2001:67c:2acc:8:141:21:17:45)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_050221_663913_5AC562CB 
X-CRM114-Status: UNSURE (   7.56  )
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

XIP boot seems to be broken for some time now. A likely reason why no one
seems to have noticed this is that XIP is more difficult to test, as it is
currently not easily testable with QEMU.

These patches fix the XIP boot and allow an XIP build without BUILTIN_DTB,
which in turn makes it easier to test an image with the QEMU virt machine.

Frederik Haxel (3):
  riscv: Make XIP bootable again
  riscv: Fixed wrong register in XIP_FIXUP_FLASH_OFFSET macro
  riscv: Allow disabling of BUILTIN_DTB for XIP

 arch/riscv/Kconfig                 | 6 +++---
 arch/riscv/include/asm/xip_fixup.h | 2 +-
 arch/riscv/kernel/head.S           | 5 ++++-
 arch/riscv/mm/init.c               | 8 ++++++--
 4 files changed, 14 insertions(+), 7 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
