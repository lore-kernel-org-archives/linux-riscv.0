Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9D9CCD18E
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 06:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VzrVt8ZJrgrW3D+FU7UkwpM3YABRIb51kaxpwuWVJfc=; b=e0bs7hHWzpJI61
	oNJ2t3dQKIoeo+wBBScB/ZdfiM29Bb0JrM/Pfk5OevDIS/U8hz+tOyiVzsas1jV46NH4rxz78N7a9
	ZoKcIHwkZr+mcL1PJWBzkUUgBLy8EtN8V29ED/+jpXg1I1hM2lIZLdaHcoe38n9u4s2DG33Ywjcyv
	gVNwYYuNZBSslR+dpFGiDPktevqjquK74t7WFtMD6iq/hIRkjVu92Md2hbEUhmFSd9NBkfA2VkVuw
	/XG3Sz1SF4LM4lncIzuyhT70M+tq8S9+W9iDvm/dtutpcJ3FEtY1zMembV6LsB/pQ3U6sZGKoYVv0
	E7o0JeqO7UUJOO4r+QVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8urA-00000000ZWG-0u5M;
	Wed, 15 Oct 2025 06:19:28 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ur7-00000000ZKA-1Roh
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 06:19:26 +0000
X-QQ-mid: zesmtpsz3t1760509123t05cff719
X-QQ-Originating-IP: nNfNQXy1/5EgLTlbfFU/BpAhqpvUPauMUCH0BNThics=
Received: from GPU-Server-A6000.. ( [202.201.1.132])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 15 Oct 2025 14:18:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17077304549723306376
EX-QQ-RecipientCnt: 14
From: Yuan Tan <tanyuan@tinylab.org>
To: arnd@arndb.de,
	masahiroy@kernel.org,
	nathan@kernel.org,
	palmer@dabbelt.com,
	linux-kbuild@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@maskray.me,
	tanyuan@tinylab.org,
	falcon@tinylab.org,
	ronbogo@outlook.com,
	z1652074432@gmail.com,
	lx24@stu.ynu.edu.cn
Subject: [PATCH v2 4/8] riscv: enable HAVE_TRIM_UNUSED_SYSCALLS when toolchain supports DCE
Date: Wed, 15 Oct 2025 14:18:31 +0800
Message-ID: <DFBC1E41A1103B87+997a9aedbe0a9a779d0a463bcbfd13eb677d5f0a.1760463245.git.tanyuan@tinylab.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760463245.git.tanyuan@tinylab.org>
References: <cover.1760463245.git.tanyuan@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: Mpv6PNPPUmDu01OaIjV3/c9lP/+9l92EgFL6Up0MEq9OBV1ly0d0GAZH
	nMBUt4qG6xMxRFmM0labnaCvSycP58RZy71c1VR+/Neqs2+z6gtDCKo4ElOvtZFriDOUOiU
	pWCTMo3t6a/bdbCCOayMAqcWFK3G17PRM0WgvjpgXcMQw2t6xsn8foLu1Zr3lAr3eqXGACx
	3+DnSDxjJvzkUW4epJJQvjjXaW3BLN6ICtTb0f+W05/qN4wPsWs6UObMPvyTgDUBgVKuS/h
	9xzpk63Xnb6mR9UnpEwFXyqrzwybdECyAxC3ftAXIcF84kdFm80kgKDXVepDNWaWxxEALP1
	flaI7ouj1yZ5cbeYc6xysCRZWtEu7tU1+rUXa7cN7HsAyAXN+zQYOqJuuVeYpm7X7KY36/n
	5FckXbcHJGAx9wZalHQqecJ05JzY/1bJ0sj1FQNy4bH9m+0ejTGoUcVaztIft/TltR0xYha
	24c97saY0zCwDjkPylGdHFn92swxaCcTeNSiTc7gQQTxk0b0P2Y9rC6X+n1oW26lWejroqf
	ItMJcyMGaJkPJxLaaAlNKLeugvcNiRQaIkGawGFD4u9EmHQZzQ8hS1qdlF6CKCBxeZ/oQMr
	/Wx9fqLKyuoxP9rAY7IbbL2Bvuhe7POTkyXDm7YTAymFahHiDsJNokghcvCIp2eUxlgkD25
	RWI6V0pYw9iUjihkvGMZT7e3XTwZOPAUveuXHNwuBIjwQzaUHnxGjmRxHSmk2bNv1XEREsy
	gok1SDmW3LTBeHOZB8AURCYvJgijz5cM5e/kU+A37nuHLROrS679XRcxqzHvf8syGBipHsl
	GEAgzLFEh5+TX9oaub1gTZ+1NCnXM3xAXGPK8PQGvhOzjBXOrp7HD5W7gixHMfQ1mqnEDVX
	buvtHwEJAWDgqvhn/P3zFk67YlnmgO/xTJpePEsIK+dCpnR3IODlo9hMAU5Je6sonJ2eij2
	CGOLMid/TdK5Rzg/BLhBG32sP6j5x912TfLZxTUwJI1LFAA==
X-QQ-XMRINFO: OJlEh3abS6gXi5NWrXbD0WI=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_231925_875720_390EE8D2 
X-CRM114-Status: UNSURE (   7.22  )
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

From: Yuhang Zheng <z1652074432@gmail.com>

Enable HAVE_TRIM_UNUSED_SYSCALLS on RISC-V when the toolchain supports dead
code and data elimination.

This allows the unused syscalls and related code to be trimmed at link time
based on the list of actually used syscalls.

While this enables per-syscall elimination, some syscall entries still
cannot be fully discarded due to sections that are force-kept by the
linker, such as ex_table, bug_table, jump_table, and .alternative.

Signed-off-by: Yuhang Zheng <z1652074432@gmail.com>
Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0c6038dc5dfd..697050ac8c62 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -198,6 +198,7 @@ config RISCV
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
+	select HAVE_TRIM_UNUSED_SYSCALLS
 	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
