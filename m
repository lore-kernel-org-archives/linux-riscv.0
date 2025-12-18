Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0CAD6E2CA
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 19:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RzOTPMXXTokt2mAAG6+OWkjvxs0j13lcCTkqQilfSuA=; b=Iuq6sYUL2UGpJ5
	ygg/XP7jMJ0XCyWMUStQWCCBH9HQ0lV3SNf545b3t2aBoG5dq+4eQ9AIir/Bb8OzyAvdASJwAckoj
	ws0XIZpZxKUvswUcZuySEk/wDFEWnk/4VueCxVxDKDry/oWOWgtIPPB764muC8rcaPnr09EaTFElp
	M4S+Y2bU3rgOoE/Lw1OmqVBuGvRWCYlTIQpaCgl6N5vP9Vu4S6KIvOUGU28CC5M6sslaGTXG9CuLz
	8BrcQSGNOqC7sRRPxYalzKeQuWCKwW9LEtEV4PFM5u37pUjd+ts9f79992D8dJoyCAO6/vjT0RTLr
	jK26RK9n6QxuHa8uo0Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJRj-000000094FW-3XYs;
	Thu, 18 Dec 2025 19:13:55 +0000
Received: from mailer.gwdg.de ([134.76.10.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJRg-000000094Dy-2Uxq
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 19:13:54 +0000
Received: from mbx19-sub-05.um.gwdg.de ([10.108.142.70] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vWJRS-000RlA-2g;
	Thu, 18 Dec 2025 20:13:38 +0100
Received: from localhost.localdomain (10.250.9.200) by MBX19-SUB-05.um.gwdg.de
 (10.108.142.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.35; Thu, 18 Dec
 2025 20:13:38 +0100
From: Lukas Gerlach <lukas.gerlach@cispa.de>
To: <linux-riscv@lists.infradead.org>
CC: <palmer@dabbelt.com>, <pjw@kernel.org>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <linux-kernel@vger.kernel.org>, <daniel.weber@cispa.de>,
	<michael.schwarz@cispa.de>, <marton.bognar@kuleuven.be>,
	<jo.vanbulck@kuleuven.be>, Lukas Gerlach <lukas.gerlach@cispa.de>
Subject: [PATCH 0/2] riscv: Add Spectre v1 mitigations
Date: Thu, 18 Dec 2025 20:13:30 +0100
Message-ID: <20251218191332.35849-1-lukas.gerlach@cispa.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: MBX19-FMZ-05.um.gwdg.de (10.108.142.64) To
 MBX19-SUB-05.um.gwdg.de (10.108.142.70)
X-Virus-Scanned: (clean) by clamav
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_111352_632315_14E8441E 
X-CRM114-Status: UNSURE (   7.14  )
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

This series adds Spectre v1 to RISC-V in line with x86 and arm64.

Modern RISC-V CPUs with deep pipelines (e.g., XuanTie C910, SiFive P550)
are susceptible to Spectre v1 attacks where an attacker can speculatively
bypass bounds checks and leak kernel memory via cache side channels.

The first patch adds pointer masking to uaccess routines. Similar to
arm64's uaccess_mask_ptr(), this clears the top bit of user pointers
before access, ensuring that even under speculation, a user-controlled
pointer cannot reach kernel memory.

The second patch sanitizes the syscall number using array_index_nospec()
before indexing into the syscall table, preventing out-of-bounds
speculative reads similar to what x86 does.

Lukas Gerlach (2):
  riscv: Use pointer masking to limit uaccess speculation
  riscv: Sanitize syscall table indexing under speculation

 arch/riscv/include/asm/uaccess.h | 41 +++++++++++++++++++++++++-------
 arch/riscv/kernel/traps.c        |  4 +++-
 2 files changed, 35 insertions(+), 10 deletions(-)

--
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
