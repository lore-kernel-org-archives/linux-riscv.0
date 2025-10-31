Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0E2CCF9F0
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 03:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pU3zVil4O7uV2dxkbHa+bLwTvPN9wL2rnENRk2CKj2o=; b=JEtryPxdC2kIDd
	LmOmHEmlkGIG2t52CiGCm1Y4hYX95z8c4tSS6qkWI8e1epenAhm3fVFVrMVrtO6PZ3ZTuPn/5zCpy
	8xdyMdI3E8IwwMr4IyTw1Q6xkRPcP57uJndyiHleFCnra2VTpDhGalLrCGc4xv/1kkoOA0lH/riid
	OI4uziCQnEo/bcVF+DNh1dRx843P06kWgWipAH7E7MVa14XYyyXx4rmrKWk/IQX73+6We2O3GVQHF
	1Sp5ZEdcynZk1My0DpW42j9hLXlEwRTW5q63GrMKuxinj+J+ZNyLgNuZcwl+3j/oS8WnfxXj84V5S
	Xk23mLh5eQRhxiTZtiBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfZD-00000005JUL-2hi9;
	Fri, 31 Oct 2025 03:12:43 +0000
Received: from mail.loongson.cn ([114.242.206.163])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfZ8-00000005JU1-2g3O
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 03:12:41 +0000
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Axjr8gKQRpkOwcAA--.60913S3;
	Fri, 31 Oct 2025 11:12:32 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJBxysAbKQRpGMkeAQ--.13727S2;
	Fri, 31 Oct 2025 11:12:28 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/6] KVM: LoongArch: selftests: Add timer test case
Date: Fri, 31 Oct 2025 11:12:21 +0800
Message-Id: <20251031031227.4020738-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
X-CM-TRANSID: qMiowJBxysAbKQRpGMkeAQ--.13727S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_201239_142551_16D10359 
X-CRM114-Status: UNSURE (   6.29  )
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

This patch set adds timer test case for LoongArch system, it is based
on common arch_timer test case. And it includes time counter function,
one-shot/period mode interrupt, and software emulated timer function
test.

Bibo Mao (6):
  KVM: LoongArch: selftests: Add system registers save and restore on
    exception
  KVM: LoongArch: selftests: Add exception handler register interface
  KVM: LoongArch: selftests: Add basic interfaces
  KVM: LoongArch: selftests: Add timer test case with one-shot mode
  KVM: LoongArch: selftests: Add period mode timer and time counter test
  KVM: LoongArch: selftests: Add SW emulated timer test

 tools/testing/selftests/kvm/Makefile.kvm      |  10 +-
 .../kvm/include/loongarch/arch_timer.h        |  84 ++++++++
 .../kvm/include/loongarch/processor.h         |  81 +++++++-
 .../selftests/kvm/lib/loongarch/exception.S   |   6 +
 .../selftests/kvm/lib/loongarch/processor.c   |  38 +++-
 .../selftests/kvm/loongarch/arch_timer.c      | 187 ++++++++++++++++++
 6 files changed, 400 insertions(+), 6 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/include/loongarch/arch_timer.h
 create mode 100644 tools/testing/selftests/kvm/loongarch/arch_timer.c


base-commit: e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
-- 
2.39.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
