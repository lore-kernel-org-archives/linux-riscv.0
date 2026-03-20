Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C9E1093168
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 02:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gysn1LnAe6vp2I/z5d315o+lN/bx0hHYRu6567/YBjc=; b=fHvgETMDjE1Evk
	qqSXvfWdTdcRueV5JEO59GXYduuCgI9b32FtSjCtedplDGdNhV7pae048IzVTy1NDHyvLNdrvzBVl
	KO2ezuTUKG/25928Tj0HC+p/KPxLI0tLhA4VIQbKg08JywtIm4YOausPWm/gURMJcuLzBXDo2gG6d
	R0Xzm8fR9+kUkg9/OJlnsnhOSBmZPLHFsKK9BmXLNg2HxeQpiGZAUIE4MVZW8zH5o69BwkDmVBtkT
	0l+URFSM1KCNVf48IqvH92brtAjpM1J1t3drgGQC0wrGORs2Z11pLjQKpbQTkZmb8xLCIKTzQ+fBp
	MoqSA/xvcqiEThcPRsKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3PSd-0000000Bval-3Hqo;
	Fri, 20 Mar 2026 02:19:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3PSc-0000000BvZf-10D1
	for linux-riscv@bombadil.infradead.org;
	Fri, 20 Mar 2026 02:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Uf6nQ6Jy0jLh5fh6sls3tb0a5E6ZZvoqouURQ/6y+O0=; b=AmyxRWjP+d6JRxtXD87XRUO5RP
	L0EKL683xBnVpyVtIYBRY5beEZ0uiX27syr0RDC2wEqGq14T0TTUG30/Sijr3YYHWjmKHJQT8iCbU
	cSSlCmI/VLdgwuVRB2R0kDykAUgU60be+T40ChWkI6ZR767u8hu3tvB2+FssB6NtI1wf/wMRzC4Ee
	yqfwEEC4la/13+1/87ET9JT636qVDNXP4Ct29knAOkpab7rHblKPtSOkH/Y/ukWkSSA4qgCgbwawc
	eZKfzCSg62wDiHfDrNZ8QSb/E1rKor+YGwu0ykx8SDYgAVkdJ5SV7/gKvfDZSOvYMceULnqhEfuVQ
	fk6ZvM0w==;
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3PSL-0000000EnMq-0QQX
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 02:19:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1773973145; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Uf6nQ6Jy0jLh5fh6sls3tb0a5E6ZZvoqouURQ/6y+O0=;
	b=i4RNOIEZYloYzHioHkJsuIASVE6tcUdiUUwgRo0XnsL4XMk1BuUqn4jdza4IGpbuJSrkCtk5Uib8LD7s1PxJNz2FCJ3edBwpdR6GpH3dvrSHG8Sn7BIYS83ZF8GleLDme3cAwxP0bUD3pPBGl03nmVgXGu7qNRfqy/M3YHin9E4=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0X.JxWBq_1773973139;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X.JxWBq_1773973139 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 20 Mar 2026 10:19:03 +0800
From: cp0613@linux.alibaba.com
To: pjw@kernel.org,
	alex@ghiti.fr,
	debug@rivosinc.com,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH 0/2] riscv: vdso_cfi build cleanup improvements
Date: Fri, 20 Mar 2026 10:18:48 +0800
Message-ID: <20260320021850.1877-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_021933_121645_97CE8A1B 
X-CRM114-Status: UNSURE (   7.54  )
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

From: Chen Pei <cp0613@linux.alibaba.com>

This patch series addresses two issues with the RISC-V VDSO CFI build:

1. Build artifacts were not cleaned properly during 'make clean'
2. Copied source files were being tracked by git

The first patch adds the clean-files variable to ensure that temporary
source files copied from the main vdso directory are removed during
make clean.

The second patch adds a .gitignore file to prevent git from tracking
build artifacts and copied source files in the vdso_cfi build directory.

These changes improve the build system hygiene and maintain clean
working directories for developers working with CFI support.

Chen Pei (2):
  riscv: vdso_cfi: Add clean rule for copied sources
  riscv: vdso_cfi: Add .gitignore for build artifacts

 arch/riscv/kernel/vdso_cfi/.gitignore | 8 ++++++++
 arch/riscv/kernel/vdso_cfi/Makefile   | 3 +++
 2 files changed, 11 insertions(+)
 create mode 100644 arch/riscv/kernel/vdso_cfi/.gitignore

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
