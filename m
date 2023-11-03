Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6E3C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 16:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bUpGpVQdetPDK1MFs3JyvQuX0LI3MqU7DHV3R2g0kBQ=; b=KAteJe9TV6Vlgl
	E6gM4M1fUVWXv3rmIBi1Beyhh96+rDeT4F9QXGvkHBinz4Q+BZ5gxv2Yf++/czNC7NAXmeXytdlq+
	0hYBw2z0KbS0nwe1GWc0QNrR62cDd8CxXTGpxkcISawhBPwqmYEVlcRu5F3iGiTC4SbJKbJMEdSeq
	SFN71BUirfqueTFQqhshYqTJVYLBxQm5XgfD1I8tD8qk0efLUBQ0FJzQr8fADIsqZoLaZEyLFJn6g
	DshVAZxldXWxHTnY6QIbQjAhXC5aEmmkkJ46hQ9Dxkg+msI2VA7aanlitgaWmnB09reLfuM00Q6BK
	xFDHt0xIzpplgI05Ds+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qywby-00BjzR-2r;
	Fri, 03 Nov 2023 16:01:30 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qywbw-00Bjy4-04
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 16:01:29 +0000
X-QQ-mid: bizesmtp78t1699027266ta08iml2
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 04 Nov 2023 00:01:03 +0800 (CST)
X-QQ-SSF: 01200000000000000000000A0000000
X-QQ-FEAT: QityeSR92A28ZPRtiE81G2IrXHWg2q27WIobMU1SAAzpzkyyfEB73YsFcjdDe
	bVIiFyAUAwy8zzKzjrseeMWj0rb6pexvSi+JMipbHYhQxpuclzEMg7X6cSFvfm0zUbuvUkH
	h53yUWwjypGaV/yCfz9llOfRSJAl345Te7BpmmwciccZriF1iTUIX3Acz0VVcqgLQLxij90
	vmo9hUQ4XmPwLxfIwOPQoqiZRoQRMntdfHYmU86oxGlguDcOLX+hQcU1iiGjDNaJ56wmm5f
	d1CU19gnS85haVh9DhVlHm0SEjXqii66p+6zMkbYe99A6q5hm0RXrwcR0y5/I8ghUS3d/Qn
	7FA36k1Kp5SCYysOg6IbHNlCGA9XQ9hupgoQtSoicunaxLd4PZDp6bU1S/y2A==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17055644200842692498
From: Yuan Tan <tanyuan@tinylab.org>
To: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	luc.vanoostenryck@gmail.com,
	linux-sparse@vger.kernel.org
Cc: linux@weissschuh.net,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	paulburton@kernel.org,
	paulmck@kernel.org,
	tim.bird@sony.com,
	tsbogend@alpha.franken.de,
	w@1wt.eu,
	tanyuan@tinylab.org,
	i@maskray.me
Subject: [PATCH v1 08/14] DCE/DSE: add choice of methods to build reference for orphan sections
Date: Sat,  4 Nov 2023 00:01:01 +0800
Message-Id: <c1c9913c0974b96faaab664ef354cf8775cd7554.1699025537.git.tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699025537.git.tanyuan@tinylab.org>
References: <cover.1699025537.git.tanyuan@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_090128_369510_52D510FF 
X-CRM114-Status: UNSURE (   9.31  )
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

Due to .pushsection producing orphan sections, the kernel currently uses
`KEEP()` in the linker script to address this issue.

Here we purpose two methods to build reference for pushed section,
SHF_LINK_ORDER method and SECTION_SHF_GROUP method.

The binary files compiled using both methods turn out to be identical,
and it doesn't produce any side effects.

Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 init/Kconfig | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index 9834dbb0ddae..9599d2de44e8 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1740,6 +1740,56 @@ config USED_SYSCALLS
 
 	  If unsure, please disable TRIM_UNUSED_SYSCALLS.
 
+choice
+	prompt "Trim methods" if EXPERT
+	default RESTRICTED_TRIM_UNUSED_SYSCALLS
+	depends on TRIM_UNUSED_SYSCALLS
+	help
+	  This option selects the method to trim unused syscall wrongly kept.
+
+	  The binary files compiled using both methods are identical.
+
+	  If the trim methods is not specified, some syscalls are kept by
+	  linker script and can not be trimmed.
+
+config RESTRICTED_TRIM_UNUSED_SYSCALLS
+	bool "Leave some kept syscalls (EXPERIMENTAL)" if EXPERT
+	help
+	  Say Y here to trim 'unused' syscalls wrongly kept by __ex_table
+	  like sections in kernel space.
+
+	  Some syscalls are kept by linker script and can not be trimmed.
+
+	  If unsure, choose this.
+
+config SECTION_SHF_LINK_ORDER_SUPPORT
+	bool "Using SHF_LINK_ORDER attribute (EXPERIMENTAL)" if EXPERT
+	depends on HAVE_SECTION_SHF_LINK_ORDER_SUPPORT
+	help
+	  Say Y here to trim more 'unused' syscalls wrongly kept by __ex_table
+	  like sections in kernel space.
+
+	  This option uses the SHF_LINK_ORDER attribute to build references for
+	  orphan sections. Therefore, these sections are no longer kept in the
+	  linker script.
+
+	  If unsure, not choose this.
+
+config SECTION_SHF_GROUP_SUPPORT
+	bool "Using SHF_GROUP attribute (EXPERIMENTAL)" if EXPERT
+	depends on HAVE_SECTION_SHF_GROUP_SUPPORT
+	help
+	  Say Y here to trim more 'unused' syscalls wrongly kept by __ex_table
+	  like sections in kernel space.
+
+	  This option uses the SHF_GROUP attribute to build references for
+	  orphan sections. Therefore, these sections are no longer kept in the
+	  linker script.
+
+	  If unsure, not choose this.
+
+endchoice
+
 config KALLSYMS
 	bool "Load all symbols for debugging/ksymoops" if EXPERT
 	default y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
