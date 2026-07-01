Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A643C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 10:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7RHEEPf1eZdOTAuSAjZEpIWOauQptLlF2R5IIm58TA0=; b=icK60++YuZ3VnA
	eMR64iSX+TZ3E/qkdvKwYqG8VCFkz81ZWmLvLtWCr/1EIB0LaMcuxyq6lsnipINuQXQmbiesOyizz
	qHFLm5f30zXbMLpa7958DZYaxUYBnd8epm0zTB22jhnM8OXVpAk92Odm/KWwsnKmY3Q/7td5s+Ae+
	T2l9K+d4pEQsLCZZr4gvJNCseFvuiCuGjFKscZB91xXQ7NigkBCvdJJL862hrOZRNHSlJkH2izD3Z
	vGDQvwEsUJ3bhG42m+humJv2t7qXGRR+41xV6N8vi7bqG5RrvkNW+an5oIoBbacSWxUo4sy8KCaHN
	lGw7E0E/5uabYUKspQlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesBh-00000001J6e-28Zg;
	Wed, 01 Jul 2026 10:29:01 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesBe-00000001J5c-27Ks
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 10:29:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=/J
	wselaR8mY1mClm5Tt418iCkr+E5uSdRucyEMGk4z0=; b=QJiQl+RnAr24f8LGOx
	RBmJPTrN8e/GJ/Z1WuzTJBlM2QtOUMr88ghXOLb2oHjWFsUdXR5EOMm6Mi5aDKXH
	cvuFhLdYSCAPwEonJipTU+OjF0G/zkMuJwh4K5v5oAErzxFdKbFjDXkMpX6Azz5i
	H922Fe5Dvcc0mKI/edoBBHGhI=
Received: from Ubuntu.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3V0jH60Rq_FlzGw--.4936S2;
	Wed, 01 Jul 2026 18:28:24 +0800 (CST)
From: Xiaofeng Yuan <xiaofengmian@163.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Mark Brown <broonie@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xiaofengmian@163.com
Subject: [PATCH 0/2] riscv: fix kprobes on minimal kernel configs
Date: Wed,  1 Jul 2026 10:28:20 +0000
Message-ID: <20260701102822.95459-1-xiaofengmian@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: _____wD3V0jH60Rq_FlzGw--.4936S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XryDJFy8ur18KFyxKF13twb_yoW3XFg_Cr
	1SqryfKrWrWFZIgFy8Kws3Gryqk397WrW8Ar1UZF9Fgw17uwnxC3sakF1DA3Z2yryrtFs7
	Zas5urWvkr4SqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRZAwI5UUUUU==
X-Originating-IP: [39.144.122.22]
X-CM-SenderInfo: p0ld0w5hqjzxldq6il2tof0z/xtbDAQjY22pE68jxNwAA3B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_032859_456582_937AE24E 
X-CRM114-Status: UNSURE (   6.72  )
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

When building with an allnoconfig-derived minimal configuration
(without CONFIG_STRICT_MODULE_RWX), kprobes fails because
instruction slot pages from EXECMEM_KPROBES are read-only and
patch_map() bypasses the fixmap writable alias.

These two patches fix the infrastructure.

Xiaofeng Yuan (2):
  riscv: mm: make EXECMEM_KPROBES writable without ARCH_HAS_EXECMEM_ROX
  riscv: patch: skip fixmap mapping when kernel text is already writable

Xiaofeng Yuan (2):
  riscv: mm: make EXECMEM_KPROBES writable without ARCH_HAS_EXECMEM_ROX
  riscv: patch: skip fixmap mapping when kernel text is already writable

 arch/riscv/kernel/patch.c | 3 ++-
 arch/riscv/mm/init.c      | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
