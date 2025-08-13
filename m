Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C708C87FCF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 08:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WpwnJsiQgpvhnfRp2wjeX+uzNmKrMN2dDXr8me4LnHk=; b=NMBwTAB9bWDnni
	La7fqd+/XupxLDNorXiCtMR503N4C94g8J1o/b/iRatZVWV6BiYFXoWIffbfBNiqoJeaFXl0pBNbd
	EvMZCG19LBzZwtPJ75AcSBr5imX+sTjjqdqrUTm9RAUxPsn6APMeBL0FmaNbgDrN8oZeoeBSy8HFA
	uAIIgh8YPWpLeXV7N8hKQEUBEruk8TPqMj82abTyUJ7c6Lr5riqCpRievC7ctg+UKthvW3yclDbPW
	QAx9QCdxoJ6gU8CMdYRKmGObfYNocoJt8IImjYUn/+qZoxQcwUL0r0r2+bO6pvj0KnMS2ycwcn32d
	87/Bno2Wq1SBugEwBr0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6hE-0000000D4ZC-0uaP;
	Wed, 13 Aug 2025 08:18:56 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6g0-0000000D45w-1SrM
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 08:17:41 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755073053; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mEL0yh+bEfgqikWWXY9mC8WYz2uRK84v9xsmZs/PXsJdzW3S7UDHRkWOkfiWltPNjsgCuAi6xX/+wRUBdZchyvTmAaEwm5wXPgZjDdHk5PyJik5TITWgEJe+VEwQpYST7qDH2PVloHJWqTWFuwwi55pa3H64If6fryCOoQzciqI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755073053; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1WswQYdXHZ0BCocJhmpFSpiydZ4q8u4ZkyEkExktUjQ=; 
	b=b5J4lCmOa1pJxnEi3AhfBBrigszbXDS64PRitU+yfQ+zVPiGR53rbzEo3mtwBi1q+IMw/zJw9PckxY9aRK676t73OBFHiDIl2k2R5HJanFPchesr9rpvmgk6SxHPzC1apw7DHNfM2N5cFpecX0Pasj7jc65trUZkelilM2mey3g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755073053;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=1WswQYdXHZ0BCocJhmpFSpiydZ4q8u4ZkyEkExktUjQ=;
	b=iML7KfC+47Z7J9ajIZhKyEAZfozxfPT8wvbXyrkSFdSt1IKwIk0o80Nb+YPUd9ib
	KhA5EkqX6mw3wFAWtP9mpV/OYvwmhI26irpwCfL6GRe/1IaQtDn45KIVQcVuDCS3vMt
	JNmJvYqApJooZvEy/nf2MDa5nJG77XfGOef1R5wOwpcvrjx4Obouj3jr+xhymEs7Dxl
	P3tAwyJmvs9ihFx7inM8O/ECQYcH0s737hI6venN5NHEhT+bWoPsPiN4Xzr0me0WLSF
	3sjHDofIXQ9c5ShF5hx7A1z2Rs3af5wZzENb4K4gZJ+Qh0WHkfsr6k1uRa6/oDW/5ig
	0StLx1nIeg==
Received: by mx.zohomail.com with SMTPS id 175507305115343.15769947711442;
	Wed, 13 Aug 2025 01:17:31 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>,
	Yao Zi <ziyao@disroot.org>,
	Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 0/2] reset: th1520: add VOSYS resets for DPU/HDMI/DSI
Date: Wed, 13 Aug 2025 16:17:14 +0800
Message-ID: <20250813081716.2181843-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_011740_457479_EC639D44 
X-CRM114-Status: UNSURE (   5.92  )
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

The VOSYS subsystem of T-Head TH1520 SoC contains a set of display
pipeline in addition to the GPU. The display pipeline contains a DPU
(display controller), a HDMI controller and 2 DSI controllers.

This patchset adds reset controls for these devices.

Icenowy Zheng (2):
  dt-bindings: reset: thead,th1520-reset: add more VOSYS resets
  reset: th1520: add resets for display pipeline

 drivers/reset/reset-th1520.c                  | 40 ++++++++++++++++++-
 .../dt-bindings/reset/thead,th1520-reset.h    |  7 ++++
 2 files changed, 46 insertions(+), 1 deletion(-)

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
