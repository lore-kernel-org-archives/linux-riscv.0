Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7B0C3271E
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 14:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JWO3dMDaQN3I45cs6KH4W2UYtymxt3vGjwh8XLaEylg=; b=FBw+9ZiwIldWI5
	1sokWdlucnofVddPD+ehq5oJSg/HuaYBc7Fdoz8KqLFx+lW8GH70lhuLhROgCRMVXeZm884KbGpBI
	ZQS3waGhVYRRNzR7uADQc+DX24yGVG2z/MsOTybkqZbTY9qFCT4PvP4eDb/hos0L+cFaFSIxIFba5
	hki2AFN9lrJCJY0kVwDpcoV7Y4Zg5XBY/vcTt2pm+Q3pZ+Iy1ldXc8/las4fKfC7ARvee4eNXmsRZ
	MyaJEPtY/j6JXfQ+n7AB2O5uKjFuveaKoathpIoMewmCpgQlzPnytsii+GwCTZ4dLN40SOECdFB30
	zUjHHsiQEOWWAaNan6RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNah-0000000DUqp-1caY;
	Thu, 04 Jul 2024 14:37:43 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNa5-0000000DURP-1wKQ;
	Thu, 04 Jul 2024 14:37:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 78C2DCE2B1B;
	Thu,  4 Jul 2024 14:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0372C4AF0F;
	Thu,  4 Jul 2024 14:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720103822;
	bh=6AvNCHIDCl2FJ0+iZjNz9fWIUodQR9KLWj8XWc9apE4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ScYDl+DMyUOLog8Ap5Cuip0pO3+A9qNjjqcju/yJgYyW05wqLt6SFyhe1dFfGExZC
	 0eEDTWOM2aqnzawCBctPnVBiwQ1VYyUAg4LITJjlPb784KeCW78yatBBlurmRHoo6h
	 0aWznGQ9KH5R84ZvK/TgZ+XzQQjfafyQh8oIzpNi4rBdoBBrJSQpqGFupi9rZsJti2
	 FLZK26mH4iNeWrrvAS+JLvL4/kJAWp53NnMlorLx/wpFcxCvMpNJLDx5uV0zMnlFce
	 dgg3bDMfhj2bnlsN1INV5j8CEn9L2U9wAHhdpBswa4oAeMMD0Xlf39a6XyOFL70xWm
	 RocQ5bfPRMiRw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@quicinc.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Christian Brauner <brauner@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-openrisc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 03/17] um: don't generate asm/bpf_perf_event.h
Date: Thu,  4 Jul 2024 16:35:57 +0200
Message-Id: <20240704143611.2979589-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240704143611.2979589-1-arnd@kernel.org>
References: <20240704143611.2979589-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_073705_783589_FFC5ADC1 
X-CRM114-Status: GOOD (  16.02  )
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

From: Arnd Bergmann <arnd@arndb.de>

If we start validating the existence of the asm-generic side of
generated headers, this one causes a warning:

make[3]: *** No rule to make target 'arch/um/include/generated/asm/bpf_perf_event.h', needed by 'all'.  Stop.

The problem is that the asm-generic header only exists for the uapi
variant, but arch/um has no uapi headers and instead uses the x86
userspace API.

Add a custom file with an explicit redirect to avoid this.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/um/include/asm/Kbuild           | 1 -
 arch/um/include/asm/bpf_perf_event.h | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 arch/um/include/asm/bpf_perf_event.h

diff --git a/arch/um/include/asm/Kbuild b/arch/um/include/asm/Kbuild
index 6fe34779291a..6c583040537c 100644
--- a/arch/um/include/asm/Kbuild
+++ b/arch/um/include/asm/Kbuild
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-generic-y += bpf_perf_event.h
 generic-y += bug.h
 generic-y += compat.h
 generic-y += current.h
diff --git a/arch/um/include/asm/bpf_perf_event.h b/arch/um/include/asm/bpf_perf_event.h
new file mode 100644
index 000000000000..0a30420c83de
--- /dev/null
+++ b/arch/um/include/asm/bpf_perf_event.h
@@ -0,0 +1,3 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <asm-generic/bpf_perf_event.h>
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
