Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D53C3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 09:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wmi0YLhFnmjgr2HXWtV2f1NS4YncgJtl7gqTSKLE1KU=; b=5DHrssZhDE2PXn
	sK5zO2EcsbDUYOXCk71cxumPI8ZlzQwoJ1+VI4uL6oy+1+ggTQXD/HFV4Dndg8FSE5aKXo9rGY1b6
	S7740914WrLrhuK8eeHPeuSAQK6KVPAi6Yyqw5AU5//lg1vO9939WWp7ZiSeYjSZgDPfcDyXO9bh6
	tg86tsjKXMmSLiwbzr1cpjB5JXiRx21wzoCOFUUu7hSDMFMcb69YXPXdfDN6Fv1u/RNynhJCphkdE
	4i5Fa6fFyTnuawYryxPG5rWTncfPNus7nHhvpwxtkRgKugPjizQqU6l0QdLnQfKAG8ObgnMgSArsX
	3Rv+FxNBZ14mGFxef3GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUkIk-00000002Jdj-0Nws;
	Fri, 19 Jul 2024 09:53:22 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUkIL-00000002JTv-3QTm;
	Fri, 19 Jul 2024 09:52:59 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WQPxP2l7nzyN2R;
	Fri, 19 Jul 2024 17:48:09 +0800 (CST)
Received: from kwepemi100008.china.huawei.com (unknown [7.221.188.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 682FF180088;
	Fri, 19 Jul 2024 17:52:54 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi100008.china.huawei.com
 (7.221.188.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 19 Jul
 2024 17:52:53 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <linux@armlinux.org.uk>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <bhe@redhat.com>, <vgoyal@redhat.com>, <dyoung@redhat.com>,
	<arnd@arndb.de>, <afd@ti.com>, <akpm@linux-foundation.org>,
	<linus.walleij@linaro.org>, <eric.devolder@oracle.com>,
	<gregkh@linuxfoundation.org>, <javierm@redhat.com>, <deller@gmx.de>,
	<robh@kernel.org>, <thunder.leizhen@huawei.com>, <hbathini@linux.ibm.com>,
	<tangyouling@kylinos.cn>, <chenjiahao16@huawei.com>,
	<kexec@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v4 0/3] crash: Fix x86_32 memory reserve dead loop bug
Date: Fri, 19 Jul 2024 17:57:32 +0800
Message-ID: <20240719095735.1912878-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi100008.china.huawei.com (7.221.188.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_025258_041207_2E1BB3F1 
X-CRM114-Status: UNSURE (   8.91  )
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

Fix two bugs for x86_32 crash memory reserve, and prepare to apply generic
crashkernel reservation to 32bit system. Then use generic interface to
simplify crashkernel reservation for ARM32.

changes in v4:
- Add the missing macro for loongarch.
- Only define the macro for 64bit RISCV.
- Signed-off-by -> Suggested-by as suggested.
- Remove the Tested-by as suggested.
- Update the commit message.
- Add acked-by.

changes in v3:
- Fix it as Baoquan suggested.
- Update the commit message.

changes in v2:
- Peel off the other two patches.
- Update the commit message and fix tag.

Jinjie Ruan (3):
  crash: Fix x86_32 crash memory reserve dead loop bug
  crash: Fix x86_32 crash memory reserve dead loop
  ARM: Use generic interface to simplify crashkernel reservation

 arch/arm/Kconfig                           |  3 ++
 arch/arm/include/asm/crash_reserve.h       | 24 +++++++++
 arch/arm/kernel/setup.c                    | 63 ++++------------------
 arch/arm64/include/asm/crash_reserve.h     |  2 +
 arch/loongarch/include/asm/crash_reserve.h |  2 +
 arch/riscv/include/asm/crash_reserve.h     |  4 ++
 arch/x86/include/asm/crash_reserve.h       |  1 +
 kernel/crash_reserve.c                     |  5 +-
 8 files changed, 48 insertions(+), 56 deletions(-)
 create mode 100644 arch/arm/include/asm/crash_reserve.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
