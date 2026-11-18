Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C037D606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 09:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hMZHhDTm;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=UBPmCmDl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5moFuaMnGtxjf2XkzEYNTbRO77C0efuUx/8v3cbSfTM=; b=hMZHhDTmmBw3ryYmxGQ1xugTCj
	EtJIZO2gwZ6tNNqi/W9jqFiz4s28vbl8ukOtzo+R9VTrtZBQgc2TMAhgjT8MhjMlpNe56InabD+lY
	1AtMsSrc1srOdWLt7GDF3pl0JaSVaKNEXea1M0RQi/HewTh9FtBg50oiitlaRZwbUgVeVEa9jESMj
	pk9r6cU401CKwyE3/zGJAlG4BaCMMtWNYOJQ7GmuF1lpT2K6PjefRbyPOwGVTcQgOHCtbq2i+jIm3
	7ez7wNot7kuHYPPj2G/JsLVvUtxNMJ5VDf1IxOf7Wc3D3GEwjdHIzjBnF2VkEWJyqLZ6DfP5Uzp4x
	SqrVPtBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbmI-00000008JkX-32xH;
	Wed, 18 Nov 2026 09:16:30 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbm9-00000008Jbs-2NRK;
	Wed, 18 Nov 2026 09:16:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794993373; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=cXMHSSOYVw74OronUDzpBoUxN/GzmRZG6et2woHsVBw=;
	b=UBPmCmDlpRWqX0q+d51An6UjS87dthjR9yR+W0l62BauO4K0RWvQe2tVitk3GcQswS2hBLM2lYkSKf+M2hExQhZlLR/YiU4lS4klW26maIwQZrTAtK0tIpz/IeY/YXa1RZ6uMznOm4kwDtJmlvwVfWn0PZ9pCDWFzKFYGoBEwZM=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R691e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XF0HHbl_1794993372;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XF0HHbl_1794993372 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 18 Nov 2026 17:16:13 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	alex@ghiti.fr,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	graf@amazon.com,
	shuah@kernel.org
Cc: guoren@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	kexec@lists.infradead.org
Subject: [PATCH v4 2/4] riscv: Add support for KHO
Date: Wed, 18 Nov 2026 17:16:01 +0800
Message-ID: <20261118091603.979-3-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118091603.979-1-cp0613@linux.alibaba.com>
References: <20261118091603.979-1-cp0613@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_011621_789160_15D067A5 
X-CRM114-Status: UNSURE (   7.90  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The generic kexec handover (KHO) paths are already in place on RISC-V:
the outgoing kernel publishes the handover FDT and the bootmem list in
/chosen of the DTB built by of_kexec_alloc_and_setup_fdt(), and the
incoming kernel picks both up while scanning that node. Only the
architecture symbol is missing.

Set it to 64BIT && MMU: ARCH_SUPPORTS_KEXEC_FILE is already 64BIT only,
and KEXEC_HANDOVER selects CMA, which depends on MMU.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Acked-by: Paul Walmsley <pjw@kernel.org> # arch/riscv
---
 arch/riscv/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bde1f1885038..bffef6b903e1 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1125,6 +1125,9 @@ config ARCH_SELECTS_KEXEC_FILE
 config ARCH_SUPPORTS_KEXEC_PURGATORY
 	def_bool ARCH_SUPPORTS_KEXEC_FILE
 
+config ARCH_SUPPORTS_KEXEC_HANDOVER
+	def_bool 64BIT && MMU
+
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool y
 
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
