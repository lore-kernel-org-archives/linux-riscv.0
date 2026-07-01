Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61719C43327
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 10:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AexEemmSDURVc0kF5LhKn+W4y4JVq8h+h+PNG+kd+j4=; b=nl4WbrCncOas2p
	f9ELziDLMWVSvg/kL01NRb09RdxGgMJL71iRNmfwehFViJ97EjWpCA2trlU8eWuK5JjFE7oVoL30d
	bVyC8fzaQJAJSHg3jsU84cudakssaMAlvm9NEZ76UjFI3RpqJ4sz5uR3R/14bHnEyQg97fLDTHonS
	9FDxpzUZixi4wy/CqygNdsMibE0/2hnYdzAVnQr6M5NrdVI+TxyF3zcFLa24MmcYwKR/DraG1Y6CM
	cUpEG/q9B3TbUUYJ3Gylp6PYATVfURUZofzE6NVXxHo21S7/Fn+GDBLyESiFD8cL9mn3gxuiMpj0r
	q42Z14qyPM9Zgp2vIQTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesBl-00000001J8Q-2zN9;
	Wed, 01 Jul 2026 10:29:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesBk-00000001J7q-3y3C
	for linux-riscv@bombadil.infradead.org;
	Wed, 01 Jul 2026 10:29:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=X4GFd4uUZOW7we5fSeAFc/8KabX3AK2wJQHTRrZKz/Y=; b=eOnQsEMPu9i5YxP+n8gWYgHE6N
	GJIbsSMVkWh3xc9RxF70gt6+dFGXniGKd/TzJeRUnAieUHEt3jKCn4paLpDqerXMBO3BmBdARQbVD
	8KSIY55vZ8nOq0UJ8sMTQV4HB0XoQqN8G2zVeVzaBHxoBentuA9ATG6BjsFbPZiZmIDWNZWXSUkin
	7lFbHX7qbm/zzmn8y6iQv7NrDiDxe8t5rHw+nfdbRow+rDjSPzTO1jRWf7u7/EOQTSQCKgRzQrYuX
	nGmBXIpetbgxuCMlS2wE4YB0BATmJFeZ1txG0BvLERUsn5DJrOXnkXCEkNEMAeweF47DXz4aSvI5c
	bERJWg/Q==;
Received: from m16.mail.163.com ([220.197.31.3])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wesBh-00000002cdn-0TDk
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 10:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=X4
	GFd4uUZOW7we5fSeAFc/8KabX3AK2wJQHTRrZKz/Y=; b=iScViVvbNYeWoAcHpW
	2hOK5d+1Go8MIqNB8hgDgRgeuqFyAztJMBtMUObarVWxGdAjTBXAay8wUlUINF7Y
	2dGpE/JPzJlbJd3hsFWa0w/+RFROLEIA0OWHiartkTVRixjsD+7x6B4LbP1HtqIN
	A9ZwqkByPx9rzVCdPfa6LG7Hk=
Received: from Ubuntu.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3V0jH60Rq_FlzGw--.4936S4;
	Wed, 01 Jul 2026 18:28:25 +0800 (CST)
From: Xiaofeng Yuan <xiaofengmian@163.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Mark Brown <broonie@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xiaofengmian@163.com
Subject: [PATCH 2/2] riscv: patch: skip fixmap mapping when kernel text is already writable
Date: Wed,  1 Jul 2026 10:28:22 +0000
Message-ID: <20260701102822.95459-3-xiaofengmian@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701102822.95459-1-xiaofengmian@163.com>
References: <20260701102822.95459-1-xiaofengmian@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3V0jH60Rq_FlzGw--.4936S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF17CrW7WryxXw17Gr48WFg_yoW8JFyrpa
	n7Gr1rZFW5JF4Yy39Fkw1DuryjywnYqry3GFsrZFyS9rs8Zry5G34kW342vF10gr1j9w43
	ZFZxtrsI9a4UJ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziebyZUUUUU=
X-Originating-IP: [39.144.122.22]
X-CM-SenderInfo: p0ld0w5hqjzxldq6il2tof0z/xtbDAgrY22pE68r8CAAA3w
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_112901_958169_5A637EFB 
X-CRM114-Status: GOOD (  11.18  )
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

Currently patch_map() always creates a temporary writable mapping via
fixmap for kernel text addresses, even when CONFIG_STRICT_KERNEL_RWX
is disabled and the kernel text is already mapped with _PAGE_WRITE.

This is unnecessary overhead at best, and on minimal configurations
it can cause page faults.

Skip the fixmap path for kernel text when CONFIG_STRICT_KERNEL_RWX
is not enabled, since the text pages are already writable in this case.

Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>
---
 arch/riscv/kernel/patch.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 16b243376..b6e8e1e83 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -44,7 +44,8 @@ static __always_inline void *patch_map(void *addr, const unsigned int fixmap)
 	uintptr_t uintaddr = (uintptr_t) addr;
 	phys_addr_t phys;
 
-	if (core_kernel_text(uintaddr) || is_kernel_exittext(uintaddr)) {
+	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) &&
+	    (core_kernel_text(uintaddr) || is_kernel_exittext(uintaddr))) {
 		phys = __pa_symbol(addr);
 	} else if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX)) {
 		struct page *page = vmalloc_to_page(addr);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
