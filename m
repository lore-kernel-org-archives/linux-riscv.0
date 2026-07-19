Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987DBC4450A
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jul 2026 08:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jdc4NZ4fCrchLbdzXa9P9x3og3lAwXtd8QJFMhOzwBc=; b=BjbKVM5sSRE8+X
	VSw6nqE3k9cf6DkgEJlhDOEi2InO9ti7QIQZ7Iua6aFWEBSc4skLcjwWTDnb5hXfHxLAOKzomhzMl
	RCBTw1izYl2Yo7TbymXa8R5htCOnjnHZZn0/75lb46CNlHHm8M1DOya0pZ/ERYxyzHuFVKXWQUH7a
	dqHQ91PMFwo0DrI/WkrGjR1AtZmwe/qtaYTN1+97okAOhY+068Ex7RWfm9cLVrqWJ0R8C/ShBaawM
	QF0WLpJp5YKijeUs4YW37bgYsA/61NAF4qUwyZGnQj4RYuAXVHbHKRPlvARghbueDjG8fE0r1ZGIL
	uhcGooX3mzaMlXYfIUag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlMcg-00000004piG-1dLP;
	Sun, 19 Jul 2026 08:11:42 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlMcd-00000004pfI-3f8B
	for linux-riscv@lists.infradead.org;
	Sun, 19 Jul 2026 08:11:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=jZ
	Moaj6iXtsIsiavVwALtLTmgKmKM6rTa+1phtopYkY=; b=TWRouIRHkCiMvzj1Nl
	V8pIshbWBv41R1PKB1+gep8WhUOhWc0+WKiesKjQHIhWlMxZCS6RrM+WvQn4y9d+
	iue4S6I6rcutWMd5SZ8qyCB+xB9Z4Eig7jMK0jKqewf3wvE8w/dg2sataAwhJ+Ne
	ox7W5Co1+F+mue16VlDfDtCSk=
Received: from Ubuntu.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wC3z6F9hlxq+TAUKA--.58193S2;
	Sun, 19 Jul 2026 16:10:38 +0800 (CST)
From: Xiaofeng Yuan <xiaofengmian@163.com>
To: pjw@kernel.org
Cc: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	namcao@linutronix.de,
	alex@ghiti.fr,
	broonie@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] riscv: fix kprobes on minimal kernel configs
Date: Sun, 19 Jul 2026 08:10:34 +0000
Message-ID: <20260719081037.5749-1-xiaofengmian@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: _____wC3z6F9hlxq+TAUKA--.58193S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XryDJFy8ur18KFyxKF13twb_yoWxuwc_Ww
	1Sqryagw48Wa9IgF1I9ws5Xryqkay7Way8Ar4jvF9Fgw1a93sxA3sYgF98Aa1qyrWFkrs3
	Za95ZFZ3Ar4IqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8y5l5UUUUU==
X-Originating-IP: [39.187.244.72]
X-CM-SenderInfo: p0ld0w5hqjzxldq6il2tof0z/xtbDAR5ydWpchn5CfgAA3q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_011140_292954_4091D296 
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

When building with an allnoconfig-derived minimal configuration
(without CONFIG_STRICT_MODULE_RWX), kprobes fails because
instruction slot pages from EXECMEM_KPROBES are read-only and
patch_map() bypasses the fixmap writable alias.

These two patches fix the infrastructure.

v2:
  - use CONFIG_STRICT_MODULE_RWX instead of CONFIG_ARCH_HAS_EXECMEM_ROX
    in PATCH 1/2 (per Nam Cao's review)

Xiaofeng Yuan (2):
  riscv: mm: make EXECMEM_KPROBES writable without
    CONFIG_STRICT_MODULE_RWX
  riscv: patch: skip fixmap mapping when kernel text is already
    writable

 arch/riscv/kernel/patch.c | 3 ++-
 arch/riscv/mm/init.c      | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
