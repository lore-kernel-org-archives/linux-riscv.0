Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4D9C982E1
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 13:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uxnR2R7OrmMQ36MTuBtpcjf12J9dQvm4KjhZLcjP/94=; b=fctJLud23ascXw
	MoobmRWdNfd22lmprQjuU9cfyrFTsCeJ1zQbKs8KheZxaimyA2MXcorlcbzInGs3Q+hp3M5MRXE97
	tUY7LeMhe4ZDCoumrY448UEIXEjAWcDr8xaMEhT6HJrgaSjsP27ysjE/WICjz7zb/x+YcaC3h6yvq
	w182cowd3aOGRrURkLHq0WJBfYYd46m/gpIZgVguZnDtY4vI+sJgI240wfKxPjZ+NQ+oEQvITDqbr
	01vWmIiHxLmQIz2pJgX7QGN+HEAEvK/UP099dujF/q1rGV9eO0Zpv3vW498a0tN3PgTf/WgBcbsac
	avoDiAfEr44FjUy0kJFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8HJ1-0000000HU9I-0sEO;
	Sun, 20 Sep 2026 13:10:07 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8HIx-0000000HU8N-3VV7;
	Sun, 20 Sep 2026 13:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=xT
	nC9jWGLW12aTgRRmdOguEbZvWOQuln9KGAxNvNGak=; b=Hyq93UyWq9S3yt/FL9
	pTitFm1JdF05vAVEXeyyL88yDO6WYoQLAVSv1VhVuVMO9FJZiGbIyiIt14ocxkrC
	HViKNVw6UpOTR4371oIKww1SGAl8Y+tmgl8hIfCMX5EpnnZHS10uTVzb8/fkjE2L
	478dEpIEnyRShcezOmrfyUuY8=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDnr9_C2q9qDpfBAQ--.40005S2;
	Sun, 20 Sep 2026 21:08:19 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: anup@brainfault.org
Cc: Pengpeng Hou <hppiscas@163.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atish.patra@linux.dev>,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Nutty Liu <nutty.liu@hotmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>
Subject: [PATCH v2 0/2] RISC-V: KVM: Validate AIA MMIO ranges against GPA width
Date: Sun, 20 Sep 2026 21:08:16 +0800
Message-ID: <cover.1789872556.git.hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: PigvCgDnr9_C2q9qDpfBAQ--.40005S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr13ZrW3Ar4rGFy8XFy7ZFb_yoWkurg_ua
	18Kryaqw48Wa1UCa4qyr4rXr95C3yrGFW5AFyYyr1fJr9xXFnxWF4kGr1rXF1UG3yYyF1D
	Zr9a9w4fGryIyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRNMan7UUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxgRuN2qv2sQC6QAA3r
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_061004_187598_5A05376E 
X-CRM114-Status: UNSURE (   6.68  )
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

This revision keeps the existing mandatory-address checks and narrows
the initialization revalidation to APLIC. An IMSIC address is only set
after a vCPU exists, which already freezes the selected GPA width.
APLIC can be configured earlier, so its range is rechecked at init.

Patch 2 keeps the previously reviewed GPA-width freeze unchanged.

Changes since v1:
https://lore.kernel.org/r/cover.1786512671.git.pengpeng@iscas.ac.cn/
- Preserve the required-address checks and existing cleanup path.
- Remove the all-vCPU range-validation pass.
- Explain why only APLIC needs a range recheck before initialization.
- Retain Anup's Reviewed-by for unchanged patch 2.

The issues were found by our static-analysis tool. AI assistance was
used to revise the patches and descriptions following the review.


Pengpeng Hou (2):
  RISC-V: KVM: Validate AIA MMIO address ranges
  RISC-V: KVM: Disallow GPA-width changes after AIA init

 arch/riscv/kvm/aia_device.c | 42 +++++++++++++++++++++++++++++++++----
 arch/riscv/kvm/vm.c         |  3 ++-
 2 files changed, 40 insertions(+), 5 deletions(-)


base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
